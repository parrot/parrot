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

.sub 'Warn' :subid('WSubId_68')
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


.sub 'NoLeftSide' :subid('WSubId_59')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 130
    WSubId_1('Not a left-side expression', __ARG_1)
# }
.annotate 'line', 131

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_39')
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


.sub 'Unexpected' :subid('WSubId_40')
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


.sub 'RequireIdentifier' :subid('WSubId_93')
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


.sub 'ExpectOp' :subid('WSubId_53')
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


.sub 'ExpectKeyword' :subid('WSubId_95')
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


.sub 'UndefinedVariable' :subid('WSubId_61')
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
# predefined float
.annotate 'line', 449
    getattribute $P1, self, 'str'
    set $N1, $P1
    .return($N1)
# }
.annotate 'line', 450

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
.annotate 'line', 460
# s: $S1
    set $S1, ''
.annotate 'line', 461
# c: $S2
    null $S2
# for loop
.annotate 'line', 462
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 463
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
.annotate 'line', 466
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 469
# c2: $S3
    $P2 = __ARG_1.'getchar'()
    null $S3
    if_null $P2, __label_9
    set $S3, $P2
  __label_9:
.annotate 'line', 470
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.annotate 'line', 471
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 472
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 475
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 462
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 478
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 479

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 483
# s: $S1
    set $S1, ''
.annotate 'line', 484
# c: $S2
    null $S2
# for loop
.annotate 'line', 485
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 486
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 487
    WSubId_7('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 488
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 485
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 490
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenSingleQuoted'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 491

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 495
# mark: $S1
    set $S1, ''
.annotate 'line', 496
# c: $S2
    null $S2
# for loop
.annotate 'line', 497
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 498
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 500
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 505
    concat $S2, '\', $S2
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 508
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 497
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 510
    concat $S1, $S1, ':>>'
.annotate 'line', 512
# content: $S3
    set $S3, ''
.annotate 'line', 513
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 514
# {
.annotate 'line', 515
    set $S4, ''
# for loop
.annotate 'line', 516
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 517
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.annotate 'line', 519
    WSubId_7('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 522
    concat $S2, '\', $S2
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 525
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 516
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 527
    eq $S4, $S1, __label_20
.annotate 'line', 528
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 529
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 530
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenQuoted'($P3, __ARG_3, $S3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 531

.end # getheredoc


.sub 'getident' :subid('WSubId_11')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_8 = "WSubId_8"
# Body
# {
.annotate 'line', 535
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 536
# c: $S2
    null $S2
# for loop
.annotate 'line', 537
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    $P2 = WSubId_8($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 538
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 537
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_3
  __label_2: # for end
.annotate 'line', 539
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 540
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 541

.end # getident


.sub 'getnumber' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_9 = "WSubId_9"
.const 'Sub' WSubId_10 = "WSubId_10"
# Body
# {
.annotate 'line', 545
# s: $S1
    null $S1
.annotate 'line', 546
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 547
# {
.annotate 'line', 548
    concat $S1, $S1, $S2
.annotate 'line', 549
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.annotate 'line', 550
    $P1 = WSubId_9($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 551
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 552
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 553
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
    $P2 = WSubId_10($S2)
    set $I2, $P2
    lt $I2, 0, __label_8
# {
.annotate 'line', 554
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 555
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 553
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 557
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 558
    set $S1, $I1
.annotate 'line', 559
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenInteger'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 561
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 562
# {
.annotate 'line', 563
    concat $S1, $S1, $S2
.annotate 'line', 564
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.annotate 'line', 565
    $P1 = WSubId_9($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 566
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 567
    concat $S1, $S1, 'E'
.annotate 'line', 568
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 569
    concat $S1, $S1, $S2
.annotate 'line', 570
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.annotate 'line', 572
    $P1 = WSubId_9($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 573
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 572
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 575
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 576
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 579
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 580
    concat $S1, $S1, 'E'
.annotate 'line', 581
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 582
    concat $S1, $S1, $S2
.annotate 'line', 583
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.annotate 'line', 585
    $P1 = WSubId_9($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 586
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 585
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_29
  __label_28: # for end
.annotate 'line', 587
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 588
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenFloat'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 591
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 592
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
.annotate 'line', 595

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 599
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 600
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
.annotate 'line', 601
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 600
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 602
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 603

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_7 = "WSubId_7"
# Body
# {
.annotate 'line', 607
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 608
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 609
# {
# for loop
  __label_7: # for condition
.annotate 'line', 610
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 611
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 610
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 612
    ne $S2, '', __label_9
.annotate 'line', 613
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 614
    concat $S1, $S1, $S2
.annotate 'line', 615
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 616
    ne $S2, '', __label_10
.annotate 'line', 617
    WSubId_7("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 618
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 619
    concat $S1, $S1, '/'
.annotate 'line', 620
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 621

.end # getcomment


.sub 'getop' :subid('WSubId_12')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 625
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 626
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 627

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
.annotate 'line', 643
    setattribute self, 'h', __ARG_1
.annotate 'line', 644
    box $P2, ''
    setattribute self, 'pending', $P2
.annotate 'line', 645
    root_new $P3, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P3
.annotate 'line', 646
    box $P2, __ARG_2
    setattribute self, 'filename', $P2
.annotate 'line', 647
    box $P2, 1
    setattribute self, 'line', $P2
.annotate 'line', 648
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 649
    root_new $P3, ['parrot';'Hash']
    $P3[''] = WSubId_11
    $P3['{'] = WSubId_12
    $P1['$'] = $P3
.annotate 'line', 650
    $P1['"'] = WSubId_13
.annotate 'line', 651
    $P1["'"] = WSubId_14
.annotate 'line', 652
    root_new $P9, ['parrot';'Hash']
.annotate 'line', 653
    root_new $P11, ['parrot';'Hash']
    $P11[''] = WSubId_12
    $P11['='] = WSubId_12
    $P9['='] = $P11
.annotate 'line', 654
    $P9[':'] = WSubId_12
    $P1['='] = $P9
.annotate 'line', 656
    root_new $P16, ['parrot';'Hash']
    $P16['+'] = WSubId_12
    $P16['='] = WSubId_12
    $P1['+'] = $P16
.annotate 'line', 657
    root_new $P20, ['parrot';'Hash']
    $P20['-'] = WSubId_12
    $P20['='] = WSubId_12
    $P1['-'] = $P20
.annotate 'line', 658
    root_new $P24, ['parrot';'Hash']
    $P24['='] = WSubId_12
    $P1['*'] = $P24
.annotate 'line', 659
    root_new $P27, ['parrot';'Hash']
    $P27['|'] = WSubId_12
    $P1['|'] = $P27
.annotate 'line', 660
    root_new $P30, ['parrot';'Hash']
    $P30['&'] = WSubId_12
    $P1['&'] = $P30
.annotate 'line', 661
    root_new $P33, ['parrot';'Hash']
.annotate 'line', 662
    root_new $P35, ['parrot';'Hash']
    $P35[''] = WSubId_12
    $P35[':'] = WSubId_15
    $P33['<'] = $P35
.annotate 'line', 663
    $P33['='] = WSubId_12
    $P1['<'] = $P33
.annotate 'line', 665
    root_new $P40, ['parrot';'Hash']
    $P40['>'] = WSubId_12
    $P40['='] = WSubId_12
    $P1['>'] = $P40
.annotate 'line', 666
    root_new $P44, ['parrot';'Hash']
.annotate 'line', 667
    root_new $P46, ['parrot';'Hash']
    $P46[''] = WSubId_12
    $P46['='] = WSubId_12
    $P44['='] = $P46
    $P1['!'] = $P44
.annotate 'line', 669
    root_new $P50, ['parrot';'Hash']
    $P50['%'] = WSubId_12
    $P50['='] = WSubId_12
    $P1['%'] = $P50
.annotate 'line', 670
    root_new $P54, ['parrot';'Hash']
    $P54['='] = WSubId_12
    $P54['/'] = WSubId_16
    $P54['*'] = WSubId_17
    $P1['/'] = $P54
.annotate 'line', 671
    $P1['#'] = WSubId_16
.annotate 'line', 673
    setattribute self, 'select', $P1
# }
.annotate 'line', 674

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 677
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 678
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 679
    eq $S1, '', __label_2
.annotate 'line', 680
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 682
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 683
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 684
    ne $S1, "\n", __label_4
.annotate 'line', 685
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 687
    .return($S1)
# }
.annotate 'line', 688

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 691
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 692

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
.annotate 'line', 695
    getattribute $P3, self, 'stacked'
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 696
    getattribute $P4, self, 'stacked'
    .tailcall $P4.'pop'()
  __label_1: # endif
.annotate 'line', 698
# c: $S1
    $P3 = self.'getchar'()
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
  __label_4: # while
.annotate 'line', 699
    $P3 = WSubId_18($S1)
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 700
    $P4 = self.'getchar'()
    set $S1, $P4
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 701
# line: $I1
    getattribute $P3, self, 'line'
    set $I1, $P3
.annotate 'line', 702
    ne $S1, '', __label_5
.annotate 'line', 703
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    getattribute $P5, self, 'filename'
    $P4.'TokenEof'($P5)
    set $P3, $P4
    .return($P3)
  __label_5: # endif
.annotate 'line', 704
    $P3 = WSubId_19($S1)
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 705
    .tailcall WSubId_11(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 706
    $P3 = WSubId_9($S1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 707
    .tailcall WSubId_20(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 709
# op: $S2
    set $S2, $S1
.annotate 'line', 710
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 711
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 713
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 714
    $P3 = self.'getchar'()
    set $S1, $P3
.annotate 'line', 715
    set $P1, $P2
.annotate 'line', 716
    $P2 = $P1[$S1]
.annotate 'line', 717
    unless_null $P2, __label_11
# {
.annotate 'line', 718
    self.'ungetchar'($S1)
.annotate 'line', 719
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 722
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 724
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 725
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 726
    .tailcall WSubId_12(self, $S2, $I1)
# }
.annotate 'line', 727

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 730
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 731
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 732
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 733
    .return($P1)
# }
.annotate 'line', 734

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 737
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 738

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
.annotate 'line', 635
    addattribute $P0, 'h'
.annotate 'line', 636
    addattribute $P0, 'pending'
.annotate 'line', 637
    addattribute $P0, 'select'
.annotate 'line', 638
    addattribute $P0, 'stacked'
.annotate 'line', 639
    addattribute $P0, 'filename'
.annotate 'line', 640
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

.sub 'typetoregcheck' :subid('WSubId_96')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 760
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
.annotate 'line', 761
    .return('I')
  __label_4: # case
.annotate 'line', 762
    .return('N')
  __label_5: # case
.annotate 'line', 763
    .return('S')
  __label_6: # case
.annotate 'line', 764
    .return('P')
  __label_2: # default
.annotate 'line', 765
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 767

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_105')
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
# switch
.annotate 'line', 771
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
.annotate 'line', 772
    .return('int')
  __label_4: # case
.annotate 'line', 773
    .return('num')
  __label_5: # case
.annotate 'line', 774
    .return('string')
  __label_6: # case
.annotate 'line', 775
    .return('pmc')
  __label_2: # default
.annotate 'line', 776
    WSubId_6('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 778

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 798
    setattribute self, 'handle', __ARG_1
.annotate 'line', 799
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 800
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 801
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 802
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 803

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 806
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 807

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 810
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 811

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 814
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 815
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 817
    getattribute $P5, self, 'file'
.annotate 'line', 815
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 820
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 822
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 823
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 825
    getattribute $P5, self, 'line'
.annotate 'line', 823
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 828
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 830

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 833
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 834
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 835

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 838
    self.'updateannot'()
.annotate 'line', 839
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 840

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 843
    self.'updateannot'()
.annotate 'line', 844
    self.'vprint'(__ARG_1)
.annotate 'line', 845
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 846

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 849
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 851
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 852
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 853
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 854
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 855
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 856
    assign $P1, $S1
.annotate 'line', 857
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 858
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 860
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 861
    assign $P2, $I1
.annotate 'line', 862
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 865

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 868
    self.'updateannot'()
.annotate 'line', 869
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 870

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 873
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 874
    $P1.'print'('  ')
.annotate 'line', 875
    $P1.'print'(__ARG_1)
.annotate 'line', 876
    $P1.'print'(':')
.annotate 'line', 877
    if_null __ARG_2, __label_1
.annotate 'line', 878
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 879
    $P1.'print'("\n")
# }
.annotate 'line', 880

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 883
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 884
    $P1.'print'('    goto ')
.annotate 'line', 885
    $P1.'print'(__ARG_1)
.annotate 'line', 886
    if_null __ARG_2, __label_1
.annotate 'line', 887
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 888
    $P1.'print'("\n")
# }
.annotate 'line', 889

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 893
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 894

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 897
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 898

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 901
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 902

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 905
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 906

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 909
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 910

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 913
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 914

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 917
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 918

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 922
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 923

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 926
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 927

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 930
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 931

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 934
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 935

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 938
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 939

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 942
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 943

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 946
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 947

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 950
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 951

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 954
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 955

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 958
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 959

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 962
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 963

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 966
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 967

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 970
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 971

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 974
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 975

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 978
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 979

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 982
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 983

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 986
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 987

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 990
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 991

.end # emitsay


.sub 'emitget_hll_global' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3 :optional
# Body
# {
.annotate 'line', 994
    concat $S1, "    get_hll_global ", __ARG_1
    self.'print'($S1)
.annotate 'line', 995
    if_null __ARG_3, __label_1
.annotate 'line', 996
    concat $S1, ", ", __ARG_3
    self.'print'($S1)
  __label_1: # endif
.annotate 'line', 997
    concat $S1, ", '", __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 998

.end # emitget_hll_global


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1001
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 1002

.end # emitfind_lex


.sub 'emitstore_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1005
    self.'say'("store_lex '", __ARG_1, "', ", __ARG_2)
# }
.annotate 'line', 1006

.end # emitstore_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Emit' ]
.annotate 'line', 789
    addattribute $P0, 'handle'
.annotate 'line', 790
    addattribute $P0, 'file'
.annotate 'line', 791
    addattribute $P0, 'line'
.annotate 'line', 792
    addattribute $P0, 'pendingf'
.annotate 'line', 793
    addattribute $P0, 'pendingl'
.annotate 'line', 794
    addattribute $P0, 'noan'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'integerValue' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 1015
    new $P2, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 1016

.end # integerValue


.sub 'floatValue' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 1020
# var t: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 1021
    new $P3, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 1022

.end # floatValue


.sub 'floatresult' :subid('WSubId_64')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 1030
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 1031
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 1032
    .return($I1)
# }
.annotate 'line', 1033

.end # floatresult


.sub 'floatAsString' :subid('WSubId_60')
        .param num __ARG_1
# Body
# {
.annotate 'line', 1041
# aux: $S1
    set $N1, __ARG_1
    set $S1, $N1
.annotate 'line', 1042
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
.annotate 'line', 1043
    concat $S1, $S1, '.0'
  __label_1: # endif
.annotate 'line', 1044
    .return($S1)
# }
.annotate 'line', 1045

.end # floatAsString

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant PREDEFCONST_FILENAME evaluated at compile time
# Constant PREDEFCONST_LINENUM evaluated at compile time

.sub 'createPredefConstInt' :subid('WSubId_115')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1063
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1064
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1065
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'I', 4)
.annotate 'line', 1066
    $P3 = WSubId_21(__ARG_1, $P1, __ARG_3)
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1067

.end # createPredefConstInt


.sub 'createPredefConstString' :subid('WSubId_107')
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1071
# var tid: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'TokenIdentifier' ]
.annotate 'line', 1072
    $P1.'TokenIdentifier'('__predefconst__', 0, __ARG_2)
.annotate 'line', 1073
# var cst: $P2
    $P2 = __ARG_1.'createconst'($P1, 'S', 4)
.annotate 'line', 1074
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 1075
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    $P6.'TokenQuoted'('__predefconst__', 0, __ARG_3)
    set $P5, $P6
    $P4.'StringLiteral'(__ARG_1, $P5)
    set $P3, $P4
.annotate 'line', 1074
    $P2.'setvalue'($P3)
# }
.annotate 'line', 1076

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
.annotate 'line', 1105
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1106
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1107
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1108
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat __ARG_2, '    ', $S1
.annotate 'line', 1109
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1110
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1111

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
.annotate 'line', 1114
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1116
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1117
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1118
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1121
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1122
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1125
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1126
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 1127
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1128
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1129

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 1091
    addattribute $P0, 'body'
.annotate 'line', 1092
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
.annotate 'line', 1150
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1151
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1152
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1154
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1155
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1156
# n: $I1
    null $I1
.annotate 'line', 1157
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1158
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1159
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1161
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1164
    set $I1, -2
.annotate 'line', 1165
    if_null __ARG_5, __label_8
.annotate 'line', 1166
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1169
    set $I1, 1
.annotate 'line', 1170
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1171
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1172
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1174
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1175
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1176
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1178
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1179
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1180
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1184
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1185

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1188
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1189
    .return($S1)
# }
.annotate 'line', 1190

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1193
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1194

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1195
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1198
# type: $S1
    null $S1
# switch
.annotate 'line', 1199
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
.annotate 'line', 1200
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1201
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1202
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1203
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1205
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1207
    .return($S1)
# }
.annotate 'line', 1208

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1211
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1212
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1213
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1214
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1215
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1216
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1217

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1134
    addattribute $P0, 'name'
.annotate 'line', 1135
    addattribute $P0, 'body'
.annotate 'line', 1136
    addattribute $P0, 'typeresult'
.annotate 'line', 1137
    addattribute $P0, 'type0'
.annotate 'line', 1138
    addattribute $P0, 'type1'
.annotate 'line', 1139
    addattribute $P0, 'type2'
.annotate 'line', 1140
    addattribute $P0, 'type3'
.annotate 'line', 1141
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
.annotate 'line', 1229
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1230

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1220
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
.annotate 'line', 1243
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1244
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1245

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1233
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1235
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1253
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1254

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1257
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1258
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.annotate 'line', 1259
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1260
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1261
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1263
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1264
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1265
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1268
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1269
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1271
    ne $S3, 'null', __label_9
.annotate 'line', 1272
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1274
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1276

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1250
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
.annotate 'line', 1281
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1282
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1283
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1284
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1285
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1284
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1286
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1289
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1290

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1294
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1295
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1296
    if_null __ARG_4, __label_2
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1297
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1298
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1299

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1303
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1304
    if_null __ARG_4, __label_2
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1305
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1306

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1312
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1313
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1314
    WSubId_1("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1315
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1316

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1320
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1321
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1322
# predefined length
    length $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1323

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1327
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1328
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1329
# predefined bytelength
    bytelength $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1330

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1334
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1335
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1336
# predefined ord
    ord $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1337

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1341
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1342
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1343
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1344
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1345
# predefined ord
    ord $I2, $S1, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1346

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1350
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1352
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1353
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1355
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1356
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1357

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1361
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1362
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1363
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1364
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1366
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1367
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1368

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1372
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1373
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1374
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1375
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1376
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1377
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1379
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1380
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1381

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1385
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1386
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1387
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1388
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1389
# predefined indexof
    index $I1, $S1, $S2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1390

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1394
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1395
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1396
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1397
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1398
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1399
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1400
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1401

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_116')
        .param pmc __ARG_1
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
.annotate 'line', 1405
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1406
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('I')
    set $P3, $P4
    $P2.'PredefFunction'('int', $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1405
    __ARG_1.'add'($P1)
.annotate 'line', 1409
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1410
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('N')
    set $P3, $P4
    $P2.'PredefFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1409
    __ARG_1.'add'($P1)
.annotate 'line', 1413
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1414
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('S')
    set $P3, $P4
    $P2.'PredefFunction'('string', $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1413
    __ARG_1.'add'($P1)
.annotate 'line', 1417
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1421
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1425
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1429
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1433
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1437
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1441
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1445
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1449
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1456
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1463
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1470
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1478
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1487
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1497
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1501
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1502
    $P2.'PredefFunctionEval'('length', WSubId_22, 'length %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1501
    __ARG_1.'add'($P1)
.annotate 'line', 1506
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1507
    $P2.'PredefFunctionEval'('bytelength', WSubId_23, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1506
    __ARG_1.'add'($P1)
.annotate 'line', 1511
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1512
    $P2.'PredefFunctionEval'('chr', WSubId_24, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
.annotate 'line', 1511
    __ARG_1.'add'($P1)
.annotate 'line', 1520
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1521
    $P2.'PredefFunctionEval'('ord', WSubId_25, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1520
    __ARG_1.'add'($P1)
.annotate 'line', 1525
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1526
    $P2.'PredefFunctionEval'('ord', WSubId_26, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1525
    __ARG_1.'add'($P1)
.annotate 'line', 1530
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1531
    $P2.'PredefFunctionEval'('substr', WSubId_27, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1530
    __ARG_1.'add'($P1)
.annotate 'line', 1535
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1536
    $P2.'PredefFunctionEval'('substr', WSubId_28, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
.annotate 'line', 1535
    __ARG_1.'add'($P1)
.annotate 'line', 1540
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1544
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1545
    $P2.'PredefFunctionEval'('indexof', WSubId_29, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1544
    __ARG_1.'add'($P1)
.annotate 'line', 1549
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1550
    $P2.'PredefFunctionEval'('indexof', WSubId_30, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1549
    __ARG_1.'add'($P1)
.annotate 'line', 1554
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1558
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('escape', 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1562
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1570
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1578
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1585
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1592
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1596
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1600
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1604
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1608
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1615
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1622
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1626
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1630
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1634
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1638
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1642
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1646
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1650
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1654
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1658
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1662
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1666
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1670
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1674
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1687
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1691
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1695
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1699
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1703
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1707
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1711
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1715
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1719
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1723
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1727
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1734
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1741
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1745
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1749
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1753
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1757
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1761
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1762
    $P2.'PredefFunction'('print', WSubId_31, 'v', '*')
    set $P1, $P2
.annotate 'line', 1761
    __ARG_1.'add'($P1)
.annotate 'line', 1765
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1766
    $P2.'PredefFunction'('say', WSubId_32, 'v', '*')
    set $P1, $P2
.annotate 'line', 1765
    __ARG_1.'add'($P1)
.annotate 'line', 1769
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1770
    $P2.'PredefFunction'('cry', WSubId_33, 'v', '*')
    set $P1, $P2
.annotate 'line', 1769
    __ARG_1.'add'($P1)
.annotate 'line', 1773
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1774
    $P2.'PredefFunction'('invoke', WSubId_34, 'P', '!')
    set $P1, $P2
.annotate 'line', 1773
    __ARG_1.'add'($P1)
# }
.annotate 'line', 1777

.end # getpredefs


.sub 'optimize_array' :subid('WSubId_37')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1785
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1786
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1787
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1788
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1787
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1790

.end # optimize_array


.sub 'emit_array' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1794
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 1795
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1796

.end # emit_array


.sub 'parseDotted' :subid('WSubId_54')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1800
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1801
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1802
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1803
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1804
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1805
    $P2 = __ARG_1.'get'()
.annotate 'line', 1806
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1809
    __ARG_1.'unget'($P2)
.annotate 'line', 1810
    .return($P1)
# }
.annotate 'line', 1811

.end # parseDotted


.sub 'parseList' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1819
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1820
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1821
# {
.annotate 'line', 1822
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1823
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1824
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1825
    unless_null __ARG_4, __label_4
.annotate 'line', 1826
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1828
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 1829
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1830
    .return($P1)
# }
.annotate 'line', 1831

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 1836
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1837
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 1838
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 1839
    .return($P1)
# }
.annotate 'line', 1840

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_55')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1844
    new $P1, ['ResizableStringArray']
.annotate 'line', 1845
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1846
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1847
    .return($P1)
# }
.annotate 'line', 1848

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1861
    setattribute self, 'start', __ARG_1
.annotate 'line', 1862
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1863

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 1866
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1867
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1869
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 1870

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 1873
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1874
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1876
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 1877

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 1880
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 1881
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 1883
    .return("")
  __label_2: # endif
# }
.annotate 'line', 1884

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1887
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1888

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1891
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1892

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1895
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1896

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1899
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 1900

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1903
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1904

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1907
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1908

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1911
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1912

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1915
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1916

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1919
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1920

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 1856
    addattribute $P0, 'start'
.annotate 'line', 1857
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 1935
    $P2 = WSubId_35(__ARG_1, __ARG_2, WSubId_36, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 1936

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1940
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 1941

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1944
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1945
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1946

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 1950
    getattribute $P1, self, 'args'
    WSubId_37($P1)
# }
.annotate 'line', 1951

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1954
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1955
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1956
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1957
    .return($P1)
# }
.annotate 'line', 1958

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1961
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1962

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 1931
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1974
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1977
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1978
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1979
    .return($I1)
# }
.annotate 'line', 1980

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1983
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1984
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 1985
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1986
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1987

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1990
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1991
    if_null __ARG_2, __label_1
.annotate 'line', 1992
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1993

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1996
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1997
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1998
    .return(self)
# }
.annotate 'line', 1999

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 1971
    addattribute $P0, 'name'
.annotate 'line', 1972
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2004
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2005
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2006
    $P1 = __ARG_1.'get'()
.annotate 'line', 2007
# var args: $P2
    null $P2
.annotate 'line', 2008
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2009
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2011
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2012
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2013

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_38 = "WSubId_38"
# Body
# {
.annotate 'line', 2022
    $P2 = WSubId_35(__ARG_1, __ARG_2, WSubId_38, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2023

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2026
    getattribute $P1, self, 'list'
    WSubId_37($P1)
# }
.annotate 'line', 2027

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2028
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2031
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2032
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2033
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2035
    .return($P2)
# }
.annotate 'line', 2036

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2018
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_57')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2045
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 2046
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 2047

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_109')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2051
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 2052
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2054
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 2055
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 2057

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2061
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2063
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2065
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2067
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2064
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2066
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2068
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2070
    __ARG_2.'unget'($P1)
.annotate 'line', 2071
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2073

.end # parseUsing


.sub 'parseSig' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 2077
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2078
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2079
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2080
    WSubId_39("'='", $P2)
  __label_1: # endif
.annotate 'line', 2081
# var expr: $P3
    $P3 = WSubId_36(__ARG_2, __ARG_3)
.annotate 'line', 2082
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2083

.end # parseSig


.sub 'parseStatement' :subid('WSubId_94')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
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
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2087
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2088
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 2089
    new $P5, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 2090
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 2091
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 2092
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 2093
    new $P6, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 2094
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 2095
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2096
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.annotate 'line', 2097
    WSubId_40("':'", $P1)
  __label_5: # endif
.annotate 'line', 2098
    .tailcall WSubId_41($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2101
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
.annotate 'line', 2103
    .tailcall WSubId_42($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2105
    .tailcall WSubId_43($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2108
    .tailcall WSubId_44($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2111
    .tailcall WSubId_45($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 2113
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 2115
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 2117
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 2119
    new $P6, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 2121
    new $P8, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P8.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P7, $P8
    .return($P7)
  __label_17: # case
.annotate 'line', 2123
    new $P10, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P10.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P9, $P10
    .return($P9)
  __label_18: # case
.annotate 'line', 2125
    new $P12, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P12.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P11, $P12
    .return($P11)
  __label_19: # case
.annotate 'line', 2127
    new $P14, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P14.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P13, $P14
    .return($P13)
  __label_20: # case
.annotate 'line', 2129
    new $P16, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P16.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P15, $P16
    .return($P15)
  __label_21: # case
.annotate 'line', 2131
    new $P18, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P18.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P17, $P18
    .return($P17)
  __label_22: # case
.annotate 'line', 2133
    new $P20, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P20.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P19, $P20
    .return($P19)
  __label_23: # case
.annotate 'line', 2135
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2137
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2139
    new $P22, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P22.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P21, $P22
    .return($P21)
  __label_26: # case
.annotate 'line', 2141
    new $P24, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P24.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P23, $P24
    .return($P23)
  __label_7: # default
.annotate 'line', 2143
    $P25 = $P1.'isidentifier'()
    if_null $P25, __label_27
    unless $P25 goto __label_27
# {
.annotate 'line', 2144
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2145
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 2146
    new $P6, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 2147
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 2149
    __ARG_1.'unget'($P1)
.annotate 'line', 2150
    new $P5, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.annotate 'line', 2152
    WSubId_6('parseStatement failure', $P1)
# }
.annotate 'line', 2153

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2163
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2164

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2165
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2168
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2169

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2172
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2173

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2176
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2177

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2180
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2181

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2184
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2185

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2188
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2189

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2192
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2193

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2196
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2197

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2200
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2201

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2204
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2205

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2208
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2209

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2212
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2213

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2216
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2217

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2224
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2225

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2228
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2229

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2232
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2233

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2236
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2238
    .return(self)
# }
.annotate 'line', 2239

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2159
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2244
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2247
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2248

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2249
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2242
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2262
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2263
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2264
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2265
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2266
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2267
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2268
    null $I2
  __label_4: # endif
.annotate 'line', 2269
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2265
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2271
    unless $I2 goto __label_6
.annotate 'line', 2272
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2274
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2275

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2258
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2282
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2283
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2284

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2285
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2288
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2289
    .return(self)
# }
.annotate 'line', 2290

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 2293
    getattribute $P1, self, 'statements'
    WSubId_51(__ARG_1, $P1)
# }
.annotate 'line', 2294

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2278
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2299
    unless_null __ARG_1, __label_1
.annotate 'line', 2300
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2301
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2302
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2304
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2305

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 2313
# var arg: $P1
    null $P1
.annotate 'line', 2314
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2315
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2316
    $P2 = __ARG_1.'get'()
.annotate 'line', 2317
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2318
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2321
    __ARG_1.'unget'($P2)
.annotate 'line', 2322
    $P1 = WSubId_36(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2324
    .return($P1)
# }
.annotate 'line', 2325

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_52 = "WSubId_52"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2334
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2335
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2336
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2337
    unless $I1 goto __label_1
.annotate 'line', 2338
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2339
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2340
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2341
    $P1 = __ARG_2.'get'()
.annotate 'line', 2342
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2343
    __ARG_2.'unget'($P1)
.annotate 'line', 2344
    $P3 = WSubId_35(__ARG_2, __ARG_3, WSubId_52, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2346
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 2347

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 2350
    getattribute $P1, self, 'args'
    WSubId_37($P1)
.annotate 'line', 2351
    .return(self)
# }
.annotate 'line', 2352

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2355
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2356
    self.'annotate'(__ARG_1)
.annotate 'line', 2357
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2358
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2359
    __ARG_1.'print'('    ')
.annotate 'line', 2360
    unless_null $P1, __label_2
.annotate 'line', 2361
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2363
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2364
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2365
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2366
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2368

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2327
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2329
    addattribute $P0, 'opname'
.annotate 'line', 2330
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 2380
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2381
# var path: $P1
    $P1 = WSubId_54(__ARG_2)
.annotate 'line', 2382
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2383
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2384
    WSubId_53(';', __ARG_2)
.annotate 'line', 2385
    $P3 = WSubId_55($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2386
    .return(self)
# }
.annotate 'line', 2387

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2388
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2391
    self.'annotate'(__ARG_1)
.annotate 'line', 2392
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2393

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2375
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2377
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 2405
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2406
# var names: $P1
    null $P3
    $P1 = WSubId_35(__ARG_2, $P3, WSubId_56, ';')
.annotate 'line', 2407
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2408
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2409
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2411
    setattribute self, 'names', $P1
# }
.annotate 'line', 2412

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2415
    .return(self)
# }
.annotate 'line', 2416

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2419
    self.'annotate'(__ARG_1)
.annotate 'line', 2420
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2421
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2422
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2424

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2400
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2402
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2438
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2439
# var path: $P1
    $P1 = WSubId_54(__ARG_2)
.annotate 'line', 2440
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.annotate 'line', 2441
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2442
    WSubId_53(';', __ARG_2)
.annotate 'line', 2443
    setattribute self, 'path', $P1
# }
.annotate 'line', 2444

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2447
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2448
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2450
# var symbol: $P3
    $P3 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2452
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2466
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2453
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2454
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2455
    $P4.'pop'()
.annotate 'line', 2456
# var ns: $P5
    $P5 = self.'findns'($P4)
.annotate 'line', 2457
    if_null $P5, __label_6
# {
.annotate 'line', 2458
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2459
    if_null $P3, __label_7
# {
.annotate 'line', 2460
    self.'createvarused'($P2, $P3)
.annotate 'line', 2461
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
.annotate 'line', 2467
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2468
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2469
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2470
    self.'usesubid'($S1)
.annotate 'line', 2471
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2473
    self.'createvar'($P2, 'P')
.annotate 'line', 2474
    .return(self)
# }
.annotate 'line', 2475

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 2478
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2479
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2480
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2481
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2482
    self.'annotate'(__ARG_1)
.annotate 'line', 2483
# key: $S2
    null $S2
.annotate 'line', 2484
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2485
    $P1.'pop'()
.annotate 'line', 2486
    $P3 = WSubId_57($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2488
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2490

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2431
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2433
    addattribute $P0, 'path'
.annotate 'line', 2434
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_58')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2500
# var nskey: $P1
    $P1 = WSubId_54(__ARG_2)
.annotate 'line', 2501
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2502
    ge $I1, 1, __label_1
.annotate 'line', 2503
    WSubId_39('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2504
# var nssym: $P2
    $P2 = __ARG_3.'findns'($P1)
.annotate 'line', 2505
    unless_null $P2, __label_2
.annotate 'line', 2506
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2507
    __ARG_3.'usenamespace'($P2)
# }
.annotate 'line', 2508

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2514
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2515
    WSubId_58(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2516
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 2517

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2520
    .return(self)
# }
.annotate 'line', 2521

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2510
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 2536
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2537
    $P2 = WSubId_36(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2538
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 2539

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2542
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2543
    .return(self)
# }
.annotate 'line', 2544

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2547
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2548

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2531
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2533
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
.annotate 'line', 2565
    setattribute self, 'type', __ARG_1
.annotate 'line', 2566
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2567
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2568
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2569

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2572
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2573

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2574
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2575
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2576
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2577
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2578
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2579
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2580
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2557
    addattribute $P0, 'type'
.annotate 'line', 2558
    addattribute $P0, 'reg'
.annotate 'line', 2559
    addattribute $P0, 'scope'
.annotate 'line', 2560
    addattribute $P0, 'flags'
.annotate 'line', 2561
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2588
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2589

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2592
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2593

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2585
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
.annotate 'line', 2602
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2603

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2604
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2607
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2608
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2609
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2610

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2596
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2598
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2621
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2622

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2625
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2626
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2627
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2628
    if_null $P2, __label_2
.annotate 'line', 2629
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2630
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2631
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2632
    $P1[$S1] = $P3
.annotate 'line', 2633
    .return($P3)
# }
.annotate 'line', 2634

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2637
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2638
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2639
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2640
    if_null $P2, __label_2
.annotate 'line', 2641
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2642
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2643

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2646
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2647
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2648
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2649
    if_null $P2, __label_2
.annotate 'line', 2650
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2651
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2652

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2655
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2656
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2657
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2658
    if_null $P2, __label_2
.annotate 'line', 2659
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2660
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2661
    $P1[$S1] = $P3
.annotate 'line', 2662
    .return($P3)
# }
.annotate 'line', 2663

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2666
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2667
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2668

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2671
# var sym: $P1
    null $P1
.annotate 'line', 2672
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2673
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2674
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2676
    .return($P3)
# }
.annotate 'line', 2677

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2680
# var sym: $P1
    null $P1
.annotate 'line', 2681
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2682
    .return($P1)
  __label_1: # endif
.annotate 'line', 2683
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2684
    .return($P1)
  __label_2: # endif
.annotate 'line', 2685
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2686
    if_null $P2, __label_3
.annotate 'line', 2687
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2688
    .return($P3)
# }
.annotate 'line', 2689

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2692
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2693
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2694
    .return($S1)
# }
.annotate 'line', 2695

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2698
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2700
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2701
    .return('__WLEX_self')
# }
.annotate 'line', 2702

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2616
    addattribute $P0, 'locals'
.annotate 'line', 2617
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2711
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
.annotate 'line', 2723
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2724

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2725
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2726
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2727
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2728
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2729
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2730
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2731
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2732
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2733
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2736
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2737

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2741
    .return(self)
# }
.annotate 'line', 2742

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2743
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2746
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2747
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2748
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2749
    .return($S2)
# }
.annotate 'line', 2750

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2753
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 2754
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 2755
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 2756

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2759
# reg: $S1
    null $S1
.annotate 'line', 2760
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2761
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2763
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2764
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2766
    .return($S1)
# }
.annotate 'line', 2767

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 2770
    WSubId_59(self)
# }
.annotate 'line', 2771

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2719
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2776
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2774
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 2786
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2787
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2788
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2789
    WSubId_39('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2790
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2791

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2792
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2795
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2796
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2797
    .return(self)
# }
.annotate 'line', 2798

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2801
    self.'annotate'(__ARG_1)
.annotate 'line', 2802
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2803
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2804
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2805
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2806
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2808
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2810

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2781
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2783
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
.annotate 'line', 2825
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2826
    .return(self)
# }
.annotate 'line', 2827

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2830
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2831

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2834
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2835
    .return(self)
# }
.annotate 'line', 2836

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2839
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2840
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2841
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2843
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2844
    ne $I1, 0, __label_5
.annotate 'line', 2845
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2847
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2850
    .return(0)
# }
.annotate 'line', 2851

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
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
    $P1.'emit_if'(__ARG_1, __ARG_2)
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
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2867
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2870
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2873

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2876
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2878
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2879
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2880
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2882
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2883
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
.annotate 'line', 2886
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2889
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2892
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2895

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 2822
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2902
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2903
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 2900
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2913
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2914
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2915

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2916
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2917
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2920
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2921
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2922
    .return($S1)
# }
.annotate 'line', 2923

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2926
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2927
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2928
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 2929
# predefined unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 2930
    .return($S1)
# }
.annotate 'line', 2931

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2934
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2935
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2936

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2939
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2940

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 2908
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2910
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2951
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2952
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2953
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 2954
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2955

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2956
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2957
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2960
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 2961

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2964
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 2965
    .return($N1)
# }
.annotate 'line', 2966

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2969
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2970
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2971
    ne $I1, 0, __label_2
.annotate 'line', 2972
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2974
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2976

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2979
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2980

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 2945
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2947
    addattribute $P0, 'pos'
.annotate 'line', 2948
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2990
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2991
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2992

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2993
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2994
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2997
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 2998
    .return($N1)
# }
.annotate 'line', 2999

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3002
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3003
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3004
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3006

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 3009
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3010
    .tailcall WSubId_60($N1)
# }
.annotate 'line', 3011

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 2985
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2987
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3020
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3023
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3024
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3025

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3028
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3029
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3030
    .return(0)
  __label_1: # endif
.annotate 'line', 3031
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3032

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3035
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3036
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3037
    if_null $P2, __label_1
.annotate 'line', 3038
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3040
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3043
    .return('P')
  __label_4: # default
.annotate 'line', 3045
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3048

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3051
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3052
    .return($S1)
# }
.annotate 'line', 3053

.end # getName


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3056
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3057
    unless_null $P1, __label_1
.annotate 'line', 3058
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3059
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3060
# s: $S1
    null $S1
.annotate 'line', 3061
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3062
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3065
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3067
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3071
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3072
    .return($S1)
# }
.annotate 'line', 3073

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 3076
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3077
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3078
    getattribute $P2, self, 'name'
    WSubId_61($P2)
  __label_1: # endif
.annotate 'line', 3079
    .return($P1)
# }
.annotate 'line', 3080

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3083
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3084
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3085
    if_null $P2, __label_1
# {
.annotate 'line', 3086
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3087
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3088
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3089
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3090
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3091
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3098
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3099
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3100
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
.annotate 'line', 3104
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    push $P5, $P1
    $P4 = self.'findsymbol'($P5)
.annotate 'line', 3105
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3106
# id: $S1
    $P5 = $P4.'makesubid'()
    null $S1
    if_null $P5, __label_11
    set $S1, $P5
  __label_11:
.annotate 'line', 3107
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3108
    self.'usesubid'($S1)
.annotate 'line', 3109
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3112
    .return(self)
# }
.annotate 'line', 3113

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3116
# id: $S1
    null $S1
.annotate 'line', 3117
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3118
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3120
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3121
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3122
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $I1 = $P1.'getflags'()
  __label_3:
.annotate 'line', 3123
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3124
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3125
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3126
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3127
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3131
    .return($S1)
# }
.annotate 'line', 3132

.end # emit_getid


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
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
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


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3143
    self.'annotate'(__ARG_1)
.annotate 'line', 3144
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3145

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3148
    self.'annotate'(__ARG_1)
.annotate 'line', 3149
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3150
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3151
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3152
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3153
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3154
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3157
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3160
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3163
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3164
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3166
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3167
    ne $S3, 'v', __label_13
.annotate 'line', 3168
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3169
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3170
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3173
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3174
    self.'annotate'(__ARG_1)
.annotate 'line', 3175
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3176
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3178
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3181
    .return($S2)
# }
.annotate 'line', 3182

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3016
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3018
    addattribute $P0, 'name'
.annotate 'line', 3019
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3192
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3193
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3194

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3197
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3198

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3201
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3202
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3203
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3204
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3205
    .return($S2)
# }
.annotate 'line', 3206

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3209
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3210
    self.'annotate'(__ARG_1)
.annotate 'line', 3211
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3212
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3214

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3217
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3218
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3219
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3221
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3224
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3222
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3225
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3228
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3229
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3230
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3232
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3233
    self.'annotate'(__ARG_1)
.annotate 'line', 3234
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3238
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3239

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3242
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3243

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3187
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3189
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3252
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3253

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3248
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
.annotate 'line', 3264
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3265
    $P2 = WSubId_62(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3266

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3267
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3270
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3273
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3274
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3275
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3276
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3277
    __ARG_1.'say'()
# }
.annotate 'line', 3278

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3258
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3260
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3288
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3289
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3290

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3293
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3294

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3297
    self.'optimizearg'()
.annotate 'line', 3298
    .return(self)
# }
.annotate 'line', 3299

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3283
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3285
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
.annotate 'line', 3310
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3311
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3312
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3313

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3316
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3317
    .return(self)
# }
.annotate 'line', 3318

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3321
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3322

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3325
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3326
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3327

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3330
    self.'optimizearg'()
.annotate 'line', 3331
    .return(self)
# }
.annotate 'line', 3332

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3335
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3336

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3339
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3340

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3304
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3306
    addattribute $P0, 'lexpr'
.annotate 'line', 3307
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3349
    .return('I')
# }
.annotate 'line', 3350

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3353
    self.'optimizearg'()
.annotate 'line', 3354
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3355
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3356
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3357
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3358
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3359
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3361
    .return(self)
# }
.annotate 'line', 3362

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3345
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3371
    .return('I')
# }
.annotate 'line', 3372

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3367
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
.annotate 'line', 3380
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3381

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3384
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3385
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3386
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3387
    self.'annotate'(__ARG_1)
.annotate 'line', 3388
    __ARG_1.'print'('    delete ')
.annotate 'line', 3389
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3390
    __ARG_1.'say'()
.annotate 'line', 3391
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3392
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3395
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3396

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3376
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
.annotate 'line', 3403
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3404

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3407
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3408
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
.annotate 'line', 3409
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3410
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3411
    self.'annotate'(__ARG_1)
.annotate 'line', 3412
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3413
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3414
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3417
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3418

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3399
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
.annotate 'line', 3427
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3428

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3431
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3432

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3435
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3436
    .return(self)
# }
.annotate 'line', 3437

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 3440
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3441
    self.'optimizearg'()
.annotate 'line', 3442
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3443
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3444
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3447
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3448
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3449
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_63($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3452
    .return(self)
# }
.annotate 'line', 3453

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3456
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3457
    self.'annotate'(__ARG_1)
.annotate 'line', 3458
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3459

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3423
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
.annotate 'line', 3468
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3469

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3470
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3473
    .return('I')
# }
.annotate 'line', 3474

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3477
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3478
    .return(self)
# }
.annotate 'line', 3479

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3482
    self.'optimizearg'()
.annotate 'line', 3483
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3484
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3485
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3486
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3488
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3489
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3490
    .return(self)
# }
.annotate 'line', 3491

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3494
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3495

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3498
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3499
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3500
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3501
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3503
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3506
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3509
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3511

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3464
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3520
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3521

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3524
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3525
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3526
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3527

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3516
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

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
.annotate 'line', 3538
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3539

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3532
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
.annotate 'line', 3546
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3547

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3550
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3551
    self.'annotate'(__ARG_1)
.annotate 'line', 3552
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3553
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3554
    .return($S1)
# }
.annotate 'line', 3555

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3542
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
.annotate 'line', 3562
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3563

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3566
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3567
    self.'annotate'(__ARG_1)
.annotate 'line', 3568
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3569
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3570
    .return($S1)
# }
.annotate 'line', 3571

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3558
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
.annotate 'line', 3580
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3581

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3584
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3585
    self.'annotate'(__ARG_1)
.annotate 'line', 3586
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3587
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3588
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3589
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3590
    .return($S1)
# }
.annotate 'line', 3591

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3576
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
.annotate 'line', 3598
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3599

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3602
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3603
    self.'annotate'(__ARG_1)
.annotate 'line', 3604
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3605
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3606
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3607
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3608
    .return($S1)
# }
.annotate 'line', 3609

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3594
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
.annotate 'line', 3620
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3621
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3622
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3623
    .return(self)
# }
.annotate 'line', 3624

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3627
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3628

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3631
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3632
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3633
    .return(self)
# }
.annotate 'line', 3634

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3637
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3638

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_59 = "WSubId_59"
# Body
# {
.annotate 'line', 3641
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3642
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3643
    WSubId_59($P1)
  __label_1: # endif
# }
.annotate 'line', 3644

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3647
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3648
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3649
    self.'annotate'(__ARG_1)
.annotate 'line', 3650
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3652

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3614
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3616
    addattribute $P0, 'lexpr'
.annotate 'line', 3617
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3661
    self.'annotate'(__ARG_1)
.annotate 'line', 3662
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3663
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3664

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3657
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3673
    self.'annotate'(__ARG_1)
.annotate 'line', 3674
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3675
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3676
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3677

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3680
    self.'checkleft'()
.annotate 'line', 3681
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3682
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 3683
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 3684
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3685
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3686
    self.'annotate'(__ARG_1)
.annotate 'line', 3687
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3688
    .return($S1)
# }
.annotate 'line', 3689

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3669
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3698
    self.'checkleft'()
.annotate 'line', 3699
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3700
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3701
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3702
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3703
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3704
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3705
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3707
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3708
# aux: $S5
    null $S5
.annotate 'line', 3709
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3710
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3712
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3713
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3714
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3715
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3717
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3721
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3722
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3723
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3724
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3726
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3729
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3732
    .return($S3)
# }
.annotate 'line', 3733

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3694
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3742
    self.'checkleft'()
.annotate 'line', 3743
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3744
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3745
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3746
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3747
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3748
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3749
# aux: $S5
    null $S5
.annotate 'line', 3750
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3751
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3753
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3756
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3757
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3758
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3759
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3761
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3764
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3766
    .return($S3)
# }
.annotate 'line', 3767

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3738
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3776
    self.'checkleft'()
.annotate 'line', 3777
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3778
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3779
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3780
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3781
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3783
    ne $S2, 'I', __label_7
.annotate 'line', 3784
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3786
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3787
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3789
    self.'annotate'(__ARG_1)
.annotate 'line', 3790
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3793
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3794
    self.'annotate'(__ARG_1)
.annotate 'line', 3795
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3797
    .return($S3)
# }
.annotate 'line', 3798

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 3772
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3807
    self.'checkleft'()
.annotate 'line', 3808
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3809
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3810
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3811
    self.'annotate'(__ARG_1)
.annotate 'line', 3812
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3813
    .return($S2)
# }
.annotate 'line', 3814

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 3803
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3823
    self.'checkleft'()
.annotate 'line', 3824
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3825
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3826
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3827
    self.'annotate'(__ARG_1)
.annotate 'line', 3828
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3829
    .return($S2)
# }
.annotate 'line', 3830

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 3819
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3837
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3840
    self.'optimizearg'()
.annotate 'line', 3841
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3842
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3843
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3844
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3845
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3846
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3848
    .return(self)
# }
.annotate 'line', 3849

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3852
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3853
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3854
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3855
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3856
    self.'annotate'(__ARG_1)
.annotate 'line', 3857
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3859
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3864
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3869
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3874
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3879
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3884
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3860
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3861
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3862
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3865
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3866
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3867
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3870
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3871
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3872
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3875
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3876
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3877
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3880
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3881
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3882
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3885
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3886
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3887
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3888
# switch
.annotate 'line', 3891
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3893
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3896
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3899
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3900
# }
.annotate 'line', 3902

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3905
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3906

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3909
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3910

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3913
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3914

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 3835
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
.annotate 'line', 3929
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3930
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3931
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3932

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3933
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3934
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3937
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3938
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3939
    .return(self)
# }
.annotate 'line', 3940

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3943
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3944
    self.'annotate'(__ARG_1)
.annotate 'line', 3945
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3946
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3947
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3948

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3951
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3952
    self.'annotate'(__ARG_1)
.annotate 'line', 3953
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
.annotate 'line', 3954

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 3922
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3924
    addattribute $P0, 'expr'
.annotate 'line', 3925
    addattribute $P0, 'checknull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3961
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3964
    new $P1, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3965

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3968
    self.'optimizearg'()
.annotate 'line', 3969
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3970
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3971
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3972
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3973
    unless $I1 goto __label_1
# {
.annotate 'line', 3974
    unless $I2 goto __label_2
.annotate 'line', 3975
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3977
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3979
    unless $I2 goto __label_4
.annotate 'line', 3980
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 1)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 3981
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3982
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3983
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3984
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3985
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3987
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 3988
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 3989
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 3991
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 3992
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 3993
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
.annotate 'line', 3997
    .return(self)
# }
.annotate 'line', 3998

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4001
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4002

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4005
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4006

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4009
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4010

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4013
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4014

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 3959
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4021
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4024
    new $P1, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4025

.end # negated


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4028
    self.'optimizearg'()
.annotate 'line', 4029
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4030
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4031
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4032
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4033
    unless $I1 goto __label_1
# {
.annotate 'line', 4034
    unless $I2 goto __label_2
.annotate 'line', 4035
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall WSubId_21($P3, $P4, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 4037
    new $P6, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P7, self, 'rexpr'
    $P6.'NullCheckerExpr'(self, $P7, 0)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4039
    unless $I2 goto __label_4
.annotate 'line', 4040
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'lexpr'
    $P4.'NullCheckerExpr'(self, $P5, 0)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4041
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 4042
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 4043
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 4044
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4045
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4047
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4048
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4049
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    isne $I5, $I3, $I4
    .tailcall WSubId_21($P5, $P6, $I5)
  __label_13: # case
.annotate 'line', 4051
# ls: $S3
    getattribute $P8, $P1, 'strval'
    getattribute $P7, $P8, 'str'
    null $S3
    if_null $P7, __label_14
    set $S3, $P7
  __label_14:
.annotate 'line', 4052
# rs: $S4
    getattribute $P10, $P2, 'strval'
    getattribute $P9, $P10, 'str'
    null $S4
    if_null $P9, __label_15
    set $S4, $P9
  __label_15:
.annotate 'line', 4053
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
.annotate 'line', 4057
    .return(self)
# }
.annotate 'line', 4058

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4061
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4062

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4065
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4066

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4069
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4070

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4073
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4074

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
.annotate 'line', 4019
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
.annotate 'line', 4084
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 4085
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 4086

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4087
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4090
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4091
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
.annotate 'line', 4092

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4095
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
.annotate 'line', 4096

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4099
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4100
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4101
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4102

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4105
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4106

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4109
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4110
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4111
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4112

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4115
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4116
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4117
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4118

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4079
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 4081
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4125
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4128
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4129

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4132
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4133

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4136
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4137

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4140
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4141

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4144
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4145

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4123
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4152
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4155
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4156

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4159
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4160

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4163
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4164

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4167
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4168

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4171
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4172

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4150
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4179
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4182
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4183

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4186
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4187

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4190
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4191

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4194
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4195

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4198
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4199

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4177
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4206
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4209
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4210

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4213
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4214

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4217
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4218

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4221
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
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
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4226

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4204
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4235
    .return('I')
# }
.annotate 'line', 4236

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4231
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
.annotate 'line', 4245
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4246

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4249
    self.'optimizearg'()
.annotate 'line', 4250
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4251
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4252
    eq $I1, 0, __label_2
.annotate 'line', 4253
    getattribute $P1, self, 'rexpr'
    .return($P1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4255
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    .tailcall WSubId_21($P2, $P3, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4257
    .return(self)
# }
.annotate 'line', 4258

.end # optimize


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
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4263
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4264
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4265
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4268
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4269
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4270
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4271
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4272
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4274

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4241
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
.annotate 'line', 4283
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4284

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4287
    self.'optimizearg'()
.annotate 'line', 4288
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4289
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4290
    ne $I1, 0, __label_2
.annotate 'line', 4291
    getattribute $P1, self, 'rexpr'
    .return($P1)
    goto __label_3
  __label_2: # else
.annotate 'line', 4293
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'start'
    .tailcall WSubId_21($P2, $P3, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4295
    .return(self)
# }
.annotate 'line', 4296

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4299
# res: $S1
    null $S1
.annotate 'line', 4300
    if_null __ARG_2, __label_1
.annotate 'line', 4301
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4303
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4304
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4305
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4306
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4307
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4310
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4311
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4312
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4313
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4314
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4316

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4279
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4321
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
.annotate 'line', 4331
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4332

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4335
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
.annotate 'line', 4336
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4337
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4338
    self.'annotate'(__ARG_1)
.annotate 'line', 4339
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4340

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4343
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4344

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4327
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
.annotate 'line', 4353
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4354

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4357
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
.annotate 'line', 4358
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4359
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4360
    self.'annotate'(__ARG_1)
.annotate 'line', 4361
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4362

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4365
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4366

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4349
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
.annotate 'line', 4375
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4376

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4379
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
.annotate 'line', 4380
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4381
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4382
    self.'annotate'(__ARG_1)
.annotate 'line', 4383
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4384

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4387
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4388

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4371
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
.annotate 'line', 4398
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4400
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4407
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4401
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4402
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4403
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4405
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4408
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4409
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4412
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4414

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4415
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4418
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4419
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4420
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4421
# i: $I2
    null $I2
# for loop
.annotate 'line', 4422
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4423
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4422
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4424
    .return($P2)
# }
.annotate 'line', 4425

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4428
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4429
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4430
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
.annotate 'line', 4431
    self.'annotate'(__ARG_1)
.annotate 'line', 4432
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4433
# i: $I2
    set $I2, 2
  __label_6: # for condition
    ge $I2, $I1, __label_5
.annotate 'line', 4434
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_4: # for iteration
.annotate 'line', 4433
    inc $I2
    goto __label_6
  __label_5: # for end
# }
.annotate 'line', 4435

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4438
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4439
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4440
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4441
    self.'annotate'(__ARG_1)
.annotate 'line', 4442
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4443
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4444
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4443
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4445
    .return($S1)
# }
.annotate 'line', 4446

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4449
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4450
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4451
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4452
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4453
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4452
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4454

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4393
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4395
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4463
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4464

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4465
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4468
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4469
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4470
# rreg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4471
# rval: $S3
    null $S3
# switch
.annotate 'line', 4472
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'I'
    if $S4 == $S5 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 4474
    set $S3, $S2
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 4477
    $P3 = self.'tempreg'('I')
    set $S3, $P3
.annotate 'line', 4478
    __ARG_1.'emitset'($S3, $S2)
  __label_3: # switch end
.annotate 'line', 4480
    self.'annotate'(__ARG_1)
.annotate 'line', 4481
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S3)
# }
.annotate 'line', 4482

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4459
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
.annotate 'line', 4491
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4492

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_64 = "WSubId_64"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4495
    self.'optimizearg'()
.annotate 'line', 4496
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4497
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4498
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4499
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4500
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4501
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4506
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4507
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4508
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4510
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# predefined string
.annotate 'line', 4511
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
.annotate 'line', 4513
    new $P11, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P12, $P3, 'file'
    getattribute $P13, $P3, 'line'
# predefined string
.annotate 'line', 4514
    $P14 = $P3.'getasquoted'()
    set $S6, $P14
# predefined string
    $P15 = $P4.'getasquoted'()
    set $S7, $P15
    concat $S8, $S6, $S7
    $P11.'TokenQuoted'($P12, $P13, $S8)
    set $P5, $P11
  __label_7:
.annotate 'line', 4515
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4517
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4518
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4519
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4520
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4523
    $P6 = WSubId_64($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4524
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4525
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4526
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_63($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4530
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4531
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4533
    .return(self)
# }
.annotate 'line', 4534

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 4537
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4538
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4539
    ne $S1, $S2, __label_3
.annotate 'line', 4540
    .return($S1)
  __label_3: # endif
.annotate 'line', 4541
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4542
    .return('S')
  __label_4: # endif
.annotate 'line', 4543
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4544
    .return('S')
  __label_6: # endif
.annotate 'line', 4545
    $P1 = WSubId_64($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4546
    .return('N')
  __label_8: # endif
.annotate 'line', 4547
    .return('I')
# }
.annotate 'line', 4548

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4551
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4552
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4553
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4554
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4555
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4557
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4558
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4559
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4560
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4561
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4562
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4563
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4564
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4567
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4568
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4571
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4574
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4575
# l: $S7
    null $S7
.annotate 'line', 4576
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4578
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4579
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4581
# r: $S8
    null $S8
.annotate 'line', 4582
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4584
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4585
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4587
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4590
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4592

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4487
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
.annotate 'line', 4601
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4602

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4605
    self.'optimizearg'()
.annotate 'line', 4606
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4607
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4608
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4609
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4610
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4611
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4612
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4613
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4614
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4617
    .return(self)
# }
.annotate 'line', 4618

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4621
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4622
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4623
    ne $S1, $S2, __label_3
.annotate 'line', 4624
    .return($S1)
  __label_3: # endif
.annotate 'line', 4625
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4626
    .return('N')
  __label_4: # endif
.annotate 'line', 4627
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4628
    .return('N')
  __label_6: # endif
.annotate 'line', 4629
    .return('I')
# }
.annotate 'line', 4630

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4633
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4634
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4635
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4636

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4597
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
.annotate 'line', 4645
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4646

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_64 = "WSubId_64"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4649
    self.'optimizearg'()
.annotate 'line', 4650
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4651
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4652
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4653
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4654
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4655
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'I'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4656
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4657
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4658
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4661
    $P3 = WSubId_64($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4662
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 4663
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 4664
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_63($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4668
    ne $S1, 'S', __label_8
.annotate 'line', 4669
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 4670
    .return(self)
# }
.annotate 'line', 4671

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4674
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4675
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4676
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4677
    ne $S1, $S2, __label_3
.annotate 'line', 4678
    .return($S1)
  __label_3: # endif
.annotate 'line', 4679
    ne $S1, 'S', __label_4
.annotate 'line', 4680
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4682
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4683

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4686
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4687
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4688
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4689
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4690
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4691
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
.annotate 'line', 4692
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4693
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4694
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4695
    .return()
# }
  __label_3: # endif
.annotate 'line', 4700
    ne $S1, 'N', __label_7
# {
.annotate 'line', 4701
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4702
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4703
# rval: $S5
    null $S5
# switch
.annotate 'line', 4704
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 4706
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 4707
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4708
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 4711
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4714
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 4715
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 4717
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 4718
    self.'annotate'(__ARG_1)
.annotate 'line', 4719
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_12: # endif
.annotate 'line', 4721
    .return()
# }
  __label_7: # endif
.annotate 'line', 4724
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4725
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_15
    $I3 = $P1.'isidentifier'()
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 4726
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4727
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 4730
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4731
    set $S3, $I1
# }
  __label_14: # endif
.annotate 'line', 4733
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P2.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4734
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4735
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_17
  __label_16: # else
# {
# switch
.annotate 'line', 4738
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_21
    set $S7, 'N'
    if $S6 == $S7 goto __label_22
    set $S7, 'I'
    if $S6 == $S7 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4740
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4741
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4744
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_23: # case
  __label_20: # default
.annotate 'line', 4748
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4749
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
.annotate 'line', 4750
# }
  __label_17: # endif
.annotate 'line', 4753
    self.'annotate'(__ARG_1)
.annotate 'line', 4754
    set $S6, __ARG_2
    ne $S6, '', __label_24
.annotate 'line', 4755
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_24: # endif
.annotate 'line', 4756
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4757

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4641
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
.annotate 'line', 4766
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4767

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_64 = "WSubId_64"
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 4770
    self.'optimizearg'()
.annotate 'line', 4771
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4772
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4773
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4774
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4775
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4776
# var lval: $P3
    null $P3
.annotate 'line', 4777
# var rval: $P4
    null $P4
.annotate 'line', 4778
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4779
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 4780
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 4781
    eq $I2, 0, __label_7
.annotate 'line', 4782
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
.annotate 'line', 4785
    $P5 = WSubId_64($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4786
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 4787
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 4788
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4789
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
.annotate 'line', 4793
    .return(self)
# }
.annotate 'line', 4794

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4797
    .return('N')
# }
.annotate 'line', 4798

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4801
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4802
# var aux: $P2
    null $P2
.annotate 'line', 4803
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4804
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4805
    $P2 = self.'tempreg'('N')
.annotate 'line', 4806
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4807
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4809
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4810
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4811
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4812
    $P2 = self.'tempreg'('N')
.annotate 'line', 4813
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4814
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4816
    self.'annotate'(__ARG_1)
.annotate 'line', 4817
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4818

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 4762
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
.annotate 'line', 4827
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4828

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4831
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4832
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4833
    self.'annotate'(__ARG_1)
.annotate 'line', 4834
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4835

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4838
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4839

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 4823
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
.annotate 'line', 4848
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4849

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4852
    .return('I')
# }
.annotate 'line', 4853

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4856
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4857
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4858
    self.'annotate'(__ARG_1)
.annotate 'line', 4863
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4864

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 4844
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
.annotate 'line', 4873
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4874

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4877
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
.annotate 'line', 4878
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4879
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4880
    self.'annotate'(__ARG_1)
.annotate 'line', 4881
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4882

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4885
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4886

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 4869
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
.annotate 'line', 4895
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4896

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4899
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
.annotate 'line', 4900
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4901
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4902
    self.'annotate'(__ARG_1)
.annotate 'line', 4903
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4904

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4907
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4908

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 4891
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4917
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4918

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 4921
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4922
# setname: $S1
    set $S1, ''
.annotate 'line', 4923
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4924
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4926
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4929
    set $I2, 1
# switch
.annotate 'line', 4930
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
.annotate 'line', 4934
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4935
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 4936
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 4937
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4940
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4945
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4948
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4951
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4946
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4949
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4952
    __ARG_1.'print'(' :named')
.annotate 'line', 4953
    eq $S1, '', __label_17
.annotate 'line', 4954
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4955
# }
.annotate 'line', 4957

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 4913
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4966
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4967
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4968

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4971
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4972
    .return(self)
# }
.annotate 'line', 4973

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4976
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4977

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 4962
    addattribute $P0, 'arg'
.annotate 'line', 4963
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_65')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 4982
# var modifier: $P1
    null $P1
.annotate 'line', 4983
# var expr: $P2
    $P2 = WSubId_36(__ARG_1, __ARG_2)
.annotate 'line', 4984
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4985
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 4986
    $P3 = __ARG_1.'get'()
.annotate 'line', 4987
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 4988
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 4991
    WSubId_39('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4994
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4995
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 4996

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 5007
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5008
    setattribute self, 'start', __ARG_2
.annotate 'line', 5009
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5010
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5011
    __ARG_3.'unget'($P1)
.annotate 'line', 5012
    $P3 = WSubId_35(__ARG_3, __ARG_1, WSubId_65, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5014

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5017
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5018
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5019

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5022
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5023

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5026
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5027
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5028

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5031
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5032
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5033

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 5036
    getattribute $P1, self, 'args'
    WSubId_37($P1)
.annotate 'line', 5037
    .return(self)
# }
.annotate 'line', 5038

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5041
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5042
    unless_null $P1, __label_1
# {
.annotate 'line', 5043
    new $P2, ['ResizableStringArray']
.annotate 'line', 5044
# pnull: $S1
    set $S1, ''
.annotate 'line', 5045
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 5046
# var arg: $P4
    getattribute $P4, $P3, 'arg'
.annotate 'line', 5047
# reg: $S2
    null $S2
.annotate 'line', 5048
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5049
    ne $S1, '', __label_6
# {
.annotate 'line', 5050
    getattribute $P8, self, 'owner'
    $P7 = $P8.'tempreg'('P')
    set $S1, $P7
.annotate 'line', 5051
    __ARG_1.'emitnull'($S1)
# }
  __label_6: # endif
.annotate 'line', 5053
    set $S2, $S1
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5056
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
  __label_5: # endif
.annotate 'line', 5057
# predefined push
    push $P2, $S2
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5059
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5061
    .return($P1)
# }
.annotate 'line', 5062

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5065
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5066
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5068
# sep: $S1
    set $S1, ''
.annotate 'line', 5069
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5070
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5071
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5072
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5073
    if_null $P3, __label_4
.annotate 'line', 5074
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5075
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5070
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5077

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5000
    addattribute $P0, 'owner'
.annotate 'line', 5001
    addattribute $P0, 'start'
.annotate 'line', 5002
    addattribute $P0, 'args'
.annotate 'line', 5003
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_66')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5082
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5083
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5084
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5085
    .return(1)
# }
.annotate 'line', 5086

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5097
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5098
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5099
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5100

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5103
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5104

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5107
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5108
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5109
    new $P3, ['ResizableStringArray']
.annotate 'line', 5110
# var arg: $P4
    null $P4
.annotate 'line', 5111
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5112
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5114
    if_null $P2, __label_6
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5115
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5117
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5118
    ne $S1, '', __label_9
# {
.annotate 'line', 5119
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5120
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5122
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5124
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5128
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5129
    if_null $P2, __label_11
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5130
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5131
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 5132
    .return()
  __label_2: # default
.annotate 'line', 5134
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 5135
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5136
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 5137
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5138
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5139
# argr: $S5
    null $S5
.annotate 'line', 5140
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5141
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
.annotate 'line', 5145
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5146
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5149
    ne $S1, '', __label_24
# {
.annotate 'line', 5150
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5151
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5153
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5157
    iseq $I3, $S3, $S4
    if $I3 goto __label_28
    iseq $I3, $S4, '?'
  __label_28:
    if $I3 goto __label_27
.annotate 'line', 5158
    iseq $I3, $S4, 'p'
    unless $I3 goto __label_29
.annotate 'line', 5159
    iseq $I3, $S3, 'S'
    if $I3 goto __label_30
    iseq $I3, $S3, 'P'
  __label_30:
  __label_29:
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5160
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5162
# aux: $S6
    null $S6
.annotate 'line', 5163
    ne $S4, 'p', __label_31
.annotate 'line', 5164
    set $S4, 'P'
  __label_31: # endif
.annotate 'line', 5165
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5166
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
.annotate 'line', 5168
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
.annotate 'line', 5172
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5173
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_38 # break
  __label_39: # default
.annotate 'line', 5176
    $P4.'emit'(__ARG_1, $S5)
  __label_38: # switch end
    goto __label_32 # break
  __label_35: # case
  __label_36: # case
  __label_37: # case
.annotate 'line', 5182
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5183
    __ARG_1.'emitset'($S5, $S6)
    goto __label_32 # break
  __label_33: # default
.annotate 'line', 5186
    $P4.'emit'(__ARG_1, $S5)
  __label_32: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5190
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5135
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5193
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5194

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 5090
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5092
    addattribute $P0, 'predef'
.annotate 'line', 5093
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_67')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 5201
# callname: $S1
    $P6 = __ARG_3.'getname'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 5202
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5203
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_4.'numargs'()
  __label_2:
.annotate 'line', 5204
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
    goto __label_4
  __label_5:
    $P1 = __ARG_4.'getrawargs'()
  __label_4:
.annotate 'line', 5206
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5207
# nvariants: $I2
# predefined elements
    elements $I2, $P2
.annotate 'line', 5208
# var predef: $P3
    null $P3
.annotate 'line', 5209
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P4, $P8
# {
.annotate 'line', 5210
# pargs: $I3
    getattribute $P6, $P4, 'nparams'
    set $I3, $P6
.annotate 'line', 5211
    iseq $I4, $I3, $I1
    if $I4 goto __label_10
.annotate 'line', 5212
    iseq $I4, $I3, -1
  __label_10:
    if $I4 goto __label_9
.annotate 'line', 5213
    iseq $I4, $I3, -2
    unless $I4 goto __label_11
    iseq $I4, $I1, 1
  __label_11:
  __label_9:
    unless $I4 goto __label_8
.annotate 'line', 5214
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5216
    unless_null $P3, __label_12
.annotate 'line', 5217
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5220
    isa $I4, $P3, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
    unless $I4 goto __label_13
# {
.annotate 'line', 5221
    $P6 = WSubId_66($P1)
    if_null $P6, __label_14
    unless $P6 goto __label_14
# {
.annotate 'line', 5222
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5223
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    .tailcall $P5($P6, $P7, $P1)
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5227
    new $P7, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    $P7.'CallPredefExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P6, $P7
    .return($P6)
# }
.annotate 'line', 5228

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5237
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5238
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5239
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5240
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5241
    __ARG_1.'unget'($P1)
.annotate 'line', 5242
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5244

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5245
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 5248
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5249
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5250
    if_null $P2, __label_1
.annotate 'line', 5251
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5253
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5257
# var sym: $P3
    null $P3
.annotate 'line', 5258
# var subid: $P4
    null $P4
.annotate 'line', 5259
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5260
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5261
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5262
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5263
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5264
    isnull $I1, $P6
    if $I1 goto __label_7
    set $S1, $P6
    iseq $I1, $S1, ''
  __label_7:
    unless $I1 goto __label_6
# {
.annotate 'line', 5265
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5266
    $P1.'buildkey'($P7)
.annotate 'line', 5267
    $P3 = self.'findsymbol'($P7)
.annotate 'line', 5268
    if_null $P3, __label_8
# {
.annotate 'line', 5269
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_9
# {
.annotate 'line', 5270
    $P4 = $P3.'makesubid'()
.annotate 'line', 5271
    self.'usesubid'($P4)
# }
  __label_9: # endif
.annotate 'line', 5273
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_10
.annotate 'line', 5274
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_67($P9, $P10, $P3, $P2)
  __label_10: # endif
# }
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 5278
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5280
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_11
.annotate 'line', 5281
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_11: # endif
.annotate 'line', 5284
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_12
    unless $P9 goto __label_12
# {
.annotate 'line', 5285
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_13
# {
.annotate 'line', 5286
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    $P13 = $P1.'getName'()
    push $P11, $P13
    $P8 = self.'findsymbol'($P11)
.annotate 'line', 5287
    isnull $I1, $P8
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_15:
    unless $I1 goto __label_14
.annotate 'line', 5288
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_67($P9, $P10, $P8, $P2)
  __label_14: # endif
# }
  __label_13: # endif
# }
  __label_12: # endif
.annotate 'line', 5292
    setattribute self, 'funref', $P1
.annotate 'line', 5293
    setattribute self, 'args', $P2
.annotate 'line', 5294
    .return(self)
# }
.annotate 'line', 5295

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5298
    .return(1)
# }
.annotate 'line', 5299

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5302
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5303
# call: $S1
    null $S1
.annotate 'line', 5305
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5306
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5307
    ne $S1, '', __label_4
# {
.annotate 'line', 5308
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P1.'getName'()
    push $P3, $P5
    $P2 = self.'findsymbol'($P3)
# switch-case
.annotate 'line', 5310
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5313
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5316
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5311
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
.annotate 'line', 5314
    $P6 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5317
    WSubId_6("Builtin unexpeted here", self)
  __label_6: # default
.annotate 'line', 5319
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
.annotate 'line', 5324
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5325
    .return($S1)
# }
.annotate 'line', 5326

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5329
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5330
    if_null $P1, __label_1
.annotate 'line', 5331
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5332

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5335
    __ARG_1.'print'('(')
.annotate 'line', 5336
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5337
    if_null $P1, __label_1
.annotate 'line', 5338
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5339
    __ARG_1.'say'(')')
# }
.annotate 'line', 5340

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5343
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5344
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5346
    self.'annotate'(__ARG_1)
.annotate 'line', 5348
    __ARG_1.'print'('    ')
.annotate 'line', 5349
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5350
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5351
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5353
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5356
    __ARG_1.'print'($S1)
.annotate 'line', 5357
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5358

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5230
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5232
    addattribute $P0, 'funref'
.annotate 'line', 5233
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
.annotate 'line', 5372
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5373
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5374
    setattribute self, 'args', __ARG_3
.annotate 'line', 5375
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5376
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5377

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5380
    getattribute $P3, self, 'sym'
    if_null $P3, __label_1
# {
.annotate 'line', 5381
    getattribute $P4, self, 'subid'
    if_null $P4, __label_2
.annotate 'line', 5382
    getattribute $P5, self, 'subid'
    .return($P5)
  __label_2: # endif
.annotate 'line', 5383
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5384
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5385
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5387
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5388
    root_new $P3, ['parrot';'ResizablePMCArray']
    $P5 = $P2.'emit_left_get'(__ARG_1)
    push $P3, $P5
    box $P4, ".'"
    push $P3, $P4
.annotate 'line', 5389
    $P6 = $P2.'get_member'()
.annotate 'line', 5388
    push $P3, $P6
    box $P4, "'"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    .return($S1)
# }
.annotate 'line', 5390

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5366
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5368
    addattribute $P0, 'sym'
.annotate 'line', 5369
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5400
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5401
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5402
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5403

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5406
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5407
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5408
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5409
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5410
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5413
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5414
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5415
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5416

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5396
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
.annotate 'line', 5426
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5427
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5428

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5431
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5432
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5433
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5434
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5435
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5436
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5437
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5439
    .return($S2)
# }
.annotate 'line', 5440

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5421
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5423
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
.annotate 'line', 5449
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5450
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5451

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5452
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5455
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5456
    .return(self)
# }
.annotate 'line', 5457

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5460
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5461
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5462
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5464
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5465
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5466

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5469
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5470

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5473
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5474
    self.'annotate'(__ARG_1)
.annotate 'line', 5475
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5476

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5479
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5480
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5481
    .return($S1)
# }
.annotate 'line', 5482

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5485
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5486
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5487
    self.'annotate'(__ARG_1)
.annotate 'line', 5488
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5489

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5492
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5493

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5496
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5497
# value: $S2
    null $S2
.annotate 'line', 5498
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5500
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5501
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5502
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5504
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5507
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5508
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5510
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5511

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5514
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5515
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5516
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5517
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5519
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5520
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5521
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5523
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5525
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5526
    .return($S2)
# }
.annotate 'line', 5527

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5443
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5445
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
.annotate 'line', 5538
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5539
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5540

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5541
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5544
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5545
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5546
    .return(self)
# }
.annotate 'line', 5547

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 5550
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5551
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5552
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5553
    WSubId_39("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5554
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5555
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5556
    self.'annotate'(__ARG_1)
.annotate 'line', 5557
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5558
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5559
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5560

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 5563
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5564
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5565
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5566
    WSubId_39("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5567
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5568
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5569
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5570
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5572
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5574
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5575
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5576
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5580
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5581
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5582
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5585
    self.'annotate'(__ARG_1)
.annotate 'line', 5586
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5587
    .return($S3)
# }
.annotate 'line', 5588

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5533
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5535
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
.annotate 'line', 5602
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5603
    setattribute self, 'left', __ARG_4
.annotate 'line', 5604
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5605

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5608
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5609
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5611
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5612

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5615
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5616
    setattribute self, 'left', $P1
.annotate 'line', 5617
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5618
    $P2.'optimizeargs'()
.annotate 'line', 5622
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5623
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5624
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5625
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5626
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5627
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5628
# predefined substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5629
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5632
    .return(self)
# }
.annotate 'line', 5633

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5636
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5637
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5638
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5639
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5640
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5641
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5639
    setattribute self, 'regleft', $P3
.annotate 'line', 5642
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5643

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5646
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5647
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5648
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5649
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5650
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5651
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5652
    __ARG_1.'print'(']')
# }
.annotate 'line', 5653

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5656
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5657
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5658
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5659
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5660
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5661
    eq $I1, 1, __label_4
.annotate 'line', 5662
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5663
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5664
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5665
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5668
    self.'annotate'(__ARG_1)
.annotate 'line', 5669
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5670
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5671
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5673

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5676
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5677
    self.'annotate'(__ARG_1)
.annotate 'line', 5678
    __ARG_1.'print'('    ')
.annotate 'line', 5679
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5680
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5681

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5684
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5685
# rreg: $S1
    null $S1
.annotate 'line', 5686
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5687
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5688
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5691
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5692
    self.'annotate'(__ARG_1)
.annotate 'line', 5693
    __ARG_1.'print'('    ')
.annotate 'line', 5694
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5695
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5696
    .return($S1)
# }
.annotate 'line', 5697

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5593
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5595
    addattribute $P0, 'left'
.annotate 'line', 5596
    addattribute $P0, 'regleft'
.annotate 'line', 5597
    addattribute $P0, 'args'
.annotate 'line', 5598
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 5708
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5709
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5710
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5711
    __ARG_1.'unget'($P1)
.annotate 'line', 5712
    $P3 = WSubId_35(__ARG_1, __ARG_2, WSubId_36, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5714

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5715
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 5718
    getattribute $P1, self, 'values'
    WSubId_37($P1)
.annotate 'line', 5719
    .return(self)
# }
.annotate 'line', 5720

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5723
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5724
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5725
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5731
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5733

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5736
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5737
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5738
    .return($S1)
# }
.annotate 'line', 5739

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5742
    self.'annotate'(__ARG_1)
.annotate 'line', 5743
# itemreg: $S1
    null $S1
.annotate 'line', 5744
# it_p: $S2
    null $S2
.annotate 'line', 5745
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5746
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5747
    $P2 = self.'tempreg'('P')
    set $S2, $P2
# }
  __label_1: # endif
.annotate 'line', 5749
    getattribute $P2, self, 'values'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
# {
# switch
.annotate 'line', 5750
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
.annotate 'line', 5752
# aux: $S3
    $P5 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_9
    set $S3, $P5
  __label_9:
.annotate 'line', 5753
    eq __ARG_2, '', __label_10
# {
.annotate 'line', 5754
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5755
    set $S1, $S2
# }
  __label_10: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5759
    $P2 = $P1.'isnull'()
    if_null $P2, __label_11
    unless $P2 goto __label_11
# {
.annotate 'line', 5760
    eq __ARG_2, '', __label_13
# {
.annotate 'line', 5761
    $P4 = self.'tempreg'('P')
    set $S1, $P4
.annotate 'line', 5762
    __ARG_1.'emitnull'($S1)
# }
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 5766
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_12: # endif
  __label_4: # switch end
.annotate 'line', 5768
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5769
    self.'annotate'(__ARG_1)
.annotate 'line', 5770
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_14: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 5773

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5702
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5704
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 5785
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5786
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5787
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5788
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5789
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5790
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5791
# {
.annotate 'line', 5792
# var key: $P4
    $P4 = WSubId_36(__ARG_1, __ARG_2)
.annotate 'line', 5793
    WSubId_53(':', __ARG_1)
.annotate 'line', 5794
# var value: $P5
    $P5 = WSubId_36(__ARG_1, __ARG_2)
.annotate 'line', 5795
# predefined push
    push $P2, $P4
.annotate 'line', 5796
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5798
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5799
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 5800
    WSubId_39("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5802
    setattribute self, 'keys', $P2
.annotate 'line', 5803
    setattribute self, 'values', $P3
# }
.annotate 'line', 5804

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5805
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 5808
    getattribute $P1, self, 'keys'
    WSubId_37($P1)
.annotate 'line', 5809
    getattribute $P1, self, 'values'
    WSubId_37($P1)
.annotate 'line', 5810
    .return(self)
# }
.annotate 'line', 5811

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5814
    self.'annotate'(__ARG_1)
.annotate 'line', 5819
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5820
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5822
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5823
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5824
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5825
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5826
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5827
# item: $S1
    null $S1
.annotate 'line', 5828
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5829
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5830
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5831
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5834
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5836
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5837
# itemreg: $S3
    null $S3
.annotate 'line', 5838
# it_p: $S4
    null $S4
.annotate 'line', 5839
    set $S6, __ARG_2
    eq $S6, '', __label_8
.annotate 'line', 5840
    $P5 = self.'tempreg'('P')
    set $S4, $P5
  __label_8: # endif
.annotate 'line', 5841
# aux: $S5
    null $S5
# switch
.annotate 'line', 5842
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
.annotate 'line', 5844
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
.annotate 'line', 5845
    set $S8, __ARG_2
    eq $S8, '', __label_14
# {
.annotate 'line', 5846
    __ARG_1.'emitbox'($S4, $S5)
.annotate 'line', 5847
    set $S3, $S4
# }
  __label_14: # endif
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 5851
    $P5 = $P4.'isnull'()
    if_null $P5, __label_15
    unless $P5 goto __label_15
# {
.annotate 'line', 5852
    set $S6, __ARG_2
    eq $S6, '', __label_17
# {
.annotate 'line', 5853
    $P6 = self.'tempreg'('P')
    set $S3, $P6
.annotate 'line', 5854
    __ARG_1.'emitnull'($S3)
# }
  __label_17: # endif
# }
    goto __label_16
  __label_15: # else
.annotate 'line', 5858
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_16: # endif
  __label_9: # switch end
.annotate 'line', 5860
    set $S6, __ARG_2
    eq $S6, '', __label_18
.annotate 'line', 5861
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_18: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5825
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5863

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5866
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5867
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5868
    .return($S1)
# }
.annotate 'line', 5869

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 5778
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5780
    addattribute $P0, 'keys'
.annotate 'line', 5781
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5882
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5887
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5888

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5891
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5892
    if_null $P1, __label_1
.annotate 'line', 5893
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5894

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5897
    self.'optimize_initializer'()
.annotate 'line', 5898
    .return(self)
# }
.annotate 'line', 5899

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5902
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5903
    if_null $P1, __label_1
.annotate 'line', 5904
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5905
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5906
    if_null $P1, __label_2
.annotate 'line', 5907
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5908
    __ARG_1.'say'(")")
# }
.annotate 'line', 5909

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 5874
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5876
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
.annotate 'line', 5920
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5922
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 5923
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5924
    setattribute self, 'value', __ARG_4
.annotate 'line', 5925
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5927
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 5928
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5930
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5931

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5934
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5935
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5938
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5939
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5940
    $P1 = $P2.'getvalue'()
.annotate 'line', 5941
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.annotate 'line', 5942
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5943
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5946
    self.'optimize_initializer'()
.annotate 'line', 5947
    .return(self)
# }
.annotate 'line', 5948

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5951
    self.'annotate'(__ARG_1)
.annotate 'line', 5953
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5954
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5957
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5958
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
.annotate 'line', 5960
# reginit: $S1
    set $S1, ''
.annotate 'line', 5961
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5962
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5963
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
.annotate 'line', 5968
    ne $I2, 1, __label_13
# {
.annotate 'line', 5969
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5970
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5973
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5974
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5975
    concat $S1, ', ', $S1
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5979
    eq $I2, 1, __label_16
.annotate 'line', 5980
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_16: # endif
.annotate 'line', 5981
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5982
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5985
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5988
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5989
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5990
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.annotate 'line', 5991
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    WSubId_68($S5, $P8)
  __label_23: # endif
.annotate 'line', 5995
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5996
    le $I1, 1, __label_25
# {
.annotate 'line', 5997
    getattribute $P10, self, 'value'
    __ARG_1.'say'($S2, ".'", $P10, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 6001
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 6002
    unless_null $P4, __label_26
# {
.annotate 'line', 6004
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 6005
    if_null $P5, __label_28
# {
.annotate 'line', 6006
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 6009
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.annotate 'line', 6010
    WSubId_68('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 6011
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 6013
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 6017
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 6021
    WSubId_6('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 6023
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 6024
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6025
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 6026
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 6028

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6031
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6032

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 5914
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5916
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6043
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6044
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6045
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6046
    setattribute self, 'nskey', $P1
.annotate 'line', 6047
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6048
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6049
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6051
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6052

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6055
# reginit: $S1
    null $S1
.annotate 'line', 6056
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6057
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 6058
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6062
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6063
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6066
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_3: # switch end
.annotate 'line', 6068
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 6069
    __ARG_1.'print'('    ')
.annotate 'line', 6070
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 6071
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6072
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6073
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 6074
    if_null $S1, __label_8
.annotate 'line', 6075
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6076
    __ARG_1.'say'()
# }
.annotate 'line', 6077

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6037
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6039
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6088
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6089
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6090
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6091
    setattribute self, 'nskey', $P1
.annotate 'line', 6092
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6093
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6094
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6096
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6097

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6100
# reginit: $S1
    null $S1
.annotate 'line', 6101
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6103
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 6104
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 6105
    le $I1, 0, __label_4
.annotate 'line', 6106
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 6107
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6108
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 6109
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6110
    __ARG_1.'say'()
.annotate 'line', 6112
    lt $I1, 0, __label_5
# {
.annotate 'line', 6113
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6114
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6115
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 6117

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6082
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6084
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6124
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6127
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6131
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6134
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6129
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6130
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6129
    .return($P3)
  __label_4: # case
.annotate 'line', 6133
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6137
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6138
    __ARG_1.'unget'($P2)
.annotate 'line', 6139
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6141
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6146
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6148

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
.annotate 'line', 6159
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6160
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6161
    $P2 = WSubId_62(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6162

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6165
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6166
    .return(self)
# }
.annotate 'line', 6167

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6168
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6171
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6172
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6173
    eq $S1, 'P', __label_2
.annotate 'line', 6174
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6175
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6177
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
.annotate 'line', 6178
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6179
    self.'annotate'(__ARG_1)
.annotate 'line', 6180
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6181
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6182
    __ARG_1.'say'()
# }
.annotate 'line', 6183

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6152
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6154
    addattribute $P0, 'lexpr'
.annotate 'line', 6155
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
.annotate 'line', 6200
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6201
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6202
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6203
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6204
    .return(self)
# }
.annotate 'line', 6205

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6208
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6209
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6211
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6213
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6215
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6216
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6217
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6219

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6222
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6223
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6224
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6226
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6227

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6230
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6231
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6232
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6233
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6234
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 6235
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 6236
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6238
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6239
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6240
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6241
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6242
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 6243
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6245
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 6246
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6247
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 6248
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 6251
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6253
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6254

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6188
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6194
    addattribute $P0, 'condition'
.annotate 'line', 6195
    addattribute $P0, 'etrue'
.annotate 'line', 6196
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

.sub 'getOpCode_2' :subid('WSubId_71')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6298
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
.annotate 'line', 6299
    .return(1)
  __label_4: # case
.annotate 'line', 6300
    .return(2)
  __label_5: # case
.annotate 'line', 6301
    .return(3)
  __label_2: # default
.annotate 'line', 6302
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6304

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_73')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6308
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
.annotate 'line', 6309
    .return(8)
  __label_4: # case
.annotate 'line', 6310
    .return(11)
  __label_5: # case
.annotate 'line', 6311
    .return(9)
  __label_6: # case
.annotate 'line', 6312
    .return(10)
  __label_2: # default
.annotate 'line', 6314
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6315
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6316
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6318

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_76')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6322
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
.annotate 'line', 6323
    .return(19)
  __label_4: # case
.annotate 'line', 6324
    .return(20)
  __label_5: # case
.annotate 'line', 6325
    .return(21)
  __label_6: # case
.annotate 'line', 6326
    .return(22)
  __label_2: # default
.annotate 'line', 6327
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6329

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_79')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6333
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6334
    .return(28)
  __label_4: # case
.annotate 'line', 6335
    .return(29)
  __label_2: # default
.annotate 'line', 6336
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6338

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_81')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6342
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
.annotate 'line', 6343
    .return(14)
  __label_4: # case
.annotate 'line', 6344
    .return(16)
  __label_5: # case
.annotate 'line', 6345
    .return(15)
  __label_6: # case
.annotate 'line', 6346
    .return(17)
  __label_2: # default
.annotate 'line', 6348
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6349
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6351

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_83')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6355
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
.annotate 'line', 6356
    .return(12)
  __label_4: # case
.annotate 'line', 6357
    .return(13)
  __label_5: # case
.annotate 'line', 6358
    .return(25)
  __label_6: # case
.annotate 'line', 6359
    .return(26)
  __label_2: # default
.annotate 'line', 6360
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6362

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_92')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6366
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
.annotate 'line', 6367
    .return(4)
  __label_4: # case
.annotate 'line', 6368
    .return(5)
  __label_5: # case
.annotate 'line', 6369
    .return(6)
  __label_6: # case
.annotate 'line', 6370
    .return(18)
  __label_7: # case
.annotate 'line', 6371
    .return(23)
  __label_8: # case
.annotate 'line', 6372
    .return(24)
  __label_9: # case
.annotate 'line', 6373
    .return(30)
  __label_2: # default
.annotate 'line', 6374
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6376

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_70')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_69 = "WSubId_69"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 6380
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6381
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6384
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6388
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6390
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6392
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6394
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6396
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6398
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6400
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6402
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6404
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6385
    $P2 = WSubId_36(__ARG_1, __ARG_2)
.annotate 'line', 6386
    WSubId_53(')', __ARG_1)
.annotate 'line', 6387
    .return($P2)
  __label_4: # case
.annotate 'line', 6389
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6391
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6393
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6395
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6397
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6399
    .tailcall WSubId_69(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6401
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6403
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6405
    new $P17, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P17.'IdentifierExpr'(__ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_2: # default
.annotate 'line', 6407
    WSubId_39('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6409

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_72')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_70 = "WSubId_70"
.const 'Sub' WSubId_71 = "WSubId_71"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6413
# var subexp: $P1
    $P1 = WSubId_70(__ARG_1, __ARG_2)
.annotate 'line', 6414
# var t: $P2
    null $P2
.annotate 'line', 6415
# var start: $P3
    null $P3
.annotate 'line', 6416
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6417
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_71($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6418
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6420
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6423
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6426
    set $P3, $P2
.annotate 'line', 6427
    $P2 = __ARG_1.'get'()
.annotate 'line', 6428
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6429
# var right: $P4
    $P4 = WSubId_70(__ARG_1, __ARG_2)
.annotate 'line', 6430
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6433
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6436
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6439
    __ARG_1.'unget'($P2)
.annotate 'line', 6440
    .return($P1)
# }
.annotate 'line', 6441

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_75')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_72 = "WSubId_72"
# Body
# {
.annotate 'line', 6445
# var subexp: $P1
    $P1 = WSubId_72(__ARG_1, __ARG_2)
.annotate 'line', 6446
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6448
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6450
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6449
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6451
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6453
    __ARG_1.'unget'($P2)
.annotate 'line', 6454
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6456

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_75 = "WSubId_75"
# Body
# {
.annotate 'line', 6460
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6461
# code: $I1
    $P3 = WSubId_73($P1)
    set $I1, $P3
.annotate 'line', 6462
    eq $I1, 0, __label_1
# {
.annotate 'line', 6463
# var subexpr: $P2
    $P2 = WSubId_74(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6464
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
.annotate 'line', 6466
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6468
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6470
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6472
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6474
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6476
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6478
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6482
    __ARG_1.'unget'($P1)
.annotate 'line', 6483
    .tailcall WSubId_75(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6485

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_76 = "WSubId_76"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6489
# var lexpr: $P1
    $P1 = WSubId_74(__ARG_1, __ARG_2)
.annotate 'line', 6490
# var t: $P2
    null $P2
.annotate 'line', 6491
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6492
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_76($P2)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
.annotate 'line', 6493
# var rexpr: $P3
    $P3 = WSubId_74(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6494
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
.annotate 'line', 6496
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6499
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6502
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6505
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6508
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6511
    __ARG_1.'unget'($P2)
.annotate 'line', 6512
    .return($P1)
# }
.annotate 'line', 6513

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
# Body
# {
.annotate 'line', 6517
# var lexpr: $P1
    $P1 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6518
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6519
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6520
# var rexpr: $P3
    $P3 = WSubId_77(__ARG_1, __ARG_2)
.annotate 'line', 6521
# var expr: $P4
    null $P4
.annotate 'line', 6522
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6523
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6525
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6526
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6528
    __ARG_1.'unget'($P2)
.annotate 'line', 6529
    .return($P1)
# }
.annotate 'line', 6530

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_80')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_79 = "WSubId_79"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6534
# var lexpr: $P1
    $P1 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6535
# var rexpr: $P2
    null $P2
.annotate 'line', 6536
# var t: $P3
    null $P3
.annotate 'line', 6537
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6538
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_79($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6539
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6541
    $P2 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6542
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6545
    $P2 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6546
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6549
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6552
    __ARG_1.'unget'($P3)
.annotate 'line', 6553
    .return($P1)
# }
.annotate 'line', 6554

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_81 = "WSubId_81"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6558
# var lexpr: $P1
    $P1 = WSubId_80(__ARG_1, __ARG_2)
.annotate 'line', 6559
# var rexpr: $P2
    null $P2
.annotate 'line', 6560
# var t: $P3
    null $P3
.annotate 'line', 6561
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6562
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_81($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6563
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
.annotate 'line', 6565
    $P2 = WSubId_80(__ARG_1, __ARG_2)
.annotate 'line', 6566
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6569
    $P2 = WSubId_80(__ARG_1, __ARG_2)
.annotate 'line', 6570
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6573
    $P2 = WSubId_80(__ARG_1, __ARG_2)
.annotate 'line', 6574
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6577
    $P2 = WSubId_80(__ARG_1, __ARG_2)
.annotate 'line', 6578
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6581
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6584
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6587
    __ARG_1.'unget'($P3)
.annotate 'line', 6588
    .return($P1)
# }
.annotate 'line', 6589

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6593
# var lexpr: $P1
    $P1 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6594
# var rexpr: $P2
    null $P2
.annotate 'line', 6595
# var t: $P3
    null $P3
.annotate 'line', 6596
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6597
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_83($P3)
    set $I1, $P4
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6598
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
.annotate 'line', 6600
    $P2 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6601
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6604
    $P2 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6605
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotEqualExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6608
    $P2 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6609
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6612
    $P2 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6613
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6616
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6619
    __ARG_1.'unget'($P3)
.annotate 'line', 6620
    .return($P1)
# }
.annotate 'line', 6621

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_84 = "WSubId_84"
# Body
# {
.annotate 'line', 6625
# var lexpr: $P1
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6626
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6627
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6628
# var rexpr: $P3
    $P3 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6629
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6631
    __ARG_1.'unget'($P2)
.annotate 'line', 6632
    .return($P1)
# }
.annotate 'line', 6633

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_85 = "WSubId_85"
# Body
# {
.annotate 'line', 6637
# var lexpr: $P1
    $P1 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6638
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6639
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6640
# var rexpr: $P3
    $P3 = WSubId_85(__ARG_1, __ARG_2)
.annotate 'line', 6641
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
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

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
# Body
# {
.annotate 'line', 6649
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6650
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6651
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6652
# var rexpr: $P3
    $P3 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6653
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6655
    __ARG_1.'unget'($P2)
.annotate 'line', 6656
    .return($P1)
# }
.annotate 'line', 6657

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_87 = "WSubId_87"
# Body
# {
.annotate 'line', 6661
# var lexpr: $P1
    $P1 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6662
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6663
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6664
# var rexpr: $P3
    $P3 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6665
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6667
    __ARG_1.'unget'($P2)
.annotate 'line', 6668
    .return($P1)
# }
.annotate 'line', 6669

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
.const 'Sub' WSubId_87 = "WSubId_87"
# Body
# {
.annotate 'line', 6673
# var lexpr: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6674
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6675
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6676
# var rexpr: $P3
    $P3 = WSubId_87(__ARG_1, __ARG_2)
.annotate 'line', 6677
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6679
    __ARG_1.'unget'($P2)
.annotate 'line', 6680
    .return($P1)
# }
.annotate 'line', 6681

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
.const 'Sub' WSubId_90 = "WSubId_90"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 6685
# var econd: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6686
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6687
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6688
# var etrue: $P3
    $P3 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6689
    WSubId_53(':', __ARG_1)
.annotate 'line', 6690
# var efalse: $P4
    $P4 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6691
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6694
    __ARG_1.'unget'($P2)
.annotate 'line', 6695
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6697

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_90 = "WSubId_90"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6701
# var lexpr: $P1
    $P1 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6702
# var t: $P2
    null $P2
.annotate 'line', 6703
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6704
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_92($P2)
    set $I1, $P5
    eq $I1, 0, __label_1
# {
.annotate 'line', 6705
# var rexpr: $P3
    $P3 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6706
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6707
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
.annotate 'line', 6709
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6712
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6715
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6718
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6721
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6724
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6727
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6730
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6732
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6733
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6735
    __ARG_1.'unget'($P2)
.annotate 'line', 6736
    .return($P1)
# }
.annotate 'line', 6737

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
# Body
# {
.annotate 'line', 6741
    .tailcall WSubId_90(__ARG_1, __ARG_2)
# }
.annotate 'line', 6742

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6757
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 6758
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6759
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6760
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6761
    .return($S1)
# }
.annotate 'line', 6762

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6765
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6766
    unless_null $P1, __label_1
.annotate 'line', 6767
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6768
    .return($P1)
# }
.annotate 'line', 6769

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 6753
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6778
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 6779
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6780
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6781
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6782
    .return($S1)
# }
.annotate 'line', 6783

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6786
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6787
    unless_null $P1, __label_1
.annotate 'line', 6788
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6789
    .return($P1)
# }
.annotate 'line', 6790

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 6772
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6774
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6806
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6807
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6808
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6809
    __ARG_2.'unget'($P1)
.annotate 'line', 6810
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6812

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6815
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6816
    if_null $P1, __label_1
.annotate 'line', 6817
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6818
    .return(self)
# }
.annotate 'line', 6819

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6823
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6824
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6827
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6828
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6829
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6830
    self.'annotate'(__ARG_1)
.annotate 'line', 6831
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6835
    le $I1, 0, __label_6
.annotate 'line', 6836
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6838
    self.'annotate'(__ARG_1)
.annotate 'line', 6839
    self.'emitret'(__ARG_1)
.annotate 'line', 6840
    le $I1, 0, __label_7
.annotate 'line', 6841
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6842
    __ARG_1.'say'(')')
# }
.annotate 'line', 6843

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 6800
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6802
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6850
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6851

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6854
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6855

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 6846
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
.annotate 'line', 6862
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6863

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6866
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6867

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 6858
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6880
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6881
    setattribute self, 'name', __ARG_1
.annotate 'line', 6882
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6883

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6884
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6887
    self.'annotate'(__ARG_1)
.annotate 'line', 6888
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6889

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 6874
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6876
    addattribute $P0, 'name'
.annotate 'line', 6877
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6903
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6904
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6905

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6906
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6909
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6910
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6911
    .return($S2)
# }
.annotate 'line', 6912

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 6898
    addattribute $P0, 'owner'
.annotate 'line', 6899
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 6925
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6926
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6927
    WSubId_93($P1)
.annotate 'line', 6928
    setattribute self, 'label', $P1
.annotate 'line', 6929
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 6930

.end # GotoStatement


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
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6936
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6937
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6938

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 6919
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6921
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 6949
    $P1 = WSubId_36(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6950

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 6953
    WSubId_53('(', __ARG_1)
.annotate 'line', 6954
    $P1 = WSubId_36(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 6955
    WSubId_53(')', __ARG_1)
# }
.annotate 'line', 6956

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 6945
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
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 6969
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6970
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6971
    $P3 = WSubId_94(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6972
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6973
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6974
    $P4 = WSubId_94(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6976
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 6977
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6979

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6982
    self.'optimize_condition'()
.annotate 'line', 6983
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6984
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6985
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6987
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6989
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6991
    .return(self)
# }
.annotate 'line', 6992

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6995
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6996
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6997
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6998
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6999
# elselabel: $S1
    set $S1, ''
.annotate 'line', 7000
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7001
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7002
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7003
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7004
    self.'annotate'(__ARG_1)
.annotate 'line', 7005
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7006
    $P1.'emit'(__ARG_1)
.annotate 'line', 7008
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7009
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7010
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7011
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7013
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7014

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 6963
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6965
    addattribute $P0, 'truebranch'
.annotate 'line', 6966
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 7026
    $P2 = WSubId_94(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7027

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7030
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7031
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7033
    self.'annotate'(__ARG_1)
.annotate 'line', 7034
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7035
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7036
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7037
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7038

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7021
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7023
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7049
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7050
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7051
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7052

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7055
    self.'optimize_condition'()
.annotate 'line', 7056
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7057
    .return(self)
# }
.annotate 'line', 7058

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7061
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7063
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7066
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7069
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7070
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7072
    self.'annotate'(__ARG_1)
.annotate 'line', 7073
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7074
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7075
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7076
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7077
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7079

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7045
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
.const 'Sub' WSubId_95 = "WSubId_95"
# Body
# {
.annotate 'line', 7090
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7091
    self.'parsebody'(__ARG_2)
.annotate 'line', 7092
    WSubId_95('while', __ARG_2)
.annotate 'line', 7093
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7094

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7097
    self.'optimize_condition'()
.annotate 'line', 7098
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7099
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7100
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7101
    setattribute self, 'body', $P1
.annotate 'line', 7102
    .return(self)
# }
.annotate 'line', 7103

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7106
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7107
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7108
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7110
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7113
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7114
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7115
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7117
    self.'annotate'(__ARG_1)
.annotate 'line', 7118
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7120
    $P1.'emit'(__ARG_1)
.annotate 'line', 7121
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7122
    eq $I1, 2, __label_7
.annotate 'line', 7123
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7124
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7126

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7086
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
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7137
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7138
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 7139

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7140
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7143
    self.'annotate'(__ARG_1)
.annotate 'line', 7144
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7145
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7146

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7133
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7157
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7158
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 7159

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7160
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7163
    self.'annotate'(__ARG_1)
.annotate 'line', 7164
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7165
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7166

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7153
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7181
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7182
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7183
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7184
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7185

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 7188
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7189
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7190
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7191
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_36(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7192
    $P1 = __ARG_1.'get'()
.annotate 'line', 7193
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7194
    WSubId_39("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7195
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7196
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
.annotate 'line', 7197
    __ARG_1.'unget'($P1)
.annotate 'line', 7198
    $P3 = WSubId_94(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7200
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7201
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7204
    $P1 = __ARG_1.'get'()
.annotate 'line', 7205
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7206
    WSubId_39("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7207
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
.annotate 'line', 7208
    __ARG_1.'unget'($P1)
.annotate 'line', 7209
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_94(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7211
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7214
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7215
    WSubId_39("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7216

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7219
    getattribute $P2, self, 'case_value'
    WSubId_37($P2)
.annotate 'line', 7220
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7221
    WSubId_37($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7222
    getattribute $P2, self, 'default_st'
    WSubId_37($P2)
# }
.annotate 'line', 7223

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7173
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7175
    addattribute $P0, 'case_value'
.annotate 'line', 7176
    addattribute $P0, 'case_st'
.annotate 'line', 7177
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 7236
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7237
    $P3 = WSubId_36(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7238
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7239
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7240
    WSubId_39("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7241
    $P1 = __ARG_2.'get'()
.annotate 'line', 7242
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7243
    WSubId_39("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7244
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7245

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7248
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7249
    self.'optimize_cases'()
.annotate 'line', 7250
    .return(self)
# }
.annotate 'line', 7251

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 7255
# type: $S1
    set $S1, ''
.annotate 'line', 7256
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7257
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7258
    ne $S2, 'N', __label_4
.annotate 'line', 7259
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7260
    ne $S1, '', __label_5
.annotate 'line', 7261
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7262
    eq $S1, $S2, __label_7
.annotate 'line', 7263
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7266
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7267
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7271
    ne $S1, '', __label_8
.annotate 'line', 7272
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7274
    __ARG_1.'comment'('switch')
.annotate 'line', 7275
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7276
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7277
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7279
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7280
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7284
    self.'genbreaklabel'()
.annotate 'line', 7285
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7286
    new $P4, ['ResizableStringArray']
.annotate 'line', 7287
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7288
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7289
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7290
# predefined push
    push $P4, $S7
.annotate 'line', 7291
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7292
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7294
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7297
    self.'annotate'(__ARG_1)
.annotate 'line', 7298
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7299
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7300
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7301
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7302
    $P7 = $P6[$I2]
    WSubId_51(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7300
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7305
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7306
    getattribute $P7, self, 'default_st'
    WSubId_51(__ARG_1, $P7)
.annotate 'line', 7308
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7309

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7230
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7232
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7321
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7322
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7323

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7326
    self.'optimize_cases'()
.annotate 'line', 7327
    .return(self)
# }
.annotate 'line', 7328

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 7332
    self.'genbreaklabel'()
.annotate 'line', 7333
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7334
    new $P1, ['ResizableStringArray']
.annotate 'line', 7336
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7337
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7338
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7339
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7340
# predefined push
    push $P1, $S3
.annotate 'line', 7341
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7342
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7344
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7347
    self.'annotate'(__ARG_1)
.annotate 'line', 7348
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7349
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7350
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7351
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7352
    $P4 = $P3[$I2]
    WSubId_51(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7350
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7355
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7356
    getattribute $P4, self, 'default_st'
    WSubId_51(__ARG_1, $P4)
.annotate 'line', 7358
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7359

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7316
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 7366
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7367
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7368
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7369
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7370
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7371
    WSubId_39("'(' in switch", $P1)
# }
.annotate 'line', 7372

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 7385
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7386
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7387
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7388
    __ARG_2.'unget'($P1)
.annotate 'line', 7389
    $P3 = WSubId_94(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7391
    $P1 = __ARG_2.'get'()
.annotate 'line', 7392
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7393
    __ARG_2.'unget'($P1)
.annotate 'line', 7394
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7395
    WSubId_53(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7397
    $P1 = __ARG_2.'get'()
.annotate 'line', 7398
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7399
    __ARG_2.'unget'($P1)
.annotate 'line', 7400
    $P3 = WSubId_36(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7401
    WSubId_53(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7403
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7404

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7407
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7408
    if_null $P1, __label_1
.annotate 'line', 7409
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7410
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7411
    self.'optimize_condition'()
.annotate 'line', 7412
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7413
    if_null $P1, __label_4
.annotate 'line', 7414
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7416
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7419
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7420
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7421
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7422
    .return(self)
# }
.annotate 'line', 7423

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7426
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7427
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7428
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7429
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7430
    .return()
# }
  __label_1: # endif
.annotate 'line', 7432
    __ARG_1.'comment'('for loop')
.annotate 'line', 7433
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7434
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7435
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7436
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7437
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7439
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7440
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7441
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7443
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7444
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7445
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7446
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7447
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7449
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7450

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7378
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7380
    addattribute $P0, 'initializer'
.annotate 'line', 7381
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7465
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7466
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7467
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7468
# deftype: $S2
    $P1 = WSubId_96(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7469
    self.'createvar'($S1, $S2)
.annotate 'line', 7470
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7472
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7473
    $P2 = WSubId_36(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7474
    WSubId_53(')', __ARG_2)
.annotate 'line', 7475
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7476

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7479
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7483
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7484
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7485
    $P2 = $P1.'get_value'()
    set $S1, $P2
# predefined length
    length $I2, $S1
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7486
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7488
    setattribute self, 'container', $P1
.annotate 'line', 7489
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7490
    .return(self)
# }
.annotate 'line', 7491

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 7494
    self.'annotate'(__ARG_1)
.annotate 'line', 7495
# regcont: $S1
    null $S1
.annotate 'line', 7496
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7497
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7498
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7499
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7502
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7504
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7505
    unless_null $P1, __label_4
.annotate 'line', 7506
    getattribute $P2, self, 'varname'
    WSubId_61($P2)
  __label_4: # endif
.annotate 'line', 7508
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7509
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7510
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7511
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7512
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7513
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7514
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7515
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7516
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7517
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7518
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7519
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7520

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7457
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7459
    addattribute $P0, 'deftype'
.annotate 'line', 7460
    addattribute $P0, 'varname'
.annotate 'line', 7461
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 7527
    WSubId_53('(', __ARG_2)
.annotate 'line', 7528
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7529
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7530
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7531
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7533
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7534
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7535
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7536
    __ARG_2.'unget'($P3)
.annotate 'line', 7537
    __ARG_2.'unget'($P2)
.annotate 'line', 7538
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7540
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7541

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 7553
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7554
    $P2 = WSubId_36(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7555

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7558
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7559
    .return(self)
# }
.annotate 'line', 7560

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7563
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7564
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7565
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7566
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7568
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7571
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7574
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7576

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7547
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7549
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7588
    setattribute self, 'start', __ARG_1
.annotate 'line', 7589
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7590

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7593
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7594
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7595
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7596
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7597
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
.annotate 'line', 7600
    eq $I1, 1, __label_10
.annotate 'line', 7601
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7602
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7603
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7604
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7608
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7609
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7610
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7611
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7609
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7614
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7613
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7617
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7620

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7583
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7585
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 7632
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7633
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7634
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7635
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7637
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7639
    $P3 = WSubId_94(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7640
    $P1 = __ARG_2.'get'()
.annotate 'line', 7641
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7642
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7643
    $P1 = __ARG_2.'get'()
.annotate 'line', 7644
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7645
    WSubId_39("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7646
    $P1 = __ARG_2.'get'()
.annotate 'line', 7647
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7648
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7649
    setattribute self, 'exname', $P1
.annotate 'line', 7650
    self.'createvar'($S1, 'P')
.annotate 'line', 7651
    $P1 = __ARG_2.'get'()
.annotate 'line', 7652
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7653
    WSubId_39("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7655
    $P3 = WSubId_94(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7656

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7659
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7660
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7661
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7662
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7663
    .return(self)
# }
.annotate 'line', 7664

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7667
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7668
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7669
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7670
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7671
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7672
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7674
    self.'annotate'(__ARG_1)
.annotate 'line', 7675
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7677
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7678
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7680
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7681
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7683
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7684
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7685
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7686
    __ARG_1.'comment'('try: end')
.annotate 'line', 7687
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7689
    self.'annotate'(__ARG_1)
.annotate 'line', 7690
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7692
    __ARG_1.'comment'('catch')
.annotate 'line', 7693
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7694
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7695
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7696
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7697
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7699
    __ARG_1.'comment'('catch end')
.annotate 'line', 7700
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7701

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7623
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7625
    addattribute $P0, 'stry'
.annotate 'line', 7626
    addattribute $P0, 'modifiers'
.annotate 'line', 7627
    addattribute $P0, 'exname'
.annotate 'line', 7628
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
.annotate 'line', 7714
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7715
    setattribute self, 'name', __ARG_3
.annotate 'line', 7716
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7717
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7718

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 7708
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7710
    addattribute $P0, 'name'
.annotate 'line', 7711
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
.annotate 'line', 7733
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7734
    setattribute self, 'name', __ARG_3
.annotate 'line', 7735
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7736

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 7725
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7727
    addattribute $P0, 'name'
.annotate 'line', 7728
    addattribute $P0, 'basetype'
.annotate 'line', 7729
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_36 = "WSubId_36"
# Body
# {
.annotate 'line', 7747
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7748
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7749
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7750
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7751
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7753
    $P5 = WSubId_36(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7756
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7757

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7760
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7761
    if_null $P1, __label_1
.annotate 'line', 7762
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
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
    self.'annotate'(__ARG_1)
.annotate 'line', 7768
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7769
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7770
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7771
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7772
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7774
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7775
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7777
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7778
    ne $S4, $S3, __label_8
.annotate 'line', 7779
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7781
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 7783
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7786
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7787
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 7789
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 7791
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 7794
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 7795
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 7797
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 7798
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 7799
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7800
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7801
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7802
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 7805
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7809

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 7741
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7743
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
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_35 = "WSubId_35"
# Body
# {
.annotate 'line', 7824
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7825
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7826
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7827
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7828
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7829
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7831
    __ARG_6.'unget'($P2)
.annotate 'line', 7832
    $P4 = WSubId_36(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 7833
    WSubId_53(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7835
    $P2 = __ARG_6.'get'()
.annotate 'line', 7836
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7837
    $P2 = __ARG_6.'get'()
.annotate 'line', 7838
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 7839
    WSubId_39("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7840
    $P2 = __ARG_6.'get'()
.annotate 'line', 7841
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7842
    __ARG_6.'unget'($P2)
.annotate 'line', 7843
    $P4 = WSubId_35(__ARG_6, self, WSubId_36, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7847
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7848

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 7851
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7852
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 7853
    getattribute $P1, self, 'initarray'
    WSubId_37($P1)
.annotate 'line', 7854
    .return(self)
# }
.annotate 'line', 7855

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7858
    self.'annotate'(__ARG_1)
.annotate 'line', 7860
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7861
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7862
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7863
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7864
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7865
    if_null $P2, __label_1
# {
.annotate 'line', 7867
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7868
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7872
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7874
    if_null $P3, __label_4
# {
.annotate 'line', 7875
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7876
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7877
    unless_null $P2, __label_6
# {
.annotate 'line', 7878
    le $I1, 0, __label_7
# {
.annotate 'line', 7880
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7883
# i: $I2
    null $I2
.annotate 'line', 7884
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7885
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7886
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7887
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7890

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 7814
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7816
    addattribute $P0, 'size'
.annotate 'line', 7817
    addattribute $P0, 'initarray'
.annotate 'line', 7818
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 7897
# var next: $P1
    null $P1
.annotate 'line', 7898
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7899
# {
.annotate 'line', 7900
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 7901
    WSubId_93($P3)
.annotate 'line', 7902
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7903
# var item: $P5
    null $P5
.annotate 'line', 7904
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 7905
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7907
    __ARG_4.'unget'($P4)
.annotate 'line', 7908
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7910
    $P2 = WSubId_97($P2, $P5)
.annotate 'line', 7911
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7912
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 7913
    WSubId_4(';', $P1)
.annotate 'line', 7914
    .return($P2)
# }
.annotate 'line', 7915

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7923
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7924

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 7919
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
.annotate 'line', 7931
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7932

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 7927
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7938
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7939

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7943
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7944

.end # newIntArray


.sub 'parseInt' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_99 = "WSubId_99"
.const 'Sub' WSubId_100 = "WSubId_100"
# Body
# {
.annotate 'line', 7948
    .tailcall WSubId_98(WSubId_99, WSubId_100, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7949

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7957
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7958

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 7953
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
.annotate 'line', 7965
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7966

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 7961
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7972
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7973

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7977
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7978

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_102 = "WSubId_102"
# Body
# {
.annotate 'line', 7982
    .tailcall WSubId_98(WSubId_101, WSubId_102, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7983

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7991
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7992

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 7987
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
.annotate 'line', 7999
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 8000

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 7995
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8006
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8007

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8011
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8012

.end # newStringArray


.sub 'parseString' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_104 = "WSubId_104"
# Body
# {
.annotate 'line', 8016
    .tailcall WSubId_98(WSubId_103, WSubId_104, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8017

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
.annotate 'line', 8033
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8034
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8035
    setattribute self, 'name', __ARG_4
.annotate 'line', 8036
    setattribute self, 'value', __ARG_5
.annotate 'line', 8037
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8038

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8041
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8042
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8043
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8044
    $P1 = $P1.'optimize'()
.annotate 'line', 8045
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8046
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8049
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8050
    .return(self)
# }
.annotate 'line', 8051

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8054
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8055

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8058
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8059

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8023
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8025
    addattribute $P0, 'type'
.annotate 'line', 8026
    addattribute $P0, 'name'
.annotate 'line', 8027
    addattribute $P0, 'data'
.annotate 'line', 8028
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_97 = "WSubId_97"
# Body
# {
.annotate 'line', 8064
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8065
# type: $S1
    $P5 = WSubId_96($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8066
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8067
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8069
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8070
# {
.annotate 'line', 8071
    $P1 = __ARG_2.'get'()
.annotate 'line', 8072
# var name: $P3
    set $P3, $P1
.annotate 'line', 8073
    WSubId_53('=', __ARG_2)
.annotate 'line', 8074
# var value: $P4
    $P4 = WSubId_36(__ARG_2, __ARG_3)
.annotate 'line', 8076
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8075
    $P2 = WSubId_97($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8077
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8078
    .return($P2)
# }
.annotate 'line', 8079

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8090
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8091
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8092
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8093
    $P4 = WSubId_36(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8094
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8096
    WSubId_4(';', $P1)
# }
.annotate 'line', 8097

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8100
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8101
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8102
    .return(self)
# }
.annotate 'line', 8103

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8106
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8107

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8110
    self.'annotate'(__ARG_1)
.annotate 'line', 8111
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8112
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8113
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8114
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8115
    if_null $P1, __label_3
.annotate 'line', 8116
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8117
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8118
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8119
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
.annotate 'line', 8121
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8122
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8124
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8129
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8130
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8133
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8135
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8139
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8140

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8085
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8087
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 8147
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8148
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 8149

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8152
    self.'annotate'(__ARG_1)
.annotate 'line', 8153
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8154
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8155
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8156

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8143
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_36 = "WSubId_36"
.const 'Sub' WSubId_53 = "WSubId_53"
# Body
# {
.annotate 'line', 8165
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8166
    $P2 = WSubId_36(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8167
    WSubId_53(']', __ARG_2)
.annotate 'line', 8168
    WSubId_53(';', __ARG_2)
# }
.annotate 'line', 8169

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8172
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8173
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8174

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8177
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8178
    self.'annotate'(__ARG_1)
.annotate 'line', 8179
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8180
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8181
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8182

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8159
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8161
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_93 = "WSubId_93"
# Body
# {
.annotate 'line', 8187
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8188
    WSubId_93($P1)
.annotate 'line', 8189
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8190
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8191
    $P2 = __ARG_2.'get'()
.annotate 'line', 8192
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8193
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8195
    __ARG_2.'unget'($P2)
.annotate 'line', 8196
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
.annotate 'line', 8200
    __ARG_2.'unget'($P2)
.annotate 'line', 8201
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8203

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 8207
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8208
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8209
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8210
    .tailcall WSubId_45(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8211

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8224
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8225
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8226
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8227
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8228
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8229
    __ARG_2.'unget'($P1)
.annotate 'line', 8230
# var c: $P2
    $P2 = WSubId_94(__ARG_2, self)
.annotate 'line', 8231
    unless_null $P2, __label_3
.annotate 'line', 8232
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8233
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8235
    setattribute self, 'end', $P1
# }
.annotate 'line', 8236

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8239
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8240
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8241
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8242
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8243
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8244
    .return($S2)
# }
.annotate 'line', 8245

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8248
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8249
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8250
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8251
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8252
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8253
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8254
    $P1[$S1] = $S3
.annotate 'line', 8255
    .return($S3)
# }
.annotate 'line', 8256

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8257
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8260
    __ARG_1.'comment'('{')
.annotate 'line', 8261
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8262
    $P1.'emit'(__ARG_1)
.annotate 'line', 8263
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8265
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8266

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8217
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8219
    addattribute $P0, 'end'
.annotate 'line', 8220
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8281
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8283
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8284
    new $P1, ['ResizableStringArray']
.annotate 'line', 8285
    new $P2, ['ResizableStringArray']
.annotate 'line', 8286
    setattribute self, 'tempreg', $P1
.annotate 'line', 8287
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8288

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8291
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8292
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8293
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8294
    assign $P1, $I1
# predefined string
.annotate 'line', 8295
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8296

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8299
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8300
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8301
# reg: $S1
    null $S1
.annotate 'line', 8302
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8303
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8305
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8306
# predefined push
    push $P2, $S1
.annotate 'line', 8307
    .return($S1)
# }
.annotate 'line', 8308

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8311
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8312
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8313
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8314
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8315
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8316
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8314
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8318
    assign $P2, 0
# }
.annotate 'line', 8319

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8275
    addattribute $P0, 'type'
.annotate 'line', 8276
    addattribute $P0, 'nreg'
.annotate 'line', 8277
    addattribute $P0, 'tempreg'
.annotate 'line', 8278
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8330
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8331

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8334
# var named: $P1
    null $P1
.annotate 'line', 8335
# var slurpy: $P2
    null $P2
.annotate 'line', 8336
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8337
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8338
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8339
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8341
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8344
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8347
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8351
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8358
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8375
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8356
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8359
# setname: $S2
    null $S2
# switch
.annotate 'line', 8360
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8362
    concat $S2, "'", __ARG_3
    concat $S2, $S2, "'"
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8365
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8366
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8367
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8368
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8371
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8373
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8376
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8377
# }
.annotate 'line', 8379

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8326
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 8389
    setattribute self, 'func', __ARG_1
.annotate 'line', 8390
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8391
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_96($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8392
    eq $S1, '', __label_2
.annotate 'line', 8393
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8395
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8396
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8397
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8399
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8400
    $P1 = __ARG_2.'get'()
.annotate 'line', 8401
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8402
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8404
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8405

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_105 = "WSubId_105"
# Body
# {
.annotate 'line', 8408
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8409
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8410
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8411
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_105($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8412
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8413
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8414
    if_null $P3, __label_3
.annotate 'line', 8415
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8416
    __ARG_1.'say'('')
# }
.annotate 'line', 8417

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8384
    addattribute $P0, 'func'
.annotate 'line', 8385
    addattribute $P0, 'name'
.annotate 'line', 8386
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8422
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8423

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8434
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8435
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8436

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 8439
# var ns: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 8440
# var path: $P2
    $P2 = $P1.'getpath'()
.annotate 'line', 8441
# key: $S1
    null $S1
.annotate 'line', 8442
# predefined elements
    elements $I1, $P2
    le $I1, 0, __label_1
.annotate 'line', 8443
    $P3 = WSubId_57($P2)
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 8444
# reg: $S2
    $P3 = __ARG_2.'tempreg'('P')
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 8445
    getattribute $P3, self, 'name'
    __ARG_1.'emitget_hll_global'($S2, $P3, $S1)
.annotate 'line', 8446
    .return($S2)
# }
.annotate 'line', 8447

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8429
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8431
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8458
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8459

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8462
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8463
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8464
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8465
    le $I1, 0, __label_3
# {
.annotate 'line', 8466
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8467
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8468
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8469
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8470
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8471
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8467
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8473
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8476

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8454
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8499
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8500
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8501
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8502
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8503
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8504
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8505

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8507
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8511
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8512
    unless_null $P1, __label_1
.annotate 'line', 8513
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8514
    .return($P1)
# }
.annotate 'line', 8515

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8518
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8519
    unless_null $P1, __label_1
.annotate 'line', 8520
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8521
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8522

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8526
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8527
    .return($I1)
# }
.annotate 'line', 8528

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 8531
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8532
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8533
    __ARG_1.'unget'($P1)
.annotate 'line', 8534
    $P3 = WSubId_35(__ARG_1, self, WSubId_106, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8536

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8540
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8541
    unless_null $P1, __label_1
.annotate 'line', 8542
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8544
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8545

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8548
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8549
    unless_null $P1, __label_1
# {
.annotate 'line', 8551
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8554
    if_null $P1, __label_4
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8555
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8556
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8557
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8559

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8562
# var found: $P1
    null $P1
.annotate 'line', 8563
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8564
    $P1 = $P2.'findsymbol'(__ARG_1)
.annotate 'line', 8565
    if_null $P1, __label_3
.annotate 'line', 8566
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8568
    getattribute $P3, self, 'owner'
    .tailcall $P3.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8569

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8573
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 8574
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8575
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8576
    .return(self)
# }
.annotate 'line', 8577

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8581
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8582
    unless_null $P1, __label_1
.annotate 'line', 8583
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8584
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8585

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8588
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8589
    unless_null $P1, __label_1
.annotate 'line', 8590
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8591
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8592

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8597
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8598
# lexname: $S1
    null $S1
.annotate 'line', 8599
    if_null $P1, __label_1
.annotate 'line', 8600
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8602
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8603
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8604
# predefined string
    set $S3, $I1
    concat $S1, '__WLEX_', $S3
.annotate 'line', 8605
    self.'setlex'($S1, $S2)
.annotate 'line', 8606
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8608
    .return($S1)
# }
.annotate 'line', 8609

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8613
# var store: $P1
    null $P1
# switch
.annotate 'line', 8614
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
.annotate 'line', 8616
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8618
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8620
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8622
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8624
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8626
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8627
    .return($S1)
# }
.annotate 'line', 8628

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8631
# var store: $P1
    null $P1
# switch
.annotate 'line', 8632
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
.annotate 'line', 8634
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8636
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8638
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8640
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8642
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8644
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8645
    .return($S1)
# }
.annotate 'line', 8646

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8649
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
.annotate 'line', 8650
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8651

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8654
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8655
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8656

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8659
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8660

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8663
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8664

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 8668
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 8669
    __ARG_1.'say'()
.annotate 'line', 8670
    __ARG_1.'print'(".sub ")
.annotate 'line', 8671
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 8672
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8674
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8675
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 8676
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 8677
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 8678
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8679
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8680
    if_null $P2, __label_6
.annotate 'line', 8681
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8685
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 8686
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8687
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8688
    if_null $P3, __label_8
.annotate 'line', 8689
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8691
    ne $S1, 'main', __label_10
.annotate 'line', 8692
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8694
    __ARG_1.'say'()
.annotate 'line', 8697
    getattribute $P8, self, 'params'
    WSubId_51(__ARG_1, $P8)
.annotate 'line', 8699
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8700
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8701
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8702
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 8704
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 8705
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 8707
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 8708
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 8709
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 8710
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 8714
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 8716
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 8719
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8720
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 8721
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 8723
    __ARG_1.'comment'('Body')
.annotate 'line', 8724
    $P6.'emit'(__ARG_1)
.annotate 'line', 8725
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 8727
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8730
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 8731
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 8732

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8479
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8481
    addattribute $P0, 'name'
.annotate 'line', 8482
    addattribute $P0, 'subid'
.annotate 'line', 8483
    addattribute $P0, 'modifiers'
.annotate 'line', 8484
    addattribute $P0, 'params'
.annotate 'line', 8485
    addattribute $P0, 'body'
.annotate 'line', 8486
    addattribute $P0, 'regstI'
.annotate 'line', 8487
    addattribute $P0, 'regstN'
.annotate 'line', 8488
    addattribute $P0, 'regstS'
.annotate 'line', 8489
    addattribute $P0, 'regstP'
.annotate 'line', 8490
    addattribute $P0, 'nlabel'
.annotate 'line', 8491
    addattribute $P0, 'localfun'
.annotate 'line', 8492
    addattribute $P0, 'lexicals'
.annotate 'line', 8493
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8494
    addattribute $P0, 'usedsubids'
.annotate 'line', 8495
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8746
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8747
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8748
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8749
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8750

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8752
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8756
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 8757

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8761
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 8762

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8763
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 8767
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8768
    setattribute self, 'name', $P1
.annotate 'line', 8769
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8770
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 8771
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 8772
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 8774
    WSubId_4('(', $P2)
.annotate 'line', 8775
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8777
# var fullname: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
# predefined clone
    clone $P3, $P4
.annotate 'line', 8778
    $P4 = $P1.'getidentifier'()
# predefined push
    push $P3, $P4
.annotate 'line', 8779
# predefined join
    join $S1, '.', $P3
    WSubId_107(self, '__FUNCTION__', $S1)
.annotate 'line', 8781
    $P2 = __ARG_1.'get'()
.annotate 'line', 8782
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 8783
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 8784
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 8785
    .return(self)
# }
.annotate 'line', 8786

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 8739
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8741
    addattribute $P0, 'paramnum'
.annotate 'line', 8742
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
.annotate 'line', 8797
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8798
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8799
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8800
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8801
    setattribute self, 'name', $P1
.annotate 'line', 8802
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8803
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8804
    WSubId_4('{', $P2)
.annotate 'line', 8805
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 8806
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8807

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8808
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8809
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 8812
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 8813
    .return(1)
  __label_1: # endif
.annotate 'line', 8814
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 8815
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 8816
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8817
    .return(0)
# }
.annotate 'line', 8818

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8821
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8822

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8826
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8827

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8831
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8832

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8835
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 8836
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 8837
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 8839
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 8840
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 8841
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 8842
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 8843
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 8844
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 8845
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 8846
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 8847
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8848
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 8849
    eq $S3, 'P', __label_8
.annotate 'line', 8850
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 8851
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 8852
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 8853
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 8854
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 8857
    .return(__ARG_2)
# }
.annotate 'line', 8858

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8861
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8862
    unless_null $P1, __label_1
.annotate 'line', 8863
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8864
    unless_null $P1, __label_2
# {
.annotate 'line', 8867
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 8868
    unless_null $P1, __label_3
# {
.annotate 'line', 8870
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 8871
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8872
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 8873
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 8874
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8875
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 8876
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8880
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8882
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 8883
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 8884
    .return($P1)
# }
.annotate 'line', 8885

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 8793
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
.annotate 'line', 8896
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8897

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8898
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 8892
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_96 = "WSubId_96"
# Body
# {
.annotate 'line', 8912
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8913
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 8914
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 8915
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8916
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8917
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_96($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 8918
    set $P1, $P2
.annotate 'line', 8919
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8920
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8922
    setattribute self, 'name', $P1
.annotate 'line', 8923
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8924
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 8925
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8926
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 8928
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8929

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8932
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8933
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8934
    if_null $P1, __label_1
# {
.annotate 'line', 8935
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8936
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8938

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 8907
    addattribute $P0, 'name'
.annotate 'line', 8908
    addattribute $P0, 'modifiers'
.annotate 'line', 8909
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8943
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8944

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_108 = "WSubId_108"
# Body
# {
.annotate 'line', 8951
    $P2 = WSubId_35(__ARG_1, __ARG_2, WSubId_108, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 8952

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8955
    __ARG_1.'print'('(')
.annotate 'line', 8956
# sep: $S1
    set $S1, ''
.annotate 'line', 8957
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8958
    __ARG_1.'print'($S1)
.annotate 'line', 8959
    $P1.'emit'(__ARG_1)
.annotate 'line', 8960
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8962
    __ARG_1.'print'(')')
# }
.annotate 'line', 8963

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 8948
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
.annotate 'line', 8972
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8973
    setattribute self, 'params', __ARG_3
.annotate 'line', 8974
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 8975

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8978
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8979
    .return(self)
# }
.annotate 'line', 8980

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8983
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8984
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 8985
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 8986
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8987
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8988
    __ARG_1.'print'('    ')
.annotate 'line', 8989
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8990
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8991
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8992
    __ARG_1.'say'()
# }
.annotate 'line', 8993

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 8966
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8968
    addattribute $P0, 'params'
.annotate 'line', 8969
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
.annotate 'line', 9010
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9011

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9012
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9016
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9017

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9006
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9025
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9026
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9027

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9028
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9032
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9033
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9034

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9020
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9022
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9043
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9044
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9045
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9046
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9047
    WSubId_39('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9048
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 9049
    $P2 = __ARG_1.'get'()
.annotate 'line', 9050
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9051
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9053
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9057
    WSubId_40('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9059
# {
.annotate 'line', 9060
    $P2 = __ARG_1.'get'()
.annotate 'line', 9061
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9062
    WSubId_39('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9063
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9064
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9065
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9067
    setattribute self, 'key', $P1
# }
.annotate 'line', 9068

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9069
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 9072
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9073

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9077
    getattribute $P2, self, 'key'
    $P1 = WSubId_57($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9078

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9037
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9039
    addattribute $P0, 'key'
.annotate 'line', 9040
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9086
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9087
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 9088
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9089
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9090
    $P2 = __ARG_1.'get'()
.annotate 'line', 9091
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9093
    __ARG_1.'unget'($P2)
.annotate 'line', 9094
    setattribute self, 'key', $P1
# }
.annotate 'line', 9095

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9096
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9100
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9101
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9102

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9106
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 9107
    unless_null $P1, __label_1
# {
.annotate 'line', 9108
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9109
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_68($S2)
  __label_3: # endif
.annotate 'line', 9110
    getattribute $P3, self, 'key'
    $P2 = WSubId_57($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9112
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9113

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9081
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9083
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9118
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9119
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9120
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9121
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9122
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9123
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9124
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9125
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9126

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9138
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9139
    setattribute self, 'name', __ARG_2
.annotate 'line', 9140
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9141
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 9142
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9143

.end # ClassBase


.sub 'getclasskey' :method
.const 'Sub' WSubId_57 = "WSubId_57"
# Body
# {
.annotate 'line', 9146
    getattribute $P1, self, 'classns'
    .tailcall WSubId_57($P1)
# }
.annotate 'line', 9147

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9132
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9134
    addattribute $P0, 'name'
.annotate 'line', 9135
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 9160
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9161
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9162
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9163
    setattribute self, 'functions', $P1
.annotate 'line', 9164
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9165
    setattribute self, 'members', $P2
.annotate 'line', 9166
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9167
    setattribute self, 'constants', $P3
.annotate 'line', 9169
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 9170
    $P8 = $P4.'isop'(':')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 9171
    $P10 = WSubId_35(__ARG_4, self, WSubId_62)
    setattribute self, 'bases', $P10
.annotate 'line', 9172
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9174
    WSubId_4('{', $P4)
.annotate 'line', 9176
    getattribute $P8, self, 'classns'
# predefined join
    join $S1, '.', $P8
    WSubId_107(self, '__CLASS__', $S1)
# for loop
.annotate 'line', 9178
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P8 = $P4.'isop'('}')
    isfalse $I1, $P8
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9179
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
.annotate 'line', 9181
# var f: $P5
    new $P5, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 9182
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9185
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 9186
    $P10 = $P6.'isidentifier'()
    isfalse $I2, $P10
    unless $I2 goto __label_10
.annotate 'line', 9187
    WSubId_39("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 9188
# predefined push
    push $P2, $P6
.annotate 'line', 9189
    $P4 = __ARG_4.'get'()
.annotate 'line', 9190
    $P11 = $P4.'isop'(';')
    isfalse $I3, $P11
    unless $I3 goto __label_11
.annotate 'line', 9191
    WSubId_39("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9194
# var cst: $P7
    $P7 = WSubId_43($P4, __ARG_4, self)
.annotate 'line', 9195
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9198
    WSubId_40("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9178
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9201

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9204
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9205

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9208
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9209

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9212
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 9213

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9216
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 9217

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9220
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9221

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9224
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9225

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 9228
    getattribute $P1, self, 'constants'
    WSubId_37($P1)
.annotate 'line', 9229
    getattribute $P1, self, 'functions'
    WSubId_37($P1)
.annotate 'line', 9230
    .return(self)
# }
.annotate 'line', 9231

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 9234
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 9235
    $P4 = WSubId_109($P1)
    __ARG_1.'say'($P4)
.annotate 'line', 9236
    getattribute $P4, self, 'functions'
    WSubId_51(__ARG_1, $P4)
.annotate 'line', 9238
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9240
    $P4 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P4)
.annotate 'line', 9241
# n: $I1
    set $I1, 1
.annotate 'line', 9242
    getattribute $P4, self, 'bases'
    if_null $P4, __label_2
    iter $P5, $P4
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $P2, $P5
# {
.annotate 'line', 9243
    $P2.'annotate'(__ARG_1)
.annotate 'line', 9244
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9245
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9246
    getattribute $P4, self, 'parent'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 9247
    __ARG_1.'say'()
.annotate 'line', 9248
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9250
    getattribute $P4, self, 'members'
    if_null $P4, __label_4
    iter $P6, $P4
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P3, $P6
# {
.annotate 'line', 9251
    __ARG_1.'annotate'($P3)
.annotate 'line', 9252
    __ARG_1.'say'('    ', "addattribute $P0, '", $P3, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9255
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9256

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9150
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9152
    addattribute $P0, 'parent'
.annotate 'line', 9153
    addattribute $P0, 'bases'
.annotate 'line', 9154
    addattribute $P0, 'constants'
.annotate 'line', 9155
    addattribute $P0, 'functions'
.annotate 'line', 9156
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9263
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9264

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9267
    .return(self)
# }
.annotate 'line', 9268

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9259
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
.annotate 'line', 9276
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9277
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9278
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9279
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9280
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9281
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9279
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.annotate 'line', 9283
    WSubId_4(';', $P2)
.annotate 'line', 9284
    new $P4, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P4.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P4
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9287
    __ARG_2.'unget'($P2)
.annotate 'line', 9288
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P4.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P4
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9290

.end # parseClass


.sub 'open_include' :subid('WSubId_110')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9298
# var interp: $P1
# predefined getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9303
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9304
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9305
# var file: $P4
    null $P4
.annotate 'line', 9306
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9307
# filepath: $S2
    concat $S2, $S1, __ARG_1
.annotate 'line', 9308
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9309
# predefined open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9310
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 9311
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9308
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
.annotate 'line', 9316
    isnull $I1, $P4
    if $I1 goto __label_8
    $I1 = $P4.'is_closed'()
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 9317
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 9318
    $P4.'encoding'("utf8")
.annotate 'line', 9319
    .return($P4)
# }
.annotate 'line', 9320

.end # open_include


.sub 'include_parrot' :subid('WSubId_113')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_110 = "WSubId_110"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9324
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9325
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9326
    WSubId_39('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9327
    WSubId_53(';', __ARG_2)
.annotate 'line', 9329
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9330
# var file: $P2
    $P2 = WSubId_110($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9335
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
.annotate 'line', 9336
# predefined substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9337
# pos: $I1
    set $I1, 12
.annotate 'line', 9338
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9339
# predefined substr
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 9340
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9341
# pos2: $I2
    set $I2, $I1
  __label_12: # while
.annotate 'line', 9342
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 9343
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9344
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 9345
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 9347
# name: $S4
    sub $I4, $I2, $I1
# predefined substr
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 9348
# predefined substr
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 9349
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 9350
    set $I1, $I2
  __label_22: # while
.annotate 'line', 9351
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 9352
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 9353
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 9354
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 9356
# value: $S5
    sub $I4, $I2, $I1
# predefined substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 9358
# ivalue: $I3
    null $I3
.annotate 'line', 9359
# predefined substr
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
# predefined substr
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 9360
# predefined substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 9362
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 9363
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 9365
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 9364
    $P4 = WSubId_21(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9335
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 9369
    $P2.'close'()
# }
.annotate 'line', 9370

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 9376
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9377
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 9378
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9379
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9380
    WSubId_39('literal string', $P1)
  __label_2: # endif
.annotate 'line', 9381
    WSubId_53(';', __ARG_2)
.annotate 'line', 9383
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 9384
# var file: $P2
    $P2 = WSubId_110($S1, __ARG_1)
.annotate 'line', 9386
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 9387
    __ARG_3.'parse'($P3)
.annotate 'line', 9389
    $P2.'close'()
# }
.annotate 'line', 9390

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_54 = "WSubId_54"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_35 = "WSubId_35"
.const 'Sub' WSubId_56 = "WSubId_56"
.const 'Sub' WSubId_39 = "WSubId_39"
# Body
# {
.annotate 'line', 9396
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9397
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 9398
    WSubId_58(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9399
    WSubId_53(';', __ARG_2)
.annotate 'line', 9400
    .return()
# }
  __label_1: # endif
.annotate 'line', 9402
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
# {
.annotate 'line', 9403
    __ARG_2.'unget'($P1)
.annotate 'line', 9404
# var key: $P2
    $P2 = WSubId_54(__ARG_2)
.annotate 'line', 9405
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9406
    ge $I1, 1, __label_3
.annotate 'line', 9407
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 9408
    WSubId_53(';', __ARG_2)
.annotate 'line', 9409
    __ARG_3.'use'($P2)
.annotate 'line', 9410
    .return()
# }
  __label_2: # endif
.annotate 'line', 9412
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9414
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 9420
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9416
# reqlib: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 9417
    __ARG_3.'addlib'($S1)
.annotate 'line', 9418
    WSubId_53(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9421
    __ARG_2.'unget'($P1)
.annotate 'line', 9422
# var module: $P3
    $P3 = WSubId_54(__ARG_2)
.annotate 'line', 9423
    $P1 = __ARG_2.'get'()
.annotate 'line', 9424
    $P6 = $P1.'isop'(';')
    isfalse $I3, $P6
    unless $I3 goto __label_9
# {
.annotate 'line', 9425
    __ARG_2.'unget'($P1)
.annotate 'line', 9426
# var names: $P4
    null $P5
    $P4 = WSubId_35(__ARG_2, $P5, WSubId_56, ';')
.annotate 'line', 9427
    __ARG_3.'addextern'($P3, $P4)
# }
  __label_9: # endif
.annotate 'line', 9429
# reqmodule: $S2
# predefined join
    join $S3, '/', $P3
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9430
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9433
    WSubId_39('string literal or identifier', $P1)
  __label_4: # switch end
# }
.annotate 'line', 9435

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9445
    setattribute self, 'module', __ARG_1
.annotate 'line', 9446
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9447

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9452
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9460
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9461
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9462
    __ARG_1.'say'("']")
.annotate 'line', 9463
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9464
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9465
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9471

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9441
    addattribute $P0, 'module'
.annotate 'line', 9442
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_107 = "WSubId_107"
# Body
# {
.annotate 'line', 9490
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9491
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9492
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9493
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9494
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9495
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 9496
    getattribute $P1, self, 'nspath'
# predefined join
    join $S1, '.', $P1
    WSubId_107(self, '__NAMESPACE__', $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9499
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9500
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9501
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9502
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9503
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9505
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9506

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9509
# var ns: $P1
    null $P1
.annotate 'line', 9510
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9511
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9512
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9513
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9514
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9515

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9518
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9519

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9522
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9523
    .return()
  __label_1: # endif
.annotate 'line', 9524
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9525
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9526
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9527
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9528
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9529

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9532
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9533
    if_null $P1, __label_1
# {
.annotate 'line', 9534
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9535
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9538
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9539
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9540
    if_null $P2, __label_5
# {
.annotate 'line', 9541
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9542
    if_null $P1, __label_6
.annotate 'line', 9543
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9546

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9549
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9550
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9551
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9552
    .return($P2)
# }
.annotate 'line', 9553

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9556
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9557
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9558
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9559
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9560

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9564
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9565
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9566
    unless_null $P2, __label_1
.annotate 'line', 9567
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9569
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9570

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9574
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9575
# var cl: $P2
    null $P2
.annotate 'line', 9576
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9577
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9578
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9579
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9580
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9581
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9582
    .return($P5)
# }
.annotate 'line', 9583

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9588
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9589
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9591
    .return($P3)
  __label_4: # case
.annotate 'line', 9594
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9599
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9600
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9601
    if_null $P1, __label_5
# {
.annotate 'line', 9602
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9603
    if_null $P2, __label_6
.annotate 'line', 9604
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9607
    .return($P3)
# }
.annotate 'line', 9608

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9611
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9612
    if_null $P1, __label_1
.annotate 'line', 9613
    .return($P1)
  __label_1: # endif
.annotate 'line', 9614
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9615
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9616
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9617
    .return($P2)
# }
.annotate 'line', 9618

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9623
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9624
# name: $S1
    null $S1
.annotate 'line', 9625
# var sym: $P1
    null $P1
.annotate 'line', 9626
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9627
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9629
    .return($P3)
  __label_4: # case
.annotate 'line', 9631
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9633
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9634
    .return($P1)
  __label_5: # endif
.annotate 'line', 9635
    getattribute $P4, self, 'usednamespaces'
    if_null $P4, __label_7
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9636
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9637
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9643
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9644
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9645
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9646
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9647
    .return($P1)
  __label_9: # endif
.annotate 'line', 9648
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9649
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9650
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9651
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9653
    .return($P3)
# }
.annotate 'line', 9654

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9657
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9658
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9660
    .return($P2)
  __label_2: # default
.annotate 'line', 9662
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9663
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9664
    if_null $P1, __label_4
# {
.annotate 'line', 9665
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9666
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9668
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9671
    .return($P2)
# }
.annotate 'line', 9672

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9675
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9676
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9677
    .return($P1)
# }
.annotate 'line', 9678

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9681
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9682
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9683
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9684
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9685
    .return($P2)
# }
.annotate 'line', 9686

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9689
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9690

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9693
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9694
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9695

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9698
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9699
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9700
    $P1 = __ARG_2.'get'()
.annotate 'line', 9702
# var modifier: $P2
    null $P2
.annotate 'line', 9703
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9704
    new $P5, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9705
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.annotate 'line', 9708
    WSubId_4('{', $P1)
.annotate 'line', 9709
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9710
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9711

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_43 = "WSubId_43"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_53 = "WSubId_53"
.const 'Sub' WSubId_112 = "WSubId_112"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_39 = "WSubId_39"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 9714
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9715
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9716
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9717
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9718
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
.annotate 'line', 9720
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
    set $S2, '$include'
    if $S1 == $S2 goto __label_14
    set $S2, '$load'
    if $S1 == $S2 goto __label_15
    set $S2, '$loadlib'
    if $S1 == $S2 goto __label_16
    goto __label_6
  __label_7: # case
.annotate 'line', 9722
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9725
# var cst: $P5
    $P5 = WSubId_43($P4, __ARG_1, self)
.annotate 'line', 9726
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9729
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9730
# predefined push
    push $P2, $P6
.annotate 'line', 9731
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9734
    WSubId_111($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9737
# var t1: $P7
    $P7 = __ARG_1.'get'()
.annotate 'line', 9738
    $P10 = $P7.'iskeyword'('function')
    isfalse $I3, $P10
    unless $I3 goto __label_17
.annotate 'line', 9739
    WSubId_1('Unsupported extern', $P7)
  __label_17: # endif
.annotate 'line', 9740
    $P7 = __ARG_1.'get'()
.annotate 'line', 9741
    WSubId_93($P7)
.annotate 'line', 9742
    WSubId_53(';', __ARG_1)
.annotate 'line', 9743
# var fex: $P8
    new $P8, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P8.'FunctionExtern'($P7, self)
.annotate 'line', 9744
# predefined push
    push $P2, $P8
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9747
    WSubId_112($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9750
    WSubId_113($P4, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9753
    WSubId_114($P4, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 9756
    $P4 = __ARG_1.'get'()
.annotate 'line', 9757
    $P11 = $P4.'isstring'()
    isfalse $I4, $P11
    unless $I4 goto __label_18
.annotate 'line', 9758
    WSubId_39('string literal', $P4)
  __label_18: # endif
.annotate 'line', 9759
    WSubId_53(';', __ARG_1)
.annotate 'line', 9760
    new $P14, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P14.'StringLiteral'(self, $P4)
    set $P13, $P14
    $P12 = $P13.'getPirString'()
    self.'addload'($P12)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 9763
    $P4 = __ARG_1.'get'()
.annotate 'line', 9764
    $P15 = $P4.'isstring'()
    isfalse $I5, $P15
    unless $I5 goto __label_19
.annotate 'line', 9765
    WSubId_39('string literal', $P4)
  __label_19: # endif
.annotate 'line', 9766
    WSubId_53(';', __ARG_1)
.annotate 'line', 9767
    new $P18, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addlib'($P16)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9770
    WSubId_40("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9718
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9773
    $P9 = $P4.'iseof'()
    if_null $P9, __label_20
    unless $P9 goto __label_20
.annotate 'line', 9774
    self.'unclosed_ns'()
    goto __label_21
  __label_20: # else
.annotate 'line', 9776
    self.'close_ns'($P4)
  __label_21: # endif
# }
.annotate 'line', 9777

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_37 = "WSubId_37"
# Body
# {
.annotate 'line', 9780
    getattribute $P1, self, 'items'
    WSubId_37($P1)
# }
.annotate 'line', 9781

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
.const 'Sub' WSubId_51 = "WSubId_51"
# Body
# {
.annotate 'line', 9784
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9785
# s: $S1
    $P4 = WSubId_109($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9787
# activate: $I1
    set $I1, 1
.annotate 'line', 9789
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9790
    if_null $P2, __label_2
# {
.annotate 'line', 9791
    __ARG_1.'say'($S1)
.annotate 'line', 9792
    null $I1
.annotate 'line', 9793
    WSubId_51(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9796
    getattribute $P4, self, 'items'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P3, $P5
# {
.annotate 'line', 9797
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9798
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9799
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9801
    unless $I1 goto __label_8
# {
.annotate 'line', 9802
    __ARG_1.'say'($S1)
.annotate 'line', 9803
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9805
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9807

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9478
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9480
    addattribute $P0, 'nspath'
.annotate 'line', 9481
    addattribute $P0, 'externals'
.annotate 'line', 9482
    addattribute $P0, 'namespaces'
.annotate 'line', 9483
    addattribute $P0, 'classes'
.annotate 'line', 9484
    addattribute $P0, 'functions'
.annotate 'line', 9485
    addattribute $P0, 'items'
.annotate 'line', 9486
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
.annotate 'line', 9825
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9826
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9827
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9829
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9830
    setattribute self, 'start', __ARG_2
.annotate 'line', 9831
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9832
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9833
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9834
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9835
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9836
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9838

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9841
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9842

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9845
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9846

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9849
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9850

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9853
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9854

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9857
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9858

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9861
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9862
    unless_null $P1, __label_1
.annotate 'line', 9863
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9864
    .return($P1)
# }
.annotate 'line', 9865

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9870
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9871
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9872
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9873
    .return($P1)
# }
.annotate 'line', 9874

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9877
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9878
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9879
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9880
    .return($P1)
# }
.annotate 'line', 9881

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9884
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9885
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9886
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9887
    .return($P1)
# }
.annotate 'line', 9888

.end # findns


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9891
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 9892

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9899
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9900
    if_null $P1, __label_1
.annotate 'line', 9901
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9902
    self.'optimize_base'()
.annotate 'line', 9903
    .return(self)
# }
.annotate 'line', 9904

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9907
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9908
    if_null $P1, __label_1
.annotate 'line', 9909
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9911
    self.'emit_base'(__ARG_1)
.annotate 'line', 9913
    if_null $P1, __label_2
.annotate 'line', 9914
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9915

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 9814
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9816
    addattribute $P0, 'parent'
.annotate 'line', 9817
    addattribute $P0, 'start'
.annotate 'line', 9818
    addattribute $P0, 'name'
.annotate 'line', 9819
    addattribute $P0, 'modifier'
.annotate 'line', 9820
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9932
    new $P1, ['ResizableStringArray']
.annotate 'line', 9933
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9934
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9935
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9936
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9937

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9940
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9941
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9942

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9945
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9946
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9947

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9951
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9952
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9953

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9957
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9958
    unless_null $P1, __label_1
.annotate 'line', 9959
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9960
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9961

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9964
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9965
    unless_null $P1, __label_1
.annotate 'line', 9966
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9967
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9968

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9971
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9972

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9976
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9977

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9980
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9981

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9984
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9985

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9992
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9993

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9996
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9997

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10000
    self.'optimize_base'()
.annotate 'line', 10001
    .return(self)
# }
.annotate 'line', 10002

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10005
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10008
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10009
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10012
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
.annotate 'line', 10015
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10016
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10017
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10018
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10021
# somelib: $I1
    null $I1
.annotate 'line', 10022
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10023
    if_null $P3, __label_5
# {
.annotate 'line', 10024
    set $I1, 1
.annotate 'line', 10025
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10026
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10029
# someload: $I2
    null $I2
.annotate 'line', 10030
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10031
    if_null $P4, __label_8
# {
.annotate 'line', 10032
    set $I2, 1
.annotate 'line', 10033
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10034
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10035
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10036
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10038
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10039
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10041
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10042

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10045
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10046
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10047
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10048
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 10049
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 10050
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10052
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10053
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10055

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 9922
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9924
    addattribute $P0, 'unit'
.annotate 'line', 9925
    addattribute $P0, 'predefs_used'
.annotate 'line', 9926
    addattribute $P0, 'libs'
.annotate 'line', 9927
    addattribute $P0, 'loads'
.annotate 'line', 9928
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10067
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10068
    root_new $P2, ['parrot';'ResizablePMCArray']
    push $P2, __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10069

.end # Builtin


.sub 'getname' :method
# Body
# {
# predefined string
.annotate 'line', 10070
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10073
    getattribute $P1, self, 'variants'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10074

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10063
    addattribute $P0, 'name'
.annotate 'line', 10064
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
# Body
# {
.annotate 'line', 10084
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
# }
.annotate 'line', 10085

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10088
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10089
# name: $S1
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10090
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 10091
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 10093
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
# }
.annotate 'line', 10094

.end # add


.sub 'put' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10097
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10098
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10099
    getattribute $P3, __ARG_1, 'functions'
    $P4 = $P1[$S1]
# predefined push
    push $P3, $P4
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10100

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 10081
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_116 = "WSubId_116"
# Body
# {
.annotate 'line', 10110
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 10111
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10115
    WSubId_115($P1, 'false', 0)
.annotate 'line', 10116
    WSubId_115($P1, 'true', 1)
.annotate 'line', 10121
# predefined string
# predefined int
.annotate 'line', 10122
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
.annotate 'line', 10121
    WSubId_107($P1, '__STAGE__', $S1)
.annotate 'line', 10125
    WSubId_115($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10128
# var builtins_ns: $P2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 10130
# var builder: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 10131
    WSubId_116($P3)
.annotate 'line', 10132
    $P3.'put'($P2)
.annotate 'line', 10134
    $P1.'usenamespace'($P2)
.annotate 'line', 10136
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10137

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 10140
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10141

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10144
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10145
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10146

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10149
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10150

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10153
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10154
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10155
    __ARG_1.'say'('')
.annotate 'line', 10157
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10159
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10160

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10163
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10164
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10166
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10168
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10169

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10105
    addattribute $P0, 'rootns'
.annotate 'line', 10106
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
# Body
# {
.annotate 'line', 10178
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 1
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 10179
    .return($P1)
# }
.annotate 'line', 10180

.end # version


.sub 'version_string' :method
# Body
# {
# predefined string
.annotate 'line', 10183
    $P1 = self.'version'()
# predefined join
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
# }
.annotate 'line', 10184

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 10187
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10188
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10189
# var handleout: $P1
    null $P1
.annotate 'line', 10190
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10191
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10192
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10195
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10196
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10197
    if_null __ARG_4, __label_4
    unless __ARG_4 goto __label_4
.annotate 'line', 10198
    $P2.'disable_annotations'()
  __label_4: # endif
.annotate 'line', 10199
    __ARG_1.'emit'($P2)
.annotate 'line', 10200
    $P2.'close'()
.annotate 'line', 10201
    if_null __ARG_3, __label_5
.annotate 'line', 10202
    .return(__ARG_3)
    goto __label_6
  __label_5: # else
# {
.annotate 'line', 10204
    $P1.'close'()
.annotate 'line', 10205
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 10206
# var object: $P3
    null $P3
# switch
.annotate 'line', 10207
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_10
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_11
    set $S3, ''
    if $S2 == $S3 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 10209
    new $P3, [ 'String' ]
.annotate 'line', 10210
    assign $P3, $S1
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 10214
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 10215
    $P3 = $P4($S1)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 10216
# predefined string
.annotate 'line', 10218
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_8: # switch end
.annotate 'line', 10220
    .return($P3)
# }
  __label_6: # endif
# }
.annotate 'line', 10222

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10225
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10226
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10227
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10228
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10229
    $P2.'close'()
.annotate 'line', 10230
    $P1.'close'()
.annotate 'line', 10231
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10232

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10239
    unless_null __ARG_2, __label_1
.annotate 'line', 10240
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10241
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10242
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10243
    $P1.'puts'(__ARG_1)
.annotate 'line', 10244
    $P1.'close'()
.annotate 'line', 10245
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10246
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10247
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_5)
.annotate 'line', 10248
    $P3.'parse'($P2)
.annotate 'line', 10249
    $P1.'close'()
.annotate 'line', 10250
    $P3.'optimize'()
.annotate 'line', 10251
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10252
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10254
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_3: # endif
# }
.annotate 'line', 10255

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param pmc __ARG_3 :optional :named('output')
        .param int __ARG_4 :optional :named('noan')
        .param int __ARG_5 :optional :named('nowarn')
# Body
# {
.annotate 'line', 10263
    unless_null __ARG_2, __label_1
.annotate 'line', 10264
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10265
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10266
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10267
    $P1.'encoding'('utf8')
.annotate 'line', 10268
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10269
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_5)
.annotate 'line', 10270
    $P3.'parse'($P2)
.annotate 'line', 10271
    $P1.'close'()
.annotate 'line', 10272
    $P3.'optimize'()
.annotate 'line', 10273
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10274
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10276
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4)
  __label_3: # endif
# }
.annotate 'line', 10277

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10286
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10287
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10288

.end # initializer

# End generated code
