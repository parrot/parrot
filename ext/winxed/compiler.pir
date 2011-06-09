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


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 923
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 924

.end # emitfind_lex

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
.annotate 'line', 933
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 934

.end # integerValue


.sub 'floatValue' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 938
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 939
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 940

.end # floatValue


.sub 'floatresult' :subid('WSubId_62')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 948
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 949
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 950
    .return($I1)
# }
.annotate 'line', 951

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
.annotate 'line', 988
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 989
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 990
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 991
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 992
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 993
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 994

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
.annotate 'line', 997
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 999
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1000
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1001
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1004
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1005
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1008
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1009
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 1010
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1011
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1012

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 974
    addattribute $P0, 'body'
.annotate 'line', 975
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
.annotate 'line', 1033
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1034
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1035
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1037
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1038
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1039
# n: $I1
    null $I1
.annotate 'line', 1040
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1041
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1042
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1044
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1047
    set $I1, -2
.annotate 'line', 1048
    if_null __ARG_5, __label_8
.annotate 'line', 1049
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1052
    set $I1, 1
.annotate 'line', 1053
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1054
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1055
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1057
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1058
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1059
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1061
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1062
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1063
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1067
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1068

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1071
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1072
    .return($S1)
# }
.annotate 'line', 1073

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1076
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1077

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1078
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1081
# type: $S1
    null $S1
# switch
.annotate 'line', 1082
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
.annotate 'line', 1083
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1084
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1085
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1086
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1088
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1090
    .return($S1)
# }
.annotate 'line', 1091

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1094
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1095
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1096
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1097
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1098
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1099
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1100

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1017
    addattribute $P0, 'name'
.annotate 'line', 1018
    addattribute $P0, 'body'
.annotate 'line', 1019
    addattribute $P0, 'typeresult'
.annotate 'line', 1020
    addattribute $P0, 'type0'
.annotate 'line', 1021
    addattribute $P0, 'type1'
.annotate 'line', 1022
    addattribute $P0, 'type2'
.annotate 'line', 1023
    addattribute $P0, 'type3'
.annotate 'line', 1024
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
.annotate 'line', 1112
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1113

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1103
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
.annotate 'line', 1126
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1127
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1128

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1116
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1118
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1136
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1137

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1140
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1141
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.annotate 'line', 1142
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1143
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1144
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1146
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1147
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1148
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1151
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1152
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1154
    ne $S3, 'null', __label_9
.annotate 'line', 1155
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1157
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1159

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1133
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
.annotate 'line', 1164
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1165
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1166
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1167
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1168
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1167
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1169
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1172
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1173

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1177
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1178
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1179
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1180
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1181
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1182

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1186
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1187
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1188
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1189

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1195
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1196
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1197
    WSubId_1("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1198
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1199

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1203
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1204
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1205
# predefined length
.annotate 'line', 1202
    length $I1, $S1
.annotate 'line', 1205
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1206

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1210
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1211
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1212
# predefined bytelength
.annotate 'line', 1209
    bytelength $I1, $S1
.annotate 'line', 1212
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1213

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1217
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1218
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1219
# predefined ord
.annotate 'line', 1216
    ord $I1, $S1
.annotate 'line', 1219
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1220

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1224
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1225
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1226
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1227
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1228
# predefined ord
.annotate 'line', 1223
    ord $I2, $S1, $I1
.annotate 'line', 1228
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1229

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1233
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1235
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1236
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1238
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1239
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1240

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1244
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1245
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1246
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1247
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1249
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1250
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1251

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1255
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1256
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1257
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1258
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1259
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1260
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1262
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1263
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1264

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1268
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1269
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1270
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1271
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1272
# predefined indexof
.annotate 'line', 1267
    index $I1, $S1, $S2
.annotate 'line', 1272
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1273

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1277
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1278
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1279
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1280
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1281
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1282
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1283
# predefined indexof
.annotate 'line', 1276
    index $I2, $S1, $S2, $I1
.annotate 'line', 1283
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1284

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
.annotate 'line', 1288
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1289
    new $P4, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1290
    new $P6, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P6.'Predef_typecast'('I')
    set $P5, $P6
    $P4.'PredefFunction'('int', $P5, 'I', '!')
    set $P3, $P4
.annotate 'line', 1288
    push $P1, $P3
.annotate 'line', 1293
    new $P8, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1294
    new $P10, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P10.'Predef_typecast'('N')
    set $P9, $P10
    $P8.'PredefFunction'('float', $P9, 'N', '!')
    set $P7, $P8
.annotate 'line', 1288
    push $P1, $P7
.annotate 'line', 1297
    new $P12, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1298
    new $P14, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P14.'Predef_typecast'('S')
    set $P13, $P14
    $P12.'PredefFunction'('string', $P13, 'S', '!')
    set $P11, $P12
.annotate 'line', 1288
    push $P1, $P11
.annotate 'line', 1301
    new $P16, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P16.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P15, $P16
.annotate 'line', 1288
    push $P1, $P15
.annotate 'line', 1305
    new $P18, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P18.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P17, $P18
.annotate 'line', 1288
    push $P1, $P17
.annotate 'line', 1309
    new $P20, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P20.'PredefFunction'('time', 'time %0', 'I')
    set $P19, $P20
.annotate 'line', 1288
    push $P1, $P19
.annotate 'line', 1313
    new $P22, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P22.'PredefFunction'('floattime', 'time %0', 'N')
    set $P21, $P22
.annotate 'line', 1288
    push $P1, $P21
.annotate 'line', 1317
    new $P24, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P24.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P23, $P24
.annotate 'line', 1288
    push $P1, $P23
.annotate 'line', 1321
    new $P26, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P26.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P25, $P26
.annotate 'line', 1288
    push $P1, $P25
.annotate 'line', 1325
    new $P28, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P28.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P27, $P28
.annotate 'line', 1288
    push $P1, $P27
.annotate 'line', 1329
    new $P30, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P30.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P29, $P30
.annotate 'line', 1288
    push $P1, $P29
.annotate 'line', 1333
    new $P32, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P32.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P31, $P32
.annotate 'line', 1288
    push $P1, $P31
.annotate 'line', 1340
    new $P34, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P34.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P33, $P34
.annotate 'line', 1288
    push $P1, $P33
.annotate 'line', 1347
    new $P36, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P36.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P35, $P36
.annotate 'line', 1288
    push $P1, $P35
.annotate 'line', 1354
    new $P38, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P38.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P37, $P38
.annotate 'line', 1288
    push $P1, $P37
.annotate 'line', 1362
    new $P40, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P40.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P39, $P40
.annotate 'line', 1288
    push $P1, $P39
.annotate 'line', 1371
    new $P42, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P42.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P41, $P42
.annotate 'line', 1288
    push $P1, $P41
.annotate 'line', 1381
    new $P44, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P44.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P43, $P44
.annotate 'line', 1288
    push $P1, $P43
.annotate 'line', 1385
    new $P46, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1386
    $P46.'PredefFunctionEval'('length', WSubId_22, 'length %0, %1', 'I', 'S')
    set $P45, $P46
.annotate 'line', 1288
    push $P1, $P45
.annotate 'line', 1390
    new $P48, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1391
    $P48.'PredefFunctionEval'('bytelength', WSubId_23, 'bytelength %0, %1', 'I', 'S')
    set $P47, $P48
.annotate 'line', 1288
    push $P1, $P47
.annotate 'line', 1395
    new $P50, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1396
    $P50.'PredefFunctionEval'('chr', WSubId_24, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P49, $P50
.annotate 'line', 1288
    push $P1, $P49
.annotate 'line', 1404
    new $P52, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1405
    $P52.'PredefFunctionEval'('ord', WSubId_25, 'ord %0, %1', 'I', 'S')
    set $P51, $P52
.annotate 'line', 1288
    push $P1, $P51
.annotate 'line', 1409
    new $P54, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1410
    $P54.'PredefFunctionEval'('ord', WSubId_26, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P53, $P54
.annotate 'line', 1288
    push $P1, $P53
.annotate 'line', 1414
    new $P56, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1415
    $P56.'PredefFunctionEval'('substr', WSubId_27, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P55, $P56
.annotate 'line', 1288
    push $P1, $P55
.annotate 'line', 1419
    new $P58, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1420
    $P58.'PredefFunctionEval'('substr', WSubId_28, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P57, $P58
.annotate 'line', 1288
    push $P1, $P57
.annotate 'line', 1424
    new $P60, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P60.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P59, $P60
.annotate 'line', 1288
    push $P1, $P59
.annotate 'line', 1428
    new $P62, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1429
    $P62.'PredefFunctionEval'('indexof', WSubId_29, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P61, $P62
.annotate 'line', 1288
    push $P1, $P61
.annotate 'line', 1433
    new $P64, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1434
    $P64.'PredefFunctionEval'('indexof', WSubId_30, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P63, $P64
.annotate 'line', 1288
    push $P1, $P63
.annotate 'line', 1438
    new $P66, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P66.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P65, $P66
.annotate 'line', 1288
    push $P1, $P65
.annotate 'line', 1442
    new $P68, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P68.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P67, $P68
.annotate 'line', 1288
    push $P1, $P67
.annotate 'line', 1446
    new $P70, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P70.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P69, $P70
.annotate 'line', 1288
    push $P1, $P69
.annotate 'line', 1450
    new $P72, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P72.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P71, $P72
.annotate 'line', 1288
    push $P1, $P71
.annotate 'line', 1454
    new $P74, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P74.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P73, $P74
.annotate 'line', 1288
    push $P1, $P73
.annotate 'line', 1458
    new $P76, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P76.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P75, $P76
.annotate 'line', 1288
    push $P1, $P75
.annotate 'line', 1465
    new $P78, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P78.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P77, $P78
.annotate 'line', 1288
    push $P1, $P77
.annotate 'line', 1472
    new $P80, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P80.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P79, $P80
.annotate 'line', 1288
    push $P1, $P79
.annotate 'line', 1476
    new $P82, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P82.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P81, $P82
.annotate 'line', 1288
    push $P1, $P81
.annotate 'line', 1480
    new $P84, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P84.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P83, $P84
.annotate 'line', 1288
    push $P1, $P83
.annotate 'line', 1484
    new $P86, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P86.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P85, $P86
.annotate 'line', 1288
    push $P1, $P85
.annotate 'line', 1488
    new $P88, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P88.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P87, $P88
.annotate 'line', 1288
    push $P1, $P87
.annotate 'line', 1492
    new $P90, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P90.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P89, $P90
.annotate 'line', 1288
    push $P1, $P89
.annotate 'line', 1496
    new $P92, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P92.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P91, $P92
.annotate 'line', 1288
    push $P1, $P91
.annotate 'line', 1500
    new $P94, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P94.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P93, $P94
.annotate 'line', 1288
    push $P1, $P93
.annotate 'line', 1504
    new $P96, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P96.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P95, $P96
.annotate 'line', 1288
    push $P1, $P95
.annotate 'line', 1508
    new $P98, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P98.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P97, $P98
.annotate 'line', 1288
    push $P1, $P97
.annotate 'line', 1512
    new $P100, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P100.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P99, $P100
.annotate 'line', 1288
    push $P1, $P99
.annotate 'line', 1516
    new $P102, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P102.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P101, $P102
.annotate 'line', 1288
    push $P1, $P101
.annotate 'line', 1520
    new $P104, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P104.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P103, $P104
.annotate 'line', 1288
    push $P1, $P103
.annotate 'line', 1524
    new $P106, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P106.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P105, $P106
.annotate 'line', 1288
    push $P1, $P105
.annotate 'line', 1528
    new $P108, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P108.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P107, $P108
.annotate 'line', 1288
    push $P1, $P107
.annotate 'line', 1532
    new $P110, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P110.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P109, $P110
.annotate 'line', 1288
    push $P1, $P109
.annotate 'line', 1536
    new $P112, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P112.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P111, $P112
.annotate 'line', 1288
    push $P1, $P111
.annotate 'line', 1540
    new $P114, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P114.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P113, $P114
.annotate 'line', 1288
    push $P1, $P113
.annotate 'line', 1544
    new $P116, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P116.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P115, $P116
.annotate 'line', 1288
    push $P1, $P115
.annotate 'line', 1548
    new $P118, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P118.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P117, $P118
.annotate 'line', 1288
    push $P1, $P117
.annotate 'line', 1552
    new $P120, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P120.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P119, $P120
.annotate 'line', 1288
    push $P1, $P119
.annotate 'line', 1556
    new $P122, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P122.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P121, $P122
.annotate 'line', 1288
    push $P1, $P121
.annotate 'line', 1563
    new $P124, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P124.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P123, $P124
.annotate 'line', 1288
    push $P1, $P123
.annotate 'line', 1570
    new $P126, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P126.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P125, $P126
.annotate 'line', 1288
    push $P1, $P125
.annotate 'line', 1574
    new $P128, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P128.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P127, $P128
.annotate 'line', 1288
    push $P1, $P127
.annotate 'line', 1578
    new $P130, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P130.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P129, $P130
.annotate 'line', 1288
    push $P1, $P129
.annotate 'line', 1582
    new $P132, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P132.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P131, $P132
.annotate 'line', 1288
    push $P1, $P131
.annotate 'line', 1586
    new $P134, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P134.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P133, $P134
.annotate 'line', 1288
    push $P1, $P133
.annotate 'line', 1590
    new $P136, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1591
    $P136.'PredefFunction'('print', WSubId_31, 'v', '*')
    set $P135, $P136
.annotate 'line', 1288
    push $P1, $P135
.annotate 'line', 1594
    new $P138, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1595
    $P138.'PredefFunction'('say', WSubId_32, 'v', '*')
    set $P137, $P138
.annotate 'line', 1288
    push $P1, $P137
.annotate 'line', 1598
    new $P140, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1599
    $P140.'PredefFunction'('cry', WSubId_33, 'v', '*')
    set $P139, $P140
.annotate 'line', 1288
    push $P1, $P139
.annotate 'line', 1602
    new $P142, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1603
    $P142.'PredefFunction'('invoke', WSubId_34, 'P', '!')
    set $P141, $P142
.annotate 'line', 1288
    push $P1, $P141
  __label_2: # Infinite loop
.annotate 'line', 1608
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1609

.end # getpredefs


.sub 'findpredef' :subid('WSubId_65')
        .param string __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
# Body
# {
.annotate 'line', 1613
    $P2 = WSubId_35()
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 1614
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1615
# pargs: $I1
    getattribute $P5, $P1, 'nparams'
    set $I1, $P5
.annotate 'line', 1616
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1617
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1618
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1619
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1621
    .return($P2)
# }
.annotate 'line', 1622

.end # findpredef


.sub 'optimize_array' :subid('WSubId_38')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1630
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1631
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1632
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1633
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1632
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1635

.end # optimize_array


.sub 'emit_array' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1639
    if_null __ARG_2, __label_1
# {
.annotate 'line', 1640
    iter $P2, __ARG_2
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $P1, $P2
.annotate 'line', 1641
    $P1.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
# }
.annotate 'line', 1643

.end # emit_array


.sub 'parseDotted' :subid('WSubId_55')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1647
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1648
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1649
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1650
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1651
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1652
    $P2 = __ARG_1.'get'()
.annotate 'line', 1653
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1656
    __ARG_1.'unget'($P2)
.annotate 'line', 1657
    .return($P1)
# }
.annotate 'line', 1658

.end # parseDotted


.sub 'parseList' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1666
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1667
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1668
# {
.annotate 'line', 1669
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1670
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1671
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1672
    unless_null __ARG_4, __label_4
.annotate 'line', 1673
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1675
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1676
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1677
    .return($P1)
# }
.annotate 'line', 1678

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1683
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1684
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1685
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1686
    .return($P1)
# }
.annotate 'line', 1687

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_56')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1691
    new $P1, ['ResizableStringArray']
.annotate 'line', 1692
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1693
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1694
    .return($P1)
# }
.annotate 'line', 1695

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1708
    setattribute self, 'start', __ARG_1
.annotate 'line', 1709
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1710

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1713
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1714
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1716
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 1717

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 1720
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1721
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1723
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 1724

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 1727
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1728
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1730
    .return("")
  __label_2: # endif
# }
.annotate 'line', 1731

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1734
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1735

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1738
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1739

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1742
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1743

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1746
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 1747

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1750
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1751

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1754
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1755

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1758
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1759

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1762
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1763

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1766
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1767

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1703
    addattribute $P0, 'start'
.annotate 'line', 1704
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
.annotate 'line', 1782
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 1783

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1787
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1786
    elements $I1, $P1
.annotate 'line', 1787
    .return($I1)
# }
.annotate 'line', 1788

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1791
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1792
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1793

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1797
    getattribute $P1, self, 'args'
    WSubId_38($P1)
# }
.annotate 'line', 1798

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1801
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1802
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1803
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1804
    .return($P1)
# }
.annotate 'line', 1805

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1808
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1809

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 1778
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1821
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1824
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1825
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1826
    .return($I1)
# }
.annotate 'line', 1827

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1830
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1831
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 1832
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1833
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1834

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1837
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1838
    if_null __ARG_2, __label_1
.annotate 'line', 1839
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1840

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1843
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1844
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1845
    .return(self)
# }
.annotate 'line', 1846

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 1818
    addattribute $P0, 'name'
.annotate 'line', 1819
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1851
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1852
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1853
    $P1 = __ARG_1.'get'()
.annotate 'line', 1854
# var args: $P2
    null $P2
.annotate 'line', 1855
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1856
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1858
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1859
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1860

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 1869
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_39, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 1870

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 1873
    getattribute $P1, self, 'list'
    WSubId_38($P1)
# }
.annotate 'line', 1874

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1875
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1878
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1879
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1880
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1882
    .return($P2)
# }
.annotate 'line', 1883

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 1865
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1892
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1893
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1894

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_107')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1898
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1899
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1901
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1902
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1904

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1908
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1910
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1912
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 1914
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1911
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1913
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 1915
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 1917
    __ARG_2.'unget'($P1)
.annotate 'line', 1918
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 1920

.end # parseUsing


.sub 'parseSig' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 1924
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1925
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1926
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 1927
    WSubId_40("'='", $P2)
  __label_1: # endif
.annotate 'line', 1928
# var expr: $P3
    $P3 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 1929
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1930

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
.annotate 'line', 1934
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1935
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1936
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 1937
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1938
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1939
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 1940
    new $P6, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 1941
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1942
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1943
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.annotate 'line', 1944
    WSubId_41("':'", $P1)
  __label_5: # endif
.annotate 'line', 1945
    .tailcall WSubId_42($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 1948
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
.annotate 'line', 1950
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 1952
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 1955
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 1958
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1960
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1962
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1964
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 1966
    new $P6, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 1968
    new $P8, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_17: # case
.annotate 'line', 1970
    new $P10, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_18: # case
.annotate 'line', 1972
    new $P12, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_19: # case
.annotate 'line', 1974
    new $P14, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_20: # case
.annotate 'line', 1976
    new $P16, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_21: # case
.annotate 'line', 1978
    new $P18, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_22: # case
.annotate 'line', 1980
    new $P20, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_23: # case
.annotate 'line', 1982
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1984
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 1986
    new $P22, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_26: # case
.annotate 'line', 1988
    new $P24, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_7: # default
.annotate 'line', 1990
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_27
    unless $P25 goto __label_27
# {
.annotate 'line', 1991
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1992
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 1993
    new $P6, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 1994
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 1996
    __ARG_1.'unget'($P1)
.annotate 'line', 1997
    new $P5, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.annotate 'line', 1999
    WSubId_6('parseStatement failure', $P1)
# }
.annotate 'line', 2000

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2010
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2011

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2012
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2015
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2016

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2019
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2020

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2023
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2024

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2027
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2028

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2031
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2032

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2035
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2036

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2039
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2040

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2043
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2044

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2047
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2048

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2051
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2052

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2055
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2056

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2059
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2060

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2063
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2064

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2071
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2072

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2075
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2076

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2079
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2080

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2083
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2085
    .return(self)
# }
.annotate 'line', 2086

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2006
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2091
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2094
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2095

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2096
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2089
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2109
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2110
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2111
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2112
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2113
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2114
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2115
    null $I2
  __label_4: # endif
.annotate 'line', 2116
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2112
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2118
    unless $I2 goto __label_6
.annotate 'line', 2119
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2121
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2122

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2105
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2129
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2130
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2131

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2132
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2135
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2136
    .return(self)
# }
.annotate 'line', 2137

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 2140
    getattribute $P1, self, 'statements'
    WSubId_52(__ARG_1, $P1)
# }
.annotate 'line', 2141

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2125
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2146
    unless_null __ARG_1, __label_1
.annotate 'line', 2147
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2148
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2149
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2151
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2152

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2160
# var arg: $P1
    null $P1
.annotate 'line', 2161
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2162
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2163
    $P2 = __ARG_1.'get'()
.annotate 'line', 2164
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2165
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2168
    __ARG_1.'unget'($P2)
.annotate 'line', 2169
    $P1 = WSubId_37(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2171
    .return($P1)
# }
.annotate 'line', 2172

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
.annotate 'line', 2181
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2182
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2183
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2184
    unless $I1 goto __label_1
.annotate 'line', 2185
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2186
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2187
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2188
    $P1 = __ARG_2.'get'()
.annotate 'line', 2189
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2190
    __ARG_2.'unget'($P1)
.annotate 'line', 2191
    $P3 = WSubId_36(__ARG_2, __ARG_3, WSubId_53, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2193
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2194

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2197
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 2198
    .return(self)
# }
.annotate 'line', 2199

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2202
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2203
    self.'annotate'(__ARG_1)
.annotate 'line', 2204
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2205
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2206
    __ARG_1.'print'('    ')
.annotate 'line', 2207
    unless_null $P1, __label_2
.annotate 'line', 2208
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2210
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2211
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2212
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2213
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2215

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2174
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2176
    addattribute $P0, 'opname'
.annotate 'line', 2177
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
.annotate 'line', 2227
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2228
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2229
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2230
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2231
    WSubId_54(';', __ARG_2)
.annotate 'line', 2232
    $P3 = WSubId_56($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2233
    .return(self)
# }
.annotate 'line', 2234

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2235
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2238
    self.'annotate'(__ARG_1)
.annotate 'line', 2239
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2240

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2222
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2224
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
.annotate 'line', 2252
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2253
# var names: $P1
    null $P3
    $P1 = WSubId_36(__ARG_2, $P3, WSubId_57, ';')
.annotate 'line', 2254
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2255
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2256
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2258
    setattribute self, 'names', $P1
# }
.annotate 'line', 2259

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2262
    .return(self)
# }
.annotate 'line', 2263

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2266
    self.'annotate'(__ARG_1)
.annotate 'line', 2267
    getattribute $P3, self, 'names'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2268
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2269
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2271

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2247
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2249
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
.annotate 'line', 2285
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2286
# var path: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2287
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2288
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2289
    WSubId_54(';', __ARG_2)
.annotate 'line', 2290
    setattribute self, 'path', $P1
# }
.annotate 'line', 2291

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2294
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2295
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2297
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2299
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2313
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2300
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2301
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2302
    $P4.'pop'()
.annotate 'line', 2303
# var ns: $P5
    $P5 = self.'findns'($P4)
.annotate 'line', 2304
    if_null $P5, __label_6
# {
.annotate 'line', 2305
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2306
    if_null $P3, __label_7
# {
.annotate 'line', 2307
    self.'createvarused'($P2, $P3)
.annotate 'line', 2308
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
.annotate 'line', 2314
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2315
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2316
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2317
    self.'usesubid'($S1)
.annotate 'line', 2318
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2320
    self.'createvar'($P2, 'P')
.annotate 'line', 2321
    .return(self)
# }
.annotate 'line', 2322

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2325
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2326
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2327
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2328
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2329
    self.'annotate'(__ARG_1)
.annotate 'line', 2330
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2331
    $P1.'pop'()
# switch
.annotate 'line', 2332
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2334
    __ARG_1.'say'("'", $S1, "'")
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 2337
    $P3 = WSubId_58($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_2: # switch end
# }
  __label_1: # endif
# }
.annotate 'line', 2340

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2278
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2280
    addattribute $P0, 'path'
.annotate 'line', 2281
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
.annotate 'line', 2351
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2352
# var nskey: $P1
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2353
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2354
    ge $I1, 1, __label_1
.annotate 'line', 2355
    WSubId_40('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2356
# var nssym: $P2
    $P3 = WSubId_56($P1)
    $P2 = __ARG_3.'findns'($P3)
.annotate 'line', 2358
    unless_null $P2, __label_2
.annotate 'line', 2359
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2360
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2362
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2363

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2366
    .return(self)
# }
.annotate 'line', 2367

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2347
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
.annotate 'line', 2382
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2383
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2384
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2385

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2388
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2389
    .return(self)
# }
.annotate 'line', 2390

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2393
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2394

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2377
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2379
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
.annotate 'line', 2411
    setattribute self, 'type', __ARG_1
.annotate 'line', 2412
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2413
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2414
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2415

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2418
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2419

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2420
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2421
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2422
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2423
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2424
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2425
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2426
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2403
    addattribute $P0, 'type'
.annotate 'line', 2404
    addattribute $P0, 'reg'
.annotate 'line', 2405
    addattribute $P0, 'scope'
.annotate 'line', 2406
    addattribute $P0, 'flags'
.annotate 'line', 2407
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2434
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2435

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2438
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2439

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2431
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
.annotate 'line', 2448
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2449

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2450
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2453
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2454
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2455
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2456

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2442
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2444
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2467
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2468

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2471
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2472
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2473
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2474
    if_null $P2, __label_2
.annotate 'line', 2475
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2476
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2477
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2478
    $P1[$S1] = $P3
.annotate 'line', 2479
    .return($P3)
# }
.annotate 'line', 2480

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2483
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2484
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2485
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2486
    if_null $P2, __label_2
.annotate 'line', 2487
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2488
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2489

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2492
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2493
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2494
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2495
    if_null $P2, __label_2
.annotate 'line', 2496
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2497
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2498

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2501
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2502
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2503
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2504
    if_null $P2, __label_2
.annotate 'line', 2505
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2506
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2507
    $P1[$S1] = $P3
.annotate 'line', 2508
    .return($P3)
# }
.annotate 'line', 2509

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2512
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2511
    set $S1, __ARG_1
.annotate 'line', 2513
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2514

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2517
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 2518
    if_null $P1, __label_1
# {
.annotate 'line', 2519
# var sym: $P2
    null $P2
.annotate 'line', 2520
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 2521
    $P2 = $P3.'getlocalvar'(__ARG_1)
    if_null $P2, __label_4
.annotate 'line', 2522
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
    null $P5
.annotate 'line', 2525
    .return($P5)
# }
.annotate 'line', 2526

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2529
# var sym: $P1
    null $P1
.annotate 'line', 2530
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2531
    .return($P1)
  __label_1: # endif
.annotate 'line', 2532
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2533
    .return($P1)
  __label_2: # endif
.annotate 'line', 2534
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2535
    if_null $P2, __label_3
.annotate 'line', 2536
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2537
    .return($P3)
# }
.annotate 'line', 2538

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2541
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2542
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2543
    .return($S1)
# }
.annotate 'line', 2544

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2547
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2549
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2550
    .return('__WLEX_self')
# }
.annotate 'line', 2551

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2462
    addattribute $P0, 'locals'
.annotate 'line', 2463
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2560
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
.annotate 'line', 2572
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2573

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2574
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2575
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2576
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2577
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2578
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2579
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2580
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2581
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2582
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2585
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2586

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2590
    .return(self)
# }
.annotate 'line', 2591

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2592
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2595
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2596
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2597
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2598
    .return($S2)
# }
.annotate 'line', 2599

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2602
# reg: $S1
    null $S1
.annotate 'line', 2603
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2604
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2606
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2607
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2609
    .return($S1)
# }
.annotate 'line', 2610

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2613
    WSubId_1('Not a left-side expression', self)
# }
.annotate 'line', 2614

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2568
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2619
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2617
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
.annotate 'line', 2629
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2630
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2631
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2632
    WSubId_40('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2633
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2634

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2635
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2638
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2639
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2640
    .return(self)
# }
.annotate 'line', 2641

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2644
    self.'annotate'(__ARG_1)
.annotate 'line', 2645
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2646
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2647

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2624
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2626
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
.annotate 'line', 2662
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2663
    .return(self)
# }
.annotate 'line', 2664

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2667
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2668

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2671
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2672
    .return(self)
# }
.annotate 'line', 2673

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2676
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2677
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2678
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2680
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2681
    ne $I1, 0, __label_5
.annotate 'line', 2682
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2684
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2687
    .return(0)
# }
.annotate 'line', 2688

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2691
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2693
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2694
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2695
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2697
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2698
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
.annotate 'line', 2701
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2704
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2707
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2710

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2713
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2715
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2716
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2717
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2719
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2720
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
.annotate 'line', 2723
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2726
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2729
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2732

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2659
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2739
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2740
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2737
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2750
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2751
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2752

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2753
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2754
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2757
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2758
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2759
# typesinglequoted: $I1
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 2760
# need_unicode: $I2
    null $I2
.annotate 'line', 2761
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $I3, $P3
# {
.annotate 'line', 2762
    le $I3, 127, __label_4
# {
.annotate 'line', 2763
    set $I2, 1
    goto __label_3 # break
.annotate 'line', 2764
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 2767
    unless $I2 goto __label_5
# {
.annotate 'line', 2768
    unless $I1 goto __label_6
# {
.annotate 'line', 2769
    null $I1
.annotate 'line', 2770
# saux: $S2
    set $S2, $S1
.annotate 'line', 2771
    set $S1, ''
.annotate 'line', 2772
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_7: # for iteration
    unless $P4 goto __label_8
    shift $S3, $P4
# {
.annotate 'line', 2773
    ne $S3, '\', __label_9
.annotate 'line', 2774
    set $S3, '\\'
  __label_9: # endif
.annotate 'line', 2775
    concat $S1, $S1, $S3
# }
    goto __label_7
  __label_8: # endfor
# }
  __label_6: # endif
.annotate 'line', 2778
# result: $S4
    set $S4, ''
.annotate 'line', 2779
    box $P2, $S1
    iter $P5, $P2
    set $P5, 0
  __label_10: # for iteration
    unless $P5 goto __label_11
    shift $S5, $P5
# {
.annotate 'line', 2780
# n: $I4
# predefined ord
    ord $I4, $S5
.annotate 'line', 2781
    le $I4, 127, __label_12
# {
.annotate 'line', 2782
# h: $S6
    box $P6, $I4
    $P2 = $P6.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
  __label_14:
.annotate 'line', 2783
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 2786
    concat $S4, $S4, $S5
  __label_13: # endif
# }
    goto __label_10
  __label_11: # endfor
.annotate 'line', 2788
    set $S1, $S4
# }
  __label_5: # endif
.annotate 'line', 2790
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
  __label_16:
    set $S7, '"'
  __label_15:
.annotate 'line', 2791
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2792
    unless $I2 goto __label_17
.annotate 'line', 2793
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_17: # endif
.annotate 'line', 2794
    .return($S1)
# }
.annotate 'line', 2795

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2798
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2799
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2800
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2801
# var s: $P2
    box $P2, $S1
.annotate 'line', 2802
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2804
    .return($S1)
# }
.annotate 'line', 2805

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2808
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2809
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2810

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2813
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2814

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2745
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2747
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
.annotate 'line', 2826
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2827
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2828
# n: $I1
    null $I1
.annotate 'line', 2829
    unless __ARG_4 goto __label_1
.annotate 'line', 2830
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2832
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2833
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2835
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2836

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2837
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2838
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2841
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2840
    set $I1, $S1
.annotate 'line', 2842
    .return($I1)
# }
.annotate 'line', 2843

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2846
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2847
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2848
    ne $I1, 0, __label_2
.annotate 'line', 2849
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2851
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2853

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2856
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2857

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 2819
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2821
    addattribute $P0, 'pos'
.annotate 'line', 2822
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2867
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2868
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2869

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2870
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2871
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2874
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2875
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2876
    assign $P1, $S1
.annotate 'line', 2877
    .return($P1)
# }
.annotate 'line', 2878

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2881
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2882
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2883
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2885

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2890
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2891
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2892
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2893
    .return($S1)
# }
.annotate 'line', 2894

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 2862
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2864
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2903
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2906
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2907
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2908

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2911
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2912

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2915
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2916
    if_null $P1, __label_1
.annotate 'line', 2917
    .tailcall $P1.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2919
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2922
    .return('P')
  __label_4: # default
.annotate 'line', 2924
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2927

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2930
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2931
    .return($S1)
# }
.annotate 'line', 2932

.end # getName


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2935
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2936
    unless_null $P1, __label_1
.annotate 'line', 2937
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 2938
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2939
# s: $S1
    null $S1
.annotate 'line', 2940
    unless_null $P2, __label_2
# {
.annotate 'line', 2941
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
# switch
.annotate 'line', 2942
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_7
    set $S4, 'null'
    if $S3 == $S4 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 2944
    set $S1, 'self'
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 2946
    set $S1, 'null'
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2948
    set $S1, ''
  __label_5: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 2952
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 2953
    .return($S1)
# }
.annotate 'line', 2954

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2957
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2958
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 2959
    getattribute $P2, self, 'name'
    WSubId_59($P2)
  __label_1: # endif
.annotate 'line', 2960
    .return($P1)
# }
.annotate 'line', 2961

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2964
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2965
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 2966
    if_null $P2, __label_1
# {
.annotate 'line', 2967
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2968
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 2969
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 2970
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2971
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 2972
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 2979
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 2980
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 2981
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
.annotate 'line', 2985
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'findsymbol'($P5)
.annotate 'line', 2986
    if_null $P4, __label_9
# {
.annotate 'line', 2987
# id: $S1
    $P5 = $P4.'makesubid'()
    null $S1
    if_null $P5, __label_10
    set $S1, $P5
  __label_10:
.annotate 'line', 2988
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 2989
    self.'usesubid'($S1)
.annotate 'line', 2990
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 2993
    .return(self)
# }
.annotate 'line', 2994

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2997
# id: $S1
    null $S1
.annotate 'line', 2998
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 2999
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3001
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3002
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3003
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3004
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3005
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3006
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3007
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3008
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3012
    .return($S1)
# }
.annotate 'line', 3013

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3016
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3017
    self.'annotate'(__ARG_1)
.annotate 'line', 3018
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3019
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3021

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3024
    self.'annotate'(__ARG_1)
.annotate 'line', 3025
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3026

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3029
    self.'annotate'(__ARG_1)
.annotate 'line', 3030
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# predefined die
.annotate 'line', 3031
    die "NO"
  __label_1: # endif
.annotate 'line', 3032
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3033
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3034
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3035
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3038
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3041
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3044
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3045
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3047
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3048
    ne $S3, 'v', __label_13
.annotate 'line', 3049
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3050
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3051
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3054
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3055
    self.'annotate'(__ARG_1)
.annotate 'line', 3056
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3057
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3059
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3062
    .return($S2)
# }
.annotate 'line', 3063

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 2899
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2901
    addattribute $P0, 'name'
.annotate 'line', 2902
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3073
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3074
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3075

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3076
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3079
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3080
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3081
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3082
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3083
    .return($S2)
# }
.annotate 'line', 3084

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3087
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3088
    self.'annotate'(__ARG_1)
.annotate 'line', 3089
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3090
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3092

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3095
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
# switch-case
.annotate 'line', 3097
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3100
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3098
    __ARG_1.'emitnull'($S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3101
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3104
# typeright: $S2
    $P2 = __ARG_2.'checkresult'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 3105
    ne 'P', $S2, __label_7
.annotate 'line', 3106
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3108
# rreg: $S3
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 3109
    self.'annotate'(__ARG_1)
.annotate 'line', 3110
    __ARG_1.'emitbox'($S1, $S3)
# }
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 3114
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3115
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
.annotate 'line', 3116
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 3117

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3068
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3070
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3126
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3127

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3122
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
.annotate 'line', 3138
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3139
    $P2 = WSubId_60(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3140

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3141
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3144
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3147
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3148
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3149
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3150
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3151
    __ARG_1.'say'()
# }
.annotate 'line', 3152

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3132
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3134
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3162
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3163
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3164

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3167
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3168

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3171
    self.'optimizearg'()
.annotate 'line', 3172
    .return(self)
# }
.annotate 'line', 3173

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3157
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3159
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
.annotate 'line', 3184
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3185
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3186
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3187

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3190
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3191
    .return(self)
# }
.annotate 'line', 3192

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3195
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3196

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3199
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3200
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3201

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3204
    self.'optimizearg'()
.annotate 'line', 3205
    .return(self)
# }
.annotate 'line', 3206

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3209
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3210

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3213
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3214

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3178
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3180
    addattribute $P0, 'lexpr'
.annotate 'line', 3181
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3223
    .return('I')
# }
.annotate 'line', 3224

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3227
    self.'optimizearg'()
.annotate 'line', 3228
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3229
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3230
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3231
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3232
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3233
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3235
    .return(self)
# }
.annotate 'line', 3236

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3219
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3245
    .return('I')
# }
.annotate 'line', 3246

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3241
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
.annotate 'line', 3254
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3255

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3258
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3259
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3260
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3261
    self.'annotate'(__ARG_1)
.annotate 'line', 3262
    __ARG_1.'print'('    delete ')
.annotate 'line', 3263
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3264
    __ARG_1.'say'()
.annotate 'line', 3265
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3266
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3269
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3270

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3250
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
.annotate 'line', 3277
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3278

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3281
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3282
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
.annotate 'line', 3283
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3284
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3285
    self.'annotate'(__ARG_1)
.annotate 'line', 3286
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3287
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3288
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3291
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3292

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3273
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
.annotate 'line', 3301
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3302

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3305
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3306

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3309
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3310
    .return(self)
# }
.annotate 'line', 3311

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 3314
    self.'optimizearg'()
.annotate 'line', 3315
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3316
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3317
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3318
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3321
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3322
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3323
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3324
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall WSubId_61($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3327
    .return(self)
# }
.annotate 'line', 3328

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3331
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3332
    self.'annotate'(__ARG_1)
.annotate 'line', 3333
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3334

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3297
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
.annotate 'line', 3343
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3344

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3345
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3348
    .return('I')
# }
.annotate 'line', 3349

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3352
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3353
    .return(self)
# }
.annotate 'line', 3354

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3357
    self.'optimizearg'()
.annotate 'line', 3358
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3359
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3360
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3361
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3362
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
.annotate 'line', 3364
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3365
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3366
    .return(self)
# }
.annotate 'line', 3367

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3370
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3371

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3374
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3375
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3376
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3377
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3379
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3382
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3385
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3387

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3339
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3396
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3397

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3392
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3406
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3407
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3408
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3409

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3402
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
.annotate 'line', 3416
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3417

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3420
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3421
    self.'annotate'(__ARG_1)
.annotate 'line', 3422
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3423
    .return($S1)
# }
.annotate 'line', 3424

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3412
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
.annotate 'line', 3431
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3432

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3435
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3436
    self.'annotate'(__ARG_1)
.annotate 'line', 3437
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3438
    .return($S1)
# }
.annotate 'line', 3439

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3427
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
.annotate 'line', 3448
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3449

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3452
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3453
    self.'annotate'(__ARG_1)
.annotate 'line', 3454
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3455
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3456
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3457
    .return($S1)
# }
.annotate 'line', 3458

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3444
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
.annotate 'line', 3465
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3466

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3469
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3470
    self.'annotate'(__ARG_1)
.annotate 'line', 3471
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3472
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3473
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3474
    .return($S1)
# }
.annotate 'line', 3475

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3461
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
.annotate 'line', 3486
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3487
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3488
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3489
    .return(self)
# }
.annotate 'line', 3490

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3493
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3494

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3497
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3498
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3499
    .return(self)
# }
.annotate 'line', 3500

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3503
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3504

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3507
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3508
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3509
    self.'annotate'(__ARG_1)
.annotate 'line', 3510
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3512

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3480
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3482
    addattribute $P0, 'lexpr'
.annotate 'line', 3483
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3521
    self.'annotate'(__ARG_1)
.annotate 'line', 3522
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3523
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3524

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3517
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3533
    self.'annotate'(__ARG_1)
.annotate 'line', 3534
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3535
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3536
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3537

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3540
    self.'annotate'(__ARG_1)
.annotate 'line', 3541
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3542
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3543
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3544
    .return($S1)
# }
.annotate 'line', 3545

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3529
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3554
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3555
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3556
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3557
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3558
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3559
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3560
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3562
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3563
# aux: $S5
    null $S5
.annotate 'line', 3564
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3565
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3567
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3568
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3569
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3570
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3572
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3576
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3577
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3578
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3579
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3581
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3584
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3587
    .return($S3)
# }
.annotate 'line', 3588

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3550
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3597
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3598
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3599
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3600
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3601
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3602
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3603
# aux: $S5
    null $S5
.annotate 'line', 3604
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3605
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3607
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3610
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3611
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3612
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3613
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3615
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3618
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3620
    .return($S3)
# }
.annotate 'line', 3621

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3593
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3630
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3631
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3632
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3633
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3634
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3636
    ne $S2, 'I', __label_7
.annotate 'line', 3637
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3639
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3640
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3642
    self.'annotate'(__ARG_1)
.annotate 'line', 3643
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3646
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3647
    self.'annotate'(__ARG_1)
.annotate 'line', 3648
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3650
    .return($S3)
# }
.annotate 'line', 3651

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3626
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3660
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3661
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3662
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3663
    self.'annotate'(__ARG_1)
.annotate 'line', 3664
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3665
    .return($S2)
# }
.annotate 'line', 3666

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3656
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3675
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3676
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3677
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3678
    self.'annotate'(__ARG_1)
.annotate 'line', 3679
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3680
    .return($S2)
# }
.annotate 'line', 3681

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3671
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3688
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3691
    self.'optimizearg'()
.annotate 'line', 3692
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3693
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3694
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3695
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3696
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3697
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3699
    .return(self)
# }
.annotate 'line', 3700

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3703
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3704
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3705
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3706
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3707
    self.'annotate'(__ARG_1)
.annotate 'line', 3708
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3710
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3715
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3720
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3725
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3730
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3735
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3711
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3712
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3713
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3716
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3717
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3718
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3721
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3722
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3723
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3726
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3727
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3728
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3731
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3732
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3733
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3736
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3737
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3738
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3739
# switch
.annotate 'line', 3742
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3744
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3747
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3750
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3751
# }
.annotate 'line', 3753

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3756
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3757

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3760
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3761

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3764
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3765

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3686
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
.annotate 'line', 3780
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3781
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3782
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3783

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3784
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3785
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3788
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3789
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3790
    .return(self)
# }
.annotate 'line', 3791

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3794
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3795
    self.'annotate'(__ARG_1)
.annotate 'line', 3796
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3797
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3798
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3799

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3802
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3803
    self.'annotate'(__ARG_1)
.annotate 'line', 3804
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
.annotate 'line', 3805

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 3773
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3775
    addattribute $P0, 'expr'
.annotate 'line', 3776
    addattribute $P0, 'checknull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3812
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3815
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3816

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3819
    self.'optimizearg'()
.annotate 'line', 3820
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3821
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3822
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3823
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3824
    unless $I1 goto __label_1
# {
.annotate 'line', 3825
    unless $I2 goto __label_2
.annotate 'line', 3826
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3828
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3830
    unless $I2 goto __label_4
.annotate 'line', 3831
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3832
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3833
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3834
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3835
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3836
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3838
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3839
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3840
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3842
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3843
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3844
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
.annotate 'line', 3848
    .return(self)
# }
.annotate 'line', 3849

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3852
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3853

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3856
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3857

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3860
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3861

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3864
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3865

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 3810
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3872
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3875
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3876

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3879
    self.'optimizearg'()
.annotate 'line', 3880
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3881
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3882
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3883
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3884
    unless $I1 goto __label_1
# {
.annotate 'line', 3885
    unless $I2 goto __label_2
.annotate 'line', 3886
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3888
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3890
    unless $I2 goto __label_4
.annotate 'line', 3891
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3892
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3893
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3894
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3895
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3896
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3898
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3899
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3900
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3902
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3903
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3904
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
.annotate 'line', 3908
    .return(self)
# }
.annotate 'line', 3909

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3912
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3913

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3916
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3917

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3920
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3921

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3924
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3925

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 3870
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
.annotate 'line', 3935
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3936
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3937

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3938
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3941
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3942
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
.annotate 'line', 3943

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3946
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
.annotate 'line', 3947

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3950
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3951
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 3952
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3953

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3956
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3957

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3960
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3961
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 3962
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3963

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3966
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3967
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 3968
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3969

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 3930
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3932
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3976
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3979
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3980

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3983
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3984

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3987
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3988

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3991
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
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
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3996

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 3974
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4003
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4006
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4007

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4010
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4011

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4014
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4015

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4018
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4019

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4022
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4023

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4001
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4030
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4033
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4034

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4037
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4038

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4041
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4042

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4045
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4046

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4049
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4050

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4028
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4057
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4060
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4061

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4064
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4065

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4068
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4069

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4072
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4073

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4076
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4077

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4055
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4086
    .return('I')
# }
.annotate 'line', 4087

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4082
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
.annotate 'line', 4096
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4097

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4100
    self.'optimizearg'()
.annotate 'line', 4101
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4102
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4103
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4104
    eq $I1, 0, __label_2
.annotate 'line', 4105
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4107
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4109
    .return(self)
# }
.annotate 'line', 4110

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4113
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
.annotate 'line', 4114
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4115
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4116
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4117
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4120
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4121
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4122
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4123
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4124
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4126

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4092
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
.annotate 'line', 4135
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4136

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4139
    self.'optimizearg'()
.annotate 'line', 4140
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4141
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4142
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4143
    ne $I1, 0, __label_2
.annotate 'line', 4144
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4146
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4148
    .return(self)
# }
.annotate 'line', 4149

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4152
# res: $S1
    null $S1
.annotate 'line', 4153
    if_null __ARG_2, __label_1
.annotate 'line', 4154
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4156
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4157
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4158
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4159
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4160
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4163
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4164
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4165
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4166
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4167
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4169

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4131
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4174
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
.annotate 'line', 4184
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4185

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4188
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
.annotate 'line', 4189
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4190
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4191
    self.'annotate'(__ARG_1)
.annotate 'line', 4192
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4193

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4196
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4197

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4180
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
.annotate 'line', 4206
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4207

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4210
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
.annotate 'line', 4211
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4212
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4213
    self.'annotate'(__ARG_1)
.annotate 'line', 4214
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4215

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4218
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4219

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4202
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
.annotate 'line', 4228
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4229

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4232
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
.annotate 'line', 4233
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4234
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4235
    self.'annotate'(__ARG_1)
.annotate 'line', 4236
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4237

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4240
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4241

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4224
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
.annotate 'line', 4251
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4253
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4260
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4254
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4255
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4256
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4258
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4261
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4262
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4265
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4267

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4268
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4271
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4272
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4273
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4274
# i: $I2
    null $I2
# for loop
.annotate 'line', 4275
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4276
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4275
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4277
    .return($P2)
# }
.annotate 'line', 4278

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4281
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4282
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4283
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4284
    self.'annotate'(__ARG_1)
.annotate 'line', 4285
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4286
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4287
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4286
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4288
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4289

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4292
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4293
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4294
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4295
    self.'annotate'(__ARG_1)
.annotate 'line', 4296
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4297
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4298
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4297
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4299
    .return($S1)
# }
.annotate 'line', 4300

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4303
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4304
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4305
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4306
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4307
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4306
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4308

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4311
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4312
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4313
    self.'annotate'(__ARG_1)
.annotate 'line', 4314
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4315
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4316
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4315
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4317

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4246
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4248
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
.annotate 'line', 4326
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4327

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4330
    self.'optimizearg'()
.annotate 'line', 4331
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4332
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4333
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4334
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4335
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4336
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4341
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4342
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4343
# var t: $P5
    isa $I3, $P3, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    unless $I3 goto __label_9
.annotate 'line', 4344
    isa $I3, $P4, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4346
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4347
    getattribute $P13, $P3, 'str'
.annotate 'line', 4343
    set $S3, $P13
# predefined string
.annotate 'line', 4347
    getattribute $P14, $P4, 'str'
.annotate 'line', 4343
    set $S4, $P14
.annotate 'line', 4347
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4349
    new $P15, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4350
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4343
    set $S6, $P18
# predefined string
.annotate 'line', 4350
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4343
    set $S7, $P19
.annotate 'line', 4350
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4351
    new $P11, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4353
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4354
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4355
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4356
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4357
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4358
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4361
    $P10 = WSubId_62($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4362
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4363
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4364
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4365
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4366
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_61($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4370
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4371
    new $P11, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4373
    .return(self)
# }
.annotate 'line', 4374

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_62 = "WSubId_62"
# Body
# {
.annotate 'line', 4377
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4378
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4379
    ne $S1, $S2, __label_3
.annotate 'line', 4380
    .return($S1)
  __label_3: # endif
.annotate 'line', 4381
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4382
    .return('S')
  __label_4: # endif
.annotate 'line', 4383
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4384
    .return('S')
  __label_6: # endif
.annotate 'line', 4385
    $P1 = WSubId_62($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4386
    .return('N')
  __label_8: # endif
.annotate 'line', 4387
    .return('I')
# }
.annotate 'line', 4388

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4391
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4392
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4393
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4394
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4395
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4397
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4398
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4399
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4400
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4401
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4402
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4403
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4404
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4407
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4408
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4411
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4414
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4415
# l: $S7
    null $S7
.annotate 'line', 4416
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4418
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4419
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4421
# r: $S8
    null $S8
.annotate 'line', 4422
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4424
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4425
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4427
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4430
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4432

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4322
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
.annotate 'line', 4441
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4442

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4445
    self.'optimizearg'()
.annotate 'line', 4446
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4447
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4448
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4449
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4450
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4451
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4452
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4453
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4454
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4455
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4456
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P5, $P6, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4459
    .return(self)
# }
.annotate 'line', 4460

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4463
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4464
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4465
    ne $S1, $S2, __label_3
.annotate 'line', 4466
    .return($S1)
  __label_3: # endif
.annotate 'line', 4467
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4468
    .return('N')
  __label_4: # endif
.annotate 'line', 4469
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4470
    .return('N')
  __label_6: # endif
.annotate 'line', 4471
    .return('I')
# }
.annotate 'line', 4472

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4475
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4476
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4477
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4478

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4437
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
.annotate 'line', 4487
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4488

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4491
    self.'optimizearg'()
.annotate 'line', 4492
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4493
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4494
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4495
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4496
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4497
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4498
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4499
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4500
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4501
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4502
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P7, $P8, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4505
    $P7 = WSubId_62($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4506
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4507
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4508
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4509
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4510
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_61($P7, $P8, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4514
    .return(self)
# }
.annotate 'line', 4515

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4518
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4519
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4520
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4521
    ne $S1, $S2, __label_3
.annotate 'line', 4522
    .return($S1)
  __label_3: # endif
.annotate 'line', 4523
    ne $S1, 'S', __label_4
.annotate 'line', 4524
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4526
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4527

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4530
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4531
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4532
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4533
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4534
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4535
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4536
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4537
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4538
# rval: $S5
    null $S5
# switch
.annotate 'line', 4539
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4541
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4544
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4545
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4547
    self.'annotate'(__ARG_1)
.annotate 'line', 4548
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4549
    .return()
# }
  __label_3: # endif
.annotate 'line', 4551
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
.annotate 'line', 4552
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4553
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4554
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4555
    .return()
# }
  __label_7: # endif
.annotate 'line', 4560
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4561
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4562
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4563
# rval: $S6
    null $S6
# switch
.annotate 'line', 4564
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4566
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4567
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4568
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4571
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4574
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4575
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4577
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4578
    self.'annotate'(__ARG_1)
.annotate 'line', 4579
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4581
    .return()
# }
  __label_11: # endif
.annotate 'line', 4584
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4585
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4586
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4587
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4590
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4591
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4593
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4594
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4595
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4598
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4600
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4601
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4604
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4608
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4609
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4610
# }
  __label_21: # endif
.annotate 'line', 4613
    self.'annotate'(__ARG_1)
.annotate 'line', 4614
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4615
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4616
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4617

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4483
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
.annotate 'line', 4626
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4627

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 4630
    self.'optimizearg'()
.annotate 'line', 4631
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4632
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4633
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4634
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4635
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4636
# var lval: $P3
    null $P3
.annotate 'line', 4637
# var rval: $P4
    null $P4
.annotate 'line', 4638
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4639
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4640
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4641
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4642
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4643
    eq $I2, 0, __label_7
.annotate 'line', 4644
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
.annotate 'line', 4647
    $P5 = WSubId_62($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4648
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4649
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4650
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4651
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4652
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4653
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
.annotate 'line', 4657
    .return(self)
# }
.annotate 'line', 4658

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4661
    .return('N')
# }
.annotate 'line', 4662

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4665
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4666
# var aux: $P2
    null $P2
.annotate 'line', 4667
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4668
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4669
    $P2 = self.'tempreg'('N')
.annotate 'line', 4670
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4671
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4673
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4674
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4675
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4676
    $P2 = self.'tempreg'('N')
.annotate 'line', 4677
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4678
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4680
    self.'annotate'(__ARG_1)
.annotate 'line', 4681
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4682

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4622
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
.annotate 'line', 4691
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4692

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4695
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4696
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4697
    self.'annotate'(__ARG_1)
.annotate 'line', 4698
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4699

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4702
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4703

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4687
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
.annotate 'line', 4712
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4713

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4716
    .return('I')
# }
.annotate 'line', 4717

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4720
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4721
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4722
    self.'annotate'(__ARG_1)
.annotate 'line', 4727
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4728

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 4708
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
.annotate 'line', 4737
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4738

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4741
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
.annotate 'line', 4742
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4743
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4744
    self.'annotate'(__ARG_1)
.annotate 'line', 4745
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4746

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4749
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4750

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 4733
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
.annotate 'line', 4759
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4760

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4763
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
.annotate 'line', 4764
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4765
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4766
    self.'annotate'(__ARG_1)
.annotate 'line', 4767
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4768

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4771
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4772

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 4755
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4781
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4782

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4785
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4786
# setname: $S1
    set $S1, ''
.annotate 'line', 4787
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4788
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4790
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4793
    set $I2, 1
# switch
.annotate 'line', 4794
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
.annotate 'line', 4798
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4799
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 4800
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 4801
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4804
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4809
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4812
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4815
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4810
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4813
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4816
    __ARG_1.'print'(' :named')
.annotate 'line', 4817
    eq $S1, '', __label_17
.annotate 'line', 4818
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4819
# }
.annotate 'line', 4821

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 4777
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4830
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4831
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4832

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4835
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4836
    .return(self)
# }
.annotate 'line', 4837

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4840
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4841

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 4826
    addattribute $P0, 'arg'
.annotate 'line', 4827
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
.annotate 'line', 4846
# var modifier: $P1
    null $P1
.annotate 'line', 4847
# var expr: $P2
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 4848
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4849
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4850
    $P3 = __ARG_1.'get'()
.annotate 'line', 4851
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 4852
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 4855
    WSubId_40('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4858
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4859
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4860

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
.annotate 'line', 4871
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4872
    setattribute self, 'start', __ARG_2
.annotate 'line', 4873
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4874
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4875
    __ARG_3.'unget'($P1)
.annotate 'line', 4876
    $P3 = WSubId_36(__ARG_3, __ARG_1, WSubId_63, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 4878

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4881
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4882
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4880
    elements $I1, $P1
  __label_1:
.annotate 'line', 4882
    .return($I1)
# }
.annotate 'line', 4883

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4886
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4887

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4890
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4891
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4892

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4895
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4896
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4897

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 4900
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 4901
    .return(self)
# }
.annotate 'line', 4902

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4905
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4906
    unless_null $P1, __label_1
# {
.annotate 'line', 4907
    new $P2, ['ResizableStringArray']
.annotate 'line', 4908
# pnull: $S1
    set $S1, ''
.annotate 'line', 4909
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4910
    if_null $P3, __label_2
# {
.annotate 'line', 4911
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4912
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4913
# reg: $S2
    null $S2
.annotate 'line', 4914
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4915
    ne $S1, '', __label_7
# {
.annotate 'line', 4916
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4917
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4919
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4922
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4923
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4926
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4928
    .return($P1)
# }
.annotate 'line', 4929

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4932
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4933
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4935
# sep: $S1
    set $S1, ''
.annotate 'line', 4936
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4937
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4938
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4939
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4940
    if_null $P3, __label_4
.annotate 'line', 4941
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 4942
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 4937
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4944

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 4864
    addattribute $P0, 'owner'
.annotate 'line', 4865
    addattribute $P0, 'start'
.annotate 'line', 4866
    addattribute $P0, 'args'
.annotate 'line', 4867
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_64')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4949
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 4950
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 4951
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 4952
    .return(1)
# }
.annotate 'line', 4953

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4964
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4965
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4966
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4967

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4970
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4971

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4974
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4975
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4976
    new $P3, ['ResizableStringArray']
.annotate 'line', 4977
# var arg: $P4
    null $P4
.annotate 'line', 4978
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 4979
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4981
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 4982
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 4984
    ne $S2, 'null', __label_8
# {
.annotate 'line', 4985
    ne $S1, '', __label_9
# {
.annotate 'line', 4986
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4987
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 4989
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 4991
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4995
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4996
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 4997
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 4998
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4999
    .return()
  __label_2: # default
.annotate 'line', 5001
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5002
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5003
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5004
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5005
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5006
# argr: $S5
    null $S5
.annotate 'line', 5007
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5008
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
.annotate 'line', 5012
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5013
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5016
    ne $S1, '', __label_24
# {
.annotate 'line', 5017
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5018
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5020
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5024
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5025
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5027
# aux: $S6
    null $S6
.annotate 'line', 5028
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5029
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
.annotate 'line', 5031
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
.annotate 'line', 5035
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5036
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 5039
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 5045
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5046
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 5049
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5053
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5002
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5056
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5057

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 4957
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4959
    addattribute $P0, 'predef'
.annotate 'line', 4960
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
.annotate 'line', 5064
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5065
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5066
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 5067
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 5070
    isa $I2, __ARG_2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 5071
    $P3 = WSubId_64($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5072
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 5073
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 5077
    new $P4, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P5, $P6, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 5078

.end # genpredefcallexpr

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5087
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5088
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5089
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5090
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5091
    __ARG_1.'unget'($P1)
.annotate 'line', 5092
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5094

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5095
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_65 = "WSubId_65"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5098
# var funref: $P1
    getattribute $P4, self, 'funref'
    $P1 = $P4.'optimize'()
.annotate 'line', 5099
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5100
# nargs: $I1
    null $I1
.annotate 'line', 5101
    if_null $P2, __label_1
# {
.annotate 'line', 5102
    $P2 = $P2.'optimize'()
.annotate 'line', 5103
    $P4 = $P2.'numargs'()
    set $I1, $P4
# }
  __label_1: # endif
.annotate 'line', 5106
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5107
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P5.'CallMemberExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 5108
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5109
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P5.'CallMemberRefExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_3: # endif
.annotate 'line', 5112
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 5113
# callname: $S1
    $P5 = $P1.'getName'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 5114
# var predef: $P3
    $P3 = WSubId_65($S1, $I1)
.annotate 'line', 5115
    if_null $P3, __label_6
.annotate 'line', 5116
    getattribute $P4, self, 'owner'
    .tailcall WSubId_66($P4, $P3, $P2)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 5119
    setattribute self, 'funref', $P1
.annotate 'line', 5120
    setattribute self, 'args', $P2
.annotate 'line', 5121
    .return(self)
# }
.annotate 'line', 5122

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5125
    .return(1)
# }
.annotate 'line', 5126

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5129
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5130
# call: $S1
    null $S1
.annotate 'line', 5132
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P2, $P1, 'subid'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5133
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 5134
    ne $S1, '', __label_4
.annotate 'line', 5135
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "'"
    push $P2, $P3
    $P4 = $P1.'getName'()
    push $P2, $P4
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S1, "", $P2
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5138
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 5139
    .return($S1)
# }
.annotate 'line', 5140

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5143
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5144
    if_null $P1, __label_1
.annotate 'line', 5145
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5146

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5149
    __ARG_1.'print'('(')
.annotate 'line', 5150
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5151
    if_null $P1, __label_1
.annotate 'line', 5152
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5153
    __ARG_1.'say'(')')
# }
.annotate 'line', 5154

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5157
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5158
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5160
    self.'annotate'(__ARG_1)
.annotate 'line', 5162
    __ARG_1.'print'('    ')
.annotate 'line', 5163
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5164
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5165
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5167
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5170
    __ARG_1.'print'($S1)
.annotate 'line', 5171
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5172

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5080
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5082
    addattribute $P0, 'funref'
.annotate 'line', 5083
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5185
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5186
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5187
    setattribute self, 'args', __ARG_3
.annotate 'line', 5192
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5193
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5194
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5195
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5196
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5197
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5198
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5199
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5200
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5201
    if_null $P4, __label_6
# {
.annotate 'line', 5202
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
.annotate 'line', 5203
    getattribute $P5, self, 'subid'
    self.'usesubid'($P5)
# }
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
.annotate 'line', 5207

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5210
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 5211
    getattribute $P3, self, 'subid'
    .return($P3)
  __label_1: # endif
.annotate 'line', 5212
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5213
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5214
    $P5 = $P1.'get_member'()
.annotate 'line', 5213
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
.annotate 'line', 5209
    join $S1, "", $P2
.annotate 'line', 5213
    .return($S1)
# }
.annotate 'line', 5215

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5180
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5182
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5225
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5226
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5227
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5228

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5231
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5232
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5233
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5234
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5235
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5238
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5239
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5240
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5241

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5221
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
.annotate 'line', 5251
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5252
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5253

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5256
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5257
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5258
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5259
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5260
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5261
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5262
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5264
    .return($S2)
# }
.annotate 'line', 5265

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5246
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5248
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
.annotate 'line', 5274
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5275
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5276

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5277
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5280
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5281
    .return(self)
# }
.annotate 'line', 5282

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5285
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5286
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5287
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5289
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5290
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5291

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5294
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5295

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5298
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5299
    self.'annotate'(__ARG_1)
.annotate 'line', 5300
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5301

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5304
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5305
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5306
    .return($S1)
# }
.annotate 'line', 5307

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5310
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5311
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5312
    self.'annotate'(__ARG_1)
.annotate 'line', 5313
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5314

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5317
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5318

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5321
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5322
# value: $S2
    null $S2
.annotate 'line', 5323
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5325
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5326
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5327
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5329
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5332
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5333
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5335
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5336

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5339
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5340
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5341
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5342
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5344
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5345
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5346
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5348
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5350
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5351
    .return($S2)
# }
.annotate 'line', 5352

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5268
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5270
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
.annotate 'line', 5362
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5363
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5364

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5365
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5368
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5369
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5370
    .return(self)
# }
.annotate 'line', 5371

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5374
    WSubId_1('Member reference can be used only for method calls', self)
# }
.annotate 'line', 5376

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5357
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5359
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
.annotate 'line', 5390
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5391
    setattribute self, 'left', __ARG_4
.annotate 'line', 5392
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5393

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5396
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5397
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5399
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5400

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5403
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5404
    setattribute self, 'left', $P1
.annotate 'line', 5405
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5406
    $P2.'optimizeargs'()
.annotate 'line', 5410
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5411
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5412
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5413
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5414
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5415
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5416
# predefined substr
.annotate 'line', 5415
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5417
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5420
    .return(self)
# }
.annotate 'line', 5421

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5424
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5425
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5426
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5427
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5428
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5429
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5427
    setattribute self, 'regleft', $P3
.annotate 'line', 5430
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5431

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5434
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5435
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5436
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5437
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5438
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5439
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5440
    __ARG_1.'print'(']')
# }
.annotate 'line', 5441

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5444
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5445
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5446
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5447
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5448
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5449
    eq $I1, 1, __label_4
.annotate 'line', 5450
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5451
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5452
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5453
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5456
    self.'annotate'(__ARG_1)
.annotate 'line', 5457
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5458
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5459
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5461

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5464
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5465
    self.'annotate'(__ARG_1)
.annotate 'line', 5466
    __ARG_1.'print'('    ')
.annotate 'line', 5467
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5468
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5469

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5472
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5473
# rreg: $S1
    null $S1
.annotate 'line', 5474
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5475
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5476
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5479
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5480
    self.'annotate'(__ARG_1)
.annotate 'line', 5481
    __ARG_1.'print'('    ')
.annotate 'line', 5482
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5483
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5484
    .return($S1)
# }
.annotate 'line', 5485

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5381
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5383
    addattribute $P0, 'left'
.annotate 'line', 5384
    addattribute $P0, 'regleft'
.annotate 'line', 5385
    addattribute $P0, 'args'
.annotate 'line', 5386
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
.annotate 'line', 5496
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5497
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5498
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5499
    __ARG_1.'unget'($P1)
.annotate 'line', 5500
    $P3 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5502

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5503
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5506
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5507
    .return(self)
# }
.annotate 'line', 5508

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5511
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5512
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5513
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5519
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5521

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5524
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5525
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5526
    .return($S1)
# }
.annotate 'line', 5527

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5530
    self.'annotate'(__ARG_1)
.annotate 'line', 5531
# itemreg: $S1
    null $S1
.annotate 'line', 5532
# it_p: $S2
    null $S2
.annotate 'line', 5533
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5534
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5535
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5537
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5538
    if_null $P1, __label_2
# {
.annotate 'line', 5539
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5540
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
.annotate 'line', 5542
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5543
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5544
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5545
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5549
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5550
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5551
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5552
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5556
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5558
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5559
    self.'annotate'(__ARG_1)
.annotate 'line', 5560
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5564

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5490
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5492
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
.annotate 'line', 5576
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5577
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5578
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5579
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5580
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5581
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5582
# {
.annotate 'line', 5583
# var key: $P4
    $P4 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5584
    WSubId_54(':', __ARG_1)
.annotate 'line', 5585
# var value: $P5
    $P5 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5586
# predefined push
    push $P2, $P4
.annotate 'line', 5587
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5589
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5590
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5591
    WSubId_40("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5593
    setattribute self, 'keys', $P2
.annotate 'line', 5594
    setattribute self, 'values', $P3
# }
.annotate 'line', 5595

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5596
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 5599
    getattribute $P1, self, 'keys'
    WSubId_38($P1)
.annotate 'line', 5600
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5601
    .return(self)
# }
.annotate 'line', 5602

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5605
    self.'annotate'(__ARG_1)
.annotate 'line', 5610
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5611
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5613
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5614
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5615
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5616
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5617
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5618
# item: $S1
    null $S1
.annotate 'line', 5619
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5620
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5621
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5622
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5625
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5627
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5628
# itemreg: $S3
    null $S3
.annotate 'line', 5629
# it_p: $S4
    null $S4
.annotate 'line', 5630
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 5631
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 5632
# aux: $S5
    null $S5
# switch
.annotate 'line', 5633
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
.annotate 'line', 5635
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 5636
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 5637
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 5638
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 5642
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 5643
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 5644
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5645
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 5649
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 5651
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 5652
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5616
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5654

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5657
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5658
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5659
    .return($S1)
# }
.annotate 'line', 5660

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5569
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5571
    addattribute $P0, 'keys'
.annotate 'line', 5572
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5673
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5678
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5679

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5682
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5683
    if_null $P1, __label_1
.annotate 'line', 5684
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5685

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5688
    self.'optimize_initializer'()
.annotate 'line', 5689
    .return(self)
# }
.annotate 'line', 5690

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5693
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5694
    if_null $P1, __label_1
.annotate 'line', 5695
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5696
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5697
    if_null $P1, __label_2
.annotate 'line', 5698
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5699
    __ARG_1.'say'(")")
# }
.annotate 'line', 5700

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 5665
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5667
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
.annotate 'line', 5711
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5713
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 5714
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5715
    setattribute self, 'value', __ARG_4
.annotate 'line', 5716
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5718
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 5719
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5721
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5722

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5725
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5726
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5729
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5730
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5731
    $P1 = $P2.'getvalue'()
.annotate 'line', 5732
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 5733
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5734
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5737
    self.'optimize_initializer'()
.annotate 'line', 5738
    .return(self)
# }
.annotate 'line', 5739

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
.annotate 'line', 5742
    self.'annotate'(__ARG_1)
.annotate 'line', 5744
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5745
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5748
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5749
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
.annotate 'line', 5751
# reginit: $S1
    set $S1, ''
.annotate 'line', 5752
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5753
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5754
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
.annotate 'line', 5759
    ne $I2, 1, __label_13
# {
.annotate 'line', 5760
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5761
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5764
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5765
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5766
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5770
    eq $I2, 1, __label_16
.annotate 'line', 5771
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 5772
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5773
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5776
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5779
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5780
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5781
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 5782
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_67($S5, $P8)
  __label_23: # endif
.annotate 'line', 5786
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5787
    le $I1, 1, __label_25
# {
.annotate 'line', 5788
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5792
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5793
    unless_null $P4, __label_26
# {
.annotate 'line', 5795
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5796
    if_null $P5, __label_28
# {
.annotate 'line', 5797
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5800
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.annotate 'line', 5801
    WSubId_67('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5802
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5804
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5808
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5812
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5814
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5815
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5816
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5817
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5819

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5822
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5823

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 5705
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5707
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5834
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5835
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5836
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5837
    setattribute self, 'nskey', $P1
.annotate 'line', 5838
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5839
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5840
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5842
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5843

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5846
# reginit: $S1
    null $S1
.annotate 'line', 5847
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5848
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5849
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5853
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5854
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5857
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 5859
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5860
    __ARG_1.'print'('    ')
.annotate 'line', 5861
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5862
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5863
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5864
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5865
    if_null $S1, __label_8
.annotate 'line', 5866
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5867
    __ARG_1.'say'()
# }
.annotate 'line', 5868

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 5828
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5830
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5879
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5880
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5881
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5882
    setattribute self, 'nskey', $P1
.annotate 'line', 5883
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5884
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5885
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5887
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5888

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5891
# reginit: $S1
    null $S1
.annotate 'line', 5892
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5894
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 5895
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5896
    le $I1, 0, __label_4
.annotate 'line', 5897
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 5898
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5899
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5900
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5901
    __ARG_1.'say'()
.annotate 'line', 5903
    lt $I1, 0, __label_5
# {
.annotate 'line', 5904
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5905
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5906
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 5908

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 5873
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5875
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5915
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5918
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 5922
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 5925
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 5920
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5921
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5920
    .return($P3)
  __label_4: # case
.annotate 'line', 5924
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 5928
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5929
    __ARG_1.'unget'($P2)
.annotate 'line', 5930
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 5932
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 5937
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 5939

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
.annotate 'line', 5950
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5951
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5952
    $P2 = WSubId_60(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5953

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5956
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5957
    .return(self)
# }
.annotate 'line', 5958

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5959
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5962
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5963
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5964
    eq $S1, 'P', __label_2
.annotate 'line', 5965
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 5966
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 5968
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
.annotate 'line', 5969
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5970
    self.'annotate'(__ARG_1)
.annotate 'line', 5971
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 5972
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5973
    __ARG_1.'say'()
# }
.annotate 'line', 5974

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 5943
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5945
    addattribute $P0, 'lexpr'
.annotate 'line', 5946
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
.annotate 'line', 5991
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5992
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5993
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5994
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5995
    .return(self)
# }
.annotate 'line', 5996

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5999
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6000
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6002
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6004
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6006
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6007
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6008
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6010

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6013
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6014
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6015
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6017
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6018

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6021
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6022
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6023
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6024
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6025
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6026
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6027
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6029
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6030
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6031
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6032
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6033
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6034
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6036
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6037
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6038
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6039
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6042
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6044
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6045

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 5979
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5985
    addattribute $P0, 'condition'
.annotate 'line', 5986
    addattribute $P0, 'etrue'
.annotate 'line', 5987
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
.annotate 'line', 6089
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
.annotate 'line', 6090
    .return(1)
  __label_4: # case
.annotate 'line', 6091
    .return(2)
  __label_5: # case
.annotate 'line', 6092
    .return(3)
  __label_2: # default
.annotate 'line', 6093
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6095

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_72')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6099
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
.annotate 'line', 6100
    .return(8)
  __label_4: # case
.annotate 'line', 6101
    .return(11)
  __label_5: # case
.annotate 'line', 6102
    .return(9)
  __label_6: # case
.annotate 'line', 6103
    .return(10)
  __label_2: # default
.annotate 'line', 6105
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6106
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6107
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6109

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6113
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
.annotate 'line', 6114
    .return(19)
  __label_4: # case
.annotate 'line', 6115
    .return(20)
  __label_5: # case
.annotate 'line', 6116
    .return(21)
  __label_6: # case
.annotate 'line', 6117
    .return(22)
  __label_2: # default
.annotate 'line', 6118
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6120

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6124
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6125
    .return(28)
  __label_4: # case
.annotate 'line', 6126
    .return(29)
  __label_2: # default
.annotate 'line', 6127
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6129

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6133
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
.annotate 'line', 6134
    .return(14)
  __label_4: # case
.annotate 'line', 6135
    .return(16)
  __label_5: # case
.annotate 'line', 6136
    .return(15)
  __label_6: # case
.annotate 'line', 6137
    .return(17)
  __label_2: # default
.annotate 'line', 6139
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6140
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6142

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6146
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
.annotate 'line', 6147
    .return(12)
  __label_4: # case
.annotate 'line', 6148
    .return(13)
  __label_5: # case
.annotate 'line', 6149
    .return(25)
  __label_6: # case
.annotate 'line', 6150
    .return(26)
  __label_2: # default
.annotate 'line', 6151
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6153

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_91')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6157
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
.annotate 'line', 6158
    .return(4)
  __label_4: # case
.annotate 'line', 6159
    .return(5)
  __label_5: # case
.annotate 'line', 6160
    .return(6)
  __label_6: # case
.annotate 'line', 6161
    .return(18)
  __label_7: # case
.annotate 'line', 6162
    .return(23)
  __label_8: # case
.annotate 'line', 6163
    .return(24)
  __label_9: # case
.annotate 'line', 6164
    .return(30)
  __label_2: # default
.annotate 'line', 6165
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6167

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
.annotate 'line', 6171
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6172
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6175
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6179
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6181
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6183
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6185
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6187
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6189
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6191
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6193
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6195
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6176
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 6177
    WSubId_54(')', __ARG_1)
.annotate 'line', 6178
    .return($P2)
  __label_4: # case
.annotate 'line', 6180
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6182
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6184
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6186
    new $P10, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P10.'IntegerLiteral'(__ARG_2, $P1)
    set $P9, $P10
    .return($P9)
  __label_8: # case
.annotate 'line', 6188
    new $P12, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P12.'FloatLiteral'(__ARG_2, $P1)
    set $P11, $P12
    .return($P11)
  __label_9: # case
.annotate 'line', 6190
    .tailcall WSubId_68(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6192
    new $P14, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P14.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6194
    new $P16, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P16.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P15, $P16
    .return($P15)
  __label_12: # case
.annotate 'line', 6196
    new $P18, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P18.'IdentifierExpr'(__ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_2: # default
.annotate 'line', 6198
    WSubId_40('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6200

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6204
# var subexp: $P1
    $P1 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6205
# var t: $P2
    null $P2
.annotate 'line', 6206
# var start: $P3
    null $P3
.annotate 'line', 6207
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6208
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_70($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6209
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6211
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6214
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6217
    set $P3, $P2
.annotate 'line', 6218
    $P2 = __ARG_1.'get'()
.annotate 'line', 6219
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6220
# var right: $P4
    $P4 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6221
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6224
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6227
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6230
    __ARG_1.'unget'($P2)
.annotate 'line', 6231
    .return($P1)
# }
.annotate 'line', 6232

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 6236
# var subexp: $P1
    $P1 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6237
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6239
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6241
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6240
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6242
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6244
    __ARG_1.'unget'($P2)
.annotate 'line', 6245
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6247

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
.annotate 'line', 6251
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6252
# code: $I1
    $P3 = WSubId_72($P1)
    set $I1, $P3
.annotate 'line', 6253
    eq $I1, 0, __label_1
# {
.annotate 'line', 6254
# var subexpr: $P2
    $P2 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6255
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
.annotate 'line', 6257
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6259
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6261
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6263
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6265
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6267
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6269
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6273
    __ARG_1.'unget'($P1)
.annotate 'line', 6274
    .tailcall WSubId_74(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6276

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6280
# var lexpr: $P1
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6281
# var t: $P2
    null $P2
.annotate 'line', 6282
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6283
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_75($P2)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
.annotate 'line', 6284
# var rexpr: $P3
    $P3 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6285
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
.annotate 'line', 6287
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6290
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6293
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6296
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6299
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6302
    __ARG_1.'unget'($P2)
.annotate 'line', 6303
    .return($P1)
# }
.annotate 'line', 6304

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 6308
# var lexpr: $P1
    $P1 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6309
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6310
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6311
# var rexpr: $P3
    $P3 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6312
# var expr: $P4
    null $P4
.annotate 'line', 6313
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6314
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6316
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6317
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6319
    __ARG_1.'unget'($P2)
.annotate 'line', 6320
    .return($P1)
# }
.annotate 'line', 6321

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6325
# var lexpr: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6326
# var rexpr: $P2
    null $P2
.annotate 'line', 6327
# var t: $P3
    null $P3
.annotate 'line', 6328
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6329
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_78($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6330
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6332
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6333
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6336
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6337
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6340
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6343
    __ARG_1.'unget'($P3)
.annotate 'line', 6344
    .return($P1)
# }
.annotate 'line', 6345

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6349
# var lexpr: $P1
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6350
# var rexpr: $P2
    null $P2
.annotate 'line', 6351
# var t: $P3
    null $P3
.annotate 'line', 6352
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6353
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_80($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6354
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
.annotate 'line', 6356
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6357
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6360
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6361
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6364
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6365
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6368
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6369
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6372
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6375
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6378
    __ARG_1.'unget'($P3)
.annotate 'line', 6379
    .return($P1)
# }
.annotate 'line', 6380

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6384
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6385
# var rexpr: $P2
    null $P2
.annotate 'line', 6386
# var t: $P3
    null $P3
.annotate 'line', 6387
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6388
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6389
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
.annotate 'line', 6391
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6392
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6395
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6396
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6399
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6400
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6403
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6404
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6407
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6410
    __ARG_1.'unget'($P3)
.annotate 'line', 6411
    .return($P1)
# }
.annotate 'line', 6412

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_83 = "WSubId_83"
# Body
# {
.annotate 'line', 6416
# var lexpr: $P1
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6417
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6418
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6419
# var rexpr: $P3
    $P3 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6420
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6422
    __ARG_1.'unget'($P2)
.annotate 'line', 6423
    .return($P1)
# }
.annotate 'line', 6424

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_84 = "WSubId_84"
# Body
# {
.annotate 'line', 6428
# var lexpr: $P1
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6429
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6430
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6431
# var rexpr: $P3
    $P3 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6432
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6434
    __ARG_1.'unget'($P2)
.annotate 'line', 6435
    .return($P1)
# }
.annotate 'line', 6436

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
# Body
# {
.annotate 'line', 6440
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6441
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6442
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6443
# var rexpr: $P3
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6444
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6446
    __ARG_1.'unget'($P2)
.annotate 'line', 6447
    .return($P1)
# }
.annotate 'line', 6448

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6452
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6453
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6454
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6455
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6456
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6458
    __ARG_1.'unget'($P2)
.annotate 'line', 6459
    .return($P1)
# }
.annotate 'line', 6460

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6464
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6465
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6466
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6467
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6468
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6470
    __ARG_1.'unget'($P2)
.annotate 'line', 6471
    .return($P1)
# }
.annotate 'line', 6472

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_54 = "WSubId_54"
# Body
# {
.annotate 'line', 6476
# var econd: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6477
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6478
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6479
# var etrue: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6480
    WSubId_54(':', __ARG_1)
.annotate 'line', 6481
# var efalse: $P4
    $P4 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6482
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6485
    __ARG_1.'unget'($P2)
.annotate 'line', 6486
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6488

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
.annotate 'line', 6492
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6493
# var t: $P2
    null $P2
.annotate 'line', 6494
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6495
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_91($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
.annotate 'line', 6496
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6497
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6498
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
.annotate 'line', 6500
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6503
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6506
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6509
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6512
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6515
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6518
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6521
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6523
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6524
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6526
    __ARG_1.'unget'($P2)
.annotate 'line', 6527
    .return($P1)
# }
.annotate 'line', 6528

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6532
    .tailcall WSubId_89(__ARG_1, __ARG_2)
# }
.annotate 'line', 6533

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6548
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6549
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6550
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6551
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6552
    .return($S1)
# }
.annotate 'line', 6553

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6556
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6557
    unless_null $P1, __label_1
.annotate 'line', 6558
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6559
    .return($P1)
# }
.annotate 'line', 6560

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6544
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6569
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6570
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6571
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6572
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6573
    .return($S1)
# }
.annotate 'line', 6574

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6577
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6578
    unless_null $P1, __label_1
.annotate 'line', 6579
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6580
    .return($P1)
# }
.annotate 'line', 6581

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6563
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6565
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6597
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6598
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6599
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6600
    __ARG_2.'unget'($P1)
.annotate 'line', 6601
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6603

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6606
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6607
    if_null $P1, __label_1
.annotate 'line', 6608
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6609
    .return(self)
# }
.annotate 'line', 6610

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6614
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6615
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6618
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6619
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6620
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6621
    self.'annotate'(__ARG_1)
.annotate 'line', 6622
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6626
    le $I1, 0, __label_6
.annotate 'line', 6627
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6629
    self.'annotate'(__ARG_1)
.annotate 'line', 6630
    self.'emitret'(__ARG_1)
.annotate 'line', 6631
    le $I1, 0, __label_7
.annotate 'line', 6632
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6633
    __ARG_1.'say'(')')
# }
.annotate 'line', 6634

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 6591
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6593
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6641
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6642

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6645
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6646

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 6637
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
.annotate 'line', 6653
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6654

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6657
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6658

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 6649
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6671
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6672
    setattribute self, 'name', __ARG_1
.annotate 'line', 6673
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6674

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6675
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6678
    self.'annotate'(__ARG_1)
.annotate 'line', 6679
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6680

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 6665
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6667
    addattribute $P0, 'name'
.annotate 'line', 6668
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6694
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6695
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6696

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6697
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6700
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6701
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6702
    .return($S2)
# }
.annotate 'line', 6703

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 6689
    addattribute $P0, 'owner'
.annotate 'line', 6690
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
.annotate 'line', 6716
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6717
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6718
    WSubId_92($P1)
.annotate 'line', 6719
    setattribute self, 'label', $P1
.annotate 'line', 6720
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6721

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6722
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6725
    self.'annotate'(__ARG_1)
.annotate 'line', 6726
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6727
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6728
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6729

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 6710
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6712
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6740
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6741

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 6744
    WSubId_54('(', __ARG_1)
.annotate 'line', 6745
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6746
    WSubId_54(')', __ARG_1)
# }
.annotate 'line', 6747

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 6736
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
.annotate 'line', 6760
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6761
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6762
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6763
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6764
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6765
    $P4 = WSubId_93(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6767
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6768
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6770

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6773
    self.'optimize_condition'()
.annotate 'line', 6774
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6775
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6776
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6778
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6780
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6782
    .return(self)
# }
.annotate 'line', 6783

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6786
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6787
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6788
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6789
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6790
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6791
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6792
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6793
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6794
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6795
    self.'annotate'(__ARG_1)
.annotate 'line', 6796
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6797
    $P1.'emit'(__ARG_1)
.annotate 'line', 6799
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6800
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6801
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6802
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6804
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6805

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 6754
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6756
    addattribute $P0, 'truebranch'
.annotate 'line', 6757
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 6817
    $P2 = WSubId_93(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6818

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6821
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6822
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6824
    self.'annotate'(__ARG_1)
.annotate 'line', 6825
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6826
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6827
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6828
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6829

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 6812
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6814
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6840
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6841
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6842
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6843

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6846
    self.'optimize_condition'()
.annotate 'line', 6847
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6848
    .return(self)
# }
.annotate 'line', 6849

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6852
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6854
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6857
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6860
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6861
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6863
    self.'annotate'(__ARG_1)
.annotate 'line', 6864
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6865
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6866
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6867
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6868
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6870

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 6836
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
.annotate 'line', 6881
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6882
    self.'parsebody'(__ARG_2)
.annotate 'line', 6883
    WSubId_94('while', __ARG_2)
.annotate 'line', 6884
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6885

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6888
    self.'optimize_condition'()
.annotate 'line', 6889
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6890
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6891
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 6892
    setattribute self, 'body', $P1
.annotate 'line', 6893
    .return(self)
# }
.annotate 'line', 6894

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6897
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6898
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6899
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 6901
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6904
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6905
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6906
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 6908
    self.'annotate'(__ARG_1)
.annotate 'line', 6909
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6911
    $P1.'emit'(__ARG_1)
.annotate 'line', 6912
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6913
    eq $I1, 2, __label_7
.annotate 'line', 6914
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 6915
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 6917

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 6877
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
.annotate 'line', 6928
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6929
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6930

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6931
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6934
    self.'annotate'(__ARG_1)
.annotate 'line', 6935
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6936
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6937

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 6924
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
.annotate 'line', 6948
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6949
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6950

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6951
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6954
    self.'annotate'(__ARG_1)
.annotate 'line', 6955
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6956
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6957

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 6944
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6972
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6973
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 6974
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 6975
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 6976

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_37 = "WSubId_37"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 6979
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 6980
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6981
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6982
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_37(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6983
    $P1 = __ARG_1.'get'()
.annotate 'line', 6984
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 6985
    WSubId_40("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 6986
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 6987
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
.annotate 'line', 6988
    __ARG_1.'unget'($P1)
.annotate 'line', 6989
    $P3 = WSubId_93(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 6991
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6992
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 6995
    $P1 = __ARG_1.'get'()
.annotate 'line', 6996
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 6997
    WSubId_40("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 6998
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
.annotate 'line', 6999
    __ARG_1.'unget'($P1)
.annotate 'line', 7000
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_93(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7002
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7005
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7006
    WSubId_40("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7007

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7010
    getattribute $P2, self, 'case_value'
    WSubId_38($P2)
.annotate 'line', 7011
    getattribute $P2, self, 'case_st'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7012
    WSubId_38($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7013
    getattribute $P2, self, 'default_st'
    WSubId_38($P2)
# }
.annotate 'line', 7014

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 6964
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6966
    addattribute $P0, 'case_value'
.annotate 'line', 6967
    addattribute $P0, 'case_st'
.annotate 'line', 6968
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
.annotate 'line', 7027
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7028
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7029
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7030
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7031
    WSubId_40("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7032
    $P1 = __ARG_2.'get'()
.annotate 'line', 7033
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7034
    WSubId_40("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7035
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7036

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7039
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7040
    self.'optimize_cases'()
.annotate 'line', 7041
    .return(self)
# }
.annotate 'line', 7042

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7046
# type: $S1
    set $S1, ''
.annotate 'line', 7047
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7048
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7049
    ne $S2, 'N', __label_4
.annotate 'line', 7050
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7051
    ne $S1, '', __label_5
.annotate 'line', 7052
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7053
    eq $S1, $S2, __label_7
.annotate 'line', 7054
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7057
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7058
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7062
    ne $S1, '', __label_8
.annotate 'line', 7063
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7065
    __ARG_1.'comment'('switch')
.annotate 'line', 7066
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7067
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7068
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7070
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7071
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7075
    self.'genbreaklabel'()
.annotate 'line', 7076
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7077
    new $P4, ['ResizableStringArray']
.annotate 'line', 7078
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7079
    getattribute $P7, self, 'case_value'
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7080
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7081
# predefined push
    push $P4, $S7
.annotate 'line', 7082
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7083
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7085
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7088
    self.'annotate'(__ARG_1)
.annotate 'line', 7089
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7090
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7091
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7092
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7093
    $P7 = $P6[$I2]
    WSubId_52(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7091
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7096
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7097
    getattribute $P7, self, 'default_st'
    WSubId_52(__ARG_1, $P7)
.annotate 'line', 7099
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7100

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7021
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7023
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7112
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7113
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7114

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7117
    self.'optimize_cases'()
.annotate 'line', 7118
    .return(self)
# }
.annotate 'line', 7119

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 7123
    self.'genbreaklabel'()
.annotate 'line', 7124
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7125
    new $P1, ['ResizableStringArray']
.annotate 'line', 7127
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7128
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7129
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7130
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7131
# predefined push
    push $P1, $S3
.annotate 'line', 7132
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7133
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7135
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7138
    self.'annotate'(__ARG_1)
.annotate 'line', 7139
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7140
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7141
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7142
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7143
    $P4 = $P3[$I2]
    WSubId_52(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7141
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7146
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7147
    getattribute $P4, self, 'default_st'
    WSubId_52(__ARG_1, $P4)
.annotate 'line', 7149
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7150

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7107
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
.annotate 'line', 7157
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7158
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7159
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7160
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7161
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7162
    WSubId_40("'(' in switch", $P1)
# }
.annotate 'line', 7163

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
.annotate 'line', 7176
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7177
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7178
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7179
    __ARG_2.'unget'($P1)
.annotate 'line', 7180
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7182
    $P1 = __ARG_2.'get'()
.annotate 'line', 7183
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7184
    __ARG_2.'unget'($P1)
.annotate 'line', 7185
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7186
    WSubId_54(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7188
    $P1 = __ARG_2.'get'()
.annotate 'line', 7189
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7190
    __ARG_2.'unget'($P1)
.annotate 'line', 7191
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7192
    WSubId_54(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7194
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7195

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7198
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7199
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7200
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7201
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7202
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7203
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7204
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7205
    .return(self)
# }
.annotate 'line', 7206

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7209
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7210
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7211
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7212
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7213
    .return()
# }
  __label_1: # endif
.annotate 'line', 7215
    __ARG_1.'comment'('for loop')
.annotate 'line', 7216
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7217
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7218
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7219
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7220
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7222
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7223
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7224
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7226
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7227
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7228
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7229
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7230
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7232
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7233

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7169
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7171
    addattribute $P0, 'initializer'
.annotate 'line', 7172
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
.annotate 'line', 7248
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7249
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7250
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7251
# deftype: $S2
    $P1 = WSubId_95(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7252
    self.'createvar'($S1, $S2)
.annotate 'line', 7253
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7255
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7256
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7257
    WSubId_54(')', __ARG_2)
.annotate 'line', 7258
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7259

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7262
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7263
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7264
    .return(self)
# }
.annotate 'line', 7265

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 7268
    self.'annotate'(__ARG_1)
.annotate 'line', 7269
# regcont: $S1
    null $S1
.annotate 'line', 7270
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7271
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7272
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7273
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7276
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7278
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7279
    unless_null $P1, __label_4
.annotate 'line', 7280
    getattribute $P2, self, 'varname'
    WSubId_59($P2)
  __label_4: # endif
.annotate 'line', 7282
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7283
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7284
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7285
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7286
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7287
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7288
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7289
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7290
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7291
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7292
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7293

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7240
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7242
    addattribute $P0, 'deftype'
.annotate 'line', 7243
    addattribute $P0, 'varname'
.annotate 'line', 7244
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
.annotate 'line', 7300
    WSubId_54('(', __ARG_2)
.annotate 'line', 7301
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7302
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7303
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7304
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7306
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7307
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7308
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7309
    __ARG_2.'unget'($P3)
.annotate 'line', 7310
    __ARG_2.'unget'($P2)
.annotate 'line', 7311
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7313
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7314

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7326
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7327
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7328

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7331
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7332
    .return(self)
# }
.annotate 'line', 7333

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7336
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7337
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7338
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7339
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7341
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7344
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7347
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7349

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7320
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7322
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7361
    setattribute self, 'start', __ARG_1
.annotate 'line', 7362
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7363

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7366
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7367
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7368
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7369
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7370
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
.annotate 'line', 7373
    eq $I1, 1, __label_10
.annotate 'line', 7374
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7375
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7376
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7377
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7381
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7382
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7383
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7384
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7382
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7387
# predefined join
.annotate 'line', 7386
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7390
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7393

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7356
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7358
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
.annotate 'line', 7405
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7406
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7407
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7408
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7410
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7412
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7413
    $P1 = __ARG_2.'get'()
.annotate 'line', 7414
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7415
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7416
    $P1 = __ARG_2.'get'()
.annotate 'line', 7417
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7418
    WSubId_40("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7419
    $P1 = __ARG_2.'get'()
.annotate 'line', 7420
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7421
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7422
    setattribute self, 'exname', $P1
.annotate 'line', 7423
    self.'createvar'($S1, 'P')
.annotate 'line', 7424
    $P1 = __ARG_2.'get'()
.annotate 'line', 7425
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7426
    WSubId_40("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7428
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7429

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7432
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7433
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7434
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7435
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7436
    .return(self)
# }
.annotate 'line', 7437

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7440
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7441
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7442
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7443
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7444
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7445
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7447
    self.'annotate'(__ARG_1)
.annotate 'line', 7448
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7450
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7451
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7453
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7454
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7456
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7457
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7458
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7459
    __ARG_1.'comment'('try: end')
.annotate 'line', 7460
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7462
    self.'annotate'(__ARG_1)
.annotate 'line', 7463
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7465
    __ARG_1.'comment'('catch')
.annotate 'line', 7466
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7467
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7468
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7469
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7470
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7472
    __ARG_1.'comment'('catch end')
.annotate 'line', 7473
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7474

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7396
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7398
    addattribute $P0, 'stry'
.annotate 'line', 7399
    addattribute $P0, 'modifiers'
.annotate 'line', 7400
    addattribute $P0, 'exname'
.annotate 'line', 7401
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
.annotate 'line', 7487
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7488
    setattribute self, 'name', __ARG_3
.annotate 'line', 7489
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7490
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7491

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7481
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7483
    addattribute $P0, 'name'
.annotate 'line', 7484
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
.annotate 'line', 7506
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7507
    setattribute self, 'name', __ARG_3
.annotate 'line', 7508
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7509

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7498
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7500
    addattribute $P0, 'name'
.annotate 'line', 7501
    addattribute $P0, 'basetype'
.annotate 'line', 7502
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
.annotate 'line', 7520
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7521
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7522
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7523
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7524
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7526
    $P5 = WSubId_37(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7529
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7530

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7533
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7534
    if_null $P1, __label_1
.annotate 'line', 7535
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7536
    .return(self)
# }
.annotate 'line', 7537

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7540
    self.'annotate'(__ARG_1)
.annotate 'line', 7541
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7542
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7543
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7544
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7545
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7547
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7548
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7550
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7551
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7552
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7553
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7555
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7558
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7560
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7563
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7564
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.annotate 'line', 7566
    WSubId_1('Invalid initialization from void value', self)
  __label_18: # case
.annotate 'line', 7568
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7571
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7572
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7574
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7575
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7576
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7577
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7578
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7579
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7582
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7586

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7514
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7516
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
.annotate 'line', 7601
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7602
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7603
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7604
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7605
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7606
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7608
    __ARG_6.'unget'($P2)
.annotate 'line', 7609
    $P4 = WSubId_37(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7610
    WSubId_54(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7612
    $P2 = __ARG_6.'get'()
.annotate 'line', 7613
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7614
    $P2 = __ARG_6.'get'()
.annotate 'line', 7615
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7616
    WSubId_40("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7617
    $P2 = __ARG_6.'get'()
.annotate 'line', 7618
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7619
    __ARG_6.'unget'($P2)
.annotate 'line', 7620
    $P4 = WSubId_36(__ARG_6, self, WSubId_37, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7624
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7625

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 7628
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7629
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 7630
    getattribute $P1, self, 'initarray'
    WSubId_38($P1)
.annotate 'line', 7631
    .return(self)
# }
.annotate 'line', 7632

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7635
    self.'annotate'(__ARG_1)
.annotate 'line', 7637
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7638
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7639
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7640
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7641
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7642
    if_null $P2, __label_1
# {
.annotate 'line', 7644
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7645
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7649
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7651
    if_null $P3, __label_4
# {
.annotate 'line', 7652
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7653
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7654
    unless_null $P2, __label_6
# {
.annotate 'line', 7655
    le $I1, 0, __label_7
# {
.annotate 'line', 7657
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7660
# i: $I2
    null $I2
.annotate 'line', 7661
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7662
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7663
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7664
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7667

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 7591
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7593
    addattribute $P0, 'size'
.annotate 'line', 7594
    addattribute $P0, 'initarray'
.annotate 'line', 7595
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
.annotate 'line', 7674
# var next: $P1
    null $P1
.annotate 'line', 7675
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7676
# {
.annotate 'line', 7677
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7678
    WSubId_92($P3)
.annotate 'line', 7679
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7680
# var item: $P5
    null $P5
.annotate 'line', 7681
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 7682
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7684
    __ARG_4.'unget'($P4)
.annotate 'line', 7685
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7687
    $P2 = WSubId_96($P2, $P5)
.annotate 'line', 7688
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7689
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 7690
    WSubId_4(';', $P1)
.annotate 'line', 7691
    .return($P2)
# }
.annotate 'line', 7692

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7700
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7701

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 7696
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
.annotate 'line', 7708
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7709

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 7704
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
.annotate 'line', 7715
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7716

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7720
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7721

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
.annotate 'line', 7725
    .tailcall WSubId_97(WSubId_98, WSubId_99, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7726

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7734
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7735

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 7730
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
.annotate 'line', 7742
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7743

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 7738
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
.annotate 'line', 7749
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7750

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7754
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7755

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
.annotate 'line', 7759
    .tailcall WSubId_97(WSubId_100, WSubId_101, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7760

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7768
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7769

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 7764
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
.annotate 'line', 7776
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7777

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 7772
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
.annotate 'line', 7783
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7784

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7788
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7789

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
.annotate 'line', 7793
    .tailcall WSubId_97(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7794

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
.annotate 'line', 7810
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7811
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7812
    setattribute self, 'name', __ARG_4
.annotate 'line', 7813
    setattribute self, 'value', __ARG_5
.annotate 'line', 7814
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7815

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7818
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7819
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7820
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7821
    $P1 = $P1.'optimize'()
.annotate 'line', 7822
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 7823
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 7826
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7827
    .return(self)
# }
.annotate 'line', 7828

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7831
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 7832

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7835
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7836

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 7800
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7802
    addattribute $P0, 'type'
.annotate 'line', 7803
    addattribute $P0, 'name'
.annotate 'line', 7804
    addattribute $P0, 'data'
.annotate 'line', 7805
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
.annotate 'line', 7841
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7842
# type: $S1
    $P5 = WSubId_95($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7843
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7844
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7846
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7847
# {
.annotate 'line', 7848
    $P1 = __ARG_2.'get'()
.annotate 'line', 7849
# var name: $P3
    set $P3, $P1
.annotate 'line', 7850
    WSubId_54('=', __ARG_2)
.annotate 'line', 7851
# var value: $P4
    $P4 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 7853
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7852
    $P2 = WSubId_96($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7854
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7855
    .return($P2)
# }
.annotate 'line', 7856

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
.annotate 'line', 7867
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7868
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7869
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7870
    $P4 = WSubId_37(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7871
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 7873
    WSubId_4(';', $P1)
# }
.annotate 'line', 7874

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7877
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7878
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7879
    .return(self)
# }
.annotate 'line', 7880

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7883
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7884

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7887
    self.'annotate'(__ARG_1)
.annotate 'line', 7888
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7889
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7890
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7891
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7892
    if_null $P1, __label_3
.annotate 'line', 7893
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 7894
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 7895
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 7896
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
.annotate 'line', 7898
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7899
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7901
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7906
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 7907
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7910
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 7912
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 7916
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 7917

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 7862
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7864
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
.annotate 'line', 7924
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7925
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7926

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7929
    self.'annotate'(__ARG_1)
.annotate 'line', 7930
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7931
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 7932
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7933

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 7920
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
.annotate 'line', 7942
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7943
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7944
    WSubId_54(']', __ARG_2)
.annotate 'line', 7945
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7946

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7949
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7950
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7951

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7954
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7955
    self.'annotate'(__ARG_1)
.annotate 'line', 7956
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7957
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7958
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7959

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 7936
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7938
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
.annotate 'line', 7964
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7965
    WSubId_92($P1)
.annotate 'line', 7966
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7967
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7968
    $P2 = __ARG_2.'get'()
.annotate 'line', 7969
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 7970
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7972
    __ARG_2.'unget'($P2)
.annotate 'line', 7973
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
.annotate 'line', 7977
    __ARG_2.'unget'($P2)
.annotate 'line', 7978
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 7980

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_46 = "WSubId_46"
# Body
# {
.annotate 'line', 7984
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7985
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7986
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 7987
    .tailcall WSubId_46(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7988

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
.annotate 'line', 8001
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8002
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8003
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8004
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8005
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8006
    __ARG_2.'unget'($P1)
.annotate 'line', 8007
# var c: $P2
    $P2 = WSubId_93(__ARG_2, self)
.annotate 'line', 8008
    unless_null $P2, __label_3
.annotate 'line', 8009
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8010
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8012
    setattribute self, 'end', $P1
# }
.annotate 'line', 8013

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8016
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8017
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8018
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8019
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8020
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8021
    .return($S2)
# }
.annotate 'line', 8022

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8025
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8026
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8027
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8028
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8029
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8030
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8031
    $P1[$S1] = $S3
.annotate 'line', 8032
    .return($S3)
# }
.annotate 'line', 8033

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8034
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8037
    __ARG_1.'comment'('{')
.annotate 'line', 8038
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8039
    $P1.'emit'(__ARG_1)
.annotate 'line', 8040
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8042
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8043

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 7994
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7996
    addattribute $P0, 'end'
.annotate 'line', 7997
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8058
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8060
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8061
    new $P1, ['ResizableStringArray']
.annotate 'line', 8062
    new $P2, ['ResizableStringArray']
.annotate 'line', 8063
    setattribute self, 'tempreg', $P1
.annotate 'line', 8064
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8065

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8068
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8069
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8070
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8071
    assign $P1, $I1
# predefined string
.annotate 'line', 8072
    getattribute $P2, self, 'type'
.annotate 'line', 8067
    set $S2, $P2
.annotate 'line', 8072
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8073

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8076
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8077
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8078
# reg: $S1
    null $S1
.annotate 'line', 8079
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8080
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8082
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8083
# predefined push
    push $P2, $S1
.annotate 'line', 8084
    .return($S1)
# }
.annotate 'line', 8085

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8088
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8089
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8090
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8091
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8092
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8093
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8091
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8095
    assign $P2, 0
# }
.annotate 'line', 8096

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8052
    addattribute $P0, 'type'
.annotate 'line', 8053
    addattribute $P0, 'nreg'
.annotate 'line', 8054
    addattribute $P0, 'tempreg'
.annotate 'line', 8055
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8107
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8108

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8111
# var named: $P1
    null $P1
.annotate 'line', 8112
# var slurpy: $P2
    null $P2
.annotate 'line', 8113
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8114
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8115
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8116
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8118
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8121
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8124
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8128
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8135
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8152
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8133
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8136
# setname: $S2
    null $S2
# switch
.annotate 'line', 8137
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8139
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8142
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8143
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8144
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8145
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8148
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8150
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8153
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8154
# }
.annotate 'line', 8156

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8103
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
.annotate 'line', 8166
    setattribute self, 'func', __ARG_1
.annotate 'line', 8167
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8168
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_95($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8169
    eq $S1, '', __label_2
.annotate 'line', 8170
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8172
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8173
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8174
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8176
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8177
    $P1 = __ARG_2.'get'()
.annotate 'line', 8178
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8179
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8181
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8182

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_104 = "WSubId_104"
# Body
# {
.annotate 'line', 8185
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8186
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8187
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8188
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_104($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8189
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8190
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8191
    if_null $P3, __label_3
.annotate 'line', 8192
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8193
    __ARG_1.'say'('')
# }
.annotate 'line', 8194

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8161
    addattribute $P0, 'func'
.annotate 'line', 8162
    addattribute $P0, 'name'
.annotate 'line', 8163
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8199
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8200

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8210
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8211

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8214
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8215
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8216
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8217
    le $I1, 0, __label_3
# {
.annotate 'line', 8218
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8219
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8220
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8221
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8222
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8223
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8219
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8225
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8228

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8206
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8251
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8252
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8253
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8254
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8255
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8256
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8257

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8259
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8263
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8264
    unless_null $P1, __label_1
.annotate 'line', 8265
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8266
    .return($P1)
# }
.annotate 'line', 8267

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8270
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8271
    unless_null $P1, __label_1
.annotate 'line', 8272
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8273
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8274

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8278
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8279
    .return($I1)
# }
.annotate 'line', 8280

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8283
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8284
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8285
    __ARG_1.'unget'($P1)
.annotate 'line', 8286
    $P3 = WSubId_36(__ARG_1, self, WSubId_105, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8288

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8292
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8293
    unless_null $P1, __label_1
.annotate 'line', 8294
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8296
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8297

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8300
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8301
    unless_null $P1, __label_1
# {
.annotate 'line', 8303
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8306
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8307
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8308
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8309
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8311

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8314
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8315
    if_null $P1, __label_1
# {
.annotate 'line', 8316
# var found: $P2
    null $P2
.annotate 'line', 8317
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 8318
    $P2 = $P3.'findsymbol'(__ARG_1)
.annotate 'line', 8319
    if_null $P2, __label_4
.annotate 'line', 8320
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8323
    getattribute $P5, self, 'owner'
    .tailcall $P5.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8324

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8328
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8329
    if_null $P1, __label_1
# {
.annotate 'line', 8330
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 8331
    $P2.'fixnamespaces'()
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8333
    getattribute $P6, self, 'body'
    $P5 = $P6.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 8334
    .return(self)
# }
.annotate 'line', 8335

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8339
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8340
    unless_null $P1, __label_1
.annotate 'line', 8341
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8342
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8343

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8346
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8347
    unless_null $P1, __label_1
.annotate 'line', 8348
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8349
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8350

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8355
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8356
# lexname: $S1
    null $S1
.annotate 'line', 8357
    if_null $P1, __label_1
.annotate 'line', 8358
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8360
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8361
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8362
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8363
    self.'setlex'($S1, $S2)
.annotate 'line', 8364
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8366
    .return($S1)
# }
.annotate 'line', 8367

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8371
# var store: $P1
    null $P1
# switch
.annotate 'line', 8372
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
.annotate 'line', 8374
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8376
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8378
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8380
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8382
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8384
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8385
    .return($S1)
# }
.annotate 'line', 8386

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8389
# var store: $P1
    null $P1
# switch
.annotate 'line', 8390
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
.annotate 'line', 8392
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8394
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8396
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8398
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8400
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8402
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8403
    .return($S1)
# }
.annotate 'line', 8404

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8407
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
.annotate 'line', 8408
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8409

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8412
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8411
    set $S1, $I1
.annotate 'line', 8413
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8414

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8417
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8418

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8421
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8422

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 8426
# name: $S1
    getattribute $P10, self, 'name'
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 8427
    __ARG_1.'say'()
.annotate 'line', 8428
    __ARG_1.'print'(".sub ")
.annotate 'line', 8429
    $P10 = self.'isanonymous'()
    if_null $P10, __label_2
    unless $P10 goto __label_2
.annotate 'line', 8430
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8432
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8433
    getattribute $P10, self, 'subid'
    if_null $P10, __label_4
.annotate 'line', 8434
    getattribute $P11, self, 'subid'
    __ARG_1.'print'(" :subid('", $P11, "')")
  __label_4: # endif
.annotate 'line', 8435
    getattribute $P10, self, 'outer'
    if_null $P10, __label_5
# {
.annotate 'line', 8436
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8437
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8438
    if_null $P2, __label_6
.annotate 'line', 8439
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8443
    $P10 = self.'ismethod'()
    if_null $P10, __label_7
    unless $P10 goto __label_7
.annotate 'line', 8444
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8445
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8446
    if_null $P3, __label_8
.annotate 'line', 8447
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8449
    ne $S1, 'main', __label_10
.annotate 'line', 8450
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8452
    __ARG_1.'say'()
.annotate 'line', 8455
    getattribute $P10, self, 'params'
    WSubId_52(__ARG_1, $P10)
.annotate 'line', 8457
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8458
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8459
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8460
    getattribute $P10, self, 'start'
    __ARG_1.'annotate'($P10)
.annotate 'line', 8462
    if_null $P4, __label_13
# {
.annotate 'line', 8463
    iter $P12, $P4
    set $P12, 0
  __label_14: # for iteration
    unless $P12 goto __label_15
    shift $S2, $P12
.annotate 'line', 8464
    $P10 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P10, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8467
    if_null $P5, __label_16
# {
.annotate 'line', 8468
    iter $P13, $P5
    set $P13, 0
  __label_17: # for iteration
    unless $P13 goto __label_18
    shift $S3, $P13
# {
.annotate 'line', 8469
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_19
.annotate 'line', 8470
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_19: # endif
.annotate 'line', 8471
    $P10 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P10)
# }
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8476
# var usedsubids: $P6
    getattribute $P6, self, 'usedsubids'
.annotate 'line', 8477
    if_null $P6, __label_20
# {
.annotate 'line', 8478
    iter $P14, $P6
    set $P14, 0
  __label_21: # for iteration
    unless $P14 goto __label_22
    shift $S4, $P14
# {
.annotate 'line', 8480
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_21
  __label_22: # endfor
# }
  __label_20: # endif
.annotate 'line', 8484
# var body: $P7
    getattribute $P7, self, 'body'
.annotate 'line', 8485
    $P10 = $P7.'isempty'()
    if_null $P10, __label_23
    unless $P10 goto __label_23
.annotate 'line', 8486
    __ARG_1.'comment'('Empty body')
    goto __label_24
  __label_23: # else
# {
.annotate 'line', 8488
    __ARG_1.'comment'('Body')
.annotate 'line', 8489
    $P7.'emit'(__ARG_1)
.annotate 'line', 8490
    $P10 = $P7.'getend'()
    __ARG_1.'annotate'($P10)
# }
  __label_24: # endif
.annotate 'line', 8492
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8495
# var localfun: $P8
    getattribute $P8, self, 'localfun'
.annotate 'line', 8496
    if_null $P8, __label_25
# {
.annotate 'line', 8497
    iter $P15, $P8
    set $P15, 0
  __label_26: # for iteration
    unless $P15 goto __label_27
    shift $P9, $P15
.annotate 'line', 8498
    $P9.'emit'(__ARG_1)
    goto __label_26
  __label_27: # endfor
# }
  __label_25: # endif
# }
.annotate 'line', 8500

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8231
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8233
    addattribute $P0, 'name'
.annotate 'line', 8234
    addattribute $P0, 'subid'
.annotate 'line', 8235
    addattribute $P0, 'modifiers'
.annotate 'line', 8236
    addattribute $P0, 'params'
.annotate 'line', 8237
    addattribute $P0, 'body'
.annotate 'line', 8238
    addattribute $P0, 'regstI'
.annotate 'line', 8239
    addattribute $P0, 'regstN'
.annotate 'line', 8240
    addattribute $P0, 'regstS'
.annotate 'line', 8241
    addattribute $P0, 'regstP'
.annotate 'line', 8242
    addattribute $P0, 'nlabel'
.annotate 'line', 8243
    addattribute $P0, 'localfun'
.annotate 'line', 8244
    addattribute $P0, 'lexicals'
.annotate 'line', 8245
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8246
    addattribute $P0, 'usedsubids'
.annotate 'line', 8247
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8514
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8515
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8516
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8517
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8518

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8520
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8524
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8522
    set $I1, $P1
.annotate 'line', 8524
    .return($I1)
# }
.annotate 'line', 8525

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8529
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8527
    set $I1, $P1
.annotate 'line', 8529
    .return($I1)
# }
.annotate 'line', 8530

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8531
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 8535
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8536
    setattribute self, 'name', $P1
.annotate 'line', 8537
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8538
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 8539
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P9, self, 'owner'
    $P8.'FunctionModifierList'(__ARG_1, $P9)
    set $P7, $P8
    setattribute self, 'modifiers', $P7
.annotate 'line', 8540
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8542
    WSubId_4('(', $P2)
.annotate 'line', 8543
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8545
# var fullname: $P3
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P3, $P5
.annotate 'line', 8546
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P3, $P5
.annotate 'line', 8547
# var cfunction: $P4
    $P4 = self.'createconst'('__FUNCTION__', 'S')
.annotate 'line', 8548
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 8549
    new $P8, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P10, $P1, 'line'
.annotate 'line', 8550
# predefined join
.annotate 'line', 8548
    join $S1, '.', $P3
    $P8.'TokenQuoted'($P9, $P10, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
    $P4.'setvalue'($P5)
.annotate 'line', 8552
    $P2 = __ARG_1.'get'()
.annotate 'line', 8553
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_2
.annotate 'line', 8554
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 8555
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8556
    .return(self)
# }
.annotate 'line', 8557

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8507
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8509
    addattribute $P0, 'paramnum'
.annotate 'line', 8510
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
.annotate 'line', 8568
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8569
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8570
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8571
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8572
    setattribute self, 'name', $P1
.annotate 'line', 8573
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8574
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8575
    WSubId_4('{', $P2)
.annotate 'line', 8576
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8577
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8578

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8579
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8580
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8583
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8584

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8588
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8589

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8593
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8594

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8597
    $P5 = __ARG_2.'gettype'()
    set $S3, $P5
    isne $I2, $S3, 'P'
    if $I2 goto __label_2
    $I2 = __ARG_2.'isconst'()
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 8598
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 8599
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8601
# predefined substr
    substr $S3, $S1, 0, 6
    ne $S3, 'WSubId', __label_4
.annotate 'line', 8602
    .return(__ARG_2)
  __label_4: # endif
.annotate 'line', 8603
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 8604
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 8605
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 8606
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_5
# {
.annotate 'line', 8607
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_6
    unless $P5 goto __label_6
# {
.annotate 'line', 8608
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 8609
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8610
# var lexused: $P4
    $P4 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8611
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 8612
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 8613
    .return($P4)
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8616
    .return(__ARG_2)
# }
.annotate 'line', 8617

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8620
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8621
    unless_null $P1, __label_1
.annotate 'line', 8622
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8623
    unless_null $P1, __label_2
# {
.annotate 'line', 8626
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 8627
    unless_null $P1, __label_3
# {
.annotate 'line', 8629
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 8630
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8631
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 8632
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 8633
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8634
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 8635
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8639
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8641
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 8642
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 8643
    .return($P1)
# }
.annotate 'line', 8644

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 8564
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
.annotate 'line', 8655
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8656

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8657
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 8651
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
.annotate 'line', 8671
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8672
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8673
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 8674
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8675
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8676
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_95($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8677
    set $P1, $P2
.annotate 'line', 8678
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8679
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8681
    setattribute self, 'name', $P1
.annotate 'line', 8682
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8683
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8684
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8685
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 8687
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8688

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8691
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8692
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8693
    if_null $P1, __label_1
# {
.annotate 'line', 8694
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8695
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8697

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 8666
    addattribute $P0, 'name'
.annotate 'line', 8667
    addattribute $P0, 'modifiers'
.annotate 'line', 8668
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8702
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8703

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 8710
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_106, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 8711

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8714
    __ARG_1.'print'('(')
.annotate 'line', 8715
# sep: $S1
    set $S1, ''
.annotate 'line', 8716
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8717
    __ARG_1.'print'($S1)
.annotate 'line', 8718
    $P1.'emit'(__ARG_1)
.annotate 'line', 8719
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8721
    __ARG_1.'print'(')')
# }
.annotate 'line', 8722

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 8707
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
.annotate 'line', 8731
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8732
    setattribute self, 'params', __ARG_3
.annotate 'line', 8733
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 8734

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8737
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8738
    .return(self)
# }
.annotate 'line', 8739

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8742
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8743
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 8744
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 8745
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8746
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8747
    __ARG_1.'print'('    ')
.annotate 'line', 8748
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8749
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8750
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8751
    __ARG_1.'say'()
# }
.annotate 'line', 8752

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 8725
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8727
    addattribute $P0, 'params'
.annotate 'line', 8728
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
.annotate 'line', 8769
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8770

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8771
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8775
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8776

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 8765
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8784
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8785
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8786

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8787
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8791
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8792
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8793

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 8779
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8781
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
.annotate 'line', 8802
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8803
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8804
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8805
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8806
    WSubId_40('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8807
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8808
    $P2 = __ARG_1.'get'()
.annotate 'line', 8809
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8810
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8812
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8816
    WSubId_41('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8818
# {
.annotate 'line', 8819
    $P2 = __ARG_1.'get'()
.annotate 'line', 8820
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 8821
    WSubId_40('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8822
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8823
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 8824
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8826
    setattribute self, 'key', $P1
# }
.annotate 'line', 8827

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8828
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8831
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8832

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8836
    getattribute $P2, self, 'key'
    $P1 = WSubId_58($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8837

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 8796
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8798
    addattribute $P0, 'key'
.annotate 'line', 8799
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8845
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8846
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8847
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 8848
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8849
    $P2 = __ARG_1.'get'()
.annotate 'line', 8850
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8852
    __ARG_1.'unget'($P2)
.annotate 'line', 8853
    setattribute self, 'key', $P1
# }
.annotate 'line', 8854

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8855
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8859
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8860
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8861

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_67 = "WSubId_67"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8865
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8866
    unless_null $P1, __label_1
# {
.annotate 'line', 8867
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8868
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_67($S2)
  __label_3: # endif
.annotate 'line', 8869
    getattribute $P3, self, 'key'
    $P2 = WSubId_58($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8871
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 8872

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 8840
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8842
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8877
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8878
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8879
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8880
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8881
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8882
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8883
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 8884
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 8885

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8897
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8898
    setattribute self, 'name', __ARG_2
.annotate 'line', 8899
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8900
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8901
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8902

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8905
    getattribute $P1, self, 'classns'
    .tailcall WSubId_58($P1)
# }
.annotate 'line', 8906

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 8891
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8893
    addattribute $P0, 'name'
.annotate 'line', 8894
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
.annotate 'line', 8919
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8920
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8921
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8922
    setattribute self, 'functions', $P1
.annotate 'line', 8923
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8924
    setattribute self, 'members', $P2
.annotate 'line', 8925
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8926
    setattribute self, 'constants', $P3
.annotate 'line', 8928
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8929
    $P8 = $P4.'isop'(':')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 8930
    $P10 = WSubId_36(__ARG_4, self, WSubId_60)
    setattribute self, 'bases', $P10
.annotate 'line', 8931
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 8933
    WSubId_4('{', $P4)
# for loop
.annotate 'line', 8934
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 8935
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
.annotate 'line', 8937
# var f: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8938
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 8941
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 8942
    $P10 = $P6.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 8943
    WSubId_40("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 8944
# predefined push
    push $P2, $P6
.annotate 'line', 8945
    $P4 = __ARG_4.'get'()
.annotate 'line', 8946
    $P11 = $P4.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 8947
    WSubId_40("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 8950
# var cst: $P7
    $P7 = WSubId_44($P4, __ARG_4, self)
.annotate 'line', 8951
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 8954
    WSubId_41("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 8934
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 8957

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8960
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8961

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8964
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8965

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8968
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8969

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8972
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8973

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8976
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8977

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8980
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8981

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 8984
    getattribute $P1, self, 'constants'
    WSubId_38($P1)
.annotate 'line', 8985
    getattribute $P1, self, 'functions'
    WSubId_38($P1)
.annotate 'line', 8986
    .return(self)
# }
.annotate 'line', 8987

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 8990
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8991
    $P5 = WSubId_107($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8992
    getattribute $P5, self, 'functions'
    WSubId_52(__ARG_1, $P5)
.annotate 'line', 8994
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8996
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8997
# n: $I1
    set $I1, 1
.annotate 'line', 8998
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 8999
    if_null $P2, __label_1
# {
.annotate 'line', 9000
    getattribute $P5, self, 'bases'
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 9001
    $P3.'annotate'(__ARG_1)
.annotate 'line', 9002
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9003
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9004
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 9005
    __ARG_1.'say'()
.annotate 'line', 9006
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 9009
    getattribute $P5, self, 'members'
    iter $P7, $P5
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 9010
    __ARG_1.'annotate'($P4)
.annotate 'line', 9011
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 9014
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9015

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 8909
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8911
    addattribute $P0, 'parent'
.annotate 'line', 8912
    addattribute $P0, 'bases'
.annotate 'line', 8913
    addattribute $P0, 'constants'
.annotate 'line', 8914
    addattribute $P0, 'functions'
.annotate 'line', 8915
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9022
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9023

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9026
    .return(self)
# }
.annotate 'line', 9027

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9018
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
.annotate 'line', 9035
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9036
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9037
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9038
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9039
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9040
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9038
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.annotate 'line', 9042
    WSubId_4(';', $P2)
.annotate 'line', 9043
    new $P4, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9046
    __ARG_2.'unget'($P2)
.annotate 'line', 9047
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9049

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
.annotate 'line', 9057
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9058
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.annotate 'line', 9059
    WSubId_40('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9060
    WSubId_54(';', __ARG_2)
.annotate 'line', 9061
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9062
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9067
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9068
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9069
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9070
    iter $P8, $P4
    set $P8, 0
  __label_3: # for iteration
    unless $P8 goto __label_4
    shift $S2, $P8
# {
.annotate 'line', 9071
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9072
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9073
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9074
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9072
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
.annotate 'line', 9079
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.annotate 'line', 9080
    WSubId_1('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9085
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
.annotate 'line', 9086
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9087
# pos: $I1
    set $I1, 12
.annotate 'line', 9088
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9089
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9090
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9091
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9092
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9093
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9094
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9095
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9097
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9098
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9099
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9100
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9101
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9102
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9103
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9104
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9106
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9108
# ivalue: $I3
    null $I3
.annotate 'line', 9109
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9110
# predefined substr
    substr $S10, $S7, 2
    box $P9, $S10
    $P7 = $P9.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9112
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9113
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9115
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P11, __ARG_1, 'file'
    getattribute $P12, __ARG_1, 'line'
    $P10.'TokenInteger'($P11, $P12, $S6)
    set $P9, $P10
.annotate 'line', 9114
    $P7 = WSubId_21(__ARG_3, $P9, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9085
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9119
    $P5.'close'()
# }
.annotate 'line', 9120

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
.annotate 'line', 9126
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9127
    $P7 = $P1.'iskeyword'('namespace')
    if_null $P7, __label_1
    unless $P7 goto __label_1
# {
.annotate 'line', 9128
# var nskey: $P2
    $P2 = WSubId_55(__ARG_2)
.annotate 'line', 9129
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9130
    ge $I1, 1, __label_2
.annotate 'line', 9131
    WSubId_1('Unsupported', $P1)
  __label_2: # endif
.annotate 'line', 9132
    WSubId_54(';', __ARG_2)
.annotate 'line', 9133
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9134
    unless_null $P3, __label_3
.annotate 'line', 9135
    WSubId_1('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9136
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9137
    .return()
# }
  __label_1: # endif
.annotate 'line', 9139
    $P7 = $P1.'iskeyword'('extern')
    isfalse $I3, $P7
    unless $I3 goto __label_4
# {
.annotate 'line', 9140
    __ARG_2.'unget'($P1)
.annotate 'line', 9141
# var key: $P4
    $P4 = WSubId_55(__ARG_2)
.annotate 'line', 9142
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9143
    ge $I2, 1, __label_5
.annotate 'line', 9144
    WSubId_1('Unsupported at namespace level', $P1)
  __label_5: # endif
.annotate 'line', 9145
    WSubId_54(';', __ARG_2)
.annotate 'line', 9146
    __ARG_3.'use'($P4)
.annotate 'line', 9147
    .return()
# }
  __label_4: # endif
.annotate 'line', 9149
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9151
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9157
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9153
# reqlib: $S1
    set $P7, $P1
    null $S1
    if_null $P7, __label_10
    set $S1, $P7
  __label_10:
.annotate 'line', 9154
    __ARG_3.'addlib'($S1)
.annotate 'line', 9155
    WSubId_54(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9158
    __ARG_2.'unget'($P1)
.annotate 'line', 9159
# var module: $P5
    $P5 = WSubId_55(__ARG_2)
.annotate 'line', 9160
    $P1 = __ARG_2.'get'()
.annotate 'line', 9161
    $P8 = $P1.'isop'(';')
    isfalse $I4, $P8
    unless $I4 goto __label_11
# {
.annotate 'line', 9162
    __ARG_2.'unget'($P1)
.annotate 'line', 9163
# var names: $P6
    null $P7
    $P6 = WSubId_36(__ARG_2, $P7, WSubId_57, ';')
.annotate 'line', 9164
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9166
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9167
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9170
    WSubId_40('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9172

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9182
    setattribute self, 'module', __ARG_1
.annotate 'line', 9183
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9184

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9189
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9197
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9198
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9199
    __ARG_1.'say'("']")
.annotate 'line', 9200
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9201
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9202
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9208

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9178
    addattribute $P0, 'module'
.annotate 'line', 9179
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9227
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9228
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9229
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9230
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9231
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9232
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9235
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9236
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9237
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9238
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9239
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9241
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9242

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9245
# var ns: $P1
    null $P1
.annotate 'line', 9246
    getattribute $P3, self, 'namespaces'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9247
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9248
    getattribute $P3, self, 'usednamespaces'
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9249
    getattribute $P6, $P1, 'usednamespaces'
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9250
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9251

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9254
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9255

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9258
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9259
    .return()
  __label_1: # endif
.annotate 'line', 9260
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9261
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9262
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9263
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9264
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9265

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9268
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9269
    if_null $P1, __label_1
# {
.annotate 'line', 9270
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9271
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9274
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9275
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9276
    if_null $P2, __label_5
# {
.annotate 'line', 9277
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9278
    if_null $P1, __label_6
.annotate 'line', 9279
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9282

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9285
    getattribute $P2, self, 'usednamespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9286
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9287
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9288
    .return($P2)
# }
.annotate 'line', 9289

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9292
    getattribute $P2, self, 'namespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9293
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9294
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9295
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9296

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9300
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9301
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9302
    unless_null $P2, __label_1
.annotate 'line', 9303
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9305
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9306

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9310
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9311
# var cl: $P2
    null $P2
.annotate 'line', 9312
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9313
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9314
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9315
    getattribute $P5, self, 'usednamespaces'
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9316
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9317
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9318
    .return($P5)
# }
.annotate 'line', 9319

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9324
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9325
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9327
    .return($P3)
  __label_4: # case
.annotate 'line', 9330
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9335
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9336
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9337
    if_null $P1, __label_5
# {
.annotate 'line', 9338
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9339
    if_null $P2, __label_6
.annotate 'line', 9340
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9343
    .return($P3)
# }
.annotate 'line', 9344

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9347
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9348
    if_null $P1, __label_1
.annotate 'line', 9349
    .return($P1)
  __label_1: # endif
.annotate 'line', 9350
    getattribute $P2, self, 'functions'
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9351
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9352
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9353
    .return($P2)
# }
.annotate 'line', 9354

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9359
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9360
# name: $S1
    null $S1
.annotate 'line', 9361
# var sym: $P1
    null $P1
.annotate 'line', 9362
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9363
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9365
    .return($P3)
  __label_4: # case
.annotate 'line', 9367
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9369
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9370
    .return($P1)
  __label_5: # endif
.annotate 'line', 9371
    getattribute $P4, self, 'usednamespaces'
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9372
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9373
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9379
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9380
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9381
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9382
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9383
    .return($P1)
  __label_9: # endif
.annotate 'line', 9384
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9385
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9386
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9387
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9389
    .return($P3)
# }
.annotate 'line', 9390

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9393
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9394
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9396
    .return($P2)
  __label_2: # default
.annotate 'line', 9398
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9399
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9400
    if_null $P1, __label_4
# {
.annotate 'line', 9401
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9402
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9404
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9407
    .return($P2)
# }
.annotate 'line', 9408

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9411
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9412
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9413
    .return($P1)
# }
.annotate 'line', 9414

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9417
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9418
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9419
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9420
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9421
    .return($P2)
# }
.annotate 'line', 9422

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9425
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9426

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9429
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9430
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9431

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9434
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9435
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9436
    $P1 = __ARG_2.'get'()
.annotate 'line', 9438
# var modifier: $P2
    null $P2
.annotate 'line', 9439
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9440
    new $P5, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9441
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.annotate 'line', 9444
    WSubId_4('{', $P1)
.annotate 'line', 9445
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9446
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9447

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_108 = "WSubId_108"
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 9450
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9451
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9452
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9453
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9454
    $P4 = __ARG_1.'get'()
  __label_3: # for condition
    set $I1, $P4
    unless $I1 goto __label_4
    $P7 = $P4.'isop'('}')
    isfalse $I1, $P7
  __label_4:
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9456
    $P8 = $P4.'checkkeyword'()
    set $S1, $P8
    set $S2, 'namespace'
    if $S1 == $S2 goto __label_7
    set $S2, 'const'
    if $S1 == $S2 goto __label_8
    set $S2, 'function'
    if $S1 == $S2 goto __label_9
    set $S2, 'class'
    if $S1 == $S2 goto __label_10
    set $S2, 'using'
    if $S1 == $S2 goto __label_11
    set $S2, '$include_const'
    if $S1 == $S2 goto __label_12
    set $S2, '$load'
    if $S1 == $S2 goto __label_13
    set $S2, '$loadlib'
    if $S1 == $S2 goto __label_14
    goto __label_6
  __label_7: # case
.annotate 'line', 9458
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9461
# var cst: $P5
    $P5 = WSubId_44($P4, __ARG_1, self)
.annotate 'line', 9462
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9465
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9466
# predefined push
    push $P2, $P6
.annotate 'line', 9467
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9470
    WSubId_108($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9473
    WSubId_109($P4, __ARG_1, self)
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9476
    WSubId_110($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9479
    $P4 = __ARG_1.'get'()
.annotate 'line', 9480
    $P9 = $P4.'isstring'()
    isfalse $I2, $P9
    unless $I2 goto __label_15
.annotate 'line', 9481
    WSubId_40('string literal', $P4)
  __label_15: # endif
.annotate 'line', 9482
    WSubId_54(';', __ARG_1)
.annotate 'line', 9483
    new $P12, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P12.'StringLiteral'(self, $P4)
    set $P11, $P12
    $P10 = $P11.'getPirString'()
    self.'addload'($P10)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9486
    $P4 = __ARG_1.'get'()
.annotate 'line', 9487
    $P13 = $P4.'isstring'()
    isfalse $I3, $P13
    unless $I3 goto __label_16
.annotate 'line', 9488
    WSubId_40('string literal', $P4)
  __label_16: # endif
.annotate 'line', 9489
    WSubId_54(';', __ARG_1)
.annotate 'line', 9490
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P4)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addlib'($P14)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9493
    WSubId_41("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9454
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9496
    if_null $P4, __label_17
    unless $P4 goto __label_17
.annotate 'line', 9497
    self.'close_ns'($P4)
    goto __label_18
  __label_17: # else
.annotate 'line', 9499
    self.'unclosed_ns'()
  __label_18: # endif
# }
.annotate 'line', 9500

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 9503
    getattribute $P1, self, 'items'
    WSubId_38($P1)
# }
.annotate 'line', 9504

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_52 = "WSubId_52"
# Body
# {
.annotate 'line', 9507
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9508
# s: $S1
    $P4 = WSubId_107($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9510
# activate: $I1
    set $I1, 1
.annotate 'line', 9512
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9513
    if_null $P2, __label_2
# {
.annotate 'line', 9514
    __ARG_1.'say'($S1)
.annotate 'line', 9515
    null $I1
.annotate 'line', 9516
    WSubId_52(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9519
    getattribute $P4, self, 'items'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
# {
.annotate 'line', 9520
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9521
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9522
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9524
    unless $I1 goto __label_8
# {
.annotate 'line', 9525
    __ARG_1.'say'($S1)
.annotate 'line', 9526
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9528
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9530

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9215
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9217
    addattribute $P0, 'nspath'
.annotate 'line', 9218
    addattribute $P0, 'externals'
.annotate 'line', 9219
    addattribute $P0, 'namespaces'
.annotate 'line', 9220
    addattribute $P0, 'classes'
.annotate 'line', 9221
    addattribute $P0, 'functions'
.annotate 'line', 9222
    addattribute $P0, 'items'
.annotate 'line', 9223
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
.annotate 'line', 9548
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9549
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9550
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9552
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9553
    setattribute self, 'start', __ARG_2
.annotate 'line', 9554
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9555
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9556
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9557
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9558
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9559
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9561

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9564
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9565

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9568
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9569

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9572
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9573

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9576
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9577

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9580
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9581

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9584
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9585
    unless_null $P1, __label_1
.annotate 'line', 9586
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9587
    .return($P1)
# }
.annotate 'line', 9588

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9593
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9594
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9595
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9596
    .return($P1)
# }
.annotate 'line', 9597

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9600
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9601
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9602
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9603
    .return($P1)
# }
.annotate 'line', 9604

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9607
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9608
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9609
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9610
    .return($P1)
# }
.annotate 'line', 9611

.end # findns


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9614
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 9615

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9622
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9623
    if_null $P1, __label_1
.annotate 'line', 9624
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9625
    self.'optimize_base'()
.annotate 'line', 9626
    .return(self)
# }
.annotate 'line', 9627

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9630
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9631
    if_null $P1, __label_1
.annotate 'line', 9632
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9634
    self.'emit_base'(__ARG_1)
.annotate 'line', 9636
    if_null $P1, __label_2
.annotate 'line', 9637
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9638

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 9537
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9539
    addattribute $P0, 'parent'
.annotate 'line', 9540
    addattribute $P0, 'start'
.annotate 'line', 9541
    addattribute $P0, 'name'
.annotate 'line', 9542
    addattribute $P0, 'modifier'
.annotate 'line', 9543
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9655
    new $P1, ['ResizableStringArray']
.annotate 'line', 9656
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9657
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9658
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9659
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9660

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9663
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9664
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9665

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9668
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9669
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9670

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9674
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9673
    set $S1, $I1
.annotate 'line', 9675
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9676

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9680
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9681
    unless_null $P1, __label_1
.annotate 'line', 9682
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9683
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9684

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9687
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9688
    unless_null $P1, __label_1
.annotate 'line', 9689
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9690
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9691

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9694
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9695

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9699
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9700

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9703
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9704

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9707
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9708

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9715
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9716

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9719
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9720

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9723
    self.'optimize_base'()
.annotate 'line', 9724
    .return(self)
# }
.annotate 'line', 9725

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9728
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9731
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9732
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9735
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
.annotate 'line', 9738
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9739
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9740
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9741
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9744
# somelib: $I1
    null $I1
.annotate 'line', 9745
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9746
    if_null $P3, __label_5
# {
.annotate 'line', 9747
    set $I1, 1
.annotate 'line', 9748
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9749
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9752
# someload: $I2
    null $I2
.annotate 'line', 9753
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9754
    if_null $P4, __label_8
# {
.annotate 'line', 9755
    set $I2, 1
.annotate 'line', 9756
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9757
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9758
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9759
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9761
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9762
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9764
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9765

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9768
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9769
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9770
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9771
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9772
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9773
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9775
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9776
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9778

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 9645
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9647
    addattribute $P0, 'unit'
.annotate 'line', 9648
    addattribute $P0, 'predefs_used'
.annotate 'line', 9649
    addattribute $P0, 'libs'
.annotate 'line', 9650
    addattribute $P0, 'loads'
.annotate 'line', 9651
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9794
    box $P7, 1
    setattribute self, 'warnings', $P7
.annotate 'line', 9795
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9798
# var taux: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9800
# var cfalse: $P3
    $P3 = $P1.'createconst'('false', 'I', 4)
.annotate 'line', 9802
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9801
    $P7 = WSubId_21($P1, $P8, 0)
    $P3.'setvalue'($P7)
.annotate 'line', 9803
# var ctrue: $P4
    $P4 = $P1.'createconst'('true', 'I', 4)
.annotate 'line', 9805
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9804
    $P7 = WSubId_21($P1, $P8, 1)
    $P4.'setvalue'($P7)
.annotate 'line', 9809
# var cstage: $P5
    $P5 = $P1.'createconst'('__STAGE__', 'S', 4)
.annotate 'line', 9810
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 9811
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P11, $P2, 'file'
    getattribute $P12, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9810
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P10.'TokenQuoted'($P11, $P12, $S1)
    set $P9, $P10
    $P8.'StringLiteral'($P1, $P9)
    set $P7, $P8
    $P5.'setvalue'($P7)
.annotate 'line', 9813
# var cerrtype: $P6
    $P6 = $P1.'createconst'('__WINXED_ERROR__', 'S', 4)
.annotate 'line', 9815
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, '__WINXED_ERROR__')
    set $P8, $P9
.annotate 'line', 9814
    $P7 = WSubId_21($P1, $P8, 567)
    $P6.'setvalue'($P7)
.annotate 'line', 9817
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9818

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9821
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9822

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9825
    getattribute $P1, self, 'warnings'
.annotate 'line', 9824
    set $I1, $P1
.annotate 'line', 9825
    .return($I1)
# }
.annotate 'line', 9826

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9829
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 9830
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 9831

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9834
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9835

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9838
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 9839
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9840
    __ARG_1.'say'('')
.annotate 'line', 9842
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9844
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9845

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9848
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9849
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9851
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9853
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9854

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9789
    addattribute $P0, 'rootns'
.annotate 'line', 9790
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
.annotate 'line', 9863
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 9864
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 9865
# var handleout: $P1
    null $P1
.annotate 'line', 9866
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 9867
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9868
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 9871
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 9872
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9873
    if_null __ARG_4, __label_4
    unless __ARG_4 goto __label_4
.annotate 'line', 9874
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 9875
    __ARG_1.'emit'($P2)
.annotate 'line', 9876
    $P2.'close'()
.annotate 'line', 9877
    if_null __ARG_3, __label_5
.annotate 'line', 9878
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 9880
    $P1.'close'()
.annotate 'line', 9881
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9882
# var object: $P3
    null $P3
# switch
.annotate 'line', 9883
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 9885
    new $P3, [ 'String' ]
.annotate 'line', 9886
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 9890
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9891
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 9892
# predefined string
.annotate 'line', 9894
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 9896
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 9898

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9901
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9902
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9903
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9904
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9905
    $P2.'close'()
.annotate 'line', 9906
    $P1.'close'()
.annotate 'line', 9907
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9908

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9915
    unless_null __ARG_2, __label_1
.annotate 'line', 9916
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9917
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9918
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9919
    $P1.'puts'(__ARG_1)
.annotate 'line', 9920
    $P1.'close'()
.annotate 'line', 9921
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9922
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9923
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9924
    unless __ARG_5 goto __label_2
.annotate 'line', 9925
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9926
    $P3.'parse'($P2)
.annotate 'line', 9927
    $P1.'close'()
.annotate 'line', 9928
    $P3.'optimize'()
.annotate 'line', 9929
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9930
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9932
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_4: # endif
# }
.annotate 'line', 9933

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9941
    unless_null __ARG_2, __label_1
.annotate 'line', 9942
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9943
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9944
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9945
    $P1.'encoding'('utf8')
.annotate 'line', 9946
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9947
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9948
    unless __ARG_5 goto __label_2
.annotate 'line', 9949
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9950
    $P3.'parse'($P2)
.annotate 'line', 9951
    $P1.'close'()
.annotate 'line', 9952
    $P3.'optimize'()
.annotate 'line', 9953
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9954
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9956
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_4: # endif
# }
.annotate 'line', 9957

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9966
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 9967
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9968

.end # initializer

# End generated code
