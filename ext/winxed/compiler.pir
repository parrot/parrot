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
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'Expr' ]
# builtin __ASSERT__
.annotate 'line', 2144
# var e: $P1
    getattribute $P1, self, 'e'
.annotate 'line', 2145
# valuereg: $S1
    null $S1
.annotate 'line', 2146
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2147
# var pnull: $P2
    getattribute $P2, self, 'pnull'
.annotate 'line', 2148
    unless_null $P2, __label_3
# {
.annotate 'line', 2149
# regnull: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2150
    $P1.'emitnull'($S2)
.annotate 'line', 2151
    box $P2, $S2
    setattribute self, 'pnull', $P2
# }
  __label_3: # endif
.annotate 'line', 2153
    set $S1, $P2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 2156
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2157
    .return($S1)
# }
.annotate 'line', 2158

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
.annotate 'line', 2173
    $P2 = WSubId_41(__ARG_1, __ARG_2, WSubId_42, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 2174

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2178
    getattribute $P1, self, 'args'
# builtin elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 2179

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 2182
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2183
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 2184

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2188
    getattribute $P1, self, 'args'
    WSubId_43($P1)
# }
.annotate 'line', 2189

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2192
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2193
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2194
    $P5 = $P2.'emit_get'(__ARG_1)
# builtin push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2195
    .return($P1)
# }
.annotate 'line', 2196

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2199
    $P1 = self.'getargvalues'(__ARG_1)
# builtin join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 2200

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2169
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 2212
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2215
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2216
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2217
    .return($I1)
# }
.annotate 'line', 2218

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2221
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2222
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2223
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2224
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 2225

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2228
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2229
    if_null __ARG_2, __label_1
.annotate 'line', 2230
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 2231

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2234
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2235
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2236
    .return(self)
# }
.annotate 'line', 2237

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2209
    addattribute $P0, 'name'
.annotate 'line', 2210
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2242
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2243
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2244
    $P1 = __ARG_1.'get'()
.annotate 'line', 2245
# var args: $P2
    null $P2
.annotate 'line', 2246
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2247
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2249
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2250
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2251

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 2260
    $P2 = WSubId_41(__ARG_1, __ARG_2, WSubId_44, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2261

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2264
    getattribute $P1, self, 'list'
    WSubId_43($P1)
# }
.annotate 'line', 2265

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2266
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2269
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2270
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2271
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2273
    .return($P2)
# }
.annotate 'line', 2274

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2256
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_22')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2283
# r: $S1
    null $S1
.annotate 'line', 2284
# builtin elements
    elements $I1, __ARG_1
    unless $I1 goto __label_1
.annotate 'line', 2285
# builtin string
# builtin join
    join $S2, "'; '", __ARG_1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 2286
    .return($S1)
# }
.annotate 'line', 2287

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2291
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2293
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2295
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2297
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2294
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2296
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2298
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2300
    __ARG_2.'unget'($P1)
.annotate 'line', 2301
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2303

.end # parseUsing


.sub 'parseSig' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2307
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2308
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2309
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2310
    WSubId_45("'='", $P2)
  __label_1: # endif
.annotate 'line', 2311
# var expr: $P3
    $P3 = WSubId_42(__ARG_2, __ARG_3)
.annotate 'line', 2312
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2313

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
.annotate 'line', 2317
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2318
# var t2: $P2
    null $P2
.annotate 'line', 2319
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2320
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2321
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2322
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2323
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2324
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2325
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 2326
# var open: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2327
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2328
    WSubId_46("':'", $P1)
  __label_5: # endif
.annotate 'line', 2329
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2332
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
.annotate 'line', 2334
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2336
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2339
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2342
    $P2 = __ARG_1.'get'()
.annotate 'line', 2343
    __ARG_1.'unget'($P2)
.annotate 'line', 2344
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2345
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2348
    $P2 = __ARG_1.'get'()
.annotate 'line', 2349
    __ARG_1.'unget'($P2)
.annotate 'line', 2350
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2351
    .tailcall WSubId_52($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2354
    $P2 = __ARG_1.'get'()
.annotate 'line', 2355
    __ARG_1.'unget'($P2)
.annotate 'line', 2356
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2357
    .tailcall WSubId_53($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2360
    $P2 = __ARG_1.'get'()
.annotate 'line', 2361
    __ARG_1.'unget'($P2)
.annotate 'line', 2362
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2363
    .tailcall WSubId_54($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2366
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2368
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2370
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2372
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2374
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2376
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2378
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2380
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2382
    .tailcall WSubId_55($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2384
    .tailcall WSubId_56($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2386
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2388
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2391
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
# {
.annotate 'line', 2392
# var t2: $P4
    $P4 = __ARG_1.'get'()
.annotate 'line', 2393
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2394
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2395
    __ARG_1.'unget'($P4)
# }
  __label_31: # endif
.annotate 'line', 2397
    __ARG_1.'unget'($P1)
.annotate 'line', 2398
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 2399

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2409
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2410

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2411
    .return(0)
# }

.end # isempty


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 2414
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
# }
.annotate 'line', 2415

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2418
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2419

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2422
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2423

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2426
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2427

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2430
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2431

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2434
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2435

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2438
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2439

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2442
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2443

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2446
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2447

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2450
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2451

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2454
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2455

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2458
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2459

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2462
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2463

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2466
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2467

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2474
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2475

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2478
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2479

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2482
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2483

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2486
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2488
    .return(self)
# }
.annotate 'line', 2489

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2405
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2494
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2497
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2498

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2499
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2492
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2512
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2513
# n: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 2514
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2515
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2516
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2517
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2518
    null $I2
  __label_4: # endif
.annotate 'line', 2519
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2515
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2521
    unless $I2 goto __label_7
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
# }
.annotate 'line', 2522

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2508
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2529
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2530
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2531

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2532
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2535
    getattribute $P1, self, 'statements'
# builtin push
    push $P1, __ARG_1
.annotate 'line', 2536
    .return(self)
# }
.annotate 'line', 2537

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2540
    getattribute $P1, self, 'statements'
    WSubId_57(__ARG_1, $P1)
# }
.annotate 'line', 2541

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2525
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
.annotate 'line', 2547
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2549
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2548
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2550
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2552
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 2554

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2562
# var arg: $P1
    null $P1
.annotate 'line', 2563
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2564
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2565
    $P2 = __ARG_1.'get'()
.annotate 'line', 2566
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2567
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2570
    __ARG_1.'unget'($P2)
.annotate 'line', 2571
    $P1 = WSubId_42(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2573
    .return($P1)
# }
.annotate 'line', 2574

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
.annotate 'line', 2583
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2584
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2585
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2586
    unless $I1 goto __label_1
.annotate 'line', 2587
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2588
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2589
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2590
    $P1 = __ARG_2.'get'()
.annotate 'line', 2591
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2592
    __ARG_2.'unget'($P1)
.annotate 'line', 2593
    $P3 = WSubId_41(__ARG_2, __ARG_3, WSubId_58, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2595
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 2596

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2599
    getattribute $P1, self, 'args'
    WSubId_43($P1)
.annotate 'line', 2600
    .return(self)
# }
.annotate 'line', 2601

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2604
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2605
    self.'annotate'(__ARG_1)
.annotate 'line', 2606
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2607
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2608
    __ARG_1.'print'('    ')
.annotate 'line', 2609
    unless_null $P1, __label_2
.annotate 'line', 2610
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2612
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2613
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2614
    $P4 = $P3.'emit_get'(__ARG_1)
# builtin push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2615
# builtin join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2617

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2576
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2578
    addattribute $P0, 'opname'
.annotate 'line', 2579
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
.annotate 'line', 2629
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2630
# var path: $P1
    $P1 = WSubId_60(__ARG_2)
.annotate 'line', 2631
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2632
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2633
    WSubId_59(';', __ARG_2)
.annotate 'line', 2634
    $P3 = WSubId_61($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2635
    .return(self)
# }
.annotate 'line', 2636

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2637
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2640
    self.'annotate'(__ARG_1)
.annotate 'line', 2641
    getattribute $P1, self, 'path'
# builtin join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2642

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2624
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2626
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
.annotate 'line', 2654
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2655
# var names: $P1
    null $P3
    $P1 = WSubId_41(__ARG_2, $P3, WSubId_62, ';')
.annotate 'line', 2656
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2657
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2658
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2660
    setattribute self, 'names', $P1
# }
.annotate 'line', 2661

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2664
    .return(self)
# }
.annotate 'line', 2665

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2668
    self.'annotate'(__ARG_1)
.annotate 'line', 2669
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2670
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2671
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2673

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2649
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2651
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
.annotate 'line', 2687
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2688
# var path: $P1
    $P1 = WSubId_60(__ARG_2)
.annotate 'line', 2689
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2690
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2691
    WSubId_59(';', __ARG_2)
.annotate 'line', 2692
    setattribute self, 'path', $P1
# }
.annotate 'line', 2693

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2696
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2697
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2699
# var symbol: $P3
    $P3 = self.'scopesearch'($P1, 0)
# switch-case
.annotate 'line', 2701
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2715
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2702
# builtin elements
    elements $I2, $P1
    unless $I2 goto __label_5
# {
.annotate 'line', 2703
# var p: $P4
# builtin clone
    clone $P4, $P1
.annotate 'line', 2704
    $P4.'pop'()
.annotate 'line', 2705
# var ns: $P5
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2706
    if_null $P5, __label_6
# {
.annotate 'line', 2707
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2708
    if_null $P3, __label_7
# {
.annotate 'line', 2709
    self.'createvarused'($P2, $P3)
.annotate 'line', 2710
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
.annotate 'line', 2716
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2717
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2718
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2719
    self.'usesubid'($S1)
.annotate 'line', 2720
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2722
    self.'createvar'($P2, 'P')
.annotate 'line', 2723
    .return(self)
# }
.annotate 'line', 2724

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 2727
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2728
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2729
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2730
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2731
    self.'annotate'(__ARG_1)
.annotate 'line', 2732
# key: $S2
    null $S2
.annotate 'line', 2733
# builtin elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2734
    $P1.'pop'()
.annotate 'line', 2735
    $P3 = WSubId_22($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2737
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2739

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2680
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2682
    addattribute $P0, 'path'
.annotate 'line', 2683
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
.annotate 'line', 2749
# var nskey: $P1
    $P1 = WSubId_60(__ARG_2)
.annotate 'line', 2750
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2751
    WSubId_45('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2752
# var nssym: $P2
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2753
    unless_null $P2, __label_2
.annotate 'line', 2754
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2755
    __ARG_3.'usenamespace'($P2)
# }
.annotate 'line', 2756

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
.annotate 'line', 2762
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2763
    WSubId_63(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2764
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 2765

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2768
    .return(self)
# }
.annotate 'line', 2769

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2758
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
.annotate 'line', 2784
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2785
    $P2 = WSubId_42(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2786
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 2787

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2790
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2791
    .return(self)
# }
.annotate 'line', 2792

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2795
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2796

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2779
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2781
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
.annotate 'line', 2813
    setattribute self, 'type', __ARG_1
.annotate 'line', 2814
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2815
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2816
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2817

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2820
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2821

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2822
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2823
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2824
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2825
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2826
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2827
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2828
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags


.sub 'issubid' :method
# Body
# {
.annotate 'line', 2831
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 2832
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
.annotate 'line', 2833

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2805
    addattribute $P0, 'type'
.annotate 'line', 2806
    addattribute $P0, 'reg'
.annotate 'line', 2807
    addattribute $P0, 'scope'
.annotate 'line', 2808
    addattribute $P0, 'flags'
.annotate 'line', 2809
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2841
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2842

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2845
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2846

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2838
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
.annotate 'line', 2855
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2856

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2857
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2860
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2861
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2862
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2863

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2849
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2851
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2874
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2875

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2878
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2879
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2880
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2881
    if_null $P2, __label_2
.annotate 'line', 2882
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2883
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2884
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2885
    $P1[$S1] = $P3
.annotate 'line', 2886
    .return($P3)
# }
.annotate 'line', 2887

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2890
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2891
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2892
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2893
    if_null $P2, __label_2
.annotate 'line', 2894
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2895
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2896

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2899
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2900
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2901
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2902
    if_null $P2, __label_2
.annotate 'line', 2903
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2904
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2905

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2908
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2909
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2910
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2911
    if_null $P2, __label_2
.annotate 'line', 2912
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2913
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2914
    $P1[$S1] = $P3
.annotate 'line', 2915
    .return($P3)
# }
.annotate 'line', 2916

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2919
# var locals: $P1
    getattribute $P1, self, 'locals'
# builtin string
.annotate 'line', 2920
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2921

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2924
# var sym: $P1
    null $P1
.annotate 'line', 2925
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2926
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2927
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2929
    .return($P3)
# }
.annotate 'line', 2930

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2933
# var sym: $P1
    null $P1
.annotate 'line', 2934
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2935
    .return($P1)
  __label_1: # endif
.annotate 'line', 2936
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2937
    .return($P1)
  __label_2: # endif
.annotate 'line', 2938
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2939
    if_null $P2, __label_3
.annotate 'line', 2940
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2941
    .return($P3)
# }
.annotate 'line', 2942

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2945
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2946
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2947
    .return($S1)
# }
.annotate 'line', 2948

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2951
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2953
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2954
    .return('__WLEX_self')
# }
.annotate 'line', 2955

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2869
    addattribute $P0, 'locals'
.annotate 'line', 2870
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2964
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
.annotate 'line', 2976
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2977

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2978
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2979
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2980
    .return(0)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
.annotate 'line', 2981
    .return(0)
# }

.end # isintegerzero


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2982
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2983
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2984
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2985
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2986
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2987
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2990
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2991

.end # tempreg


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2994
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2995

.end # genlabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2999
    .return(self)
# }
.annotate 'line', 3000

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 3001
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3004
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3005
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $P1 = self.'tempreg'($S1)
    set $S2, $P1
  __label_2:
.annotate 'line', 3006
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 3007
    .return($S2)
# }
.annotate 'line', 3008

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3011
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3012
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 3013
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 3014

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3017
# reg: $S1
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3018
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
# {
.annotate 'line', 3019
# aux: $S2
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3020
    self.'annotate'(__ARG_1)
.annotate 'line', 3021
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 3022
    set $S1, $S2
# }
  __label_2: # endif
.annotate 'line', 3024
    .return($S1)
# }
.annotate 'line', 3025

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 3028
    WSubId_64(self)
# }
.annotate 'line', 3029

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2972
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 3034
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 3032
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
.annotate 'line', 3044
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3045
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 3046
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3047
    WSubId_45('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3048
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 3049

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3050
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3053
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3054
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3055
    .return(self)
# }
.annotate 'line', 3056

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3059
    self.'annotate'(__ARG_1)
.annotate 'line', 3060
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 3061
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3062
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3063
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 3064
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 3066
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3068

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3039
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3041
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
.annotate 'line', 3083
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3084
    .return(self)
# }
.annotate 'line', 3085

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 3088
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 3089

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3092
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3093
    .return(self)
# }
.annotate 'line', 3094

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 3097
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3098
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3099
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
.annotate 'line', 3100
    .return(0)
# }
.annotate 'line', 3101

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3104
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3106
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3107
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3108
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3110
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3111
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
.annotate 'line', 3114
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3117
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3120
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3123

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3126
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3128
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3129
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3130
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3132
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3133
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
.annotate 'line', 3136
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3139
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3142
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3145

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3080
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 3152
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 3153
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3150
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3163
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3164
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 3165

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 3166
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3167
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 3170
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3171
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3172
    .return($S1)
# }
.annotate 'line', 3173

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 3176
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3177
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3178
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3179
# builtin unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3180
    .return($S1)
# }
.annotate 'line', 3181

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3184
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 3185
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 3186

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3189
    .tailcall self.'getPirString'()
# }
.annotate 'line', 3190

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3158
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3160
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3201
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3202
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3203
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 3204
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 3205

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 3206
    .return(1)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
# builtin int
.annotate 'line', 3209
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
# }
.annotate 'line', 3210

.end # isintegerzero


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3211
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 3214
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 3215

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3218
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3219
    .return($N1)
# }
.annotate 'line', 3220

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3223
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 3224
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3225
    if $I1 goto __label_2
.annotate 'line', 3226
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3228
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3230

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3233
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 3234

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3195
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3197
    addattribute $P0, 'pos'
.annotate 'line', 3198
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3244
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3245
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 3246

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 3247
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3248
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3251
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3252
    .return($N1)
# }
.annotate 'line', 3253

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3256
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3257
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3258
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3260

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 3263
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3264
    .tailcall WSubId_65($N1)
# }
.annotate 'line', 3265

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3239
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3241
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3274
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3277
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3278
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3279

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3282
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3283
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3284
    .return(0)
  __label_1: # endif
.annotate 'line', 3285
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3286

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3289
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3290
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3291
    if_null $P2, __label_1
.annotate 'line', 3292
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3294
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3297
    .return('P')
  __label_4: # default
.annotate 'line', 3299
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3302

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3305
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3306
    .return($S1)
# }
.annotate 'line', 3307

.end # getName


.sub 'checkVar' :method
# Body
# {
.annotate 'line', 3310
    getattribute $P1, self, 'owner'
# builtin string
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
# }
.annotate 'line', 3311

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3314
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3315
    unless_null $P1, __label_1
.annotate 'line', 3316
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3317
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3318
# s: $S1
    null $S1
.annotate 'line', 3319
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3320
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3323
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3325
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3329
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3330
    .return($S1)
# }
.annotate 'line', 3331

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 3334
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3335
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3336
    getattribute $P2, self, 'name'
    WSubId_66($P2)
  __label_1: # endif
.annotate 'line', 3337
    .return($P1)
# }
.annotate 'line', 3338

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3341
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3342
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3343
    if_null $P2, __label_1
# {
.annotate 'line', 3344
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3345
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3346
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3347
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3348
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3349
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3356
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3357
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# builtin substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3358
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
.annotate 'line', 3362
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3363
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3364
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_11
# {
.annotate 'line', 3365
# id: $S1
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_12
    set $S1, $P6
  __label_12:
.annotate 'line', 3366
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3367
    self.'usesubid'($S1)
.annotate 'line', 3368
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3372
    .return(self)
# }
.annotate 'line', 3373

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3376
# id: $S1
    null $S1
.annotate 'line', 3377
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3378
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3380
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3381
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3382
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_3:
.annotate 'line', 3383
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3384
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3385
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3386
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3387
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3391
    .return($S1)
# }
.annotate 'line', 3392

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3395
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3396
    self.'annotate'(__ARG_1)
.annotate 'line', 3397
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3398
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3400

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3403
    self.'annotate'(__ARG_1)
.annotate 'line', 3404
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3405

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3408
    self.'annotate'(__ARG_1)
.annotate 'line', 3409
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3410
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3411
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3412
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3413
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3414
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3417
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3420
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3423
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3424
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3426
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3427
    ne $S3, 'v', __label_13
.annotate 'line', 3428
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3429
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3430
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3433
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3434
    self.'annotate'(__ARG_1)
.annotate 'line', 3435
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3436
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3438
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3441
    .return($S2)
# }
.annotate 'line', 3442

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3270
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3272
    addattribute $P0, 'name'
.annotate 'line', 3273
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3452
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3453
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3454

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3457
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3458

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3461
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3462
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3463
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3464
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3465
    .return($S2)
# }
.annotate 'line', 3466

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3469
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3470
    self.'annotate'(__ARG_1)
.annotate 'line', 3471
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3472
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3474

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3477
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3478
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3479
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3481
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3484
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3482
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3485
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3488
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3489
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3490
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3492
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3493
    self.'annotate'(__ARG_1)
.annotate 'line', 3494
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3498
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3499

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3502
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3503

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3447
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3449
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3512
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3513

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3508
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
.annotate 'line', 3523
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3524
    $P2 = WSubId_60(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3525
    getattribute $P1, self, 'key'
# builtin elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3526
    WSubId_45('namespace identifier', __ARG_3)
  __label_1: # endif
# }
.annotate 'line', 3527

.end # OpNamespaceExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3528
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3531
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3532
# var sym: $P2
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3533
    unless_null $P2, __label_1
.annotate 'line', 3534
    getattribute $P4, self, 'start'
    WSubId_1('unknown namespace', $P4)
  __label_1: # endif
.annotate 'line', 3535
# var path: $P3
    $P3 = $P2.'getpath'()
.annotate 'line', 3536
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
# }
.annotate 'line', 3537

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3518
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3520
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
.annotate 'line', 3548
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3549
    $P2 = WSubId_67(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3550

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3551
    .return('P')
# }

.end # checkresult


.sub 'get_class_raw_key' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3554
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3555
# var clspec: $P2
    getattribute $P2, self, 'clspec'
# switch-case
.annotate 'line', 3558
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 3559
# var clkey: $P3
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3560
    if_null $P3, __label_5
    getattribute $P4, $P3, 'path'
    goto __label_4
  __label_5:
    null $P4
  __label_4:
    .return($P4)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 3562
    getattribute $P4, self, 'start'
    WSubId_1("Testing, unfinished", $P4)
# }
.annotate 'line', 3563

.end # get_class_raw_key


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3566
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3567
# var clspec: $P2
    getattribute $P2, self, 'clspec'
.annotate 'line', 3570
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3571
    getattribute $P4, self, 'owner'
    __ARG_2 = $P4.'tempreg'('P')
  __label_1: # endif
# switch-case
.annotate 'line', 3575
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 3576
# var clkey: $P3
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3577
    if_null $P3, __label_5
# {
.annotate 'line', 3578
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3579
    .return()
# }
  __label_5: # endif
    goto __label_2 # break
  __label_3: # default
  __label_2: # switch end
.annotate 'line', 3584
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3585
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3586
    __ARG_1.'say'()
# }
.annotate 'line', 3587

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3542
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3544
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3597
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3598
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3599

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3602
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3603

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3606
    self.'optimizearg'()
.annotate 'line', 3607
    .return(self)
# }
.annotate 'line', 3608

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3592
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3594
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
.annotate 'line', 3619
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3620
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3621
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3622

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3625
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3626
    .return(self)
# }
.annotate 'line', 3627

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3630
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3631

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3634
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3635
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3636

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3639
    self.'optimizearg'()
.annotate 'line', 3640
    .return(self)
# }
.annotate 'line', 3641

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3644
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3645

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3648
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3649

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3613
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3615
    addattribute $P0, 'lexpr'
.annotate 'line', 3616
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3658
    .return('I')
# }
.annotate 'line', 3659

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3662
    self.'optimizearg'()
.annotate 'line', 3663
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3664
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3665
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3666
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3667
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3668
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3670
    .return(self)
# }
.annotate 'line', 3671

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3654
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3680
    .return('I')
# }
.annotate 'line', 3681

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3676
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
.annotate 'line', 3689
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3690

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3693
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3694
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3695
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3696
    self.'annotate'(__ARG_1)
.annotate 'line', 3697
    __ARG_1.'print'('    delete ')
.annotate 'line', 3698
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3699
    __ARG_1.'say'()
.annotate 'line', 3700
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3701
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3704
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3705

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3685
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
.annotate 'line', 3712
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3713

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3716
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3717
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
.annotate 'line', 3718
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3719
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3720
    self.'annotate'(__ARG_1)
.annotate 'line', 3721
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3722
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3723
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3726
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3727

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3708
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
.annotate 'line', 3736
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3737

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3740
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3741

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3744
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3745
    .return(self)
# }
.annotate 'line', 3746

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 3749
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3750
    self.'optimizearg'()
.annotate 'line', 3751
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3752
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3753
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3756
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3757
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3758
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_68($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3761
    .return(self)
# }
.annotate 'line', 3762

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3765
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3766
    self.'annotate'(__ARG_1)
.annotate 'line', 3767
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3768

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3732
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
.annotate 'line', 3777
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3778

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3779
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3782
    .return('I')
# }
.annotate 'line', 3783

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3786
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3787
    .return(self)
# }
.annotate 'line', 3788

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3791
    self.'optimizearg'()
.annotate 'line', 3792
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3793
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3794
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3795
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3797
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3798
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3799
    .return(self)
# }
.annotate 'line', 3800

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3803
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3804

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3807
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3808
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3809
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3810
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3812
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3815
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3818
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3820

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3773
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
.annotate 'line', 3829
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3830

.end # OpBinNotExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3833
    .return('I')
# }
.annotate 'line', 3834

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3837
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3838
    .return(self)
# }
.annotate 'line', 3839

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3842
    self.'optimizearg'()
.annotate 'line', 3843
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3844
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3845
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3846
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3848
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3849
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3850
    .return(self)
# }
.annotate 'line', 3851

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3854
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3855
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3856
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3857
    self.'annotate'(__ARG_1)
.annotate 'line', 3858
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
# }
  __label_2: # endif
# }
.annotate 'line', 3860

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 3825
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3869
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3870

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3873
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3874
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3875
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3876

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3865
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3885
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3886
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3887
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3888

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3881
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
.annotate 'line', 3895
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3896

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3899
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3900
    self.'annotate'(__ARG_1)
.annotate 'line', 3901
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3902
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3903
    .return($S1)
# }
.annotate 'line', 3904

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3891
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
.annotate 'line', 3911
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3912

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3915
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3916
    self.'annotate'(__ARG_1)
.annotate 'line', 3917
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3918
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3919
    .return($S1)
# }
.annotate 'line', 3920

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3907
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
.annotate 'line', 3929
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3930

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3933
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3934
    self.'annotate'(__ARG_1)
.annotate 'line', 3935
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3936
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3937
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3938
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3939
    .return($S1)
# }
.annotate 'line', 3940

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3925
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
.annotate 'line', 3947
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3948

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3951
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3952
    self.'annotate'(__ARG_1)
.annotate 'line', 3953
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3954
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3955
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3956
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3957
    .return($S1)
# }
.annotate 'line', 3958

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3943
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
.annotate 'line', 3969
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3970
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3971
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3972
    .return(self)
# }
.annotate 'line', 3973

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3976
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3977

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3980
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3981
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3982
    .return(self)
# }
.annotate 'line', 3983

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3986
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3987

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 3990
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3991
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3992
    WSubId_64($P1)
  __label_1: # endif
# }
.annotate 'line', 3993

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3996
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3997
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3998
    self.'annotate'(__ARG_1)
.annotate 'line', 3999
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 4001

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3963
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3965
    addattribute $P0, 'lexpr'
.annotate 'line', 3966
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4010
    self.'annotate'(__ARG_1)
.annotate 'line', 4011
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4012
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 4013

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 4006
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4022
    self.'annotate'(__ARG_1)
.annotate 'line', 4023
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4024
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 4025
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 4026

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4029
    self.'checkleft'()
.annotate 'line', 4030
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4031
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 4032
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 4033
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 4034
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 4035
    self.'annotate'(__ARG_1)
.annotate 'line', 4036
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 4037
    .return($S1)
# }
.annotate 'line', 4038

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 4018
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4047
    self.'checkleft'()
.annotate 'line', 4048
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4049
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4050
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4051
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4052
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4053
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 4054
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4056
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 4057
# aux: $S5
    null $S5
.annotate 'line', 4058
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 4059
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 4061
    eq $S2, 'S', __label_13
# {
.annotate 'line', 4062
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4063
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4064
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 4066
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 4070
    eq $S1, $S2, __label_14
# {
.annotate 'line', 4071
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4072
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4073
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 4075
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4078
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 4081
    .return($S3)
# }
.annotate 'line', 4082

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 4043
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4091
    self.'checkleft'()
.annotate 'line', 4092
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4093
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4094
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4095
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4096
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4097
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4098
# aux: $S5
    null $S5
.annotate 'line', 4099
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 4100
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 4102
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4105
    eq $S1, $S2, __label_10
# {
.annotate 'line', 4106
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4107
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4108
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 4110
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 4113
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 4115
    .return($S3)
# }
.annotate 'line', 4116

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4087
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4125
    self.'checkleft'()
.annotate 'line', 4126
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4127
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4128
# lreg: $S1
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4129
# rreg: $S2
    null $S2
# switch
.annotate 'line', 4130
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    set $S4, 'S'
    if $S3 == $S4 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 4132
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4133
    self.'annotate'(__ARG_1)
.annotate 'line', 4134
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 4137
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4138
    self.'annotate'(__ARG_1)
.annotate 'line', 4139
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_2: # switch end
.annotate 'line', 4141
    .return($S1)
# }
.annotate 'line', 4142

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4121
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4151
    self.'checkleft'()
.annotate 'line', 4152
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4153
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4154
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4155
    self.'annotate'(__ARG_1)
.annotate 'line', 4156
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 4157
    .return($S2)
# }
.annotate 'line', 4158

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4147
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4167
    self.'checkleft'()
.annotate 'line', 4168
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4169
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4170
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4171
    self.'annotate'(__ARG_1)
.annotate 'line', 4172
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 4173
    .return($S2)
# }
.annotate 'line', 4174

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4163
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
.annotate 'line', 4186
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4189
    self.'optimizearg'()
.annotate 'line', 4190
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4191
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4192
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4193
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4194
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4195
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 4197
    .return(self)
# }
.annotate 'line', 4198

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 4201
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4202
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4203
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4204
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4205
    self.'annotate'(__ARG_1)
.annotate 'line', 4206
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 4208
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4213
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4218
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4223
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4228
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4233
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4209
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4210
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4211
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4214
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4215
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4216
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4219
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4220
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4221
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4224
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4225
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4226
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4229
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4230
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4231
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4234
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4235
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4236
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4237
# switch
.annotate 'line', 4240
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4242
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4245
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 4248
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 4249
# }
.annotate 'line', 4251

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4254
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4255

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4258
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4259

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4262
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 4263

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4184
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4274
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
# }
.annotate 'line', 4275

.end # Negable


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4276
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4279
# positive: $I1
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4280
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4281
    .return(self)
# }
.annotate 'line', 4282

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4270
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4296
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4297
    self.'Negable'(__ARG_3)
.annotate 'line', 4298
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 4299

.end # CheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4300
    .return('I')
# }

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4290
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4292
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4307
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4308

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4311
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4312
    self.'annotate'(__ARG_1)
.annotate 'line', 4313
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4314
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4315
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 4316

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4319
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4320
    self.'annotate'(__ARG_1)
.annotate 'line', 4321
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4322
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4324
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4325

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4303
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
.annotate 'line', 4332
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4333

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4336
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4337
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4338
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 4339
    self.'annotate'(__ARG_1)
.annotate 'line', 4340
    getattribute $P2, self, 'positive'
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 4341
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_4
  __label_3: # else
.annotate 'line', 4343
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_4: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 4345

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4348
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4349
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4350
    self.'annotate'(__ARG_1)
.annotate 'line', 4351
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4352
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4354
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4355

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4328
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
.annotate 'line', 4364
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4365
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4366

.end # OpEqualExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4369
    self.'optimizearg'()
.annotate 'line', 4370
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4371
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4372
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4373
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4374
    unless $I1 goto __label_1
# {
.annotate 'line', 4375
    unless $I2 goto __label_2
.annotate 'line', 4376
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_21($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4378
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4380
    unless $I2 goto __label_4
.annotate 'line', 4381
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4382
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4383
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4384
    $I7 = $P1.'isliteral'()
    unless $I7 goto __label_8
    $I7 = $P2.'isliteral'()
  __label_8:
    unless $I7 goto __label_7
# {
.annotate 'line', 4385
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4386
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4388
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4389
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4390
# vi: $I5
    getattribute $P5, self, 'positive'
    if_null $P5, __label_15
    unless $P5 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4391
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall WSubId_21($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 4393
# ls: $S3
    getattribute $P9, $P1, 'strval'
    getattribute $P8, $P9, 'str'
    null $S3
    if_null $P8, __label_16
    set $S3, $P8
  __label_16:
.annotate 'line', 4394
# rs: $S4
    getattribute $P11, $P2, 'strval'
    getattribute $P10, $P11, 'str'
    null $S4
    if_null $P10, __label_17
    set $S4, $P10
  __label_17:
.annotate 'line', 4395
# vs: $I6
    getattribute $P12, self, 'positive'
    if_null $P12, __label_19
    unless $P12 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4396
    getattribute $P13, self, 'owner'
    getattribute $P14, self, 'start'
    .tailcall WSubId_21($P13, $P14, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_7: # endif
.annotate 'line', 4400
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4401
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4402
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4403
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4404
    .return(self)
# }
.annotate 'line', 4405

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4408
    self.'annotate'(__ARG_1)
.annotate 'line', 4409
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
.annotate 'line', 4410

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4413
    self.'annotate'(__ARG_1)
.annotate 'line', 4414
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4415

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4418
    self.'annotate'(__ARG_1)
.annotate 'line', 4419
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
.annotate 'line', 4420

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4423
    self.'annotate'(__ARG_1)
.annotate 'line', 4424
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
.annotate 'line', 4425

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4360
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
.annotate 'line', 4436
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4437
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4438

.end # OpSameExpr


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4441
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
.annotate 'line', 4442

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4445
    self.'annotate'(__ARG_1)
.annotate 'line', 4446
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4447
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4448
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4449

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4452
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4453

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4456
    self.'annotate'(__ARG_1)
.annotate 'line', 4457
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4458
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4459
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4460

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4463
    self.'annotate'(__ARG_1)
.annotate 'line', 4464
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4465
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4466
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4467

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4431
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4433
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4474
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4477
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4478

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4481
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4482

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4485
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4486

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4489
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4490

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4493
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4494

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4472
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4501
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4504
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4505

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4508
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4509

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4512
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4513

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4516
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4517

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4520
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4521

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4499
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4528
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4531
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4532

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4535
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4536

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4539
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4540

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4543
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4544

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4547
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4548

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4526
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4555
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4558
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4559

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4562
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4563

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4566
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4567

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4570
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4571

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4574
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4575

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4553
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4584
    .return('I')
# }
.annotate 'line', 4585

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4580
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
.annotate 'line', 4594
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4595

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4598
    self.'optimizearg'()
.annotate 'line', 4599
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4600
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4601
    unless $I1 goto __label_3
.annotate 'line', 4602
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4603
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_21($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4601
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4605
    .return(self)
# }
.annotate 'line', 4606

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4609
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
.annotate 'line', 4610
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4611
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4612
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4613
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4616
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4617
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4618
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4619
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4620
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4622

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4590
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
.annotate 'line', 4631
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4632

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4635
    self.'optimizearg'()
.annotate 'line', 4636
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4637
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4638
    if $I1 goto __label_3
.annotate 'line', 4639
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4640
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_21($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4638
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4642
    .return(self)
# }
.annotate 'line', 4643

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4646
# res: $S1
    null $S1
.annotate 'line', 4647
    if_null __ARG_2, __label_1
.annotate 'line', 4648
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4650
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4651
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4652
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4653
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4654
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4657
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4658
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4659
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4660
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4661
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4663

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4627
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4668
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
.annotate 'line', 4678
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4679

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4682
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
.annotate 'line', 4683
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4684
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4685
    self.'annotate'(__ARG_1)
.annotate 'line', 4686
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4687

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4690
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4691

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4674
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
.annotate 'line', 4700
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4701

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4704
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
.annotate 'line', 4705
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4706
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4707
    self.'annotate'(__ARG_1)
.annotate 'line', 4708
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4709

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4712
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4713

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4696
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
.annotate 'line', 4722
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4723

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4726
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
.annotate 'line', 4727
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4728
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4729
    self.'annotate'(__ARG_1)
.annotate 'line', 4730
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4731

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4734
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4735

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4718
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
.annotate 'line', 4745
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4747
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4754
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4748
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4749
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4750
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4752
    getattribute $P5, self, 'values'
# builtin push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4755
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4756
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4759
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 2
    $P10[0] = __ARG_3
    $P10[1] = __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4761

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4762
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4765
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4766
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4767
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4768
# i: $I2
    null $I2
# for loop
.annotate 'line', 4769
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4770
# builtin string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4769
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4771
    .return($P2)
# }
.annotate 'line', 4772

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4775
# auxreg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4776
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 4777
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 4778

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4781
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4782
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4783
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4784
    self.'annotate'(__ARG_1)
.annotate 'line', 4785
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4786
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4787
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4786
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4788
    .return($S1)
# }
.annotate 'line', 4789

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4792
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4793
# nvalues: $I1
# builtin elements
    elements $I1, $P1
.annotate 'line', 4794
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4795
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4796
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4795
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4797

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4740
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4742
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4806
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4807

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4808
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4811
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4812
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4813
# rreg: $S2
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4814
    set $S3, __ARG_2
    eq $S3, '', __label_3
# {
.annotate 'line', 4815
    self.'annotate'(__ARG_1)
.annotate 'line', 4816
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 4818

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4802
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
.annotate 'line', 4827
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4828

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 4831
    self.'optimizearg'()
.annotate 'line', 4832
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4833
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4834
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4835
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4836
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4837
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4842
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4843
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4844
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4846
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# builtin string
.annotate 'line', 4847
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
.annotate 'line', 4849
    new $P12, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P13, $P3, 'file'
    getattribute $P14, $P3, 'line'
# builtin string
.annotate 'line', 4850
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
.annotate 'line', 4851
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4853
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4854
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4855
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4856
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4859
    $P6 = WSubId_69($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4860
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4861
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4862
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_68($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4866
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4867
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4869
    .return(self)
# }
.annotate 'line', 4870

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_69 = "WSubId_69"
# Body
# {
.annotate 'line', 4873
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4874
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4875
    ne $S1, $S2, __label_3
.annotate 'line', 4876
    .return($S1)
  __label_3: # endif
.annotate 'line', 4877
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4878
    .return('S')
  __label_4: # endif
.annotate 'line', 4879
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4880
    .return('S')
  __label_6: # endif
.annotate 'line', 4881
    $P1 = WSubId_69($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4882
    .return('N')
  __label_8: # endif
.annotate 'line', 4883
    .return('I')
# }
.annotate 'line', 4884

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4887
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4888
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4889
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4890
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4891
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4893
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4894
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4895
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4896
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4897
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4898
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4899
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4900
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4903
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4904
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4907
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4910
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4911
# l: $S7
    null $S7
.annotate 'line', 4912
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4914
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4915
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4917
# r: $S8
    null $S8
.annotate 'line', 4918
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4920
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4921
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4923
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4926
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4928

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4823
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
.annotate 'line', 4937
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4938

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4941
    self.'optimizearg'()
.annotate 'line', 4942
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4943
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4944
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4945
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4946
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4947
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4948
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4949
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4950
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4953
    .return(self)
# }
.annotate 'line', 4954

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4957
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4958
# rtype: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
# switch-case
.annotate 'line', 4960
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 4962
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 4964
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 4966
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 4961
    .return($S1)
  __label_6: # case
.annotate 'line', 4963
    .return('P')
  __label_8: # case
.annotate 'line', 4965
    .return('N')
  __label_10: # case
.annotate 'line', 4967
    .return('N')
  __label_4: # default
.annotate 'line', 4969
    .return('I')
  __label_3: # switch end
# }
.annotate 'line', 4971

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4974
# type: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4975
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4976
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4977
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4978
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4979
# lreg: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4980
# rreg: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4981
# aux: $S6
    null $S6
.annotate 'line', 4982
    eq $S2, $S1, __label_6
# {
.annotate 'line', 4983
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4984
    ne $S1, 'P', __label_7
.annotate 'line', 4985
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 4987
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 4988
    set $S4, $S6
# }
  __label_6: # endif
.annotate 'line', 4990
    eq $S3, $S1, __label_9
# {
.annotate 'line', 4991
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4992
    ne $S1, 'P', __label_10
.annotate 'line', 4993
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 4995
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 4996
    set $S5, $S6
# }
  __label_9: # endif
.annotate 'line', 4998
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
# }
.annotate 'line', 4999

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4933
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
.annotate 'line', 5008
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5009

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 5012
    self.'optimizearg'()
.annotate 'line', 5013
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5014
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5015
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5016
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5017
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 5018
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'I'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 5019
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5020
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 5021
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 5024
    $P3 = WSubId_69($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5025
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 5026
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 5027
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_68($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 5031
    ne $S1, 'S', __label_8
.annotate 'line', 5032
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 5033
    .return(self)
# }
.annotate 'line', 5034

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5037
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5038
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5039
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5040
    ne $S1, $S2, __label_3
.annotate 'line', 5041
    .return($S1)
  __label_3: # endif
.annotate 'line', 5042
    ne $S1, 'S', __label_4
.annotate 'line', 5043
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5045
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 5046

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5049
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5050
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5051
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5052
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5053
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 5054
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
.annotate 'line', 5055
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5056
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5057
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5058
    .return()
# }
  __label_3: # endif
.annotate 'line', 5063
    ne $S1, 'N', __label_7
# {
.annotate 'line', 5064
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5065
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5066
# rval: $S5
    null $S5
# switch
.annotate 'line', 5067
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5069
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5070
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5071
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5074
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5077
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5078
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 5080
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 5081
    self.'annotate'(__ARG_1)
.annotate 'line', 5082
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_12: # endif
.annotate 'line', 5084
    .return()
# }
  __label_7: # endif
.annotate 'line', 5087
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 5088
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_15
    $I3 = $P1.'isidentifier'()
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 5089
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 5090
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5093
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5094
    set $S3, $I1
# }
  __label_14: # endif
.annotate 'line', 5096
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P2.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 5097
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 5098
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_17
  __label_16: # else
# {
# switch
.annotate 'line', 5101
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_21
    set $S7, 'N'
    if $S6 == $S7 goto __label_22
    set $S7, 'I'
    if $S6 == $S7 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 5103
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5104
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 5107
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_23: # case
  __label_20: # default
.annotate 'line', 5111
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5112
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
.annotate 'line', 5113
# }
  __label_17: # endif
.annotate 'line', 5116
    self.'annotate'(__ARG_1)
.annotate 'line', 5117
    set $S6, __ARG_2
    ne $S6, '', __label_24
.annotate 'line', 5118
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_24: # endif
.annotate 'line', 5119
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 5120

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 5004
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
.annotate 'line', 5129
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5130

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 5133
    self.'optimizearg'()
.annotate 'line', 5134
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5135
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5136
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 5137
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5138
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5139
# var lval: $P3
    null $P3
.annotate 'line', 5140
# var rval: $P4
    null $P4
.annotate 'line', 5141
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 5142
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5143
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5144
    unless $I2 goto __label_7
.annotate 'line', 5145
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
.annotate 'line', 5148
    $P5 = WSubId_69($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 5149
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5150
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5151
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5152
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
.annotate 'line', 5156
    .return(self)
# }
.annotate 'line', 5157

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5160
    .return('N')
# }
.annotate 'line', 5161

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5164
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5165
# var aux: $P2
    null $P2
.annotate 'line', 5166
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5167
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 5168
    $P2 = self.'tempreg'('N')
.annotate 'line', 5169
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5170
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 5172
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5173
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5174
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 5175
    $P2 = self.'tempreg'('N')
.annotate 'line', 5176
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5177
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 5179
    self.'annotate'(__ARG_1)
.annotate 'line', 5180
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 5181

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5125
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
.annotate 'line', 5190
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5191

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5194
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5195
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5196
    self.'annotate'(__ARG_1)
.annotate 'line', 5197
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5198

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5201
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5202

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5186
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
.annotate 'line', 5211
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5212

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5215
    .return('I')
# }
.annotate 'line', 5216

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5219
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5220
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5221
    self.'annotate'(__ARG_1)
.annotate 'line', 5226
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5227

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5207
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
.annotate 'line', 5236
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5237

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5240
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
.annotate 'line', 5241
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5242
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5243
    self.'annotate'(__ARG_1)
.annotate 'line', 5244
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 5245

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5248
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5249

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5232
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
.annotate 'line', 5258
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5259

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5262
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
.annotate 'line', 5263
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5264
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5265
    self.'annotate'(__ARG_1)
.annotate 'line', 5266
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 5267

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5270
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5271

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5254
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5280
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5281

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5284
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 5285
# setname: $S1
    set $S1, ''
.annotate 'line', 5286
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 5287
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5289
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5292
    set $I2, 1
# switch
.annotate 'line', 5293
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
.annotate 'line', 5297
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5298
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5299
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5300
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5303
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 5308
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5311
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5314
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5309
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5312
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5315
    __ARG_1.'print'(' :named')
.annotate 'line', 5316
    eq $S1, '', __label_17
.annotate 'line', 5317
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5318
# }
.annotate 'line', 5320

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5276
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5329
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5330
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 5331

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5334
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5335
    .return(self)
# }
.annotate 'line', 5336

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 5339
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 5340

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5325
    addattribute $P0, 'arg'
.annotate 'line', 5326
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
.annotate 'line', 5345
# var modifier: $P1
    null $P1
.annotate 'line', 5346
# var expr: $P2
    $P2 = WSubId_42(__ARG_1, __ARG_2)
.annotate 'line', 5347
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5348
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 5349
    $P3 = __ARG_1.'get'()
.annotate 'line', 5350
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 5351
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5354
    WSubId_45('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5357
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5358
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 5359

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
.annotate 'line', 5370
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5371
    setattribute self, 'start', __ARG_2
.annotate 'line', 5372
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5373
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5374
    __ARG_3.'unget'($P1)
.annotate 'line', 5375
    $P3 = WSubId_41(__ARG_3, __ARG_1, WSubId_70, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5377

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5380
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5381
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5382

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5385
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5386

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5389
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5390
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5391

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5394
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5395
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5396

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 5399
    getattribute $P1, self, 'args'
    WSubId_43($P1)
.annotate 'line', 5400
    .return(self)
# }
.annotate 'line', 5401

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5404
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5405
    unless_null $P1, __label_1
# {
.annotate 'line', 5406
    new $P2, ['ResizableStringArray']
.annotate 'line', 5407
# var collect: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 5408
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P4, $P6
# {
.annotate 'line', 5409
# reg: $S1
    getattribute $P8, $P4, 'arg'
    $P7 = $P3.'add'($P8)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 5410
# builtin push
    push $P2, $S1
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5412
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5414
    .return($P1)
# }
.annotate 'line', 5415

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5418
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5419
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5421
# sep: $S1
    set $S1, ''
.annotate 'line', 5422
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5423
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5424
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5425
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5426
    if_null $P3, __label_4
.annotate 'line', 5427
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5428
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5423
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5430

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5363
    addattribute $P0, 'owner'
.annotate 'line', 5364
    addattribute $P0, 'start'
.annotate 'line', 5365
    addattribute $P0, 'args'
.annotate 'line', 5366
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_71')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5435
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5436
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5437
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5438
    .return(1)
# }
.annotate 'line', 5439

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]

.sub 'CallBuiltinExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5450
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5451
    setattribute self, 'builtin', __ARG_3
.annotate 'line', 5452
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5453

.end # CallBuiltinExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5456
    getattribute $P1, self, 'builtin'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5457

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5460
# var builtin: $P1
    getattribute $P1, self, 'builtin'
.annotate 'line', 5461
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5462
    new $P3, ['ResizableStringArray']
.annotate 'line', 5463
# var arg: $P4
    null $P4
# switch
.annotate 'line', 5464
    $P8 = $P1.'params'()
    set $I3, $P8
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5466
# var collectarglist: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P9, self, 'owner'
    $P5.'CollectValues'($P9, __ARG_1)
.annotate 'line', 5467
    if_null $P2, __label_6
    iter $P10, $P2
    set $P10, 0
  __label_5: # for iteration
    unless $P10 goto __label_6
    shift $P4, $P10
.annotate 'line', 5468
    getattribute $P12, $P4, 'arg'
    $P11 = $P5.'add'($P12)
# builtin push
    push $P3, $P11
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5471
# var rawargs: $P6
    root_new $P6, ['parrot';'ResizablePMCArray']
.annotate 'line', 5472
    if_null $P2, __label_8
    iter $P13, $P2
    set $P13, 0
  __label_7: # for iteration
    unless $P13 goto __label_8
    shift $P4, $P13
.annotate 'line', 5473
    getattribute $P14, $P4, 'arg'
# builtin push
    push $P6, $P14
    goto __label_7
  __label_8: # endfor
.annotate 'line', 5474
    getattribute $P15, self, 'builtin'
    getattribute $P16, self, 'start'
    $P15.'expand'(__ARG_1, self, $P16, __ARG_2, $P6)
.annotate 'line', 5475
    .return()
  __label_2: # default
.annotate 'line', 5477
# n: $I1
    getattribute $P17, self, 'args'
    set $I1, $P17
.annotate 'line', 5478
# var collectdefault: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P18, self, 'owner'
    $P7.'CollectValues'($P18, __ARG_1)
# for loop
.annotate 'line', 5479
# i: $I2
    null $I2
  __label_11: # for condition
    ge $I2, $I1, __label_10
# {
.annotate 'line', 5480
    $P19 = $P2[$I2]
    getattribute $P4, $P19, 'arg'
.annotate 'line', 5481
# argtype: $S1
    $P8 = $P4.'checkresult'()
    null $S1
    if_null $P8, __label_12
    set $S1, $P8
  __label_12:
.annotate 'line', 5482
# paramtype: $S2
    $P8 = $P1.'paramtype'($I2)
    null $S2
    if_null $P8, __label_13
    set $S2, $P8
  __label_13:
.annotate 'line', 5483
# argr: $S3
    null $S3
.annotate 'line', 5484
    $P8 = $P4.'isnull'()
    if_null $P8, __label_14
    unless $P8 goto __label_14
# {
# switch
.annotate 'line', 5485
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
.annotate 'line', 5489
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5490
    __ARG_1.'emitnull'($S3)
    goto __label_16 # break
  __label_17: # default
.annotate 'line', 5493
    $P11 = $P7.'add'($P4)
    set $S3, $P11
  __label_16: # switch end
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 5497
    iseq $I3, $S1, $S2
    if $I3 goto __label_24
    iseq $I3, $S2, '?'
  __label_24:
    if $I3 goto __label_23
.annotate 'line', 5498
    iseq $I3, $S2, 'p'
    unless $I3 goto __label_25
.annotate 'line', 5499
    iseq $I3, $S1, 'S'
    if $I3 goto __label_26
    iseq $I3, $S1, 'P'
  __label_26:
  __label_25:
  __label_23:
    unless $I3 goto __label_21
.annotate 'line', 5500
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S3, $P8
    goto __label_22
  __label_21: # else
# {
.annotate 'line', 5502
    ne $S2, 'p', __label_27
.annotate 'line', 5503
    set $S2, 'P'
  __label_27: # endif
.annotate 'line', 5504
# aux: $S4
    $P8 = $P4.'emit_get'(__ARG_1)
    null $S4
    if_null $P8, __label_28
    set $S4, $P8
  __label_28:
# switch
.annotate 'line', 5505
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
.annotate 'line', 5507
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
.annotate 'line', 5511
    $P8 = self.'tempreg'($S2)
    set $S3, $P8
.annotate 'line', 5512
    __ARG_1.'emitbox'($S3, $S4)
    goto __label_35 # break
  __label_36: # default
.annotate 'line', 5515
    set $S3, $S4
  __label_35: # switch end
    goto __label_29 # break
  __label_32: # case
  __label_33: # case
  __label_34: # case
.annotate 'line', 5521
    $P9 = self.'tempreg'($S2)
    set $S3, $P9
.annotate 'line', 5522
    __ARG_1.'emitset'($S3, $S4)
    goto __label_29 # break
  __label_30: # default
.annotate 'line', 5525
    set $S3, $S4
  __label_29: # switch end
# }
  __label_22: # endif
# }
  __label_15: # endif
.annotate 'line', 5529
# builtin push
    push $P3, $S3
# }
  __label_9: # for iteration
.annotate 'line', 5479
    inc $I2
    goto __label_11
  __label_10: # for end
  __label_1: # switch end
.annotate 'line', 5532
    getattribute $P8, self, 'builtin'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P3)
# }
.annotate 'line', 5533

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
.annotate 'line', 5443
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5445
    addattribute $P0, 'builtin'
.annotate 'line', 5446
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
.annotate 'line', 5540
# callname: $S1
    $P6 = __ARG_3.'getname'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 5541
    __ARG_1.'use_builtin'($S1)
.annotate 'line', 5542
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P6 = __ARG_4.'numargs'()
    set $I1, $P6
  __label_2:
.annotate 'line', 5543
# var rawargs: $P1
    if $I1 goto __label_5
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
    goto __label_4
  __label_5:
    $P7 = __ARG_4.'getrawargs'()
    set $P1, $P7
  __label_4:
.annotate 'line', 5545
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5546
# var variant: $P3
    null $P3
.annotate 'line', 5547
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P4, $P8
# {
.annotate 'line', 5548
# vargs: $I2
    getattribute $P6, $P4, 'nparams'
    set $I2, $P6
.annotate 'line', 5549
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 5550
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 5551
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 5552
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5554
    unless_null $P3, __label_12
.annotate 'line', 5555
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5558
    $P6 = $P3.'iscompileevaluable'()
    if_null $P6, __label_13
    unless $P6 goto __label_13
# {
.annotate 'line', 5559
    $P7 = WSubId_71($P1)
    if_null $P7, __label_14
    unless $P7 goto __label_14
# {
.annotate 'line', 5560
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5561
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    .tailcall $P5($P6, $P7, $P1)
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5565
    new $P7, [ 'Winxed'; 'Compiler'; 'CallBuiltinExpr' ]
    $P7.'CallBuiltinExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P6, $P7
    .return($P6)
# }
.annotate 'line', 5566

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5575
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5576
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5577
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5578
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5579
    __ARG_1.'unget'($P1)
.annotate 'line', 5580
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5582

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5583
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_72 = "WSubId_72"
# Body
# {
.annotate 'line', 5586
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5587
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5588
    if_null $P2, __label_1
.annotate 'line', 5589
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5591
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5595
# var sym: $P3
    null $P3
.annotate 'line', 5596
# var subid: $P4
    null $P4
.annotate 'line', 5597
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5598
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5599
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5600
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5601
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5602
    isnull $I1, $P6
    if $I1 goto __label_7
    set $S1, $P6
    iseq $I1, $S1, ''
  __label_7:
    unless $I1 goto __label_6
# {
.annotate 'line', 5603
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5604
    $P1.'buildkey'($P7)
.annotate 'line', 5605
    $P3 = self.'scopesearch'($P7, 0)
.annotate 'line', 5606
    if_null $P3, __label_8
# {
.annotate 'line', 5607
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_9
# {
.annotate 'line', 5608
    $P9 = $P3.'ismulti'()
    isfalse $I2, $P9
    unless $I2 goto __label_10
# {
.annotate 'line', 5609
    $P4 = $P3.'makesubid'()
.annotate 'line', 5610
    self.'usesubid'($P4)
# }
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 5613
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_11
.annotate 'line', 5614
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
.annotate 'line', 5618
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5620
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_12
.annotate 'line', 5621
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_12: # endif
.annotate 'line', 5624
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_13
    unless $P9 goto __label_13
# {
.annotate 'line', 5625
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_14
# {
.annotate 'line', 5626
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P12 = $P1.'getName'()
    $P11[0] = $P12
    $P8 = self.'scopesearch'($P11, 0)
.annotate 'line', 5627
    isnull $I1, $P8
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
.annotate 'line', 5628
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_72($P9, $P10, $P8, $P2)
  __label_15: # endif
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5632
    setattribute self, 'funref', $P1
.annotate 'line', 5633
    setattribute self, 'args', $P2
.annotate 'line', 5634
    .return(self)
# }
.annotate 'line', 5635

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5638
    .return(1)
# }
.annotate 'line', 5639

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5642
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5643
# call: $S1
    null $S1
.annotate 'line', 5645
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5646
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5647
    ne $S1, '', __label_4
# {
.annotate 'line', 5648
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
# switch-case
.annotate 'line', 5650
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5653
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5656
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5651
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
.annotate 'line', 5654
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5657
    WSubId_6("Builtin unexpeted here", self)
  __label_6: # default
.annotate 'line', 5659
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
.annotate 'line', 5664
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5665
    .return($S1)
# }
.annotate 'line', 5666

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5669
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5670
    if_null $P1, __label_1
.annotate 'line', 5671
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5672

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5675
    __ARG_1.'print'('(')
.annotate 'line', 5676
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5677
    if_null $P1, __label_1
.annotate 'line', 5678
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5679
    __ARG_1.'say'(')')
# }
.annotate 'line', 5680

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5683
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5684
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5686
    self.'annotate'(__ARG_1)
.annotate 'line', 5688
    __ARG_1.'print'('    ')
.annotate 'line', 5689
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5690
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5691
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5693
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5696
    __ARG_1.'print'($S1)
.annotate 'line', 5697
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5698

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5568
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5570
    addattribute $P0, 'funref'
.annotate 'line', 5571
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
.annotate 'line', 5712
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5713
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5714
    setattribute self, 'args', __ARG_3
.annotate 'line', 5715
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5716
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5717

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 5720
    getattribute $P6, self, 'sym'
    if_null $P6, __label_1
# {
.annotate 'line', 5721
    getattribute $P7, self, 'subid'
    if_null $P7, __label_2
.annotate 'line', 5722
    getattribute $P8, self, 'subid'
    .return($P8)
  __label_2: # endif
.annotate 'line', 5723
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5724
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5725
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5727
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5729
# var first: $P3
    getattribute $P3, $P2, 'left'
  __label_5: # while
.annotate 'line', 5730
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_4
.annotate 'line', 5731
    getattribute $P3, $P3, 'left'
    goto __label_5
  __label_4: # endwhile
.annotate 'line', 5732
    $P6 = $P3.'isidentifier'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 5733
# check: $S1
    $P7 = $P3.'checkIdentifier'()
    null $S1
    if_null $P7, __label_7
    set $S1, $P7
  __label_7:
.annotate 'line', 5734
    isnull $I1, $S1
    if $I1 goto __label_9
    iseq $I1, $S1, ''
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 5738
    new $P4, ['ResizableStringArray']
.annotate 'line', 5739
    $P2.'buildkey'($P4)
.annotate 'line', 5740
# fun: $S2
    $P6 = $P4.'pop'()
    null $S2
    if_null $P6, __label_10
    set $S2, $P6
  __label_10:
.annotate 'line', 5741
# var reg: $P5
    $P5 = self.'tempreg'('P')
.annotate 'line', 5742
    self.'annotate'(__ARG_1)
.annotate 'line', 5743
    $P6 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'($P5, $S2, $P6)
.annotate 'line', 5744
    .return($P5)
# }
  __label_8: # endif
# }
  __label_6: # endif
.annotate 'line', 5747
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P2.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
.annotate 'line', 5748
    $P8 = $P2.'get_member'()
.annotate 'line', 5747
    $P6[2] = $P8
    $P6[3] = "'"
# builtin join
    join $S3, "", $P6
    .return($S3)
# }
.annotate 'line', 5749

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5706
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5708
    addattribute $P0, 'sym'
.annotate 'line', 5709
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5759
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5760
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5761
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5762

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5765
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5766
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5767
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5768
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5769
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5772
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5773
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5774
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5775

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5755
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
.annotate 'line', 5785
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5786
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5787

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5790
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5791
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5792
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5793
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5794
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5795
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5796
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5798
    .return($S2)
# }
.annotate 'line', 5799

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5780
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5782
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
.annotate 'line', 5808
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5809
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5810

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5811
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5814
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5815
    .return(self)
# }
.annotate 'line', 5816

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5819
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5820
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5821
    $P2 = $P1.'getName'()
# builtin push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5823
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5824
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# builtin push
    push __ARG_1, $P2
# }
.annotate 'line', 5825

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5828
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5829

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5832
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5833
    self.'annotate'(__ARG_1)
.annotate 'line', 5834
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5835

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5838
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5839
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5840
    .return($S1)
# }
.annotate 'line', 5841

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5844
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5845
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5846
    self.'annotate'(__ARG_1)
.annotate 'line', 5847
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5848

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5851
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5852

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5855
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5856
# value: $S2
    null $S2
.annotate 'line', 5857
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5859
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5860
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5861
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5863
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5866
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5867
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5869
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5870

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5873
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5874
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5875
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5876
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5878
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5879
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5880
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5882
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5884
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5885
    .return($S2)
# }
.annotate 'line', 5886

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5802
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5804
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
.annotate 'line', 5897
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5898
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5899

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5900
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5903
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5904
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5905
    .return(self)
# }
.annotate 'line', 5906

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 5909
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5910
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5911
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5912
    WSubId_45("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5913
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5914
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5915
    self.'annotate'(__ARG_1)
.annotate 'line', 5916
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5917
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5918
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5919

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 5922
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5923
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5924
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5925
    WSubId_45("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5926
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5927
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5928
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5929
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5931
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5933
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5934
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5935
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5939
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5940
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5941
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5944
    self.'annotate'(__ARG_1)
.annotate 'line', 5945
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5946
    .return($S3)
# }
.annotate 'line', 5947

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5892
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5894
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
.annotate 'line', 5958
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5959
    setattribute self, 'left', __ARG_3
.annotate 'line', 5960
    setattribute self, 'arg', __ARG_4
# }
.annotate 'line', 5961

.end # StringIndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5964
    .return('S')
# }
.annotate 'line', 5965

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5968
# lreg: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5969
# rreg: $S2
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5970
    set $S3, __ARG_2
    eq $S3, '', __label_3
# {
.annotate 'line', 5971
    self.'annotate'(__ARG_1)
.annotate 'line', 5972
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $S1, ', ', $S2, ', ', 1)
# }
  __label_3: # endif
# }
.annotate 'line', 5974

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 5952
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5954
    addattribute $P0, 'left'
.annotate 'line', 5955
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
.annotate 'line', 5988
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5989
    setattribute self, 'left', __ARG_4
.annotate 'line', 5990
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5991

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5994
    .return('P')
# }
.annotate 'line', 5995

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5998
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5999
    setattribute self, 'left', $P1
.annotate 'line', 6000
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 6001
    $P2.'optimizeargs'()
.annotate 'line', 6003
    $P5 = $P1.'checkresult'()
    set $S2, $P5
    ne $S2, 'S', __label_1
# {
.annotate 'line', 6004
    $P6 = $P2.'numargs'()
    set $I2, $P6
    eq $I2, 1, __label_2
.annotate 'line', 6005
    WSubId_1('Bad string index', self)
  __label_2: # endif
.annotate 'line', 6006
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 6009
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_4
    $I2 = $P3.'isintegerliteral'()
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6010
# ival: $I1
    $P5 = $P3.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 6011
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 6012
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 6013
# builtin substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 6014
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
.annotate 'line', 6016
    new $P6, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'StringIndexExpr'($P7, $P8, $P1, $P3)
    set $P5, $P6
    .return($P5)
# }
  __label_1: # endif
.annotate 'line', 6019
    .return(self)
# }
.annotate 'line', 6020

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6023
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6024
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 6025
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 6026
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6027
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 6028
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 6026
    setattribute self, 'regleft', $P3
.annotate 'line', 6029
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 6030

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6033
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 6034
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 6035
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6036
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6037
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6038
# builtin join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6039
    __ARG_1.'print'(']')
# }
.annotate 'line', 6040

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6043
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6044
    self.'annotate'(__ARG_1)
.annotate 'line', 6045
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6046
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6047
    __ARG_1.'say'('')
# }
.annotate 'line', 6048

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6051
# result: $S1
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6052
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6053
    .return($S1)
# }
.annotate 'line', 6054

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6057
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6058
    self.'annotate'(__ARG_1)
.annotate 'line', 6059
    __ARG_1.'print'('    ')
.annotate 'line', 6060
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6061
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 6062

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6065
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6066
# rreg: $S1
    null $S1
.annotate 'line', 6067
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 6068
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6069
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 6072
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6073
    self.'annotate'(__ARG_1)
.annotate 'line', 6074
    __ARG_1.'print'('    ')
.annotate 'line', 6075
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6076
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6077
    .return($S1)
# }
.annotate 'line', 6078

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5979
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5981
    addattribute $P0, 'left'
.annotate 'line', 5982
    addattribute $P0, 'regleft'
.annotate 'line', 5983
    addattribute $P0, 'args'
.annotate 'line', 5984
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
.annotate 'line', 6089
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6090
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6091
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6092
    __ARG_1.'unget'($P1)
.annotate 'line', 6093
    $P3 = WSubId_41(__ARG_1, __ARG_2, WSubId_42, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6095

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6096
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 6099
    getattribute $P1, self, 'values'
    WSubId_43($P1)
.annotate 'line', 6100
    .return(self)
# }
.annotate 'line', 6101

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6104
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 6105
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 6106
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6112
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 6114

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6117
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6118
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6119
    .return($S1)
# }
.annotate 'line', 6120

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6123
    self.'annotate'(__ARG_1)
.annotate 'line', 6124
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6125
# size: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin elements
    elements $I1, $P1
  __label_1:
.annotate 'line', 6126
    eq __ARG_2, '', __label_3
# {
.annotate 'line', 6127
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6128
    le $I1, 0, __label_4
.annotate 'line', 6129
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 6131
# var collect: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P4, self, 'owner'
    $P2.'CollectValues'($P4, __ARG_1)
.annotate 'line', 6132
# i: $I2
    null $I2
.annotate 'line', 6133
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
# {
.annotate 'line', 6134
# valuereg: $S1
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6135
    eq __ARG_2, '', __label_8
# {
.annotate 'line', 6136
    self.'annotate'(__ARG_1)
.annotate 'line', 6137
    __ARG_1.'say'('    ', __ARG_2, "[", $I2, "] = ", $S1)
.annotate 'line', 6138
    inc $I2
# }
  __label_8: # endif
# }
    goto __label_5
  __label_6: # endfor
# }
.annotate 'line', 6141

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6083
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6085
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
.annotate 'line', 6153
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6154
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6155
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6156
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6157
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 6158
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6159
# {
.annotate 'line', 6160
# var key: $P4
    $P4 = WSubId_42(__ARG_1, __ARG_2)
.annotate 'line', 6161
    WSubId_59(':', __ARG_1)
.annotate 'line', 6162
# var value: $P5
    $P5 = WSubId_42(__ARG_1, __ARG_2)
.annotate 'line', 6163
# builtin push
    push $P2, $P4
.annotate 'line', 6164
# builtin push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 6166
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6167
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6168
    WSubId_45("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 6170
    setattribute self, 'keys', $P2
.annotate 'line', 6171
    setattribute self, 'values', $P3
# }
.annotate 'line', 6172

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6173
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 6176
    getattribute $P1, self, 'keys'
    WSubId_43($P1)
.annotate 'line', 6177
    getattribute $P1, self, 'values'
    WSubId_43($P1)
.annotate 'line', 6178
    .return(self)
# }
.annotate 'line', 6179

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6182
    self.'annotate'(__ARG_1)
.annotate 'line', 6187
    set $S4, __ARG_2
    eq $S4, '', __label_1
.annotate 'line', 6188
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6190
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 6191
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 6192
# var collectvalues: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 6193
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 6194
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 6195
# var key: $P4
    $P4 = $P1[$I2]
.annotate 'line', 6196
# keyreg: $S1
    null $S1
.annotate 'line', 6197
    $I3 = $P4.'isidentifier'()
    unless $I3 goto __label_7
    $P5 = $P4.'checkIdentifier'()
    set $S4, $P5
    iseq $I3, $S4, ''
  __label_7:
    unless $I3 goto __label_5
# {
.annotate 'line', 6198
# id: $S2
    $P6 = $P4.'getName'()
    null $S2
    if_null $P6, __label_8
    set $S2, $P6
  __label_8:
.annotate 'line', 6199
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6200
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 6203
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6205
# valuereg: $S3
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 6206
    set $S4, __ARG_2
    eq $S4, '', __label_10
.annotate 'line', 6207
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_10: # endif
# }
  __label_2: # for iteration
.annotate 'line', 6194
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 6209

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6212
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6213
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6214
    .return($S1)
# }
.annotate 'line', 6215

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6146
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6148
    addattribute $P0, 'keys'
.annotate 'line', 6149
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6228
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6233
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 6234

.end # parseinitializer


.sub 'numargs' :method
# Body
# {
.annotate 'line', 6237
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6238
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
.annotate 'line', 6239

.end # numargs


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 6242
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6243
    if_null $P1, __label_1
.annotate 'line', 6244
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 6245

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6248
    self.'optimize_initializer'()
.annotate 'line', 6249
    .return(self)
# }
.annotate 'line', 6250

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6253
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6254
    if_null $P1, __label_1
.annotate 'line', 6255
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6256
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6257
    if_null $P1, __label_2
.annotate 'line', 6258
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6259
    __ARG_1.'say'(")")
# }
.annotate 'line', 6260

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6220
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6222
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
.annotate 'line', 6271
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6273
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 6274
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6275
    setattribute self, 'value', __ARG_4
.annotate 'line', 6276
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6278
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6279
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6281
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 6282

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6285
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 6286
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 6289
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6290
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_3
    $I1 = $P2.'isconst'()
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 6291
    $P1 = $P2.'getvalue'()
.annotate 'line', 6292
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 6293
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 6294
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 6297
    self.'optimize_initializer'()
.annotate 'line', 6298
    .return(self)
# }
.annotate 'line', 6299

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
.annotate 'line', 6302
    self.'annotate'(__ARG_1)
.annotate 'line', 6304
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6305
# var value: $P2
    getattribute $P2, self, 'value'
.annotate 'line', 6306
# numinits: $I1
    $P8 = self.'numargs'()
    set $I1, $P8
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 6309
# type: $I2
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6310
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6312
# reginit: $S1
    set $S1, ''
.annotate 'line', 6313
# regnew: $S2
    set $P8, __ARG_2
    null $S2
    if_null $P8, __label_5
    set $S2, $P8
  __label_5:
.annotate 'line', 6314
# constructor: $S3
    null $S3
# switch
.annotate 'line', 6315
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
.annotate 'line', 6320
    ne $I2, 1, __label_11
# {
.annotate 'line', 6321
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 6322
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 6325
# var initval: $P3
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 6326
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 6327
    concat $S5, ', ', $S1
    set $S1, $S5
# }
  __label_12: # endif
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 6331
    eq $I2, 1, __label_14
.annotate 'line', 6332
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_14: # endif
.annotate 'line', 6333
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 6334
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
  __label_6: # switch end
.annotate 'line', 6337
    ne $S2, '', __label_16
.annotate 'line', 6338
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_16: # endif
# switch
.annotate 'line', 6340
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
  __label_19: # case
.annotate 'line', 6343
# name: $S4
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_21
    set $S4, $P8
  __label_21:
.annotate 'line', 6344
# var aux: $P4
# builtin get_class
    get_class $P4, $S4
.annotate 'line', 6345
    isnull $I5, $P4
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
  __label_23:
    unless $I5 goto __label_22
.annotate 'line', 6346
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    WSubId_73($S5, $P2)
  __label_22: # endif
.annotate 'line', 6350
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 6351
    le $I1, 1, __label_24
# {
.annotate 'line', 6352
    __ARG_1.'say'($S2, ".'", $P2, "'()")
# }
  __label_24: # endif
    goto __label_17 # break
  __label_20: # case
.annotate 'line', 6356
# var id: $P5
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 6357
    unless_null $P5, __label_25
# {
.annotate 'line', 6358
# var cl: $P6
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 6359
    if_null $P6, __label_27
# {
.annotate 'line', 6360
# var key: $P7
    $P7 = $P6.'getpath'()
.annotate 'line', 6361
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
# }
    goto __label_28
  __label_27: # else
# {
.annotate 'line', 6364
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 6365
    if_null $P5, __label_29
.annotate 'line', 6366
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_30
  __label_29: # else
# {
.annotate 'line', 6368
    $P9 = self.'dowarnings'()
    if_null $P9, __label_31
    unless $P9 goto __label_31
.annotate 'line', 6369
    WSubId_73('Checking: new unknown type')
  __label_31: # endif
.annotate 'line', 6370
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
# }
  __label_30: # endif
# }
  __label_28: # endif
.annotate 'line', 6373
    set $S3, $P2
# }
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 6377
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
# }
  __label_26: # endif
    goto __label_17 # break
  __label_18: # default
.annotate 'line', 6381
    WSubId_6('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 6383
    isgt $I3, $I1, 1
    if $I3 goto __label_33
    isge $I3, $I1, 0
    unless $I3 goto __label_34
    iseq $I3, $I2, 1
  __label_34:
  __label_33:
    unless $I3 goto __label_32
# {
.annotate 'line', 6384
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6385
    not $I3, __ARG_3
    unless $I3 goto __label_36
    set $S5, __ARG_2
    isne $I3, $S5, ''
  __label_36:
    unless $I3 goto __label_35
.annotate 'line', 6386
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_35: # endif
# }
  __label_32: # endif
# }
.annotate 'line', 6388

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6391
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6392

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6265
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6267
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6403
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6404
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6405
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6406
    setattribute self, 'nskey', $P1
.annotate 'line', 6407
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6408
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6409
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6411
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6412

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6415
# reginit: $S1
    null $S1
# switch
.annotate 'line', 6416
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
.annotate 'line', 6421
# var initval: $P1
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6422
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6425
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_1: # switch end
.annotate 'line', 6427
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6429
    set $S2, __ARG_2
    ne $S2, '', __label_6
.annotate 'line', 6430
    __ARG_2 = self.'tempreg'('P')
  __label_6: # endif
.annotate 'line', 6432
    __ARG_1.'print'('    ')
.annotate 'line', 6433
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 6434
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6435
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6436
    null $P3
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6437
    if_null $S1, __label_8
.annotate 'line', 6438
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6439
    __ARG_1.'say'()
# }
.annotate 'line', 6440

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6397
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6399
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6451
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6452
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6453
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6454
    setattribute self, 'nskey', $P1
.annotate 'line', 6455
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6456
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6457
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6459
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6460

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6463
# numinits: $I1
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6464
# regnew: $S1
    set $P2, __ARG_2
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 6465
    le $I1, 0, __label_2
.annotate 'line', 6466
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6467
# var nskey: $P1
    getattribute $P1, self, 'nskey'
.annotate 'line', 6469
    ne $S1, '', __label_3
.annotate 'line', 6470
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_3: # endif
.annotate 'line', 6472
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 6474
    lt $I1, 0, __label_4
# {
.annotate 'line', 6475
# constructor: $S2
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 6476
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6477
    set $S3, __ARG_2
    eq $S3, '', __label_6
.annotate 'line', 6478
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_6: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 6480

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6445
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6447
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6487
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6490
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6494
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6497
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6492
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6493
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6492
    .return($P3)
  __label_4: # case
.annotate 'line', 6496
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6500
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6501
    __ARG_1.'unget'($P2)
.annotate 'line', 6502
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6504
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6509
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6511

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
.annotate 'line', 6522
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6523
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6524
    $P2 = WSubId_67(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6525

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6528
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6529
    .return(self)
# }
.annotate 'line', 6530

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6531
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6534
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6535
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6536
    eq $S1, 'P', __label_2
.annotate 'line', 6537
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6538
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6540
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
.annotate 'line', 6541
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6542
    self.'annotate'(__ARG_1)
.annotate 'line', 6543
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6544
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6545
    __ARG_1.'say'()
# }
.annotate 'line', 6546

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6515
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6517
    addattribute $P0, 'lexpr'
.annotate 'line', 6518
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
.annotate 'line', 6559
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6560
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6561
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6562
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6563
    .return(self)
# }
.annotate 'line', 6564

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6567
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6568
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6570
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6572
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6574
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6575
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6576
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6578

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6581
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6582
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6583
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6585
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6586

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6589
# cond_end: $S1
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 6590
# cond_false: $S2
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 6591
    getattribute $P4, self, 'condition'
    $P4.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6592
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6593
# tres: $S3
    $P4 = self.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
.annotate 'line', 6594
    $P4 = $P1.'isnull'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6595
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6597
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6598
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6599
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6600
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6601
    $P4 = $P2.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 6602
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6604
# tfalse: $S4
    $P5 = $P2.'checkresult'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
  __label_8:
.annotate 'line', 6605
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6606
# r: $S5
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 6607
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 6611
    ne $S4, 'P', __label_13
# {
.annotate 'line', 6612
# var aux: $P3
    $P3 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 6613
    __ARG_1.'emitset'(__ARG_2, $P3)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 6616
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
# }
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6619
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6620

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6551
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6553
    addattribute $P0, 'condition'
.annotate 'line', 6554
    addattribute $P0, 'etrue'
.annotate 'line', 6555
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
.annotate 'line', 6665
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
.annotate 'line', 6666
    .return(1)
  __label_4: # case
.annotate 'line', 6667
    .return(2)
  __label_5: # case
.annotate 'line', 6668
    .return(3)
  __label_2: # default
.annotate 'line', 6669
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6671

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6675
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
.annotate 'line', 6676
    .return(8)
  __label_4: # case
.annotate 'line', 6677
    .return(11)
  __label_5: # case
.annotate 'line', 6678
    .return(33)
  __label_6: # case
.annotate 'line', 6679
    .return(9)
  __label_7: # case
.annotate 'line', 6680
    .return(10)
  __label_2: # default
.annotate 'line', 6682
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(31)
    goto __label_9
  __label_8: # else
.annotate 'line', 6683
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(32)
    goto __label_11
  __label_10: # else
.annotate 'line', 6684
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_1: # switch end
# }
.annotate 'line', 6686

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_81')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6690
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
.annotate 'line', 6691
    .return(19)
  __label_4: # case
.annotate 'line', 6692
    .return(20)
  __label_5: # case
.annotate 'line', 6693
    .return(21)
  __label_6: # case
.annotate 'line', 6694
    .return(22)
  __label_2: # default
.annotate 'line', 6695
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6697

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_84')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6701
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6702
    .return(28)
  __label_4: # case
.annotate 'line', 6703
    .return(29)
  __label_2: # default
.annotate 'line', 6704
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6706

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_86')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6710
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
.annotate 'line', 6711
    .return(14)
  __label_4: # case
.annotate 'line', 6712
    .return(16)
  __label_5: # case
.annotate 'line', 6713
    .return(15)
  __label_6: # case
.annotate 'line', 6714
    .return(17)
  __label_2: # default
.annotate 'line', 6716
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6717
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6719

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_88')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6723
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
.annotate 'line', 6724
    .return(12)
  __label_4: # case
.annotate 'line', 6725
    .return(13)
  __label_5: # case
.annotate 'line', 6726
    .return(25)
  __label_6: # case
.annotate 'line', 6727
    .return(26)
  __label_2: # default
.annotate 'line', 6728
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6730

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_97')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6734
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
.annotate 'line', 6735
    .return(4)
  __label_4: # case
.annotate 'line', 6736
    .return(5)
  __label_5: # case
.annotate 'line', 6737
    .return(6)
  __label_6: # case
.annotate 'line', 6738
    .return(18)
  __label_7: # case
.annotate 'line', 6739
    .return(23)
  __label_8: # case
.annotate 'line', 6740
    .return(24)
  __label_9: # case
.annotate 'line', 6741
    .return(30)
  __label_2: # default
.annotate 'line', 6742
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6744

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
.annotate 'line', 6748
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6749
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6752
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6756
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6758
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6760
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6762
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6764
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6766
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6768
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6770
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6772
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 6774
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 6753
    $P2 = WSubId_42(__ARG_1, __ARG_2)
.annotate 'line', 6754
    WSubId_59(')', __ARG_1)
.annotate 'line', 6755
    .return($P2)
  __label_4: # case
.annotate 'line', 6757
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6759
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6761
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6763
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6765
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6767
    .tailcall WSubId_74(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6769
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6771
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6773
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 6775
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 6777
    WSubId_45('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6779

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_76 = "WSubId_76"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6783
# var subexp: $P1
    $P1 = WSubId_75(__ARG_1, __ARG_2)
.annotate 'line', 6784
# var t: $P2
    null $P2
.annotate 'line', 6785
# var start: $P3
    null $P3
.annotate 'line', 6786
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6787
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_76($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6788
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6790
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6793
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6796
    set $P3, $P2
.annotate 'line', 6797
    $P2 = __ARG_1.'get'()
.annotate 'line', 6798
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6799
# var right: $P4
    $P4 = WSubId_75(__ARG_1, __ARG_2)
.annotate 'line', 6800
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6803
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6806
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6809
    __ARG_1.'unget'($P2)
.annotate 'line', 6810
    .return($P1)
# }
.annotate 'line', 6811

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
# Body
# {
.annotate 'line', 6815
# var subexp: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6816
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6818
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6820
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6819
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6821
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6823
    __ARG_1.'unget'($P2)
.annotate 'line', 6824
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6826

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
.annotate 'line', 6830
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6831
# code: $I1
    $P3 = WSubId_78($P1)
    set $I1, $P3
.annotate 'line', 6832
    unless $I1 goto __label_1
# {
.annotate 'line', 6833
# var subexpr: $P2
    $P2 = WSubId_79(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6834
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
.annotate 'line', 6836
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6838
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6840
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6842
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6844
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6846
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6848
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_4: # default
.annotate 'line', 6850
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6854
    __ARG_1.'unget'($P1)
.annotate 'line', 6855
    .tailcall WSubId_80(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6857

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6861
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6862
# var t: $P2
    null $P2
.annotate 'line', 6863
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6864
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_81($P2)
    set $I1, $P4
    unless $I1 goto __label_1
# {
.annotate 'line', 6865
# var rexpr: $P3
    $P3 = WSubId_79(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6866
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
.annotate 'line', 6868
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6871
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6874
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6877
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6880
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6883
    __ARG_1.'unget'($P2)
.annotate 'line', 6884
    .return($P1)
# }
.annotate 'line', 6885

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_82 = "WSubId_82"
# Body
# {
.annotate 'line', 6889
# var lexpr: $P1
    $P1 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6890
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6891
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6892
# var rexpr: $P3
    $P3 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6893
# var expr: $P4
    null $P4
.annotate 'line', 6894
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6895
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6897
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6898
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6900
    __ARG_1.'unget'($P2)
.annotate 'line', 6901
    .return($P1)
# }
.annotate 'line', 6902

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6906
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6907
# var rexpr: $P2
    null $P2
.annotate 'line', 6908
# var t: $P3
    null $P3
.annotate 'line', 6909
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6910
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_84($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6911
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6913
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6914
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6917
    $P2 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6918
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6921
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6924
    __ARG_1.'unget'($P3)
.annotate 'line', 6925
    .return($P1)
# }
.annotate 'line', 6926

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6930
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6931
# var rexpr: $P2
    null $P2
.annotate 'line', 6932
# var t: $P3
    null $P3
.annotate 'line', 6933
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6934
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_86($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6935
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
.annotate 'line', 6937
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6938
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6941
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6942
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6945
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6946
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6949
    $P2 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6950
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6953
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6956
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6959
    __ARG_1.'unget'($P3)
.annotate 'line', 6960
    .return($P1)
# }
.annotate 'line', 6961

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6965
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6966
# var rexpr: $P2
    null $P2
.annotate 'line', 6967
# var t: $P3
    null $P3
.annotate 'line', 6968
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6969
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_88($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6970
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
.annotate 'line', 6972
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6973
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6976
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6977
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6980
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6981
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6984
    $P2 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6985
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6988
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6991
    __ARG_1.'unget'($P3)
.annotate 'line', 6992
    .return($P1)
# }
.annotate 'line', 6993

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6997
# var lexpr: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6998
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6999
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7000
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 7001
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7003
    __ARG_1.'unget'($P2)
.annotate 'line', 7004
    .return($P1)
# }
.annotate 'line', 7005

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
# Body
# {
.annotate 'line', 7009
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 7010
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7011
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7012
# var rexpr: $P3
    $P3 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 7013
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7015
    __ARG_1.'unget'($P2)
.annotate 'line', 7016
    .return($P1)
# }
.annotate 'line', 7017

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
# Body
# {
.annotate 'line', 7021
# var lexpr: $P1
    $P1 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7022
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7023
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7024
# var rexpr: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7025
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7027
    __ARG_1.'unget'($P2)
.annotate 'line', 7028
    .return($P1)
# }
.annotate 'line', 7029

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
# Body
# {
.annotate 'line', 7033
# var lexpr: $P1
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7034
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7035
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7036
# var rexpr: $P3
    $P3 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7037
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7039
    __ARG_1.'unget'($P2)
.annotate 'line', 7040
    .return($P1)
# }
.annotate 'line', 7041

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_94')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_92 = "WSubId_92"
# Body
# {
.annotate 'line', 7045
# var lexpr: $P1
    $P1 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7046
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7047
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7048
# var rexpr: $P3
    $P3 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7049
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7051
    __ARG_1.'unget'($P2)
.annotate 'line', 7052
    .return($P1)
# }
.annotate 'line', 7053

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7057
# var econd: $P1
    $P1 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 7058
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 7059
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 7060
# var etrue: $P3
    $P3 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7061
    WSubId_59(':', __ARG_1)
.annotate 'line', 7062
# var efalse: $P4
    $P4 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7063
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7066
    __ARG_1.'unget'($P2)
.annotate 'line', 7067
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7069

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
.annotate 'line', 7073
# var lexpr: $P1
    $P1 = WSubId_96(__ARG_1, __ARG_2)
.annotate 'line', 7074
# var t: $P2
    null $P2
.annotate 'line', 7075
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 7076
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_97($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
.annotate 'line', 7077
# var rexpr: $P3
    $P3 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7078
# var expr: $P4
    null $P4
# switch
.annotate 'line', 7079
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
.annotate 'line', 7081
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7084
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7087
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7090
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7093
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 7096
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 7099
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7102
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 7104
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7105
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7107
    __ARG_1.'unget'($P2)
.annotate 'line', 7108
    .return($P1)
# }
.annotate 'line', 7109

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 7113
    .tailcall WSubId_95(__ARG_1, __ARG_2)
# }
.annotate 'line', 7114

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7129
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7130
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7131
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7132
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7133
    .return($S1)
# }
.annotate 'line', 7134

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7137
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7138
    unless_null $P1, __label_1
.annotate 'line', 7139
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7140
    .return($P1)
# }
.annotate 'line', 7141

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7125
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7150
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7151
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7152
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7153
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7154
    .return($S1)
# }
.annotate 'line', 7155

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7158
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7159
    unless_null $P1, __label_1
.annotate 'line', 7160
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7161
    .return($P1)
# }
.annotate 'line', 7162

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7144
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7146
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7178
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7179
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7180
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7181
    __ARG_2.'unget'($P1)
.annotate 'line', 7182
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 7184

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7187
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7188
    if_null $P1, __label_1
.annotate 'line', 7189
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7190
    .return(self)
# }
.annotate 'line', 7191

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7195
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7196
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# builtin int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7199
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 7200
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7201
    $I2 = $P2.'cantailcall'()
    unless $I2 goto __label_6
    getattribute $P3, self, 'owner'
    $I2 = $P3.'allowtailcall'()
  __label_6:
    unless $I2 goto __label_5
# {
.annotate 'line', 7202
    self.'annotate'(__ARG_1)
.annotate 'line', 7203
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 7207
    le $I1, 0, __label_7
.annotate 'line', 7208
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7210
    self.'annotate'(__ARG_1)
.annotate 'line', 7211
    self.'emitret'(__ARG_1)
.annotate 'line', 7212
    le $I1, 0, __label_8
.annotate 'line', 7213
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 7214
    __ARG_1.'say'(')')
# }
.annotate 'line', 7215

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7172
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7174
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7222
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7223

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7226
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 7227

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7218
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
.annotate 'line', 7234
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7235

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7238
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 7239

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7230
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7252
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7253
    setattribute self, 'name', __ARG_1
.annotate 'line', 7254
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 7255

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7256
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7259
    self.'annotate'(__ARG_1)
.annotate 'line', 7260
    getattribute $P1, self, 'value'
# builtin string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 7261

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7246
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7248
    addattribute $P0, 'name'
.annotate 'line', 7249
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7275
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7276
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 7277

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7278
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7281
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7282
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7283
    .return($S2)
# }
.annotate 'line', 7284

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7270
    addattribute $P0, 'owner'
.annotate 'line', 7271
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
.annotate 'line', 7297
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7298
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7299
    WSubId_98($P1)
.annotate 'line', 7300
    setattribute self, 'label', $P1
.annotate 'line', 7301
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 7302

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7303
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7306
    self.'annotate'(__ARG_1)
.annotate 'line', 7307
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7308
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7309
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 7310

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7291
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7293
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7321
    $P1 = WSubId_42(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 7322

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7325
    WSubId_59('(', __ARG_1)
.annotate 'line', 7326
    $P1 = WSubId_42(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7327
    WSubId_59(')', __ARG_1)
# }
.annotate 'line', 7328

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7317
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
.annotate 'line', 7341
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7342
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7343
    $P3 = WSubId_99(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7344
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7345
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7346
    $P4 = WSubId_99(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7348
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7349
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7351

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7354
    self.'optimize_condition'()
.annotate 'line', 7355
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7356
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 7357
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7359
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7361
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7363
    .return(self)
# }
.annotate 'line', 7364

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7367
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7368
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7369
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7370
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7371
# elselabel: $S1
    set $S1, ''
.annotate 'line', 7372
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7373
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7374
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7375
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7376
    self.'annotate'(__ARG_1)
.annotate 'line', 7377
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7378
    $P1.'emit'(__ARG_1)
.annotate 'line', 7380
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7381
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7382
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7383
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7385
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7386

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7335
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7337
    addattribute $P0, 'truebranch'
.annotate 'line', 7338
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7398
    $P2 = WSubId_99(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7399

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7402
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7403
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7405
    self.'annotate'(__ARG_1)
.annotate 'line', 7406
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7407
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7408
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7409
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7410

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7393
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7395
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7421
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7422
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7423
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7424

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7427
    self.'optimize_condition'()
.annotate 'line', 7428
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7429
    .return(self)
# }
.annotate 'line', 7430

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7433
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7435
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7438
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7441
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7442
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7444
    self.'annotate'(__ARG_1)
.annotate 'line', 7445
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7446
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7447
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7448
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7449
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7451

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7417
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
.annotate 'line', 7462
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7463
    self.'parsebody'(__ARG_2)
.annotate 'line', 7464
    WSubId_100('while', __ARG_2)
.annotate 'line', 7465
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7466

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7469
    self.'optimize_condition'()
.annotate 'line', 7470
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7471
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7472
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7473
    setattribute self, 'body', $P1
.annotate 'line', 7474
    .return(self)
# }
.annotate 'line', 7475

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7478
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7479
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7480
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7482
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7485
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7486
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7487
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7489
    self.'annotate'(__ARG_1)
.annotate 'line', 7490
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7492
    $P1.'emit'(__ARG_1)
.annotate 'line', 7493
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7494
    eq $I1, 2, __label_7
.annotate 'line', 7495
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7496
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7498

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7458
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
.annotate 'line', 7509
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7510
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 7511

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7512
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7515
    self.'annotate'(__ARG_1)
.annotate 'line', 7516
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7517
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7518

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7505
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
.annotate 'line', 7529
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7530
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 7531

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7532
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7535
    self.'annotate'(__ARG_1)
.annotate 'line', 7536
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7537
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7538

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7525
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7553
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7554
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7555
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7556
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7557

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_42 = "WSubId_42"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7560
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7561
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7562
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7563
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_42(__ARG_1, self)
# builtin push
    push $P4, $P5
.annotate 'line', 7564
    $P1 = __ARG_1.'get'()
.annotate 'line', 7565
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7566
    WSubId_45("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7567
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7568
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
.annotate 'line', 7569
    __ARG_1.'unget'($P1)
.annotate 'line', 7570
    $P3 = WSubId_99(__ARG_1, self)
# builtin push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7572
    getattribute $P3, self, 'case_st'
# builtin push
    push $P3, $P2
.annotate 'line', 7573
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7576
    $P1 = __ARG_1.'get'()
.annotate 'line', 7577
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7578
    WSubId_45("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7579
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
.annotate 'line', 7580
    __ARG_1.'unget'($P1)
.annotate 'line', 7581
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_99(__ARG_1, self)
# builtin push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7583
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7586
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7587
    WSubId_45("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7588

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 7591
    getattribute $P2, self, 'case_value'
    WSubId_43($P2)
.annotate 'line', 7592
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7593
    WSubId_43($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7594
    getattribute $P2, self, 'default_st'
    WSubId_43($P2)
# }
.annotate 'line', 7595

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7545
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7547
    addattribute $P0, 'case_value'
.annotate 'line', 7548
    addattribute $P0, 'case_st'
.annotate 'line', 7549
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
.annotate 'line', 7608
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7609
    $P3 = WSubId_42(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7610
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7611
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7612
    WSubId_45("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7613
    $P1 = __ARG_2.'get'()
.annotate 'line', 7614
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7615
    WSubId_45("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7616
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7617

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7620
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7621
    self.'optimize_cases'()
.annotate 'line', 7622
    .return(self)
# }
.annotate 'line', 7623

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7627
# type: $S1
    set $S1, ''
.annotate 'line', 7628
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7629
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7630
    ne $S2, 'N', __label_4
.annotate 'line', 7631
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7632
    ne $S1, '', __label_5
.annotate 'line', 7633
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7634
    eq $S1, $S2, __label_7
.annotate 'line', 7635
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7638
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7639
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7643
    ne $S1, '', __label_8
.annotate 'line', 7644
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7646
    __ARG_1.'comment'('switch')
.annotate 'line', 7647
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7648
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7649
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7651
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7652
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7656
    self.'genbreaklabel'()
.annotate 'line', 7657
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7658
    new $P4, ['ResizableStringArray']
.annotate 'line', 7659
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7660
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7661
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7662
# builtin push
    push $P4, $S7
.annotate 'line', 7663
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7664
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7666
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7669
    self.'annotate'(__ARG_1)
.annotate 'line', 7670
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7671
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7672
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7673
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7674
    $P7 = $P6[$I2]
    WSubId_57(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7672
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7677
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7678
    getattribute $P7, self, 'default_st'
    WSubId_57(__ARG_1, $P7)
.annotate 'line', 7680
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7681

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7602
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7604
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7693
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7694
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7695

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7698
    self.'optimize_cases'()
.annotate 'line', 7699
    .return(self)
# }
.annotate 'line', 7700

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 7704
    self.'genbreaklabel'()
.annotate 'line', 7705
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7706
    new $P1, ['ResizableStringArray']
.annotate 'line', 7708
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7709
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7710
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7711
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7712
# builtin push
    push $P1, $S3
.annotate 'line', 7713
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7714
    __ARG_1.'emitif'($S2, $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7716
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7719
    self.'annotate'(__ARG_1)
.annotate 'line', 7720
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7721
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7722
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7723
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7724
    $P4 = $P3[$I2]
    WSubId_57(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7722
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7727
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7728
    getattribute $P4, self, 'default_st'
    WSubId_57(__ARG_1, $P4)
.annotate 'line', 7730
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7731

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7688
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
.annotate 'line', 7738
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7739
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7740
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7741
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7742
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7743
    WSubId_45("'(' in switch", $P1)
# }
.annotate 'line', 7744

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
.annotate 'line', 7757
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7758
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7759
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7760
    __ARG_2.'unget'($P1)
.annotate 'line', 7761
    $P3 = WSubId_99(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7763
    $P1 = __ARG_2.'get'()
.annotate 'line', 7764
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7765
    __ARG_2.'unget'($P1)
.annotate 'line', 7766
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7767
    WSubId_59(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7769
    $P1 = __ARG_2.'get'()
.annotate 'line', 7770
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7771
    __ARG_2.'unget'($P1)
.annotate 'line', 7772
    $P3 = WSubId_42(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7773
    WSubId_59(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7775
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7776

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7779
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7780
    if_null $P1, __label_1
.annotate 'line', 7781
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7782
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7783
    self.'optimize_condition'()
.annotate 'line', 7784
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7785
    if_null $P1, __label_4
.annotate 'line', 7786
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7788
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7791
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7792
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7793
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7794
    .return(self)
# }
.annotate 'line', 7795

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7798
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7799
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7800
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7801
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7802
    .return()
# }
  __label_1: # endif
.annotate 'line', 7804
    __ARG_1.'comment'('for loop')
.annotate 'line', 7805
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7806
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7807
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7808
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7809
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7811
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7812
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7813
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7815
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7816
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7817
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7818
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7819
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7821
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7822

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7750
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7752
    addattribute $P0, 'initializer'
.annotate 'line', 7753
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
.annotate 'line', 7837
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7838
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7839
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7840
# deftype: $S2
    $P1 = WSubId_101(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7841
    self.'createvar'($S1, $S2)
.annotate 'line', 7842
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7844
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7845
    $P2 = WSubId_42(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7846
    WSubId_59(')', __ARG_2)
.annotate 'line', 7847
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7848

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7851
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7855
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7856
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7857
    $P2 = $P1.'get_value'()
    set $S1, $P2
# builtin length
    length $I2, $S1
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7858
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7860
    setattribute self, 'container', $P1
.annotate 'line', 7861
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7862
    .return(self)
# }
.annotate 'line', 7863

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 7866
    self.'annotate'(__ARG_1)
.annotate 'line', 7867
# regcont: $S1
    null $S1
.annotate 'line', 7868
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7869
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7870
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7871
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7874
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7876
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7877
    unless_null $P1, __label_4
.annotate 'line', 7878
    getattribute $P2, self, 'varname'
    WSubId_66($P2)
  __label_4: # endif
.annotate 'line', 7880
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7881
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7882
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7883
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7884
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7885
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7886
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7887
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7888
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7889
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7890
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7891
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7892

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7829
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7831
    addattribute $P0, 'deftype'
.annotate 'line', 7832
    addattribute $P0, 'varname'
.annotate 'line', 7833
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
.annotate 'line', 7899
    WSubId_59('(', __ARG_2)
.annotate 'line', 7900
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7901
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7902
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7903
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7905
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7906
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7907
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7908
    __ARG_2.'unget'($P3)
.annotate 'line', 7909
    __ARG_2.'unget'($P2)
.annotate 'line', 7910
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7912
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7913

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7925
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7926
    $P2 = WSubId_42(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7927

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7930
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7931
    .return(self)
# }
.annotate 'line', 7932

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7935
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7936
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7937
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7938
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7940
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7943
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7946
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7948

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7919
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7921
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7960
    setattribute self, 'start', __ARG_1
.annotate 'line', 7961
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7962

.end # TryModifierList


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 7965
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 7966

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7969
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7970
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7971
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7972
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7973
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
.annotate 'line', 7976
    eq $I1, 1, __label_11
.annotate 'line', 7977
    WSubId_1('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 7978
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7979
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_12
    set $S2, $P7
  __label_12:
.annotate 'line', 7980
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7984
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7985
# i: $I2
    null $I2
  __label_15: # for condition
    ge $I2, $I1, __label_14
# {
.annotate 'line', 7986
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7987
    $P7 = $P5.'emit_get'(__ARG_1)
# builtin push
    push $P4, $P7
# }
  __label_13: # for iteration
.annotate 'line', 7985
    inc $I2
    goto __label_15
  __label_14: # for end
.annotate 'line', 7990
# builtin join
    join $S3, ', ', $P4
.annotate 'line', 7989
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_10: # case
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7995
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    WSubId_1($S4, $P7)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7998

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7955
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7957
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
.annotate 'line', 8010
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8011
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8012
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8013
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 8015
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 8017
    $P3 = WSubId_99(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 8018
    $P1 = __ARG_2.'get'()
.annotate 'line', 8019
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 8020
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 8021
    $P1 = __ARG_2.'get'()
.annotate 'line', 8022
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8023
    WSubId_45("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 8024
    $P1 = __ARG_2.'get'()
.annotate 'line', 8025
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 8026
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 8027
    setattribute self, 'exname', $P1
.annotate 'line', 8028
    self.'createvar'($S1, 'P')
.annotate 'line', 8029
    $P1 = __ARG_2.'get'()
.annotate 'line', 8030
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 8031
    WSubId_45("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 8033
    $P3 = WSubId_99(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 8034

.end # TryStatement


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8037
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8038
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8040
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 8041

.end # allowtailcall


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8044
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8045
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 8046
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 8047
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 8048
    .return(self)
# }
.annotate 'line', 8049

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8052
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8053
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8054
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 8055
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 8056
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 8057
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 8059
    self.'annotate'(__ARG_1)
.annotate 'line', 8060
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 8062
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 8063
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 8065
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 8066
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 8068
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 8069
    __ARG_1.'comment'('try: begin')
.annotate 'line', 8070
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8071
    __ARG_1.'comment'('try: end')
.annotate 'line', 8072
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8074
    self.'annotate'(__ARG_1)
.annotate 'line', 8075
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8077
    __ARG_1.'comment'('catch')
.annotate 'line', 8078
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 8079
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 8080
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 8081
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8082
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8084
    __ARG_1.'comment'('catch end')
.annotate 'line', 8085
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 8086

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 8001
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8003
    addattribute $P0, 'stry'
.annotate 'line', 8004
    addattribute $P0, 'modifiers'
.annotate 'line', 8005
    addattribute $P0, 'exname'
.annotate 'line', 8006
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
.annotate 'line', 8099
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8100
    setattribute self, 'name', __ARG_3
.annotate 'line', 8101
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 8102
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8103

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 8093
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8095
    addattribute $P0, 'name'
.annotate 'line', 8096
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
.annotate 'line', 8118
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8119
    setattribute self, 'name', __ARG_3
.annotate 'line', 8120
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 8121
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 8122
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8123

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 8110
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8112
    addattribute $P0, 'name'
.annotate 'line', 8113
    addattribute $P0, 'basetype'
.annotate 'line', 8114
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
.annotate 'line', 8134
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 8135
# var t: $P1
    $P1 = __ARG_5.'get'()
.annotate 'line', 8136
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8138
    $P4 = WSubId_42(__ARG_5, self)
    setattribute self, 'init', $P4
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8141
    __ARG_5.'unget'($P1)
  __label_2: # endif
# }
.annotate 'line', 8142

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8145
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8146
    if_null $P1, __label_1
.annotate 'line', 8147
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8148
    .return(self)
# }
.annotate 'line', 8149

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8152
    self.'annotate'(__ARG_1)
.annotate 'line', 8153
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8154
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8155
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 8156
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8157
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 8159
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 8160
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8162
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 8163
    ne $S4, $S3, __label_8
.annotate 'line', 8164
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8166
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 8168
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 8171
# ireg: $S5
    null $S5
# switch
.annotate 'line', 8172
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 8174
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 8176
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 8179
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 8180
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 8182
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 8183
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 8184
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8185
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 8186
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 8187
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 8190
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 8194

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8128
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8130
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
.annotate 'line', 8209
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 8210
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 8211
# var t: $P1
    $P1 = __ARG_6.'get'()
.annotate 'line', 8212
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8214
    __ARG_6.'unget'($P1)
.annotate 'line', 8215
    $P3 = WSubId_42(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 8216
    WSubId_59(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 8218
    $P1 = __ARG_6.'get'()
.annotate 'line', 8219
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 8220
    $P1 = __ARG_6.'get'()
.annotate 'line', 8221
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8222
    WSubId_45("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 8223
    $P1 = __ARG_6.'get'()
.annotate 'line', 8224
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 8225
    __ARG_6.'unget'($P1)
.annotate 'line', 8226
    $P3 = WSubId_41(__ARG_6, self, WSubId_42, ']')
    setattribute self, 'initarray', $P3
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 8230
    __ARG_6.'unget'($P1)
  __label_3: # endif
# }
.annotate 'line', 8231

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 8234
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8235
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8236
    getattribute $P1, self, 'initarray'
    WSubId_43($P1)
.annotate 'line', 8237
    .return(self)
# }
.annotate 'line', 8238

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8241
    self.'annotate'(__ARG_1)
.annotate 'line', 8243
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 8244
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 8245
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 8246
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 8247
# arraytype: $S1
# builtin string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S5, $S4, 'Array'
    set $S1, $S5
.annotate 'line', 8248
    if_null $P2, __label_1
# {
.annotate 'line', 8250
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 8251
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8255
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 8257
    if_null $P3, __label_4
# {
.annotate 'line', 8258
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 8259
# n: $I1
# builtin elements
    elements $I1, $P3
.annotate 'line', 8260
    unless_null $P2, __label_6
# {
.annotate 'line', 8261
    unless $I1 goto __label_7
# {
.annotate 'line', 8263
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 8266
# i: $I2
    null $I2
.annotate 'line', 8267
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 8268
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 8269
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 8270
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 8273

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8199
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8201
    addattribute $P0, 'size'
.annotate 'line', 8202
    addattribute $P0, 'initarray'
.annotate 'line', 8203
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
.annotate 'line', 8280
# var next: $P1
    null $P1
.annotate 'line', 8281
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 8282
# {
.annotate 'line', 8283
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 8284
    WSubId_98($P3)
.annotate 'line', 8285
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8286
# var item: $P5
    null $P5
.annotate 'line', 8287
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8288
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8290
    __ARG_4.'unget'($P4)
.annotate 'line', 8291
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 8293
    $P2 = WSubId_102($P2, $P5)
.annotate 'line', 8294
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 8295
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8296
    WSubId_4(';', $P1)
.annotate 'line', 8297
    .return($P2)
# }
.annotate 'line', 8298

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8306
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 8307

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8302
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
.annotate 'line', 8314
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 8315

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8310
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
.annotate 'line', 8321
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8322

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8326
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8327

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
.annotate 'line', 8331
    .tailcall WSubId_103(WSubId_104, WSubId_105, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8332

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8340
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 8341

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8336
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
.annotate 'line', 8348
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 8349

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8344
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
.annotate 'line', 8355
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8356

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8360
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8361

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
.annotate 'line', 8365
    .tailcall WSubId_103(WSubId_106, WSubId_107, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8366

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8374
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 8375

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8370
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
.annotate 'line', 8382
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 8383

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8378
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
.annotate 'line', 8389
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8390

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8394
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8395

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
.annotate 'line', 8399
    .tailcall WSubId_103(WSubId_108, WSubId_109, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8400

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
.annotate 'line', 8416
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8417
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8418
    setattribute self, 'name', __ARG_4
.annotate 'line', 8419
    setattribute self, 'value', __ARG_5
.annotate 'line', 8420
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8421

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8424
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8425
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8426
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8427
    $P1 = $P1.'optimize'()
.annotate 'line', 8428
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8429
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8432
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8433
    .return(self)
# }
.annotate 'line', 8434

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8437
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8438

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8441
# builtin string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8442

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8406
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8408
    addattribute $P0, 'type'
.annotate 'line', 8409
    addattribute $P0, 'name'
.annotate 'line', 8410
    addattribute $P0, 'data'
.annotate 'line', 8411
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
.annotate 'line', 8447
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8448
# type: $S1
    $P5 = WSubId_101($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8449
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8450
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8452
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8453
# {
.annotate 'line', 8454
    $P1 = __ARG_2.'get'()
.annotate 'line', 8455
# var name: $P3
    set $P3, $P1
.annotate 'line', 8456
    WSubId_59('=', __ARG_2)
.annotate 'line', 8457
# var value: $P4
    $P4 = WSubId_42(__ARG_2, __ARG_3)
.annotate 'line', 8459
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8458
    $P2 = WSubId_102($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8460
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8461
    .return($P2)
# }
.annotate 'line', 8462

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
.annotate 'line', 8473
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8474
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8475
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8476
    $P4 = WSubId_42(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8477
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8479
    WSubId_4(';', $P1)
# }
.annotate 'line', 8480

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8483
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8484
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8485
    .return(self)
# }
.annotate 'line', 8486

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8489
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8490

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8493
    self.'annotate'(__ARG_1)
.annotate 'line', 8494
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8495
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8496
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8497
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8498
    if_null $P1, __label_3
.annotate 'line', 8499
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8500
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8501
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8502
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
.annotate 'line', 8504
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8505
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8507
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8512
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8513
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8516
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8518
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8522
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8523

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8468
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8470
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
.annotate 'line', 8530
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8531
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 8532

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8535
    self.'annotate'(__ARG_1)
.annotate 'line', 8536
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8537
# builtin string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8538
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8539

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8526
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
.annotate 'line', 8548
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8549
    $P2 = WSubId_42(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8550
    WSubId_59(']', __ARG_2)
.annotate 'line', 8551
    WSubId_59(';', __ARG_2)
# }
.annotate 'line', 8552

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8555
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8556
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8557

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8560
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8561
    self.'annotate'(__ARG_1)
.annotate 'line', 8562
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8563
# builtin string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8564
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8565

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8542
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8544
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
.annotate 'line', 8570
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8571
    WSubId_98($P1)
.annotate 'line', 8572
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8573
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8574
    $P2 = __ARG_2.'get'()
.annotate 'line', 8575
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8576
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8578
    __ARG_2.'unget'($P2)
.annotate 'line', 8579
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
.annotate 'line', 8583
    __ARG_2.'unget'($P2)
.annotate 'line', 8584
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8586

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 8590
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8591
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8592
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8593
    .tailcall WSubId_51(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8594

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
.annotate 'line', 8607
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8608
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8609
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8610
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8611
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8612
    __ARG_2.'unget'($P1)
.annotate 'line', 8613
# var c: $P2
    $P2 = WSubId_99(__ARG_2, self)
.annotate 'line', 8614
    unless_null $P2, __label_3
.annotate 'line', 8615
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8616
    getattribute $P3, self, 'statements'
# builtin push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8618
    setattribute self, 'end', $P1
# }
.annotate 'line', 8619

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8622
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8623
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8624
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8625
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8626
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8627
    .return($S2)
# }
.annotate 'line', 8628

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8631
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8632
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8633
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8634
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8635
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8636
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8637
    $P1[$S1] = $S3
.annotate 'line', 8638
    .return($S3)
# }
.annotate 'line', 8639

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8640
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8643
    __ARG_1.'comment'('{')
.annotate 'line', 8644
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8645
    $P1.'emit'(__ARG_1)
.annotate 'line', 8646
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8648
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8649

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8600
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8602
    addattribute $P0, 'end'
.annotate 'line', 8603
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8664
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8666
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8667
    new $P1, ['ResizableStringArray']
.annotate 'line', 8668
    new $P2, ['ResizableStringArray']
.annotate 'line', 8669
    setattribute self, 'tempreg', $P1
.annotate 'line', 8670
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8671

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8674
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8675
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8676
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8677
    assign $P1, $I1
# builtin string
.annotate 'line', 8678
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8679

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8682
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8683
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8684
# reg: $S1
    null $S1
.annotate 'line', 8685
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 8686
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8688
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8689
# builtin push
    push $P2, $S1
.annotate 'line', 8690
    .return($S1)
# }
.annotate 'line', 8691

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8694
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8695
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8696
# n: $I1
# builtin elements
    elements $I1, $P2
# for loop
.annotate 'line', 8697
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8698
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8699
# builtin push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8697
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8701
    assign $P2, 0
# }
.annotate 'line', 8702

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8658
    addattribute $P0, 'type'
.annotate 'line', 8659
    addattribute $P0, 'nreg'
.annotate 'line', 8660
    addattribute $P0, 'tempreg'
.annotate 'line', 8661
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8713
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8714

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8717
# var named: $P1
    null $P1
.annotate 'line', 8718
# var slurpy: $P2
    null $P2
.annotate 'line', 8719
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8720
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8721
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8722
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8724
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8727
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8730
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8734
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8741
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8758
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8739
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8742
# setname: $S2
    null $S2
# switch
.annotate 'line', 8743
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8745
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8748
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8749
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8750
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8751
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8754
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8756
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8759
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8760
# }
.annotate 'line', 8762

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8709
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
.annotate 'line', 8773
    setattribute self, 'func', __ARG_1
.annotate 'line', 8774
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8775
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_101($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8776
    eq $S1, '', __label_2
.annotate 'line', 8777
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8779
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8780
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 8781
# argname: $S2
# builtin string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S4, '__ARG_', $S3
    set $S2, $S4
.annotate 'line', 8782
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8784
# builtin string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8785
    $P1 = __ARG_2.'get'()
.annotate 'line', 8786
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8787
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8789
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8790

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 8793
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8794
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8795
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8796
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_110($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8797
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8798
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8799
    if_null $P3, __label_3
.annotate 'line', 8800
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8801
    __ARG_1.'say'('')
# }
.annotate 'line', 8802

.end # emit


.sub 'get_type' :method
# Body
# {
.annotate 'line', 8805
    getattribute $P1, self, 'type'
    .return($P1)
# }
.annotate 'line', 8806

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8767
    addattribute $P0, 'func'
.annotate 'line', 8768
    addattribute $P0, 'name'
.annotate 'line', 8769
    addattribute $P0, 'modifiers'
.annotate 'line', 8770
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_111')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8812
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8813

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8824
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8825
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8826

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8829
# var path: $P1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 8830
# reg: $S1
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8831
    self.'annotate'(__ARG_1)
.annotate 'line', 8832
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 8833
    .return($S1)
# }
.annotate 'line', 8834

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8819
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8821
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8845
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8846

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8849
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8850
# name: $S1
    $P5 = $P1.'getname'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8852
    ne $S1, 'multi', __label_4
    goto __label_1 # continue
  __label_4: # endif
.annotate 'line', 8854
# nargmods: $I1
    $P3 = $P1.'numargs'()
    set $I1, $P3
.annotate 'line', 8855
    __ARG_1.'print'(' :', $S1)
.annotate 'line', 8856
    le $I1, 0, __label_5
# {
.annotate 'line', 8857
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8858
# iargmod: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 8859
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8860
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_9
.annotate 'line', 8861
    WSubId_1('Invalid modifier', $P2)
  __label_9: # endif
.annotate 'line', 8862
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 8863
    sub $I3, $I1, 1
    ge $I2, $I3, __label_10
.annotate 'line', 8864
    __ARG_1.'print'(", ")
  __label_10: # endif
# }
  __label_6: # for iteration
.annotate 'line', 8858
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 8866
    __ARG_1.'print'(')')
# }
  __label_5: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8869

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8841
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
.annotate 'line', 8874
# nargs: $I1
    $P4 = __ARG_2.'numargs'()
    set $I1, $P4
.annotate 'line', 8875
# var sig: $P1
    null $P1
.annotate 'line', 8876
    unless $I1 goto __label_1
# {
.annotate 'line', 8877
    root_new $P4, ['parrot';'ResizablePMCArray']
    set $P1, $P4
# for loop
.annotate 'line', 8878
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 8879
# var arg: $P2
    $P2 = __ARG_2.'getarg'($I2)
# switch-case
.annotate 'line', 8881
    $I3 = $P2.'isstringliteral'()
    if $I3 goto __label_7
.annotate 'line', 8884
    $I3 = $P2.'isidentifier'()
    if $I3 goto __label_8
.annotate 'line', 8891
    isa $I3, $P2, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    if $I3 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 8882
    $P4 = $P2.'get_value'()
# builtin push
    push $P1, $P4
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 8885
# name: $S1
    $P5 = $P2.'getName'()
    null $S1
    if_null $P5, __label_10
    set $S1, $P5
  __label_10:
.annotate 'line', 8886
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
.annotate 'line', 8887
# builtin push
    push $P1, $S1
    goto __label_12
  __label_11: # else
.annotate 'line', 8889
    getattribute $P6, $P2, 'start'
    WSubId_1("unsupported multi signature", $P6)
  __label_12: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 8892
# var key: $P3
    $P3 = $P2.'get_class_raw_key'()
.annotate 'line', 8893
    unless_null $P3, __label_16
.annotate 'line', 8894
    getattribute $P7, $P2, 'start'
    WSubId_1("class not found", $P7)
  __label_16: # endif
.annotate 'line', 8895
    isa $I5, $P3, 'ResizableStringArray'
# builtin __ASSERT__
.annotate 'line', 8896
    $P8 = WSubId_22($P3)
# builtin push
    push $P1, $P8
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 8899
    getattribute $P9, $P2, 'start'
    WSubId_1("unsupported multi signature", $P9)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 8878
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
.annotate 'line', 8903
    .return($P1)
# }
.annotate 'line', 8904

.end # multi_sig_from_multi_modifier

.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8926
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8927
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8928
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8929
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8930
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8931
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8932

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8934
    .return(self)
# }

.end # getouter


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8937
    .return(1)
# }
.annotate 'line', 8938

.end # allowtailcall


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8942
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8943
    unless_null $P1, __label_1
.annotate 'line', 8944
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8945
    .return($P1)
# }
.annotate 'line', 8946

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8949
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8950
    unless_null $P1, __label_1
.annotate 'line', 8951
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8952
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8953

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8957
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8958
    .return($I1)
# }
.annotate 'line', 8959

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_111 = "WSubId_111"
# Body
# {
.annotate 'line', 8962
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8963
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8964
    __ARG_1.'unget'($P1)
.annotate 'line', 8965
    $P3 = WSubId_41(__ARG_1, self, WSubId_111, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8967

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8971
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8972
    unless_null $P1, __label_1
.annotate 'line', 8973
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8975
# builtin push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8976

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8979
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8980
    unless_null $P1, __label_1
# {
.annotate 'line', 8982
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8985
    if_null $P1, __label_4
    iter $P5, $P1
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 8986
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8987
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8988
# builtin push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8990

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 8993
# var found: $P1
    null $P1
.annotate 'line', 8994
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8995
    $P1 = $P2.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 8996
    if_null $P1, __label_3
.annotate 'line', 8997
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8999
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9000

.end # scopesearch


.sub 'optimize' :method
.const 'Sub' WSubId_112 = "WSubId_112"
# Body
# {
.annotate 'line', 9004
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9005
    if_null $P1, __label_1
# {
.annotate 'line', 9006
# var multi: $P2
    $P2 = $P1.'pick'('multi')
.annotate 'line', 9007
    if_null $P2, __label_2
# {
.annotate 'line', 9008
    isa $I1, self, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
# builtin __ASSERT__
.annotate 'line', 9009
    self.'setmulti'()
.annotate 'line', 9010
    $P5 = WSubId_112(self, $P2)
    setattribute self, 'multi_sig', $P5
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 9013
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
.annotate 'line', 9014
    $P3.'fixnamespaces'()
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9015
    getattribute $P7, self, 'body'
    $P5 = $P7.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 9016
    .return(self)
# }
.annotate 'line', 9017

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9021
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 9022
    unless_null $P1, __label_1
.annotate 'line', 9023
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 9024
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 9025

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9028
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 9029
    unless_null $P1, __label_1
.annotate 'line', 9030
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 9031
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 9032

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9037
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 9038
# lexname: $S1
    null $S1
.annotate 'line', 9039
    if_null $P1, __label_1
.annotate 'line', 9040
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9042
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 9043
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 9044
# builtin string
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 9045
    self.'setlex'($S1, $S2)
.annotate 'line', 9046
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 9048
    .return($S1)
# }
.annotate 'line', 9049

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9053
# var store: $P1
    null $P1
# switch
.annotate 'line', 9054
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
.annotate 'line', 9056
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9058
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9060
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9062
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9064
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 9066
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9067
    .return($S1)
# }
.annotate 'line', 9068

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9071
# var store: $P1
    null $P1
# switch
.annotate 'line', 9072
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
.annotate 'line', 9074
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 9076
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9078
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9080
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9082
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 9084
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9085
    .return($S1)
# }
.annotate 'line', 9086

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 9089
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
.annotate 'line', 9090
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9091

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 9094
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# builtin string
.annotate 'line', 9095
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 9096

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9099
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 9100

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9103
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 9104

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
.annotate 'line', 9110
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 9111
    __ARG_1.'say'()
.annotate 'line', 9112
    __ARG_1.'print'(".sub ")
.annotate 'line', 9113
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 9114
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 9116
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 9117
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 9118
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 9119
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 9120
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 9121
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 9122
    if_null $P2, __label_6
.annotate 'line', 9123
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 9127
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 9128
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 9129
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9130
    if_null $P3, __label_8
.annotate 'line', 9131
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 9133
    ne $S1, 'main', __label_10
.annotate 'line', 9134
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 9136
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 9137
    __ARG_1.'say'()
.annotate 'line', 9140
    getattribute $P8, self, 'params'
    WSubId_57(__ARG_1, $P8)
.annotate 'line', 9142
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 9143
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 9144
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 9145
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 9147
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 9148
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 9150
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 9151
# builtin substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 9152
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 9153
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 9157
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 9159
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 9162
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 9163
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 9164
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 9166
    __ARG_1.'comment'('Body')
.annotate 'line', 9167
    $P6.'emit'(__ARG_1)
.annotate 'line', 9168
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 9170
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9173
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 9174
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 9175

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8906
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8908
    addattribute $P0, 'name'
.annotate 'line', 8909
    addattribute $P0, 'subid'
.annotate 'line', 8910
    addattribute $P0, 'modifiers'
.annotate 'line', 8911
    addattribute $P0, 'params'
.annotate 'line', 8912
    addattribute $P0, 'body'
.annotate 'line', 8913
    addattribute $P0, 'regstI'
.annotate 'line', 8914
    addattribute $P0, 'regstN'
.annotate 'line', 8915
    addattribute $P0, 'regstS'
.annotate 'line', 8916
    addattribute $P0, 'regstP'
.annotate 'line', 8917
    addattribute $P0, 'nlabel'
.annotate 'line', 8918
    addattribute $P0, 'localfun'
.annotate 'line', 8919
    addattribute $P0, 'lexicals'
.annotate 'line', 8920
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8921
    addattribute $P0, 'usedsubids'
.annotate 'line', 8922
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9191
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9192
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 9193
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 9194
    self.'parse'(__ARG_2)
.annotate 'line', 9195
    new $P2, [ 'Boolean' ]
    setattribute self, 'is_multi', $P2
# }
.annotate 'line', 9196

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9198
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# builtin int
.annotate 'line', 9202
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9203

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# builtin int
.annotate 'line', 9207
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9208

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9209
    .return(0)
# }

.end # ismethod


.sub 'ismulti' :method
# Body
# {
.annotate 'line', 9213
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
.annotate 'line', 9214

.end # ismulti


.sub 'setmulti' :method
# Body
# {
.annotate 'line', 9217
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
# }
.annotate 'line', 9218

.end # setmulti


.sub 'default_multi_sig' :method
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 9221
# var multi_sig: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9222
    $P3 = self.'ismethod'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9223
# builtin push
    push $P1, "_"
  __label_1: # endif
.annotate 'line', 9224
    getattribute $P3, self, 'params'
    if_null $P3, __label_3
    iter $P4, $P3
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P2, $P4
.annotate 'line', 9225
    $P6 = $P2.'get_type'()
    $P5 = WSubId_110($P6)
# builtin push
    push $P1, $P5
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9226
    .return($P1)
# }
.annotate 'line', 9227

.end # default_multi_sig


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 9230
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9231
    setattribute self, 'name', $P1
.annotate 'line', 9232
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9233
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9234
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9235
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 9237
    WSubId_4('(', $P2)
.annotate 'line', 9238
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9240
# var path: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 9241
    $P4 = $P3.'fullname'()
    WSubId_113(self, '__FUNCTION__', $P4)
.annotate 'line', 9243
    $P2 = __ARG_1.'get'()
.annotate 'line', 9244
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9245
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9246
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9247
    .return(self)
# }
.annotate 'line', 9248

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9252
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 9253
# var multi_sig: $P1
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9254
    unless_null $P1, __label_2
.annotate 'line', 9255
    $P1 = self.'default_multi_sig'()
  __label_2: # endif
.annotate 'line', 9256
    __ARG_1.'print'(' :multi(')
.annotate 'line', 9257
# sep: $S1
    set $S1, ''
.annotate 'line', 9258
    if_null $P1, __label_4
    iter $P3, $P1
    set $P3, 0
  __label_3: # for iteration
    unless $P3 goto __label_4
    shift $S2, $P3
# {
.annotate 'line', 9259
    __ARG_1.'print'($S1, $S2)
.annotate 'line', 9260
    set $S1, ', '
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9262
    __ARG_1.'print'(')')
# }
  __label_1: # endif
# }
.annotate 'line', 9264

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9182
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9184
    addattribute $P0, 'paramnum'
.annotate 'line', 9185
    addattribute $P0, 'lexnum'
.annotate 'line', 9186
    addattribute $P0, 'is_multi'
.annotate 'line', 9187
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
.annotate 'line', 9275
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9276
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9277
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9278
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 9279
    setattribute self, 'name', $P1
.annotate 'line', 9280
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9281
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9282
    WSubId_4('{', $P2)
.annotate 'line', 9283
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9284
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 9285

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9286
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9287
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 9290
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9291
    .return(1)
  __label_1: # endif
.annotate 'line', 9292
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9293
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9294
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9295
    .return(0)
# }
.annotate 'line', 9296

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 9299
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 9300

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 9304
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 9305

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 9309
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 9310

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9313
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9314
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9315
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9317
# builtin substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9318
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9319
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9320
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 9321
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 9322
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 9323
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 9324
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9325
# flags: $I1
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 9326
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9327
    eq $S3, 'P', __label_8
.annotate 'line', 9328
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9329
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9330
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9331
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9332
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 9335
    .return(__ARG_2)
# }
.annotate 'line', 9336

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9339
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9340
    unless_null $P1, __label_1
.annotate 'line', 9341
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9342
    unless_null $P1, __label_2
# {
.annotate 'line', 9345
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9346
    unless_null $P1, __label_3
# {
.annotate 'line', 9348
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 9349
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 9350
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 9351
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9352
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9353
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9354
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 9358
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 9360
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9361
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9362
    .return($P1)
# }
.annotate 'line', 9363

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9271
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
.annotate 'line', 9374
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9375

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9376
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9370
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
.annotate 'line', 9390
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9391
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9392
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9393
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9394
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9395
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_101($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9396
    set $P1, $P2
.annotate 'line', 9397
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9398
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 9400
    setattribute self, 'name', $P1
.annotate 'line', 9401
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9402
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9403
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9404
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9406
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 9407

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9410
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9411
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9412
    if_null $P1, __label_1
# {
.annotate 'line', 9413
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 9414
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 9416

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9385
    addattribute $P0, 'name'
.annotate 'line', 9386
    addattribute $P0, 'modifiers'
.annotate 'line', 9387
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9421
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 9422

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_114 = "WSubId_114"
# Body
# {
.annotate 'line', 9429
    $P2 = WSubId_41(__ARG_1, __ARG_2, WSubId_114, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 9430

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9433
    __ARG_1.'print'('(')
.annotate 'line', 9434
# sep: $S1
    set $S1, ''
.annotate 'line', 9435
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 9436
    __ARG_1.'print'($S1)
.annotate 'line', 9437
    $P1.'emit'(__ARG_1)
.annotate 'line', 9438
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9440
    __ARG_1.'print'(')')
# }
.annotate 'line', 9441

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9426
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
.annotate 'line', 9450
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9451
    setattribute self, 'params', __ARG_3
.annotate 'line', 9452
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 9453

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9456
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9457
    .return(self)
# }
.annotate 'line', 9458

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9461
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 9462
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9463
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9464
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9465
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9466
    __ARG_1.'print'('    ')
.annotate 'line', 9467
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9468
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9469
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9470
    __ARG_1.'say'()
# }
.annotate 'line', 9471

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9444
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9446
    addattribute $P0, 'params'
.annotate 'line', 9447
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
.annotate 'line', 9488
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9489

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9490
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9494
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9495

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9484
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9503
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9504
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9505

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9506
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9510
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9511
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9512

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9498
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9500
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
.annotate 'line', 9521
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9522
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9523
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9524
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9525
    WSubId_45('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9526
    $P3 = $P2.'rawstring'()
# builtin push
    push $P1, $P3
.annotate 'line', 9527
    $P2 = __ARG_1.'get'()
.annotate 'line', 9528
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9529
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9531
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9535
    WSubId_46('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9537
# {
.annotate 'line', 9538
    $P2 = __ARG_1.'get'()
.annotate 'line', 9539
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9540
    WSubId_45('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9541
    $P3 = $P2.'rawstring'()
# builtin push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9542
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9543
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9545
    setattribute self, 'key', $P1
# }
.annotate 'line', 9546

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9547
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# builtin int
.annotate 'line', 9550
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9551

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9555
    getattribute $P2, self, 'key'
    $P1 = WSubId_22($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9556

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9515
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9517
    addattribute $P0, 'key'
.annotate 'line', 9518
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9564
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9565
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
# builtin string
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 9566
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9567
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9568
    $P2 = __ARG_1.'get'()
.annotate 'line', 9569
# builtin string
    set $S1, $P2
# builtin push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9571
    __ARG_1.'unget'($P2)
.annotate 'line', 9572
    setattribute self, 'key', $P1
# }
.annotate 'line', 9573

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9574
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9578
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9579
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9580

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9583
# var nskey: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9584
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
# }
.annotate 'line', 9585

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9589
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9590
    unless_null $P1, __label_1
# {
.annotate 'line', 9591
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9592
    getattribute $P3, self, 'key'
# builtin join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_73($S2)
  __label_3: # endif
.annotate 'line', 9593
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9595
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9596

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9599
# var nskey: $P1
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 9600
    unless_null $P1, __label_1
# {
.annotate 'line', 9601
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9602
    getattribute $P3, self, 'key'
# builtin join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_73($S2)
  __label_3: # endif
.annotate 'line', 9603
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'say'("new ", __ARG_3, ", ", $P2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9606
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 9608

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9559
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9561
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9613
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9614
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9615
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9616
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9617
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9618
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9619
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9620
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9621

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9633
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9634
    setattribute self, 'name', __ARG_2
.annotate 'line', 9635
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 9636
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9637

.end # ClassBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9640
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9641

.end # getpath


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 9644
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
# }
.annotate 'line', 9645

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9627
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9629
    addattribute $P0, 'name'
.annotate 'line', 9630
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
.annotate 'line', 9658
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9659
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9660
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9661
    setattribute self, 'functions', $P1
.annotate 'line', 9662
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9663
    setattribute self, 'members', $P2
.annotate 'line', 9664
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9665
    setattribute self, 'constants', $P3
.annotate 'line', 9666
# var seen_functions: $P4
    root_new $P4, ['parrot';'Hash']
.annotate 'line', 9668
# var t: $P5
    $P5 = __ARG_4.'get'()
.annotate 'line', 9669
    $P10 = $P5.'isop'(':')
    if_null $P10, __label_1
    unless $P10 goto __label_1
# {
.annotate 'line', 9670
    $P12 = WSubId_41(__ARG_4, self, WSubId_67)
    setattribute self, 'bases', $P12
.annotate 'line', 9671
    $P5 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9673
    WSubId_4('{', $P5)
.annotate 'line', 9675
    getattribute $P11, self, 'classns'
    $P10 = $P11.'fullname'()
    WSubId_113(self, '__CLASS__', $P10)
# for loop
.annotate 'line', 9677
    $P5 = __ARG_4.'get'()
  __label_4: # for condition
    $P10 = $P5.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9678
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
.annotate 'line', 9680
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P6.'MethodStatement'($P5, __ARG_4, self)
.annotate 'line', 9681
# builtin push
    push $P1, $P6
.annotate 'line', 9682
# var first_func: $P7
    getattribute $P12, $P6, 'name'
    $P7 = $P4[$P12]
.annotate 'line', 9683
    unless_null $P7, __label_10
.annotate 'line', 9684
    getattribute $P13, $P6, 'name'
    $P4[$P13] = $P6
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 9686
    $P7.'setmulti'()
.annotate 'line', 9687
    $P6.'setmulti'()
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9691
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 9692
    $P10 = $P8.'isidentifier'()
    isfalse $I1, $P10
    unless $I1 goto __label_12
.annotate 'line', 9693
    WSubId_45("member identifier", $P8)
  __label_12: # endif
.annotate 'line', 9694
# builtin push
    push $P2, $P8
.annotate 'line', 9695
    $P5 = __ARG_4.'get'()
.annotate 'line', 9696
    $P11 = $P5.'isop'(';')
    isfalse $I2, $P11
    unless $I2 goto __label_13
.annotate 'line', 9697
    WSubId_45("';' in member declaration", $P5)
  __label_13: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9700
# var cst: $P9
    $P9 = WSubId_49($P5, __ARG_4, self)
.annotate 'line', 9701
# builtin push
    push $P3, $P9
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9704
    WSubId_46("item in class", $P5)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9677
    $P5 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9707

.end # ClassStatement


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9710
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9711

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9714
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9715

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9718
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9719

.end # scopesearch


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9722
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_builtin'(__ARG_1)
# }
.annotate 'line', 9723

.end # use_builtin


.sub 'optimize' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 9726
    getattribute $P1, self, 'constants'
    WSubId_43($P1)
.annotate 'line', 9727
    getattribute $P1, self, 'functions'
    WSubId_43($P1)
.annotate 'line', 9728
    .return(self)
# }
.annotate 'line', 9729

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9732
    getattribute $P3, self, 'classns'
    $P3.'emitnamespace'(__ARG_1)
.annotate 'line', 9733
    getattribute $P3, self, 'functions'
    WSubId_57(__ARG_1, $P3)
.annotate 'line', 9735
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9737
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 9738
# n: $I1
    set $I1, 1
.annotate 'line', 9739
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 9740
    $P1.'annotate'(__ARG_1)
.annotate 'line', 9741
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9742
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9743
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 9744
    __ARG_1.'say'()
.annotate 'line', 9745
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9747
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 9748
    __ARG_1.'annotate'($P2)
.annotate 'line', 9749
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9752
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9753

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9648
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9650
    addattribute $P0, 'parent'
.annotate 'line', 9651
    addattribute $P0, 'bases'
.annotate 'line', 9652
    addattribute $P0, 'constants'
.annotate 'line', 9653
    addattribute $P0, 'functions'
.annotate 'line', 9654
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9760
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9761

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9764
    .return(self)
# }
.annotate 'line', 9765

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9756
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
.annotate 'line', 9773
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9774
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9775
# var nskey: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9776
# var ns: $P4
    null $P4
# for loop
  __label_3: # for condition
.annotate 'line', 9778
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
# {
.annotate 'line', 9779
    $P3.'push'($P1)
.annotate 'line', 9780
    $P1 = __ARG_2.'get'()
# }
  __label_1: # for iteration
.annotate 'line', 9778
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9783
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 9784
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 9785
# builtin string
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 9786
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 9789
    __ARG_2.'unget'($P2)
.annotate 'line', 9790
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 9791
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9792
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
# }
  __label_5: # endif
# }
.annotate 'line', 9794

.end # parseClass


.sub 'open_include' :subid('WSubId_115')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9802
# var interp: $P1
# builtin getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9807
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9808
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9809
# var file: $P4
    null $P4
.annotate 'line', 9810
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9811
# filepath: $S2
    concat $S3, $S1, __ARG_1
    set $S2, $S3
.annotate 'line', 9812
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9813
# builtin open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9814
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 9815
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9812
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
.annotate 'line', 9820
    isnull $I1, $P4
    if $I1 goto __label_8
    $I1 = $P4.'is_closed'()
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 9821
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 9822
    $P4.'encoding'("utf8")
.annotate 'line', 9823
    .return($P4)
# }
.annotate 'line', 9824

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
.annotate 'line', 9828
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9829
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9830
    WSubId_45('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9831
    WSubId_59(';', __ARG_2)
.annotate 'line', 9833
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9834
# var file: $P2
    $P2 = WSubId_115($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9839
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
.annotate 'line', 9840
# builtin substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9841
# pos: $I1
    set $I1, 12
.annotate 'line', 9842
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9843
# builtin substr
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 9844
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9845
# pos2: $I2
    set $I2, $I1
  __label_12: # while
.annotate 'line', 9846
# builtin substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 9847
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9848
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 9849
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 9851
# name: $S4
    sub $I4, $I2, $I1
# builtin substr
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 9852
# builtin substr
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 9853
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 9854
    set $I1, $I2
  __label_22: # while
.annotate 'line', 9855
# builtin substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 9856
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 9857
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 9858
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 9860
# value: $S5
    sub $I4, $I2, $I1
# builtin substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 9862
# ivalue: $I3
    null $I3
.annotate 'line', 9863
# builtin substr
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
# builtin substr
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 9864
# builtin substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 9866
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 9867
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 9869
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 9868
    $P4 = WSubId_21(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9839
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 9873
    $P2.'close'()
# }
.annotate 'line', 9874

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
.annotate 'line', 9880
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9881
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 9882
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9883
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9884
    WSubId_45('literal string', $P1)
  __label_2: # endif
.annotate 'line', 9885
    WSubId_59(';', __ARG_2)
.annotate 'line', 9887
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 9888
# var file: $P2
    $P2 = WSubId_115($S1, __ARG_1)
.annotate 'line', 9890
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 9891
    __ARG_3.'parse'($P3)
.annotate 'line', 9893
    $P2.'close'()
# }
.annotate 'line', 9894

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
.annotate 'line', 9900
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9901
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 9902
    WSubId_63(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9903
    WSubId_59(';', __ARG_2)
.annotate 'line', 9904
    .return()
# }
  __label_1: # endif
.annotate 'line', 9906
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
# {
.annotate 'line', 9907
    __ARG_2.'unget'($P1)
.annotate 'line', 9908
# var key: $P2
    $P2 = WSubId_60(__ARG_2)
.annotate 'line', 9909
# nelems: $I1
# builtin elements
    elements $I1, $P2
.annotate 'line', 9910
    ge $I1, 1, __label_3
.annotate 'line', 9911
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 9912
    WSubId_59(';', __ARG_2)
.annotate 'line', 9913
    __ARG_3.'use'($P2)
.annotate 'line', 9914
    .return()
# }
  __label_2: # endif
.annotate 'line', 9916
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9918
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 9924
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9920
# reqlib: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 9921
    __ARG_3.'addlib'($S1)
.annotate 'line', 9922
    WSubId_59(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9925
    __ARG_2.'unget'($P1)
.annotate 'line', 9926
# var module: $P3
    $P3 = WSubId_60(__ARG_2)
.annotate 'line', 9927
    $P1 = __ARG_2.'get'()
.annotate 'line', 9928
    $P6 = $P1.'isop'(';')
    isfalse $I3, $P6
    unless $I3 goto __label_9
# {
.annotate 'line', 9929
    __ARG_2.'unget'($P1)
.annotate 'line', 9930
# var names: $P4
    null $P5
    $P4 = WSubId_41(__ARG_2, $P5, WSubId_62, ';')
.annotate 'line', 9931
    __ARG_3.'addextern'($P3, $P4)
# }
  __label_9: # endif
.annotate 'line', 9933
# reqmodule: $S2
# builtin join
    join $S3, '/', $P3
    concat $S4, '"', $S3
    concat $S4, $S4, '.pbc"'
    set $S2, $S4
.annotate 'line', 9934
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9937
    WSubId_45('string literal or identifier', $P1)
  __label_4: # switch end
# }
.annotate 'line', 9939

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9949
    setattribute self, 'module', __ARG_1
.annotate 'line', 9950
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9951

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9956
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9965
# builtin string
.annotate 'line', 9966
    getattribute $P1, self, 'module'
# builtin join
    join $S2, "'; '", $P1
    concat $S3, "['parrot'; '", $S2
    concat $S3, $S3, "']"
.annotate 'line', 9965
    __ARG_1.'emitget_root_namespace'("srcns", $S3)
.annotate 'line', 9968
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9969
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9970
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9976

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9945
    addattribute $P0, 'module'
.annotate 'line', 9946
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9986
    new $P1, ['ResizableStringArray']
.annotate 'line', 9987
    unless __ARG_2 goto __label_1
.annotate 'line', 9988
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9990
    if_null __ARG_1, __label_3
.annotate 'line', 9991
# builtin push
    push $P1, __ARG_1
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 9993
    setattribute self, 'path', $P1
# }
.annotate 'line', 9994

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9997
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 9998
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 9999
# var path: $P2
    getattribute $P3, self, 'path'
# builtin clone
    clone $P2, $P3
.annotate 'line', 10000
# builtin push
    push $P2, __ARG_1
.annotate 'line', 10001
    setattribute $P1, 'path', $P2
.annotate 'line', 10002
    .return($P1)
# }
.annotate 'line', 10003

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10006
# var fromkey: $P1
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 10007
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 10008
# var fromhll: $P3
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 10009
    unless_null $P2, __label_3
.annotate 'line', 10010
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 10012
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
# }
.annotate 'line', 10013

.end # samehllas


.sub 'fullname' :method
# Body
# {
.annotate 'line', 10016
# name: $S1
    getattribute $P1, self, 'path'
# builtin join
    join $S1, '.', $P1
.annotate 'line', 10017
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
# builtin string
.annotate 'line', 10018
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 10020
    .return($S1)
  __label_2: # endif
# }
.annotate 'line', 10021

.end # fullname


.sub 'getparrotkey' :method
# Body
# {
.annotate 'line', 10024
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10025
# r: $S1
    null $S1
.annotate 'line', 10026
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10027
# builtin string
# builtin join
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 10028
    .return($S1)
# }
.annotate 'line', 10029

.end # getparrotkey


.sub 'getparrotrootkey' :method
# Body
# {
.annotate 'line', 10032
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10033
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 10034
# r: $S1
    set $S1, "[ '"
.annotate 'line', 10035
    if_null $P2, __label_1
# {
.annotate 'line', 10038
    set $S3, $P2
# builtin downcase
    downcase $S2, $S3
    concat $S1, $S1, $S2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 10041
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 10042
    concat $S1, $S1, "'"
.annotate 'line', 10043
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 10044
# builtin string
# builtin join
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 10045
    concat $S1, $S1, " ]"
.annotate 'line', 10046
    .return($S1)
# }
.annotate 'line', 10047

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10050
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 10051
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 10052
# builtin elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 10053
# builtin join
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 10054
    __ARG_1.'say'("]")
# }
.annotate 'line', 10055

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 10058
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 10059
    __ARG_1.'print'('    ', 'new ', __ARG_3, ", ")
.annotate 'line', 10060
    $P1 = self.'getparrotkey'()
    __ARG_1.'print'($P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10063
    __ARG_1.'print'('    ', 'root_new ', __ARG_3, ", ")
.annotate 'line', 10064
    $P1 = self.'getparrotrootkey'()
    __ARG_1.'print'($P1)
# }
  __label_2: # endif
.annotate 'line', 10066
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 10067
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 10068
    __ARG_1.'say'()
# }
.annotate 'line', 10069

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 10072
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10073
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10075
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
# }
.annotate 'line', 10076

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 10079
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 10080
    $P4 = self.'getparrotkey'()
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", $P4)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10085
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10086
# var path: $P2
    getattribute $P3, self, 'path'
# builtin clone
    clone $P2, $P3
.annotate 'line', 10087
# name: $S1
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 10088
# shll: $S2
    if_null $P1, __label_5
    set $S3, $P1
# builtin downcase
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 10089
# builtin elements
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 10091
# builtin join
    join $S3, "'; '", $P2
.annotate 'line', 10090
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'; '", $S3, "'], '", $S1, "'")
    goto __label_7
  __label_6: # else
.annotate 'line', 10093
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'], '", $S1, "'")
  __label_7: # endif
.annotate 'line', 10095
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 10097

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 10100
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10101
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10103
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
# }
.annotate 'line', 10104

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 9981
    addattribute $P0, 'hll'
.annotate 'line', 9982
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_113 = "WSubId_113"
# Body
# {
.annotate 'line', 10124
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 10125
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 10126
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 10127
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10128
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 10129
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 10130
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions_name', $P2
.annotate 'line', 10131
    $P1 = __ARG_1.'fullname'()
    WSubId_113(self, '__NAMESPACE__', $P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10134
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 10135
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 10136
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10137
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 10138
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
.annotate 'line', 10139
    getattribute $P2, __ARG_2, 'functions_name'
    setattribute self, 'functions_name', $P2
# }
  __label_2: # endif
.annotate 'line', 10141
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 10142

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 10145
# var ns: $P1
    null $P1
.annotate 'line', 10146
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10147
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10148
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 10149
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 10150
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 10151

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 10154
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 10155

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10158
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 10159
    .return()
  __label_1: # endif
.annotate 'line', 10160
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10161
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 10162
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 10163
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10164
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10165

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10168
# var sym: $P1
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 10169
    if_null $P1, __label_1
# {
.annotate 'line', 10170
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 10171
    getattribute $P3, self, 'functions'
# builtin push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10174
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 10175
# var ns: $P2
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 10176
    if_null $P2, __label_5
# {
.annotate 'line', 10177
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 10178
    if_null $P1, __label_6
.annotate 'line', 10179
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 10182

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10185
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10186
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10187
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 10188
    .return($P2)
# }
.annotate 'line', 10189

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10192
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10193
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10194
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10195
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 10196

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10200
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 10201
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10202
    unless_null $P2, __label_1
.annotate 'line', 10203
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10205
# builtin push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 10206

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10210
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 10211
# var cl: $P2
    null $P2
.annotate 'line', 10212
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 10213
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10214
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10215
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 10216
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 10217
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 10218
    .return($P5)
# }
.annotate 'line', 10219

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10222
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10223
    if_null $P1, __label_1
.annotate 'line', 10224
    .return($P1)
  __label_1: # endif
.annotate 'line', 10225
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 10226
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 10227
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 10228
    .return($P2)
# }
.annotate 'line', 10229

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 10234
# keylen: $I1
# builtin elements
    elements $I1, __ARG_1
.annotate 'line', 10235
# name: $S1
    null $S1
.annotate 'line', 10236
# var sym: $P1
    null $P1
.annotate 'line', 10237
# var ns: $P2
    null $P2
# switch
.annotate 'line', 10238
    sub $I2, $I1, __ARG_3
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 10242
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
# switch
.annotate 'line', 10243
    set $I5, __ARG_2
    set $I6, 1
    if $I5 == $I6 goto __label_7
    set $I6, 2
    if $I5 == $I6 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 10245
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 10247
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 10250
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 10251
    .return($P1)
  __label_9: # endif
.annotate 'line', 10252
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 10253
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 10254
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 10261
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 10262
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 10263
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_14
.annotate 'line', 10264
    add $I8, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I8)
    isnull $I7, $P1
    not $I7
  __label_14:
    unless $I7 goto __label_13
.annotate 'line', 10265
    .return($P1)
  __label_13: # endif
.annotate 'line', 10266
    $P2 = self.'getusedns'($S1)
.annotate 'line', 10267
    isnull $I9, $P2
    not $I9
    unless $I9 goto __label_16
.annotate 'line', 10268
    add $I10, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I10)
    isnull $I9, $P1
    not $I9
  __label_16:
    unless $I9 goto __label_15
.annotate 'line', 10269
    .return($P1)
  __label_15: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 10271
    .return($P3)
# }
.annotate 'line', 10272

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 10275
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 10276
    getattribute $P2, self, 'namespaces'
# builtin push
    push $P2, $P1
.annotate 'line', 10277
    .return($P1)
# }
.annotate 'line', 10278

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 10281
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 10282
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 10283
    getattribute $P3, self, 'namespaces'
# builtin push
    push $P3, $P2
.annotate 'line', 10284
    getattribute $P3, self, 'items'
# builtin push
    push $P3, $P2
.annotate 'line', 10285
    .return($P2)
# }
.annotate 'line', 10286

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10289
    getattribute $P1, self, 'classes'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10290

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10293
    getattribute $P1, self, 'classes'
# builtin push
    push $P1, __ARG_1
.annotate 'line', 10294
    getattribute $P1, self, 'items'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10295

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 10298
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 10299
# name: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 10300
    $P1 = __ARG_2.'get'()
.annotate 'line', 10302
# var parent: $P2
    set $P2, self
# for loop
  __label_4: # for condition
.annotate 'line', 10303
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 10304
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10305
    $P5 = __ARG_2.'get'()
    set $S1, $P5
# }
  __label_2: # for iteration
.annotate 'line', 10303
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10308
# var modifier: $P3
    null $P3
.annotate 'line', 10309
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 10310
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10311
    $P1 = __ARG_2.'get'()
# }
  __label_5: # endif
.annotate 'line', 10314
    WSubId_4('{', $P1)
.annotate 'line', 10315
# var child: $P4
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10316
    $P4.'parse'(__ARG_2)
# }
.annotate 'line', 10317

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
.annotate 'line', 10320
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 10321
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 10322
# var functions_name: $P3
    getattribute $P3, self, 'functions_name'
.annotate 'line', 10323
# var classes: $P4
    getattribute $P4, self, 'classes'
.annotate 'line', 10324
# var t: $P5
    null $P5
# for loop
.annotate 'line', 10325
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
.annotate 'line', 10327
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
.annotate 'line', 10329
    self.'parsenamespace'($P5, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10332
# var cst: $P6
    $P6 = WSubId_49($P5, __ARG_1, self)
.annotate 'line', 10333
# builtin push
    push $P1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10336
# var f: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P7.'FunctionStatement'($P5, __ARG_1, self)
.annotate 'line', 10337
# name: $S1
    getattribute $P12, $P7, 'name'
    null $S1
    if_null $P12, __label_17
    set $S1, $P12
  __label_17:
.annotate 'line', 10338
# builtin push
    push $P2, $P7
.annotate 'line', 10339
# builtin push
    push $P1, $P7
.annotate 'line', 10340
# var funcs: $P8
    $P8 = $P3[$S1]
.annotate 'line', 10341
    if_null $P8, __label_18
# {
.annotate 'line', 10342
    $P7.'setmulti'()
.annotate 'line', 10343
# builtin elements
    elements $I1, $P8
    ne $I1, 1, __label_20
.annotate 'line', 10344
    $P11 = $P8[0]
    $P11.'setmulti'()
  __label_20: # endif
.annotate 'line', 10345
    $P8.'push'($P7)
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 10348
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P11[0] = $P7
    $P3[$S1] = $P11
  __label_19: # endif
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 10351
    WSubId_116($P5, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 10354
# var t1: $P9
    $P9 = __ARG_1.'get'()
.annotate 'line', 10355
    $P12 = $P9.'iskeyword'('function')
    isfalse $I1, $P12
    unless $I1 goto __label_21
.annotate 'line', 10356
    WSubId_1('Unsupported extern', $P9)
  __label_21: # endif
.annotate 'line', 10357
    $P9 = __ARG_1.'get'()
.annotate 'line', 10358
    WSubId_98($P9)
.annotate 'line', 10359
    WSubId_59(';', __ARG_1)
.annotate 'line', 10360
# var fex: $P10
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P10.'FunctionExtern'($P9, self)
.annotate 'line', 10361
# builtin push
    push $P2, $P10
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 10364
    WSubId_117($P5, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 10367
    WSubId_118($P5, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 10370
    WSubId_119($P5, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 10373
    $P5 = __ARG_1.'get'()
.annotate 'line', 10374
    $P13 = $P5.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_22
.annotate 'line', 10375
    WSubId_45('string literal', $P5)
  __label_22: # endif
.annotate 'line', 10376
    WSubId_59(';', __ARG_1)
.annotate 'line', 10377
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P5)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 10380
    $P5 = __ARG_1.'get'()
.annotate 'line', 10381
    $P17 = $P5.'isstring'()
    isfalse $I3, $P17
    unless $I3 goto __label_23
.annotate 'line', 10382
    WSubId_45('string literal', $P5)
  __label_23: # endif
.annotate 'line', 10383
    WSubId_59(';', __ARG_1)
.annotate 'line', 10384
    new $P20, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P5)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10387
    WSubId_46("token", $P5)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 10325
    $P5 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10390
    $P11 = $P5.'iseof'()
    if_null $P11, __label_24
    unless $P11 goto __label_24
.annotate 'line', 10391
    self.'unclosed_ns'()
    goto __label_25
  __label_24: # else
.annotate 'line', 10393
    self.'close_ns'($P5)
  __label_25: # endif
# }
.annotate 'line', 10394

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 10397
    getattribute $P1, self, 'items'
    WSubId_43($P1)
# }
.annotate 'line', 10398

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 10401
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 10403
# activate: $I1
    set $I1, 1
.annotate 'line', 10405
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10406
    if_null $P2, __label_1
# {
.annotate 'line', 10407
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10408
    null $I1
.annotate 'line', 10409
    WSubId_57(__ARG_1, $P2)
# }
  __label_1: # endif
.annotate 'line', 10412
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
# {
.annotate 'line', 10413
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 10414
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 10415
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10417
    unless $I1 goto __label_7
# {
.annotate 'line', 10418
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10419
    null $I1
# }
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10421
    $P3.'emit'(__ARG_1)
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 10423

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 10111
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 10113
    addattribute $P0, 'nspath'
.annotate 'line', 10114
    addattribute $P0, 'externals'
.annotate 'line', 10115
    addattribute $P0, 'namespaces'
.annotate 'line', 10116
    addattribute $P0, 'classes'
.annotate 'line', 10117
    addattribute $P0, 'functions'
.annotate 'line', 10118
    addattribute $P0, 'functions_name'
.annotate 'line', 10119
    addattribute $P0, 'items'
.annotate 'line', 10120
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
.annotate 'line', 10441
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10442
# is_hll: $I1
    null $I1
.annotate 'line', 10443
    if_null __ARG_5, __label_1
# {
.annotate 'line', 10444
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
# {
.annotate 'line', 10445
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 10446
    set $I1, 1
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 10449
# var nspath: $P1
    unless $I1 goto __label_4
.annotate 'line', 10450
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 10451
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 10452
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10454
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10455
    setattribute self, 'start', __ARG_2
.annotate 'line', 10456
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10457
    box $P2, __ARG_4
    setattribute self, 'name', $P2
# }
.annotate 'line', 10458

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10461
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10462

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10465
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 10466

.end # generatesubid


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10469
    getattribute $P1, self, 'owner'
    $P1.'use_builtin'(__ARG_1)
# }
.annotate 'line', 10470

.end # use_builtin


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10473
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 10474

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10477
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 10478

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10481
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10482
    unless_null $P1, __label_1
.annotate 'line', 10483
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10484
    .return($P1)
# }
.annotate 'line', 10485

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10488
# var sym: $P1
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10489
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10490
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10491
    .return($P1)
# }
.annotate 'line', 10492

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10495
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 10496

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10503
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 10504
    if_null $P1, __label_1
.annotate 'line', 10505
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10506
    self.'optimize_base'()
.annotate 'line', 10507
    .return(self)
# }
.annotate 'line', 10508

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10511
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10512
    if_null $P1, __label_1
.annotate 'line', 10513
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 10515
    self.'emit_base'(__ARG_1)
.annotate 'line', 10517
    if_null $P1, __label_2
.annotate 'line', 10518
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 10519

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10430
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10432
    addattribute $P0, 'parent'
.annotate 'line', 10433
    addattribute $P0, 'start'
.annotate 'line', 10434
    addattribute $P0, 'name'
.annotate 'line', 10435
    addattribute $P0, 'modifier'
.annotate 'line', 10436
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10536
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10537
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10538
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'bultins_used', $P2
.annotate 'line', 10539
    box $P1, 0
    setattribute self, 'subidgen', $P1
# }
.annotate 'line', 10540

.end # RootNamespace


.sub 'use_builtin' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10543
# var bultins_used: $P1
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 10544
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10545

.end # use_builtin


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10549
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# builtin string
.annotate 'line', 10550
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 10551

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10555
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 10556
    unless_null $P1, __label_1
.annotate 'line', 10557
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10558
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10559

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10562
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 10563
    unless_null $P1, __label_1
.annotate 'line', 10564
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10565
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10566

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10569
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 10570

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10573
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 10574

.end # scopesearch


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10581
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 10582

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10585
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10586

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10589
    self.'optimize_base'()
.annotate 'line', 10590
    .return(self)
# }
.annotate 'line', 10591

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10594
# var bultins_used: $P1
    getattribute $P1, self, 'bultins_used'
.annotate 'line', 10597
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10598
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10601
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
.annotate 'line', 10604
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10605
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10606
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10607
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10610
# somelib: $I1
    null $I1
.annotate 'line', 10611
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10612
    if_null $P3, __label_5
# {
.annotate 'line', 10613
    set $I1, 1
.annotate 'line', 10614
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10615
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10618
# someload: $I2
    null $I2
.annotate 'line', 10619
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10620
    if_null $P4, __label_8
# {
.annotate 'line', 10621
    set $I2, 1
.annotate 'line', 10622
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10623
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10624
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10625
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10627
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10628
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10630
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10631

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10634
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10635
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10636
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10637
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 10638
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 10639
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10641
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10642
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10644

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10526
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10528
    addattribute $P0, 'unit'
.annotate 'line', 10529
    addattribute $P0, 'bultins_used'
.annotate 'line', 10530
    addattribute $P0, 'libs'
.annotate 'line', 10531
    addattribute $P0, 'loads'
.annotate 'line', 10532
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10656
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10657
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10658

.end # Builtin


.sub 'getname' :method
# Body
# {
# builtin string
.annotate 'line', 10659
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10662
    getattribute $P1, self, 'variants'
# builtin push
    push $P1, __ARG_1
# }
.annotate 'line', 10663

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10652
    addattribute $P0, 'name'
.annotate 'line', 10653
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
# Body
# {
.annotate 'line', 10673
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
# }
.annotate 'line', 10674

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10677
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10678
# name: $S1
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10679
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 10680
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 10682
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
# }
.annotate 'line', 10683

.end # add


.sub 'put' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10686
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10687
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10688
    getattribute $P3, __ARG_1, 'functions'
    $P4 = $P1[$S1]
# builtin push
    push $P3, $P4
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10689

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 10670
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
.annotate 'line', 10699
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 10700
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10704
    WSubId_120($P1, 'false', 0)
.annotate 'line', 10705
    WSubId_120($P1, 'true', 1)
.annotate 'line', 10710
    WSubId_113($P1, '__STAGE__', "3")
.annotate 'line', 10713
    WSubId_120($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 10716
    WSubId_120($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10719
# var builtins_ns: $P2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 10721
# var builder: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 10722
    WSubId_121($P3)
.annotate 'line', 10723
    $P3.'put'($P2)
.annotate 'line', 10725
    $P1.'usenamespace'($P2)
.annotate 'line', 10727
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10728

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# builtin int
.annotate 'line', 10731
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10732

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10735
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10736
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10737

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10740
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10741

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10744
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10745
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10746
    __ARG_1.'say'('')
.annotate 'line', 10748
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10750
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10751

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10754
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10755
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10757
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10759
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10760

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10694
    addattribute $P0, 'rootns'
.annotate 'line', 10695
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
# Body
# {
.annotate 'line', 10769
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 3
    $P1[1] = $I1
    null $I1
    $P1[2] = $I1
.annotate 'line', 10770
    .return($P1)
# }
.annotate 'line', 10771

.end # version


.sub 'version_string' :method
# Body
# {
# builtin string
.annotate 'line', 10774
    $P1 = self.'version'()
# builtin join
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
# }
.annotate 'line', 10775

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 10778
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10779
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10780
# var handleout: $P1
    null $P1
.annotate 'line', 10781
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10782
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10783
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10786
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10787
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10788
    unless __ARG_4 goto __label_4
.annotate 'line', 10789
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 10790
    unless __ARG_5 goto __label_5
.annotate 'line', 10791
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 10792
    __ARG_1.'emit'($P2)
.annotate 'line', 10793
    $P2.'close'()
.annotate 'line', 10794
    if_null __ARG_3, __label_6
.annotate 'line', 10795
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 10797
    $P1.'close'()
.annotate 'line', 10798
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 10799
# var object: $P3
    null $P3
# switch
.annotate 'line', 10800
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_11
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_12
    set $S3, ''
    if $S2 == $S3 goto __label_13
    goto __label_10
  __label_11: # case
.annotate 'line', 10802
    new $P3, [ 'String' ]
.annotate 'line', 10803
    assign $P3, $S1
    goto __label_9 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 10807
# var pircomp: $P4
# builtin compreg
    compreg $P4, 'PIR'
.annotate 'line', 10808
    $P3 = $P4($S1)
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 10809
# builtin string
.annotate 'line', 10811
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# builtin die
    die $S5
  __label_9: # switch end
.annotate 'line', 10813
    .return($P3)
# }
  __label_7: # endif
# }
.annotate 'line', 10815

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10818
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10819
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10820
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10821
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10822
    $P2.'close'()
.annotate 'line', 10823
    $P1.'close'()
.annotate 'line', 10824
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10825

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
.annotate 'line', 10833
    unless_null __ARG_2, __label_1
.annotate 'line', 10834
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10835
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10836
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10837
    $P1.'puts'(__ARG_1)
.annotate 'line', 10838
    $P1.'close'()
.annotate 'line', 10839
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10840
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10841
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10842
    $P3.'parse'($P2)
.annotate 'line', 10843
    $P1.'close'()
.annotate 'line', 10844
    $P3.'optimize'()
.annotate 'line', 10845
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10846
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10848
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10849

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
.annotate 'line', 10858
    unless_null __ARG_2, __label_1
.annotate 'line', 10859
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10860
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10861
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10862
    $P1.'encoding'('utf8')
.annotate 'line', 10863
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10864
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10865
    $P3.'parse'($P2)
.annotate 'line', 10866
    $P1.'close'()
.annotate 'line', 10867
    $P3.'optimize'()
.annotate 'line', 10868
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10869
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10871
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10872

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10881
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10882
# builtin compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10883

.end # initializer

# End generated code
