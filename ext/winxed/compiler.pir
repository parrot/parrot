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

.sub 'Warn' :subid('WSubId_72')
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
    concat $S4, ' near ', $S3
    set $S2, $S4
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


.sub 'NoLeftSide' :subid('WSubId_63')
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 130
    WSubId_1('Not a left-side expression', __ARG_1)
# }
.annotate 'line', 131

.end # NoLeftSide


.sub 'Expected' :subid('WSubId_44')
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


.sub 'Unexpected' :subid('WSubId_45')
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


.sub 'RequireIdentifier' :subid('WSubId_97')
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


.sub 'ExpectOp' :subid('WSubId_58')
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


.sub 'ExpectKeyword' :subid('WSubId_99')
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


.sub 'UndefinedVariable' :subid('WSubId_65')
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

.sub 'typetoregcheck' :subid('WSubId_100')
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


.sub 'typetopirname' :subid('WSubId_109')
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
# predefined join
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
# predefined join
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


.sub 'floatValue' :subid('WSubId_67')
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


.sub 'floatresult' :subid('WSubId_68')
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


.sub 'floatAsString' :subid('WSubId_64')
        .param num __ARG_1
# Body
# {
.annotate 'line', 1093
# aux: $S1
    null $S1
    set $S1, __ARG_1
.annotate 'line', 1095
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_1
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

.sub 'createPredefConstInt' :subid('WSubId_118')
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


.sub 'createPredefConstString' :subid('WSubId_111')
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

# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1148
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 1149
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 1150
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 1151
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S2, '    ', $S1
    set __ARG_2, $S2
.annotate 'line', 1152
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 1153
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 1154

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
.annotate 'line', 1157
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1159
    ne $S1, 'v', __label_2
# {
.annotate 'line', 1160
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_4, ''
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 1161
    WSubId_1('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 1164
    isnull $I1, __ARG_4
    if $I1 goto __label_7
    iseq $I1, __ARG_4, ''
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 1165
    WSubId_6('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 1168
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 1169
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_4, __ARG_5 :flat)
.annotate 'line', 1170
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1171
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 1172

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
.annotate 'line', 1134
    addattribute $P0, 'body'
.annotate 'line', 1135
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
.annotate 'line', 1193
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1194
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1195
    new $P3, [ 'Winxed'; 'Compiler'; 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1197
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1198
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1199
# n: $I1
    null $I1
.annotate 'line', 1200
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1201
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1202
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1204
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1207
    set $I1, -2
.annotate 'line', 1208
    if_null __ARG_5, __label_8
.annotate 'line', 1209
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    WSubId_6($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1212
    set $I1, 1
.annotate 'line', 1213
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1214
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1215
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1217
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1218
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1219
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1221
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1222
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1223
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1227
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1228

.end # PredefBase


.sub 'iscompileevaluable' :method
# Body
# {
.annotate 'line', 1231
    .return(0)
# }
.annotate 'line', 1232

.end # iscompileevaluable


.sub 'name' :method
# Body
# {
.annotate 'line', 1235
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1236
    .return($S1)
# }
.annotate 'line', 1237

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1240
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1241

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1242
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1245
# type: $S1
    null $S1
# switch
.annotate 'line', 1246
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
.annotate 'line', 1247
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1248
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1249
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1250
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1252
    WSubId_6('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1254
    .return($S1)
# }
.annotate 'line', 1255

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1258
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1259
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1260
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1261
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1262
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1263
    $P1(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1264

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
.annotate 'line', 1177
    addattribute $P0, 'name'
.annotate 'line', 1178
    addattribute $P0, 'body'
.annotate 'line', 1179
    addattribute $P0, 'typeresult'
.annotate 'line', 1180
    addattribute $P0, 'type0'
.annotate 'line', 1181
    addattribute $P0, 'type1'
.annotate 'line', 1182
    addattribute $P0, 'type2'
.annotate 'line', 1183
    addattribute $P0, 'type3'
.annotate 'line', 1184
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
.annotate 'line', 1276
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1277

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1267
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
.annotate 'line', 1290
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1291
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1292

.end # PredefFunctionEval


.sub 'iscompileevaluable' :method
# Body
# {
.annotate 'line', 1295
    .return(1)
# }
.annotate 'line', 1296

.end # iscompileevaluable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1280
    get_class $P1, [ 'Winxed'; 'Compiler'; 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1282
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1304
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1305

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
.annotate 'line', 1308
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1309
# predefined elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_2
.annotate 'line', 1310
    WSubId_6("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1311
# var rawarg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1312
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1314
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1315
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1316
    $P1.'emit'(__ARG_1, __ARG_4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1319
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1320
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1322
    ne $S3, 'null', __label_9
.annotate 'line', 1323
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_10
  __label_9: # else
.annotate 'line', 1325
    __ARG_1.'emitset'(__ARG_4, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1327

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
.annotate 'line', 1301
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
.annotate 'line', 1332
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1334
# s: $S1
    null $S1
# switch-case
.annotate 'line', 1336
    $I1 = $P1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1339
    $I1 = $P1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1342
    $I1 = $P1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1337
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I2, $P3
    set $S1, $I2
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1340
    $P4 = $P1.'getFloatValue'()
    set $S1, $P4
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1343
    .return($P1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 1346
    WSubId_6('wrong call to predefeval_stringcast', __ARG_2)
  __label_1: # switch end
.annotate 'line', 1349
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1350
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1351

.end # predefeval_stringcast


.sub 'predefeval_intcast' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 1355
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
# switch-case
.annotate 'line', 1358
    $I1 = $P1.'isintegerliteral'()
    if $I1 goto __label_3
.annotate 'line', 1360
    $I1 = $P1.'isfloatliteral'()
    if $I1 goto __label_4
.annotate 'line', 1362
    $I1 = $P1.'isstringliteral'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1359
    .return($P1)
  __label_4: # case
.annotate 'line', 1361
# predefined int
    $P2 = $P1.'getFloatValue'()
    set $I2, $P2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
  __label_5: # case
.annotate 'line', 1363
# predefined int
    $P3 = $P1.'get_value'()
    set $I3, $P3
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I3)
  __label_2: # default
.annotate 'line', 1365
    WSubId_6('wrong call to predefeval_intcast', __ARG_2)
  __label_1: # switch end
# }
.annotate 'line', 1367

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
.annotate 'line', 1371
# predefined elements
    elements $I1, __ARG_5
    eq $I1, 1, __label_1
.annotate 'line', 1372
    WSubId_6("Invalid var cast")
  __label_1: # endif
.annotate 'line', 1373
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1374
# argtype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 1375
    ne $S1, 'P', __label_3
# {
.annotate 'line', 1376
# name: $S2
    null $S2
.annotate 'line', 1377
# var sym: $P2
    null $P2
# switch-case
.annotate 'line', 1379
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    if $I1 goto __label_7
.annotate 'line', 1395
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 1380
    $P7 = $P1.'getName'()
    set $S2, $P7
.annotate 'line', 1381
# id: $S3
    $P8 = $P1.'checkIdentifier'()
    null $S3
    if_null $P8, __label_9
    set $S3, $P8
  __label_9:
.annotate 'line', 1382
# var desc: $P3
    $P3 = $P1.'checkVar'()
.annotate 'line', 1383
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
.annotate 'line', 1385
    $P1.'emit'(__ARG_1, __ARG_4)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 1388
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 1
    $P7[0] = $S2
    $P2 = $P1.'scopesearch'($P7, 0)
.annotate 'line', 1389
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_15
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_15:
    unless $I1 goto __label_14
# {
.annotate 'line', 1390
# var path: $P4
    getattribute $P7, $P2, 'owner'
    $P4 = $P7.'getpath'()
.annotate 'line', 1391
    $P7 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_14: # endif
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 1398
    new $P5, ['ResizableStringArray']
.annotate 'line', 1399
    $P1.'buildkey'($P5)
.annotate 'line', 1400
    $P2 = __ARG_2.'scopesearch'($P5, 0)
.annotate 'line', 1401
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_17
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_17:
    unless $I1 goto __label_16
# {
.annotate 'line', 1402
# var path: $P6
    getattribute $P7, $P2, 'owner'
    $P6 = $P7.'getpath'()
.annotate 'line', 1403
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1404
    $P7 = WSubId_22($P6)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P7)
# }
  __label_16: # endif
.annotate 'line', 1406
    $P7 = $P5.'pop'()
    set $S2, $P7
.annotate 'line', 1407
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1408
    $P8 = WSubId_22($P5)
    __ARG_1.'emitget_hll_global'(__ARG_4, $S2, $P8)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 1411
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1412
    $P1.'emit'(__ARG_1, __ARG_4)
  __label_5: # switch end
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 1416
# reg: $S4
    $P7 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_18
    set $S4, $P7
  __label_18:
.annotate 'line', 1417
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1418
    ne $S4, 'null', __label_19
.annotate 'line', 1419
    __ARG_1.'emitnull'(__ARG_4)
    goto __label_20
  __label_19: # else
.annotate 'line', 1421
    __ARG_1.'emitbox'(__ARG_4, $S4)
  __label_20: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 1423

.end # Predef_varcast


.sub 'Predef_say' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1427
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1428
# n: $I1
# predefined elements
    elements $I3, __ARG_5
    sub $I1, $I3, 1
.annotate 'line', 1429
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1430
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1431
    $P1 = __ARG_5[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1430
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1432
    $P1 = __ARG_5[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1435
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1436

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1440
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1441
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1442
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1443
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1444
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1445

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_35')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1449
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1450
    if_null __ARG_5, __label_2
    iter $P1, __ARG_5
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1451
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1452

.end # Predef_print


.sub 'Predef_ASSERT' :subid('WSubId_38')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1456
# predefined elements
    elements $I2, __ARG_5
    iseq $I1, $I2, 1
# predefined __ASSERT__
.annotate 'line', 1458
    $P1 = __ARG_1.'getDebug'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 1459
    __ARG_1.'annotate'(__ARG_3)
.annotate 'line', 1460
# label: $S1
    $P1 = __ARG_2.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 1461
    $P1 = __ARG_5[0]
    __ARG_1.'emitif'($P1, $S1)
.annotate 'line', 1462
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1463
    $P1 = __ARG_3.'filename'()
    __ARG_1.'say'('    ', "print $P0, \"Assertion failed at '", $P1, "' line \"")
.annotate 'line', 1464
    $P1 = __ARG_3.'linenum'()
    __ARG_1.'say'('    ', "print $P0, ", $P1)
.annotate 'line', 1465
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
.annotate 'line', 1466
    __ARG_1.'say'('    ', "exit 1")
.annotate 'line', 1467
    __ARG_1.'emitlabel'($S1)
# }
  __label_1: # endif
# }
.annotate 'line', 1469

.end # Predef_ASSERT


.sub 'Predef_invoke' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1475
# var arg: $P1
    $P1 = __ARG_5[0]
.annotate 'line', 1476
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 1477
    WSubId_1("invoke argument must be callable", __ARG_3)
  __label_1: # endif
.annotate 'line', 1478
    concat $S1, "(", __ARG_4
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1479

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1483
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1484
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1485
# predefined length
    length $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1486

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1490
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1491
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1492
# predefined bytelength
    bytelength $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1493

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1497
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1498
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1499
# predefined ord
    ord $I1, $S1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1500

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1504
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1505
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1506
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1507
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1508
# predefined ord
    ord $I2, $S1, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1509

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1513
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1515
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1516
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1518
# var t: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1519
    new $P4, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1520

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1524
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1525
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1526
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1527
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1529
# var t: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1530
    new $P5, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1531

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1535
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1536
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1537
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1538
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1539
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1540
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1542
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1543
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1544

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1548
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1549
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1550
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1551
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1552
# predefined indexof
    index $I1, $S1, $S2
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1553

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 1557
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1558
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1559
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1560
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1561
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1562
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1563
# predefined indexof
    index $I2, $S1, $S2, $I1
    .tailcall WSubId_21(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1564

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_119')
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
# Body
# {
.annotate 'line', 1568
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1570
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('I')
    set $P3, $P4
    $P2.'PredefFunctionEval'('int', WSubId_23, $P3, 'I', '!')
    set $P1, $P2
.annotate 'line', 1568
    __ARG_1.'add'($P1)
.annotate 'line', 1573
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1574
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('N')
    set $P3, $P4
    $P2.'PredefFunction'('float', $P3, 'N', '!')
    set $P1, $P2
.annotate 'line', 1573
    __ARG_1.'add'($P1)
.annotate 'line', 1577
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1579
    new $P4, [ 'Winxed'; 'Compiler'; 'Predef_typecast' ]
    $P4.'Predef_typecast'('S')
    set $P3, $P4
    $P2.'PredefFunctionEval'('string', WSubId_24, $P3, 'S', '!')
    set $P1, $P2
.annotate 'line', 1577
    __ARG_1.'add'($P1)
.annotate 'line', 1582
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1583
    $P2.'PredefFunction'('var', WSubId_25, 'P', '!')
    set $P1, $P2
.annotate 'line', 1582
    __ARG_1.'add'($P1)
.annotate 'line', 1586
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1590
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1594
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('time', 'time %0', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1598
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('floattime', 'time %0', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1602
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1606
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1610
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1614
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1618
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1625
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1632
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1639
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1647
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1656
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n%0['payload'] = %4\n", 'P', 'S', 'I', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1666
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1670
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1671
    $P2.'PredefFunctionEval'('length', WSubId_26, 'length %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1670
    __ARG_1.'add'($P1)
.annotate 'line', 1675
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1676
    $P2.'PredefFunctionEval'('bytelength', WSubId_27, 'bytelength %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1675
    __ARG_1.'add'($P1)
.annotate 'line', 1680
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1681
    $P2.'PredefFunctionEval'('chr', WSubId_28, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P1, $P2
.annotate 'line', 1680
    __ARG_1.'add'($P1)
.annotate 'line', 1689
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1690
    $P2.'PredefFunctionEval'('ord', WSubId_29, 'ord %0, %1', 'I', 'S')
    set $P1, $P2
.annotate 'line', 1689
    __ARG_1.'add'($P1)
.annotate 'line', 1694
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1695
    $P2.'PredefFunctionEval'('ord', WSubId_30, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1694
    __ARG_1.'add'($P1)
.annotate 'line', 1699
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1700
    $P2.'PredefFunctionEval'('substr', WSubId_31, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1699
    __ARG_1.'add'($P1)
.annotate 'line', 1704
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1705
    $P2.'PredefFunctionEval'('substr', WSubId_32, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P1, $P2
.annotate 'line', 1704
    __ARG_1.'add'($P1)
.annotate 'line', 1709
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1713
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1714
    $P2.'PredefFunctionEval'('indexof', WSubId_33, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P1, $P2
.annotate 'line', 1713
    __ARG_1.'add'($P1)
.annotate 'line', 1718
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunctionEval' ]
.annotate 'line', 1719
    $P2.'PredefFunctionEval'('indexof', WSubId_34, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P1, $P2
.annotate 'line', 1718
    __ARG_1.'add'($P1)
.annotate 'line', 1723
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1727
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('escape', 'escape %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1731
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'('utf8')\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1739
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('unescape', "$P0 = new ['String']\n$P0 = %1\n%0 = $P0.'unescape'(%2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1747
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('trans_encoding', "find_encoding $I0, %2\ntrans_encoding %0, %1, $I0\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1754
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('encoding_name', "encoding $I0, %1\nencodingname %0, $I0\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1761
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1765
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1769
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1773
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1777
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1784
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1791
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1795
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1799
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1803
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1807
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1811
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1815
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1819
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1823
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1827
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1831
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1835
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1839
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1843
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getcontext', "getinterp $P0\n%0 = $P0[\"context\"]\n", 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1856
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'p')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1860
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1864
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1868
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('getattribute', 'getattribute %0, %1, %2, %3', 'P', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1872
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('setattribute', 'setattribute %1, %2, %3, %4', 'v', 'P', 'P', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1876
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1880
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1884
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1888
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1892
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1896
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1903
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1910
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1914
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1918
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('load_packfile', 'load_bytecode %0, %1', 'P', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1922
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1926
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
    $P2.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P1, $P2
    __ARG_1.'add'($P1)
.annotate 'line', 1930
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1931
    $P2.'PredefFunction'('print', WSubId_35, 'v', '*')
    set $P1, $P2
.annotate 'line', 1930
    __ARG_1.'add'($P1)
.annotate 'line', 1934
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1935
    $P2.'PredefFunction'('say', WSubId_36, 'v', '*')
    set $P1, $P2
.annotate 'line', 1934
    __ARG_1.'add'($P1)
.annotate 'line', 1938
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1939
    $P2.'PredefFunction'('cry', WSubId_37, 'v', '*')
    set $P1, $P2
.annotate 'line', 1938
    __ARG_1.'add'($P1)
.annotate 'line', 1942
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1943
    $P2.'PredefFunction'('__ASSERT__', WSubId_38, 'v', 'I')
    set $P1, $P2
.annotate 'line', 1942
    __ARG_1.'add'($P1)
.annotate 'line', 1946
    new $P2, [ 'Winxed'; 'Compiler'; 'PredefFunction' ]
.annotate 'line', 1947
    $P2.'PredefFunction'('invoke', WSubId_39, 'P', '!')
    set $P1, $P2
.annotate 'line', 1946
    __ARG_1.'add'($P1)
# }
.annotate 'line', 1950

.end # getpredefs


.sub 'optimize_array' :subid('WSubId_42')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1958
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1959
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1960
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1961
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1960
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1963

.end # optimize_array


.sub 'emit_array' :subid('WSubId_56')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1967
    if_null __ARG_2, __label_2
    iter $P2, __ARG_2
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 1968
    $P1.'emit'(__ARG_1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1969

.end # emit_array


.sub 'parseDotted' :subid('WSubId_59')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1973
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1974
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1975
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1976
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1977
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1978
    $P2 = __ARG_1.'get'()
.annotate 'line', 1979
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1982
    __ARG_1.'unget'($P2)
.annotate 'line', 1983
    .return($P1)
# }
.annotate 'line', 1984

.end # parseDotted


.sub 'parseList' :subid('WSubId_40')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 1992
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1993
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1994
# {
.annotate 'line', 1995
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1996
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1997
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1998
    unless_null __ARG_4, __label_4
.annotate 'line', 1999
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 2001
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.annotate 'line', 2002
    WSubId_1("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 2003
    .return($P1)
# }
.annotate 'line', 2004

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
# Body
# {
.annotate 'line', 2009
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2010
    $P2 = $P1.'isidentifier'()
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2011
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 2012
    .return($P1)
# }
.annotate 'line', 2013

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_60')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2017
    new $P1, ['ResizableStringArray']
.annotate 'line', 2018
    if_null __ARG_1, __label_2
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 2019
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2020
    .return($P1)
# }
.annotate 'line', 2021

.end # toIdentifierList

.namespace [ 'Winxed'; 'Compiler'; 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2034
    setattribute self, 'start', __ARG_1
.annotate 'line', 2035
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 2036

.end # initbase


.sub 'filename' :method
# Body
# {
.annotate 'line', 2039
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2040
    getattribute $P2, self, 'start'
    .tailcall $P2.'filename'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2042
    .return("unknown")
  __label_2: # endif
# }
.annotate 'line', 2043

.end # filename


.sub 'linenum' :method
# Body
# {
.annotate 'line', 2046
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2047
    getattribute $P2, self, 'start'
    .tailcall $P2.'linenum'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2049
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 2050

.end # linenum


.sub 'viewable' :method
# Body
# {
.annotate 'line', 2053
    getattribute $P1, self, 'start'
    if_null $P1, __label_1
.annotate 'line', 2054
    getattribute $P2, self, 'start'
    .tailcall $P2.'viewable'()
    goto __label_2
  __label_1: # else
.annotate 'line', 2056
    .return("")
  __label_2: # endif
# }
.annotate 'line', 2057

.end # viewable


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2060
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 2061

.end # annotate


.sub 'getpath' :method
# Body
# {
.annotate 'line', 2064
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getpath'()
# }
.annotate 'line', 2065

.end # getpath


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2068
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 2069

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 2072
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 2073

.end # generatesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2076
    getattribute $P1, self, 'owner'
    $P1.'usesubid'(__ARG_1)
# }
.annotate 'line', 2077

.end # usesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2080
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 2081

.end # addlocalfunction


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 2084
    getattribute $P1, self, 'owner'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2085

.end # scopesearch


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 2088
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 2089

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
.annotate 'line', 2029
    addattribute $P0, 'start'
.annotate 'line', 2030
    addattribute $P0, 'owner'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CollectValues' ]

.sub 'CollectValues' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2106
    setattribute self, 'owner', __ARG_1
.annotate 'line', 2107
    setattribute self, 'e', __ARG_2
# }
.annotate 'line', 2108

.end # CollectValues


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2111
# var e: $P1
    getattribute $P1, self, 'e'
.annotate 'line', 2112
# valuereg: $S1
    null $S1
.annotate 'line', 2113
    $P3 = __ARG_1.'isnull'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2114
# var pnull: $P2
    getattribute $P2, self, 'pnull'
.annotate 'line', 2115
    unless_null $P2, __label_3
# {
.annotate 'line', 2116
# regnull: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'tempreg'('P')
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 2117
    $P1.'emitnull'($S2)
.annotate 'line', 2118
    box $P2, $S2
    setattribute self, 'pnull', $P2
# }
  __label_3: # endif
.annotate 'line', 2120
    set $S1, $P2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 2123
    $P3 = __ARG_1.'emit_get'($P1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 2124
    .return($S1)
# }
.annotate 'line', 2125

.end # add

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
.annotate 'line', 2101
    addattribute $P0, 'owner'
.annotate 'line', 2102
    addattribute $P0, 'e'
.annotate 'line', 2103
    addattribute $P0, 'pnull'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2140
    $P2 = WSubId_40(__ARG_1, __ARG_2, WSubId_41, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 2141

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2145
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 2146

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 2149
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2150
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 2151

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2155
    getattribute $P1, self, 'args'
    WSubId_42($P1)
# }
.annotate 'line', 2156

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2159
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2160
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2161
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2162
    .return($P1)
# }
.annotate 'line', 2163

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2166
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 2167

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2136
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 2179
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2182
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2183
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2184
    .return($I1)
# }
.annotate 'line', 2185

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2188
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2189
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2190
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2191
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 2192

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2195
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2196
    if_null __ARG_2, __label_1
.annotate 'line', 2197
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 2198

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2201
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2202
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2203
    .return(self)
# }
.annotate 'line', 2204

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2176
    addattribute $P0, 'name'
.annotate 'line', 2177
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2209
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2210
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2211
    $P1 = __ARG_1.'get'()
.annotate 'line', 2212
# var args: $P2
    null $P2
.annotate 'line', 2213
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2214
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2216
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2217
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2218

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2227
    $P2 = WSubId_40(__ARG_1, __ARG_2, WSubId_43, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2228

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2231
    getattribute $P1, self, 'list'
    WSubId_42($P1)
# }
.annotate 'line', 2232

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2233
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2236
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2237
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2238
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2240
    .return($P2)
# }
.annotate 'line', 2241

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2223
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_22')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2250
# r: $S1
    null $S1
.annotate 'line', 2251
# predefined elements
    elements $I1, __ARG_1
    unless $I1 goto __label_1
.annotate 'line', 2252
# predefined string
# predefined join
    join $S2, "'; '", __ARG_1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 2253
    .return($S1)
# }
.annotate 'line', 2254

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2258
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2260
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2262
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2264
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2261
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2263
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2265
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2267
    __ARG_2.'unget'($P1)
.annotate 'line', 2268
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2270

.end # parseUsing


.sub 'parseSig' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2274
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2275
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2276
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2277
    WSubId_44("'='", $P2)
  __label_1: # endif
.annotate 'line', 2278
# var expr: $P3
    $P3 = WSubId_41(__ARG_2, __ARG_3)
.annotate 'line', 2279
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2280

.end # parseSig


.sub 'parseStatement' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
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
.const 'Sub' WSubId_55 = "WSubId_55"
# Body
# {
.annotate 'line', 2284
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2285
# var t2: $P2
    null $P2
.annotate 'line', 2286
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2287
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2288
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2289
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2290
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2291
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2292
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 2293
# var open: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2294
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2295
    WSubId_45("':'", $P1)
  __label_5: # endif
.annotate 'line', 2296
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2299
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
.annotate 'line', 2301
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2303
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2306
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2309
    $P2 = __ARG_1.'get'()
.annotate 'line', 2310
    __ARG_1.'unget'($P2)
.annotate 'line', 2311
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2312
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2315
    $P2 = __ARG_1.'get'()
.annotate 'line', 2316
    __ARG_1.'unget'($P2)
.annotate 'line', 2317
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2318
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2321
    $P2 = __ARG_1.'get'()
.annotate 'line', 2322
    __ARG_1.'unget'($P2)
.annotate 'line', 2323
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2324
    .tailcall WSubId_52($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2327
    $P2 = __ARG_1.'get'()
.annotate 'line', 2328
    __ARG_1.'unget'($P2)
.annotate 'line', 2329
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2330
    .tailcall WSubId_53($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2333
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2335
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2337
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2339
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2341
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2343
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2345
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2347
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2349
    .tailcall WSubId_54($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2351
    .tailcall WSubId_55($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2353
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2355
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2358
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
# {
.annotate 'line', 2359
# var t2: $P4
    $P4 = __ARG_1.'get'()
.annotate 'line', 2360
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2361
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2362
    __ARG_1.'unget'($P4)
# }
  __label_31: # endif
.annotate 'line', 2364
    __ARG_1.'unget'($P1)
.annotate 'line', 2365
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 2366

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2376
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2377

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2378
    .return(0)
# }

.end # isempty


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 2381
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
# }
.annotate 'line', 2382

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2385
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2386

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2389
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2390

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2393
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2394

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2397
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2398

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2401
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2402

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2405
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2406

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2409
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2410

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2413
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2414

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2417
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2418

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2421
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2422

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2425
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2426

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2429
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2430

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2433
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2434

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2441
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2442

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2445
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2446

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2449
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2450

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2453
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2455
    .return(self)
# }
.annotate 'line', 2456

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2372
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2461
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2464
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2465

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2466
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2459
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2479
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2480
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2481
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2482
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2483
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2484
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2485
    null $I2
  __label_4: # endif
.annotate 'line', 2486
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2482
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2488
    unless $I2 goto __label_7
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
# }
.annotate 'line', 2489

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2475
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2496
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2497
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2498

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2499
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2502
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2503
    .return(self)
# }
.annotate 'line', 2504

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 2507
    getattribute $P1, self, 'statements'
    WSubId_56(__ARG_1, $P1)
# }
.annotate 'line', 2508

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2492
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'addtomulti' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
# switch-case
.annotate 'line', 2514
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2516
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2515
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2517
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2519
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 2521

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2529
# var arg: $P1
    null $P1
.annotate 'line', 2530
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2531
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2532
    $P2 = __ARG_1.'get'()
.annotate 'line', 2533
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2534
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2537
    __ARG_1.'unget'($P2)
.annotate 'line', 2538
    $P1 = WSubId_41(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2540
    .return($P1)
# }
.annotate 'line', 2541

.end # parsePiropArg

.namespace [ 'Winxed'; 'Compiler'; 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_57 = "WSubId_57"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2550
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2551
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2552
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2553
    unless $I1 goto __label_1
.annotate 'line', 2554
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2555
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2556
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2557
    $P1 = __ARG_2.'get'()
.annotate 'line', 2558
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2559
    __ARG_2.'unget'($P1)
.annotate 'line', 2560
    $P3 = WSubId_40(__ARG_2, __ARG_3, WSubId_57, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2562
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 2563

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2566
    getattribute $P1, self, 'args'
    WSubId_42($P1)
.annotate 'line', 2567
    .return(self)
# }
.annotate 'line', 2568

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2571
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2572
    self.'annotate'(__ARG_1)
.annotate 'line', 2573
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2574
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2575
    __ARG_1.'print'('    ')
.annotate 'line', 2576
    unless_null $P1, __label_2
.annotate 'line', 2577
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2579
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2580
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2581
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2582
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2584

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2543
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2545
    addattribute $P0, 'opname'
.annotate 'line', 2546
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_60 = "WSubId_60"
# Body
# {
.annotate 'line', 2596
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2597
# var path: $P1
    $P1 = WSubId_59(__ARG_2)
.annotate 'line', 2598
# predefined elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2599
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2600
    WSubId_58(';', __ARG_2)
.annotate 'line', 2601
    $P3 = WSubId_60($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2602
    .return(self)
# }
.annotate 'line', 2603

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2604
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2607
    self.'annotate'(__ARG_1)
.annotate 'line', 2608
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2609

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2591
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2593
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_61 = "WSubId_61"
# Body
# {
.annotate 'line', 2621
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2622
# var names: $P1
    null $P3
    $P1 = WSubId_40(__ARG_2, $P3, WSubId_61, ';')
.annotate 'line', 2623
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2624
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2625
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2627
    setattribute self, 'names', $P1
# }
.annotate 'line', 2628

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2631
    .return(self)
# }
.annotate 'line', 2632

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2635
    self.'annotate'(__ARG_1)
.annotate 'line', 2636
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2637
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2638
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2640

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2616
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2618
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2654
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2655
# var path: $P1
    $P1 = WSubId_59(__ARG_2)
.annotate 'line', 2656
# predefined elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2657
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2658
    WSubId_58(';', __ARG_2)
.annotate 'line', 2659
    setattribute self, 'path', $P1
# }
.annotate 'line', 2660

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2663
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2664
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2666
# var symbol: $P3
    $P3 = self.'scopesearch'($P1, 0)
# switch-case
.annotate 'line', 2668
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2682
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2669
# predefined elements
    elements $I2, $P1
    unless $I2 goto __label_5
# {
.annotate 'line', 2670
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2671
    $P4.'pop'()
.annotate 'line', 2672
# var ns: $P5
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2673
    if_null $P5, __label_6
# {
.annotate 'line', 2674
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2675
    if_null $P3, __label_7
# {
.annotate 'line', 2676
    self.'createvarused'($P2, $P3)
.annotate 'line', 2677
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
.annotate 'line', 2683
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2684
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2685
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2686
    self.'usesubid'($S1)
.annotate 'line', 2687
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2689
    self.'createvar'($P2, 'P')
.annotate 'line', 2690
    .return(self)
# }
.annotate 'line', 2691

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 2694
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2695
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2696
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2697
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2698
    self.'annotate'(__ARG_1)
.annotate 'line', 2699
# key: $S2
    null $S2
.annotate 'line', 2700
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2701
    $P1.'pop'()
.annotate 'line', 2702
    $P3 = WSubId_22($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2704
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2706

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2647
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2649
    addattribute $P0, 'path'
.annotate 'line', 2650
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'usingNamespace' :subid('WSubId_62')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2716
# var nskey: $P1
    $P1 = WSubId_59(__ARG_2)
.annotate 'line', 2717
# predefined elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2718
    WSubId_44('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2719
# var nssym: $P2
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2720
    unless_null $P2, __label_2
.annotate 'line', 2721
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2722
    __ARG_3.'usenamespace'($P2)
# }
.annotate 'line', 2723

.end # usingNamespace

.namespace [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2729
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2730
    WSubId_62(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2731
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 2732

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2735
    .return(self)
# }
.annotate 'line', 2736

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2725
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 2751
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2752
    $P2 = WSubId_41(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2753
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 2754

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2757
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2758
    .return(self)
# }
.annotate 'line', 2759

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2762
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2763

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2746
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2748
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
.annotate 'line', 2780
    setattribute self, 'type', __ARG_1
.annotate 'line', 2781
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2782
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2783
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2784

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2787
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2788

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2789
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2790
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2791
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2792
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2793
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2794
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2795
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags


.sub 'issubid' :method
# Body
# {
.annotate 'line', 2798
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 2799
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
.annotate 'line', 2800

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2772
    addattribute $P0, 'type'
.annotate 'line', 2773
    addattribute $P0, 'reg'
.annotate 'line', 2774
    addattribute $P0, 'scope'
.annotate 'line', 2775
    addattribute $P0, 'flags'
.annotate 'line', 2776
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2808
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2809

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2812
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2813

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2805
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
.annotate 'line', 2822
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2823

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2824
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2827
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2828
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2829
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2830

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2816
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2818
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2841
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2842

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2845
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2846
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2847
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2848
    if_null $P2, __label_2
.annotate 'line', 2849
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2850
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2851
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2852
    $P1[$S1] = $P3
.annotate 'line', 2853
    .return($P3)
# }
.annotate 'line', 2854

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2857
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2858
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2859
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2860
    if_null $P2, __label_2
.annotate 'line', 2861
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2862
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2863

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2866
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2867
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2868
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2869
    if_null $P2, __label_2
.annotate 'line', 2870
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2871
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2872

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2875
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2876
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2877
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2878
    if_null $P2, __label_2
.annotate 'line', 2879
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2880
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2881
    $P1[$S1] = $P3
.annotate 'line', 2882
    .return($P3)
# }
.annotate 'line', 2883

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2886
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2887
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2888

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2891
# var sym: $P1
    null $P1
.annotate 'line', 2892
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2893
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2894
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2896
    .return($P3)
# }
.annotate 'line', 2897

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2900
# var sym: $P1
    null $P1
.annotate 'line', 2901
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2902
    .return($P1)
  __label_1: # endif
.annotate 'line', 2903
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2904
    .return($P1)
  __label_2: # endif
.annotate 'line', 2905
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2906
    if_null $P2, __label_3
.annotate 'line', 2907
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2908
    .return($P3)
# }
.annotate 'line', 2909

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2912
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2913
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2914
    .return($S1)
# }
.annotate 'line', 2915

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2918
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2920
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2921
    .return('__WLEX_self')
# }
.annotate 'line', 2922

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2836
    addattribute $P0, 'locals'
.annotate 'line', 2837
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2931
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
.annotate 'line', 2943
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2944

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2945
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2946
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2947
    .return(0)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
.annotate 'line', 2948
    .return(0)
# }

.end # isintegerzero


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2949
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2950
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2951
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2952
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2953
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2954
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2957
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2958

.end # tempreg


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2961
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2962

.end # genlabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2966
    .return(self)
# }
.annotate 'line', 2967

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2968
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2971
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2972
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $P1 = self.'tempreg'($S1)
    set $S2, $P1
  __label_2:
.annotate 'line', 2973
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2974
    .return($S2)
# }
.annotate 'line', 2975

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2978
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 2979
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 2980
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 2981

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2984
# reg: $S1
    $P1 = self.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2985
    $P1 = self.'checkresult'()
    set $S3, $P1
    eq $S3, 'I', __label_2
# {
.annotate 'line', 2986
# aux: $S2
    $P2 = self.'tempreg'('I')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 2987
    self.'annotate'(__ARG_1)
.annotate 'line', 2988
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 2989
    set $S1, $S2
# }
  __label_2: # endif
.annotate 'line', 2991
    .return($S1)
# }
.annotate 'line', 2992

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 2995
    WSubId_63(self)
# }
.annotate 'line', 2996

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2939
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 3001
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2999
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 3011
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 3012
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 3013
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 3014
    WSubId_44('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 3015
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 3016

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3017
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3020
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 3021
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 3022
    .return(self)
# }
.annotate 'line', 3023

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3026
    self.'annotate'(__ARG_1)
.annotate 'line', 3027
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 3028
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3029
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3030
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 3031
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 3033
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3035

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 3006
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3008
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
.annotate 'line', 3050
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3051
    .return(self)
# }
.annotate 'line', 3052

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 3055
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 3056

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3059
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3060
    .return(self)
# }
.annotate 'line', 3061

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 3064
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3065
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3066
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
.annotate 'line', 3067
    .return(0)
# }
.annotate 'line', 3068

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3071
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3073
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3074
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3075
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3077
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3078
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
.annotate 'line', 3081
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3084
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3087
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3090

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3093
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3095
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3096
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3097
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3099
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3100
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
.annotate 'line', 3103
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3106
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3109
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3112

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3047
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 3119
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 3120
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3117
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3130
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3131
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 3132

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 3133
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3134
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 3137
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3138
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3139
    .return($S1)
# }
.annotate 'line', 3140

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 3143
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3144
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3145
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3146
# predefined unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3147
    .return($S1)
# }
.annotate 'line', 3148

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3151
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 3152
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 3153

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3156
    .tailcall self.'getPirString'()
# }
.annotate 'line', 3157

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3125
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3127
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3168
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3169
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3170
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 3171
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 3172

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 3173
    .return(1)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
# predefined int
.annotate 'line', 3176
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
# }
.annotate 'line', 3177

.end # isintegerzero


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3178
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 3181
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 3182

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3185
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3186
    .return($N1)
# }
.annotate 'line', 3187

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3190
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 3191
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3192
    if $I1 goto __label_2
.annotate 'line', 3193
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3195
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3197

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3200
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 3201

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3162
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3164
    addattribute $P0, 'pos'
.annotate 'line', 3165
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3211
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3212
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 3213

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 3214
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3215
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3218
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
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
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3224
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3225
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3227

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 3230
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3231
    .tailcall WSubId_64($N1)
# }
.annotate 'line', 3232

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3206
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3208
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3241
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3244
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3245
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3246

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3249
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3250
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3251
    .return(0)
  __label_1: # endif
.annotate 'line', 3252
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3253

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3256
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3257
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3258
    if_null $P2, __label_1
.annotate 'line', 3259
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3261
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3264
    .return('P')
  __label_4: # default
.annotate 'line', 3266
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3269

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3272
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3273
    .return($S1)
# }
.annotate 'line', 3274

.end # getName


.sub 'checkVar' :method
# Body
# {
.annotate 'line', 3277
    getattribute $P1, self, 'owner'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
# }
.annotate 'line', 3278

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3281
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3282
    unless_null $P1, __label_1
.annotate 'line', 3283
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3284
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3285
# s: $S1
    null $S1
.annotate 'line', 3286
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3287
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3290
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3292
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3296
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3297
    .return($S1)
# }
.annotate 'line', 3298

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 3301
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3302
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3303
    getattribute $P2, self, 'name'
    WSubId_65($P2)
  __label_1: # endif
.annotate 'line', 3304
    .return($P1)
# }
.annotate 'line', 3305

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3308
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3309
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3310
    if_null $P2, __label_1
# {
.annotate 'line', 3311
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3312
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3313
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3314
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3315
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3316
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3323
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3324
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3325
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
.annotate 'line', 3329
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3330
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3331
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_11
# {
.annotate 'line', 3332
# id: $S1
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_12
    set $S1, $P6
  __label_12:
.annotate 'line', 3333
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3334
    self.'usesubid'($S1)
.annotate 'line', 3335
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3339
    .return(self)
# }
.annotate 'line', 3340

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3343
# id: $S1
    null $S1
.annotate 'line', 3344
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3345
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3347
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3348
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3349
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_3:
.annotate 'line', 3350
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3351
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3352
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3353
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3354
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3358
    .return($S1)
# }
.annotate 'line', 3359

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3362
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3363
    self.'annotate'(__ARG_1)
.annotate 'line', 3364
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3365
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3367

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3370
    self.'annotate'(__ARG_1)
.annotate 'line', 3371
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3372

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3375
    self.'annotate'(__ARG_1)
.annotate 'line', 3376
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3377
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3378
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3379
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3380
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3381
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3384
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3387
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3390
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3391
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3393
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3394
    ne $S3, 'v', __label_13
.annotate 'line', 3395
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3396
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3397
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3400
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3401
    self.'annotate'(__ARG_1)
.annotate 'line', 3402
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3403
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3405
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3408
    .return($S2)
# }
.annotate 'line', 3409

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3237
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3239
    addattribute $P0, 'name'
.annotate 'line', 3240
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3419
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3420
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3421

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3424
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3425

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3428
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3429
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3430
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3431
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3432
    .return($S2)
# }
.annotate 'line', 3433

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3436
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3437
    self.'annotate'(__ARG_1)
.annotate 'line', 3438
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3439
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3441

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3444
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3445
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3446
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3448
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3451
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3449
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3452
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3455
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3456
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3457
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3459
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3460
    self.'annotate'(__ARG_1)
.annotate 'line', 3461
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3465
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3466

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3469
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3470

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3414
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3416
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3479
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3480

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3475
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]

.sub 'OpNamespaceExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 3490
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3491
    $P2 = WSubId_59(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3492
    getattribute $P1, self, 'key'
# predefined elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3493
    WSubId_44('namespace identifier', __ARG_3)
  __label_1: # endif
# }
.annotate 'line', 3494

.end # OpNamespaceExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3495
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3498
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3499
# var sym: $P2
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3500
    unless_null $P2, __label_1
.annotate 'line', 3501
    getattribute $P4, self, 'start'
    WSubId_1('unknown namespace', $P4)
  __label_1: # endif
.annotate 'line', 3502
# var path: $P3
    $P3 = $P2.'getpath'()
.annotate 'line', 3503
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
# }
.annotate 'line', 3504

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3485
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3487
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 3515
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3516
    $P2 = WSubId_66(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3517

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3518
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3521
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3522
# var clspec: $P2
    getattribute $P2, self, 'clspec'
.annotate 'line', 3525
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3526
    getattribute $P4, self, 'owner'
    __ARG_2 = $P4.'tempreg'('P')
  __label_1: # endif
# switch-case
.annotate 'line', 3530
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 3531
# var clkey: $P3
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3532
    if_null $P3, __label_5
# {
.annotate 'line', 3533
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3534
    .return()
# }
  __label_5: # endif
    goto __label_2 # break
  __label_3: # default
  __label_2: # switch end
.annotate 'line', 3539
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3540
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3541
    __ARG_1.'say'()
# }
.annotate 'line', 3542

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3509
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3511
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3552
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3553
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3554

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3557
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3558

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3561
    self.'optimizearg'()
.annotate 'line', 3562
    .return(self)
# }
.annotate 'line', 3563

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3547
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3549
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
.annotate 'line', 3574
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3575
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3576
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3577

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3580
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3581
    .return(self)
# }
.annotate 'line', 3582

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3585
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3586

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3589
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3590
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3591

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3594
    self.'optimizearg'()
.annotate 'line', 3595
    .return(self)
# }
.annotate 'line', 3596

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3599
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3600

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3603
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3604

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3568
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3570
    addattribute $P0, 'lexpr'
.annotate 'line', 3571
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3613
    .return('I')
# }
.annotate 'line', 3614

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3617
    self.'optimizearg'()
.annotate 'line', 3618
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3619
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3620
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3621
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3622
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3623
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3625
    .return(self)
# }
.annotate 'line', 3626

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3609
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3635
    .return('I')
# }
.annotate 'line', 3636

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3631
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
.annotate 'line', 3644
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3645

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3648
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3649
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3650
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3651
    self.'annotate'(__ARG_1)
.annotate 'line', 3652
    __ARG_1.'print'('    delete ')
.annotate 'line', 3653
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3654
    __ARG_1.'say'()
.annotate 'line', 3655
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3656
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3659
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3660

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3640
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
.annotate 'line', 3667
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3668

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3671
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3672
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
.annotate 'line', 3673
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3674
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3675
    self.'annotate'(__ARG_1)
.annotate 'line', 3676
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3677
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3678
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3681
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3682

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3663
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
.annotate 'line', 3691
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3692

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3695
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3696

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3699
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3700
    .return(self)
# }
.annotate 'line', 3701

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 3704
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3705
    self.'optimizearg'()
.annotate 'line', 3706
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3707
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3708
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3711
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3712
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3713
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_67($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3716
    .return(self)
# }
.annotate 'line', 3717

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3720
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3721
    self.'annotate'(__ARG_1)
.annotate 'line', 3722
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3723

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3687
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
.annotate 'line', 3732
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3733

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3734
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3737
    .return('I')
# }
.annotate 'line', 3738

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3741
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3742
    .return(self)
# }
.annotate 'line', 3743

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3746
    self.'optimizearg'()
.annotate 'line', 3747
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3748
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3749
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3750
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3752
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3753
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3754
    .return(self)
# }
.annotate 'line', 3755

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3758
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3759

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3762
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3763
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3764
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3765
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3767
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3770
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3773
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3775

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3728
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
.annotate 'line', 3784
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3785

.end # OpBinNotExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3788
    .return('I')
# }
.annotate 'line', 3789

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3792
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3793
    .return(self)
# }
.annotate 'line', 3794

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3797
    self.'optimizearg'()
.annotate 'line', 3798
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3799
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3800
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3801
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    bxor $I2, $I1, -1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3803
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3804
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3805
    .return(self)
# }
.annotate 'line', 3806

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3809
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3810
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3811
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3812
    self.'annotate'(__ARG_1)
.annotate 'line', 3813
    __ARG_1.'emitarg3'('bxor', __ARG_2, $S1, -1)
# }
  __label_2: # endif
# }
.annotate 'line', 3815

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
.annotate 'line', 3780
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3824
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3825

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3828
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3829
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3830
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3831

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3820
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3840
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3841
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3842
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3843

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3836
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
.annotate 'line', 3850
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3851

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3854
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3855
    self.'annotate'(__ARG_1)
.annotate 'line', 3856
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3857
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3858
    .return($S1)
# }
.annotate 'line', 3859

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3846
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
.annotate 'line', 3866
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3867

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3870
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3871
    self.'annotate'(__ARG_1)
.annotate 'line', 3872
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3873
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3874
    .return($S1)
# }
.annotate 'line', 3875

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3862
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
.annotate 'line', 3884
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3885

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3888
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3889
    self.'annotate'(__ARG_1)
.annotate 'line', 3890
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3891
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3892
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3893
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3894
    .return($S1)
# }
.annotate 'line', 3895

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3880
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
.annotate 'line', 3902
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3903

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3906
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3907
    self.'annotate'(__ARG_1)
.annotate 'line', 3908
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3909
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3910
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3911
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3912
    .return($S1)
# }
.annotate 'line', 3913

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3898
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
.annotate 'line', 3924
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3925
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3926
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3927
    .return(self)
# }
.annotate 'line', 3928

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3931
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3932

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3935
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3936
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3937
    .return(self)
# }
.annotate 'line', 3938

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3941
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3942

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 3945
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3946
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3947
    WSubId_63($P1)
  __label_1: # endif
# }
.annotate 'line', 3948

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3951
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3952
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3953
    self.'annotate'(__ARG_1)
.annotate 'line', 3954
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3956

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3918
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3920
    addattribute $P0, 'lexpr'
.annotate 'line', 3921
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3965
    self.'annotate'(__ARG_1)
.annotate 'line', 3966
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3967
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3968

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3961
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3977
    self.'annotate'(__ARG_1)
.annotate 'line', 3978
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3979
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3980
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3981

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3984
    self.'checkleft'()
.annotate 'line', 3985
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3986
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 3987
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 3988
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3989
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3990
    self.'annotate'(__ARG_1)
.annotate 'line', 3991
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3992
    .return($S1)
# }
.annotate 'line', 3993

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3973
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4002
    self.'checkleft'()
.annotate 'line', 4003
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4004
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4005
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4006
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4007
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4008
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 4009
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4011
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 4012
# aux: $S5
    null $S5
.annotate 'line', 4013
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 4014
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 4016
    eq $S2, 'S', __label_13
# {
.annotate 'line', 4017
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 4018
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4019
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 4021
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 4025
    eq $S1, $S2, __label_14
# {
.annotate 'line', 4026
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4027
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4028
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 4030
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4033
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 4036
    .return($S3)
# }
.annotate 'line', 4037

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3998
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
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
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4053
# aux: $S5
    null $S5
.annotate 'line', 4054
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 4055
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 4057
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 4060
    eq $S1, $S2, __label_10
# {
.annotate 'line', 4061
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 4062
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4063
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 4065
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 4068
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 4070
    .return($S3)
# }
.annotate 'line', 4071

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 4042
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4080
    self.'checkleft'()
.annotate 'line', 4081
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4082
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4083
# lreg: $S1
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4084
# rreg: $S2
    null $S2
# switch
.annotate 'line', 4085
    $P3 = $P1.'checkresult'()
    set $S3, $P3
    set $S4, 'S'
    if $S3 == $S4 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 4087
    $P4 = $P2.'emit_getint'(__ARG_1)
    set $S2, $P4
.annotate 'line', 4088
    self.'annotate'(__ARG_1)
.annotate 'line', 4089
    __ARG_1.'emitrepeat'($S1, $S1, $S2)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 4092
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S2, $P5
.annotate 'line', 4093
    self.'annotate'(__ARG_1)
.annotate 'line', 4094
    __ARG_1.'emitarg2'('mul', $S1, $S2)
  __label_2: # switch end
.annotate 'line', 4096
    .return($S1)
# }
.annotate 'line', 4097

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4076
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4106
    self.'checkleft'()
.annotate 'line', 4107
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4108
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4109
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4110
    self.'annotate'(__ARG_1)
.annotate 'line', 4111
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 4112
    .return($S2)
# }
.annotate 'line', 4113

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4102
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4122
    self.'checkleft'()
.annotate 'line', 4123
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4124
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4125
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4126
    self.'annotate'(__ARG_1)
.annotate 'line', 4127
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 4128
    .return($S2)
# }
.annotate 'line', 4129

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4118
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
.annotate 'line', 4141
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4144
    self.'optimizearg'()
.annotate 'line', 4145
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4146
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4147
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4148
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4149
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4150
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 4152
    .return(self)
# }
.annotate 'line', 4153

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 4156
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4157
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4158
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4159
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4160
    self.'annotate'(__ARG_1)
.annotate 'line', 4161
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 4163
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4168
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4173
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4178
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4183
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4188
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4164
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4165
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4166
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4169
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4170
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4171
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4174
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4175
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4176
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4179
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4180
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4181
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4184
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4185
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4186
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4189
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4190
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4191
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4192
# switch
.annotate 'line', 4195
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4197
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4200
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 4203
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 4204
# }
.annotate 'line', 4206

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4209
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4210

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4213
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4214

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4217
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 4218

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4139
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4229
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
# }
.annotate 'line', 4230

.end # Negable


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4231
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4234
# positive: $I1
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4235
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4236
    .return(self)
# }
.annotate 'line', 4237

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4225
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4251
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4252
    self.'Negable'(__ARG_3)
.annotate 'line', 4253
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 4254

.end # CheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4255
    .return('I')
# }

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4245
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4247
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4262
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4263

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4266
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4267
    self.'annotate'(__ARG_1)
.annotate 'line', 4268
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4269
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4270
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 4271

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4274
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4275
    self.'annotate'(__ARG_1)
.annotate 'line', 4276
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4277
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4279
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4280

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4258
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
.annotate 'line', 4287
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4288

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4291
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4292
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4293
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 4294
    self.'annotate'(__ARG_1)
.annotate 'line', 4295
    getattribute $P2, self, 'positive'
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 4296
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_4
  __label_3: # else
.annotate 'line', 4298
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_4: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 4300

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4303
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4304
# reg: $S1
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4305
    self.'annotate'(__ARG_1)
.annotate 'line', 4306
    getattribute $P2, self, 'positive'
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 4307
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4309
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4310

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4283
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
.annotate 'line', 4319
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4320
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4321

.end # OpEqualExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4324
    self.'optimizearg'()
.annotate 'line', 4325
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4326
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4327
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4328
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4329
    unless $I1 goto __label_1
# {
.annotate 'line', 4330
    unless $I2 goto __label_2
.annotate 'line', 4331
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_21($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4333
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4335
    unless $I2 goto __label_4
.annotate 'line', 4336
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4337
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4338
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4339
    $I7 = $P1.'isliteral'()
    unless $I7 goto __label_8
    $I7 = $P2.'isliteral'()
  __label_8:
    unless $I7 goto __label_7
# {
.annotate 'line', 4340
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4341
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4343
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4344
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4345
# vi: $I5
    getattribute $P5, self, 'positive'
    if_null $P5, __label_15
    unless $P5 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4346
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall WSubId_21($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 4348
# ls: $S3
    getattribute $P9, $P1, 'strval'
    getattribute $P8, $P9, 'str'
    null $S3
    if_null $P8, __label_16
    set $S3, $P8
  __label_16:
.annotate 'line', 4349
# rs: $S4
    getattribute $P11, $P2, 'strval'
    getattribute $P10, $P11, 'str'
    null $S4
    if_null $P10, __label_17
    set $S4, $P10
  __label_17:
.annotate 'line', 4350
# vs: $I6
    getattribute $P12, self, 'positive'
    if_null $P12, __label_19
    unless $P12 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4351
    getattribute $P13, self, 'owner'
    getattribute $P14, self, 'start'
    .tailcall WSubId_21($P13, $P14, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_7: # endif
.annotate 'line', 4355
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4356
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4357
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4358
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4359
    .return(self)
# }
.annotate 'line', 4360

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4363
    self.'annotate'(__ARG_1)
.annotate 'line', 4364
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
.annotate 'line', 4365

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4368
    self.'annotate'(__ARG_1)
.annotate 'line', 4369
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4370

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4373
    self.'annotate'(__ARG_1)
.annotate 'line', 4374
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
.annotate 'line', 4375

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4378
    self.'annotate'(__ARG_1)
.annotate 'line', 4379
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
.annotate 'line', 4380

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4315
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
.annotate 'line', 4391
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4392
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4393

.end # OpSameExpr


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4396
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
.annotate 'line', 4397

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4400
    self.'annotate'(__ARG_1)
.annotate 'line', 4401
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4402
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4403
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4404

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4407
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4408

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4411
    self.'annotate'(__ARG_1)
.annotate 'line', 4412
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4413
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4414
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4415

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4418
    self.'annotate'(__ARG_1)
.annotate 'line', 4419
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4420
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4421
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4422

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4386
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4388
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4429
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4432
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4433

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4436
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4437

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4440
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4441

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4444
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4445

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4448
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4449

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4427
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4456
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4459
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4460

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4463
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4464

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4467
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4468

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4471
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4472

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4475
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4476

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4454
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4483
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4486
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4487

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4490
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4491

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4494
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4495

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4498
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4499

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4502
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4503

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4481
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4510
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4513
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4514

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4517
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4518

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4521
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4522

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4525
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4526

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4529
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4530

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4508
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4539
    .return('I')
# }
.annotate 'line', 4540

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4535
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
.annotate 'line', 4549
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4550

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4553
    self.'optimizearg'()
.annotate 'line', 4554
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4555
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4556
    unless $I1 goto __label_3
.annotate 'line', 4557
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4558
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_21($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4556
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4560
    .return(self)
# }
.annotate 'line', 4561

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4564
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
.annotate 'line', 4565
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4566
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4567
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4568
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4571
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4572
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4573
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4574
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4575
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4577

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4545
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
.annotate 'line', 4586
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4587

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4590
    self.'optimizearg'()
.annotate 'line', 4591
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4592
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4593
    if $I1 goto __label_3
.annotate 'line', 4594
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4595
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_21($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4593
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4597
    .return(self)
# }
.annotate 'line', 4598

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4601
# res: $S1
    null $S1
.annotate 'line', 4602
    if_null __ARG_2, __label_1
.annotate 'line', 4603
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4605
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4606
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4607
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4608
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4609
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4612
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4613
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4614
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4615
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4616
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4618

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4582
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4623
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
.annotate 'line', 4633
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4634

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4637
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
.annotate 'line', 4638
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4639
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4640
    self.'annotate'(__ARG_1)
.annotate 'line', 4641
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4642

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4645
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4646

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4629
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
.annotate 'line', 4655
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4656

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4659
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
.annotate 'line', 4660
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4661
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4662
    self.'annotate'(__ARG_1)
.annotate 'line', 4663
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4664

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4667
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4668

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4651
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
.annotate 'line', 4677
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4678

.end # OpBinXorExpr


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
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4686

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4689
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4690

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4673
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
.annotate 'line', 4700
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4702
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4709
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4703
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4704
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4705
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4707
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4710
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4711
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4714
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 2
    $P10[0] = __ARG_3
    $P10[1] = __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4716

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4717
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4720
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4721
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4722
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4723
# i: $I2
    null $I2
# for loop
.annotate 'line', 4724
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4725
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4724
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4726
    .return($P2)
# }
.annotate 'line', 4727

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4730
# auxreg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4731
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 4732
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 4733

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4736
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4737
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4738
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4739
    self.'annotate'(__ARG_1)
.annotate 'line', 4740
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4741
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4742
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4741
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4743
    .return($S1)
# }
.annotate 'line', 4744

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4747
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4748
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4749
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4750
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4751
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4750
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4752

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4695
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4697
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4761
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4762

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4763
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4766
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4767
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4768
# rreg: $S2
    $P2 = $P1.'emit_getint'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4769
    set $S3, __ARG_2
    eq $S3, '', __label_3
# {
.annotate 'line', 4770
    self.'annotate'(__ARG_1)
.annotate 'line', 4771
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 4773

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4757
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
.annotate 'line', 4782
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4783

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 4786
    self.'optimizearg'()
.annotate 'line', 4787
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4788
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4789
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4790
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4791
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4792
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4797
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4798
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4799
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4801
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# predefined string
.annotate 'line', 4802
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
.annotate 'line', 4804
    new $P12, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P13, $P3, 'file'
    getattribute $P14, $P3, 'line'
# predefined string
.annotate 'line', 4805
    $P15 = $P3.'getasquoted'()
    set $S6, $P15
# predefined string
    $P16 = $P4.'getasquoted'()
    set $S7, $P16
    concat $S8, $S6, $S7
    $P12.'TokenQuoted'($P13, $P14, $S8)
    set $P11, $P12
    set $P5, $P11
  __label_7:
.annotate 'line', 4806
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4808
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4809
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4810
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4811
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4814
    $P6 = WSubId_68($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4815
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4816
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4817
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_67($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4821
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4822
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4824
    .return(self)
# }
.annotate 'line', 4825

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 4828
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4829
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4830
    ne $S1, $S2, __label_3
.annotate 'line', 4831
    .return($S1)
  __label_3: # endif
.annotate 'line', 4832
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4833
    .return('S')
  __label_4: # endif
.annotate 'line', 4834
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4835
    .return('S')
  __label_6: # endif
.annotate 'line', 4836
    $P1 = WSubId_68($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4837
    .return('N')
  __label_8: # endif
.annotate 'line', 4838
    .return('I')
# }
.annotate 'line', 4839

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4842
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4843
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4844
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4845
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4846
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4848
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4849
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4850
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4851
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4852
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4853
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4854
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4855
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4858
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4859
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4862
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4865
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4866
# l: $S7
    null $S7
.annotate 'line', 4867
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4869
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4870
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4872
# r: $S8
    null $S8
.annotate 'line', 4873
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4875
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4876
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4878
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4881
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4883

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4778
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
.annotate 'line', 4892
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4893

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4896
    self.'optimizearg'()
.annotate 'line', 4897
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4898
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4899
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4900
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4901
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4902
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4903
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4904
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4905
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4908
    .return(self)
# }
.annotate 'line', 4909

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4912
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4913
# rtype: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
# switch-case
.annotate 'line', 4915
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 4917
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 4919
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 4921
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 4916
    .return($S1)
  __label_6: # case
.annotate 'line', 4918
    .return('P')
  __label_8: # case
.annotate 'line', 4920
    .return('N')
  __label_10: # case
.annotate 'line', 4922
    .return('N')
  __label_4: # default
.annotate 'line', 4924
    .return('I')
  __label_3: # switch end
# }
.annotate 'line', 4926

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4929
# type: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4930
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4931
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4932
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4933
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4934
# lreg: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4935
# rreg: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4936
# aux: $S6
    null $S6
.annotate 'line', 4937
    eq $S2, $S1, __label_6
# {
.annotate 'line', 4938
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4939
    ne $S1, 'P', __label_7
.annotate 'line', 4940
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 4942
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 4943
    set $S4, $S6
# }
  __label_6: # endif
.annotate 'line', 4945
    eq $S3, $S1, __label_9
# {
.annotate 'line', 4946
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4947
    ne $S1, 'P', __label_10
.annotate 'line', 4948
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 4950
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 4951
    set $S5, $S6
# }
  __label_9: # endif
.annotate 'line', 4953
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
# }
.annotate 'line', 4954

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4888
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
.annotate 'line', 4963
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4964

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 4967
    self.'optimizearg'()
.annotate 'line', 4968
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4969
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4970
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4971
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4972
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4973
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'I'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4974
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4975
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4976
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4979
    $P3 = WSubId_68($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4980
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 4981
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 4982
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_67($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4986
    ne $S1, 'S', __label_8
.annotate 'line', 4987
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 4988
    .return(self)
# }
.annotate 'line', 4989

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4992
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4993
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4994
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4995
    ne $S1, $S2, __label_3
.annotate 'line', 4996
    .return($S1)
  __label_3: # endif
.annotate 'line', 4997
    ne $S1, 'S', __label_4
.annotate 'line', 4998
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 5000
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 5001

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5004
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5005
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5006
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5007
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5008
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 5009
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
.annotate 'line', 5010
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5011
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5012
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 5013
    .return()
# }
  __label_3: # endif
.annotate 'line', 5018
    ne $S1, 'N', __label_7
# {
.annotate 'line', 5019
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 5020
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 5021
# rval: $S5
    null $S5
# switch
.annotate 'line', 5022
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5024
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 5025
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 5026
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5029
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5032
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 5033
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 5035
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 5036
    self.'annotate'(__ARG_1)
.annotate 'line', 5037
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_12: # endif
.annotate 'line', 5039
    .return()
# }
  __label_7: # endif
.annotate 'line', 5042
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 5043
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_15
    $I3 = $P1.'isidentifier'()
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 5044
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 5045
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5048
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 5049
    set $S3, $I1
# }
  __label_14: # endif
.annotate 'line', 5051
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P2.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 5052
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 5053
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_17
  __label_16: # else
# {
# switch
.annotate 'line', 5056
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_21
    set $S7, 'N'
    if $S6 == $S7 goto __label_22
    set $S7, 'I'
    if $S6 == $S7 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 5058
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5059
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 5062
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_23: # case
  __label_20: # default
.annotate 'line', 5066
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5067
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
.annotate 'line', 5068
# }
  __label_17: # endif
.annotate 'line', 5071
    self.'annotate'(__ARG_1)
.annotate 'line', 5072
    set $S6, __ARG_2
    ne $S6, '', __label_24
.annotate 'line', 5073
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_24: # endif
.annotate 'line', 5074
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 5075

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4959
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
.annotate 'line', 5084
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5085

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 5088
    self.'optimizearg'()
.annotate 'line', 5089
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5090
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5091
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 5092
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5093
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5094
# var lval: $P3
    null $P3
.annotate 'line', 5095
# var rval: $P4
    null $P4
.annotate 'line', 5096
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 5097
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5098
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5099
    unless $I2 goto __label_7
.annotate 'line', 5100
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
.annotate 'line', 5103
    $P5 = WSubId_68($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 5104
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5105
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5106
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5107
    getattribute $P5, self, 'owner'
    getattribute $P6, self, 'start'
    div $N3, $N1, $N2
    .tailcall WSubId_67($P5, $P6, $N3)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 5111
    .return(self)
# }
.annotate 'line', 5112

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5115
    .return('N')
# }
.annotate 'line', 5116

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5119
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5120
# var aux: $P2
    null $P2
.annotate 'line', 5121
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5122
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 5123
    $P2 = self.'tempreg'('N')
.annotate 'line', 5124
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5125
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 5127
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5128
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5129
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 5130
    $P2 = self.'tempreg'('N')
.annotate 'line', 5131
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5132
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 5134
    self.'annotate'(__ARG_1)
.annotate 'line', 5135
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 5136

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5080
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
.annotate 'line', 5145
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5146

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5149
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5150
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5151
    self.'annotate'(__ARG_1)
.annotate 'line', 5152
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5153

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5156
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5157

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5141
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
.annotate 'line', 5166
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5167

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5170
    .return('I')
# }
.annotate 'line', 5171

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5174
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5175
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5176
    self.'annotate'(__ARG_1)
.annotate 'line', 5181
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5182

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5162
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
.annotate 'line', 5191
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5192

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5195
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
.annotate 'line', 5196
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5197
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5198
    self.'annotate'(__ARG_1)
.annotate 'line', 5199
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 5200

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5203
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5204

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5187
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
.annotate 'line', 5213
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5214

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5217
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
.annotate 'line', 5218
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5219
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5220
    self.'annotate'(__ARG_1)
.annotate 'line', 5221
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 5222

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5225
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5226

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5209
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5235
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5236

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5239
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 5240
# setname: $S1
    set $S1, ''
.annotate 'line', 5241
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 5242
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5244
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5247
    set $I2, 1
# switch
.annotate 'line', 5248
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
.annotate 'line', 5252
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5253
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5254
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5255
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5258
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 5263
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5266
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5269
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5264
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5267
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5270
    __ARG_1.'print'(' :named')
.annotate 'line', 5271
    eq $S1, '', __label_17
.annotate 'line', 5272
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5273
# }
.annotate 'line', 5275

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5231
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5284
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5285
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 5286

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5289
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5290
    .return(self)
# }
.annotate 'line', 5291

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 5294
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 5295

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5280
    addattribute $P0, 'arg'
.annotate 'line', 5281
    addattribute $P0, 'modifiers'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseArgument' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 5300
# var modifier: $P1
    null $P1
.annotate 'line', 5301
# var expr: $P2
    $P2 = WSubId_41(__ARG_1, __ARG_2)
.annotate 'line', 5302
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5303
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 5304
    $P3 = __ARG_1.'get'()
.annotate 'line', 5305
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 5306
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5309
    WSubId_44('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5312
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5313
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 5314

.end # parseArgument

.namespace [ 'Winxed'; 'Compiler'; 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_69 = "WSubId_69"
# Body
# {
.annotate 'line', 5325
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5326
    setattribute self, 'start', __ARG_2
.annotate 'line', 5327
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5328
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5329
    __ARG_3.'unget'($P1)
.annotate 'line', 5330
    $P3 = WSubId_40(__ARG_3, __ARG_1, WSubId_69, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5332

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5335
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5336
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5337

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5340
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5341

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5344
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5345
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5346

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5349
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5350
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5351

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 5354
    getattribute $P1, self, 'args'
    WSubId_42($P1)
.annotate 'line', 5355
    .return(self)
# }
.annotate 'line', 5356

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5359
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5360
    unless_null $P1, __label_1
# {
.annotate 'line', 5361
    new $P2, ['ResizableStringArray']
.annotate 'line', 5362
# var collect: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 5363
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P4, $P6
# {
.annotate 'line', 5364
# reg: $S1
    getattribute $P8, $P4, 'arg'
    $P7 = $P3.'add'($P8)
    null $S1
    if_null $P7, __label_4
    set $S1, $P7
  __label_4:
.annotate 'line', 5365
# predefined push
    push $P2, $S1
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5367
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5369
    .return($P1)
# }
.annotate 'line', 5370

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5373
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5374
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5376
# sep: $S1
    set $S1, ''
.annotate 'line', 5377
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5378
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5379
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5380
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5381
    if_null $P3, __label_4
.annotate 'line', 5382
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5383
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5378
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5385

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5318
    addattribute $P0, 'owner'
.annotate 'line', 5319
    addattribute $P0, 'start'
.annotate 'line', 5320
    addattribute $P0, 'args'
.annotate 'line', 5321
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_70')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5390
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5391
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5392
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5393
    .return(1)
# }
.annotate 'line', 5394

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5405
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5406
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5407
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5408

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5411
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5412

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5415
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5416
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5417
    new $P3, ['ResizableStringArray']
.annotate 'line', 5418
# var arg: $P4
    null $P4
.annotate 'line', 5419
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5420
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5422
    if_null $P2, __label_6
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5423
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5425
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5426
    ne $S1, '', __label_9
# {
.annotate 'line', 5427
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5428
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5430
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5432
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5436
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5437
    if_null $P2, __label_11
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5438
    getattribute $P6, $P4, 'arg'
# predefined push
    push $P5, $P6
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5439
    getattribute $P8, self, 'predef'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P5)
.annotate 'line', 5440
    .return()
  __label_2: # default
.annotate 'line', 5442
# n: $I1
    getattribute $P11, self, 'args'
    set $I1, $P11
# for loop
.annotate 'line', 5443
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5444
    $P12 = $P2[$I2]
    getattribute $P4, $P12, 'arg'
.annotate 'line', 5445
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5446
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5447
# argr: $S5
    null $S5
.annotate 'line', 5448
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5449
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
.annotate 'line', 5453
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5454
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5457
    ne $S1, '', __label_24
# {
.annotate 'line', 5458
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5459
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5461
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5465
    iseq $I3, $S3, $S4
    if $I3 goto __label_28
    iseq $I3, $S4, '?'
  __label_28:
    if $I3 goto __label_27
.annotate 'line', 5466
    iseq $I3, $S4, 'p'
    unless $I3 goto __label_29
.annotate 'line', 5467
    iseq $I3, $S3, 'S'
    if $I3 goto __label_30
    iseq $I3, $S3, 'P'
  __label_30:
  __label_29:
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5468
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5470
# aux: $S6
    null $S6
.annotate 'line', 5471
    ne $S4, 'p', __label_31
.annotate 'line', 5472
    set $S4, 'P'
  __label_31: # endif
.annotate 'line', 5473
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5474
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
.annotate 'line', 5476
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
.annotate 'line', 5480
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5481
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_38 # break
  __label_39: # default
.annotate 'line', 5484
    $P4.'emit'(__ARG_1, $S5)
  __label_38: # switch end
    goto __label_32 # break
  __label_35: # case
  __label_36: # case
  __label_37: # case
.annotate 'line', 5490
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5491
    __ARG_1.'emitset'($S5, $S6)
    goto __label_32 # break
  __label_33: # default
.annotate 'line', 5494
    $P4.'emit'(__ARG_1, $S5)
  __label_32: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5498
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5443
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5501
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5502

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 5398
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5400
    addattribute $P0, 'predef'
.annotate 'line', 5401
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'gencallbuiltin' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_70 = "WSubId_70"
# Body
# {
.annotate 'line', 5509
# callname: $S1
    $P6 = __ARG_3.'getname'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 5510
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5511
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P6 = __ARG_4.'numargs'()
    set $I1, $P6
  __label_2:
.annotate 'line', 5512
# var rawargs: $P1
    if $I1 goto __label_5
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
    goto __label_4
  __label_5:
    $P7 = __ARG_4.'getrawargs'()
    set $P1, $P7
  __label_4:
.annotate 'line', 5514
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5515
# var predef: $P3
    null $P3
.annotate 'line', 5516
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P4, $P8
# {
.annotate 'line', 5517
# pargs: $I2
    getattribute $P6, $P4, 'nparams'
    set $I2, $P6
.annotate 'line', 5518
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 5519
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 5520
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 5521
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5523
    unless_null $P3, __label_12
.annotate 'line', 5524
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5527
    $P6 = $P3.'iscompileevaluable'()
    if_null $P6, __label_13
    unless $P6 goto __label_13
# {
.annotate 'line', 5528
    $P7 = WSubId_70($P1)
    if_null $P7, __label_14
    unless $P7 goto __label_14
# {
.annotate 'line', 5529
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5530
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    .tailcall $P5($P6, $P7, $P1)
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5534
    new $P7, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    $P7.'CallPredefExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P6, $P7
    .return($P6)
# }
.annotate 'line', 5535

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5544
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5545
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5546
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5547
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5548
    __ARG_1.'unget'($P1)
.annotate 'line', 5549
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5551

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5552
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 5555
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5556
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5557
    if_null $P2, __label_1
.annotate 'line', 5558
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5560
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5564
# var sym: $P3
    null $P3
.annotate 'line', 5565
# var subid: $P4
    null $P4
.annotate 'line', 5566
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5567
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5568
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5569
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5570
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5571
    isnull $I1, $P6
    if $I1 goto __label_7
    set $S1, $P6
    iseq $I1, $S1, ''
  __label_7:
    unless $I1 goto __label_6
# {
.annotate 'line', 5572
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5573
    $P1.'buildkey'($P7)
.annotate 'line', 5574
    $P3 = self.'scopesearch'($P7, 0)
.annotate 'line', 5575
    if_null $P3, __label_8
# {
.annotate 'line', 5576
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_9
# {
.annotate 'line', 5577
    $P9 = $P3.'ismulti'()
    isfalse $I2, $P9
    unless $I2 goto __label_10
# {
.annotate 'line', 5578
    $P4 = $P3.'makesubid'()
.annotate 'line', 5579
    self.'usesubid'($P4)
# }
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 5582
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_11
.annotate 'line', 5583
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_71($P9, $P10, $P3, $P2)
  __label_11: # endif
# }
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 5587
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5589
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_12
.annotate 'line', 5590
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_12: # endif
.annotate 'line', 5593
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_13
    unless $P9 goto __label_13
# {
.annotate 'line', 5594
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_14
# {
.annotate 'line', 5595
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P12 = $P1.'getName'()
    $P11[0] = $P12
    $P8 = self.'scopesearch'($P11, 0)
.annotate 'line', 5596
    isnull $I1, $P8
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
.annotate 'line', 5597
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_71($P9, $P10, $P8, $P2)
  __label_15: # endif
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5601
    setattribute self, 'funref', $P1
.annotate 'line', 5602
    setattribute self, 'args', $P2
.annotate 'line', 5603
    .return(self)
# }
.annotate 'line', 5604

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5607
    .return(1)
# }
.annotate 'line', 5608

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5611
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5612
# call: $S1
    null $S1
.annotate 'line', 5614
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5615
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5616
    ne $S1, '', __label_4
# {
.annotate 'line', 5617
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
# switch-case
.annotate 'line', 5619
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5622
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5625
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5620
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
.annotate 'line', 5623
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5626
    WSubId_6("Builtin unexpeted here", self)
  __label_6: # default
.annotate 'line', 5628
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
.annotate 'line', 5633
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5634
    .return($S1)
# }
.annotate 'line', 5635

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5638
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5639
    if_null $P1, __label_1
.annotate 'line', 5640
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5641

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5644
    __ARG_1.'print'('(')
.annotate 'line', 5645
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5646
    if_null $P1, __label_1
.annotate 'line', 5647
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5648
    __ARG_1.'say'(')')
# }
.annotate 'line', 5649

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5652
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5653
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5655
    self.'annotate'(__ARG_1)
.annotate 'line', 5657
    __ARG_1.'print'('    ')
.annotate 'line', 5658
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5659
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5660
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5662
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5665
    __ARG_1.'print'($S1)
.annotate 'line', 5666
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5667

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5537
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5539
    addattribute $P0, 'funref'
.annotate 'line', 5540
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
.annotate 'line', 5681
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5682
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5683
    setattribute self, 'args', __ARG_3
.annotate 'line', 5684
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5685
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5686

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 5689
    getattribute $P6, self, 'sym'
    if_null $P6, __label_1
# {
.annotate 'line', 5690
    getattribute $P7, self, 'subid'
    if_null $P7, __label_2
.annotate 'line', 5691
    getattribute $P8, self, 'subid'
    .return($P8)
  __label_2: # endif
.annotate 'line', 5692
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5693
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5694
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5696
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5698
# var first: $P3
    getattribute $P3, $P2, 'left'
  __label_5: # while
.annotate 'line', 5699
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_4
.annotate 'line', 5700
    getattribute $P3, $P3, 'left'
    goto __label_5
  __label_4: # endwhile
.annotate 'line', 5701
    $P6 = $P3.'isidentifier'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 5702
# check: $S1
    $P7 = $P3.'checkIdentifier'()
    null $S1
    if_null $P7, __label_7
    set $S1, $P7
  __label_7:
.annotate 'line', 5703
    isnull $I1, $S1
    if $I1 goto __label_9
    iseq $I1, $S1, ''
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 5707
    new $P4, ['ResizableStringArray']
.annotate 'line', 5708
    $P2.'buildkey'($P4)
.annotate 'line', 5709
# fun: $S2
    $P6 = $P4.'pop'()
    null $S2
    if_null $P6, __label_10
    set $S2, $P6
  __label_10:
.annotate 'line', 5710
# var reg: $P5
    $P5 = self.'tempreg'('P')
.annotate 'line', 5711
    self.'annotate'(__ARG_1)
.annotate 'line', 5712
    $P6 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'($P5, $S2, $P6)
.annotate 'line', 5713
    .return($P5)
# }
  __label_8: # endif
# }
  __label_6: # endif
.annotate 'line', 5716
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P2.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
.annotate 'line', 5717
    $P8 = $P2.'get_member'()
.annotate 'line', 5716
    $P6[2] = $P8
    $P6[3] = "'"
# predefined join
    join $S3, "", $P6
    .return($S3)
# }
.annotate 'line', 5718

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5675
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5677
    addattribute $P0, 'sym'
.annotate 'line', 5678
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5728
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5729
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5730
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5731

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5734
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5735
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5736
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5737
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5738
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5741
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5742
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5743
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5744

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5724
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
.annotate 'line', 5754
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5755
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5756

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5759
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5760
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5761
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5762
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5763
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5764
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5765
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5767
    .return($S2)
# }
.annotate 'line', 5768

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5749
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5751
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
.annotate 'line', 5777
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5778
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5779

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5780
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5783
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5784
    .return(self)
# }
.annotate 'line', 5785

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5788
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5789
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5790
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5792
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5793
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5794

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5797
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5798

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5801
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5802
    self.'annotate'(__ARG_1)
.annotate 'line', 5803
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5804

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5807
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5808
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5809
    .return($S1)
# }
.annotate 'line', 5810

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5813
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5814
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5815
    self.'annotate'(__ARG_1)
.annotate 'line', 5816
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5817

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5820
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5821

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5824
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5825
# value: $S2
    null $S2
.annotate 'line', 5826
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5828
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5829
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5830
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5832
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5835
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5836
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5838
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5839

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5842
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5843
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5844
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5845
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5847
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5848
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5849
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5851
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5853
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5854
    .return($S2)
# }
.annotate 'line', 5855

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5771
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5773
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
.annotate 'line', 5866
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5867
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5868

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5869
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5872
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5873
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5874
    .return(self)
# }
.annotate 'line', 5875

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 5878
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5879
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5880
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5881
    WSubId_44("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5882
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5883
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5884
    self.'annotate'(__ARG_1)
.annotate 'line', 5885
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5886
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5887
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5888

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 5891
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5892
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5893
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5894
    WSubId_44("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5895
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5896
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5897
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5898
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5900
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5902
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5903
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5904
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5908
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5909
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5910
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5913
    self.'annotate'(__ARG_1)
.annotate 'line', 5914
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5915
    .return($S3)
# }
.annotate 'line', 5916

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5861
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5863
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
.annotate 'line', 5927
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5928
    setattribute self, 'left', __ARG_3
.annotate 'line', 5929
    setattribute self, 'arg', __ARG_4
# }
.annotate 'line', 5930

.end # StringIndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5933
    .return('S')
# }
.annotate 'line', 5934

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5937
# lreg: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5938
# rreg: $S2
    getattribute $P2, self, 'arg'
    $P1 = $P2.'emit_getint'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5939
    set $S3, __ARG_2
    eq $S3, '', __label_3
# {
.annotate 'line', 5940
    self.'annotate'(__ARG_1)
.annotate 'line', 5941
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $S1, ', ', $S2, ', ', 1)
# }
  __label_3: # endif
# }
.annotate 'line', 5943

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
.annotate 'line', 5921
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5923
    addattribute $P0, 'left'
.annotate 'line', 5924
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
.annotate 'line', 5957
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5958
    setattribute self, 'left', __ARG_4
.annotate 'line', 5959
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5960

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5963
    .return('P')
# }
.annotate 'line', 5964

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5967
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5968
    setattribute self, 'left', $P1
.annotate 'line', 5969
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5970
    $P2.'optimizeargs'()
.annotate 'line', 5972
    $P5 = $P1.'checkresult'()
    set $S2, $P5
    ne $S2, 'S', __label_1
# {
.annotate 'line', 5973
    $P6 = $P2.'numargs'()
    set $I2, $P6
    eq $I2, 1, __label_2
.annotate 'line', 5974
    WSubId_1('Bad string index', self)
  __label_2: # endif
.annotate 'line', 5975
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5978
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_4
    $I2 = $P3.'isintegerliteral'()
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 5979
# ival: $I1
    $P5 = $P3.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5980
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_5
    set $S1, $P5
  __label_5:
.annotate 'line', 5981
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5982
# predefined substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5983
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
.annotate 'line', 5985
    new $P6, [ 'Winxed'; 'Compiler'; 'StringIndexExpr' ]
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'start'
    $P6.'StringIndexExpr'($P7, $P8, $P1, $P3)
    set $P5, $P6
    .return($P5)
# }
  __label_1: # endif
.annotate 'line', 5988
    .return(self)
# }
.annotate 'line', 5989

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5992
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5993
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5994
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5995
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5996
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5997
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 5995
    setattribute self, 'regleft', $P3
.annotate 'line', 5998
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5999

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6002
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 6003
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 6004
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6005
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 6006
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 6007
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 6008
    __ARG_1.'print'(']')
# }
.annotate 'line', 6009

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6012
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6013
    self.'annotate'(__ARG_1)
.annotate 'line', 6014
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 6015
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6016
    __ARG_1.'say'('')
# }
.annotate 'line', 6017

.end # emit


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6020
# result: $S1
    $P1 = self.'tempreg'('I')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6021
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6022
    .return($S1)
# }
.annotate 'line', 6023

.end # emit_getint


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6026
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6027
    self.'annotate'(__ARG_1)
.annotate 'line', 6028
    __ARG_1.'print'('    ')
.annotate 'line', 6029
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6030
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 6031

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6034
    self.'emit_prep'(__ARG_1)
.annotate 'line', 6035
# rreg: $S1
    null $S1
.annotate 'line', 6036
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 6037
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 6038
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 6041
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 6042
    self.'annotate'(__ARG_1)
.annotate 'line', 6043
    __ARG_1.'print'('    ')
.annotate 'line', 6044
    self.'emit_aux'(__ARG_1)
.annotate 'line', 6045
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 6046
    .return($S1)
# }
.annotate 'line', 6047

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5948
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5950
    addattribute $P0, 'left'
.annotate 'line', 5951
    addattribute $P0, 'regleft'
.annotate 'line', 5952
    addattribute $P0, 'args'
.annotate 'line', 5953
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 6058
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6059
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6060
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6061
    __ARG_1.'unget'($P1)
.annotate 'line', 6062
    $P3 = WSubId_40(__ARG_1, __ARG_2, WSubId_41, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6064

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6065
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 6068
    getattribute $P1, self, 'values'
    WSubId_42($P1)
.annotate 'line', 6069
    .return(self)
# }
.annotate 'line', 6070

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6073
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 6074
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 6075
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6081
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 6083

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6086
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6087
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6088
    .return($S1)
# }
.annotate 'line', 6089

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6092
    self.'annotate'(__ARG_1)
.annotate 'line', 6093
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6094
# size: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
.annotate 'line', 6095
    eq __ARG_2, '', __label_3
# {
.annotate 'line', 6096
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6097
    le $I1, 0, __label_4
.annotate 'line', 6098
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 6100
# var collect: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P4, self, 'owner'
    $P2.'CollectValues'($P4, __ARG_1)
.annotate 'line', 6101
# i: $I2
    null $I2
.annotate 'line', 6102
    if_null $P1, __label_6
    iter $P5, $P1
    set $P5, 0
  __label_5: # for iteration
    unless $P5 goto __label_6
    shift $P3, $P5
# {
.annotate 'line', 6103
# valuereg: $S1
    $P4 = $P2.'add'($P3)
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 6104
    eq __ARG_2, '', __label_8
# {
.annotate 'line', 6105
    self.'annotate'(__ARG_1)
.annotate 'line', 6106
    __ARG_1.'say'('    ', __ARG_2, "[", $I2, "] = ", $S1)
.annotate 'line', 6107
    inc $I2
# }
  __label_8: # endif
# }
    goto __label_5
  __label_6: # endfor
# }
.annotate 'line', 6110

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 6052
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6054
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 6122
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6123
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6124
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6125
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6126
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 6127
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6128
# {
.annotate 'line', 6129
# var key: $P4
    $P4 = WSubId_41(__ARG_1, __ARG_2)
.annotate 'line', 6130
    WSubId_58(':', __ARG_1)
.annotate 'line', 6131
# var value: $P5
    $P5 = WSubId_41(__ARG_1, __ARG_2)
.annotate 'line', 6132
# predefined push
    push $P2, $P4
.annotate 'line', 6133
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 6135
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6136
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6137
    WSubId_44("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 6139
    setattribute self, 'keys', $P2
.annotate 'line', 6140
    setattribute self, 'values', $P3
# }
.annotate 'line', 6141

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6142
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 6145
    getattribute $P1, self, 'keys'
    WSubId_42($P1)
.annotate 'line', 6146
    getattribute $P1, self, 'values'
    WSubId_42($P1)
.annotate 'line', 6147
    .return(self)
# }
.annotate 'line', 6148

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6151
    self.'annotate'(__ARG_1)
.annotate 'line', 6156
    set $S4, __ARG_2
    eq $S4, '', __label_1
.annotate 'line', 6157
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6159
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 6160
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 6161
# var collectvalues: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'CollectValues' ]
    getattribute $P5, self, 'owner'
    $P3.'CollectValues'($P5, __ARG_1)
.annotate 'line', 6162
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 6163
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 6164
# var key: $P4
    $P4 = $P1[$I2]
.annotate 'line', 6165
# keyreg: $S1
    null $S1
.annotate 'line', 6166
    $P5 = $P4.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 6167
# id: $S2
    $P6 = $P4.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 6168
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6169
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 6172
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6174
# valuereg: $S3
    $P6 = $P2[$I2]
    $P5 = $P3.'add'($P6)
    null $S3
    if_null $P5, __label_8
    set $S3, $P5
  __label_8:
.annotate 'line', 6175
    set $S4, __ARG_2
    eq $S4, '', __label_9
.annotate 'line', 6176
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_9: # endif
# }
  __label_2: # for iteration
.annotate 'line', 6163
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 6178

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6181
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6182
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6183
    .return($S1)
# }
.annotate 'line', 6184

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6115
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6117
    addattribute $P0, 'keys'
.annotate 'line', 6118
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6197
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6202
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 6203

.end # parseinitializer


.sub 'numargs' :method
# Body
# {
.annotate 'line', 6206
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6207
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
.annotate 'line', 6208

.end # numargs


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 6211
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6212
    if_null $P1, __label_1
.annotate 'line', 6213
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 6214

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6217
    self.'optimize_initializer'()
.annotate 'line', 6218
    .return(self)
# }
.annotate 'line', 6219

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6222
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6223
    if_null $P1, __label_1
.annotate 'line', 6224
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6225
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6226
    if_null $P1, __label_2
.annotate 'line', 6227
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6228
    __ARG_1.'say'(")")
# }
.annotate 'line', 6229

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6189
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6191
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
.annotate 'line', 6240
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6242
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 6243
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6244
    setattribute self, 'value', __ARG_4
.annotate 'line', 6245
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6247
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6248
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6250
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 6251

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6254
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 6255
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 6258
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6259
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_3
    $I1 = $P2.'isconst'()
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 6260
    $P1 = $P2.'getvalue'()
.annotate 'line', 6261
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 6262
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 6263
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 6266
    self.'optimize_initializer'()
.annotate 'line', 6267
    .return(self)
# }
.annotate 'line', 6268

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6271
    self.'annotate'(__ARG_1)
.annotate 'line', 6273
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6274
# var value: $P2
    getattribute $P2, self, 'value'
.annotate 'line', 6275
# numinits: $I1
    $P8 = self.'numargs'()
    set $I1, $P8
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 6278
# type: $I2
    $P8 = $P2.'isstring'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6279
    $P9 = $P2.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6281
# reginit: $S1
    set $S1, ''
.annotate 'line', 6282
# regnew: $S2
    set $P8, __ARG_2
    null $S2
    if_null $P8, __label_5
    set $S2, $P8
  __label_5:
.annotate 'line', 6283
# constructor: $S3
    null $S3
# switch
.annotate 'line', 6284
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
.annotate 'line', 6289
    ne $I2, 1, __label_11
# {
.annotate 'line', 6290
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 6291
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 6294
# var initval: $P3
    $P3 = $P1.'getfreearg'(0)
.annotate 'line', 6295
    $P8 = $P3.'emit_get'(__ARG_1)
    set $S1, $P8
.annotate 'line', 6296
    concat $S5, ', ', $S1
    set $S1, $S5
# }
  __label_12: # endif
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 6300
    eq $I2, 1, __label_14
.annotate 'line', 6301
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_14: # endif
.annotate 'line', 6302
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 6303
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_15: # endif
  __label_6: # switch end
.annotate 'line', 6306
    ne $S2, '', __label_16
.annotate 'line', 6307
    $P8 = self.'tempreg'('P')
    set $S2, $P8
  __label_16: # endif
# switch
.annotate 'line', 6309
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
  __label_19: # case
.annotate 'line', 6312
# name: $S4
    $P8 = $P2.'rawstring'()
    null $S4
    if_null $P8, __label_21
    set $S4, $P8
  __label_21:
.annotate 'line', 6313
# var aux: $P4
# predefined get_class
    get_class $P4, $S4
.annotate 'line', 6314
    isnull $I5, $P4
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
  __label_23:
    unless $I5 goto __label_22
.annotate 'line', 6315
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    WSubId_72($S5, $P2)
  __label_22: # endif
.annotate 'line', 6319
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P2, " ]", $S1)
.annotate 'line', 6320
    le $I1, 1, __label_24
# {
.annotate 'line', 6321
    __ARG_1.'say'($S2, ".'", $P2, "'()")
# }
  __label_24: # endif
    goto __label_17 # break
  __label_20: # case
.annotate 'line', 6325
# var id: $P5
    getattribute $P8, self, 'owner'
    $P5 = $P8.'getvar'($P2)
.annotate 'line', 6326
    unless_null $P5, __label_25
# {
.annotate 'line', 6327
# var cl: $P6
    getattribute $P9, self, 'owner'
    $P6 = $P9.'checkclass'($P2)
.annotate 'line', 6328
    if_null $P6, __label_27
# {
.annotate 'line', 6329
# var key: $P7
    $P7 = $P6.'getpath'()
.annotate 'line', 6330
    $P7.'emit_new'(__ARG_1, self, $S2, $S1)
# }
    goto __label_28
  __label_27: # else
# {
.annotate 'line', 6333
    root_new $P8, ['parrot';'ResizablePMCArray']
    assign $P8, 1
    $P8[0] = $P2
    $P5 = self.'scopesearch'($P8, 2)
.annotate 'line', 6334
    if_null $P5, __label_29
.annotate 'line', 6335
    $P8 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, $S1)
    goto __label_30
  __label_29: # else
# {
.annotate 'line', 6337
    $P9 = self.'dowarnings'()
    if_null $P9, __label_31
    unless $P9 goto __label_31
.annotate 'line', 6338
    WSubId_72('Checking: new unknown type')
  __label_31: # endif
.annotate 'line', 6339
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P2, "']", $S1)
# }
  __label_30: # endif
# }
  __label_28: # endif
.annotate 'line', 6342
    set $S3, $P2
# }
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 6346
    $P8 = $P5.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P8, "", $S1)
# }
  __label_26: # endif
    goto __label_17 # break
  __label_18: # default
.annotate 'line', 6350
    WSubId_6('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 6352
    isgt $I3, $I1, 1
    if $I3 goto __label_33
    isge $I3, $I1, 0
    unless $I3 goto __label_34
    iseq $I3, $I2, 1
  __label_34:
  __label_33:
    unless $I3 goto __label_32
# {
.annotate 'line', 6353
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6354
    not $I3, __ARG_3
    unless $I3 goto __label_36
    set $S5, __ARG_2
    isne $I3, $S5, ''
  __label_36:
    unless $I3 goto __label_35
.annotate 'line', 6355
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_35: # endif
# }
  __label_32: # endif
# }
.annotate 'line', 6357

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6360
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6361

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6234
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6236
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6372
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6373
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6374
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6375
    setattribute self, 'nskey', $P1
.annotate 'line', 6376
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6377
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6378
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6380
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6381

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6384
# reginit: $S1
    null $S1
# switch
.annotate 'line', 6385
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
.annotate 'line', 6390
# var initval: $P1
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6391
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6394
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_1: # switch end
.annotate 'line', 6396
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6398
    set $S2, __ARG_2
    ne $S2, '', __label_6
.annotate 'line', 6399
    __ARG_2 = self.'tempreg'('P')
  __label_6: # endif
.annotate 'line', 6401
    __ARG_1.'print'('    ')
.annotate 'line', 6402
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 6403
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6404
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6405
    null $P3
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6406
    if_null $S1, __label_8
.annotate 'line', 6407
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6408
    __ARG_1.'say'()
# }
.annotate 'line', 6409

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6366
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6368
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6420
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6421
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6422
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6423
    setattribute self, 'nskey', $P1
.annotate 'line', 6424
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6425
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6426
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6428
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6429

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6432
# numinits: $I1
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6433
# regnew: $S1
    set $P2, __ARG_2
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 6434
    le $I1, 0, __label_2
.annotate 'line', 6435
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6436
# var nskey: $P1
    getattribute $P1, self, 'nskey'
.annotate 'line', 6438
    ne $S1, '', __label_3
.annotate 'line', 6439
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_3: # endif
.annotate 'line', 6441
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 6443
    lt $I1, 0, __label_4
# {
.annotate 'line', 6444
# constructor: $S2
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 6445
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6446
    set $S3, __ARG_2
    eq $S3, '', __label_6
.annotate 'line', 6447
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_6: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 6449

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6414
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6416
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6456
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6459
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6463
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6466
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6461
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6462
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6461
    .return($P3)
  __label_4: # case
.annotate 'line', 6465
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6469
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6470
    __ARG_1.'unget'($P2)
.annotate 'line', 6471
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6473
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6478
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6480

.end # parseNew

.namespace [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_66 = "WSubId_66"
# Body
# {
.annotate 'line', 6491
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6492
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6493
    $P2 = WSubId_66(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6494

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6497
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6498
    .return(self)
# }
.annotate 'line', 6499

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6500
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6503
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6504
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6505
    eq $S1, 'P', __label_2
.annotate 'line', 6506
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6507
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6509
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
.annotate 'line', 6510
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6511
    self.'annotate'(__ARG_1)
.annotate 'line', 6512
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6513
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6514
    __ARG_1.'say'()
# }
.annotate 'line', 6515

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6484
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6486
    addattribute $P0, 'lexpr'
.annotate 'line', 6487
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
.annotate 'line', 6528
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6529
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6530
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6531
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6532
    .return(self)
# }
.annotate 'line', 6533

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6536
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6537
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6539
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6541
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6543
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6544
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6545
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6547

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6550
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6551
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6552
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6554
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6555

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6558
# cond_end: $S1
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 6559
# cond_false: $S2
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 6560
    getattribute $P4, self, 'condition'
    $P4.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6561
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6562
# tres: $S3
    $P4 = self.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
.annotate 'line', 6563
    $P4 = $P1.'isnull'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6564
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6566
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6567
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6568
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6569
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6570
    $P4 = $P2.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 6571
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6573
# tfalse: $S4
    $P5 = $P2.'checkresult'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
  __label_8:
.annotate 'line', 6574
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6575
# r: $S5
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 6576
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 6580
    ne $S4, 'P', __label_13
# {
.annotate 'line', 6581
# var aux: $P3
    $P3 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 6582
    __ARG_1.'emitset'(__ARG_2, $P3)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 6585
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
# }
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6588
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6589

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6520
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6522
    addattribute $P0, 'condition'
.annotate 'line', 6523
    addattribute $P0, 'etrue'
.annotate 'line', 6524
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

.sub 'getOpCode_2' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6634
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
.annotate 'line', 6635
    .return(1)
  __label_4: # case
.annotate 'line', 6636
    .return(2)
  __label_5: # case
.annotate 'line', 6637
    .return(3)
  __label_2: # default
.annotate 'line', 6638
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6640

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_77')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6644
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
.annotate 'line', 6645
    .return(8)
  __label_4: # case
.annotate 'line', 6646
    .return(11)
  __label_5: # case
.annotate 'line', 6647
    .return(33)
  __label_6: # case
.annotate 'line', 6648
    .return(9)
  __label_7: # case
.annotate 'line', 6649
    .return(10)
  __label_2: # default
.annotate 'line', 6651
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_8
    unless $P2 goto __label_8
    .return(31)
    goto __label_9
  __label_8: # else
.annotate 'line', 6652
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_10
    unless $P3 goto __label_10
    .return(32)
    goto __label_11
  __label_10: # else
.annotate 'line', 6653
    .return(0)
  __label_11: # endif
  __label_9: # endif
  __label_1: # switch end
# }
.annotate 'line', 6655

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6659
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
.annotate 'line', 6660
    .return(19)
  __label_4: # case
.annotate 'line', 6661
    .return(20)
  __label_5: # case
.annotate 'line', 6662
    .return(21)
  __label_6: # case
.annotate 'line', 6663
    .return(22)
  __label_2: # default
.annotate 'line', 6664
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6666

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_83')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6670
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6671
    .return(28)
  __label_4: # case
.annotate 'line', 6672
    .return(29)
  __label_2: # default
.annotate 'line', 6673
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6675

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_85')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6679
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
.annotate 'line', 6680
    .return(14)
  __label_4: # case
.annotate 'line', 6681
    .return(16)
  __label_5: # case
.annotate 'line', 6682
    .return(15)
  __label_6: # case
.annotate 'line', 6683
    .return(17)
  __label_2: # default
.annotate 'line', 6685
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6686
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6688

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_87')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6692
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
.annotate 'line', 6693
    .return(12)
  __label_4: # case
.annotate 'line', 6694
    .return(13)
  __label_5: # case
.annotate 'line', 6695
    .return(25)
  __label_6: # case
.annotate 'line', 6696
    .return(26)
  __label_2: # default
.annotate 'line', 6697
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6699

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_96')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6703
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
.annotate 'line', 6704
    .return(4)
  __label_4: # case
.annotate 'line', 6705
    .return(5)
  __label_5: # case
.annotate 'line', 6706
    .return(6)
  __label_6: # case
.annotate 'line', 6707
    .return(18)
  __label_7: # case
.annotate 'line', 6708
    .return(23)
  __label_8: # case
.annotate 'line', 6709
    .return(24)
  __label_9: # case
.annotate 'line', 6710
    .return(30)
  __label_2: # default
.annotate 'line', 6711
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6713

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_73 = "WSubId_73"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 6717
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6718
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6721
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6725
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6727
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6729
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6731
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6733
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6735
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6737
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6739
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6741
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 6743
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 6722
    $P2 = WSubId_41(__ARG_1, __ARG_2)
.annotate 'line', 6723
    WSubId_58(')', __ARG_1)
.annotate 'line', 6724
    .return($P2)
  __label_4: # case
.annotate 'line', 6726
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6728
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6730
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6732
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6734
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6736
    .tailcall WSubId_73(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6738
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6740
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6742
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 6744
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 6746
    WSubId_44('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6748

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6752
# var subexp: $P1
    $P1 = WSubId_74(__ARG_1, __ARG_2)
.annotate 'line', 6753
# var t: $P2
    null $P2
.annotate 'line', 6754
# var start: $P3
    null $P3
.annotate 'line', 6755
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6756
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_75($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6757
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6759
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6762
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6765
    set $P3, $P2
.annotate 'line', 6766
    $P2 = __ARG_1.'get'()
.annotate 'line', 6767
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6768
# var right: $P4
    $P4 = WSubId_74(__ARG_1, __ARG_2)
.annotate 'line', 6769
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6772
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6775
    WSubId_6('Unexpected code in parseExpr_2')
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

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 6784
# var subexp: $P1
    $P1 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6785
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6787
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6789
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6788
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6790
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6792
    __ARG_1.'unget'($P2)
.annotate 'line', 6793
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6795

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_78')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_77 = "WSubId_77"
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_6 = "WSubId_6"
.const 'Sub' WSubId_79 = "WSubId_79"
# Body
# {
.annotate 'line', 6799
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6800
# code: $I1
    $P3 = WSubId_77($P1)
    set $I1, $P3
.annotate 'line', 6801
    unless $I1 goto __label_1
# {
.annotate 'line', 6802
# var subexpr: $P2
    $P2 = WSubId_78(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6803
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
.annotate 'line', 6805
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6807
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6809
    new $P8, [ 'Winxed'; 'Compiler'; 'OpBinNotExpr' ]
    $P8.'OpBinNotExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6811
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P10.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6813
    new $P12, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P12.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6815
    new $P14, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P14.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_11: # case
.annotate 'line', 6817
    new $P16, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P16.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P15, $P16
    .return($P15)
  __label_4: # default
.annotate 'line', 6819
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6823
    __ARG_1.'unget'($P1)
.annotate 'line', 6824
    .tailcall WSubId_79(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6826

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6830
# var lexpr: $P1
    $P1 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6831
# var t: $P2
    null $P2
.annotate 'line', 6832
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6833
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_80($P2)
    set $I1, $P4
    unless $I1 goto __label_1
# {
.annotate 'line', 6834
# var rexpr: $P3
    $P3 = WSubId_78(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6835
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
.annotate 'line', 6837
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6840
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6843
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6846
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6849
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6852
    __ARG_1.'unget'($P2)
.annotate 'line', 6853
    .return($P1)
# }
.annotate 'line', 6854

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
# Body
# {
.annotate 'line', 6858
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6859
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6860
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6861
# var rexpr: $P3
    $P3 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6862
# var expr: $P4
    null $P4
.annotate 'line', 6863
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6864
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6866
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6867
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6869
    __ARG_1.'unget'($P2)
.annotate 'line', 6870
    .return($P1)
# }
.annotate 'line', 6871

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6875
# var lexpr: $P1
    $P1 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6876
# var rexpr: $P2
    null $P2
.annotate 'line', 6877
# var t: $P3
    null $P3
.annotate 'line', 6878
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6879
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_83($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6880
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6882
    $P2 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6883
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6886
    $P2 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6887
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6890
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6893
    __ARG_1.'unget'($P3)
.annotate 'line', 6894
    .return($P1)
# }
.annotate 'line', 6895

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6899
# var lexpr: $P1
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6900
# var rexpr: $P2
    null $P2
.annotate 'line', 6901
# var t: $P3
    null $P3
.annotate 'line', 6902
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6903
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_85($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6904
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
.annotate 'line', 6906
    $P2 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6907
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6910
    $P2 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6911
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6914
    $P2 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6915
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6918
    $P2 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6919
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6922
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6925
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6928
    __ARG_1.'unget'($P3)
.annotate 'line', 6929
    .return($P1)
# }
.annotate 'line', 6930

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6934
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6935
# var rexpr: $P2
    null $P2
.annotate 'line', 6936
# var t: $P3
    null $P3
.annotate 'line', 6937
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6938
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_87($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6939
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
.annotate 'line', 6941
    $P2 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6942
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6945
    $P2 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6946
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6949
    $P2 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6950
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6953
    $P2 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6954
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6957
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6960
    __ARG_1.'unget'($P3)
.annotate 'line', 6961
    .return($P1)
# }
.annotate 'line', 6962

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
# Body
# {
.annotate 'line', 6966
# var lexpr: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6967
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6968
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6969
# var rexpr: $P3
    $P3 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6970
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6972
    __ARG_1.'unget'($P2)
.annotate 'line', 6973
    .return($P1)
# }
.annotate 'line', 6974

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6978
# var lexpr: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6979
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6980
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6981
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6982
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6984
    __ARG_1.'unget'($P2)
.annotate 'line', 6985
    .return($P1)
# }
.annotate 'line', 6986

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
# Body
# {
.annotate 'line', 6990
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6991
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6992
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6993
# var rexpr: $P3
    $P3 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6994
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6996
    __ARG_1.'unget'($P2)
.annotate 'line', 6997
    .return($P1)
# }
.annotate 'line', 6998

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
# Body
# {
.annotate 'line', 7002
# var lexpr: $P1
    $P1 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7003
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7004
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7005
# var rexpr: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7006
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7008
    __ARG_1.'unget'($P2)
.annotate 'line', 7009
    .return($P1)
# }
.annotate 'line', 7010

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_91 = "WSubId_91"
# Body
# {
.annotate 'line', 7014
# var lexpr: $P1
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 7015
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 7016
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7017
# var rexpr: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 7018
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7020
    __ARG_1.'unget'($P2)
.annotate 'line', 7021
    .return($P1)
# }
.annotate 'line', 7022

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 7026
# var econd: $P1
    $P1 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 7027
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 7028
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 7029
# var etrue: $P3
    $P3 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 7030
    WSubId_58(':', __ARG_1)
.annotate 'line', 7031
# var efalse: $P4
    $P4 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 7032
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7035
    __ARG_1.'unget'($P2)
.annotate 'line', 7036
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7038

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_94')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_95 = "WSubId_95"
.const 'Sub' WSubId_96 = "WSubId_96"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7042
# var lexpr: $P1
    $P1 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 7043
# var t: $P2
    null $P2
.annotate 'line', 7044
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 7045
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_96($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
.annotate 'line', 7046
# var rexpr: $P3
    $P3 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 7047
# var expr: $P4
    null $P4
# switch
.annotate 'line', 7048
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
.annotate 'line', 7050
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7053
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7056
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7059
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7062
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 7065
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 7068
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7071
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 7073
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7074
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7076
    __ARG_1.'unget'($P2)
.annotate 'line', 7077
    .return($P1)
# }
.annotate 'line', 7078

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 7082
    .tailcall WSubId_94(__ARG_1, __ARG_2)
# }
.annotate 'line', 7083

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7098
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7099
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7100
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7101
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7102
    .return($S1)
# }
.annotate 'line', 7103

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7106
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7107
    unless_null $P1, __label_1
.annotate 'line', 7108
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7109
    .return($P1)
# }
.annotate 'line', 7110

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7094
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7119
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7120
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7121
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7122
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7123
    .return($S1)
# }
.annotate 'line', 7124

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7127
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7128
    unless_null $P1, __label_1
.annotate 'line', 7129
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7130
    .return($P1)
# }
.annotate 'line', 7131

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7113
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7115
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7147
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7148
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7149
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7150
    __ARG_2.'unget'($P1)
.annotate 'line', 7151
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 7153

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7156
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7157
    if_null $P1, __label_1
.annotate 'line', 7158
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7159
    .return(self)
# }
.annotate 'line', 7160

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7164
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7165
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7168
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 7169
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7170
    $I2 = $P2.'cantailcall'()
    unless $I2 goto __label_6
    getattribute $P3, self, 'owner'
    $I2 = $P3.'allowtailcall'()
  __label_6:
    unless $I2 goto __label_5
# {
.annotate 'line', 7171
    self.'annotate'(__ARG_1)
.annotate 'line', 7172
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 7176
    le $I1, 0, __label_7
.annotate 'line', 7177
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7179
    self.'annotate'(__ARG_1)
.annotate 'line', 7180
    self.'emitret'(__ARG_1)
.annotate 'line', 7181
    le $I1, 0, __label_8
.annotate 'line', 7182
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 7183
    __ARG_1.'say'(')')
# }
.annotate 'line', 7184

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7141
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7143
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7191
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7192

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7195
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 7196

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7187
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
.annotate 'line', 7203
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7204

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7207
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 7208

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7199
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7221
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7222
    setattribute self, 'name', __ARG_1
.annotate 'line', 7223
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 7224

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7225
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7228
    self.'annotate'(__ARG_1)
.annotate 'line', 7229
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 7230

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7215
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7217
    addattribute $P0, 'name'
.annotate 'line', 7218
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7244
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7245
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 7246

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7247
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7250
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7251
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7252
    .return($S2)
# }
.annotate 'line', 7253

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7239
    addattribute $P0, 'owner'
.annotate 'line', 7240
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 7266
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7267
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7268
    WSubId_97($P1)
.annotate 'line', 7269
    setattribute self, 'label', $P1
.annotate 'line', 7270
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 7271

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7272
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7275
    self.'annotate'(__ARG_1)
.annotate 'line', 7276
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7277
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7278
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 7279

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7260
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7262
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7290
    $P1 = WSubId_41(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 7291

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7294
    WSubId_58('(', __ARG_1)
.annotate 'line', 7295
    $P1 = WSubId_41(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7296
    WSubId_58(')', __ARG_1)
# }
.annotate 'line', 7297

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7286
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
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 7310
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7311
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7312
    $P3 = WSubId_98(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7313
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7314
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7315
    $P4 = WSubId_98(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7317
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7318
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7320

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7323
    self.'optimize_condition'()
.annotate 'line', 7324
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7325
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 7326
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7328
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7330
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7332
    .return(self)
# }
.annotate 'line', 7333

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7336
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7337
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7338
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7339
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7340
# elselabel: $S1
    set $S1, ''
.annotate 'line', 7341
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7342
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7343
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7344
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7345
    self.'annotate'(__ARG_1)
.annotate 'line', 7346
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7347
    $P1.'emit'(__ARG_1)
.annotate 'line', 7349
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7350
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7351
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7352
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7354
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7355

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7304
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7306
    addattribute $P0, 'truebranch'
.annotate 'line', 7307
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 7367
    $P2 = WSubId_98(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7368

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7371
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7372
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7374
    self.'annotate'(__ARG_1)
.annotate 'line', 7375
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7376
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7377
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7378
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7379

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7362
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7364
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7390
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7391
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7392
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7393

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7396
    self.'optimize_condition'()
.annotate 'line', 7397
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7398
    .return(self)
# }
.annotate 'line', 7399

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7402
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7404
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7407
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7410
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7411
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7413
    self.'annotate'(__ARG_1)
.annotate 'line', 7414
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7415
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7416
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7417
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7418
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7420

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7386
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
.const 'Sub' WSubId_99 = "WSubId_99"
# Body
# {
.annotate 'line', 7431
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7432
    self.'parsebody'(__ARG_2)
.annotate 'line', 7433
    WSubId_99('while', __ARG_2)
.annotate 'line', 7434
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7435

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7438
    self.'optimize_condition'()
.annotate 'line', 7439
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7440
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7441
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7442
    setattribute self, 'body', $P1
.annotate 'line', 7443
    .return(self)
# }
.annotate 'line', 7444

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7447
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7448
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7449
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7451
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7454
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7455
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7456
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7458
    self.'annotate'(__ARG_1)
.annotate 'line', 7459
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7461
    $P1.'emit'(__ARG_1)
.annotate 'line', 7462
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7463
    eq $I1, 2, __label_7
.annotate 'line', 7464
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7465
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7467

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7427
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
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 7478
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7479
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 7480

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7481
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7484
    self.'annotate'(__ARG_1)
.annotate 'line', 7485
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7486
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7487

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7474
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 7498
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7499
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 7500

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7501
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7504
    self.'annotate'(__ARG_1)
.annotate 'line', 7505
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7506
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7507

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7494
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7522
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7523
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7524
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7525
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7526

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 7529
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7530
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7531
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7532
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_41(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7533
    $P1 = __ARG_1.'get'()
.annotate 'line', 7534
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7535
    WSubId_44("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7536
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7537
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
.annotate 'line', 7538
    __ARG_1.'unget'($P1)
.annotate 'line', 7539
    $P3 = WSubId_98(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7541
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7542
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7545
    $P1 = __ARG_1.'get'()
.annotate 'line', 7546
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7547
    WSubId_44("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7548
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
.annotate 'line', 7549
    __ARG_1.'unget'($P1)
.annotate 'line', 7550
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_98(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7552
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7555
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7556
    WSubId_44("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7557

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7560
    getattribute $P2, self, 'case_value'
    WSubId_42($P2)
.annotate 'line', 7561
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7562
    WSubId_42($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7563
    getattribute $P2, self, 'default_st'
    WSubId_42($P2)
# }
.annotate 'line', 7564

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7514
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7516
    addattribute $P0, 'case_value'
.annotate 'line', 7517
    addattribute $P0, 'case_st'
.annotate 'line', 7518
    addattribute $P0, 'default_st'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 7577
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7578
    $P3 = WSubId_41(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7579
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7580
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7581
    WSubId_44("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7582
    $P1 = __ARG_2.'get'()
.annotate 'line', 7583
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7584
    WSubId_44("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7585
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7586

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7589
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7590
    self.'optimize_cases'()
.annotate 'line', 7591
    .return(self)
# }
.annotate 'line', 7592

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 7596
# type: $S1
    set $S1, ''
.annotate 'line', 7597
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7598
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7599
    ne $S2, 'N', __label_4
.annotate 'line', 7600
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7601
    ne $S1, '', __label_5
.annotate 'line', 7602
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7603
    eq $S1, $S2, __label_7
.annotate 'line', 7604
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7607
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7608
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7612
    ne $S1, '', __label_8
.annotate 'line', 7613
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7615
    __ARG_1.'comment'('switch')
.annotate 'line', 7616
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7617
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7618
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7620
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7621
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7625
    self.'genbreaklabel'()
.annotate 'line', 7626
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7627
    new $P4, ['ResizableStringArray']
.annotate 'line', 7628
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7629
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7630
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7631
# predefined push
    push $P4, $S7
.annotate 'line', 7632
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7633
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7635
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7638
    self.'annotate'(__ARG_1)
.annotate 'line', 7639
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7640
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7641
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7642
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7643
    $P7 = $P6[$I2]
    WSubId_56(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7641
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7646
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7647
    getattribute $P7, self, 'default_st'
    WSubId_56(__ARG_1, $P7)
.annotate 'line', 7649
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7650

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7571
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7573
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7662
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7663
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7664

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7667
    self.'optimize_cases'()
.annotate 'line', 7668
    .return(self)
# }
.annotate 'line', 7669

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 7673
    self.'genbreaklabel'()
.annotate 'line', 7674
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7675
    new $P1, ['ResizableStringArray']
.annotate 'line', 7677
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7678
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7679
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7680
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7681
# predefined push
    push $P1, $S3
.annotate 'line', 7682
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7683
    __ARG_1.'emitif'($S2, $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7685
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7688
    self.'annotate'(__ARG_1)
.annotate 'line', 7689
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7690
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7691
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7692
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7693
    $P4 = $P3[$I2]
    WSubId_56(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7691
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7696
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7697
    getattribute $P4, self, 'default_st'
    WSubId_56(__ARG_1, $P4)
.annotate 'line', 7699
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7700

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7657
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSwitch' :subid('WSubId_54')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 7707
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7708
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7709
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7710
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7711
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7712
    WSubId_44("'(' in switch", $P1)
# }
.annotate 'line', 7713

.end # parseSwitch

.namespace [ 'Winxed'; 'Compiler'; 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7726
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7727
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7728
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7729
    __ARG_2.'unget'($P1)
.annotate 'line', 7730
    $P3 = WSubId_98(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7732
    $P1 = __ARG_2.'get'()
.annotate 'line', 7733
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7734
    __ARG_2.'unget'($P1)
.annotate 'line', 7735
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7736
    WSubId_58(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7738
    $P1 = __ARG_2.'get'()
.annotate 'line', 7739
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7740
    __ARG_2.'unget'($P1)
.annotate 'line', 7741
    $P3 = WSubId_41(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7742
    WSubId_58(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7744
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7745

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7748
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7749
    if_null $P1, __label_1
.annotate 'line', 7750
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7751
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7752
    self.'optimize_condition'()
.annotate 'line', 7753
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7754
    if_null $P1, __label_4
.annotate 'line', 7755
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7757
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7760
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7761
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7762
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7763
    .return(self)
# }
.annotate 'line', 7764

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7767
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7768
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7769
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7770
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7771
    .return()
# }
  __label_1: # endif
.annotate 'line', 7773
    __ARG_1.'comment'('for loop')
.annotate 'line', 7774
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7775
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7776
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7777
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7778
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7780
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7781
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7782
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7784
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7785
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7786
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7787
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7788
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7790
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7791

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7719
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7721
    addattribute $P0, 'initializer'
.annotate 'line', 7722
    addattribute $P0, 'iteration'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 7806
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7807
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7808
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7809
# deftype: $S2
    $P1 = WSubId_100(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7810
    self.'createvar'($S1, $S2)
.annotate 'line', 7811
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7813
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7814
    $P2 = WSubId_41(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7815
    WSubId_58(')', __ARG_2)
.annotate 'line', 7816
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7817

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7820
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7824
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7825
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7826
    $P2 = $P1.'get_value'()
    set $S1, $P2
# predefined length
    length $I2, $S1
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7827
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7829
    setattribute self, 'container', $P1
.annotate 'line', 7830
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7831
    .return(self)
# }
.annotate 'line', 7832

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 7835
    self.'annotate'(__ARG_1)
.annotate 'line', 7836
# regcont: $S1
    null $S1
.annotate 'line', 7837
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7838
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7839
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7840
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7843
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7845
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7846
    unless_null $P1, __label_4
.annotate 'line', 7847
    getattribute $P2, self, 'varname'
    WSubId_65($P2)
  __label_4: # endif
.annotate 'line', 7849
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7850
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7851
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7852
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7853
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7854
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7855
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7856
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7857
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7858
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7859
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7860
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7861

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7798
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7800
    addattribute $P0, 'deftype'
.annotate 'line', 7801
    addattribute $P0, 'varname'
.annotate 'line', 7802
    addattribute $P0, 'container'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseFor' :subid('WSubId_55')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 7868
    WSubId_58('(', __ARG_2)
.annotate 'line', 7869
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7870
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7871
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7872
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7874
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7875
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7876
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7877
    __ARG_2.'unget'($P3)
.annotate 'line', 7878
    __ARG_2.'unget'($P2)
.annotate 'line', 7879
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7881
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7882

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7894
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7895
    $P2 = WSubId_41(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7896

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7899
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7900
    .return(self)
# }
.annotate 'line', 7901

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7904
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7905
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7906
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7907
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7909
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7912
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7915
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7917

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7888
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7890
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7929
    setattribute self, 'start', __ARG_1
.annotate 'line', 7930
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7931

.end # TryModifierList


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 7934
    $P1 = self.'pick'('allowtailcall')
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 7935

.end # allowtailcall


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7938
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7939
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7940
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7941
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7942
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
.annotate 'line', 7945
    eq $I1, 1, __label_11
.annotate 'line', 7946
    WSubId_1('Wrong modifier args', self)
  __label_11: # endif
.annotate 'line', 7947
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7948
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_12
    set $S2, $P7
  __label_12:
.annotate 'line', 7949
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7953
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7954
# i: $I2
    null $I2
  __label_15: # for condition
    ge $I2, $I1, __label_14
# {
.annotate 'line', 7955
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7956
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_13: # for iteration
.annotate 'line', 7954
    inc $I2
    goto __label_15
  __label_14: # for end
.annotate 'line', 7959
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7958
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_10: # case
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7964
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    WSubId_1($S4, $P7)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7967

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7924
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7926
    addattribute $P0, 'start'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_2 = "WSubId_2"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 7979
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7980
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7981
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7982
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7984
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7986
    $P3 = WSubId_98(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7987
    $P1 = __ARG_2.'get'()
.annotate 'line', 7988
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7989
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7990
    $P1 = __ARG_2.'get'()
.annotate 'line', 7991
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7992
    WSubId_44("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7993
    $P1 = __ARG_2.'get'()
.annotate 'line', 7994
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7995
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7996
    setattribute self, 'exname', $P1
.annotate 'line', 7997
    self.'createvar'($S1, 'P')
.annotate 'line', 7998
    $P1 = __ARG_2.'get'()
.annotate 'line', 7999
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 8000
    WSubId_44("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 8002
    $P3 = WSubId_98(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 8003

.end # TryStatement


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8006
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8007
    getattribute $P2, self, 'modifiers'
    .tailcall $P2.'allowtailcall'()
    goto __label_2
  __label_1: # else
.annotate 'line', 8009
    .return(0)
  __label_2: # endif
# }
.annotate 'line', 8010

.end # allowtailcall


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8013
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 8014
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 8015
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 8016
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 8017
    .return(self)
# }
.annotate 'line', 8018

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8021
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8022
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8023
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 8024
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 8025
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 8026
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 8028
    self.'annotate'(__ARG_1)
.annotate 'line', 8029
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 8031
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 8032
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 8034
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 8035
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 8037
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 8038
    __ARG_1.'comment'('try: begin')
.annotate 'line', 8039
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8040
    __ARG_1.'comment'('try: end')
.annotate 'line', 8041
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8043
    self.'annotate'(__ARG_1)
.annotate 'line', 8044
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 8046
    __ARG_1.'comment'('catch')
.annotate 'line', 8047
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 8048
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 8049
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 8050
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 8051
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 8053
    __ARG_1.'comment'('catch end')
.annotate 'line', 8054
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 8055

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7970
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7972
    addattribute $P0, 'stry'
.annotate 'line', 7973
    addattribute $P0, 'modifiers'
.annotate 'line', 7974
    addattribute $P0, 'exname'
.annotate 'line', 7975
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
.annotate 'line', 8068
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8069
    setattribute self, 'name', __ARG_3
.annotate 'line', 8070
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 8071
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8072

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 8062
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8064
    addattribute $P0, 'name'
.annotate 'line', 8065
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
.annotate 'line', 8087
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8088
    setattribute self, 'name', __ARG_3
.annotate 'line', 8089
    box $P2, __ARG_4
    setattribute self, 'basetype', $P2
.annotate 'line', 8090
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, __ARG_5)
.annotate 'line', 8091
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8092

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 8079
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8081
    addattribute $P0, 'name'
.annotate 'line', 8082
    addattribute $P0, 'basetype'
.annotate 'line', 8083
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 8103
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_4)
.annotate 'line', 8104
# var t: $P1
    $P1 = __ARG_5.'get'()
.annotate 'line', 8105
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8107
    $P4 = WSubId_41(__ARG_5, self)
    setattribute self, 'init', $P4
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8110
    __ARG_5.'unget'($P1)
  __label_2: # endif
# }
.annotate 'line', 8111

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8114
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8115
    if_null $P1, __label_1
.annotate 'line', 8116
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8117
    .return(self)
# }
.annotate 'line', 8118

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8121
    self.'annotate'(__ARG_1)
.annotate 'line', 8122
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8123
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8124
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 8125
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8126
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 8128
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 8129
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8131
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 8132
    ne $S4, $S3, __label_8
.annotate 'line', 8133
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8135
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 8137
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 8140
# ireg: $S5
    null $S5
# switch
.annotate 'line', 8141
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 8143
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 8145
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 8148
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 8149
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 8151
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 8152
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 8153
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8154
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 8155
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 8156
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 8159
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 8163

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8097
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8099
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
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_40 = "WSubId_40"
# Body
# {
.annotate 'line', 8178
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, 'P')
.annotate 'line', 8179
    box $P2, __ARG_5
    setattribute self, 'arraytype', $P2
.annotate 'line', 8180
# var t: $P1
    $P1 = __ARG_6.'get'()
.annotate 'line', 8181
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8183
    __ARG_6.'unget'($P1)
.annotate 'line', 8184
    $P3 = WSubId_41(__ARG_6, self)
    setattribute self, 'size', $P3
.annotate 'line', 8185
    WSubId_58(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 8187
    $P1 = __ARG_6.'get'()
.annotate 'line', 8188
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 8189
    $P1 = __ARG_6.'get'()
.annotate 'line', 8190
    $P2 = $P1.'isop'('[')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 8191
    WSubId_44("array initializer", $P1)
  __label_4: # endif
.annotate 'line', 8192
    $P1 = __ARG_6.'get'()
.annotate 'line', 8193
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 8194
    __ARG_6.'unget'($P1)
.annotate 'line', 8195
    $P3 = WSubId_40(__ARG_6, self, WSubId_41, ']')
    setattribute self, 'initarray', $P3
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 8199
    __ARG_6.'unget'($P1)
  __label_3: # endif
# }
.annotate 'line', 8200

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 8203
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8204
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8205
    getattribute $P1, self, 'initarray'
    WSubId_42($P1)
.annotate 'line', 8206
    .return(self)
# }
.annotate 'line', 8207

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8210
    self.'annotate'(__ARG_1)
.annotate 'line', 8212
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 8213
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 8214
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 8215
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 8216
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S5, $S4, 'Array'
    set $S1, $S5
.annotate 'line', 8217
    if_null $P2, __label_1
# {
.annotate 'line', 8219
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 8220
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8224
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 8226
    if_null $P3, __label_4
# {
.annotate 'line', 8227
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 8228
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 8229
    unless_null $P2, __label_6
# {
.annotate 'line', 8230
    unless $I1 goto __label_7
# {
.annotate 'line', 8232
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 8235
# i: $I2
    null $I2
.annotate 'line', 8236
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 8237
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 8238
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 8239
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 8242

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8168
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8170
    addattribute $P0, 'size'
.annotate 'line', 8171
    addattribute $P0, 'initarray'
.annotate 'line', 8172
    addattribute $P0, 'arraytype'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseDeclareHelper' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_101 = "WSubId_101"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8249
# var next: $P1
    null $P1
.annotate 'line', 8250
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 8251
# {
.annotate 'line', 8252
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 8253
    WSubId_97($P3)
.annotate 'line', 8254
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8255
# var item: $P5
    null $P5
.annotate 'line', 8256
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8257
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8259
    __ARG_4.'unget'($P4)
.annotate 'line', 8260
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 8262
    $P2 = WSubId_101($P2, $P5)
.annotate 'line', 8263
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 8264
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8265
    WSubId_4(';', $P1)
.annotate 'line', 8266
    .return($P2)
# }
.annotate 'line', 8267

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8275
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 8276

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8271
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
.annotate 'line', 8283
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 8284

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8279
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newIntSingle' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8290
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8291

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8295
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8296

.end # newIntArray


.sub 'parseInt' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_103 = "WSubId_103"
.const 'Sub' WSubId_104 = "WSubId_104"
# Body
# {
.annotate 'line', 8300
    .tailcall WSubId_102(WSubId_103, WSubId_104, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8301

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8309
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 8310

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8305
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
.annotate 'line', 8317
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 8318

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8313
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newFloatSingle' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8324
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8325

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8329
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8330

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_105 = "WSubId_105"
.const 'Sub' WSubId_106 = "WSubId_106"
# Body
# {
.annotate 'line', 8334
    .tailcall WSubId_102(WSubId_105, WSubId_106, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8335

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8343
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 8344

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8339
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
.annotate 'line', 8351
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 8352

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8347
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'newStringSingle' :subid('WSubId_107')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8358
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8359

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8363
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8364

.end # newStringArray


.sub 'parseString' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_102 = "WSubId_102"
.const 'Sub' WSubId_107 = "WSubId_107"
.const 'Sub' WSubId_108 = "WSubId_108"
# Body
# {
.annotate 'line', 8368
    .tailcall WSubId_102(WSubId_107, WSubId_108, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8369

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
.annotate 'line', 8385
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8386
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8387
    setattribute self, 'name', __ARG_4
.annotate 'line', 8388
    setattribute self, 'value', __ARG_5
.annotate 'line', 8389
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8390

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8393
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8394
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8395
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8396
    $P1 = $P1.'optimize'()
.annotate 'line', 8397
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8398
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8401
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8402
    .return(self)
# }
.annotate 'line', 8403

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8406
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8407

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8410
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8411

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8375
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8377
    addattribute $P0, 'type'
.annotate 'line', 8378
    addattribute $P0, 'name'
.annotate 'line', 8379
    addattribute $P0, 'data'
.annotate 'line', 8380
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseConst' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_100 = "WSubId_100"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_101 = "WSubId_101"
# Body
# {
.annotate 'line', 8416
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8417
# type: $S1
    $P5 = WSubId_100($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8418
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8419
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8421
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8422
# {
.annotate 'line', 8423
    $P1 = __ARG_2.'get'()
.annotate 'line', 8424
# var name: $P3
    set $P3, $P1
.annotate 'line', 8425
    WSubId_58('=', __ARG_2)
.annotate 'line', 8426
# var value: $P4
    $P4 = WSubId_41(__ARG_2, __ARG_3)
.annotate 'line', 8428
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8427
    $P2 = WSubId_101($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8429
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8430
    .return($P2)
# }
.annotate 'line', 8431

.end # parseConst

.namespace [ 'Winxed'; 'Compiler'; 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 8442
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8443
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8444
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8445
    $P4 = WSubId_41(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8446
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8448
    WSubId_4(';', $P1)
# }
.annotate 'line', 8449

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8452
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8453
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8454
    .return(self)
# }
.annotate 'line', 8455

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8458
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8459

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8462
    self.'annotate'(__ARG_1)
.annotate 'line', 8463
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8464
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8465
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8466
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8467
    if_null $P1, __label_3
.annotate 'line', 8468
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8469
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8470
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8471
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
.annotate 'line', 8473
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8474
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8476
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8481
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8482
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8485
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8487
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8491
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8492

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8437
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8439
    addattribute $P0, 'init'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8499
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8500
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 8501

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8504
    self.'annotate'(__ARG_1)
.annotate 'line', 8505
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8506
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8507
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8508

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8495
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 8517
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8518
    $P2 = WSubId_41(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8519
    WSubId_58(']', __ARG_2)
.annotate 'line', 8520
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 8521

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8524
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8525
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8526

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8529
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8530
    self.'annotate'(__ARG_1)
.annotate 'line', 8531
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8532
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8533
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8534

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8511
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8513
    addattribute $P0, 'exprsize'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseVar' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
.const 'Sub' WSubId_97 = "WSubId_97"
# Body
# {
.annotate 'line', 8539
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8540
    WSubId_97($P1)
.annotate 'line', 8541
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8542
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8543
    $P2 = __ARG_2.'get'()
.annotate 'line', 8544
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8545
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8547
    __ARG_2.'unget'($P2)
.annotate 'line', 8548
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
.annotate 'line', 8552
    __ARG_2.'unget'($P2)
.annotate 'line', 8553
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8555

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_50 = "WSubId_50"
# Body
# {
.annotate 'line', 8559
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8560
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8561
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8562
    .tailcall WSubId_50(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8563

.end # parseVolatile

.namespace [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_98 = "WSubId_98"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8576
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8577
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8578
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8579
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8580
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8581
    __ARG_2.'unget'($P1)
.annotate 'line', 8582
# var c: $P2
    $P2 = WSubId_98(__ARG_2, self)
.annotate 'line', 8583
    unless_null $P2, __label_3
.annotate 'line', 8584
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8585
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8587
    setattribute self, 'end', $P1
# }
.annotate 'line', 8588

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8591
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8592
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8593
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8594
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8595
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8596
    .return($S2)
# }
.annotate 'line', 8597

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8600
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8601
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8602
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8603
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8604
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8605
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8606
    $P1[$S1] = $S3
.annotate 'line', 8607
    .return($S3)
# }
.annotate 'line', 8608

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8609
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8612
    __ARG_1.'comment'('{')
.annotate 'line', 8613
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8614
    $P1.'emit'(__ARG_1)
.annotate 'line', 8615
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8617
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8618

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8569
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8571
    addattribute $P0, 'end'
.annotate 'line', 8572
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8633
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8635
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8636
    new $P1, ['ResizableStringArray']
.annotate 'line', 8637
    new $P2, ['ResizableStringArray']
.annotate 'line', 8638
    setattribute self, 'tempreg', $P1
.annotate 'line', 8639
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8640

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8643
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8644
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8645
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8646
    assign $P1, $I1
# predefined string
.annotate 'line', 8647
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8648

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8651
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8652
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8653
# reg: $S1
    null $S1
.annotate 'line', 8654
# predefined elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 8655
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8657
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8658
# predefined push
    push $P2, $S1
.annotate 'line', 8659
    .return($S1)
# }
.annotate 'line', 8660

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8663
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8664
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8665
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8666
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8667
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8668
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8666
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8670
    assign $P2, 0
# }
.annotate 'line', 8671

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8627
    addattribute $P0, 'type'
.annotate 'line', 8628
    addattribute $P0, 'nreg'
.annotate 'line', 8629
    addattribute $P0, 'tempreg'
.annotate 'line', 8630
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8682
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8683

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8686
# var named: $P1
    null $P1
.annotate 'line', 8687
# var slurpy: $P2
    null $P2
.annotate 'line', 8688
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8689
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8690
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8691
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8693
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8696
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8699
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8703
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8710
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8727
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8708
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8711
# setname: $S2
    null $S2
# switch
.annotate 'line', 8712
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8714
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8717
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8718
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8719
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8720
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8723
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8725
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8728
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8729
# }
.annotate 'line', 8731

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8678
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_100 = "WSubId_100"
# Body
# {
.annotate 'line', 8742
    setattribute self, 'func', __ARG_1
.annotate 'line', 8743
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8744
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_100($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8745
    eq $S1, '', __label_2
.annotate 'line', 8746
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8748
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8749
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 8750
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S4, '__ARG_', $S3
    set $S2, $S4
.annotate 'line', 8751
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8753
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8754
    $P1 = __ARG_2.'get'()
.annotate 'line', 8755
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8756
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8758
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8759

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 8762
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8763
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8764
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8765
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_109($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8766
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8767
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8768
    if_null $P3, __label_3
.annotate 'line', 8769
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8770
    __ARG_1.'say'('')
# }
.annotate 'line', 8771

.end # emit


.sub 'get_type' :method
# Body
# {
.annotate 'line', 8774
    getattribute $P1, self, 'type'
    .return($P1)
# }
.annotate 'line', 8775

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8736
    addattribute $P0, 'func'
.annotate 'line', 8737
    addattribute $P0, 'name'
.annotate 'line', 8738
    addattribute $P0, 'modifiers'
.annotate 'line', 8739
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8781
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8782

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8793
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8794
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8795

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8798
# var path: $P1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 8799
# reg: $S1
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8800
    self.'annotate'(__ARG_1)
.annotate 'line', 8801
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 8802
    .return($S1)
# }
.annotate 'line', 8803

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8788
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8790
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8814
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8815

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8818
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8819
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8820
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8821
    le $I1, 0, __label_3
# {
.annotate 'line', 8822
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8823
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8824
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8825
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8826
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8827
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 8828
    sub $I3, $I1, 1
    ge $I2, $I3, __label_8
.annotate 'line', 8829
    __ARG_1.'print'(", ")
  __label_8: # endif
# }
  __label_4: # for iteration
.annotate 'line', 8823
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8831
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8834

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8810
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8857
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8858
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8859
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8860
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8861
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8862
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8863

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8865
    .return(self)
# }

.end # getouter


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8868
    .return(1)
# }
.annotate 'line', 8869

.end # allowtailcall


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8873
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8874
    unless_null $P1, __label_1
.annotate 'line', 8875
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8876
    .return($P1)
# }
.annotate 'line', 8877

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8880
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8881
    unless_null $P1, __label_1
.annotate 'line', 8882
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8883
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8884

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8888
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8889
    .return($I1)
# }
.annotate 'line', 8890

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 8893
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8894
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8895
    __ARG_1.'unget'($P1)
.annotate 'line', 8896
    $P3 = WSubId_40(__ARG_1, self, WSubId_110, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8898

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8902
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8903
    unless_null $P1, __label_1
.annotate 'line', 8904
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8906
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8907

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8910
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8911
    unless_null $P1, __label_1
# {
.annotate 'line', 8913
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8916
    if_null $P1, __label_4
    iter $P5, $P1
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 8917
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8918
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8919
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8921

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 8924
# var found: $P1
    null $P1
.annotate 'line', 8925
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8926
    $P1 = $P2.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 8927
    if_null $P1, __label_3
.annotate 'line', 8928
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8930
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8931

.end # scopesearch


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8935
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 8936
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8937
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8938
    .return(self)
# }
.annotate 'line', 8939

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8943
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8944
    unless_null $P1, __label_1
.annotate 'line', 8945
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8946
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8947

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8950
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8951
    unless_null $P1, __label_1
.annotate 'line', 8952
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8953
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8954

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8959
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8960
# lexname: $S1
    null $S1
.annotate 'line', 8961
    if_null $P1, __label_1
.annotate 'line', 8962
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8964
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8965
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8966
# predefined string
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 8967
    self.'setlex'($S1, $S2)
.annotate 'line', 8968
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8970
    .return($S1)
# }
.annotate 'line', 8971

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8975
# var store: $P1
    null $P1
# switch
.annotate 'line', 8976
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
.annotate 'line', 8978
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8980
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8982
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8984
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8986
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8988
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8989
    .return($S1)
# }
.annotate 'line', 8990

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8993
# var store: $P1
    null $P1
# switch
.annotate 'line', 8994
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
.annotate 'line', 8996
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8998
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 9000
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 9002
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9004
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 9006
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 9007
    .return($S1)
# }
.annotate 'line', 9008

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 9011
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
.annotate 'line', 9012
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9013

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 9016
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9017
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 9018

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9021
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 9022

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9025
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 9026

.end # getcontinuelabel


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
# Empty body

.end # emit_extra_modifiers


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 9032
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 9033
    __ARG_1.'say'()
.annotate 'line', 9034
    __ARG_1.'print'(".sub ")
.annotate 'line', 9035
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 9036
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 9038
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 9039
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 9040
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 9041
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 9042
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 9043
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 9044
    if_null $P2, __label_6
.annotate 'line', 9045
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 9049
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 9050
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 9051
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 9052
    if_null $P3, __label_8
.annotate 'line', 9053
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 9055
    ne $S1, 'main', __label_10
.annotate 'line', 9056
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 9058
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 9059
    __ARG_1.'say'()
.annotate 'line', 9062
    getattribute $P8, self, 'params'
    WSubId_56(__ARG_1, $P8)
.annotate 'line', 9064
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 9065
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 9066
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 9067
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 9069
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 9070
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 9072
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 9073
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 9074
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 9075
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 9079
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 9081
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 9084
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 9085
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 9086
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 9088
    __ARG_1.'comment'('Body')
.annotate 'line', 9089
    $P6.'emit'(__ARG_1)
.annotate 'line', 9090
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 9092
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9095
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 9096
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 9097

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8837
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8839
    addattribute $P0, 'name'
.annotate 'line', 8840
    addattribute $P0, 'subid'
.annotate 'line', 8841
    addattribute $P0, 'modifiers'
.annotate 'line', 8842
    addattribute $P0, 'params'
.annotate 'line', 8843
    addattribute $P0, 'body'
.annotate 'line', 8844
    addattribute $P0, 'regstI'
.annotate 'line', 8845
    addattribute $P0, 'regstN'
.annotate 'line', 8846
    addattribute $P0, 'regstS'
.annotate 'line', 8847
    addattribute $P0, 'regstP'
.annotate 'line', 8848
    addattribute $P0, 'nlabel'
.annotate 'line', 8849
    addattribute $P0, 'localfun'
.annotate 'line', 8850
    addattribute $P0, 'lexicals'
.annotate 'line', 8851
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8852
    addattribute $P0, 'usedsubids'
.annotate 'line', 8853
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9113
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9114
    box $P4, 0
    setattribute self, 'paramnum', $P4
.annotate 'line', 9115
    box $P4, 0
    setattribute self, 'lexnum', $P4
.annotate 'line', 9116
    self.'parse'(__ARG_2)
.annotate 'line', 9117
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'multi_sig', $P5
.annotate 'line', 9118
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 9119
    new $P5, [ 'Boolean' ]
    setattribute self, 'is_multi', $P5
.annotate 'line', 9120
    if_null $P1, __label_1
# {
.annotate 'line', 9121
# var multi_sig: $P2
    getattribute $P2, self, 'multi_sig'
.annotate 'line', 9122
# start_idx: $I1
    null $I1
.annotate 'line', 9123
    $P4 = self.'ismethod'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9124
    set $I1, 1
.annotate 'line', 9125
    $P2[0] = 'P'
# }
  __label_2: # endif
# for loop
.annotate 'line', 9127
# i: $I2
    null $I2
  __label_5: # for condition
# predefined elements
    elements $I3, $P1
    ge $I2, $I3, __label_4
# {
.annotate 'line', 9128
# var param: $P3
    $P3 = $P1[$I2]
.annotate 'line', 9129
    add $I3, $I2, $I1
    $P4 = $P3.'get_type'()
    $P2[$I3] = $P4
# }
  __label_3: # for iteration
.annotate 'line', 9127
    set $I3, $I2
    inc $I2
    goto __label_5
  __label_4: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 9132

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9134
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 9138
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9139

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 9143
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9144

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9145
    .return(0)
# }

.end # ismethod


.sub 'ismulti' :method
# Body
# {
.annotate 'line', 9148
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
.annotate 'line', 9149

.end # ismulti


.sub 'setmulti' :method
# Body
# {
.annotate 'line', 9152
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
# }
.annotate 'line', 9153

.end # setmulti


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 9157
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9158
    setattribute self, 'name', $P1
.annotate 'line', 9159
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9160
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9161
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9162
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 9164
    WSubId_4('(', $P2)
.annotate 'line', 9165
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9167
# var path: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 9168
    $P4 = $P3.'fullname'()
    WSubId_111(self, '__FUNCTION__', $P4)
.annotate 'line', 9170
    $P2 = __ARG_1.'get'()
.annotate 'line', 9171
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9172
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9173
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9174
    .return(self)
# }
.annotate 'line', 9175

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 9179
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 9180
# var multi_sig: $P1
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9181
    __ARG_1.'print'(' :multi(')
.annotate 'line', 9182
# sep: $S1
    set $S1, ''
.annotate 'line', 9183
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $S2, $P3
# {
.annotate 'line', 9184
    $P2 = WSubId_109($S2)
    __ARG_1.'print'($S1, $P2)
.annotate 'line', 9185
    set $S1, ', '
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9187
    __ARG_1.'print'(')')
# }
  __label_1: # endif
# }
.annotate 'line', 9189

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9104
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9106
    addattribute $P0, 'paramnum'
.annotate 'line', 9107
    addattribute $P0, 'lexnum'
.annotate 'line', 9108
    addattribute $P0, 'multi_sig'
.annotate 'line', 9109
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
.annotate 'line', 9200
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9201
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9202
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9203
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 9204
    setattribute self, 'name', $P1
.annotate 'line', 9205
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9206
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9207
    WSubId_4('{', $P2)
.annotate 'line', 9208
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9209
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 9210

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9211
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9212
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 9215
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9216
    .return(1)
  __label_1: # endif
.annotate 'line', 9217
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9218
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9219
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9220
    .return(0)
# }
.annotate 'line', 9221

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 9224
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 9225

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 9229
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 9230

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 9234
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 9235

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9238
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9239
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9240
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9242
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9243
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9244
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9245
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 9246
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 9247
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 9248
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 9249
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9250
# flags: $I1
    $P5 = __ARG_2.'getflags'()
    set $I2, $P5
    bor $I1, $I2, 2
.annotate 'line', 9251
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9252
    eq $S3, 'P', __label_8
.annotate 'line', 9253
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9254
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9255
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9256
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9257
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 9260
    .return(__ARG_2)
# }
.annotate 'line', 9261

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9264
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9265
    unless_null $P1, __label_1
.annotate 'line', 9266
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9267
    unless_null $P1, __label_2
# {
.annotate 'line', 9270
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9271
    unless_null $P1, __label_3
# {
.annotate 'line', 9273
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 9274
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 9275
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 9276
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9277
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9278
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9279
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 9283
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 9285
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9286
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9287
    .return($P1)
# }
.annotate 'line', 9288

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9196
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
.annotate 'line', 9299
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9300

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9301
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9295
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_3 = "WSubId_3"
.const 'Sub' WSubId_100 = "WSubId_100"
# Body
# {
.annotate 'line', 9315
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9316
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9317
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9318
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9319
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9320
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_100($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9321
    set $P1, $P2
.annotate 'line', 9322
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9323
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 9325
    setattribute self, 'name', $P1
.annotate 'line', 9326
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9327
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9328
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9329
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9331
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 9332

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9335
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9336
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9337
    if_null $P1, __label_1
# {
.annotate 'line', 9338
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 9339
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 9341

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9310
    addattribute $P0, 'name'
.annotate 'line', 9311
    addattribute $P0, 'modifiers'
.annotate 'line', 9312
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9346
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 9347

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_112 = "WSubId_112"
# Body
# {
.annotate 'line', 9354
    $P2 = WSubId_40(__ARG_1, __ARG_2, WSubId_112, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 9355

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9358
    __ARG_1.'print'('(')
.annotate 'line', 9359
# sep: $S1
    set $S1, ''
.annotate 'line', 9360
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 9361
    __ARG_1.'print'($S1)
.annotate 'line', 9362
    $P1.'emit'(__ARG_1)
.annotate 'line', 9363
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9365
    __ARG_1.'print'(')')
# }
.annotate 'line', 9366

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9351
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
.annotate 'line', 9375
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9376
    setattribute self, 'params', __ARG_3
.annotate 'line', 9377
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 9378

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9381
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9382
    .return(self)
# }
.annotate 'line', 9383

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9386
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 9387
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9388
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9389
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9390
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9391
    __ARG_1.'print'('    ')
.annotate 'line', 9392
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9393
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9394
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9395
    __ARG_1.'say'()
# }
.annotate 'line', 9396

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9369
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9371
    addattribute $P0, 'params'
.annotate 'line', 9372
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
.annotate 'line', 9413
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9414

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9415
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9419
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9420

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9409
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9428
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9429
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9430

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9431
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9435
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9436
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9437

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9423
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9425
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_45 = "WSubId_45"
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 9446
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9447
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9448
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9449
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9450
    WSubId_44('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9451
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 9452
    $P2 = __ARG_1.'get'()
.annotate 'line', 9453
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9454
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9456
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9460
    WSubId_45('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9462
# {
.annotate 'line', 9463
    $P2 = __ARG_1.'get'()
.annotate 'line', 9464
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9465
    WSubId_44('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9466
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9467
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9468
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9470
    setattribute self, 'key', $P1
# }
.annotate 'line', 9471

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9472
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 9475
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9476

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9480
    getattribute $P2, self, 'key'
    $P1 = WSubId_22($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9481

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9440
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9442
    addattribute $P0, 'key'
.annotate 'line', 9443
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9489
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9490
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
# predefined string
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 9491
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9492
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9493
    $P2 = __ARG_1.'get'()
.annotate 'line', 9494
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9496
    __ARG_1.'unget'($P2)
.annotate 'line', 9497
    setattribute self, 'key', $P1
# }
.annotate 'line', 9498

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9499
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9503
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9504
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9505

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9508
# var nskey: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9509
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
# }
.annotate 'line', 9510

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9514
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9515
    unless_null $P1, __label_1
# {
.annotate 'line', 9516
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9517
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_72($S2)
  __label_3: # endif
.annotate 'line', 9518
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9520
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9521

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9524
# var nskey: $P1
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 9525
    unless_null $P1, __label_1
# {
.annotate 'line', 9526
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9527
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_72($S2)
  __label_3: # endif
.annotate 'line', 9528
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'say'("new ", __ARG_3, ", ", $P2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9531
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 9533

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9484
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9486
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9538
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9539
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9540
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9541
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9542
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9543
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9544
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9545
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9546

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9558
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9559
    setattribute self, 'name', __ARG_2
.annotate 'line', 9560
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 9561
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9562

.end # ClassBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9565
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9566

.end # getpath


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 9569
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
# }
.annotate 'line', 9570

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9552
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9554
    addattribute $P0, 'name'
.annotate 'line', 9555
    addattribute $P0, 'classns'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_66 = "WSubId_66"
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 9583
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9584
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9585
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9586
    setattribute self, 'functions', $P1
.annotate 'line', 9587
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9588
    setattribute self, 'members', $P2
.annotate 'line', 9589
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9590
    setattribute self, 'constants', $P3
.annotate 'line', 9591
# var seen_functions: $P4
    root_new $P4, ['parrot';'Hash']
.annotate 'line', 9593
# var t: $P5
    $P5 = __ARG_4.'get'()
.annotate 'line', 9594
    $P10 = $P5.'isop'(':')
    if_null $P10, __label_1
    unless $P10 goto __label_1
# {
.annotate 'line', 9595
    $P12 = WSubId_40(__ARG_4, self, WSubId_66)
    setattribute self, 'bases', $P12
.annotate 'line', 9596
    $P5 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9598
    WSubId_4('{', $P5)
.annotate 'line', 9600
    getattribute $P11, self, 'classns'
    $P10 = $P11.'fullname'()
    WSubId_111(self, '__CLASS__', $P10)
# for loop
.annotate 'line', 9602
    $P5 = __ARG_4.'get'()
  __label_4: # for condition
    $P10 = $P5.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9603
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
.annotate 'line', 9605
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P6.'MethodStatement'($P5, __ARG_4, self)
.annotate 'line', 9606
# predefined push
    push $P1, $P6
.annotate 'line', 9607
# var first_func: $P7
    getattribute $P12, $P6, 'name'
    $P7 = $P4[$P12]
.annotate 'line', 9608
    unless_null $P7, __label_10
.annotate 'line', 9609
    getattribute $P13, $P6, 'name'
    $P4[$P13] = $P6
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 9611
    $P7.'setmulti'()
.annotate 'line', 9612
    $P6.'setmulti'()
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9616
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 9617
    $P10 = $P8.'isidentifier'()
    isfalse $I1, $P10
    unless $I1 goto __label_12
.annotate 'line', 9618
    WSubId_44("member identifier", $P8)
  __label_12: # endif
.annotate 'line', 9619
# predefined push
    push $P2, $P8
.annotate 'line', 9620
    $P5 = __ARG_4.'get'()
.annotate 'line', 9621
    $P11 = $P5.'isop'(';')
    isfalse $I2, $P11
    unless $I2 goto __label_13
.annotate 'line', 9622
    WSubId_44("';' in member declaration", $P5)
  __label_13: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9625
# var cst: $P9
    $P9 = WSubId_48($P5, __ARG_4, self)
.annotate 'line', 9626
# predefined push
    push $P3, $P9
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9629
    WSubId_45("item in class", $P5)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9602
    $P5 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9632

.end # ClassStatement


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9635
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9636

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9639
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9640

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9643
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9644

.end # scopesearch


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9647
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9648

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 9651
    getattribute $P1, self, 'constants'
    WSubId_42($P1)
.annotate 'line', 9652
    getattribute $P1, self, 'functions'
    WSubId_42($P1)
.annotate 'line', 9653
    .return(self)
# }
.annotate 'line', 9654

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 9657
    getattribute $P3, self, 'classns'
    $P3.'emitnamespace'(__ARG_1)
.annotate 'line', 9658
    getattribute $P3, self, 'functions'
    WSubId_56(__ARG_1, $P3)
.annotate 'line', 9660
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9662
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 9663
# n: $I1
    set $I1, 1
.annotate 'line', 9664
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 9665
    $P1.'annotate'(__ARG_1)
.annotate 'line', 9666
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9667
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9668
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 9669
    __ARG_1.'say'()
.annotate 'line', 9670
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9672
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 9673
    __ARG_1.'annotate'($P2)
.annotate 'line', 9674
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9677
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9678

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9573
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9575
    addattribute $P0, 'parent'
.annotate 'line', 9576
    addattribute $P0, 'bases'
.annotate 'line', 9577
    addattribute $P0, 'constants'
.annotate 'line', 9578
    addattribute $P0, 'functions'
.annotate 'line', 9579
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9685
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9686

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9689
    .return(self)
# }
.annotate 'line', 9690

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9681
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClass' :subid('WSubId_114')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9698
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9699
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9700
# var nskey: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9701
# var ns: $P4
    null $P4
# for loop
  __label_3: # for condition
.annotate 'line', 9703
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
# {
.annotate 'line', 9704
    $P3.'push'($P1)
.annotate 'line', 9705
    $P1 = __ARG_2.'get'()
# }
  __label_1: # for iteration
.annotate 'line', 9703
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9708
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 9709
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 9710
# predefined string
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 9711
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 9714
    __ARG_2.'unget'($P2)
.annotate 'line', 9715
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 9716
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9717
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
# }
  __label_5: # endif
# }
.annotate 'line', 9719

.end # parseClass


.sub 'open_include' :subid('WSubId_113')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9727
# var interp: $P1
# predefined getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9732
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9733
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9734
# var file: $P4
    null $P4
.annotate 'line', 9735
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9736
# filepath: $S2
    concat $S3, $S1, __ARG_1
    set $S2, $S3
.annotate 'line', 9737
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9738
# predefined open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9739
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 9740
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9737
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
.annotate 'line', 9745
    isnull $I1, $P4
    if $I1 goto __label_8
    $I1 = $P4.'is_closed'()
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 9746
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 9747
    $P4.'encoding'("utf8")
.annotate 'line', 9748
    .return($P4)
# }
.annotate 'line', 9749

.end # open_include


.sub 'include_parrot' :subid('WSubId_116')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_113 = "WSubId_113"
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 9753
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9754
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9755
    WSubId_44('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9756
    WSubId_58(';', __ARG_2)
.annotate 'line', 9758
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9759
# var file: $P2
    $P2 = WSubId_113($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9764
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
.annotate 'line', 9765
# predefined substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9766
# pos: $I1
    set $I1, 12
.annotate 'line', 9767
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9768
# predefined substr
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 9769
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9770
# pos2: $I2
    set $I2, $I1
  __label_12: # while
.annotate 'line', 9771
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 9772
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9773
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 9774
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 9776
# name: $S4
    sub $I4, $I2, $I1
# predefined substr
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 9777
# predefined substr
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 9778
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 9779
    set $I1, $I2
  __label_22: # while
.annotate 'line', 9780
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 9781
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 9782
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 9783
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 9785
# value: $S5
    sub $I4, $I2, $I1
# predefined substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 9787
# ivalue: $I3
    null $I3
.annotate 'line', 9788
# predefined substr
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
# predefined substr
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 9789
# predefined substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 9791
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 9792
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 9794
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 9793
    $P4 = WSubId_21(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9764
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 9798
    $P2.'close'()
# }
.annotate 'line', 9799

.end # include_parrot


.sub 'include_winxed' :subid('WSubId_117')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_113 = "WSubId_113"
# Body
# {
.annotate 'line', 9805
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9806
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 9807
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9808
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9809
    WSubId_44('literal string', $P1)
  __label_2: # endif
.annotate 'line', 9810
    WSubId_58(';', __ARG_2)
.annotate 'line', 9812
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 9813
# var file: $P2
    $P2 = WSubId_113($S1, __ARG_1)
.annotate 'line', 9815
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 9816
    __ARG_3.'parse'($P3)
.annotate 'line', 9818
    $P2.'close'()
# }
.annotate 'line', 9819

.end # include_winxed


.sub 'parsensUsing' :subid('WSubId_115')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_62 = "WSubId_62"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_59 = "WSubId_59"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_61 = "WSubId_61"
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 9825
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9826
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 9827
    WSubId_62(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9828
    WSubId_58(';', __ARG_2)
.annotate 'line', 9829
    .return()
# }
  __label_1: # endif
.annotate 'line', 9831
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
# {
.annotate 'line', 9832
    __ARG_2.'unget'($P1)
.annotate 'line', 9833
# var key: $P2
    $P2 = WSubId_59(__ARG_2)
.annotate 'line', 9834
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9835
    ge $I1, 1, __label_3
.annotate 'line', 9836
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 9837
    WSubId_58(';', __ARG_2)
.annotate 'line', 9838
    __ARG_3.'use'($P2)
.annotate 'line', 9839
    .return()
# }
  __label_2: # endif
.annotate 'line', 9841
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9843
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 9849
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9845
# reqlib: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 9846
    __ARG_3.'addlib'($S1)
.annotate 'line', 9847
    WSubId_58(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9850
    __ARG_2.'unget'($P1)
.annotate 'line', 9851
# var module: $P3
    $P3 = WSubId_59(__ARG_2)
.annotate 'line', 9852
    $P1 = __ARG_2.'get'()
.annotate 'line', 9853
    $P6 = $P1.'isop'(';')
    isfalse $I3, $P6
    unless $I3 goto __label_9
# {
.annotate 'line', 9854
    __ARG_2.'unget'($P1)
.annotate 'line', 9855
# var names: $P4
    null $P5
    $P4 = WSubId_40(__ARG_2, $P5, WSubId_61, ';')
.annotate 'line', 9856
    __ARG_3.'addextern'($P3, $P4)
# }
  __label_9: # endif
.annotate 'line', 9858
# reqmodule: $S2
# predefined join
    join $S3, '/', $P3
    concat $S4, '"', $S3
    concat $S4, $S4, '.pbc"'
    set $S2, $S4
.annotate 'line', 9859
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9862
    WSubId_44('string literal or identifier', $P1)
  __label_4: # switch end
# }
.annotate 'line', 9864

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9874
    setattribute self, 'module', __ARG_1
.annotate 'line', 9875
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9876

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9881
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9890
# predefined string
.annotate 'line', 9891
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    concat $S3, "['parrot'; '", $S2
    concat $S3, $S3, "']"
.annotate 'line', 9890
    __ARG_1.'emitget_root_namespace'("srcns", $S3)
.annotate 'line', 9893
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9894
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9895
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9901

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9870
    addattribute $P0, 'module'
.annotate 'line', 9871
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9911
    new $P1, ['ResizableStringArray']
.annotate 'line', 9912
    unless __ARG_2 goto __label_1
.annotate 'line', 9913
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9915
    if_null __ARG_1, __label_3
.annotate 'line', 9916
# predefined push
    push $P1, __ARG_1
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 9918
    setattribute self, 'path', $P1
# }
.annotate 'line', 9919

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9922
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 9923
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 9924
# var path: $P2
    getattribute $P3, self, 'path'
# predefined clone
    clone $P2, $P3
.annotate 'line', 9925
# predefined push
    push $P2, __ARG_1
.annotate 'line', 9926
    setattribute $P1, 'path', $P2
.annotate 'line', 9927
    .return($P1)
# }
.annotate 'line', 9928

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9931
# var fromkey: $P1
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 9932
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 9933
# var fromhll: $P3
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 9934
    unless_null $P2, __label_3
.annotate 'line', 9935
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 9937
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
# }
.annotate 'line', 9938

.end # samehllas


.sub 'fullname' :method
# Body
# {
.annotate 'line', 9941
# name: $S1
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '.', $P1
.annotate 'line', 9942
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
# predefined string
.annotate 'line', 9943
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 9945
    .return($S1)
  __label_2: # endif
# }
.annotate 'line', 9946

.end # fullname


.sub 'getparrotkey' :method
# Body
# {
.annotate 'line', 9949
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 9950
# r: $S1
    null $S1
.annotate 'line', 9951
# predefined elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9952
# predefined string
# predefined join
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 9953
    .return($S1)
# }
.annotate 'line', 9954

.end # getparrotkey


.sub 'getparrotrootkey' :method
# Body
# {
.annotate 'line', 9957
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 9958
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 9959
# r: $S1
    set $S1, "[ '"
.annotate 'line', 9960
    if_null $P2, __label_1
# {
.annotate 'line', 9963
    set $S3, $P2
# predefined downcase
    downcase $S2, $S3
    concat $S1, $S1, $S2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9966
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 9967
    concat $S1, $S1, "'"
.annotate 'line', 9968
# predefined elements
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 9969
# predefined string
# predefined join
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 9970
    concat $S1, $S1, " ]"
.annotate 'line', 9971
    .return($S1)
# }
.annotate 'line', 9972

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9975
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 9976
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 9977
# predefined elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9978
# predefined join
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 9979
    __ARG_1.'say'("]")
# }
.annotate 'line', 9980

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 9983
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 9984
    __ARG_1.'print'('    ', 'new ', __ARG_3, ", ")
.annotate 'line', 9985
    $P1 = self.'getparrotkey'()
    __ARG_1.'print'($P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9988
    __ARG_1.'print'('    ', 'root_new ', __ARG_3, ", ")
.annotate 'line', 9989
    $P1 = self.'getparrotrootkey'()
    __ARG_1.'print'($P1)
# }
  __label_2: # endif
.annotate 'line', 9991
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 9992
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 9993
    __ARG_1.'say'()
# }
.annotate 'line', 9994

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 9997
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 9998
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10000
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
# }
.annotate 'line', 10001

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 10004
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 10005
    $P4 = self.'getparrotkey'()
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", $P4)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10010
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10011
# var path: $P2
    getattribute $P3, self, 'path'
# predefined clone
    clone $P2, $P3
.annotate 'line', 10012
# name: $S1
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 10013
# shll: $S2
    if_null $P1, __label_5
    set $S3, $P1
# predefined downcase
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 10014
# predefined elements
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 10016
# predefined join
    join $S3, "'; '", $P2
.annotate 'line', 10015
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'; '", $S3, "'], '", $S1, "'")
    goto __label_7
  __label_6: # else
.annotate 'line', 10018
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'], '", $S1, "'")
  __label_7: # endif
.annotate 'line', 10020
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 10022

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 10025
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 10026
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 10028
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
# }
.annotate 'line', 10029

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 9906
    addattribute $P0, 'hll'
.annotate 'line', 9907
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_111 = "WSubId_111"
# Body
# {
.annotate 'line', 10049
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 10050
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 10051
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 10052
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10053
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 10054
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 10055
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions_name', $P2
.annotate 'line', 10056
    $P1 = __ARG_1.'fullname'()
    WSubId_111(self, '__NAMESPACE__', $P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10059
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 10060
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 10061
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10062
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 10063
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
.annotate 'line', 10064
    getattribute $P2, __ARG_2, 'functions_name'
    setattribute self, 'functions_name', $P2
# }
  __label_2: # endif
.annotate 'line', 10066
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 10067

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 10070
# var ns: $P1
    null $P1
.annotate 'line', 10071
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10072
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10073
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 10074
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 10075
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 10076

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 10079
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 10080

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10083
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 10084
    .return()
  __label_1: # endif
.annotate 'line', 10085
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10086
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 10087
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 10088
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10089
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10090

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10093
# var sym: $P1
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 10094
    if_null $P1, __label_1
# {
.annotate 'line', 10095
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 10096
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10099
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 10100
# var ns: $P2
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 10101
    if_null $P2, __label_5
# {
.annotate 'line', 10102
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 10103
    if_null $P1, __label_6
.annotate 'line', 10104
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 10107

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10110
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10111
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10112
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 10113
    .return($P2)
# }
.annotate 'line', 10114

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10117
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10118
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10119
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10120
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 10121

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10125
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 10126
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10127
    unless_null $P2, __label_1
.annotate 'line', 10128
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10130
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 10131

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10135
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 10136
# var cl: $P2
    null $P2
.annotate 'line', 10137
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 10138
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10139
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10140
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 10141
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 10142
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 10143
    .return($P5)
# }
.annotate 'line', 10144

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10147
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10148
    if_null $P1, __label_1
.annotate 'line', 10149
    .return($P1)
  __label_1: # endif
.annotate 'line', 10150
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 10151
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 10152
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 10153
    .return($P2)
# }
.annotate 'line', 10154

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 10159
# keylen: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 10160
# name: $S1
    null $S1
.annotate 'line', 10161
# var sym: $P1
    null $P1
.annotate 'line', 10162
# var ns: $P2
    null $P2
# switch
.annotate 'line', 10163
    sub $I2, $I1, __ARG_3
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 10167
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
# switch
.annotate 'line', 10168
    set $I5, __ARG_2
    set $I6, 1
    if $I5 == $I6 goto __label_7
    set $I6, 2
    if $I5 == $I6 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 10170
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 10172
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 10175
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 10176
    .return($P1)
  __label_9: # endif
.annotate 'line', 10177
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 10178
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 10179
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 10186
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 10187
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 10188
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_14
.annotate 'line', 10189
    add $I8, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I8)
    isnull $I7, $P1
    not $I7
  __label_14:
    unless $I7 goto __label_13
.annotate 'line', 10190
    .return($P1)
  __label_13: # endif
.annotate 'line', 10191
    $P2 = self.'getusedns'($S1)
.annotate 'line', 10192
    isnull $I9, $P2
    not $I9
    unless $I9 goto __label_16
.annotate 'line', 10193
    add $I10, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I10)
    isnull $I9, $P1
    not $I9
  __label_16:
    unless $I9 goto __label_15
.annotate 'line', 10194
    .return($P1)
  __label_15: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 10196
    .return($P3)
# }
.annotate 'line', 10197

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 10200
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 10201
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 10202
    .return($P1)
# }
.annotate 'line', 10203

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 10206
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 10207
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 10208
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 10209
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 10210
    .return($P2)
# }
.annotate 'line', 10211

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10214
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10215

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10218
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 10219
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10220

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 10223
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 10224
# name: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 10225
    $P1 = __ARG_2.'get'()
.annotate 'line', 10227
# var parent: $P2
    set $P2, self
# for loop
  __label_4: # for condition
.annotate 'line', 10228
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 10229
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10230
    $P5 = __ARG_2.'get'()
    set $S1, $P5
# }
  __label_2: # for iteration
.annotate 'line', 10228
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10233
# var modifier: $P3
    null $P3
.annotate 'line', 10234
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 10235
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10236
    $P1 = __ARG_2.'get'()
# }
  __label_5: # endif
.annotate 'line', 10239
    WSubId_4('{', $P1)
.annotate 'line', 10240
# var child: $P4
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10241
    $P4.'parse'(__ARG_2)
# }
.annotate 'line', 10242

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_48 = "WSubId_48"
.const 'Sub' WSubId_114 = "WSubId_114"
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_97 = "WSubId_97"
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_115 = "WSubId_115"
.const 'Sub' WSubId_116 = "WSubId_116"
.const 'Sub' WSubId_117 = "WSubId_117"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_45 = "WSubId_45"
# Body
# {
.annotate 'line', 10245
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 10246
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 10247
# var functions_name: $P3
    getattribute $P3, self, 'functions_name'
.annotate 'line', 10248
# var classes: $P4
    getattribute $P4, self, 'classes'
.annotate 'line', 10249
# var t: $P5
    null $P5
# for loop
.annotate 'line', 10250
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
.annotate 'line', 10252
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
.annotate 'line', 10254
    self.'parsenamespace'($P5, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10257
# var cst: $P6
    $P6 = WSubId_48($P5, __ARG_1, self)
.annotate 'line', 10258
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10261
# var f: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P7.'FunctionStatement'($P5, __ARG_1, self)
.annotate 'line', 10262
# name: $S1
    getattribute $P12, $P7, 'name'
    null $S1
    if_null $P12, __label_17
    set $S1, $P12
  __label_17:
.annotate 'line', 10263
# predefined push
    push $P2, $P7
.annotate 'line', 10264
# predefined push
    push $P1, $P7
.annotate 'line', 10265
# var funcs: $P8
    $P8 = $P3[$S1]
.annotate 'line', 10266
    if_null $P8, __label_18
# {
.annotate 'line', 10267
    $P7.'setmulti'()
.annotate 'line', 10268
# predefined elements
    elements $I1, $P8
    ne $I1, 1, __label_20
.annotate 'line', 10269
    $P11 = $P8[0]
    $P11.'setmulti'()
  __label_20: # endif
.annotate 'line', 10270
    $P8.'push'($P7)
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 10273
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P11[0] = $P7
    $P3[$S1] = $P11
  __label_19: # endif
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 10276
    WSubId_114($P5, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 10279
# var t1: $P9
    $P9 = __ARG_1.'get'()
.annotate 'line', 10280
    $P12 = $P9.'iskeyword'('function')
    isfalse $I1, $P12
    unless $I1 goto __label_21
.annotate 'line', 10281
    WSubId_1('Unsupported extern', $P9)
  __label_21: # endif
.annotate 'line', 10282
    $P9 = __ARG_1.'get'()
.annotate 'line', 10283
    WSubId_97($P9)
.annotate 'line', 10284
    WSubId_58(';', __ARG_1)
.annotate 'line', 10285
# var fex: $P10
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P10.'FunctionExtern'($P9, self)
.annotate 'line', 10286
# predefined push
    push $P2, $P10
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 10289
    WSubId_115($P5, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 10292
    WSubId_116($P5, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 10295
    WSubId_117($P5, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 10298
    $P5 = __ARG_1.'get'()
.annotate 'line', 10299
    $P13 = $P5.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_22
.annotate 'line', 10300
    WSubId_44('string literal', $P5)
  __label_22: # endif
.annotate 'line', 10301
    WSubId_58(';', __ARG_1)
.annotate 'line', 10302
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P5)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 10305
    $P5 = __ARG_1.'get'()
.annotate 'line', 10306
    $P17 = $P5.'isstring'()
    isfalse $I3, $P17
    unless $I3 goto __label_23
.annotate 'line', 10307
    WSubId_44('string literal', $P5)
  __label_23: # endif
.annotate 'line', 10308
    WSubId_58(';', __ARG_1)
.annotate 'line', 10309
    new $P20, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P5)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10312
    WSubId_45("token", $P5)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 10250
    $P5 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10315
    $P11 = $P5.'iseof'()
    if_null $P11, __label_24
    unless $P11 goto __label_24
.annotate 'line', 10316
    self.'unclosed_ns'()
    goto __label_25
  __label_24: # else
.annotate 'line', 10318
    self.'close_ns'($P5)
  __label_25: # endif
# }
.annotate 'line', 10319

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 10322
    getattribute $P1, self, 'items'
    WSubId_42($P1)
# }
.annotate 'line', 10323

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 10326
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 10328
# activate: $I1
    set $I1, 1
.annotate 'line', 10330
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10331
    if_null $P2, __label_1
# {
.annotate 'line', 10332
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10333
    null $I1
.annotate 'line', 10334
    WSubId_56(__ARG_1, $P2)
# }
  __label_1: # endif
.annotate 'line', 10337
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
# {
.annotate 'line', 10338
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 10339
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 10340
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10342
    unless $I1 goto __label_7
# {
.annotate 'line', 10343
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10344
    null $I1
# }
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10346
    $P3.'emit'(__ARG_1)
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 10348

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 10036
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 10038
    addattribute $P0, 'nspath'
.annotate 'line', 10039
    addattribute $P0, 'externals'
.annotate 'line', 10040
    addattribute $P0, 'namespaces'
.annotate 'line', 10041
    addattribute $P0, 'classes'
.annotate 'line', 10042
    addattribute $P0, 'functions'
.annotate 'line', 10043
    addattribute $P0, 'functions_name'
.annotate 'line', 10044
    addattribute $P0, 'items'
.annotate 'line', 10045
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
.annotate 'line', 10366
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10367
# is_hll: $I1
    null $I1
.annotate 'line', 10368
    if_null __ARG_5, __label_1
# {
.annotate 'line', 10369
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
# {
.annotate 'line', 10370
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 10371
    set $I1, 1
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 10374
# var nspath: $P1
    unless $I1 goto __label_4
.annotate 'line', 10375
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 10376
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 10377
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10379
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10380
    setattribute self, 'start', __ARG_2
.annotate 'line', 10381
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10382
    box $P2, __ARG_4
    setattribute self, 'name', $P2
# }
.annotate 'line', 10383

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10386
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10387

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10390
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 10391

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10394
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 10395

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10398
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 10399

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10402
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 10403

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10406
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10407
    unless_null $P1, __label_1
.annotate 'line', 10408
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10409
    .return($P1)
# }
.annotate 'line', 10410

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10413
# var sym: $P1
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10414
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10415
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10416
    .return($P1)
# }
.annotate 'line', 10417

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10420
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 10421

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10428
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 10429
    if_null $P1, __label_1
.annotate 'line', 10430
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10431
    self.'optimize_base'()
.annotate 'line', 10432
    .return(self)
# }
.annotate 'line', 10433

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10436
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10437
    if_null $P1, __label_1
.annotate 'line', 10438
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 10440
    self.'emit_base'(__ARG_1)
.annotate 'line', 10442
    if_null $P1, __label_2
.annotate 'line', 10443
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 10444

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10355
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10357
    addattribute $P0, 'parent'
.annotate 'line', 10358
    addattribute $P0, 'start'
.annotate 'line', 10359
    addattribute $P0, 'name'
.annotate 'line', 10360
    addattribute $P0, 'modifier'
.annotate 'line', 10361
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10461
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10462
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10463
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P2
.annotate 'line', 10464
    box $P1, 0
    setattribute self, 'subidgen', $P1
# }
.annotate 'line', 10465

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10468
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10469
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10470

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10473
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10474
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 10475

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10479
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 10480
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 10481

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10485
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 10486
    unless_null $P1, __label_1
.annotate 'line', 10487
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10488
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10489

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10492
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 10493
    unless_null $P1, __label_1
.annotate 'line', 10494
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10495
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10496

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10499
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 10500

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10503
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 10504

.end # scopesearch


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10511
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 10512

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10515
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10516

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10519
    self.'optimize_base'()
.annotate 'line', 10520
    .return(self)
# }
.annotate 'line', 10521

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10524
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10527
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10528
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10531
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
.annotate 'line', 10534
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10535
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10536
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10537
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10540
# somelib: $I1
    null $I1
.annotate 'line', 10541
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10542
    if_null $P3, __label_5
# {
.annotate 'line', 10543
    set $I1, 1
.annotate 'line', 10544
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10545
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10548
# someload: $I2
    null $I2
.annotate 'line', 10549
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10550
    if_null $P4, __label_8
# {
.annotate 'line', 10551
    set $I2, 1
.annotate 'line', 10552
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10553
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10554
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10555
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10557
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10558
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10560
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10561

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10564
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10565
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10566
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10567
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 10568
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 10569
    $P6 = $P2.'getflags'()
    set $I3, $P6
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10571
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10572
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10574

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10451
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10453
    addattribute $P0, 'unit'
.annotate 'line', 10454
    addattribute $P0, 'predefs_used'
.annotate 'line', 10455
    addattribute $P0, 'libs'
.annotate 'line', 10456
    addattribute $P0, 'loads'
.annotate 'line', 10457
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10586
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10587
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10588

.end # Builtin


.sub 'getname' :method
# Body
# {
# predefined string
.annotate 'line', 10589
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10592
    getattribute $P1, self, 'variants'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10593

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10582
    addattribute $P0, 'name'
.annotate 'line', 10583
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
# Body
# {
.annotate 'line', 10603
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
# }
.annotate 'line', 10604

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10607
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10608
# name: $S1
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10609
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 10610
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 10612
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
# }
.annotate 'line', 10613

.end # add


.sub 'put' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10616
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10617
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10618
    getattribute $P3, __ARG_1, 'functions'
    $P4 = $P1[$S1]
# predefined push
    push $P3, $P4
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10619

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 10600
    addattribute $P0, 'entries'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]

.sub 'WinxedCompileUnit' :method
        .param int __ARG_1
        .param int __ARG_2
.const 'Sub' WSubId_118 = "WSubId_118"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_119 = "WSubId_119"
# Body
# {
.annotate 'line', 10629
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 10630
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10634
    WSubId_118($P1, 'false', 0)
.annotate 'line', 10635
    WSubId_118($P1, 'true', 1)
.annotate 'line', 10640
    WSubId_111($P1, '__STAGE__', "3")
.annotate 'line', 10643
    WSubId_118($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 10646
    WSubId_118($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10649
# var builtins_ns: $P2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 10651
# var builder: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 10652
    WSubId_119($P3)
.annotate 'line', 10653
    $P3.'put'($P2)
.annotate 'line', 10655
    $P1.'usenamespace'($P2)
.annotate 'line', 10657
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10658

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 10661
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10662

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10665
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10666
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10667

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10670
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10671

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10674
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10675
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10676
    __ARG_1.'say'('')
.annotate 'line', 10678
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10680
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10681

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10684
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10685
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10687
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10689
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10690

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10624
    addattribute $P0, 'rootns'
.annotate 'line', 10625
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
# Body
# {
.annotate 'line', 10699
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 2
    $P1[1] = $I1
    null $I1
    $P1[2] = $I1
.annotate 'line', 10700
    .return($P1)
# }
.annotate 'line', 10701

.end # version


.sub 'version_string' :method
# Body
# {
# predefined string
.annotate 'line', 10704
    $P1 = self.'version'()
# predefined join
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
# }
.annotate 'line', 10705

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 10708
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10709
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10710
# var handleout: $P1
    null $P1
.annotate 'line', 10711
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10712
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10713
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10716
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10717
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10718
    unless __ARG_4 goto __label_4
.annotate 'line', 10719
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 10720
    unless __ARG_5 goto __label_5
.annotate 'line', 10721
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 10722
    __ARG_1.'emit'($P2)
.annotate 'line', 10723
    $P2.'close'()
.annotate 'line', 10724
    if_null __ARG_3, __label_6
.annotate 'line', 10725
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 10727
    $P1.'close'()
.annotate 'line', 10728
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 10729
# var object: $P3
    null $P3
# switch
.annotate 'line', 10730
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_11
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_12
    set $S3, ''
    if $S2 == $S3 goto __label_13
    goto __label_10
  __label_11: # case
.annotate 'line', 10732
    new $P3, [ 'String' ]
.annotate 'line', 10733
    assign $P3, $S1
    goto __label_9 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 10737
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 10738
    $P3 = $P4($S1)
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 10739
# predefined string
.annotate 'line', 10741
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_9: # switch end
.annotate 'line', 10743
    .return($P3)
# }
  __label_7: # endif
# }
.annotate 'line', 10745

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10748
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10749
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10750
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10751
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10752
    $P2.'close'()
.annotate 'line', 10753
    $P1.'close'()
.annotate 'line', 10754
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10755

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
.annotate 'line', 10763
    unless_null __ARG_2, __label_1
.annotate 'line', 10764
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10765
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10766
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10767
    $P1.'puts'(__ARG_1)
.annotate 'line', 10768
    $P1.'close'()
.annotate 'line', 10769
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10770
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10771
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10772
    $P3.'parse'($P2)
.annotate 'line', 10773
    $P1.'close'()
.annotate 'line', 10774
    $P3.'optimize'()
.annotate 'line', 10775
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10776
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10778
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10779

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
.annotate 'line', 10788
    unless_null __ARG_2, __label_1
.annotate 'line', 10789
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10790
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10791
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10792
    $P1.'encoding'('utf8')
.annotate 'line', 10793
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10794
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10795
    $P3.'parse'($P2)
.annotate 'line', 10796
    $P1.'close'()
.annotate 'line', 10797
    $P3.'optimize'()
.annotate 'line', 10798
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10799
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10801
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10802

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10811
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10812
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10813

.end # initializer

# End generated code
