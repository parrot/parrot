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
# Body
# {
.annotate 'line', 122
.const 'Sub' WSubId_1 = 'WSubId_1'
    concat $S1, "Expected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 123

.end # Expected


.sub 'Unexpected' :subid('WSubId_41')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 127
.const 'Sub' WSubId_1 = 'WSubId_1'
    concat $S1, "Unexpected ", __ARG_1
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 128

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 132
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("Expected identifier", __ARG_1)
# }
.annotate 'line', 133

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 137
.const 'Sub' WSubId_1 = 'WSubId_1'
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    WSubId_1($S1, __ARG_2)
# }
.annotate 'line', 138

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 142
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 143
.const 'Sub' WSubId_2 = 'WSubId_2'
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 144

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 148
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 149
.const 'Sub' WSubId_2 = 'WSubId_2'
    WSubId_2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 150

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_92')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 154
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 155
.const 'Sub' WSubId_3 = 'WSubId_3'
    WSubId_3(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 156

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_54')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 160
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 161
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4(__ARG_1, $P1)
# }
.annotate 'line', 162

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_94')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 166
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 167
.const 'Sub' WSubId_5 = 'WSubId_5'
    WSubId_5(__ARG_1, $P1)
# }
.annotate 'line', 168

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_59')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 172
.const 'Sub' WSubId_1 = 'WSubId_1'
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
# Body
# {
.annotate 'line', 206
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Not a literal string', self)
# }
.annotate 'line', 207

.end # rawstring


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 210
.const 'Sub' WSubId_3 = 'WSubId_3'
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
.const 'Sub' WSubId_7 = 'WSubId_7'
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
.const 'Sub' WSubId_7 = 'WSubId_7'
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
.const 'Sub' WSubId_7 = 'WSubId_7'
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
.const 'Sub' WSubId_7 = 'WSubId_7'
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
.const 'Sub' WSubId_7 = 'WSubId_7'
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
.const 'Sub' WSubId_8 = 'WSubId_8'
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
.const 'Sub' WSubId_9 = 'WSubId_9'
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
.const 'Sub' WSubId_10 = 'WSubId_10'
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
.const 'Sub' WSubId_9 = 'WSubId_9'
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
.const 'Sub' WSubId_9 = 'WSubId_9'
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
.const 'Sub' WSubId_9 = 'WSubId_9'
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
.const 'Sub' WSubId_7 = 'WSubId_7'
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
.const 'Sub' WSubId_7 = 'WSubId_7'
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
.const 'Sub' WSubId_11 = 'WSubId_11'
    $P3[''] = WSubId_11
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P3['{'] = WSubId_12
    $P1['$'] = $P3
.annotate 'line', 580
.const 'Sub' WSubId_13 = 'WSubId_13'
    $P1['"'] = WSubId_13
.annotate 'line', 581
.const 'Sub' WSubId_14 = 'WSubId_14'
    $P1["'"] = WSubId_14
.annotate 'line', 582
    root_new $P9, ['parrot';'Hash']
.annotate 'line', 583
    root_new $P11, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P11[''] = WSubId_12
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P11['='] = WSubId_12
    $P9['='] = $P11
.annotate 'line', 584
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P9[':'] = WSubId_12
    $P1['='] = $P9
.annotate 'line', 586
    root_new $P16, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P16['+'] = WSubId_12
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P16['='] = WSubId_12
    $P1['+'] = $P16
.annotate 'line', 587
    root_new $P20, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P20['-'] = WSubId_12
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P20['='] = WSubId_12
    $P1['-'] = $P20
.annotate 'line', 588
    root_new $P24, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P24['='] = WSubId_12
    $P1['*'] = $P24
.annotate 'line', 589
    root_new $P27, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P27['|'] = WSubId_12
    $P1['|'] = $P27
.annotate 'line', 590
    root_new $P30, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P30['&'] = WSubId_12
    $P1['&'] = $P30
.annotate 'line', 591
    root_new $P33, ['parrot';'Hash']
.annotate 'line', 592
    root_new $P35, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P35[''] = WSubId_12
.const 'Sub' WSubId_15 = 'WSubId_15'
    $P35[':'] = WSubId_15
    $P33['<'] = $P35
.annotate 'line', 593
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P33['='] = WSubId_12
    $P1['<'] = $P33
.annotate 'line', 595
    root_new $P40, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P40['>'] = WSubId_12
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P40['='] = WSubId_12
    $P1['>'] = $P40
.annotate 'line', 596
    root_new $P44, ['parrot';'Hash']
.annotate 'line', 597
    root_new $P46, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P46[''] = WSubId_12
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P46['='] = WSubId_12
    $P44['='] = $P46
    $P1['!'] = $P44
.annotate 'line', 599
    root_new $P50, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P50['%'] = WSubId_12
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P50['='] = WSubId_12
    $P1['%'] = $P50
.annotate 'line', 600
    root_new $P54, ['parrot';'Hash']
.const 'Sub' WSubId_12 = 'WSubId_12'
    $P54['='] = WSubId_12
.const 'Sub' WSubId_16 = 'WSubId_16'
    $P54['/'] = WSubId_16
.const 'Sub' WSubId_17 = 'WSubId_17'
    $P54['*'] = WSubId_17
    $P1['/'] = $P54
.annotate 'line', 601
.const 'Sub' WSubId_16 = 'WSubId_16'
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
.const 'Sub' WSubId_18 = 'WSubId_18'
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
.const 'Sub' WSubId_19 = 'WSubId_19'
    $P3 = WSubId_19($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 635
.const 'Sub' WSubId_11 = 'WSubId_11'
    .tailcall WSubId_11(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 636
.const 'Sub' WSubId_9 = 'WSubId_9'
    $P3 = WSubId_9($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 637
.const 'Sub' WSubId_20 = 'WSubId_20'
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
.const 'Sub' WSubId_12 = 'WSubId_12'
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
.const 'Sub' WSubId_6 = 'WSubId_6'
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
.const 'Sub' WSubId_1 = 'WSubId_1'
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
.const 'Sub' WSubId_6 = 'WSubId_6'
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
.const 'Sub' WSubId_6 = 'WSubId_6'
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
.const 'Sub' WSubId_6 = 'WSubId_6'
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
.const 'Sub' WSubId_6 = 'WSubId_6'
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
.const 'Sub' WSubId_1 = 'WSubId_1'
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
.const 'Sub' WSubId_21 = 'WSubId_21'
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
.const 'Sub' WSubId_21 = 'WSubId_21'
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
.const 'Sub' WSubId_21 = 'WSubId_21'
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
.const 'Sub' WSubId_21 = 'WSubId_21'
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
.const 'Sub' WSubId_21 = 'WSubId_21'
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
.const 'Sub' WSubId_21 = 'WSubId_21'
# predefined indexof
.annotate 'line', 1276
    index $I2, $S1, $S2, $I1
.annotate 'line', 1283
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1284

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_35')
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
.const 'Sub' WSubId_22 = 'WSubId_22'
    $P46.'PredefFunctionEval'('length', WSubId_22, 'length %0, %1', 'I', 'S')
    set $P45, $P46
.annotate 'line', 1288
    push $P1, $P45
.annotate 'line', 1390
    new $P48, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1391
.const 'Sub' WSubId_23 = 'WSubId_23'
    $P48.'PredefFunctionEval'('bytelength', WSubId_23, 'bytelength %0, %1', 'I', 'S')
    set $P47, $P48
.annotate 'line', 1288
    push $P1, $P47
.annotate 'line', 1395
    new $P50, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1396
.const 'Sub' WSubId_24 = 'WSubId_24'
    $P50.'PredefFunctionEval'('chr', WSubId_24, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P49, $P50
.annotate 'line', 1288
    push $P1, $P49
.annotate 'line', 1404
    new $P52, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1405
.const 'Sub' WSubId_25 = 'WSubId_25'
    $P52.'PredefFunctionEval'('ord', WSubId_25, 'ord %0, %1', 'I', 'S')
    set $P51, $P52
.annotate 'line', 1288
    push $P1, $P51
.annotate 'line', 1409
    new $P54, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1410
.const 'Sub' WSubId_26 = 'WSubId_26'
    $P54.'PredefFunctionEval'('ord', WSubId_26, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P53, $P54
.annotate 'line', 1288
    push $P1, $P53
.annotate 'line', 1414
    new $P56, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1415
.const 'Sub' WSubId_27 = 'WSubId_27'
    $P56.'PredefFunctionEval'('substr', WSubId_27, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P55, $P56
.annotate 'line', 1288
    push $P1, $P55
.annotate 'line', 1419
    new $P58, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1420
.const 'Sub' WSubId_28 = 'WSubId_28'
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
.const 'Sub' WSubId_29 = 'WSubId_29'
    $P62.'PredefFunctionEval'('indexof', WSubId_29, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P61, $P62
.annotate 'line', 1288
    push $P1, $P61
.annotate 'line', 1433
    new $P64, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1434
.const 'Sub' WSubId_30 = 'WSubId_30'
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
.const 'Sub' WSubId_31 = 'WSubId_31'
    $P136.'PredefFunction'('print', WSubId_31, 'v', '*')
    set $P135, $P136
.annotate 'line', 1288
    push $P1, $P135
.annotate 'line', 1594
    new $P138, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1595
.const 'Sub' WSubId_32 = 'WSubId_32'
    $P138.'PredefFunction'('say', WSubId_32, 'v', '*')
    set $P137, $P138
.annotate 'line', 1288
    push $P1, $P137
.annotate 'line', 1598
    new $P140, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1599
.const 'Sub' WSubId_33 = 'WSubId_33'
    $P140.'PredefFunction'('cry', WSubId_33, 'v', '*')
    set $P139, $P140
.annotate 'line', 1288
    push $P1, $P139
.annotate 'line', 1602
    new $P142, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1603
.const 'Sub' WSubId_34 = 'WSubId_34'
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
# Body
# {
.annotate 'line', 1613
.const 'Sub' WSubId_35 = 'WSubId_35'
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
.const 'Sub' WSubId_1 = 'WSubId_1'
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
.const 'Sub' WSubId_3 = 'WSubId_3'
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


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1746
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1747

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1750
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1751

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1754
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1755

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1758
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1759

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1762
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1763

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
# Body
# {
.annotate 'line', 1778
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 1779

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1783
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1782
    elements $I1, $P1
.annotate 'line', 1783
    .return($I1)
# }
.annotate 'line', 1784

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1787
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1788
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1789

.end # getarg


.sub 'optimizeargs' :method
# Body
# {
.annotate 'line', 1793
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'args'
    WSubId_38($P1)
# }
.annotate 'line', 1794

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1797
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1798
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1799
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1800
    .return($P1)
# }
.annotate 'line', 1801

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1804
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1805

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 1774
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1817
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1820
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1821
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1822
    .return($I1)
# }
.annotate 'line', 1823

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1826
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1827
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 1828
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1829
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1830

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1833
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1834
    if_null __ARG_2, __label_1
.annotate 'line', 1835
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1836

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1839
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1840
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1841
    .return(self)
# }
.annotate 'line', 1842

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 1814
    addattribute $P0, 'name'
.annotate 'line', 1815
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1847
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1848
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1849
    $P1 = __ARG_1.'get'()
.annotate 'line', 1850
# var args: $P2
    null $P2
.annotate 'line', 1851
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1852
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1854
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1855
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1856

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1865
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_39 = 'WSubId_39'
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_39, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 1866

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1869
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'list'
    WSubId_38($P1)
# }
.annotate 'line', 1870

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1871
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1874
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1875
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1876
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1878
    .return($P2)
# }
.annotate 'line', 1879

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 1861
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1888
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1889
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1890

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_107')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1894
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1895
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1897
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1898
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1900

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1904
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1906
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1908
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 1910
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1907
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1909
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 1911
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 1913
    __ARG_2.'unget'($P1)
.annotate 'line', 1914
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 1916

.end # parseUsing


.sub 'parseSig' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1920
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1921
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1922
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 1923
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("'='", $P2)
  __label_1: # endif
.annotate 'line', 1924
# var expr: $P3
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P3 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 1925
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'($P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1926

.end # parseSig


.sub 'parseStatement' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1930
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1931
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1932
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 1933
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1934
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1935
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 1936
    new $P6, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 1937
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1938
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1939
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.annotate 'line', 1940
.const 'Sub' WSubId_41 = 'WSubId_41'
    WSubId_41("':'", $P1)
  __label_5: # endif
.annotate 'line', 1941
.const 'Sub' WSubId_42 = 'WSubId_42'
    .tailcall WSubId_42($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 1944
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
.annotate 'line', 1946
.const 'Sub' WSubId_43 = 'WSubId_43'
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 1948
.const 'Sub' WSubId_44 = 'WSubId_44'
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 1951
.const 'Sub' WSubId_45 = 'WSubId_45'
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 1954
.const 'Sub' WSubId_46 = 'WSubId_46'
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1956
.const 'Sub' WSubId_47 = 'WSubId_47'
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1958
.const 'Sub' WSubId_48 = 'WSubId_48'
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1960
.const 'Sub' WSubId_49 = 'WSubId_49'
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 1962
    new $P6, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 1964
    new $P8, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_17: # case
.annotate 'line', 1966
    new $P10, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_18: # case
.annotate 'line', 1968
    new $P12, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_19: # case
.annotate 'line', 1970
    new $P14, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_20: # case
.annotate 'line', 1972
    new $P16, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_21: # case
.annotate 'line', 1974
    new $P18, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_22: # case
.annotate 'line', 1976
    new $P20, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_23: # case
.annotate 'line', 1978
.const 'Sub' WSubId_50 = 'WSubId_50'
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1980
.const 'Sub' WSubId_51 = 'WSubId_51'
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 1982
    new $P22, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_26: # case
.annotate 'line', 1984
    new $P24, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_7: # default
.annotate 'line', 1986
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_27
    unless $P25 goto __label_27
# {
.annotate 'line', 1987
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1988
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 1989
    new $P6, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 1990
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 1992
    __ARG_1.'unget'($P1)
.annotate 'line', 1993
    new $P5, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.annotate 'line', 1995
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('parseStatement failure', $P1)
# }
.annotate 'line', 1996

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2006
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2007

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2008
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2011
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2012

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2015
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2016

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2019
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2020

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2023
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2024

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2027
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2028

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2031
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2032

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2035
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2036

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2039
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2040

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2043
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2044

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2047
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2048

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2051
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2052

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2055
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2056

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2059
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2060

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2067
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2068

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2071
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2072

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2075
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2076

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2079
.const 'Sub' WSubId_6 = 'WSubId_6'
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2081
    .return(self)
# }
.annotate 'line', 2082

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2002
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2087
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2090
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2091

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2092
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2085
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2105
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2106
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2107
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2108
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2109
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2110
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2111
    null $I2
  __label_4: # endif
.annotate 'line', 2112
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2108
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2114
    unless $I2 goto __label_6
.annotate 'line', 2115
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2117
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2118

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2101
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2125
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2126
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2127

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2128
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2131
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2132
    .return(self)
# }
.annotate 'line', 2133

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2136
.const 'Sub' WSubId_52 = 'WSubId_52'
    getattribute $P1, self, 'statements'
    WSubId_52(__ARG_1, $P1)
# }
.annotate 'line', 2137

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2121
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2142
    unless_null __ARG_1, __label_1
.annotate 'line', 2143
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2144
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2145
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2147
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2148

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2156
# var arg: $P1
    null $P1
.annotate 'line', 2157
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2158
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2159
    $P2 = __ARG_1.'get'()
.annotate 'line', 2160
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2161
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2164
    __ARG_1.'unget'($P2)
.annotate 'line', 2165
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P1 = WSubId_37(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2167
    .return($P1)
# }
.annotate 'line', 2168

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2177
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2178
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2179
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2180
    unless $I1 goto __label_1
.annotate 'line', 2181
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2182
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2183
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2184
    $P1 = __ARG_2.'get'()
.annotate 'line', 2185
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2186
    __ARG_2.'unget'($P1)
.annotate 'line', 2187
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_53 = 'WSubId_53'
    $P3 = WSubId_36(__ARG_2, __ARG_3, WSubId_53, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2189
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2190

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2193
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 2194
    .return(self)
# }
.annotate 'line', 2195

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2198
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2199
    self.'annotate'(__ARG_1)
.annotate 'line', 2200
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2201
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2202
    __ARG_1.'print'('    ')
.annotate 'line', 2203
    unless_null $P1, __label_2
.annotate 'line', 2204
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2206
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2207
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2208
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2209
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2211

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2170
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2172
    addattribute $P0, 'opname'
.annotate 'line', 2173
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2223
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2224
# var path: $P1
.const 'Sub' WSubId_55 = 'WSubId_55'
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2225
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2226
.const 'Sub' WSubId_3 = 'WSubId_3'
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2227
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
.annotate 'line', 2228
.const 'Sub' WSubId_56 = 'WSubId_56'
    $P3 = WSubId_56($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2229
    .return(self)
# }
.annotate 'line', 2230

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2231
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2234
    self.'annotate'(__ARG_1)
.annotate 'line', 2235
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2236

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2218
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2220
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2248
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2249
# var names: $P1
.const 'Sub' WSubId_36 = 'WSubId_36'
    null $P3
.const 'Sub' WSubId_57 = 'WSubId_57'
    $P1 = WSubId_36(__ARG_2, $P3, WSubId_57, ';')
.annotate 'line', 2250
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2251
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2252
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2254
    setattribute self, 'names', $P1
# }
.annotate 'line', 2255

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2258
    .return(self)
# }
.annotate 'line', 2259

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2262
    self.'annotate'(__ARG_1)
.annotate 'line', 2263
    getattribute $P3, self, 'names'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2264
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2265
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2267

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2243
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2245
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2281
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2282
# var path: $P1
.const 'Sub' WSubId_55 = 'WSubId_55'
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2283
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2284
.const 'Sub' WSubId_3 = 'WSubId_3'
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2285
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
.annotate 'line', 2286
    setattribute self, 'path', $P1
# }
.annotate 'line', 2287

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2290
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2291
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2293
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2295
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2309
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2296
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2297
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2298
    $P4.'pop'()
.annotate 'line', 2299
# var ns: $P5
    $P5 = self.'findns'($P4)
.annotate 'line', 2300
    if_null $P5, __label_6
# {
.annotate 'line', 2301
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2302
    if_null $P3, __label_7
# {
.annotate 'line', 2303
    self.'createvarused'($P2, $P3)
.annotate 'line', 2304
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
.annotate 'line', 2310
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2311
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2312
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2313
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2315
    self.'createvar'($P2, 'P')
.annotate 'line', 2316
    .return(self)
# }
.annotate 'line', 2317

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2320
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2321
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2322
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2323
    getattribute $P3, self, 'subid'
    if_null $P3, __label_1
# {
.annotate 'line', 2324
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2325
    __ARG_1.'say'(".const 'Sub' ", $S2, ' = "', $S2, '"')
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2328
    self.'annotate'(__ARG_1)
.annotate 'line', 2329
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2330
    $P1.'pop'()
# switch
.annotate 'line', 2331
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 2333
    __ARG_1.'say'("'", $S1, "'")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 2336
.const 'Sub' WSubId_58 = 'WSubId_58'
    $P3 = WSubId_58($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_4: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2339

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2274
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2276
    addattribute $P0, 'path'
.annotate 'line', 2277
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2350
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2351
# var nskey: $P1
.const 'Sub' WSubId_55 = 'WSubId_55'
    $P1 = WSubId_55(__ARG_2)
.annotate 'line', 2352
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2353
    ge $I1, 1, __label_1
.annotate 'line', 2354
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2355
# var nssym: $P2
.const 'Sub' WSubId_56 = 'WSubId_56'
    $P3 = WSubId_56($P1)
    $P2 = __ARG_3.'findns'($P3)
.annotate 'line', 2357
    unless_null $P2, __label_2
.annotate 'line', 2358
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2359
    __ARG_3.'usenamespace'($P2)
.annotate 'line', 2361
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2362

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2365
    .return(self)
# }
.annotate 'line', 2366

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2346
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2381
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2382
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2383
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 2384

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2387
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2388
    .return(self)
# }
.annotate 'line', 2389

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2392
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2393

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2376
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2378
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
.annotate 'line', 2410
    setattribute self, 'type', __ARG_1
.annotate 'line', 2411
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2412
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2413
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2414

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2417
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2418

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2419
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2420
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2421
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2422
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2423
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2424
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2425
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2402
    addattribute $P0, 'type'
.annotate 'line', 2403
    addattribute $P0, 'reg'
.annotate 'line', 2404
    addattribute $P0, 'scope'
.annotate 'line', 2405
    addattribute $P0, 'flags'
.annotate 'line', 2406
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2433
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2434

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 2437
.const 'Sub' WSubId_6 = 'WSubId_6'
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2438

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2430
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
.annotate 'line', 2447
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2448

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2449
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2452
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2453
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2454
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2455

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2441
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2443
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2466
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2467

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2470
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2471
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2472
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2473
    if_null $P2, __label_2
.annotate 'line', 2474
.const 'Sub' WSubId_1 = 'WSubId_1'
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2475
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2476
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2477
    $P1[$S1] = $P3
.annotate 'line', 2478
    .return($P3)
# }
.annotate 'line', 2479

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2482
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2483
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2484
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2485
    if_null $P2, __label_2
.annotate 'line', 2486
.const 'Sub' WSubId_1 = 'WSubId_1'
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2487
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2488

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
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
.const 'Sub' WSubId_1 = 'WSubId_1'
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2496
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2497

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2500
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2501
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2502
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2503
    if_null $P2, __label_2
.annotate 'line', 2504
.const 'Sub' WSubId_1 = 'WSubId_1'
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2505
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2506
    $P1[$S1] = $P3
.annotate 'line', 2507
    .return($P3)
# }
.annotate 'line', 2508

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2511
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2510
    set $S1, __ARG_1
.annotate 'line', 2512
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2513

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2516
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 2517
    if_null $P1, __label_1
# {
.annotate 'line', 2518
# var sym: $P2
    null $P2
.annotate 'line', 2519
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 2520
    $P2 = $P3.'getlocalvar'(__ARG_1)
    if_null $P2, __label_4
.annotate 'line', 2521
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
    null $P5
.annotate 'line', 2524
    .return($P5)
# }
.annotate 'line', 2525

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2528
# var sym: $P1
    null $P1
.annotate 'line', 2529
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2530
    .return($P1)
  __label_1: # endif
.annotate 'line', 2531
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2532
    .return($P1)
  __label_2: # endif
.annotate 'line', 2533
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2534
    if_null $P2, __label_3
.annotate 'line', 2535
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2536
    .return($P3)
# }
.annotate 'line', 2537

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2540
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2541
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2542
    .return($S1)
# }
.annotate 'line', 2543

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2546
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2548
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2549
    .return('__WLEX_self')
# }
.annotate 'line', 2550

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2461
    addattribute $P0, 'locals'
.annotate 'line', 2462
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2559
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
.annotate 'line', 2571
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2572

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2573
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2574
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2575
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2576
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2577
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2578
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2579
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2580
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2581
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2584
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2585

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2589
    .return(self)
# }
.annotate 'line', 2590

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2591
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2594
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2595
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2596
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2597
    .return($S2)
# }
.annotate 'line', 2598

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2601
# reg: $S1
    null $S1
.annotate 'line', 2602
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2603
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2605
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2606
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2608
    .return($S1)
# }
.annotate 'line', 2609

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2612
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Not a left-side expression', self)
# }
.annotate 'line', 2613

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2567
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2618
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2616
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2628
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2629
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2630
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2631
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2632
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2633

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2634
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2637
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2638
    .return(self)
# }
.annotate 'line', 2639

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2642
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2643
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2644
    self.'annotate'(__ARG_1)
.annotate 'line', 2645
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2646
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 2647
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 2648

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2623
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2625
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
.annotate 'line', 2663
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2664
    .return(self)
# }
.annotate 'line', 2665

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2668
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2669

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2672
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2673
    .return(self)
# }
.annotate 'line', 2674

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2677
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2678
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2679
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2681
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2682
    ne $I1, 0, __label_5
.annotate 'line', 2683
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2685
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2688
    .return(0)
# }
.annotate 'line', 2689

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2692
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2694
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2695
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2696
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2698
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2699
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
.annotate 'line', 2702
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2705
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2708
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2711

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2714
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2716
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2717
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2718
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2720
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2721
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
.annotate 'line', 2724
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2727
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2730
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2733

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2660
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2740
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2741
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2738
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2751
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2752
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2753

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2754
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2755
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2758
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2759
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2760
# typesinglequoted: $I1
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
.annotate 'line', 2761
# need_unicode: $I2
    null $I2
.annotate 'line', 2762
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $I3, $P3
# {
.annotate 'line', 2763
    le $I3, 127, __label_4
# {
.annotate 'line', 2764
    set $I2, 1
    goto __label_3 # break
.annotate 'line', 2765
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 2768
    unless $I2 goto __label_5
# {
.annotate 'line', 2769
    unless $I1 goto __label_6
# {
.annotate 'line', 2770
    null $I1
.annotate 'line', 2771
# saux: $S2
    set $S2, $S1
.annotate 'line', 2772
    set $S1, ''
.annotate 'line', 2773
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_7: # for iteration
    unless $P4 goto __label_8
    shift $S3, $P4
# {
.annotate 'line', 2774
    ne $S3, '\', __label_9
.annotate 'line', 2775
    set $S3, '\\'
  __label_9: # endif
.annotate 'line', 2776
    concat $S1, $S1, $S3
# }
    goto __label_7
  __label_8: # endfor
# }
  __label_6: # endif
.annotate 'line', 2779
# result: $S4
    set $S4, ''
.annotate 'line', 2780
    box $P2, $S1
    iter $P5, $P2
    set $P5, 0
  __label_10: # for iteration
    unless $P5 goto __label_11
    shift $S5, $P5
# {
.annotate 'line', 2781
# n: $I4
# predefined ord
    ord $I4, $S5
.annotate 'line', 2782
    le $I4, 127, __label_12
# {
.annotate 'line', 2783
# h: $S6
    box $P6, $I4
    $P2 = $P6.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
  __label_14:
.annotate 'line', 2784
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 2787
    concat $S4, $S4, $S5
  __label_13: # endif
# }
    goto __label_10
  __label_11: # endfor
.annotate 'line', 2789
    set $S1, $S4
# }
  __label_5: # endif
.annotate 'line', 2791
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
  __label_16:
    set $S7, '"'
  __label_15:
.annotate 'line', 2792
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2793
    unless $I2 goto __label_17
.annotate 'line', 2794
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_17: # endif
.annotate 'line', 2795
    .return($S1)
# }
.annotate 'line', 2796

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2799
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2800
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2801
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2802
# var s: $P2
    box $P2, $S1
.annotate 'line', 2803
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2805
    .return($S1)
# }
.annotate 'line', 2806

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2809
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2810
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2811

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2814
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2815

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2746
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2748
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
.annotate 'line', 2827
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2828
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2829
# n: $I1
    null $I1
.annotate 'line', 2830
    unless __ARG_4 goto __label_1
.annotate 'line', 2831
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2833
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2834
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2836
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2837

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2838
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2839
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2842
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2841
    set $I1, $S1
.annotate 'line', 2843
    .return($I1)
# }
.annotate 'line', 2844

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2847
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2848
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2849
    ne $I1, 0, __label_2
.annotate 'line', 2850
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2852
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2854

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2857
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2858

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 2820
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2822
    addattribute $P0, 'pos'
.annotate 'line', 2823
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2868
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2869
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2870

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2871
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2872
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2875
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2876
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2877
    assign $P1, $S1
.annotate 'line', 2878
    .return($P1)
# }
.annotate 'line', 2879

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2882
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2883
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2884
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2886

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2891
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2892
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2893
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2894
    .return($S1)
# }
.annotate 'line', 2895

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 2863
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2865
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2904
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2907
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2908
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2909

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2912
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2913

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2916
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2917
    if_null $P1, __label_1
.annotate 'line', 2918
    .tailcall $P1.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2920
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2923
    .return('P')
  __label_4: # default
.annotate 'line', 2925
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2928

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2931
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2932
    .return($S1)
# }
.annotate 'line', 2933

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2936
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2937
    unless_null $P1, __label_1
.annotate 'line', 2938
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 2939
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 2940
# s: $S1
    null $S1
.annotate 'line', 2941
    unless_null $P2, __label_2
# {
.annotate 'line', 2942
# sname: $S2
    set $P3, $P1
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
# switch
.annotate 'line', 2943
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_7
    set $S4, 'null'
    if $S3 == $S4 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 2945
    set $S1, 'self'
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 2947
    set $S1, 'null'
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2949
    set $S1, ''
  __label_5: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 2953
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 2954
    .return($S1)
# }
.annotate 'line', 2955

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2958
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2959
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 2960
.const 'Sub' WSubId_59 = 'WSubId_59'
    getattribute $P2, self, 'name'
    WSubId_59($P2)
  __label_1: # endif
.annotate 'line', 2961
    .return($P1)
# }
.annotate 'line', 2962

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2965
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2966
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 2967
    if_null $P2, __label_1
# {
.annotate 'line', 2968
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2969
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 2970
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 2971
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2972
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 2973
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 2980
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 2981
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 2982
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
.annotate 'line', 2986
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'findsymbol'($P5)
.annotate 'line', 2987
    if_null $P4, __label_9
# {
.annotate 'line', 2988
# id: $S1
    $P5 = $P4.'makesubid'()
    null $S1
    if_null $P5, __label_10
    set $S1, $P5
  __label_10:
.annotate 'line', 2989
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 2991
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 2994
    .return(self)
# }
.annotate 'line', 2995

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2998
# id: $S1
    null $S1
.annotate 'line', 2999
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
# {
.annotate 'line', 3000
    getattribute $P3, self, 'subid'
    set $S1, $P3
.annotate 'line', 3001
    concat $S3, ".const 'Sub' ", $S1
    concat $S3, $S3, " = '"
    concat $S3, $S3, $S1
    concat $S3, $S3, "'"
    __ARG_1.'say'($S3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3004
    $P2 = self.'getIdentifier'()
    set $S1, $P2
.annotate 'line', 3005
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3006
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3007
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3008
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3009
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3010
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3011
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3015
    .return($S1)
# }
.annotate 'line', 3016

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3019
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3020
    self.'annotate'(__ARG_1)
.annotate 'line', 3021
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3022
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3024

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3027
    self.'annotate'(__ARG_1)
.annotate 'line', 3028
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3029

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3032
    self.'annotate'(__ARG_1)
.annotate 'line', 3033
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# predefined die
.annotate 'line', 3034
    die "NO"
  __label_1: # endif
.annotate 'line', 3035
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3036
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3037
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3038
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3041
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3044
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3047
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3048
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3050
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3051
    ne $S3, 'v', __label_13
.annotate 'line', 3052
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3053
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3054
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3057
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3058
    self.'annotate'(__ARG_1)
.annotate 'line', 3059
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3060
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3062
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3065
    .return($S2)
# }
.annotate 'line', 3066

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 2900
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2902
    addattribute $P0, 'name'
.annotate 'line', 2903
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3076
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3077
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3078

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3079
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3082
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3083
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3084
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3085
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3086
    .return($S2)
# }
.annotate 'line', 3087

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3090
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3091
    self.'annotate'(__ARG_1)
.annotate 'line', 3092
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3093
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3095

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3098
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
# switch-case
.annotate 'line', 3100
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3103
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3101
    __ARG_1.'emitnull'($S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3104
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3107
# typeright: $S2
    $P2 = __ARG_2.'checkresult'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 3108
    ne 'P', $S2, __label_7
.annotate 'line', 3109
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3111
# rreg: $S3
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 3112
    self.'annotate'(__ARG_1)
.annotate 'line', 3113
    __ARG_1.'emitbox'($S1, $S3)
# }
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 3117
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3118
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
.annotate 'line', 3119
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 3120

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3071
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3073
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3129
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3130

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3125
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3141
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3142
.const 'Sub' WSubId_60 = 'WSubId_60'
    $P2 = WSubId_60(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3143

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3144
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3147
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3150
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3151
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3152
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3153
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3154
    __ARG_1.'say'()
# }
.annotate 'line', 3155

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3135
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3137
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3165
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3166
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3167

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3170
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3171

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3174
    self.'optimizearg'()
.annotate 'line', 3175
    .return(self)
# }
.annotate 'line', 3176

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3160
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3162
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
.annotate 'line', 3187
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3188
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3189
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3190

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3193
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3194
    .return(self)
# }
.annotate 'line', 3195

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3198
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3199

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3202
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3203
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3204

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3207
    self.'optimizearg'()
.annotate 'line', 3208
    .return(self)
# }
.annotate 'line', 3209

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3212
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3213

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3216
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3217

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3181
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3183
    addattribute $P0, 'lexpr'
.annotate 'line', 3184
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3226
    .return('I')
# }
.annotate 'line', 3227

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3230
    self.'optimizearg'()
.annotate 'line', 3231
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3232
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3233
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3234
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3235
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3236
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3238
    .return(self)
# }
.annotate 'line', 3239

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3222
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3248
    .return('I')
# }
.annotate 'line', 3249

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3244
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
.annotate 'line', 3257
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3258

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3261
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3262
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3263
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3264
    self.'annotate'(__ARG_1)
.annotate 'line', 3265
    __ARG_1.'print'('    delete ')
.annotate 'line', 3266
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3267
    __ARG_1.'say'()
.annotate 'line', 3268
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3269
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3272
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3273

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3253
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
.annotate 'line', 3280
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3281

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3284
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3285
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
.annotate 'line', 3286
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3287
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3288
    self.'annotate'(__ARG_1)
.annotate 'line', 3289
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3290
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3291
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3294
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3295

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3276
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
.annotate 'line', 3304
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3305

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3308
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3309

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3312
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3313
    .return(self)
# }
.annotate 'line', 3314

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3317
    self.'optimizearg'()
.annotate 'line', 3318
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3319
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3320
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3321
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3324
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3325
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3326
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3327
.const 'Sub' WSubId_61 = 'WSubId_61'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall WSubId_61($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3330
    .return(self)
# }
.annotate 'line', 3331

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3334
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3335
    self.'annotate'(__ARG_1)
.annotate 'line', 3336
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3337

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3300
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
.annotate 'line', 3346
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3347

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3348
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3351
    .return('I')
# }
.annotate 'line', 3352

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3355
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3356
    .return(self)
# }
.annotate 'line', 3357

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3360
    self.'optimizearg'()
.annotate 'line', 3361
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3362
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3363
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3364
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3365
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P3, $P4, $I2)
# }
  __label_1: # endif
.annotate 'line', 3367
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3368
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3369
    .return(self)
# }
.annotate 'line', 3370

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3373
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3374

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3377
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3378
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3379
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3380
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3382
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3385
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3388
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3390

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3342
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3399
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3400

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3395
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3409
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3410
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3411
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3412

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3405
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
.annotate 'line', 3419
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3420

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3423
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3424
    self.'annotate'(__ARG_1)
.annotate 'line', 3425
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3426
    .return($S1)
# }
.annotate 'line', 3427

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3415
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
.annotate 'line', 3434
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3435

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3438
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3439
    self.'annotate'(__ARG_1)
.annotate 'line', 3440
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3441
    .return($S1)
# }
.annotate 'line', 3442

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3430
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
.annotate 'line', 3451
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3452

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3455
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3456
    self.'annotate'(__ARG_1)
.annotate 'line', 3457
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3458
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3459
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3460
    .return($S1)
# }
.annotate 'line', 3461

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3447
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
.annotate 'line', 3468
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3469

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3472
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3473
    self.'annotate'(__ARG_1)
.annotate 'line', 3474
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3475
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3476
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3477
    .return($S1)
# }
.annotate 'line', 3478

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3464
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
.annotate 'line', 3489
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3490
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3491
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3492
    .return(self)
# }
.annotate 'line', 3493

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3496
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3497

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3500
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3501
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3502
    .return(self)
# }
.annotate 'line', 3503

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3506
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3507

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3510
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3511
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3512
    self.'annotate'(__ARG_1)
.annotate 'line', 3513
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3515

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3483
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3485
    addattribute $P0, 'lexpr'
.annotate 'line', 3486
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3524
    self.'annotate'(__ARG_1)
.annotate 'line', 3525
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3526
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3527

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3520
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3536
    self.'annotate'(__ARG_1)
.annotate 'line', 3537
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3538
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3539
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3540

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3543
    self.'annotate'(__ARG_1)
.annotate 'line', 3544
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3545
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3546
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3547
    .return($S1)
# }
.annotate 'line', 3548

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3532
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3557
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3558
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3559
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3560
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3561
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3562
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3563
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3565
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3566
# aux: $S5
    null $S5
.annotate 'line', 3567
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3568
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3570
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3571
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3572
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3573
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3575
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3579
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3580
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3581
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3582
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3584
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3587
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3590
    .return($S3)
# }
.annotate 'line', 3591

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3553
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3600
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3601
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3602
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3603
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3604
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3605
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3606
# aux: $S5
    null $S5
.annotate 'line', 3607
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3608
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3610
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3613
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3614
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3615
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3616
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3618
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3621
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3623
    .return($S3)
# }
.annotate 'line', 3624

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3596
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3633
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3634
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3635
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3636
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3637
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3639
    ne $S2, 'I', __label_7
.annotate 'line', 3640
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3642
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3643
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3645
    self.'annotate'(__ARG_1)
.annotate 'line', 3646
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3649
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3650
    self.'annotate'(__ARG_1)
.annotate 'line', 3651
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3653
    .return($S3)
# }
.annotate 'line', 3654

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3629
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3663
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3664
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3665
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3666
    self.'annotate'(__ARG_1)
.annotate 'line', 3667
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3668
    .return($S2)
# }
.annotate 'line', 3669

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3659
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3678
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3679
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3680
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3681
    self.'annotate'(__ARG_1)
.annotate 'line', 3682
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3683
    .return($S2)
# }
.annotate 'line', 3684

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3674
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3691
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3694
    self.'optimizearg'()
.annotate 'line', 3695
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3696
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3697
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3698
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3699
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3700
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3702
    .return(self)
# }
.annotate 'line', 3703

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3706
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3707
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3708
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3709
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3710
    self.'annotate'(__ARG_1)
.annotate 'line', 3711
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3713
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3718
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3723
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3728
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3733
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3738
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3714
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3715
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3716
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3719
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3720
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3721
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3724
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3725
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3726
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3729
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3730
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3731
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3734
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3735
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3736
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3739
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3740
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3741
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3742
# switch
.annotate 'line', 3745
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3747
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3750
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3753
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3754
# }
.annotate 'line', 3756

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3759
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3760

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3763
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3764

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3767
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3768

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3689
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
.annotate 'line', 3783
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3784
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3785
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3786

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3787
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3788
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3791
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3792
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3793
    .return(self)
# }
.annotate 'line', 3794

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3797
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3798
    self.'annotate'(__ARG_1)
.annotate 'line', 3799
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3800
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3801
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3802

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3805
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3806
    self.'annotate'(__ARG_1)
.annotate 'line', 3807
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
.annotate 'line', 3808

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 3776
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3778
    addattribute $P0, 'expr'
.annotate 'line', 3779
    addattribute $P0, 'checknull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3815
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3818
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3819

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3822
    self.'optimizearg'()
.annotate 'line', 3823
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3824
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3825
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3826
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3827
    unless $I1 goto __label_1
# {
.annotate 'line', 3828
    unless $I2 goto __label_2
.annotate 'line', 3829
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3831
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3833
    unless $I2 goto __label_4
.annotate 'line', 3834
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3835
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3836
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3837
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3838
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3839
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3841
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3842
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3843
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3845
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3846
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3847
.const 'Sub' WSubId_21 = 'WSubId_21'
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
.annotate 'line', 3851
    .return(self)
# }
.annotate 'line', 3852

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3855
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3856

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3859
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3860

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3863
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3864

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3867
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3868

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 3813
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3875
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3878
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3879

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3882
    self.'optimizearg'()
.annotate 'line', 3883
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3884
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3885
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3886
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3887
    unless $I1 goto __label_1
# {
.annotate 'line', 3888
    unless $I2 goto __label_2
.annotate 'line', 3889
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3891
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3893
    unless $I2 goto __label_4
.annotate 'line', 3894
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3895
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3896
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3897
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3898
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3899
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3901
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3902
# ri: $I4
# predefined int
    getattribute $P4, $P2, 'numval'
    set $I4, $P4
.annotate 'line', 3903
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3905
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3906
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3907
.const 'Sub' WSubId_21 = 'WSubId_21'
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
.annotate 'line', 3911
    .return(self)
# }
.annotate 'line', 3912

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3915
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3916

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3919
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3920

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3923
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3924

.end # emitop_if


.sub 'emitop_else' :method
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

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 3873
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
.annotate 'line', 3938
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3939
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3940

.end # OpSameExpr


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
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3945
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
.annotate 'line', 3946

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3949
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
.annotate 'line', 3950

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3953
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3954
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 3955
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3956

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3959
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3960

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3963
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3964
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 3965
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3966

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3969
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3970
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 3971
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3972

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 3933
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3935
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3979
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3982
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3983

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3986
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3987

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3990
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3991

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3994
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3995

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3998
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3999

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 3977
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4006
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4009
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4010

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4013
    isgt $I1, __ARG_1, __ARG_2
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
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4018

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4021
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4022

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4025
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4026

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4004
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4033
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4036
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4037

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4040
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4041

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4044
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4045

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4048
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4049

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4052
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4053

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4031
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4060
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4063
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4064

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4067
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4068

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4071
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4072

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4075
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4076

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4079
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4080

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4058
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4089
    .return('I')
# }
.annotate 'line', 4090

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4085
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
.annotate 'line', 4099
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4100

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4103
    self.'optimizearg'()
.annotate 'line', 4104
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4105
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4106
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4107
    eq $I1, 0, __label_2
.annotate 'line', 4108
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4110
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4112
    .return(self)
# }
.annotate 'line', 4113

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4116
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
.annotate 'line', 4117
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4118
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4119
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4120
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4123
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4124
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4125
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4126
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4127
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4129

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4095
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
.annotate 'line', 4138
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4139

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4142
    self.'optimizearg'()
.annotate 'line', 4143
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4144
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4145
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4146
    ne $I1, 0, __label_2
.annotate 'line', 4147
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4149
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4151
    .return(self)
# }
.annotate 'line', 4152

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4155
# res: $S1
    null $S1
.annotate 'line', 4156
    if_null __ARG_2, __label_1
.annotate 'line', 4157
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4159
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4160
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4161
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4162
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4163
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4166
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4167
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4168
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4169
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4170
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4172

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4134
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4177
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
.annotate 'line', 4187
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4188

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4191
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
.annotate 'line', 4192
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4193
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4194
    self.'annotate'(__ARG_1)
.annotate 'line', 4195
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4196

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4199
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4200

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4183
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
.annotate 'line', 4209
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4210

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4213
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
.annotate 'line', 4214
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4215
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4216
    self.'annotate'(__ARG_1)
.annotate 'line', 4217
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4218

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4221
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4222

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4205
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
.annotate 'line', 4231
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4232

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4235
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
.annotate 'line', 4236
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4237
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4238
    self.'annotate'(__ARG_1)
.annotate 'line', 4239
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4240

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4243
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4244

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4227
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
.annotate 'line', 4254
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4256
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4263
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4257
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4258
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4259
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4261
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4264
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4265
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4268
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4270

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4271
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4274
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4275
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4276
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4277
# i: $I2
    null $I2
# for loop
.annotate 'line', 4278
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4279
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4278
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4280
    .return($P2)
# }
.annotate 'line', 4281

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4284
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4285
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4286
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4287
    self.'annotate'(__ARG_1)
.annotate 'line', 4288
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4289
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4290
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4289
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4291
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4292

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4295
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4296
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4297
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4298
    self.'annotate'(__ARG_1)
.annotate 'line', 4299
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4300
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4301
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4300
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4302
    .return($S1)
# }
.annotate 'line', 4303

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4306
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4307
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4308
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4309
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4310
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4309
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4311

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4314
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4315
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4316
    self.'annotate'(__ARG_1)
.annotate 'line', 4317
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4318
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4319
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4318
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4320

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4249
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4251
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
.annotate 'line', 4329
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4330

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4333
    self.'optimizearg'()
.annotate 'line', 4334
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4335
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4336
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4337
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4338
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4339
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4344
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4345
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4346
# var t: $P5
    isa $I3, $P3, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    unless $I3 goto __label_9
.annotate 'line', 4347
    isa $I3, $P4, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4349
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4350
    getattribute $P13, $P3, 'str'
.annotate 'line', 4346
    set $S3, $P13
# predefined string
.annotate 'line', 4350
    getattribute $P14, $P4, 'str'
.annotate 'line', 4346
    set $S4, $P14
.annotate 'line', 4350
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4352
    new $P15, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4353
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4346
    set $S6, $P18
# predefined string
.annotate 'line', 4353
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4346
    set $S7, $P19
.annotate 'line', 4353
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4354
    new $P11, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4356
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4357
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4358
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4359
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4360
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4361
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4364
.const 'Sub' WSubId_62 = 'WSubId_62'
    $P10 = WSubId_62($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4365
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4366
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4367
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4368
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4369
.const 'Sub' WSubId_61 = 'WSubId_61'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_61($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4373
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4374
    new $P11, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4376
    .return(self)
# }
.annotate 'line', 4377

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4380
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4381
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4382
    ne $S1, $S2, __label_3
.annotate 'line', 4383
    .return($S1)
  __label_3: # endif
.annotate 'line', 4384
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4385
    .return('S')
  __label_4: # endif
.annotate 'line', 4386
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4387
    .return('S')
  __label_6: # endif
.annotate 'line', 4388
.const 'Sub' WSubId_62 = 'WSubId_62'
    $P1 = WSubId_62($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4389
    .return('N')
  __label_8: # endif
.annotate 'line', 4390
    .return('I')
# }
.annotate 'line', 4391

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4394
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4395
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4396
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4397
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4398
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4400
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4401
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4402
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4403
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4404
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4405
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4406
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4407
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4410
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4411
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4414
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4417
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4418
# l: $S7
    null $S7
.annotate 'line', 4419
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4421
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4422
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4424
# r: $S8
    null $S8
.annotate 'line', 4425
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4427
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4428
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4430
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4433
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4435

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4325
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
.annotate 'line', 4444
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4445

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4448
    self.'optimizearg'()
.annotate 'line', 4449
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4450
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4451
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4452
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4453
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4454
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4455
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4456
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4457
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4458
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4459
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P5, $P6, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4462
    .return(self)
# }
.annotate 'line', 4463

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4466
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4467
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4468
    ne $S1, $S2, __label_3
.annotate 'line', 4469
    .return($S1)
  __label_3: # endif
.annotate 'line', 4470
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4471
    .return('N')
  __label_4: # endif
.annotate 'line', 4472
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4473
    .return('N')
  __label_6: # endif
.annotate 'line', 4474
    .return('I')
# }
.annotate 'line', 4475

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4478
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4479
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4480
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4481

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4440
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
.annotate 'line', 4490
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4491

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4494
    self.'optimizearg'()
.annotate 'line', 4495
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4496
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4497
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4498
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4499
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4500
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4501
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4502
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4503
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4504
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4505
.const 'Sub' WSubId_21 = 'WSubId_21'
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P7, $P8, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4508
.const 'Sub' WSubId_62 = 'WSubId_62'
    $P7 = WSubId_62($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4509
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4510
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4511
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4512
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4513
.const 'Sub' WSubId_61 = 'WSubId_61'
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_61($P7, $P8, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4517
    .return(self)
# }
.annotate 'line', 4518

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4521
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4522
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4523
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4524
    ne $S1, $S2, __label_3
.annotate 'line', 4525
    .return($S1)
  __label_3: # endif
.annotate 'line', 4526
    ne $S1, 'S', __label_4
.annotate 'line', 4527
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4529
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4530

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4533
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4534
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4535
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4536
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4537
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4538
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4539
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4540
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4541
# rval: $S5
    null $S5
# switch
.annotate 'line', 4542
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4544
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4547
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4548
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4550
    self.'annotate'(__ARG_1)
.annotate 'line', 4551
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4552
    .return()
# }
  __label_3: # endif
.annotate 'line', 4554
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
.annotate 'line', 4555
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4556
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4557
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4558
    .return()
# }
  __label_7: # endif
.annotate 'line', 4563
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4564
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4565
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4566
# rval: $S6
    null $S6
# switch
.annotate 'line', 4567
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4569
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4570
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4571
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4574
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4577
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4578
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4580
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4581
    self.'annotate'(__ARG_1)
.annotate 'line', 4582
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4584
    .return()
# }
  __label_11: # endif
.annotate 'line', 4587
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4588
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4589
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4590
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4593
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4594
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4596
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4597
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4598
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4601
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4603
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4604
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4607
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4611
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4612
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4613
# }
  __label_21: # endif
.annotate 'line', 4616
    self.'annotate'(__ARG_1)
.annotate 'line', 4617
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4618
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4619
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4620

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4486
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
.annotate 'line', 4629
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4630

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4633
    self.'optimizearg'()
.annotate 'line', 4634
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4635
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4636
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4637
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4638
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4639
# var lval: $P3
    null $P3
.annotate 'line', 4640
# var rval: $P4
    null $P4
.annotate 'line', 4641
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4642
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4643
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4644
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4645
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4646
    eq $I2, 0, __label_7
.annotate 'line', 4647
.const 'Sub' WSubId_21 = 'WSubId_21'
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
.annotate 'line', 4650
.const 'Sub' WSubId_62 = 'WSubId_62'
    $P5 = WSubId_62($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4651
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4652
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4653
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4654
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4655
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4656
.const 'Sub' WSubId_61 = 'WSubId_61'
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
.annotate 'line', 4660
    .return(self)
# }
.annotate 'line', 4661

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4664
    .return('N')
# }
.annotate 'line', 4665

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4668
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4669
# var aux: $P2
    null $P2
.annotate 'line', 4670
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4671
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4672
    $P2 = self.'tempreg'('N')
.annotate 'line', 4673
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4674
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4676
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4677
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4678
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4679
    $P2 = self.'tempreg'('N')
.annotate 'line', 4680
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4681
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4683
    self.'annotate'(__ARG_1)
.annotate 'line', 4684
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4685

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4625
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
.annotate 'line', 4694
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4695

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4698
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4699
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4700
    self.'annotate'(__ARG_1)
.annotate 'line', 4701
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4702

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4705
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4706

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4690
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
.annotate 'line', 4715
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4716

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4719
    .return('I')
# }
.annotate 'line', 4720

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4723
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4724
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4725
    self.'annotate'(__ARG_1)
.annotate 'line', 4730
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4731

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 4711
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
.annotate 'line', 4740
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4741

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4744
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
.annotate 'line', 4745
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4746
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4747
    self.'annotate'(__ARG_1)
.annotate 'line', 4748
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4749

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4752
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4753

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 4736
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
.annotate 'line', 4762
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4763

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4766
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
.annotate 'line', 4767
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4768
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4769
    self.'annotate'(__ARG_1)
.annotate 'line', 4770
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4771

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4774
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4775

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 4758
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4784
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4785

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4788
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4789
# setname: $S1
    set $S1, ''
.annotate 'line', 4790
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4791
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4793
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4796
    set $I2, 1
# switch
.annotate 'line', 4797
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
.annotate 'line', 4801
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4802
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 4803
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 4804
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4807
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4812
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4815
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4818
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4813
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4816
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4819
    __ARG_1.'print'(' :named')
.annotate 'line', 4820
    eq $S1, '', __label_17
.annotate 'line', 4821
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4822
# }
.annotate 'line', 4824

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 4780
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4833
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4834
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4835

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4838
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4839
    .return(self)
# }
.annotate 'line', 4840

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4843
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4844

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 4829
    addattribute $P0, 'arg'
.annotate 'line', 4830
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4849
# var modifier: $P1
    null $P1
.annotate 'line', 4850
# var expr: $P2
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 4851
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4852
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4853
    $P3 = __ARG_1.'get'()
.annotate 'line', 4854
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 4855
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 4858
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4861
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4862
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4863

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4874
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4875
    setattribute self, 'start', __ARG_2
.annotate 'line', 4876
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4877
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4878
    __ARG_3.'unget'($P1)
.annotate 'line', 4879
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_63 = 'WSubId_63'
    $P3 = WSubId_36(__ARG_3, __ARG_1, WSubId_63, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 4881

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4884
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4885
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4883
    elements $I1, $P1
  __label_1:
.annotate 'line', 4885
    .return($I1)
# }
.annotate 'line', 4886

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4889
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4890

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4893
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4894
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4895

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4898
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4899
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4900

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4903
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'args'
    WSubId_38($P1)
.annotate 'line', 4904
    .return(self)
# }
.annotate 'line', 4905

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4908
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4909
    unless_null $P1, __label_1
# {
.annotate 'line', 4910
    new $P2, ['ResizableStringArray']
.annotate 'line', 4911
# pnull: $S1
    set $S1, ''
.annotate 'line', 4912
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4913
    if_null $P3, __label_2
# {
.annotate 'line', 4914
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4915
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4916
# reg: $S2
    null $S2
.annotate 'line', 4917
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4918
    ne $S1, '', __label_7
# {
.annotate 'line', 4919
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4920
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4922
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4925
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4926
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4929
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4931
    .return($P1)
# }
.annotate 'line', 4932

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4935
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4936
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4938
# sep: $S1
    set $S1, ''
.annotate 'line', 4939
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4940
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4941
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4942
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4943
    if_null $P3, __label_4
.annotate 'line', 4944
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 4945
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 4940
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4947

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 4867
    addattribute $P0, 'owner'
.annotate 'line', 4868
    addattribute $P0, 'start'
.annotate 'line', 4869
    addattribute $P0, 'args'
.annotate 'line', 4870
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_64')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4952
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 4953
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 4954
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 4955
    .return(1)
# }
.annotate 'line', 4956

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4967
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4968
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4969
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4970

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4973
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4974

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4977
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4978
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4979
    new $P3, ['ResizableStringArray']
.annotate 'line', 4980
# var arg: $P4
    null $P4
.annotate 'line', 4981
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 4982
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4984
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 4985
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 4987
    ne $S2, 'null', __label_8
# {
.annotate 'line', 4988
    ne $S1, '', __label_9
# {
.annotate 'line', 4989
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4990
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 4992
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 4994
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4998
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4999
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5000
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5001
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 5002
    .return()
  __label_2: # default
.annotate 'line', 5004
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5005
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5006
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5007
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5008
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5009
# argr: $S5
    null $S5
.annotate 'line', 5010
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5011
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
.annotate 'line', 5015
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5016
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5019
    ne $S1, '', __label_24
# {
.annotate 'line', 5020
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5021
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5023
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5027
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5028
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5030
# aux: $S6
    null $S6
.annotate 'line', 5031
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5032
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
.annotate 'line', 5034
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
.annotate 'line', 5038
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5039
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 5042
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 5048
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5049
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 5052
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5056
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5005
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5059
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5060

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 4960
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4962
    addattribute $P0, 'predef'
.annotate 'line', 4963
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'genpredefcallexpr' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5067
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5068
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5069
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 5070
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 5073
    isa $I2, __ARG_2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 5074
.const 'Sub' WSubId_64 = 'WSubId_64'
    $P3 = WSubId_64($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5075
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 5076
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 5080
    new $P4, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P5, $P6, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 5081

.end # genpredefcallexpr

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5090
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5091
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5092
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5093
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5094
    __ARG_1.'unget'($P1)
.annotate 'line', 5095
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5097

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5098
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5101
# var funref: $P1
    getattribute $P4, self, 'funref'
    $P1 = $P4.'optimize'()
.annotate 'line', 5102
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5103
# nargs: $I1
    null $I1
.annotate 'line', 5104
    if_null $P2, __label_1
# {
.annotate 'line', 5105
    $P2 = $P2.'optimize'()
.annotate 'line', 5106
    $P4 = $P2.'numargs'()
    set $I1, $P4
# }
  __label_1: # endif
.annotate 'line', 5109
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5110
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P5.'CallMemberExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_2: # endif
.annotate 'line', 5111
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5112
    new $P5, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P5.'CallMemberRefExpr'(self, $P1, $P2)
    set $P4, $P5
    .return($P4)
  __label_3: # endif
.annotate 'line', 5115
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 5116
# callname: $S1
    $P5 = $P1.'getName'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 5117
# var predef: $P3
.const 'Sub' WSubId_65 = 'WSubId_65'
    $P3 = WSubId_65($S1, $I1)
.annotate 'line', 5118
    if_null $P3, __label_6
.annotate 'line', 5119
.const 'Sub' WSubId_66 = 'WSubId_66'
    getattribute $P4, self, 'owner'
    .tailcall WSubId_66($P4, $P3, $P2)
  __label_6: # endif
# }
  __label_4: # endif
.annotate 'line', 5122
    setattribute self, 'funref', $P1
.annotate 'line', 5123
    setattribute self, 'args', $P2
.annotate 'line', 5124
    .return(self)
# }
.annotate 'line', 5125

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5128
    .return(1)
# }
.annotate 'line', 5129

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5132
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5133
# call: $S1
    null $S1
.annotate 'line', 5135
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P2, $P1, 'subid'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5136
    $P3 = $P1.'checkIdentifier'()
    set $S1, $P3
.annotate 'line', 5137
    ne $S1, '', __label_4
.annotate 'line', 5138
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
.annotate 'line', 5141
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 5142
    .return($S1)
# }
.annotate 'line', 5143

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5146
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5147
    if_null $P1, __label_1
.annotate 'line', 5148
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5149

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5152
    __ARG_1.'print'('(')
.annotate 'line', 5153
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5154
    if_null $P1, __label_1
.annotate 'line', 5155
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5156
    __ARG_1.'say'(')')
# }
.annotate 'line', 5157

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5160
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5161
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5163
    self.'annotate'(__ARG_1)
.annotate 'line', 5165
    __ARG_1.'print'('    ')
.annotate 'line', 5166
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5167
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5168
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5170
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5173
    __ARG_1.'print'($S1)
.annotate 'line', 5174
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5175

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5083
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5085
    addattribute $P0, 'funref'
.annotate 'line', 5086
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5188
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5189
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5190
    setattribute self, 'args', __ARG_3
.annotate 'line', 5195
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5196
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5197
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5198
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5199
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5200
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5201
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5202
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5203
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5204
    if_null $P4, __label_6
.annotate 'line', 5205
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
.annotate 'line', 5208

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5211
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
# {
.annotate 'line', 5212
# reg: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'createreg'('P')
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5213
# predefined string
    getattribute $P2, self, 'subid'
    set $S2, $P2
    concat $S3, ".const 'Sub' ", $S1
    concat $S3, $S3, " = '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
    __ARG_1.'say'($S3)
.annotate 'line', 5214
    .return($S1)
# }
  __label_1: # endif
.annotate 'line', 5216
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5217
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5218
    $P5 = $P1.'get_member'()
.annotate 'line', 5217
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
.annotate 'line', 5210
    join $S2, "", $P2
.annotate 'line', 5217
    .return($S2)
# }
.annotate 'line', 5219

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5183
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5185
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5229
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5230
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5231
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5232

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5235
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5236
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5237
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5238
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5239
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5242
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5243
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5244
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5245

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5225
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
.annotate 'line', 5255
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5256
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5257

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5260
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5261
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5262
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5263
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5264
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5265
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5266
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5268
    .return($S2)
# }
.annotate 'line', 5269

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5250
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5252
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
.annotate 'line', 5278
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5279
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5280

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5281
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5284
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5285
    .return(self)
# }
.annotate 'line', 5286

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5289
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5290
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5291
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5293
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5294
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5295

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5298
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5299

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5302
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5303
    self.'annotate'(__ARG_1)
.annotate 'line', 5304
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5305

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5308
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5309
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5310
    .return($S1)
# }
.annotate 'line', 5311

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5314
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5315
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5316
    self.'annotate'(__ARG_1)
.annotate 'line', 5317
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5318

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5321
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5322

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5325
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5326
# value: $S2
    null $S2
.annotate 'line', 5327
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5329
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5330
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5331
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5333
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5336
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5337
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5339
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5340

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5343
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5344
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5345
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5346
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5348
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5349
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5350
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5352
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5354
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5355
    .return($S2)
# }
.annotate 'line', 5356

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5272
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5274
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
.annotate 'line', 5366
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5367
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5368

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5369
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5372
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5373
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5374
    .return(self)
# }
.annotate 'line', 5375

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5378
.const 'Sub' WSubId_1 = 'WSubId_1'
.annotate 'line', 5378
    WSubId_1('Member reference can be used only for method calls', self)
# }
.annotate 'line', 5380

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5361
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5363
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
.annotate 'line', 5394
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5395
    setattribute self, 'left', __ARG_4
.annotate 'line', 5396
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5397

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5400
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5401
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5403
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5404

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5407
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5408
    setattribute self, 'left', $P1
.annotate 'line', 5409
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5410
    $P2.'optimizeargs'()
.annotate 'line', 5414
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5415
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5416
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5417
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5418
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5419
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5420
# predefined substr
.annotate 'line', 5419
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5421
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5424
    .return(self)
# }
.annotate 'line', 5425

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5428
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5429
.const 'Sub' WSubId_6 = 'WSubId_6'
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5430
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5431
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5432
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5433
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5431
    setattribute self, 'regleft', $P3
.annotate 'line', 5434
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5435

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5438
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5439
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5440
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5441
.const 'Sub' WSubId_6 = 'WSubId_6'
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5442
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5443
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5444
    __ARG_1.'print'(']')
# }
.annotate 'line', 5445

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5448
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5449
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5450
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5451
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5452
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5453
    eq $I1, 1, __label_4
.annotate 'line', 5454
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5455
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5456
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5457
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5460
    self.'annotate'(__ARG_1)
.annotate 'line', 5461
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5462
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5463
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5465

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5468
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5469
    self.'annotate'(__ARG_1)
.annotate 'line', 5470
    __ARG_1.'print'('    ')
.annotate 'line', 5471
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5472
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5473

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5476
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5477
# rreg: $S1
    null $S1
.annotate 'line', 5478
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5479
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5480
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5483
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5484
    self.'annotate'(__ARG_1)
.annotate 'line', 5485
    __ARG_1.'print'('    ')
.annotate 'line', 5486
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5487
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5488
    .return($S1)
# }
.annotate 'line', 5489

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5385
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5387
    addattribute $P0, 'left'
.annotate 'line', 5388
    addattribute $P0, 'regleft'
.annotate 'line', 5389
    addattribute $P0, 'args'
.annotate 'line', 5390
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5500
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5501
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5502
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5503
    __ARG_1.'unget'($P1)
.annotate 'line', 5504
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P3 = WSubId_36(__ARG_1, __ARG_2, WSubId_37, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5506

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5507
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5510
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5511
    .return(self)
# }
.annotate 'line', 5512

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5515
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5516
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5517
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5523
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5525

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5528
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5529
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5530
    .return($S1)
# }
.annotate 'line', 5531

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5534
    self.'annotate'(__ARG_1)
.annotate 'line', 5535
# itemreg: $S1
    null $S1
.annotate 'line', 5536
# it_p: $S2
    null $S2
.annotate 'line', 5537
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5538
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5539
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5541
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5542
    if_null $P1, __label_2
# {
.annotate 'line', 5543
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5544
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
.annotate 'line', 5546
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5547
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5548
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5549
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5553
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5554
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5555
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5556
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5560
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5562
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5563
    self.'annotate'(__ARG_1)
.annotate 'line', 5564
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5568

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5494
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5496
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5580
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5581
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5582
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5583
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5584
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5585
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5586
# {
.annotate 'line', 5587
# var key: $P4
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P4 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5588
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(':', __ARG_1)
.annotate 'line', 5589
# var value: $P5
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P5 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 5590
# predefined push
    push $P2, $P4
.annotate 'line', 5591
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5593
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5594
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5595
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5597
    setattribute self, 'keys', $P2
.annotate 'line', 5598
    setattribute self, 'values', $P3
# }
.annotate 'line', 5599

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5600
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5603
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'keys'
    WSubId_38($P1)
.annotate 'line', 5604
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'values'
    WSubId_38($P1)
.annotate 'line', 5605
    .return(self)
# }
.annotate 'line', 5606

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5609
    self.'annotate'(__ARG_1)
.annotate 'line', 5614
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5615
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5617
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5618
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5619
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5620
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5621
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5622
# item: $S1
    null $S1
.annotate 'line', 5623
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5624
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5625
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5626
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5629
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5631
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5632
# itemreg: $S3
    null $S3
.annotate 'line', 5633
# it_p: $S4
    null $S4
.annotate 'line', 5634
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 5635
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 5636
# aux: $S5
    null $S5
# switch
.annotate 'line', 5637
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
.annotate 'line', 5639
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 5640
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 5641
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 5642
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 5646
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 5647
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 5648
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5649
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 5653
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 5655
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 5656
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5620
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5658

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5661
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5662
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5663
    .return($S1)
# }
.annotate 'line', 5664

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5573
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5575
    addattribute $P0, 'keys'
.annotate 'line', 5576
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5677
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5682
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5683

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5686
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5687
    if_null $P1, __label_1
.annotate 'line', 5688
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5689

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5692
    self.'optimize_initializer'()
.annotate 'line', 5693
    .return(self)
# }
.annotate 'line', 5694

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5697
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5698
    if_null $P1, __label_1
.annotate 'line', 5699
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5700
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5701
    if_null $P1, __label_2
.annotate 'line', 5702
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5703
    __ARG_1.'say'(")")
# }
.annotate 'line', 5704

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 5669
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5671
    addattribute $P0, 'initializer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5715
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5717
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 5718
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5719
    setattribute self, 'value', __ARG_4
.annotate 'line', 5720
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5722
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 5723
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5725
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5726

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5729
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5730
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5733
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5734
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5735
    $P1 = $P2.'getvalue'()
.annotate 'line', 5736
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 5737
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5738
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5741
    self.'optimize_initializer'()
.annotate 'line', 5742
    .return(self)
# }
.annotate 'line', 5743

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5746
    self.'annotate'(__ARG_1)
.annotate 'line', 5748
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5749
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5752
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5753
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
.annotate 'line', 5755
# reginit: $S1
    set $S1, ''
.annotate 'line', 5756
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5757
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5758
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
.annotate 'line', 5763
    ne $I2, 1, __label_13
# {
.annotate 'line', 5764
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5765
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5768
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5769
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5770
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5774
    eq $I2, 1, __label_16
.annotate 'line', 5775
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 5776
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5777
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5780
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5783
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5784
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5785
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 5786
.const 'Sub' WSubId_67 = 'WSubId_67'
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_67($S5, $P8)
  __label_23: # endif
.annotate 'line', 5790
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5791
    le $I1, 1, __label_25
# {
.annotate 'line', 5792
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5796
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5797
    unless_null $P4, __label_26
# {
.annotate 'line', 5799
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5800
    if_null $P5, __label_28
# {
.annotate 'line', 5801
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5804
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.annotate 'line', 5805
.const 'Sub' WSubId_67 = 'WSubId_67'
    WSubId_67('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5806
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5808
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5812
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5816
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5818
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5819
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5820
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5821
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5823

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5826
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5827

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 5709
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5711
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5838
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5839
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5840
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5841
    setattribute self, 'nskey', $P1
.annotate 'line', 5842
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5843
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5844
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5846
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5847

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5850
# reginit: $S1
    null $S1
.annotate 'line', 5851
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5852
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5853
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5857
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5858
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5861
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 5863
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5864
    __ARG_1.'print'('    ')
.annotate 'line', 5865
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5866
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5867
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5868
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5869
    if_null $S1, __label_8
.annotate 'line', 5870
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5871
    __ARG_1.'say'()
# }
.annotate 'line', 5872

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 5832
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5834
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5883
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5884
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5885
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5886
    setattribute self, 'nskey', $P1
.annotate 'line', 5887
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5888
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5889
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5891
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5892

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5895
# reginit: $S1
    null $S1
.annotate 'line', 5896
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5898
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 5899
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5900
    le $I1, 0, __label_4
.annotate 'line', 5901
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 5902
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5903
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5904
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5905
    __ARG_1.'say'()
.annotate 'line', 5907
    lt $I1, 0, __label_5
# {
.annotate 'line', 5908
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5909
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5910
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 5912

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 5877
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5879
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5919
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5922
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 5926
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 5929
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 5924
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5925
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5924
    .return($P3)
  __label_4: # case
.annotate 'line', 5928
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 5932
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5933
    __ARG_1.'unget'($P2)
.annotate 'line', 5934
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 5936
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 5941
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 5943

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5954
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5955
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5956
.const 'Sub' WSubId_60 = 'WSubId_60'
    $P2 = WSubId_60(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5957

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5960
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5961
    .return(self)
# }
.annotate 'line', 5962

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5963
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5966
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5967
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5968
    eq $S1, 'P', __label_2
.annotate 'line', 5969
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 5970
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 5972
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
.annotate 'line', 5973
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5974
    self.'annotate'(__ARG_1)
.annotate 'line', 5975
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 5976
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5977
    __ARG_1.'say'()
# }
.annotate 'line', 5978

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 5947
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5949
    addattribute $P0, 'lexpr'
.annotate 'line', 5950
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
.annotate 'line', 5995
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5996
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5997
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5998
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5999
    .return(self)
# }
.annotate 'line', 6000

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6003
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6004
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6006
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6008
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6010
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6011
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6012
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6014

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6017
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6018
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6019
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6021
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6022

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6025
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6026
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6027
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6028
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6029
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6030
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6031
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6033
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6034
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6035
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6036
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6037
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6038
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6040
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6041
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6042
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6043
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6046
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6048
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6049

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 5983
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5989
    addattribute $P0, 'condition'
.annotate 'line', 5990
    addattribute $P0, 'etrue'
.annotate 'line', 5991
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
.annotate 'line', 6093
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
.annotate 'line', 6094
    .return(1)
  __label_4: # case
.annotate 'line', 6095
    .return(2)
  __label_5: # case
.annotate 'line', 6096
    .return(3)
  __label_2: # default
.annotate 'line', 6097
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6099

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_72')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6103
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
.annotate 'line', 6104
    .return(8)
  __label_4: # case
.annotate 'line', 6105
    .return(11)
  __label_5: # case
.annotate 'line', 6106
    .return(9)
  __label_6: # case
.annotate 'line', 6107
    .return(10)
  __label_2: # default
.annotate 'line', 6109
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6110
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6111
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6113

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6117
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
.annotate 'line', 6118
    .return(19)
  __label_4: # case
.annotate 'line', 6119
    .return(20)
  __label_5: # case
.annotate 'line', 6120
    .return(21)
  __label_6: # case
.annotate 'line', 6121
    .return(22)
  __label_2: # default
.annotate 'line', 6122
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6124

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6128
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6129
    .return(28)
  __label_4: # case
.annotate 'line', 6130
    .return(29)
  __label_2: # default
.annotate 'line', 6131
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6133

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6137
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
.annotate 'line', 6138
    .return(14)
  __label_4: # case
.annotate 'line', 6139
    .return(16)
  __label_5: # case
.annotate 'line', 6140
    .return(15)
  __label_6: # case
.annotate 'line', 6141
    .return(17)
  __label_2: # default
.annotate 'line', 6143
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6144
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6146

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6150
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
.annotate 'line', 6151
    .return(12)
  __label_4: # case
.annotate 'line', 6152
    .return(13)
  __label_5: # case
.annotate 'line', 6153
    .return(25)
  __label_6: # case
.annotate 'line', 6154
    .return(26)
  __label_2: # default
.annotate 'line', 6155
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6157

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_91')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6161
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
.annotate 'line', 6162
    .return(4)
  __label_4: # case
.annotate 'line', 6163
    .return(5)
  __label_5: # case
.annotate 'line', 6164
    .return(6)
  __label_6: # case
.annotate 'line', 6165
    .return(18)
  __label_7: # case
.annotate 'line', 6166
    .return(23)
  __label_8: # case
.annotate 'line', 6167
    .return(24)
  __label_9: # case
.annotate 'line', 6168
    .return(30)
  __label_2: # default
.annotate 'line', 6169
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6171

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6175
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6176
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6179
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6183
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6185
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6187
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6189
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6191
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6193
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6195
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6197
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6199
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6180
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P2 = WSubId_37(__ARG_1, __ARG_2)
.annotate 'line', 6181
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(')', __ARG_1)
.annotate 'line', 6182
    .return($P2)
  __label_4: # case
.annotate 'line', 6184
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6186
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6188
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6190
    new $P10, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P10.'IntegerLiteral'(__ARG_2, $P1)
    set $P9, $P10
    .return($P9)
  __label_8: # case
.annotate 'line', 6192
    new $P12, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P12.'FloatLiteral'(__ARG_2, $P1)
    set $P11, $P12
    .return($P11)
  __label_9: # case
.annotate 'line', 6194
.const 'Sub' WSubId_68 = 'WSubId_68'
    .tailcall WSubId_68(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6196
    new $P14, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P14.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6198
    new $P16, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P16.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P15, $P16
    .return($P15)
  __label_12: # case
.annotate 'line', 6200
    new $P18, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P18.'IdentifierExpr'(__ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_2: # default
.annotate 'line', 6202
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6204

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6208
# var subexp: $P1
.const 'Sub' WSubId_69 = 'WSubId_69'
    $P1 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6209
# var t: $P2
    null $P2
.annotate 'line', 6210
# var start: $P3
    null $P3
.annotate 'line', 6211
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6212
.const 'Sub' WSubId_70 = 'WSubId_70'
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_70($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6213
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6215
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6218
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6221
    set $P3, $P2
.annotate 'line', 6222
    $P2 = __ARG_1.'get'()
.annotate 'line', 6223
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6224
# var right: $P4
.const 'Sub' WSubId_69 = 'WSubId_69'
    $P4 = WSubId_69(__ARG_1, __ARG_2)
.annotate 'line', 6225
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6228
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6231
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6234
    __ARG_1.'unget'($P2)
.annotate 'line', 6235
    .return($P1)
# }
.annotate 'line', 6236

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6240
# var subexp: $P1
.const 'Sub' WSubId_71 = 'WSubId_71'
    $P1 = WSubId_71(__ARG_1, __ARG_2)
.annotate 'line', 6241
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6243
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6245
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6244
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6246
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6248
    __ARG_1.'unget'($P2)
.annotate 'line', 6249
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6251

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6255
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6256
# code: $I1
.const 'Sub' WSubId_72 = 'WSubId_72'
    $P3 = WSubId_72($P1)
    set $I1, $P3
.annotate 'line', 6257
    eq $I1, 0, __label_1
# {
.annotate 'line', 6258
# var subexpr: $P2
.const 'Sub' WSubId_73 = 'WSubId_73'
    $P2 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6259
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
.annotate 'line', 6261
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6263
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6265
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6267
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6269
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6271
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6273
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6277
    __ARG_1.'unget'($P1)
.annotate 'line', 6278
.const 'Sub' WSubId_74 = 'WSubId_74'
    .tailcall WSubId_74(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6280

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6284
# var lexpr: $P1
.const 'Sub' WSubId_73 = 'WSubId_73'
    $P1 = WSubId_73(__ARG_1, __ARG_2)
.annotate 'line', 6285
# var t: $P2
    null $P2
.annotate 'line', 6286
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6287
.const 'Sub' WSubId_75 = 'WSubId_75'
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_75($P2)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
.annotate 'line', 6288
# var rexpr: $P3
.const 'Sub' WSubId_73 = 'WSubId_73'
    $P3 = WSubId_73(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6289
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
.annotate 'line', 6291
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6294
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6297
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6300
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6303
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6306
    __ARG_1.'unget'($P2)
.annotate 'line', 6307
    .return($P1)
# }
.annotate 'line', 6308

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6312
# var lexpr: $P1
.const 'Sub' WSubId_76 = 'WSubId_76'
    $P1 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6313
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6314
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6315
# var rexpr: $P3
.const 'Sub' WSubId_76 = 'WSubId_76'
    $P3 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6316
# var expr: $P4
    null $P4
.annotate 'line', 6317
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6318
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6320
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6321
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6323
    __ARG_1.'unget'($P2)
.annotate 'line', 6324
    .return($P1)
# }
.annotate 'line', 6325

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6329
# var lexpr: $P1
.const 'Sub' WSubId_77 = 'WSubId_77'
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6330
# var rexpr: $P2
    null $P2
.annotate 'line', 6331
# var t: $P3
    null $P3
.annotate 'line', 6332
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6333
.const 'Sub' WSubId_78 = 'WSubId_78'
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_78($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6334
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6336
.const 'Sub' WSubId_77 = 'WSubId_77'
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6337
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6340
.const 'Sub' WSubId_77 = 'WSubId_77'
    $P2 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6341
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6344
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6347
    __ARG_1.'unget'($P3)
.annotate 'line', 6348
    .return($P1)
# }
.annotate 'line', 6349

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6353
# var lexpr: $P1
.const 'Sub' WSubId_79 = 'WSubId_79'
    $P1 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6354
# var rexpr: $P2
    null $P2
.annotate 'line', 6355
# var t: $P3
    null $P3
.annotate 'line', 6356
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6357
.const 'Sub' WSubId_80 = 'WSubId_80'
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_80($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6358
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
.annotate 'line', 6360
.const 'Sub' WSubId_79 = 'WSubId_79'
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6361
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6364
.const 'Sub' WSubId_79 = 'WSubId_79'
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6365
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6368
.const 'Sub' WSubId_79 = 'WSubId_79'
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6369
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6372
.const 'Sub' WSubId_79 = 'WSubId_79'
    $P2 = WSubId_79(__ARG_1, __ARG_2)
.annotate 'line', 6373
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6376
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6379
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6382
    __ARG_1.'unget'($P3)
.annotate 'line', 6383
    .return($P1)
# }
.annotate 'line', 6384

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6388
# var lexpr: $P1
.const 'Sub' WSubId_81 = 'WSubId_81'
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6389
# var rexpr: $P2
    null $P2
.annotate 'line', 6390
# var t: $P3
    null $P3
.annotate 'line', 6391
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6392
.const 'Sub' WSubId_82 = 'WSubId_82'
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_82($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6393
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
.annotate 'line', 6395
.const 'Sub' WSubId_81 = 'WSubId_81'
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6396
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6399
.const 'Sub' WSubId_81 = 'WSubId_81'
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6400
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6403
.const 'Sub' WSubId_81 = 'WSubId_81'
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6404
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6407
.const 'Sub' WSubId_81 = 'WSubId_81'
    $P2 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6408
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6411
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6414
    __ARG_1.'unget'($P3)
.annotate 'line', 6415
    .return($P1)
# }
.annotate 'line', 6416

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6420
# var lexpr: $P1
.const 'Sub' WSubId_83 = 'WSubId_83'
    $P1 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6421
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6422
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6423
# var rexpr: $P3
.const 'Sub' WSubId_83 = 'WSubId_83'
    $P3 = WSubId_83(__ARG_1, __ARG_2)
.annotate 'line', 6424
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6426
    __ARG_1.'unget'($P2)
.annotate 'line', 6427
    .return($P1)
# }
.annotate 'line', 6428

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6432
# var lexpr: $P1
.const 'Sub' WSubId_84 = 'WSubId_84'
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6433
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6434
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6435
# var rexpr: $P3
.const 'Sub' WSubId_84 = 'WSubId_84'
    $P3 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6436
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6438
    __ARG_1.'unget'($P2)
.annotate 'line', 6439
    .return($P1)
# }
.annotate 'line', 6440

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6444
# var lexpr: $P1
.const 'Sub' WSubId_85 = 'WSubId_85'
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6445
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6446
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6447
# var rexpr: $P3
.const 'Sub' WSubId_85 = 'WSubId_85'
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6448
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6450
    __ARG_1.'unget'($P2)
.annotate 'line', 6451
    .return($P1)
# }
.annotate 'line', 6452

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6456
# var lexpr: $P1
.const 'Sub' WSubId_86 = 'WSubId_86'
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6457
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6458
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6459
# var rexpr: $P3
.const 'Sub' WSubId_86 = 'WSubId_86'
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6460
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6462
    __ARG_1.'unget'($P2)
.annotate 'line', 6463
    .return($P1)
# }
.annotate 'line', 6464

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6468
# var lexpr: $P1
.const 'Sub' WSubId_87 = 'WSubId_87'
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6469
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6470
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6471
# var rexpr: $P3
.const 'Sub' WSubId_86 = 'WSubId_86'
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6472
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6474
    __ARG_1.'unget'($P2)
.annotate 'line', 6475
    .return($P1)
# }
.annotate 'line', 6476

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6480
# var econd: $P1
.const 'Sub' WSubId_88 = 'WSubId_88'
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6481
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6482
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6483
# var etrue: $P3
.const 'Sub' WSubId_89 = 'WSubId_89'
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6484
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(':', __ARG_1)
.annotate 'line', 6485
# var efalse: $P4
.const 'Sub' WSubId_89 = 'WSubId_89'
    $P4 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6486
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6489
    __ARG_1.'unget'($P2)
.annotate 'line', 6490
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6492

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6496
# var lexpr: $P1
.const 'Sub' WSubId_90 = 'WSubId_90'
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6497
# var t: $P2
    null $P2
.annotate 'line', 6498
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6499
.const 'Sub' WSubId_91 = 'WSubId_91'
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_91($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
.annotate 'line', 6500
# var rexpr: $P3
.const 'Sub' WSubId_89 = 'WSubId_89'
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6501
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6502
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
.annotate 'line', 6504
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6507
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6510
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6513
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6516
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6519
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6522
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6525
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6527
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6528
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6530
    __ARG_1.'unget'($P2)
.annotate 'line', 6531
    .return($P1)
# }
.annotate 'line', 6532

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6536
.const 'Sub' WSubId_89 = 'WSubId_89'
    .tailcall WSubId_89(__ARG_1, __ARG_2)
# }
.annotate 'line', 6537

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6552
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6553
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6554
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6555
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6556
    .return($S1)
# }
.annotate 'line', 6557

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6560
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6561
    unless_null $P1, __label_1
.annotate 'line', 6562
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6563
    .return($P1)
# }
.annotate 'line', 6564

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6548
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6573
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6574
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6575
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6576
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6577
    .return($S1)
# }
.annotate 'line', 6578

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6581
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6582
    unless_null $P1, __label_1
.annotate 'line', 6583
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6584
    .return($P1)
# }
.annotate 'line', 6585

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6567
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6569
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6601
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6602
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6603
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6604
    __ARG_2.'unget'($P1)
.annotate 'line', 6605
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6607

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6610
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6611
    if_null $P1, __label_1
.annotate 'line', 6612
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6613
    .return(self)
# }
.annotate 'line', 6614

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6618
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6619
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6622
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6623
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6624
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6625
    self.'annotate'(__ARG_1)
.annotate 'line', 6626
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6630
    le $I1, 0, __label_6
.annotate 'line', 6631
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6633
    self.'annotate'(__ARG_1)
.annotate 'line', 6634
    self.'emitret'(__ARG_1)
.annotate 'line', 6635
    le $I1, 0, __label_7
.annotate 'line', 6636
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6637
    __ARG_1.'say'(')')
# }
.annotate 'line', 6638

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 6595
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6597
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6645
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6646

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6649
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6650

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 6641
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
.annotate 'line', 6657
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6658

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6661
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6662

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 6653
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6675
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6676
    setattribute self, 'name', __ARG_1
.annotate 'line', 6677
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6678

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6679
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6682
    self.'annotate'(__ARG_1)
.annotate 'line', 6683
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6684

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 6669
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6671
    addattribute $P0, 'name'
.annotate 'line', 6672
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6698
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6699
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6700

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6701
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6704
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6705
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6706
    .return($S2)
# }
.annotate 'line', 6707

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 6693
    addattribute $P0, 'owner'
.annotate 'line', 6694
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6720
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6721
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6722
.const 'Sub' WSubId_92 = 'WSubId_92'
    WSubId_92($P1)
.annotate 'line', 6723
    setattribute self, 'label', $P1
.annotate 'line', 6724
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6725

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6726
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6729
    self.'annotate'(__ARG_1)
.annotate 'line', 6730
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6731
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6732
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6733

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 6714
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6716
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6744
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6745

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6748
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54('(', __ARG_1)
.annotate 'line', 6749
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P1 = WSubId_37(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6750
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(')', __ARG_1)
# }
.annotate 'line', 6751

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 6740
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
# Body
# {
.annotate 'line', 6764
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6765
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6766
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6767
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6768
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6769
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P4 = WSubId_93(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6771
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6772
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6774

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6777
    self.'optimize_condition'()
.annotate 'line', 6778
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6779
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6780
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6782
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6784
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6786
    .return(self)
# }
.annotate 'line', 6787

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6790
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6791
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6792
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6793
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6794
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6795
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6796
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6797
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6798
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6799
    self.'annotate'(__ARG_1)
.annotate 'line', 6800
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6801
    $P1.'emit'(__ARG_1)
.annotate 'line', 6803
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6804
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6805
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6806
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6808
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6809

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 6758
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6760
    addattribute $P0, 'truebranch'
.annotate 'line', 6761
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6821
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P2 = WSubId_93(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6822

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6825
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6826
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6828
    self.'annotate'(__ARG_1)
.annotate 'line', 6829
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6830
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6831
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6832
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6833

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 6816
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6818
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6844
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6845
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6846
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6847

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6850
    self.'optimize_condition'()
.annotate 'line', 6851
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6852
    .return(self)
# }
.annotate 'line', 6853

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6856
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6858
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6861
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6864
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6865
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6867
    self.'annotate'(__ARG_1)
.annotate 'line', 6868
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6869
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6870
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6871
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6872
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6874

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 6840
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
# Body
# {
.annotate 'line', 6885
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6886
    self.'parsebody'(__ARG_2)
.annotate 'line', 6887
.const 'Sub' WSubId_94 = 'WSubId_94'
    WSubId_94('while', __ARG_2)
.annotate 'line', 6888
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6889

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6892
    self.'optimize_condition'()
.annotate 'line', 6893
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6894
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6895
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 6896
    setattribute self, 'body', $P1
.annotate 'line', 6897
    .return(self)
# }
.annotate 'line', 6898

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6901
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6902
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6903
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 6905
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6908
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6909
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6910
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 6912
    self.'annotate'(__ARG_1)
.annotate 'line', 6913
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6915
    $P1.'emit'(__ARG_1)
.annotate 'line', 6916
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6917
    eq $I1, 2, __label_7
.annotate 'line', 6918
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 6919
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 6921

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 6881
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
# Body
# {
.annotate 'line', 6932
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6933
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6934

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6935
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6938
    self.'annotate'(__ARG_1)
.annotate 'line', 6939
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6940
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6941

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 6928
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6952
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6953
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 6954

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6955
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6958
    self.'annotate'(__ARG_1)
.annotate 'line', 6959
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6960
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6961

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 6948
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6976
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6977
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 6978
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 6979
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 6980

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6983
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 6984
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6985
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6986
    getattribute $P4, self, 'case_value'
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P5 = WSubId_37(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6987
    $P1 = __ARG_1.'get'()
.annotate 'line', 6988
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 6989
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 6990
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 6991
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
.annotate 'line', 6992
    __ARG_1.'unget'($P1)
.annotate 'line', 6993
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P3 = WSubId_93(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 6995
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6996
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 6999
    $P1 = __ARG_1.'get'()
.annotate 'line', 7000
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7001
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7002
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
.annotate 'line', 7003
    __ARG_1.'unget'($P1)
.annotate 'line', 7004
    getattribute $P3, self, 'default_st'
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P4 = WSubId_93(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7006
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7009
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7010
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7011

.end # parse_cases


.sub 'optimize_cases' :method
# Body
# {
.annotate 'line', 7014
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P2, self, 'case_value'
    WSubId_38($P2)
.annotate 'line', 7015
    getattribute $P2, self, 'case_st'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7016
.const 'Sub' WSubId_38 = 'WSubId_38'
    WSubId_38($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7017
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P2, self, 'default_st'
    WSubId_38($P2)
# }
.annotate 'line', 7018

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 6968
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6970
    addattribute $P0, 'case_value'
.annotate 'line', 6971
    addattribute $P0, 'case_st'
.annotate 'line', 6972
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7031
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7032
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7033
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7034
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7035
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7036
    $P1 = __ARG_2.'get'()
.annotate 'line', 7037
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7038
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7039
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7040

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7043
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7044
    self.'optimize_cases'()
.annotate 'line', 7045
    .return(self)
# }
.annotate 'line', 7046

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7050
# type: $S1
    set $S1, ''
.annotate 'line', 7051
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7052
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7053
    ne $S2, 'N', __label_4
.annotate 'line', 7054
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7055
    ne $S1, '', __label_5
.annotate 'line', 7056
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7057
    eq $S1, $S2, __label_7
.annotate 'line', 7058
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7061
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7062
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7066
    ne $S1, '', __label_8
.annotate 'line', 7067
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7069
    __ARG_1.'comment'('switch')
.annotate 'line', 7070
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7071
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7072
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7074
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7075
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7079
    self.'genbreaklabel'()
.annotate 'line', 7080
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7081
    new $P4, ['ResizableStringArray']
.annotate 'line', 7082
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7083
    getattribute $P7, self, 'case_value'
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7084
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7085
# predefined push
    push $P4, $S7
.annotate 'line', 7086
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7087
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7089
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7092
    self.'annotate'(__ARG_1)
.annotate 'line', 7093
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7094
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7095
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7096
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7097
.const 'Sub' WSubId_52 = 'WSubId_52'
    $P7 = $P6[$I2]
    WSubId_52(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7095
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7100
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7101
.const 'Sub' WSubId_52 = 'WSubId_52'
    getattribute $P7, self, 'default_st'
    WSubId_52(__ARG_1, $P7)
.annotate 'line', 7103
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7104

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7025
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7027
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7116
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7117
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7118

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7121
    self.'optimize_cases'()
.annotate 'line', 7122
    .return(self)
# }
.annotate 'line', 7123

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7127
    self.'genbreaklabel'()
.annotate 'line', 7128
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7129
    new $P1, ['ResizableStringArray']
.annotate 'line', 7131
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7132
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7133
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7134
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7135
# predefined push
    push $P1, $S3
.annotate 'line', 7136
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7137
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7139
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7142
    self.'annotate'(__ARG_1)
.annotate 'line', 7143
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7144
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7145
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7146
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7147
.const 'Sub' WSubId_52 = 'WSubId_52'
    $P4 = $P3[$I2]
    WSubId_52(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7145
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7150
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7151
.const 'Sub' WSubId_52 = 'WSubId_52'
    getattribute $P4, self, 'default_st'
    WSubId_52(__ARG_1, $P4)
.annotate 'line', 7153
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7154

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7111
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7161
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7162
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7163
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7164
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7165
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7166
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("'(' in switch", $P1)
# }
.annotate 'line', 7167

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7180
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7181
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7182
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7183
    __ARG_2.'unget'($P1)
.annotate 'line', 7184
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7186
    $P1 = __ARG_2.'get'()
.annotate 'line', 7187
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7188
    __ARG_2.'unget'($P1)
.annotate 'line', 7189
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7190
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7192
    $P1 = __ARG_2.'get'()
.annotate 'line', 7193
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7194
    __ARG_2.'unget'($P1)
.annotate 'line', 7195
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P3 = WSubId_37(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7196
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7198
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7199

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7202
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7203
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7204
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7205
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7206
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7207
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7208
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7209
    .return(self)
# }
.annotate 'line', 7210

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7213
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7214
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7215
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7216
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7217
    .return()
# }
  __label_1: # endif
.annotate 'line', 7219
    __ARG_1.'comment'('for loop')
.annotate 'line', 7220
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7221
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7222
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7223
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7224
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7226
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7227
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7228
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7230
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7231
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7232
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7233
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7234
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7236
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7237

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7173
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7175
    addattribute $P0, 'initializer'
.annotate 'line', 7176
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
# Body
# {
.annotate 'line', 7252
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7253
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7254
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7255
# deftype: $S2
.const 'Sub' WSubId_95 = 'WSubId_95'
    $P1 = WSubId_95(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7256
    self.'createvar'($S1, $S2)
.annotate 'line', 7257
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7259
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7260
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7261
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(')', __ARG_2)
.annotate 'line', 7262
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7263

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7266
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7267
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7268
    .return(self)
# }
.annotate 'line', 7269

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7272
    self.'annotate'(__ARG_1)
.annotate 'line', 7273
# regcont: $S1
    null $S1
.annotate 'line', 7274
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7275
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7276
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7277
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7280
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7282
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7283
    unless_null $P1, __label_4
.annotate 'line', 7284
.const 'Sub' WSubId_59 = 'WSubId_59'
    getattribute $P2, self, 'varname'
    WSubId_59($P2)
  __label_4: # endif
.annotate 'line', 7286
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7287
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7288
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7289
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7290
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7291
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7292
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7293
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7294
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7295
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7296
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7297

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7244
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7246
    addattribute $P0, 'deftype'
.annotate 'line', 7247
    addattribute $P0, 'varname'
.annotate 'line', 7248
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7304
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54('(', __ARG_2)
.annotate 'line', 7305
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7306
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7307
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7308
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7310
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7311
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7312
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7313
    __ARG_2.'unget'($P3)
.annotate 'line', 7314
    __ARG_2.'unget'($P2)
.annotate 'line', 7315
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7317
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7318

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7330
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7331
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7332

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7335
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7336
    .return(self)
# }
.annotate 'line', 7337

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7340
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7341
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7342
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7343
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7345
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7348
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7351
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7353

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7324
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7326
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7365
    setattribute self, 'start', __ARG_1
.annotate 'line', 7366
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7367

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7370
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7371
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7372
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7373
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7374
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
.annotate 'line', 7377
    eq $I1, 1, __label_10
.annotate 'line', 7378
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7379
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7380
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7381
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7385
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7386
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7387
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7388
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7386
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7391
# predefined join
.annotate 'line', 7390
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7394
.const 'Sub' WSubId_1 = 'WSubId_1'
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7397

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7360
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7362
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7409
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7410
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7411
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7412
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7414
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7416
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7417
    $P1 = __ARG_2.'get'()
.annotate 'line', 7418
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7419
.const 'Sub' WSubId_2 = 'WSubId_2'
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7420
    $P1 = __ARG_2.'get'()
.annotate 'line', 7421
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7422
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7423
    $P1 = __ARG_2.'get'()
.annotate 'line', 7424
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7425
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7426
    setattribute self, 'exname', $P1
.annotate 'line', 7427
    self.'createvar'($S1, 'P')
.annotate 'line', 7428
    $P1 = __ARG_2.'get'()
.annotate 'line', 7429
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7430
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7432
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P3 = WSubId_93(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7433

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7436
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7437
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7438
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7439
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7440
    .return(self)
# }
.annotate 'line', 7441

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7444
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7445
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7446
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7447
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7448
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7449
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7451
    self.'annotate'(__ARG_1)
.annotate 'line', 7452
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7454
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7455
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7457
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7458
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7460
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7461
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7462
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7463
    __ARG_1.'comment'('try: end')
.annotate 'line', 7464
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7466
    self.'annotate'(__ARG_1)
.annotate 'line', 7467
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7469
    __ARG_1.'comment'('catch')
.annotate 'line', 7470
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7471
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7472
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7473
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7474
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7476
    __ARG_1.'comment'('catch end')
.annotate 'line', 7477
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7478

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7400
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7402
    addattribute $P0, 'stry'
.annotate 'line', 7403
    addattribute $P0, 'modifiers'
.annotate 'line', 7404
    addattribute $P0, 'exname'
.annotate 'line', 7405
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
.annotate 'line', 7491
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7492
    setattribute self, 'name', __ARG_3
.annotate 'line', 7493
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7494
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7495

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7485
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7487
    addattribute $P0, 'name'
.annotate 'line', 7488
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
.annotate 'line', 7510
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7511
    setattribute self, 'name', __ARG_3
.annotate 'line', 7512
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7513

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7502
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7504
    addattribute $P0, 'name'
.annotate 'line', 7505
    addattribute $P0, 'basetype'
.annotate 'line', 7506
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7524
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7525
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7526
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7527
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7528
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7530
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P5 = WSubId_37(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7533
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7534

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7537
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7538
    if_null $P1, __label_1
.annotate 'line', 7539
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7540
    .return(self)
# }
.annotate 'line', 7541

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7544
    self.'annotate'(__ARG_1)
.annotate 'line', 7545
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7546
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7547
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7548
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7549
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7551
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7552
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7554
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7555
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7556
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7557
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7559
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7562
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7564
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7567
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7568
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.annotate 'line', 7570
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid initialization from void value', self)
  __label_18: # case
.annotate 'line', 7572
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7575
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7576
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7578
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7579
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7580
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7581
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7582
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7583
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7586
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7590

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7518
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7520
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
# Body
# {
.annotate 'line', 7605
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7606
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7607
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7608
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7609
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7610
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7612
    __ARG_6.'unget'($P2)
.annotate 'line', 7613
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P4 = WSubId_37(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7614
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7616
    $P2 = __ARG_6.'get'()
.annotate 'line', 7617
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7618
    $P2 = __ARG_6.'get'()
.annotate 'line', 7619
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7620
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7621
    $P2 = __ARG_6.'get'()
.annotate 'line', 7622
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7623
    __ARG_6.'unget'($P2)
.annotate 'line', 7624
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P4 = WSubId_36(__ARG_6, self, WSubId_37, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7628
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7629

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7632
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7633
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 7634
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'initarray'
    WSubId_38($P1)
.annotate 'line', 7635
    .return(self)
# }
.annotate 'line', 7636

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7639
    self.'annotate'(__ARG_1)
.annotate 'line', 7641
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7642
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7643
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7644
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7645
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7646
    if_null $P2, __label_1
# {
.annotate 'line', 7648
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7649
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7653
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7655
    if_null $P3, __label_4
# {
.annotate 'line', 7656
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7657
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7658
    unless_null $P2, __label_6
# {
.annotate 'line', 7659
    le $I1, 0, __label_7
# {
.annotate 'line', 7661
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7664
# i: $I2
    null $I2
.annotate 'line', 7665
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7666
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7667
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7668
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7671

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 7595
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7597
    addattribute $P0, 'size'
.annotate 'line', 7598
    addattribute $P0, 'initarray'
.annotate 'line', 7599
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7678
# var next: $P1
    null $P1
.annotate 'line', 7679
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7680
# {
.annotate 'line', 7681
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7682
.const 'Sub' WSubId_92 = 'WSubId_92'
    WSubId_92($P3)
.annotate 'line', 7683
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7684
# var item: $P5
    null $P5
.annotate 'line', 7685
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 7686
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7688
    __ARG_4.'unget'($P4)
.annotate 'line', 7689
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7691
.const 'Sub' WSubId_96 = 'WSubId_96'
    $P2 = WSubId_96($P2, $P5)
.annotate 'line', 7692
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7693
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 7694
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4(';', $P1)
.annotate 'line', 7695
    .return($P2)
# }
.annotate 'line', 7696

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7704
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7705

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 7700
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
.annotate 'line', 7712
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7713

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 7708
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
.annotate 'line', 7719
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7720

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7724
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7725

.end # newIntArray


.sub 'parseInt' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7729
.const 'Sub' WSubId_97 = 'WSubId_97'
.const 'Sub' WSubId_98 = 'WSubId_98'
.const 'Sub' WSubId_99 = 'WSubId_99'
    .tailcall WSubId_97(WSubId_98, WSubId_99, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7730

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7738
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7739

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 7734
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
.annotate 'line', 7746
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7747

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 7742
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
.annotate 'line', 7753
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7754

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7758
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7759

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7763
.const 'Sub' WSubId_97 = 'WSubId_97'
.const 'Sub' WSubId_100 = 'WSubId_100'
.const 'Sub' WSubId_101 = 'WSubId_101'
    .tailcall WSubId_97(WSubId_100, WSubId_101, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7764

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7772
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7773

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 7768
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
.annotate 'line', 7780
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7781

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 7776
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
.annotate 'line', 7787
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7788

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7792
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7793

.end # newStringArray


.sub 'parseString' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7797
.const 'Sub' WSubId_97 = 'WSubId_97'
.const 'Sub' WSubId_102 = 'WSubId_102'
.const 'Sub' WSubId_103 = 'WSubId_103'
    .tailcall WSubId_97(WSubId_102, WSubId_103, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7798

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
.annotate 'line', 7814
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7815
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7816
    setattribute self, 'name', __ARG_4
.annotate 'line', 7817
    setattribute self, 'value', __ARG_5
.annotate 'line', 7818
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7819

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7822
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7823
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7824
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7825
    $P1 = $P1.'optimize'()
.annotate 'line', 7826
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 7827
.const 'Sub' WSubId_1 = 'WSubId_1'
.annotate 'line', 7827
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 7830
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7831
    .return(self)
# }
.annotate 'line', 7832

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 7835
.const 'Sub' WSubId_6 = 'WSubId_6'
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 7836

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7839
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7840

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 7804
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7806
    addattribute $P0, 'type'
.annotate 'line', 7807
    addattribute $P0, 'name'
.annotate 'line', 7808
    addattribute $P0, 'data'
.annotate 'line', 7809
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7845
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7846
# type: $S1
.const 'Sub' WSubId_95 = 'WSubId_95'
    $P5 = WSubId_95($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7847
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7848
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7850
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7851
# {
.annotate 'line', 7852
    $P1 = __ARG_2.'get'()
.annotate 'line', 7853
# var name: $P3
    set $P3, $P1
.annotate 'line', 7854
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54('=', __ARG_2)
.annotate 'line', 7855
# var value: $P4
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P4 = WSubId_37(__ARG_2, __ARG_3)
.annotate 'line', 7856
.const 'Sub' WSubId_96 = 'WSubId_96'
.annotate 'line', 7857
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 7856
    $P2 = WSubId_96($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7858
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7859
    .return($P2)
# }
.annotate 'line', 7860

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 7871
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7872
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7873
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7874
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P4 = WSubId_37(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7875
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 7877
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4(';', $P1)
# }
.annotate 'line', 7878

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7881
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7882
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7883
    .return(self)
# }
.annotate 'line', 7884

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7887
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7888

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7891
    self.'annotate'(__ARG_1)
.annotate 'line', 7892
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7893
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7894
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7895
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7896
    if_null $P1, __label_3
.annotate 'line', 7897
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 7898
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 7899
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 7900
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
.annotate 'line', 7902
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7903
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7905
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7910
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 7911
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7914
.const 'Sub' WSubId_1 = 'WSubId_1'
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 7916
.const 'Sub' WSubId_1 = 'WSubId_1'
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 7920
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 7921

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 7866
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7868
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7928
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7929
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7930

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7933
    self.'annotate'(__ARG_1)
.annotate 'line', 7934
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7935
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 7936
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7937

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 7924
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7946
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7947
.const 'Sub' WSubId_37 = 'WSubId_37'
    $P2 = WSubId_37(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 7948
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(']', __ARG_2)
.annotate 'line', 7949
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
# }
.annotate 'line', 7950

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7953
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7954
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7955

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7958
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7959
    self.'annotate'(__ARG_1)
.annotate 'line', 7960
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7961
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7962
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7963

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 7940
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7942
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7968
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7969
.const 'Sub' WSubId_92 = 'WSubId_92'
    WSubId_92($P1)
.annotate 'line', 7970
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7971
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7972
    $P2 = __ARG_2.'get'()
.annotate 'line', 7973
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 7974
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7976
    __ARG_2.'unget'($P2)
.annotate 'line', 7977
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
.annotate 'line', 7981
    __ARG_2.'unget'($P2)
.annotate 'line', 7982
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 7984

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7988
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7989
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7990
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 7991
.const 'Sub' WSubId_46 = 'WSubId_46'
    .tailcall WSubId_46(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7992

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8005
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8006
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8007
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8008
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8009
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8010
    __ARG_2.'unget'($P1)
.annotate 'line', 8011
# var c: $P2
.const 'Sub' WSubId_93 = 'WSubId_93'
    $P2 = WSubId_93(__ARG_2, self)
.annotate 'line', 8012
    unless_null $P2, __label_3
.annotate 'line', 8013
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8014
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8016
    setattribute self, 'end', $P1
# }
.annotate 'line', 8017

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8020
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8021
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8022
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8023
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8024
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8025
    .return($S2)
# }
.annotate 'line', 8026

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8029
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8030
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8031
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8032
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8033
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8034
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8035
    $P1[$S1] = $S3
.annotate 'line', 8036
    .return($S3)
# }
.annotate 'line', 8037

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8038
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8041
    __ARG_1.'comment'('{')
.annotate 'line', 8042
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8043
    $P1.'emit'(__ARG_1)
.annotate 'line', 8044
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8046
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8047

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 7998
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8000
    addattribute $P0, 'end'
.annotate 'line', 8001
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8062
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8064
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8065
    new $P1, ['ResizableStringArray']
.annotate 'line', 8066
    new $P2, ['ResizableStringArray']
.annotate 'line', 8067
    setattribute self, 'tempreg', $P1
.annotate 'line', 8068
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8069

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8072
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8073
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8074
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8075
    assign $P1, $I1
# predefined string
.annotate 'line', 8076
    getattribute $P2, self, 'type'
.annotate 'line', 8071
    set $S2, $P2
.annotate 'line', 8076
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8077

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8080
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8081
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8082
# reg: $S1
    null $S1
.annotate 'line', 8083
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8084
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8086
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8087
# predefined push
    push $P2, $S1
.annotate 'line', 8088
    .return($S1)
# }
.annotate 'line', 8089

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8092
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8093
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8094
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8095
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8096
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8097
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8095
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8099
    assign $P2, 0
# }
.annotate 'line', 8100

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8056
    addattribute $P0, 'type'
.annotate 'line', 8057
    addattribute $P0, 'nreg'
.annotate 'line', 8058
    addattribute $P0, 'tempreg'
.annotate 'line', 8059
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8111
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8112

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 8115
# var named: $P1
    null $P1
.annotate 'line', 8116
# var slurpy: $P2
    null $P2
.annotate 'line', 8117
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8118
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8119
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8120
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8122
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8125
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8128
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8132
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8139
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8156
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8137
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8140
# setname: $S2
    null $S2
# switch
.annotate 'line', 8141
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8143
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8146
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8147
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8148
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8149
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8152
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8154
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8157
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8158
# }
.annotate 'line', 8160

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8107
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8170
    setattribute self, 'func', __ARG_1
.annotate 'line', 8171
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8172
# type: $S1
.const 'Sub' WSubId_95 = 'WSubId_95'
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_95($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8173
    eq $S1, '', __label_2
.annotate 'line', 8174
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8176
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8177
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8178
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8180
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8181
    $P1 = __ARG_2.'get'()
.annotate 'line', 8182
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8183
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8185
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8186

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8189
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8190
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8191
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8192
# ptype: $S2
.const 'Sub' WSubId_104 = 'WSubId_104'
    $P5 = $P2.'gettype'()
    $P4 = WSubId_104($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8193
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8194
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8195
    if_null $P3, __label_3
.annotate 'line', 8196
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8197
    __ARG_1.'say'('')
# }
.annotate 'line', 8198

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8165
    addattribute $P0, 'func'
.annotate 'line', 8166
    addattribute $P0, 'name'
.annotate 'line', 8167
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8203
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8204

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8214
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8215

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8218
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8219
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8220
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8221
    le $I1, 0, __label_3
# {
.annotate 'line', 8222
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8223
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8224
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8225
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8226
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8227
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8223
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8229
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8232

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8210
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8254
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8255
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8256
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8257
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8258
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8259
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8260

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8262
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8266
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8267
    unless_null $P1, __label_1
.annotate 'line', 8268
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8269
    .return($P1)
# }
.annotate 'line', 8270

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8274
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8275
    .return($I1)
# }
.annotate 'line', 8276

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8279
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8280
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8281
    __ARG_1.'unget'($P1)
.annotate 'line', 8282
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_105 = 'WSubId_105'
    $P3 = WSubId_36(__ARG_1, self, WSubId_105, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8284

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8288
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8289
    unless_null $P1, __label_1
.annotate 'line', 8290
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8292
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8293

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8296
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8297
    unless_null $P1, __label_1
# {
.annotate 'line', 8299
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8302
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8303
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8304
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8305
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8307

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8310
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8311
    if_null $P1, __label_1
# {
.annotate 'line', 8312
# var found: $P2
    null $P2
.annotate 'line', 8313
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 8314
    $P2 = $P3.'findsymbol'(__ARG_1)
.annotate 'line', 8315
    if_null $P2, __label_4
.annotate 'line', 8316
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8319
    getattribute $P5, self, 'owner'
    .tailcall $P5.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8320

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8324
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8325
    if_null $P1, __label_1
# {
.annotate 'line', 8326
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 8327
    $P2.'fixnamespaces'()
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8329
    getattribute $P6, self, 'body'
    $P5 = $P6.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 8330
    .return(self)
# }
.annotate 'line', 8331

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8335
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8336
    unless_null $P1, __label_1
.annotate 'line', 8337
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8338
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8339

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8342
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8343
    unless_null $P1, __label_1
.annotate 'line', 8344
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8345
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8346

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8351
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8352
# lexname: $S1
    null $S1
.annotate 'line', 8353
    if_null $P1, __label_1
.annotate 'line', 8354
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8356
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8357
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8358
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8359
    self.'setlex'($S1, $S2)
.annotate 'line', 8360
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8362
    .return($S1)
# }
.annotate 'line', 8363

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8367
# var store: $P1
    null $P1
# switch
.annotate 'line', 8368
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
.annotate 'line', 8370
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8372
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8374
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8376
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8378
.const 'Sub' WSubId_6 = 'WSubId_6'
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8380
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8381
    .return($S1)
# }
.annotate 'line', 8382

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8385
# var store: $P1
    null $P1
# switch
.annotate 'line', 8386
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
.annotate 'line', 8388
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8390
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8392
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8394
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8396
.const 'Sub' WSubId_6 = 'WSubId_6'
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8398
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8399
    .return($S1)
# }
.annotate 'line', 8400

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8403
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
.annotate 'line', 8404
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8405

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8408
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8407
    set $S1, $I1
.annotate 'line', 8409
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8410

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8413
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8414

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8417
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8418

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8422
# name: $S1
    getattribute $P9, self, 'name'
    null $S1
    if_null $P9, __label_1
    set $S1, $P9
  __label_1:
.annotate 'line', 8423
    __ARG_1.'say'()
.annotate 'line', 8424
    __ARG_1.'print'(".sub ")
.annotate 'line', 8425
    $P9 = self.'isanonymous'()
    if_null $P9, __label_2
    unless $P9 goto __label_2
.annotate 'line', 8426
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8428
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8429
    getattribute $P9, self, 'subid'
    if_null $P9, __label_4
.annotate 'line', 8430
    getattribute $P10, self, 'subid'
    __ARG_1.'print'(" :subid('", $P10, "')")
  __label_4: # endif
.annotate 'line', 8431
    getattribute $P9, self, 'outer'
    if_null $P9, __label_5
# {
.annotate 'line', 8432
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8433
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8434
    if_null $P2, __label_6
.annotate 'line', 8435
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8439
    $P9 = self.'ismethod'()
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 8440
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8441
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8442
    if_null $P3, __label_8
.annotate 'line', 8443
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8445
    ne $S1, 'main', __label_10
.annotate 'line', 8446
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8448
    __ARG_1.'say'()
.annotate 'line', 8451
.const 'Sub' WSubId_52 = 'WSubId_52'
    getattribute $P9, self, 'params'
    WSubId_52(__ARG_1, $P9)
.annotate 'line', 8453
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8454
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8455
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8456
    getattribute $P9, self, 'start'
    __ARG_1.'annotate'($P9)
.annotate 'line', 8458
    if_null $P4, __label_13
# {
.annotate 'line', 8459
    iter $P11, $P4
    set $P11, 0
  __label_14: # for iteration
    unless $P11 goto __label_15
    shift $S2, $P11
.annotate 'line', 8460
    $P9 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P9, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8463
    if_null $P5, __label_16
# {
.annotate 'line', 8464
    iter $P12, $P5
    set $P12, 0
  __label_17: # for iteration
    unless $P12 goto __label_18
    shift $S3, $P12
# {
.annotate 'line', 8465
# predefined substr
    substr $S4, $S3, 0, 1
    eq $S4, '$', __label_19
.annotate 'line', 8466
    concat $S5, "    .local pmc ", $S3
    __ARG_1.'say'($S5)
  __label_19: # endif
.annotate 'line', 8467
    $P9 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P9)
# }
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8472
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8473
    $P9 = $P6.'isempty'()
    if_null $P9, __label_20
    unless $P9 goto __label_20
.annotate 'line', 8474
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 8476
    __ARG_1.'comment'('Body')
.annotate 'line', 8477
    $P6.'emit'(__ARG_1)
.annotate 'line', 8478
    $P9 = $P6.'getend'()
    __ARG_1.'annotate'($P9)
# }
  __label_21: # endif
.annotate 'line', 8480
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8483
# var localfun: $P7
    getattribute $P7, self, 'localfun'
.annotate 'line', 8484
    if_null $P7, __label_22
# {
.annotate 'line', 8485
    iter $P13, $P7
    set $P13, 0
  __label_23: # for iteration
    unless $P13 goto __label_24
    shift $P8, $P13
.annotate 'line', 8486
    $P8.'emit'(__ARG_1)
    goto __label_23
  __label_24: # endfor
# }
  __label_22: # endif
# }
.annotate 'line', 8488

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8235
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8237
    addattribute $P0, 'name'
.annotate 'line', 8238
    addattribute $P0, 'subid'
.annotate 'line', 8239
    addattribute $P0, 'modifiers'
.annotate 'line', 8240
    addattribute $P0, 'params'
.annotate 'line', 8241
    addattribute $P0, 'body'
.annotate 'line', 8242
    addattribute $P0, 'regstI'
.annotate 'line', 8243
    addattribute $P0, 'regstN'
.annotate 'line', 8244
    addattribute $P0, 'regstS'
.annotate 'line', 8245
    addattribute $P0, 'regstP'
.annotate 'line', 8246
    addattribute $P0, 'nlabel'
.annotate 'line', 8247
    addattribute $P0, 'localfun'
.annotate 'line', 8248
    addattribute $P0, 'lexicals'
.annotate 'line', 8249
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8250
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8502
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8503
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8504
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8505
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8506

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8508
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8512
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8510
    set $I1, $P1
.annotate 'line', 8512
    .return($I1)
# }
.annotate 'line', 8513

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8517
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8515
    set $I1, $P1
.annotate 'line', 8517
    .return($I1)
# }
.annotate 'line', 8518

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8519
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8523
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8524
    setattribute self, 'name', $P1
.annotate 'line', 8525
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8526
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 8527
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P9, self, 'owner'
    $P8.'FunctionModifierList'(__ARG_1, $P9)
    set $P7, $P8
    setattribute self, 'modifiers', $P7
.annotate 'line', 8528
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8530
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4('(', $P2)
.annotate 'line', 8531
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8533
# var fullname: $P3
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P3, $P5
.annotate 'line', 8534
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P3, $P5
.annotate 'line', 8535
# var cfunction: $P4
    $P4 = self.'createconst'('__FUNCTION__', 'S')
.annotate 'line', 8536
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 8537
    new $P8, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P10, $P1, 'line'
.annotate 'line', 8538
# predefined join
.annotate 'line', 8536
    join $S1, '.', $P3
    $P8.'TokenQuoted'($P9, $P10, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
    $P4.'setvalue'($P5)
.annotate 'line', 8540
    $P2 = __ARG_1.'get'()
.annotate 'line', 8541
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_2
.annotate 'line', 8542
.const 'Sub' WSubId_2 = 'WSubId_2'
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 8543
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8544
    .return(self)
# }
.annotate 'line', 8545

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8495
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8497
    addattribute $P0, 'paramnum'
.annotate 'line', 8498
    addattribute $P0, 'lexnum'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8556
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8557
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8558
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8559
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8560
    setattribute self, 'name', $P1
.annotate 'line', 8561
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8562
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8563
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4('{', $P2)
.annotate 'line', 8564
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8565
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8566

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8567
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8568
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8571
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8572

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8576
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8577

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8581
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8582

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8585
    $P5 = __ARG_2.'gettype'()
    set $S3, $P5
    isne $I2, $S3, 'P'
    if $I2 goto __label_2
    $I2 = __ARG_2.'isconst'()
  __label_2:
    unless $I2 goto __label_1
.annotate 'line', 8586
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 8587
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8589
# predefined substr
    substr $S3, $S1, 0, 6
    ne $S3, 'WSubId', __label_4
.annotate 'line', 8590
    .return(__ARG_2)
  __label_4: # endif
.annotate 'line', 8591
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 8592
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 8593
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 8594
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_5
# {
.annotate 'line', 8595
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_6
    unless $P5 goto __label_6
# {
.annotate 'line', 8596
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 8597
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8598
# var lexused: $P4
    $P4 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8599
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 8600
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 8601
    .return($P4)
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8604
    .return(__ARG_2)
# }
.annotate 'line', 8605

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8608
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8609
    unless_null $P1, __label_1
.annotate 'line', 8610
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8611
    unless_null $P1, __label_2
# {
.annotate 'line', 8614
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 8615
    unless_null $P1, __label_3
# {
.annotate 'line', 8617
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 8618
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8619
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 8620
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 8621
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8622
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 8623
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8627
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8629
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 8630
.const 'Sub' WSubId_6 = 'WSubId_6'
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 8631
    .return($P1)
# }
.annotate 'line', 8632

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 8552
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
.annotate 'line', 8643
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8644

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8645
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 8639
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8659
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8660
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8661
.const 'Sub' WSubId_3 = 'WSubId_3'
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 8662
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8663
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8664
# type: $S1
.const 'Sub' WSubId_95 = 'WSubId_95'
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_95($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8665
    set $P1, $P2
.annotate 'line', 8666
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8667
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8669
    setattribute self, 'name', $P1
.annotate 'line', 8670
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8671
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8672
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8673
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 8675
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8676

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8679
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8680
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8681
    if_null $P1, __label_1
# {
.annotate 'line', 8682
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8683
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8685

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 8654
    addattribute $P0, 'name'
.annotate 'line', 8655
    addattribute $P0, 'modifiers'
.annotate 'line', 8656
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8690
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8691

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8698
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_106 = 'WSubId_106'
    $P2 = WSubId_36(__ARG_1, __ARG_2, WSubId_106, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 8699

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8702
    __ARG_1.'print'('(')
.annotate 'line', 8703
# sep: $S1
    set $S1, ''
.annotate 'line', 8704
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8705
    __ARG_1.'print'($S1)
.annotate 'line', 8706
    $P1.'emit'(__ARG_1)
.annotate 'line', 8707
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8709
    __ARG_1.'print'(')')
# }
.annotate 'line', 8710

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 8695
    addattribute $P0, 'params'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8719
    setattribute self, 'params', __ARG_1
.annotate 'line', 8720
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8721

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8724
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8725
    .return(self)
# }
.annotate 'line', 8726

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8729
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8730
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8731
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8732
    __ARG_1.'print'('    ')
.annotate 'line', 8733
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8734
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8735
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8736
    __ARG_1.'say'()
# }
.annotate 'line', 8737

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 8715
    addattribute $P0, 'params'
.annotate 'line', 8716
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
.annotate 'line', 8754
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8755

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8756
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8760
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8761

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 8750
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8769
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8770
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8771

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8772
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8776
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8777
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8778

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 8764
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8766
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8787
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8788
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8789
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8790
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 8791
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8792
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8793
    $P2 = __ARG_1.'get'()
.annotate 'line', 8794
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8795
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8797
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8801
.const 'Sub' WSubId_41 = 'WSubId_41'
    WSubId_41('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8803
# {
.annotate 'line', 8804
    $P2 = __ARG_1.'get'()
.annotate 'line', 8805
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 8806
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8807
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8808
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 8809
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8811
    setattribute self, 'key', $P1
# }
.annotate 'line', 8812

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8813
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8816
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8817

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8821
.const 'Sub' WSubId_58 = 'WSubId_58'
    getattribute $P2, self, 'key'
    $P1 = WSubId_58($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8822

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 8781
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8783
    addattribute $P0, 'key'
.annotate 'line', 8784
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8830
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8831
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8832
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 8833
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8834
    $P2 = __ARG_1.'get'()
.annotate 'line', 8835
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8837
    __ARG_1.'unget'($P2)
.annotate 'line', 8838
    setattribute self, 'key', $P1
# }
.annotate 'line', 8839

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8840
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8844
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8845
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8846

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8850
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8851
    unless_null $P1, __label_1
# {
.annotate 'line', 8852
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8853
.const 'Sub' WSubId_67 = 'WSubId_67'
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_67($S2)
  __label_3: # endif
.annotate 'line', 8854
.const 'Sub' WSubId_58 = 'WSubId_58'
    getattribute $P3, self, 'key'
    $P2 = WSubId_58($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8856
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 8857

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 8825
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8827
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8862
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8863
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8864
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8865
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8866
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8867
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8868
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 8869
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 8870

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8882
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8883
    setattribute self, 'name', __ARG_2
.annotate 'line', 8884
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8885
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8886
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8887

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8890
.const 'Sub' WSubId_58 = 'WSubId_58'
    getattribute $P1, self, 'classns'
    .tailcall WSubId_58($P1)
# }
.annotate 'line', 8891

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 8876
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8878
    addattribute $P0, 'name'
.annotate 'line', 8879
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8904
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8905
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8906
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8907
    setattribute self, 'functions', $P1
.annotate 'line', 8908
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8909
    setattribute self, 'members', $P2
.annotate 'line', 8910
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8911
    setattribute self, 'constants', $P3
.annotate 'line', 8913
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8914
    $P8 = $P4.'isop'(':')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 8915
.const 'Sub' WSubId_36 = 'WSubId_36'
.const 'Sub' WSubId_60 = 'WSubId_60'
    $P10 = WSubId_36(__ARG_4, self, WSubId_60)
    setattribute self, 'bases', $P10
.annotate 'line', 8916
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 8918
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4('{', $P4)
# for loop
.annotate 'line', 8919
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 8920
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
.annotate 'line', 8922
# var f: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8923
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 8926
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 8927
    $P10 = $P6.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 8928
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 8929
# predefined push
    push $P2, $P6
.annotate 'line', 8930
    $P4 = __ARG_4.'get'()
.annotate 'line', 8931
    $P11 = $P4.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 8932
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 8935
# var cst: $P7
.const 'Sub' WSubId_44 = 'WSubId_44'
    $P7 = WSubId_44($P4, __ARG_4, self)
.annotate 'line', 8936
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 8939
.const 'Sub' WSubId_41 = 'WSubId_41'
    WSubId_41("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 8919
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 8942

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8945
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8946

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8949
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8950

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8953
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8954

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8957
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8958

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8961
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8962

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8965
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8966

.end # use_predef


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8969
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'constants'
    WSubId_38($P1)
.annotate 'line', 8970
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'functions'
    WSubId_38($P1)
.annotate 'line', 8971
    .return(self)
# }
.annotate 'line', 8972

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8975
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8976
.const 'Sub' WSubId_107 = 'WSubId_107'
    $P5 = WSubId_107($P1)
    __ARG_1.'say'($P5)
.annotate 'line', 8977
.const 'Sub' WSubId_52 = 'WSubId_52'
    getattribute $P5, self, 'functions'
    WSubId_52(__ARG_1, $P5)
.annotate 'line', 8979
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8981
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8982
# n: $I1
    set $I1, 1
.annotate 'line', 8983
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 8984
    if_null $P2, __label_1
# {
.annotate 'line', 8985
    getattribute $P5, self, 'bases'
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 8986
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8987
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8988
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8989
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8990
    __ARG_1.'say'()
.annotate 'line', 8991
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8994
    getattribute $P5, self, 'members'
    iter $P7, $P5
    set $P7, 0
  __label_4: # for iteration
    unless $P7 goto __label_5
    shift $P4, $P7
# {
.annotate 'line', 8995
    __ARG_1.'annotate'($P4)
.annotate 'line', 8996
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8999
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9000

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 8894
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8896
    addattribute $P0, 'parent'
.annotate 'line', 8897
    addattribute $P0, 'bases'
.annotate 'line', 8898
    addattribute $P0, 'constants'
.annotate 'line', 8899
    addattribute $P0, 'functions'
.annotate 'line', 8900
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9007
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9008

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9011
    .return(self)
# }
.annotate 'line', 9012

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9003
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9020
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9021
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9022
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9023
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9024
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9025
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9023
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.annotate 'line', 9027
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4(';', $P2)
.annotate 'line', 9028
    new $P4, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9031
    __ARG_2.'unget'($P2)
.annotate 'line', 9032
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9034

.end # parseClass


.sub 'include_parrot' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9042
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9043
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.annotate 'line', 9044
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9045
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
.annotate 'line', 9046
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9047
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9052
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9053
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9054
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9055
    iter $P8, $P4
    set $P8, 0
  __label_3: # for iteration
    unless $P8 goto __label_4
    shift $S2, $P8
# {
.annotate 'line', 9056
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9057
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9058
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9059
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9057
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
.annotate 'line', 9064
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.annotate 'line', 9065
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9070
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
.annotate 'line', 9071
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9072
# pos: $I1
    set $I1, 12
.annotate 'line', 9073
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9074
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9075
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9076
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9077
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9078
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9079
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9080
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9082
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9083
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9084
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9085
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9086
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9087
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9088
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9089
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9091
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9093
# ivalue: $I3
    null $I3
.annotate 'line', 9094
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9095
# predefined substr
    substr $S10, $S7, 2
    box $P9, $S10
    $P7 = $P9.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9097
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9098
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9099
.const 'Sub' WSubId_21 = 'WSubId_21'
.annotate 'line', 9100
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P11, __ARG_1, 'file'
    getattribute $P12, __ARG_1, 'line'
    $P10.'TokenInteger'($P11, $P12, $S6)
    set $P9, $P10
.annotate 'line', 9099
    $P7 = WSubId_21(__ARG_3, $P9, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9070
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9104
    $P5.'close'()
# }
.annotate 'line', 9105

.end # include_parrot


.sub 'parsensUsing' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9111
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9112
    $P7 = $P1.'iskeyword'('namespace')
    if_null $P7, __label_1
    unless $P7 goto __label_1
# {
.annotate 'line', 9113
# var nskey: $P2
.const 'Sub' WSubId_55 = 'WSubId_55'
    $P2 = WSubId_55(__ARG_2)
.annotate 'line', 9114
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9115
    ge $I1, 1, __label_2
.annotate 'line', 9116
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Unsupported', $P1)
  __label_2: # endif
.annotate 'line', 9117
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
.annotate 'line', 9118
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9119
    unless_null $P3, __label_3
.annotate 'line', 9120
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9121
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9122
    .return()
# }
  __label_1: # endif
.annotate 'line', 9124
    $P7 = $P1.'iskeyword'('extern')
    isfalse $I3, $P7
    unless $I3 goto __label_4
# {
.annotate 'line', 9125
    __ARG_2.'unget'($P1)
.annotate 'line', 9126
# var key: $P4
.const 'Sub' WSubId_55 = 'WSubId_55'
    $P4 = WSubId_55(__ARG_2)
.annotate 'line', 9127
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9128
    ge $I2, 1, __label_5
.annotate 'line', 9129
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Unsupported at namespace level', $P1)
  __label_5: # endif
.annotate 'line', 9130
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
.annotate 'line', 9131
    __ARG_3.'use'($P4)
.annotate 'line', 9132
    .return()
# }
  __label_4: # endif
.annotate 'line', 9134
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9136
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9142
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9138
# reqlib: $S1
    set $P7, $P1
    null $S1
    if_null $P7, __label_10
    set $S1, $P7
  __label_10:
.annotate 'line', 9139
    __ARG_3.'addlib'($S1)
.annotate 'line', 9140
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9143
    __ARG_2.'unget'($P1)
.annotate 'line', 9144
# var module: $P5
.const 'Sub' WSubId_55 = 'WSubId_55'
    $P5 = WSubId_55(__ARG_2)
.annotate 'line', 9145
    $P1 = __ARG_2.'get'()
.annotate 'line', 9146
    $P8 = $P1.'isop'(';')
    isfalse $I4, $P8
    unless $I4 goto __label_11
# {
.annotate 'line', 9147
    __ARG_2.'unget'($P1)
.annotate 'line', 9148
# var names: $P6
.const 'Sub' WSubId_36 = 'WSubId_36'
    null $P7
.const 'Sub' WSubId_57 = 'WSubId_57'
    $P6 = WSubId_36(__ARG_2, $P7, WSubId_57, ';')
.annotate 'line', 9149
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9151
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9152
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9155
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9157

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9167
    setattribute self, 'module', __ARG_1
.annotate 'line', 9168
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9169

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9174
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9182
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9183
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9184
    __ARG_1.'say'("']")
.annotate 'line', 9185
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9186
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9187
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9193

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9163
    addattribute $P0, 'module'
.annotate 'line', 9164
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9212
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9213
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9214
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9215
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9216
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9217
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9220
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9221
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9222
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9223
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9224
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9226
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9227

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9230
# var ns: $P1
    null $P1
.annotate 'line', 9231
    getattribute $P3, self, 'namespaces'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9232
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9233
    getattribute $P3, self, 'usednamespaces'
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9234
    getattribute $P6, $P1, 'usednamespaces'
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9235
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9236

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9239
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9240

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9243
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9244
    .return()
  __label_1: # endif
.annotate 'line', 9245
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9246
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9247
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9248
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9249
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9250

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9253
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9254
    if_null $P1, __label_1
# {
.annotate 'line', 9255
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9256
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9259
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9260
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9261
    if_null $P2, __label_5
# {
.annotate 'line', 9262
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9263
    if_null $P1, __label_6
.annotate 'line', 9264
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9267

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9270
    getattribute $P2, self, 'usednamespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9271
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9272
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9273
    .return($P2)
# }
.annotate 'line', 9274

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9277
    getattribute $P2, self, 'namespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9278
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9279
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9280
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9281

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9285
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9286
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9287
    unless_null $P2, __label_1
.annotate 'line', 9288
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9290
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9291

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9295
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9296
# var cl: $P2
    null $P2
.annotate 'line', 9297
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9298
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9299
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9300
    getattribute $P5, self, 'usednamespaces'
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9301
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9302
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9303
    .return($P5)
# }
.annotate 'line', 9304

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9309
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9310
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9312
    .return($P3)
  __label_4: # case
.annotate 'line', 9315
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9320
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9321
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9322
    if_null $P1, __label_5
# {
.annotate 'line', 9323
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9324
    if_null $P2, __label_6
.annotate 'line', 9325
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9328
    .return($P3)
# }
.annotate 'line', 9329

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9332
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9333
    if_null $P1, __label_1
.annotate 'line', 9334
    .return($P1)
  __label_1: # endif
.annotate 'line', 9335
    getattribute $P2, self, 'functions'
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9336
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9337
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9338
    .return($P2)
# }
.annotate 'line', 9339

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9344
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9345
# name: $S1
    null $S1
.annotate 'line', 9346
# var sym: $P1
    null $P1
.annotate 'line', 9347
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9348
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9350
    .return($P3)
  __label_4: # case
.annotate 'line', 9352
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9354
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9355
    .return($P1)
  __label_5: # endif
.annotate 'line', 9356
    getattribute $P4, self, 'usednamespaces'
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9357
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9358
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9364
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9365
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9366
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9367
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9368
    .return($P1)
  __label_9: # endif
.annotate 'line', 9369
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9370
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9371
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9372
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9374
    .return($P3)
# }
.annotate 'line', 9375

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9378
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9379
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9381
    .return($P2)
  __label_2: # default
.annotate 'line', 9383
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9384
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9385
    if_null $P1, __label_4
# {
.annotate 'line', 9386
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9387
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9389
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9392
    .return($P2)
# }
.annotate 'line', 9393

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9396
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9397
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9398
    .return($P1)
# }
.annotate 'line', 9399

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9402
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9403
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9404
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9405
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9406
    .return($P2)
# }
.annotate 'line', 9407

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9410
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9411

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9414
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9415
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9416

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9419
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9420
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9421
    $P1 = __ARG_2.'get'()
.annotate 'line', 9423
# var modifier: $P2
    null $P2
.annotate 'line', 9424
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9425
    new $P5, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9426
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.annotate 'line', 9429
.const 'Sub' WSubId_4 = 'WSubId_4'
    WSubId_4('{', $P1)
.annotate 'line', 9430
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9431
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9432

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9435
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9436
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9437
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9438
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9439
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
.annotate 'line', 9441
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
.annotate 'line', 9443
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9446
# var cst: $P5
.const 'Sub' WSubId_44 = 'WSubId_44'
    $P5 = WSubId_44($P4, __ARG_1, self)
.annotate 'line', 9447
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9450
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9451
# predefined push
    push $P2, $P6
.annotate 'line', 9452
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9455
.const 'Sub' WSubId_108 = 'WSubId_108'
    WSubId_108($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9458
.const 'Sub' WSubId_109 = 'WSubId_109'
    WSubId_109($P4, __ARG_1, self)
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9461
.const 'Sub' WSubId_110 = 'WSubId_110'
    WSubId_110($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9464
    $P4 = __ARG_1.'get'()
.annotate 'line', 9465
    $P9 = $P4.'isstring'()
    isfalse $I2, $P9
    unless $I2 goto __label_15
.annotate 'line', 9466
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('string literal', $P4)
  __label_15: # endif
.annotate 'line', 9467
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_1)
.annotate 'line', 9468
    new $P12, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P12.'StringLiteral'(self, $P4)
    set $P11, $P12
    $P10 = $P11.'getPirString'()
    self.'addload'($P10)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9471
    $P4 = __ARG_1.'get'()
.annotate 'line', 9472
    $P13 = $P4.'isstring'()
    isfalse $I3, $P13
    unless $I3 goto __label_16
.annotate 'line', 9473
.const 'Sub' WSubId_40 = 'WSubId_40'
    WSubId_40('string literal', $P4)
  __label_16: # endif
.annotate 'line', 9474
.const 'Sub' WSubId_54 = 'WSubId_54'
    WSubId_54(';', __ARG_1)
.annotate 'line', 9475
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P4)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addlib'($P14)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9478
.const 'Sub' WSubId_41 = 'WSubId_41'
    WSubId_41("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9439
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9481
    if_null $P4, __label_17
    unless $P4 goto __label_17
.annotate 'line', 9482
    self.'close_ns'($P4)
    goto __label_18
  __label_17: # else
.annotate 'line', 9484
    self.'unclosed_ns'()
  __label_18: # endif
# }
.annotate 'line', 9485

.end # parse


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 9488
.const 'Sub' WSubId_38 = 'WSubId_38'
    getattribute $P1, self, 'items'
    WSubId_38($P1)
# }
.annotate 'line', 9489

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9492
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9493
# s: $S1
.const 'Sub' WSubId_107 = 'WSubId_107'
    $P4 = WSubId_107($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9495
# activate: $I1
    set $I1, 1
.annotate 'line', 9497
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9498
    if_null $P2, __label_2
# {
.annotate 'line', 9499
    __ARG_1.'say'($S1)
.annotate 'line', 9500
    null $I1
.annotate 'line', 9501
.const 'Sub' WSubId_52 = 'WSubId_52'
    WSubId_52(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9504
    getattribute $P4, self, 'items'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
# {
.annotate 'line', 9505
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9506
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9507
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9509
    unless $I1 goto __label_8
# {
.annotate 'line', 9510
    __ARG_1.'say'($S1)
.annotate 'line', 9511
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9513
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9515

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9200
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9202
    addattribute $P0, 'nspath'
.annotate 'line', 9203
    addattribute $P0, 'externals'
.annotate 'line', 9204
    addattribute $P0, 'namespaces'
.annotate 'line', 9205
    addattribute $P0, 'classes'
.annotate 'line', 9206
    addattribute $P0, 'functions'
.annotate 'line', 9207
    addattribute $P0, 'items'
.annotate 'line', 9208
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
.annotate 'line', 9533
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9534
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9535
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9537
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9538
    setattribute self, 'start', __ARG_2
.annotate 'line', 9539
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9540
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9541
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9542
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9543
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9544
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9546

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9549
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9550

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9553
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9554

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9557
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9558

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9561
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9562

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9565
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9566

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9569
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9570
    unless_null $P1, __label_1
.annotate 'line', 9571
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9572
    .return($P1)
# }
.annotate 'line', 9573

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9578
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9579
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9580
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9581
    .return($P1)
# }
.annotate 'line', 9582

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9585
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9586
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9587
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9588
    .return($P1)
# }
.annotate 'line', 9589

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9592
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9593
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9594
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9595
    .return($P1)
# }
.annotate 'line', 9596

.end # findns


.sub 'unclosed_ns' :method
# Body
# {
.annotate 'line', 9599
.const 'Sub' WSubId_1 = 'WSubId_1'
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 9600

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9607
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9608
    if_null $P1, __label_1
.annotate 'line', 9609
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9610
    self.'optimize_base'()
.annotate 'line', 9611
    .return(self)
# }
.annotate 'line', 9612

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9615
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9616
    if_null $P1, __label_1
.annotate 'line', 9617
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9619
    self.'emit_base'(__ARG_1)
.annotate 'line', 9621
    if_null $P1, __label_2
.annotate 'line', 9622
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9623

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 9522
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9524
    addattribute $P0, 'parent'
.annotate 'line', 9525
    addattribute $P0, 'start'
.annotate 'line', 9526
    addattribute $P0, 'name'
.annotate 'line', 9527
    addattribute $P0, 'modifier'
.annotate 'line', 9528
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9640
    new $P1, ['ResizableStringArray']
.annotate 'line', 9641
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9642
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9643
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9644
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9645

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9648
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9649
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9650

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9653
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9654
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9655

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9659
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9658
    set $S1, $I1
.annotate 'line', 9660
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9661

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9665
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9666
    unless_null $P1, __label_1
.annotate 'line', 9667
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9668
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9669

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9672
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9673
    unless_null $P1, __label_1
.annotate 'line', 9674
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9675
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9676

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9679
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9680

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9684
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9685

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9688
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9689

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9692
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9693

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9700
.const 'Sub' WSubId_1 = 'WSubId_1'
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9701

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9704
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9705

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9708
    self.'optimize_base'()
.annotate 'line', 9709
    .return(self)
# }
.annotate 'line', 9710

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9713
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9716
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9717
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9720
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
.annotate 'line', 9723
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9724
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9725
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9726
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9729
# somelib: $I1
    null $I1
.annotate 'line', 9730
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9731
    if_null $P3, __label_5
# {
.annotate 'line', 9732
    set $I1, 1
.annotate 'line', 9733
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9734
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9737
# someload: $I2
    null $I2
.annotate 'line', 9738
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9739
    if_null $P4, __label_8
# {
.annotate 'line', 9740
    set $I2, 1
.annotate 'line', 9741
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9742
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9743
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9744
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9746
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9747
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9749
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9750

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9753
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9754
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9755
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9756
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9757
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9758
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9760
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9761
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9763

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 9630
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9632
    addattribute $P0, 'unit'
.annotate 'line', 9633
    addattribute $P0, 'predefs_used'
.annotate 'line', 9634
    addattribute $P0, 'libs'
.annotate 'line', 9635
    addattribute $P0, 'loads'
.annotate 'line', 9636
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9779
    box $P7, 1
    setattribute self, 'warnings', $P7
.annotate 'line', 9780
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9783
# var taux: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9785
# var cfalse: $P3
    $P3 = $P1.'createconst'('false', 'I', 4)
.annotate 'line', 9786
.const 'Sub' WSubId_21 = 'WSubId_21'
.annotate 'line', 9787
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9786
    $P7 = WSubId_21($P1, $P8, 0)
    $P3.'setvalue'($P7)
.annotate 'line', 9788
# var ctrue: $P4
    $P4 = $P1.'createconst'('true', 'I', 4)
.annotate 'line', 9789
.const 'Sub' WSubId_21 = 'WSubId_21'
.annotate 'line', 9790
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9789
    $P7 = WSubId_21($P1, $P8, 1)
    $P4.'setvalue'($P7)
.annotate 'line', 9794
# var cstage: $P5
    $P5 = $P1.'createconst'('__STAGE__', 'S', 4)
.annotate 'line', 9795
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 9796
    new $P10, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P11, $P2, 'file'
    getattribute $P12, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9795
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P10.'TokenQuoted'($P11, $P12, $S1)
    set $P9, $P10
    $P8.'StringLiteral'($P1, $P9)
    set $P7, $P8
    $P5.'setvalue'($P7)
.annotate 'line', 9798
# var cerrtype: $P6
    $P6 = $P1.'createconst'('__WINXED_ERROR__', 'S', 4)
.annotate 'line', 9799
.const 'Sub' WSubId_21 = 'WSubId_21'
.annotate 'line', 9800
    new $P9, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, '__WINXED_ERROR__')
    set $P8, $P9
.annotate 'line', 9799
    $P7 = WSubId_21($P1, $P8, 567)
    $P6.'setvalue'($P7)
.annotate 'line', 9802
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9803

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9806
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9807

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9810
    getattribute $P1, self, 'warnings'
.annotate 'line', 9809
    set $I1, $P1
.annotate 'line', 9810
    .return($I1)
# }
.annotate 'line', 9811

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9814
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 9815
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 9816

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9819
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9820

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9823
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 9824
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9825
    __ARG_1.'say'('')
.annotate 'line', 9827
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9829
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9830

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9833
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9834
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9836
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9838
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9839

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9774
    addattribute $P0, 'rootns'
.annotate 'line', 9775
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9848
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 9849
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 9850
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9851
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9852
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9853
    if_null __ARG_3, __label_2
    unless __ARG_3 goto __label_2
.annotate 'line', 9854
    $P2.'disable_annotations'()
  __label_2: # endif
.annotate 'line', 9855
    __ARG_1.'emit'($P2)
.annotate 'line', 9856
    $P2.'close'()
.annotate 'line', 9857
    $P1.'close'()
.annotate 'line', 9858
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9859
# var object: $P3
    null $P3
# switch
.annotate 'line', 9860
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_6
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_7
    set $S3, ''
    if $S2 == $S3 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 9862
    new $P3, [ 'String' ]
.annotate 'line', 9863
    assign $P3, $S1
    goto __label_4 # break
  __label_7: # case
  __label_8: # case
.annotate 'line', 9867
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9868
    $P3 = $P4($S1)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9869
# predefined string
.annotate 'line', 9871
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_4: # switch end
.annotate 'line', 9873
    .return($P3)
# }
.annotate 'line', 9874

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9877
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9878
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9879
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9880
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9881
    $P2.'close'()
.annotate 'line', 9882
    $P1.'close'()
.annotate 'line', 9883
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9884

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9890
    unless_null __ARG_2, __label_1
.annotate 'line', 9891
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9892
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9893
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9894
    $P1.'puts'(__ARG_1)
.annotate 'line', 9895
    $P1.'close'()
.annotate 'line', 9896
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9897
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9898
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9899
    unless __ARG_4 goto __label_2
.annotate 'line', 9900
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9901
    $P3.'parse'($P2)
.annotate 'line', 9902
    $P1.'close'()
.annotate 'line', 9903
    $P3.'optimize'()
.annotate 'line', 9904
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9905
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9907
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9908

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9914
    unless_null __ARG_2, __label_1
.annotate 'line', 9915
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9916
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9917
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9918
    $P1.'encoding'('utf8')
.annotate 'line', 9919
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9920
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 9921
    unless __ARG_4 goto __label_2
.annotate 'line', 9922
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9923
    $P3.'parse'($P2)
.annotate 'line', 9924
    $P1.'close'()
.annotate 'line', 9925
    $P3.'optimize'()
.annotate 'line', 9926
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9927
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9929
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9930

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9939
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 9940
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9941

.end # initializer

# End generated code
