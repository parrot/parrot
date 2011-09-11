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
.namespace [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2104
    $P2 = WSubId_40(__ARG_1, __ARG_2, WSubId_41, __ARG_3)
    setattribute self, 'args', $P2
# }
.annotate 'line', 2105

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2109
    getattribute $P1, self, 'args'
# predefined elements
    elements $I1, $P1
    .return($I1)
# }
.annotate 'line', 2110

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 2113
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2114
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 2115

.end # getarg


.sub 'optimizeargs' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2119
    getattribute $P1, self, 'args'
    WSubId_42($P1)
# }
.annotate 'line', 2120

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2123
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 2124
    getattribute $P3, self, 'args'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 2125
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2126
    .return($P1)
# }
.annotate 'line', 2127

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2130
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 2131

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
.annotate 'line', 2100
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 2143
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 2146
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2147
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $P2 = $P1.'numargs'()
    set $I1, $P2
  __label_1:
.annotate 'line', 2148
    .return($I1)
# }
.annotate 'line', 2149

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2152
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2153
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.annotate 'line', 2154
    WSubId_6('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 2155
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 2156

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2159
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 2160
    if_null __ARG_2, __label_1
.annotate 'line', 2161
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 2162

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2165
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 2166
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 2167
    .return(self)
# }
.annotate 'line', 2168

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Modifier' ]
.annotate 'line', 2140
    addattribute $P0, 'name'
.annotate 'line', 2141
    addattribute $P0, 'args'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseModifier' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2173
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2174
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2175
    $P1 = __ARG_1.'get'()
.annotate 'line', 2176
# var args: $P2
    null $P2
.annotate 'line', 2177
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 2178
    new $P4, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 2180
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 2181
    new $P4, [ 'Winxed'; 'Compiler'; 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 2182

.end # parseModifier

.namespace [ 'Winxed'; 'Compiler'; 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_43 = "WSubId_43"
# Body
# {
.annotate 'line', 2191
    $P2 = WSubId_40(__ARG_1, __ARG_2, WSubId_43, ']')
    setattribute self, 'list', $P2
# }
.annotate 'line', 2192

.end # ModifierList


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2195
    getattribute $P1, self, 'list'
    WSubId_42($P1)
# }
.annotate 'line', 2196

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 2197
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2200
    getattribute $P2, self, 'list'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 2201
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 2202
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 2204
    .return($P2)
# }
.annotate 'line', 2205

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
.annotate 'line', 2187
    addattribute $P0, 'list'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'getparrotkey' :subid('WSubId_22')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2214
# r: $S1
    null $S1
.annotate 'line', 2215
# predefined elements
    elements $I1, __ARG_1
    unless $I1 goto __label_1
.annotate 'line', 2216
# predefined string
# predefined join
    join $S2, "'; '", __ARG_1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 2217
    .return($S1)
# }
.annotate 'line', 2218

.end # getparrotkey


.sub 'parseUsing' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2222
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 2224
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 2226
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 2228
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 2225
    new $P3, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 2227
    new $P5, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 2229
    new $P7, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 2231
    __ARG_2.'unget'($P1)
.annotate 'line', 2232
    new $P9, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 2234

.end # parseUsing


.sub 'parseSig' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2238
# var params: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 2239
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 2240
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 2241
    WSubId_44("'='", $P2)
  __label_1: # endif
.annotate 'line', 2242
# var expr: $P3
    $P3 = WSubId_41(__ARG_2, __ARG_3)
.annotate 'line', 2243
    new $P5, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
    $P5.'MultiAssignStatement'(__ARG_1, __ARG_3, $P1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 2244

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
.annotate 'line', 2248
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2249
# var t2: $P2
    null $P2
.annotate 'line', 2250
    $P5 = $P1.'isop'(';')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 2251
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P6)
  __label_1: # endif
.annotate 'line', 2252
    $P5 = $P1.'isop'('{')
    if_null $P5, __label_2
    unless $P5 goto __label_2
.annotate 'line', 2253
    new $P7, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P7.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 2254
    $P5 = $P1.'isop'('${')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 2255
    new $P7, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
    $P7.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 2256
    $P5 = $P1.'isop'(':')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 2257
# var open: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 2258
    $P5 = $P3.'isop'('(')
    isfalse $I1, $P5
    unless $I1 goto __label_5
.annotate 'line', 2259
    WSubId_45("':'", $P1)
  __label_5: # endif
.annotate 'line', 2260
    .tailcall WSubId_46($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 2263
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
.annotate 'line', 2265
    .tailcall WSubId_47($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 2267
    .tailcall WSubId_48($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 2270
    .tailcall WSubId_49($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 2273
    $P2 = __ARG_1.'get'()
.annotate 'line', 2274
    __ARG_1.'unget'($P2)
.annotate 'line', 2275
    $P6 = $P2.'isop'("(")
    isfalse $I1, $P6
    unless $I1 goto __label_27
.annotate 'line', 2276
    .tailcall WSubId_50($P1, __ARG_1, __ARG_2)
  __label_27: # endif
    goto __label_6 # break
  __label_12: # case
.annotate 'line', 2279
    $P2 = __ARG_1.'get'()
.annotate 'line', 2280
    __ARG_1.'unget'($P2)
.annotate 'line', 2281
    $P7 = $P2.'isop'("(")
    isfalse $I2, $P7
    unless $I2 goto __label_28
.annotate 'line', 2282
    .tailcall WSubId_51($P1, __ARG_1, __ARG_2)
  __label_28: # endif
    goto __label_6 # break
  __label_13: # case
.annotate 'line', 2285
    $P2 = __ARG_1.'get'()
.annotate 'line', 2286
    __ARG_1.'unget'($P2)
.annotate 'line', 2287
    $P8 = $P2.'isop'("(")
    isfalse $I3, $P8
    unless $I3 goto __label_29
.annotate 'line', 2288
    .tailcall WSubId_52($P1, __ARG_1, __ARG_2)
  __label_29: # endif
    goto __label_6 # break
  __label_14: # case
.annotate 'line', 2291
    $P2 = __ARG_1.'get'()
.annotate 'line', 2292
    __ARG_1.'unget'($P2)
.annotate 'line', 2293
    $P9 = $P2.'isop'("(")
    isfalse $I4, $P9
    unless $I4 goto __label_30
.annotate 'line', 2294
    .tailcall WSubId_53($P1, __ARG_1, __ARG_2)
  __label_30: # endif
    goto __label_6 # break
  __label_15: # case
.annotate 'line', 2297
    new $P11, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
    $P11.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P10, $P11
    .return($P10)
  __label_16: # case
.annotate 'line', 2299
    new $P13, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
    $P13.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P12, $P13
    .return($P12)
  __label_17: # case
.annotate 'line', 2301
    new $P15, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
    $P15.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P14, $P15
    .return($P14)
  __label_18: # case
.annotate 'line', 2303
    new $P17, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
    $P17.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_19: # case
.annotate 'line', 2305
    new $P19, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
    $P19.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_20: # case
.annotate 'line', 2307
    new $P21, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
    $P21.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_21: # case
.annotate 'line', 2309
    new $P23, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
    $P23.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_22: # case
.annotate 'line', 2311
    new $P25, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
    $P25.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_23: # case
.annotate 'line', 2313
    .tailcall WSubId_54($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 2315
    .tailcall WSubId_55($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 2317
    new $P27, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
    $P27.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_26: # case
.annotate 'line', 2319
    new $P29, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
    $P29.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_7: # default
  __label_6: # switch end
.annotate 'line', 2322
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_31
    unless $P5 goto __label_31
# {
.annotate 'line', 2323
# var t2: $P4
    $P4 = __ARG_1.'get'()
.annotate 'line', 2324
    $P5 = $P4.'isop'(':')
    if_null $P5, __label_32
    unless $P5 goto __label_32
.annotate 'line', 2325
    new $P7, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
    $P7.'LabelStatement'($P1, __ARG_2)
    set $P6, $P7
    .return($P6)
  __label_32: # endif
.annotate 'line', 2326
    __ARG_1.'unget'($P4)
# }
  __label_31: # endif
.annotate 'line', 2328
    __ARG_1.'unget'($P1)
.annotate 'line', 2329
    new $P6, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
    $P6.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 2330

.end # parseStatement

.namespace [ 'Winxed'; 'Compiler'; 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2340
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2341

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2342
    .return(0)
# }

.end # isempty


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 2345
    getattribute $P1, self, 'owner'
    .tailcall $P1.'allowtailcall'()
# }
.annotate 'line', 2346

.end # allowtailcall


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2349
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 2350

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2353
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2354

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 2357
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 2358

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2361
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2362

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2365
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 2366

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2369
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 2370

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2373
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2374

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2377
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2378

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2381
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 2382

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2385
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarnamed'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 2386

.end # createvarnamed


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2389
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2390

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2393
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2394

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2397
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2398

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2405
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2406

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2409
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2410

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2413
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2414

.end # getbreaklabel


.sub 'optimize' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2417
    getattribute $P1, self, 'start'
    WSubId_6('**checking**', $P1)
.annotate 'line', 2419
    .return(self)
# }
.annotate 'line', 2420

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Statement' ]
.annotate 'line', 2336
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2425
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2428
    WSubId_6('Attempt to annotate empty statement')
# }
.annotate 'line', 2429

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2430
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
.annotate 'line', 2423
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2443
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2444
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2445
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2446
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2447
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2448
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2449
    null $I2
  __label_4: # endif
.annotate 'line', 2450
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2446
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2452
    unless $I2 goto __label_7
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    goto __label_6
  __label_7:
    set $P3, self
  __label_6:
    .return($P3)
# }
.annotate 'line', 2453

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
.annotate 'line', 2439
    addattribute $P0, 'statements'
.end
.namespace [ 'Winxed'; 'Compiler'; 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2460
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 2
    $P1[0] = __ARG_1
    $P1[1] = __ARG_2
.annotate 'line', 2461
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2462

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2463
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2466
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2467
    .return(self)
# }
.annotate 'line', 2468

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 2471
    getattribute $P1, self, 'statements'
    WSubId_56(__ARG_1, $P1)
# }
.annotate 'line', 2472

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
.annotate 'line', 2456
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
.annotate 'line', 2478
    isnull $I1, __ARG_1
    if $I1 goto __label_3
.annotate 'line', 2480
    isa $I1, __ARG_1, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2479
    .return(__ARG_2)
  __label_4: # case
.annotate 'line', 2481
    .tailcall __ARG_1.'push'(__ARG_2)
  __label_2: # default
.annotate 'line', 2483
    new $P2, [ 'Winxed'; 'Compiler'; 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 2485

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 2493
# var arg: $P1
    null $P1
.annotate 'line', 2494
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2495
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2496
    $P2 = __ARG_1.'get'()
.annotate 'line', 2497
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2498
    new $P3, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2501
    __ARG_1.'unget'($P2)
.annotate 'line', 2502
    $P1 = WSubId_41(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2504
    .return($P1)
# }
.annotate 'line', 2505

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
.annotate 'line', 2514
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2515
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2516
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2517
    unless $I1 goto __label_1
.annotate 'line', 2518
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2519
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2520
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2521
    $P1 = __ARG_2.'get'()
.annotate 'line', 2522
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2523
    __ARG_2.'unget'($P1)
.annotate 'line', 2524
    $P3 = WSubId_40(__ARG_2, __ARG_3, WSubId_57, '}')
    setattribute self, 'args', $P3
# }
  __label_5: # endif
.annotate 'line', 2526
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 2527

.end # PiropStatement


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 2530
    getattribute $P1, self, 'args'
    WSubId_42($P1)
.annotate 'line', 2531
    .return(self)
# }
.annotate 'line', 2532

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2535
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2536
    self.'annotate'(__ARG_1)
.annotate 'line', 2537
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2538
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2539
    __ARG_1.'print'('    ')
.annotate 'line', 2540
    unless_null $P1, __label_2
.annotate 'line', 2541
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2543
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2544
    if_null $P1, __label_5
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2545
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2546
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2548

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'PiropStatement' ]
.annotate 'line', 2507
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2509
    addattribute $P0, 'opname'
.annotate 'line', 2510
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
.annotate 'line', 2560
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2561
# var path: $P1
    $P1 = WSubId_59(__ARG_2)
.annotate 'line', 2562
# predefined elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2563
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2564
    WSubId_58(';', __ARG_2)
.annotate 'line', 2565
    $P3 = WSubId_60($P1)
    setattribute self, 'path', $P3
.annotate 'line', 2566
    .return(self)
# }
.annotate 'line', 2567

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2568
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2571
    self.'annotate'(__ARG_1)
.annotate 'line', 2572
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2573

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExternStatement' ]
.annotate 'line', 2555
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2557
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
.annotate 'line', 2585
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2586
# var names: $P1
    null $P3
    $P1 = WSubId_40(__ARG_2, $P3, WSubId_61, ';')
.annotate 'line', 2587
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2588
# id: $S1
    $P3 = self.'generatesubid'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2589
    self.'createvarnamed'($P2, 'P', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 2591
    setattribute self, 'names', $P1
# }
.annotate 'line', 2592

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2595
    .return(self)
# }
.annotate 'line', 2596

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2599
    self.'annotate'(__ARG_1)
.annotate 'line', 2600
    getattribute $P3, self, 'names'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 2601
# var v: $P2
    $P2 = self.'getvar'($P1)
.annotate 'line', 2602
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, " = '", $P1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2604

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StaticStatement' ]
.annotate 'line', 2580
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2582
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
.annotate 'line', 2618
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2619
# var path: $P1
    $P1 = WSubId_59(__ARG_2)
.annotate 'line', 2620
# predefined elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2621
    $P2 = __ARG_2.'get'()
    WSubId_3($P2)
  __label_1: # endif
.annotate 'line', 2622
    WSubId_58(';', __ARG_2)
.annotate 'line', 2623
    setattribute self, 'path', $P1
# }
.annotate 'line', 2624

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2627
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2628
# var name: $P2
    $P2 = $P1[-1]
.annotate 'line', 2630
# var symbol: $P3
    $P3 = self.'scopesearch'($P1, 0)
# switch-case
.annotate 'line', 2632
    isnull $I1, $P3
    if $I1 goto __label_3
.annotate 'line', 2646
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2633
# predefined elements
    elements $I2, $P1
    unless $I2 goto __label_5
# {
.annotate 'line', 2634
# var p: $P4
# predefined clone
    clone $P4, $P1
.annotate 'line', 2635
    $P4.'pop'()
.annotate 'line', 2636
# var ns: $P5
    $P5 = self.'scopesearch'($P4, 1)
.annotate 'line', 2637
    if_null $P5, __label_6
# {
.annotate 'line', 2638
    $P3 = $P5.'getvar'($P2)
.annotate 'line', 2639
    if_null $P3, __label_7
# {
.annotate 'line', 2640
    self.'createvarused'($P2, $P3)
.annotate 'line', 2641
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
.annotate 'line', 2647
# subid: $S1
    $P6 = $P3.'makesubid'()
    null $S1
    if_null $P6, __label_8
    set $S1, $P6
  __label_8:
.annotate 'line', 2648
    self.'createvarnamed'($P2, 'P', $S1)
.annotate 'line', 2649
    box $P7, $S1
    setattribute self, 'subid', $P7
.annotate 'line', 2650
    self.'usesubid'($S1)
.annotate 'line', 2651
    .return(self)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2653
    self.'createvar'($P2, 'P')
.annotate 'line', 2654
    .return(self)
# }
.annotate 'line', 2655

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 2658
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2659
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2660
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2661
    getattribute $P3, self, 'subid'
    unless_null $P3, __label_1
# {
.annotate 'line', 2662
    self.'annotate'(__ARG_1)
.annotate 'line', 2663
# key: $S2
    null $S2
.annotate 'line', 2664
# predefined elements
    elements $I1, $P1
    le $I1, 1, __label_2
# {
.annotate 'line', 2665
    $P1.'pop'()
.annotate 'line', 2666
    $P3 = WSubId_22($P1)
    set $S2, $P3
# }
  __label_2: # endif
.annotate 'line', 2668
    $P3 = $P2.'getreg'()
    __ARG_1.'emitget_hll_global'($P3, $S1, $S2)
# }
  __label_1: # endif
# }
.annotate 'line', 2670

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingStatement' ]
.annotate 'line', 2611
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2613
    addattribute $P0, 'path'
.annotate 'line', 2614
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
.annotate 'line', 2680
# var nskey: $P1
    $P1 = WSubId_59(__ARG_2)
.annotate 'line', 2681
# predefined elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 2682
    WSubId_44('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2683
# var nssym: $P2
    $P2 = __ARG_3.'scopesearch'($P1, 1)
.annotate 'line', 2684
    unless_null $P2, __label_2
.annotate 'line', 2685
    WSubId_1('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2686
    __ARG_3.'usenamespace'($P2)
# }
.annotate 'line', 2687

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
.annotate 'line', 2693
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2694
    WSubId_62(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 2695
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 2696

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2699
    .return(self)
# }
.annotate 'line', 2700

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'UsingNamespaceStatement' ]
.annotate 'line', 2689
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
.annotate 'line', 2715
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2716
    $P2 = WSubId_41(__ARG_2, self)
    setattribute self, 'expr', $P2
.annotate 'line', 2717
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 2718

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2721
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2722
    .return(self)
# }
.annotate 'line', 2723

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2726
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2727

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ExprStatement' ]
.annotate 'line', 2710
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2712
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
.annotate 'line', 2744
    setattribute self, 'type', __ARG_1
.annotate 'line', 2745
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2746
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2747
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2748

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2751
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2752

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2753
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2754
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2755
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2756
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2757
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2758
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2759
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags


.sub 'issubid' :method
# Body
# {
.annotate 'line', 2762
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 2763
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
.annotate 'line', 2764

.end # issubid

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData' ]
.annotate 'line', 2736
    addattribute $P0, 'type'
.annotate 'line', 2737
    addattribute $P0, 'reg'
.annotate 'line', 2738
    addattribute $P0, 'scope'
.annotate 'line', 2739
    addattribute $P0, 'flags'
.annotate 'line', 2740
    addattribute $P0, 'lexname'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2772
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2773

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2776
    getattribute $P1, self, 'name'
    WSubId_6('Attempt to use unexpanded constant!!!', $P1)
# }
.annotate 'line', 2777

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
.annotate 'line', 2769
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
.annotate 'line', 2786
    new $P2, [ 'Winxed'; 'Compiler'; 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2787

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2788
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 2791
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.annotate 'line', 2792
    WSubId_6('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2793
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2794

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
.annotate 'line', 2780
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2782
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2805
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2806

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2809
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2810
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2811
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2812
    if_null $P2, __label_2
.annotate 'line', 2813
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    WSubId_1($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2814
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2815
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2816
    $P1[$S1] = $P3
.annotate 'line', 2817
    .return($P3)
# }
.annotate 'line', 2818

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2821
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2822
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2823
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2824
    if_null $P2, __label_2
.annotate 'line', 2825
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2826
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2827

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2830
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2831
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2832
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2833
    if_null $P2, __label_2
.annotate 'line', 2834
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2835
    new $P4, [ 'Winxed'; 'Compiler'; 'VarData' ]
    $P4.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P4
    $P1[$S1] = $P3
# }
.annotate 'line', 2836

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2839
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2840
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2841
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2842
    if_null $P2, __label_2
.annotate 'line', 2843
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    WSubId_1($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2844
# var data: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2845
    $P1[$S1] = $P3
.annotate 'line', 2846
    .return($P3)
# }
.annotate 'line', 2847

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2850
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2851
    set $S1, __ARG_1
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2852

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2855
# var sym: $P1
    null $P1
.annotate 'line', 2856
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 2857
    $P1 = $P2.'getlocalvar'(__ARG_1)
    if_null $P1, __label_3
.annotate 'line', 2858
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P3
.annotate 'line', 2860
    .return($P3)
# }
.annotate 'line', 2861

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2864
# var sym: $P1
    null $P1
.annotate 'line', 2865
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2866
    .return($P1)
  __label_1: # endif
.annotate 'line', 2867
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2868
    .return($P1)
  __label_2: # endif
.annotate 'line', 2869
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2870
    if_null $P2, __label_3
.annotate 'line', 2871
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2872
    .return($P3)
# }
.annotate 'line', 2873

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2876
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2877
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2878
    .return($S1)
# }
.annotate 'line', 2879

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2882
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2884
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2885
    .return('__WLEX_self')
# }
.annotate 'line', 2886

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
.annotate 'line', 2800
    addattribute $P0, 'locals'
.annotate 'line', 2801
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
.annotate 'line', 2895
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
.annotate 'line', 2907
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2908

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2909
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2910
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2911
    .return(0)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
.annotate 'line', 2912
    .return(0)
# }

.end # isintegerzero


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2913
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2914
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2915
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2916
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2917
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2918
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2921
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2922

.end # tempreg


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 2925
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 2926

.end # genlabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2930
    .return(self)
# }
.annotate 'line', 2931

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2932
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2935
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2936
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $P1 = self.'tempreg'($S1)
    set $S2, $P1
  __label_2:
.annotate 'line', 2937
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2938
    .return($S2)
# }
.annotate 'line', 2939

.end # emit_get


.sub 'emit_get_nonull' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 2942
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 2943
    WSubId_1("Invalid 'null' usage", self)
  __label_1: # endif
.annotate 'line', 2944
    .tailcall self.'emit_get'(__ARG_1)
# }
.annotate 'line', 2945

.end # emit_get_nonull


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2948
# reg: $S1
    null $S1
.annotate 'line', 2949
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2950
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2952
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2953
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2955
    .return($S1)
# }
.annotate 'line', 2956

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 2959
    WSubId_63(self)
# }
.annotate 'line', 2960

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Expr' ]
.annotate 'line', 2903
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2965
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
.annotate 'line', 2963
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
.annotate 'line', 2975
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2976
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2977
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 2978
    WSubId_44('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2979
    new $P4, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
    $P4.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P3, $P4
    setattribute self, 'fn', $P3
# }
.annotate 'line', 2980

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2981
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2984
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2985
    getattribute $P2, self, 'fn'
    $P1 = $P2.'getsubid'()
    self.'usesubid'($P1)
.annotate 'line', 2986
    .return(self)
# }
.annotate 'line', 2987

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2990
    self.'annotate'(__ARG_1)
.annotate 'line', 2991
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2992
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2993
# subid: $S1
    $P2 = $P1.'getsubid'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2994
    $P2 = $P1.'needclosure'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 2995
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
    goto __label_4
  __label_3: # else
.annotate 'line', 2997
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2999

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
.annotate 'line', 2970
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2972
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
.annotate 'line', 3014
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 3015
    .return(self)
# }
.annotate 'line', 3016

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 3019
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 3020

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3023
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 3024
    .return(self)
# }
.annotate 'line', 3025

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 3028
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3029
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 3030
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
.annotate 'line', 3031
    .return(0)
# }
.annotate 'line', 3032

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3035
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3037
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3038
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3039
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3041
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3042
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
.annotate 'line', 3045
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3048
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3051
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3054

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3057
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 3059
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 3060
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 3061
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3063
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 3064
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
.annotate 'line', 3067
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 3070
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3073
    WSubId_6('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3076

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Condition' ]
.annotate 'line', 3011
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 3083
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 3084
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Literal' ]
.annotate 'line', 3081
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3094
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3095
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 3096

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 3097
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3098
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 3101
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3102
# str: $S1
    $P2 = $P1.'getPirString'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3103
    .return($S1)
# }
.annotate 'line', 3104

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 3107
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 3108
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3109
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    unless $I1 goto __label_2
.annotate 'line', 3110
# predefined unescape
    $P0 = new ['String']
    $P0 = $S1
    $S1 = $P0.'unescape'('utf8')
  __label_2: # endif
.annotate 'line', 3111
    .return($S1)
# }
.annotate 'line', 3112

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3115
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 3116
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 3117

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3120
    .tailcall self.'getPirString'()
# }
.annotate 'line', 3121

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
.annotate 'line', 3089
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3091
    addattribute $P0, 'strval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3132
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3133
    setattribute self, 'pos', __ARG_2
.annotate 'line', 3134
# n: $I1
    set $P1, __ARG_3
    set $I1, $P1
.annotate 'line', 3135
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 3136

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 3137
    .return(1)
# }

.end # isintegerliteral


.sub 'isintegerzero' :method
# Body
# {
# predefined int
.annotate 'line', 3140
    getattribute $P1, self, 'numval'
    set $I2, $P1
    iseq $I1, $I2, 0
    .return($I1)
# }
.annotate 'line', 3141

.end # isintegerzero


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3142
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 3145
    getattribute $P1, self, 'numval'
    .return($P1)
# }
.annotate 'line', 3146

.end # getIntegerValue


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3149
# value: $N1
    $P1 = self.'getIntegerValue'()
    set $N1, $P1
.annotate 'line', 3150
    .return($N1)
# }
.annotate 'line', 3151

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3154
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 3155
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 3156
    if $I1 goto __label_2
.annotate 'line', 3157
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 3159
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 3161

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3164
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 3165

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntegerLiteral' ]
.annotate 'line', 3126
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3128
    addattribute $P0, 'pos'
.annotate 'line', 3129
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3175
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3176
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 3177

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 3178
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3179
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 3182
# value: $N1
    getattribute $P2, self, 'numval'
    $P1 = $P2.'getfloatvalue'()
    set $N1, $P1
.annotate 'line', 3183
    .return($N1)
# }
.annotate 'line', 3184

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3187
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3188
# n: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3189
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3191

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_64 = "WSubId_64"
# Body
# {
.annotate 'line', 3194
# value: $N1
    $P1 = self.'getFloatValue'()
    set $N1, $P1
.annotate 'line', 3195
    .tailcall WSubId_64($N1)
# }
.annotate 'line', 3196

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
.annotate 'line', 3170
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 3172
    addattribute $P0, 'numval'
.end
.namespace [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 3205
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3208
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3209
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 3210

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 3213
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3214
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
    if_null $P2, __label_1
.annotate 'line', 3215
    .return(0)
  __label_1: # endif
.annotate 'line', 3216
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 3217

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3220
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3221
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3222
    if_null $P2, __label_1
.annotate 'line', 3223
    .tailcall $P2.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 3225
    set $S1, $P1
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 3228
    .return('P')
  __label_4: # default
.annotate 'line', 3230
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 3233

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 3236
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3237
    .return($S1)
# }
.annotate 'line', 3238

.end # getName


.sub 'checkVar' :method
# Body
# {
.annotate 'line', 3241
    getattribute $P1, self, 'owner'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    .tailcall $P1.'getvar'($S1)
# }
.annotate 'line', 3242

.end # checkVar


.sub 'checkIdentifier' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 3245
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3246
    unless_null $P1, __label_1
.annotate 'line', 3247
    WSubId_6('Bad thing')
  __label_1: # endif
.annotate 'line', 3248
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getvar'($P1)
.annotate 'line', 3249
# s: $S1
    null $S1
.annotate 'line', 3250
    unless_null $P2, __label_2
# {
# switch
.annotate 'line', 3251
    set $S2, $P1
    set $S3, 'self'
    if $S2 == $S3 goto __label_6
    set $S3, 'null'
    if $S2 == $S3 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 3254
    set $S1, $P1
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3256
    set $S1, ''
  __label_4: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 3260
    $P3 = $P2.'getreg'()
    set $S1, $P3
  __label_3: # endif
.annotate 'line', 3261
    .return($S1)
# }
.annotate 'line', 3262

.end # checkIdentifier


.sub 'getIdentifier' :method
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 3265
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 3266
    set $S1, $P1
    ne $S1, '', __label_1
.annotate 'line', 3267
    getattribute $P2, self, 'name'
    WSubId_65($P2)
  __label_1: # endif
.annotate 'line', 3268
    .return($P1)
# }
.annotate 'line', 3269

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3272
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 3273
# var desc: $P2
    getattribute $P5, self, 'owner'
    $P2 = $P5.'getvar'($P1)
.annotate 'line', 3274
    if_null $P2, __label_1
# {
.annotate 'line', 3275
    $P5 = $P2.'isconst'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 3276
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 3277
# flags: $I1
    $P5 = $P2.'getflags'()
    set $I1, $P5
.annotate 'line', 3278
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 3279
    band $I3, $I1, 2
    unless $I3 goto __label_6
.annotate 'line', 3280
    new $P6, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    $P6.'LexicalVolatileExpr'(self, $P2)
    set $P5, $P6
    .return($P5)
  __label_6: # endif
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3287
# var reg: $P3
    $P3 = $P2.'getreg'()
.annotate 'line', 3288
    isnull $I2, $P3
    not $I2
    unless $I2 goto __label_8
    set $S3, $P3
# predefined substr
    substr $S2, $S3, 0, 7
    iseq $I2, $S2, 'WSubId_'
  __label_8:
    unless $I2 goto __label_7
.annotate 'line', 3289
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
.annotate 'line', 3293
# var sym: $P4
    root_new $P5, ['parrot';'ResizablePMCArray']
    assign $P5, 1
    $P5[0] = $P1
    $P4 = self.'scopesearch'($P5, 0)
.annotate 'line', 3294
    isnull $I2, $P4
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P4, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 3295
    $P5 = $P4.'ismulti'()
    isfalse $I3, $P5
    unless $I3 goto __label_11
# {
.annotate 'line', 3296
# id: $S1
    $P6 = $P4.'makesubid'()
    null $S1
    if_null $P6, __label_12
    set $S1, $P6
  __label_12:
.annotate 'line', 3297
    box $P5, $S1
    setattribute self, 'subid', $P5
.annotate 'line', 3298
    self.'usesubid'($S1)
.annotate 'line', 3299
    getattribute $P5, self, 'owner'
    $P5.'createvarnamed'($P1, 'P', $S1)
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_2: # endif
.annotate 'line', 3303
    .return(self)
# }
.annotate 'line', 3304

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3307
# id: $S1
    null $S1
.annotate 'line', 3308
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
.annotate 'line', 3309
    getattribute $P3, self, 'subid'
    set $S1, $P3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 3311
    $P4 = self.'getIdentifier'()
    set $S1, $P4
.annotate 'line', 3312
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 3313
# flags: $I1
    unless_null $P1, __label_4
    null $I1
    goto __label_3
  __label_4:
    $P2 = $P1.'getflags'()
    set $I1, $P2
  __label_3:
.annotate 'line', 3314
    band $I2, $I1, 1
    unless $I2 goto __label_5
# {
.annotate 'line', 3315
    band $I3, $I1, 2
    unless $I3 goto __label_6
# {
.annotate 'line', 3316
# lexname: $S2
    $P2 = $P1.'getlex'()
    null $S2
    if_null $P2, __label_7
    set $S2, $P2
  __label_7:
.annotate 'line', 3317
    isnull $I2, $S2
    not $I2
    unless $I2 goto __label_9
    isne $I2, $S2, ''
  __label_9:
    unless $I2 goto __label_8
.annotate 'line', 3318
    __ARG_1.'emitfind_lex'($S1, $S2)
  __label_8: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 3322
    .return($S1)
# }
.annotate 'line', 3323

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3326
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3327
    self.'annotate'(__ARG_1)
.annotate 'line', 3328
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3329
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3331

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3334
    self.'annotate'(__ARG_1)
.annotate 'line', 3335
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 3336

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3339
    self.'annotate'(__ARG_1)
.annotate 'line', 3340
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 3341
    WSubId_1("Cannot assign to null", self)
  __label_1: # endif
.annotate 'line', 3342
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3343
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 3344
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 3345
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 3348
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 3351
    WSubId_1("Can't assign null to that type", self)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3354
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 3355
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 3357
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 3358
    ne $S3, 'v', __label_13
.annotate 'line', 3359
    WSubId_1("Can't assign from void expression", self)
  __label_13: # endif
.annotate 'line', 3360
    ne $S1, $S3, __label_14
# {
.annotate 'line', 3361
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 3364
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 3365
    self.'annotate'(__ARG_1)
.annotate 'line', 3366
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 3367
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 3369
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 3372
    .return($S2)
# }
.annotate 'line', 3373

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
.annotate 'line', 3201
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 3203
    addattribute $P0, 'name'
.annotate 'line', 3204
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3383
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3384
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3385

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3388
    getattribute $P1, self, 'desc'
    .tailcall $P1.'gettype'()
# }
.annotate 'line', 3389

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3392
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3393
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3394
# reg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3395
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3396
    .return($S2)
# }
.annotate 'line', 3397

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3400
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3401
    self.'annotate'(__ARG_1)
.annotate 'line', 3402
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3403
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3405

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3408
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3409
# typelex: $S1
    $P2 = $P1.'gettype'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3410
# lreg: $S2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'gettype'()
    $P2 = $P3.'tempreg'($P4)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
# switch-case
.annotate 'line', 3412
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_5
.annotate 'line', 3415
    isa $I1, __ARG_2, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    if $I1 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 3413
    __ARG_1.'emitnull'($S2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 3416
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 3419
# typeright: $S3
    $P2 = __ARG_2.'checkresult'()
    null $S3
    if_null $P2, __label_7
    set $S3, $P2
  __label_7:
.annotate 'line', 3420
    iseq $I2, $S1, $S3
    if $I2 goto __label_10
    isne $I2, $S1, 'P'
  __label_10:
    unless $I2 goto __label_8
.annotate 'line', 3421
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 3423
# rreg: $S4
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_11
    set $S4, $P3
  __label_11:
.annotate 'line', 3424
    self.'annotate'(__ARG_1)
.annotate 'line', 3425
    __ARG_1.'emitbox'($S2, $S4)
# }
  __label_9: # endif
  __label_3: # switch end
.annotate 'line', 3429
    $P2 = $P1.'getlex'()
    __ARG_1.'emitstore_lex'($P2, $S2)
# }
.annotate 'line', 3430

.end # emit_assign_get


.sub 'emit_store' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3433
    getattribute $P2, self, 'desc'
    $P1 = $P2.'getlex'()
    __ARG_1.'emitstore_lex'($P1, __ARG_2)
# }
.annotate 'line', 3434

.end # emit_store

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
.annotate 'line', 3378
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3380
    addattribute $P0, 'desc'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3443
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3444

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
.annotate 'line', 3439
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
.annotate 'line', 3454
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3455
    $P2 = WSubId_59(__ARG_1)
    setattribute self, 'key', $P2
.annotate 'line', 3456
    getattribute $P1, self, 'key'
# predefined elements
    elements $I1, $P1
    if $I1 goto __label_1
.annotate 'line', 3457
    WSubId_44('namespace identifier', __ARG_3)
  __label_1: # endif
# }
.annotate 'line', 3458

.end # OpNamespaceExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3459
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3462
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3463
# var sym: $P2
    getattribute $P4, self, 'key'
    $P2 = $P1.'scopesearch'($P4, 1)
.annotate 'line', 3464
    unless_null $P2, __label_1
.annotate 'line', 3465
    getattribute $P4, self, 'start'
    WSubId_1('unknown namespace', $P4)
  __label_1: # endif
.annotate 'line', 3466
# var path: $P3
    $P3 = $P2.'getpath'()
.annotate 'line', 3467
    $P3.'emit_get_namespace'(__ARG_1, $P1, __ARG_2)
# }
.annotate 'line', 3468

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
.annotate 'line', 3449
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3451
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
.annotate 'line', 3479
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3480
    $P2 = WSubId_66(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3481

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3482
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3485
# var owner: $P1
    getattribute $P1, self, 'owner'
.annotate 'line', 3486
# var clspec: $P2
    getattribute $P2, self, 'clspec'
.annotate 'line', 3489
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3490
    getattribute $P4, self, 'owner'
    __ARG_2 = $P4.'tempreg'('P')
  __label_1: # endif
# switch-case
.annotate 'line', 3494
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    if $I1 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 3495
# var clkey: $P3
    $P3 = $P2.'checknskey'($P1)
.annotate 'line', 3496
    if_null $P3, __label_5
# {
.annotate 'line', 3497
    $P3.'emit_get_class'(__ARG_1, $P1, __ARG_2)
.annotate 'line', 3498
    .return()
# }
  __label_5: # endif
    goto __label_2 # break
  __label_3: # default
  __label_2: # switch end
.annotate 'line', 3503
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3504
    getattribute $P4, self, 'owner'
    $P2.'emit'(__ARG_1, $P4)
.annotate 'line', 3505
    __ARG_1.'say'()
# }
.annotate 'line', 3506

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
.annotate 'line', 3473
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3475
    addattribute $P0, 'clspec'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3516
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3517
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3518

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3521
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3522

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3525
    self.'optimizearg'()
.annotate 'line', 3526
    .return(self)
# }
.annotate 'line', 3527

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
.annotate 'line', 3511
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3513
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
.annotate 'line', 3538
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3539
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3540
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3541

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3544
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3545
    .return(self)
# }
.annotate 'line', 3546

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3549
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3550

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3553
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3554
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3555

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3558
    self.'optimizearg'()
.annotate 'line', 3559
    .return(self)
# }
.annotate 'line', 3560

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3563
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3564

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3567
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3568

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
.annotate 'line', 3532
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3534
    addattribute $P0, 'lexpr'
.annotate 'line', 3535
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3577
    .return('I')
# }
.annotate 'line', 3578

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3581
    self.'optimizearg'()
.annotate 'line', 3582
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3583
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3584
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3585
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3586
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 3587
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'do_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 3589
    .return(self)
# }
.annotate 'line', 3590

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
.annotate 'line', 3573
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3599
    .return('I')
# }
.annotate 'line', 3600

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDelExBase' ]
.annotate 'line', 3595
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
.annotate 'line', 3608
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3609

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3612
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3613
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3614
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3615
    self.'annotate'(__ARG_1)
.annotate 'line', 3616
    __ARG_1.'print'('    delete ')
.annotate 'line', 3617
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3618
    __ARG_1.'say'()
.annotate 'line', 3619
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3620
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 3623
    WSubId_1("delete with invalid operator", self)
  __label_2: # endif
# }
.annotate 'line', 3624

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
.annotate 'line', 3604
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
.annotate 'line', 3631
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3632

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3635
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3636
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
.annotate 'line', 3637
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3638
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3639
    self.'annotate'(__ARG_1)
.annotate 'line', 3640
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3641
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3642
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 3645
    WSubId_1("exists with invalid operator", self)
  __label_5: # endif
# }
.annotate 'line', 3646

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
.annotate 'line', 3627
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
.annotate 'line', 3655
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3656

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3659
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3660

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3663
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3664
    .return(self)
# }
.annotate 'line', 3665

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 3668
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3669
    self.'optimizearg'()
.annotate 'line', 3670
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3671
# i: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3672
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3675
    $P2 = $P1.'isfloatliteral'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
# {
.annotate 'line', 3676
# n: $N1
    $P3 = $P1.'getFloatValue'()
    set $N1, $P3
.annotate 'line', 3677
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    neg $N2, $N1
    .tailcall WSubId_67($P2, $P3, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3680
    .return(self)
# }
.annotate 'line', 3681

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3684
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3685
    self.'annotate'(__ARG_1)
.annotate 'line', 3686
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3687

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
.annotate 'line', 3651
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
.annotate 'line', 3696
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3697

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3698
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3701
    .return('I')
# }
.annotate 'line', 3702

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3705
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3706
    .return(self)
# }
.annotate 'line', 3707

.end # set


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 3710
    self.'optimizearg'()
.annotate 'line', 3711
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3712
    $P2 = $P1.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 3713
# n: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 3714
    getattribute $P2, self, 'owner'
    getattribute $P3, $P1, 'start'
    not $I2, $I1
    .tailcall WSubId_21($P2, $P3, $I2)
# }
  __label_1: # endif
.annotate 'line', 3716
    $P2 = $P1.'isnegable'()
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 3717
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3718
    .return(self)
# }
.annotate 'line', 3719

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3722
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3723

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3726
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3727
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3728
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3729
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3731
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3734
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3737
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3739

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
.annotate 'line', 3692
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3748
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3749

.end # checkresult


.sub 'iflexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3752
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3753
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'LexicalVolatileExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 3754
    $P1.'emit_store'(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 3755

.end # iflexical

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpIncDec' ]
.annotate 'line', 3744
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3764
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3765
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3766
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3767

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncDec' ]
.annotate 'line', 3760
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
.annotate 'line', 3774
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3775

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3778
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3779
    self.'annotate'(__ARG_1)
.annotate 'line', 3780
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3781
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3782
    .return($S1)
# }
.annotate 'line', 3783

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
.annotate 'line', 3770
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
.annotate 'line', 3790
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3791

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3794
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3795
    self.'annotate'(__ARG_1)
.annotate 'line', 3796
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3797
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3798
    .return($S1)
# }
.annotate 'line', 3799

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
.annotate 'line', 3786
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
.annotate 'line', 3808
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3809

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3812
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3813
    self.'annotate'(__ARG_1)
.annotate 'line', 3814
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3815
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3816
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3817
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3818
    .return($S1)
# }
.annotate 'line', 3819

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
.annotate 'line', 3804
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
.annotate 'line', 3826
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3827

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3830
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3831
    self.'annotate'(__ARG_1)
.annotate 'line', 3832
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3833
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3834
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3835
    self.'iflexical'(__ARG_1, $S1)
.annotate 'line', 3836
    .return($S1)
# }
.annotate 'line', 3837

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
.annotate 'line', 3822
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
.annotate 'line', 3848
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3849
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3850
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3851
    .return(self)
# }
.annotate 'line', 3852

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3855
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3856

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3859
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3860
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3861
    .return(self)
# }
.annotate 'line', 3862

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3865
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3866

.end # optimize


.sub 'checkleft' :method
.const 'Sub' WSubId_63 = "WSubId_63"
# Body
# {
.annotate 'line', 3869
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3870
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
    $I1 = $P1.'isliteral'()
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 3871
    WSubId_63($P1)
  __label_1: # endif
# }
.annotate 'line', 3872

.end # checkleft


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3875
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3876
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3877
    self.'annotate'(__ARG_1)
.annotate 'line', 3878
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3880

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
.annotate 'line', 3842
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3844
    addattribute $P0, 'lexpr'
.annotate 'line', 3845
    addattribute $P0, 'rexpr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3889
    self.'annotate'(__ARG_1)
.annotate 'line', 3890
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3891
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3892

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
.annotate 'line', 3885
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3901
    self.'annotate'(__ARG_1)
.annotate 'line', 3902
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3903
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3904
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3905

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3908
    self.'checkleft'()
.annotate 'line', 3909
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3910
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'P', __label_1
.annotate 'line', 3911
    WSubId_1("Wrong dest type in =:", $P1)
  __label_1: # endif
.annotate 'line', 3912
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 3913
# reg2: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 3914
    self.'annotate'(__ARG_1)
.annotate 'line', 3915
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3916
    .return($S1)
# }
.annotate 'line', 3917

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
.annotate 'line', 3897
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3926
    self.'checkleft'()
.annotate 'line', 3927
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3928
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3929
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3930
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3931
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3932
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3933
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3935
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3936
# aux: $S5
    null $S5
.annotate 'line', 3937
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3938
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3940
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3941
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3942
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3943
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3945
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3949
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3950
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3951
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3952
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3954
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3957
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3960
    .return($S3)
# }
.annotate 'line', 3961

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
.annotate 'line', 3922
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 3970
    self.'checkleft'()
.annotate 'line', 3971
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3972
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3973
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3974
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3975
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3976
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3977
# aux: $S5
    null $S5
.annotate 'line', 3978
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3979
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 3981
    WSubId_1("-= can't be applied to string", self)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3984
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3985
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3986
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3987
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3989
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3992
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3994
    .return($S3)
# }
.annotate 'line', 3995

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
.annotate 'line', 3966
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4004
    self.'checkleft'()
.annotate 'line', 4005
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4006
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4007
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4008
# rreg: $S4
    null $S4
# switch
.annotate 'line', 4009
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4011
    ne $S2, 'I', __label_7
.annotate 'line', 4012
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 4014
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 4015
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 4017
    self.'annotate'(__ARG_1)
.annotate 'line', 4018
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4021
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 4022
    self.'annotate'(__ARG_1)
.annotate 'line', 4023
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 4025
    .return($S3)
# }
.annotate 'line', 4026

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
.annotate 'line', 4000
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4035
    self.'checkleft'()
.annotate 'line', 4036
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4037
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4038
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4039
    self.'annotate'(__ARG_1)
.annotate 'line', 4040
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 4041
    .return($S2)
# }
.annotate 'line', 4042

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
.annotate 'line', 4031
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4051
    self.'checkleft'()
.annotate 'line', 4052
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4053
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4054
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4055
    self.'annotate'(__ARG_1)
.annotate 'line', 4056
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 4057
    .return($S2)
# }
.annotate 'line', 4058

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
.annotate 'line', 4047
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
.annotate 'line', 4070
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4073
    self.'optimizearg'()
.annotate 'line', 4074
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4075
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4076
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4077
# li: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4078
# ri: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4079
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P5 = self.'int_op'($I1, $I2)
    .tailcall WSubId_21($P3, $P4, $P5)
# }
  __label_1: # endif
.annotate 'line', 4081
    .return(self)
# }
.annotate 'line', 4082

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 4085
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4086
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4087
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 4088
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 4089
    self.'annotate'(__ARG_1)
.annotate 'line', 4090
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 4092
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 4097
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 4102
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 4107
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 4112
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 4117
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 4093
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 4094
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4095
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 4098
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 4099
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4100
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 4103
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4104
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4105
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 4108
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 4109
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4110
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 4113
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 4114
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 4115
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 4118
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 4119
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4120
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 4121
# switch
.annotate 'line', 4124
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 4126
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 4129
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 4132
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 4133
# }
.annotate 'line', 4135

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4138
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4139

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4142
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 4143

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4146
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 4147

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
.annotate 'line', 4068
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Negable' ]

.sub 'Negable' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4158
    new $P2, [ 'Boolean' ], __ARG_1
    setattribute self, 'positive', $P2
# }
.annotate 'line', 4159

.end # Negable


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4160
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4163
# positive: $I1
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
.annotate 'line', 4164
    getattribute $P1, self, 'positive'
    assign $P1, $I1
.annotate 'line', 4165
    .return(self)
# }
.annotate 'line', 4166

.end # negated

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Negable' ]
.annotate 'line', 4154
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]

.sub 'CheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4180
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 4181
    self.'Negable'(__ARG_3)
.annotate 'line', 4182
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 4183

.end # CheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4184
    .return('I')
# }

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CheckerExpr' ]
.annotate 'line', 4174
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4176
    addattribute $P0, 'expr'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 4191
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4192

.end # NullCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4195
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4196
    self.'annotate'(__ARG_1)
.annotate 'line', 4197
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 4198
    getattribute $P1, self, 'positive'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 4199
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 4200

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4203
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4204
    self.'annotate'(__ARG_1)
.annotate 'line', 4205
    getattribute $P1, self, 'positive'
    if_null $P1, __label_2
    unless $P1 goto __label_2
.annotate 'line', 4206
    __ARG_1.'emitunless_null'($S1, __ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4208
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_3: # endif
# }
.annotate 'line', 4209

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
.annotate 'line', 4187
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
.annotate 'line', 4216
    self.'CheckerExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 4217

.end # ZeroCheckerExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4220
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4221
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4222
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'I', __label_2
# {
.annotate 'line', 4223
# aux: $S2
    $P3 = self.'tempreg'('I')
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 4224
    self.'annotate'(__ARG_1)
.annotate 'line', 4225
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 4226
    set $S1, $S2
# }
  __label_2: # endif
.annotate 'line', 4228
    set $S3, __ARG_2
    eq $S3, '', __label_4
# {
.annotate 'line', 4229
    self.'annotate'(__ARG_1)
.annotate 'line', 4230
    getattribute $P2, self, 'positive'
    if_null $P2, __label_5
    unless $P2 goto __label_5
.annotate 'line', 4231
    __ARG_1.'emitarg3'('iseq', __ARG_2, $S1, 0)
    goto __label_6
  __label_5: # else
.annotate 'line', 4233
    __ARG_1.'emitarg3'('isne', __ARG_2, $S1, 0)
  __label_6: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 4235

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 4238
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 4239
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4240
    $P2 = $P1.'checkresult'()
    set $S3, $P2
    eq $S3, 'I', __label_2
# {
.annotate 'line', 4241
# aux: $S2
    $P3 = self.'tempreg'('I')
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 4242
    __ARG_1.'emitset'($S2, $S1)
.annotate 'line', 4243
    set $S1, $S2
# }
  __label_2: # endif
.annotate 'line', 4245
    self.'annotate'(__ARG_1)
.annotate 'line', 4246
    getattribute $P2, self, 'positive'
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 4247
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 4249
    __ARG_1.'emitunless'($S1, __ARG_2)
  __label_5: # endif
# }
.annotate 'line', 4250

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
.annotate 'line', 4212
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
.annotate 'line', 4259
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4260
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4261

.end # OpEqualExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4264
    self.'optimizearg'()
.annotate 'line', 4265
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4266
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4267
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 4268
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 4269
    unless $I1 goto __label_1
# {
.annotate 'line', 4270
    unless $I2 goto __label_2
.annotate 'line', 4271
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'positive'
    .tailcall WSubId_21($P3, $P4, $P5)
    goto __label_3
  __label_2: # else
.annotate 'line', 4273
    new $P7, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P8, self, 'positive'
    $P7.'NullCheckerExpr'(self, $P2, $P8)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4275
    unless $I2 goto __label_4
.annotate 'line', 4276
    new $P4, [ 'Winxed'; 'Compiler'; 'NullCheckerExpr' ]
    getattribute $P5, self, 'positive'
    $P4.'NullCheckerExpr'(self, $P1, $P5)
    set $P3, $P4
    .return($P3)
  __label_4: # endif
.annotate 'line', 4277
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_5
    set $S1, $P3
  __label_5:
.annotate 'line', 4278
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4279
    $I7 = $P1.'isliteral'()
    unless $I7 goto __label_8
    $I7 = $P2.'isliteral'()
  __label_8:
    unless $I7 goto __label_7
# {
.annotate 'line', 4280
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 4281
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 4283
# li: $I3
    $P3 = $P1.'getIntegerValue'()
    set $I3, $P3
.annotate 'line', 4284
# ri: $I4
    $P4 = $P2.'getIntegerValue'()
    set $I4, $P4
.annotate 'line', 4285
# vi: $I5
    getattribute $P5, self, 'positive'
    if_null $P5, __label_15
    unless $P5 goto __label_15
    iseq $I5, $I3, $I4
    goto __label_14
  __label_15:
    isne $I5, $I3, $I4
  __label_14:
.annotate 'line', 4286
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    .tailcall WSubId_21($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 4288
# ls: $S3
    getattribute $P9, $P1, 'strval'
    getattribute $P8, $P9, 'str'
    null $S3
    if_null $P8, __label_16
    set $S3, $P8
  __label_16:
.annotate 'line', 4289
# rs: $S4
    getattribute $P11, $P2, 'strval'
    getattribute $P10, $P11, 'str'
    null $S4
    if_null $P10, __label_17
    set $S4, $P10
  __label_17:
.annotate 'line', 4290
# vs: $I6
    getattribute $P12, self, 'positive'
    if_null $P12, __label_19
    unless $P12 goto __label_19
    iseq $I6, $S3, $S4
    goto __label_18
  __label_19:
    isne $I6, $S3, $S4
  __label_18:
.annotate 'line', 4291
    getattribute $P13, self, 'owner'
    getattribute $P14, self, 'start'
    .tailcall WSubId_21($P13, $P14, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_7: # endif
.annotate 'line', 4295
    $P3 = $P2.'isintegerzero'()
    if_null $P3, __label_20
    unless $P3 goto __label_20
.annotate 'line', 4296
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P1, $P6)
    set $P4, $P5
    .return($P4)
  __label_20: # endif
.annotate 'line', 4297
    $P3 = $P1.'isintegerzero'()
    if_null $P3, __label_21
    unless $P3 goto __label_21
.annotate 'line', 4298
    new $P5, [ 'Winxed'; 'Compiler'; 'ZeroCheckerExpr' ]
    getattribute $P6, self, 'positive'
    $P5.'ZeroCheckerExpr'(self, $P2, $P6)
    set $P4, $P5
    .return($P4)
  __label_21: # endif
.annotate 'line', 4299
    .return(self)
# }
.annotate 'line', 4300

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4303
    self.'annotate'(__ARG_1)
.annotate 'line', 4304
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
.annotate 'line', 4305

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4308
    self.'annotate'(__ARG_1)
.annotate 'line', 4309
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4310

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4313
    self.'annotate'(__ARG_1)
.annotate 'line', 4314
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
.annotate 'line', 4315

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4318
    self.'annotate'(__ARG_1)
.annotate 'line', 4319
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
.annotate 'line', 4320

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
.annotate 'line', 4255
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
.annotate 'line', 4331
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 4332
    self.'Negable'(__ARG_5)
# }
.annotate 'line', 4333

.end # OpSameExpr


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4336
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
.annotate 'line', 4337

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4340
    self.'annotate'(__ARG_1)
.annotate 'line', 4341
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4342
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 4343
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4344

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4347
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4348

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4351
    self.'annotate'(__ARG_1)
.annotate 'line', 4352
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4353
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 4354
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4355

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4358
    self.'annotate'(__ARG_1)
.annotate 'line', 4359
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 4360
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 4361
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4362

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
.annotate 'line', 4326
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Negable' ]
    addparent $P0, $P2
.annotate 'line', 4328
    addattribute $P0, 'positive'
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4369
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4372
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4373

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4376
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4377

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4380
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4381

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4384
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4385

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4388
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4389

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
.annotate 'line', 4367
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4396
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4399
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4400

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4403
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4404

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4407
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4408

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4411
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4412

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4415
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4416

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
.annotate 'line', 4394
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4423
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4426
    new $P1, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4427

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4430
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4431

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4434
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4435

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4438
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4439

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4442
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4443

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
.annotate 'line', 4421
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 4450
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 4453
    new $P1, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 4454

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4457
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4458

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4461
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4462

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4465
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4466

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4469
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4470

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
.annotate 'line', 4448
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4479
    .return('I')
# }
.annotate 'line', 4480

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
.annotate 'line', 4475
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
.annotate 'line', 4489
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4490

.end # OpBoolAndExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4493
    self.'optimizearg'()
.annotate 'line', 4494
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4495
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4496
    unless $I1 goto __label_3
.annotate 'line', 4497
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4498
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_21($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4496
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4500
    .return(self)
# }
.annotate 'line', 4501

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4504
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
.annotate 'line', 4505
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4506
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4507
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4508
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4511
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4512
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4513
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4514
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4515
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4517

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
.annotate 'line', 4485
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
.annotate 'line', 4526
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4527

.end # OpBoolOrExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4530
    self.'optimizearg'()
.annotate 'line', 4531
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'isintegerliteral'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 4532
# ln: $I1
    getattribute $P4, self, 'lexpr'
    $P3 = $P4.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4533
    if $I1 goto __label_3
.annotate 'line', 4534
    getattribute $P1, self, 'rexpr'
    goto __label_2
  __label_3:
.annotate 'line', 4535
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    $P2 = WSubId_21($P3, $P4, $I1)
    set $P1, $P2
  __label_2:
.annotate 'line', 4533
    .return($P1)
# }
  __label_1: # endif
.annotate 'line', 4537
    .return(self)
# }
.annotate 'line', 4538

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4541
# res: $S1
    null $S1
.annotate 'line', 4542
    if_null __ARG_2, __label_1
.annotate 'line', 4543
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4545
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4546
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4547
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4548
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4549
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4552
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4553
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4554
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4555
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4556
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4558

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
.annotate 'line', 4522
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBaseBinExpr' ]
.annotate 'line', 4563
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
.annotate 'line', 4573
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4574

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4577
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
.annotate 'line', 4578
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4579
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4580
    self.'annotate'(__ARG_1)
.annotate 'line', 4581
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4582

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4585
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4586

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
.annotate 'line', 4569
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
.annotate 'line', 4595
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4596

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4599
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
.annotate 'line', 4600
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4601
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4602
    self.'annotate'(__ARG_1)
.annotate 'line', 4603
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4604

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4607
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4608

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
.annotate 'line', 4591
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
.annotate 'line', 4617
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4618

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4621
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
.annotate 'line', 4622
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4623
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4624
    self.'annotate'(__ARG_1)
.annotate 'line', 4625
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4626

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4629
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4630

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
.annotate 'line', 4613
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
.annotate 'line', 4640
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4642
    isa $I1, __ARG_3, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4649
    isa $I1, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4643
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4644
    isa $I2, __ARG_4, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4645
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4647
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4650
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4651
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4654
    root_new $P10, ['parrot';'ResizablePMCArray']
    assign $P10, 2
    $P10[0] = __ARG_3
    $P10[1] = __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4656

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4657
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4660
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4661
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4662
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4663
# i: $I2
    null $I2
# for loop
.annotate 'line', 4664
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4665
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4664
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4666
    .return($P2)
# }
.annotate 'line', 4667

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4670
# auxreg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4671
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 4672
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 4673

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4676
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4677
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4678
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4679
    self.'annotate'(__ARG_1)
.annotate 'line', 4680
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4681
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4682
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4681
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4683
    .return($S1)
# }
.annotate 'line', 4684

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4687
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4688
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4689
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4690
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4691
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4690
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4692

.end # emit_concat_to

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
.annotate 'line', 4635
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4637
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RepeatString' ]

.sub 'RepeatString' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4701
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 4702

.end # RepeatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4703
    .return('S')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4706
# var rexpr: $P1
    getattribute $P1, self, 'rexpr'
.annotate 'line', 4707
# lreg: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4708
# rreg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4709
# rval: $S3
    null $S3
# switch
.annotate 'line', 4710
    $P2 = $P1.'checkresult'()
    set $S4, $P2
    set $S5, 'I'
    if $S4 == $S5 goto __label_5
    goto __label_4
  __label_5: # case
.annotate 'line', 4712
    set $S3, $S2
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 4715
    $P3 = self.'tempreg'('I')
    set $S3, $P3
.annotate 'line', 4716
    __ARG_1.'emitset'($S3, $S2)
  __label_3: # switch end
.annotate 'line', 4718
    self.'annotate'(__ARG_1)
.annotate 'line', 4719
    __ARG_1.'emitrepeat'(__ARG_2, $S1, $S3)
# }
.annotate 'line', 4720

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
.annotate 'line', 4697
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
.annotate 'line', 4729
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4730

.end # OpAddExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 4733
    self.'optimizearg'()
.annotate 'line', 4734
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4735
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4736
# ltype: $S1
    $P6 = $P1.'checkresult'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 4737
# rtype: $S2
    $P6 = $P2.'checkresult'()
    null $S2
    if_null $P6, __label_2
    set $S2, $P6
  __label_2:
.annotate 'line', 4738
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4739
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4744
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4745
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4746
# var t: $P5
    $I3 = $P3.'issinglequoted'()
    unless $I3 goto __label_9
    $I3 = $P4.'issinglequoted'()
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4748
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenSingleQuoted' ]
    getattribute $P7, $P3, 'file'
    getattribute $P8, $P3, 'line'
# predefined string
.annotate 'line', 4749
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
.annotate 'line', 4751
    new $P12, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P13, $P3, 'file'
    getattribute $P14, $P3, 'line'
# predefined string
.annotate 'line', 4752
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
.annotate 'line', 4753
    new $P7, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P8, self, 'owner'
    $P7.'StringLiteral'($P8, $P5)
    set $P6, $P7
    .return($P6)
# }
  __label_5: # endif
.annotate 'line', 4755
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4756
# ln: $I1
    $P6 = $P1.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 4757
# rn: $I2
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4758
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $I3, $I1, $I2
    .tailcall WSubId_21($P6, $P7, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4761
    $P6 = WSubId_68($S1, $S2)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 4762
# lf: $N1
    $P7 = $P1.'getFloatValue'()
    set $N1, $P7
.annotate 'line', 4763
# rf: $N2
    $P6 = $P2.'getFloatValue'()
    set $N2, $P6
.annotate 'line', 4764
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    add $N3, $N1, $N2
    .tailcall WSubId_67($P6, $P7, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4768
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4769
    new $P7, [ 'Winxed'; 'Compiler'; 'ConcatString' ]
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'start'
    $P7.'ConcatString'($P8, $P9, $P1, $P2)
    set $P6, $P7
    .return($P6)
# }
  __label_13: # endif
.annotate 'line', 4771
    .return(self)
# }
.annotate 'line', 4772

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_68 = "WSubId_68"
# Body
# {
.annotate 'line', 4775
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4776
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4777
    ne $S1, $S2, __label_3
.annotate 'line', 4778
    .return($S1)
  __label_3: # endif
.annotate 'line', 4779
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4780
    .return('S')
  __label_4: # endif
.annotate 'line', 4781
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4782
    .return('S')
  __label_6: # endif
.annotate 'line', 4783
    $P1 = WSubId_68($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4784
    .return('N')
  __label_8: # endif
.annotate 'line', 4785
    .return('I')
# }
.annotate 'line', 4786

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4789
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4790
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4791
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4792
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4793
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4795
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4796
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4797
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4798
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4799
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4800
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4801
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4802
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4805
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4806
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4809
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4812
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4813
# l: $S7
    null $S7
.annotate 'line', 4814
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4816
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4817
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4819
# r: $S8
    null $S8
.annotate 'line', 4820
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4822
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4823
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4825
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4828
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4830

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
.annotate 'line', 4725
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
.annotate 'line', 4839
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4840

.end # OpSubExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
# Body
# {
.annotate 'line', 4843
    self.'optimizearg'()
.annotate 'line', 4844
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4845
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4846
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4847
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 4848
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_4
    set $S2, $P3
  __label_4:
.annotate 'line', 4849
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4850
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4851
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4852
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    sub $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4855
    .return(self)
# }
.annotate 'line', 4856

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4859
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4860
# rtype: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
# switch-case
.annotate 'line', 4862
    iseq $I1, $S1, $S2
    if $I1 goto __label_5
.annotate 'line', 4864
    iseq $I1, $S1, 'P'
    if $I1 goto __label_7
    iseq $I1, $S2, 'P'
  __label_7:
    if $I1 goto __label_6
.annotate 'line', 4866
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_9
    iseq $I1, $S2, 'N'
  __label_9:
    if $I1 goto __label_8
.annotate 'line', 4868
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_11
    iseq $I1, $S2, 'I'
  __label_11:
    if $I1 goto __label_10
    goto __label_4
  __label_5: # case
.annotate 'line', 4863
    .return($S1)
  __label_6: # case
.annotate 'line', 4865
    .return('P')
  __label_8: # case
.annotate 'line', 4867
    .return('N')
  __label_10: # case
.annotate 'line', 4869
    .return('N')
  __label_4: # default
.annotate 'line', 4871
    .return('I')
  __label_3: # switch end
# }
.annotate 'line', 4873

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4876
# type: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4877
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4878
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4879
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4880
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4881
# lreg: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4882
# rreg: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4883
# aux: $S6
    null $S6
.annotate 'line', 4884
    eq $S2, $S1, __label_6
# {
.annotate 'line', 4885
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4886
    ne $S1, 'P', __label_7
.annotate 'line', 4887
    __ARG_1.'emitbox'($S6, $S4)
    goto __label_8
  __label_7: # else
.annotate 'line', 4889
    __ARG_1.'emitset'($S6, $S4)
  __label_8: # endif
.annotate 'line', 4890
    set $S4, $S6
# }
  __label_6: # endif
.annotate 'line', 4892
    eq $S3, $S1, __label_9
# {
.annotate 'line', 4893
    $P3 = self.'tempreg'($S1)
    set $S6, $P3
.annotate 'line', 4894
    ne $S1, 'P', __label_10
.annotate 'line', 4895
    __ARG_1.'emitbox'($S6, $S5)
    goto __label_11
  __label_10: # else
.annotate 'line', 4897
    __ARG_1.'emitset'($S6, $S5)
  __label_11: # endif
.annotate 'line', 4898
    set $S5, $S6
# }
  __label_9: # endif
.annotate 'line', 4900
    __ARG_1.'emitsub'(__ARG_2, $S4, $S5)
# }
.annotate 'line', 4901

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
.annotate 'line', 4835
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
.annotate 'line', 4910
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4911

.end # OpMulExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 4914
    self.'optimizearg'()
.annotate 'line', 4915
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4916
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4917
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4918
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4919
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4920
    iseq $I4, $S1, 'I'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'I'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4921
# ln: $I1
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4922
# rn: $I2
    $P3 = $P2.'getIntegerValue'()
    set $I2, $P3
.annotate 'line', 4923
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $I3, $I1, $I2
    .tailcall WSubId_21($P3, $P4, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4926
    $P3 = WSubId_68($S1, $S2)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 4927
# lf: $N1
    $P4 = $P1.'getFloatValue'()
    set $N1, $P4
.annotate 'line', 4928
# rf: $N2
    $P3 = $P2.'getFloatValue'()
    set $N2, $P3
.annotate 'line', 4929
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    mul $N3, $N1, $N2
    .tailcall WSubId_67($P3, $P4, $N3)
# }
  __label_7: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4933
    ne $S1, 'S', __label_8
.annotate 'line', 4934
    new $P4, [ 'Winxed'; 'Compiler'; 'RepeatString' ]
    $P4.'RepeatString'(self)
    set $P3, $P4
    .return($P3)
  __label_8: # endif
.annotate 'line', 4935
    .return(self)
# }
.annotate 'line', 4936

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4939
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4940
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4941
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4942
    ne $S1, $S2, __label_3
.annotate 'line', 4943
    .return($S1)
  __label_3: # endif
.annotate 'line', 4944
    ne $S1, 'S', __label_4
.annotate 'line', 4945
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4947
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4948

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4951
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4952
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4953
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4954
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4955
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4956
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
.annotate 'line', 4957
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4958
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4959
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4960
    .return()
# }
  __label_3: # endif
.annotate 'line', 4965
    ne $S1, 'N', __label_7
# {
.annotate 'line', 4966
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4967
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4968
# rval: $S5
    null $S5
# switch
.annotate 'line', 4969
    set $S6, $S2
    set $S7, 'I'
    if $S6 == $S7 goto __label_10
    set $S7, 'N'
    if $S6 == $S7 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 4971
    $P3 = self.'tempreg'('N')
    set $S5, $P3
.annotate 'line', 4972
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 4973
    set $S5, $S4
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 4976
    set $S5, $S4
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 4979
    $P4 = self.'tempreg'('N')
    set $S5, $P4
.annotate 'line', 4980
    __ARG_1.'emitset'($S5, $S4)
  __label_8: # switch end
.annotate 'line', 4982
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 4983
    self.'annotate'(__ARG_1)
.annotate 'line', 4984
    __ARG_1.'emitmul'(__ARG_2, $S3, $S5)
# }
  __label_12: # endif
.annotate 'line', 4986
    .return()
# }
  __label_7: # endif
.annotate 'line', 4989
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4990
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_15
    $I3 = $P1.'isidentifier'()
  __label_15:
    unless $I3 goto __label_13
# {
.annotate 'line', 4991
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4992
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 4995
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4996
    set $S3, $I1
# }
  __label_14: # endif
.annotate 'line', 4998
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_18
    $I3 = $P2.'isidentifier'()
  __label_18:
    unless $I3 goto __label_16
# {
.annotate 'line', 4999
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 5000
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_17
  __label_16: # else
# {
# switch
.annotate 'line', 5003
    set $S6, $S2
    set $S7, 'S'
    if $S6 == $S7 goto __label_21
    set $S7, 'N'
    if $S6 == $S7 goto __label_22
    set $S7, 'I'
    if $S6 == $S7 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 5005
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 5006
    $P2.'emit'(__ARG_1, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 5009
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_19 # break
  __label_23: # case
  __label_20: # default
.annotate 'line', 5013
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 5014
    set $S4, $I2
    goto __label_19 # break
  __label_19: # switch end
.annotate 'line', 5015
# }
  __label_17: # endif
.annotate 'line', 5018
    self.'annotate'(__ARG_1)
.annotate 'line', 5019
    set $S6, __ARG_2
    ne $S6, '', __label_24
.annotate 'line', 5020
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_24: # endif
.annotate 'line', 5021
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 5022

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
.annotate 'line', 4906
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
.annotate 'line', 5031
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5032

.end # OpDivExpr


.sub 'optimize' :method
.const 'Sub' WSubId_21 = "WSubId_21"
.const 'Sub' WSubId_68 = "WSubId_68"
.const 'Sub' WSubId_67 = "WSubId_67"
# Body
# {
.annotate 'line', 5035
    self.'optimizearg'()
.annotate 'line', 5036
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5037
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 5038
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 5039
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5040
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5041
# var lval: $P3
    null $P3
.annotate 'line', 5042
# var rval: $P4
    null $P4
.annotate 'line', 5043
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 5044
# ln: $I1
    $P5 = $P1.'getIntegerValue'()
    set $I1, $P5
.annotate 'line', 5045
# rn: $I2
    $P5 = $P2.'getIntegerValue'()
    set $I2, $P5
.annotate 'line', 5046
    unless $I2 goto __label_7
.annotate 'line', 5047
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
.annotate 'line', 5050
    $P5 = WSubId_68($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 5051
# lf: $N1
    $P6 = $P1.'getFloatValue'()
    set $N1, $P6
.annotate 'line', 5052
# rf: $N2
    $P5 = $P2.'getFloatValue'()
    set $N2, $P5
.annotate 'line', 5053
    set $I3, $N2
    unless $I3 goto __label_9
.annotate 'line', 5054
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
.annotate 'line', 5058
    .return(self)
# }
.annotate 'line', 5059

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5062
    .return('N')
# }
.annotate 'line', 5063

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5066
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5067
# var aux: $P2
    null $P2
.annotate 'line', 5068
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 5069
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 5070
    $P2 = self.'tempreg'('N')
.annotate 'line', 5071
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 5072
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 5074
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 5075
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 5076
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 5077
    $P2 = self.'tempreg'('N')
.annotate 'line', 5078
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 5079
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 5081
    self.'annotate'(__ARG_1)
.annotate 'line', 5082
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 5083

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
.annotate 'line', 5027
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
.annotate 'line', 5092
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5093

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5096
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5097
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5098
    self.'annotate'(__ARG_1)
.annotate 'line', 5099
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5100

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5103
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5104

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
.annotate 'line', 5088
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
.annotate 'line', 5113
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5114

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5117
    .return('I')
# }
.annotate 'line', 5118

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5121
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5122
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5123
    self.'annotate'(__ARG_1)
.annotate 'line', 5128
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 5129

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
.annotate 'line', 5109
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
.annotate 'line', 5138
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5139

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5142
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
.annotate 'line', 5143
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5144
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5145
    self.'annotate'(__ARG_1)
.annotate 'line', 5146
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 5147

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5150
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5151

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
.annotate 'line', 5134
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
.annotate 'line', 5160
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 5161

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5164
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
.annotate 'line', 5165
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 5166
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 5167
    self.'annotate'(__ARG_1)
.annotate 'line', 5168
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 5169

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 5172
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 5173

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
.annotate 'line', 5156
    get_class $P1, [ 'Winxed'; 'Compiler'; 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5182
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5183

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5186
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 5187
# setname: $S1
    set $S1, ''
.annotate 'line', 5188
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 5189
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 5191
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5194
    set $I2, 1
# switch
.annotate 'line', 5195
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
.annotate 'line', 5199
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 5200
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.annotate 'line', 5201
    WSubId_1('Invalid modifier', self)
  __label_11: # endif
.annotate 'line', 5202
    $P8 = $P2.'getPirString'()
    set $S1, $P8
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 5205
    WSubId_1('Invalid modifier', self)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 5210
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 5213
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 5216
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 5211
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 5214
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 5217
    __ARG_1.'print'(' :named')
.annotate 'line', 5218
    eq $S1, '', __label_17
.annotate 'line', 5219
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 5220
# }
.annotate 'line', 5222

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
.annotate 'line', 5178
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5231
    setattribute self, 'arg', __ARG_1
.annotate 'line', 5232
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 5233

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5236
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 5237
    .return(self)
# }
.annotate 'line', 5238

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 5241
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 5242

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Argument' ]
.annotate 'line', 5227
    addattribute $P0, 'arg'
.annotate 'line', 5228
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
.annotate 'line', 5247
# var modifier: $P1
    null $P1
.annotate 'line', 5248
# var expr: $P2
    $P2 = WSubId_41(__ARG_1, __ARG_2)
.annotate 'line', 5249
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 5250
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 5251
    $P3 = __ARG_1.'get'()
.annotate 'line', 5252
    $P4 = $P3.'isop'('[')
    if_null $P4, __label_3
    unless $P4 goto __label_3
# {
.annotate 'line', 5253
    new $P5, [ 'Winxed'; 'Compiler'; 'ArgumentModifierList' ]
    $P5.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P5
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5256
    WSubId_44('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5259
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 5260
    new $P5, [ 'Winxed'; 'Compiler'; 'Argument' ]
    $P5.'Argument'($P2, $P1)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 5261

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
.annotate 'line', 5272
    setattribute self, 'owner', __ARG_1
.annotate 'line', 5273
    setattribute self, 'start', __ARG_2
.annotate 'line', 5274
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 5275
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5276
    __ARG_3.'unget'($P1)
.annotate 'line', 5277
    $P3 = WSubId_40(__ARG_3, __ARG_1, WSubId_69, __ARG_4)
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5279

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 5282
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5283
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
    .return($I1)
# }
.annotate 'line', 5284

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 5287
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 5288

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5291
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5292
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 5293

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 5296
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5297
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 5298

.end # getfreearg


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 5301
    getattribute $P1, self, 'args'
    WSubId_42($P1)
.annotate 'line', 5302
    .return(self)
# }
.annotate 'line', 5303

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5306
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5307
    unless_null $P1, __label_1
# {
.annotate 'line', 5308
    new $P2, ['ResizableStringArray']
.annotate 'line', 5309
# pnull: $S1
    set $S1, ''
.annotate 'line', 5310
    getattribute $P5, self, 'args'
    if_null $P5, __label_3
    iter $P6, $P5
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $P3, $P6
# {
.annotate 'line', 5311
# var arg: $P4
    getattribute $P4, $P3, 'arg'
.annotate 'line', 5312
# reg: $S2
    null $S2
.annotate 'line', 5313
    $P5 = $P4.'isnull'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 5314
    ne $S1, '', __label_6
# {
.annotate 'line', 5315
    getattribute $P8, self, 'owner'
    $P7 = $P8.'tempreg'('P')
    set $S1, $P7
.annotate 'line', 5316
    __ARG_1.'emitnull'($S1)
# }
  __label_6: # endif
.annotate 'line', 5318
    set $S2, $S1
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 5321
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S2, $P5
  __label_5: # endif
.annotate 'line', 5322
# predefined push
    push $P2, $S2
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 5324
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 5326
    .return($P1)
# }
.annotate 'line', 5327

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5330
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5331
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 5333
# sep: $S1
    set $S1, ''
.annotate 'line', 5334
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 5335
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 5336
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 5337
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 5338
    if_null $P3, __label_4
.annotate 'line', 5339
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 5340
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 5335
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 5342

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
.annotate 'line', 5265
    addattribute $P0, 'owner'
.annotate 'line', 5266
    addattribute $P0, 'start'
.annotate 'line', 5267
    addattribute $P0, 'args'
.annotate 'line', 5268
    addattribute $P0, 'argregs'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'arglist_hascompilevalue' :subid('WSubId_70')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5347
    if_null __ARG_1, __label_2
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 5348
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 5349
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 5350
    .return(1)
# }
.annotate 'line', 5351

.end # arglist_hascompilevalue

.namespace [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5362
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5363
    setattribute self, 'predef', __ARG_3
.annotate 'line', 5364
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 5365

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5368
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 5369

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5372
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 5373
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5374
    new $P3, ['ResizableStringArray']
.annotate 'line', 5375
# var arg: $P4
    null $P4
.annotate 'line', 5376
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 5377
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5379
    if_null $P2, __label_6
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 5380
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 5382
    ne $S2, 'null', __label_8
# {
.annotate 'line', 5383
    ne $S1, '', __label_9
# {
.annotate 'line', 5384
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 5385
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 5387
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 5389
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 5393
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 5394
    if_null $P2, __label_11
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 5395
    getattribute $P6, $P4, 'arg'
# predefined push
    push $P5, $P6
    goto __label_10
  __label_11: # endfor
.annotate 'line', 5396
    getattribute $P8, self, 'predef'
    getattribute $P9, self, 'start'
    $P8.'expand'(__ARG_1, self, $P9, __ARG_2, $P5)
.annotate 'line', 5397
    .return()
  __label_2: # default
.annotate 'line', 5399
# n: $I1
    getattribute $P11, self, 'args'
    set $I1, $P11
# for loop
.annotate 'line', 5400
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 5401
    $P12 = $P2[$I2]
    getattribute $P4, $P12, 'arg'
.annotate 'line', 5402
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 5403
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 5404
# argr: $S5
    null $S5
.annotate 'line', 5405
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 5406
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
.annotate 'line', 5410
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 5411
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 5414
    ne $S1, '', __label_24
# {
.annotate 'line', 5415
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 5416
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 5418
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 5422
    iseq $I3, $S3, $S4
    if $I3 goto __label_28
    iseq $I3, $S4, '?'
  __label_28:
    if $I3 goto __label_27
.annotate 'line', 5423
    iseq $I3, $S4, 'p'
    unless $I3 goto __label_29
.annotate 'line', 5424
    iseq $I3, $S3, 'S'
    if $I3 goto __label_30
    iseq $I3, $S3, 'P'
  __label_30:
  __label_29:
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 5425
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 5427
# aux: $S6
    null $S6
.annotate 'line', 5428
    ne $S4, 'p', __label_31
.annotate 'line', 5429
    set $S4, 'P'
  __label_31: # endif
.annotate 'line', 5430
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 5431
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
.annotate 'line', 5433
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
.annotate 'line', 5437
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 5438
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_38 # break
  __label_39: # default
.annotate 'line', 5441
    $P4.'emit'(__ARG_1, $S5)
  __label_38: # switch end
    goto __label_32 # break
  __label_35: # case
  __label_36: # case
  __label_37: # case
.annotate 'line', 5447
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 5448
    __ARG_1.'emitset'($S5, $S6)
    goto __label_32 # break
  __label_33: # default
.annotate 'line', 5451
    $P4.'emit'(__ARG_1, $S5)
  __label_32: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 5455
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 5400
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 5458
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 5459

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
.annotate 'line', 5355
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5357
    addattribute $P0, 'predef'
.annotate 'line', 5358
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
.annotate 'line', 5466
# callname: $S1
    $P6 = __ARG_3.'getname'()
    null $S1
    if_null $P6, __label_1
    set $S1, $P6
  __label_1:
.annotate 'line', 5467
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5468
# nargs: $I1
    unless_null __ARG_4, __label_3
    null $I1
    goto __label_2
  __label_3:
    $P6 = __ARG_4.'numargs'()
    set $I1, $P6
  __label_2:
.annotate 'line', 5469
# var rawargs: $P1
    if $I1 goto __label_5
    root_new $P6, ['parrot';'ResizablePMCArray']
    set $P1, $P6
    goto __label_4
  __label_5:
    $P7 = __ARG_4.'getrawargs'()
    set $P1, $P7
  __label_4:
.annotate 'line', 5471
# var variants: $P2
    getattribute $P2, __ARG_3, 'variants'
.annotate 'line', 5472
# var predef: $P3
    null $P3
.annotate 'line', 5473
    if_null $P2, __label_7
    iter $P8, $P2
    set $P8, 0
  __label_6: # for iteration
    unless $P8 goto __label_7
    shift $P4, $P8
# {
.annotate 'line', 5474
# pargs: $I2
    getattribute $P6, $P4, 'nparams'
    set $I2, $P6
.annotate 'line', 5475
    iseq $I3, $I2, $I1
    if $I3 goto __label_10
.annotate 'line', 5476
    iseq $I3, $I2, -1
  __label_10:
    if $I3 goto __label_9
.annotate 'line', 5477
    iseq $I3, $I2, -2
    unless $I3 goto __label_11
    iseq $I3, $I1, 1
  __label_11:
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 5478
    set $P3, $P4
  __label_8: # endif
# }
    goto __label_6
  __label_7: # endfor
.annotate 'line', 5480
    unless_null $P3, __label_12
.annotate 'line', 5481
    WSubId_1("Wrong arguments for builtin", __ARG_2)
  __label_12: # endif
.annotate 'line', 5484
    $P6 = $P3.'iscompileevaluable'()
    if_null $P6, __label_13
    unless $P6 goto __label_13
# {
.annotate 'line', 5485
    $P7 = WSubId_70($P1)
    if_null $P7, __label_14
    unless $P7 goto __label_14
# {
.annotate 'line', 5486
# var evalfun: $P5
    getattribute $P5, $P3, 'evalfun'
.annotate 'line', 5487
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    .tailcall $P5($P6, $P7, $P1)
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5491
    new $P7, [ 'Winxed'; 'Compiler'; 'CallPredefExpr' ]
    $P7.'CallPredefExpr'(__ARG_1, __ARG_2, $P3, $P1)
    set $P6, $P7
    .return($P6)
# }
.annotate 'line', 5492

.end # gencallbuiltin

.namespace [ 'Winxed'; 'Compiler'; 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5501
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5502
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5503
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5504
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5505
    __ARG_1.'unget'($P1)
.annotate 'line', 5506
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5508

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5509
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_71 = "WSubId_71"
# Body
# {
.annotate 'line', 5512
# var funref: $P1
    getattribute $P9, self, 'funref'
    $P1 = $P9.'optimize'()
.annotate 'line', 5513
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5514
    if_null $P2, __label_1
.annotate 'line', 5515
    $P2 = $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 5517
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 5521
# var sym: $P3
    null $P3
.annotate 'line', 5522
# var subid: $P4
    null $P4
.annotate 'line', 5523
# var first: $P5
    getattribute $P5, $P1, 'left'
  __label_4: # while
.annotate 'line', 5524
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_3
.annotate 'line', 5525
    getattribute $P5, $P5, 'left'
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 5526
    isa $I1, $P5, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_5
# {
.annotate 'line', 5527
# var idfirst: $P6
    $P6 = $P5.'checkIdentifier'()
.annotate 'line', 5528
    isnull $I1, $P6
    if $I1 goto __label_7
    set $S1, $P6
    iseq $I1, $S1, ''
  __label_7:
    unless $I1 goto __label_6
# {
.annotate 'line', 5529
# var key: $P7
    root_new $P7, ['parrot';'ResizablePMCArray']
.annotate 'line', 5530
    $P1.'buildkey'($P7)
.annotate 'line', 5531
    $P3 = self.'scopesearch'($P7, 0)
.annotate 'line', 5532
    if_null $P3, __label_8
# {
.annotate 'line', 5533
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_9
# {
.annotate 'line', 5534
    $P9 = $P3.'ismulti'()
    isfalse $I2, $P9
    unless $I2 goto __label_10
# {
.annotate 'line', 5535
    $P4 = $P3.'makesubid'()
.annotate 'line', 5536
    self.'usesubid'($P4)
# }
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 5539
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    unless $I1 goto __label_11
.annotate 'line', 5540
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
.annotate 'line', 5544
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
    $P10.'CallMemberExpr'(self, $P1, $P2, $P3, $P4)
    set $P9, $P10
    .return($P9)
# }
  __label_2: # endif
.annotate 'line', 5546
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    unless $I1 goto __label_12
.annotate 'line', 5547
    new $P10, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
    $P10.'CallMemberRefExpr'(self, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_12: # endif
.annotate 'line', 5550
    $P9 = $P1.'isidentifier'()
    if_null $P9, __label_13
    unless $P9 goto __label_13
# {
.annotate 'line', 5551
    $P10 = $P1.'checkIdentifier'()
    set $S1, $P10
    ne $S1, '', __label_14
# {
.annotate 'line', 5552
# var sym: $P8
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P12 = $P1.'getName'()
    $P11[0] = $P12
    $P8 = self.'scopesearch'($P11, 0)
.annotate 'line', 5553
    isnull $I1, $P8
    not $I1
    unless $I1 goto __label_16
    isa $I1, $P8, [ 'Winxed'; 'Compiler'; 'Builtin' ]
  __label_16:
    unless $I1 goto __label_15
.annotate 'line', 5554
    getattribute $P9, self, 'owner'
    getattribute $P10, $P1, 'start'
    .tailcall WSubId_71($P9, $P10, $P8, $P2)
  __label_15: # endif
# }
  __label_14: # endif
# }
  __label_13: # endif
.annotate 'line', 5558
    setattribute self, 'funref', $P1
.annotate 'line', 5559
    setattribute self, 'args', $P2
.annotate 'line', 5560
    .return(self)
# }
.annotate 'line', 5561

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5564
    .return(1)
# }
.annotate 'line', 5565

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5568
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5569
# call: $S1
    null $S1
.annotate 'line', 5571
    $I1 = $P1.'isidentifier'()
    unless $I1 goto __label_3
    getattribute $P3, $P1, 'subid'
    isnull $I1, $P3
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 5572
    $P4 = $P1.'checkIdentifier'()
    set $S1, $P4
.annotate 'line', 5573
    ne $S1, '', __label_4
# {
.annotate 'line', 5574
# var sym: $P2
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P4 = $P1.'getName'()
    $P3[0] = $P4
    $P2 = self.'scopesearch'($P3, 0)
# switch-case
.annotate 'line', 5576
    isnull $I1, $P2
    if $I1 goto __label_7
.annotate 'line', 5579
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    if $I1 goto __label_8
.annotate 'line', 5582
    isa $I1, $P2, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    if $I1 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 5577
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
.annotate 'line', 5580
    $P5 = $P2.'emit_get'(__ARG_1, self)
    set $S1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 5583
    WSubId_6("Builtin unexpeted here", self)
  __label_6: # default
.annotate 'line', 5585
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
.annotate 'line', 5590
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_2: # endif
.annotate 'line', 5591
    .return($S1)
# }
.annotate 'line', 5592

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5595
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5596
    if_null $P1, __label_1
.annotate 'line', 5597
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5598

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5601
    __ARG_1.'print'('(')
.annotate 'line', 5602
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5603
    if_null $P1, __label_1
.annotate 'line', 5604
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5605
    __ARG_1.'say'(')')
# }
.annotate 'line', 5606

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5609
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5610
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5612
    self.'annotate'(__ARG_1)
.annotate 'line', 5614
    __ARG_1.'print'('    ')
.annotate 'line', 5615
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5616
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5617
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5619
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5622
    __ARG_1.'print'($S1)
.annotate 'line', 5623
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5624

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 5494
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5496
    addattribute $P0, 'funref'
.annotate 'line', 5497
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
.annotate 'line', 5638
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5639
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5640
    setattribute self, 'args', __ARG_3
.annotate 'line', 5641
    setattribute self, 'sym', __ARG_4
.annotate 'line', 5642
    setattribute self, 'subid', __ARG_5
# }
.annotate 'line', 5643

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 5646
    getattribute $P6, self, 'sym'
    if_null $P6, __label_1
# {
.annotate 'line', 5647
    getattribute $P7, self, 'subid'
    if_null $P7, __label_2
.annotate 'line', 5648
    getattribute $P8, self, 'subid'
    .return($P8)
  __label_2: # endif
.annotate 'line', 5649
# var sym: $P1
    getattribute $P1, self, 'sym'
.annotate 'line', 5650
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    unless $I1 goto __label_3
.annotate 'line', 5651
    .tailcall $P1.'emit_get'(__ARG_1, self)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5653
# var funref: $P2
    getattribute $P2, self, 'funref'
.annotate 'line', 5655
# var first: $P3
    getattribute $P3, $P2, 'left'
  __label_5: # while
.annotate 'line', 5656
    isa $I1, $P3, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    unless $I1 goto __label_4
.annotate 'line', 5657
    getattribute $P3, $P3, 'left'
    goto __label_5
  __label_4: # endwhile
.annotate 'line', 5658
    $P6 = $P3.'isidentifier'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 5659
# check: $S1
    $P7 = $P3.'checkIdentifier'()
    null $S1
    if_null $P7, __label_7
    set $S1, $P7
  __label_7:
.annotate 'line', 5660
    isnull $I1, $S1
    if $I1 goto __label_9
    iseq $I1, $S1, ''
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 5664
    new $P4, ['ResizableStringArray']
.annotate 'line', 5665
    $P2.'buildkey'($P4)
.annotate 'line', 5666
# fun: $S2
    $P6 = $P4.'pop'()
    null $S2
    if_null $P6, __label_10
    set $S2, $P6
  __label_10:
.annotate 'line', 5667
# var reg: $P5
    $P5 = self.'tempreg'('P')
.annotate 'line', 5668
    self.'annotate'(__ARG_1)
.annotate 'line', 5669
    $P6 = WSubId_22($P4)
    __ARG_1.'emitget_hll_global'($P5, $S2, $P6)
.annotate 'line', 5670
    .return($P5)
# }
  __label_8: # endif
# }
  __label_6: # endif
.annotate 'line', 5673
    root_new $P6, ['parrot';'ResizablePMCArray']
    assign $P6, 4
    $P7 = $P2.'emit_left_get'(__ARG_1)
    $P6[0] = $P7
    $P6[1] = ".'"
.annotate 'line', 5674
    $P8 = $P2.'get_member'()
.annotate 'line', 5673
    $P6[2] = $P8
    $P6[3] = "'"
# predefined join
    join $S3, "", $P6
    .return($S3)
# }
.annotate 'line', 5675

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberExpr' ]
.annotate 'line', 5632
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    addparent $P0, $P1
.annotate 'line', 5634
    addattribute $P0, 'sym'
.annotate 'line', 5635
    addattribute $P0, 'subid'
.end
.namespace [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5685
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5686
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5687
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5688

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5691
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5692
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5693
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5694
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5695
    WSubId_1("Invalid expression type in '.*'", $P1)
  __label_1: # endif
.annotate 'line', 5698
# lreg: $S1
    $P4 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 5699
# rreg: $S2
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
.annotate 'line', 5700
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5701

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CallMemberRefExpr' ]
.annotate 'line', 5681
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
.annotate 'line', 5711
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5712
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5713

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5716
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5717
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5718
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5719
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5720
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5721
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5722
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5724
    .return($S2)
# }
.annotate 'line', 5725

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
.annotate 'line', 5706
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5708
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
.annotate 'line', 5734
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5735
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5736

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5737
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5740
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5741
    .return(self)
# }
.annotate 'line', 5742

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5745
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5746
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5747
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5749
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5750
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5751

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5754
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5755

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5758
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5759
    self.'annotate'(__ARG_1)
.annotate 'line', 5760
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5761

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5764
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5765
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5766
    .return($S1)
# }
.annotate 'line', 5767

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5770
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5771
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5772
    self.'annotate'(__ARG_1)
.annotate 'line', 5773
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5774

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5777
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5778

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5781
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5782
# value: $S2
    null $S2
.annotate 'line', 5783
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5785
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5786
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5787
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5789
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5792
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5793
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5795
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5796

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5799
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5800
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5801
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5802
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5804
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5805
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5806
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5808
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5810
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5811
    .return($S2)
# }
.annotate 'line', 5812

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
.annotate 'line', 5728
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5730
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
.annotate 'line', 5823
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5824
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5825

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5826
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5829
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5830
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5831
    .return(self)
# }
.annotate 'line', 5832

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 5835
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5836
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5837
    $P3 = $P2.'checkresult'()
    set $S3, $P3
    eq $S3, 'S', __label_1
.annotate 'line', 5838
    WSubId_44("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5839
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5840
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5841
    self.'annotate'(__ARG_1)
.annotate 'line', 5842
    set $S3, __ARG_2
    ne $S3, '', __label_4
.annotate 'line', 5843
    __ARG_2 = self.'tempreg'('P')
  __label_4: # endif
.annotate 'line', 5844
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", ", $S2)
# }
.annotate 'line', 5845

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_44 = "WSubId_44"
# Body
# {
.annotate 'line', 5848
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5849
# var right: $P2
    getattribute $P2, self, 'right'
.annotate 'line', 5850
    $P3 = $P2.'checkresult'()
    set $S5, $P3
    eq $S5, 'S', __label_1
.annotate 'line', 5851
    WSubId_44("string expression", $P2)
  __label_1: # endif
.annotate 'line', 5852
# lreg: $S1
    $P3 = $P1.'emit_get_nonull'(__ARG_1)
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5853
# rreg: $S2
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5854
# vreg: $S3
    null $S3
# switch
.annotate 'line', 5855
    $P3 = __ARG_2.'checkresult'()
    set $S5, $P3
    set $S6, 'P'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 5857
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    set $S3, $P4
.annotate 'line', 5859
    ne $S3, 'null', __label_7
# {
.annotate 'line', 5860
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5861
    __ARG_1.'emitnull'($S3)
# }
  __label_7: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 5865
    $P3 = self.'tempreg'('P')
    set $S3, $P3
.annotate 'line', 5866
# aux: $S4
    $P4 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5867
    __ARG_1.'emitbox'($S3, $S4)
  __label_4: # switch end
.annotate 'line', 5870
    self.'annotate'(__ARG_1)
.annotate 'line', 5871
    __ARG_1.'say'('    ', "setattribute ", $S1, ", ", $S2, ", ", $S3)
.annotate 'line', 5872
    .return($S3)
# }
.annotate 'line', 5873

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
.annotate 'line', 5818
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5820
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
.annotate 'line', 5887
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5888
    setattribute self, 'left', __ARG_4
.annotate 'line', 5889
    new $P3, [ 'Winxed'; 'Compiler'; 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5890

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5893
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S2, $P1
    ne $S2, 'S', __label_2
    set $S1, 'S'
    goto __label_1
  __label_2:
    set $S1, 'P'
  __label_1:
    .return($S1)
# }
.annotate 'line', 5894

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5897
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5898
    setattribute self, 'left', $P1
.annotate 'line', 5899
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5900
    $P2.'optimizeargs'()
.annotate 'line', 5904
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5905
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5906
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5907
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5908
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5909
# var t: $P4
    new $P4, [ 'Winxed'; 'Compiler'; 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5910
# predefined substr
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5911
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5914
    .return(self)
# }
.annotate 'line', 5915

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5918
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5919
    getattribute $P4, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_args', $P4)
  __label_1: # endif
.annotate 'line', 5920
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5921
    $P4 = $P1.'isidentifier'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 5922
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5923
    $P5 = $P1.'emit_get'(__ARG_1)
    set $P3, $P5
  __label_3:
.annotate 'line', 5921
    setattribute self, 'regleft', $P3
.annotate 'line', 5924
    getattribute $P4, self, 'args'
    $P3 = $P4.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5925

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 5928
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5929
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5930
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 5931
    getattribute $P3, self, 'start'
    WSubId_6('wrong call to IndexExpr.emit_aux', $P3)
  __label_1: # endif
.annotate 'line', 5932
    getattribute $P3, self, 'regleft'
    __ARG_1.'print'($P3, '[')
.annotate 'line', 5933
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5934
    __ARG_1.'print'(']')
# }
.annotate 'line', 5935

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 5938
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5939
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5940
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5941
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5942
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5943
    eq $I1, 1, __label_4
.annotate 'line', 5944
    WSubId_1('Bad string index', self)
  __label_4: # endif
.annotate 'line', 5945
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5946
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5947
    getattribute $P2, self, 'regleft'
    $P3 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P3, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5950
    self.'annotate'(__ARG_1)
.annotate 'line', 5951
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5952
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5953
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5955

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5958
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5959
    self.'annotate'(__ARG_1)
.annotate 'line', 5960
    __ARG_1.'print'('    ')
.annotate 'line', 5961
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5962
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5963

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5966
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5967
# rreg: $S1
    null $S1
.annotate 'line', 5968
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5969
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5970
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5973
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5974
    self.'annotate'(__ARG_1)
.annotate 'line', 5975
    __ARG_1.'print'('    ')
.annotate 'line', 5976
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5977
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5978
    .return($S1)
# }
.annotate 'line', 5979

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
.annotate 'line', 5878
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5880
    addattribute $P0, 'left'
.annotate 'line', 5881
    addattribute $P0, 'regleft'
.annotate 'line', 5882
    addattribute $P0, 'args'
.annotate 'line', 5883
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
.annotate 'line', 5990
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5991
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5992
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5993
    __ARG_1.'unget'($P1)
.annotate 'line', 5994
    $P3 = WSubId_40(__ARG_1, __ARG_2, WSubId_41, ']')
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5996

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5997
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 6000
    getattribute $P1, self, 'values'
    WSubId_42($P1)
.annotate 'line', 6001
    .return(self)
# }
.annotate 'line', 6002

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6005
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 6006
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 6007
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6013
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 6015

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6018
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6019
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 6020
    .return($S1)
# }
.annotate 'line', 6021

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6024
    self.'annotate'(__ARG_1)
.annotate 'line', 6025
# itemreg: $S1
    null $S1
.annotate 'line', 6026
# pnull: $S2
    null $S2
.annotate 'line', 6027
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6028
# size: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
    elements $I1, $P1
  __label_1:
.annotate 'line', 6029
    eq __ARG_2, '', __label_3
# {
.annotate 'line', 6030
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 6031
    le $I1, 0, __label_4
.annotate 'line', 6032
    __ARG_1.'emitassign'(__ARG_2, $I1)
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 6034
# i: $I2
    null $I2
.annotate 'line', 6035
    if_null $P1, __label_6
    iter $P3, $P1
    set $P3, 0
  __label_5: # for iteration
    unless $P3 goto __label_6
    shift $P2, $P3
# {
.annotate 'line', 6036
    $P4 = $P2.'isnull'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
# {
.annotate 'line', 6037
    eq __ARG_2, '', __label_9
# {
.annotate 'line', 6038
    unless_null $S2, __label_10
# {
.annotate 'line', 6039
    $P5 = self.'tempreg'('P')
    set $S2, $P5
.annotate 'line', 6040
    __ARG_1.'emitnull'($S2)
# }
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 6043
    set $S1, $S2
# }
    goto __label_8
  __label_7: # else
.annotate 'line', 6046
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
  __label_8: # endif
.annotate 'line', 6047
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 6048
    self.'annotate'(__ARG_1)
.annotate 'line', 6049
    __ARG_1.'say'('    ', __ARG_2, "[", $I2, "] = ", $S1)
.annotate 'line', 6050
    inc $I2
# }
  __label_11: # endif
# }
    goto __label_5
  __label_6: # endfor
# }
.annotate 'line', 6053

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
.annotate 'line', 5984
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5986
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
.annotate 'line', 6065
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6066
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6067
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 6068
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 6069
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 6070
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 6071
# {
.annotate 'line', 6072
# var key: $P4
    $P4 = WSubId_41(__ARG_1, __ARG_2)
.annotate 'line', 6073
    WSubId_58(':', __ARG_1)
.annotate 'line', 6074
# var value: $P5
    $P5 = WSubId_41(__ARG_1, __ARG_2)
.annotate 'line', 6075
# predefined push
    push $P2, $P4
.annotate 'line', 6076
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 6078
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 6079
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.annotate 'line', 6080
    WSubId_44("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 6082
    setattribute self, 'keys', $P2
.annotate 'line', 6083
    setattribute self, 'values', $P3
# }
.annotate 'line', 6084

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6085
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 6088
    getattribute $P1, self, 'keys'
    WSubId_42($P1)
.annotate 'line', 6089
    getattribute $P1, self, 'values'
    WSubId_42($P1)
.annotate 'line', 6090
    .return(self)
# }
.annotate 'line', 6091

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6094
    self.'annotate'(__ARG_1)
.annotate 'line', 6099
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 6100
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 6102
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 6103
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 6104
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 6105
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 6106
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 6107
# item: $S1
    null $S1
.annotate 'line', 6108
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 6109
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 6110
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 6111
    __ARG_1.'emitget_hll_global'($S1, $S2)
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 6114
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 6116
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 6117
# itemreg: $S3
    null $S3
.annotate 'line', 6118
# pnull: $S4
    null $S4
.annotate 'line', 6119
# aux: $S5
    null $S5
.annotate 'line', 6120
    $P5 = $P4.'isnull'()
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 6121
    set $S6, __ARG_2
    eq $S6, '', __label_10
# {
.annotate 'line', 6122
    unless_null $S4, __label_11
# {
.annotate 'line', 6123
    $P6 = self.'tempreg'('P')
    set $S4, $P6
.annotate 'line', 6124
    __ARG_1.'emitnull'($S4)
# }
  __label_11: # endif
# }
  __label_10: # endif
.annotate 'line', 6127
    set $S3, $S4
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6130
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_9: # endif
.annotate 'line', 6131
    set $S6, __ARG_2
    eq $S6, '', __label_12
.annotate 'line', 6132
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_12: # endif
# }
  __label_2: # for iteration
.annotate 'line', 6105
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 6134

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6137
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6138
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 6139
    .return($S1)
# }
.annotate 'line', 6140

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
.annotate 'line', 6058
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6060
    addattribute $P0, 'keys'
.annotate 'line', 6061
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6153
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6158
    new $P3, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 6159

.end # parseinitializer


.sub 'numargs' :method
# Body
# {
.annotate 'line', 6162
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6163
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
.annotate 'line', 6164

.end # numargs


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 6167
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6168
    if_null $P1, __label_1
.annotate 'line', 6169
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 6170

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6173
    self.'optimize_initializer'()
.annotate 'line', 6174
    .return(self)
# }
.annotate 'line', 6175

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 6178
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6179
    if_null $P1, __label_1
.annotate 'line', 6180
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 6181
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 6182
    if_null $P1, __label_2
.annotate 'line', 6183
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 6184
    __ARG_1.'say'(")")
# }
.annotate 'line', 6185

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
.annotate 'line', 6145
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6147
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
.annotate 'line', 6196
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6198
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 6199
    WSubId_1("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 6200
    setattribute self, 'value', __ARG_4
.annotate 'line', 6201
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6203
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 6204
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 6206
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 6207

.end # NewExpr


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6210
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 6211
    $P3 = $P1.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 6214
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P5 = $P1.'getidentifier'()
    $P2 = $P4.'getvar'($P5)
.annotate 'line', 6215
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_3
    $I1 = $P2.'isconst'()
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 6216
    $P1 = $P2.'getvalue'()
.annotate 'line', 6217
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_4
.annotate 'line', 6218
    WSubId_1('Constant value must evaluate to a string', $P1)
  __label_4: # endif
.annotate 'line', 6219
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 6222
    self.'optimize_initializer'()
.annotate 'line', 6223
    .return(self)
# }
.annotate 'line', 6224

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
.annotate 'line', 6227
    self.'annotate'(__ARG_1)
.annotate 'line', 6229
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 6230
# numinits: $I1
    $P7 = self.'numargs'()
    set $I1, $P7
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 6233
# type: $I2
    getattribute $P8, self, 'value'
    $P7 = $P8.'isstring'()
    if_null $P7, __label_2
    unless $P7 goto __label_2
    null $I2
    goto __label_1
  __label_2:
.annotate 'line', 6234
    getattribute $P10, self, 'value'
    $P9 = $P10.'isidentifier'()
    if_null $P9, __label_4
    unless $P9 goto __label_4
    set $I2, 1
    goto __label_3
  __label_4:
    set $I2, -1
  __label_3:
  __label_1:
.annotate 'line', 6236
# reginit: $S1
    set $S1, ''
.annotate 'line', 6237
# regnew: $S2
    set $P7, __ARG_2
    null $S2
    if_null $P7, __label_5
    set $S2, $P7
  __label_5:
.annotate 'line', 6238
# constructor: $S3
    null $S3
# switch
.annotate 'line', 6239
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
.annotate 'line', 6244
    ne $I2, 1, __label_11
# {
.annotate 'line', 6245
    not $I5, __ARG_3
    unless $I5 goto __label_13
.annotate 'line', 6246
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_13: # endif
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 6249
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6250
    $P7 = $P2.'emit_get'(__ARG_1)
    set $S1, $P7
.annotate 'line', 6251
    concat $S5, ', ', $S1
    set $S1, $S5
# }
  __label_12: # endif
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 6255
    eq $I2, 1, __label_14
.annotate 'line', 6256
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_14: # endif
.annotate 'line', 6257
    not $I3, __ARG_3
    unless $I3 goto __label_15
.annotate 'line', 6258
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_15: # endif
  __label_6: # switch end
.annotate 'line', 6261
    ne $S2, '', __label_16
.annotate 'line', 6262
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_16: # endif
# switch
.annotate 'line', 6264
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_19
    set $I4, 1
    if $I3 == $I4 goto __label_20
    goto __label_18
  __label_19: # case
.annotate 'line', 6267
# name: $S4
    getattribute $P8, self, 'value'
    $P7 = $P8.'rawstring'()
    null $S4
    if_null $P7, __label_21
    set $S4, $P7
  __label_21:
.annotate 'line', 6268
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 6269
    isnull $I5, $P3
    unless $I5 goto __label_23
    $I5 = self.'dowarnings'()
  __label_23:
    unless $I5 goto __label_22
.annotate 'line', 6270
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P9, self, 'value'
    WSubId_72($S5, $P9)
  __label_22: # endif
.annotate 'line', 6274
    getattribute $P10, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P10, " ]", $S1)
.annotate 'line', 6275
    le $I1, 1, __label_24
# {
.annotate 'line', 6276
    getattribute $P11, self, 'value'
    __ARG_1.'say'($S2, ".'", $P11, "'()")
# }
  __label_24: # endif
    goto __label_17 # break
  __label_20: # case
.annotate 'line', 6280
# var id: $P4
    getattribute $P7, self, 'owner'
    getattribute $P8, self, 'value'
    $P4 = $P7.'getvar'($P8)
.annotate 'line', 6281
    unless_null $P4, __label_25
# {
.annotate 'line', 6282
# var cl: $P5
    getattribute $P9, self, 'owner'
    getattribute $P10, self, 'value'
    $P5 = $P9.'checkclass'($P10)
.annotate 'line', 6283
    if_null $P5, __label_27
# {
.annotate 'line', 6284
# var key: $P6
    $P6 = $P5.'getpath'()
.annotate 'line', 6285
    $P6.'emit_new'(__ARG_1, self, $S2, $S1)
# }
    goto __label_28
  __label_27: # else
# {
.annotate 'line', 6288
    root_new $P7, ['parrot';'ResizablePMCArray']
    assign $P7, 1
    getattribute $P8, self, 'value'
    $P7[0] = $P8
    $P4 = self.'scopesearch'($P7, 2)
.annotate 'line', 6289
    if_null $P4, __label_29
.annotate 'line', 6290
    $P7 = $P4.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P7, $S1)
    goto __label_30
  __label_29: # else
# {
.annotate 'line', 6292
    $P8 = self.'dowarnings'()
    if_null $P8, __label_31
    unless $P8 goto __label_31
.annotate 'line', 6293
    WSubId_72('Checking: new unknown type')
  __label_31: # endif
.annotate 'line', 6294
    getattribute $P7, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P7, "']", $S1)
# }
  __label_30: # endif
# }
  __label_28: # endif
.annotate 'line', 6297
    getattribute $P7, self, 'value'
    set $S3, $P7
# }
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 6301
    $P7 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P7, "", $S1)
# }
  __label_26: # endif
    goto __label_17 # break
  __label_18: # default
.annotate 'line', 6305
    WSubId_6('Unexpected type in new')
  __label_17: # switch end
.annotate 'line', 6307
    isgt $I3, $I1, 1
    if $I3 goto __label_33
    isge $I3, $I1, 0
    unless $I3 goto __label_34
    iseq $I3, $I2, 1
  __label_34:
  __label_33:
    unless $I3 goto __label_32
# {
.annotate 'line', 6308
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 6309
    not $I3, __ARG_3
    unless $I3 goto __label_36
    set $S5, __ARG_2
    isne $I3, $S5, ''
  __label_36:
    unless $I3 goto __label_35
.annotate 'line', 6310
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_35: # endif
# }
  __label_32: # endif
# }
.annotate 'line', 6312

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6315
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 6316

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
.annotate 'line', 6190
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6192
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6327
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6328
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6329
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6330
    setattribute self, 'nskey', $P1
.annotate 'line', 6331
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6332
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6333
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6335
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6336

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6339
# reginit: $S1
    null $S1
# switch
.annotate 'line', 6340
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
.annotate 'line', 6345
# var initval: $P1
    getattribute $P4, self, 'initializer'
    $P1 = $P4.'getfreearg'(0)
.annotate 'line', 6346
    $P5 = $P1.'emit_get'(__ARG_1)
    set $S1, $P5
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6349
    WSubId_1('Multiple init arguments not allowed here', self)
  __label_1: # switch end
.annotate 'line', 6351
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 6353
    set $S2, __ARG_2
    ne $S2, '', __label_6
.annotate 'line', 6354
    __ARG_2 = self.'tempreg'('P')
  __label_6: # endif
.annotate 'line', 6356
    __ARG_1.'print'('    ')
.annotate 'line', 6357
    $P3 = $P2.'hasHLL'()
    if_null $P3, __label_7
    unless $P3 goto __label_7
.annotate 'line', 6358
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 6359
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 6360
    null $P3
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6361
    if_null $S1, __label_8
.annotate 'line', 6362
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 6363
    __ARG_1.'say'()
# }
.annotate 'line', 6364

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
.annotate 'line', 6321
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6323
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6375
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 6376
    setattribute self, 'owner', __ARG_2
.annotate 'line', 6377
# var nskey: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 6378
    setattribute self, 'nskey', $P1
.annotate 'line', 6379
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6380
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 6381
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 6383
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 6384

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6387
# numinits: $I1
    $P2 = self.'numargs'()
    set $I1, $P2
.annotate 'line', 6388
# regnew: $S1
    set $P2, __ARG_2
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 6389
    le $I1, 0, __label_2
.annotate 'line', 6390
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 6391
# var nskey: $P1
    getattribute $P1, self, 'nskey'
.annotate 'line', 6393
    ne $S1, '', __label_3
.annotate 'line', 6394
    $P2 = self.'tempreg'('P')
    set $S1, $P2
  __label_3: # endif
.annotate 'line', 6396
    $P1.'emit_new'(__ARG_1, self, $S1)
.annotate 'line', 6398
    lt $I1, 0, __label_4
# {
.annotate 'line', 6399
# constructor: $S2
    $P2 = $P1.'last'()
    null $S2
    if_null $P2, __label_5
    set $S2, $P2
  __label_5:
.annotate 'line', 6400
    self.'emit_constructor'(__ARG_1, $S1, $S2)
.annotate 'line', 6401
    set $S3, __ARG_2
    eq $S3, '', __label_6
.annotate 'line', 6402
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_6: # endif
# }
  __label_4: # endif
# }
.annotate 'line', 6404

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
.annotate 'line', 6369
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 6371
    addattribute $P0, 'nskey'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseNew' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6411
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6414
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6418
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6421
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 6416
    new $P4, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
.annotate 'line', 6417
    new $P6, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 6416
    .return($P3)
  __label_4: # case
.annotate 'line', 6420
    new $P8, [ 'Winxed'; 'Compiler'; 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 6424
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6425
    __ARG_1.'unget'($P2)
.annotate 'line', 6426
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 6428
    new $P11, [ 'Winxed'; 'Compiler'; 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 6433
    new $P4, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 6435

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
.annotate 'line', 6446
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6447
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 6448
    $P2 = WSubId_66(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 6449

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6452
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 6453
    .return(self)
# }
.annotate 'line', 6454

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6455
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 6458
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 6459
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 6460
    eq $S1, 'P', __label_2
.annotate 'line', 6461
    WSubId_1('Invalid instanceof left operand', $P1)
  __label_2: # endif
.annotate 'line', 6462
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 6464
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
.annotate 'line', 6465
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 6466
    self.'annotate'(__ARG_1)
.annotate 'line', 6467
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 6468
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 6469
    __ARG_1.'say'()
# }
.annotate 'line', 6470

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
.annotate 'line', 6439
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6441
    addattribute $P0, 'lexpr'
.annotate 'line', 6442
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
.annotate 'line', 6483
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 6484
    new $P3, [ 'Winxed'; 'Compiler'; 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 6485
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 6486
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 6487
    .return(self)
# }
.annotate 'line', 6488

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6491
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 6492
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6494
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 6496
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 6498
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 6499
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 6500
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 6502

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 6505
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6506
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6507
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 6509
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 6510

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6513
# cond_end: $S1
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 6514
# cond_false: $S2
    getattribute $P5, self, 'owner'
    $P4 = $P5.'genlabel'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 6515
    getattribute $P4, self, 'condition'
    $P4.'emit_else'(__ARG_1, $S2)
.annotate 'line', 6516
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 6517
# tres: $S3
    $P4 = self.'checkresult'()
    null $S3
    if_null $P4, __label_3
    set $S3, $P4
  __label_3:
.annotate 'line', 6518
    $P4 = $P1.'isnull'()
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 6519
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 6521
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 6522
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 6523
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 6524
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 6525
    $P4 = $P2.'isnull'()
    if_null $P4, __label_6
    unless $P4 goto __label_6
.annotate 'line', 6526
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 6528
# tfalse: $S4
    $P5 = $P2.'checkresult'()
    null $S4
    if_null $P5, __label_8
    set $S4, $P5
  __label_8:
.annotate 'line', 6529
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 6530
# r: $S5
    $P4 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P4, __label_12
    set $S5, $P4
  __label_12:
.annotate 'line', 6531
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
# {
.annotate 'line', 6535
    ne $S4, 'P', __label_13
# {
.annotate 'line', 6536
# var aux: $P3
    $P3 = $P2.'emit_get'(__ARG_1)
.annotate 'line', 6537
    __ARG_1.'emitset'(__ARG_2, $P3)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 6540
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_14: # endif
# }
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 6543
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 6544

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
.annotate 'line', 6475
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 6477
    addattribute $P0, 'condition'
.annotate 'line', 6478
    addattribute $P0, 'etrue'
.annotate 'line', 6479
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

.sub 'getOpCode_2' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6588
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
.annotate 'line', 6589
    .return(1)
  __label_4: # case
.annotate 'line', 6590
    .return(2)
  __label_5: # case
.annotate 'line', 6591
    .return(3)
  __label_2: # default
.annotate 'line', 6592
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6594

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_77')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6598
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
.annotate 'line', 6599
    .return(8)
  __label_4: # case
.annotate 'line', 6600
    .return(11)
  __label_5: # case
.annotate 'line', 6601
    .return(9)
  __label_6: # case
.annotate 'line', 6602
    .return(10)
  __label_2: # default
.annotate 'line', 6604
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6605
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6606
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6608

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6612
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
.annotate 'line', 6613
    .return(19)
  __label_4: # case
.annotate 'line', 6614
    .return(20)
  __label_5: # case
.annotate 'line', 6615
    .return(21)
  __label_6: # case
.annotate 'line', 6616
    .return(22)
  __label_2: # default
.annotate 'line', 6617
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6619

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_83')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6623
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6624
    .return(28)
  __label_4: # case
.annotate 'line', 6625
    .return(29)
  __label_2: # default
.annotate 'line', 6626
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6628

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_85')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6632
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
.annotate 'line', 6633
    .return(14)
  __label_4: # case
.annotate 'line', 6634
    .return(16)
  __label_5: # case
.annotate 'line', 6635
    .return(15)
  __label_6: # case
.annotate 'line', 6636
    .return(17)
  __label_2: # default
.annotate 'line', 6638
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6639
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6641

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_87')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6645
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
.annotate 'line', 6646
    .return(12)
  __label_4: # case
.annotate 'line', 6647
    .return(13)
  __label_5: # case
.annotate 'line', 6648
    .return(25)
  __label_6: # case
.annotate 'line', 6649
    .return(26)
  __label_2: # default
.annotate 'line', 6650
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6652

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_96')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6656
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
.annotate 'line', 6657
    .return(4)
  __label_4: # case
.annotate 'line', 6658
    .return(5)
  __label_5: # case
.annotate 'line', 6659
    .return(6)
  __label_6: # case
.annotate 'line', 6660
    .return(18)
  __label_7: # case
.annotate 'line', 6661
    .return(23)
  __label_8: # case
.annotate 'line', 6662
    .return(24)
  __label_9: # case
.annotate 'line', 6663
    .return(30)
  __label_2: # default
.annotate 'line', 6664
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6666

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
.annotate 'line', 6670
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6671
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6674
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6678
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6680
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6682
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6684
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6686
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6688
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6690
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6692
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6694
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_12
.annotate 'line', 6696
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_13
    goto __label_2
  __label_3: # case
.annotate 'line', 6675
    $P2 = WSubId_41(__ARG_1, __ARG_2)
.annotate 'line', 6676
    WSubId_58(')', __ARG_1)
.annotate 'line', 6677
    .return($P2)
  __label_4: # case
.annotate 'line', 6679
    new $P4, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
    $P4.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_5: # case
.annotate 'line', 6681
    new $P6, [ 'Winxed'; 'Compiler'; 'HashExpr' ]
    $P6.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P5, $P6
    .return($P5)
  __label_6: # case
.annotate 'line', 6683
    new $P8, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P8.'StringLiteral'(__ARG_2, $P1)
    set $P7, $P8
    .return($P7)
  __label_7: # case
.annotate 'line', 6685
    $P9 = $P1.'getintvalue'()
    .tailcall WSubId_21(__ARG_2, $P1, $P9)
  __label_8: # case
.annotate 'line', 6687
    new $P11, [ 'Winxed'; 'Compiler'; 'FloatLiteral' ]
    $P11.'FloatLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_9: # case
.annotate 'line', 6689
    .tailcall WSubId_73(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6691
    new $P13, [ 'Winxed'; 'Compiler'; 'FunctionExpr' ]
    $P13.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_11: # case
.annotate 'line', 6693
    new $P15, [ 'Winxed'; 'Compiler'; 'OpClassExpr' ]
    $P15.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_12: # case
.annotate 'line', 6695
    new $P17, [ 'Winxed'; 'Compiler'; 'OpNamespaceExpr' ]
    $P17.'OpNamespaceExpr'(__ARG_1, __ARG_2, $P1)
    set $P16, $P17
    .return($P16)
  __label_13: # case
.annotate 'line', 6697
    new $P19, [ 'Winxed'; 'Compiler'; 'IdentifierExpr' ]
    $P19.'IdentifierExpr'(__ARG_2, $P1)
    set $P18, $P19
    .return($P18)
  __label_2: # default
.annotate 'line', 6699
    WSubId_44('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6701

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_74 = "WSubId_74"
.const 'Sub' WSubId_75 = "WSubId_75"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6705
# var subexp: $P1
    $P1 = WSubId_74(__ARG_1, __ARG_2)
.annotate 'line', 6706
# var t: $P2
    null $P2
.annotate 'line', 6707
# var start: $P3
    null $P3
.annotate 'line', 6708
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6709
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_75($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6710
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6712
    new $P6, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    $P6.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P6
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6715
    new $P7, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    $P7.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P7
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6718
    set $P3, $P2
.annotate 'line', 6719
    $P2 = __ARG_1.'get'()
.annotate 'line', 6720
    $P8 = $P2.'isop'('*')
    if_null $P8, __label_8
    unless $P8 goto __label_8
# {
.annotate 'line', 6721
# var right: $P4
    $P4 = WSubId_74(__ARG_1, __ARG_2)
.annotate 'line', 6722
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberRefExpr' ]
    $P5.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P5
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6725
    new $P5, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    $P5.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6728
    WSubId_6('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6731
    __ARG_1.'unget'($P2)
.annotate 'line', 6732
    .return($P1)
# }
.annotate 'line', 6733

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_76 = "WSubId_76"
# Body
# {
.annotate 'line', 6737
# var subexp: $P1
    $P1 = WSubId_76(__ARG_1, __ARG_2)
.annotate 'line', 6738
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6740
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6742
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6741
    new $P4, [ 'Winxed'; 'Compiler'; 'OpPostIncExpr' ]
    $P4.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P3, $P4
    .return($P3)
  __label_4: # case
.annotate 'line', 6743
    new $P6, [ 'Winxed'; 'Compiler'; 'OpPostDecExpr' ]
    $P6.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_2: # default
.annotate 'line', 6745
    __ARG_1.'unget'($P2)
.annotate 'line', 6746
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6748

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
.annotate 'line', 6752
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6753
# code: $I1
    $P3 = WSubId_77($P1)
    set $I1, $P3
.annotate 'line', 6754
    unless $I1 goto __label_1
# {
.annotate 'line', 6755
# var subexpr: $P2
    $P2 = WSubId_78(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6756
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
.annotate 'line', 6758
    new $P4, [ 'Winxed'; 'Compiler'; 'OpUnaryMinusExpr' ]
    $P4.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P3, $P4
    .return($P3)
  __label_6: # case
.annotate 'line', 6760
    new $P6, [ 'Winxed'; 'Compiler'; 'OpNotExpr' ]
    $P6.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P5, $P6
    .return($P5)
  __label_7: # case
.annotate 'line', 6762
    new $P8, [ 'Winxed'; 'Compiler'; 'OpPreIncExpr' ]
    $P8.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P7, $P8
    .return($P7)
  __label_8: # case
.annotate 'line', 6764
    new $P10, [ 'Winxed'; 'Compiler'; 'OpPreDecExpr' ]
    $P10.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P9, $P10
    .return($P9)
  __label_9: # case
.annotate 'line', 6766
    new $P12, [ 'Winxed'; 'Compiler'; 'OpDeleteExpr' ]
    $P12.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P11, $P12
    .return($P11)
  __label_10: # case
.annotate 'line', 6768
    new $P14, [ 'Winxed'; 'Compiler'; 'OpExistsExpr' ]
    $P14.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P13, $P14
    .return($P13)
  __label_4: # default
.annotate 'line', 6770
    WSubId_6('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6774
    __ARG_1.'unget'($P1)
.annotate 'line', 6775
    .tailcall WSubId_79(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6777

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_78 = "WSubId_78"
.const 'Sub' WSubId_80 = "WSubId_80"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6781
# var lexpr: $P1
    $P1 = WSubId_78(__ARG_1, __ARG_2)
.annotate 'line', 6782
# var t: $P2
    null $P2
.annotate 'line', 6783
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6784
    $P2 = __ARG_1.'get'()
    $P4 = WSubId_80($P2)
    set $I1, $P4
    unless $I1 goto __label_1
# {
.annotate 'line', 6785
# var rexpr: $P3
    $P3 = WSubId_78(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6786
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
.annotate 'line', 6788
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulExpr' ]
    $P4.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6791
    new $P5, [ 'Winxed'; 'Compiler'; 'OpDivExpr' ]
    $P5.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P5
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6794
    new $P6, [ 'Winxed'; 'Compiler'; 'OpModExpr' ]
    $P6.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6797
    new $P7, [ 'Winxed'; 'Compiler'; 'OpCModExpr' ]
    $P7.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6800
    WSubId_6('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6803
    __ARG_1.'unget'($P2)
.annotate 'line', 6804
    .return($P1)
# }
.annotate 'line', 6805

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_82')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_81 = "WSubId_81"
# Body
# {
.annotate 'line', 6809
# var lexpr: $P1
    $P1 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6810
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6811
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6812
# var rexpr: $P3
    $P3 = WSubId_81(__ARG_1, __ARG_2)
.annotate 'line', 6813
# var expr: $P4
    null $P4
.annotate 'line', 6814
    $P5 = $P2.'isop'('+')
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 6815
    new $P6, [ 'Winxed'; 'Compiler'; 'OpAddExpr' ]
    $P6.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 6817
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSubExpr' ]
    $P7.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P7
  __label_5: # endif
.annotate 'line', 6818
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6820
    __ARG_1.'unget'($P2)
.annotate 'line', 6821
    .return($P1)
# }
.annotate 'line', 6822

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_82 = "WSubId_82"
.const 'Sub' WSubId_83 = "WSubId_83"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6826
# var lexpr: $P1
    $P1 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6827
# var rexpr: $P2
    null $P2
.annotate 'line', 6828
# var t: $P3
    null $P3
.annotate 'line', 6829
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6830
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_83($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6831
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6833
    $P2 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6834
    new $P5, [ 'Winxed'; 'Compiler'; 'OpShiftleftExpr' ]
    $P5.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6837
    $P2 = WSubId_82(__ARG_1, __ARG_2)
.annotate 'line', 6838
    new $P6, [ 'Winxed'; 'Compiler'; 'OpShiftrightExpr' ]
    $P6.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P6
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6841
    WSubId_6('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6844
    __ARG_1.'unget'($P3)
.annotate 'line', 6845
    .return($P1)
# }
.annotate 'line', 6846

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_84 = "WSubId_84"
.const 'Sub' WSubId_85 = "WSubId_85"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6850
# var lexpr: $P1
    $P1 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6851
# var rexpr: $P2
    null $P2
.annotate 'line', 6852
# var t: $P3
    null $P3
.annotate 'line', 6853
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6854
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_85($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6855
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
.annotate 'line', 6857
    $P2 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6858
    new $P5, [ 'Winxed'; 'Compiler'; 'OpLessExpr' ]
    $P1 = $P5.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6861
    $P2 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6862
    new $P6, [ 'Winxed'; 'Compiler'; 'OpGreaterExpr' ]
    $P1 = $P6.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6865
    $P2 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6866
    new $P7, [ 'Winxed'; 'Compiler'; 'OpLessEqualExpr' ]
    $P1 = $P7.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6869
    $P2 = WSubId_84(__ARG_1, __ARG_2)
.annotate 'line', 6870
    new $P8, [ 'Winxed'; 'Compiler'; 'OpGreaterEqualExpr' ]
    $P1 = $P8.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6873
    new $P9, [ 'Winxed'; 'Compiler'; 'OpInstanceOfExpr' ]
    $P9.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P9
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6876
    WSubId_6('Invalid code in parseExpr_9', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6879
    __ARG_1.'unget'($P3)
.annotate 'line', 6880
    .return($P1)
# }
.annotate 'line', 6881

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_86 = "WSubId_86"
.const 'Sub' WSubId_87 = "WSubId_87"
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 6885
# var lexpr: $P1
    $P1 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6886
# var rexpr: $P2
    null $P2
.annotate 'line', 6887
# var t: $P3
    null $P3
.annotate 'line', 6888
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6889
    $P3 = __ARG_1.'get'()
    $P4 = WSubId_87($P3)
    set $I1, $P4
    unless $I1 goto __label_1
# {
# switch
.annotate 'line', 6890
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
.annotate 'line', 6892
    $P2 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6893
    new $P5, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P5.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P5
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6896
    $P2 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6897
    new $P6, [ 'Winxed'; 'Compiler'; 'OpEqualExpr' ]
    $P6.'OpEqualExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P6
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6900
    $P2 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6901
    new $P7, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P7.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 1)
    set $P1, $P7
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6904
    $P2 = WSubId_86(__ARG_1, __ARG_2)
.annotate 'line', 6905
    new $P8, [ 'Winxed'; 'Compiler'; 'OpSameExpr' ]
    $P8.'OpSameExpr'(__ARG_2, $P3, $P1, $P2, 0)
    set $P1, $P8
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6908
    WSubId_6('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6911
    __ARG_1.'unget'($P3)
.annotate 'line', 6912
    .return($P1)
# }
.annotate 'line', 6913

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_88 = "WSubId_88"
# Body
# {
.annotate 'line', 6917
# var lexpr: $P1
    $P1 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6918
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6919
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6920
# var rexpr: $P3
    $P3 = WSubId_88(__ARG_1, __ARG_2)
.annotate 'line', 6921
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinAndExpr' ]
    $P4.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6923
    __ARG_1.'unget'($P2)
.annotate 'line', 6924
    .return($P1)
# }
.annotate 'line', 6925

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_89 = "WSubId_89"
# Body
# {
.annotate 'line', 6929
# var lexpr: $P1
    $P1 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6930
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6931
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('^')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6932
# var rexpr: $P3
    $P3 = WSubId_89(__ARG_1, __ARG_2)
.annotate 'line', 6933
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinXorExpr' ]
    $P4.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6935
    __ARG_1.'unget'($P2)
.annotate 'line', 6936
    .return($P1)
# }
.annotate 'line', 6937

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_91')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_90 = "WSubId_90"
# Body
# {
.annotate 'line', 6941
# var lexpr: $P1
    $P1 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6942
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6943
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('|')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6944
# var rexpr: $P3
    $P3 = WSubId_90(__ARG_1, __ARG_2)
.annotate 'line', 6945
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBinOrExpr' ]
    $P4.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6947
    __ARG_1.'unget'($P2)
.annotate 'line', 6948
    .return($P1)
# }
.annotate 'line', 6949

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_92')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_91 = "WSubId_91"
# Body
# {
.annotate 'line', 6953
# var lexpr: $P1
    $P1 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6954
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6955
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('&&')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6956
# var rexpr: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6957
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolAndExpr' ]
    $P4.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6959
    __ARG_1.'unget'($P2)
.annotate 'line', 6960
    .return($P1)
# }
.annotate 'line', 6961

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_92 = "WSubId_92"
.const 'Sub' WSubId_91 = "WSubId_91"
# Body
# {
.annotate 'line', 6965
# var lexpr: $P1
    $P1 = WSubId_92(__ARG_1, __ARG_2)
.annotate 'line', 6966
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6967
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'('||')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 6968
# var rexpr: $P3
    $P3 = WSubId_91(__ARG_1, __ARG_2)
.annotate 'line', 6969
    new $P4, [ 'Winxed'; 'Compiler'; 'OpBoolOrExpr' ]
    $P4.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6971
    __ARG_1.'unget'($P2)
.annotate 'line', 6972
    .return($P1)
# }
.annotate 'line', 6973

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_95')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_93 = "WSubId_93"
.const 'Sub' WSubId_94 = "WSubId_94"
.const 'Sub' WSubId_58 = "WSubId_58"
# Body
# {
.annotate 'line', 6977
# var econd: $P1
    $P1 = WSubId_93(__ARG_1, __ARG_2)
.annotate 'line', 6978
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6979
    $P5 = $P2.'isop'('?')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 6980
# var etrue: $P3
    $P3 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 6981
    WSubId_58(':', __ARG_1)
.annotate 'line', 6982
# var efalse: $P4
    $P4 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 6983
    new $P6, [ 'Winxed'; 'Compiler'; 'OpConditionalExpr' ]
    $P6.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P5, $P6
    .return($P5)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6986
    __ARG_1.'unget'($P2)
.annotate 'line', 6987
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6989

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
.annotate 'line', 6993
# var lexpr: $P1
    $P1 = WSubId_95(__ARG_1, __ARG_2)
.annotate 'line', 6994
# var t: $P2
    null $P2
.annotate 'line', 6995
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6996
    $P2 = __ARG_1.'get'()
    $P5 = WSubId_96($P2)
    set $I1, $P5
    unless $I1 goto __label_1
# {
.annotate 'line', 6997
# var rexpr: $P3
    $P3 = WSubId_94(__ARG_1, __ARG_2)
.annotate 'line', 6998
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6999
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
.annotate 'line', 7001
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 7004
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 7007
    new $P4, [ 'Winxed'; 'Compiler'; 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 7010
    new $P4, [ 'Winxed'; 'Compiler'; 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 7013
    new $P4, [ 'Winxed'; 'Compiler'; 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 7016
    new $P4, [ 'Winxed'; 'Compiler'; 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 7019
    new $P4, [ 'Winxed'; 'Compiler'; 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 7022
    WSubId_6('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 7024
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 7025
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

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_41')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_94 = "WSubId_94"
# Body
# {
.annotate 'line', 7033
    .tailcall WSubId_94(__ARG_1, __ARG_2)
# }
.annotate 'line', 7034

.end # parseExpr

.namespace [ 'Winxed'; 'Compiler'; 'Breakable' ]

.sub 'genbreaklabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7049
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.annotate 'line', 7050
    WSubId_6('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 7051
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7052
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 7053
    .return($S1)
# }
.annotate 'line', 7054

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7057
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 7058
    unless_null $P1, __label_1
.annotate 'line', 7059
    WSubId_6('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 7060
    .return($P1)
# }
.annotate 'line', 7061

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Breakable' ]
.annotate 'line', 7045
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Continuable' ]

.sub 'gencontinuelabel' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7070
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.annotate 'line', 7071
    WSubId_6('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 7072
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 7073
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 7074
    .return($S1)
# }
.annotate 'line', 7075

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 7078
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 7079
    unless_null $P1, __label_1
.annotate 'line', 7080
    WSubId_6('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 7081
    .return($P1)
# }
.annotate 'line', 7082

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Continuable' ]
.annotate 'line', 7064
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 7066
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7098
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7099
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7100
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7101
    __ARG_2.'unget'($P1)
.annotate 'line', 7102
    new $P4, [ 'Winxed'; 'Compiler'; 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 7104

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7107
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7108
    if_null $P1, __label_1
.annotate 'line', 7109
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 7110
    .return(self)
# }
.annotate 'line', 7111

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7115
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 7116
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 7119
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 7120
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 7121
    $I2 = $P2.'cantailcall'()
    unless $I2 goto __label_6
    getattribute $P3, self, 'owner'
    $I2 = $P3.'allowtailcall'()
  __label_6:
    unless $I2 goto __label_5
# {
.annotate 'line', 7122
    self.'annotate'(__ARG_1)
.annotate 'line', 7123
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 7127
    le $I1, 0, __label_7
.annotate 'line', 7128
    $P1.'getargvalues'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7130
    self.'annotate'(__ARG_1)
.annotate 'line', 7131
    self.'emitret'(__ARG_1)
.annotate 'line', 7132
    le $I1, 0, __label_8
.annotate 'line', 7133
    $P1.'emitargs'(__ARG_1)
  __label_8: # endif
.annotate 'line', 7134
    __ARG_1.'say'(')')
# }
.annotate 'line', 7135

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
.annotate 'line', 7092
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7094
    addattribute $P0, 'values'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7142
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7143

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7146
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 7147

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ReturnStatement' ]
.annotate 'line', 7138
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
.annotate 'line', 7154
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7155

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7158
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 7159

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'YieldStatement' ]
.annotate 'line', 7150
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7172
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7173
    setattribute self, 'name', __ARG_1
.annotate 'line', 7174
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 7175

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7176
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7179
    self.'annotate'(__ARG_1)
.annotate 'line', 7180
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 7181

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LabelStatement' ]
.annotate 'line', 7166
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7168
    addattribute $P0, 'name'
.annotate 'line', 7169
    addattribute $P0, 'value'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7195
    setattribute self, 'owner', __ARG_1
.annotate 'line', 7196
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 7197

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7198
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7201
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7202
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7203
    .return($S2)
# }
.annotate 'line', 7204

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Reflabel' ]
.annotate 'line', 7190
    addattribute $P0, 'owner'
.annotate 'line', 7191
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
.annotate 'line', 7217
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7218
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7219
    WSubId_97($P1)
.annotate 'line', 7220
    setattribute self, 'label', $P1
.annotate 'line', 7221
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 7222

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7223
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7226
    self.'annotate'(__ARG_1)
.annotate 'line', 7227
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7228
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7229
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 7230

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'GotoStatement' ]
.annotate 'line', 7211
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7213
    addattribute $P0, 'label'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7241
    $P1 = WSubId_41(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 7242

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_58 = "WSubId_58"
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7245
    WSubId_58('(', __ARG_1)
.annotate 'line', 7246
    $P1 = WSubId_41(__ARG_1, self)
    self.'set'($P1)
.annotate 'line', 7247
    WSubId_58(')', __ARG_1)
# }
.annotate 'line', 7248

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
.annotate 'line', 7237
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
.annotate 'line', 7261
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7262
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7263
    $P3 = WSubId_98(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 7264
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7265
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7266
    $P4 = WSubId_98(__ARG_2, self)
    setattribute self, 'falsebranch', $P4
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7268
    new $P6, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P6
.annotate 'line', 7269
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 7271

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7274
    self.'optimize_condition'()
.annotate 'line', 7275
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 7276
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 7277
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7279
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 7281
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 7283
    .return(self)
# }
.annotate 'line', 7284

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7287
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 7288
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 7289
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 7290
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 7291
# elselabel: $S1
    set $S1, ''
.annotate 'line', 7292
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 7293
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 7294
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 7295
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 7296
    self.'annotate'(__ARG_1)
.annotate 'line', 7297
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 7298
    $P1.'emit'(__ARG_1)
.annotate 'line', 7300
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 7301
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7302
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 7303
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 7305
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 7306

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IfStatement' ]
.annotate 'line', 7255
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 7257
    addattribute $P0, 'truebranch'
.annotate 'line', 7258
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'Winxed'; 'Compiler'; 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 7318
    $P2 = WSubId_98(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 7319

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7322
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7323
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7325
    self.'annotate'(__ARG_1)
.annotate 'line', 7326
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 7327
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7328
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7329
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 7330

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
.annotate 'line', 7313
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 7315
    addattribute $P0, 'body'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7341
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7342
    self.'parsecondition'(__ARG_2)
.annotate 'line', 7343
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7344

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7347
    self.'optimize_condition'()
.annotate 'line', 7348
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7349
    .return(self)
# }
.annotate 'line', 7350

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 7353
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 7355
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 7358
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7361
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 7362
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 7364
    self.'annotate'(__ARG_1)
.annotate 'line', 7365
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 7366
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 7367
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 7368
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 7369
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 7371

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WhileStatement' ]
.annotate 'line', 7337
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
.annotate 'line', 7382
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7383
    self.'parsebody'(__ARG_2)
.annotate 'line', 7384
    WSubId_99('while', __ARG_2)
.annotate 'line', 7385
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 7386

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7389
    self.'optimize_condition'()
.annotate 'line', 7390
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 7391
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7392
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7393
    setattribute self, 'body', $P1
.annotate 'line', 7394
    .return(self)
# }
.annotate 'line', 7395

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7398
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 7399
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 7400
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 7402
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 7405
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 7406
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 7407
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 7409
    self.'annotate'(__ARG_1)
.annotate 'line', 7410
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 7412
    $P1.'emit'(__ARG_1)
.annotate 'line', 7413
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 7414
    eq $I1, 2, __label_7
.annotate 'line', 7415
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 7416
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 7418

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DoStatement' ]
.annotate 'line', 7378
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
.annotate 'line', 7429
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7430
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 7431

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7432
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7435
    self.'annotate'(__ARG_1)
.annotate 'line', 7436
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7437
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 7438

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ContinueStatement' ]
.annotate 'line', 7425
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
.annotate 'line', 7449
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7450
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 7451

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7452
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7455
    self.'annotate'(__ARG_1)
.annotate 'line', 7456
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7457
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 7458

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BreakStatement' ]
.annotate 'line', 7445
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 7473
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7474
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 7475
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 7476
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 7477

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_41 = "WSubId_41"
.const 'Sub' WSubId_44 = "WSubId_44"
.const 'Sub' WSubId_98 = "WSubId_98"
# Body
# {
.annotate 'line', 7480
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7481
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 7482
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 7483
    getattribute $P4, self, 'case_value'
    $P5 = WSubId_41(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 7484
    $P1 = __ARG_1.'get'()
.annotate 'line', 7485
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.annotate 'line', 7486
    WSubId_44("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 7487
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 7488
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
.annotate 'line', 7489
    __ARG_1.'unget'($P1)
.annotate 'line', 7490
    $P3 = WSubId_98(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 7492
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 7493
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7496
    $P1 = __ARG_1.'get'()
.annotate 'line', 7497
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.annotate 'line', 7498
    WSubId_44("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 7499
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
.annotate 'line', 7500
    __ARG_1.'unget'($P1)
.annotate 'line', 7501
    getattribute $P3, self, 'default_st'
    $P4 = WSubId_98(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 7503
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 7506
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.annotate 'line', 7507
    WSubId_44("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 7508

.end # parse_cases


.sub 'optimize_cases' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 7511
    getattribute $P2, self, 'case_value'
    WSubId_42($P2)
.annotate 'line', 7512
    getattribute $P2, self, 'case_st'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 7513
    WSubId_42($P1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7514
    getattribute $P2, self, 'default_st'
    WSubId_42($P2)
# }
.annotate 'line', 7515

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
.annotate 'line', 7465
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 7467
    addattribute $P0, 'case_value'
.annotate 'line', 7468
    addattribute $P0, 'case_st'
.annotate 'line', 7469
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
.annotate 'line', 7528
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7529
    $P3 = WSubId_41(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7530
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7531
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 7532
    WSubId_44("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7533
    $P1 = __ARG_2.'get'()
.annotate 'line', 7534
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.annotate 'line', 7535
    WSubId_44("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7536
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7537

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7540
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7541
    self.'optimize_cases'()
.annotate 'line', 7542
    .return(self)
# }
.annotate 'line', 7543

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 7547
# type: $S1
    set $S1, ''
.annotate 'line', 7548
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_2
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7549
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7550
    ne $S2, 'N', __label_4
.annotate 'line', 7551
    WSubId_1("Invalid type in case", self)
  __label_4: # endif
.annotate 'line', 7552
    ne $S1, '', __label_5
.annotate 'line', 7553
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7554
    eq $S1, $S2, __label_7
.annotate 'line', 7555
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7558
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7559
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7563
    ne $S1, '', __label_8
.annotate 'line', 7564
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7566
    __ARG_1.'comment'('switch')
.annotate 'line', 7567
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7568
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7569
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7571
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7572
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7576
    self.'genbreaklabel'()
.annotate 'line', 7577
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7578
    new $P4, ['ResizableStringArray']
.annotate 'line', 7579
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7580
    getattribute $P7, self, 'case_value'
    if_null $P7, __label_16
    iter $P10, $P7
    set $P10, 0
  __label_15: # for iteration
    unless $P10 goto __label_16
    shift $P5, $P10
# {
.annotate 'line', 7581
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7582
# predefined push
    push $P4, $S7
.annotate 'line', 7583
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7584
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7586
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7589
    self.'annotate'(__ARG_1)
.annotate 'line', 7590
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7591
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7592
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7593
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.annotate 'line', 7594
    $P7 = $P6[$I2]
    WSubId_56(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7592
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7597
    __ARG_1.'emitlabel'($S5, 'default')
.annotate 'line', 7598
    getattribute $P7, self, 'default_st'
    WSubId_56(__ARG_1, $P7)
.annotate 'line', 7600
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7601

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
.annotate 'line', 7522
    get_class $P1, [ 'Winxed'; 'Compiler'; 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7524
    addattribute $P0, 'condition'
.end
.namespace [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7613
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7614
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7615

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7618
    self.'optimize_cases'()
.annotate 'line', 7619
    .return(self)
# }
.annotate 'line', 7620

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 7624
    self.'genbreaklabel'()
.annotate 'line', 7625
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7626
    new $P1, ['ResizableStringArray']
.annotate 'line', 7628
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7629
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7630
    getattribute $P4, self, 'case_value'
    if_null $P4, __label_4
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7631
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7632
# predefined push
    push $P1, $S3
.annotate 'line', 7633
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7634
    __ARG_1.'emitif'($S2, $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7636
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7639
    self.'annotate'(__ARG_1)
.annotate 'line', 7640
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7641
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7642
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7643
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.annotate 'line', 7644
    $P4 = $P3[$I2]
    WSubId_56(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7642
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7647
    __ARG_1.'emitlabel'($S1, 'default')
.annotate 'line', 7648
    getattribute $P4, self, 'default_st'
    WSubId_56(__ARG_1, $P4)
.annotate 'line', 7650
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7651

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
.annotate 'line', 7608
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
.annotate 'line', 7658
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7659
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7660
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7661
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7662
    new $P4, [ 'Winxed'; 'Compiler'; 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 7663
    WSubId_44("'(' in switch", $P1)
# }
.annotate 'line', 7664

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
.annotate 'line', 7677
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7678
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7679
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7680
    __ARG_2.'unget'($P1)
.annotate 'line', 7681
    $P3 = WSubId_98(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7683
    $P1 = __ARG_2.'get'()
.annotate 'line', 7684
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7685
    __ARG_2.'unget'($P1)
.annotate 'line', 7686
    self.'parseconditionshort'(__ARG_2)
.annotate 'line', 7687
    WSubId_58(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7689
    $P1 = __ARG_2.'get'()
.annotate 'line', 7690
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7691
    __ARG_2.'unget'($P1)
.annotate 'line', 7692
    $P3 = WSubId_41(__ARG_2, self)
    setattribute self, 'iteration', $P3
.annotate 'line', 7693
    WSubId_58(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7695
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7696

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7699
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 7700
    if_null $P1, __label_1
.annotate 'line', 7701
    $P1 = $P1.'optimize'()
    setattribute self, 'initializer', $P1
  __label_1: # endif
.annotate 'line', 7702
    getattribute $P2, self, 'condexpr'
    if_null $P2, __label_2
# {
.annotate 'line', 7703
    self.'optimize_condition'()
.annotate 'line', 7704
    $P2 = self.'getvalue'()
    set $I1, $P2
    ne $I1, 2, __label_3
# {
.annotate 'line', 7705
    if_null $P1, __label_4
.annotate 'line', 7706
    .return($P1)
    goto __label_5
  __label_4: # else
.annotate 'line', 7708
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_5: # endif
# }
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 7711
    getattribute $P2, self, 'iteration'
    if_null $P2, __label_6
.annotate 'line', 7712
    getattribute $P5, self, 'iteration'
    $P4 = $P5.'optimize'()
    setattribute self, 'iteration', $P4
  __label_6: # endif
.annotate 'line', 7713
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7714
    .return(self)
# }
.annotate 'line', 7715

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7718
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7719
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7720
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7721
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7722
    .return()
# }
  __label_1: # endif
.annotate 'line', 7724
    __ARG_1.'comment'('for loop')
.annotate 'line', 7725
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7726
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7727
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7728
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7729
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7731
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7732
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7733
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7735
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7736
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7737
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7738
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7739
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7741
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7742

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
.annotate 'line', 7670
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'Winxed'; 'Compiler'; 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7672
    addattribute $P0, 'initializer'
.annotate 'line', 7673
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
.annotate 'line', 7757
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7758
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7759
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7760
# deftype: $S2
    $P1 = WSubId_100(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7761
    self.'createvar'($S1, $S2)
.annotate 'line', 7762
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7764
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7765
    $P2 = WSubId_41(__ARG_2, self)
    setattribute self, 'container', $P2
.annotate 'line', 7766
    WSubId_58(')', __ARG_2)
.annotate 'line', 7767
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7768

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7771
# var container: $P1
    getattribute $P2, self, 'container'
    $P1 = $P2.'optimize'()
.annotate 'line', 7775
    $I1 = $P1.'isnull'()
    if $I1 goto __label_2
.annotate 'line', 7776
    $I1 = $P1.'isstringliteral'()
    unless $I1 goto __label_3
.annotate 'line', 7777
    $P2 = $P1.'get_value'()
    set $S1, $P2
# predefined length
    length $I2, $S1
    iseq $I1, $I2, 0
  __label_3:
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 7778
    new $P3, [ 'Winxed'; 'Compiler'; 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 7780
    setattribute self, 'container', $P1
.annotate 'line', 7781
    getattribute $P4, self, 'body'
    $P3 = $P4.'optimize'()
    setattribute self, 'body', $P3
.annotate 'line', 7782
    .return(self)
# }
.annotate 'line', 7783

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_65 = "WSubId_65"
# Body
# {
.annotate 'line', 7786
    self.'annotate'(__ARG_1)
.annotate 'line', 7787
# regcont: $S1
    null $S1
.annotate 'line', 7788
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7789
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7790
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7791
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7794
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7796
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7797
    unless_null $P1, __label_4
.annotate 'line', 7798
    getattribute $P2, self, 'varname'
    WSubId_65($P2)
  __label_4: # endif
.annotate 'line', 7800
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7801
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7802
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7803
    __ARG_1.'emitif_null'($S1, $S5)
.annotate 'line', 7804
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7805
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7806
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7807
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7808
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7809
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7810
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7811
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7812

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
.annotate 'line', 7749
    get_class $P1, [ 'Winxed'; 'Compiler'; 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7751
    addattribute $P0, 'deftype'
.annotate 'line', 7752
    addattribute $P0, 'varname'
.annotate 'line', 7753
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
.annotate 'line', 7819
    WSubId_58('(', __ARG_2)
.annotate 'line', 7820
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7821
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7822
    $P4 = $P2.'iskeyword'('in')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 7823
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P5, $P6
    .return($P5)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7825
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7826
    $P4 = $P3.'iskeyword'('in')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7827
    new $P6, [ 'Winxed'; 'Compiler'; 'ForeachStatement' ]
    $P6.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 7828
    __ARG_2.'unget'($P3)
.annotate 'line', 7829
    __ARG_2.'unget'($P2)
.annotate 'line', 7830
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7832
    new $P5, [ 'Winxed'; 'Compiler'; 'ForStatement' ]
    $P5.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 7833

.end # parseFor

.namespace [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_41 = "WSubId_41"
# Body
# {
.annotate 'line', 7845
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7846
    $P2 = WSubId_41(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7847

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7850
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7851
    .return(self)
# }
.annotate 'line', 7852

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7855
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7856
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7857
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7858
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7860
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7863
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7866
    WSubId_1("Invalid throw argument", self)
  __label_2: # switch end
# }
.annotate 'line', 7868

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ThrowStatement' ]
.annotate 'line', 7839
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7841
    addattribute $P0, 'excep'
.end
.namespace [ 'Winxed'; 'Compiler'; 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7880
    setattribute self, 'start', __ARG_1
.annotate 'line', 7881
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7882

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 7885
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7886
    if_null $P1, __label_2
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7887
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7888
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7889
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
.annotate 'line', 7892
    eq $I1, 1, __label_10
.annotate 'line', 7893
    WSubId_1('Wrong modifier args', self)
  __label_10: # endif
.annotate 'line', 7894
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7895
# argreg: $S2
    $P7 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P7, __label_11
    set $S2, $P7
  __label_11:
.annotate 'line', 7896
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7900
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7901
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7902
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7903
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7901
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7906
# predefined join
    join $S3, ', ', $P4
.annotate 'line', 7905
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7909
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    WSubId_1($S4, self)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7912

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
.annotate 'line', 7875
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7877
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
.annotate 'line', 7924
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7925
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7926
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7927
    new $P5, [ 'Winxed'; 'Compiler'; 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7929
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7931
    $P3 = WSubId_98(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7932
    $P1 = __ARG_2.'get'()
.annotate 'line', 7933
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.annotate 'line', 7934
    WSubId_2('catch', $P1)
  __label_3: # endif
.annotate 'line', 7935
    $P1 = __ARG_2.'get'()
.annotate 'line', 7936
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.annotate 'line', 7937
    WSubId_44("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7938
    $P1 = __ARG_2.'get'()
.annotate 'line', 7939
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7940
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7941
    setattribute self, 'exname', $P1
.annotate 'line', 7942
    self.'createvar'($S1, 'P')
.annotate 'line', 7943
    $P1 = __ARG_2.'get'()
.annotate 'line', 7944
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.annotate 'line', 7945
    WSubId_44("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7947
    $P3 = WSubId_98(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7948

.end # TryStatement


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 7951
    .return(0)
# }
.annotate 'line', 7952

.end # allowtailcall


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7955
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7956
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7957
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7958
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7959
    .return(self)
# }
.annotate 'line', 7960

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7963
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7964
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7965
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7966
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7967
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7968
    $P5 = self.'tempreg'('P')
    set $P1, $P5
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7970
    self.'annotate'(__ARG_1)
.annotate 'line', 7971
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7973
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7974
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7976
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7977
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7979
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7980
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7981
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7982
    __ARG_1.'comment'('try: end')
.annotate 'line', 7983
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7985
    self.'annotate'(__ARG_1)
.annotate 'line', 7986
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7988
    __ARG_1.'comment'('catch')
.annotate 'line', 7989
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7990
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7991
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7992
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7993
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7995
    __ARG_1.'comment'('catch end')
.annotate 'line', 7996
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7997

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'TryStatement' ]
.annotate 'line', 7915
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7917
    addattribute $P0, 'stry'
.annotate 'line', 7918
    addattribute $P0, 'modifiers'
.annotate 'line', 7919
    addattribute $P0, 'exname'
.annotate 'line', 7920
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
.annotate 'line', 8010
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8011
    setattribute self, 'name', __ARG_3
.annotate 'line', 8012
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 8013
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 8014

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
.annotate 'line', 8004
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8006
    addattribute $P0, 'name'
.annotate 'line', 8007
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
.annotate 'line', 8029
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8030
    setattribute self, 'name', __ARG_3
.annotate 'line', 8031
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 8032

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
.annotate 'line', 8021
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8023
    addattribute $P0, 'name'
.annotate 'line', 8024
    addattribute $P0, 'basetype'
.annotate 'line', 8025
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
.annotate 'line', 8043
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 8044
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 8045
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 8046
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 8047
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8049
    $P5 = WSubId_41(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8052
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 8053

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8056
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8057
    if_null $P1, __label_1
.annotate 'line', 8058
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8059
    .return(self)
# }
.annotate 'line', 8060

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8063
    self.'annotate'(__ARG_1)
.annotate 'line', 8064
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8065
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8066
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 8067
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8068
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 8070
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 8071
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8073
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 8074
    ne $S4, $S3, __label_8
.annotate 'line', 8075
    $P1.'emit'(__ARG_1, $S2)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8077
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'IndexExpr' ]
    unless $I1 goto __label_10
# {
.annotate 'line', 8079
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 8082
# ireg: $S5
    null $S5
# switch
.annotate 'line', 8083
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_14
    set $S8, ''
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 8085
    WSubId_1('Invalid initialization from void value', self)
  __label_15: # case
.annotate 'line', 8087
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S5, $P2
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 8090
    $P3 = self.'tempreg'($S4)
    set $S5, $P3
.annotate 'line', 8091
    $P1.'emit'(__ARG_1, $S5)
  __label_12: # switch end
.annotate 'line', 8093
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_18
    iseq $I1, $S4, 'P'
  __label_18:
    unless $I1 goto __label_16
# {
.annotate 'line', 8094
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_19
    set $S6, $P2
  __label_19:
.annotate 'line', 8095
    __ARG_1.'emitnull'($S2)
.annotate 'line', 8096
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 8097
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 8098
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_17
  __label_16: # else
.annotate 'line', 8101
    __ARG_1.'emitset'($S2, $S5)
  __label_17: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 8105

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareSingleStatement' ]
.annotate 'line', 8037
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8039
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
.annotate 'line', 8120
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 8121
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 8122
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 8123
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 8124
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 8125
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8127
    __ARG_6.'unget'($P2)
.annotate 'line', 8128
    $P4 = WSubId_41(__ARG_6, self)
    setattribute self, 'size', $P4
.annotate 'line', 8129
    WSubId_58(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 8131
    $P2 = __ARG_6.'get'()
.annotate 'line', 8132
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 8133
    $P2 = __ARG_6.'get'()
.annotate 'line', 8134
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.annotate 'line', 8135
    WSubId_44("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 8136
    $P2 = __ARG_6.'get'()
.annotate 'line', 8137
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 8138
    __ARG_6.'unget'($P2)
.annotate 'line', 8139
    $P4 = WSubId_40(__ARG_6, self, WSubId_41, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 8143
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 8144

.end # DeclareArrayStatement


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 8147
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 8148
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.annotate 'line', 8149
    getattribute $P1, self, 'initarray'
    WSubId_42($P1)
.annotate 'line', 8150
    .return(self)
# }
.annotate 'line', 8151

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8154
    self.'annotate'(__ARG_1)
.annotate 'line', 8156
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 8157
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 8158
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 8159
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 8160
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S5, $S4, 'Array'
    set $S1, $S5
.annotate 'line', 8161
    if_null $P2, __label_1
# {
.annotate 'line', 8163
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 8164
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8168
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 8170
    if_null $P3, __label_4
# {
.annotate 'line', 8171
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 8172
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 8173
    unless_null $P2, __label_6
# {
.annotate 'line', 8174
    unless $I1 goto __label_7
# {
.annotate 'line', 8176
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 8179
# i: $I2
    null $I2
.annotate 'line', 8180
    if_null $P3, __label_9
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 8181
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 8182
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 8183
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 8186

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareArrayStatement' ]
.annotate 'line', 8110
    get_class $P1, [ 'Winxed'; 'Compiler'; 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 8112
    addattribute $P0, 'size'
.annotate 'line', 8113
    addattribute $P0, 'initarray'
.annotate 'line', 8114
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
.annotate 'line', 8193
# var next: $P1
    null $P1
.annotate 'line', 8194
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 8195
# {
.annotate 'line', 8196
# var name: $P3
    $P3 = __ARG_4.'get'()
.annotate 'line', 8197
    WSubId_97($P3)
.annotate 'line', 8198
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8199
# var item: $P5
    null $P5
.annotate 'line', 8200
    $P6 = $P4.'isop'('[')
    if_null $P6, __label_4
    unless $P6 goto __label_4
.annotate 'line', 8201
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 8203
    __ARG_4.'unget'($P4)
.annotate 'line', 8204
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 8206
    $P2 = WSubId_101($P2, $P5)
.annotate 'line', 8207
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 8208
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_2
    if $P6 goto __label_1
  __label_2: # enddo
.annotate 'line', 8209
    WSubId_4(';', $P1)
.annotate 'line', 8210
    .return($P2)
# }
.annotate 'line', 8211

.end # parseDeclareHelper

.namespace [ 'Winxed'; 'Compiler'; 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8219
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 8220

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
.annotate 'line', 8215
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
.annotate 'line', 8227
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 8228

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
.annotate 'line', 8223
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
.annotate 'line', 8234
    new $P2, [ 'Winxed'; 'Compiler'; 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8235

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_104')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8239
    new $P2, [ 'Winxed'; 'Compiler'; 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8240

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
.annotate 'line', 8244
    .tailcall WSubId_102(WSubId_103, WSubId_104, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8245

.end # parseInt

.namespace [ 'Winxed'; 'Compiler'; 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8253
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 8254

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
.annotate 'line', 8249
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
.annotate 'line', 8261
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 8262

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
.annotate 'line', 8257
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
.annotate 'line', 8268
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8269

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8273
    new $P2, [ 'Winxed'; 'Compiler'; 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8274

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
.annotate 'line', 8278
    .tailcall WSubId_102(WSubId_105, WSubId_106, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8279

.end # parseFloat

.namespace [ 'Winxed'; 'Compiler'; 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8287
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 8288

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
.annotate 'line', 8283
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
.annotate 'line', 8295
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 8296

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
.annotate 'line', 8291
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
.annotate 'line', 8302
    new $P2, [ 'Winxed'; 'Compiler'; 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8303

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8307
    new $P2, [ 'Winxed'; 'Compiler'; 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8308

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
.annotate 'line', 8312
    .tailcall WSubId_102(WSubId_107, WSubId_108, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8313

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
.annotate 'line', 8329
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8330
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 8331
    setattribute self, 'name', __ARG_4
.annotate 'line', 8332
    setattribute self, 'value', __ARG_5
.annotate 'line', 8333
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 8334

.end # ConstStatement


.sub 'optimize' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8337
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 8338
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8339
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 8340
    $P1 = $P1.'optimize'()
.annotate 'line', 8341
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.annotate 'line', 8342
    WSubId_1('Value for const is not evaluable at compile time', self)
# }
  __label_2: # endif
.annotate 'line', 8345
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 8346
    .return(self)
# }
.annotate 'line', 8347

.end # optimize


.sub 'checkresult' :method
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8350
    getattribute $P1, self, 'start'
    WSubId_6('Direct use of const', $P1)
# }
.annotate 'line', 8351

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8354
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 8355

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
.annotate 'line', 8319
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 8321
    addattribute $P0, 'type'
.annotate 'line', 8322
    addattribute $P0, 'name'
.annotate 'line', 8323
    addattribute $P0, 'data'
.annotate 'line', 8324
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
.annotate 'line', 8360
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8361
# type: $S1
    $P5 = WSubId_100($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 8362
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8363
    WSubId_1('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 8365
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 8366
# {
.annotate 'line', 8367
    $P1 = __ARG_2.'get'()
.annotate 'line', 8368
# var name: $P3
    set $P3, $P1
.annotate 'line', 8369
    WSubId_58('=', __ARG_2)
.annotate 'line', 8370
# var value: $P4
    $P4 = WSubId_41(__ARG_2, __ARG_3)
.annotate 'line', 8372
    new $P6, [ 'Winxed'; 'Compiler'; 'ConstStatement' ]
    $P6.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P6
.annotate 'line', 8371
    $P2 = WSubId_101($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 8373
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 8374
    .return($P2)
# }
.annotate 'line', 8375

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
.annotate 'line', 8386
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 8387
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8388
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 8389
    $P4 = WSubId_41(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 8390
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.annotate 'line', 8392
    WSubId_4(';', $P1)
# }
.annotate 'line', 8393

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 8396
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 8397
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 8398
    .return(self)
# }
.annotate 'line', 8399

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8402
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8403

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8406
    self.'annotate'(__ARG_1)
.annotate 'line', 8407
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8408
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 8409
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 8410
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8411
    if_null $P1, __label_3
.annotate 'line', 8412
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8413
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 8414
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 8415
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
.annotate 'line', 8417
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 8418
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 8420
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 8425
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 8426
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 8429
    getattribute $P4, self, 'name'
    WSubId_1("Can't use void function as initializer", $P4)
  __label_8: # default
.annotate 'line', 8431
    getattribute $P5, self, 'name'
    WSubId_1("Invalid var initializer", $P5)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 8435
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 8436

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
.annotate 'line', 8381
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 8383
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
.annotate 'line', 8443
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8444
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 8445

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8448
    self.'annotate'(__ARG_1)
.annotate 'line', 8449
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8450
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 8451
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 8452

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
.annotate 'line', 8439
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
.annotate 'line', 8461
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 8462
    $P2 = WSubId_41(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.annotate 'line', 8463
    WSubId_58(']', __ARG_2)
.annotate 'line', 8464
    WSubId_58(';', __ARG_2)
# }
.annotate 'line', 8465

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8468
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 8469
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 8470

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8473
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8474
    self.'annotate'(__ARG_1)
.annotate 'line', 8475
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 8476
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 8477
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 8478

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FixedVarStatement' ]
.annotate 'line', 8455
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 8457
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
.annotate 'line', 8483
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8484
    WSubId_97($P1)
.annotate 'line', 8485
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 8486
    $P3 = $P2.'isop'('[')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8487
    $P2 = __ARG_2.'get'()
.annotate 'line', 8488
    $P3 = $P2.'isop'(']')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 8489
    new $P5, [ 'Winxed'; 'Compiler'; 'ResizableVarStatement' ]
    $P5.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 8491
    __ARG_2.'unget'($P2)
.annotate 'line', 8492
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
.annotate 'line', 8496
    __ARG_2.'unget'($P2)
.annotate 'line', 8497
    new $P4, [ 'Winxed'; 'Compiler'; 'VarStatement' ]
    $P4.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P3, $P4
    .return($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 8499

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
.const 'Sub' WSubId_50 = "WSubId_50"
# Body
# {
.annotate 'line', 8503
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8504
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.annotate 'line', 8505
    WSubId_1("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 8506
    .tailcall WSubId_50(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 8507

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
.annotate 'line', 8520
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 8521
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 8522
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 8523
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 8524
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 8525
    __ARG_2.'unget'($P1)
.annotate 'line', 8526
# var c: $P2
    $P2 = WSubId_98(__ARG_2, self)
.annotate 'line', 8527
    unless_null $P2, __label_3
.annotate 'line', 8528
    WSubId_6('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8529
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8531
    setattribute self, 'end', $P1
# }
.annotate 'line', 8532

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8535
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8536
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8537
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8538
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8539
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8540
    .return($S2)
# }
.annotate 'line', 8541

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8544
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8545
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8546
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8547
    isnull $I1, $S2
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8548
    WSubId_1('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8549
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8550
    $P1[$S1] = $S3
.annotate 'line', 8551
    .return($S3)
# }
.annotate 'line', 8552

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8553
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8556
    __ARG_1.'comment'('{')
.annotate 'line', 8557
    getattribute $P2, self, 'statements'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8558
    $P1.'emit'(__ARG_1)
.annotate 'line', 8559
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8561
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8562

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
.annotate 'line', 8513
    get_class $P1, [ 'Winxed'; 'Compiler'; 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 8515
    addattribute $P0, 'end'
.annotate 'line', 8516
    addattribute $P0, 'labels'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8577
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8579
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8580
    new $P1, ['ResizableStringArray']
.annotate 'line', 8581
    new $P2, ['ResizableStringArray']
.annotate 'line', 8582
    setattribute self, 'tempreg', $P1
.annotate 'line', 8583
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8584

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8587
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8588
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8589
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8590
    assign $P1, $I1
# predefined string
.annotate 'line', 8591
    getattribute $P2, self, 'type'
    set $S2, $P2
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8592

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8595
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8596
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8597
# reg: $S1
    null $S1
.annotate 'line', 8598
# predefined elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 8599
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8601
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8602
# predefined push
    push $P2, $S1
.annotate 'line', 8603
    .return($S1)
# }
.annotate 'line', 8604

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8607
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8608
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8609
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8610
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8611
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8612
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8610
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8614
    assign $P2, 0
# }
.annotate 'line', 8615

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
.annotate 'line', 8571
    addattribute $P0, 'type'
.annotate 'line', 8572
    addattribute $P0, 'nreg'
.annotate 'line', 8573
    addattribute $P0, 'tempreg'
.annotate 'line', 8574
    addattribute $P0, 'freereg'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8626
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8627

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8630
# var named: $P1
    null $P1
.annotate 'line', 8631
# var slurpy: $P2
    null $P2
.annotate 'line', 8632
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8633
    if_null $P3, __label_2
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8634
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8635
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8637
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8640
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8643
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8647
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8654
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8671
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8652
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8655
# setname: $S2
    null $S2
# switch
.annotate 'line', 8656
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8658
    concat $S3, "'", __ARG_3
    concat $S3, $S3, "'"
    set $S2, $S3
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8661
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8662
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.annotate 'line', 8663
    WSubId_1('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8664
    $P9 = $P5.'getPirString'()
    set $S2, $P9
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8667
    WSubId_1('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8669
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8672
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8673
# }
.annotate 'line', 8675

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
.annotate 'line', 8622
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
.annotate 'line', 8686
    setattribute self, 'func', __ARG_1
.annotate 'line', 8687
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8688
# type: $S1
    $P3 = $P1.'checkkeyword'()
    $P2 = WSubId_100($P3)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8689
    eq $S1, '', __label_2
.annotate 'line', 8690
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8692
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8693
    box $P2, $S1
    setattribute self, 'type', $P2
.annotate 'line', 8694
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S4, '__ARG_', $S3
    set $S2, $S4
.annotate 'line', 8695
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8697
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8698
    $P1 = __ARG_2.'get'()
.annotate 'line', 8699
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8700
    new $P5, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    getattribute $P6, __ARG_1, 'owner'
    $P5.'ParameterModifierList'(__ARG_2, $P6)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_5
  __label_4: # else
.annotate 'line', 8702
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8703

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 8706
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8707
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8708
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8709
# ptype: $S2
    $P5 = $P2.'gettype'()
    $P4 = WSubId_109($P5)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8710
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8711
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8712
    if_null $P3, __label_3
.annotate 'line', 8713
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8714
    __ARG_1.'say'('')
# }
.annotate 'line', 8715

.end # emit


.sub 'get_type' :method
# Body
# {
.annotate 'line', 8718
    getattribute $P1, self, 'type'
    .return($P1)
# }
.annotate 'line', 8719

.end # get_type

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
.annotate 'line', 8680
    addattribute $P0, 'func'
.annotate 'line', 8681
    addattribute $P0, 'name'
.annotate 'line', 8682
    addattribute $P0, 'modifiers'
.annotate 'line', 8683
    addattribute $P0, 'type'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseParameter' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8725
    new $P2, [ 'Winxed'; 'Compiler'; 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8726

.end # parseParameter

.namespace [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]

.sub 'FunctionExtern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8737
    self.'initbase'(__ARG_1, __ARG_2)
.annotate 'line', 8738
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 8739

.end # FunctionExtern


.sub 'emit_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8742
# var path: $P1
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getpath'()
.annotate 'line', 8743
# reg: $S1
    $P2 = __ARG_2.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8744
    self.'annotate'(__ARG_1)
.annotate 'line', 8745
    getattribute $P2, self, 'name'
    $P1.'emit_get_global'(__ARG_1, __ARG_2, $S1, $P2)
.annotate 'line', 8746
    .return($S1)
# }
.annotate 'line', 8747

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
.annotate 'line', 8732
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8734
    addattribute $P0, 'name'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8758
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8759

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8762
    $P3 = self.'getlist'()
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8763
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8764
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8765
    le $I1, 0, __label_3
# {
.annotate 'line', 8766
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8767
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8768
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8769
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.annotate 'line', 8770
    WSubId_1('Invalid modifier', $P2)
  __label_7: # endif
.annotate 'line', 8771
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
.annotate 'line', 8772
    sub $I3, $I1, 1
    ge $I2, $I3, __label_8
.annotate 'line', 8773
    __ARG_1.'print'(", ")
  __label_8: # endif
# }
  __label_4: # for iteration
.annotate 'line', 8767
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8775
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8778

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
.annotate 'line', 8754
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8801
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8802
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8803
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8804
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8805
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8806
    new $P3, [ 'Winxed'; 'Compiler'; 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8807

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8809
    .return(self)
# }

.end # getouter


.sub 'allowtailcall' :method
# Body
# {
.annotate 'line', 8812
    .return(1)
# }
.annotate 'line', 8813

.end # allowtailcall


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8817
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8818
    unless_null $P1, __label_1
.annotate 'line', 8819
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8820
    .return($P1)
# }
.annotate 'line', 8821

.end # makesubid


.sub 'usesubid' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8824
# var used: $P1
    getattribute $P1, self, 'usedsubids'
.annotate 'line', 8825
    unless_null $P1, __label_1
.annotate 'line', 8826
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedsubids', $P1
  __label_1: # endif
.annotate 'line', 8827
    $P1[__ARG_1] = 1
# }
.annotate 'line', 8828

.end # usesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8832
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8833
    .return($I1)
# }
.annotate 'line', 8834

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_110 = "WSubId_110"
# Body
# {
.annotate 'line', 8837
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8838
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8839
    __ARG_1.'unget'($P1)
.annotate 'line', 8840
    $P3 = WSubId_40(__ARG_1, self, WSubId_110, ')')
    setattribute self, 'params', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 8842

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8846
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8847
    unless_null $P1, __label_1
.annotate 'line', 8848
    root_new $P3, ['parrot';'ResizablePMCArray']
    assign $P3, 1
    $P3[0] = __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8850
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8851

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8854
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8855
    unless_null $P1, __label_1
# {
.annotate 'line', 8857
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8860
    if_null $P1, __label_4
    iter $P5, $P1
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
.annotate 'line', 8861
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8862
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8863
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8865

.end # usenamespace


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 8868
# var found: $P1
    null $P1
.annotate 'line', 8869
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
# {
.annotate 'line', 8870
    $P1 = $P2.'scopesearch'(__ARG_1, __ARG_2)
.annotate 'line', 8871
    if_null $P1, __label_3
.annotate 'line', 8872
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8874
    getattribute $P3, self, 'owner'
    .tailcall $P3.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8875

.end # scopesearch


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8879
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 8880
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8881
    getattribute $P5, self, 'body'
    $P4 = $P5.'optimize'()
    setattribute self, 'body', $P4
.annotate 'line', 8882
    .return(self)
# }
.annotate 'line', 8883

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8887
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8888
    unless_null $P1, __label_1
.annotate 'line', 8889
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8890
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8891

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8894
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8895
    unless_null $P1, __label_1
.annotate 'line', 8896
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8897
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8898

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8903
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8904
# lexname: $S1
    null $S1
.annotate 'line', 8905
    if_null $P1, __label_1
.annotate 'line', 8906
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8908
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8909
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8910
# predefined string
    set $S3, $I1
    concat $S4, '__WLEX_', $S3
    set $S1, $S4
.annotate 'line', 8911
    self.'setlex'($S1, $S2)
.annotate 'line', 8912
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8914
    .return($S1)
# }
.annotate 'line', 8915

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8919
# var store: $P1
    null $P1
# switch
.annotate 'line', 8920
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
.annotate 'line', 8922
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8924
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8926
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8928
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8930
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8932
# reg: $S1
    $P2 = $P1.'createreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8933
    .return($S1)
# }
.annotate 'line', 8934

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 8937
# var store: $P1
    null $P1
# switch
.annotate 'line', 8938
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
.annotate 'line', 8940
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8942
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8944
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8946
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 8948
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    WSubId_6($S4)
  __label_1: # switch end
.annotate 'line', 8950
# reg: $S1
    $P2 = $P1.'tempreg'()
    null $S1
    if_null $P2, __label_7
    set $S1, $P2
  __label_7:
.annotate 'line', 8951
    .return($S1)
# }
.annotate 'line', 8952

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8955
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
.annotate 'line', 8956
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8957

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8960
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8961
    set $S1, $I1
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8962

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8965
    WSubId_1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8966

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 8969
    WSubId_1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8970

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
.annotate 'line', 8976
# name: $S1
    getattribute $P8, self, 'name'
    null $S1
    if_null $P8, __label_1
    set $S1, $P8
  __label_1:
.annotate 'line', 8977
    __ARG_1.'say'()
.annotate 'line', 8978
    __ARG_1.'print'(".sub ")
.annotate 'line', 8979
    $P8 = self.'isanonymous'()
    if_null $P8, __label_2
    unless $P8 goto __label_2
.annotate 'line', 8980
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8982
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8983
    getattribute $P8, self, 'subid'
    if_null $P8, __label_4
.annotate 'line', 8984
    getattribute $P9, self, 'subid'
    __ARG_1.'print'(" :subid('", $P9, "')")
  __label_4: # endif
.annotate 'line', 8985
    getattribute $P8, self, 'outer'
    if_null $P8, __label_5
# {
.annotate 'line', 8986
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8987
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8988
    if_null $P2, __label_6
.annotate 'line', 8989
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8993
    $P8 = self.'ismethod'()
    if_null $P8, __label_7
    unless $P8 goto __label_7
.annotate 'line', 8994
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8995
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8996
    if_null $P3, __label_8
.annotate 'line', 8997
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8999
    ne $S1, 'main', __label_10
.annotate 'line', 9000
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 9002
    self.'emit_extra_modifiers'(__ARG_1)
.annotate 'line', 9003
    __ARG_1.'say'()
.annotate 'line', 9006
    getattribute $P8, self, 'params'
    WSubId_56(__ARG_1, $P8)
.annotate 'line', 9008
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 9009
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 9010
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 9011
    getattribute $P8, self, 'start'
    __ARG_1.'annotate'($P8)
.annotate 'line', 9013
    if_null $P4, __label_14
    iter $P10, $P4
    set $P10, 0
  __label_13: # for iteration
    unless $P10 goto __label_14
    shift $S2, $P10
.annotate 'line', 9014
    $P8 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P8, "', ", $S2)
    goto __label_13
  __label_14: # endfor
.annotate 'line', 9016
    if_null $P5, __label_16
    iter $P11, $P5
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $S3, $P11
# {
.annotate 'line', 9017
# predefined substr
    substr $S5, $S3, 0, 1
    eq $S5, '$', __label_17
.annotate 'line', 9018
    concat $S6, "    .local pmc ", $S3
    __ARG_1.'say'($S6)
  __label_17: # endif
.annotate 'line', 9019
    $P8 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P8)
# }
    goto __label_15
  __label_16: # endfor
# }
  __label_11: # endif
.annotate 'line', 9023
    getattribute $P8, self, 'usedsubids'
    if_null $P8, __label_19
    iter $P12, $P8
    set $P12, 0
  __label_18: # for iteration
    unless $P12 goto __label_19
    shift $S4, $P12
# {
.annotate 'line', 9025
    __ARG_1.'say'(".const 'Sub' ", $S4, ' = "', $S4, '"')
# }
    goto __label_18
  __label_19: # endfor
.annotate 'line', 9028
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 9029
    $P8 = $P6.'isempty'()
    if_null $P8, __label_20
    unless $P8 goto __label_20
.annotate 'line', 9030
    __ARG_1.'comment'('Empty body')
    goto __label_21
  __label_20: # else
# {
.annotate 'line', 9032
    __ARG_1.'comment'('Body')
.annotate 'line', 9033
    $P6.'emit'(__ARG_1)
.annotate 'line', 9034
    $P8 = $P6.'getend'()
    __ARG_1.'annotate'($P8)
# }
  __label_21: # endif
.annotate 'line', 9036
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 9039
    getattribute $P8, self, 'localfun'
    if_null $P8, __label_23
    iter $P13, $P8
    set $P13, 0
  __label_22: # for iteration
    unless $P13 goto __label_23
    shift $P7, $P13
.annotate 'line', 9040
    $P7.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
.annotate 'line', 9041

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
.annotate 'line', 8781
    get_class $P1, [ 'Winxed'; 'Compiler'; 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8783
    addattribute $P0, 'name'
.annotate 'line', 8784
    addattribute $P0, 'subid'
.annotate 'line', 8785
    addattribute $P0, 'modifiers'
.annotate 'line', 8786
    addattribute $P0, 'params'
.annotate 'line', 8787
    addattribute $P0, 'body'
.annotate 'line', 8788
    addattribute $P0, 'regstI'
.annotate 'line', 8789
    addattribute $P0, 'regstN'
.annotate 'line', 8790
    addattribute $P0, 'regstS'
.annotate 'line', 8791
    addattribute $P0, 'regstP'
.annotate 'line', 8792
    addattribute $P0, 'nlabel'
.annotate 'line', 8793
    addattribute $P0, 'localfun'
.annotate 'line', 8794
    addattribute $P0, 'lexicals'
.annotate 'line', 8795
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8796
    addattribute $P0, 'usedsubids'
.annotate 'line', 8797
    addattribute $P0, 'outer'
.end
.namespace [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9057
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9058
    box $P4, 0
    setattribute self, 'paramnum', $P4
.annotate 'line', 9059
    box $P4, 0
    setattribute self, 'lexnum', $P4
.annotate 'line', 9060
    self.'parse'(__ARG_2)
.annotate 'line', 9061
    root_new $P5, ['parrot';'ResizablePMCArray']
    setattribute self, 'multi_sig', $P5
.annotate 'line', 9062
# var params: $P1
    getattribute $P1, self, 'params'
.annotate 'line', 9063
    new $P5, [ 'Boolean' ]
    setattribute self, 'is_multi', $P5
.annotate 'line', 9064
    if_null $P1, __label_1
# {
.annotate 'line', 9065
# var multi_sig: $P2
    getattribute $P2, self, 'multi_sig'
.annotate 'line', 9066
# start_idx: $I1
    null $I1
.annotate 'line', 9067
    $P4 = self.'ismethod'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9068
    set $I1, 1
.annotate 'line', 9069
    $P2[0] = 'P'
# }
  __label_2: # endif
# for loop
.annotate 'line', 9071
# i: $I2
    null $I2
  __label_5: # for condition
# predefined elements
    elements $I3, $P1
    ge $I2, $I3, __label_4
# {
.annotate 'line', 9072
# var param: $P3
    $P3 = $P1[$I2]
.annotate 'line', 9073
    add $I3, $I2, $I1
    $P4 = $P3.'get_type'()
    $P2[$I3] = $P4
# }
  __label_3: # for iteration
.annotate 'line', 9071
    set $I3, $I2
    inc $I2
    goto __label_5
  __label_4: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 9076

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9078
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 9082
    getattribute $P1, self, 'paramnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9083

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 9087
    getattribute $P1, self, 'lexnum'
    inc $P1
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 9088

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9089
    .return(0)
# }

.end # ismethod


.sub 'ismulti' :method
# Body
# {
.annotate 'line', 9092
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
.annotate 'line', 9093

.end # ismulti


.sub 'setmulti' :method
# Body
# {
.annotate 'line', 9096
    getattribute $P1, self, 'is_multi'
    assign $P1, 1
# }
.annotate 'line', 9097

.end # setmulti


.sub 'parse' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_4 = "WSubId_4"
.const 'Sub' WSubId_111 = "WSubId_111"
.const 'Sub' WSubId_2 = "WSubId_2"
# Body
# {
.annotate 'line', 9101
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9102
    setattribute self, 'name', $P1
.annotate 'line', 9103
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9104
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 9105
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionModifierList' ]
    getattribute $P8, self, 'owner'
    $P7.'FunctionModifierList'(__ARG_1, $P8)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
.annotate 'line', 9106
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.annotate 'line', 9108
    WSubId_4('(', $P2)
.annotate 'line', 9109
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 9111
# var path: $P3
    getattribute $P5, self, 'owner'
    $P4 = $P5.'getpath'()
    $P6 = $P1.'getidentifier'()
    $P3 = $P4.'createchild'($P6)
.annotate 'line', 9112
    $P4 = $P3.'fullname'()
    WSubId_111(self, '__FUNCTION__', $P4)
.annotate 'line', 9114
    $P2 = __ARG_1.'get'()
.annotate 'line', 9115
    $P4 = $P2.'isop'('{')
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9116
    WSubId_2('{', $P2)
  __label_2: # endif
.annotate 'line', 9117
    new $P6, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_1, self)
    set $P5, $P6
    setattribute self, 'body', $P5
.annotate 'line', 9118
    .return(self)
# }
.annotate 'line', 9119

.end # parse


.sub 'emit_extra_modifiers' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_109 = "WSubId_109"
# Body
# {
.annotate 'line', 9123
    getattribute $P2, self, 'is_multi'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 9124
# var multi_sig: $P1
    getattribute $P1, self, 'multi_sig'
.annotate 'line', 9125
    __ARG_1.'print'(' :multi(')
.annotate 'line', 9126
# sep: $S1
    set $S1, ''
.annotate 'line', 9127
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $S2, $P3
# {
.annotate 'line', 9128
    $P2 = WSubId_109($S2)
    __ARG_1.'print'($S1, $P2)
.annotate 'line', 9129
    set $S1, ', '
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9131
    __ARG_1.'print'(')')
# }
  __label_1: # endif
# }
.annotate 'line', 9133

.end # emit_extra_modifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
.annotate 'line', 9048
    get_class $P1, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 9050
    addattribute $P0, 'paramnum'
.annotate 'line', 9051
    addattribute $P0, 'lexnum'
.annotate 'line', 9052
    addattribute $P0, 'multi_sig'
.annotate 'line', 9053
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
.annotate 'line', 9144
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 9145
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 9146
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 9147
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 9148
    setattribute self, 'name', $P1
.annotate 'line', 9149
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 9150
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9151
    WSubId_4('{', $P2)
.annotate 'line', 9152
    new $P5, [ 'Winxed'; 'Compiler'; 'CompoundStatement' ]
    $P5.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'body', $P4
.annotate 'line', 9153
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 9154

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 9155
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9156
    .return(0)
# }

.end # ismethod


.sub 'needclosure' :method
# Body
# {
.annotate 'line', 9159
    getattribute $P2, self, 'lexicals'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'usedlexicals'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9160
    .return(1)
  __label_1: # endif
.annotate 'line', 9161
    getattribute $P2, self, 'localfun'
    if_null $P2, __label_4
    iter $P4, $P2
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P1, $P4
.annotate 'line', 9162
    $P3 = $P1.'needclosure'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
.annotate 'line', 9163
    .return(1)
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9164
    .return(0)
# }
.annotate 'line', 9165

.end # needclosure


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 9168
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 9169

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 9173
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 9174

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 9178
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 9179

.end # getlexnum


.sub 'checkvarlexical' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9182
    $P5 = __ARG_2.'isconst'()
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 9183
    .return(__ARG_2)
  __label_1: # endif
.annotate 'line', 9184
# reg: $S1
    $P5 = __ARG_2.'getreg'()
    null $S1
    if_null $P5, __label_2
    set $S1, $P5
  __label_2:
.annotate 'line', 9186
# predefined substr
    substr $S4, $S1, 0, 6
    ne $S4, 'WSubId', __label_3
.annotate 'line', 9187
    .return(__ARG_2)
  __label_3: # endif
.annotate 'line', 9188
# var scope: $P1
    $P1 = __ARG_2.'getscope'()
.annotate 'line', 9189
# var ownerscope: $P2
    $P2 = $P1.'getouter'()
.annotate 'line', 9190
# var outer: $P3
    getattribute $P3, self, 'outer'
.annotate 'line', 9191
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'FunctionBase' ]
    unless $I2 goto __label_4
# {
.annotate 'line', 9192
    $P5 = $P2.'same_scope_as'($P3)
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 9193
# lexname: $S2
    $P6 = $P1.'makelexical'(__ARG_2)
    null $S2
    if_null $P6, __label_6
    set $S2, $P6
  __label_6:
.annotate 'line', 9194
# flags: $I1
    $I2 = __ARG_2.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 9195
# type: $S3
    $P5 = __ARG_2.'gettype'()
    null $S3
    if_null $P5, __label_7
    set $S3, $P5
  __label_7:
.annotate 'line', 9196
    eq $S3, 'P', __label_8
.annotate 'line', 9197
    bor $I1, $I1, 1
  __label_8: # endif
.annotate 'line', 9198
# var lexused: $P4
    $P5 = __ARG_2.'gettype'()
    $P4 = self.'createvar'(__ARG_1, $P5, $I1)
.annotate 'line', 9199
    box $P5, $S2
    setattribute $P4, 'lexname', $P5
.annotate 'line', 9200
    $P5 = $P4.'getreg'()
    self.'setusedlex'($S2, $P5)
.annotate 'line', 9201
    .return($P4)
# }
  __label_5: # endif
# }
  __label_4: # endif
.annotate 'line', 9204
    .return(__ARG_2)
# }
.annotate 'line', 9205

.end # checkvarlexical


.sub 'getvar' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_6 = "WSubId_6"
# Body
# {
.annotate 'line', 9208
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 9209
    unless_null $P1, __label_1
.annotate 'line', 9210
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9211
    unless_null $P1, __label_2
# {
.annotate 'line', 9214
    getattribute $P3, self, 'owner'
    $P1 = $P3.'getvar'(__ARG_1)
.annotate 'line', 9215
    unless_null $P1, __label_3
# {
.annotate 'line', 9217
    set $S3, __ARG_1
    ne $S3, 'self', __label_5
# {
.annotate 'line', 9218
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 9219
    getattribute $P4, self, 'outer'
    $P3 = $P4.'ismethod'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
# {
.annotate 'line', 9220
# lexself: $S1
    $P5 = $P2.'makelexicalself'()
    null $S1
    if_null $P5, __label_7
    set $S1, $P5
  __label_7:
.annotate 'line', 9221
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 9222
# reg: $S2
    $P3 = $P1.'getreg'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 9223
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 9227
    $P1 = self.'checkvarlexical'(__ARG_1, $P1)
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 9229
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_10
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
  __label_10:
    unless $I1 goto __label_9
.annotate 'line', 9230
    WSubId_6('Incorrect data for variable in LocalFunction')
  __label_9: # endif
.annotate 'line', 9231
    .return($P1)
# }
.annotate 'line', 9232

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'LocalFunctionStatement' ]
.annotate 'line', 9140
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
.annotate 'line', 9243
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9244

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 9245
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
.annotate 'line', 9239
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
.annotate 'line', 9259
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9260
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.annotate 'line', 9261
    WSubId_3($P1)
  __label_1: # endif
.annotate 'line', 9262
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9263
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9264
# type: $S1
    $P6 = $P1.'checkkeyword'()
    $P5 = WSubId_100($P6)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9265
    set $P1, $P2
.annotate 'line', 9266
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 9267
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 9269
    setattribute self, 'name', $P1
.annotate 'line', 9270
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 9271
    $P5 = $P3.'getreg'()
    setattribute self, 'reg', $P5
.annotate 'line', 9272
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 9273
    new $P7, [ 'Winxed'; 'Compiler'; 'ParameterModifierList' ]
    $P7.'ParameterModifierList'(__ARG_1, self)
    set $P6, $P7
    setattribute self, 'modifiers', $P6
    goto __label_5
  __label_4: # else
.annotate 'line', 9275
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 9276

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9279
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 9280
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 9281
    if_null $P1, __label_1
# {
.annotate 'line', 9282
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 9283
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 9285

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
.annotate 'line', 9254
    addattribute $P0, 'name'
.annotate 'line', 9255
    addattribute $P0, 'modifiers'
.annotate 'line', 9256
    addattribute $P0, 'reg'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseSigParameter' :subid('WSubId_112')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9290
    new $P2, [ 'Winxed'; 'Compiler'; 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 9291

.end # parseSigParameter

.namespace [ 'Winxed'; 'Compiler'; 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_40 = "WSubId_40"
.const 'Sub' WSubId_112 = "WSubId_112"
# Body
# {
.annotate 'line', 9298
    $P2 = WSubId_40(__ARG_1, __ARG_2, WSubId_112, ')')
    setattribute self, 'params', $P2
# }
.annotate 'line', 9299

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9302
    __ARG_1.'print'('(')
.annotate 'line', 9303
# sep: $S1
    set $S1, ''
.annotate 'line', 9304
    getattribute $P2, self, 'params'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 9305
    __ARG_1.'print'($S1)
.annotate 'line', 9306
    $P1.'emit'(__ARG_1)
.annotate 'line', 9307
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9309
    __ARG_1.'print'(')')
# }
.annotate 'line', 9310

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'SigParameterList' ]
.annotate 'line', 9295
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
.annotate 'line', 9319
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 9320
    setattribute self, 'params', __ARG_3
.annotate 'line', 9321
    setattribute self, 'expr', __ARG_4
# }
.annotate 'line', 9322

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9325
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 9326
    .return(self)
# }
.annotate 'line', 9327

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9330
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 9331
    isa $I2, $P1, [ 'Winxed'; 'Compiler'; 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9332
    WSubId_1('multi assignment used with non function call', $P1)
  __label_1: # endif
.annotate 'line', 9333
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 9334
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 9335
    __ARG_1.'print'('    ')
.annotate 'line', 9336
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 9337
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 9338
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 9339
    __ARG_1.'say'()
# }
.annotate 'line', 9340

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'MultiAssignStatement' ]
.annotate 'line', 9313
    get_class $P1, [ 'Winxed'; 'Compiler'; 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 9315
    addattribute $P0, 'params'
.annotate 'line', 9316
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
.annotate 'line', 9357
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 9358

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9359
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9363
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 9364

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
.annotate 'line', 9353
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9372
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 9373
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 9374

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9375
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9379
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 9380
    __ARG_1.'print'($S1)
# }
.annotate 'line', 9381

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
.annotate 'line', 9367
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9369
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
.annotate 'line', 9390
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9391
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9392
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 9393
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.annotate 'line', 9394
    WSubId_44('literal string', $P2)
  __label_1: # endif
.annotate 'line', 9395
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 9396
    $P2 = __ARG_1.'get'()
.annotate 'line', 9397
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 9398
    $P4 = $P2.'checkop'()
    set $S1, $P4
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 9400
    box $P5, 1
    setattribute self, 'hll', $P5
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 9404
    WSubId_45('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 9406
# {
.annotate 'line', 9407
    $P2 = __ARG_1.'get'()
.annotate 'line', 9408
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.annotate 'line', 9409
    WSubId_44('literal string', $P2)
  __label_10: # endif
.annotate 'line', 9410
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 9411
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.annotate 'line', 9412
    WSubId_4(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 9414
    setattribute self, 'key', $P1
# }
.annotate 'line', 9415

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9416
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 9419
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 9420

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9424
    getattribute $P2, self, 'key'
    $P1 = WSubId_22($P2)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 9425

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
.annotate 'line', 9384
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9386
    addattribute $P0, 'key'
.annotate 'line', 9387
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9433
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 9434
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    assign $P1, 1
# predefined string
    set $S1, __ARG_3
    $P1[0] = $S1
.annotate 'line', 9435
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 9436
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 9437
    $P2 = __ARG_1.'get'()
.annotate 'line', 9438
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 9440
    __ARG_1.'unget'($P2)
.annotate 'line', 9441
    setattribute self, 'key', $P1
# }
.annotate 'line', 9442

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 9443
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 9447
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 9448
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 9449

.end # last


.sub 'checknskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9452
# var nskey: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_1.'scopesearch'($P2, 2)
.annotate 'line', 9453
    if_null $P1, __label_2
    $P2 = $P1.'getpath'()
    goto __label_1
  __label_2:
    null $P2
  __label_1:
    .return($P2)
# }
.annotate 'line', 9454

.end # checknskey


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9458
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'scopesearch'($P2, 2)
.annotate 'line', 9459
    unless_null $P1, __label_1
# {
.annotate 'line', 9460
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9461
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_72($S2)
  __label_3: # endif
.annotate 'line', 9462
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9464
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 9465

.end # emit


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
.const 'Sub' WSubId_72 = "WSubId_72"
.const 'Sub' WSubId_22 = "WSubId_22"
# Body
# {
.annotate 'line', 9468
# var nskey: $P1
    $P1 = self.'checknskey'(__ARG_2)
.annotate 'line', 9469
    unless_null $P1, __label_1
# {
.annotate 'line', 9470
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9471
    getattribute $P3, self, 'key'
# predefined join
    join $S1, ".", $P3
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    WSubId_72($S2)
  __label_3: # endif
.annotate 'line', 9472
    getattribute $P3, self, 'key'
    $P2 = WSubId_22($P3)
    __ARG_1.'say'("new ", __ARG_3, ", ", $P2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9475
    $P1.'emit_new'(__ARG_1, __ARG_2, __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 9477

.end # emit_new

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
.annotate 'line', 9428
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 9430
    addattribute $P0, 'key'
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'parseClassSpecifier' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9482
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 9483
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 9484
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 9485
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 9486
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 9487
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 9488
    new $P4, [ 'Winxed'; 'Compiler'; 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.annotate 'line', 9489
    WSubId_1('Invalid class', $P1)
# }
.annotate 'line', 9490

.end # parseClassSpecifier

.namespace [ 'Winxed'; 'Compiler'; 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9502
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 9503
    setattribute self, 'name', __ARG_2
.annotate 'line', 9504
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
    $P1 = $P2.'createchild'(__ARG_2)
.annotate 'line', 9505
    setattribute self, 'classns', $P1
# }
.annotate 'line', 9506

.end # ClassBase


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9509
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 9510

.end # getpath


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 9513
    getattribute $P1, self, 'classns'
    .tailcall $P1.'getparrotkey'()
# }
.annotate 'line', 9514

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
.annotate 'line', 9496
    get_class $P1, [ 'Winxed'; 'Compiler'; 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 9498
    addattribute $P0, 'name'
.annotate 'line', 9499
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
.annotate 'line', 9527
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9528
    setattribute self, 'parent', __ARG_3
.annotate 'line', 9529
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 9530
    setattribute self, 'functions', $P1
.annotate 'line', 9531
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 9532
    setattribute self, 'members', $P2
.annotate 'line', 9533
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9534
    setattribute self, 'constants', $P3
.annotate 'line', 9535
# var seen_functions: $P4
    root_new $P4, ['parrot';'Hash']
.annotate 'line', 9537
# var t: $P5
    $P5 = __ARG_4.'get'()
.annotate 'line', 9538
    $P10 = $P5.'isop'(':')
    if_null $P10, __label_1
    unless $P10 goto __label_1
# {
.annotate 'line', 9539
    $P12 = WSubId_40(__ARG_4, self, WSubId_66)
    setattribute self, 'bases', $P12
.annotate 'line', 9540
    $P5 = __ARG_4.'get'()
# }
  __label_1: # endif
.annotate 'line', 9542
    WSubId_4('{', $P5)
.annotate 'line', 9544
    getattribute $P11, self, 'classns'
    $P10 = $P11.'fullname'()
    WSubId_111(self, '__CLASS__', $P10)
# for loop
.annotate 'line', 9546
    $P5 = __ARG_4.'get'()
  __label_4: # for condition
    $P10 = $P5.'isop'('}')
    isfalse $I1, $P10
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 9547
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
.annotate 'line', 9549
# var f: $P6
    new $P6, [ 'Winxed'; 'Compiler'; 'MethodStatement' ]
    $P6.'MethodStatement'($P5, __ARG_4, self)
.annotate 'line', 9550
# predefined push
    push $P1, $P6
.annotate 'line', 9551
# var first_func: $P7
    getattribute $P12, $P6, 'name'
    $P7 = $P4[$P12]
.annotate 'line', 9552
    unless_null $P7, __label_10
.annotate 'line', 9553
    getattribute $P13, $P6, 'name'
    $P4[$P13] = $P6
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 9555
    $P7.'setmulti'()
.annotate 'line', 9556
    $P6.'setmulti'()
# }
  __label_11: # endif
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9560
# var name: $P8
    $P8 = __ARG_4.'get'()
.annotate 'line', 9561
    $P10 = $P8.'isidentifier'()
    isfalse $I1, $P10
    unless $I1 goto __label_12
.annotate 'line', 9562
    WSubId_44("member identifier", $P8)
  __label_12: # endif
.annotate 'line', 9563
# predefined push
    push $P2, $P8
.annotate 'line', 9564
    $P5 = __ARG_4.'get'()
.annotate 'line', 9565
    $P11 = $P5.'isop'(';')
    isfalse $I2, $P11
    unless $I2 goto __label_13
.annotate 'line', 9566
    WSubId_44("';' in member declaration", $P5)
  __label_13: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9569
# var cst: $P9
    $P9 = WSubId_48($P5, __ARG_4, self)
.annotate 'line', 9570
# predefined push
    push $P3, $P9
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9573
    WSubId_45("item in class", $P5)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 9546
    $P5 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 9576

.end # ClassStatement


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9579
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9580

.end # generatesubid


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9583
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 9584

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9587
    getattribute $P1, self, 'parent'
    .tailcall $P1.'scopesearch'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9588

.end # scopesearch


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9591
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9592

.end # use_predef


.sub 'optimize' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 9595
    getattribute $P1, self, 'constants'
    WSubId_42($P1)
.annotate 'line', 9596
    getattribute $P1, self, 'functions'
    WSubId_42($P1)
.annotate 'line', 9597
    .return(self)
# }
.annotate 'line', 9598

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 9601
    getattribute $P3, self, 'classns'
    $P3.'emitnamespace'(__ARG_1)
.annotate 'line', 9602
    getattribute $P3, self, 'functions'
    WSubId_56(__ARG_1, $P3)
.annotate 'line', 9604
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 9606
    $P3 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P3)
.annotate 'line', 9607
# n: $I1
    set $I1, 1
.annotate 'line', 9608
    getattribute $P3, self, 'bases'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 9609
    $P1.'annotate'(__ARG_1)
.annotate 'line', 9610
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 9611
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 9612
    getattribute $P3, self, 'parent'
    $P1.'emit'(__ARG_1, $P3)
.annotate 'line', 9613
    __ARG_1.'say'()
.annotate 'line', 9614
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9616
    getattribute $P3, self, 'members'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 9617
    __ARG_1.'annotate'($P2)
.annotate 'line', 9618
    __ARG_1.'say'('    ', "addattribute $P0, '", $P2, "'")
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9621
    __ARG_1.'say'('.end')
# }
.annotate 'line', 9622

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
.annotate 'line', 9517
    get_class $P1, [ 'Winxed'; 'Compiler'; 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 9519
    addattribute $P0, 'parent'
.annotate 'line', 9520
    addattribute $P0, 'bases'
.annotate 'line', 9521
    addattribute $P0, 'constants'
.annotate 'line', 9522
    addattribute $P0, 'functions'
.annotate 'line', 9523
    addattribute $P0, 'members'
.end
.namespace [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9629
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 9630

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9633
    .return(self)
# }
.annotate 'line', 9634

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
.annotate 'line', 9625
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
.annotate 'line', 9642
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9643
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9644
# var nskey: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 9645
# var ns: $P4
    null $P4
# for loop
  __label_3: # for condition
.annotate 'line', 9647
    $P5 = $P2.'isop'('.')
    if_null $P5, __label_2
    unless $P5 goto __label_2
# {
.annotate 'line', 9648
    $P3.'push'($P1)
.annotate 'line', 9649
    $P1 = __ARG_2.'get'()
# }
  __label_1: # for iteration
.annotate 'line', 9647
    $P2 = __ARG_2.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9652
    $P5 = $P2.'isop'(';')
    if_null $P5, __label_4
    unless $P5 goto __label_4
# {
.annotate 'line', 9653
    if_null $P3, __label_7
    iter $P6, $P3
    set $P6, 0
  __label_6: # for iteration
    unless $P6 goto __label_7
    shift $P4, $P6
.annotate 'line', 9654
# predefined string
    set $S1, $P4
    __ARG_3 = __ARG_3.'declarenamespace'($P4, $S1)
    goto __label_6
  __label_7: # endfor
.annotate 'line', 9655
    new $P7, [ 'Winxed'; 'Compiler'; 'DeclareClassStatement' ]
    $P7.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P5, $P7
    __ARG_3.'declareclass'($P5)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 9658
    __ARG_2.'unget'($P2)
.annotate 'line', 9659
    if_null $P3, __label_9
    iter $P8, $P3
    set $P8, 0
  __label_8: # for iteration
    unless $P8 goto __label_9
    shift $P4, $P8
.annotate 'line', 9660
    null $P5
    __ARG_3 = __ARG_3.'childnamespace'(__ARG_1, $P4, $P5)
    goto __label_8
  __label_9: # endfor
.annotate 'line', 9661
    new $P7, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
    $P7.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P5, $P7
    __ARG_3.'addclass'($P5)
# }
  __label_5: # endif
# }
.annotate 'line', 9663

.end # parseClass


.sub 'open_include' :subid('WSubId_113')
        .param string __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 9671
# var interp: $P1
# predefined getinterp
    getinterp $P1
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9676
# var libpaths: $P2
    $P2 = $P1[9]
.annotate 'line', 9677
# var paths: $P3
    $P3 = $P2[0]
.annotate 'line', 9678
# var file: $P4
    null $P4
.annotate 'line', 9679
    if_null $P3, __label_2
    iter $P5, $P3
    set $P5, 0
  __label_1: # for iteration
    unless $P5 goto __label_2
    shift $S1, $P5
# {
.annotate 'line', 9680
# filepath: $S2
    concat $S3, $S1, __ARG_1
    set $S2, $S3
.annotate 'line', 9681
# try: create handler
    new $P6, 'ExceptionHandler'
    set_label $P6, __label_3
    push_eh $P6
# try: begin
# {
.annotate 'line', 9682
# predefined open
    root_new $P4, ['parrot';'FileHandle']
    $P4.'open'($S2,'r')
.annotate 'line', 9683
    isnull $I1, $P4
    not $I1
    unless $I1 goto __label_6
    $P6 = $P4.'is_closed'()
    isfalse $I1, $P6
  __label_6:
    unless $I1 goto __label_5
    goto __label_2 # break
  __label_5: # endif
.annotate 'line', 9684
# }
# try: end
    pop_eh
    goto __label_4
.annotate 'line', 9681
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
.annotate 'line', 9689
    isnull $I1, $P4
    if $I1 goto __label_8
    $I1 = $P4.'is_closed'()
  __label_8:
    unless $I1 goto __label_7
.annotate 'line', 9690
    WSubId_1('File not found', __ARG_2)
  __label_7: # endif
.annotate 'line', 9691
    $P4.'encoding'("utf8")
.annotate 'line', 9692
    .return($P4)
# }
.annotate 'line', 9693

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
.annotate 'line', 9697
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9698
    $P4 = $P1.'isstring'()
    isfalse $I4, $P4
    unless $I4 goto __label_1
.annotate 'line', 9699
    WSubId_44('literal string', $P1)
  __label_1: # endif
.annotate 'line', 9700
    WSubId_58(';', __ARG_2)
.annotate 'line', 9702
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_2
    set $S1, $P4
  __label_2:
.annotate 'line', 9703
# var file: $P2
    $P2 = WSubId_113($S1, __ARG_1)
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9708
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
.annotate 'line', 9709
# predefined substr
    substr $S6, $S2, 0, 12
    ne $S6, '.macro_const', __label_7
# {
.annotate 'line', 9710
# pos: $I1
    set $I1, 12
.annotate 'line', 9711
# c: $S3
    null $S3
  __label_9: # while
.annotate 'line', 9712
# predefined substr
    substr $S3, $S2, $I1, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_10
    iseq $I4, $S3, "\t"
  __label_10:
    unless $I4 goto __label_8
.annotate 'line', 9713
    inc $I1
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 9714
# pos2: $I2
    set $I2, $I1
  __label_12: # while
.annotate 'line', 9715
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_16
    isne $I4, $S3, "\t"
  __label_16:
    unless $I4 goto __label_15
.annotate 'line', 9716
    isne $I4, $S3, "\n"
  __label_15:
    unless $I4 goto __label_14
    isne $I4, $S3, "\r"
  __label_14:
    unless $I4 goto __label_13
    isne $I4, $S3, ""
  __label_13:
    unless $I4 goto __label_11
.annotate 'line', 9717
    inc $I2
    goto __label_12
  __label_11: # endwhile
.annotate 'line', 9718
    ne $I2, $I1, __label_17
    goto __label_3 # continue
  __label_17: # endif
.annotate 'line', 9720
# name: $S4
    sub $I4, $I2, $I1
# predefined substr
    substr $S4, $S2, $I1, $I4
  __label_19: # while
.annotate 'line', 9721
# predefined substr
    substr $S3, $S2, $I2, 1
    iseq $I4, $S3, " "
    if $I4 goto __label_20
    iseq $I4, $S3, "\t"
  __label_20:
    unless $I4 goto __label_18
.annotate 'line', 9722
    inc $I2
    goto __label_19
  __label_18: # endwhile
.annotate 'line', 9723
    set $I1, $I2
  __label_22: # while
.annotate 'line', 9724
# predefined substr
    substr $S3, $S2, $I2, 1
    isne $I4, $S3, " "
    unless $I4 goto __label_26
    isne $I4, $S3, "\t"
  __label_26:
    unless $I4 goto __label_25
.annotate 'line', 9725
    isne $I4, $S3, "\n"
  __label_25:
    unless $I4 goto __label_24
    isne $I4, $S3, "\r"
  __label_24:
    unless $I4 goto __label_23
    isne $I4, $S3, ""
  __label_23:
    unless $I4 goto __label_21
.annotate 'line', 9726
    inc $I2
    goto __label_22
  __label_21: # endwhile
.annotate 'line', 9727
    ne $I2, $I1, __label_27
    goto __label_3 # continue
  __label_27: # endif
.annotate 'line', 9729
# value: $S5
    sub $I4, $I2, $I1
# predefined substr
    substr $S5, $S2, $I1, $I4
.annotate 'line', 9731
# ivalue: $I3
    null $I3
.annotate 'line', 9732
# predefined substr
    substr $S6, $S5, 0, 2
    iseq $I4, $S6, '0x'
    if $I4 goto __label_30
# predefined substr
    substr $S7, $S5, 0, 2
    iseq $I4, $S7, '0X'
  __label_30:
    unless $I4 goto __label_28
.annotate 'line', 9733
# predefined substr
    substr $S8, $S5, 2
    box $P5, $S8
    $P4 = $P5.'to_int'(16)
    set $I3, $P4
    goto __label_29
  __label_28: # else
.annotate 'line', 9735
    set $I3, $S5
  __label_29: # endif
.annotate 'line', 9736
# var cst: $P3
    $P3 = __ARG_3.'createconst'($S4, 'I', 4)
.annotate 'line', 9738
    new $P6, [ 'Winxed'; 'Compiler'; 'TokenInteger' ]
    getattribute $P7, __ARG_1, 'file'
    getattribute $P8, __ARG_1, 'line'
    $P6.'TokenInteger'($P7, $P8, $S4)
    set $P5, $P6
.annotate 'line', 9737
    $P4 = WSubId_21(__ARG_3, $P5, $I3)
    $P3.'setvalue'($P4)
# }
  __label_7: # endif
# }
  __label_3: # for iteration
.annotate 'line', 9708
    $P4 = $P2.'readline'()
    set $S2, $P4
    goto __label_5
  __label_4: # for end
.annotate 'line', 9742
    $P2.'close'()
# }
.annotate 'line', 9743

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
.annotate 'line', 9749
    isa $I2, __ARG_3, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    not $I1, $I2
    unless $I1 goto __label_1
.annotate 'line', 9750
    WSubId_1("Must be used at root namespace level")
  __label_1: # endif
.annotate 'line', 9751
# var tfile: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9752
    $P4 = $P1.'isstring'()
    isfalse $I1, $P4
    unless $I1 goto __label_2
.annotate 'line', 9753
    WSubId_44('literal string', $P1)
  __label_2: # endif
.annotate 'line', 9754
    WSubId_58(';', __ARG_2)
.annotate 'line', 9756
# filename: $S1
    $P4 = $P1.'rawstring'()
    null $S1
    if_null $P4, __label_3
    set $S1, $P4
  __label_3:
.annotate 'line', 9757
# var file: $P2
    $P2 = WSubId_113($S1, __ARG_1)
.annotate 'line', 9759
# var tkinc: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P3.'Tokenizer'($P2, $S1)
.annotate 'line', 9760
    __ARG_3.'parse'($P3)
.annotate 'line', 9762
    $P2.'close'()
# }
.annotate 'line', 9763

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
.annotate 'line', 9769
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9770
    $P5 = $P1.'iskeyword'('namespace')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 9771
    WSubId_62(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 9772
    WSubId_58(';', __ARG_2)
.annotate 'line', 9773
    .return()
# }
  __label_1: # endif
.annotate 'line', 9775
    $P5 = $P1.'iskeyword'('extern')
    isfalse $I2, $P5
    unless $I2 goto __label_2
# {
.annotate 'line', 9776
    __ARG_2.'unget'($P1)
.annotate 'line', 9777
# var key: $P2
    $P2 = WSubId_59(__ARG_2)
.annotate 'line', 9778
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9779
    ge $I1, 1, __label_3
.annotate 'line', 9780
    WSubId_1('Unsupported at namespace level', $P1)
  __label_3: # endif
.annotate 'line', 9781
    WSubId_58(';', __ARG_2)
.annotate 'line', 9782
    __ARG_3.'use'($P2)
.annotate 'line', 9783
    .return()
# }
  __label_2: # endif
.annotate 'line', 9785
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9787
    $I2 = $P1.'isstring'()
    if $I2 goto __label_6
.annotate 'line', 9793
    $I2 = $P1.'isidentifier'()
    if $I2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 9789
# reqlib: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 9790
    __ARG_3.'addlib'($S1)
.annotate 'line', 9791
    WSubId_58(';', __ARG_2)
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 9794
    __ARG_2.'unget'($P1)
.annotate 'line', 9795
# var module: $P3
    $P3 = WSubId_59(__ARG_2)
.annotate 'line', 9796
    $P1 = __ARG_2.'get'()
.annotate 'line', 9797
    $P6 = $P1.'isop'(';')
    isfalse $I3, $P6
    unless $I3 goto __label_9
# {
.annotate 'line', 9798
    __ARG_2.'unget'($P1)
.annotate 'line', 9799
# var names: $P4
    null $P5
    $P4 = WSubId_40(__ARG_2, $P5, WSubId_61, ';')
.annotate 'line', 9800
    __ARG_3.'addextern'($P3, $P4)
# }
  __label_9: # endif
.annotate 'line', 9802
# reqmodule: $S2
# predefined join
    join $S3, '/', $P3
    concat $S4, '"', $S3
    concat $S4, $S4, '.pbc"'
    set $S2, $S4
.annotate 'line', 9803
    __ARG_3.'addload'($S2)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9806
    WSubId_44('string literal or identifier', $P1)
  __label_4: # switch end
# }
.annotate 'line', 9808

.end # parsensUsing

.namespace [ 'Winxed'; 'Compiler'; 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9818
    setattribute self, 'module', __ARG_1
.annotate 'line', 9819
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9820

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9825
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9834
# predefined string
.annotate 'line', 9835
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    concat $S3, "['parrot'; '", $S2
    concat $S3, $S3, "']"
.annotate 'line', 9834
    __ARG_1.'emitget_root_namespace'("srcns", $S3)
.annotate 'line', 9837
    getattribute $P1, self, 'names'
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9838
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9839
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9845

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'External' ]
.annotate 'line', 9814
    addattribute $P0, 'module'
.annotate 'line', 9815
    addattribute $P0, 'names'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespacePath' ]

.sub 'NamespacePath' :method
        .param string __ARG_1 :optional
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9855
    new $P1, ['ResizableStringArray']
.annotate 'line', 9856
    unless __ARG_2 goto __label_1
.annotate 'line', 9857
    box $P2, __ARG_1
    setattribute self, 'hll', $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9859
    if_null __ARG_1, __label_3
.annotate 'line', 9860
# predefined push
    push $P1, __ARG_1
  __label_3: # endif
# }
  __label_2: # endif
.annotate 'line', 9862
    setattribute self, 'path', $P1
# }
.annotate 'line', 9863

.end # NamespacePath


.sub 'createchild' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9866
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 9867
    getattribute $P4, self, 'hll'
    setattribute $P1, 'hll', $P4
.annotate 'line', 9868
# var path: $P2
    getattribute $P3, self, 'path'
# predefined clone
    clone $P2, $P3
.annotate 'line', 9869
# predefined push
    push $P2, __ARG_1
.annotate 'line', 9870
    setattribute $P1, 'path', $P2
.annotate 'line', 9871
    .return($P1)
# }
.annotate 'line', 9872

.end # createchild


.sub 'samehllas' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9875
# var fromkey: $P1
    $P1 = __ARG_1.'getpath'()
.annotate 'line', 9876
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 9877
# var fromhll: $P3
    if_null $P1, __label_2
    getattribute $P3, $P1, 'hll'
    goto __label_1
  __label_2:
    null $P3
  __label_1:
.annotate 'line', 9878
    unless_null $P2, __label_3
.annotate 'line', 9879
    isnull $I1, $P3
    .return($I1)
    goto __label_4
  __label_3: # else
.annotate 'line', 9881
    unless_null $P3, __label_6
    null $I2
    goto __label_5
  __label_6:
    iseq $I2, $P2, $P3
  __label_5:
    .return($I2)
  __label_4: # endif
# }
.annotate 'line', 9882

.end # samehllas


.sub 'fullname' :method
# Body
# {
.annotate 'line', 9885
# name: $S1
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '.', $P1
.annotate 'line', 9886
    getattribute $P1, self, 'hll'
    if_null $P1, __label_1
# predefined string
.annotate 'line', 9887
    getattribute $P2, self, 'hll'
    set $S2, $P2
    concat $S3, $S2, '.'
    concat $S3, $S3, $S1
    .return($S3)
    goto __label_2
  __label_1: # else
.annotate 'line', 9889
    .return($S1)
  __label_2: # endif
# }
.annotate 'line', 9890

.end # fullname


.sub 'getparrotkey' :method
# Body
# {
.annotate 'line', 9893
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 9894
# r: $S1
    null $S1
.annotate 'line', 9895
# predefined elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9896
# predefined string
# predefined join
    join $S2, "'; '", $P1
    concat $S3, "[ '", $S2
    concat $S3, $S3, "' ]"
    set $S1, $S3
  __label_1: # endif
.annotate 'line', 9897
    .return($S1)
# }
.annotate 'line', 9898

.end # getparrotkey


.sub 'getparrotrootkey' :method
# Body
# {
.annotate 'line', 9901
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 9902
# var hll: $P2
    getattribute $P2, self, 'hll'
.annotate 'line', 9903
# r: $S1
    set $S1, "[ '"
.annotate 'line', 9904
    if_null $P2, __label_1
# {
.annotate 'line', 9907
    set $S3, $P2
# predefined downcase
    downcase $S2, $S3
    concat $S1, $S1, $S2
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 9910
    concat $S1, $S1, "parrot"
  __label_2: # endif
.annotate 'line', 9911
    concat $S1, $S1, "'"
.annotate 'line', 9912
# predefined elements
    elements $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 9913
# predefined string
# predefined join
    join $S2, "'; '", $P1
    concat $S1, $S1, "; '"
    concat $S1, $S1, $S2
    concat $S1, $S1, "'"
  __label_3: # endif
.annotate 'line', 9914
    concat $S1, $S1, " ]"
.annotate 'line', 9915
    .return($S1)
# }
.annotate 'line', 9916

.end # getparrotrootkey


.sub 'emitnamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9919
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 9920
    __ARG_1.'print'(".namespace [ ")
.annotate 'line', 9921
# predefined elements
    elements $I1, $P1
    unless $I1 goto __label_1
.annotate 'line', 9922
# predefined join
    join $S1, "'; '", $P1
    __ARG_1.'print'("'", $S1, "' ")
  __label_1: # endif
.annotate 'line', 9923
    __ARG_1.'say'("]")
# }
.annotate 'line', 9924

.end # emitnamespace


.sub 'emit_new' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 9927
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 9928
    __ARG_1.'print'('    ', 'new ', __ARG_3, ", ")
.annotate 'line', 9929
    $P1 = self.'getparrotkey'()
    __ARG_1.'print'($P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9932
    __ARG_1.'print'('    ', 'root_new ', __ARG_3, ", ")
.annotate 'line', 9933
    $P1 = self.'getparrotrootkey'()
    __ARG_1.'print'($P1)
# }
  __label_2: # endif
.annotate 'line', 9935
    isnull $I1, __ARG_4
    not $I1
    unless $I1 goto __label_4
    isne $I1, __ARG_4, ''
  __label_4:
    unless $I1 goto __label_3
.annotate 'line', 9936
    __ARG_1.'print'(__ARG_4)
  __label_3: # endif
.annotate 'line', 9937
    __ARG_1.'say'()
# }
.annotate 'line', 9938

.end # emit_new


.sub 'emit_get_namespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 9941
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 9942
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_namespace'(__ARG_3, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 9944
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_namespace'(__ARG_3, $P3)
  __label_2: # endif
# }
.annotate 'line', 9945

.end # emit_get_namespace


.sub 'emit_get_class' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 9948
    $P3 = self.'samehllas'(__ARG_2)
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 9949
    $P4 = self.'getparrotkey'()
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", $P4)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9954
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9955
# var path: $P2
    getattribute $P3, self, 'path'
# predefined clone
    clone $P2, $P3
.annotate 'line', 9956
# name: $S1
    $P3 = $P2.'pop'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 9957
# shll: $S2
    if_null $P1, __label_5
    set $S3, $P1
# predefined downcase
    downcase $S2, $S3
    goto __label_4
  __label_5:
    set $S2, 'parrot'
  __label_4:
.annotate 'line', 9958
# predefined elements
    elements $I1, $P2
    unless $I1 goto __label_6
.annotate 'line', 9960
# predefined join
    join $S3, "'; '", $P2
.annotate 'line', 9959
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'; '", $S3, "'], '", $S1, "'")
    goto __label_7
  __label_6: # else
.annotate 'line', 9962
    __ARG_1.'say'("    get_root_global ", __ARG_3, ", ['", $S2, "'], '", $S1, "'")
  __label_7: # endif
.annotate 'line', 9964
    __ARG_1.'say'("    get_class ", __ARG_3, ", ", __ARG_3)
# }
  __label_2: # endif
# }
.annotate 'line', 9966

.end # emit_get_class


.sub 'emit_get_global' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 9969
    $P1 = self.'samehllas'(__ARG_2)
    if_null $P1, __label_1
    unless $P1 goto __label_1
.annotate 'line', 9970
    $P2 = self.'getparrotkey'()
    __ARG_1.'emitget_hll_global'(__ARG_3, __ARG_4, $P2)
    goto __label_2
  __label_1: # else
.annotate 'line', 9972
    $P3 = self.'getparrotrootkey'()
    __ARG_1.'emitget_root_global'(__ARG_3, __ARG_4, $P3)
  __label_2: # endif
# }
.annotate 'line', 9973

.end # emit_get_global

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
.annotate 'line', 9850
    addattribute $P0, 'hll'
.annotate 'line', 9851
    addattribute $P0, 'path'
.end
.namespace [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_111 = "WSubId_111"
# Body
# {
.annotate 'line', 9993
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9994
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9995
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9996
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9997
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9998
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
.annotate 'line', 9999
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'functions_name', $P2
.annotate 'line', 10000
    $P1 = __ARG_1.'fullname'()
    WSubId_111(self, '__NAMESPACE__', $P1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10003
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 10004
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 10005
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 10006
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 10007
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
.annotate 'line', 10008
    getattribute $P2, __ARG_2, 'functions_name'
    setattribute self, 'functions_name', $P2
# }
  __label_2: # endif
.annotate 'line', 10010
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 10011

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 10014
# var ns: $P1
    null $P1
.annotate 'line', 10015
    getattribute $P3, self, 'namespaces'
    if_null $P3, __label_2
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 10016
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10017
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_4
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 10018
    getattribute $P6, $P1, 'usednamespaces'
    if_null $P6, __label_6
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 10019
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 10020

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 10023
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 10024

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10027
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 10028
    .return()
  __label_1: # endif
.annotate 'line', 10029
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 10030
    if_null $P1, __label_3
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 10031
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 10032
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10033
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10034

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10037
# var sym: $P1
    $P1 = self.'scopesearch'(__ARG_1, 0)
.annotate 'line', 10038
    if_null $P1, __label_1
# {
.annotate 'line', 10039
    isa $I1, $P1, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 10040
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 10043
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 10044
# var ns: $P2
    $P2 = self.'scopesearch'(__ARG_1, 1)
.annotate 'line', 10045
    if_null $P2, __label_5
# {
.annotate 'line', 10046
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 10047
    if_null $P1, __label_6
.annotate 'line', 10048
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 10051

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10054
    getattribute $P2, self, 'usednamespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10055
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10056
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 10057
    .return($P2)
# }
.annotate 'line', 10058

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10061
    getattribute $P2, self, 'namespaces'
    if_null $P2, __label_2
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 10062
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10063
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10064
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 10065

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10069
# var ext: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 10070
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10071
    unless_null $P2, __label_1
.annotate 'line', 10072
    root_new $P4, ['parrot';'ResizablePMCArray']
    assign $P4, 1
    $P4[0] = $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 10074
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 10075

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10079
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 10080
# var cl: $P2
    null $P2
.annotate 'line', 10081
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 10082
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 10083
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 10084
    getattribute $P5, self, 'usednamespaces'
    if_null $P5, __label_5
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 10085
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 10086
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 10087
    .return($P5)
# }
.annotate 'line', 10088

.end # checkclass_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10091
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10092
    if_null $P1, __label_1
.annotate 'line', 10093
    .return($P1)
  __label_1: # endif
.annotate 'line', 10094
    getattribute $P2, self, 'functions'
    if_null $P2, __label_3
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 10095
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 10096
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 10097
    .return($P2)
# }
.annotate 'line', 10098

.end # findsymbolbyname


.sub 'scopesearchlocal' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 10103
# keylen: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 10104
# name: $S1
    null $S1
.annotate 'line', 10105
# var sym: $P1
    null $P1
.annotate 'line', 10106
# var ns: $P2
    null $P2
# switch
.annotate 'line', 10107
    sub $I2, $I1, __ARG_3
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 10111
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
# switch
.annotate 'line', 10112
    set $I5, __ARG_2
    set $I6, 1
    if $I5 == $I6 goto __label_7
    set $I6, 2
    if $I5 == $I6 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 10114
    .tailcall self.'getlocalns'($S1)
  __label_8: # case
.annotate 'line', 10116
    .tailcall self.'checkclass_base'($S1)
  __label_6: # default
.annotate 'line', 10119
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_9
.annotate 'line', 10120
    .return($P1)
  __label_9: # endif
.annotate 'line', 10121
    getattribute $P3, self, 'usednamespaces'
    if_null $P3, __label_11
    iter $P4, $P3
    set $P4, 0
  __label_10: # for iteration
    unless $P4 goto __label_11
    shift $P2, $P4
.annotate 'line', 10122
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_12
.annotate 'line', 10123
    .return($P1)
  __label_12: # endif
    goto __label_10
  __label_11: # endfor
  __label_5: # switch end
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 10130
    $S1 = __ARG_1[__ARG_3]
.annotate 'line', 10131
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 10132
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_14
.annotate 'line', 10133
    add $I8, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I8)
    isnull $I7, $P1
    not $I7
  __label_14:
    unless $I7 goto __label_13
.annotate 'line', 10134
    .return($P1)
  __label_13: # endif
.annotate 'line', 10135
    $P2 = self.'getusedns'($S1)
.annotate 'line', 10136
    isnull $I9, $P2
    not $I9
    unless $I9 goto __label_16
.annotate 'line', 10137
    add $I10, __ARG_3, 1
    $P1 = $P2.'scopesearchlocal'(__ARG_1, __ARG_2, $I10)
    isnull $I9, $P1
    not $I9
  __label_16:
    unless $I9 goto __label_15
.annotate 'line', 10138
    .return($P1)
  __label_15: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 10140
    .return($P3)
# }
.annotate 'line', 10141

.end # scopesearchlocal


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 10144
# var child: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 10145
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 10146
    .return($P1)
# }
.annotate 'line', 10147

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 10150
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 10151
# var child: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 10152
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 10153
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 10154
    .return($P2)
# }
.annotate 'line', 10155

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10158
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10159

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10162
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 10163
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10164

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
.const 'Sub' WSubId_4 = "WSubId_4"
# Body
# {
.annotate 'line', 10167
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 10168
# name: $S1
    set $P5, $P1
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 10169
    $P1 = __ARG_2.'get'()
.annotate 'line', 10171
# var parent: $P2
    set $P2, self
# for loop
  __label_4: # for condition
.annotate 'line', 10172
    $P5 = $P1.'isop'('.')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 10173
    null $P6
    $P2 = $P2.'childnamespace'(__ARG_1, $S1, $P6)
.annotate 'line', 10174
    $P5 = __ARG_2.'get'()
    set $S1, $P5
# }
  __label_2: # for iteration
.annotate 'line', 10172
    $P1 = __ARG_2.'get'()
    goto __label_4
  __label_3: # for end
.annotate 'line', 10177
# var modifier: $P3
    null $P3
.annotate 'line', 10178
    $P5 = $P1.'isop'('[')
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 10179
    new $P6, [ 'Winxed'; 'Compiler'; 'ModifierList' ]
    $P6.'ModifierList'(__ARG_2, self)
    set $P3, $P6
.annotate 'line', 10180
    $P1 = __ARG_2.'get'()
# }
  __label_5: # endif
.annotate 'line', 10183
    WSubId_4('{', $P1)
.annotate 'line', 10184
# var child: $P4
    $P4 = $P2.'childnamespace'(__ARG_1, $S1, $P3)
.annotate 'line', 10185
    $P4.'parse'(__ARG_2)
# }
.annotate 'line', 10186

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
.annotate 'line', 10189
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 10190
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 10191
# var functions_name: $P3
    getattribute $P3, self, 'functions_name'
.annotate 'line', 10192
# var classes: $P4
    getattribute $P4, self, 'classes'
.annotate 'line', 10193
# var t: $P5
    null $P5
# for loop
.annotate 'line', 10194
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
.annotate 'line', 10196
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
.annotate 'line', 10198
    self.'parsenamespace'($P5, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 10201
# var cst: $P6
    $P6 = WSubId_48($P5, __ARG_1, self)
.annotate 'line', 10202
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 10205
# var f: $P7
    new $P7, [ 'Winxed'; 'Compiler'; 'FunctionStatement' ]
    $P7.'FunctionStatement'($P5, __ARG_1, self)
.annotate 'line', 10206
# name: $S1
    getattribute $P12, $P7, 'name'
    null $S1
    if_null $P12, __label_17
    set $S1, $P12
  __label_17:
.annotate 'line', 10207
# predefined push
    push $P2, $P7
.annotate 'line', 10208
# predefined push
    push $P1, $P7
.annotate 'line', 10209
# var funcs: $P8
    $P8 = $P3[$S1]
.annotate 'line', 10210
    if_null $P8, __label_18
# {
.annotate 'line', 10211
    $P7.'setmulti'()
.annotate 'line', 10212
# predefined elements
    elements $I1, $P8
    ne $I1, 1, __label_20
.annotate 'line', 10213
    $P11 = $P8[0]
    $P11.'setmulti'()
  __label_20: # endif
.annotate 'line', 10214
    $P8.'push'($P7)
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 10217
    root_new $P11, ['parrot';'ResizablePMCArray']
    assign $P11, 1
    $P11[0] = $P7
    $P3[$S1] = $P11
  __label_19: # endif
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 10220
    WSubId_114($P5, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 10223
# var t1: $P9
    $P9 = __ARG_1.'get'()
.annotate 'line', 10224
    $P12 = $P9.'iskeyword'('function')
    isfalse $I1, $P12
    unless $I1 goto __label_21
.annotate 'line', 10225
    WSubId_1('Unsupported extern', $P9)
  __label_21: # endif
.annotate 'line', 10226
    $P9 = __ARG_1.'get'()
.annotate 'line', 10227
    WSubId_97($P9)
.annotate 'line', 10228
    WSubId_58(';', __ARG_1)
.annotate 'line', 10229
# var fex: $P10
    new $P10, [ 'Winxed'; 'Compiler'; 'FunctionExtern' ]
    $P10.'FunctionExtern'($P9, self)
.annotate 'line', 10230
# predefined push
    push $P2, $P10
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 10233
    WSubId_115($P5, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 10236
    WSubId_116($P5, __ARG_1, self)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 10239
    WSubId_117($P5, __ARG_1, self)
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 10242
    $P5 = __ARG_1.'get'()
.annotate 'line', 10243
    $P13 = $P5.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_22
.annotate 'line', 10244
    WSubId_44('string literal', $P5)
  __label_22: # endif
.annotate 'line', 10245
    WSubId_58(';', __ARG_1)
.annotate 'line', 10246
    new $P16, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P16.'StringLiteral'(self, $P5)
    set $P15, $P16
    $P14 = $P15.'getPirString'()
    self.'addload'($P14)
    goto __label_5 # break
  __label_16: # case
.annotate 'line', 10249
    $P5 = __ARG_1.'get'()
.annotate 'line', 10250
    $P17 = $P5.'isstring'()
    isfalse $I3, $P17
    unless $I3 goto __label_23
.annotate 'line', 10251
    WSubId_44('string literal', $P5)
  __label_23: # endif
.annotate 'line', 10252
    WSubId_58(';', __ARG_1)
.annotate 'line', 10253
    new $P20, [ 'Winxed'; 'Compiler'; 'StringLiteral' ]
    $P20.'StringLiteral'(self, $P5)
    set $P19, $P20
    $P18 = $P19.'getPirString'()
    self.'addlib'($P18)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 10256
    WSubId_45("token", $P5)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 10194
    $P5 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 10259
    $P11 = $P5.'iseof'()
    if_null $P11, __label_24
    unless $P11 goto __label_24
.annotate 'line', 10260
    self.'unclosed_ns'()
    goto __label_25
  __label_24: # else
.annotate 'line', 10262
    self.'close_ns'($P5)
  __label_25: # endif
# }
.annotate 'line', 10263

.end # parse


.sub 'optimize_base' :method
.const 'Sub' WSubId_42 = "WSubId_42"
# Body
# {
.annotate 'line', 10266
    getattribute $P1, self, 'items'
    WSubId_42($P1)
# }
.annotate 'line', 10267

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_56 = "WSubId_56"
# Body
# {
.annotate 'line', 10270
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 10272
# activate: $I1
    set $I1, 1
.annotate 'line', 10274
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 10275
    if_null $P2, __label_1
# {
.annotate 'line', 10276
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10277
    null $I1
.annotate 'line', 10278
    WSubId_56(__ARG_1, $P2)
# }
  __label_1: # endif
.annotate 'line', 10281
    getattribute $P4, self, 'items'
    if_null $P4, __label_3
    iter $P5, $P4
    set $P5, 0
  __label_2: # for iteration
    unless $P5 goto __label_3
    shift $P3, $P5
# {
.annotate 'line', 10282
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
    if $I2 goto __label_6
.annotate 'line', 10283
    isa $I2, $P3, [ 'Winxed'; 'Compiler'; 'ClassStatement' ]
  __label_6:
    unless $I2 goto __label_4
.annotate 'line', 10284
    set $I1, 1
    goto __label_5
  __label_4: # else
.annotate 'line', 10286
    unless $I1 goto __label_7
# {
.annotate 'line', 10287
    $P1.'emitnamespace'(__ARG_1)
.annotate 'line', 10288
    null $I1
# }
  __label_7: # endif
  __label_5: # endif
.annotate 'line', 10290
    $P3.'emit'(__ARG_1)
# }
    goto __label_2
  __label_3: # endfor
# }
.annotate 'line', 10292

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
.annotate 'line', 9980
    get_class $P1, [ 'Winxed'; 'Compiler'; 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9982
    addattribute $P0, 'nspath'
.annotate 'line', 9983
    addattribute $P0, 'externals'
.annotate 'line', 9984
    addattribute $P0, 'namespaces'
.annotate 'line', 9985
    addattribute $P0, 'classes'
.annotate 'line', 9986
    addattribute $P0, 'functions'
.annotate 'line', 9987
    addattribute $P0, 'functions_name'
.annotate 'line', 9988
    addattribute $P0, 'items'
.annotate 'line', 9989
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
.annotate 'line', 10310
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 10311
# is_hll: $I1
    null $I1
.annotate 'line', 10312
    if_null __ARG_5, __label_1
# {
.annotate 'line', 10313
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
# {
.annotate 'line', 10314
    box $P3, __ARG_4
    setattribute self, 'hll', $P3
.annotate 'line', 10315
    set $I1, 1
# }
  __label_2: # endif
# }
  __label_1: # endif
.annotate 'line', 10318
# var nspath: $P1
    unless $I1 goto __label_4
.annotate 'line', 10319
    new $P2, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P2.'NamespacePath'(__ARG_4, 1)
    set $P1, $P2
    goto __label_3
  __label_4:
.annotate 'line', 10320
    $P4 = __ARG_1.'getpath'()
    $P3 = $P4.'createchild'(__ARG_4)
    set $P1, $P3
  __label_3:
.annotate 'line', 10321
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 10323
    setattribute self, 'parent', __ARG_1
.annotate 'line', 10324
    setattribute self, 'start', __ARG_2
.annotate 'line', 10325
    setattribute self, 'owner', __ARG_1
.annotate 'line', 10326
    box $P2, __ARG_4
    setattribute self, 'name', $P2
# }
.annotate 'line', 10327

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10330
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10331

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10334
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 10335

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10338
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 10339

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10342
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 10343

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10346
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 10347

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10350
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 10351
    unless_null $P1, __label_1
.annotate 'line', 10352
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 10353
    .return($P1)
# }
.annotate 'line', 10354

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10357
# var sym: $P1
    $P1 = self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 10358
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_3, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 10359
    getattribute $P2, self, 'parent'
    .tailcall $P2.'scopesearch'(__ARG_1, __ARG_2, __ARG_3)
  __label_1: # endif
.annotate 'line', 10360
    .return($P1)
# }
.annotate 'line', 10361

.end # scopesearch


.sub 'unclosed_ns' :method
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10364
    getattribute $P1, self, 'start'
    WSubId_1('unclosed namespace', $P1)
# }
.annotate 'line', 10365

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10372
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 10373
    if_null $P1, __label_1
.annotate 'line', 10374
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 10375
    self.'optimize_base'()
.annotate 'line', 10376
    .return(self)
# }
.annotate 'line', 10377

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10380
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 10381
    if_null $P1, __label_1
.annotate 'line', 10382
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 10384
    self.'emit_base'(__ARG_1)
.annotate 'line', 10386
    if_null $P1, __label_2
.annotate 'line', 10387
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 10388

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'NamespaceStatement' ]
.annotate 'line', 10299
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10301
    addattribute $P0, 'parent'
.annotate 'line', 10302
    addattribute $P0, 'start'
.annotate 'line', 10303
    addattribute $P0, 'name'
.annotate 'line', 10304
    addattribute $P0, 'modifier'
.annotate 'line', 10305
    addattribute $P0, 'hll'
.end
.namespace [ 'Winxed'; 'Compiler'; 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10405
    new $P1, [ 'Winxed'; 'Compiler'; 'NamespacePath' ]
    $P1.'NamespacePath'()
    set $P1, $P1
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 10406
    setattribute self, 'unit', __ARG_1
.annotate 'line', 10407
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P2
.annotate 'line', 10408
    box $P1, 0
    setattribute self, 'subidgen', $P1
# }
.annotate 'line', 10409

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10412
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10413
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10414

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10417
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10418
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 10419

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 10423
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 10424
    set $S1, $I1
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 10425

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10429
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 10430
    unless_null $P1, __label_1
.annotate 'line', 10431
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 10432
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10433

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10436
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 10437
    unless_null $P1, __label_1
.annotate 'line', 10438
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 10439
    $P1[__ARG_1] = 1
# }
.annotate 'line', 10440

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 10443
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 10444

.end # checkclass


.sub 'scopesearch' :method
        .param pmc __ARG_1
        .param int __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 10447
    .tailcall self.'scopesearchlocal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 10448

.end # scopesearch


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
.const 'Sub' WSubId_1 = "WSubId_1"
# Body
# {
.annotate 'line', 10455
    WSubId_1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 10456

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 10459
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 10460

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10463
    self.'optimize_base'()
.annotate 'line', 10464
    .return(self)
# }
.annotate 'line', 10465

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10468
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 10471
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 10472
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 10475
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
.annotate 'line', 10478
    if_null $P2, __label_3
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 10479
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 10480
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 10481
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 10484
# somelib: $I1
    null $I1
.annotate 'line', 10485
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 10486
    if_null $P3, __label_5
# {
.annotate 'line', 10487
    set $I1, 1
.annotate 'line', 10488
    if_null $P3, __label_7
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 10489
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 10492
# someload: $I2
    null $I2
.annotate 'line', 10493
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 10494
    if_null $P4, __label_8
# {
.annotate 'line', 10495
    set $I2, 1
.annotate 'line', 10496
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 10497
    if_null $P4, __label_10
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 10498
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 10499
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 10501
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 10502
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 10504
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 10505

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10508
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 10509
    if_null $P1, __label_2
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 10510
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 10511
    isa $I2, $P2, [ 'Winxed'; 'Compiler'; 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 10512
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 10513
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 10515
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 10516
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10518

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
.annotate 'line', 10395
    get_class $P1, [ 'Winxed'; 'Compiler'; 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 10397
    addattribute $P0, 'unit'
.annotate 'line', 10398
    addattribute $P0, 'predefs_used'
.annotate 'line', 10399
    addattribute $P0, 'libs'
.annotate 'line', 10400
    addattribute $P0, 'loads'
.annotate 'line', 10401
    addattribute $P0, 'subidgen'
.end
.namespace [ 'Winxed'; 'Compiler'; 'Builtin' ]

.sub 'Builtin' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 10530
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 10531
    root_new $P2, ['parrot';'ResizablePMCArray']
    assign $P2, 1
    $P2[0] = __ARG_2
    setattribute self, 'variants', $P2
# }
.annotate 'line', 10532

.end # Builtin


.sub 'getname' :method
# Body
# {
# predefined string
.annotate 'line', 10533
    getattribute $P1, self, 'name'
    set $S1, $P1
    .return($S1)
# }

.end # getname


.sub 'addvariant' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10536
    getattribute $P1, self, 'variants'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 10537

.end # addvariant

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'Builtin' ]
.annotate 'line', 10526
    addattribute $P0, 'name'
.annotate 'line', 10527
    addattribute $P0, 'variants'
.end
.namespace [ 'Winxed'; 'Compiler' ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]

.sub 'BuiltinBuilder' :method
# Body
# {
.annotate 'line', 10547
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'entries', $P2
# }
.annotate 'line', 10548

.end # BuiltinBuilder


.sub 'add' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10551
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10552
# name: $S1
    getattribute $P2, __ARG_1, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 10553
    $P2 = $P1[$S1]
    if_null $P2, __label_2
.annotate 'line', 10554
    $P3 = $P1[$S1]
    $P3.'addvariant'(__ARG_1)
    goto __label_3
  __label_2: # else
.annotate 'line', 10556
    new $P5, [ 'Winxed'; 'Compiler'; 'Builtin' ]
    $P5.'Builtin'($S1, __ARG_1)
    set $P4, $P5
    $P1[$S1] = $P4
  __label_3: # endif
# }
.annotate 'line', 10557

.end # add


.sub 'put' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10560
# var entries: $P1
    getattribute $P1, self, 'entries'
.annotate 'line', 10561
    if_null $P1, __label_2
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 10562
    getattribute $P3, __ARG_1, 'functions'
    $P4 = $P1[$S1]
# predefined push
    push $P3, $P4
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 10563

.end # put

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
.annotate 'line', 10544
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
.annotate 'line', 10573
    not $I1, __ARG_1
    box $P4, $I1
    setattribute self, 'warnings', $P4
.annotate 'line', 10574
# var rootns: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 10578
    WSubId_118($P1, 'false', 0)
.annotate 'line', 10579
    WSubId_118($P1, 'true', 1)
.annotate 'line', 10584
    WSubId_111($P1, '__STAGE__', "3")
.annotate 'line', 10587
    WSubId_118($P1, '__DEBUG__', __ARG_2)
.annotate 'line', 10590
    WSubId_118($P1, '__WINXED_ERROR__', 567)
.annotate 'line', 10593
# var builtins_ns: $P2
    new $P5, [ 'Winxed'; 'Compiler'; 'TokenEof' ]
    $P5.'TokenEof'('__builtins__')
    set $P4, $P5
    null $P6
    $P2 = $P1.'childnamespace'($P4, "Winxed_Builtins", $P6)
.annotate 'line', 10595
# var builder: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'BuiltinBuilder' ]
    $P3.'BuiltinBuilder'()
.annotate 'line', 10596
    WSubId_119($P3)
.annotate 'line', 10597
    $P3.'put'($P2)
.annotate 'line', 10599
    $P1.'usenamespace'($P2)
.annotate 'line', 10601
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 10602

.end # WinxedCompileUnit


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 10605
    getattribute $P1, self, 'warnings'
    set $I1, $P1
    .return($I1)
# }
.annotate 'line', 10606

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10609
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 10610
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 10611

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 10614
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 10615

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10618
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 10619
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 10620
    __ARG_1.'say'('')
.annotate 'line', 10622
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 10624
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 10625

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10628
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 10629
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 10631
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 10633
    __ARG_1.'comment'('End')
# }
.annotate 'line', 10634

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
.annotate 'line', 10568
    addattribute $P0, 'rootns'
.annotate 'line', 10569
    addattribute $P0, 'warnings'
.end
.namespace [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]

.sub 'version' :method
# Body
# {
.annotate 'line', 10643
    new $P1, ['FixedIntegerArray'], 3
    set $I1, 1
    $P1[0] = $I1
    set $I1, 2
    $P1[1] = $I1
    set $I1, -1
    $P1[2] = $I1
.annotate 'line', 10644
    .return($P1)
# }
.annotate 'line', 10645

.end # version


.sub 'version_string' :method
# Body
# {
# predefined string
.annotate 'line', 10648
    $P1 = self.'version'()
# predefined join
    join $S1, ".", $P1
    concat $S2, "Winxed ", $S1
    .return($S2)
# }
.annotate 'line', 10649

.end # version_string


.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 10652
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 10653
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 10654
# var handleout: $P1
    null $P1
.annotate 'line', 10655
    unless_null __ARG_3, __label_2
# {
.annotate 'line', 10656
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10657
    $P1.'open'('__eval__', 'w')
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 10660
    set $P1, __ARG_3
  __label_3: # endif
.annotate 'line', 10661
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10662
    unless __ARG_4 goto __label_4
.annotate 'line', 10663
    $P2.'setDebug'()
  __label_4: # endif
.annotate 'line', 10664
    unless __ARG_5 goto __label_5
.annotate 'line', 10665
    $P2.'disable_annotations'()
  __label_5: # endif
.annotate 'line', 10666
    __ARG_1.'emit'($P2)
.annotate 'line', 10667
    $P2.'close'()
.annotate 'line', 10668
    if_null __ARG_3, __label_6
.annotate 'line', 10669
    .return(__ARG_3)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 10671
    $P1.'close'()
.annotate 'line', 10672
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_8
    set $S1, $P5
  __label_8:
.annotate 'line', 10673
# var object: $P3
    null $P3
# switch
.annotate 'line', 10674
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_11
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_12
    set $S3, ''
    if $S2 == $S3 goto __label_13
    goto __label_10
  __label_11: # case
.annotate 'line', 10676
    new $P3, [ 'String' ]
.annotate 'line', 10677
    assign $P3, $S1
    goto __label_9 # break
  __label_12: # case
  __label_13: # case
.annotate 'line', 10681
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 10682
    $P3 = $P4($S1)
    goto __label_9 # break
  __label_10: # default
.annotate 'line', 10683
# predefined string
.annotate 'line', 10685
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_9: # switch end
.annotate 'line', 10687
    .return($P3)
# }
  __label_7: # endif
# }
.annotate 'line', 10689

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 10692
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10693
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10694
# var emit: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 10695
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 10696
    $P2.'close'()
.annotate 'line', 10697
    $P1.'close'()
.annotate 'line', 10698
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 10699

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
.annotate 'line', 10707
    unless_null __ARG_2, __label_1
.annotate 'line', 10708
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10709
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 10710
    $P1.'open'('__eval__', 'w')
.annotate 'line', 10711
    $P1.'puts'(__ARG_1)
.annotate 'line', 10712
    $P1.'close'()
.annotate 'line', 10713
    $P1.'open'('__eval__', 'r')
.annotate 'line', 10714
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 10715
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10716
    $P3.'parse'($P2)
.annotate 'line', 10717
    $P1.'close'()
.annotate 'line', 10718
    $P3.'optimize'()
.annotate 'line', 10719
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10720
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10722
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10723

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
.annotate 'line', 10732
    unless_null __ARG_2, __label_1
.annotate 'line', 10733
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 10734
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 10735
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 10736
    $P1.'encoding'('utf8')
.annotate 'line', 10737
# var tk: $P2
    new $P2, [ 'Winxed'; 'Compiler'; 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 10738
# var winxed: $P3
    new $P3, [ 'Winxed'; 'Compiler'; 'WinxedCompileUnit' ]
    $P3.'WinxedCompileUnit'(__ARG_6, __ARG_4)
.annotate 'line', 10739
    $P3.'parse'($P2)
.annotate 'line', 10740
    $P1.'close'()
.annotate 'line', 10741
    $P3.'optimize'()
.annotate 'line', 10742
    ne __ARG_2, 'include', __label_2
.annotate 'line', 10743
    .tailcall self.'__private_geninclude'($P3)
    goto __label_3
  __label_2: # else
.annotate 'line', 10745
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3, __ARG_4, __ARG_5)
  __label_3: # endif
# }
.annotate 'line', 10746

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.end
.namespace [ 'Winxed'; 'Compiler' ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 10755
# var comp: $P1
    new $P1, [ 'Winxed'; 'Compiler'; 'WinxedHLL' ]
.annotate 'line', 10756
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 10757

.end # initializer

# End generated code
