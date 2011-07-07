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


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 190
    .return(1)
# }
.annotate 'line', 191

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 194
    .return(1)
# }
.annotate 'line', 195

.end # get_integer


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


.sub 'rawstring' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 206
    WSubId_6('Not a literal string', self)
# }
.annotate 'line', 207

.end # rawstring


.sub 'getidentifier' :method
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 210
    WSubId_3(self)
# }
.annotate 'line', 211

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 212
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 213
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 214
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 215
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 216
    .return('(unknown)')
# }

.end # viewable


.sub 'filename' :method
# Body
# {
.annotate 'line', 217
    getattribute $P1, self, 'file'
    .return($P1)
# }

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 218
    getattribute $P1, self, 'line'
    .return($P1)
# }

.end # linenum


.sub 'show' :method
# Body
# {
.annotate 'line', 221
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 222
# predefined string
    getattribute $P1, self, 'file'
.annotate 'line', 220
    set $S2, $P1
# predefined string
.annotate 'line', 222
    getattribute $P2, self, 'line'
.annotate 'line', 220
    set $S3, $P2
.annotate 'line', 222
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 223

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
.annotate 'line', 230
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 231

.end # TokenEof


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 234
    .return(0)
# }
.annotate 'line', 235

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 238
    .return(0)
# }
.annotate 'line', 239

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 240
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 241
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
.annotate 'line', 226
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
.annotate 'line', 249
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 250
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 251

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 252
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 255
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 256

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
.annotate 'line', 244
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    addparent $P0, $P1
.annotate 'line', 246
    addattribute $P0, 'str'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 263
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 264

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 265
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
.annotate 'line', 259
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
.annotate 'line', 272
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 273

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 276
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 277

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 280
    getattribute $P1, self, 'str'
.annotate 'line', 279
    set $S1, $P1
.annotate 'line', 280
    .return($S1)
# }
.annotate 'line', 281

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
.annotate 'line', 268
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
.annotate 'line', 288
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 289

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 290
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 293
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 294

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 297
    getattribute $P1, self, 'str'
.annotate 'line', 296
    set $S1, $P1
.annotate 'line', 297
    .return($S1)
# }
.annotate 'line', 298

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 301
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 302

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 284
    get_class $P1, [ 'Winxed'; 'Compiler'; 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 307
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 310
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 311

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenString' ]
.annotate 'line', 305
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
.annotate 'line', 318
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 319

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 322
    getattribute $P1, self, 'str'
.annotate 'line', 321
    set $S1, $P1
.annotate 'line', 322
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 323

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 326
    getattribute $P1, self, 'str'
.annotate 'line', 325
    set $S1, $P1
.annotate 'line', 326
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 327

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 330
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 331

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
.annotate 'line', 314
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
.annotate 'line', 338
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 339

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 342
    getattribute $P1, self, 'str'
.annotate 'line', 341
    set $S1, $P1
.annotate 'line', 342
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 343

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 346
    getattribute $P1, self, 'str'
.annotate 'line', 345
    set $S1, $P1
.annotate 'line', 346
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 347

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 350
# s: $S1
    set $S1, ''
.annotate 'line', 351
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 352
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
.annotate 'line', 356
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 359
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 361
    .return($S1)
# }
.annotate 'line', 362

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 334
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
.annotate 'line', 369
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 370

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 371
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
.annotate 'line', 365
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
.annotate 'line', 378
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 379

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 380
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
.annotate 'line', 374
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
.annotate 'line', 390
# s: $S1
    set $S1, ''
.annotate 'line', 391
# c: $S2
    null $S2
# for loop
.annotate 'line', 392
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 393
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
.annotate 'line', 396
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 399
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 400
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 401
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 402
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 405
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 392
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 408
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 409

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 413
# s: $S1
    set $S1, ''
.annotate 'line', 414
# c: $S2
    null $S2
# for loop
.annotate 'line', 415
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 416
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 417
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 418
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 415
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 420
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 421

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 425
# mark: $S1
    set $S1, ''
.annotate 'line', 426
# c: $S2
    null $S2
# for loop
.annotate 'line', 427
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 428
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 430
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 435
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 438
    concat $S0, $S1, $S2
    set $S1, $S0
# }
  __label_1: # for iteration
.annotate 'line', 427
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 440
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 442
# content: $S3
    set $S3, ''
.annotate 'line', 443
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 444
# {
.annotate 'line', 445
    set $S4, ''
# for loop
.annotate 'line', 446
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 447
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 449
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 452
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 455
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 446
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 457
    eq $S4, $S1, __label_20
.annotate 'line', 458
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 459
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 460
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 461

.end # getheredoc


.sub 'getident' :subid('WSubId_11')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
# Body
# {
.annotate 'line', 465
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 466
# c: $S2
    null $S2
# for loop
.annotate 'line', 467
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    $P2 = WSubId_8($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 468
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 467
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_3
  __label_2: # for end
.annotate 'line', 469
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 470
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 471

.end # getident


.sub 'getnumber' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_10 = "WSubId_10"
# Body
# {
.annotate 'line', 475
# s: $S1
    null $S1
.annotate 'line', 476
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 477
# {
.annotate 'line', 478
    concat $S1, $S1, $S2
.annotate 'line', 479
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.annotate 'line', 480
    $P1 = WSubId_9($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 481
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 482
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 483
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
    $P2 = WSubId_10($S2)
    set $I2, $P2
    lt $I2, 0, __label_8
# {
.annotate 'line', 484
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 485
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 483
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 487
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 488
    set $S1, $I1
.annotate 'line', 489
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 491
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 492
# {
.annotate 'line', 493
    concat $S1, $S1, $S2
.annotate 'line', 494
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.annotate 'line', 495
    $P1 = WSubId_9($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 496
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 497
    concat $S1, $S1, 'E'
.annotate 'line', 498
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 499
    concat $S1, $S1, $S2
.annotate 'line', 500
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.annotate 'line', 502
    $P1 = WSubId_9($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 503
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 502
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 505
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 506
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 509
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 510
    concat $S1, $S1, 'E'
.annotate 'line', 511
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 512
    concat $S1, $S1, $S2
.annotate 'line', 513
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.annotate 'line', 515
    $P1 = WSubId_9($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 516
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 515
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_29
  __label_28: # for end
.annotate 'line', 517
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 518
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 521
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 522
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
.annotate 'line', 525

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 529
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 530
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
.annotate 'line', 531
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 530
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 532
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 533

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 537
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 538
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 539
# {
# for loop
  __label_7: # for condition
.annotate 'line', 540
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 541
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 540
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 542
    ne $S2, '', __label_9
.annotate 'line', 543
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 544
    concat $S1, $S1, $S2
.annotate 'line', 545
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 546
    ne $S2, '', __label_10
.annotate 'line', 547
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 548
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 549
    concat $S1, $S1, '/'
.annotate 'line', 550
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 551

.end # getcomment


.sub 'getop' :subid('WSubId_12')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 555
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 556
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 557

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
.annotate 'line', 573
    setattribute self, 'h', __ARG_1
.annotate 'line', 574
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 575
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 576
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 577
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 578
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 579
    root_new $P3, ['parrot';'Hash']
    $P3[''] = WSubId_11
    $P3['{'] = WSubId_12
    $P1['$'] = $P3
.annotate 'line', 580
    $P1['"'] = WSubId_13
.annotate 'line', 581
    $P1["'"] = WSubId_14
.annotate 'line', 582
    root_new $P9, ['parrot';'Hash']
.annotate 'line', 583
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_12
    $P11['='] = WSubId_12
    $P9['='] = $P11
.annotate 'line', 584
    $P9[':'] = WSubId_12
    $P1['='] = $P9
.annotate 'line', 586
    root_new $P16, ['parrot';'Hash']
    $P16['+'] = WSubId_12
    $P16['='] = WSubId_12
    $P1['+'] = $P16
.annotate 'line', 587
    root_new $P20, ['parrot';'Hash']
    $P20['-'] = WSubId_12
    $P20['='] = WSubId_12
    $P1['-'] = $P20
.annotate 'line', 588
    root_new $P24, ['parrot';'Hash']
    $P24['='] = WSubId_12
    $P1['*'] = $P24
.annotate 'line', 589
    root_new $P27, ['parrot';'Hash']
    $P27['|'] = WSubId_12
    $P1['|'] = $P27
.annotate 'line', 590
    root_new $P30, ['parrot';'Hash']
    $P30['&'] = WSubId_12
    $P1['&'] = $P30
.annotate 'line', 591
    root_new $P33, ['parrot';'Hash']
.annotate 'line', 592
    root_new $P35, ['parrot';'Hash']
    $P35[''] = WSubId_12
    $P35[':'] = WSubId_15
    $P33['<'] = $P35
.annotate 'line', 593
    $P33['='] = WSubId_12
    $P1['<'] = $P33
.annotate 'line', 595
    root_new $P40, ['parrot';'Hash']
    $P40['>'] = WSubId_12
    $P40['='] = WSubId_12
    $P1['>'] = $P40
.annotate 'line', 596
    root_new $P44, ['parrot';'Hash']
.annotate 'line', 597
    root_new $P46, ['parrot';'Hash']
    $P46[''] = WSubId_12
    $P46['='] = WSubId_12
    $P44['='] = $P46
    $P1['!'] = $P44
.annotate 'line', 599
    root_new $P50, ['parrot';'Hash']
    $P50['%'] = WSubId_12
    $P50['='] = WSubId_12
    $P1['%'] = $P50
.annotate 'line', 600
    root_new $P54, ['parrot';'Hash']
    $P54['='] = WSubId_12
    $P54['/'] = WSubId_16
    $P54['*'] = WSubId_17
    $P1['/'] = $P54
.annotate 'line', 601
    $P1['#'] = WSubId_16
.annotate 'line', 603
    setattribute self, 'select', $P1
# }
.annotate 'line', 604

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 607
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 608
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 609
    eq $S1, '', __label_2
.annotate 'line', 610
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 612
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 613
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 614
    ne $S1, "\n", __label_4
.annotate 'line', 615
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 617
    .return($S1)
# }
.annotate 'line', 618

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 621
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 622

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
.annotate 'line', 625
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 626
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 628
# c: $S1
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 629
    $P3 = WSubId_18($S1)
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 630
    $P4 = self.'getchar'()
    set $S1, $P4
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 631
# line: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 632
    ne $S1, '', __label_5
.annotate 'line', 633
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
.annotate 'line', 634
    $P3 = WSubId_19($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 635
    .tailcall WSubId_11(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 636
    $P3 = WSubId_9($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 637
    .tailcall WSubId_20(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 639
# op: $S2
    set $S2, $S1
.annotate 'line', 640
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 641
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 643
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 644
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 645
    set $P1, $P2
.annotate 'line', 646
    $P2 = $P1[$S1]
.annotate 'line', 647
    unless_null $P2, __label_11
# {
.annotate 'line', 648
    self.'ungetchar'($S1)
.annotate 'line', 649
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 652
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 654
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 655
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 656
    .tailcall WSubId_12(self, $S2, $I1)
# }
.annotate 'line', 657

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 660
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 661
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 662
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 663
    .return($P1)
# }
.annotate 'line', 664

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 667
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 668

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 565
    addattribute $P0, 'h'
.annotate 'line', 566
    addattribute $P0, 'pending'
.annotate 'line', 567
    addattribute $P0, 'select'
.annotate 'line', 568
    addattribute $P0, 'stacked'
.annotate 'line', 569
    addattribute $P0, 'filename'
.annotate 'line', 570
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
.annotate 'line', 689
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
.annotate 'line', 690
    .return('I')
  __label_4: # case
.annotate 'line', 691
    .return('N')
  __label_5: # case
.annotate 'line', 692
    .return('S')
  __label_6: # case
.annotate 'line', 693
    .return('P')
  __label_2: # default
.annotate 'line', 694
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 696

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_104')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
# switch
.annotate 'line', 700
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
.annotate 'line', 701
    .return('int')
  __label_4: # case
.annotate 'line', 702
    .return('num')
  __label_5: # case
.annotate 'line', 703
    .return('string')
  __label_6: # case
.annotate 'line', 704
    .return('pmc')
  __label_2: # default
.annotate 'line', 705
    WSubId_6('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 707

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 727
    setattribute self, 'handle', __ARG_1
.annotate 'line', 728
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 729
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 730
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 731
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 732

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 735
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 736

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 739
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 740

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 743
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 744
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 746
    getattribute $P5, self, 'file'
.annotate 'line', 744
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 749
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 751
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 752
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 754
    getattribute $P5, self, 'line'
.annotate 'line', 752
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 757
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 759

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 762
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 763
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 764

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 767
    self.'updateannot'()
.annotate 'line', 768
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 769

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 772
    self.'updateannot'()
.annotate 'line', 773
    self.'vprint'(__ARG_1)
.annotate 'line', 774
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 775

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 778
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 780
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 781
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 782
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 783
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 784
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 785
    assign $P1, $S1
.annotate 'line', 786
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 787
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 789
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 790
    assign $P2, $I1
.annotate 'line', 791
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 794

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 797
    self.'updateannot'()
.annotate 'line', 798
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 799

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 802
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 803
    $P1.'print'('  ')
.annotate 'line', 804
    $P1.'print'(__ARG_1)
.annotate 'line', 805
    $P1.'print'(':')
.annotate 'line', 806
    if_null __ARG_2, __label_1
.annotate 'line', 807
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 808
    $P1.'print'("\n")
# }
.annotate 'line', 809

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 812
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 813
    $P1.'print'('    goto ')
.annotate 'line', 814
    $P1.'print'(__ARG_1)
.annotate 'line', 815
    if_null __ARG_2, __label_1
.annotate 'line', 816
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 817
    $P1.'print'("\n")
# }
.annotate 'line', 818

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 822
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 823

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 826
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 827

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 830
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 831

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 834
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 835

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 838
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 839

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 842
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 843

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 846
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 847

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 851
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 852

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 855
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 856

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 859
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 860

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 863
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 864

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 867
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 868

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 871
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 872

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 875
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 876

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 879
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 880

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 883
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 884

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 887
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 888

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 891
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 892

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 895
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 896

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 899
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 900

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 903
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 904

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 907
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 908

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 911
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 912

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 915
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 916

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 919
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 920

.end # emitsay


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 923
    concat $S1, "get_hll_global ", __ARG_1
    concat $S1, $S1, ", "
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, "'"
    self.'say'('    ', $S1)
# }
.annotate 'line', 924

.end # emitget_hll_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 927
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 928

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 931
    self.'say'("store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 932

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 718
    addattribute $P0, 'handle'
.annotate 'line', 719
    addattribute $P0, 'file'
.annotate 'line', 720
    addattribute $P0, 'line'
.annotate 'line', 721
    addattribute $P0, 'pendingf'
.annotate 'line', 722
    addattribute $P0, 'pendingl'
.annotate 'line', 723
    addattribute $P0, 'noan'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 941
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 942

.end # integerValue


.sub 'floatValue' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 946
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 947
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 948

.end # floatValue


.sub 'floatresult' :subid('WSubId_62')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 956
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 957
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 958
    .return($I1)
# }
.annotate 'line', 959

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
.annotate 'line', 996
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 997
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 998
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 999
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 1000
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1001
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1002

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
.annotate 'line', 1005
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1007
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1008
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1009
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1012
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1013
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1016
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1017
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 1018
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1019
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1020

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 982
    addattribute $P0, 'body'
.annotate 'line', 983
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
.annotate 'line', 1041
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1042
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1043
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1045
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1046
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1047
# n: $I1
    null $I1
.annotate 'line', 1048
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1049
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1050
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1052
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1055
    set $I1, -2
.annotate 'line', 1056
    if_null __ARG_5, __label_8
.annotate 'line', 1057
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1060
    set $I1, 1
.annotate 'line', 1061
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1062
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1063
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1065
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1066
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1067
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1069
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1070
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1071
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1075
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1076

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1079
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1080
    .return($S1)
# }
.annotate 'line', 1081

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1084
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1085

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1086
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1089
# type: $S1
    null $S1
# switch
.annotate 'line', 1090
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
.annotate 'line', 1091
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1092
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1093
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1094
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1096
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1098
    .return($S1)
# }
.annotate 'line', 1099

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1102
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1103
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1104
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1105
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1106
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1107
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1108

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1025
    addattribute $P0, 'name'
.annotate 'line', 1026
    addattribute $P0, 'body'
.annotate 'line', 1027
    addattribute $P0, 'typeresult'
.annotate 'line', 1028
    addattribute $P0, 'type0'
.annotate 'line', 1029
    addattribute $P0, 'type1'
.annotate 'line', 1030
    addattribute $P0, 'type2'
.annotate 'line', 1031
    addattribute $P0, 'type3'
.annotate 'line', 1032
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
.annotate 'line', 1120
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1121

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1111
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
.annotate 'line', 1134
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1135
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1136

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1124
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1126
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1144
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1145

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1148
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1149
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.annotate 'line', 1150
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1151
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1152
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1154
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1155
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1156
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1159
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1160
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1162
    ne $S3, 'null', __label_9
.annotate 'line', 1163
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1165
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1167

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1141
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
.annotate 'line', 1172
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1173
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1174
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1175
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1176
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1175
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1177
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1180
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1181

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1185
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1186
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1187
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1188
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1189
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1190

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1194
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1195
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1196
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1197

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1203
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1204
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1205
    WSubId_1("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1206
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1207

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1211
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1212
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1213
# predefined length
.annotate 'line', 1210
    length $I1, $S1
.annotate 'line', 1213
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1214

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1218
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1219
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1220
# predefined bytelength
.annotate 'line', 1217
    bytelength $I1, $S1
.annotate 'line', 1220
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1221

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1225
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1226
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1227
# predefined ord
.annotate 'line', 1224
    ord $I1, $S1
.annotate 'line', 1227
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1228

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1232
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1233
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1234
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1235
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1236
# predefined ord
.annotate 'line', 1231
    ord $I2, $S1, $I1
.annotate 'line', 1236
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1237

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1241
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1243
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1244
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1246
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1247
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1248

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1252
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1253
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1254
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1255
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1257
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1258
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1259

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1263
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1264
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1265
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1266
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1267
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1268
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1270
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1271
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1272

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1276
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1277
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1278
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1279
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1280
# predefined indexof
.annotate 'line', 1275
    index $I1, $S1, $S2
.annotate 'line', 1280
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1281

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1285
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1286
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1287
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1288
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1289
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1290
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1291
# predefined indexof
.annotate 'line', 1284
    index $I2, $S1, $S2, $I1
.annotate 'line', 1291
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1292

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
.annotate 'line', 1296
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1297
    new $P4, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1298
    new $P6, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P6.'Predef_typecast'('I')
    set $P5, $P6
    $P4.'PredefFunction'('int', $P5, 'I', '!')
    set $P3, $P4
.annotate 'line', 1296
    push $P1, $P3
.annotate 'line', 1301
    new $P8, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1302
    new $P10, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P10.'Predef_typecast'('N')
    set $P9, $P10
    $P8.'PredefFunction'('float', $P9, 'N', '!')
    set $P7, $P8
.annotate 'line', 1296
    push $P1, $P7
.annotate 'line', 1305
    new $P12, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1306
    new $P14, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P14.'Predef_typecast'('S')
    set $P13, $P14
    $P12.'PredefFunction'('string', $P13, 'S', '!')
    set $P11, $P12
.annotate 'line', 1296
    push $P1, $P11
.annotate 'line', 1309
    new $P16, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P16.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P15, $P16
.annotate 'line', 1296
    push $P1, $P15
.annotate 'line', 1313
    new $P18, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P18.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P17, $P18
.annotate 'line', 1296
    push $P1, $P17
.annotate 'line', 1317
    new $P20, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P20.'PredefFunction'('time', 'time %0', 'I')
    set $P19, $P20
.annotate 'line', 1296
    push $P1, $P19
.annotate 'line', 1321
    new $P22, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P22.'PredefFunction'('floattime', 'time %0', 'N')
    set $P21, $P22
.annotate 'line', 1296
    push $P1, $P21
.annotate 'line', 1325
    new $P24, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P24.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P23, $P24
.annotate 'line', 1296
    push $P1, $P23
.annotate 'line', 1329
    new $P26, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P26.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P25, $P26
.annotate 'line', 1296
    push $P1, $P25
.annotate 'line', 1333
    new $P28, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P28.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P27, $P28
.annotate 'line', 1296
    push $P1, $P27
.annotate 'line', 1337
    new $P30, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P30.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P29, $P30
.annotate 'line', 1296
    push $P1, $P29
.annotate 'line', 1341
    new $P32, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P32.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P31, $P32
.annotate 'line', 1296
    push $P1, $P31
.annotate 'line', 1348
    new $P34, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P34.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P33, $P34
.annotate 'line', 1296
    push $P1, $P33
.annotate 'line', 1355
    new $P36, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P36.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P35, $P36
.annotate 'line', 1296
    push $P1, $P35
.annotate 'line', 1362
    new $P38, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P38.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P37, $P38
.annotate 'line', 1296
    push $P1, $P37
.annotate 'line', 1370
    new $P40, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P40.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P39, $P40
.annotate 'line', 1296
    push $P1, $P39
.annotate 'line', 1379
    new $P42, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P42.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P41, $P42
.annotate 'line', 1296
    push $P1, $P41
.annotate 'line', 1389
    new $P44, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P44.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P43, $P44
.annotate 'line', 1296
    push $P1, $P43
.annotate 'line', 1393
    new $P46, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1394
    $P46.'PredefFunctionEval'('length', WSubId_22, 'length %0, %1', 'I', 'S')
    set $P45, $P46
.annotate 'line', 1296
    push $P1, $P45
.annotate 'line', 1398
    new $P48, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1399
    $P48.'PredefFunctionEval'('bytelength', WSubId_23, 'bytelength %0, %1', 'I', 'S')
    set $P47, $P48
.annotate 'line', 1296
    push $P1, $P47
.annotate 'line', 1403
    new $P50, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1404
    $P50.'PredefFunctionEval'('chr', WSubId_24, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P49, $P50
.annotate 'line', 1296
    push $P1, $P49
.annotate 'line', 1412
    new $P52, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1413
    $P52.'PredefFunctionEval'('ord', WSubId_25, 'ord %0, %1', 'I', 'S')
    set $P51, $P52
.annotate 'line', 1296
    push $P1, $P51
.annotate 'line', 1417
    new $P54, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1418
    $P54.'PredefFunctionEval'('ord', WSubId_26, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P53, $P54
.annotate 'line', 1296
    push $P1, $P53
.annotate 'line', 1422
    new $P56, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1423
    $P56.'PredefFunctionEval'('substr', WSubId_27, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P55, $P56
.annotate 'line', 1296
    push $P1, $P55
.annotate 'line', 1427
    new $P58, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1428
    $P58.'PredefFunctionEval'('substr', WSubId_28, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P57, $P58
.annotate 'line', 1296
    push $P1, $P57
.annotate 'line', 1432
    new $P60, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P60.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P59, $P60
.annotate 'line', 1296
    push $P1, $P59
.annotate 'line', 1436
    new $P62, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1437
    $P62.'PredefFunctionEval'('indexof', WSubId_29, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P61, $P62
.annotate 'line', 1296
    push $P1, $P61
.annotate 'line', 1441
    new $P64, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1442
    $P64.'PredefFunctionEval'('indexof', WSubId_30, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P63, $P64
.annotate 'line', 1296
    push $P1, $P63
.annotate 'line', 1446
    new $P66, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P66.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P65, $P66
.annotate 'line', 1296
    push $P1, $P65
.annotate 'line', 1450
    new $P68, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P68.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P67, $P68
.annotate 'line', 1296
    push $P1, $P67
.annotate 'line', 1454
    new $P70, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P70.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P69, $P70
.annotate 'line', 1296
    push $P1, $P69
.annotate 'line', 1458
    new $P72, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P72.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P71, $P72
.annotate 'line', 1296
    push $P1, $P71
.annotate 'line', 1462
    new $P74, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P74.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P73, $P74
.annotate 'line', 1296
    push $P1, $P73
.annotate 'line', 1466
    new $P76, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P76.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P75, $P76
.annotate 'line', 1296
    push $P1, $P75
.annotate 'line', 1473
    new $P78, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P78.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P77, $P78
.annotate 'line', 1296
    push $P1, $P77
.annotate 'line', 1480
    new $P80, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P80.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P79, $P80
.annotate 'line', 1296
    push $P1, $P79
.annotate 'line', 1484
    new $P82, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P82.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P81, $P82
.annotate 'line', 1296
    push $P1, $P81
.annotate 'line', 1488
    new $P84, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P84.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P83, $P84
.annotate 'line', 1296
    push $P1, $P83
.annotate 'line', 1492
    new $P86, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P86.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P85, $P86
.annotate 'line', 1296
    push $P1, $P85
.annotate 'line', 1496
    new $P88, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P88.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P87, $P88
.annotate 'line', 1296
    push $P1, $P87
.annotate 'line', 1500
    new $P90, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P90.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P89, $P90
.annotate 'line', 1296
    push $P1, $P89
.annotate 'line', 1504
    new $P92, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P92.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P91, $P92
.annotate 'line', 1296
    push $P1, $P91
.annotate 'line', 1508
    new $P94, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P94.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P93, $P94
.annotate 'line', 1296
    push $P1, $P93
.annotate 'line', 1512
    new $P96, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P96.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P95, $P96
.annotate 'line', 1296
    push $P1, $P95
.annotate 'line', 1516
    new $P98, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P98.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P97, $P98
.annotate 'line', 1296
    push $P1, $P97
.annotate 'line', 1520
    new $P100, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P100.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P99, $P100
.annotate 'line', 1296
    push $P1, $P99
.annotate 'line', 1524
    new $P102, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P102.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P101, $P102
.annotate 'line', 1296
    push $P1, $P101
.annotate 'line', 1528
    new $P104, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P104.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P103, $P104
.annotate 'line', 1296
    push $P1, $P103
.annotate 'line', 1532
    new $P106, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P106.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P105, $P106
.annotate 'line', 1296
    push $P1, $P105
.annotate 'line', 1536
    new $P108, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P108.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P107, $P108
.annotate 'line', 1296
    push $P1, $P107
.annotate 'line', 1540
    new $P110, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P110.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P109, $P110
.annotate 'line', 1296
    push $P1, $P109
.annotate 'line', 1544
    new $P112, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P112.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P111, $P112
.annotate 'line', 1296
    push $P1, $P111
.annotate 'line', 1548
    new $P114, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P114.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P113, $P114
.annotate 'line', 1296
    push $P1, $P113
.annotate 'line', 1552
    new $P116, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P116.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P115, $P116
.annotate 'line', 1296
    push $P1, $P115
.annotate 'line', 1556
    new $P118, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P118.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P117, $P118
.annotate 'line', 1296
    push $P1, $P117
.annotate 'line', 1560
    new $P120, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P120.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P119, $P120
.annotate 'line', 1296
    push $P1, $P119
.annotate 'line', 1564
    new $P122, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P122.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P121, $P122
.annotate 'line', 1296
    push $P1, $P121
.annotate 'line', 1571
    new $P124, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P124.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P123, $P124
.annotate 'line', 1296
    push $P1, $P123
.annotate 'line', 1578
    new $P126, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P126.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P125, $P126
.annotate 'line', 1296
    push $P1, $P125
.annotate 'line', 1582
    new $P128, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P128.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P127, $P128
.annotate 'line', 1296
    push $P1, $P127
.annotate 'line', 1586
    new $P130, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P130.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P129, $P130
.annotate 'line', 1296
    push $P1, $P129
.annotate 'line', 1590
    new $P132, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P132.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P131, $P132
.annotate 'line', 1296
    push $P1, $P131
.annotate 'line', 1594
    new $P134, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P134.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P133, $P134
.annotate 'line', 1296
    push $P1, $P133
.annotate 'line', 1598
    new $P136, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1599
    $P136.'PredefFunction'('print', WSubId_31, 'v', '*')
    set $P135, $P136
.annotate 'line', 1296
    push $P1, $P135
.annotate 'line', 1602
    new $P138, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1603
    $P138.'PredefFunction'('say', WSubId_32, 'v', '*')
    set $P137, $P138
.annotate 'line', 1296
    push $P1, $P137
.annotate 'line', 1606
    new $P140, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1607
    $P140.'PredefFunction'('cry', WSubId_33, 'v', '*')
    set $P139, $P140
.annotate 'line', 1296
    push $P1, $P139
.annotate 'line', 1610
    new $P142, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1611
    $P142.'PredefFunction'('invoke', WSubId_34, 'P', '!')
    set $P141, $P142
.annotate 'line', 1296
    push $P1, $P141
  __label_2: # Infinite loop
.annotate 'line', 1616
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1617

.end # getpredefs


.sub 'findpredef' :subid('WSubId_65')
        .param string __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
# Body
# {
.annotate 'line', 1621
    $P2 = WSubId_35()
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 1622
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1623
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1624
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1625
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1626
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1627
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1629
    .return($P2)
# }
.annotate 'line', 1630

.end # findpredef


.sub 'optimize_array' :subid('WSubId_38')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1638
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1639
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1640
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1641
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1640
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1643

.end # optimize_array


.sub 'emit_array' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1647
    if_null __ARG_2, __label_1
# {
.annotate 'line', 1648
    iter $P2, __ARG_2
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $P1, $P2
.annotate 'line', 1649
    $P1.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
# }
.annotate 'line', 1651

.end # emit_array


.sub 'parseDotted' :subid('WSubId_55')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1655
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1656
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1657
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1658
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1659
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1660
    $P2 = __ARG_1.'get'()
.annotate 'line', 1661
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1664
    __ARG_1.'unget'($P2)
.annotate 'line', 1665
    .return($P1)
# }
.annotate 'line', 1666

.end # parseDotted


.sub 'parseList' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1674
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1675
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1676
# {
.annotate 'line', 1677
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1678
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1679
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1680
    unless_null __ARG_4, __label_4
.annotate 'line', 1681
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1683
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1684
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1685
    .return($P1)
# }
.annotate 'line', 1686

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1691
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1692
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1693
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1694
    .return($P1)
# }
.annotate 'line', 1695

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_56')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1699
    new $P1, ['ResizableStringArray']
.annotate 'line', 1700
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1701
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1702
    .return($P1)
# }
.annotate 'line', 1703

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1716
    setattribute self, 'start', __ARG_1
.annotate 'line', 1717
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1718

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1721
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1722
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1724
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 1725

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 1728
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1729
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1731
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 1732

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 1735
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1736
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1738
    .return("")
  __label_2: # endif
# }
.annotate 'line', 1739

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1742
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1743

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1746
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1747

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1750
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1751

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1754
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 1755

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1758
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1759

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1762
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1763

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1766
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1767

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1770
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1771

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1774
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1775

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1711
    addattribute $P0, 'start'
.annotate 'line', 1712
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
.annotate 'line', 1790
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 1791

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1795
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1794
    elements $I1, $P1
.annotate 'line', 1795
    .return($I1)
# }
.annotate 'line', 1796

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1799
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1800
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1801

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1805
    getattribute $P1, self, 'args'
    WSubId_38($P1)
# }
.annotate 'line', 1806

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1809
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1810
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1811
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1812
    .return($P1)
# }
.annotate 'line', 1813

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1816
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1817

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 1786
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1829
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1832
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1833
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1834
    .return($I1)
# }
.annotate 'line', 1835

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1838
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1839
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 1840
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1841
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1842

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1845
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1846
    if_null __ARG_2, __label_1
.annotate 'line', 1847
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1848

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1851
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1852
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1853
    .return(self)
# }
.annotate 'line', 1854

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 1826
    addattribute $P0, 'name'
.annotate 'line', 1827
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1859
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1860
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1861
    $P1 = __ARG_1.'get'()
.annotate 'line', 1862
# var args: $P2
    null $P2
.annotate 'line', 1863
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1864
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1866
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1867
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1868

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 1877
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_39, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 1878

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1881
    getattribute $P1, self, 'list'
    WSubId_38($P1)
# }
.annotate 'line', 1882

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1883
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1886
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1887
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1888
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1890
    .return($P2)
# }
.annotate 'line', 1891

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 1873
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1900
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1901
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1902

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_107')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1906
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1907
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1909
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1910
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1912

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1916
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1918
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1920
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 1922
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1919
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1921
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 1923
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 1925
    __ARG_2.'unget'($P1)
.annotate 'line', 1926
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 1928

.end # parseUsing


.sub 'parseSig' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 1932
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1933
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1934
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 1935
    WSubId_40("'='", $P2)
  __label_1: # endif
.annotate 'line', 1936
# var expr: $P3
    $P3 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 1937
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1938

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
.annotate 'line', 1942
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1943
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1944
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 1945
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1946
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1947
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 1948
    new $P6, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 1949
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1950
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1951
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.annotate 'line', 1952
    WSubId_41("':'", $P1)
  __label_5: # endif
.annotate 'line', 1953
    .tailcall WSubId_42($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 1956
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
.annotate 'line', 1958
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 1960
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 1963
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 1966
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1968
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1970
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1972
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 1974
    new $P6, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 1976
    new $P8, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_17: # case
.annotate 'line', 1978
    new $P10, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_18: # case
.annotate 'line', 1980
    new $P12, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_19: # case
.annotate 'line', 1982
    new $P14, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_20: # case
.annotate 'line', 1984
    new $P16, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_21: # case
.annotate 'line', 1986
    new $P18, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_22: # case
.annotate 'line', 1988
    new $P20, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_23: # case
.annotate 'line', 1990
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1992
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 1994
    new $P22, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_26: # case
.annotate 'line', 1996
    new $P24, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_7: # default
.annotate 'line', 1998
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_27
    unless $P25 goto __label_27
# {
.annotate 'line', 1999
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2000
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 2001
    new $P6, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 2002
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 2004
    __ARG_1.'unget'($P1)
.annotate 'line', 2005
    new $P5, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.annotate 'line', 2007
    WSubId_6('parseStatement failure', $P1)
# }
.annotate 'line', 2008

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2018
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2019

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2020
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2023
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2024

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2027
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2028

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2031
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2032

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2035
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2036

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2039
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2040

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2043
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2044

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2047
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2048

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2051
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2052

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2055
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2056

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2059
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2060

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2063
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2064

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2067
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2068

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2071
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2072

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2079
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2080

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2083
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2084

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2087
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2088

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2091
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2093
    .return(self)
# }
.annotate 'line', 2094

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2014
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2099
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2102
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2103

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2104
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2097
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2117
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2118
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2119
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2120
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2121
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2122
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2123
    null $I2
  __label_4: # endif
.annotate 'line', 2124
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2120
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2126
    unless $I2 goto __label_6
.annotate 'line', 2127
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2129
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2130

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2113
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2137
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2138
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2139

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2140
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2143
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2144
    .return(self)
# }
.annotate 'line', 2145

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 2148
    getattribute $P1, self, 'statements'
    WSubId_52(__ARG_1, $P1)
# }
.annotate 'line', 2149

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2133
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2154
    unless_null __ARG_1, __label_1
.annotate 'line', 2155
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2156
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2157
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2159
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2160

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2168
# var arg: $P1
    null $P1
.annotate 'line', 2169
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2170
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2171
    $P2 = __ARG_1.'get'()
.annotate 'line', 2172
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2173
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2176
    __ARG_1.'unget'($P2)
.annotate 'line', 2177
    $P1 = WSubId_37(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2179
    .return($P1)
# }
.annotate 'line', 2180

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
.annotate 'line', 2189
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2190
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2191
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2192
    unless $I1 goto __label_1
.annotate 'line', 2193
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2194
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2195
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2196
    $P1 = __ARG_2.'get'()
.annotate 'line', 2197
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2198
    __ARG_2.'unget'($P1)
.annotate 'line', 2199
    $P3 = WSubId_36(__ARG_2, __ARG_3, WSubId_53, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2201
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2202

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2205
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 2206
    .return(self)
# }
.annotate 'line', 2207

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2210
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2211
    self.'annotate'(__ARG_1)
.annotate 'line', 2212
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2213
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2214
    __ARG_1.'print'('    ')
.annotate 'line', 2215
    unless_null $P1, __label_2
.annotate 'line', 2216
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2218
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2219
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2220
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2221
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2223

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2182
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2184
    addattribute $P0, 'opname'
.annotate 'line', 2185
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
.annotate 'line', 2235
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2236
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2237
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2238
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2239
    WSubId_54(';', __ARG_2)
.annotate 'line', 2240
    $P3 = WSubId_56($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2241
    .return(self)
# }
.annotate 'line', 2242

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2243
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2246
    self.'annotate'(__ARG_1)
.annotate 'line', 2247
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2248

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2230
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2232
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
.annotate 'line', 2260
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2261
# var names: $P1
    null $P3
    $P1 = WSubId_36(__ARG_2, $P3, WSubId_57, ';')
.annotate 'line', 2262
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2263
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2264
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2266
    setattribute self, 'names', $P1
# }
.annotate 'line', 2267

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2270
    .return(self)
# }
.annotate 'line', 2271

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2274
    self.'annotate'(__ARG_1)
.annotate 'line', 2275
    getattribute $P3, self, 'names'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2276
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2277
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2279

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2255
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2257
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
.annotate 'line', 2293
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2294
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2295
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2296
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2297
    WSubId_54(';', __ARG_2)
.annotate 'line', 2298
    setattribute self, 'path', $P1
# }
.annotate 'line', 2299

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2302
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2303
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2305
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2307
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2321
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2308
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2309
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2310
    $P4.'pop'()
.annotate 'line', 2311
# var ns: $P5
    $P5 = self.'findns'($P4)
.annotate 'line', 2312
    if_null $P5, __label_6
# {
.annotate 'line', 2313
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2314
    if_null $P3, __label_7
# {
.annotate 'line', 2315
    self.'createvarused'($P2, $P3)
.annotate 'line', 2316
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
.annotate 'line', 2322
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2323
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2324
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2325
    self.'usesubid'($S1)
.annotate 'line', 2326
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2328
    self.'createvar'($P2, 'P')
.annotate 'line', 2329
    .return(self)
# }
.annotate 'line', 2330

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2333
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2334
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2335
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2336
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2337
    self.'annotate'(__ARG_1)
.annotate 'line', 2338
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2339
    $P1.'pop'()
# switch
.annotate 'line', 2340
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2342
    __ARG_1.'say'("'", $S1, "'")
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 2345
    $P3 = WSubId_58($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_2: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2348

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2286
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2288
    addattribute $P0, 'path'
.annotate 'line', 2289
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
.annotate 'line', 2359
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2360
# var nskey: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2361
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2362
    ge $I1, 1, __label_1
.annotate 'line', 2363
    WSubId_40('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2364
# var nssym: $P2
    $P3 = WSubId_56($P1)
    $P2 = __ARG_3.'findns'($P3)
.annotate 'line', 2366
    unless_null $P2, __label_2
.annotate 'line', 2367
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2368
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2370
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2371

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2374
    .return(self)
# }
.annotate 'line', 2375

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2355
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
.annotate 'line', 2390
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2391
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2392
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2393

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2396
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
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
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2402

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2385
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2387
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
.annotate 'line', 2419
    setattribute self, 'type', __ARG_1
.annotate 'line', 2420
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2421
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2422
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2423

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2426
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2427

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2428
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2429
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2430
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2431
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2432
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2433
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2434
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2411
    addattribute $P0, 'type'
.annotate 'line', 2412
    addattribute $P0, 'reg'
.annotate 'line', 2413
    addattribute $P0, 'scope'
.annotate 'line', 2414
    addattribute $P0, 'flags'
.annotate 'line', 2415
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2442
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2443

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2446
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2447

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2439
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
.annotate 'line', 2456
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2457

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2458
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2461
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2462
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2463
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2464

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2450
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2452
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2475
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2476

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2479
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2480
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2481
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2482
    if_null $P2, __label_2
.annotate 'line', 2483
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2484
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2485
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2486
    $P1[$S1] = $P3
.annotate 'line', 2487
    .return($P3)
# }
.annotate 'line', 2488

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2491
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2492
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2493
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2494
    if_null $P2, __label_2
.annotate 'line', 2495
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2496
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2497

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2500
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2501
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2502
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2503
    if_null $P2, __label_2
.annotate 'line', 2504
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2505
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2506

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2509
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2510
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2511
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2512
    if_null $P2, __label_2
.annotate 'line', 2513
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2514
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2515
    $P1[$S1] = $P3
.annotate 'line', 2516
    .return($P3)
# }
.annotate 'line', 2517

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2520
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2519
    set $S1, __ARG_1
.annotate 'line', 2521
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2522

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2525
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 2526
    if_null $P1, __label_1
# {
.annotate 'line', 2527
# var sym: $P2
    null $P2
.annotate 'line', 2528
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 2529
    $P2 = $P3.'getlocalvar'(__ARG_1)
    if_null $P2, __label_4
.annotate 'line', 2530
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
    null $P5
.annotate 'line', 2533
    .return($P5)
# }
.annotate 'line', 2534

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2537
# var sym: $P1
    null $P1
.annotate 'line', 2538
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2539
    .return($P1)
  __label_1: # endif
.annotate 'line', 2540
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2541
    .return($P1)
  __label_2: # endif
.annotate 'line', 2542
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2543
    if_null $P2, __label_3
.annotate 'line', 2544
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2545
    .return($P3)
# }
.annotate 'line', 2546

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2549
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2550
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2551
    .return($S1)
# }
.annotate 'line', 2552

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2555
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2557
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2558
    .return('__WLEX_self')
# }
.annotate 'line', 2559

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2470
    addattribute $P0, 'locals'
.annotate 'line', 2471
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2568
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
.annotate 'line', 2580
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2581

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2582
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2583
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2584
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2585
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2586
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2587
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2588
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2589
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2590
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2593
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2594

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2598
    .return(self)
# }
.annotate 'line', 2599

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2600
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2603
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2604
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2605
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2606
    .return($S2)
# }
.annotate 'line', 2607

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2610
# reg: $S1
    null $S1
.annotate 'line', 2611
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2612
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2614
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2615
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2617
    .return($S1)
# }
.annotate 'line', 2618

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2621
    WSubId_1('Not a left-side expression', self)
# }
.annotate 'line', 2622

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2576
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2627
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2625
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
.annotate 'line', 2637
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2638
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2639
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2640
    WSubId_40('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2641
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2642

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2643
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2646
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2647
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2648
    .return(self)
# }
.annotate 'line', 2649

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2652
    self.'annotate'(__ARG_1)
.annotate 'line', 2653
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2654
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2655

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2632
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2634
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
.annotate 'line', 2670
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2671
    .return(self)
# }
.annotate 'line', 2672

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2675
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2676

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2679
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2680
    .return(self)
# }
.annotate 'line', 2681

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2684
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2685
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2686
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2688
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2689
    ne $I1, 0, __label_5
.annotate 'line', 2690
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2692
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2695
    .return(0)
# }
.annotate 'line', 2696

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2699
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2701
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2702
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2703
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2705
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2706
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
.annotate 'line', 2709
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2712
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2715
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2718

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2721
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2723
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2724
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2725
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2727
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2728
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
.annotate 'line', 2731
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2734
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2737
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2740

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2667
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2747
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2748
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2745
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2758
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2759
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2760

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2761
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2762
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2765
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2766
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2767
# typesinglequoted: $I1
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 2768
# need_unicode: $I2
    null $I2
.annotate 'line', 2769
# need_escape: $I3
    null $I3
.annotate 'line', 2770
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $I4, $P3
# {
.annotate 'line', 2771
    le $I4, 127, __label_4
# {
.annotate 'line', 2772
    set $I2, 1
.annotate 'line', 2773
    set $I3, 1
    goto __label_3 # break
.annotate 'line', 2774
# }
  __label_4: # endif
.annotate 'line', 2776
    ge $I4, 32, __label_5
.annotate 'line', 2777
    set $I3, 1
  __label_5: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 2779
    or $I6, $I2, $I3
    unless $I6 goto __label_6
# {
.annotate 'line', 2780
    unless $I1 goto __label_7
# {
.annotate 'line', 2781
    null $I1
.annotate 'line', 2782
# saux: $S2
    set $S2, $S1
.annotate 'line', 2783
    set $S1, ''
.annotate 'line', 2784
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_8: # for iteration
    unless $P4 goto __label_9
    shift $S3, $P4
# {
.annotate 'line', 2785
    ne $S3, '\', __label_10
.annotate 'line', 2786
    set $S3, '\\'
  __label_10: # endif
.annotate 'line', 2787
    concat $S1, $S1, $S3
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_7: # endif
.annotate 'line', 2790
# result: $S4
    set $S4, ''
.annotate 'line', 2791
    box $P2, $S1
    iter $P5, $P2
    set $P5, 0
  __label_11: # for iteration
    unless $P5 goto __label_12
    shift $S5, $P5
# {
.annotate 'line', 2792
# n: $I5
# predefined ord
    ord $I5, $S5
.annotate 'line', 2793
    islt $I6, $I5, 32
    if $I6 goto __label_15
    isgt $I6, $I5, 127
  __label_15:
    unless $I6 goto __label_13
# {
.annotate 'line', 2794
# h: $S6
    box $P6, $I5
    $P2 = $P6.'get_as_base'(16)
    null $S6
    if_null $P2, __label_16
    set $S6, $P2
  __label_16:
.annotate 'line', 2795
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 2798
    concat $S4, $S4, $S5
  __label_14: # endif
# }
    goto __label_11
  __label_12: # endfor
.annotate 'line', 2800
    set $S1, $S4
# }
  __label_6: # endif
.annotate 'line', 2802
# q: $S7
    unless $I1 goto __label_18
    set $S7, "'"
    goto __label_17
  __label_18:
    set $S7, '"'
  __label_17:
.annotate 'line', 2803
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2804
    unless $I2 goto __label_19
.annotate 'line', 2805
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_19: # endif
.annotate 'line', 2806
    .return($S1)
# }
.annotate 'line', 2807

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2810
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2811
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2812
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2813
# var s: $P2
    box $P2, $S1
.annotate 'line', 2814
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2816
    .return($S1)
# }
.annotate 'line', 2817

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2820
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2821
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2822

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2825
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2826

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2753
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2755
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
.annotate 'line', 2838
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2839
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2840
# n: $I1
    null $I1
.annotate 'line', 2841
    unless __ARG_4 goto __label_1
.annotate 'line', 2842
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2844
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2845
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2847
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2848

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2849
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2850
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2853
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2852
    set $I1, $S1
.annotate 'line', 2854
    .return($I1)
# }
.annotate 'line', 2855

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2858
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2859
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2860
    ne $I1, 0, __label_2
.annotate 'line', 2861
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2863
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2865

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2868
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2869

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 2831
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2833
    addattribute $P0, 'pos'
.annotate 'line', 2834
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2879
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2880
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2881

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2882
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2883
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2886
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2887
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2888
    assign $P1, $S1
.annotate 'line', 2889
    .return($P1)
# }
.annotate 'line', 2890

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2893
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2894
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2895
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2897

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2902
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2903
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2904
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2905
    .return($S1)
# }
.annotate 'line', 2906

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 2874
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2876
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2915
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2918
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2919
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2920

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2923
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2924

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2927
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2928
    if_null $P1, __label_1
.annotate 'line', 2929
    .tailcall $P1.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2931
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2934
    .return('P')
  __label_4: # default
.annotate 'line', 2936
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2939

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2942
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2943
    .return($S1)
# }
.annotate 'line', 2944

.end # getName


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2947
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2948
    unless_null $P1, __label_1
.annotate 'line', 2949
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 2950
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2951
# s: $S1
    null $S1
.annotate 'line', 2952
    unless_null $P2, __label_2
# {
.annotate 'line', 2953
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
# switch
.annotate 'line', 2954
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_7
    set $S4, 'null'
    if $S3 == $S4 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 2956
    set $S1, 'self'
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 2958
    set $S1, 'null'
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2960
    set $S1, ''
  __label_5: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 2964
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 2965
    .return($S1)
# }
.annotate 'line', 2966

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2969
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2970
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 2971
    getattribute $P2, self, 'name'
    WSubId_59($P2)
  __label_1: # endif
.annotate 'line', 2972
    .return($P1)
# }
.annotate 'line', 2973

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2976
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2977
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 2978
    if_null $P2, __label_1
# {
.annotate 'line', 2979
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2980
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 2981
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 2982
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2983
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 2984
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 2991
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 2992
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 2993
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
.annotate 'line', 2997
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'findsymbol'($P5)
.annotate 'line', 2998
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 2999
# id: $S1
    $P5 = $P4.'makesubid'()
    null $S1
    if_null $P5, __label_11
    set $S1, $P5
  __label_11:
.annotate 'line', 3000
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3001
    self.'usesubid'($S1)
.annotate 'line', 3002
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3005
    .return(self)
# }
.annotate 'line', 3006

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3009
# id: $S1
    null $S1
.annotate 'line', 3010
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3011
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3013
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3014
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3015
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3016
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3017
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3018
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3019
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3020
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3024
    .return($S1)
# }
.annotate 'line', 3025

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3028
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3029
    self.'annotate'(__ARG_1)
.annotate 'line', 3030
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3031
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3033

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3036
    self.'annotate'(__ARG_1)
.annotate 'line', 3037
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3038

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3041
    self.'annotate'(__ARG_1)
.annotate 'line', 3042
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# predefined die
.annotate 'line', 3043
    die "NO"
  __label_1: # endif
.annotate 'line', 3044
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3045
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3046
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3047
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3050
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3053
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3056
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3057
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3059
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3060
    ne $S3, 'v', __label_13
.annotate 'line', 3061
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3062
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3063
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3066
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3067
    self.'annotate'(__ARG_1)
.annotate 'line', 3068
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3069
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3071
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3074
    .return($S2)
# }
.annotate 'line', 3075

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 2911
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2913
    addattribute $P0, 'name'
.annotate 'line', 2914
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3085
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3086
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3087

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3090
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3091

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3094
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3095
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3096
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3097
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3098
    .return($S2)
# }
.annotate 'line', 3099

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3102
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3103
    self.'annotate'(__ARG_1)
.annotate 'line', 3104
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3105
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3107

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3110
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3111
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3112
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3114
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3117
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3115
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3118
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3121
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3122
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3123
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3125
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3126
    self.'annotate'(__ARG_1)
.annotate 'line', 3127
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3131
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3132

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3135
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3136

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3080
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3082
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3145
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3146

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3141
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
.annotate 'line', 3157
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3158
    $P2 = WSubId_60(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3159

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3160
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3163
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3166
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3167
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3168
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3169
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3170
    __ARG_1.'say'()
# }
.annotate 'line', 3171

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3151
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3153
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3181
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3182
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3183

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3186
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3187

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3190
    self.'optimizearg'()
.annotate 'line', 3191
    .return(self)
# }
.annotate 'line', 3192

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3176
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3178
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
.annotate 'line', 3203
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3204
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3205
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3206

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3209
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3210
    .return(self)
# }
.annotate 'line', 3211

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3214
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3215

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3218
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3219
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
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


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3228
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3229

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3232
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3233

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3197
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3199
    addattribute $P0, 'lexpr'
.annotate 'line', 3200
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3242
    .return('I')
# }
.annotate 'line', 3243

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3246
    self.'optimizearg'()
.annotate 'line', 3247
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3248
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3249
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3250
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3251
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3252
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3254
    .return(self)
# }
.annotate 'line', 3255

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3238
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3264
    .return('I')
# }
.annotate 'line', 3265

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3260
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
.annotate 'line', 3273
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3274

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3277
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3278
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3279
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3280
    self.'annotate'(__ARG_1)
.annotate 'line', 3281
    __ARG_1.'print'('    delete ')
.annotate 'line', 3282
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3283
    __ARG_1.'say'()
.annotate 'line', 3284
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3285
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3288
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3289

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3269
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
.annotate 'line', 3296
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3297

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3300
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3301
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
.annotate 'line', 3302
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3303
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3304
    self.'annotate'(__ARG_1)
.annotate 'line', 3305
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3306
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3307
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3310
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3311

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3292
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
.annotate 'line', 3320
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3321

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3324
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3325

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3328
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3329
    .return(self)
# }
.annotate 'line', 3330

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 3333
    self.'optimizearg'()
.annotate 'line', 3334
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3335
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3336
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3337
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3340
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3341
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3342
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3343
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall WSubId_61($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3346
    .return(self)
# }
.annotate 'line', 3347

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3350
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3351
    self.'annotate'(__ARG_1)
.annotate 'line', 3352
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3353

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3316
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
.annotate 'line', 3362
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3363

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3364
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3367
    .return('I')
# }
.annotate 'line', 3368

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3371
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3372
    .return(self)
# }
.annotate 'line', 3373

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3376
    self.'optimizearg'()
.annotate 'line', 3377
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3378
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3379
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3380
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3381
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
.annotate 'line', 3383
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3384
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3385
    .return(self)
# }
.annotate 'line', 3386

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3389
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3390

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3393
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3394
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3395
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3396
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3398
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3401
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3404
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3406

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3358
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3415
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3416

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3419
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3420
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3421
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3422

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3411
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3431
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3432
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3433
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3434

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3427
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
.annotate 'line', 3441
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3442

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3445
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3446
    self.'annotate'(__ARG_1)
.annotate 'line', 3447
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3448
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3449
    .return($S1)
# }
.annotate 'line', 3450

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3437
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
.annotate 'line', 3457
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3458

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3461
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3462
    self.'annotate'(__ARG_1)
.annotate 'line', 3463
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3464
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3465
    .return($S1)
# }
.annotate 'line', 3466

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3453
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
.annotate 'line', 3475
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3476

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3479
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3480
    self.'annotate'(__ARG_1)
.annotate 'line', 3481
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3482
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3483
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3484
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3485
    .return($S1)
# }
.annotate 'line', 3486

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3471
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
.annotate 'line', 3493
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3494

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3497
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3498
    self.'annotate'(__ARG_1)
.annotate 'line', 3499
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3500
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3501
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3502
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3503
    .return($S1)
# }
.annotate 'line', 3504

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3489
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
.annotate 'line', 3515
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3516
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3517
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3518
    .return(self)
# }
.annotate 'line', 3519

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3522
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3523

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3526
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3527
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3528
    .return(self)
# }
.annotate 'line', 3529

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3532
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3533

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3536
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3537
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3538
    self.'annotate'(__ARG_1)
.annotate 'line', 3539
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3541

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3509
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3511
    addattribute $P0, 'lexpr'
.annotate 'line', 3512
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3550
    self.'annotate'(__ARG_1)
.annotate 'line', 3551
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3552
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3553

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3546
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3562
    self.'annotate'(__ARG_1)
.annotate 'line', 3563
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3564
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3565
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3566

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3569
    self.'annotate'(__ARG_1)
.annotate 'line', 3570
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3571
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3572
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3573
    .return($S1)
# }
.annotate 'line', 3574

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3558
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3583
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3584
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3585
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3586
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3587
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3588
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3589
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3591
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3592
# aux: $S5
    null $S5
.annotate 'line', 3593
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3594
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3596
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3597
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3598
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3599
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3601
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3605
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3606
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3607
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3608
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3610
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3613
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3616
    .return($S3)
# }
.annotate 'line', 3617

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3579
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3626
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3627
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3628
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3629
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3630
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3631
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3632
# aux: $S5
    null $S5
.annotate 'line', 3633
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3634
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3636
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3639
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3640
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3641
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3642
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3644
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3647
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3649
    .return($S3)
# }
.annotate 'line', 3650

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3622
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3659
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3660
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3661
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3662
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3663
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3665
    ne $S2, 'I', __label_7
.annotate 'line', 3666
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3668
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3669
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3671
    self.'annotate'(__ARG_1)
.annotate 'line', 3672
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3675
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3676
    self.'annotate'(__ARG_1)
.annotate 'line', 3677
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3679
    .return($S3)
# }
.annotate 'line', 3680

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3655
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3689
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3690
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3691
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3692
    self.'annotate'(__ARG_1)
.annotate 'line', 3693
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3694
    .return($S2)
# }
.annotate 'line', 3695

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3685
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3704
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3705
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3706
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3707
    self.'annotate'(__ARG_1)
.annotate 'line', 3708
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3709
    .return($S2)
# }
.annotate 'line', 3710

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3700
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3717
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3720
    self.'optimizearg'()
.annotate 'line', 3721
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3722
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3723
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3724
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3725
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3726
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3728
    .return(self)
# }
.annotate 'line', 3729

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3732
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3733
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3734
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3735
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3736
    self.'annotate'(__ARG_1)
.annotate 'line', 3737
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3739
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3744
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3749
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3754
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3759
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3764
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3740
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3741
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3742
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3745
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3746
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3747
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3750
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3751
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3752
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3755
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3756
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3757
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3760
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3761
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3762
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3765
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3766
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3767
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3768
# switch
.annotate 'line', 3771
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3773
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3776
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3779
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3780
# }
.annotate 'line', 3782

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3785
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3786

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3789
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3790

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3793
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3794

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3715
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
.annotate 'line', 3809
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3810
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3811
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3812

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3813
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3814
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3817
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3818
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3819
    .return(self)
# }
.annotate 'line', 3820

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3823
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3824
    self.'annotate'(__ARG_1)
.annotate 'line', 3825
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3826
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3827
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3828

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3831
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3832
    self.'annotate'(__ARG_1)
.annotate 'line', 3833
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
.annotate 'line', 3834

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 3802
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3804
    addattribute $P0, 'expr'
.annotate 'line', 3805
    addattribute $P0, 'checknull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3841
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3844
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3845

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3848
    self.'optimizearg'()
.annotate 'line', 3849
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3850
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3851
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3852
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3853
    unless $I1 goto __label_1
# {
.annotate 'line', 3854
    unless $I2 goto __label_2
.annotate 'line', 3855
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3857
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3859
    unless $I2 goto __label_4
.annotate 'line', 3860
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3861
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3862
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3863
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3864
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3865
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3867
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3868
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3869
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3871
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3872
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3873
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
.annotate 'line', 3877
    .return(self)
# }
.annotate 'line', 3878

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3881
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3882

.end # emitop


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


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3889
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3890

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3893
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3894

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 3839
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3901
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3904
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3905

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3908
    self.'optimizearg'()
.annotate 'line', 3909
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3910
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3911
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3912
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3913
    unless $I1 goto __label_1
# {
.annotate 'line', 3914
    unless $I2 goto __label_2
.annotate 'line', 3915
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3917
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3919
    unless $I2 goto __label_4
.annotate 'line', 3920
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3921
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3922
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3923
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3924
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3925
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3927
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3928
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3929
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3931
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3932
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3933
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
.annotate 'line', 3937
    .return(self)
# }
.annotate 'line', 3938

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3941
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3942

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3945
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3946

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3949
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3950

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3953
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3954

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 3899
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
.annotate 'line', 3964
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3965
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3966

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3967
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3970
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3971
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
.annotate 'line', 3972

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3975
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
.annotate 'line', 3976

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3979
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3980
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 3981
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
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
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3990
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 3991
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3992

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3995
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3996
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 3997
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3998

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 3959
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3961
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

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
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4009

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4012
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4013

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4016
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4017

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4020
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4021

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4024
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4025

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4003
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4032
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4035
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4036

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4039
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4040

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4043
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4044

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4047
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4048

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4051
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4052

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4030
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4059
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4062
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4063

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4066
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4067

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4070
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4071

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4074
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4075

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4078
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4079

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4057
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4086
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4089
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4090

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4093
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4094

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4097
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4098

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4101
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4102

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4105
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4106

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4084
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4115
    .return('I')
# }
.annotate 'line', 4116

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4111
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
.annotate 'line', 4125
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4126

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4129
    self.'optimizearg'()
.annotate 'line', 4130
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4131
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4132
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4133
    eq $I1, 0, __label_2
.annotate 'line', 4134
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4136
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4138
    .return(self)
# }
.annotate 'line', 4139

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4142
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
.annotate 'line', 4143
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4144
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4145
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4146
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4149
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4150
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4151
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4152
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4153
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4155

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4121
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
.annotate 'line', 4164
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4165

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4168
    self.'optimizearg'()
.annotate 'line', 4169
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4170
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4171
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4172
    ne $I1, 0, __label_2
.annotate 'line', 4173
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4175
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4177
    .return(self)
# }
.annotate 'line', 4178

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4181
# res: $S1
    null $S1
.annotate 'line', 4182
    if_null __ARG_2, __label_1
.annotate 'line', 4183
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4185
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4186
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4187
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4188
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4189
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4192
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4193
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4194
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4195
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4196
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4198

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4160
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4203
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
.annotate 'line', 4213
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4214

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4217
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
.annotate 'line', 4218
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4219
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4220
    self.'annotate'(__ARG_1)
.annotate 'line', 4221
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4222

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4225
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4226

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4209
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
.annotate 'line', 4235
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4236

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4239
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
.annotate 'line', 4240
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4241
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4242
    self.'annotate'(__ARG_1)
.annotate 'line', 4243
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4244

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4247
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4248

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4231
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
.annotate 'line', 4257
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4258

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4261
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
.annotate 'line', 4262
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4263
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4264
    self.'annotate'(__ARG_1)
.annotate 'line', 4265
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4266

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4269
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4270

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4253
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
.annotate 'line', 4280
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4282
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4289
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4283
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4284
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4285
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4287
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4290
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4291
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4294
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4296

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4297
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4300
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4301
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4302
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4303
# i: $I2
    null $I2
# for loop
.annotate 'line', 4304
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4305
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4304
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4306
    .return($P2)
# }
.annotate 'line', 4307

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4310
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4311
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4312
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4313
    self.'annotate'(__ARG_1)
.annotate 'line', 4314
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4315
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4316
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4315
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4317
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4318

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4321
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4322
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4323
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4324
    self.'annotate'(__ARG_1)
.annotate 'line', 4325
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4326
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4327
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4326
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4328
    .return($S1)
# }
.annotate 'line', 4329

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4332
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4333
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4334
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4335
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4336
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4335
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4337

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4340
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4341
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4342
    self.'annotate'(__ARG_1)
.annotate 'line', 4343
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4344
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4345
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4344
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4346

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4275
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4277
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
.annotate 'line', 4355
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4356

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4359
    self.'optimizearg'()
.annotate 'line', 4360
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4361
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4362
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4363
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4364
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4365
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4370
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4371
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4372
# var t: $P5
    isa $I3, $P3, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    unless $I3 goto __label_9
.annotate 'line', 4373
    isa $I3, $P4, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4375
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4376
    getattribute $P13, $P3, 'str'
.annotate 'line', 4372
    set $S3, $P13
# predefined string
.annotate 'line', 4376
    getattribute $P14, $P4, 'str'
.annotate 'line', 4372
    set $S4, $P14
.annotate 'line', 4376
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4378
    new $P15, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4379
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4372
    set $S6, $P18
# predefined string
.annotate 'line', 4379
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4372
    set $S7, $P19
.annotate 'line', 4379
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4380
    new $P11, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4382
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4383
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4384
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4385
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4386
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4387
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4390
    $P10 = WSubId_62($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4391
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4392
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4393
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4394
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4395
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_61($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4399
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4400
    new $P11, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4402
    .return(self)
# }
.annotate 'line', 4403

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 4406
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4407
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4408
    ne $S1, $S2, __label_3
.annotate 'line', 4409
    .return($S1)
  __label_3: # endif
.annotate 'line', 4410
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4411
    .return('S')
  __label_4: # endif
.annotate 'line', 4412
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4413
    .return('S')
  __label_6: # endif
.annotate 'line', 4414
    $P1 = WSubId_62($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4415
    .return('N')
  __label_8: # endif
.annotate 'line', 4416
    .return('I')
# }
.annotate 'line', 4417

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4420
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4421
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4422
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4423
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4424
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4426
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4427
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4428
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4429
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4430
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4431
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4432
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4433
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4436
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4437
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4440
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4443
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4444
# l: $S7
    null $S7
.annotate 'line', 4445
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4447
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4448
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4450
# r: $S8
    null $S8
.annotate 'line', 4451
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4453
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4454
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4456
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4459
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4461

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4351
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
.annotate 'line', 4470
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4471

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4474
    self.'optimizearg'()
.annotate 'line', 4475
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4476
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4477
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4478
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4479
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4480
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4481
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4482
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4483
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4484
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4485
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P5, $P6, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4488
    .return(self)
# }
.annotate 'line', 4489

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4492
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4493
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4494
    ne $S1, $S2, __label_3
.annotate 'line', 4495
    .return($S1)
  __label_3: # endif
.annotate 'line', 4496
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4497
    .return('N')
  __label_4: # endif
.annotate 'line', 4498
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4499
    .return('N')
  __label_6: # endif
.annotate 'line', 4500
    .return('I')
# }
.annotate 'line', 4501

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4504
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4505
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4506
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4507

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4466
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
.annotate 'line', 4516
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4517

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4520
    self.'optimizearg'()
.annotate 'line', 4521
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4522
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4523
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4524
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4525
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4526
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4527
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4528
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4529
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4530
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4531
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P7, $P8, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4534
    $P7 = WSubId_62($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4535
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4536
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4537
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4538
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4539
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_61($P7, $P8, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4543
    .return(self)
# }
.annotate 'line', 4544

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4547
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4548
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4549
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4550
    ne $S1, $S2, __label_3
.annotate 'line', 4551
    .return($S1)
  __label_3: # endif
.annotate 'line', 4552
    ne $S1, 'S', __label_4
.annotate 'line', 4553
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4555
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4556

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4559
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4560
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4561
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4562
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4563
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4564
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4565
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4566
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4567
# rval: $S5
    null $S5
# switch
.annotate 'line', 4568
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4570
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4573
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4574
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4576
    self.'annotate'(__ARG_1)
.annotate 'line', 4577
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4578
    .return()
# }
  __label_3: # endif
.annotate 'line', 4580
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
.annotate 'line', 4581
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4582
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4583
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4584
    .return()
# }
  __label_7: # endif
.annotate 'line', 4589
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4590
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4591
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4592
# rval: $S6
    null $S6
# switch
.annotate 'line', 4593
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4595
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4596
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4597
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4600
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4603
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4604
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4606
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4607
    self.'annotate'(__ARG_1)
.annotate 'line', 4608
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4610
    .return()
# }
  __label_11: # endif
.annotate 'line', 4613
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4614
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4615
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4616
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4619
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4620
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4622
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4623
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4624
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4627
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4629
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4630
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4633
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4637
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4638
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4639
# }
  __label_21: # endif
.annotate 'line', 4642
    self.'annotate'(__ARG_1)
.annotate 'line', 4643
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4644
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4645
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4646

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4512
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
.annotate 'line', 4655
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4656

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4659
    self.'optimizearg'()
.annotate 'line', 4660
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4661
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4662
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4663
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4664
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4665
# var lval: $P3
    null $P3
.annotate 'line', 4666
# var rval: $P4
    null $P4
.annotate 'line', 4667
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4668
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4669
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4670
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4671
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4672
    eq $I2, 0, __label_7
.annotate 'line', 4673
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
.annotate 'line', 4676
    $P5 = WSubId_62($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4677
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4678
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4679
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4680
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4681
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4682
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
.annotate 'line', 4686
    .return(self)
# }
.annotate 'line', 4687

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4690
    .return('N')
# }
.annotate 'line', 4691

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4694
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4695
# var aux: $P2
    null $P2
.annotate 'line', 4696
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4697
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4698
    $P2 = self.'tempreg'('N')
.annotate 'line', 4699
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4700
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4702
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4703
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4704
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4705
    $P2 = self.'tempreg'('N')
.annotate 'line', 4706
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4707
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4709
    self.'annotate'(__ARG_1)
.annotate 'line', 4710
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4711

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4651
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
.annotate 'line', 4720
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4721

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4724
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4725
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4726
    self.'annotate'(__ARG_1)
.annotate 'line', 4727
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4728

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4731
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4732

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4716
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
.annotate 'line', 4741
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4742

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4745
    .return('I')
# }
.annotate 'line', 4746

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4749
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4750
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4751
    self.'annotate'(__ARG_1)
.annotate 'line', 4756
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4757

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 4737
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
.annotate 'line', 4766
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4767

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4770
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
.annotate 'line', 4771
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4772
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4773
    self.'annotate'(__ARG_1)
.annotate 'line', 4774
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4775

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4778
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4779

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 4762
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
.annotate 'line', 4788
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4789

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4792
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
.annotate 'line', 4793
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4794
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4795
    self.'annotate'(__ARG_1)
.annotate 'line', 4796
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4797

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4800
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4801

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 4784
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4810
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4811

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4814
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4815
# setname: $S1
    set $S1, ''
.annotate 'line', 4816
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4817
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4819
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4822
    set $I2, 1
# switch
.annotate 'line', 4823
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
.annotate 'line', 4827
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4828
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 4829
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 4830
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4833
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4838
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4841
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4844
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4839
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4842
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4845
    __ARG_1.'print'(' :named')
.annotate 'line', 4846
    eq $S1, '', __label_17
.annotate 'line', 4847
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4848
# }
.annotate 'line', 4850

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 4806
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4859
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4860
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4861

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4864
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4865
    .return(self)
# }
.annotate 'line', 4866

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4869
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4870

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 4855
    addattribute $P0, 'arg'
.annotate 'line', 4856
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
.annotate 'line', 4875
# var modifier: $P1
    null $P1
.annotate 'line', 4876
# var expr: $P2
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 4877
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4878
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4879
    $P3 = __ARG_1.'get'()
.annotate 'line', 4880
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 4881
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 4884
    WSubId_40('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4887
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4888
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4889

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
.annotate 'line', 4900
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4901
    setattribute self, 'start', __ARG_2
.annotate 'line', 4902
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4903
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4904
    __ARG_3.'unget'($P1)
.annotate 'line', 4905
    $P3 = WSubId_36(__ARG_3, __ARG_1, WSubId_63, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 4907

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4910
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4911
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4909
    elements $I1, $P1
  __label_1:
.annotate 'line', 4911
    .return($I1)
# }
.annotate 'line', 4912

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4915
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4916

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4919
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4920
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4921

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4924
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4925
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4926

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 4929
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 4930
    .return(self)
# }
.annotate 'line', 4931

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4934
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4935
    unless_null $P1, __label_1
# {
.annotate 'line', 4936
    new $P2, ['ResizableStringArray']
.annotate 'line', 4937
# pnull: $S1
    set $S1, ''
.annotate 'line', 4938
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4939
    if_null $P3, __label_2
# {
.annotate 'line', 4940
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4941
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4942
# reg: $S2
    null $S2
.annotate 'line', 4943
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4944
    ne $S1, '', __label_7
# {
.annotate 'line', 4945
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4946
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4948
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4951
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4952
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4955
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4957
    .return($P1)
# }
.annotate 'line', 4958

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4961
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4962
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4964
# sep: $S1
    set $S1, ''
.annotate 'line', 4965
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4966
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4967
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4968
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4969
    if_null $P3, __label_4
.annotate 'line', 4970
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 4971
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 4966
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4973

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 4893
    addattribute $P0, 'owner'
.annotate 'line', 4894
    addattribute $P0, 'start'
.annotate 'line', 4895
    addattribute $P0, 'args'
.annotate 'line', 4896
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_64')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4978
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 4979
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 4980
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 4981
    .return(1)
# }
.annotate 'line', 4982

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4993
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4994
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4995
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4996

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4999
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5000

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5003
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5004
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5005
    new $P3, ['ResizableStringArray']
.annotate 'line', 5006
# var arg: $P4
    null $P4
.annotate 'line', 5007
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5008
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5010
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5011
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5013
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5014
    ne $S1, '', __label_9
# {
.annotate 'line', 5015
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5016
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5018
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5020
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5024
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5025
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5026
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5027
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 5028
    .return()
  __label_2: # default
.annotate 'line', 5030
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5031
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5032
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5033
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5034
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5035
# argr: $S5
    null $S5
.annotate 'line', 5036
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5037
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
.annotate 'line', 5041
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5042
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5045
    ne $S1, '', __label_24
# {
.annotate 'line', 5046
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5047
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5049
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5053
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5054
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5056
# aux: $S6
    null $S6
.annotate 'line', 5057
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5058
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
.annotate 'line', 5060
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
.annotate 'line', 5064
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5065
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 5068
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 5074
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5075
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 5078
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5082
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5031
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5085
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5086

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 4986
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4988
    addattribute $P0, 'predef'
.annotate 'line', 4989
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
.annotate 'line', 5093
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5094
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5095
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 5096
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 5099
    isa $I2, __ARG_2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 5100
    $P3 = WSubId_64($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5101
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 5102
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 5106
    new $P4, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P5, $P6, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 5107

.end # genpredefcallexpr

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5116
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5117
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5118
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5119
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5120
    __ARG_1.'unget'($P1)
.annotate 'line', 5121
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5123

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5124
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5127
# var funref: $P1
    getattribute $P4, self, 'funref'
    $P1 = $P4.'optimize'()
.annotate 'line', 5128
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5129
# nargs: $I1
    null $I1
.annotate 'line', 5130
    if_null $P2, __label_1
# {
.annotate 'line', 5131
    $P2 = $P2.'optimize'()
.annotate 'line', 5132
    $P4 = $P2.'numargs'()
    set $I1, $P4
# }
  __label_1: # endif
.annotate 'line', 5135
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5136
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P5.'CallMemberExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 5137
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5138
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P5.'CallMemberRefExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_3: # endif
.annotate 'line', 5141
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 5142
# callname: $S1
    $P5 = $P1.'getName'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 5143
# var predef: $P3
    $P3 = WSubId_65($S1, $I1)
.annotate 'line', 5144
    if_null $P3, __label_6
.annotate 'line', 5145
    getattribute $P4, self, 'owner'
    .tailcall WSubId_66($P4, $P3, $P2)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 5148
    setattribute self, 'funref', $P1
.annotate 'line', 5149
    setattribute self, 'args', $P2
.annotate 'line', 5150
    .return(self)
# }
.annotate 'line', 5151

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5154
    .return(1)
# }
.annotate 'line', 5155

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5158
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5159
# call: $S1
    null $S1
.annotate 'line', 5161
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5162
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5163
    ne $S1, '', __label_4
# {
.annotate 'line', 5164
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P1.'getName'()
    push $P3, $P5
    $P2 = self.'findsymbol'($P3)
.annotate 'line', 5165
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_7
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
  __label_7:
    unless $I1 goto __label_5
.annotate 'line', 5166
    $P3 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P3
    goto __label_6
  __label_5: # else
.annotate 'line', 5168
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
.annotate 'line', 5172
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5173
    .return($S1)
# }
.annotate 'line', 5174

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5177
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5178
    if_null $P1, __label_1
.annotate 'line', 5179
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5180

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5183
    __ARG_1.'print'('(')
.annotate 'line', 5184
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5185
    if_null $P1, __label_1
.annotate 'line', 5186
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5187
    __ARG_1.'say'(')')
# }
.annotate 'line', 5188

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5191
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5192
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5194
    self.'annotate'(__ARG_1)
.annotate 'line', 5196
    __ARG_1.'print'('    ')
.annotate 'line', 5197
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5198
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5199
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5201
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5204
    __ARG_1.'print'($S1)
.annotate 'line', 5205
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5206

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5109
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5111
    addattribute $P0, 'funref'
.annotate 'line', 5112
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5220
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5221
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5222
    setattribute self, 'args', __ARG_3
.annotate 'line', 5227
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5228
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5229
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5230
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5231
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5232
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5233
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5234
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5235
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5236
    if_null $P4, __label_6
# {
.annotate 'line', 5237
    setattribute self, 'sym', $P4
.annotate 'line', 5238
    isa $I1, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_7
# {
.annotate 'line', 5239
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
.annotate 'line', 5240
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
.annotate 'line', 5245

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5248
    getattribute $P3, self, 'sym'
    if_null $P3, __label_1
# {
.annotate 'line', 5249
    getattribute $P4, self, 'subid'
    if_null $P4, __label_2
.annotate 'line', 5250
    getattribute $P5, self, 'subid'
    .return($P5)
  __label_2: # endif
.annotate 'line', 5251
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5252
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5253
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5255
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5256
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P2.'emit_left_get'(__ARG_1)
    push $P3, $P5
    box $P4, ".'"
    push $P3, $P4
.annotate 'line', 5257
    $P6 = $P2.'get_member'()
.annotate 'line', 5256
    push $P3, $P6
    box $P4, "'"
    push $P3, $P4
# predefined join
.annotate 'line', 5247
    join $S1, "", $P3
.annotate 'line', 5256
    .return($S1)
# }
.annotate 'line', 5258

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5214
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5216
    addattribute $P0, 'sym'
.annotate 'line', 5217
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5268
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5269
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5270
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5271

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5274
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5275
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5276
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5277
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5278
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5281
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5282
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5283
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5284

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5264
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
.annotate 'line', 5294
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5295
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5296

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5299
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5300
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5301
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5302
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5303
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5304
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5305
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5307
    .return($S2)
# }
.annotate 'line', 5308

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5289
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5291
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
.annotate 'line', 5317
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5318
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5319

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5320
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5323
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5324
    .return(self)
# }
.annotate 'line', 5325

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5328
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5329
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5330
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5332
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5333
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5334

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5337
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5338

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5341
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5342
    self.'annotate'(__ARG_1)
.annotate 'line', 5343
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5344

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5347
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5348
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5349
    .return($S1)
# }
.annotate 'line', 5350

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5353
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5354
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5355
    self.'annotate'(__ARG_1)
.annotate 'line', 5356
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5357

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5360
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5361

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5364
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5365
# value: $S2
    null $S2
.annotate 'line', 5366
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5368
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5369
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5370
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5372
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5375
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5376
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5378
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5379

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5382
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5383
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5384
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5385
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5387
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5388
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5389
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5391
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5393
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5394
    .return($S2)
# }
.annotate 'line', 5395

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5311
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5313
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
.annotate 'line', 5405
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5406
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5407

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5408
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5411
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5412
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5413
    .return(self)
# }
.annotate 'line', 5414

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5417
    WSubId_1('Member reference can be used only for method calls', self)
# }
.annotate 'line', 5419

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5400
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5402
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
.annotate 'line', 5433
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5434
    setattribute self, 'left', __ARG_4
.annotate 'line', 5435
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5436

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5439
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5440
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5442
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5443

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5446
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5447
    setattribute self, 'left', $P1
.annotate 'line', 5448
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5449
    $P2.'optimizeargs'()
.annotate 'line', 5453
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5454
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5455
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5456
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5457
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5458
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5459
# predefined substr
.annotate 'line', 5458
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5460
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5463
    .return(self)
# }
.annotate 'line', 5464

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5467
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5468
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5469
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5470
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5471
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5472
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5470
    setattribute self, 'regleft', $P3
.annotate 'line', 5473
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5474

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5477
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5478
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5479
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5480
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5481
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5482
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5483
    __ARG_1.'print'(']')
# }
.annotate 'line', 5484

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5487
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5488
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5489
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5490
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5491
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5492
    eq $I1, 1, __label_4
.annotate 'line', 5493
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5494
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5495
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5496
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5499
    self.'annotate'(__ARG_1)
.annotate 'line', 5500
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5501
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5502
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5504

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5507
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5508
    self.'annotate'(__ARG_1)
.annotate 'line', 5509
    __ARG_1.'print'('    ')
.annotate 'line', 5510
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5511
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5512

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5515
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5516
# rreg: $S1
    null $S1
.annotate 'line', 5517
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5518
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5519
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5522
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5523
    self.'annotate'(__ARG_1)
.annotate 'line', 5524
    __ARG_1.'print'('    ')
.annotate 'line', 5525
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5526
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5527
    .return($S1)
# }
.annotate 'line', 5528

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5424
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5426
    addattribute $P0, 'left'
.annotate 'line', 5427
    addattribute $P0, 'regleft'
.annotate 'line', 5428
    addattribute $P0, 'args'
.annotate 'line', 5429
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
.annotate 'line', 5539
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5540
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5541
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5542
    __ARG_1.'unget'($P1)
.annotate 'line', 5543
    $P3 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5545

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5546
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5549
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5550
    .return(self)
# }
.annotate 'line', 5551

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5554
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5555
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5556
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5562
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5564

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5567
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5568
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5569
    .return($S1)
# }
.annotate 'line', 5570

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5573
    self.'annotate'(__ARG_1)
.annotate 'line', 5574
# itemreg: $S1
    null $S1
.annotate 'line', 5575
# it_p: $S2
    null $S2
.annotate 'line', 5576
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5577
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5578
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5580
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5581
    if_null $P1, __label_2
# {
.annotate 'line', 5582
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5583
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
.annotate 'line', 5585
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5586
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5587
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5588
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5592
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5593
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5594
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5595
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5599
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5601
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5602
    self.'annotate'(__ARG_1)
.annotate 'line', 5603
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5607

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5533
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5535
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
.annotate 'line', 5619
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5620
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5621
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5622
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5623
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5624
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5625
# {
.annotate 'line', 5626
# var key: $P4
    $P4 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5627
    WSubId_54(':', __ARG_1)
.annotate 'line', 5628
# var value: $P5
    $P5 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5629
# predefined push
    push $P2, $P4
.annotate 'line', 5630
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5632
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5633
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5634
    WSubId_40("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5636
    setattribute self, 'keys', $P2
.annotate 'line', 5637
    setattribute self, 'values', $P3
# }
.annotate 'line', 5638

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5639
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5642
    getattribute $P1, self, 'keys'
    WSubId_38($P1)
.annotate 'line', 5643
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5644
    .return(self)
# }
.annotate 'line', 5645

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5648
    self.'annotate'(__ARG_1)
.annotate 'line', 5653
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5654
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5656
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5657
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5658
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5659
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5660
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5661
# item: $S1
    null $S1
.annotate 'line', 5662
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5663
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5664
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5665
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5668
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5670
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5671
# itemreg: $S3
    null $S3
.annotate 'line', 5672
# it_p: $S4
    null $S4
.annotate 'line', 5673
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 5674
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 5675
# aux: $S5
    null $S5
# switch
.annotate 'line', 5676
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
.annotate 'line', 5678
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 5679
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 5680
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 5681
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 5685
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 5686
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 5687
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5688
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 5692
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 5694
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 5695
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5659
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5697

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5700
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5701
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5702
    .return($S1)
# }
.annotate 'line', 5703

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5612
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5614
    addattribute $P0, 'keys'
.annotate 'line', 5615
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5716
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5721
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5722

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5725
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5726
    if_null $P1, __label_1
.annotate 'line', 5727
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5728

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5731
    self.'optimize_initializer'()
.annotate 'line', 5732
    .return(self)
# }
.annotate 'line', 5733

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5736
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5737
    if_null $P1, __label_1
.annotate 'line', 5738
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5739
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5740
    if_null $P1, __label_2
.annotate 'line', 5741
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5742
    __ARG_1.'say'(")")
# }
.annotate 'line', 5743

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 5708
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5710
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
.annotate 'line', 5754
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5756
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 5757
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5758
    setattribute self, 'value', __ARG_4
.annotate 'line', 5759
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5761
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 5762
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5764
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5765

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5768
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5769
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5772
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5773
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5774
    $P1 = $P2.'getvalue'()
.annotate 'line', 5775
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 5776
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5777
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5780
    self.'optimize_initializer'()
.annotate 'line', 5781
    .return(self)
# }
.annotate 'line', 5782

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
.annotate 'line', 5785
    self.'annotate'(__ARG_1)
.annotate 'line', 5787
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5788
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5791
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5792
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
.annotate 'line', 5794
# reginit: $S1
    set $S1, ''
.annotate 'line', 5795
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5796
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5797
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
.annotate 'line', 5802
    ne $I2, 1, __label_13
# {
.annotate 'line', 5803
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5804
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5807
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5808
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5809
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5813
    eq $I2, 1, __label_16
.annotate 'line', 5814
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 5815
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5816
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5819
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5822
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5823
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5824
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 5825
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_67($S5, $P8)
  __label_23: # endif
.annotate 'line', 5829
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5830
    le $I1, 1, __label_25
# {
.annotate 'line', 5831
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5835
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5836
    unless_null $P4, __label_26
# {
.annotate 'line', 5838
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5839
    if_null $P5, __label_28
# {
.annotate 'line', 5840
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5843
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.annotate 'line', 5844
    WSubId_67('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5845
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5847
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5851
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5855
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5857
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5858
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5859
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5860
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5862

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5865
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5866

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 5748
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5750
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5877
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5878
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5879
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5880
    setattribute self, 'nskey', $P1
.annotate 'line', 5881
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5882
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5883
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5885
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5886

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5889
# reginit: $S1
    null $S1
.annotate 'line', 5890
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5891
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5892
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5896
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5897
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5900
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 5902
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5903
    __ARG_1.'print'('    ')
.annotate 'line', 5904
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5905
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5906
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5907
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5908
    if_null $S1, __label_8
.annotate 'line', 5909
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5910
    __ARG_1.'say'()
# }
.annotate 'line', 5911

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 5871
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5873
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5922
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5923
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5924
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5925
    setattribute self, 'nskey', $P1
.annotate 'line', 5926
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5927
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5928
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5930
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5931

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5934
# reginit: $S1
    null $S1
.annotate 'line', 5935
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5937
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 5938
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5939
    le $I1, 0, __label_4
.annotate 'line', 5940
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 5941
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5942
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5943
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5944
    __ARG_1.'say'()
.annotate 'line', 5946
    lt $I1, 0, __label_5
# {
.annotate 'line', 5947
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5948
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5949
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 5951

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 5916
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5918
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5958
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5961
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 5965
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 5968
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 5963
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5964
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5963
    .return($P3)
  __label_4: # case
.annotate 'line', 5967
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 5971
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5972
    __ARG_1.'unget'($P2)
.annotate 'line', 5973
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 5975
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 5980
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 5982

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
.annotate 'line', 5993
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5994
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5995
    $P2 = WSubId_60(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5996

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5999
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6000
    .return(self)
# }
.annotate 'line', 6001

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6002
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6005
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6006
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6007
    eq $S1, 'P', __label_2
.annotate 'line', 6008
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6009
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6011
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
.annotate 'line', 6012
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6013
    self.'annotate'(__ARG_1)
.annotate 'line', 6014
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6015
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6016
    __ARG_1.'say'()
# }
.annotate 'line', 6017

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 5986
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5988
    addattribute $P0, 'lexpr'
.annotate 'line', 5989
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
.annotate 'line', 6034
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6035
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6036
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6037
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6038
    .return(self)
# }
.annotate 'line', 6039

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6042
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6043
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6045
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6047
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6049
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6050
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6051
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6053

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6056
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6057
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6058
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6060
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6061

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6064
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6065
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6066
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6067
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6068
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6069
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6070
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6072
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6073
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6074
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6075
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6076
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6077
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6079
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6080
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6081
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6082
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6085
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6087
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6088

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6022
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6028
    addattribute $P0, 'condition'
.annotate 'line', 6029
    addattribute $P0, 'etrue'
.annotate 'line', 6030
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
.annotate 'line', 6132
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
.annotate 'line', 6133
    .return(1)
  __label_4: # case
.annotate 'line', 6134
    .return(2)
  __label_5: # case
.annotate 'line', 6135
    .return(3)
  __label_2: # default
.annotate 'line', 6136
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6138

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_72')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6142
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
.annotate 'line', 6143
    .return(8)
  __label_4: # case
.annotate 'line', 6144
    .return(11)
  __label_5: # case
.annotate 'line', 6145
    .return(9)
  __label_6: # case
.annotate 'line', 6146
    .return(10)
  __label_2: # default
.annotate 'line', 6148
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6149
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6150
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6152

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6156
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
.annotate 'line', 6157
    .return(19)
  __label_4: # case
.annotate 'line', 6158
    .return(20)
  __label_5: # case
.annotate 'line', 6159
    .return(21)
  __label_6: # case
.annotate 'line', 6160
    .return(22)
  __label_2: # default
.annotate 'line', 6161
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6163

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6167
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6168
    .return(28)
  __label_4: # case
.annotate 'line', 6169
    .return(29)
  __label_2: # default
.annotate 'line', 6170
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6172

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6176
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
.annotate 'line', 6177
    .return(14)
  __label_4: # case
.annotate 'line', 6178
    .return(16)
  __label_5: # case
.annotate 'line', 6179
    .return(15)
  __label_6: # case
.annotate 'line', 6180
    .return(17)
  __label_2: # default
.annotate 'line', 6182
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6183
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6185

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6189
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
.annotate 'line', 6190
    .return(12)
  __label_4: # case
.annotate 'line', 6191
    .return(13)
  __label_5: # case
.annotate 'line', 6192
    .return(25)
  __label_6: # case
.annotate 'line', 6193
    .return(26)
  __label_2: # default
.annotate 'line', 6194
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6196

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_91')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6200
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
.annotate 'line', 6201
    .return(4)
  __label_4: # case
.annotate 'line', 6202
    .return(5)
  __label_5: # case
.annotate 'line', 6203
    .return(6)
  __label_6: # case
.annotate 'line', 6204
    .return(18)
  __label_7: # case
.annotate 'line', 6205
    .return(23)
  __label_8: # case
.annotate 'line', 6206
    .return(24)
  __label_9: # case
.annotate 'line', 6207
    .return(30)
  __label_2: # default
.annotate 'line', 6208
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6210

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
.annotate 'line', 6214
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6215
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6218
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6222
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6224
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6226
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6228
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6230
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6232
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6234
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6236
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6238
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6219
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 6220
    WSubId_54(')', __ARG_1)
.annotate 'line', 6221
    .return($P2)
  __label_4: # case
.annotate 'line', 6223
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6225
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6227
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6229
    new $P10, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P10.'IntegerLiteral'(__ARG_2, $P1)
    set $P9, $P10
    .return($P9)
  __label_8: # case
.annotate 'line', 6231
    new $P12, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P12.'FloatLiteral'(__ARG_2, $P1)
    set $P11, $P12
    .return($P11)
  __label_9: # case
.annotate 'line', 6233
    .tailcall WSubId_68(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6235
    new $P14, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P14.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6237
    new $P16, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P16.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P15, $P16
    .return($P15)
  __label_12: # case
.annotate 'line', 6239
    new $P18, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P18.'IdentifierExpr'(__ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_2: # default
.annotate 'line', 6241
    WSubId_40('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6243

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6247
# var subexp: $P1
    $P1 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6248
# var t: $P2
    null $P2
.annotate 'line', 6249
# var start: $P3
    null $P3
.annotate 'line', 6250
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6251
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_70($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6252
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6254
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6257
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6260
    set $P3, $P2
.annotate 'line', 6261
    $P2 = __ARG_1.'get'()
.annotate 'line', 6262
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6263
# var right: $P4
    $P4 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6264
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6267
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6270
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6273
    __ARG_1.'unget'($P2)
.annotate 'line', 6274
    .return($P1)
# }
.annotate 'line', 6275

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 6279
# var subexp: $P1
    $P1 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6280
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6282
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6284
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6283
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6285
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6287
    __ARG_1.'unget'($P2)
.annotate 'line', 6288
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6290

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
.annotate 'line', 6294
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6295
# code: $I1
    $P3 = WSubId_72($P1)
    set $I1, $P3
.annotate 'line', 6296
    eq $I1, 0, __label_1
# {
.annotate 'line', 6297
# var subexpr: $P2
    $P2 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6298
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
.annotate 'line', 6300
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6302
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6304
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6306
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6308
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6310
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6312
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6316
    __ARG_1.'unget'($P1)
.annotate 'line', 6317
    .tailcall WSubId_74(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6319

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6323
# var lexpr: $P1
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6324
# var t: $P2
    null $P2
.annotate 'line', 6325
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6326
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_75($P2)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
.annotate 'line', 6327
# var rexpr: $P3
    $P3 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6328
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
.annotate 'line', 6330
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6333
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6336
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6339
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6342
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6345
    __ARG_1.'unget'($P2)
.annotate 'line', 6346
    .return($P1)
# }
.annotate 'line', 6347

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 6351
# var lexpr: $P1
    $P1 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6352
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6353
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6354
# var rexpr: $P3
    $P3 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6355
# var expr: $P4
    null $P4
.annotate 'line', 6356
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6357
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6359
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6360
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6362
    __ARG_1.'unget'($P2)
.annotate 'line', 6363
    .return($P1)
# }
.annotate 'line', 6364

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6368
# var lexpr: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6369
# var rexpr: $P2
    null $P2
.annotate 'line', 6370
# var t: $P3
    null $P3
.annotate 'line', 6371
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6372
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_78($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6373
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6375
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6376
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6379
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6380
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6383
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6386
    __ARG_1.'unget'($P3)
.annotate 'line', 6387
    .return($P1)
# }
.annotate 'line', 6388

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6392
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6393
# var rexpr: $P2
    null $P2
.annotate 'line', 6394
# var t: $P3
    null $P3
.annotate 'line', 6395
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6396
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_80($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6397
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
.annotate 'line', 6399
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6400
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6403
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6404
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6407
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6408
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6411
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6412
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6415
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6418
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6421
    __ARG_1.'unget'($P3)
.annotate 'line', 6422
    .return($P1)
# }
.annotate 'line', 6423

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6427
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6428
# var rexpr: $P2
    null $P2
.annotate 'line', 6429
# var t: $P3
    null $P3
.annotate 'line', 6430
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6431
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6432
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
.annotate 'line', 6434
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6435
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6438
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6439
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6442
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6443
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6446
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6447
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6450
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6453
    __ARG_1.'unget'($P3)
.annotate 'line', 6454
    .return($P1)
# }
.annotate 'line', 6455

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
# Body
# {
.annotate 'line', 6459
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6460
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6461
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6462
# var rexpr: $P3
    $P3 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6463
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6465
    __ARG_1.'unget'($P2)
.annotate 'line', 6466
    .return($P1)
# }
.annotate 'line', 6467

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_84 = "WSubId_84"
# Body
# {
.annotate 'line', 6471
# var lexpr: $P1
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6472
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6473
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6474
# var rexpr: $P3
    $P3 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6475
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6477
    __ARG_1.'unget'($P2)
.annotate 'line', 6478
    .return($P1)
# }
.annotate 'line', 6479

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
# Body
# {
.annotate 'line', 6483
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6484
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6485
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6486
# var rexpr: $P3
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6487
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6489
    __ARG_1.'unget'($P2)
.annotate 'line', 6490
    .return($P1)
# }
.annotate 'line', 6491

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6495
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6496
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6497
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6498
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6499
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6501
    __ARG_1.'unget'($P2)
.annotate 'line', 6502
    .return($P1)
# }
.annotate 'line', 6503

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6507
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6508
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6509
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6510
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6511
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6513
    __ARG_1.'unget'($P2)
.annotate 'line', 6514
    .return($P1)
# }
.annotate 'line', 6515

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6519
# var econd: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6520
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6521
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6522
# var etrue: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6523
    WSubId_54(':', __ARG_1)
.annotate 'line', 6524
# var efalse: $P4
    $P4 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6525
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6528
    __ARG_1.'unget'($P2)
.annotate 'line', 6529
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6531

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
.annotate 'line', 6535
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6536
# var t: $P2
    null $P2
.annotate 'line', 6537
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6538
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_91($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
.annotate 'line', 6539
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6540
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6541
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
.annotate 'line', 6543
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6546
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6549
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6552
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6555
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6558
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6561
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6564
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6566
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6567
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

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6575
    .tailcall WSubId_89(__ARG_1, __ARG_2)
# }
.annotate 'line', 6576

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6591
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6592
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6593
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6594
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6595
    .return($S1)
# }
.annotate 'line', 6596

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6599
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6600
    unless_null $P1, __label_1
.annotate 'line', 6601
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6602
    .return($P1)
# }
.annotate 'line', 6603

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6587
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6612
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6613
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6614
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6615
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6616
    .return($S1)
# }
.annotate 'line', 6617

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6620
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6621
    unless_null $P1, __label_1
.annotate 'line', 6622
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6623
    .return($P1)
# }
.annotate 'line', 6624

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6606
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6608
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6640
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6641
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6642
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6643
    __ARG_2.'unget'($P1)
.annotate 'line', 6644
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6646

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6649
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6650
    if_null $P1, __label_1
.annotate 'line', 6651
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6652
    .return(self)
# }
.annotate 'line', 6653

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6657
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6658
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6661
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6662
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6663
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6664
    self.'annotate'(__ARG_1)
.annotate 'line', 6665
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6669
    le $I1, 0, __label_6
.annotate 'line', 6670
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6672
    self.'annotate'(__ARG_1)
.annotate 'line', 6673
    self.'emitret'(__ARG_1)
.annotate 'line', 6674
    le $I1, 0, __label_7
.annotate 'line', 6675
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6676
    __ARG_1.'say'(')')
# }
.annotate 'line', 6677

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 6634
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6636
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6684
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6685

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6688
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6689

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 6680
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
.annotate 'line', 6696
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6697

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6700
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6701

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 6692
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6714
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6715
    setattribute self, 'name', __ARG_1
.annotate 'line', 6716
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6717

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6718
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6721
    self.'annotate'(__ARG_1)
.annotate 'line', 6722
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6723

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 6708
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6710
    addattribute $P0, 'name'
.annotate 'line', 6711
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6737
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6738
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6739

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6740
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6743
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6744
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6745
    .return($S2)
# }
.annotate 'line', 6746

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 6732
    addattribute $P0, 'owner'
.annotate 'line', 6733
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
.annotate 'line', 6759
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6760
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6761
    WSubId_92($P1)
.annotate 'line', 6762
    setattribute self, 'label', $P1
.annotate 'line', 6763
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6764

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6765
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6768
    self.'annotate'(__ARG_1)
.annotate 'line', 6769
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6770
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6771
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6772

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 6753
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6755
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6783
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6784

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6787
    WSubId_54('(', __ARG_1)
.annotate 'line', 6788
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6789
    WSubId_54(')', __ARG_1)
# }
.annotate 'line', 6790

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 6779
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
.annotate 'line', 6803
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6804
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6805
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6806
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6807
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6808
    $P4 = WSubId_93(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6810
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6811
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6813

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6816
    self.'optimize_condition'()
.annotate 'line', 6817
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6818
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6819
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6821
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6823
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6825
    .return(self)
# }
.annotate 'line', 6826

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6829
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6830
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6831
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6832
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6833
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6834
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6835
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6836
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6837
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6838
    self.'annotate'(__ARG_1)
.annotate 'line', 6839
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6840
    $P1.'emit'(__ARG_1)
.annotate 'line', 6842
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6843
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6844
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6845
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6847
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6848

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 6797
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6799
    addattribute $P0, 'truebranch'
.annotate 'line', 6800
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 6860
    $P2 = WSubId_93(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6861

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6864
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6865
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6867
    self.'annotate'(__ARG_1)
.annotate 'line', 6868
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6869
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6870
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6871
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6872

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 6855
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6857
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6883
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6884
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6885
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6886

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6889
    self.'optimize_condition'()
.annotate 'line', 6890
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6891
    .return(self)
# }
.annotate 'line', 6892

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6895
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6897
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6900
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6903
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6904
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6906
    self.'annotate'(__ARG_1)
.annotate 'line', 6907
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6908
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6909
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6910
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6911
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6913

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 6879
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
.annotate 'line', 6924
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6925
    self.'parsebody'(__ARG_2)
.annotate 'line', 6926
    WSubId_94('while', __ARG_2)
.annotate 'line', 6927
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6928

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6931
    self.'optimize_condition'()
.annotate 'line', 6932
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6933
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6934
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 6935
    setattribute self, 'body', $P1
.annotate 'line', 6936
    .return(self)
# }
.annotate 'line', 6937

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6940
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6941
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6942
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 6944
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6947
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6948
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6949
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 6951
    self.'annotate'(__ARG_1)
.annotate 'line', 6952
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6954
    $P1.'emit'(__ARG_1)
.annotate 'line', 6955
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6956
    eq $I1, 2, __label_7
.annotate 'line', 6957
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 6958
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 6960

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 6920
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
.annotate 'line', 6971
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6972
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6973

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6974
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6977
    self.'annotate'(__ARG_1)
.annotate 'line', 6978
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6979
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6980

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 6967
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
.annotate 'line', 6991
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6992
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6993

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6994
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6997
    self.'annotate'(__ARG_1)
.annotate 'line', 6998
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6999
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7000

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 6987
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7015
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7016
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7017
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7018
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7019

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 7022
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7023
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7024
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7025
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_37(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7026
    $P1 = __ARG_1.'get'()
.annotate 'line', 7027
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7028
    WSubId_40("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7029
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7030
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
.annotate 'line', 7031
    __ARG_1.'unget'($P1)
.annotate 'line', 7032
    $P3 = WSubId_93(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7034
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7035
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7038
    $P1 = __ARG_1.'get'()
.annotate 'line', 7039
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7040
    WSubId_40("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7041
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
.annotate 'line', 7042
    __ARG_1.'unget'($P1)
.annotate 'line', 7043
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_93(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7045
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7048
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7049
    WSubId_40("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7050

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7053
    getattribute $P2, self, 'case_value'
    WSubId_38($P2)
.annotate 'line', 7054
    getattribute $P2, self, 'case_st'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7055
    WSubId_38($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7056
    getattribute $P2, self, 'default_st'
    WSubId_38($P2)
# }
.annotate 'line', 7057

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7007
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7009
    addattribute $P0, 'case_value'
.annotate 'line', 7010
    addattribute $P0, 'case_st'
.annotate 'line', 7011
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
.annotate 'line', 7070
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7071
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7072
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7073
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7074
    WSubId_40("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7075
    $P1 = __ARG_2.'get'()
.annotate 'line', 7076
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7077
    WSubId_40("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7078
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7079

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7082
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7083
    self.'optimize_cases'()
.annotate 'line', 7084
    .return(self)
# }
.annotate 'line', 7085

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7089
# type: $S1
    set $S1, ''
.annotate 'line', 7090
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7091
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7092
    ne $S2, 'N', __label_4
.annotate 'line', 7093
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7094
    ne $S1, '', __label_5
.annotate 'line', 7095
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7096
    eq $S1, $S2, __label_7
.annotate 'line', 7097
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7100
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7101
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7105
    ne $S1, '', __label_8
.annotate 'line', 7106
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7108
    __ARG_1.'comment'('switch')
.annotate 'line', 7109
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7110
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7111
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7113
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7114
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7118
    self.'genbreaklabel'()
.annotate 'line', 7119
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7120
    new $P4, ['ResizableStringArray']
.annotate 'line', 7121
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7122
    getattribute $P7, self, 'case_value'
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7123
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7124
# predefined push
    push $P4, $S7
.annotate 'line', 7125
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7126
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7128
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7131
    self.'annotate'(__ARG_1)
.annotate 'line', 7132
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7133
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7134
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7135
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7136
    $P7 = $P6[$I2]
    WSubId_52(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7134
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7139
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7140
    getattribute $P7, self, 'default_st'
    WSubId_52(__ARG_1, $P7)
.annotate 'line', 7142
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7143

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7064
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7066
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7155
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7156
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7157

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7160
    self.'optimize_cases'()
.annotate 'line', 7161
    .return(self)
# }
.annotate 'line', 7162

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7166
    self.'genbreaklabel'()
.annotate 'line', 7167
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7168
    new $P1, ['ResizableStringArray']
.annotate 'line', 7170
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7171
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7172
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7173
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7174
# predefined push
    push $P1, $S3
.annotate 'line', 7175
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7176
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7178
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7181
    self.'annotate'(__ARG_1)
.annotate 'line', 7182
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7183
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7184
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7185
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7186
    $P4 = $P3[$I2]
    WSubId_52(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7184
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7189
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7190
    getattribute $P4, self, 'default_st'
    WSubId_52(__ARG_1, $P4)
.annotate 'line', 7192
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7193

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7150
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
.annotate 'line', 7200
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7201
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7202
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7203
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7204
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7205
    WSubId_40("'(' in switch", $P1)
# }
.annotate 'line', 7206

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
.annotate 'line', 7219
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7220
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7221
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7222
    __ARG_2.'unget'($P1)
.annotate 'line', 7223
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7225
    $P1 = __ARG_2.'get'()
.annotate 'line', 7226
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7227
    __ARG_2.'unget'($P1)
.annotate 'line', 7228
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7229
    WSubId_54(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7231
    $P1 = __ARG_2.'get'()
.annotate 'line', 7232
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7233
    __ARG_2.'unget'($P1)
.annotate 'line', 7234
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7235
    WSubId_54(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7237
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7238

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7241
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7242
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7243
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7244
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7245
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7246
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7247
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7248
    .return(self)
# }
.annotate 'line', 7249

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7252
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7253
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7254
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7255
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7256
    .return()
# }
  __label_1: # endif
.annotate 'line', 7258
    __ARG_1.'comment'('for loop')
.annotate 'line', 7259
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7260
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7261
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7262
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7263
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7265
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7266
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7267
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7269
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7270
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7271
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7272
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7273
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7275
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7276

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7212
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7214
    addattribute $P0, 'initializer'
.annotate 'line', 7215
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
.annotate 'line', 7291
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7292
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7293
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7294
# deftype: $S2
    $P1 = WSubId_95(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7295
    self.'createvar'($S1, $S2)
.annotate 'line', 7296
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7298
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7299
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7300
    WSubId_54(')', __ARG_2)
.annotate 'line', 7301
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7302

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7305
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7306
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7307
    .return(self)
# }
.annotate 'line', 7308

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7311
    self.'annotate'(__ARG_1)
.annotate 'line', 7312
# regcont: $S1
    null $S1
.annotate 'line', 7313
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7314
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7315
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7316
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7319
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7321
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7322
    unless_null $P1, __label_4
.annotate 'line', 7323
    getattribute $P2, self, 'varname'
    WSubId_59($P2)
  __label_4: # endif
.annotate 'line', 7325
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7326
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7327
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7328
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7329
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7330
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7331
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7332
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7333
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7334
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7335
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7336

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7283
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7285
    addattribute $P0, 'deftype'
.annotate 'line', 7286
    addattribute $P0, 'varname'
.annotate 'line', 7287
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
.annotate 'line', 7343
    WSubId_54('(', __ARG_2)
.annotate 'line', 7344
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7345
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7346
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7347
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7349
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7350
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7351
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7352
    __ARG_2.'unget'($P3)
.annotate 'line', 7353
    __ARG_2.'unget'($P2)
.annotate 'line', 7354
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7356
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7357

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7369
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7370
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7371

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7374
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7375
    .return(self)
# }
.annotate 'line', 7376

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7379
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7380
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7381
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7382
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7384
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7387
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7390
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7392

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7363
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7365
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7404
    setattribute self, 'start', __ARG_1
.annotate 'line', 7405
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7406

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7409
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7410
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7411
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7412
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7413
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
.annotate 'line', 7416
    eq $I1, 1, __label_10
.annotate 'line', 7417
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7418
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7419
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7420
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7424
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7425
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7426
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7427
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7425
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7430
# predefined join
.annotate 'line', 7429
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7433
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7436

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7399
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7401
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
.annotate 'line', 7448
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7449
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7450
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7451
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7453
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7455
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7456
    $P1 = __ARG_2.'get'()
.annotate 'line', 7457
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7458
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7459
    $P1 = __ARG_2.'get'()
.annotate 'line', 7460
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7461
    WSubId_40("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7462
    $P1 = __ARG_2.'get'()
.annotate 'line', 7463
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7464
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7465
    setattribute self, 'exname', $P1
.annotate 'line', 7466
    self.'createvar'($S1, 'P')
.annotate 'line', 7467
    $P1 = __ARG_2.'get'()
.annotate 'line', 7468
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7469
    WSubId_40("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7471
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7472

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7475
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7476
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7477
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7478
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7479
    .return(self)
# }
.annotate 'line', 7480

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7483
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7484
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7485
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7486
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7487
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7488
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7490
    self.'annotate'(__ARG_1)
.annotate 'line', 7491
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7493
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7494
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7496
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7497
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7499
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7500
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7501
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7502
    __ARG_1.'comment'('try: end')
.annotate 'line', 7503
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7505
    self.'annotate'(__ARG_1)
.annotate 'line', 7506
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7508
    __ARG_1.'comment'('catch')
.annotate 'line', 7509
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7510
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7511
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7512
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7513
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7515
    __ARG_1.'comment'('catch end')
.annotate 'line', 7516
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7517

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7439
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7441
    addattribute $P0, 'stry'
.annotate 'line', 7442
    addattribute $P0, 'modifiers'
.annotate 'line', 7443
    addattribute $P0, 'exname'
.annotate 'line', 7444
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
.annotate 'line', 7530
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7531
    setattribute self, 'name', __ARG_3
.annotate 'line', 7532
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7533
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7534

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7524
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7526
    addattribute $P0, 'name'
.annotate 'line', 7527
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
.annotate 'line', 7549
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7550
    setattribute self, 'name', __ARG_3
.annotate 'line', 7551
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7552

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7541
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7543
    addattribute $P0, 'name'
.annotate 'line', 7544
    addattribute $P0, 'basetype'
.annotate 'line', 7545
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
.annotate 'line', 7563
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7564
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7565
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7566
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7567
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7569
    $P5 = WSubId_37(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7572
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7573

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7576
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7577
    if_null $P1, __label_1
.annotate 'line', 7578
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7579
    .return(self)
# }
.annotate 'line', 7580

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7583
    self.'annotate'(__ARG_1)
.annotate 'line', 7584
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7585
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7586
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7587
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7588
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7590
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7591
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7593
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7594
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7595
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7596
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7598
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7601
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7603
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7606
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7607
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.annotate 'line', 7609
    WSubId_1('Invalid initialization from void value', self)
  __label_18: # case
.annotate 'line', 7611
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7614
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7615
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7617
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7618
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7619
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7620
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7621
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7622
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7625
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7629

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7557
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7559
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
.annotate 'line', 7644
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7645
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7646
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7647
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7648
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7649
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7651
    __ARG_6.'unget'($P2)
.annotate 'line', 7652
    $P4 = WSubId_37(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7653
    WSubId_54(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7655
    $P2 = __ARG_6.'get'()
.annotate 'line', 7656
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7657
    $P2 = __ARG_6.'get'()
.annotate 'line', 7658
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7659
    WSubId_40("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7660
    $P2 = __ARG_6.'get'()
.annotate 'line', 7661
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7662
    __ARG_6.'unget'($P2)
.annotate 'line', 7663
    $P4 = WSubId_36(__ARG_6, self, WSubId_37, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7667
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7668

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7671
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7672
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 7673
    getattribute $P1, self, 'initarray'
    WSubId_38($P1)
.annotate 'line', 7674
    .return(self)
# }
.annotate 'line', 7675

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7678
    self.'annotate'(__ARG_1)
.annotate 'line', 7680
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7681
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7682
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7683
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7684
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7685
    if_null $P2, __label_1
# {
.annotate 'line', 7687
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7688
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7692
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7694
    if_null $P3, __label_4
# {
.annotate 'line', 7695
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7696
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7697
    unless_null $P2, __label_6
# {
.annotate 'line', 7698
    le $I1, 0, __label_7
# {
.annotate 'line', 7700
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7703
# i: $I2
    null $I2
.annotate 'line', 7704
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7705
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7706
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7707
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7710

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 7634
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7636
    addattribute $P0, 'size'
.annotate 'line', 7637
    addattribute $P0, 'initarray'
.annotate 'line', 7638
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
.annotate 'line', 7717
# var next: $P1
    null $P1
.annotate 'line', 7718
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7719
# {
.annotate 'line', 7720
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7721
    WSubId_92($P3)
.annotate 'line', 7722
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7723
# var item: $P5
    null $P5
.annotate 'line', 7724
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 7725
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7727
    __ARG_4.'unget'($P4)
.annotate 'line', 7728
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7730
    $P2 = WSubId_96($P2, $P5)
.annotate 'line', 7731
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7732
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 7733
    WSubId_4(';', $P1)
.annotate 'line', 7734
    .return($P2)
# }
.annotate 'line', 7735

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7743
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7744

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 7739
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
.annotate 'line', 7751
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7752

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 7747
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
.annotate 'line', 7758
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7759

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7763
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7764

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
.annotate 'line', 7768
    .tailcall WSubId_97(WSubId_98, WSubId_99, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7769

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7777
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7778

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 7773
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
.annotate 'line', 7785
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7786

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 7781
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
.annotate 'line', 7792
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7793

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7797
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7798

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
.annotate 'line', 7802
    .tailcall WSubId_97(WSubId_100, WSubId_101, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7803

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7811
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7812

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 7807
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
.annotate 'line', 7819
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7820

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 7815
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
.annotate 'line', 7826
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7827

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7831
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7832

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
.annotate 'line', 7836
    .tailcall WSubId_97(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7837

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
.annotate 'line', 7853
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7854
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7855
    setattribute self, 'name', __ARG_4
.annotate 'line', 7856
    setattribute self, 'value', __ARG_5
.annotate 'line', 7857
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7858

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7861
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7862
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7863
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7864
    $P1 = $P1.'optimize'()
.annotate 'line', 7865
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 7866
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 7869
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7870
    .return(self)
# }
.annotate 'line', 7871

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7874
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 7875

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7878
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7879

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 7843
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7845
    addattribute $P0, 'type'
.annotate 'line', 7846
    addattribute $P0, 'name'
.annotate 'line', 7847
    addattribute $P0, 'data'
.annotate 'line', 7848
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
.annotate 'line', 7884
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7885
# type: $S1
    $P5 = WSubId_95($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7886
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7887
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7889
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7890
# {
.annotate 'line', 7891
    $P1 = __ARG_2.'get'()
.annotate 'line', 7892
# var name: $P3
    set $P3, $P1
.annotate 'line', 7893
    WSubId_54('=', __ARG_2)
.annotate 'line', 7894
# var value: $P4
    $P4 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 7896
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7895
    $P2 = WSubId_96($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7897
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7898
    .return($P2)
# }
.annotate 'line', 7899

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
.annotate 'line', 7910
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7911
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7912
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7913
    $P4 = WSubId_37(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7914
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 7916
    WSubId_4(';', $P1)
# }
.annotate 'line', 7917

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7920
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7921
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7922
    .return(self)
# }
.annotate 'line', 7923

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7926
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7927

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7930
    self.'annotate'(__ARG_1)
.annotate 'line', 7931
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7932
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7933
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7934
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7935
    if_null $P1, __label_3
.annotate 'line', 7936
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 7937
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 7938
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 7939
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
.annotate 'line', 7941
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7942
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7944
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7949
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 7950
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7953
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 7955
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 7959
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 7960

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 7905
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7907
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
.annotate 'line', 7967
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7968
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7969

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7972
    self.'annotate'(__ARG_1)
.annotate 'line', 7973
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7974
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 7975
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7976

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 7963
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
.annotate 'line', 7985
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7986
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7987
    WSubId_54(']', __ARG_2)
.annotate 'line', 7988
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7989

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7992
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7993
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7994

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7997
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7998
    self.'annotate'(__ARG_1)
.annotate 'line', 7999
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8000
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8001
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8002

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 7979
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7981
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
.annotate 'line', 8007
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8008
    WSubId_92($P1)
.annotate 'line', 8009
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8010
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8011
    $P2 = __ARG_2.'get'()
.annotate 'line', 8012
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8013
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8015
    __ARG_2.'unget'($P2)
.annotate 'line', 8016
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
.annotate 'line', 8020
    __ARG_2.'unget'($P2)
.annotate 'line', 8021
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8023

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 8027
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8028
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8029
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8030
    .tailcall WSubId_46(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8031

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
.annotate 'line', 8044
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8045
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8046
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8047
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8048
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8049
    __ARG_2.'unget'($P1)
.annotate 'line', 8050
# var c: $P2
    $P2 = WSubId_93(__ARG_2, self)
.annotate 'line', 8051
    unless_null $P2, __label_3
.annotate 'line', 8052
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8053
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8055
    setattribute self, 'end', $P1
# }
.annotate 'line', 8056

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8059
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8060
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8061
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8062
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8063
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8064
    .return($S2)
# }
.annotate 'line', 8065

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8068
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8069
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8070
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8071
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8072
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8073
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8074
    $P1[$S1] = $S3
.annotate 'line', 8075
    .return($S3)
# }
.annotate 'line', 8076

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8077
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8080
    __ARG_1.'comment'('{')
.annotate 'line', 8081
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8082
    $P1.'emit'(__ARG_1)
.annotate 'line', 8083
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8085
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8086

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8037
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8039
    addattribute $P0, 'end'
.annotate 'line', 8040
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8101
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8103
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8104
    new $P1, ['ResizableStringArray']
.annotate 'line', 8105
    new $P2, ['ResizableStringArray']
.annotate 'line', 8106
    setattribute self, 'tempreg', $P1
.annotate 'line', 8107
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8108

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8111
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8112
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8113
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8114
    assign $P1, $I1
# predefined string
.annotate 'line', 8115
    getattribute $P2, self, 'type'
.annotate 'line', 8110
    set $S2, $P2
.annotate 'line', 8115
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8116

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8119
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8120
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8121
# reg: $S1
    null $S1
.annotate 'line', 8122
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8123
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8125
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8126
# predefined push
    push $P2, $S1
.annotate 'line', 8127
    .return($S1)
# }
.annotate 'line', 8128

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8131
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8132
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8133
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8134
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8135
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8136
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8134
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8138
    assign $P2, 0
# }
.annotate 'line', 8139

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8095
    addattribute $P0, 'type'
.annotate 'line', 8096
    addattribute $P0, 'nreg'
.annotate 'line', 8097
    addattribute $P0, 'tempreg'
.annotate 'line', 8098
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8150
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8151

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8154
# var named: $P1
    null $P1
.annotate 'line', 8155
# var slurpy: $P2
    null $P2
.annotate 'line', 8156
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8157
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8158
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8159
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8161
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8164
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8167
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8171
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8178
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8195
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8176
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8179
# setname: $S2
    null $S2
# switch
.annotate 'line', 8180
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8182
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8185
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8186
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8187
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8188
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8191
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8193
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8196
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8197
# }
.annotate 'line', 8199

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8146
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
.annotate 'line', 8209
    setattribute self, 'func', __ARG_1
.annotate 'line', 8210
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8211
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_95($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8212
    eq $S1, '', __label_2
.annotate 'line', 8213
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8215
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8216
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8217
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8219
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8220
    $P1 = __ARG_2.'get'()
.annotate 'line', 8221
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8222
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8224
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8225

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_104 = "WSubId_104"
# Body
# {
.annotate 'line', 8228
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8229
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8230
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8231
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_104($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8232
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8233
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8234
    if_null $P3, __label_3
.annotate 'line', 8235
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8236
    __ARG_1.'say'('')
# }
.annotate 'line', 8237

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8204
    addattribute $P0, 'func'
.annotate 'line', 8205
    addattribute $P0, 'name'
.annotate 'line', 8206
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8242
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8243

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8254
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8255
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8256

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8259
# var ns: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 8260
# key: $S1
    $P3 = $P1.'getpath'()
    $P2 = WSubId_58($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8261
# reg: $S2
    $P2 = __ARG_2.'tempreg'('P')
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8262
    getattribute $P2, self, 'name'
    __ARG_1.'emitget_hll_global'($S2, $S1, $P2)
.annotate 'line', 8263
    .return($S2)
# }
.annotate 'line', 8264

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8249
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8251
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8275
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8276

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8279
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8280
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8281
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8282
    le $I1, 0, __label_3
# {
.annotate 'line', 8283
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8284
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8285
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8286
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8287
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8288
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8284
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8290
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8293

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8271
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8316
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8317
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8318
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8319
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8320
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8321
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8322

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8324
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8328
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8329
    unless_null $P1, __label_1
.annotate 'line', 8330
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8331
    .return($P1)
# }
.annotate 'line', 8332

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8335
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8336
    unless_null $P1, __label_1
.annotate 'line', 8337
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8338
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8339

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8343
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8344
    .return($I1)
# }
.annotate 'line', 8345

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8348
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8349
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8350
    __ARG_1.'unget'($P1)
.annotate 'line', 8351
    $P3 = WSubId_36(__ARG_1, self, WSubId_105, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8353

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8357
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8358
    unless_null $P1, __label_1
.annotate 'line', 8359
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8361
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8362

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8365
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8366
    unless_null $P1, __label_1
# {
.annotate 'line', 8368
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8371
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8372
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8373
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8374
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8376

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8379
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8380
    if_null $P1, __label_1
# {
.annotate 'line', 8381
# var found: $P2
    null $P2
.annotate 'line', 8382
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 8383
    $P2 = $P3.'findsymbol'(__ARG_1)
.annotate 'line', 8384
    if_null $P2, __label_4
.annotate 'line', 8385
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8388
    getattribute $P5, self, 'owner'
    .tailcall $P5.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8389

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8393
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8394
    if_null $P1, __label_1
# {
.annotate 'line', 8395
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 8396
    $P2.'fixnamespaces'()
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8398
    getattribute $P6, self, 'body'
    $P5 = $P6.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 8399
    .return(self)
# }
.annotate 'line', 8400

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8404
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8405
    unless_null $P1, __label_1
.annotate 'line', 8406
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8407
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8408

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8411
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8412
    unless_null $P1, __label_1
.annotate 'line', 8413
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8414
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8415

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8420
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8421
# lexname: $S1
    null $S1
.annotate 'line', 8422
    if_null $P1, __label_1
.annotate 'line', 8423
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8425
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8426
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8427
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8428
    self.'setlex'($S1, $S2)
.annotate 'line', 8429
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8431
    .return($S1)
# }
.annotate 'line', 8432

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8436
# var store: $P1
    null $P1
# switch
.annotate 'line', 8437
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
.annotate 'line', 8439
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8441
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8443
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8445
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8447
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8449
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8450
    .return($S1)
# }
.annotate 'line', 8451

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8454
# var store: $P1
    null $P1
# switch
.annotate 'line', 8455
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
.annotate 'line', 8457
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8459
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8461
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8463
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8465
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8467
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8468
    .return($S1)
# }
.annotate 'line', 8469

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8472
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
.annotate 'line', 8473
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8474

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8477
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8476
    set $S1, $I1
.annotate 'line', 8478
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8479

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8482
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8483

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8486
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8487

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 8491
# name: $S1
    getattribute $P10, self, 'name'
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 8492
    __ARG_1.'say'()
.annotate 'line', 8493
    __ARG_1.'print'(".sub ")
.annotate 'line', 8494
    $P10 = self.'isanonymous'()
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 8495
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8497
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8498
    getattribute $P10, self, 'subid'
    if_null $P10, __label_4
.annotate 'line', 8499
    getattribute $P11, self, 'subid'
    __ARG_1.'print'(" :subid('", $P11, "')")
  __label_4: # endif
.annotate 'line', 8500
    getattribute $P10, self, 'outer'
    if_null $P10, __label_5
# {
.annotate 'line', 8501
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8502
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8503
    if_null $P2, __label_6
.annotate 'line', 8504
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8508
    $P10 = self.'ismethod'()
    if_null $P10, __label_7
    unless $P10 goto __label_7
.annotate 'line', 8509
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8510
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8511
    if_null $P3, __label_8
.annotate 'line', 8512
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8514
    ne $S1, 'main', __label_10
.annotate 'line', 8515
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8517
    __ARG_1.'say'()
.annotate 'line', 8520
    getattribute $P10, self, 'params'
    WSubId_52(__ARG_1, $P10)
.annotate 'line', 8522
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8523
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8524
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8525
    getattribute $P10, self, 'start'
    __ARG_1.'annotate'($P10)
.annotate 'line', 8527
    if_null $P4, __label_13
# {
.annotate 'line', 8528
    iter $P12, $P4
    set $P12, 0
  __label_14: # for iteration
    unless $P12 goto __label_15
    shift $S2, $P12
.annotate 'line', 8529
    $P10 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P10, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8532
    if_null $P5, __label_16
# {
.annotate 'line', 8533
    iter $P13, $P5
    set $P13, 0
  __label_17: # for iteration
    unless $P13 goto __label_18
    shift $S3, $P13
# {
.annotate 'line', 8534
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_19
.annotate 'line', 8535
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_19: # endif
.annotate 'line', 8536
    $P10 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P10)
# }
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8541
# var usedsubids: $P6
    getattribute $P6, self, 'usedsubids'
.annotate 'line', 8542
    if_null $P6, __label_20
# {
.annotate 'line', 8543
    iter $P14, $P6
    set $P14, 0
  __label_21: # for iteration
    unless $P14 goto __label_22
    shift $S4, $P14
# {
.annotate 'line', 8545
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_21
  __label_22: # endfor
# }
  __label_20: # endif
.annotate 'line', 8549
# var body: $P7
    getattribute $P7, self, 'body'
.annotate 'line', 8550
    $P10 = $P7.'isempty'()
    if_null $P10, __label_23
    unless $P10 goto __label_23
.annotate 'line', 8551
    __ARG_1.'comment'('Empty body')
    goto __label_24
  __label_23: # else
# {
.annotate 'line', 8553
    __ARG_1.'comment'('Body')
.annotate 'line', 8554
    $P7.'emit'(__ARG_1)
.annotate 'line', 8555
    $P10 = $P7.'getend'()
    __ARG_1.'annotate'($P10)
# }
  __label_24: # endif
.annotate 'line', 8557
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8560
# var localfun: $P8
    getattribute $P8, self, 'localfun'
.annotate 'line', 8561
    if_null $P8, __label_25
# {
.annotate 'line', 8562
    iter $P15, $P8
    set $P15, 0
  __label_26: # for iteration
    unless $P15 goto __label_27
    shift $P9, $P15
.annotate 'line', 8563
    $P9.'emit'(__ARG_1)
    goto __label_26
  __label_27: # endfor
# }
  __label_25: # endif
# }
.annotate 'line', 8565

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8296
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8298
    addattribute $P0, 'name'
.annotate 'line', 8299
    addattribute $P0, 'subid'
.annotate 'line', 8300
    addattribute $P0, 'modifiers'
.annotate 'line', 8301
    addattribute $P0, 'params'
.annotate 'line', 8302
    addattribute $P0, 'body'
.annotate 'line', 8303
    addattribute $P0, 'regstI'
.annotate 'line', 8304
    addattribute $P0, 'regstN'
.annotate 'line', 8305
    addattribute $P0, 'regstS'
.annotate 'line', 8306
    addattribute $P0, 'regstP'
.annotate 'line', 8307
    addattribute $P0, 'nlabel'
.annotate 'line', 8308
    addattribute $P0, 'localfun'
.annotate 'line', 8309
    addattribute $P0, 'lexicals'
.annotate 'line', 8310
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8311
    addattribute $P0, 'usedsubids'
.annotate 'line', 8312
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8579
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8580
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8581
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8582
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8583

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8585
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8589
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8587
    set $I1, $P1
.annotate 'line', 8589
    .return($I1)
# }
.annotate 'line', 8590

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8594
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8592
    set $I1, $P1
.annotate 'line', 8594
    .return($I1)
# }
.annotate 'line', 8595

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8596
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 8600
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8601
    setattribute self, 'name', $P1
.annotate 'line', 8602
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8603
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 8604
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P9, self, 'owner'
    $P8.'FunctionModifierList'(__ARG_1, $P9)
    set $P7, $P8
    setattribute self, 'modifiers', $P7
.annotate 'line', 8605
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8607
    WSubId_4('(', $P2)
.annotate 'line', 8608
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8610
# var fullname: $P3
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P3, $P5
.annotate 'line', 8611
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P3, $P5
.annotate 'line', 8612
# var cfunction: $P4
    $P4 = self.'createconst'('__FUNCTION__', 'S')
.annotate 'line', 8613
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 8614
    new $P8, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P10, $P1, 'line'
.annotate 'line', 8615
# predefined join
.annotate 'line', 8613
    join $S1, '.', $P3
    $P8.'TokenQuoted'($P9, $P10, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
    $P4.'setvalue'($P5)
.annotate 'line', 8617
    $P2 = __ARG_1.'get'()
.annotate 'line', 8618
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_2
.annotate 'line', 8619
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 8620
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8621
    .return(self)
# }
.annotate 'line', 8622

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8572
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8574
    addattribute $P0, 'paramnum'
.annotate 'line', 8575
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
.annotate 'line', 8633
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8634
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8635
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8636
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8637
    setattribute self, 'name', $P1
.annotate 'line', 8638
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8639
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8640
    WSubId_4('{', $P2)
.annotate 'line', 8641
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8642
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8643

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8644
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8645
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8648
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8649

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8653
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8654

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8658
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8659

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8662
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 8663
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 8664
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 8666
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 8667
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 8668
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 8669
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 8670
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 8671
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 8672
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 8673
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 8674
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8675
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 8676
    eq $S3, 'P', __label_8
.annotate 'line', 8677
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 8678
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 8679
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 8680
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 8681
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 8684
    .return(__ARG_2)
# }
.annotate 'line', 8685

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8688
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8689
    unless_null $P1, __label_1
.annotate 'line', 8690
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8691
    unless_null $P1, __label_2
# {
.annotate 'line', 8694
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 8695
    unless_null $P1, __label_3
# {
.annotate 'line', 8697
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 8698
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8699
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 8700
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 8701
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8702
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 8703
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8707
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8709
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 8710
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 8711
    .return($P1)
# }
.annotate 'line', 8712

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 8629
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
.annotate 'line', 8723
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8724

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8725
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 8719
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
.annotate 'line', 8739
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8740
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8741
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 8742
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8743
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8744
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_95($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8745
    set $P1, $P2
.annotate 'line', 8746
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8747
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8749
    setattribute self, 'name', $P1
.annotate 'line', 8750
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8751
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8752
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8753
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 8755
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8756

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8759
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8760
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8761
    if_null $P1, __label_1
# {
.annotate 'line', 8762
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8763
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8765

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 8734
    addattribute $P0, 'name'
.annotate 'line', 8735
    addattribute $P0, 'modifiers'
.annotate 'line', 8736
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8770
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8771

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 8778
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_106, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 8779

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8782
    __ARG_1.'print'('(')
.annotate 'line', 8783
# sep: $S1
    set $S1, ''
.annotate 'line', 8784
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8785
    __ARG_1.'print'($S1)
.annotate 'line', 8786
    $P1.'emit'(__ARG_1)
.annotate 'line', 8787
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8789
    __ARG_1.'print'(')')
# }
.annotate 'line', 8790

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 8775
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
.annotate 'line', 8799
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8800
    setattribute self, 'params', __ARG_3
.annotate 'line', 8801
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 8802

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8805
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8806
    .return(self)
# }
.annotate 'line', 8807

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8810
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8811
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 8812
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 8813
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8814
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8815
    __ARG_1.'print'('    ')
.annotate 'line', 8816
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8817
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8818
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8819
    __ARG_1.'say'()
# }
.annotate 'line', 8820

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 8793
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8795
    addattribute $P0, 'params'
.annotate 'line', 8796
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
.annotate 'line', 8837
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8838

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8839
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8843
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8844

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 8833
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8852
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8853
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8854

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8855
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8859
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8860
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8861

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 8847
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8849
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
.annotate 'line', 8870
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8871
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8872
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8873
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8874
    WSubId_40('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8875
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8876
    $P2 = __ARG_1.'get'()
.annotate 'line', 8877
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8878
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8880
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8884
    WSubId_41('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8886
# {
.annotate 'line', 8887
    $P2 = __ARG_1.'get'()
.annotate 'line', 8888
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 8889
    WSubId_40('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8890
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8891
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 8892
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8894
    setattribute self, 'key', $P1
# }
.annotate 'line', 8895

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8896
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8899
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8900

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8904
    getattribute $P2, self, 'key'
    $P1 = WSubId_58($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8905

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 8864
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8866
    addattribute $P0, 'key'
.annotate 'line', 8867
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8913
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8914
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8915
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 8916
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8917
    $P2 = __ARG_1.'get'()
.annotate 'line', 8918
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8920
    __ARG_1.'unget'($P2)
.annotate 'line', 8921
    setattribute self, 'key', $P1
# }
.annotate 'line', 8922

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8923
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8927
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8928
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8929

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8933
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8934
    unless_null $P1, __label_1
# {
.annotate 'line', 8935
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8936
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_67($S2)
  __label_3: # endif
.annotate 'line', 8937
    getattribute $P3, self, 'key'
    $P2 = WSubId_58($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8939
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 8940

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 8908
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8910
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8945
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8946
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8947
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8948
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8949
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8950
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8951
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 8952
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 8953

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8965
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8966
    setattribute self, 'name', __ARG_2
.annotate 'line', 8967
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8968
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8969
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8970

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8973
    getattribute $P1, self, 'classns'
    .tailcall WSubId_58($P1)
# }
.annotate 'line', 8974

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 8959
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8961
    addattribute $P0, 'name'
.annotate 'line', 8962
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
.annotate 'line', 8987
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8988
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8989
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8990
    setattribute self, 'functions', $P1
.annotate 'line', 8991
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8992
    setattribute self, 'members', $P2
.annotate 'line', 8993
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8994
    setattribute self, 'constants', $P3
.annotate 'line', 8996
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8997
    $P8 = $P4.'isop'(':')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 8998
    $P10 = WSubId_36(__ARG_4, self, WSubId_60)
    setattribute self, 'bases', $P10
.annotate 'line', 8999
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9001
    WSubId_4('{', $P4)
# for loop
.annotate 'line', 9002
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9003
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
.annotate 'line', 9005
# var f: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 9006
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9009
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 9010
    $P10 = $P6.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 9011
    WSubId_40("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 9012
# predefined push
    push $P2, $P6
.annotate 'line', 9013
    $P4 = __ARG_4.'get'()
.annotate 'line', 9014
    $P11 = $P4.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 9015
    WSubId_40("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9018
# var cst: $P7
    $P7 = WSubId_44($P4, __ARG_4, self)
.annotate 'line', 9019
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9022
    WSubId_41("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9002
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9025

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9028
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9029

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9032
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9033

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9036
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 9037

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9040
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 9041

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9044
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9045

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9048
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9049

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9052
    getattribute $P1, self, 'constants'
    WSubId_38($P1)
.annotate 'line', 9053
    getattribute $P1, self, 'functions'
    WSubId_38($P1)
.annotate 'line', 9054
    .return(self)
# }
.annotate 'line', 9055

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9058
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 9059
    $P5 = WSubId_107($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 9060
    getattribute $P5, self, 'functions'
    WSubId_52(__ARG_1, $P5)
.annotate 'line', 9062
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9064
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 9065
# n: $I1
    set $I1, 1
.annotate 'line', 9066
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 9067
    if_null $P2, __label_1
# {
.annotate 'line', 9068
    getattribute $P5, self, 'bases'
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 9069
    $P3.'annotate'(__ARG_1)
.annotate 'line', 9070
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9071
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9072
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 9073
    __ARG_1.'say'()
.annotate 'line', 9074
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 9077
    getattribute $P5, self, 'members'
    iter $P7, $P5
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 9078
    __ARG_1.'annotate'($P4)
.annotate 'line', 9079
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 9082
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9083

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 8977
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8979
    addattribute $P0, 'parent'
.annotate 'line', 8980
    addattribute $P0, 'bases'
.annotate 'line', 8981
    addattribute $P0, 'constants'
.annotate 'line', 8982
    addattribute $P0, 'functions'
.annotate 'line', 8983
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9090
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9091

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9094
    .return(self)
# }
.annotate 'line', 9095

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9086
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
.annotate 'line', 9103
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9104
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9105
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9106
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9107
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9108
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9106
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.annotate 'line', 9110
    WSubId_4(';', $P2)
.annotate 'line', 9111
    new $P4, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9114
    __ARG_2.'unget'($P2)
.annotate 'line', 9115
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9117

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
.annotate 'line', 9125
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9126
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.annotate 'line', 9127
    WSubId_40('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9128
    WSubId_54(';', __ARG_2)
.annotate 'line', 9129
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9130
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9135
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9136
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9137
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9138
    iter $P8, $P4
    set $P8, 0
  __label_3: # for iteration
    unless $P8 goto __label_4
    shift $S2, $P8
# {
.annotate 'line', 9139
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9140
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9141
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9142
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9140
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
.annotate 'line', 9147
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.annotate 'line', 9148
    WSubId_1('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9153
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
.annotate 'line', 9154
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9155
# pos: $I1
    set $I1, 12
.annotate 'line', 9156
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9157
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9158
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9159
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9160
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9161
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9162
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9163
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9165
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9166
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9167
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9168
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9169
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9170
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9171
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9172
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9174
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9176
# ivalue: $I3
    null $I3
.annotate 'line', 9177
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9178
# predefined substr
    substr $S10, $S7, 2
    box $P9, $S10
    $P7 = $P9.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9180
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9181
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9183
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P11, __ARG_1, 'file'
    getattribute $P12, __ARG_1, 'line'
    $P10.'TokenInteger'($P11, $P12, $S6)
    set $P9, $P10
.annotate 'line', 9182
    $P7 = WSubId_21(__ARG_3, $P9, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9153
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9187
    $P5.'close'()
# }
.annotate 'line', 9188

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
.annotate 'line', 9194
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9195
    $P7 = $P1.'iskeyword'('namespace')
    if_null $P7, __label_1
    unless $P7 goto __label_1
# {
.annotate 'line', 9196
# var nskey: $P2
    $P2 = WSubId_55(__ARG_2)
.annotate 'line', 9197
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9198
    ge $I1, 1, __label_2
.annotate 'line', 9199
    WSubId_1('Unsupported', $P1)
  __label_2: # endif
.annotate 'line', 9200
    WSubId_54(';', __ARG_2)
.annotate 'line', 9201
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9202
    unless_null $P3, __label_3
.annotate 'line', 9203
    WSubId_1('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9204
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9205
    .return()
# }
  __label_1: # endif
.annotate 'line', 9207
    $P7 = $P1.'iskeyword'('extern')
    isfalse $I3, $P7
    unless $I3 goto __label_4
# {
.annotate 'line', 9208
    __ARG_2.'unget'($P1)
.annotate 'line', 9209
# var key: $P4
    $P4 = WSubId_55(__ARG_2)
.annotate 'line', 9210
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9211
    ge $I2, 1, __label_5
.annotate 'line', 9212
    WSubId_1('Unsupported at namespace level', $P1)
  __label_5: # endif
.annotate 'line', 9213
    WSubId_54(';', __ARG_2)
.annotate 'line', 9214
    __ARG_3.'use'($P4)
.annotate 'line', 9215
    .return()
# }
  __label_4: # endif
.annotate 'line', 9217
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9219
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9225
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9221
# reqlib: $S1
    set $P7, $P1
    null $S1
    if_null $P7, __label_10
    set $S1, $P7
  __label_10:
.annotate 'line', 9222
    __ARG_3.'addlib'($S1)
.annotate 'line', 9223
    WSubId_54(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9226
    __ARG_2.'unget'($P1)
.annotate 'line', 9227
# var module: $P5
    $P5 = WSubId_55(__ARG_2)
.annotate 'line', 9228
    $P1 = __ARG_2.'get'()
.annotate 'line', 9229
    $P8 = $P1.'isop'(';')
    isfalse $I4, $P8
    unless $I4 goto __label_11
# {
.annotate 'line', 9230
    __ARG_2.'unget'($P1)
.annotate 'line', 9231
# var names: $P6
    null $P7
    $P6 = WSubId_36(__ARG_2, $P7, WSubId_57, ';')
.annotate 'line', 9232
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9234
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9235
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9238
    WSubId_40('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9240

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9250
    setattribute self, 'module', __ARG_1
.annotate 'line', 9251
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9252

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9257
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9265
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9266
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9267
    __ARG_1.'say'("']")
.annotate 'line', 9268
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9269
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9270
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9276

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9246
    addattribute $P0, 'module'
.annotate 'line', 9247
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9295
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9296
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9297
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9298
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9299
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9300
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9303
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9304
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9305
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9306
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9307
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9309
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9310

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9313
# var ns: $P1
    null $P1
.annotate 'line', 9314
    getattribute $P3, self, 'namespaces'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9315
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9316
    getattribute $P3, self, 'usednamespaces'
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9317
    getattribute $P6, $P1, 'usednamespaces'
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9318
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9319

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9322
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9323

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9326
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9327
    .return()
  __label_1: # endif
.annotate 'line', 9328
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9329
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9330
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9331
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9332
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9333

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9336
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9337
    if_null $P1, __label_1
# {
.annotate 'line', 9338
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9339
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9342
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9343
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9344
    if_null $P2, __label_5
# {
.annotate 'line', 9345
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9346
    if_null $P1, __label_6
.annotate 'line', 9347
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9350

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9353
    getattribute $P2, self, 'usednamespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9354
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9355
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9356
    .return($P2)
# }
.annotate 'line', 9357

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9360
    getattribute $P2, self, 'namespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9361
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9362
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9363
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9364

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9368
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9369
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9370
    unless_null $P2, __label_1
.annotate 'line', 9371
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9373
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9374

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9378
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9379
# var cl: $P2
    null $P2
.annotate 'line', 9380
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9381
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9382
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9383
    getattribute $P5, self, 'usednamespaces'
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9384
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9385
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9386
    .return($P5)
# }
.annotate 'line', 9387

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9392
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9393
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9395
    .return($P3)
  __label_4: # case
.annotate 'line', 9398
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9403
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9404
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9405
    if_null $P1, __label_5
# {
.annotate 'line', 9406
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9407
    if_null $P2, __label_6
.annotate 'line', 9408
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9411
    .return($P3)
# }
.annotate 'line', 9412

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9415
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9416
    if_null $P1, __label_1
.annotate 'line', 9417
    .return($P1)
  __label_1: # endif
.annotate 'line', 9418
    getattribute $P2, self, 'functions'
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9419
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9420
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9421
    .return($P2)
# }
.annotate 'line', 9422

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9427
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9428
# name: $S1
    null $S1
.annotate 'line', 9429
# var sym: $P1
    null $P1
.annotate 'line', 9430
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9431
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9433
    .return($P3)
  __label_4: # case
.annotate 'line', 9435
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9437
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9438
    .return($P1)
  __label_5: # endif
.annotate 'line', 9439
    getattribute $P4, self, 'usednamespaces'
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9440
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9441
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9447
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9448
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9449
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9450
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9451
    .return($P1)
  __label_9: # endif
.annotate 'line', 9452
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9453
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9454
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9455
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9457
    .return($P3)
# }
.annotate 'line', 9458

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9461
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9462
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9464
    .return($P2)
  __label_2: # default
.annotate 'line', 9466
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9467
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9468
    if_null $P1, __label_4
# {
.annotate 'line', 9469
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9470
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9472
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9475
    .return($P2)
# }
.annotate 'line', 9476

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9479
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9480
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9481
    .return($P1)
# }
.annotate 'line', 9482

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9485
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9486
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9487
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9488
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9489
    .return($P2)
# }
.annotate 'line', 9490

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9493
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9494

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9497
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9498
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9499

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9502
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9503
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9504
    $P1 = __ARG_2.'get'()
.annotate 'line', 9506
# var modifier: $P2
    null $P2
.annotate 'line', 9507
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9508
    new $P5, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9509
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.annotate 'line', 9512
    WSubId_4('{', $P1)
.annotate 'line', 9513
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9514
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9515

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
.annotate 'line', 9518
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9519
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9520
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9521
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9522
    $P4 = __ARG_1.'get'()
  __label_3: # for condition
    set $I1, $P4
    unless $I1 goto __label_4
    $P9 = $P4.'isop'('}')
    isfalse $I1, $P9
  __label_4:
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9524
    $P10 = $P4.'checkkeyword'()
    set $S1, $P10
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
.annotate 'line', 9526
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9529
# var cst: $P5
    $P5 = WSubId_44($P4, __ARG_1, self)
.annotate 'line', 9530
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9533
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9534
# predefined push
    push $P2, $P6
.annotate 'line', 9535
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9538
    WSubId_108($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9541
# var t1: $P7
    $P7 = __ARG_1.'get'()
.annotate 'line', 9542
    $P11 = $P7.'iskeyword'('function')
    isfalse $I2, $P11
    unless $I2 goto __label_16
.annotate 'line', 9543
    WSubId_1('Unsupported extern', $P7)
  __label_16: # endif
.annotate 'line', 9544
    $P7 = __ARG_1.'get'()
.annotate 'line', 9545
    WSubId_92($P7)
.annotate 'line', 9546
    WSubId_54(';', __ARG_1)
.annotate 'line', 9547
# var fex: $P8
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P8.'FunctionExtern'($P7, self)
.annotate 'line', 9548
# predefined push
    push $P2, $P8
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9551
    WSubId_109($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9554
    WSubId_110($P4, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9557
    $P4 = __ARG_1.'get'()
.annotate 'line', 9558
    $P12 = $P4.'isstring'()
    isfalse $I3, $P12
    unless $I3 goto __label_17
.annotate 'line', 9559
    WSubId_40('string literal', $P4)
  __label_17: # endif
.annotate 'line', 9560
    WSubId_54(';', __ARG_1)
.annotate 'line', 9561
    new $P15, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P15.'StringLiteral'(self, $P4)
    set $P14, $P15
    $P13 = $P14.'getPirString'()
    self.'addload'($P13)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 9564
    $P4 = __ARG_1.'get'()
.annotate 'line', 9565
    $P16 = $P4.'isstring'()
    isfalse $I4, $P16
    unless $I4 goto __label_18
.annotate 'line', 9566
    WSubId_40('string literal', $P4)
  __label_18: # endif
.annotate 'line', 9567
    WSubId_54(';', __ARG_1)
.annotate 'line', 9568
    new $P19, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P19.'StringLiteral'(self, $P4)
    set $P18, $P19
    $P17 = $P18.'getPirString'()
    self.'addlib'($P17)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9571
    WSubId_41("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9522
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9574
    if_null $P4, __label_19
    unless $P4 goto __label_19
.annotate 'line', 9575
    self.'close_ns'($P4)
    goto __label_20
  __label_19: # else
.annotate 'line', 9577
    self.'unclosed_ns'()
  __label_20: # endif
# }
.annotate 'line', 9578

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9581
    getattribute $P1, self, 'items'
    WSubId_38($P1)
# }
.annotate 'line', 9582

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9585
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9586
# s: $S1
    $P4 = WSubId_107($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9588
# activate: $I1
    set $I1, 1
.annotate 'line', 9590
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9591
    if_null $P2, __label_2
# {
.annotate 'line', 9592
    __ARG_1.'say'($S1)
.annotate 'line', 9593
    null $I1
.annotate 'line', 9594
    WSubId_52(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9597
    getattribute $P4, self, 'items'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
# {
.annotate 'line', 9598
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9599
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9600
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9602
    unless $I1 goto __label_8
# {
.annotate 'line', 9603
    __ARG_1.'say'($S1)
.annotate 'line', 9604
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9606
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9608

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9283
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9285
    addattribute $P0, 'nspath'
.annotate 'line', 9286
    addattribute $P0, 'externals'
.annotate 'line', 9287
    addattribute $P0, 'namespaces'
.annotate 'line', 9288
    addattribute $P0, 'classes'
.annotate 'line', 9289
    addattribute $P0, 'functions'
.annotate 'line', 9290
    addattribute $P0, 'items'
.annotate 'line', 9291
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
.annotate 'line', 9626
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9627
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9628
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9630
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9631
    setattribute self, 'start', __ARG_2
.annotate 'line', 9632
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9633
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9634
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9635
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9636
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9637
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9639

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9642
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9643

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9646
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9647

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9650
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9651

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9654
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9655

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9658
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9659

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9662
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9663
    unless_null $P1, __label_1
.annotate 'line', 9664
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9665
    .return($P1)
# }
.annotate 'line', 9666

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9671
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9672
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9673
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9674
    .return($P1)
# }
.annotate 'line', 9675

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9678
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9679
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9680
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9681
    .return($P1)
# }
.annotate 'line', 9682

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9685
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9686
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9687
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9688
    .return($P1)
# }
.annotate 'line', 9689

.end # findns


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9692
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 9693

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9700
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9701
    if_null $P1, __label_1
.annotate 'line', 9702
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9703
    self.'optimize_base'()
.annotate 'line', 9704
    .return(self)
# }
.annotate 'line', 9705

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9708
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9709
    if_null $P1, __label_1
.annotate 'line', 9710
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9712
    self.'emit_base'(__ARG_1)
.annotate 'line', 9714
    if_null $P1, __label_2
.annotate 'line', 9715
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9716

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 9615
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9617
    addattribute $P0, 'parent'
.annotate 'line', 9618
    addattribute $P0, 'start'
.annotate 'line', 9619
    addattribute $P0, 'name'
.annotate 'line', 9620
    addattribute $P0, 'modifier'
.annotate 'line', 9621
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9733
    new $P1, ['ResizableStringArray']
.annotate 'line', 9734
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9735
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9736
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9737
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9738

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9741
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9742
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9743

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9746
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9747
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9748

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9752
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9751
    set $S1, $I1
.annotate 'line', 9753
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9754

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9758
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9759
    unless_null $P1, __label_1
.annotate 'line', 9760
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9761
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9762

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9765
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9766
    unless_null $P1, __label_1
.annotate 'line', 9767
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9768
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9769

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9772
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9773

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9777
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9778

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9781
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9782

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9785
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9786

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9793
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9794

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9797
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9798

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9801
    self.'optimize_base'()
.annotate 'line', 9802
    .return(self)
# }
.annotate 'line', 9803

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9806
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9809
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9810
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9813
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
.annotate 'line', 9816
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9817
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9818
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9819
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9822
# somelib: $I1
    null $I1
.annotate 'line', 9823
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9824
    if_null $P3, __label_5
# {
.annotate 'line', 9825
    set $I1, 1
.annotate 'line', 9826
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9827
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9830
# someload: $I2
    null $I2
.annotate 'line', 9831
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9832
    if_null $P4, __label_8
# {
.annotate 'line', 9833
    set $I2, 1
.annotate 'line', 9834
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9835
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9836
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9837
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9839
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9840
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9842
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9843

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9846
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9847
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9848
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9849
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9850
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9851
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9853
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9854
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9856

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 9723
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9725
    addattribute $P0, 'unit'
.annotate 'line', 9726
    addattribute $P0, 'predefs_used'
.annotate 'line', 9727
    addattribute $P0, 'libs'
.annotate 'line', 9728
    addattribute $P0, 'loads'
.annotate 'line', 9729
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9872
    box $P7, 1
    setattribute self, 'warnings', $P7
.annotate 'line', 9873
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9876
# var taux: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9878
# var cfalse: $P3
    $P3 = $P1.'createconst'('false', 'I', 4)
.annotate 'line', 9880
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9879
    $P7 = WSubId_21($P1, $P8, 0)
    $P3.'setvalue'($P7)
.annotate 'line', 9881
# var ctrue: $P4
    $P4 = $P1.'createconst'('true', 'I', 4)
.annotate 'line', 9883
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9882
    $P7 = WSubId_21($P1, $P8, 1)
    $P4.'setvalue'($P7)
.annotate 'line', 9887
# var cstage: $P5
    $P5 = $P1.'createconst'('__STAGE__', 'S', 4)
.annotate 'line', 9888
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 9889
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P11, $P2, 'file'
    getattribute $P12, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9888
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P10.'TokenQuoted'($P11, $P12, $S1)
    set $P9, $P10
    $P8.'StringLiteral'($P1, $P9)
    set $P7, $P8
    $P5.'setvalue'($P7)
.annotate 'line', 9891
# var cerrtype: $P6
    $P6 = $P1.'createconst'('__WINXED_ERROR__', 'S', 4)
.annotate 'line', 9893
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, '__WINXED_ERROR__')
    set $P8, $P9
.annotate 'line', 9892
    $P7 = WSubId_21($P1, $P8, 567)
    $P6.'setvalue'($P7)
.annotate 'line', 9895
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9896

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9899
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9900

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9903
    getattribute $P1, self, 'warnings'
.annotate 'line', 9902
    set $I1, $P1
.annotate 'line', 9903
    .return($I1)
# }
.annotate 'line', 9904

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9907
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 9908
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 9909

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9912
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9913

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9916
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 9917
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9918
    __ARG_1.'say'('')
.annotate 'line', 9920
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9922
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9923

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9926
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9927
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9929
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9931
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9932

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9867
    addattribute $P0, 'rootns'
.annotate 'line', 9868
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
.annotate 'line', 9941
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 9942
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 9943
# var handleout: $P1
    null $P1
.annotate 'line', 9944
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 9945
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9946
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 9949
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 9950
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9951
    if_null __ARG_4, __label_4
    unless __ARG_4 goto __label_4
.annotate 'line', 9952
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 9953
    __ARG_1.'emit'($P2)
.annotate 'line', 9954
    $P2.'close'()
.annotate 'line', 9955
    if_null __ARG_3, __label_5
.annotate 'line', 9956
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 9958
    $P1.'close'()
.annotate 'line', 9959
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9960
# var object: $P3
    null $P3
# switch
.annotate 'line', 9961
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 9963
    new $P3, [ 'String' ]
.annotate 'line', 9964
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 9968
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9969
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 9970
# predefined string
.annotate 'line', 9972
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 9974
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 9976

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9979
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9980
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9981
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9982
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9983
    $P2.'close'()
.annotate 'line', 9984
    $P1.'close'()
.annotate 'line', 9985
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9986

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9993
    unless_null __ARG_2, __label_1
.annotate 'line', 9994
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9995
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9996
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9997
    $P1.'puts'(__ARG_1)
.annotate 'line', 9998
    $P1.'close'()
.annotate 'line', 9999
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10000
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10001
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10002
    unless __ARG_5 goto __label_2
.annotate 'line', 10003
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 10004
    $P3.'parse'($P2)
.annotate 'line', 10005
    $P1.'close'()
.annotate 'line', 10006
    $P3.'optimize'()
.annotate 'line', 10007
    ne __ARG_2, 'include', __label_3
.annotate 'line', 10008
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 10010
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_4: # endif
# }
.annotate 'line', 10011

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10019
    unless_null __ARG_2, __label_1
.annotate 'line', 10020
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10021
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10022
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10023
    $P1.'encoding'('utf8')
.annotate 'line', 10024
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10025
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10026
    unless __ARG_5 goto __label_2
.annotate 'line', 10027
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 10028
    $P3.'parse'($P2)
.annotate 'line', 10029
    $P1.'close'()
.annotate 'line', 10030
    $P3.'optimize'()
.annotate 'line', 10031
    ne __ARG_2, 'include', __label_3
.annotate 'line', 10032
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 10034
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_4: # endif
# }
.annotate 'line', 10035

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10044
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10045
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10046

.end # initializer

# End generated code
