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

# Constant WINXED_ERROR evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]

.sub 'WinxedCompilerError' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 71
    box $P1, __ARG_1
    setattribute self, 'type', $P1
.annotate 'line', 72
    box $P1, __ARG_2
    setattribute self, 'message', $P1
.annotate 'line', 73
    box $P1, __ARG_3
    setattribute self, 'filename', $P1
.annotate 'line', 74
    box $P1, __ARG_4
    setattribute self, 'line', $P1
# }
.annotate 'line', 75

.end # WinxedCompilerError

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
.annotate 'line', 60
    addattribute $P0, 'type'
.annotate 'line', 61
    addattribute $P0, 'filename'
.annotate 'line', 62
    addattribute $P0, 'line'
.annotate 'line', 63
    addattribute $P0, 'message'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'Warn' :subid('WSubId_67')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 80
# var stderr: $P1
# predefined getstderr
    getstderr $P1
.annotate 'line', 81
    $P1.'print'('WARNING: ')
.annotate 'line', 82
    $P1.'print'(__ARG_1)
.annotate 'line', 83
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 84
    $P1.'print'(' near ')
.annotate 'line', 85
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
  __label_1: # endif
.annotate 'line', 87
    $P1.'print'("\n")
# }
.annotate 'line', 88

.end # Warn


.sub 'InternalError' :subid('WSubId_6')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 92
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 93
# desc: $S1
    $P2 = __ARG_2.'show'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 94
    concat $S0, __ARG_1, ' near '
    concat $S0, $S0, $S1
    set __ARG_1, $S0
# }
  __label_1: # endif
.annotate 'line', 96
# var payload: $P1
    unless __ARG_3 goto __label_4
.annotate 'line', 97
    new $P2, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P2.'WinxedCompilerError'('internal', __ARG_1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 98
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    $P4 = __ARG_2.'filename'()
    $P5 = __ARG_2.'linenum'()
    $P3.'WinxedCompilerError'('internal', __ARG_1, $P4, $P5)
    set $P1, $P3
  __label_3:
.annotate 'line', 99
# predefined Error
    root_new $P2, ['parrot';'Exception']
    $P2['message'] = __ARG_1
    $P2['severity'] = 2
    $P2['type'] = 567
    $P2['payload'] = $P1
    throw $P2
# }
.annotate 'line', 100

.end # InternalError


.sub 'TokenError' :subid('WSubId_7')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 104
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
.annotate 'line', 106
    new $P4, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    getattribute $P5, __ARG_2, 'filename'
    $P4.'WinxedCompilerError'('tokenizer', __ARG_1, $P5, __ARG_3)
    set $P3, $P4
# predefined Error
.annotate 'line', 104
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P3
    throw $P1
# }
.annotate 'line', 107

.end # TokenError


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 111
# line: $I1
    $P1 = __ARG_2.'linenum'()
    set $I1, $P1
.annotate 'line', 112
# file: $S1
    $P1 = __ARG_2.'filename'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 113
# desc: $S2
# predefined string
    $P1 = __ARG_2.'viewable'()
    set $S3, $P1
    concat $S2, ' near ', $S3
.annotate 'line', 114
# predefined string
    set $S3, $I1
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    concat $S4, $S4, $S2
.annotate 'line', 116
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompilerError' ]
    concat $S5, __ARG_1, $S2
.annotate 'line', 117
    $P3.'WinxedCompilerError'('parser', $S5, $S1, $I1)
    set $P2, $P3
# predefined Error
.annotate 'line', 114
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 567
    $P1['payload'] = $P2
    throw $P1
# }
.annotate 'line', 118

.end # SyntaxError


.sub 'Expected' :subid('WSubId_40')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 122
    concat $S1, "Expected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 123

.end # Expected


.sub 'Unexpected' :subid('WSubId_41')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 127
    concat $S1, "Unexpected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 128

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 132
    WSubId_1("Expected identifier", __ARG_1)
# }
.annotate 'line', 133

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 137
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 138

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 142
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 143
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 144

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 148
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 149
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 150

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_92')
        .param pmc __ARG_1
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 154
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 155
    WSubId_3(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 156

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_54')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 160
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 161
    WSubId_4(__ARG_1, $P1)
# }
.annotate 'line', 162

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_94')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_5 = "WSubId_5"
# Body
# {
.annotate 'line', 166
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 167
    WSubId_5(__ARG_1, $P1)
# }
.annotate 'line', 168

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_59')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 172
# predefined string
    set $S1, __ARG_1
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    WSubId_1($S2, __ARG_1)
# }
.annotate 'line', 173

.end # UndefinedVariable

.namespace [ 'Winxed'; 'Compiler'; 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 185
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 186
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 187

.end # Token


.sub 'iseof' :method
# Body
# {
.annotate 'line', 189
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 190
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 191
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 192
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 193
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 194
    .return(0)
# }

.end # isstring


.sub 'issinglequoted' :method
# Body
# {
.annotate 'line', 195
    .return(0)
# }

.end # issinglequoted


.sub 'rawstring' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 199
    WSubId_6('Not a literal string', self)
# }
.annotate 'line', 200

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 203
    WSubId_3(self)
# }
.annotate 'line', 204

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 205
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 206
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 207
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 208
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 209
    .return('(unknown)')
# }

.end # viewable


.sub 'filename' :method
# Body
# {
.annotate 'line', 210
    getattribute $P1, self, 'file'
    .return($P1)
# }

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 211
    getattribute $P1, self, 'line'
    .return($P1)
# }

.end # linenum


.sub 'show' :method
# Body
# {
.annotate 'line', 214
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 215
# predefined string
    getattribute $P1, self, 'file'
.annotate 'line', 213
    set $S2, $P1
# predefined string
.annotate 'line', 215
    getattribute $P2, self, 'line'
.annotate 'line', 213
    set $S3, $P2
.annotate 'line', 215
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 216

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Token' ]
.annotate 'line', 181
    addattribute $P0, 'file'
.annotate 'line', 182
    addattribute $P0, 'line'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 223
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 224

.end # TokenEof


.sub 'iseof' :method
# Body
# {
.annotate 'line', 225
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 226
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 219
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
.annotate 'line', 234
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 235
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 236

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 237
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 240
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 241

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 229
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 231
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 248
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 249

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 250
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 244
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
.annotate 'line', 257
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 258

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 261
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 262

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 265
    getattribute $P1, self, 'str'
.annotate 'line', 264
    set $S1, $P1
.annotate 'line', 265
    .return($S1)
# }
.annotate 'line', 266

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 253
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
.annotate 'line', 273
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 274

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 275
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 278
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 279

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 282
    getattribute $P1, self, 'str'
.annotate 'line', 281
    set $S1, $P1
.annotate 'line', 282
    .return($S1)
# }
.annotate 'line', 283

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 286
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 287

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 269
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 292
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 295
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 296

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 290
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
.annotate 'line', 303
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 304

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 307
    getattribute $P1, self, 'str'
.annotate 'line', 306
    set $S1, $P1
.annotate 'line', 307
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 308

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 311
    getattribute $P1, self, 'str'
.annotate 'line', 310
    set $S1, $P1
.annotate 'line', 311
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 312

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 315
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 316

.end # getasquoted


.sub 'getPirString' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 319
# str: $S1
    getattribute $P2, self, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 320
# var s: $P1
    box $P1, $S1
.annotate 'line', 321
# strunesc: $S2
    null $S2
.annotate 'line', 322
# try: create handler
    new $P2, 'ExceptionHandler'
    set_label $P2, __label_2
    push_eh $P2
# try: begin
# {
.annotate 'line', 323
    $P4 = $P1.'unescape'('utf8')
    set $S2, $P4
# }
# try: end
    pop_eh
    goto __label_3
.annotate 'line', 322
# catch
  __label_2:
    .get_results($P3)
    finalize $P3
    pop_eh
# {
.annotate 'line', 326
    WSubId_1("Invalid escape sequence in literal string", self)
# }
# catch end
  __label_3:
.annotate 'line', 328
# need_encoding: $I1
    null $I1
.annotate 'line', 329
    box $P2, $S2
    iter $P5, $P2
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $I2, $P5
# {
.annotate 'line', 330
    le $I2, 127, __label_6
# {
.annotate 'line', 331
    set $I1, 1
    goto __label_5 # break
.annotate 'line', 332
# }
  __label_6: # endif
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 335
# predefined escape
    escape $S1, $S2
.annotate 'line', 336
# encoding: $S3
    unless $I1 goto __label_8
    set $S3, "utf8:"
    goto __label_7
  __label_8:
    set $S3, ""
  __label_7:
.annotate 'line', 337
    concat $S4, $S3, '"'
    concat $S4, $S4, $S1
    concat $S4, $S4, '"'
    .return($S4)
# }
.annotate 'line', 338

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
.annotate 'line', 299
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
.annotate 'line', 345
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 346

.end # TokenSingleQuoted


.sub 'issinglequoted' :method
# Body
# {
.annotate 'line', 347
    .return(1)
# }

.end # issinglequoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 350
    getattribute $P1, self, 'str'
.annotate 'line', 349
    set $S1, $P1
.annotate 'line', 350
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 351

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 354
    getattribute $P1, self, 'str'
.annotate 'line', 353
    set $S1, $P1
.annotate 'line', 354
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 355

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 358
# s: $S1
    set $S1, ''
.annotate 'line', 359
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 360
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
.annotate 'line', 364
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 367
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 369
    .return($S1)
# }
.annotate 'line', 370

.end # getasquoted


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 373
# str: $S1
    getattribute $P1, self, 'str'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 374
# quote: $S2
    set $S2, "'"
.annotate 'line', 375
# need_escape: $I1
    null $I1
.annotate 'line', 376
    box $P1, $S1
    iter $P2, $P1
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $I2, $P2
# {
.annotate 'line', 377
    islt $I5, $I2, 32
    if $I5 goto __label_5
    isgt $I5, $I2, 127
  __label_5:
    unless $I5 goto __label_4
# {
.annotate 'line', 378
    set $I1, 1
    goto __label_3 # break
.annotate 'line', 379
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 382
# need_encoding: $I3
    null $I3
.annotate 'line', 383
    unless $I1 goto __label_6
# {
.annotate 'line', 384
    set $S2, '"'
.annotate 'line', 385
# result: $S3
    set $S3, ''
.annotate 'line', 386
    box $P1, $S1
    iter $P3, $P1
    set $P3, 0
  __label_7: # for iteration
    unless $P3 goto __label_8
    shift $S4, $P3
# {
.annotate 'line', 387
    ne $S4, '\', __label_9
.annotate 'line', 388
    concat $S3, $S3, '\\'
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 391
# n: $I4
# predefined ord
    ord $I4, $S4
.annotate 'line', 392
    islt $I5, $I4, 32
    if $I5 goto __label_13
    isgt $I5, $I4, 127
  __label_13:
    unless $I5 goto __label_11
# {
.annotate 'line', 393
    le $I4, 127, __label_14
.annotate 'line', 394
    set $I3, 1
  __label_14: # endif
.annotate 'line', 395
# h: $S5
    box $P4, $I4
    $P1 = $P4.'get_as_base'(16)
    null $S5
    if_null $P1, __label_15
    set $S5, $P1
  __label_15:
.annotate 'line', 396
    concat $S3, $S3, '\x{'
    concat $S3, $S3, $S5
    concat $S3, $S3, '}'
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 399
    concat $S3, $S3, $S4
  __label_12: # endif
# }
  __label_10: # endif
# }
    goto __label_7
  __label_8: # endfor
.annotate 'line', 402
    set $S1, $S3
# }
  __label_6: # endif
.annotate 'line', 404
    concat $S0, $S2, $S1
    concat $S0, $S0, $S2
    set $S1, $S0
.annotate 'line', 405
    unless $I3 goto __label_16
.annotate 'line', 406
    concat $S0, 'utf8:', $S1
    set $S1, $S0
  __label_16: # endif
.annotate 'line', 407
    .return($S1)
# }
.annotate 'line', 408

.end # getPirString

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 341
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
.annotate 'line', 415
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 416

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 417
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
.annotate 'line', 411
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
.annotate 'line', 424
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 425

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 426
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
.annotate 'line', 420
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
.annotate 'line', 436
# s: $S1
    set $S1, ''
.annotate 'line', 437
# c: $S2
    null $S2
# for loop
.annotate 'line', 438
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 439
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
.annotate 'line', 442
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 445
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 446
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 447
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 448
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 451
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 438
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 454
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 455

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 459
# s: $S1
    set $S1, ''
.annotate 'line', 460
# c: $S2
    null $S2
# for loop
.annotate 'line', 461
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 462
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 463
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 464
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 461
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 466
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 467

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 471
# mark: $S1
    set $S1, ''
.annotate 'line', 472
# c: $S2
    null $S2
# for loop
.annotate 'line', 473
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 474
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 476
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 481
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 484
    concat $S0, $S1, $S2
    set $S1, $S0
# }
  __label_1: # for iteration
.annotate 'line', 473
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 486
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 488
# content: $S3
    set $S3, ''
.annotate 'line', 489
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 490
# {
.annotate 'line', 491
    set $S4, ''
# for loop
.annotate 'line', 492
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 493
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 495
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 498
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 501
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 492
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 503
    eq $S4, $S1, __label_20
.annotate 'line', 504
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 505
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 506
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 507

.end # getheredoc


.sub 'getident' :subid('WSubId_11')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
# Body
# {
.annotate 'line', 511
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 512
# c: $S2
    null $S2
# for loop
.annotate 'line', 513
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    $P2 = WSubId_8($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 514
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 513
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_3
  __label_2: # for end
.annotate 'line', 515
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 516
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 517

.end # getident


.sub 'getnumber' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_10 = "WSubId_10"
# Body
# {
.annotate 'line', 521
# s: $S1
    null $S1
.annotate 'line', 522
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 523
# {
.annotate 'line', 524
    concat $S1, $S1, $S2
.annotate 'line', 525
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.annotate 'line', 526
    $P1 = WSubId_9($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 527
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 528
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 529
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
    $P2 = WSubId_10($S2)
    set $I2, $P2
    lt $I2, 0, __label_8
# {
.annotate 'line', 530
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 531
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 529
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 533
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 534
    set $S1, $I1
.annotate 'line', 535
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 537
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 538
# {
.annotate 'line', 539
    concat $S1, $S1, $S2
.annotate 'line', 540
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.annotate 'line', 541
    $P1 = WSubId_9($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 542
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 543
    concat $S1, $S1, 'E'
.annotate 'line', 544
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 545
    concat $S1, $S1, $S2
.annotate 'line', 546
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.annotate 'line', 548
    $P1 = WSubId_9($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 549
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 548
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 551
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 552
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 555
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 556
    concat $S1, $S1, 'E'
.annotate 'line', 557
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 558
    concat $S1, $S1, $S2
.annotate 'line', 559
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.annotate 'line', 561
    $P1 = WSubId_9($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 562
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 561
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_29
  __label_28: # for end
.annotate 'line', 563
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 564
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 567
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 568
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
.annotate 'line', 571

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 575
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 576
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
.annotate 'line', 577
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 576
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 578
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 579

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 583
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 584
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 585
# {
# for loop
  __label_7: # for condition
.annotate 'line', 586
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 587
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 586
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 588
    ne $S2, '', __label_9
.annotate 'line', 589
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 590
    concat $S1, $S1, $S2
.annotate 'line', 591
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 592
    ne $S2, '', __label_10
.annotate 'line', 593
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 594
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 595
    concat $S1, $S1, '/'
.annotate 'line', 596
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 597

.end # getcomment


.sub 'getop' :subid('WSubId_12')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 601
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 602
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 603

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
.annotate 'line', 619
    setattribute self, 'h', __ARG_1
.annotate 'line', 620
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 621
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 622
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 623
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 624
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 625
    root_new $P3, ['parrot';'Hash']
    $P3[''] = WSubId_11
    $P3['{'] = WSubId_12
    $P1['$'] = $P3
.annotate 'line', 626
    $P1['"'] = WSubId_13
.annotate 'line', 627
    $P1["'"] = WSubId_14
.annotate 'line', 628
    root_new $P9, ['parrot';'Hash']
.annotate 'line', 629
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_12
    $P11['='] = WSubId_12
    $P9['='] = $P11
.annotate 'line', 630
    $P9[':'] = WSubId_12
    $P1['='] = $P9
.annotate 'line', 632
    root_new $P16, ['parrot';'Hash']
    $P16['+'] = WSubId_12
    $P16['='] = WSubId_12
    $P1['+'] = $P16
.annotate 'line', 633
    root_new $P20, ['parrot';'Hash']
    $P20['-'] = WSubId_12
    $P20['='] = WSubId_12
    $P1['-'] = $P20
.annotate 'line', 634
    root_new $P24, ['parrot';'Hash']
    $P24['='] = WSubId_12
    $P1['*'] = $P24
.annotate 'line', 635
    root_new $P27, ['parrot';'Hash']
    $P27['|'] = WSubId_12
    $P1['|'] = $P27
.annotate 'line', 636
    root_new $P30, ['parrot';'Hash']
    $P30['&'] = WSubId_12
    $P1['&'] = $P30
.annotate 'line', 637
    root_new $P33, ['parrot';'Hash']
.annotate 'line', 638
    root_new $P35, ['parrot';'Hash']
    $P35[''] = WSubId_12
    $P35[':'] = WSubId_15
    $P33['<'] = $P35
.annotate 'line', 639
    $P33['='] = WSubId_12
    $P1['<'] = $P33
.annotate 'line', 641
    root_new $P40, ['parrot';'Hash']
    $P40['>'] = WSubId_12
    $P40['='] = WSubId_12
    $P1['>'] = $P40
.annotate 'line', 642
    root_new $P44, ['parrot';'Hash']
.annotate 'line', 643
    root_new $P46, ['parrot';'Hash']
    $P46[''] = WSubId_12
    $P46['='] = WSubId_12
    $P44['='] = $P46
    $P1['!'] = $P44
.annotate 'line', 645
    root_new $P50, ['parrot';'Hash']
    $P50['%'] = WSubId_12
    $P50['='] = WSubId_12
    $P1['%'] = $P50
.annotate 'line', 646
    root_new $P54, ['parrot';'Hash']
    $P54['='] = WSubId_12
    $P54['/'] = WSubId_16
    $P54['*'] = WSubId_17
    $P1['/'] = $P54
.annotate 'line', 647
    $P1['#'] = WSubId_16
.annotate 'line', 649
    setattribute self, 'select', $P1
# }
.annotate 'line', 650

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 653
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 654
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 655
    eq $S1, '', __label_2
.annotate 'line', 656
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 658
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 659
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 660
    ne $S1, "\n", __label_4
.annotate 'line', 661
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 663
    .return($S1)
# }
.annotate 'line', 664

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 667
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 668

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
.annotate 'line', 671
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 672
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 674
# c: $S1
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 675
    $P3 = WSubId_18($S1)
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 676
    $P4 = self.'getchar'()
    set $S1, $P4
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 677
# line: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 678
    ne $S1, '', __label_5
.annotate 'line', 679
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
.annotate 'line', 680
    $P3 = WSubId_19($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 681
    .tailcall WSubId_11(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 682
    $P3 = WSubId_9($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 683
    .tailcall WSubId_20(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 685
# op: $S2
    set $S2, $S1
.annotate 'line', 686
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 687
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 689
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 690
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 691
    set $P1, $P2
.annotate 'line', 692
    $P2 = $P1[$S1]
.annotate 'line', 693
    unless_null $P2, __label_11
# {
.annotate 'line', 694
    self.'ungetchar'($S1)
.annotate 'line', 695
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 698
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 700
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 701
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 702
    .tailcall WSubId_12(self, $S2, $I1)
# }
.annotate 'line', 703

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 706
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 707
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 708
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 709
    .return($P1)
# }
.annotate 'line', 710

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 713
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 714

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 611
    addattribute $P0, 'h'
.annotate 'line', 612
    addattribute $P0, 'pending'
.annotate 'line', 613
    addattribute $P0, 'select'
.annotate 'line', 614
    addattribute $P0, 'stacked'
.annotate 'line', 615
    addattribute $P0, 'filename'
.annotate 'line', 616
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

.sub 'typetoregcheck' :subid('WSubId_95')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 735
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
.annotate 'line', 736
    .return('I')
  __label_4: # case
.annotate 'line', 737
    .return('N')
  __label_5: # case
.annotate 'line', 738
    .return('S')
  __label_6: # case
.annotate 'line', 739
    .return('P')
  __label_2: # default
.annotate 'line', 740
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 742

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_104')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
# switch
.annotate 'line', 746
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
.annotate 'line', 747
    .return('int')
  __label_4: # case
.annotate 'line', 748
    .return('num')
  __label_5: # case
.annotate 'line', 749
    .return('string')
  __label_6: # case
.annotate 'line', 750
    .return('pmc')
  __label_2: # default
.annotate 'line', 751
    WSubId_6('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 753

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 773
    setattribute self, 'handle', __ARG_1
.annotate 'line', 774
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 775
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 776
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 777
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 778

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 781
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 782

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 785
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 786

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 789
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 790
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 792
    getattribute $P5, self, 'file'
.annotate 'line', 790
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 795
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 797
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 798
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 800
    getattribute $P5, self, 'line'
.annotate 'line', 798
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 803
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 805

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 808
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 809
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 810

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 813
    self.'updateannot'()
.annotate 'line', 814
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 815

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 818
    self.'updateannot'()
.annotate 'line', 819
    self.'vprint'(__ARG_1)
.annotate 'line', 820
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 821

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 824
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 826
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 827
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 828
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 829
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 830
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 831
    assign $P1, $S1
.annotate 'line', 832
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 833
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 835
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 836
    assign $P2, $I1
.annotate 'line', 837
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 840

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 843
    self.'updateannot'()
.annotate 'line', 844
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 845

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 848
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 849
    $P1.'print'('  ')
.annotate 'line', 850
    $P1.'print'(__ARG_1)
.annotate 'line', 851
    $P1.'print'(':')
.annotate 'line', 852
    if_null __ARG_2, __label_1
.annotate 'line', 853
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 854
    $P1.'print'("\n")
# }
.annotate 'line', 855

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 858
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 859
    $P1.'print'('    goto ')
.annotate 'line', 860
    $P1.'print'(__ARG_1)
.annotate 'line', 861
    if_null __ARG_2, __label_1
.annotate 'line', 862
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 863
    $P1.'print'("\n")
# }
.annotate 'line', 864

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 868
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 869

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 872
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 873

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 876
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 877

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 880
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 881

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 884
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 885

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 888
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 889

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 892
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 893

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 897
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 898

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 901
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 902

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 905
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 906

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 909
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 910

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 913
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 914

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 917
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 918

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 921
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 922

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 925
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 926

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 929
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 930

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 933
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 934

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 937
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 938

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 941
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 942

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 945
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 946

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 949
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 950

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 953
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 954

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 957
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 958

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 961
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 962

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 965
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 966

.end # emitsay


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 969
    concat $S1, "    get_hll_global ", __ARG_1
    self.'print'($S1)
.annotate 'line', 970
    if_null __ARG_3, __label_1
.annotate 'line', 971
    concat $S1, ", ", __ARG_3
    self.'print'($S1)
  __label_1: # endif
.annotate 'line', 972
    concat $S1, ", '", __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 973

.end # emitget_hll_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 976
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 977

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 980
    self.'say'("store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 981

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 764
    addattribute $P0, 'handle'
.annotate 'line', 765
    addattribute $P0, 'file'
.annotate 'line', 766
    addattribute $P0, 'line'
.annotate 'line', 767
    addattribute $P0, 'pendingf'
.annotate 'line', 768
    addattribute $P0, 'pendingl'
.annotate 'line', 769
    addattribute $P0, 'noan'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 990
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 991

.end # integerValue


.sub 'floatValue' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 995
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 996
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 997

.end # floatValue


.sub 'floatresult' :subid('WSubId_62')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1005
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1006
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1007
    .return($I1)
# }
.annotate 'line', 1008

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
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
.annotate 'line', 1045
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1046
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1047
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1048
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 1049
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1050
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1051

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
.annotate 'line', 1054
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1056
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1057
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1058
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1061
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1062
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1065
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1066
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 1067
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1068
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1069

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 1031
    addattribute $P0, 'body'
.annotate 'line', 1032
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
.annotate 'line', 1090
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1091
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1092
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1094
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1095
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1096
# n: $I1
    null $I1
.annotate 'line', 1097
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1098
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1099
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1101
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1104
    set $I1, -2
.annotate 'line', 1105
    if_null __ARG_5, __label_8
.annotate 'line', 1106
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1109
    set $I1, 1
.annotate 'line', 1110
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1111
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1112
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1114
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1115
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1116
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1118
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1119
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1120
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1124
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1125

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1128
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1129
    .return($S1)
# }
.annotate 'line', 1130

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1133
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1134

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1135
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1138
# type: $S1
    null $S1
# switch
.annotate 'line', 1139
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
.annotate 'line', 1140
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1141
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1142
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1143
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1145
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1147
    .return($S1)
# }
.annotate 'line', 1148

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1151
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1152
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1153
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1154
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1155
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1156
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1157

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1074
    addattribute $P0, 'name'
.annotate 'line', 1075
    addattribute $P0, 'body'
.annotate 'line', 1076
    addattribute $P0, 'typeresult'
.annotate 'line', 1077
    addattribute $P0, 'type0'
.annotate 'line', 1078
    addattribute $P0, 'type1'
.annotate 'line', 1079
    addattribute $P0, 'type2'
.annotate 'line', 1080
    addattribute $P0, 'type3'
.annotate 'line', 1081
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
.annotate 'line', 1169
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1170

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1160
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
.annotate 'line', 1183
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1184
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1185

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1173
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1175
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1193
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1194

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1197
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1198
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.annotate 'line', 1199
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1200
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1201
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1203
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1204
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1205
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1208
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1209
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1211
    ne $S3, 'null', __label_9
.annotate 'line', 1212
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1214
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1216

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1190
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
.annotate 'line', 1221
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1222
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1223
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1224
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1225
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1224
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1226
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1229
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1230

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1234
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1235
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1236
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1237
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1238
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1239

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1243
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1244
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1245
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1246

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1252
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1253
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1254
    WSubId_1("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1255
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1256

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1260
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1261
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1262
# predefined length
.annotate 'line', 1259
    length $I1, $S1
.annotate 'line', 1262
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1263

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1267
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1268
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1269
# predefined bytelength
.annotate 'line', 1266
    bytelength $I1, $S1
.annotate 'line', 1269
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1270

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1274
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1275
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1276
# predefined ord
.annotate 'line', 1273
    ord $I1, $S1
.annotate 'line', 1276
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1277

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1281
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1282
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1283
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1284
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1285
# predefined ord
.annotate 'line', 1280
    ord $I2, $S1, $I1
.annotate 'line', 1285
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1286

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1290
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1292
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1293
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1295
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1296
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1297

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1301
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1302
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1303
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1304
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1306
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1307
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1308

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1312
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1313
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1314
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1315
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1316
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1317
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1319
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1320
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1321

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1325
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1326
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1327
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1328
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1329
# predefined indexof
.annotate 'line', 1324
    index $I1, $S1, $S2
.annotate 'line', 1329
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1330

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1334
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1335
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1336
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1337
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1338
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1339
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1340
# predefined indexof
.annotate 'line', 1333
    index $I2, $S1, $S2, $I1
.annotate 'line', 1340
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1341

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
.annotate 'line', 1345
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1346
    new $P4, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1347
    new $P6, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P6.'Predef_typecast'('I')
    set $P5, $P6
    $P4.'PredefFunction'('int', $P5, 'I', '!')
    set $P3, $P4
.annotate 'line', 1345
    push $P1, $P3
.annotate 'line', 1350
    new $P8, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1351
    new $P10, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P10.'Predef_typecast'('N')
    set $P9, $P10
    $P8.'PredefFunction'('float', $P9, 'N', '!')
    set $P7, $P8
.annotate 'line', 1345
    push $P1, $P7
.annotate 'line', 1354
    new $P12, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1355
    new $P14, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P14.'Predef_typecast'('S')
    set $P13, $P14
    $P12.'PredefFunction'('string', $P13, 'S', '!')
    set $P11, $P12
.annotate 'line', 1345
    push $P1, $P11
.annotate 'line', 1358
    new $P16, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P16.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P15, $P16
.annotate 'line', 1345
    push $P1, $P15
.annotate 'line', 1362
    new $P18, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P18.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P17, $P18
.annotate 'line', 1345
    push $P1, $P17
.annotate 'line', 1366
    new $P20, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P20.'PredefFunction'('time', 'time %0', 'I')
    set $P19, $P20
.annotate 'line', 1345
    push $P1, $P19
.annotate 'line', 1370
    new $P22, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P22.'PredefFunction'('floattime', 'time %0', 'N')
    set $P21, $P22
.annotate 'line', 1345
    push $P1, $P21
.annotate 'line', 1374
    new $P24, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P24.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P23, $P24
.annotate 'line', 1345
    push $P1, $P23
.annotate 'line', 1378
    new $P26, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P26.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P25, $P26
.annotate 'line', 1345
    push $P1, $P25
.annotate 'line', 1382
    new $P28, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P28.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P27, $P28
.annotate 'line', 1345
    push $P1, $P27
.annotate 'line', 1386
    new $P30, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P30.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P29, $P30
.annotate 'line', 1345
    push $P1, $P29
.annotate 'line', 1390
    new $P32, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P32.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P31, $P32
.annotate 'line', 1345
    push $P1, $P31
.annotate 'line', 1397
    new $P34, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P34.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P33, $P34
.annotate 'line', 1345
    push $P1, $P33
.annotate 'line', 1404
    new $P36, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P36.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P35, $P36
.annotate 'line', 1345
    push $P1, $P35
.annotate 'line', 1411
    new $P38, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P38.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P37, $P38
.annotate 'line', 1345
    push $P1, $P37
.annotate 'line', 1419
    new $P40, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P40.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P39, $P40
.annotate 'line', 1345
    push $P1, $P39
.annotate 'line', 1428
    new $P42, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P42.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P41, $P42
.annotate 'line', 1345
    push $P1, $P41
.annotate 'line', 1438
    new $P44, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P44.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P43, $P44
.annotate 'line', 1345
    push $P1, $P43
.annotate 'line', 1442
    new $P46, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1443
    $P46.'PredefFunctionEval'('length', WSubId_22, 'length %0, %1', 'I', 'S')
    set $P45, $P46
.annotate 'line', 1345
    push $P1, $P45
.annotate 'line', 1447
    new $P48, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1448
    $P48.'PredefFunctionEval'('bytelength', WSubId_23, 'bytelength %0, %1', 'I', 'S')
    set $P47, $P48
.annotate 'line', 1345
    push $P1, $P47
.annotate 'line', 1452
    new $P50, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1453
    $P50.'PredefFunctionEval'('chr', WSubId_24, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P49, $P50
.annotate 'line', 1345
    push $P1, $P49
.annotate 'line', 1461
    new $P52, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1462
    $P52.'PredefFunctionEval'('ord', WSubId_25, 'ord %0, %1', 'I', 'S')
    set $P51, $P52
.annotate 'line', 1345
    push $P1, $P51
.annotate 'line', 1466
    new $P54, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1467
    $P54.'PredefFunctionEval'('ord', WSubId_26, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P53, $P54
.annotate 'line', 1345
    push $P1, $P53
.annotate 'line', 1471
    new $P56, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1472
    $P56.'PredefFunctionEval'('substr', WSubId_27, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P55, $P56
.annotate 'line', 1345
    push $P1, $P55
.annotate 'line', 1476
    new $P58, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1477
    $P58.'PredefFunctionEval'('substr', WSubId_28, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P57, $P58
.annotate 'line', 1345
    push $P1, $P57
.annotate 'line', 1481
    new $P60, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P60.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P59, $P60
.annotate 'line', 1345
    push $P1, $P59
.annotate 'line', 1485
    new $P62, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1486
    $P62.'PredefFunctionEval'('indexof', WSubId_29, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P61, $P62
.annotate 'line', 1345
    push $P1, $P61
.annotate 'line', 1490
    new $P64, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1491
    $P64.'PredefFunctionEval'('indexof', WSubId_30, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P63, $P64
.annotate 'line', 1345
    push $P1, $P63
.annotate 'line', 1495
    new $P66, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P66.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P65, $P66
.annotate 'line', 1345
    push $P1, $P65
.annotate 'line', 1499
    new $P68, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P68.'PredefFunction'('escape', 'escape %0, %1', 'S', 'S')
    set $P67, $P68
.annotate 'line', 1345
    push $P1, $P67
.annotate 'line', 1503
    new $P70, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P70.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P69, $P70
.annotate 'line', 1345
    push $P1, $P69
.annotate 'line', 1507
    new $P72, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P72.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P71, $P72
.annotate 'line', 1345
    push $P1, $P71
.annotate 'line', 1511
    new $P74, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P74.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P73, $P74
.annotate 'line', 1345
    push $P1, $P73
.annotate 'line', 1515
    new $P76, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P76.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P75, $P76
.annotate 'line', 1345
    push $P1, $P75
.annotate 'line', 1519
    new $P78, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P78.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P77, $P78
.annotate 'line', 1345
    push $P1, $P77
.annotate 'line', 1526
    new $P80, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P80.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P79, $P80
.annotate 'line', 1345
    push $P1, $P79
.annotate 'line', 1533
    new $P82, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P82.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P81, $P82
.annotate 'line', 1345
    push $P1, $P81
.annotate 'line', 1537
    new $P84, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P84.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P83, $P84
.annotate 'line', 1345
    push $P1, $P83
.annotate 'line', 1541
    new $P86, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P86.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P85, $P86
.annotate 'line', 1345
    push $P1, $P85
.annotate 'line', 1545
    new $P88, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P88.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P87, $P88
.annotate 'line', 1345
    push $P1, $P87
.annotate 'line', 1549
    new $P90, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P90.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P89, $P90
.annotate 'line', 1345
    push $P1, $P89
.annotate 'line', 1553
    new $P92, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P92.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P91, $P92
.annotate 'line', 1345
    push $P1, $P91
.annotate 'line', 1557
    new $P94, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P94.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P93, $P94
.annotate 'line', 1345
    push $P1, $P93
.annotate 'line', 1561
    new $P96, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P96.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P95, $P96
.annotate 'line', 1345
    push $P1, $P95
.annotate 'line', 1565
    new $P98, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P98.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P97, $P98
.annotate 'line', 1345
    push $P1, $P97
.annotate 'line', 1569
    new $P100, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P100.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P99, $P100
.annotate 'line', 1345
    push $P1, $P99
.annotate 'line', 1573
    new $P102, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P102.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P101, $P102
.annotate 'line', 1345
    push $P1, $P101
.annotate 'line', 1577
    new $P104, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P104.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P103, $P104
.annotate 'line', 1345
    push $P1, $P103
.annotate 'line', 1581
    new $P106, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P106.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P105, $P106
.annotate 'line', 1345
    push $P1, $P105
.annotate 'line', 1585
    new $P108, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P108.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P107, $P108
.annotate 'line', 1345
    push $P1, $P107
.annotate 'line', 1589
    new $P110, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P110.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P109, $P110
.annotate 'line', 1345
    push $P1, $P109
.annotate 'line', 1593
    new $P112, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P112.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P111, $P112
.annotate 'line', 1345
    push $P1, $P111
.annotate 'line', 1597
    new $P114, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P114.'PredefFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P113, $P114
.annotate 'line', 1345
    push $P1, $P113
.annotate 'line', 1601
    new $P116, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P116.'PredefFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P115, $P116
.annotate 'line', 1345
    push $P1, $P115
.annotate 'line', 1605
    new $P118, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P118.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P117, $P118
.annotate 'line', 1345
    push $P1, $P117
.annotate 'line', 1609
    new $P120, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P120.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P119, $P120
.annotate 'line', 1345
    push $P1, $P119
.annotate 'line', 1613
    new $P122, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P122.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P121, $P122
.annotate 'line', 1345
    push $P1, $P121
.annotate 'line', 1617
    new $P124, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P124.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P123, $P124
.annotate 'line', 1345
    push $P1, $P123
.annotate 'line', 1621
    new $P126, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P126.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P125, $P126
.annotate 'line', 1345
    push $P1, $P125
.annotate 'line', 1625
    new $P128, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P128.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P127, $P128
.annotate 'line', 1345
    push $P1, $P127
.annotate 'line', 1632
    new $P130, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P130.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P129, $P130
.annotate 'line', 1345
    push $P1, $P129
.annotate 'line', 1639
    new $P132, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P132.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P131, $P132
.annotate 'line', 1345
    push $P1, $P131
.annotate 'line', 1643
    new $P134, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P134.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P133, $P134
.annotate 'line', 1345
    push $P1, $P133
.annotate 'line', 1647
    new $P136, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P136.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P135, $P136
.annotate 'line', 1345
    push $P1, $P135
.annotate 'line', 1651
    new $P138, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P138.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P137, $P138
.annotate 'line', 1345
    push $P1, $P137
.annotate 'line', 1655
    new $P140, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P140.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P139, $P140
.annotate 'line', 1345
    push $P1, $P139
.annotate 'line', 1659
    new $P142, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1660
    $P142.'PredefFunction'('print', WSubId_31, 'v', '*')
    set $P141, $P142
.annotate 'line', 1345
    push $P1, $P141
.annotate 'line', 1663
    new $P144, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1664
    $P144.'PredefFunction'('say', WSubId_32, 'v', '*')
    set $P143, $P144
.annotate 'line', 1345
    push $P1, $P143
.annotate 'line', 1667
    new $P146, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1668
    $P146.'PredefFunction'('cry', WSubId_33, 'v', '*')
    set $P145, $P146
.annotate 'line', 1345
    push $P1, $P145
.annotate 'line', 1671
    new $P148, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1672
    $P148.'PredefFunction'('invoke', WSubId_34, 'P', '!')
    set $P147, $P148
.annotate 'line', 1345
    push $P1, $P147
  __label_2: # Infinite loop
.annotate 'line', 1677
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1678

.end # getpredefs


.sub 'findpredef' :subid('WSubId_65')
        .param string __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
# Body
# {
.annotate 'line', 1682
    $P2 = WSubId_35()
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 1683
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1684
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1685
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1686
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1687
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1688
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1690
    .return($P2)
# }
.annotate 'line', 1691

.end # findpredef


.sub 'optimize_array' :subid('WSubId_38')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1699
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1700
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1701
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1702
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1701
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1704

.end # optimize_array


.sub 'emit_array' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1708
    if_null __ARG_2, __label_1
# {
.annotate 'line', 1709
    iter $P2, __ARG_2
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $P1, $P2
.annotate 'line', 1710
    $P1.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
# }
.annotate 'line', 1712

.end # emit_array


.sub 'parseDotted' :subid('WSubId_55')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1716
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1717
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1718
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1719
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1720
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1721
    $P2 = __ARG_1.'get'()
.annotate 'line', 1722
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1725
    __ARG_1.'unget'($P2)
.annotate 'line', 1726
    .return($P1)
# }
.annotate 'line', 1727

.end # parseDotted


.sub 'parseList' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1735
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1736
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1737
# {
.annotate 'line', 1738
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1739
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1740
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1741
    unless_null __ARG_4, __label_4
.annotate 'line', 1742
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1744
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1745
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1746
    .return($P1)
# }
.annotate 'line', 1747

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1752
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1753
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1754
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1755
    .return($P1)
# }
.annotate 'line', 1756

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_56')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1760
    new $P1, ['ResizableStringArray']
.annotate 'line', 1761
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1762
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1763
    .return($P1)
# }
.annotate 'line', 1764

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1777
    setattribute self, 'start', __ARG_1
.annotate 'line', 1778
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1779

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1782
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1783
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1785
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 1786

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 1789
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1790
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1792
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 1793

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 1796
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1797
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1799
    .return("")
  __label_2: # endif
# }
.annotate 'line', 1800

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1803
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1804

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1807
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1808

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1811
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1812

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1815
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 1816

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1819
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1820

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1823
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1824

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1827
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1828

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1831
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1832

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1835
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1836

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1772
    addattribute $P0, 'start'
.annotate 'line', 1773
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
.annotate 'line', 1851
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 1852

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1856
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1855
    elements $I1, $P1
.annotate 'line', 1856
    .return($I1)
# }
.annotate 'line', 1857

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1860
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1861
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1862

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1866
    getattribute $P1, self, 'args'
    WSubId_38($P1)
# }
.annotate 'line', 1867

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1870
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1871
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1872
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1873
    .return($P1)
# }
.annotate 'line', 1874

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1877
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1878

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 1847
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1890
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1893
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1894
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1895
    .return($I1)
# }
.annotate 'line', 1896

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1899
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1900
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 1901
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1902
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1903

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1906
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1907
    if_null __ARG_2, __label_1
.annotate 'line', 1908
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1909

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1912
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1913
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1914
    .return(self)
# }
.annotate 'line', 1915

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 1887
    addattribute $P0, 'name'
.annotate 'line', 1888
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1920
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1921
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1922
    $P1 = __ARG_1.'get'()
.annotate 'line', 1923
# var args: $P2
    null $P2
.annotate 'line', 1924
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1925
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1927
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1928
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1929

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 1938
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_39, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 1939

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1942
    getattribute $P1, self, 'list'
    WSubId_38($P1)
# }
.annotate 'line', 1943

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1944
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1947
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1948
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1949
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1951
    .return($P2)
# }
.annotate 'line', 1952

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 1934
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1961
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1962
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1963

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_107')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1967
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1968
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1970
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1971
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1973

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1977
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1979
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1981
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 1983
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1980
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1982
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 1984
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 1986
    __ARG_2.'unget'($P1)
.annotate 'line', 1987
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 1989

.end # parseUsing


.sub 'parseSig' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 1993
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1994
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1995
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 1996
    WSubId_40("'='", $P2)
  __label_1: # endif
.annotate 'line', 1997
# var expr: $P3
    $P3 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 1998
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1999

.end # parseSig


.sub 'parseStatement' :subid('WSubId_93')
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
.annotate 'line', 2003
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2004
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 2005
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 2006
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 2007
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 2008
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 2009
    new $P6, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 2010
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 2011
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2012
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.annotate 'line', 2013
    WSubId_41("':'", $P1)
  __label_5: # endif
.annotate 'line', 2014
    .tailcall WSubId_42($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2017
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
.annotate 'line', 2019
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2021
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2024
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2027
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 2029
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 2031
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 2033
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 2035
    new $P6, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 2037
    new $P8, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_17: # case
.annotate 'line', 2039
    new $P10, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_18: # case
.annotate 'line', 2041
    new $P12, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_19: # case
.annotate 'line', 2043
    new $P14, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_20: # case
.annotate 'line', 2045
    new $P16, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_21: # case
.annotate 'line', 2047
    new $P18, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_22: # case
.annotate 'line', 2049
    new $P20, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_23: # case
.annotate 'line', 2051
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2053
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2055
    new $P22, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_26: # case
.annotate 'line', 2057
    new $P24, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_7: # default
.annotate 'line', 2059
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_27
    unless $P25 goto __label_27
# {
.annotate 'line', 2060
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2061
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 2062
    new $P6, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 2063
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 2065
    __ARG_1.'unget'($P1)
.annotate 'line', 2066
    new $P5, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.annotate 'line', 2068
    WSubId_6('parseStatement failure', $P1)
# }
.annotate 'line', 2069

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2079
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2080

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2081
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2084
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2085

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2088
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2089

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2092
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2093

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2096
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2097

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2100
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2101

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2104
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2105

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2108
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2109

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2112
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2113

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2116
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2117

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2120
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2121

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2124
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2125

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2128
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2129

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2132
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2133

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2140
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2141

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2144
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2145

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2148
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2149

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2152
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2154
    .return(self)
# }
.annotate 'line', 2155

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2075
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2160
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2163
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2164

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2165
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2158
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2178
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2179
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2180
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2181
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2182
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2183
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2184
    null $I2
  __label_4: # endif
.annotate 'line', 2185
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2181
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2187
    unless $I2 goto __label_6
.annotate 'line', 2188
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2190
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2191

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2174
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2198
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2199
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2200

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2201
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2204
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2205
    .return(self)
# }
.annotate 'line', 2206

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 2209
    getattribute $P1, self, 'statements'
    WSubId_52(__ARG_1, $P1)
# }
.annotate 'line', 2210

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2194
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2215
    unless_null __ARG_1, __label_1
.annotate 'line', 2216
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2217
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2218
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2220
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2221

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2229
# var arg: $P1
    null $P1
.annotate 'line', 2230
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2231
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2232
    $P2 = __ARG_1.'get'()
.annotate 'line', 2233
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2234
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2237
    __ARG_1.'unget'($P2)
.annotate 'line', 2238
    $P1 = WSubId_37(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2240
    .return($P1)
# }
.annotate 'line', 2241

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
.annotate 'line', 2250
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2251
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2252
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2253
    unless $I1 goto __label_1
.annotate 'line', 2254
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2255
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2256
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2257
    $P1 = __ARG_2.'get'()
.annotate 'line', 2258
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2259
    __ARG_2.'unget'($P1)
.annotate 'line', 2260
    $P3 = WSubId_36(__ARG_2, __ARG_3, WSubId_53, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2262
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2263

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2266
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 2267
    .return(self)
# }
.annotate 'line', 2268

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2271
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2272
    self.'annotate'(__ARG_1)
.annotate 'line', 2273
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2274
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2275
    __ARG_1.'print'('    ')
.annotate 'line', 2276
    unless_null $P1, __label_2
.annotate 'line', 2277
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2279
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2280
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2281
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2282
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2284

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2243
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2245
    addattribute $P0, 'opname'
.annotate 'line', 2246
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
.annotate 'line', 2296
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2297
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2298
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2299
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2300
    WSubId_54(';', __ARG_2)
.annotate 'line', 2301
    $P3 = WSubId_56($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2302
    .return(self)
# }
.annotate 'line', 2303

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2304
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2307
    self.'annotate'(__ARG_1)
.annotate 'line', 2308
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2309

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2291
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2293
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
.annotate 'line', 2321
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2322
# var names: $P1
    null $P3
    $P1 = WSubId_36(__ARG_2, $P3, WSubId_57, ';')
.annotate 'line', 2323
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2324
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2325
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2327
    setattribute self, 'names', $P1
# }
.annotate 'line', 2328

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2331
    .return(self)
# }
.annotate 'line', 2332

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2335
    self.'annotate'(__ARG_1)
.annotate 'line', 2336
    getattribute $P3, self, 'names'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2337
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2338
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2340

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2316
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2318
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
.annotate 'line', 2354
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2355
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2356
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2357
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2358
    WSubId_54(';', __ARG_2)
.annotate 'line', 2359
    setattribute self, 'path', $P1
# }
.annotate 'line', 2360

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2363
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2364
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2366
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2368
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2382
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2369
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2370
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2371
    $P4.'pop'()
.annotate 'line', 2372
# var ns: $P5
    $P5 = self.'findns'($P4)
.annotate 'line', 2373
    if_null $P5, __label_6
# {
.annotate 'line', 2374
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2375
    if_null $P3, __label_7
# {
.annotate 'line', 2376
    self.'createvarused'($P2, $P3)
.annotate 'line', 2377
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
.annotate 'line', 2383
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2384
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2385
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2386
    self.'usesubid'($S1)
.annotate 'line', 2387
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2389
    self.'createvar'($P2, 'P')
.annotate 'line', 2390
    .return(self)
# }
.annotate 'line', 2391

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2394
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2395
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2396
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2397
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2398
    self.'annotate'(__ARG_1)
.annotate 'line', 2399
# key: $S2
    null $S2
.annotate 'line', 2400
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2401
    $P1.'pop'()
.annotate 'line', 2402
    $P3 = WSubId_58($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2404
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2406

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2347
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2349
    addattribute $P0, 'path'
.annotate 'line', 2350
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
.annotate 'line', 2417
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2418
# var nskey: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2419
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2420
    ge $I1, 1, __label_1
.annotate 'line', 2421
    WSubId_40('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2422
# var nssym: $P2
    $P3 = WSubId_56($P1)
    $P2 = __ARG_3.'findns'($P3)
.annotate 'line', 2424
    unless_null $P2, __label_2
.annotate 'line', 2425
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2426
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2428
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2429

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2432
    .return(self)
# }
.annotate 'line', 2433

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2413
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
.annotate 'line', 2448
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2449
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2450
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2451

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2454
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2455
    .return(self)
# }
.annotate 'line', 2456

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2459
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2460

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2443
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2445
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
.annotate 'line', 2477
    setattribute self, 'type', __ARG_1
.annotate 'line', 2478
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2479
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2480
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2481

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2484
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2485

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2486
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2487
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2488
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2489
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2490
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2491
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2492
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2469
    addattribute $P0, 'type'
.annotate 'line', 2470
    addattribute $P0, 'reg'
.annotate 'line', 2471
    addattribute $P0, 'scope'
.annotate 'line', 2472
    addattribute $P0, 'flags'
.annotate 'line', 2473
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2500
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2501

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2504
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2505

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2497
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
.annotate 'line', 2514
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2515

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2516
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2519
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2520
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2521
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2522

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2508
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2510
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2533
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2534

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2537
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2538
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2539
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2540
    if_null $P2, __label_2
.annotate 'line', 2541
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2542
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2543
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2544
    $P1[$S1] = $P3
.annotate 'line', 2545
    .return($P3)
# }
.annotate 'line', 2546

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2549
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2550
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2551
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2552
    if_null $P2, __label_2
.annotate 'line', 2553
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2554
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2555

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2558
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2559
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2560
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2561
    if_null $P2, __label_2
.annotate 'line', 2562
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2563
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2564

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2567
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2568
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2569
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2570
    if_null $P2, __label_2
.annotate 'line', 2571
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2572
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2573
    $P1[$S1] = $P3
.annotate 'line', 2574
    .return($P3)
# }
.annotate 'line', 2575

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2578
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2577
    set $S1, __ARG_1
.annotate 'line', 2579
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2580

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2583
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 2584
    if_null $P1, __label_1
# {
.annotate 'line', 2585
# var sym: $P2
    null $P2
.annotate 'line', 2586
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 2587
    $P2 = $P3.'getlocalvar'(__ARG_1)
    if_null $P2, __label_4
.annotate 'line', 2588
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
    null $P5
.annotate 'line', 2591
    .return($P5)
# }
.annotate 'line', 2592

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2595
# var sym: $P1
    null $P1
.annotate 'line', 2596
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2597
    .return($P1)
  __label_1: # endif
.annotate 'line', 2598
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2599
    .return($P1)
  __label_2: # endif
.annotate 'line', 2600
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2601
    if_null $P2, __label_3
.annotate 'line', 2602
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2603
    .return($P3)
# }
.annotate 'line', 2604

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2607
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2608
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2609
    .return($S1)
# }
.annotate 'line', 2610

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2613
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2615
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2616
    .return('__WLEX_self')
# }
.annotate 'line', 2617

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2528
    addattribute $P0, 'locals'
.annotate 'line', 2529
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2626
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
.annotate 'line', 2638
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2639

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2640
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2641
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2642
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2643
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2644
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2645
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2646
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2647
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2648
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2651
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2652

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2656
    .return(self)
# }
.annotate 'line', 2657

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2658
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2661
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2662
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2663
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2664
    .return($S2)
# }
.annotate 'line', 2665

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2668
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 2669
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 2670
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 2671

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2674
# reg: $S1
    null $S1
.annotate 'line', 2675
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2676
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2678
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2679
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2681
    .return($S1)
# }
.annotate 'line', 2682

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2685
    WSubId_1('Not a left-side expression', self)
# }
.annotate 'line', 2686

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2634
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2691
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2689
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
.annotate 'line', 2701
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2702
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2703
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2704
    WSubId_40('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2705
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2706

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2707
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2710
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2711
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2712
    .return(self)
# }
.annotate 'line', 2713

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2716
    self.'annotate'(__ARG_1)
.annotate 'line', 2717
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2718
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2719
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2720
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2721
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2723
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2725

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2696
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2698
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
.annotate 'line', 2740
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2741
    .return(self)
# }
.annotate 'line', 2742

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2745
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2746

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2749
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2750
    .return(self)
# }
.annotate 'line', 2751

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2754
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2755
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2756
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2758
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2759
    ne $I1, 0, __label_5
.annotate 'line', 2760
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2762
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2765
    .return(0)
# }
.annotate 'line', 2766

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2769
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2771
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2772
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2773
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2775
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2776
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
.annotate 'line', 2779
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2782
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2785
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2788

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2791
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2793
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2794
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2795
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2797
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2798
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
.annotate 'line', 2801
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2804
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2807
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2810

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2737
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2817
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2818
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2815
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2828
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2829
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2830

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2831
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2832
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2835
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2836
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2837
    .return($S1)
# }
.annotate 'line', 2838

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2841
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2842
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2843
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2844
# var s: $P2
    box $P2, $S1
.annotate 'line', 2845
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2847
    .return($S1)
# }
.annotate 'line', 2848

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2851
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2852
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2853

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2856
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2857

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2823
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2825
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param int __ARG_4 :opt_flag
# Body
# {
.annotate 'line', 2869
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2870
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2871
# n: $I1
    null $I1
.annotate 'line', 2872
    unless __ARG_4 goto __label_1
.annotate 'line', 2873
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2875
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2876
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2878
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2879

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2880
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2881
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2884
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2883
    set $I1, $S1
.annotate 'line', 2885
    .return($I1)
# }
.annotate 'line', 2886

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2889
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2890
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2891
    ne $I1, 0, __label_2
.annotate 'line', 2892
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2894
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2896

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2899
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2900

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 2862
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2864
    addattribute $P0, 'pos'
.annotate 'line', 2865
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2910
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2911
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2912

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2913
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2914
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2917
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2918
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2919
    assign $P1, $S1
.annotate 'line', 2920
    .return($P1)
# }
.annotate 'line', 2921

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2924
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2925
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2926
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2928

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2933
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2934
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2935
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2936
    .return($S1)
# }
.annotate 'line', 2937

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 2905
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2907
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2946
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2949
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2950
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2951

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2954
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2955
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 2956
    .return(0)
  __label_1: # endif
.annotate 'line', 2957
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2958

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2961
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2962
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2963
    if_null $P2, __label_1
.annotate 'line', 2964
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2966
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2969
    .return('P')
  __label_4: # default
.annotate 'line', 2971
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2974

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2977
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2978
    .return($S1)
# }
.annotate 'line', 2979

.end # getName


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2982
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2983
    unless_null $P1, __label_1
.annotate 'line', 2984
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 2985
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2986
# s: $S1
    null $S1
.annotate 'line', 2987
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 2988
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 2991
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 2993
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 2997
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 2998
    .return($S1)
# }
.annotate 'line', 2999

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 3002
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3003
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3004
    getattribute $P2, self, 'name'
    WSubId_59($P2)
  __label_1: # endif
.annotate 'line', 3005
    .return($P1)
# }
.annotate 'line', 3006

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3009
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3010
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3011
    if_null $P2, __label_1
# {
.annotate 'line', 3012
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3013
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3014
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3015
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3016
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3017
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3024
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3025
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3026
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
.annotate 'line', 3030
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'findsymbol'($P5)
.annotate 'line', 3031
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3032
# id: $S1
    $P5 = $P4.'makesubid'()
    null $S1
    if_null $P5, __label_11
    set $S1, $P5
  __label_11:
.annotate 'line', 3033
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3034
    self.'usesubid'($S1)
.annotate 'line', 3035
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3038
    .return(self)
# }
.annotate 'line', 3039

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3042
# id: $S1
    null $S1
.annotate 'line', 3043
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3044
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3046
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3047
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3048
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3049
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3050
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3051
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3052
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3053
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3057
    .return($S1)
# }
.annotate 'line', 3058

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3061
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3062
    self.'annotate'(__ARG_1)
.annotate 'line', 3063
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3064
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3066

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3069
    self.'annotate'(__ARG_1)
.annotate 'line', 3070
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3071

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3074
    self.'annotate'(__ARG_1)
.annotate 'line', 3075
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3076
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3077
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3078
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3079
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3080
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3083
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3086
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3089
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3090
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3092
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3093
    ne $S3, 'v', __label_13
.annotate 'line', 3094
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3095
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3096
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3099
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3100
    self.'annotate'(__ARG_1)
.annotate 'line', 3101
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3102
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3104
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3107
    .return($S2)
# }
.annotate 'line', 3108

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 2942
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2944
    addattribute $P0, 'name'
.annotate 'line', 2945
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3118
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3119
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3120

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3123
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3124

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3127
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3128
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3129
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3130
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3131
    .return($S2)
# }
.annotate 'line', 3132

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3135
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3136
    self.'annotate'(__ARG_1)
.annotate 'line', 3137
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3138
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3140

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3143
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3144
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3145
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3147
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3150
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3148
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3151
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3154
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3155
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3156
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3158
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3159
    self.'annotate'(__ARG_1)
.annotate 'line', 3160
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3164
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3165

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3168
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3169

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3113
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3115
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3178
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3179

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3174
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 3190
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3191
    $P2 = WSubId_60(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3192

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3193
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3196
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3199
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3200
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3201
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3202
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3203
    __ARG_1.'say'()
# }
.annotate 'line', 3204

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3184
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3186
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3214
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3215
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3216

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3219
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3220

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3223
    self.'optimizearg'()
.annotate 'line', 3224
    .return(self)
# }
.annotate 'line', 3225

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3209
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3211
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
.annotate 'line', 3236
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3237
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3238
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3239

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3242
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3243
    .return(self)
# }
.annotate 'line', 3244

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3247
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3248

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3251
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3252
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3253

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3256
    self.'optimizearg'()
.annotate 'line', 3257
    .return(self)
# }
.annotate 'line', 3258

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3261
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3262

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3265
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3266

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3230
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3232
    addattribute $P0, 'lexpr'
.annotate 'line', 3233
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3275
    .return('I')
# }
.annotate 'line', 3276

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3279
    self.'optimizearg'()
.annotate 'line', 3280
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3281
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3282
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3283
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3284
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3285
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3287
    .return(self)
# }
.annotate 'line', 3288

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3271
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3297
    .return('I')
# }
.annotate 'line', 3298

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3293
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
.annotate 'line', 3306
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3307

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3310
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3311
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3312
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3313
    self.'annotate'(__ARG_1)
.annotate 'line', 3314
    __ARG_1.'print'('    delete ')
.annotate 'line', 3315
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3316
    __ARG_1.'say'()
.annotate 'line', 3317
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3318
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3321
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3322

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3302
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
.annotate 'line', 3329
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3330

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3333
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3334
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
.annotate 'line', 3335
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3336
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3337
    self.'annotate'(__ARG_1)
.annotate 'line', 3338
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3339
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3340
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3343
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3344

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3325
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
.annotate 'line', 3353
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3354

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3357
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3358

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3361
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3362
    .return(self)
# }
.annotate 'line', 3363

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 3366
    self.'optimizearg'()
.annotate 'line', 3367
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3368
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3369
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3370
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3373
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3374
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3375
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3376
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall WSubId_61($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3379
    .return(self)
# }
.annotate 'line', 3380

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3383
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3384
    self.'annotate'(__ARG_1)
.annotate 'line', 3385
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3386

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3349
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
.annotate 'line', 3395
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3396

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3397
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3400
    .return('I')
# }
.annotate 'line', 3401

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3404
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3405
    .return(self)
# }
.annotate 'line', 3406

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3409
    self.'optimizearg'()
.annotate 'line', 3410
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3411
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3412
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3413
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3414
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
.annotate 'line', 3416
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3417
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3418
    .return(self)
# }
.annotate 'line', 3419

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3422
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3423

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3426
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3427
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3428
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3429
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3431
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3434
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3437
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3439

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3391
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3448
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3449

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3452
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3453
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3454
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3455

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3444
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3464
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3465
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3466
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3467

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3460
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
.annotate 'line', 3474
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3475

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3478
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3479
    self.'annotate'(__ARG_1)
.annotate 'line', 3480
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3481
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3482
    .return($S1)
# }
.annotate 'line', 3483

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3470
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
.annotate 'line', 3490
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3491

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3494
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3495
    self.'annotate'(__ARG_1)
.annotate 'line', 3496
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3497
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3498
    .return($S1)
# }
.annotate 'line', 3499

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3486
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
.annotate 'line', 3508
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3509

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3512
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3513
    self.'annotate'(__ARG_1)
.annotate 'line', 3514
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3515
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3516
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3517
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3518
    .return($S1)
# }
.annotate 'line', 3519

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3504
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
.annotate 'line', 3526
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3527

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
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
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3533
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3534
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3535
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3536
    .return($S1)
# }
.annotate 'line', 3537

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3522
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
.annotate 'line', 3548
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3549
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3550
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3551
    .return(self)
# }
.annotate 'line', 3552

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3555
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3556

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3559
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3560
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3561
    .return(self)
# }
.annotate 'line', 3562

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3565
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3566

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3569
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3570
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3571
    self.'annotate'(__ARG_1)
.annotate 'line', 3572
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3574

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3542
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3544
    addattribute $P0, 'lexpr'
.annotate 'line', 3545
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3583
    self.'annotate'(__ARG_1)
.annotate 'line', 3584
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3585
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3586

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3579
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3595
    self.'annotate'(__ARG_1)
.annotate 'line', 3596
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3597
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3598
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3599

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3602
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3603
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 3604
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 3605
    $P2 = $P1.'isnull'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3606
    WSubId_1("Cannot assign-to to null")
  __label_2: # endif
.annotate 'line', 3607
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_3
    set $S1, $P2
  __label_3:
.annotate 'line', 3608
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_4
    set $S2, $P2
  __label_4:
.annotate 'line', 3609
    self.'annotate'(__ARG_1)
.annotate 'line', 3610
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3611
    .return($S1)
# }
.annotate 'line', 3612

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3591
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3621
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3622
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3623
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3624
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3625
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3626
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3627
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3629
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3630
# aux: $S5
    null $S5
.annotate 'line', 3631
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3632
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3634
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3635
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3636
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3637
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3639
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3643
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3644
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3645
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3646
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3648
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3651
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3654
    .return($S3)
# }
.annotate 'line', 3655

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3617
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3664
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3665
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3666
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3667
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3668
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3669
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3670
# aux: $S5
    null $S5
.annotate 'line', 3671
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3672
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3674
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3677
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3678
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3679
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3680
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3682
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3685
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3687
    .return($S3)
# }
.annotate 'line', 3688

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3660
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3697
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3698
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3699
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3700
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3701
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3703
    ne $S2, 'I', __label_7
.annotate 'line', 3704
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3706
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3707
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3709
    self.'annotate'(__ARG_1)
.annotate 'line', 3710
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3713
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3714
    self.'annotate'(__ARG_1)
.annotate 'line', 3715
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3717
    .return($S3)
# }
.annotate 'line', 3718

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3693
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3727
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3728
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3729
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3730
    self.'annotate'(__ARG_1)
.annotate 'line', 3731
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3732
    .return($S2)
# }
.annotate 'line', 3733

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3723
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3742
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3743
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3744
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3745
    self.'annotate'(__ARG_1)
.annotate 'line', 3746
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3747
    .return($S2)
# }
.annotate 'line', 3748

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3738
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3755
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3758
    self.'optimizearg'()
.annotate 'line', 3759
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3760
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3761
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3762
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3763
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3764
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3766
    .return(self)
# }
.annotate 'line', 3767

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3770
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3771
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3772
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3773
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3774
    self.'annotate'(__ARG_1)
.annotate 'line', 3775
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3777
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3782
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3787
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3792
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3797
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3802
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3778
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3779
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3780
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3783
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3784
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3785
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3788
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3789
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3790
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3793
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3794
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3795
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3798
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3799
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3800
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3803
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3804
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3805
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3806
# switch
.annotate 'line', 3809
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3811
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3814
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3817
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3818
# }
.annotate 'line', 3820

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3823
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3824

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3827
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3828

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3831
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3832

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3753
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
.annotate 'line', 3847
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3848
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3849
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3850

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3851
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3852
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3855
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3856
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3857
    .return(self)
# }
.annotate 'line', 3858

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3861
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3862
    self.'annotate'(__ARG_1)
.annotate 'line', 3863
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3864
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3865
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3866

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3869
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3870
    self.'annotate'(__ARG_1)
.annotate 'line', 3871
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
.annotate 'line', 3872

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 3840
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3842
    addattribute $P0, 'expr'
.annotate 'line', 3843
    addattribute $P0, 'checknull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3879
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3882
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3883

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3886
    self.'optimizearg'()
.annotate 'line', 3887
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3888
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3889
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3890
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3891
    unless $I1 goto __label_1
# {
.annotate 'line', 3892
    unless $I2 goto __label_2
.annotate 'line', 3893
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3895
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3897
    unless $I2 goto __label_4
.annotate 'line', 3898
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3899
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3900
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3901
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3902
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3903
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3905
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3906
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3907
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3909
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3910
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3911
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
.annotate 'line', 3915
    .return(self)
# }
.annotate 'line', 3916

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3919
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3920

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3923
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3924

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3927
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3928

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3931
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3932

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 3877
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3939
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3942
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3943

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3946
    self.'optimizearg'()
.annotate 'line', 3947
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3948
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3949
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3950
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3951
    unless $I1 goto __label_1
# {
.annotate 'line', 3952
    unless $I2 goto __label_2
.annotate 'line', 3953
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3955
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3957
    unless $I2 goto __label_4
.annotate 'line', 3958
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3959
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3960
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3961
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3962
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3963
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3965
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3966
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3967
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3969
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3970
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3971
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
.annotate 'line', 3975
    .return(self)
# }
.annotate 'line', 3976

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3979
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3980

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3983
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3984

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3987
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3988

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3991
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3992

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 3937
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
.annotate 'line', 4002
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 4003
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 4004

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4005
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4008
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4009
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
.annotate 'line', 4010

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4013
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
.annotate 'line', 4014

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4017
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4018
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4019
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4020

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4023
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4024

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4027
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4028
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4029
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4030

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4033
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4034
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4035
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4036

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 3997
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3999
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4043
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4046
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4047

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4050
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4051

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4054
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4055

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4058
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4059

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4062
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4063

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4041
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4070
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4073
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4074

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4077
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4078

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4081
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4082

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4085
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4086

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4089
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4090

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4068
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4097
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4100
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4101

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4104
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4105

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4108
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4109

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4112
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4113

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4116
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4117

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4095
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4124
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4127
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4128

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4131
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4132

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4135
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4136

.end # emitop


.sub 'emitop_if' :method
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

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4143
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4144

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4122
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4153
    .return('I')
# }
.annotate 'line', 4154

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4149
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
.annotate 'line', 4163
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4164

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4167
    self.'optimizearg'()
.annotate 'line', 4168
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4169
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4170
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4171
    eq $I1, 0, __label_2
.annotate 'line', 4172
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4174
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4176
    .return(self)
# }
.annotate 'line', 4177

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4180
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
.annotate 'line', 4181
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4182
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4183
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4184
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4187
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4188
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4189
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4190
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4191
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4193

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4159
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
.annotate 'line', 4202
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4203

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4206
    self.'optimizearg'()
.annotate 'line', 4207
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4208
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4209
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4210
    ne $I1, 0, __label_2
.annotate 'line', 4211
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4213
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4215
    .return(self)
# }
.annotate 'line', 4216

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4219
# res: $S1
    null $S1
.annotate 'line', 4220
    if_null __ARG_2, __label_1
.annotate 'line', 4221
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4223
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4224
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4225
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4226
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4227
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4230
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4231
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4232
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4233
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4234
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4236

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4198
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4241
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
.annotate 'line', 4251
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4252

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4255
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
.annotate 'line', 4256
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4257
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4258
    self.'annotate'(__ARG_1)
.annotate 'line', 4259
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4260

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4263
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4264

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4247
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
.annotate 'line', 4273
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4274

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4277
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
.annotate 'line', 4278
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4279
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4280
    self.'annotate'(__ARG_1)
.annotate 'line', 4281
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4282

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4285
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4286

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4269
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
.annotate 'line', 4295
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4296

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4299
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
.annotate 'line', 4300
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4301
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4302
    self.'annotate'(__ARG_1)
.annotate 'line', 4303
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4304

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4307
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4308

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4291
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
.annotate 'line', 4318
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4320
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4327
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4321
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4322
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4323
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4325
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4328
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4329
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4332
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4334

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4335
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4338
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4339
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4340
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4341
# i: $I2
    null $I2
# for loop
.annotate 'line', 4342
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4343
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4342
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4344
    .return($P2)
# }
.annotate 'line', 4345

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4348
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4349
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4350
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4351
    self.'annotate'(__ARG_1)
.annotate 'line', 4352
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4353
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4354
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4353
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4355
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4356

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4359
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4360
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4361
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4362
    self.'annotate'(__ARG_1)
.annotate 'line', 4363
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4364
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4365
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4364
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4366
    .return($S1)
# }
.annotate 'line', 4367

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4370
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4371
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4372
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4373
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4374
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4373
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4375

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4378
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4379
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4380
    self.'annotate'(__ARG_1)
.annotate 'line', 4381
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4382
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4383
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4382
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4384

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4313
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4315
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
.annotate 'line', 4393
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4394

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4397
    self.'optimizearg'()
.annotate 'line', 4398
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4399
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4400
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4401
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4402
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4403
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4408
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4409
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4410
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4412
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4413
    getattribute $P13, $P3, 'str'
.annotate 'line', 4410
    set $S3, $P13
# predefined string
.annotate 'line', 4413
    getattribute $P14, $P4, 'str'
.annotate 'line', 4410
    set $S4, $P14
.annotate 'line', 4413
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4415
    new $P15, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4416
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4410
    set $S6, $P18
# predefined string
.annotate 'line', 4416
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4410
    set $S7, $P19
.annotate 'line', 4416
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4417
    new $P11, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4419
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4420
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4421
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4422
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4423
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4424
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4427
    $P10 = WSubId_62($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4428
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4429
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4430
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4431
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4432
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_61($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4436
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4437
    new $P11, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4439
    .return(self)
# }
.annotate 'line', 4440

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 4443
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4444
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4445
    ne $S1, $S2, __label_3
.annotate 'line', 4446
    .return($S1)
  __label_3: # endif
.annotate 'line', 4447
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4448
    .return('S')
  __label_4: # endif
.annotate 'line', 4449
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4450
    .return('S')
  __label_6: # endif
.annotate 'line', 4451
    $P1 = WSubId_62($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4452
    .return('N')
  __label_8: # endif
.annotate 'line', 4453
    .return('I')
# }
.annotate 'line', 4454

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4457
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4458
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4459
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4460
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4461
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4463
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4464
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4465
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4466
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4467
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4468
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4469
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4470
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4473
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4474
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4477
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4480
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4481
# l: $S7
    null $S7
.annotate 'line', 4482
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4484
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4485
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4487
# r: $S8
    null $S8
.annotate 'line', 4488
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4490
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4491
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4493
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4496
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4498

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4389
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
.annotate 'line', 4507
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4508

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4511
    self.'optimizearg'()
.annotate 'line', 4512
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4513
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4514
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4515
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4516
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4517
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4518
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4519
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4520
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4521
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4522
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P5, $P6, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4525
    .return(self)
# }
.annotate 'line', 4526

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4529
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4530
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4531
    ne $S1, $S2, __label_3
.annotate 'line', 4532
    .return($S1)
  __label_3: # endif
.annotate 'line', 4533
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4534
    .return('N')
  __label_4: # endif
.annotate 'line', 4535
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4536
    .return('N')
  __label_6: # endif
.annotate 'line', 4537
    .return('I')
# }
.annotate 'line', 4538

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4541
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4542
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4543
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4544

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4503
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
.annotate 'line', 4553
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4554

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
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
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4562
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4563
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4564
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4565
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4566
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4567
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4568
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P7, $P8, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4571
    $P7 = WSubId_62($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4572
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4573
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4574
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4575
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4576
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_61($P7, $P8, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4580
    .return(self)
# }
.annotate 'line', 4581

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4584
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4585
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4586
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4587
    ne $S1, $S2, __label_3
.annotate 'line', 4588
    .return($S1)
  __label_3: # endif
.annotate 'line', 4589
    ne $S1, 'S', __label_4
.annotate 'line', 4590
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4592
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4593

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4596
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4597
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4598
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4599
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4600
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4601
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4602
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4603
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4604
# rval: $S5
    null $S5
# switch
.annotate 'line', 4605
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4607
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4610
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4611
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4613
    self.'annotate'(__ARG_1)
.annotate 'line', 4614
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4615
    .return()
# }
  __label_3: # endif
.annotate 'line', 4617
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
.annotate 'line', 4618
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4619
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4620
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4621
    .return()
# }
  __label_7: # endif
.annotate 'line', 4626
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4627
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4628
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4629
# rval: $S6
    null $S6
# switch
.annotate 'line', 4630
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4632
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4633
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4634
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4637
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4640
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4641
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4643
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4644
    self.'annotate'(__ARG_1)
.annotate 'line', 4645
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4647
    .return()
# }
  __label_11: # endif
.annotate 'line', 4650
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4651
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4652
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4653
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4656
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4657
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4659
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4660
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4661
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4664
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4666
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4667
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4670
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4674
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4675
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4676
# }
  __label_21: # endif
.annotate 'line', 4679
    self.'annotate'(__ARG_1)
.annotate 'line', 4680
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4681
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4682
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4683

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4549
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
.annotate 'line', 4692
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4693

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4696
    self.'optimizearg'()
.annotate 'line', 4697
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4698
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4699
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4700
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4701
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4702
# var lval: $P3
    null $P3
.annotate 'line', 4703
# var rval: $P4
    null $P4
.annotate 'line', 4704
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4705
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4706
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4707
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4708
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4709
    eq $I2, 0, __label_7
.annotate 'line', 4710
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
.annotate 'line', 4713
    $P5 = WSubId_62($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4714
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4715
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4716
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4717
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4718
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4719
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N4, $N1, $N2
    .tailcall WSubId_61($P5, $P6, $N4)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4723
    .return(self)
# }
.annotate 'line', 4724

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4727
    .return('N')
# }
.annotate 'line', 4728

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4731
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4732
# var aux: $P2
    null $P2
.annotate 'line', 4733
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4734
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4735
    $P2 = self.'tempreg'('N')
.annotate 'line', 4736
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4737
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4739
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4740
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4741
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4742
    $P2 = self.'tempreg'('N')
.annotate 'line', 4743
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4744
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4746
    self.'annotate'(__ARG_1)
.annotate 'line', 4747
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4748

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4688
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
.annotate 'line', 4757
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4758

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4761
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4762
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4763
    self.'annotate'(__ARG_1)
.annotate 'line', 4764
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4765

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4768
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4769

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4753
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
.annotate 'line', 4778
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4779

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4782
    .return('I')
# }
.annotate 'line', 4783

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4786
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4787
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4788
    self.'annotate'(__ARG_1)
.annotate 'line', 4793
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4794

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 4774
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
.annotate 'line', 4803
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4804

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4807
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
.annotate 'line', 4808
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4809
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4810
    self.'annotate'(__ARG_1)
.annotate 'line', 4811
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4812

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4815
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4816

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 4799
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
.annotate 'line', 4825
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4826

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4829
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
.annotate 'line', 4830
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4831
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4832
    self.'annotate'(__ARG_1)
.annotate 'line', 4833
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4834

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4837
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4838

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 4821
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4847
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4848

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4851
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4852
# setname: $S1
    set $S1, ''
.annotate 'line', 4853
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4854
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4856
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4859
    set $I2, 1
# switch
.annotate 'line', 4860
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
.annotate 'line', 4864
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4865
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 4866
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 4867
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4870
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4875
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4878
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4881
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4876
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4879
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4882
    __ARG_1.'print'(' :named')
.annotate 'line', 4883
    eq $S1, '', __label_17
.annotate 'line', 4884
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4885
# }
.annotate 'line', 4887

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 4843
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4896
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4897
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4898

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4901
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4902
    .return(self)
# }
.annotate 'line', 4903

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4906
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4907

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 4892
    addattribute $P0, 'arg'
.annotate 'line', 4893
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 4912
# var modifier: $P1
    null $P1
.annotate 'line', 4913
# var expr: $P2
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 4914
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4915
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4916
    $P3 = __ARG_1.'get'()
.annotate 'line', 4917
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 4918
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 4921
    WSubId_40('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4924
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4925
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4926

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4937
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4938
    setattribute self, 'start', __ARG_2
.annotate 'line', 4939
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4940
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4941
    __ARG_3.'unget'($P1)
.annotate 'line', 4942
    $P3 = WSubId_36(__ARG_3, __ARG_1, WSubId_63, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 4944

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4947
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4948
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4946
    elements $I1, $P1
  __label_1:
.annotate 'line', 4948
    .return($I1)
# }
.annotate 'line', 4949

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4952
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4953

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4956
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4957
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4958

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4961
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4962
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4963

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 4966
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 4967
    .return(self)
# }
.annotate 'line', 4968

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4971
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4972
    unless_null $P1, __label_1
# {
.annotate 'line', 4973
    new $P2, ['ResizableStringArray']
.annotate 'line', 4974
# pnull: $S1
    set $S1, ''
.annotate 'line', 4975
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4976
    if_null $P3, __label_2
# {
.annotate 'line', 4977
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4978
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4979
# reg: $S2
    null $S2
.annotate 'line', 4980
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4981
    ne $S1, '', __label_7
# {
.annotate 'line', 4982
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4983
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4985
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4988
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4989
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4992
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4994
    .return($P1)
# }
.annotate 'line', 4995

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4998
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4999
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5001
# sep: $S1
    set $S1, ''
.annotate 'line', 5002
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5003
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5004
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5005
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5006
    if_null $P3, __label_4
.annotate 'line', 5007
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5008
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5003
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5010

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 4930
    addattribute $P0, 'owner'
.annotate 'line', 4931
    addattribute $P0, 'start'
.annotate 'line', 4932
    addattribute $P0, 'args'
.annotate 'line', 4933
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_64')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5015
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5016
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5017
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5018
    .return(1)
# }
.annotate 'line', 5019

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5030
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5031
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5032
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5033

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5036
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5037

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5040
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5041
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5042
    new $P3, ['ResizableStringArray']
.annotate 'line', 5043
# var arg: $P4
    null $P4
.annotate 'line', 5044
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5045
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5047
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5048
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5050
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5051
    ne $S1, '', __label_9
# {
.annotate 'line', 5052
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5053
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5055
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5057
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5061
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5062
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5063
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5064
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 5065
    .return()
  __label_2: # default
.annotate 'line', 5067
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5068
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5069
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5070
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5071
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5072
# argr: $S5
    null $S5
.annotate 'line', 5073
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5074
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
.annotate 'line', 5078
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5079
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5082
    ne $S1, '', __label_24
# {
.annotate 'line', 5083
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5084
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5086
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5090
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5091
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5093
# aux: $S6
    null $S6
.annotate 'line', 5094
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5095
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
.annotate 'line', 5097
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
.annotate 'line', 5101
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5102
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 5105
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 5111
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5112
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 5115
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5119
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5068
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5122
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5123

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 5023
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5025
    addattribute $P0, 'predef'
.annotate 'line', 5026
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'genpredefcallexpr' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 5130
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5131
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5132
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 5133
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 5136
    isa $I2, __ARG_2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 5137
    $P3 = WSubId_64($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5138
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 5139
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 5143
    new $P4, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P5, $P6, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 5144

.end # genpredefcallexpr

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5153
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5154
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5155
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5156
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5157
    __ARG_1.'unget'($P1)
.annotate 'line', 5158
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5160

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5161
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5164
# var funref: $P1
    getattribute $P4, self, 'funref'
    $P1 = $P4.'optimize'()
.annotate 'line', 5165
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5166
# nargs: $I1
    null $I1
.annotate 'line', 5167
    if_null $P2, __label_1
# {
.annotate 'line', 5168
    $P2 = $P2.'optimize'()
.annotate 'line', 5169
    $P4 = $P2.'numargs'()
    set $I1, $P4
# }
  __label_1: # endif
.annotate 'line', 5172
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5173
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P5.'CallMemberExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 5174
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5175
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P5.'CallMemberRefExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_3: # endif
.annotate 'line', 5178
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 5179
# callname: $S1
    $P5 = $P1.'getName'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 5180
# var predef: $P3
    $P3 = WSubId_65($S1, $I1)
.annotate 'line', 5181
    if_null $P3, __label_6
.annotate 'line', 5182
    getattribute $P4, self, 'owner'
    .tailcall WSubId_66($P4, $P3, $P2)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 5185
    setattribute self, 'funref', $P1
.annotate 'line', 5186
    setattribute self, 'args', $P2
.annotate 'line', 5187
    .return(self)
# }
.annotate 'line', 5188

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5191
    .return(1)
# }
.annotate 'line', 5192

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5195
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5196
# call: $S1
    null $S1
.annotate 'line', 5198
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5199
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5200
    ne $S1, '', __label_4
# {
.annotate 'line', 5201
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P1.'getName'()
    push $P3, $P5
    $P2 = self.'findsymbol'($P3)
.annotate 'line', 5202
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_7
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
  __label_7:
    unless $I1 goto __label_5
.annotate 'line', 5203
    $P3 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P3
    goto __label_6
  __label_5: # else
.annotate 'line', 5205
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
.annotate 'line', 5209
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5210
    .return($S1)
# }
.annotate 'line', 5211

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5214
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5215
    if_null $P1, __label_1
.annotate 'line', 5216
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5217

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5220
    __ARG_1.'print'('(')
.annotate 'line', 5221
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5222
    if_null $P1, __label_1
.annotate 'line', 5223
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5224
    __ARG_1.'say'(')')
# }
.annotate 'line', 5225

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5228
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5229
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5231
    self.'annotate'(__ARG_1)
.annotate 'line', 5233
    __ARG_1.'print'('    ')
.annotate 'line', 5234
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5235
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5236
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5238
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5241
    __ARG_1.'print'($S1)
.annotate 'line', 5242
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5243

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5146
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5148
    addattribute $P0, 'funref'
.annotate 'line', 5149
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5257
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5258
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5259
    setattribute self, 'args', __ARG_3
.annotate 'line', 5264
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5265
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5266
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5267
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5268
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5269
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5270
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5271
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5272
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5273
    if_null $P4, __label_6
# {
.annotate 'line', 5274
    setattribute self, 'sym', $P4
.annotate 'line', 5275
    isa $I1, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_7
# {
.annotate 'line', 5276
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
.annotate 'line', 5277
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
.annotate 'line', 5282

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5285
    getattribute $P3, self, 'sym'
    if_null $P3, __label_1
# {
.annotate 'line', 5286
    getattribute $P4, self, 'subid'
    if_null $P4, __label_2
.annotate 'line', 5287
    getattribute $P5, self, 'subid'
    .return($P5)
  __label_2: # endif
.annotate 'line', 5288
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5289
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5290
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5292
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5293
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P2.'emit_left_get'(__ARG_1)
    push $P3, $P5
    box $P4, ".'"
    push $P3, $P4
.annotate 'line', 5294
    $P6 = $P2.'get_member'()
.annotate 'line', 5293
    push $P3, $P6
    box $P4, "'"
    push $P3, $P4
# predefined join
.annotate 'line', 5284
    join $S1, "", $P3
.annotate 'line', 5293
    .return($S1)
# }
.annotate 'line', 5295

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5251
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5253
    addattribute $P0, 'sym'
.annotate 'line', 5254
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5305
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5306
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5307
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5308

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5311
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5312
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5313
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5314
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5315
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5318
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5319
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5320
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5321

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5301
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
.annotate 'line', 5331
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5332
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5333

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5336
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5337
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5338
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5339
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5340
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5341
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5342
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5344
    .return($S2)
# }
.annotate 'line', 5345

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5326
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5328
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
.annotate 'line', 5354
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5355
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5356

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5357
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5360
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5361
    .return(self)
# }
.annotate 'line', 5362

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5365
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5366
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5367
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5369
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5370
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5371

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5374
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5375

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5378
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5379
    self.'annotate'(__ARG_1)
.annotate 'line', 5380
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5381

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5384
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5385
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5386
    .return($S1)
# }
.annotate 'line', 5387

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5390
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5391
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5392
    self.'annotate'(__ARG_1)
.annotate 'line', 5393
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5394

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5397
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5398

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5401
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5402
# value: $S2
    null $S2
.annotate 'line', 5403
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5405
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5406
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5407
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5409
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5412
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5413
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5415
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5416

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5419
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5420
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5421
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5422
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5424
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5425
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5426
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5428
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5430
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5431
    .return($S2)
# }
.annotate 'line', 5432

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5348
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5350
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
.annotate 'line', 5443
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5444
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5445

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5446
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5449
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5450
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5451
    .return(self)
# }
.annotate 'line', 5452

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 5455
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5456
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5457
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5458
    WSubId_40("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5459
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5460
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5461
    self.'annotate'(__ARG_1)
.annotate 'line', 5462
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5463
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5464
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5465

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 5468
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5469
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5470
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5471
    WSubId_40("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5472
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5473
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5474
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5475
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5477
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5479
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5480
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5481
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5485
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5486
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5487
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5490
    self.'annotate'(__ARG_1)
.annotate 'line', 5491
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5492
    .return($S3)
# }
.annotate 'line', 5493

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5438
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5440
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
.annotate 'line', 5507
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5508
    setattribute self, 'left', __ARG_4
.annotate 'line', 5509
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5510

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5513
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5514
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5516
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5517

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5520
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5521
    setattribute self, 'left', $P1
.annotate 'line', 5522
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5523
    $P2.'optimizeargs'()
.annotate 'line', 5527
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5528
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5529
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5530
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5531
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5532
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5533
# predefined substr
.annotate 'line', 5532
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5534
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5537
    .return(self)
# }
.annotate 'line', 5538

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5541
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5542
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5543
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5544
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5545
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5546
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5544
    setattribute self, 'regleft', $P3
.annotate 'line', 5547
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5548

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5551
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5552
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5553
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5554
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5555
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5556
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5557
    __ARG_1.'print'(']')
# }
.annotate 'line', 5558

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5561
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5562
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5563
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5564
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5565
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5566
    eq $I1, 1, __label_4
.annotate 'line', 5567
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5568
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5569
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5570
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5573
    self.'annotate'(__ARG_1)
.annotate 'line', 5574
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5575
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5576
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5578

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5581
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5582
    self.'annotate'(__ARG_1)
.annotate 'line', 5583
    __ARG_1.'print'('    ')
.annotate 'line', 5584
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5585
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5586

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5589
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5590
# rreg: $S1
    null $S1
.annotate 'line', 5591
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5592
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5593
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5596
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5597
    self.'annotate'(__ARG_1)
.annotate 'line', 5598
    __ARG_1.'print'('    ')
.annotate 'line', 5599
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5600
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5601
    .return($S1)
# }
.annotate 'line', 5602

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5498
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5500
    addattribute $P0, 'left'
.annotate 'line', 5501
    addattribute $P0, 'regleft'
.annotate 'line', 5502
    addattribute $P0, 'args'
.annotate 'line', 5503
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
.annotate 'line', 5613
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5614
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5615
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5616
    __ARG_1.'unget'($P1)
.annotate 'line', 5617
    $P3 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5619

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5620
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5623
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5624
    .return(self)
# }
.annotate 'line', 5625

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5628
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5629
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5630
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5636
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5638

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5641
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5642
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5643
    .return($S1)
# }
.annotate 'line', 5644

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5647
    self.'annotate'(__ARG_1)
.annotate 'line', 5648
# itemreg: $S1
    null $S1
.annotate 'line', 5649
# it_p: $S2
    null $S2
.annotate 'line', 5650
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5651
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5652
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5654
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5655
    if_null $P1, __label_2
# {
.annotate 'line', 5656
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5657
    $P3 = $P2.'checkresult'()
    set $S4, $P3
    set $S5, 'I'
    if $S4 == $S5 goto __label_7
    set $S5, 'N'
    if $S4 == $S5 goto __label_8
    set $S5, 'S'
    if $S4 == $S5 goto __label_9
    goto __label_6
  __label_7: # case
  __label_8: # case
  __label_9: # case
.annotate 'line', 5659
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5660
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5661
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5662
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5666
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5667
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5668
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5669
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5673
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5675
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5676
    self.'annotate'(__ARG_1)
.annotate 'line', 5677
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5681

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5607
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5609
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
.annotate 'line', 5693
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5694
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5695
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5696
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5697
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5698
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5699
# {
.annotate 'line', 5700
# var key: $P4
    $P4 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5701
    WSubId_54(':', __ARG_1)
.annotate 'line', 5702
# var value: $P5
    $P5 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5703
# predefined push
    push $P2, $P4
.annotate 'line', 5704
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5706
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5707
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5708
    WSubId_40("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5710
    setattribute self, 'keys', $P2
.annotate 'line', 5711
    setattribute self, 'values', $P3
# }
.annotate 'line', 5712

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5713
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5716
    getattribute $P1, self, 'keys'
    WSubId_38($P1)
.annotate 'line', 5717
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5718
    .return(self)
# }
.annotate 'line', 5719

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5722
    self.'annotate'(__ARG_1)
.annotate 'line', 5727
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5728
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5730
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5731
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5732
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5733
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5734
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5735
# item: $S1
    null $S1
.annotate 'line', 5736
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5737
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5738
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5739
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5742
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5744
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5745
# itemreg: $S3
    null $S3
.annotate 'line', 5746
# it_p: $S4
    null $S4
.annotate 'line', 5747
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 5748
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 5749
# aux: $S5
    null $S5
# switch
.annotate 'line', 5750
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
.annotate 'line', 5752
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 5753
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 5754
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 5755
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 5759
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 5760
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 5761
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5762
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 5766
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 5768
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 5769
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5733
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5771

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5774
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5775
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5776
    .return($S1)
# }
.annotate 'line', 5777

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5686
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5688
    addattribute $P0, 'keys'
.annotate 'line', 5689
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5790
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5795
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5796

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5799
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5800
    if_null $P1, __label_1
.annotate 'line', 5801
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5802

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5805
    self.'optimize_initializer'()
.annotate 'line', 5806
    .return(self)
# }
.annotate 'line', 5807

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5810
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5811
    if_null $P1, __label_1
.annotate 'line', 5812
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5813
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5814
    if_null $P1, __label_2
.annotate 'line', 5815
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5816
    __ARG_1.'say'(")")
# }
.annotate 'line', 5817

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 5782
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5784
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
.annotate 'line', 5828
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5830
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 5831
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5832
    setattribute self, 'value', __ARG_4
.annotate 'line', 5833
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5835
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 5836
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5838
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5839

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5842
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5843
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5846
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5847
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5848
    $P1 = $P2.'getvalue'()
.annotate 'line', 5849
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 5850
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5851
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5854
    self.'optimize_initializer'()
.annotate 'line', 5855
    .return(self)
# }
.annotate 'line', 5856

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
.annotate 'line', 5859
    self.'annotate'(__ARG_1)
.annotate 'line', 5861
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5862
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5865
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5866
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
.annotate 'line', 5868
# reginit: $S1
    set $S1, ''
.annotate 'line', 5869
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5870
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5871
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
.annotate 'line', 5876
    ne $I2, 1, __label_13
# {
.annotate 'line', 5877
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5878
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5881
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5882
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5883
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5887
    eq $I2, 1, __label_16
.annotate 'line', 5888
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 5889
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5890
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5893
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5896
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5897
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5898
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 5899
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_67($S5, $P8)
  __label_23: # endif
.annotate 'line', 5903
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5904
    le $I1, 1, __label_25
# {
.annotate 'line', 5905
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5909
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5910
    unless_null $P4, __label_26
# {
.annotate 'line', 5912
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5913
    if_null $P5, __label_28
# {
.annotate 'line', 5914
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5917
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.annotate 'line', 5918
    WSubId_67('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5919
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5921
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5925
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5929
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5931
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5932
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5933
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5934
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5936

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5939
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5940

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 5822
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5824
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5951
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5952
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5953
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5954
    setattribute self, 'nskey', $P1
.annotate 'line', 5955
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5956
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5957
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5959
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5960

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5963
# reginit: $S1
    null $S1
.annotate 'line', 5964
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5965
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5966
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5970
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5971
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5974
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 5976
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5977
    __ARG_1.'print'('    ')
.annotate 'line', 5978
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5979
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5980
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5981
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5982
    if_null $S1, __label_8
.annotate 'line', 5983
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5984
    __ARG_1.'say'()
# }
.annotate 'line', 5985

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 5945
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5947
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5996
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5997
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5998
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5999
    setattribute self, 'nskey', $P1
.annotate 'line', 6000
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6001
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6002
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6004
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6005

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6008
# reginit: $S1
    null $S1
.annotate 'line', 6009
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6011
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 6012
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6013
    le $I1, 0, __label_4
.annotate 'line', 6014
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 6015
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6016
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 6017
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6018
    __ARG_1.'say'()
.annotate 'line', 6020
    lt $I1, 0, __label_5
# {
.annotate 'line', 6021
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6022
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6023
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 6025

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 5990
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5992
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6032
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6035
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6039
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6042
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6037
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6038
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6037
    .return($P3)
  __label_4: # case
.annotate 'line', 6041
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6045
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6046
    __ARG_1.'unget'($P2)
.annotate 'line', 6047
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6049
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6054
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6056

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 6067
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6068
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6069
    $P2 = WSubId_60(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6070

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6073
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6074
    .return(self)
# }
.annotate 'line', 6075

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6076
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6079
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6080
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6081
    eq $S1, 'P', __label_2
.annotate 'line', 6082
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6083
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6085
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
.annotate 'line', 6086
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6087
    self.'annotate'(__ARG_1)
.annotate 'line', 6088
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6089
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6090
    __ARG_1.'say'()
# }
.annotate 'line', 6091

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6060
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6062
    addattribute $P0, 'lexpr'
.annotate 'line', 6063
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
.annotate 'line', 6108
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6109
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6110
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6111
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6112
    .return(self)
# }
.annotate 'line', 6113

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6116
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6117
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6119
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6121
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6123
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6124
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6125
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6127

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6130
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6131
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6132
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6134
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6135

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6138
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6139
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6140
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6141
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6142
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6143
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6144
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6146
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6147
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6148
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6149
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6150
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6151
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6153
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6154
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6155
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6156
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6159
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6161
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6162

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6096
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6102
    addattribute $P0, 'condition'
.annotate 'line', 6103
    addattribute $P0, 'etrue'
.annotate 'line', 6104
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
.annotate 'line', 6206
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
.annotate 'line', 6207
    .return(1)
  __label_4: # case
.annotate 'line', 6208
    .return(2)
  __label_5: # case
.annotate 'line', 6209
    .return(3)
  __label_2: # default
.annotate 'line', 6210
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6212

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_72')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6216
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
.annotate 'line', 6217
    .return(8)
  __label_4: # case
.annotate 'line', 6218
    .return(11)
  __label_5: # case
.annotate 'line', 6219
    .return(9)
  __label_6: # case
.annotate 'line', 6220
    .return(10)
  __label_2: # default
.annotate 'line', 6222
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6223
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6224
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6226

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6230
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
.annotate 'line', 6231
    .return(19)
  __label_4: # case
.annotate 'line', 6232
    .return(20)
  __label_5: # case
.annotate 'line', 6233
    .return(21)
  __label_6: # case
.annotate 'line', 6234
    .return(22)
  __label_2: # default
.annotate 'line', 6235
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6237

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6241
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6242
    .return(28)
  __label_4: # case
.annotate 'line', 6243
    .return(29)
  __label_2: # default
.annotate 'line', 6244
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6246

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6250
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
.annotate 'line', 6251
    .return(14)
  __label_4: # case
.annotate 'line', 6252
    .return(16)
  __label_5: # case
.annotate 'line', 6253
    .return(15)
  __label_6: # case
.annotate 'line', 6254
    .return(17)
  __label_2: # default
.annotate 'line', 6256
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6257
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6259

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6263
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
.annotate 'line', 6264
    .return(12)
  __label_4: # case
.annotate 'line', 6265
    .return(13)
  __label_5: # case
.annotate 'line', 6266
    .return(25)
  __label_6: # case
.annotate 'line', 6267
    .return(26)
  __label_2: # default
.annotate 'line', 6268
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6270

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_91')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6274
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
.annotate 'line', 6275
    .return(4)
  __label_4: # case
.annotate 'line', 6276
    .return(5)
  __label_5: # case
.annotate 'line', 6277
    .return(6)
  __label_6: # case
.annotate 'line', 6278
    .return(18)
  __label_7: # case
.annotate 'line', 6279
    .return(23)
  __label_8: # case
.annotate 'line', 6280
    .return(24)
  __label_9: # case
.annotate 'line', 6281
    .return(30)
  __label_2: # default
.annotate 'line', 6282
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6284

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 6288
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6289
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6292
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6296
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6298
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6300
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6302
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6304
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6306
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6308
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6310
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6312
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6293
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 6294
    WSubId_54(')', __ARG_1)
.annotate 'line', 6295
    .return($P2)
  __label_4: # case
.annotate 'line', 6297
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6299
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6301
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6303
    new $P10, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P10.'IntegerLiteral'(__ARG_2, $P1)
    set $P9, $P10
    .return($P9)
  __label_8: # case
.annotate 'line', 6305
    new $P12, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P12.'FloatLiteral'(__ARG_2, $P1)
    set $P11, $P12
    .return($P11)
  __label_9: # case
.annotate 'line', 6307
    .tailcall WSubId_68(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6309
    new $P14, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P14.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6311
    new $P16, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P16.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P15, $P16
    .return($P15)
  __label_12: # case
.annotate 'line', 6313
    new $P18, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P18.'IdentifierExpr'(__ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_2: # default
.annotate 'line', 6315
    WSubId_40('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6317

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6321
# var subexp: $P1
    $P1 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6322
# var t: $P2
    null $P2
.annotate 'line', 6323
# var start: $P3
    null $P3
.annotate 'line', 6324
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6325
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_70($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6326
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6328
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6331
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6334
    set $P3, $P2
.annotate 'line', 6335
    $P2 = __ARG_1.'get'()
.annotate 'line', 6336
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6337
# var right: $P4
    $P4 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6338
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6341
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6344
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6347
    __ARG_1.'unget'($P2)
.annotate 'line', 6348
    .return($P1)
# }
.annotate 'line', 6349

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 6353
# var subexp: $P1
    $P1 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6354
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6356
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6358
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6357
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6359
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6361
    __ARG_1.'unget'($P2)
.annotate 'line', 6362
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6364

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
.annotate 'line', 6368
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6369
# code: $I1
    $P3 = WSubId_72($P1)
    set $I1, $P3
.annotate 'line', 6370
    eq $I1, 0, __label_1
# {
.annotate 'line', 6371
# var subexpr: $P2
    $P2 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6372
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
.annotate 'line', 6374
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6376
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6378
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6380
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6382
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6384
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6386
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6390
    __ARG_1.'unget'($P1)
.annotate 'line', 6391
    .tailcall WSubId_74(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6393

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6397
# var lexpr: $P1
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6398
# var t: $P2
    null $P2
.annotate 'line', 6399
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6400
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_75($P2)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
.annotate 'line', 6401
# var rexpr: $P3
    $P3 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6402
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
.annotate 'line', 6404
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6407
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6410
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6413
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6416
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6419
    __ARG_1.'unget'($P2)
.annotate 'line', 6420
    .return($P1)
# }
.annotate 'line', 6421

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 6425
# var lexpr: $P1
    $P1 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6426
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6427
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6428
# var rexpr: $P3
    $P3 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6429
# var expr: $P4
    null $P4
.annotate 'line', 6430
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6431
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6433
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6434
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6436
    __ARG_1.'unget'($P2)
.annotate 'line', 6437
    .return($P1)
# }
.annotate 'line', 6438

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6442
# var lexpr: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6443
# var rexpr: $P2
    null $P2
.annotate 'line', 6444
# var t: $P3
    null $P3
.annotate 'line', 6445
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6446
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_78($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6447
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6449
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6450
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6453
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6454
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6457
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6460
    __ARG_1.'unget'($P3)
.annotate 'line', 6461
    .return($P1)
# }
.annotate 'line', 6462

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6466
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6467
# var rexpr: $P2
    null $P2
.annotate 'line', 6468
# var t: $P3
    null $P3
.annotate 'line', 6469
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6470
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_80($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6471
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
.annotate 'line', 6473
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6474
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6477
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6478
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6481
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6482
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6485
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6486
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6489
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6492
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6495
    __ARG_1.'unget'($P3)
.annotate 'line', 6496
    .return($P1)
# }
.annotate 'line', 6497

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6501
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6502
# var rexpr: $P2
    null $P2
.annotate 'line', 6503
# var t: $P3
    null $P3
.annotate 'line', 6504
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6505
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6506
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
.annotate 'line', 6508
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6509
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6512
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6513
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6516
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6517
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6520
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6521
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6524
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6527
    __ARG_1.'unget'($P3)
.annotate 'line', 6528
    .return($P1)
# }
.annotate 'line', 6529

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
# Body
# {
.annotate 'line', 6533
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6534
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6535
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6536
# var rexpr: $P3
    $P3 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6537
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6539
    __ARG_1.'unget'($P2)
.annotate 'line', 6540
    .return($P1)
# }
.annotate 'line', 6541

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_84 = "WSubId_84"
# Body
# {
.annotate 'line', 6545
# var lexpr: $P1
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6546
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6547
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6548
# var rexpr: $P3
    $P3 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6549
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6551
    __ARG_1.'unget'($P2)
.annotate 'line', 6552
    .return($P1)
# }
.annotate 'line', 6553

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
# Body
# {
.annotate 'line', 6557
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6558
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6559
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6560
# var rexpr: $P3
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6561
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6563
    __ARG_1.'unget'($P2)
.annotate 'line', 6564
    .return($P1)
# }
.annotate 'line', 6565

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6569
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6570
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6571
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6572
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6573
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6575
    __ARG_1.'unget'($P2)
.annotate 'line', 6576
    .return($P1)
# }
.annotate 'line', 6577

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6581
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6582
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6583
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6584
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6585
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6587
    __ARG_1.'unget'($P2)
.annotate 'line', 6588
    .return($P1)
# }
.annotate 'line', 6589

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6593
# var econd: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6594
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6595
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6596
# var etrue: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6597
    WSubId_54(':', __ARG_1)
.annotate 'line', 6598
# var efalse: $P4
    $P4 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6599
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6602
    __ARG_1.'unget'($P2)
.annotate 'line', 6603
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6605

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
.annotate 'line', 6609
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6610
# var t: $P2
    null $P2
.annotate 'line', 6611
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6612
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_91($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
.annotate 'line', 6613
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6614
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6615
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
.annotate 'line', 6617
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6620
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6623
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6626
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6629
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6632
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6635
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6638
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6640
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6641
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6643
    __ARG_1.'unget'($P2)
.annotate 'line', 6644
    .return($P1)
# }
.annotate 'line', 6645

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6649
    .tailcall WSubId_89(__ARG_1, __ARG_2)
# }
.annotate 'line', 6650

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6665
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6666
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6667
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6668
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6669
    .return($S1)
# }
.annotate 'line', 6670

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6673
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6674
    unless_null $P1, __label_1
.annotate 'line', 6675
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6676
    .return($P1)
# }
.annotate 'line', 6677

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6661
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6686
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6687
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6688
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6689
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6690
    .return($S1)
# }
.annotate 'line', 6691

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6694
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6695
    unless_null $P1, __label_1
.annotate 'line', 6696
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6697
    .return($P1)
# }
.annotate 'line', 6698

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6680
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6682
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6714
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6715
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6716
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6717
    __ARG_2.'unget'($P1)
.annotate 'line', 6718
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6720

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6723
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6724
    if_null $P1, __label_1
.annotate 'line', 6725
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6726
    .return(self)
# }
.annotate 'line', 6727

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6731
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6732
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6735
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6736
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6737
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6738
    self.'annotate'(__ARG_1)
.annotate 'line', 6739
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6743
    le $I1, 0, __label_6
.annotate 'line', 6744
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6746
    self.'annotate'(__ARG_1)
.annotate 'line', 6747
    self.'emitret'(__ARG_1)
.annotate 'line', 6748
    le $I1, 0, __label_7
.annotate 'line', 6749
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6750
    __ARG_1.'say'(')')
# }
.annotate 'line', 6751

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 6708
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6710
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6758
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6759

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6762
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6763

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 6754
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
.annotate 'line', 6770
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6771

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6774
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6775

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 6766
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6788
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6789
    setattribute self, 'name', __ARG_1
.annotate 'line', 6790
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6791

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6792
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6795
    self.'annotate'(__ARG_1)
.annotate 'line', 6796
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6797

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 6782
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6784
    addattribute $P0, 'name'
.annotate 'line', 6785
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6811
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6812
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6813

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6814
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6817
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6818
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6819
    .return($S2)
# }
.annotate 'line', 6820

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 6806
    addattribute $P0, 'owner'
.annotate 'line', 6807
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6833
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6834
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6835
    WSubId_92($P1)
.annotate 'line', 6836
    setattribute self, 'label', $P1
.annotate 'line', 6837
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6838

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6839
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6842
    self.'annotate'(__ARG_1)
.annotate 'line', 6843
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6844
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6845
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6846

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 6827
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6829
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6857
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6858

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6861
    WSubId_54('(', __ARG_1)
.annotate 'line', 6862
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6863
    WSubId_54(')', __ARG_1)
# }
.annotate 'line', 6864

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 6853
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
.annotate 'line', 6877
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6878
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6879
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6880
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6881
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6882
    $P4 = WSubId_93(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6884
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6885
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6887

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6890
    self.'optimize_condition'()
.annotate 'line', 6891
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6892
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6893
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6895
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6897
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6899
    .return(self)
# }
.annotate 'line', 6900

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6903
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6904
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6905
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6906
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6907
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6908
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6909
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6910
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6911
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6912
    self.'annotate'(__ARG_1)
.annotate 'line', 6913
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6914
    $P1.'emit'(__ARG_1)
.annotate 'line', 6916
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6917
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6918
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6919
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6921
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6922

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 6871
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6873
    addattribute $P0, 'truebranch'
.annotate 'line', 6874
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 6934
    $P2 = WSubId_93(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6935

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6938
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6939
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6941
    self.'annotate'(__ARG_1)
.annotate 'line', 6942
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6943
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6944
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6945
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6946

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 6929
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6931
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6957
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6958
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6959
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6960

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6963
    self.'optimize_condition'()
.annotate 'line', 6964
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6965
    .return(self)
# }
.annotate 'line', 6966

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6969
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6971
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6974
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6977
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6978
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6980
    self.'annotate'(__ARG_1)
.annotate 'line', 6981
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6982
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6983
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6984
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6985
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6987

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 6953
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
.annotate 'line', 6998
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6999
    self.'parsebody'(__ARG_2)
.annotate 'line', 7000
    WSubId_94('while', __ARG_2)
.annotate 'line', 7001
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7002

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7005
    self.'optimize_condition'()
.annotate 'line', 7006
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7007
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7008
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7009
    setattribute self, 'body', $P1
.annotate 'line', 7010
    .return(self)
# }
.annotate 'line', 7011

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7014
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7015
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7016
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7018
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7021
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7022
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7023
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7025
    self.'annotate'(__ARG_1)
.annotate 'line', 7026
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7028
    $P1.'emit'(__ARG_1)
.annotate 'line', 7029
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7030
    eq $I1, 2, __label_7
.annotate 'line', 7031
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7032
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7034

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 6994
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
.annotate 'line', 7045
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7046
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7047

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7048
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7051
    self.'annotate'(__ARG_1)
.annotate 'line', 7052
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7053
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7054

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7041
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
.annotate 'line', 7065
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7066
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7067

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7068
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7071
    self.'annotate'(__ARG_1)
.annotate 'line', 7072
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7073
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7074

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7061
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7089
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7090
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7091
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7092
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7093

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 7096
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7097
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7098
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7099
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_37(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7100
    $P1 = __ARG_1.'get'()
.annotate 'line', 7101
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7102
    WSubId_40("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7103
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7104
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
.annotate 'line', 7105
    __ARG_1.'unget'($P1)
.annotate 'line', 7106
    $P3 = WSubId_93(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7108
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7109
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7112
    $P1 = __ARG_1.'get'()
.annotate 'line', 7113
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7114
    WSubId_40("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7115
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
.annotate 'line', 7116
    __ARG_1.'unget'($P1)
.annotate 'line', 7117
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_93(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7119
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7122
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7123
    WSubId_40("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7124

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7127
    getattribute $P2, self, 'case_value'
    WSubId_38($P2)
.annotate 'line', 7128
    getattribute $P2, self, 'case_st'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7129
    WSubId_38($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7130
    getattribute $P2, self, 'default_st'
    WSubId_38($P2)
# }
.annotate 'line', 7131

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7081
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7083
    addattribute $P0, 'case_value'
.annotate 'line', 7084
    addattribute $P0, 'case_st'
.annotate 'line', 7085
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
.annotate 'line', 7144
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7145
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7146
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7147
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7148
    WSubId_40("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7149
    $P1 = __ARG_2.'get'()
.annotate 'line', 7150
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7151
    WSubId_40("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7152
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7153

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7156
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7157
    self.'optimize_cases'()
.annotate 'line', 7158
    .return(self)
# }
.annotate 'line', 7159

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7163
# type: $S1
    set $S1, ''
.annotate 'line', 7164
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7165
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7166
    ne $S2, 'N', __label_4
.annotate 'line', 7167
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7168
    ne $S1, '', __label_5
.annotate 'line', 7169
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7170
    eq $S1, $S2, __label_7
.annotate 'line', 7171
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7174
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7175
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7179
    ne $S1, '', __label_8
.annotate 'line', 7180
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7182
    __ARG_1.'comment'('switch')
.annotate 'line', 7183
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7184
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7185
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7187
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7188
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7192
    self.'genbreaklabel'()
.annotate 'line', 7193
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7194
    new $P4, ['ResizableStringArray']
.annotate 'line', 7195
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7196
    getattribute $P7, self, 'case_value'
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7197
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7198
# predefined push
    push $P4, $S7
.annotate 'line', 7199
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7200
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7202
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7205
    self.'annotate'(__ARG_1)
.annotate 'line', 7206
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7207
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7208
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7209
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7210
    $P7 = $P6[$I2]
    WSubId_52(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7208
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7213
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7214
    getattribute $P7, self, 'default_st'
    WSubId_52(__ARG_1, $P7)
.annotate 'line', 7216
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7217

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7138
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7140
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7229
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7230
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7231

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7234
    self.'optimize_cases'()
.annotate 'line', 7235
    .return(self)
# }
.annotate 'line', 7236

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7240
    self.'genbreaklabel'()
.annotate 'line', 7241
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7242
    new $P1, ['ResizableStringArray']
.annotate 'line', 7244
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7245
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7246
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7247
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7248
# predefined push
    push $P1, $S3
.annotate 'line', 7249
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7250
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7252
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7255
    self.'annotate'(__ARG_1)
.annotate 'line', 7256
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7257
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7258
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7259
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7260
    $P4 = $P3[$I2]
    WSubId_52(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7258
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7263
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7264
    getattribute $P4, self, 'default_st'
    WSubId_52(__ARG_1, $P4)
.annotate 'line', 7266
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7267

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7224
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
.annotate 'line', 7274
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7275
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7276
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7277
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7278
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7279
    WSubId_40("'(' in switch", $P1)
# }
.annotate 'line', 7280

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7293
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7294
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7295
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7296
    __ARG_2.'unget'($P1)
.annotate 'line', 7297
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7299
    $P1 = __ARG_2.'get'()
.annotate 'line', 7300
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7301
    __ARG_2.'unget'($P1)
.annotate 'line', 7302
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7303
    WSubId_54(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7305
    $P1 = __ARG_2.'get'()
.annotate 'line', 7306
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7307
    __ARG_2.'unget'($P1)
.annotate 'line', 7308
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7309
    WSubId_54(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7311
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7312

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7315
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7316
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7317
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7318
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7319
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7320
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7321
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7322
    .return(self)
# }
.annotate 'line', 7323

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7326
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7327
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7328
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7329
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7330
    .return()
# }
  __label_1: # endif
.annotate 'line', 7332
    __ARG_1.'comment'('for loop')
.annotate 'line', 7333
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7334
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7335
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7336
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7337
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7339
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7340
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7341
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7343
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7344
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7345
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7346
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7347
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7349
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7350

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7286
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7288
    addattribute $P0, 'initializer'
.annotate 'line', 7289
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
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 7365
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7366
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7367
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7368
# deftype: $S2
    $P1 = WSubId_95(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7369
    self.'createvar'($S1, $S2)
.annotate 'line', 7370
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7372
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7373
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7374
    WSubId_54(')', __ARG_2)
.annotate 'line', 7375
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7376

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7379
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7380
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7381
    .return(self)
# }
.annotate 'line', 7382

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7385
    self.'annotate'(__ARG_1)
.annotate 'line', 7386
# regcont: $S1
    null $S1
.annotate 'line', 7387
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7388
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7389
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7390
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7393
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7395
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7396
    unless_null $P1, __label_4
.annotate 'line', 7397
    getattribute $P2, self, 'varname'
    WSubId_59($P2)
  __label_4: # endif
.annotate 'line', 7399
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7400
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7401
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7402
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7403
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7404
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7405
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7406
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7407
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7408
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7409
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7410

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7357
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7359
    addattribute $P0, 'deftype'
.annotate 'line', 7360
    addattribute $P0, 'varname'
.annotate 'line', 7361
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
.annotate 'line', 7417
    WSubId_54('(', __ARG_2)
.annotate 'line', 7418
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7419
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7420
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7421
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7423
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7424
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7425
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7426
    __ARG_2.'unget'($P3)
.annotate 'line', 7427
    __ARG_2.'unget'($P2)
.annotate 'line', 7428
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7430
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7431

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7443
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7444
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7445

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7448
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7449
    .return(self)
# }
.annotate 'line', 7450

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7453
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7454
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7455
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7456
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7458
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7461
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7464
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7466

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7437
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7439
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7478
    setattribute self, 'start', __ARG_1
.annotate 'line', 7479
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7480

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7483
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7484
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7485
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7486
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7487
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
.annotate 'line', 7490
    eq $I1, 1, __label_10
.annotate 'line', 7491
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7492
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7493
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7494
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7498
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7499
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7500
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7501
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7499
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7504
# predefined join
.annotate 'line', 7503
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7507
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7510

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7473
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7475
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 7522
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7523
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7524
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7525
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7527
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7529
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7530
    $P1 = __ARG_2.'get'()
.annotate 'line', 7531
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7532
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7533
    $P1 = __ARG_2.'get'()
.annotate 'line', 7534
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7535
    WSubId_40("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7536
    $P1 = __ARG_2.'get'()
.annotate 'line', 7537
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7538
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7539
    setattribute self, 'exname', $P1
.annotate 'line', 7540
    self.'createvar'($S1, 'P')
.annotate 'line', 7541
    $P1 = __ARG_2.'get'()
.annotate 'line', 7542
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7543
    WSubId_40("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7545
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7546

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7549
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7550
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7551
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7552
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7553
    .return(self)
# }
.annotate 'line', 7554

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7557
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7558
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7559
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7560
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7561
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7562
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7564
    self.'annotate'(__ARG_1)
.annotate 'line', 7565
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7567
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7568
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7570
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7571
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7573
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7574
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7575
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7576
    __ARG_1.'comment'('try: end')
.annotate 'line', 7577
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7579
    self.'annotate'(__ARG_1)
.annotate 'line', 7580
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7582
    __ARG_1.'comment'('catch')
.annotate 'line', 7583
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7584
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7585
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7586
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7587
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7589
    __ARG_1.'comment'('catch end')
.annotate 'line', 7590
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7591

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7513
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7515
    addattribute $P0, 'stry'
.annotate 'line', 7516
    addattribute $P0, 'modifiers'
.annotate 'line', 7517
    addattribute $P0, 'exname'
.annotate 'line', 7518
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
.annotate 'line', 7604
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7605
    setattribute self, 'name', __ARG_3
.annotate 'line', 7606
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7607
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7608

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7598
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7600
    addattribute $P0, 'name'
.annotate 'line', 7601
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
.annotate 'line', 7623
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7624
    setattribute self, 'name', __ARG_3
.annotate 'line', 7625
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7626

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7615
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7617
    addattribute $P0, 'name'
.annotate 'line', 7618
    addattribute $P0, 'basetype'
.annotate 'line', 7619
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
.annotate 'line', 7637
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7638
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7639
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7640
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7641
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7643
    $P5 = WSubId_37(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7646
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7647

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7650
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7651
    if_null $P1, __label_1
.annotate 'line', 7652
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7653
    .return(self)
# }
.annotate 'line', 7654

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7657
    self.'annotate'(__ARG_1)
.annotate 'line', 7658
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7659
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7660
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7661
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7662
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7664
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7665
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7667
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7668
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7669
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7670
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7672
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7675
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7677
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7680
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7681
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.annotate 'line', 7683
    WSubId_1('Invalid initialization from void value', self)
  __label_18: # case
.annotate 'line', 7685
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7688
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7689
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7691
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7692
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7693
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7694
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7695
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7696
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7699
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7703

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7631
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7633
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
.annotate 'line', 7718
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7719
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7720
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7721
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7722
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7723
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7725
    __ARG_6.'unget'($P2)
.annotate 'line', 7726
    $P4 = WSubId_37(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7727
    WSubId_54(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7729
    $P2 = __ARG_6.'get'()
.annotate 'line', 7730
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7731
    $P2 = __ARG_6.'get'()
.annotate 'line', 7732
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7733
    WSubId_40("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7734
    $P2 = __ARG_6.'get'()
.annotate 'line', 7735
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7736
    __ARG_6.'unget'($P2)
.annotate 'line', 7737
    $P4 = WSubId_36(__ARG_6, self, WSubId_37, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7741
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7742

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7745
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7746
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 7747
    getattribute $P1, self, 'initarray'
    WSubId_38($P1)
.annotate 'line', 7748
    .return(self)
# }
.annotate 'line', 7749

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7752
    self.'annotate'(__ARG_1)
.annotate 'line', 7754
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7755
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7756
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7757
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7758
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7759
    if_null $P2, __label_1
# {
.annotate 'line', 7761
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7762
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7766
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7768
    if_null $P3, __label_4
# {
.annotate 'line', 7769
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7770
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7771
    unless_null $P2, __label_6
# {
.annotate 'line', 7772
    le $I1, 0, __label_7
# {
.annotate 'line', 7774
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7777
# i: $I2
    null $I2
.annotate 'line', 7778
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7779
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7780
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7781
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7784

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 7708
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7710
    addattribute $P0, 'size'
.annotate 'line', 7711
    addattribute $P0, 'initarray'
.annotate 'line', 7712
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
.annotate 'line', 7791
# var next: $P1
    null $P1
.annotate 'line', 7792
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7793
# {
.annotate 'line', 7794
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7795
    WSubId_92($P3)
.annotate 'line', 7796
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7797
# var item: $P5
    null $P5
.annotate 'line', 7798
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 7799
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7801
    __ARG_4.'unget'($P4)
.annotate 'line', 7802
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7804
    $P2 = WSubId_96($P2, $P5)
.annotate 'line', 7805
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7806
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 7807
    WSubId_4(';', $P1)
.annotate 'line', 7808
    .return($P2)
# }
.annotate 'line', 7809

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7817
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7818

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 7813
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
.annotate 'line', 7825
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7826

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 7821
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
.annotate 'line', 7832
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7833

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7837
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7838

.end # newIntArray


.sub 'parseInt' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7842
    .tailcall WSubId_97(WSubId_98, WSubId_99, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7843

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7851
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7852

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 7847
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
.annotate 'line', 7859
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7860

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 7855
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
.annotate 'line', 7866
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7867

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7871
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7872

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_101 = "WSubId_101"
# Body
# {
.annotate 'line', 7876
    .tailcall WSubId_97(WSubId_100, WSubId_101, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7877

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7885
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7886

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 7881
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
.annotate 'line', 7893
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7894

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 7889
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
.annotate 'line', 7900
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7901

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7905
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7906

.end # newStringArray


.sub 'parseString' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_103 = "WSubId_103"
# Body
# {
.annotate 'line', 7910
    .tailcall WSubId_97(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7911

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
.annotate 'line', 7927
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7928
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7929
    setattribute self, 'name', __ARG_4
.annotate 'line', 7930
    setattribute self, 'value', __ARG_5
.annotate 'line', 7931
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7932

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7935
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7936
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7937
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7938
    $P1 = $P1.'optimize'()
.annotate 'line', 7939
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 7940
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 7943
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7944
    .return(self)
# }
.annotate 'line', 7945

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7948
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 7949

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7952
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7953

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 7917
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7919
    addattribute $P0, 'type'
.annotate 'line', 7920
    addattribute $P0, 'name'
.annotate 'line', 7921
    addattribute $P0, 'data'
.annotate 'line', 7922
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 7958
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7959
# type: $S1
    $P5 = WSubId_95($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7960
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7961
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7963
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7964
# {
.annotate 'line', 7965
    $P1 = __ARG_2.'get'()
.annotate 'line', 7966
# var name: $P3
    set $P3, $P1
.annotate 'line', 7967
    WSubId_54('=', __ARG_2)
.annotate 'line', 7968
# var value: $P4
    $P4 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 7970
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7969
    $P2 = WSubId_96($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7971
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7972
    .return($P2)
# }
.annotate 'line', 7973

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
.annotate 'line', 7984
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7985
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7986
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7987
    $P4 = WSubId_37(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7988
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 7990
    WSubId_4(';', $P1)
# }
.annotate 'line', 7991

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7994
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7995
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7996
    .return(self)
# }
.annotate 'line', 7997

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8000
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8001

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8004
    self.'annotate'(__ARG_1)
.annotate 'line', 8005
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8006
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8007
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8008
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8009
    if_null $P1, __label_3
.annotate 'line', 8010
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8011
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8012
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8013
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
.annotate 'line', 8015
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8016
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8018
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8023
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8024
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8027
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8029
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8033
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8034

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 7979
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7981
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
.annotate 'line', 8041
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8042
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 8043

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8046
    self.'annotate'(__ARG_1)
.annotate 'line', 8047
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8048
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8049
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8050

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8037
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
.annotate 'line', 8059
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8060
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8061
    WSubId_54(']', __ARG_2)
.annotate 'line', 8062
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 8063

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8066
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8067
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8068

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8071
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8072
    self.'annotate'(__ARG_1)
.annotate 'line', 8073
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8074
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8075
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8076

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8053
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8055
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_92 = "WSubId_92"
# Body
# {
.annotate 'line', 8081
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8082
    WSubId_92($P1)
.annotate 'line', 8083
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8084
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8085
    $P2 = __ARG_2.'get'()
.annotate 'line', 8086
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8087
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8089
    __ARG_2.'unget'($P2)
.annotate 'line', 8090
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
.annotate 'line', 8094
    __ARG_2.'unget'($P2)
.annotate 'line', 8095
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8097

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 8101
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8102
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8103
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8104
    .tailcall WSubId_46(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8105

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
.annotate 'line', 8118
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8119
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8120
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8121
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8122
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8123
    __ARG_2.'unget'($P1)
.annotate 'line', 8124
# var c: $P2
    $P2 = WSubId_93(__ARG_2, self)
.annotate 'line', 8125
    unless_null $P2, __label_3
.annotate 'line', 8126
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8127
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8129
    setattribute self, 'end', $P1
# }
.annotate 'line', 8130

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8133
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8134
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8135
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8136
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8137
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8138
    .return($S2)
# }
.annotate 'line', 8139

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8142
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8143
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8144
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8145
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8146
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8147
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8148
    $P1[$S1] = $S3
.annotate 'line', 8149
    .return($S3)
# }
.annotate 'line', 8150

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8151
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8154
    __ARG_1.'comment'('{')
.annotate 'line', 8155
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8156
    $P1.'emit'(__ARG_1)
.annotate 'line', 8157
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8159
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8160

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8111
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8113
    addattribute $P0, 'end'
.annotate 'line', 8114
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8175
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8177
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8178
    new $P1, ['ResizableStringArray']
.annotate 'line', 8179
    new $P2, ['ResizableStringArray']
.annotate 'line', 8180
    setattribute self, 'tempreg', $P1
.annotate 'line', 8181
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8182

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8185
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8186
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8187
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8188
    assign $P1, $I1
# predefined string
.annotate 'line', 8189
    getattribute $P2, self, 'type'
.annotate 'line', 8184
    set $S2, $P2
.annotate 'line', 8189
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8190

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8193
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8194
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8195
# reg: $S1
    null $S1
.annotate 'line', 8196
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8197
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8199
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8200
# predefined push
    push $P2, $S1
.annotate 'line', 8201
    .return($S1)
# }
.annotate 'line', 8202

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8205
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8206
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8207
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8208
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8209
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8210
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8208
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8212
    assign $P2, 0
# }
.annotate 'line', 8213

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8169
    addattribute $P0, 'type'
.annotate 'line', 8170
    addattribute $P0, 'nreg'
.annotate 'line', 8171
    addattribute $P0, 'tempreg'
.annotate 'line', 8172
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8224
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8225

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8228
# var named: $P1
    null $P1
.annotate 'line', 8229
# var slurpy: $P2
    null $P2
.annotate 'line', 8230
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8231
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8232
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8233
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8235
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8238
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8241
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8245
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8252
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8269
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8250
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8253
# setname: $S2
    null $S2
# switch
.annotate 'line', 8254
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8256
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8259
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8260
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8261
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8262
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8265
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8267
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8270
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8271
# }
.annotate 'line', 8273

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8220
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
.annotate 'line', 8283
    setattribute self, 'func', __ARG_1
.annotate 'line', 8284
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8285
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_95($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8286
    eq $S1, '', __label_2
.annotate 'line', 8287
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8289
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8290
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8291
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8293
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8294
    $P1 = __ARG_2.'get'()
.annotate 'line', 8295
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8296
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8298
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8299

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_104 = "WSubId_104"
# Body
# {
.annotate 'line', 8302
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8303
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8304
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8305
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_104($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8306
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8307
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8308
    if_null $P3, __label_3
.annotate 'line', 8309
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8310
    __ARG_1.'say'('')
# }
.annotate 'line', 8311

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8278
    addattribute $P0, 'func'
.annotate 'line', 8279
    addattribute $P0, 'name'
.annotate 'line', 8280
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8316
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8317

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8328
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8329
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8330

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8333
# var ns: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 8334
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 8335
# key: $S1
    null $S1
.annotate 'line', 8336
# predefined elements
    elements $I1, $P2
    le $I1, 0, __label_1
.annotate 'line', 8337
    $P3 = WSubId_58($P2)
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8338
# reg: $S2
    $P3 = __ARG_2.'tempreg'('P')
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8339
    getattribute $P3, self, 'name'
    __ARG_1.'emitget_hll_global'($S2, $P3, $S1)
.annotate 'line', 8340
    .return($S2)
# }
.annotate 'line', 8341

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8323
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8325
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8352
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8353

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8356
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8357
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8358
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8359
    le $I1, 0, __label_3
# {
.annotate 'line', 8360
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8361
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8362
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8363
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8364
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8365
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8361
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8367
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8370

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8348
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8393
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8394
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8395
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8396
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8397
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8398
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8399

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8401
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8405
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8406
    unless_null $P1, __label_1
.annotate 'line', 8407
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8408
    .return($P1)
# }
.annotate 'line', 8409

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8412
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8413
    unless_null $P1, __label_1
.annotate 'line', 8414
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8415
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8416

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8420
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8421
    .return($I1)
# }
.annotate 'line', 8422

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8425
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8426
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8427
    __ARG_1.'unget'($P1)
.annotate 'line', 8428
    $P3 = WSubId_36(__ARG_1, self, WSubId_105, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8430

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8434
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8435
    unless_null $P1, __label_1
.annotate 'line', 8436
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8438
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8439

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8442
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8443
    unless_null $P1, __label_1
# {
.annotate 'line', 8445
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8448
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8449
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8450
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8451
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8453

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8456
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8457
    if_null $P1, __label_1
# {
.annotate 'line', 8458
# var found: $P2
    null $P2
.annotate 'line', 8459
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 8460
    $P2 = $P3.'findsymbol'(__ARG_1)
.annotate 'line', 8461
    if_null $P2, __label_4
.annotate 'line', 8462
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8465
    getattribute $P5, self, 'owner'
    .tailcall $P5.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8466

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8470
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8471
    if_null $P1, __label_1
# {
.annotate 'line', 8472
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 8473
    $P2.'fixnamespaces'()
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8475
    getattribute $P6, self, 'body'
    $P5 = $P6.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 8476
    .return(self)
# }
.annotate 'line', 8477

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8481
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8482
    unless_null $P1, __label_1
.annotate 'line', 8483
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8484
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8485

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8488
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8489
    unless_null $P1, __label_1
.annotate 'line', 8490
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8491
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8492

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8497
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8498
# lexname: $S1
    null $S1
.annotate 'line', 8499
    if_null $P1, __label_1
.annotate 'line', 8500
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8502
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8503
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8504
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8505
    self.'setlex'($S1, $S2)
.annotate 'line', 8506
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8508
    .return($S1)
# }
.annotate 'line', 8509

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8513
# var store: $P1
    null $P1
# switch
.annotate 'line', 8514
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
.annotate 'line', 8516
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8518
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8520
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8522
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8524
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8526
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8527
    .return($S1)
# }
.annotate 'line', 8528

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8531
# var store: $P1
    null $P1
# switch
.annotate 'line', 8532
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
.annotate 'line', 8534
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8536
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8538
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8540
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8542
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8544
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8545
    .return($S1)
# }
.annotate 'line', 8546

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8549
    root_new $P2, ['parrot';'ResizablePMCArray']
    getattribute $P4, self, 'regstI'
    push $P2, $P4
    getattribute $P5, self, 'regstN'
    push $P2, $P5
    getattribute $P6, self, 'regstS'
    push $P2, $P6
    getattribute $P7, self, 'regstP'
    push $P2, $P7
    iter $P8, $P2
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
.annotate 'line', 8550
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8551

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8554
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8553
    set $S1, $I1
.annotate 'line', 8555
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8556

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8559
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8560

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8563
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8564

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 8568
# name: $S1
    getattribute $P10, self, 'name'
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 8569
    __ARG_1.'say'()
.annotate 'line', 8570
    __ARG_1.'print'(".sub ")
.annotate 'line', 8571
    $P10 = self.'isanonymous'()
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 8572
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8574
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8575
    getattribute $P10, self, 'subid'
    if_null $P10, __label_4
.annotate 'line', 8576
    getattribute $P11, self, 'subid'
    __ARG_1.'print'(" :subid('", $P11, "')")
  __label_4: # endif
.annotate 'line', 8577
    getattribute $P10, self, 'outer'
    if_null $P10, __label_5
# {
.annotate 'line', 8578
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8579
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8580
    if_null $P2, __label_6
.annotate 'line', 8581
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8585
    $P10 = self.'ismethod'()
    if_null $P10, __label_7
    unless $P10 goto __label_7
.annotate 'line', 8586
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8587
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8588
    if_null $P3, __label_8
.annotate 'line', 8589
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8591
    ne $S1, 'main', __label_10
.annotate 'line', 8592
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8594
    __ARG_1.'say'()
.annotate 'line', 8597
    getattribute $P10, self, 'params'
    WSubId_52(__ARG_1, $P10)
.annotate 'line', 8599
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8600
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8601
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8602
    getattribute $P10, self, 'start'
    __ARG_1.'annotate'($P10)
.annotate 'line', 8604
    if_null $P4, __label_13
# {
.annotate 'line', 8605
    iter $P12, $P4
    set $P12, 0
  __label_14: # for iteration
    unless $P12 goto __label_15
    shift $S2, $P12
.annotate 'line', 8606
    $P10 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P10, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8609
    if_null $P5, __label_16
# {
.annotate 'line', 8610
    iter $P13, $P5
    set $P13, 0
  __label_17: # for iteration
    unless $P13 goto __label_18
    shift $S3, $P13
# {
.annotate 'line', 8611
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_19
.annotate 'line', 8612
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_19: # endif
.annotate 'line', 8613
    $P10 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P10)
# }
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8618
# var usedsubids: $P6
    getattribute $P6, self, 'usedsubids'
.annotate 'line', 8619
    if_null $P6, __label_20
# {
.annotate 'line', 8620
    iter $P14, $P6
    set $P14, 0
  __label_21: # for iteration
    unless $P14 goto __label_22
    shift $S4, $P14
# {
.annotate 'line', 8622
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_21
  __label_22: # endfor
# }
  __label_20: # endif
.annotate 'line', 8626
# var body: $P7
    getattribute $P7, self, 'body'
.annotate 'line', 8627
    $P10 = $P7.'isempty'()
    if_null $P10, __label_23
    unless $P10 goto __label_23
.annotate 'line', 8628
    __ARG_1.'comment'('Empty body')
    goto __label_24
  __label_23: # else
# {
.annotate 'line', 8630
    __ARG_1.'comment'('Body')
.annotate 'line', 8631
    $P7.'emit'(__ARG_1)
.annotate 'line', 8632
    $P10 = $P7.'getend'()
    __ARG_1.'annotate'($P10)
# }
  __label_24: # endif
.annotate 'line', 8634
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8637
# var localfun: $P8
    getattribute $P8, self, 'localfun'
.annotate 'line', 8638
    if_null $P8, __label_25
# {
.annotate 'line', 8639
    iter $P15, $P8
    set $P15, 0
  __label_26: # for iteration
    unless $P15 goto __label_27
    shift $P9, $P15
.annotate 'line', 8640
    $P9.'emit'(__ARG_1)
    goto __label_26
  __label_27: # endfor
# }
  __label_25: # endif
# }
.annotate 'line', 8642

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8373
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8375
    addattribute $P0, 'name'
.annotate 'line', 8376
    addattribute $P0, 'subid'
.annotate 'line', 8377
    addattribute $P0, 'modifiers'
.annotate 'line', 8378
    addattribute $P0, 'params'
.annotate 'line', 8379
    addattribute $P0, 'body'
.annotate 'line', 8380
    addattribute $P0, 'regstI'
.annotate 'line', 8381
    addattribute $P0, 'regstN'
.annotate 'line', 8382
    addattribute $P0, 'regstS'
.annotate 'line', 8383
    addattribute $P0, 'regstP'
.annotate 'line', 8384
    addattribute $P0, 'nlabel'
.annotate 'line', 8385
    addattribute $P0, 'localfun'
.annotate 'line', 8386
    addattribute $P0, 'lexicals'
.annotate 'line', 8387
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8388
    addattribute $P0, 'usedsubids'
.annotate 'line', 8389
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8656
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8657
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8658
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8659
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8660

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8662
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8666
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8664
    set $I1, $P1
.annotate 'line', 8666
    .return($I1)
# }
.annotate 'line', 8667

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8671
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8669
    set $I1, $P1
.annotate 'line', 8671
    .return($I1)
# }
.annotate 'line', 8672

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8673
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 8677
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8678
    setattribute self, 'name', $P1
.annotate 'line', 8679
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8680
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 8681
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P9, self, 'owner'
    $P8.'FunctionModifierList'(__ARG_1, $P9)
    set $P7, $P8
    setattribute self, 'modifiers', $P7
.annotate 'line', 8682
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8684
    WSubId_4('(', $P2)
.annotate 'line', 8685
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8687
# var fullname: $P3
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P3, $P5
.annotate 'line', 8688
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P3, $P5
.annotate 'line', 8689
# var cfunction: $P4
    $P4 = self.'createconst'('__FUNCTION__', 'S')
.annotate 'line', 8690
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 8691
    new $P8, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P10, $P1, 'line'
.annotate 'line', 8692
# predefined join
.annotate 'line', 8690
    join $S1, '.', $P3
    $P8.'TokenQuoted'($P9, $P10, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
    $P4.'setvalue'($P5)
.annotate 'line', 8694
    $P2 = __ARG_1.'get'()
.annotate 'line', 8695
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_2
.annotate 'line', 8696
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 8697
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8698
    .return(self)
# }
.annotate 'line', 8699

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8649
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8651
    addattribute $P0, 'paramnum'
.annotate 'line', 8652
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
.annotate 'line', 8710
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8711
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8712
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8713
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8714
    setattribute self, 'name', $P1
.annotate 'line', 8715
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8716
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8717
    WSubId_4('{', $P2)
.annotate 'line', 8718
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8719
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8720

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8721
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8722
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 8725
    getattribute $P3, self, 'lexicals'
    isnull $I1, $P3
    not $I1
    if $I1 goto __label_2
    getattribute $P4, self, 'usedlexicals'
    isnull $I1, $P4
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 8726
    .return(1)
  __label_1: # endif
.annotate 'line', 8727
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8728
    if_null $P1, __label_3
# {
.annotate 'line', 8729
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P2, $P5
.annotate 'line', 8730
    $P3 = $P2.'needclosure'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 8731
    .return(1)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
# }
  __label_3: # endif
.annotate 'line', 8733
    .return(0)
# }
.annotate 'line', 8734

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8737
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8738

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8742
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8743

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8747
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8748

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8751
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 8752
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 8753
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 8755
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 8756
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 8757
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 8758
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 8759
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 8760
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 8761
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 8762
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 8763
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8764
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 8765
    eq $S3, 'P', __label_8
.annotate 'line', 8766
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 8767
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 8768
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 8769
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 8770
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 8773
    .return(__ARG_2)
# }
.annotate 'line', 8774

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8777
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8778
    unless_null $P1, __label_1
.annotate 'line', 8779
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8780
    unless_null $P1, __label_2
# {
.annotate 'line', 8783
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 8784
    unless_null $P1, __label_3
# {
.annotate 'line', 8786
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 8787
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8788
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 8789
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 8790
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8791
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 8792
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8796
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8798
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 8799
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 8800
    .return($P1)
# }
.annotate 'line', 8801

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 8706
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
.annotate 'line', 8812
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8813

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8814
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 8808
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
.annotate 'line', 8828
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8829
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8830
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 8831
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8832
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8833
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_95($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8834
    set $P1, $P2
.annotate 'line', 8835
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8836
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8838
    setattribute self, 'name', $P1
.annotate 'line', 8839
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8840
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8841
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8842
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 8844
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8845

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8848
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8849
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8850
    if_null $P1, __label_1
# {
.annotate 'line', 8851
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8852
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8854

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 8823
    addattribute $P0, 'name'
.annotate 'line', 8824
    addattribute $P0, 'modifiers'
.annotate 'line', 8825
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8859
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8860

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 8867
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_106, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 8868

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8871
    __ARG_1.'print'('(')
.annotate 'line', 8872
# sep: $S1
    set $S1, ''
.annotate 'line', 8873
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8874
    __ARG_1.'print'($S1)
.annotate 'line', 8875
    $P1.'emit'(__ARG_1)
.annotate 'line', 8876
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8878
    __ARG_1.'print'(')')
# }
.annotate 'line', 8879

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 8864
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
.annotate 'line', 8888
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8889
    setattribute self, 'params', __ARG_3
.annotate 'line', 8890
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 8891

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8894
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8895
    .return(self)
# }
.annotate 'line', 8896

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8899
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8900
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 8901
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 8902
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8903
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8904
    __ARG_1.'print'('    ')
.annotate 'line', 8905
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8906
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8907
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8908
    __ARG_1.'say'()
# }
.annotate 'line', 8909

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 8882
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8884
    addattribute $P0, 'params'
.annotate 'line', 8885
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
.annotate 'line', 8926
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8927

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8928
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8932
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8933

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 8922
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8941
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8942
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8943

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8944
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8948
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8949
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8950

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 8936
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8938
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
.annotate 'line', 8959
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8960
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8961
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8962
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8963
    WSubId_40('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8964
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8965
    $P2 = __ARG_1.'get'()
.annotate 'line', 8966
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8967
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8969
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8973
    WSubId_41('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8975
# {
.annotate 'line', 8976
    $P2 = __ARG_1.'get'()
.annotate 'line', 8977
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 8978
    WSubId_40('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8979
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8980
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 8981
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8983
    setattribute self, 'key', $P1
# }
.annotate 'line', 8984

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8985
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8988
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8989

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8993
    getattribute $P2, self, 'key'
    $P1 = WSubId_58($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8994

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 8953
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8955
    addattribute $P0, 'key'
.annotate 'line', 8956
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9002
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9003
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 9004
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9005
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9006
    $P2 = __ARG_1.'get'()
.annotate 'line', 9007
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9009
    __ARG_1.'unget'($P2)
.annotate 'line', 9010
    setattribute self, 'key', $P1
# }
.annotate 'line', 9011

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9012
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9016
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9017
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9018

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 9022
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 9023
    unless_null $P1, __label_1
# {
.annotate 'line', 9024
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9025
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_67($S2)
  __label_3: # endif
.annotate 'line', 9026
    getattribute $P3, self, 'key'
    $P2 = WSubId_58($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9028
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9029

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 8997
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8999
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9034
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9035
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9036
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9037
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9038
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9039
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9040
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9041
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9042

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9054
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9055
    setattribute self, 'name', __ARG_2
.annotate 'line', 9056
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9057
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 9058
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9059

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 9062
    getattribute $P1, self, 'classns'
    .tailcall WSubId_58($P1)
# }
.annotate 'line', 9063

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9048
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9050
    addattribute $P0, 'name'
.annotate 'line', 9051
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_60 = "WSubId_60"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9076
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9077
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9078
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9079
    setattribute self, 'functions', $P1
.annotate 'line', 9080
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9081
    setattribute self, 'members', $P2
.annotate 'line', 9082
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9083
    setattribute self, 'constants', $P3
.annotate 'line', 9085
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 9086
    $P8 = $P4.'isop'(':')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 9087
    $P10 = WSubId_36(__ARG_4, self, WSubId_60)
    setattribute self, 'bases', $P10
.annotate 'line', 9088
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9090
    WSubId_4('{', $P4)
# for loop
.annotate 'line', 9091
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9092
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
.annotate 'line', 9094
# var f: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 9095
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9098
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 9099
    $P10 = $P6.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 9100
    WSubId_40("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 9101
# predefined push
    push $P2, $P6
.annotate 'line', 9102
    $P4 = __ARG_4.'get'()
.annotate 'line', 9103
    $P11 = $P4.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 9104
    WSubId_40("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9107
# var cst: $P7
    $P7 = WSubId_44($P4, __ARG_4, self)
.annotate 'line', 9108
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9111
    WSubId_41("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9091
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9114

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9117
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9118

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9121
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9122

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9125
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 9126

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9129
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 9130

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9133
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9134

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9137
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9138

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9141
    getattribute $P1, self, 'constants'
    WSubId_38($P1)
.annotate 'line', 9142
    getattribute $P1, self, 'functions'
    WSubId_38($P1)
.annotate 'line', 9143
    .return(self)
# }
.annotate 'line', 9144

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9147
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 9148
    $P5 = WSubId_107($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 9149
    getattribute $P5, self, 'functions'
    WSubId_52(__ARG_1, $P5)
.annotate 'line', 9151
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9153
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 9154
# n: $I1
    set $I1, 1
.annotate 'line', 9155
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 9156
    if_null $P2, __label_1
# {
.annotate 'line', 9157
    getattribute $P5, self, 'bases'
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 9158
    $P3.'annotate'(__ARG_1)
.annotate 'line', 9159
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9160
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9161
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 9162
    __ARG_1.'say'()
.annotate 'line', 9163
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 9166
    getattribute $P5, self, 'members'
    iter $P7, $P5
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 9167
    __ARG_1.'annotate'($P4)
.annotate 'line', 9168
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 9171
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9172

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9066
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9068
    addattribute $P0, 'parent'
.annotate 'line', 9069
    addattribute $P0, 'bases'
.annotate 'line', 9070
    addattribute $P0, 'constants'
.annotate 'line', 9071
    addattribute $P0, 'functions'
.annotate 'line', 9072
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9179
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9180

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9183
    .return(self)
# }
.annotate 'line', 9184

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9175
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9192
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9193
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9194
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9195
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9196
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9197
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9195
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.annotate 'line', 9199
    WSubId_4(';', $P2)
.annotate 'line', 9200
    new $P4, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9203
    __ARG_2.'unget'($P2)
.annotate 'line', 9204
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9206

.end # parseClass


.sub 'include_parrot' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9214
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9215
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.annotate 'line', 9216
    WSubId_40('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9217
    WSubId_54(';', __ARG_2)
.annotate 'line', 9218
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9219
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9224
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9225
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9226
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9227
    iter $P8, $P4
    set $P8, 0
  __label_3: # for iteration
    unless $P8 goto __label_4
    shift $S2, $P8
# {
.annotate 'line', 9228
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9229
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9230
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9231
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9229
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
.annotate 'line', 9236
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.annotate 'line', 9237
    WSubId_1('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9242
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
.annotate 'line', 9243
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9244
# pos: $I1
    set $I1, 12
.annotate 'line', 9245
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9246
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9247
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9248
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9249
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9250
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9251
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9252
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9254
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9255
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9256
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9257
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9258
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9259
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9260
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9261
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9263
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9265
# ivalue: $I3
    null $I3
.annotate 'line', 9266
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9267
# predefined substr
    substr $S10, $S7, 2
    box $P9, $S10
    $P7 = $P9.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9269
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9270
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9272
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P11, __ARG_1, 'file'
    getattribute $P12, __ARG_1, 'line'
    $P10.'TokenInteger'($P11, $P12, $S6)
    set $P9, $P10
.annotate 'line', 9271
    $P7 = WSubId_21(__ARG_3, $P9, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9242
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9276
    $P5.'close'()
# }
.annotate 'line', 9277

.end # include_parrot


.sub 'parsensUsing' :subid('WSubId_109')
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
.annotate 'line', 9283
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9284
    $P7 = $P1.'iskeyword'('namespace')
    if_null $P7, __label_1
    unless $P7 goto __label_1
# {
.annotate 'line', 9285
# var nskey: $P2
    $P2 = WSubId_55(__ARG_2)
.annotate 'line', 9286
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9287
    ge $I1, 1, __label_2
.annotate 'line', 9288
    WSubId_1('Unsupported', $P1)
  __label_2: # endif
.annotate 'line', 9289
    WSubId_54(';', __ARG_2)
.annotate 'line', 9290
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9291
    unless_null $P3, __label_3
.annotate 'line', 9292
    WSubId_1('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9293
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9294
    .return()
# }
  __label_1: # endif
.annotate 'line', 9296
    $P7 = $P1.'iskeyword'('extern')
    isfalse $I3, $P7
    unless $I3 goto __label_4
# {
.annotate 'line', 9297
    __ARG_2.'unget'($P1)
.annotate 'line', 9298
# var key: $P4
    $P4 = WSubId_55(__ARG_2)
.annotate 'line', 9299
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9300
    ge $I2, 1, __label_5
.annotate 'line', 9301
    WSubId_1('Unsupported at namespace level', $P1)
  __label_5: # endif
.annotate 'line', 9302
    WSubId_54(';', __ARG_2)
.annotate 'line', 9303
    __ARG_3.'use'($P4)
.annotate 'line', 9304
    .return()
# }
  __label_4: # endif
.annotate 'line', 9306
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9308
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9314
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9310
# reqlib: $S1
    set $P7, $P1
    null $S1
    if_null $P7, __label_10
    set $S1, $P7
  __label_10:
.annotate 'line', 9311
    __ARG_3.'addlib'($S1)
.annotate 'line', 9312
    WSubId_54(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9315
    __ARG_2.'unget'($P1)
.annotate 'line', 9316
# var module: $P5
    $P5 = WSubId_55(__ARG_2)
.annotate 'line', 9317
    $P1 = __ARG_2.'get'()
.annotate 'line', 9318
    $P8 = $P1.'isop'(';')
    isfalse $I4, $P8
    unless $I4 goto __label_11
# {
.annotate 'line', 9319
    __ARG_2.'unget'($P1)
.annotate 'line', 9320
# var names: $P6
    null $P7
    $P6 = WSubId_36(__ARG_2, $P7, WSubId_57, ';')
.annotate 'line', 9321
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9323
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9324
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9327
    WSubId_40('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9329

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9339
    setattribute self, 'module', __ARG_1
.annotate 'line', 9340
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9341

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9346
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9354
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9355
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9356
    __ARG_1.'say'("']")
.annotate 'line', 9357
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9358
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9359
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9365

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9335
    addattribute $P0, 'module'
.annotate 'line', 9336
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9384
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9385
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9386
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9387
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9388
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9389
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9392
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9393
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9394
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9395
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9396
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9398
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9399

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9402
# var ns: $P1
    null $P1
.annotate 'line', 9403
    getattribute $P3, self, 'namespaces'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9404
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9405
    getattribute $P3, self, 'usednamespaces'
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9406
    getattribute $P6, $P1, 'usednamespaces'
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9407
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9408

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9411
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9412

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9415
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9416
    .return()
  __label_1: # endif
.annotate 'line', 9417
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9418
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9419
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9420
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9421
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9422

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9425
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9426
    if_null $P1, __label_1
# {
.annotate 'line', 9427
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9428
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9431
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9432
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9433
    if_null $P2, __label_5
# {
.annotate 'line', 9434
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9435
    if_null $P1, __label_6
.annotate 'line', 9436
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9439

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9442
    getattribute $P2, self, 'usednamespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9443
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9444
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9445
    .return($P2)
# }
.annotate 'line', 9446

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9449
    getattribute $P2, self, 'namespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9450
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9451
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9452
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9453

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9457
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9458
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9459
    unless_null $P2, __label_1
.annotate 'line', 9460
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9462
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9463

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9467
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9468
# var cl: $P2
    null $P2
.annotate 'line', 9469
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9470
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9471
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9472
    getattribute $P5, self, 'usednamespaces'
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9473
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9474
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9475
    .return($P5)
# }
.annotate 'line', 9476

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9481
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9482
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9484
    .return($P3)
  __label_4: # case
.annotate 'line', 9487
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9492
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9493
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9494
    if_null $P1, __label_5
# {
.annotate 'line', 9495
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9496
    if_null $P2, __label_6
.annotate 'line', 9497
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9500
    .return($P3)
# }
.annotate 'line', 9501

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9504
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9505
    if_null $P1, __label_1
.annotate 'line', 9506
    .return($P1)
  __label_1: # endif
.annotate 'line', 9507
    getattribute $P2, self, 'functions'
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9508
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9509
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9510
    .return($P2)
# }
.annotate 'line', 9511

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9516
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9517
# name: $S1
    null $S1
.annotate 'line', 9518
# var sym: $P1
    null $P1
.annotate 'line', 9519
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9520
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9522
    .return($P3)
  __label_4: # case
.annotate 'line', 9524
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9526
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9527
    .return($P1)
  __label_5: # endif
.annotate 'line', 9528
    getattribute $P4, self, 'usednamespaces'
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9529
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9530
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9536
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9537
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9538
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9539
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9540
    .return($P1)
  __label_9: # endif
.annotate 'line', 9541
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9542
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9543
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9544
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9546
    .return($P3)
# }
.annotate 'line', 9547

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9550
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9551
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9553
    .return($P2)
  __label_2: # default
.annotate 'line', 9555
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9556
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9557
    if_null $P1, __label_4
# {
.annotate 'line', 9558
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9559
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9561
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9564
    .return($P2)
# }
.annotate 'line', 9565

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9568
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9569
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9570
    .return($P1)
# }
.annotate 'line', 9571

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9574
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9575
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9576
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9577
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9578
    .return($P2)
# }
.annotate 'line', 9579

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9582
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9583

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9586
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9587
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9588

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9591
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9592
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9593
    $P1 = __ARG_2.'get'()
.annotate 'line', 9595
# var modifier: $P2
    null $P2
.annotate 'line', 9596
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9597
    new $P5, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9598
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.annotate 'line', 9601
    WSubId_4('{', $P1)
.annotate 'line', 9602
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9603
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9604

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9607
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9608
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9609
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9610
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9611
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
.annotate 'line', 9613
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
.annotate 'line', 9615
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9618
# var cst: $P5
    $P5 = WSubId_44($P4, __ARG_1, self)
.annotate 'line', 9619
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9622
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9623
# predefined push
    push $P2, $P6
.annotate 'line', 9624
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9627
    WSubId_108($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9630
# var t1: $P7
    $P7 = __ARG_1.'get'()
.annotate 'line', 9631
    $P10 = $P7.'iskeyword'('function')
    isfalse $I3, $P10
    unless $I3 goto __label_16
.annotate 'line', 9632
    WSubId_1('Unsupported extern', $P7)
  __label_16: # endif
.annotate 'line', 9633
    $P7 = __ARG_1.'get'()
.annotate 'line', 9634
    WSubId_92($P7)
.annotate 'line', 9635
    WSubId_54(';', __ARG_1)
.annotate 'line', 9636
# var fex: $P8
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P8.'FunctionExtern'($P7, self)
.annotate 'line', 9637
# predefined push
    push $P2, $P8
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9640
    WSubId_109($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9643
    WSubId_110($P4, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9646
    $P4 = __ARG_1.'get'()
.annotate 'line', 9647
    $P11 = $P4.'isstring'()
    isfalse $I4, $P11
    unless $I4 goto __label_17
.annotate 'line', 9648
    WSubId_40('string literal', $P4)
  __label_17: # endif
.annotate 'line', 9649
    WSubId_54(';', __ARG_1)
.annotate 'line', 9650
    new $P14, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P14.'StringLiteral'(self, $P4)
    set $P13, $P14
    $P12 = $P13.'getPirString'()
    self.'addload'($P12)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 9653
    $P4 = __ARG_1.'get'()
.annotate 'line', 9654
    $P15 = $P4.'isstring'()
    isfalse $I5, $P15
    unless $I5 goto __label_18
.annotate 'line', 9655
    WSubId_40('string literal', $P4)
  __label_18: # endif
.annotate 'line', 9656
    WSubId_54(';', __ARG_1)
.annotate 'line', 9657
    new $P18, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addlib'($P16)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9660
    WSubId_41("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9611
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9663
    $P9 = $P4.'iseof'()
    if_null $P9, __label_19
    unless $P9 goto __label_19
.annotate 'line', 9664
    self.'unclosed_ns'()
    goto __label_20
  __label_19: # else
.annotate 'line', 9666
    self.'close_ns'($P4)
  __label_20: # endif
# }
.annotate 'line', 9667

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9670
    getattribute $P1, self, 'items'
    WSubId_38($P1)
# }
.annotate 'line', 9671

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9674
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9675
# s: $S1
    $P4 = WSubId_107($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9677
# activate: $I1
    set $I1, 1
.annotate 'line', 9679
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9680
    if_null $P2, __label_2
# {
.annotate 'line', 9681
    __ARG_1.'say'($S1)
.annotate 'line', 9682
    null $I1
.annotate 'line', 9683
    WSubId_52(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9686
    getattribute $P4, self, 'items'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
# {
.annotate 'line', 9687
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9688
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9689
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9691
    unless $I1 goto __label_8
# {
.annotate 'line', 9692
    __ARG_1.'say'($S1)
.annotate 'line', 9693
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9695
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9697

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9372
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9374
    addattribute $P0, 'nspath'
.annotate 'line', 9375
    addattribute $P0, 'externals'
.annotate 'line', 9376
    addattribute $P0, 'namespaces'
.annotate 'line', 9377
    addattribute $P0, 'classes'
.annotate 'line', 9378
    addattribute $P0, 'functions'
.annotate 'line', 9379
    addattribute $P0, 'items'
.annotate 'line', 9380
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
.annotate 'line', 9715
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9716
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9717
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9719
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9720
    setattribute self, 'start', __ARG_2
.annotate 'line', 9721
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9722
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9723
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9724
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9725
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9726
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9728

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9731
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9732

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9735
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9736

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9739
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9740

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9743
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9744

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9747
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9748

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9751
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9752
    unless_null $P1, __label_1
.annotate 'line', 9753
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9754
    .return($P1)
# }
.annotate 'line', 9755

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9760
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9761
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9762
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9763
    .return($P1)
# }
.annotate 'line', 9764

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9767
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9768
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9769
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9770
    .return($P1)
# }
.annotate 'line', 9771

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9774
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9775
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9776
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9777
    .return($P1)
# }
.annotate 'line', 9778

.end # findns


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9781
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 9782

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9789
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9790
    if_null $P1, __label_1
.annotate 'line', 9791
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9792
    self.'optimize_base'()
.annotate 'line', 9793
    .return(self)
# }
.annotate 'line', 9794

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9797
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9798
    if_null $P1, __label_1
.annotate 'line', 9799
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9801
    self.'emit_base'(__ARG_1)
.annotate 'line', 9803
    if_null $P1, __label_2
.annotate 'line', 9804
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9805

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 9704
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9706
    addattribute $P0, 'parent'
.annotate 'line', 9707
    addattribute $P0, 'start'
.annotate 'line', 9708
    addattribute $P0, 'name'
.annotate 'line', 9709
    addattribute $P0, 'modifier'
.annotate 'line', 9710
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9822
    new $P1, ['ResizableStringArray']
.annotate 'line', 9823
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9824
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9825
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9826
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9827

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9830
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9831
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9832

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9835
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9836
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9837

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9841
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9840
    set $S1, $I1
.annotate 'line', 9842
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9843

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9847
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9848
    unless_null $P1, __label_1
.annotate 'line', 9849
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9850
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9851

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9854
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9855
    unless_null $P1, __label_1
.annotate 'line', 9856
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9857
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9858

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9861
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9862

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9866
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9867

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9870
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9871

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9874
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9875

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9882
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9883

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9886
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9887

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9890
    self.'optimize_base'()
.annotate 'line', 9891
    .return(self)
# }
.annotate 'line', 9892

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9895
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9898
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9899
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9902
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
.annotate 'line', 9905
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9906
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9907
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9908
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9911
# somelib: $I1
    null $I1
.annotate 'line', 9912
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9913
    if_null $P3, __label_5
# {
.annotate 'line', 9914
    set $I1, 1
.annotate 'line', 9915
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9916
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9919
# someload: $I2
    null $I2
.annotate 'line', 9920
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9921
    if_null $P4, __label_8
# {
.annotate 'line', 9922
    set $I2, 1
.annotate 'line', 9923
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9924
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9925
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9926
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9928
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9929
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9931
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9932

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9935
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9936
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9937
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9938
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9939
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9940
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9942
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9943
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9945

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 9812
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9814
    addattribute $P0, 'unit'
.annotate 'line', 9815
    addattribute $P0, 'predefs_used'
.annotate 'line', 9816
    addattribute $P0, 'libs'
.annotate 'line', 9817
    addattribute $P0, 'loads'
.annotate 'line', 9818
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9961
    box $P7, 1
    setattribute self, 'warnings', $P7
.annotate 'line', 9962
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9965
# var taux: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9967
# var cfalse: $P3
    $P3 = $P1.'createconst'('false', 'I', 4)
.annotate 'line', 9969
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9968
    $P7 = WSubId_21($P1, $P8, 0)
    $P3.'setvalue'($P7)
.annotate 'line', 9970
# var ctrue: $P4
    $P4 = $P1.'createconst'('true', 'I', 4)
.annotate 'line', 9972
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9971
    $P7 = WSubId_21($P1, $P8, 1)
    $P4.'setvalue'($P7)
.annotate 'line', 9976
# var cstage: $P5
    $P5 = $P1.'createconst'('__STAGE__', 'S', 4)
.annotate 'line', 9977
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 9978
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P11, $P2, 'file'
    getattribute $P12, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9977
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P10.'TokenQuoted'($P11, $P12, $S1)
    set $P9, $P10
    $P8.'StringLiteral'($P1, $P9)
    set $P7, $P8
    $P5.'setvalue'($P7)
.annotate 'line', 9980
# var cerrtype: $P6
    $P6 = $P1.'createconst'('__WINXED_ERROR__', 'S', 4)
.annotate 'line', 9982
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, '__WINXED_ERROR__')
    set $P8, $P9
.annotate 'line', 9981
    $P7 = WSubId_21($P1, $P8, 567)
    $P6.'setvalue'($P7)
.annotate 'line', 9984
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9985

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9988
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9989

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9992
    getattribute $P1, self, 'warnings'
.annotate 'line', 9991
    set $I1, $P1
.annotate 'line', 9992
    .return($I1)
# }
.annotate 'line', 9993

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9996
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 9997
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 9998

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10001
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10002

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10005
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10006
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10007
    __ARG_1.'say'('')
.annotate 'line', 10009
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10011
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10012

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10015
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10016
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10018
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10020
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10021

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9956
    addattribute $P0, 'rootns'
.annotate 'line', 9957
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
.annotate 'line', 10030
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10031
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10032
# var handleout: $P1
    null $P1
.annotate 'line', 10033
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10034
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10035
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10038
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10039
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10040
    if_null __ARG_4, __label_4
    unless __ARG_4 goto __label_4
.annotate 'line', 10041
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 10042
    __ARG_1.'emit'($P2)
.annotate 'line', 10043
    $P2.'close'()
.annotate 'line', 10044
    if_null __ARG_3, __label_5
.annotate 'line', 10045
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 10047
    $P1.'close'()
.annotate 'line', 10048
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10049
# var object: $P3
    null $P3
# switch
.annotate 'line', 10050
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 10052
    new $P3, [ 'String' ]
.annotate 'line', 10053
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 10057
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 10058
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 10059
# predefined string
.annotate 'line', 10061
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 10063
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 10065

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10068
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10069
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10070
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10071
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10072
    $P2.'close'()
.annotate 'line', 10073
    $P1.'close'()
.annotate 'line', 10074
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10075

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10082
    unless_null __ARG_2, __label_1
.annotate 'line', 10083
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10084
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10085
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10086
    $P1.'puts'(__ARG_1)
.annotate 'line', 10087
    $P1.'close'()
.annotate 'line', 10088
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10089
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10090
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10091
    unless __ARG_5 goto __label_2
.annotate 'line', 10092
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 10093
    $P3.'parse'($P2)
.annotate 'line', 10094
    $P1.'close'()
.annotate 'line', 10095
    $P3.'optimize'()
.annotate 'line', 10096
    ne __ARG_2, 'include', __label_3
.annotate 'line', 10097
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 10099
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_4: # endif
# }
.annotate 'line', 10100

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10108
    unless_null __ARG_2, __label_1
.annotate 'line', 10109
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10110
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10111
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10112
    $P1.'encoding'('utf8')
.annotate 'line', 10113
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10114
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10115
    unless __ARG_5 goto __label_2
.annotate 'line', 10116
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 10117
    $P3.'parse'($P2)
.annotate 'line', 10118
    $P1.'close'()
.annotate 'line', 10119
    $P3.'optimize'()
.annotate 'line', 10120
    ne __ARG_2, 'include', __label_3
.annotate 'line', 10121
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 10123
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_4: # endif
# }
.annotate 'line', 10124

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10133
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10134
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10135

.end # initializer

# End generated code
