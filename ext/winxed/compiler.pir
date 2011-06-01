# THIS IS A GENERATED FILE! DO NOT EDIT!
# Begin generated code

.namespace [ ]

.sub 'isspace' :subid('WSubId_18')
        .param string __ARG_1
# Body
# {
.annotate 'file', 'winxedst1.winxed'
.annotate 'line', 13
    iseq $I1, __ARG_1, ' '
    if $I1 goto __label_2
    iseq $I1, __ARG_1, "\n"
  __label_2:
    if $I1 goto __label_1
    iseq $I1, __ARG_1, "\t"
  __label_1:
    .return($I1)
# }
.annotate 'line', 14

.end # isspace


.sub 'isdigit' :subid('WSubId_9')
        .param string __ARG_1
# Body
# {
.annotate 'line', 18
# predefined indexof
.annotate 'line', 17
    index $I2, '0123456789', __ARG_1
.annotate 'line', 18
    isgt $I1, $I2, -1
    .return($I1)
# }
.annotate 'line', 19

.end # isdigit


.sub 'hexdigit' :subid('WSubId_10')
        .param string __ARG_1
# Body
# {
.annotate 'line', 23
# i: $I1
# predefined indexof
    index $I1, '0123456789abcdef0123456789ABCDEF', __ARG_1
.annotate 'line', 24
    lt $I1, 0, __label_1
    mod $I1, $I1, 16
  __label_1: # endif
.annotate 'line', 25
    .return($I1)
# }
.annotate 'line', 26

.end # hexdigit


.sub 'isidentstart' :subid('WSubId_19')
        .param string __ARG_1
# Body
# {
.annotate 'line', 33
# predefined indexof
.annotate 'line', 29
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_', __ARG_1
.annotate 'line', 33
    isgt $I1, $I2, -1
.annotate 'line', 30
    .return($I1)
# }
.annotate 'line', 34

.end # isidentstart


.sub 'isident' :subid('WSubId_8')
        .param string __ARG_1
# Body
# {
.annotate 'line', 42
# predefined indexof
.annotate 'line', 37
    index $I2, 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_$0123456789', __ARG_1
.annotate 'line', 42
    isgt $I1, $I2, -1
.annotate 'line', 38
    .return($I1)
# }
.annotate 'line', 43

.end # isident

# Constant ERRORinternal evaluated at compile time
# Constant ERRORtokenizer evaluated at compile time
# Constant ERRORparser evaluated at compile time

.sub 'Warn' :subid('WSubId_67')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 57
# var stderr: $P1
# predefined getstderr
    getstderr $P1
.annotate 'line', 58
    $P1.'print'('WARNING: ')
.annotate 'line', 59
    $P1.'print'(__ARG_1)
.annotate 'line', 60
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 61
    $P1.'print'(' near ')
.annotate 'line', 62
    $P2 = __ARG_2.'show'()
    $P1.'print'($P2)
# }
  __label_1: # endif
.annotate 'line', 64
    $P1.'print'("\n")
# }
.annotate 'line', 65

.end # Warn


.sub 'InternalError' :subid('WSubId_6')
        .param string __ARG_1
        .param pmc __ARG_2 :optional
        .param int __ARG_3 :opt_flag
# Body
# {
.annotate 'line', 69
    unless __ARG_3 goto __label_1
# {
.annotate 'line', 70
# desc: $S1
    $P1 = __ARG_2.'show'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 71
    concat $S0, __ARG_1, ' near '
    concat $S0, $S0, $S1
    set __ARG_1, $S0
# }
  __label_1: # endif
.annotate 'line', 73
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = __ARG_1
    $P1['severity'] = 2
    $P1['type'] = 555
    throw $P1
# }
.annotate 'line', 74

.end # InternalError


.sub 'TokenError' :subid('WSubId_7')
        .param string __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 78
# predefined string
    getattribute $P2, __ARG_2, 'filename'
    set $S1, $P2
# predefined string
    set $S2, __ARG_3
    concat $S3, __ARG_1, ' in '
    concat $S3, $S3, $S1
    concat $S3, $S3, ' line '
    concat $S3, $S3, $S2
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S3
    $P1['severity'] = 2
    $P1['type'] = 556
    throw $P1
# }
.annotate 'line', 80

.end # TokenError


.sub 'SyntaxError' :subid('WSubId_1')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 84
# sline: $S1
    getattribute $P1, __ARG_2, 'line'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 85
# file: $S2
    getattribute $P1, __ARG_2, 'file'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 86
# desc: $S3
    $P1 = __ARG_2.'viewable'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 87
    concat $S4, __ARG_1, ' in '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S1
    concat $S4, $S4, ' near '
    concat $S4, $S4, $S3
# predefined Error
    root_new $P1, ['parrot';'Exception']
    $P1['message'] = $S4
    $P1['severity'] = 2
    $P1['type'] = 557
    throw $P1
# }
.annotate 'line', 89

.end # SyntaxError


.sub 'Expected' :subid('WSubId_40')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 93
    concat $S1, "Expected ", __ARG_1
    $P1($S1, __ARG_2)
# }
.annotate 'line', 94

.end # Expected


.sub 'Unexpected' :subid('WSubId_41')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 98
    concat $S1, "Unexpected ", __ARG_1
    $P1($S1, __ARG_2)
# }
.annotate 'line', 99

.end # Unexpected


.sub 'ExpectedIdentifier' :subid('WSubId_3')
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 103
    $P1("Expected identifier", __ARG_1)
# }
.annotate 'line', 104

.end # ExpectedIdentifier


.sub 'ExpectedOp' :subid('WSubId_2')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 108
    concat $S1, "Expected '", __ARG_1
    concat $S1, $S1, "'"
    $P1($S1, __ARG_2)
# }
.annotate 'line', 109

.end # ExpectedOp


.sub 'RequireOp' :subid('WSubId_4')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 113
    $P1 = __ARG_2.'isop'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_2'
.annotate 'line', 114
    $P2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 115

.end # RequireOp


.sub 'RequireKeyword' :subid('WSubId_5')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 119
    $P1 = __ARG_2.'iskeyword'(__ARG_1)
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_2'
.annotate 'line', 120
    $P2(__ARG_1, __ARG_2)
  __label_1: # endif
# }
.annotate 'line', 121

.end # RequireKeyword


.sub 'RequireIdentifier' :subid('WSubId_92')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 125
    $P1 = __ARG_1.'isidentifier'()
    isfalse $I1, $P1
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_3'
.annotate 'line', 126
    $P2(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 127

.end # RequireIdentifier


.sub 'ExpectOp' :subid('WSubId_54')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 131
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_4'
.annotate 'line', 132
    $P2(__ARG_1, $P1)
# }
.annotate 'line', 133

.end # ExpectOp


.sub 'ExpectKeyword' :subid('WSubId_94')
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 137
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_5'
.annotate 'line', 138
    $P2(__ARG_1, $P1)
# }
.annotate 'line', 139

.end # ExpectKeyword


.sub 'UndefinedVariable' :subid('WSubId_59')
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
# predefined string
.annotate 'line', 143
    set $S1, __ARG_1
    concat $S2, "Variable '", $S1
    concat $S2, $S2, "' is not defined"
    $P1($S2, __ARG_1)
# }
.annotate 'line', 144

.end # UndefinedVariable

.namespace [ 'Token' ]

.sub 'Token' :method
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 156
    box $P1, __ARG_1
    setattribute self, 'file', $P1
.annotate 'line', 157
    box $P1, __ARG_2
    setattribute self, 'line', $P1
# }
.annotate 'line', 158

.end # Token


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 161
    .return(1)
# }
.annotate 'line', 162

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 165
    .return(1)
# }
.annotate 'line', 166

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 168
    .return(0)
# }

.end # iseof


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 169
    .return(0)
# }

.end # iscomment


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 170
    .return(0)
# }

.end # isidentifier


.sub 'isint' :method
# Body
# {
.annotate 'line', 171
    .return(0)
# }

.end # isint


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 172
    .return(0)
# }

.end # isfloat


.sub 'isstring' :method
# Body
# {
.annotate 'line', 173
    .return(0)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 177
    $P1('Not a literal string', self)
# }
.annotate 'line', 178

.end # rawstring


.sub 'getidentifier' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_3'
.annotate 'line', 181
    $P1(self)
# }
.annotate 'line', 182

.end # getidentifier


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 183
    .return(0)
# }

.end # iskeyword


.sub 'checkkeyword' :method
# Body
# {
.annotate 'line', 184
    .return(0)
# }

.end # checkkeyword


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 185
    .return(0)
# }

.end # isop


.sub 'checkop' :method
# Body
# {
.annotate 'line', 186
    .return('')
# }

.end # checkop


.sub 'viewable' :method
# Body
# {
.annotate 'line', 187
    .return('(unknown)')
# }

.end # viewable


.sub 'show' :method
# Body
# {
.annotate 'line', 190
# r: $S1
    $P1 = self.'viewable'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 191
# predefined string
    getattribute $P1, self, 'file'
.annotate 'line', 189
    set $S2, $P1
# predefined string
.annotate 'line', 191
    getattribute $P2, self, 'line'
.annotate 'line', 189
    set $S3, $P2
.annotate 'line', 191
    concat $S4, $S1, ' at '
    concat $S4, $S4, $S2
    concat $S4, $S4, ' line '
    concat $S4, $S4, $S3
    .return($S4)
# }
.annotate 'line', 192

.end # show

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Token' ]
.annotate 'line', 152
    addattribute $P0, 'file'
.annotate 'line', 153
    addattribute $P0, 'line'
.end
.namespace [ 'TokenEof' ]

.sub 'TokenEof' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 199
    self.'Token'(__ARG_1, 0)
# }
.annotate 'line', 200

.end # TokenEof


.sub 'get_bool' :method :vtable
# Body
# {
.annotate 'line', 203
    .return(0)
# }
.annotate 'line', 204

.end # get_bool


.sub 'get_integer' :method :vtable
# Body
# {
.annotate 'line', 207
    .return(0)
# }
.annotate 'line', 208

.end # get_integer


.sub 'iseof' :method
# Body
# {
.annotate 'line', 209
    .return(1)
# }

.end # iseof


.sub 'viewable' :method
# Body
# {
.annotate 'line', 210
    .return('(End of file)')
# }

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenEof' ]
.annotate 'line', 195
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenWithVal' ]

.sub 'TokenWithVal' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 218
    self.'Token'(__ARG_1, __ARG_2)
.annotate 'line', 219
    box $P1, __ARG_3
    setattribute self, 'str', $P1
# }
.annotate 'line', 220

.end # TokenWithVal


.sub 'get_string' :method :vtable
# Body
# {
.annotate 'line', 221
    getattribute $P1, self, 'str'
    .return($P1)
# }

.end # get_string


.sub 'viewable' :method
# Body
# {
.annotate 'line', 224
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 225

.end # viewable

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenWithVal' ]
.annotate 'line', 213
    get_class $P1, [ 'Token' ]
    addparent $P0, $P1
.annotate 'line', 215
    addattribute $P0, 'str'
.end
.namespace [ 'TokenComment' ]

.sub 'TokenComment' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 232
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 233

.end # TokenComment


.sub 'iscomment' :method
# Body
# {
.annotate 'line', 234
    .return(1)
# }

.end # iscomment

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenComment' ]
.annotate 'line', 228
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenOp' ]

.sub 'TokenOp' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 241
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 242

.end # TokenOp


.sub 'isop' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 245
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 246

.end # isop


.sub 'checkop' :method
# Body
# {
# predefined string
.annotate 'line', 249
    getattribute $P1, self, 'str'
.annotate 'line', 248
    set $S1, $P1
.annotate 'line', 249
    .return($S1)
# }
.annotate 'line', 250

.end # checkop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenOp' ]
.annotate 'line', 237
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenIdentifier' ]

.sub 'TokenIdentifier' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 257
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 258

.end # TokenIdentifier


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 259
    .return(1)
# }

.end # isidentifier


.sub 'getidentifier' :method
# Body
# {
.annotate 'line', 262
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 263

.end # getidentifier


.sub 'checkkeyword' :method
# Body
# {
# predefined string
.annotate 'line', 266
    getattribute $P1, self, 'str'
.annotate 'line', 265
    set $S1, $P1
.annotate 'line', 266
    .return($S1)
# }
.annotate 'line', 267

.end # checkkeyword


.sub 'iskeyword' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 270
    getattribute $P1, self, 'str'
    set $S1, $P1
    iseq $I1, $S1, __ARG_1
    .return($I1)
# }
.annotate 'line', 271

.end # iskeyword

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenIdentifier' ]
.annotate 'line', 253
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenString' ]

.sub 'isstring' :method
# Body
# {
.annotate 'line', 276
    .return(1)
# }

.end # isstring


.sub 'rawstring' :method
# Body
# {
.annotate 'line', 279
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 280

.end # rawstring

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenString' ]
.annotate 'line', 274
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenQuoted' ]

.sub 'TokenQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 287
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 288

.end # TokenQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 291
    getattribute $P1, self, 'str'
.annotate 'line', 290
    set $S1, $P1
.annotate 'line', 291
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 292

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 295
    getattribute $P1, self, 'str'
.annotate 'line', 294
    set $S1, $P1
.annotate 'line', 295
    concat $S2, '"', $S1
    concat $S2, $S2, '"'
    .return($S2)
# }
.annotate 'line', 296

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 299
    getattribute $P1, self, 'str'
    .return($P1)
# }
.annotate 'line', 300

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenQuoted' ]
.annotate 'line', 283
    get_class $P1, [ 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenSingleQuoted' ]

.sub 'TokenSingleQuoted' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 307
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 308

.end # TokenSingleQuoted


.sub 'get_string' :method :vtable
# Body
# {
# predefined string
.annotate 'line', 311
    getattribute $P1, self, 'str'
.annotate 'line', 310
    set $S1, $P1
.annotate 'line', 311
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 312

.end # get_string


.sub 'viewable' :method
# Body
# {
# predefined string
.annotate 'line', 315
    getattribute $P1, self, 'str'
.annotate 'line', 314
    set $S1, $P1
.annotate 'line', 315
    concat $S2, "'", $S1
    concat $S2, $S2, "'"
    .return($S2)
# }
.annotate 'line', 316

.end # viewable


.sub 'getasquoted' :method
# Body
# {
.annotate 'line', 319
# s: $S1
    set $S1, ''
.annotate 'line', 320
    getattribute $P1, self, 'str'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S2, $P2
# {
# switch
.annotate 'line', 321
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
.annotate 'line', 325
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_3 # break
  __label_4: # default
  __label_3: # switch end
.annotate 'line', 328
    concat $S1, $S1, $S2
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 330
    .return($S1)
# }
.annotate 'line', 331

.end # getasquoted

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenSingleQuoted' ]
.annotate 'line', 303
    get_class $P1, [ 'TokenString' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenInteger' ]

.sub 'TokenInteger' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 338
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 339

.end # TokenInteger


.sub 'isint' :method
# Body
# {
.annotate 'line', 340
    .return(1)
# }

.end # isint

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenInteger' ]
.annotate 'line', 334
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ 'TokenFloat' ]

.sub 'TokenFloat' :method
        .param string __ARG_1
        .param int __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 347
    self.'TokenWithVal'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 348

.end # TokenFloat


.sub 'isfloat' :method
# Body
# {
.annotate 'line', 349
    .return(1)
# }

.end # isfloat

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TokenFloat' ]
.annotate 'line', 343
    get_class $P1, [ 'TokenWithVal' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'getquoted' :subid('WSubId_13')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 359
# s: $S1
    set $S1, ''
.annotate 'line', 360
# c: $S2
    null $S2
# for loop
.annotate 'line', 361
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, '"', __label_2
# {
# switch
.annotate 'line', 362
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
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 365
    $P2('Unterminated string', __ARG_1, __ARG_3)
  __label_8: # case
.annotate 'line', 368
# c2: $S3
    $P3 = __ARG_1.'getchar'()
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 369
    iseq $I1, $S3, ''
    if $I1 goto __label_11
    iseq $I1, $S3, "\n"
  __label_11:
    unless $I1 goto __label_10
.const 'Sub' $P4 = 'WSubId_7'
.annotate 'line', 370
    $P4('Unterminated string', __ARG_1, __ARG_3)
  __label_10: # endif
.annotate 'line', 371
    concat $S1, $S1, $S2
    concat $S1, $S1, $S3
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 374
    concat $S1, $S1, $S2
  __label_4: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 361
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 377
    new $P3, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenQuoted'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
.annotate 'line', 378

.end # getquoted


.sub 'getsinglequoted' :subid('WSubId_14')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 382
# s: $S1
    set $S1, ''
.annotate 'line', 383
# c: $S2
    null $S2
# for loop
.annotate 'line', 384
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "'", __label_2
# {
.annotate 'line', 385
    iseq $I1, $S2, ""
    if $I1 goto __label_5
    iseq $I1, $S2, "\n"
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 386
    $P2('Unterminated string', __ARG_1, __ARG_3)
  __label_4: # endif
.annotate 'line', 387
    concat $S1, $S1, $S2
# }
  __label_1: # for iteration
.annotate 'line', 384
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 389
    new $P3, [ 'TokenSingleQuoted' ]
    getattribute $P4, __ARG_1, 'filename'
    $P3.'TokenSingleQuoted'($P4, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
.annotate 'line', 390

.end # getsinglequoted


.sub 'getheredoc' :subid('WSubId_15')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 394
# mark: $S1
    set $S1, ''
.annotate 'line', 395
# c: $S2
    null $S2
# for loop
.annotate 'line', 396
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
    eq $S2, "\n", __label_2
# {
# switch
.annotate 'line', 397
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_6
    set $S6, '"'
    if $S5 == $S6 goto __label_7
    set $S6, '\'
    if $S5 == $S6 goto __label_8
    goto __label_5
  __label_6: # case
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 399
    $P2('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_7: # case
  __label_8: # case
.annotate 'line', 404
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_4 # break
  __label_5: # default
  __label_4: # switch end
.annotate 'line', 407
    concat $S0, $S1, $S2
    set $S1, $S0
# }
  __label_1: # for iteration
.annotate 'line', 396
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_3
  __label_2: # for end
.annotate 'line', 409
    concat $S0, $S1, ':>>'
    set $S1, $S0
.annotate 'line', 411
# content: $S3
    set $S3, ''
.annotate 'line', 412
# line: $S4
    null $S4
  __label_9: # do
.annotate 'line', 413
# {
.annotate 'line', 414
    set $S4, ''
# for loop
.annotate 'line', 415
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_14: # for condition
    eq $S2, "\n", __label_13
# {
# switch
.annotate 'line', 416
    set $S5, $S2
    set $S6, ''
    if $S5 == $S6 goto __label_17
    set $S6, '"'
    if $S5 == $S6 goto __label_18
    set $S6, '\'
    if $S5 == $S6 goto __label_19
    goto __label_16
  __label_17: # case
.const 'Sub' $P3 = 'WSubId_7'
.annotate 'line', 418
    $P3('Unterminated heredoc', __ARG_1, __ARG_3)
  __label_18: # case
  __label_19: # case
.annotate 'line', 421
    concat $S0, '\', $S2
    set $S2, $S0
    goto __label_15 # break
  __label_16: # default
  __label_15: # switch end
.annotate 'line', 424
    concat $S4, $S4, $S2
# }
  __label_12: # for iteration
.annotate 'line', 415
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_14
  __label_13: # for end
.annotate 'line', 426
    eq $S4, $S1, __label_20
.annotate 'line', 427
    concat $S3, $S3, $S4
    concat $S3, $S3, '\n'
  __label_20: # endif
# }
  __label_11: # continue
.annotate 'line', 428
    ne $S4, $S1, __label_9
  __label_10: # enddo
.annotate 'line', 429
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_1, 'filename'
    $P4.'TokenQuoted'($P5, __ARG_3, $S3)
    set $P1, $P4
    .return($P1)
# }
.annotate 'line', 430

.end # getheredoc


.sub 'getident' :subid('WSubId_11')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 434
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 435
# c: $S2
    null $S2
# for loop
.annotate 'line', 436
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_3: # for condition
.const 'Sub' $P3 = 'WSubId_8'
    $P2 = $P3($S2)
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 437
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 436
    $P4 = __ARG_1.'getchar'()
    set $S2, $P4
    goto __label_3
  __label_2: # for end
.annotate 'line', 438
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 439
    new $P2, [ 'TokenIdentifier' ]
    getattribute $P4, __ARG_1, 'filename'
    $P2.'TokenIdentifier'($P4, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 440

.end # getident


.sub 'getnumber' :subid('WSubId_20')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 444
# s: $S1
    null $S1
.annotate 'line', 445
# c: $S2
    set $S2, __ARG_2
  __label_1: # do
.annotate 'line', 446
# {
.annotate 'line', 447
    concat $S1, $S1, $S2
.annotate 'line', 448
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_3: # continue
.const 'Sub' $P2 = 'WSubId_9'
.annotate 'line', 449
    $P1 = $P2($S2)
    if_null $P1, __label_2
    if $P1 goto __label_1
  __label_2: # enddo
.annotate 'line', 450
    iseq $I3, $S1, '0'
    unless $I3 goto __label_5
    iseq $I3, $S2, 'x'
    if $I3 goto __label_6
    iseq $I3, $S2, 'X'
  __label_6:
  __label_5:
    unless $I3 goto __label_4
# {
.annotate 'line', 451
# hexval: $I1
    null $I1
# h: $I2
    null $I2
# for loop
.annotate 'line', 452
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
  __label_9: # for condition
.const 'Sub' $P4 = 'WSubId_10'
    $P3 = $P4($S2)
    set $I2, $P3
    lt $I2, 0, __label_8
# {
.annotate 'line', 453
    mul $I3, $I1, 16
    add $I1, $I3, $I2
.annotate 'line', 454
    concat $S1, $S1, $S2
# }
  __label_7: # for iteration
.annotate 'line', 452
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_9
  __label_8: # for end
.annotate 'line', 456
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 457
    set $S1, $I1
.annotate 'line', 458
    new $P3, [ 'TokenInteger' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenInteger'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
  __label_4: # endif
.annotate 'line', 460
    ne $S2, '.', __label_10
# {
  __label_12: # do
.annotate 'line', 461
# {
.annotate 'line', 462
    concat $S1, $S1, $S2
.annotate 'line', 463
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_14: # continue
.const 'Sub' $P6 = 'WSubId_9'
.annotate 'line', 464
    $P1 = $P6($S2)
    if_null $P1, __label_13
    if $P1 goto __label_12
  __label_13: # enddo
.annotate 'line', 465
    iseq $I3, $S2, 'e'
    if $I3 goto __label_16
    iseq $I3, $S2, 'E'
  __label_16:
    unless $I3 goto __label_15
# {
.annotate 'line', 466
    concat $S1, $S1, 'E'
.annotate 'line', 467
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_18
    iseq $I3, $S2, '-'
  __label_18:
    unless $I3 goto __label_17
# {
.annotate 'line', 468
    concat $S1, $S1, $S2
.annotate 'line', 469
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_17: # endif
# for loop
  __label_21: # for condition
.const 'Sub' $P7 = 'WSubId_9'
.annotate 'line', 471
    $P1 = $P7($S2)
    if_null $P1, __label_20
    unless $P1 goto __label_20
.annotate 'line', 472
    concat $S1, $S1, $S2
  __label_19: # for iteration
.annotate 'line', 471
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_21
  __label_20: # for end
# }
  __label_15: # endif
.annotate 'line', 474
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 475
    new $P3, [ 'TokenFloat' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenFloat'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 478
    iseq $I3, $S2, 'e'
    if $I3 goto __label_24
    iseq $I3, $S2, 'E'
  __label_24:
    unless $I3 goto __label_22
# {
.annotate 'line', 479
    concat $S1, $S1, 'E'
.annotate 'line', 480
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    iseq $I3, $S2, '+'
    if $I3 goto __label_26
    iseq $I3, $S2, '-'
  __label_26:
    unless $I3 goto __label_25
# {
.annotate 'line', 481
    concat $S1, $S1, $S2
.annotate 'line', 482
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
# }
  __label_25: # endif
# for loop
  __label_29: # for condition
.const 'Sub' $P8 = 'WSubId_9'
.annotate 'line', 484
    $P1 = $P8($S2)
    if_null $P1, __label_28
    unless $P1 goto __label_28
.annotate 'line', 485
    concat $S1, $S1, $S2
  __label_27: # for iteration
.annotate 'line', 484
    $P3 = __ARG_1.'getchar'()
    set $S2, $P3
    goto __label_29
  __label_28: # for end
.annotate 'line', 486
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 487
    new $P3, [ 'TokenFloat' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenFloat'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
    goto __label_23
  __label_22: # else
# {
.annotate 'line', 490
    __ARG_1.'ungetchar'($S2)
.annotate 'line', 491
    new $P3, [ 'TokenInteger' ]
    getattribute $P5, __ARG_1, 'filename'
    $P3.'TokenInteger'($P5, __ARG_3, $S1)
    set $P1, $P3
    .return($P1)
# }
  __label_23: # endif
# }
  __label_11: # endif
# }
.annotate 'line', 494

.end # getnumber


.sub 'getlinecomment' :subid('WSubId_16')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 498
# s: $S1
    set $S1, __ARG_2
# for loop
.annotate 'line', 499
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
.annotate 'line', 500
    concat $S1, $S1, $S2
  __label_1: # for iteration
.annotate 'line', 499
    $P2 = __ARG_1.'getchar'()
    set $S2, $P2
    goto __label_3
  __label_2: # for end
.annotate 'line', 501
    new $P2, [ 'TokenComment' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenComment'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 502

.end # getlinecomment


.sub 'getcomment' :subid('WSubId_17')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 506
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 507
# c: $S2
    $P1 = __ARG_1.'getchar'()
    null $S2
    if_null $P1, __label_1
    set $S2, $P1
  __label_1:
  __label_2: # do
.annotate 'line', 508
# {
# for loop
  __label_7: # for condition
.annotate 'line', 509
    isne $I1, $S2, ''
    unless $I1 goto __label_8
    isne $I1, $S2, '*'
  __label_8:
    unless $I1 goto __label_6
.annotate 'line', 510
    concat $S1, $S1, $S2
  __label_5: # for iteration
.annotate 'line', 509
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
    goto __label_7
  __label_6: # for end
.annotate 'line', 511
    ne $S2, '', __label_9
.const 'Sub' $P2 = 'WSubId_7'
.annotate 'line', 512
    $P2("Unclosed comment", __ARG_1, __ARG_3)
  __label_9: # endif
.annotate 'line', 513
    concat $S1, $S1, $S2
.annotate 'line', 514
    $P1 = __ARG_1.'getchar'()
    set $S2, $P1
.annotate 'line', 515
    ne $S2, '', __label_10
.const 'Sub' $P3 = 'WSubId_7'
.annotate 'line', 516
    $P3("Unclosed comment", __ARG_1, __ARG_3)
  __label_10: # endif
# }
  __label_4: # continue
.annotate 'line', 517
    ne $S2, '/', __label_2
  __label_3: # enddo
.annotate 'line', 518
    concat $S1, $S1, '/'
.annotate 'line', 519
    new $P4, [ 'TokenComment' ]
    getattribute $P5, __ARG_1, 'filename'
    $P4.'TokenComment'($P5, __ARG_3, $S1)
    set $P1, $P4
    .return($P1)
# }
.annotate 'line', 520

.end # getcomment


.sub 'getop' :subid('WSubId_12')
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 524
# s: $S1
    set $S1, __ARG_2
.annotate 'line', 525
    new $P2, [ 'TokenOp' ]
    getattribute $P3, __ARG_1, 'filename'
    $P2.'TokenOp'($P3, __ARG_3, $S1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 526

.end # getop

.namespace [ 'Tokenizer' ]

.sub 'Tokenizer' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 542
.const 'Sub' $P2 = 'getop'
.const 'Sub' $P3 = 'getident'
.const 'Sub' $P4 = 'getquoted'
.const 'Sub' $P5 = 'getsinglequoted'
.const 'Sub' $P6 = 'getheredoc'
.const 'Sub' $P7 = 'getcomment'
.const 'Sub' $P8 = 'getlinecomment'
.annotate 'line', 546
    setattribute self, 'h', __ARG_1
.annotate 'line', 547
    box $P9, ''
    setattribute self, 'pending', $P9
.annotate 'line', 548
    root_new $P10, ['parrot';'ResizablePMCArray']
    setattribute self, 'stacked', $P10
.annotate 'line', 549
    box $P9, __ARG_2
    setattribute self, 'filename', $P9
.annotate 'line', 550
    box $P9, 1
    setattribute self, 'line', $P9
.annotate 'line', 551
# var select: $P1
    root_new $P1, ['parrot';'Hash']
.annotate 'line', 552
    root_new $P9, ['parrot';'Hash']
    $P9[''] = $P3
    $P9['{'] = $P2
    $P1['$'] = $P9
    $P1['"'] = $P4
    $P1["'"] = $P5
.annotate 'line', 555
    root_new $P10, ['parrot';'Hash']
.annotate 'line', 556
    root_new $P11, ['parrot';'Hash']
    $P11[''] = $P2
    $P11['='] = $P2
    $P10['='] = $P11
    $P10[':'] = $P2
    $P1['='] = $P10
.annotate 'line', 559
    root_new $P12, ['parrot';'Hash']
    $P12['+'] = $P2
    $P12['='] = $P2
    $P1['+'] = $P12
.annotate 'line', 560
    root_new $P13, ['parrot';'Hash']
    $P13['-'] = $P2
    $P13['='] = $P2
    $P1['-'] = $P13
.annotate 'line', 561
    root_new $P14, ['parrot';'Hash']
    $P14['='] = $P2
    $P1['*'] = $P14
.annotate 'line', 562
    root_new $P15, ['parrot';'Hash']
    $P15['|'] = $P2
    $P1['|'] = $P15
.annotate 'line', 563
    root_new $P16, ['parrot';'Hash']
    $P16['&'] = $P2
    $P1['&'] = $P16
.annotate 'line', 564
    root_new $P17, ['parrot';'Hash']
.annotate 'line', 565
    root_new $P18, ['parrot';'Hash']
    $P18[''] = $P2
    $P18[':'] = $P6
    $P17['<'] = $P18
    $P17['='] = $P2
    $P1['<'] = $P17
.annotate 'line', 568
    root_new $P19, ['parrot';'Hash']
    $P19['>'] = $P2
    $P19['='] = $P2
    $P1['>'] = $P19
.annotate 'line', 569
    root_new $P20, ['parrot';'Hash']
.annotate 'line', 570
    root_new $P21, ['parrot';'Hash']
    $P21[''] = $P2
    $P21['='] = $P2
    $P20['='] = $P21
    $P1['!'] = $P20
.annotate 'line', 572
    root_new $P22, ['parrot';'Hash']
    $P22['%'] = $P2
    $P22['='] = $P2
    $P1['%'] = $P22
.annotate 'line', 573
    root_new $P23, ['parrot';'Hash']
    $P23['='] = $P2
    $P23['/'] = $P8
    $P23['*'] = $P7
    $P1['/'] = $P23
    $P1['#'] = $P8
.annotate 'line', 576
    setattribute self, 'select', $P1
# }
.annotate 'line', 577

.end # Tokenizer


.sub 'getchar' :method
# Body
# {
.annotate 'line', 580
# var pending: $P1
    getattribute $P1, self, 'pending'
.annotate 'line', 581
# c: $S1
    set $P3, $P1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 582
    eq $S1, '', __label_2
.annotate 'line', 583
    assign $P1, ''
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 585
# var h: $P2
    getattribute $P2, self, 'h'
.annotate 'line', 586
    $P3 = $P2.'read'(1)
    set $S1, $P3
.annotate 'line', 587
    ne $S1, "\n", __label_4
.annotate 'line', 588
    getattribute $P3, self, 'line'
    inc $P3
  __label_4: # endif
# }
  __label_3: # endif
.annotate 'line', 590
    .return($S1)
# }
.annotate 'line', 591

.end # getchar


.sub 'ungetchar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 594
    getattribute $P1, self, 'pending'
    assign $P1, __ARG_1
# }
.annotate 'line', 595

.end # ungetchar


.sub 'get_token' :method
# Body
# {
.annotate 'line', 598
.const 'Sub' $P3 = 'isspace'
.const 'Sub' $P4 = 'isidentstart'
.const 'Sub' $P5 = 'isdigit'
.const 'Sub' $P6 = 'getop'
.const 'Sub' $P7 = 'getident'
.const 'Sub' $P8 = 'getnumber'
.annotate 'line', 601
    getattribute $P9, self, 'stacked'
    if_null $P9, __label_1
    unless $P9 goto __label_1
.annotate 'line', 602
    getattribute $P10, self, 'stacked'
    .tailcall $P10.'pop'()
  __label_1: # endif
.annotate 'line', 604
# c: $S1
    $P9 = self.'getchar'()
    null $S1
    if_null $P9, __label_2
    set $S1, $P9
  __label_2:
  __label_4: # while
.annotate 'line', 605
.const 'Sub' $P11 = 'WSubId_18'
    $P9 = $P11($S1)
    if_null $P9, __label_3
    unless $P9 goto __label_3
.annotate 'line', 606
    $P10 = self.'getchar'()
    set $S1, $P10
    goto __label_4
  __label_3: # endwhile
.annotate 'line', 607
# line: $I1
    getattribute $P9, self, 'line'
    set $I1, $P9
.annotate 'line', 608
    ne $S1, '', __label_5
.annotate 'line', 609
    new $P10, [ 'TokenEof' ]
    getattribute $P12, self, 'filename'
    $P10.'TokenEof'($P12)
    set $P9, $P10
    .return($P9)
  __label_5: # endif
.annotate 'line', 610
.const 'Sub' $P13 = 'WSubId_19'
    $P9 = $P13($S1)
    if_null $P9, __label_6
    unless $P9 goto __label_6
.annotate 'line', 611
.const 'Sub' $P14 = 'WSubId_11'
    .tailcall $P14(self, $S1, $I1)
  __label_6: # endif
.annotate 'line', 612
.const 'Sub' $P15 = 'WSubId_9'
    $P9 = $P15($S1)
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 613
.const 'Sub' $P16 = 'WSubId_20'
    .tailcall $P16(self, $S1, $I1)
  __label_7: # endif
.annotate 'line', 615
# op: $S2
    set $S2, $S1
.annotate 'line', 616
# var select: $P1
    getattribute $P1, self, 'select'
.annotate 'line', 617
# var current: $P2
    $P2 = $P1[$S1]
  __label_9: # while
.annotate 'line', 619
    isnull $I2, $P2
    not $I2
    unless $I2 goto __label_10
    isa $I2, $P2, 'Hash'
  __label_10:
    unless $I2 goto __label_8
# {
.annotate 'line', 620
    $P9 = self.'getchar'()
    set $S1, $P9
.annotate 'line', 621
    set $P1, $P2
.annotate 'line', 622
    $P2 = $P1[$S1]
.annotate 'line', 623
    unless_null $P2, __label_11
# {
.annotate 'line', 624
    self.'ungetchar'($S1)
.annotate 'line', 625
    $P2 = $P1['']
# }
    goto __label_12
  __label_11: # else
.annotate 'line', 628
    concat $S2, $S2, $S1
  __label_12: # endif
# }
    goto __label_9
  __label_8: # endwhile
.annotate 'line', 630
    if_null $P2, __label_13
    unless $P2 goto __label_13
.annotate 'line', 631
    .tailcall $P2(self, $S2, $I1)
  __label_13: # endif
.annotate 'line', 632
.const 'Sub' $P17 = 'WSubId_12'
    .tailcall $P17(self, $S2, $I1)
# }
.annotate 'line', 633

.end # get_token


.sub 'get' :method
        .param int __ARG_1 :optional
# Body
# {
.annotate 'line', 636
# var t: $P1
    $P1 = self.'get_token'()
  __label_2: # while
.annotate 'line', 637
    $P2 = $P1.'iseof'()
    isfalse $I1, $P2
    unless $I1 goto __label_4
    not $I1, __ARG_1
  __label_4:
    unless $I1 goto __label_3
    $I1 = $P1.'iscomment'()
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 638
    $P1 = self.'get_token'()
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 639
    .return($P1)
# }
.annotate 'line', 640

.end # get


.sub 'unget' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 643
    getattribute $P1, self, 'stacked'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 644

.end # unget

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Tokenizer' ]
.annotate 'line', 534
    addattribute $P0, 'h'
.annotate 'line', 535
    addattribute $P0, 'pending'
.annotate 'line', 536
    addattribute $P0, 'select'
.annotate 'line', 537
    addattribute $P0, 'stacked'
.annotate 'line', 538
    addattribute $P0, 'filename'
.annotate 'line', 539
    addattribute $P0, 'line'
.end
.namespace [ ]
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
.annotate 'line', 665
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
.annotate 'line', 666
    .return('I')
  __label_4: # case
.annotate 'line', 667
    .return('N')
  __label_5: # case
.annotate 'line', 668
    .return('S')
  __label_6: # case
.annotate 'line', 669
    .return('P')
  __label_2: # default
.annotate 'line', 670
    .return('')
  __label_1: # switch end
# }
.annotate 'line', 672

.end # typetoregcheck


.sub 'typetopirname' :subid('WSubId_104')
        .param string __ARG_1
# Body
# {
# switch
.annotate 'line', 676
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
.annotate 'line', 677
    .return('int')
  __label_4: # case
.annotate 'line', 678
    .return('num')
  __label_5: # case
.annotate 'line', 679
    .return('string')
  __label_6: # case
.annotate 'line', 680
    .return('pmc')
  __label_2: # default
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 681
    $P1('Invalid reg type')
  __label_1: # switch end
# }
.annotate 'line', 683

.end # typetopirname

# Constant INDENT evaluated at compile time
# Constant INDENTLABEL evaluated at compile time
.namespace [ 'Emit' ]

.sub 'Emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 703
    setattribute self, 'handle', __ARG_1
.annotate 'line', 704
    box $P1, ''
    setattribute self, 'file', $P1
.annotate 'line', 705
    box $P1, 0
    setattribute self, 'line', $P1
.annotate 'line', 706
    box $P1, 0
    setattribute self, 'pendingf', $P1
.annotate 'line', 707
    box $P1, 0
    setattribute self, 'pendingl', $P1
# }
.annotate 'line', 708

.end # Emit


.sub 'disable_annotations' :method
# Body
# {
.annotate 'line', 711
    box $P1, 1
    setattribute self, 'noan', $P1
# }
.annotate 'line', 712

.end # disable_annotations


.sub 'close' :method
# Body
# {
.annotate 'line', 715
    null $P1
    setattribute self, 'handle', $P1
# }
.annotate 'line', 716

.end # close


.sub 'updateannot' :method
# Body
# {
.annotate 'line', 719
    getattribute $P1, self, 'pendingf'
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 720
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'file', '"
    push $P3, $P4
.annotate 'line', 722
    getattribute $P5, self, 'file'
.annotate 'line', 720
    push $P3, $P5
    box $P4, "'\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 725
    getattribute $P1, self, 'pendingf'
    assign $P1, 0
# }
  __label_1: # endif
.annotate 'line', 727
    getattribute $P1, self, 'pendingl'
    if_null $P1, __label_2
    unless $P1 goto __label_2
# {
.annotate 'line', 728
    getattribute $P2, self, 'handle'
    root_new $P3, ['parrot';'ResizablePMCArray']
    box $P4, ".annotate 'line', "
    push $P3, $P4
.annotate 'line', 730
    getattribute $P5, self, 'line'
.annotate 'line', 728
    push $P3, $P5
    box $P4, "\n"
    push $P3, $P4
# predefined join
    join $S1, "", $P3
    $P2.'print'($S1)
.annotate 'line', 733
    getattribute $P1, self, 'pendingl'
    assign $P1, 0
# }
  __label_2: # endif
# }
.annotate 'line', 735

.end # updateannot


.sub 'vprint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 738
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 739
    getattribute $P3, self, 'handle'
    $P3.'print'($P1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 740

.end # vprint


.sub 'print' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 743
    self.'updateannot'()
.annotate 'line', 744
    self.'vprint'(__ARG_1)
# }
.annotate 'line', 745

.end # print


.sub 'say' :method
        .param pmc __ARG_1 :slurpy
# Body
# {
.annotate 'line', 748
    self.'updateannot'()
.annotate 'line', 749
    self.'vprint'(__ARG_1)
.annotate 'line', 750
    getattribute $P1, self, 'handle'
    $P1.'print'("\n")
# }
.annotate 'line', 751

.end # say


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 754
    getattribute $P3, self, 'noan'
    unless_null $P3, __label_1
# {
.annotate 'line', 756
# var file: $P1
    getattribute $P1, self, 'file'
.annotate 'line', 757
# var line: $P2
    getattribute $P2, self, 'line'
.annotate 'line', 758
# tfile: $S1
    getattribute $P3, __ARG_1, 'file'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 759
# tline: $I1
    getattribute $P3, __ARG_1, 'line'
    set $I1, $P3
.annotate 'line', 760
    set $S2, $P1
    eq $S2, $S1, __label_3
# {
.annotate 'line', 761
    assign $P1, $S1
.annotate 'line', 762
    getattribute $P3, self, 'pendingf'
    assign $P3, 1
.annotate 'line', 763
    assign $P2, 0
# }
  __label_3: # endif
.annotate 'line', 765
    set $I2, $P2
    eq $I2, $I1, __label_4
# {
.annotate 'line', 766
    assign $P2, $I1
.annotate 'line', 767
    getattribute $P3, self, 'pendingl'
    assign $P3, 1
# }
  __label_4: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 770

.end # annotate


.sub 'comment' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 773
    self.'updateannot'()
.annotate 'line', 774
    getattribute $P1, self, 'handle'
    concat $S1, '# ', __ARG_1
    concat $S1, $S1, "\n"
    $P1.'print'($S1)
# }
.annotate 'line', 775

.end # comment


.sub 'emitlabel' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 778
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 779
    $P1.'print'('  ')
.annotate 'line', 780
    $P1.'print'(__ARG_1)
.annotate 'line', 781
    $P1.'print'(':')
.annotate 'line', 782
    if_null __ARG_2, __label_1
.annotate 'line', 783
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 784
    $P1.'print'("\n")
# }
.annotate 'line', 785

.end # emitlabel


.sub 'emitgoto' :method
        .param string __ARG_1
        .param string __ARG_2 :optional
# Body
# {
.annotate 'line', 788
# var handle: $P1
    getattribute $P1, self, 'handle'
.annotate 'line', 789
    $P1.'print'('    goto ')
.annotate 'line', 790
    $P1.'print'(__ARG_1)
.annotate 'line', 791
    if_null __ARG_2, __label_1
.annotate 'line', 792
    concat $S1, ' # ', __ARG_2
    $P1.'print'($S1)
  __label_1: # endif
.annotate 'line', 793
    $P1.'print'("\n")
# }
.annotate 'line', 794

.end # emitgoto


.sub 'emitarg1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 798
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    self.'say'($S1)
# }
.annotate 'line', 799

.end # emitarg1


.sub 'emitarg2' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 802
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    self.'say'($S1)
# }
.annotate 'line', 803

.end # emitarg2


.sub 'emitcompare' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 806
    concat $S1, '    ', __ARG_1
    concat $S1, $S1, ' '
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_3
    concat $S1, $S1, ', '
    concat $S1, $S1, __ARG_4
    self.'say'($S1)
# }
.annotate 'line', 807

.end # emitcompare


.sub 'emitif' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 810
    self.'say'('    if ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 811

.end # emitif


.sub 'emitunless' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 814
    self.'say'('    unless ', __ARG_1, ' goto ', __ARG_2)
# }
.annotate 'line', 815

.end # emitunless


.sub 'emitif_null' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 818
    self.'say'('    if_null ', __ARG_1, ', ', __ARG_2)
# }
.annotate 'line', 819

.end # emitif_null


.sub 'emitnull' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 822
    self.'say'("    null ", __ARG_1)
# }
.annotate 'line', 823

.end # emitnull


.sub 'emitinc' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 827
    self.'say'('    inc ', __ARG_1)
# }
.annotate 'line', 828

.end # emitinc


.sub 'emitdec' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 831
    self.'say'('    dec ', __ARG_1)
# }
.annotate 'line', 832

.end # emitdec


.sub 'emitset' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 835
    self.'say'("    set ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 836

.end # emitset


.sub 'emitassign' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 839
    self.'say'("    assign ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 840

.end # emitassign


.sub 'emitbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 843
    self.'say'("    box ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 844

.end # emitbox


.sub 'emitunbox' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 847
    self.'say'("    unbox ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 848

.end # emitunbox


.sub 'emitbinop' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 851
    self.'say'('    ', __ARG_1, " ", __ARG_2, ", ", __ARG_3, ", ", __ARG_4)
# }
.annotate 'line', 852

.end # emitbinop


.sub 'emitaddto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 855
    self.'say'("    add ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 856

.end # emitaddto


.sub 'emitsubto' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 859
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 860

.end # emitsubto


.sub 'emitadd' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 863
    self.'say'("    add ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 864

.end # emitadd


.sub 'emitsub' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 867
    self.'say'("    sub ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 868

.end # emitsub


.sub 'emitmul' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 871
    self.'say'("    mul ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 872

.end # emitmul


.sub 'emitdiv' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 875
    self.'say'("    div ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 876

.end # emitdiv


.sub 'emitconcat1' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 879
    self.'say'("    concat ", __ARG_1, ", ", __ARG_1, ", ", __ARG_2)
# }
.annotate 'line', 880

.end # emitconcat1


.sub 'emitconcat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 883
    self.'say'("    concat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 884

.end # emitconcat


.sub 'emitrepeat' :method
        .param string __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 887
    self.'say'("    repeat ", __ARG_1, ", ", __ARG_2, ", ", __ARG_3)
# }
.annotate 'line', 888

.end # emitrepeat


.sub 'emitprint' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 891
    self.'say'('    print ', __ARG_1)
# }
.annotate 'line', 892

.end # emitprint


.sub 'emitsay' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 895
    self.'say'('    say ', __ARG_1)
# }
.annotate 'line', 896

.end # emitsay


.sub 'emitfind_lex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 899
    concat $S1, "    find_lex ", __ARG_1
    concat $S1, $S1, ", '"
    concat $S1, $S1, __ARG_2
    concat $S1, $S1, "'"
    self.'say'($S1)
# }
.annotate 'line', 900

.end # emitfind_lex

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Emit' ]
.annotate 'line', 694
    addattribute $P0, 'handle'
.annotate 'line', 695
    addattribute $P0, 'file'
.annotate 'line', 696
    addattribute $P0, 'line'
.annotate 'line', 697
    addattribute $P0, 'pendingf'
.annotate 'line', 698
    addattribute $P0, 'pendingl'
.annotate 'line', 699
    addattribute $P0, 'noan'
.end
.namespace [ ]

.sub 'integerValue' :subid('WSubId_21')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 909
    new $P2, [ 'IntegerLiteral' ]
    $P2.'IntegerLiteral'(__ARG_1, __ARG_2, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 910

.end # integerValue


.sub 'floatValue' :subid('WSubId_61')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param num __ARG_3
# Body
# {
.annotate 'line', 914
# var t: $P1
    new $P1, [ 'TokenFloat' ]
    getattribute $P2, __ARG_2, 'file'
    getattribute $P3, __ARG_2, 'line'
    $P1.'TokenFloat'($P2, $P3, __ARG_3)
.annotate 'line', 915
    new $P3, [ 'FloatLiteral' ]
    $P3.'FloatLiteral'(__ARG_1, $P1)
    set $P2, $P3
    .return($P2)
# }
.annotate 'line', 916

.end # floatValue


.sub 'floatresult' :subid('WSubId_62')
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 924
# result: $I1
    iseq $I1, __ARG_1, 'N'
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 'N'
    if $I1 goto __label_3
    iseq $I1, __ARG_2, 'I'
  __label_3:
  __label_2:
    if $I1 goto __label_1
.annotate 'line', 925
    iseq $I1, __ARG_2, 'N'
    unless $I1 goto __label_4
    iseq $I1, __ARG_1, 'N'
    if $I1 goto __label_5
    iseq $I1, __ARG_1, 'I'
  __label_5:
  __label_4:
  __label_1:
.annotate 'line', 926
    .return($I1)
# }
.annotate 'line', 927

.end # floatresult

# Constant NULL evaluated at compile time
# Constant SELF evaluated at compile time
# Constant VAR_is_volatile evaluated at compile time
# Constant VAR_is_lexical evaluated at compile time
# Constant VAR_is_extern evaluated at compile time
# Constant __DEBUG_PREDEFS evaluated at compile time
# Constant PREDEF_arglist evaluated at compile time
# Constant PREDEF_raw1 evaluated at compile time
.namespace [ 'Predef_frombody' ]

.sub 'Predef_frombody' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 964
# l: $I2
# predefined length
    length $I3, __ARG_2
    sub $I2, $I3, 1
.annotate 'line', 965
# predefined substr
    substr $S1, __ARG_2, $I2, 1
    ne $S1, "\n", __label_1
.annotate 'line', 966
# predefined substr
    substr __ARG_2, __ARG_2, 0, $I2
  __label_1: # endif
.annotate 'line', 967
# predefined split
    split $P1, "\n", __ARG_2
# predefined join
    join $S1, "\n    ", $P1
    concat $S0, '    ', $S1
    set __ARG_2, $S0
.annotate 'line', 968
    box $P1, __ARG_2
    setattribute self, 'body', $P1
.annotate 'line', 969
    box $P1, __ARG_1
    setattribute self, 'typeresult', $P1
# }
.annotate 'line', 970

.end # Predef_frombody


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 973
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 975
    ne $S1, 'v', __label_2
# {
.annotate 'line', 976
    isnull $I1, __ARG_3
    not $I1
    unless $I1 goto __label_5
    isne $I1, __ARG_3, ''
  __label_5:
    unless $I1 goto __label_4
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 977
    $P3('using return value from void predef')
  __label_4: # endif
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 980
    isnull $I1, __ARG_3
    if $I1 goto __label_7
    iseq $I1, __ARG_3, ''
  __label_7:
    unless $I1 goto __label_6
.const 'Sub' $P4 = 'WSubId_6'
.annotate 'line', 981
    $P4('Bad result in non void predef')
  __label_6: # endif
# }
  __label_3: # endif
.annotate 'line', 984
# var builder: $P1
    new $P1, [ 'StringBuilder' ]
.annotate 'line', 985
    getattribute $P2, self, 'body'
    $P1.'append_format'($P2, __ARG_3, __ARG_4 :flat)
.annotate 'line', 986
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 987
# predefined string
    set $S2, $P1
    __ARG_1.'say'($S2)
# }
.annotate 'line', 988

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_frombody' ]
.annotate 'line', 950
    addattribute $P0, 'body'
.annotate 'line', 951
    addattribute $P0, 'typeresult'
.end
.namespace [ 'PredefBase' ]

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
.annotate 'line', 1009
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1010
    isa $I2, __ARG_2, 'String'
    unless $I2 goto __label_1
.annotate 'line', 1011
    new $P3, [ 'Predef_frombody' ]
    $P3.'Predef_frombody'(__ARG_3, __ARG_2)
    set $P2, $P3
    setattribute self, 'body', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 1013
    setattribute self, 'body', __ARG_2
  __label_2: # endif
.annotate 'line', 1014
    box $P1, __ARG_3
    setattribute self, 'typeresult', $P1
.annotate 'line', 1015
# n: $I1
    null $I1
.annotate 'line', 1016
    if_null __ARG_4, __label_3
# {
.annotate 'line', 1017
    box $P1, __ARG_4
    setattribute self, 'type0', $P1
# switch
.annotate 'line', 1018
    set $S1, __ARG_4
    set $S2, '*'
    if $S1 == $S2 goto __label_6
    set $S2, '!'
    if $S1 == $S2 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 1020
    set $I1, -1
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 1023
    set $I1, -2
.annotate 'line', 1024
    if_null __ARG_5, __label_8
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 1025
    concat $S3, "Invalid predef '", __ARG_1
    concat $S3, $S3, '"'
    $P5($S3)
  __label_8: # endif
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1028
    set $I1, 1
.annotate 'line', 1029
    if_null __ARG_5, __label_9
# {
.annotate 'line', 1030
    box $P1, __ARG_5
    setattribute self, 'type1', $P1
.annotate 'line', 1031
    inc $I1
# }
  __label_9: # endif
.annotate 'line', 1033
    if_null __ARG_6, __label_10
# {
.annotate 'line', 1034
    box $P1, __ARG_6
    setattribute self, 'type2', $P1
.annotate 'line', 1035
    inc $I1
# }
  __label_10: # endif
.annotate 'line', 1037
    if_null __ARG_7, __label_11
# {
.annotate 'line', 1038
    box $P1, __ARG_7
    setattribute self, 'type3', $P1
.annotate 'line', 1039
    inc $I1
# }
  __label_11: # endif
  __label_4: # switch end
# }
  __label_3: # endif
.annotate 'line', 1043
    box $P1, $I1
    setattribute self, 'nparams', $P1
# }
.annotate 'line', 1044

.end # PredefBase


.sub 'name' :method
# Body
# {
.annotate 'line', 1047
# name: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 1048
    .return($S1)
# }
.annotate 'line', 1049

.end # name


.sub 'result' :method
# Body
# {
.annotate 'line', 1052
    getattribute $P1, self, 'typeresult'
    .return($P1)
# }
.annotate 'line', 1053

.end # result


.sub 'params' :method
# Body
# {
.annotate 'line', 1054
    getattribute $P1, self, 'nparams'
    .return($P1)
# }

.end # params


.sub 'paramtype' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1057
# type: $S1
    null $S1
# switch
.annotate 'line', 1058
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
.annotate 'line', 1059
    getattribute $P1, self, 'type0'
    set $S1, $P1
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 1060
    getattribute $P2, self, 'type1'
    set $S1, $P2
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 1061
    getattribute $P3, self, 'type2'
    set $S1, $P3
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 1062
    getattribute $P4, self, 'type3'
    set $S1, $P4
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P5 = 'WSubId_6'
.annotate 'line', 1064
    $P5('Invalid predef arg')
  __label_1: # switch end
.annotate 'line', 1066
    .return($S1)
# }
.annotate 'line', 1067

.end # paramtype


.sub 'expand' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 1070
# predefined string
    getattribute $P2, self, 'name'
    set $S2, $P2
    concat $S3, 'predefined ', $S2
    __ARG_1.'comment'($S3)
.annotate 'line', 1071
# typeresult: $S1
    getattribute $P2, self, 'typeresult'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1072
    isne $I1, $S1, 'v'
    unless $I1 goto __label_3
    iseq $I1, __ARG_4, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 1073
    $P2 = __ARG_2.'tempreg'($S1)
    set __ARG_4, $P2
  __label_2: # endif
.annotate 'line', 1074
# var fun: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 1075
    $P1(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
# }
.annotate 'line', 1076

.end # expand

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefBase' ]
.annotate 'line', 993
    addattribute $P0, 'name'
.annotate 'line', 994
    addattribute $P0, 'body'
.annotate 'line', 995
    addattribute $P0, 'typeresult'
.annotate 'line', 996
    addattribute $P0, 'type0'
.annotate 'line', 997
    addattribute $P0, 'type1'
.annotate 'line', 998
    addattribute $P0, 'type2'
.annotate 'line', 999
    addattribute $P0, 'type3'
.annotate 'line', 1000
    addattribute $P0, 'nparams'
.end
.namespace [ 'PredefFunction' ]

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
.annotate 'line', 1088
    self.'PredefBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7)
# }
.annotate 'line', 1089

.end # PredefFunction

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunction' ]
.annotate 'line', 1079
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.end
.namespace [ 'PredefFunctionEval' ]

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
.annotate 'line', 1102
    self.'PredefBase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5, __ARG_6, __ARG_7, __ARG_8)
.annotate 'line', 1103
    setattribute self, 'evalfun', __ARG_2
# }
.annotate 'line', 1104

.end # PredefFunctionEval

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PredefFunctionEval' ]
.annotate 'line', 1092
    get_class $P1, [ 'PredefBase' ]
    addparent $P0, $P1
.annotate 'line', 1094
    addattribute $P0, 'evalfun'
.end
.namespace [ 'Predef_typecast' ]

.sub 'Predef_typecast' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1112
    box $P1, __ARG_1
    setattribute self, 'type', $P1
# }
.annotate 'line', 1113

.end # Predef_typecast


.sub 'invoke' :method :vtable
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1116
# type: $S1
    getattribute $P2, self, 'type'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1117
# predefined elements
    elements $I1, __ARG_4
    eq $I1, 1, __label_2
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 1118
    $P3("Invalid Predef_typecast.invoke call")
  __label_2: # endif
.annotate 'line', 1119
# var rawarg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1120
# argtype: $S2
    $P2 = $P1.'checkresult'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
# switch-case
.annotate 'line', 1122
    iseq $I1, $S2, $S1
    if $I1 goto __label_6
.annotate 'line', 1123
    isa $I1, $P1, [ 'IndexExpr' ]
    if $I1 goto __label_7
    goto __label_5
  __label_6: # case
  __label_7: # case
.annotate 'line', 1124
    $P1.'emit'(__ARG_1, __ARG_3)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 1127
# arg: $S3
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_8
    set $S3, $P2
  __label_8:
.annotate 'line', 1128
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1130
    ne $S3, 'null', __label_9
.annotate 'line', 1131
    __ARG_1.'emitnull'(__ARG_3)
    goto __label_10
  __label_9: # else
.annotate 'line', 1133
    __ARG_1.'emitset'(__ARG_3, $S3)
  __label_10: # endif
  __label_4: # switch end
# }
.annotate 'line', 1135

.end # invoke

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Predef_typecast' ]
.annotate 'line', 1109
    addattribute $P0, 'type'
.end
.namespace [ ]

.sub 'Predef_say' :subid('WSubId_32')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1140
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1141
# n: $I1
# predefined elements
    elements $I3, __ARG_4
    sub $I1, $I3, 1
.annotate 'line', 1142
    lt $I1, 0, __label_1
# {
# for loop
.annotate 'line', 1143
# i: $I2
    null $I2
  __label_5: # for condition
    ge $I2, $I1, __label_4
.annotate 'line', 1144
    $P1 = __ARG_4[$I2]
    __ARG_1.'emitprint'($P1)
  __label_3: # for iteration
.annotate 'line', 1143
    inc $I2
    goto __label_5
  __label_4: # for end
.annotate 'line', 1145
    $P1 = __ARG_4[$I1]
    __ARG_1.'emitsay'($P1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 1148
    __ARG_1.'emitsay'("''")
  __label_2: # endif
# }
.annotate 'line', 1149

.end # Predef_say


.sub 'Predef_cry' :subid('WSubId_33')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1153
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1154
    __ARG_1.'say'('    ', "getstderr $P0")
.annotate 'line', 1155
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1156
    __ARG_1.'say'('    ', "print $P0, ", $S1)
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1157
    __ARG_1.'say'('    ', "print $P0, \"\\n\"")
# }
.annotate 'line', 1158

.end # Predef_cry


.sub 'Predef_print' :subid('WSubId_31')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1162
    __ARG_1.'annotate'(__ARG_2)
.annotate 'line', 1163
    iter $P1, __ARG_4
    set $P1, 0
  __label_1: # for iteration
    unless $P1 goto __label_2
    shift $S1, $P1
.annotate 'line', 1164
    __ARG_1.'emitprint'($S1)
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 1165

.end # Predef_print


.sub 'Predef_invoke' :subid('WSubId_34')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 1171
# var arg: $P1
    $P1 = __ARG_4[0]
.annotate 'line', 1172
    isa $I2, $P1, [ 'CallExpr' ]
    not $I1, $I2
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 1173
    $P2("invoke argument must be callable", __ARG_2)
  __label_1: # endif
.annotate 'line', 1174
    concat $S1, "(", __ARG_3
    concat $S1, $S1, " :call_sig)"
    $P1.'emit'(__ARG_1, $S1)
# }
.annotate 'line', 1175

.end # Predef_invoke


.sub 'predefeval_length' :subid('WSubId_22')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1179
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1180
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1181
.const 'Sub' $P3 = 'WSubId_21'
# predefined length
.annotate 'line', 1178
    length $I1, $S1
.annotate 'line', 1181
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1182

.end # predefeval_length


.sub 'predefeval_bytelength' :subid('WSubId_23')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1186
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1187
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1188
.const 'Sub' $P3 = 'WSubId_21'
# predefined bytelength
.annotate 'line', 1185
    bytelength $I1, $S1
.annotate 'line', 1188
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1189

.end # predefeval_bytelength


.sub 'predefeval_ord' :subid('WSubId_25')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1193
# var arg: $P1
    $P2 = __ARG_3[0]
    getattribute $P1, $P2, 'arg'
.annotate 'line', 1194
# s: $S1
    $P2 = $P1.'get_value'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 1195
.const 'Sub' $P3 = 'WSubId_21'
# predefined ord
.annotate 'line', 1192
    ord $I1, $S1
.annotate 'line', 1195
    .tailcall $P3(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1196

.end # predefeval_ord


.sub 'predefeval_ord_n' :subid('WSubId_26')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1200
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1201
# s: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1202
# var argn: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1203
# n: $I1
    getattribute $P3, $P2, 'numval'
    set $I1, $P3
.annotate 'line', 1204
.const 'Sub' $P4 = 'WSubId_21'
# predefined ord
.annotate 'line', 1199
    ord $I2, $S1, $I1
.annotate 'line', 1204
    .tailcall $P4(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1205

.end # predefeval_ord_n


.sub 'predefeval_chr' :subid('WSubId_24')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1209
# var arg: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1211
# n: $I1
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 1212
# s: $S1
# predefined chr
    chr $S0, $I1
    find_encoding $I0, 'utf8'
    trans_encoding $S1, $S0, $I0
.annotate 'line', 1214
# var t: $P2
    new $P2, [ 'TokenQuoted' ]
    getattribute $P3, __ARG_2, 'file'
    getattribute $P4, __ARG_2, 'line'
    $P2.'TokenQuoted'($P3, $P4, $S1)
.annotate 'line', 1215
    new $P4, [ 'StringLiteral' ]
    $P4.'StringLiteral'(__ARG_1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1216

.end # predefeval_chr


.sub 'predefeval_substr' :subid('WSubId_27')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1220
# var argstr: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1221
# var argpos: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1222
# str: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1223
# pos: $I1
    getattribute $P4, $P2, 'numval'
    set $I1, $P4
.annotate 'line', 1225
# var t: $P3
    new $P3, [ 'TokenQuoted' ]
    getattribute $P4, __ARG_2, 'file'
    getattribute $P5, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1
    $P3.'TokenQuoted'($P4, $P5, $S2)
.annotate 'line', 1226
    new $P5, [ 'StringLiteral' ]
    $P5.'StringLiteral'(__ARG_1, $P3)
    set $P4, $P5
    .return($P4)
# }
.annotate 'line', 1227

.end # predefeval_substr


.sub 'predefeval_substr_l' :subid('WSubId_28')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1231
# var argstr: $P1
    $P5 = __ARG_3[0]
    getattribute $P1, $P5, 'arg'
.annotate 'line', 1232
# var argpos: $P2
    $P5 = __ARG_3[1]
    getattribute $P2, $P5, 'arg'
.annotate 'line', 1233
# var arglen: $P3
    $P5 = __ARG_3[2]
    getattribute $P3, $P5, 'arg'
.annotate 'line', 1234
# str: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 1235
# pos: $I1
    getattribute $P5, $P2, 'numval'
    set $I1, $P5
.annotate 'line', 1236
# len: $I2
    getattribute $P5, $P3, 'numval'
    set $I2, $P5
.annotate 'line', 1238
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P5, __ARG_2, 'file'
    getattribute $P6, __ARG_2, 'line'
# predefined substr
    substr $S2, $S1, $I1, $I2
    $P4.'TokenQuoted'($P5, $P6, $S2)
.annotate 'line', 1239
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_1, $P4)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 1240

.end # predefeval_substr_l


.sub 'predefeval_indexof' :subid('WSubId_29')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1244
# var argstrfrom: $P1
    $P3 = __ARG_3[0]
    getattribute $P1, $P3, 'arg'
.annotate 'line', 1245
# var argstrsearch: $P2
    $P3 = __ARG_3[1]
    getattribute $P2, $P3, 'arg'
.annotate 'line', 1246
# strfrom: $S1
    $P3 = $P1.'get_value'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1247
# strsearch: $S2
    $P3 = $P2.'get_value'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 1248
.const 'Sub' $P4 = 'WSubId_21'
# predefined indexof
.annotate 'line', 1243
    index $I1, $S1, $S2
.annotate 'line', 1248
    .tailcall $P4(__ARG_1, __ARG_2, $I1)
# }
.annotate 'line', 1249

.end # predefeval_indexof


.sub 'predefeval_indexof_pos' :subid('WSubId_30')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1253
# var argstrfrom: $P1
    $P4 = __ARG_3[0]
    getattribute $P1, $P4, 'arg'
.annotate 'line', 1254
# var argstrsearch: $P2
    $P4 = __ARG_3[1]
    getattribute $P2, $P4, 'arg'
.annotate 'line', 1255
# var argpos: $P3
    $P4 = __ARG_3[2]
    getattribute $P3, $P4, 'arg'
.annotate 'line', 1256
# strfrom: $S1
    $P4 = $P1.'get_value'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 1257
# strsearch: $S2
    $P4 = $P2.'get_value'()
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 1258
# pos: $I1
    getattribute $P4, $P3, 'numval'
    set $I1, $P4
.annotate 'line', 1259
.const 'Sub' $P5 = 'WSubId_21'
# predefined indexof
.annotate 'line', 1252
    index $I2, $S1, $S2, $I1
.annotate 'line', 1259
    .tailcall $P5(__ARG_1, __ARG_2, $I2)
# }
.annotate 'line', 1260

.end # predefeval_indexof_pos


.sub 'getpredefs' :subid('WSubId_35')
# Body
# {
.const 'Sub' $P2 = "WSubId_22"
.const 'Sub' $P3 = "WSubId_23"
.const 'Sub' $P4 = "WSubId_24"
.const 'Sub' $P5 = "WSubId_25"
.const 'Sub' $P6 = "WSubId_26"
.const 'Sub' $P7 = "WSubId_27"
.const 'Sub' $P8 = "WSubId_28"
.const 'Sub' $P9 = "WSubId_29"
.const 'Sub' $P10 = "WSubId_30"
.annotate 'line', 1273
.const 'Sub' $P11 = 'Predef_print'
.const 'Sub' $P12 = 'Predef_say'
.const 'Sub' $P13 = 'Predef_cry'
.const 'Sub' $P14 = 'Predef_invoke'
.annotate 'line', 1275
# var predefs: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1276
    new $P17, [ 'PredefFunction' ]
.annotate 'line', 1277
    new $P19, [ 'Predef_typecast' ]
    $P19.'Predef_typecast'('I')
    set $P18, $P19
    $P17.'PredefFunction'('int', $P18, 'I', '!')
    set $P16, $P17
.annotate 'line', 1275
    push $P1, $P16
.annotate 'line', 1280
    new $P21, [ 'PredefFunction' ]
.annotate 'line', 1281
    new $P23, [ 'Predef_typecast' ]
    $P23.'Predef_typecast'('N')
    set $P22, $P23
    $P21.'PredefFunction'('float', $P22, 'N', '!')
    set $P20, $P21
.annotate 'line', 1275
    push $P1, $P20
.annotate 'line', 1284
    new $P25, [ 'PredefFunction' ]
.annotate 'line', 1285
    new $P27, [ 'Predef_typecast' ]
    $P27.'Predef_typecast'('S')
    set $P26, $P27
    $P25.'PredefFunction'('string', $P26, 'S', '!')
    set $P24, $P25
.annotate 'line', 1275
    push $P1, $P24
.annotate 'line', 1288
    new $P29, [ 'PredefFunction' ]
    $P29.'PredefFunction'('die', 'die %1', 'v', 'S')
    set $P28, $P29
.annotate 'line', 1275
    push $P1, $P28
.annotate 'line', 1292
    new $P31, [ 'PredefFunction' ]
    $P31.'PredefFunction'('exit', 'exit %1', 'v', 'I')
    set $P30, $P31
.annotate 'line', 1275
    push $P1, $P30
.annotate 'line', 1296
    new $P33, [ 'PredefFunction' ]
    $P33.'PredefFunction'('time', 'time %0', 'I')
    set $P32, $P33
.annotate 'line', 1275
    push $P1, $P32
.annotate 'line', 1300
    new $P35, [ 'PredefFunction' ]
    $P35.'PredefFunction'('floattime', 'time %0', 'N')
    set $P34, $P35
.annotate 'line', 1275
    push $P1, $P34
.annotate 'line', 1304
    new $P37, [ 'PredefFunction' ]
    $P37.'PredefFunction'('spawnw', 'spawnw %0, %1', 'I', 'P')
    set $P36, $P37
.annotate 'line', 1275
    push $P1, $P36
.annotate 'line', 1308
    new $P39, [ 'PredefFunction' ]
    $P39.'PredefFunction'('getstdin', 'getstdin %0', 'P')
    set $P38, $P39
.annotate 'line', 1275
    push $P1, $P38
.annotate 'line', 1312
    new $P41, [ 'PredefFunction' ]
    $P41.'PredefFunction'('getstdout', 'getstdout %0', 'P')
    set $P40, $P41
.annotate 'line', 1275
    push $P1, $P40
.annotate 'line', 1316
    new $P43, [ 'PredefFunction' ]
    $P43.'PredefFunction'('getstderr', 'getstderr %0', 'P')
    set $P42, $P43
.annotate 'line', 1275
    push $P1, $P42
.annotate 'line', 1320
    new $P45, [ 'PredefFunction' ]
    $P45.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1)\n", 'P', 'S')
    set $P44, $P45
.annotate 'line', 1275
    push $P1, $P44
.annotate 'line', 1327
    new $P47, [ 'PredefFunction' ]
    $P47.'PredefFunction'('open', "root_new %0, ['parrot';'FileHandle']\n%0.'open'(%1,%2)\n", 'P', 'S', 'S')
    set $P46, $P47
.annotate 'line', 1275
    push $P1, $P46
.annotate 'line', 1334
    new $P49, [ 'PredefFunction' ]
    $P49.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n", 'P', 'S')
    set $P48, $P49
.annotate 'line', 1275
    push $P1, $P48
.annotate 'line', 1341
    new $P51, [ 'PredefFunction' ]
    $P51.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n", 'P', 'S', 'I')
    set $P50, $P51
.annotate 'line', 1275
    push $P1, $P50
.annotate 'line', 1349
    new $P53, [ 'PredefFunction' ]
    $P53.'PredefFunction'('Error', "root_new %0, ['parrot';'Exception']\n%0['message'] = %1\n%0['severity'] = %2\n%0['type'] = %3\n", 'P', 'S', 'I', 'I')
    set $P52, $P53
.annotate 'line', 1275
    push $P1, $P52
.annotate 'line', 1358
    new $P55, [ 'PredefFunction' ]
    $P55.'PredefFunction'('elements', 'elements %0, %1', 'I', 'P')
    set $P54, $P55
.annotate 'line', 1275
    push $P1, $P54
.annotate 'line', 1362
    new $P57, [ 'PredefFunctionEval' ]
.annotate 'line', 1363
    $P57.'PredefFunctionEval'('length', $P2, 'length %0, %1', 'I', 'S')
    set $P56, $P57
.annotate 'line', 1275
    push $P1, $P56
.annotate 'line', 1367
    new $P59, [ 'PredefFunctionEval' ]
.annotate 'line', 1368
    $P59.'PredefFunctionEval'('bytelength', $P3, 'bytelength %0, %1', 'I', 'S')
    set $P58, $P59
.annotate 'line', 1275
    push $P1, $P58
.annotate 'line', 1372
    new $P61, [ 'PredefFunctionEval' ]
.annotate 'line', 1373
    $P61.'PredefFunctionEval'('chr', $P4, "chr $S0, %1\nfind_encoding $I0, 'utf8'\ntrans_encoding %0, $S0, $I0\n", 'S', 'I')
    set $P60, $P61
.annotate 'line', 1275
    push $P1, $P60
.annotate 'line', 1381
    new $P63, [ 'PredefFunctionEval' ]
.annotate 'line', 1382
    $P63.'PredefFunctionEval'('ord', $P5, 'ord %0, %1', 'I', 'S')
    set $P62, $P63
.annotate 'line', 1275
    push $P1, $P62
.annotate 'line', 1386
    new $P65, [ 'PredefFunctionEval' ]
.annotate 'line', 1387
    $P65.'PredefFunctionEval'('ord', $P6, 'ord %0, %1, %2', 'I', 'S', 'I')
    set $P64, $P65
.annotate 'line', 1275
    push $P1, $P64
.annotate 'line', 1391
    new $P67, [ 'PredefFunctionEval' ]
.annotate 'line', 1392
    $P67.'PredefFunctionEval'('substr', $P7, 'substr %0, %1, %2', 'S', 'S', 'I')
    set $P66, $P67
.annotate 'line', 1275
    push $P1, $P66
.annotate 'line', 1396
    new $P69, [ 'PredefFunctionEval' ]
.annotate 'line', 1397
    $P69.'PredefFunctionEval'('substr', $P8, 'substr %0, %1, %2, %3', 'S', 'S', 'I', 'I')
    set $P68, $P69
.annotate 'line', 1275
    push $P1, $P68
.annotate 'line', 1401
    new $P71, [ 'PredefFunction' ]
    $P71.'PredefFunction'('replace', 'replace %0, %1, %2, %3, %4', 'S', 'S', 'I', 'I', 'S')
    set $P70, $P71
.annotate 'line', 1275
    push $P1, $P70
.annotate 'line', 1405
    new $P73, [ 'PredefFunctionEval' ]
.annotate 'line', 1406
    $P73.'PredefFunctionEval'('indexof', $P9, 'index %0, %1, %2', 'I', 'S', 'S')
    set $P72, $P73
.annotate 'line', 1275
    push $P1, $P72
.annotate 'line', 1410
    new $P75, [ 'PredefFunctionEval' ]
.annotate 'line', 1411
    $P75.'PredefFunctionEval'('indexof', $P10, 'index %0, %1, %2, %3', 'I', 'S', 'S', 'I')
    set $P74, $P75
.annotate 'line', 1275
    push $P1, $P74
.annotate 'line', 1415
    new $P77, [ 'PredefFunction' ]
    $P77.'PredefFunction'('join', 'join %0, %1, %2', 'S', 'S', 'P')
    set $P76, $P77
.annotate 'line', 1275
    push $P1, $P76
.annotate 'line', 1419
    new $P79, [ 'PredefFunction' ]
    $P79.'PredefFunction'('upcase', 'upcase %0, %1', 'S', 'S')
    set $P78, $P79
.annotate 'line', 1275
    push $P1, $P78
.annotate 'line', 1423
    new $P81, [ 'PredefFunction' ]
    $P81.'PredefFunction'('downcase', 'downcase %0, %1', 'S', 'S')
    set $P80, $P81
.annotate 'line', 1275
    push $P1, $P80
.annotate 'line', 1427
    new $P83, [ 'PredefFunction' ]
    $P83.'PredefFunction'('titlecase', 'titlecase %0, %1', 'S', 'S')
    set $P82, $P83
.annotate 'line', 1275
    push $P1, $P82
.annotate 'line', 1431
    new $P85, [ 'PredefFunction' ]
    $P85.'PredefFunction'('split', 'split %0, %1, %2', 'P', 'S', 'S')
    set $P84, $P85
.annotate 'line', 1275
    push $P1, $P84
.annotate 'line', 1435
    new $P87, [ 'PredefFunction' ]
    $P87.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1)\n", 'S', 'S')
    set $P86, $P87
.annotate 'line', 1275
    push $P1, $P86
.annotate 'line', 1442
    new $P89, [ 'PredefFunction' ]
    $P89.'PredefFunction'('chomp', "$P0 = get_root_global ['parrot';'String';'Utils'], 'chomp'\n%0 = $P0(%1, %2)\n", 'S', 'S', 'S')
    set $P88, $P89
.annotate 'line', 1275
    push $P1, $P88
.annotate 'line', 1449
    new $P91, [ 'PredefFunction' ]
    $P91.'PredefFunction'('push', 'push %1, %2', 'v', 'P', '?')
    set $P90, $P91
.annotate 'line', 1275
    push $P1, $P90
.annotate 'line', 1453
    new $P93, [ 'PredefFunction' ]
    $P93.'PredefFunction'('sqrt', 'sqrt %0, %1', 'N', 'N')
    set $P92, $P93
.annotate 'line', 1275
    push $P1, $P92
.annotate 'line', 1457
    new $P95, [ 'PredefFunction' ]
    $P95.'PredefFunction'('pow', 'pow %0, %1, %2', 'N', 'N', 'N')
    set $P94, $P95
.annotate 'line', 1275
    push $P1, $P94
.annotate 'line', 1461
    new $P97, [ 'PredefFunction' ]
    $P97.'PredefFunction'('exp', 'exp %0, %1', 'N', 'N')
    set $P96, $P97
.annotate 'line', 1275
    push $P1, $P96
.annotate 'line', 1465
    new $P99, [ 'PredefFunction' ]
    $P99.'PredefFunction'('ln', 'ln %0, %1', 'N', 'N')
    set $P98, $P99
.annotate 'line', 1275
    push $P1, $P98
.annotate 'line', 1469
    new $P101, [ 'PredefFunction' ]
    $P101.'PredefFunction'('sin', 'sin %0, %1', 'N', 'N')
    set $P100, $P101
.annotate 'line', 1275
    push $P1, $P100
.annotate 'line', 1473
    new $P103, [ 'PredefFunction' ]
    $P103.'PredefFunction'('cos', 'cos %0, %1', 'N', 'N')
    set $P102, $P103
.annotate 'line', 1275
    push $P1, $P102
.annotate 'line', 1477
    new $P105, [ 'PredefFunction' ]
    $P105.'PredefFunction'('tan', 'tan %0, %1', 'N', 'N')
    set $P104, $P105
.annotate 'line', 1275
    push $P1, $P104
.annotate 'line', 1481
    new $P107, [ 'PredefFunction' ]
    $P107.'PredefFunction'('asin', 'asin %0, %1', 'N', 'N')
    set $P106, $P107
.annotate 'line', 1275
    push $P1, $P106
.annotate 'line', 1485
    new $P109, [ 'PredefFunction' ]
    $P109.'PredefFunction'('acos', 'acos %0, %1', 'N', 'N')
    set $P108, $P109
.annotate 'line', 1275
    push $P1, $P108
.annotate 'line', 1489
    new $P111, [ 'PredefFunction' ]
    $P111.'PredefFunction'('atan', 'atan %0, %1', 'N', 'N')
    set $P110, $P111
.annotate 'line', 1275
    push $P1, $P110
.annotate 'line', 1493
    new $P113, [ 'PredefFunction' ]
    $P113.'PredefFunction'('atan', 'atan %0, %1, %2', 'N', 'N', 'N')
    set $P112, $P113
.annotate 'line', 1275
    push $P1, $P112
.annotate 'line', 1497
    new $P115, [ 'PredefFunction' ]
    $P115.'PredefFunction'('getinterp', 'getinterp %0', 'P')
    set $P114, $P115
.annotate 'line', 1275
    push $P1, $P114
.annotate 'line', 1501
    new $P117, [ 'PredefFunction' ]
    $P117.'PredefFunction'('get_class', 'get_class %0, %1', 'P', 'S')
    set $P116, $P117
.annotate 'line', 1275
    push $P1, $P116
.annotate 'line', 1505
    new $P119, [ 'PredefFunction' ]
    $P119.'PredefFunction'('typeof', 'typeof %0, %1', 'P', 'P')
    set $P118, $P119
.annotate 'line', 1275
    push $P1, $P118
.annotate 'line', 1509
    new $P121, [ 'PredefFunction' ]
    $P121.'PredefFunction'('getattribute', 'getattribute %0, %1, %2', 'P', 'P', 'S')
    set $P120, $P121
.annotate 'line', 1275
    push $P1, $P120
.annotate 'line', 1513
    new $P123, [ 'PredefFunction' ]
    $P123.'PredefFunction'('find_method', 'find_method %0, %1, %2', 'P', 'P', 'S')
    set $P122, $P123
.annotate 'line', 1275
    push $P1, $P122
.annotate 'line', 1517
    new $P125, [ 'PredefFunction' ]
    $P125.'PredefFunction'('callmethodwithargs', '%0 = %1.%2(%3 :flat)', 'P', 'P', 'P', 'P')
    set $P124, $P125
.annotate 'line', 1275
    push $P1, $P124
.annotate 'line', 1521
    new $P127, [ 'PredefFunction' ]
    $P127.'PredefFunction'('clone', 'clone %0, %1', 'P', 'P')
    set $P126, $P127
.annotate 'line', 1275
    push $P1, $P126
.annotate 'line', 1525
    new $P129, [ 'PredefFunction' ]
    $P129.'PredefFunction'('compreg', 'compreg %0, %1', 'P', 'S')
    set $P128, $P129
.annotate 'line', 1275
    push $P1, $P128
.annotate 'line', 1529
    new $P131, [ 'PredefFunction' ]
    $P131.'PredefFunction'('compreg', 'compreg %1, %2', 'v', 'S', 'P')
    set $P130, $P131
.annotate 'line', 1275
    push $P1, $P130
.annotate 'line', 1533
    new $P133, [ 'PredefFunction' ]
    $P133.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %1\n", 'P', 'S')
    set $P132, $P133
.annotate 'line', 1275
    push $P1, $P132
.annotate 'line', 1540
    new $P135, [ 'PredefFunction' ]
    $P135.'PredefFunction'('load_language', "load_language %1\ncompreg %0, %2\n", 'P', 'S', 'S')
    set $P134, $P135
.annotate 'line', 1275
    push $P1, $P134
.annotate 'line', 1547
    new $P137, [ 'PredefFunction' ]
    $P137.'PredefFunction'('loadlib', 'loadlib %0, %1', 'P', 'S')
    set $P136, $P137
.annotate 'line', 1275
    push $P1, $P136
.annotate 'line', 1551
    new $P139, [ 'PredefFunction' ]
    $P139.'PredefFunction'('load_bytecode', 'load_bytecode %1', 'v', 'S')
    set $P138, $P139
.annotate 'line', 1275
    push $P1, $P138
.annotate 'line', 1555
    new $P141, [ 'PredefFunction' ]
    $P141.'PredefFunction'('dlfunc', 'dlfunc %0, %1, %2, %3', 'P', 'P', 'S', 'S')
    set $P140, $P141
.annotate 'line', 1275
    push $P1, $P140
.annotate 'line', 1559
    new $P143, [ 'PredefFunction' ]
    $P143.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'S', 'S', 'P')
    set $P142, $P143
.annotate 'line', 1275
    push $P1, $P142
.annotate 'line', 1563
    new $P145, [ 'PredefFunction' ]
    $P145.'PredefFunction'('sprintf', 'sprintf %0, %1, %2', 'P', 'P', 'P')
    set $P144, $P145
.annotate 'line', 1275
    push $P1, $P144
.annotate 'line', 1567
    new $P147, [ 'PredefFunction' ]
.annotate 'line', 1568
.const 'Sub' $P148 = 'WSubId_31'
    $P147.'PredefFunction'('print', $P148, 'v', '*')
    set $P146, $P147
.annotate 'line', 1275
    push $P1, $P146
.annotate 'line', 1571
    new $P150, [ 'PredefFunction' ]
.annotate 'line', 1572
.const 'Sub' $P151 = 'WSubId_32'
    $P150.'PredefFunction'('say', $P151, 'v', '*')
    set $P149, $P150
.annotate 'line', 1275
    push $P1, $P149
.annotate 'line', 1575
    new $P153, [ 'PredefFunction' ]
.annotate 'line', 1576
.const 'Sub' $P154 = 'WSubId_33'
    $P153.'PredefFunction'('cry', $P154, 'v', '*')
    set $P152, $P153
.annotate 'line', 1275
    push $P1, $P152
.annotate 'line', 1579
    new $P156, [ 'PredefFunction' ]
.annotate 'line', 1580
.const 'Sub' $P157 = 'WSubId_34'
    $P156.'PredefFunction'('invoke', $P157, 'P', '!')
    set $P155, $P156
.annotate 'line', 1275
    push $P1, $P155
  __label_2: # Infinite loop
.annotate 'line', 1585
    .yield($P1)
    goto __label_2
  __label_1: # Infinite loop end
# }
.annotate 'line', 1586

.end # getpredefs


.sub 'findpredef' :subid('WSubId_65')
        .param string __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 1590
.const 'Sub' $P3 = 'WSubId_35'
    $P2 = $P3()
    iter $P4, $P2
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 1591
    getattribute $P5, $P1, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
# {
.annotate 'line', 1592
# pargs: $I1
    getattribute $P6, $P1, 'nparams'
    set $I1, $P6
.annotate 'line', 1593
    iseq $I2, $I1, __ARG_2
    if $I2 goto __label_6
.annotate 'line', 1594
    iseq $I2, $I1, -1
  __label_6:
    if $I2 goto __label_5
.annotate 'line', 1595
    iseq $I2, $I1, -2
    unless $I2 goto __label_7
    iseq $I2, __ARG_2, 1
  __label_7:
  __label_5:
    unless $I2 goto __label_4
.annotate 'line', 1596
    .return($P1)
  __label_4: # endif
# }
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1598
    .return($P2)
# }
.annotate 'line', 1599

.end # findpredef


.sub 'optimize_array' :subid('WSubId_38')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1607
    if_null __ARG_1, __label_1
# {
.annotate 'line', 1608
# n: $I1
# predefined elements
    elements $I1, __ARG_1
# for loop
.annotate 'line', 1609
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 1610
    $P2 = __ARG_1[$I2]
    $P1 = $P2.'optimize'()
    __ARG_1[$I2] = $P1
  __label_2: # for iteration
.annotate 'line', 1609
    inc $I2
    goto __label_4
  __label_3: # for end
# }
  __label_1: # endif
# }
.annotate 'line', 1612

.end # optimize_array


.sub 'emit_array' :subid('WSubId_52')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1616
    if_null __ARG_2, __label_1
# {
.annotate 'line', 1617
    iter $P2, __ARG_2
    set $P2, 0
  __label_2: # for iteration
    unless $P2 goto __label_3
    shift $P1, $P2
.annotate 'line', 1618
    $P1.'emit'(__ARG_1)
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
# }
.annotate 'line', 1620

.end # emit_array


.sub 'parseDotted' :subid('WSubId_55')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1624
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1625
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1626
    $P3 = $P2.'isidentifier'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 1627
# predefined push
    push $P1, $P2
  __label_3: # while
.annotate 'line', 1628
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 1629
    $P2 = __ARG_1.'get'()
.annotate 'line', 1630
# predefined push
    push $P1, $P2
# }
    goto __label_3
  __label_2: # endwhile
# }
  __label_1: # endif
.annotate 'line', 1633
    __ARG_1.'unget'($P2)
.annotate 'line', 1634
    .return($P1)
# }
.annotate 'line', 1635

.end # parseDotted


.sub 'parseList' :subid('WSubId_36')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4 :optional
# Body
# {
.annotate 'line', 1643
# var list: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1644
# var t: $P2
    null $P2
  __label_1: # do
.annotate 'line', 1645
# {
.annotate 'line', 1646
# var value: $P3
    $P3 = __ARG_3(__ARG_1, __ARG_2)
.annotate 'line', 1647
# predefined push
    push $P1, $P3
# }
  __label_3: # continue
.annotate 'line', 1648
    $P2 = __ARG_1.'get'()
    $P4 = $P2.'isop'(',')
    if_null $P4, __label_2
    if $P4 goto __label_1
  __label_2: # enddo
.annotate 'line', 1649
    unless_null __ARG_4, __label_4
.annotate 'line', 1650
    __ARG_1.'unget'($P2)
    goto __label_5
  __label_4: # else
.annotate 'line', 1652
    $P4 = $P2.'isop'(__ARG_4)
    isfalse $I1, $P4
    unless $I1 goto __label_6
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 1653
    $P5("Unfinished argument list", $P2)
  __label_6: # endif
  __label_5: # endif
.annotate 'line', 1654
    .return($P1)
# }
.annotate 'line', 1655

.end # parseList


.sub 'parseIdentifier' :subid('WSubId_57')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1660
    $P1 = __ARG_1.'get'()
    .tailcall $P1.'getidentifier'()
# }
.annotate 'line', 1661

.end # parseIdentifier


.sub 'toIdentifierList' :subid('WSubId_56')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1665
    new $P1, ['ResizableStringArray']
.annotate 'line', 1666
    iter $P3, __ARG_1
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P2, $P3
.annotate 'line', 1667
    $P4 = $P2.'getidentifier'()
# predefined push
    push $P1, $P4
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1668
    .return($P1)
# }
.annotate 'line', 1669

.end # toIdentifierList

.namespace [ 'CommonBase' ]

.sub 'initbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1682
    setattribute self, 'start', __ARG_1
.annotate 'line', 1683
    setattribute self, 'owner', __ARG_2
# }
.annotate 'line', 1684

.end # initbase


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1687
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 1688

.end # annotate


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1691
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 1692

.end # use_predef


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 1695
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 1696

.end # generatesubid


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1699
    getattribute $P1, self, 'owner'
    .tailcall $P1.'addlocalfunction'(__ARG_1)
# }
.annotate 'line', 1700

.end # addlocalfunction


.sub 'findns' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1703
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findns'(__ARG_1)
# }
.annotate 'line', 1704

.end # findns


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1707
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 1708

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1711
    getattribute $P1, self, 'owner'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 1712

.end # findclasskey


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 1715
    getattribute $P1, self, 'owner'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 1716

.end # dowarnings

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CommonBase' ]
.annotate 'line', 1677
    addattribute $P0, 'start'
.annotate 'line', 1678
    addattribute $P0, 'owner'
.end
.namespace [ 'SimpleArgList' ]

.sub 'SimpleArgList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 1731
.const 'Sub' $P1 = 'parseExpr'
.annotate 'line', 1732
.const 'Sub' $P4 = 'WSubId_36'
.const 'Sub' $P5 = 'WSubId_37'
    $P3 = $P4(__ARG_1, __ARG_2, $P5, __ARG_3)
    setattribute self, 'args', $P3
# }
.annotate 'line', 1733

.end # SimpleArgList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1737
    getattribute $P1, self, 'args'
# predefined elements
.annotate 'line', 1736
    elements $I1, $P1
.annotate 'line', 1737
    .return($I1)
# }
.annotate 'line', 1738

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1741
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1742
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 1743

.end # getarg


.sub 'optimizeargs' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_38'
.annotate 'line', 1747
    getattribute $P2, self, 'args'
    $P1($P2)
# }
.annotate 'line', 1748

.end # optimizeargs


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1751
# var argreg: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 1752
    getattribute $P3, self, 'args'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 1753
    $P5 = $P2.'emit_get'(__ARG_1)
# predefined push
    push $P1, $P5
    goto __label_1
  __label_2: # endfor
.annotate 'line', 1754
    .return($P1)
# }
.annotate 'line', 1755

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1758
    $P1 = self.'getargvalues'(__ARG_1)
# predefined join
    join $S1, ', ', $P1
    __ARG_1.'print'($S1)
# }
.annotate 'line', 1759

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleArgList' ]
.annotate 'line', 1727
    addattribute $P0, 'args'
.end
.namespace [ 'Modifier' ]

.sub 'getname' :method
# Body
# {
.annotate 'line', 1771
    getattribute $P1, self, 'name'
    .return($P1)
# }

.end # getname


.sub 'numargs' :method
# Body
# {
.annotate 'line', 1774
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1775
# nargs: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 1776
    .return($I1)
# }
.annotate 'line', 1777

.end # numargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 1780
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 1781
    $P2 = $P1.'numargs'()
    set $I1, $P2
    lt __ARG_1, $I1, __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 1782
    $P3('Wrong modifier arg number')
  __label_1: # endif
.annotate 'line', 1783
    .tailcall $P1.'getarg'(__ARG_1)
# }
.annotate 'line', 1784

.end # getarg


.sub 'Modifier' :method
        .param string __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1787
    box $P1, __ARG_1
    setattribute self, 'name', $P1
.annotate 'line', 1788
    if_null __ARG_2, __label_1
.annotate 'line', 1789
    setattribute self, 'args', __ARG_2
  __label_1: # endif
# }
.annotate 'line', 1790

.end # Modifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 1793
    getattribute $P1, self, 'args'
    if_null $P1, __label_1
.annotate 'line', 1794
    getattribute $P2, self, 'args'
    $P2.'optimizeargs'()
  __label_1: # endif
.annotate 'line', 1795
    .return(self)
# }
.annotate 'line', 1796

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Modifier' ]
.annotate 'line', 1768
    addattribute $P0, 'name'
.annotate 'line', 1769
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'parseModifier' :subid('WSubId_39')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1801
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1802
# name: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 1803
    $P1 = __ARG_1.'get'()
.annotate 'line', 1804
# var args: $P2
    null $P2
.annotate 'line', 1805
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 1806
    new $P4, [ 'SimpleArgList' ]
    $P4.'SimpleArgList'(__ARG_1, __ARG_2, ')')
    set $P2, $P4
    goto __label_3
  __label_2: # else
.annotate 'line', 1808
    __ARG_1.'unget'($P1)
  __label_3: # endif
.annotate 'line', 1809
    new $P4, [ 'Modifier' ]
    $P4.'Modifier'($S1, $P2)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 1810

.end # parseModifier

.namespace [ 'ModifierList' ]

.sub 'ModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1819
.const 'Sub' $P1 = 'parseModifier'
.annotate 'line', 1820
.const 'Sub' $P4 = 'WSubId_36'
.const 'Sub' $P5 = 'WSubId_39'
    $P3 = $P4(__ARG_1, __ARG_2, $P5, ']')
    setattribute self, 'list', $P3
# }
.annotate 'line', 1821

.end # ModifierList


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_38'
.annotate 'line', 1824
    getattribute $P2, self, 'list'
    $P1($P2)
# }
.annotate 'line', 1825

.end # optimize


.sub 'getlist' :method
# Body
# {
.annotate 'line', 1826
    getattribute $P1, self, 'list'
    .return($P1)
# }

.end # getlist


.sub 'pick' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1829
    getattribute $P2, self, 'list'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 1830
    $P4 = $P1.'getname'()
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 1831
    .return($P1)
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 1833
    .return($P2)
# }
.annotate 'line', 1834

.end # pick

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ModifierList' ]
.annotate 'line', 1815
    addattribute $P0, 'list'
.end
.namespace [ ]

.sub 'getparrotkey' :subid('WSubId_58')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1843
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1844
    concat $S2, "[ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
.annotate 'line', 1845

.end # getparrotkey


.sub 'getparrotnamespacekey' :subid('WSubId_107')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1849
# predefined elements
    elements $I1, __ARG_1
    ne $I1, 0, __label_1
.annotate 'line', 1850
    .return(".namespace [ ]")
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 1852
# s: $S1
# predefined join
    join $S1, "'; '", __ARG_1
.annotate 'line', 1853
    concat $S2, ".namespace [ '", $S1
    concat $S2, $S2, "' ]"
    .return($S2)
# }
  __label_2: # endif
# }
.annotate 'line', 1855

.end # getparrotnamespacekey


.sub 'parseUsing' :subid('WSubId_43')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1859
# var taux: $P1
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 1861
    $I1 = $P1.'iskeyword'('extern')
    if $I1 goto __label_3
.annotate 'line', 1863
    $I1 = $P1.'iskeyword'('static')
    if $I1 goto __label_4
.annotate 'line', 1865
    $I1 = $P1.'iskeyword'('namespace')
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 1862
    new $P3, [ 'ExternStatement' ]
    $P3.'ExternStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P2, $P3
    .return($P2)
  __label_4: # case
.annotate 'line', 1864
    new $P5, [ 'StaticStatement' ]
    $P5.'StaticStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P4, $P5
    .return($P4)
  __label_5: # case
.annotate 'line', 1866
    new $P7, [ 'UsingNamespaceStatement' ]
    $P7.'UsingNamespaceStatement'($P1, __ARG_2, __ARG_3)
    set $P6, $P7
    .return($P6)
  __label_2: # default
.annotate 'line', 1868
    __ARG_2.'unget'($P1)
.annotate 'line', 1869
    new $P9, [ 'UsingStatement' ]
    $P9.'UsingStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P8, $P9
    .return($P8)
  __label_1: # switch end
# }
.annotate 'line', 1871

.end # parseUsing


.sub 'parseSig' :subid('WSubId_42')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 1875
# var params: $P1
    new $P1, [ 'SigParameterList' ]
    $P1.'SigParameterList'(__ARG_2, __ARG_3)
.annotate 'line', 1876
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 1877
    $P4 = $P2.'isop'('=')
    isfalse $I1, $P4
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_40'
.annotate 'line', 1878
    $P5("'='", $P2)
  __label_1: # endif
.annotate 'line', 1879
# var expr: $P3
.const 'Sub' $P6 = 'WSubId_37'
    $P3 = $P6(__ARG_2, __ARG_3)
.annotate 'line', 1880
    new $P7, [ 'MultiAssignStatement' ]
    $P7.'MultiAssignStatement'($P1, $P3)
    set $P4, $P7
    .return($P4)
# }
.annotate 'line', 1881

.end # parseSig


.sub 'parseStatement' :subid('WSubId_93')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1885
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 1886
    $P4 = $P1.'isop'(';')
    if_null $P4, __label_1
    unless $P4 goto __label_1
.annotate 'line', 1887
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
  __label_1: # endif
.annotate 'line', 1888
    $P4 = $P1.'isop'('{')
    if_null $P4, __label_2
    unless $P4 goto __label_2
.annotate 'line', 1889
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_2: # endif
.annotate 'line', 1890
    $P4 = $P1.'isop'('${')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 1891
    new $P6, [ 'PiropStatement' ]
    $P6.'PiropStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_3: # endif
.annotate 'line', 1892
    $P4 = $P1.'isop'(':')
    if_null $P4, __label_4
    unless $P4 goto __label_4
# {
.annotate 'line', 1893
# var open: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 1894
    $P4 = $P2.'isop'('(')
    isfalse $I1, $P4
    unless $I1 goto __label_5
.const 'Sub' $P7 = 'WSubId_41'
.annotate 'line', 1895
    $P7("':'", $P1)
  __label_5: # endif
.annotate 'line', 1896
.const 'Sub' $P8 = 'WSubId_42'
    .tailcall $P8($P1, __ARG_1, __ARG_2)
# }
  __label_4: # endif
# switch
.annotate 'line', 1899
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
.annotate 'line', 1901
.const 'Sub' $P9 = 'WSubId_43'
    .tailcall $P9($P1, __ARG_1, __ARG_2)
  __label_9: # case
.annotate 'line', 1903
.const 'Sub' $P10 = 'WSubId_44'
    .tailcall $P10($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_10: # case
.annotate 'line', 1906
.const 'Sub' $P11 = 'WSubId_45'
    .tailcall $P11($P1, __ARG_1, __ARG_2)
    goto __label_6 # break
  __label_11: # case
.annotate 'line', 1909
.const 'Sub' $P12 = 'WSubId_46'
    .tailcall $P12($P1, __ARG_1, __ARG_2)
  __label_12: # case
.annotate 'line', 1911
.const 'Sub' $P13 = 'WSubId_47'
    .tailcall $P13($P1, __ARG_1, __ARG_2)
  __label_13: # case
.annotate 'line', 1913
.const 'Sub' $P14 = 'WSubId_48'
    .tailcall $P14($P1, __ARG_1, __ARG_2)
  __label_14: # case
.annotate 'line', 1915
.const 'Sub' $P15 = 'WSubId_49'
    .tailcall $P15($P1, __ARG_1, __ARG_2)
  __label_15: # case
.annotate 'line', 1917
    new $P6, [ 'ReturnStatement' ]
    $P6.'ReturnStatement'($P1, __ARG_1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_16: # case
.annotate 'line', 1919
    new $P17, [ 'YieldStatement' ]
    $P17.'YieldStatement'($P1, __ARG_1, __ARG_2)
    set $P16, $P17
    .return($P16)
  __label_17: # case
.annotate 'line', 1921
    new $P19, [ 'GotoStatement' ]
    $P19.'GotoStatement'($P1, __ARG_1, __ARG_2)
    set $P18, $P19
    .return($P18)
  __label_18: # case
.annotate 'line', 1923
    new $P21, [ 'IfStatement' ]
    $P21.'IfStatement'($P1, __ARG_1, __ARG_2)
    set $P20, $P21
    .return($P20)
  __label_19: # case
.annotate 'line', 1925
    new $P23, [ 'WhileStatement' ]
    $P23.'WhileStatement'($P1, __ARG_1, __ARG_2)
    set $P22, $P23
    .return($P22)
  __label_20: # case
.annotate 'line', 1927
    new $P25, [ 'DoStatement' ]
    $P25.'DoStatement'($P1, __ARG_1, __ARG_2)
    set $P24, $P25
    .return($P24)
  __label_21: # case
.annotate 'line', 1929
    new $P27, [ 'ContinueStatement' ]
    $P27.'ContinueStatement'($P1, __ARG_1, __ARG_2)
    set $P26, $P27
    .return($P26)
  __label_22: # case
.annotate 'line', 1931
    new $P29, [ 'BreakStatement' ]
    $P29.'BreakStatement'($P1, __ARG_1, __ARG_2)
    set $P28, $P29
    .return($P28)
  __label_23: # case
.annotate 'line', 1933
.const 'Sub' $P30 = 'WSubId_50'
    .tailcall $P30($P1, __ARG_1, __ARG_2)
  __label_24: # case
.annotate 'line', 1935
.const 'Sub' $P31 = 'WSubId_51'
    .tailcall $P31($P1, __ARG_1, __ARG_2)
  __label_25: # case
.annotate 'line', 1937
    new $P33, [ 'ThrowStatement' ]
    $P33.'ThrowStatement'($P1, __ARG_1, __ARG_2)
    set $P32, $P33
    .return($P32)
  __label_26: # case
.annotate 'line', 1939
    new $P35, [ 'TryStatement' ]
    $P35.'TryStatement'($P1, __ARG_1, __ARG_2)
    set $P34, $P35
    .return($P34)
  __label_7: # default
.annotate 'line', 1941
    $P36 = $P1.'isidentifier'()
    if_null $P36, __label_27
    unless $P36 goto __label_27
# {
.annotate 'line', 1942
# var t2: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 1943
    $P4 = $P3.'isop'(':')
    if_null $P4, __label_28
    unless $P4 goto __label_28
.annotate 'line', 1944
    new $P6, [ 'LabelStatement' ]
    $P6.'LabelStatement'($P1, __ARG_2)
    set $P5, $P6
    .return($P5)
  __label_28: # endif
.annotate 'line', 1945
    __ARG_1.'unget'($P3)
# }
  __label_27: # endif
.annotate 'line', 1947
    __ARG_1.'unget'($P1)
.annotate 'line', 1948
    new $P5, [ 'ExprStatement' ]
    $P5.'ExprStatement'($P1, __ARG_1, __ARG_2)
    set $P4, $P5
    .return($P4)
  __label_6: # switch end
.const 'Sub' $P37 = 'WSubId_6'
.annotate 'line', 1950
    $P37('parseStatement failure', $P1)
# }
.annotate 'line', 1951

.end # parseStatement

.namespace [ 'Statement' ]

.sub 'Statement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1961
    self.'initbase'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1962

.end # Statement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 1963
    .return(0)
# }

.end # isempty


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1966
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createreg'(__ARG_1)
# }
.annotate 'line', 1967

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 1970
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 1971

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 1974
    getattribute $P1, self, 'owner'
    $P1.'freetemps'()
# }
.annotate 'line', 1975

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 1978
    getattribute $P1, self, 'owner'
    .tailcall $P1.'genlabel'()
# }
.annotate 'line', 1979

.end # genlabel


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1982
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getlabel'(__ARG_1)
# }
.annotate 'line', 1983

.end # getlabel


.sub 'createlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 1986
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createlabel'(__ARG_1)
# }
.annotate 'line', 1987

.end # createlabel


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1990
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createconst'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1991

.end # createconst


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 1994
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvar'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 1995

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 1998
    getattribute $P1, self, 'owner'
    .tailcall $P1.'createvarused'(__ARG_1, __ARG_2)
# }
.annotate 'line', 1999

.end # createvarused


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2002
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getvar'(__ARG_1)
# }
.annotate 'line', 2003

.end # getvar


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2006
    getattribute $P1, self, 'owner'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 2007

.end # checkclass


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2010
    getattribute $P1, self, 'owner'
    $P1.'usenamespace'(__ARG_1)
# }
.annotate 'line', 2011

.end # usenamespace


.sub 'getouter' :method
# Body
# {
.annotate 'line', 2018
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getouter'()
# }
.annotate 'line', 2019

.end # getouter


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2022
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getcontinuelabel'(__ARG_1)
# }
.annotate 'line', 2023

.end # getcontinuelabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2026
    getattribute $P1, self, 'owner'
    .tailcall $P1.'getbreaklabel'(__ARG_1)
# }
.annotate 'line', 2027

.end # getbreaklabel


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2030
    getattribute $P2, self, 'start'
    $P1('**checking**', $P2)
.annotate 'line', 2032
    .return(self)
# }
.annotate 'line', 2033

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Statement' ]
.annotate 'line', 1957
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'EmptyStatement' ]

.sub 'isempty' :method
# Body
# {
.annotate 'line', 2038
    .return(1)
# }

.end # isempty


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2041
    $P1('Attempt to annotate empty statement')
# }
.annotate 'line', 2042

.end # annotate


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2043
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'EmptyStatement' ]
.annotate 'line', 2036
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'MultiStatementBase' ]

.sub 'optimize' :method
# Body
# {
.annotate 'line', 2056
# var statements: $P1
    getattribute $P1, self, 'statements'
.annotate 'line', 2057
# n: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2058
# empty: $I2
    set $I2, 1
# for loop
.annotate 'line', 2059
# i: $I3
    null $I3
  __label_3: # for condition
    ge $I3, $I1, __label_2
# {
.annotate 'line', 2060
# var st: $P2
    $P3 = $P1[$I3]
    $P2 = $P3.'optimize'()
.annotate 'line', 2061
    set $I4, $I2
    unless $I4 goto __label_5
    $P3 = $P2.'isempty'()
    isfalse $I4, $P3
  __label_5:
    unless $I4 goto __label_4
.annotate 'line', 2062
    null $I2
  __label_4: # endif
.annotate 'line', 2063
    $P1[$I3] = $P2
# }
  __label_1: # for iteration
.annotate 'line', 2059
    inc $I3
    goto __label_3
  __label_2: # for end
.annotate 'line', 2065
    unless $I2 goto __label_6
.annotate 'line', 2066
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
    goto __label_7
  __label_6: # else
.annotate 'line', 2068
    .return(self)
  __label_7: # endif
# }
.annotate 'line', 2069

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatementBase' ]
.annotate 'line', 2052
    addattribute $P0, 'statements'
.end
.namespace [ 'MultiStatement' ]

.sub 'MultiStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2076
# var statements: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
    push $P1, __ARG_1
    push $P1, __ARG_2
.annotate 'line', 2077
    setattribute self, 'statements', $P1
# }
.annotate 'line', 2078

.end # MultiStatement


.sub 'isempty' :method
# Body
# {
.annotate 'line', 2079
    .return(0)
# }

.end # isempty


.sub 'push' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2082
    getattribute $P1, self, 'statements'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 2083
    .return(self)
# }
.annotate 'line', 2084

.end # push


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_52'
.annotate 'line', 2087
    getattribute $P2, self, 'statements'
    $P1(__ARG_1, $P2)
# }
.annotate 'line', 2088

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiStatement' ]
.annotate 'line', 2072
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'addtomulti' :subid('WSubId_96')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2093
    unless_null __ARG_1, __label_1
.annotate 'line', 2094
    .return(__ARG_2)
    goto __label_2
  __label_1: # else
.annotate 'line', 2095
    isa $I1, __ARG_1, [ 'MultiStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 2096
    .tailcall __ARG_1.'push'(__ARG_2)
    goto __label_4
  __label_3: # else
.annotate 'line', 2098
    new $P2, [ 'MultiStatement' ]
    $P2.'MultiStatement'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
  __label_4: # endif
  __label_2: # endif
# }
.annotate 'line', 2099

.end # addtomulti


.sub 'parsePiropArg' :subid('WSubId_53')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2107
# var arg: $P1
    null $P1
.annotate 'line', 2108
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 2109
    $P3 = $P2.'isop'(':')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 2110
    $P2 = __ARG_1.'get'()
.annotate 'line', 2111
# label: $S1
    $P3 = $P2.'getidentifier'()
    null $S1
    if_null $P3, __label_3
    set $S1, $P3
  __label_3:
.annotate 'line', 2112
    new $P3, [ 'Reflabel' ]
    $P3.'Reflabel'(__ARG_2, $S1)
    set $P1, $P3
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2115
    __ARG_1.'unget'($P2)
.annotate 'line', 2116
.const 'Sub' $P4 = 'WSubId_37'
    $P1 = $P4(__ARG_1, __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 2118
    .return($P1)
# }
.annotate 'line', 2119

.end # parsePiropArg

.namespace [ 'PiropStatement' ]

.sub 'PiropStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2128
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2129
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 2130
# dotted: $I1
    $P2 = $P1.'isop'('.')
    set $I1, $P2
.annotate 'line', 2131
    unless $I1 goto __label_1
.annotate 'line', 2132
    $P1 = __ARG_2.'get'()
  __label_1: # endif
.annotate 'line', 2133
# opname: $S1
    $P2 = $P1.'getidentifier'()
    null $S1
    if_null $P2, __label_2
    set $S1, $P2
  __label_2:
.annotate 'line', 2134
    unless $I1 goto __label_4
    set $S2, '.'
    goto __label_3
  __label_4:
    set $S2, ''
  __label_3:
    concat $S3, $S2, $S1
    box $P2, $S3
    setattribute self, 'opname', $P2
.annotate 'line', 2135
    $P1 = __ARG_2.'get'()
.annotate 'line', 2136
    $P2 = $P1.'isop'('}')
    isfalse $I2, $P2
    unless $I2 goto __label_5
# {
.annotate 'line', 2137
    __ARG_2.'unget'($P1)
.annotate 'line', 2138
.const 'Sub' $P3 = 'parsePiropArg'
.annotate 'line', 2139
.const 'Sub' $P5 = 'WSubId_36'
.const 'Sub' $P6 = 'WSubId_53'
    $P4 = $P5(__ARG_2, __ARG_3, $P6, '}')
    setattribute self, 'args', $P4
# }
  __label_5: # endif
.const 'Sub' $P7 = 'WSubId_54'
.annotate 'line', 2141
    $P7(';', __ARG_2)
# }
.annotate 'line', 2142

.end # PiropStatement


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_38'
.annotate 'line', 2145
    getattribute $P2, self, 'args'
    $P1($P2)
.annotate 'line', 2146
    .return(self)
# }
.annotate 'line', 2147

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2150
# opname: $S1
    getattribute $P4, self, 'opname'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2151
    self.'annotate'(__ARG_1)
.annotate 'line', 2152
    concat $S2, 'pirop ', $S1
    __ARG_1.'comment'($S2)
.annotate 'line', 2153
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 2154
    __ARG_1.'print'('    ')
.annotate 'line', 2155
    unless_null $P1, __label_2
.annotate 'line', 2156
    __ARG_1.'say'($S1)
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 2158
# var argreg: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 2159
    iter $P5, $P1
    set $P5, 0
  __label_4: # for iteration
    unless $P5 goto __label_5
    shift $P3, $P5
.annotate 'line', 2160
    $P4 = $P3.'emit_get'(__ARG_1)
# predefined push
    push $P2, $P4
    goto __label_4
  __label_5: # endfor
.annotate 'line', 2161
# predefined join
    join $S2, ', ', $P2
    __ARG_1.'say'($S1, ' ', $S2)
# }
  __label_3: # endif
# }
.annotate 'line', 2163

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'PiropStatement' ]
.annotate 'line', 2121
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2123
    addattribute $P0, 'opname'
.annotate 'line', 2124
    addattribute $P0, 'args'
.end
.namespace [ 'ExternStatement' ]

.sub 'ExternStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2175
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2176
# var path: $P1
.const 'Sub' $P2 = 'WSubId_55'
    $P1 = $P2(__ARG_2)
.annotate 'line', 2177
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.const 'Sub' $P3 = 'WSubId_3'
.annotate 'line', 2178
    $P4 = __ARG_2.'get'()
    $P3($P4)
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_54'
.annotate 'line', 2179
    $P5(';', __ARG_2)
.annotate 'line', 2180
.const 'Sub' $P7 = 'WSubId_56'
    $P6 = $P7($P1)
    setattribute self, 'path', $P6
.annotate 'line', 2181
    .return(self)
# }
.annotate 'line', 2182

.end # ExternStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2183
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2186
    self.'annotate'(__ARG_1)
.annotate 'line', 2187
    getattribute $P1, self, 'path'
# predefined join
    join $S1, '/', $P1
    __ARG_1.'say'('    ', "load_bytecode '", $S1, ".pbc'")
# }
.annotate 'line', 2188

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExternStatement' ]
.annotate 'line', 2170
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2172
    addattribute $P0, 'path'
.end
.namespace [ 'StaticStatement' ]

.sub 'StaticStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2200
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = "WSubId_57"
.annotate 'line', 2202
.const 'Sub' $P4 = 'WSubId_36'
    null $P5
    $P3 = $P4(__ARG_2, $P5, $P1, ';')
    setattribute self, 'names', $P3
# }
.annotate 'line', 2203

.end # StaticStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2204
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2207
    self.'annotate'(__ARG_1)
.annotate 'line', 2208
    getattribute $P2, self, 'names'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $S1, $P3
# {
.annotate 'line', 2209
# var v: $P1
    $P1 = self.'createvar'($S1, 'P')
.annotate 'line', 2210
    $P2 = $P1.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P2, " = '", $S1, "'")
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 2212

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StaticStatement' ]
.annotate 'line', 2195
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2197
    addattribute $P0, 'names'
.end
.namespace [ 'UsingStatement' ]

.sub 'UsingStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2226
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2227
# var path: $P1
.const 'Sub' $P2 = 'WSubId_55'
    $P1 = $P2(__ARG_2)
.annotate 'line', 2228
# predefined elements
    elements $I1, $P1
    ne $I1, 0, __label_1
.const 'Sub' $P3 = 'WSubId_3'
.annotate 'line', 2229
    $P4 = __ARG_2.'get'()
    $P3($P4)
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_54'
.annotate 'line', 2230
    $P5(';', __ARG_2)
.annotate 'line', 2231
.const 'Sub' $P7 = 'WSubId_56'
    $P6 = $P7($P1)
    setattribute self, 'path', $P6
# }
.annotate 'line', 2232

.end # UsingStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2235
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2236
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2238
# var symbol: $P2
    $P2 = self.'findsymbol'($P1)
# switch-case
.annotate 'line', 2240
    isnull $I1, $P2
    if $I1 goto __label_3
.annotate 'line', 2254
    isa $I1, $P2, [ 'FunctionStatement' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 2241
# predefined elements
    elements $I2, $P1
    le $I2, 0, __label_5
# {
.annotate 'line', 2242
# var p: $P3
# predefined clone
    clone $P3, $P1
.annotate 'line', 2243
    $P3.'pop'()
.annotate 'line', 2244
# var ns: $P4
    $P4 = self.'findns'($P3)
.annotate 'line', 2245
    if_null $P4, __label_6
# {
.annotate 'line', 2246
    $P2 = $P4.'getvar'($S1)
.annotate 'line', 2247
    if_null $P2, __label_7
# {
.annotate 'line', 2248
    self.'createvarused'($S1, $P2)
.annotate 'line', 2249
    new $P5, [ 'EmptyStatement' ]
    .return($P5)
# }
  __label_7: # endif
# }
  __label_6: # endif
# }
  __label_5: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 2255
# subid: $S2
    $P5 = $P2.'makesubid'()
    null $S2
    if_null $P5, __label_8
    set $S2, $P5
  __label_8:
.annotate 'line', 2256
    box $P6, $S2
    setattribute self, 'subid', $P6
    goto __label_1 # break
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 2259
    self.'createvar'($S1, 'P')
.annotate 'line', 2260
    .return(self)
# }
.annotate 'line', 2261

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2264
# var path: $P1
    getattribute $P1, self, 'path'
.annotate 'line', 2265
# name: $S1
    $S1 = $P1[-1]
.annotate 'line', 2266
# var vdata: $P2
    $P2 = self.'getvar'($S1)
.annotate 'line', 2267
    getattribute $P3, self, 'subid'
    if_null $P3, __label_1
# {
.annotate 'line', 2268
# subid: $S2
    getattribute $P4, self, 'subid'
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2269
    $P3 = $P2.'getreg'()
    __ARG_1.'say'(".const 'Sub' ", $P3, ' = "', $S2, '"')
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2272
    self.'annotate'(__ARG_1)
.annotate 'line', 2273
    $P3 = $P2.'getreg'()
    __ARG_1.'print'('    get_hll_global ', $P3, ', ')
.annotate 'line', 2274
    $P1.'pop'()
# switch
.annotate 'line', 2275
# predefined elements
    elements $I1, $P1
    null $I2
    if $I1 == $I2 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 2277
    __ARG_1.'say'("'", $S1, "'")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 2280
.const 'Sub' $P5 = 'WSubId_58'
    $P3 = $P5($P1)
    __ARG_1.'say'($P3, " , '", $S1, "'")
  __label_4: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2283

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingStatement' ]
.annotate 'line', 2219
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2221
    addattribute $P0, 'path'
.annotate 'line', 2222
    addattribute $P0, 'subid'
.end
.namespace [ 'UsingNamespaceStatement' ]

.sub 'UsingNamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2294
    self.'Statement'(__ARG_2, __ARG_3)
.annotate 'line', 2295
# var nskey: $P1
.const 'Sub' $P3 = 'WSubId_55'
    $P1 = $P3(__ARG_2)
.annotate 'line', 2296
# nlems: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 2297
    ge $I1, 1, __label_1
.const 'Sub' $P4 = 'WSubId_40'
.annotate 'line', 2298
    $P4('namespace identifier', __ARG_1)
  __label_1: # endif
.annotate 'line', 2299
# var nssym: $P2
.const 'Sub' $P6 = 'WSubId_56'
    $P5 = $P6($P1)
    $P2 = __ARG_3.'findns'($P5)
.annotate 'line', 2301
    unless_null $P2, __label_2
.const 'Sub' $P7 = 'WSubId_1'
.annotate 'line', 2302
    $P7('unknow namespace', __ARG_1)
  __label_2: # endif
.annotate 'line', 2303
    __ARG_3.'usenamespace'($P2)
.const 'Sub' $P8 = 'WSubId_54'
.annotate 'line', 2305
    $P8(';', __ARG_2)
# }
.annotate 'line', 2306

.end # UsingNamespaceStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2309
    .return(self)
# }
.annotate 'line', 2310

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'UsingNamespaceStatement' ]
.annotate 'line', 2290
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'ExprStatement' ]

.sub 'ExprStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2325
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 2326
.const 'Sub' $P3 = 'WSubId_37'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'expr', $P2
.const 'Sub' $P4 = 'WSubId_54'
.annotate 'line', 2327
    $P4(';', __ARG_2)
# }
.annotate 'line', 2328

.end # ExprStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2331
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 2332
    .return(self)
# }
.annotate 'line', 2333

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2336
    getattribute $P1, self, 'expr'
    $P1.'emit'(__ARG_1, '')
# }
.annotate 'line', 2337

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ExprStatement' ]
.annotate 'line', 2320
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 2322
    addattribute $P0, 'expr'
.end
.namespace [ 'VarData' ]

.sub 'VarData' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4
# Body
# {
.annotate 'line', 2354
    setattribute self, 'type', __ARG_1
.annotate 'line', 2355
    setattribute self, 'reg', __ARG_2
.annotate 'line', 2356
    setattribute self, 'scope', __ARG_3
.annotate 'line', 2357
    box $P1, __ARG_4
    setattribute self, 'flags', $P1
# }
.annotate 'line', 2358

.end # VarData


.sub 'setlex' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 2361
    box $P1, __ARG_1
    setattribute self, 'lexname', $P1
# }
.annotate 'line', 2362

.end # setlex


.sub 'gettype' :method
# Body
# {
.annotate 'line', 2363
    getattribute $P1, self, 'type'
    .return($P1)
# }

.end # gettype


.sub 'getreg' :method
# Body
# {
.annotate 'line', 2364
    getattribute $P1, self, 'reg'
    .return($P1)
# }

.end # getreg


.sub 'getscope' :method
# Body
# {
.annotate 'line', 2365
    getattribute $P1, self, 'scope'
    .return($P1)
# }

.end # getscope


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2366
    getattribute $P1, self, 'value'
    .return($P1)
# }

.end # getvalue


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2367
    .return(0)
# }

.end # isconst


.sub 'getlex' :method
# Body
# {
.annotate 'line', 2368
    getattribute $P1, self, 'lexname'
    .return($P1)
# }

.end # getlex


.sub 'getflags' :method
# Body
# {
.annotate 'line', 2369
    getattribute $P1, self, 'flags'
    .return($P1)
# }

.end # getflags

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData' ]
.annotate 'line', 2346
    addattribute $P0, 'type'
.annotate 'line', 2347
    addattribute $P0, 'reg'
.annotate 'line', 2348
    addattribute $P0, 'scope'
.annotate 'line', 2349
    addattribute $P0, 'flags'
.annotate 'line', 2350
    addattribute $P0, 'lexname'
.end
.namespace [ 'ConstantInternalFail' ]

.sub 'ConstantInternalFail' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2377
    setattribute self, 'name', __ARG_1
# }
.annotate 'line', 2378

.end # ConstantInternalFail


.sub 'get_string' :method :vtable
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 2381
    getattribute $P2, self, 'name'
    $P1('Attempt to use unexpanded constant!!!', $P2)
# }
.annotate 'line', 2382

.end # get_string

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstantInternalFail' ]
.annotate 'line', 2374
    addattribute $P0, 'name'
.end
.namespace [ 'VarData_const' ]

.sub 'VarData_const' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 2391
    new $P2, [ 'ConstantInternalFail' ]
    $P2.'ConstantInternalFail'(__ARG_2)
    set $P1, $P2
    self.'VarData'(__ARG_1, $P1, __ARG_3, __ARG_4)
# }
.annotate 'line', 2392

.end # VarData_const


.sub 'isconst' :method
# Body
# {
.annotate 'line', 2393
    .return(1)
# }

.end # isconst


.sub 'setvalue' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2396
    getattribute $P1, self, 'value'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 2397
    $P2('Attempt change value of constant!!!')
  __label_1: # endif
.annotate 'line', 2398
    setattribute self, 'value', __ARG_1
# }
.annotate 'line', 2399

.end # setvalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarData_const' ]
.annotate 'line', 2385
    get_class $P1, [ 'VarData' ]
    addparent $P0, $P1
.annotate 'line', 2387
    addattribute $P0, 'value'
.end
.namespace [ 'VarContainer' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 2410
    root_new $P2, ['parrot';'Hash']
    setattribute self, 'locals', $P2
# }
.annotate 'line', 2411

.end # init


.sub 'createvar' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2414
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2415
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2416
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2417
    if_null $P2, __label_2
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 2418
    concat $S3, "Redeclared '", $S1
    concat $S3, $S3, "'"
    $P5($S3, __ARG_1)
  __label_2: # endif
.annotate 'line', 2419
# reg: $S2
    $P4 = self.'createreg'(__ARG_2)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 2420
# var data: $P3
    new $P3, [ 'VarData' ]
    $P3.'VarData'(__ARG_2, $S2, self, __ARG_3)
.annotate 'line', 2421
    $P1[$S1] = $P3
.annotate 'line', 2422
    .return($P3)
# }
.annotate 'line', 2423

.end # createvar


.sub 'createvarused' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2426
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2427
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2428
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2429
    if_null $P2, __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2430
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P4($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2431
    $P1[$S1] = __ARG_2
# }
.annotate 'line', 2432

.end # createvarused


.sub 'createvarnamed' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2435
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2436
# sname: $S1
    set $P3, __ARG_1
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2437
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2438
    if_null $P2, __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2439
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P4($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2440
    new $P5, [ 'VarData' ]
    $P5.'VarData'(__ARG_2, __ARG_3, self, 0)
    set $P3, $P5
    $P1[$S1] = $P3
# }
.annotate 'line', 2441

.end # createvarnamed


.sub 'createconst' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 2444
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 2445
# sname: $S1
    set $P4, __ARG_1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 2446
# var exist: $P2
    $P2 = $P1[$S1]
.annotate 'line', 2447
    if_null $P2, __label_2
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 2448
    concat $S2, "Redeclared '", $S1
    concat $S2, $S2, "'"
    $P5($S2, __ARG_1)
  __label_2: # endif
.annotate 'line', 2449
# var data: $P3
    new $P3, [ 'VarData_const' ]
    $P3.'VarData_const'(__ARG_2, __ARG_1, self, __ARG_3)
.annotate 'line', 2450
    $P1[$S1] = $P3
.annotate 'line', 2451
    .return($P3)
# }
.annotate 'line', 2452

.end # createconst


.sub 'getlocalvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2455
# var locals: $P1
    getattribute $P1, self, 'locals'
# predefined string
.annotate 'line', 2454
    set $S1, __ARG_1
.annotate 'line', 2456
    $P2 = $P1[$S1]
    .return($P2)
# }
.annotate 'line', 2457

.end # getlocalvar


.sub 'getusedvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2460
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 2461
    if_null $P1, __label_1
# {
.annotate 'line', 2462
# var sym: $P2
    null $P2
.annotate 'line', 2463
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 2464
    $P2 = $P3.'getlocalvar'(__ARG_1)
    if_null $P2, __label_4
.annotate 'line', 2465
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
    null $P5
.annotate 'line', 2468
    .return($P5)
# }
.annotate 'line', 2469

.end # getusedvar


.sub 'getvar' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2472
# var sym: $P1
    null $P1
.annotate 'line', 2473
    $P1 = self.'getlocalvar'(__ARG_1)
    if_null $P1, __label_1
.annotate 'line', 2474
    .return($P1)
  __label_1: # endif
.annotate 'line', 2475
    $P1 = self.'getusedvar'(__ARG_1)
    if_null $P1, __label_2
.annotate 'line', 2476
    .return($P1)
  __label_2: # endif
.annotate 'line', 2477
# var owner: $P2
    getattribute $P2, self, 'owner'
.annotate 'line', 2478
    if_null $P2, __label_3
.annotate 'line', 2479
    .tailcall $P2.'getvar'(__ARG_1)
  __label_3: # endif
    null $P3
.annotate 'line', 2480
    .return($P3)
# }
.annotate 'line', 2481

.end # getvar


.sub 'makelexical' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2484
# var lexowner: $P1
    $P1 = self.'getouter'()
.annotate 'line', 2485
# lexname: $S1
    $P2 = $P1.'createlex'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2486
    .return($S1)
# }
.annotate 'line', 2487

.end # makelexical


.sub 'makelexicalself' :method
# Body
# {
.annotate 'line', 2490
# var lexowner: $P1
    set $P1, self
# Constant lexname evaluated at compile time
.annotate 'line', 2492
    self.'setlex'('__WLEX_self', 'self')
.annotate 'line', 2493
    .return('__WLEX_self')
# }
.annotate 'line', 2494

.end # makelexicalself

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarContainer' ]
.annotate 'line', 2405
    addattribute $P0, 'locals'
.annotate 'line', 2406
    addattribute $P0, 'usednamespaces'
.end
.namespace [ 'BlockStatement' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BlockStatement' ]
.annotate 'line', 2503
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.end
.namespace [ 'Expr' ]

.sub 'Expr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2515
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 2516

.end # Expr


.sub 'issimple' :method
# Body
# {
.annotate 'line', 2517
    .return(0)
# }

.end # issimple


.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2518
    .return(0)
# }

.end # isliteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2519
    .return(0)
# }

.end # isintegerliteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2520
    .return(0)
# }

.end # isfloatliteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2521
    .return(0)
# }

.end # isstringliteral


.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2522
    .return(0)
# }

.end # isidentifier


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2523
    .return(0)
# }

.end # isnull


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2524
    .return(0)
# }

.end # hascompilevalue


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 2525
    .return(0)
# }

.end # isnegable


.sub 'tempreg' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2528
    getattribute $P1, self, 'owner'
    .tailcall $P1.'tempreg'(__ARG_1)
# }
.annotate 'line', 2529

.end # tempreg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2533
    .return(self)
# }
.annotate 'line', 2534

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 2535
    .return(0)
# }

.end # cantailcall


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2538
# type: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2539
# reg: $S2
    ne $S1, 'v', __label_3
    set $S2, ''
    goto __label_2
  __label_3:
    $S2 = self.'tempreg'($S1)
  __label_2:
.annotate 'line', 2540
    self.'emit'(__ARG_1, $S2)
.annotate 'line', 2541
    .return($S2)
# }
.annotate 'line', 2542

.end # emit_get


.sub 'emit_getint' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2545
# reg: $S1
    null $S1
.annotate 'line', 2546
    $P1 = self.'checkresult'()
    set $S2, $P1
    ne $S2, 'I', __label_1
.annotate 'line', 2547
    $P2 = self.'emit_get'(__ARG_1)
    set $S1, $P2
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2549
    $P3 = self.'tempreg'('I')
    set $S1, $P3
.annotate 'line', 2550
    self.'emit'(__ARG_1, $S1)
# }
  __label_2: # endif
.annotate 'line', 2552
    .return($S1)
# }
.annotate 'line', 2553

.end # emit_getint


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 2556
    getattribute $P2, self, 'start'
    $P1('Not a left-side expression', $P2)
# }
.annotate 'line', 2557

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Expr' ]
.annotate 'line', 2511
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'SimpleExpr' ]

.sub 'issimple' :method
# Body
# {
.annotate 'line', 2562
    .return(1)
# }

.end # issimple

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SimpleExpr' ]
.annotate 'line', 2560
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionExpr' ]

.sub 'FunctionExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 2572
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 2573
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 2574
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_40'
.annotate 'line', 2575
    $P3('anonymous function', $P1)
  __label_1: # endif
.annotate 'line', 2576
    new $P5, [ 'LocalFunctionStatement' ]
    $P5.'LocalFunctionStatement'(__ARG_3, __ARG_1, __ARG_2)
    set $P4, $P5
    setattribute self, 'fn', $P4
# }
.annotate 'line', 2577

.end # FunctionExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2578
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2581
    getattribute $P3, self, 'fn'
    $P2 = $P3.'optimize'()
    setattribute self, 'fn', $P2
.annotate 'line', 2582
    .return(self)
# }
.annotate 'line', 2583

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2586
# var fn: $P1
    getattribute $P1, self, 'fn'
.annotate 'line', 2587
# reg: $S1
    $P2 = self.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2588
    self.'annotate'(__ARG_1)
.annotate 'line', 2589
    $P2 = $P1.'getsubid'()
    __ARG_1.'say'(".const 'Sub' ", $S1, " = '", $P2, "'")
.annotate 'line', 2590
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 2591
    __ARG_1.'emitarg2'('newclosure', __ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 2592

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionExpr' ]
.annotate 'line', 2567
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 2569
    addattribute $P0, 'fn'
.end
.namespace [ ]
# Constant CONDisruntime evaluated at compile time
# Constant CONDistrue evaluated at compile time
# Constant CONDisfalse evaluated at compile time
.namespace [ 'Condition' ]

.sub 'set' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2607
    setattribute self, 'condexpr', __ARG_1
.annotate 'line', 2608
    .return(self)
# }
.annotate 'line', 2609

.end # set


.sub 'optimize_condition' :method
# Body
# {
.annotate 'line', 2612
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
# }
.annotate 'line', 2613

.end # optimize_condition


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2616
    getattribute $P3, self, 'condexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'condexpr', $P2
.annotate 'line', 2617
    .return(self)
# }
.annotate 'line', 2618

.end # optimize


.sub 'getvalue' :method
# Body
# {
.annotate 'line', 2621
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2622
    $P2 = $P1.'isliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
# switch
.annotate 'line', 2623
    $P3 = $P1.'checkresult'()
    set $S1, $P3
    set $S2, 'I'
    if $S1 == $S2 goto __label_4
    goto __label_3
  __label_4: # case
.annotate 'line', 2625
# n: $I1
    $P4 = $P1.'getIntegerValue'()
    set $I1, $P4
.annotate 'line', 2626
    ne $I1, 0, __label_5
.annotate 'line', 2627
    .return(2)
    goto __label_6
  __label_5: # else
.annotate 'line', 2629
    .return(1)
  __label_6: # endif
  __label_3: # default
  __label_2: # switch end
# }
  __label_1: # endif
.annotate 'line', 2632
    .return(0)
# }
.annotate 'line', 2633

.end # getvalue


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 2636
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2638
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2639
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2640
    $P1.'emit_if'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2642
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2643
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
.annotate 'line', 2646
    __ARG_1.'emitif_null'($S1, __ARG_3)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2649
    __ARG_1.'emitif'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2650
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2652
    $P3('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2655

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 2658
# var condexpr: $P1
    getattribute $P1, self, 'condexpr'
.annotate 'line', 2660
    isa $I1, $P1, [ 'ComparatorBaseExpr' ]
    if $I1 goto __label_3
.annotate 'line', 2661
    isa $I1, $P1, [ 'NullCheckerExpr' ]
  __label_3:
    unless $I1 goto __label_1
.annotate 'line', 2662
    $P1.'emit_else'(__ARG_1, __ARG_2)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2664
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
# switch
.annotate 'line', 2665
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
.annotate 'line', 2668
    __ARG_1.'emitif_null'($S1, __ARG_2)
  __label_9: # case
  __label_10: # case
.annotate 'line', 2671
    __ARG_1.'emitunless'($S1, __ARG_2)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2672
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2674
    $P3('Invalid if condition')
  __label_5: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2677

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Condition' ]
.annotate 'line', 2604
    addattribute $P0, 'condexpr'
.end
.namespace [ 'Literal' ]

.sub 'isliteral' :method
# Body
# {
.annotate 'line', 2684
    .return(1)
# }

.end # isliteral


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 2685
    .return(1)
# }

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Literal' ]
.annotate 'line', 2682
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'StringLiteral' ]

.sub 'StringLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2695
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2696
    setattribute self, 'strval', __ARG_2
# }
.annotate 'line', 2697

.end # StringLiteral


.sub 'isstringliteral' :method
# Body
# {
.annotate 'line', 2698
    .return(1)
# }

.end # isstringliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2699
    .return('S')
# }

.end # checkresult


.sub 'getPirString' :method
# Body
# {
.annotate 'line', 2702
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2703
# str: $S1
    getattribute $P2, $P1, 'str'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2704
# typesinglequoted: $I1
    isa $I1, $P1, [ 'TokenSingleQuoted' ]
.annotate 'line', 2705
# need_unicode: $I2
    null $I2
.annotate 'line', 2706
    box $P2, $S1
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $I3, $P3
# {
.annotate 'line', 2707
    le $I3, 127, __label_4
# {
.annotate 'line', 2708
    set $I2, 1
    goto __label_3 # break
.annotate 'line', 2709
# }
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
.annotate 'line', 2712
    unless $I2 goto __label_5
# {
.annotate 'line', 2713
    unless $I1 goto __label_6
# {
.annotate 'line', 2714
    null $I1
.annotate 'line', 2715
# saux: $S2
    set $S2, $S1
.annotate 'line', 2716
    set $S1, ''
.annotate 'line', 2717
    box $P2, $S2
    iter $P4, $P2
    set $P4, 0
  __label_7: # for iteration
    unless $P4 goto __label_8
    shift $S3, $P4
# {
.annotate 'line', 2718
    ne $S3, '\', __label_9
.annotate 'line', 2719
    set $S3, '\\'
  __label_9: # endif
.annotate 'line', 2720
    concat $S1, $S1, $S3
# }
    goto __label_7
  __label_8: # endfor
# }
  __label_6: # endif
.annotate 'line', 2723
# result: $S4
    set $S4, ''
.annotate 'line', 2724
    box $P2, $S1
    iter $P5, $P2
    set $P5, 0
  __label_10: # for iteration
    unless $P5 goto __label_11
    shift $S5, $P5
# {
.annotate 'line', 2725
# n: $I4
# predefined ord
    ord $I4, $S5
.annotate 'line', 2726
    le $I4, 127, __label_12
# {
.annotate 'line', 2727
# h: $S6
    box $P6, $I4
    $P2 = $P6.'get_as_base'(16)
    null $S6
    if_null $P2, __label_14
    set $S6, $P2
  __label_14:
.annotate 'line', 2728
    concat $S4, $S4, '\x{'
    concat $S4, $S4, $S6
    concat $S4, $S4, '}'
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 2731
    concat $S4, $S4, $S5
  __label_13: # endif
# }
    goto __label_10
  __label_11: # endfor
.annotate 'line', 2733
    set $S1, $S4
# }
  __label_5: # endif
.annotate 'line', 2735
# q: $S7
    unless $I1 goto __label_16
    set $S7, "'"
    goto __label_15
  __label_16:
    set $S7, '"'
  __label_15:
.annotate 'line', 2736
    concat $S0, $S7, $S1
    concat $S0, $S0, $S7
    set $S1, $S0
.annotate 'line', 2737
    unless $I2 goto __label_17
.annotate 'line', 2738
    concat $S0, 'unicode:', $S1
    set $S1, $S0
  __label_17: # endif
.annotate 'line', 2739
    .return($S1)
# }
.annotate 'line', 2740

.end # getPirString


.sub 'get_value' :method
# Body
# {
.annotate 'line', 2743
# var strtok: $P1
    getattribute $P1, self, 'strval'
.annotate 'line', 2744
# str: $S1
    getattribute $P3, $P1, 'str'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 2745
    isa $I1, $P1, [ 'TokenQuoted' ]
    unless $I1 goto __label_2
# {
.annotate 'line', 2746
# var s: $P2
    box $P2, $S1
.annotate 'line', 2747
    $P3 = $P2.'unescape'('utf8')
    set $S1, $P3
# }
  __label_2: # endif
.annotate 'line', 2749
    .return($S1)
# }
.annotate 'line', 2750

.end # get_value


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2753
    set $S1, __ARG_2
    eq $S1, '', __label_1
.annotate 'line', 2754
    $P1 = self.'getPirString'()
    __ARG_1.'emitset'(__ARG_2, $P1)
  __label_1: # endif
# }
.annotate 'line', 2755

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2758
    .tailcall self.'getPirString'()
# }
.annotate 'line', 2759

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringLiteral' ]
.annotate 'line', 2690
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2692
    addattribute $P0, 'strval'
.end
.namespace [ 'IntegerLiteral' ]

.sub 'IntegerLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3 :optional
        .param int __ARG_4 :opt_flag
# Body
# {
.annotate 'line', 2771
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2772
    setattribute self, 'pos', __ARG_2
.annotate 'line', 2773
# n: $I1
    null $I1
.annotate 'line', 2774
    unless __ARG_4 goto __label_1
.annotate 'line', 2775
    set $I1, __ARG_3
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2777
# aux: $S1
    set $P1, __ARG_2
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 2778
    set $I1, $S1
# }
  __label_2: # endif
.annotate 'line', 2780
    box $P1, $I1
    setattribute self, 'numval', $P1
# }
.annotate 'line', 2781

.end # IntegerLiteral


.sub 'isintegerliteral' :method
# Body
# {
.annotate 'line', 2782
    .return(1)
# }

.end # isintegerliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2783
    .return('I')
# }

.end # checkresult


.sub 'getIntegerValue' :method
# Body
# {
.annotate 'line', 2786
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
# predefined int
.annotate 'line', 2785
    set $I1, $S1
.annotate 'line', 2787
    .return($I1)
# }
.annotate 'line', 2788

.end # getIntegerValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2791
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2792
# value: $I1
    $P1 = self.'getIntegerValue'()
    set $I1, $P1
.annotate 'line', 2793
    ne $I1, 0, __label_2
.annotate 'line', 2794
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_3
  __label_2: # else
.annotate 'line', 2796
    __ARG_1.'emitset'(__ARG_2, $I1)
  __label_3: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 2798

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2801
    .tailcall self.'getIntegerValue'()
# }
.annotate 'line', 2802

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntegerLiteral' ]
.annotate 'line', 2764
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2766
    addattribute $P0, 'pos'
.annotate 'line', 2767
    addattribute $P0, 'numval'
.end
.namespace [ 'FloatLiteral' ]

.sub 'FloatLiteral' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2812
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2813
    setattribute self, 'numval', __ARG_2
# }
.annotate 'line', 2814

.end # FloatLiteral


.sub 'isfloatliteral' :method
# Body
# {
.annotate 'line', 2815
    .return(1)
# }

.end # isfloatliteral


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2816
    .return('N')
# }

.end # checkresult


.sub 'getFloatValue' :method
# Body
# {
.annotate 'line', 2819
# aux: $S1
    getattribute $P2, self, 'numval'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 2820
# var n: $P1
    new $P1, [ 'Float' ]
.annotate 'line', 2821
    assign $P1, $S1
.annotate 'line', 2822
    .return($P1)
# }
.annotate 'line', 2823

.end # getFloatValue


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2826
    set $S1, __ARG_2
    eq $S1, '', __label_1
# {
.annotate 'line', 2827
# var n: $P1
    $P1 = self.'getFloatValue'()
.annotate 'line', 2828
    __ARG_1.'emitset'(__ARG_2, $P1)
# }
  __label_1: # endif
# }
.annotate 'line', 2830

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2835
# aux: $S1
    getattribute $P1, self, 'numval'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2836
# predefined indexof
    index $I1, $S1, '.'
    ge $I1, 0, __label_2
.annotate 'line', 2837
    concat $S1, $S1, '.0'
  __label_2: # endif
.annotate 'line', 2838
    .return($S1)
# }
.annotate 'line', 2839

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatLiteral' ]
.annotate 'line', 2807
    get_class $P1, [ 'Literal' ]
    addparent $P0, $P1
.annotate 'line', 2809
    addattribute $P0, 'numval'
.end
.namespace [ 'IdentifierExpr' ]

.sub 'isidentifier' :method
# Body
# {
.annotate 'line', 2848
    .return(1)
# }

.end # isidentifier


.sub 'IdentifierExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2851
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 2852
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 2853

.end # IdentifierExpr


.sub 'isnull' :method
# Body
# {
.annotate 'line', 2856
    getattribute $P1, self, 'name'
    .tailcall $P1.'iskeyword'('null')
# }
.annotate 'line', 2857

.end # isnull


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 2860
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2861
    if_null $P1, __label_1
.annotate 'line', 2862
    .tailcall $P1.'gettype'()
    goto __label_2
  __label_1: # else
# {
# switch
.annotate 'line', 2864
    getattribute $P2, self, 'name'
    set $S1, $P2
    set $S2, 'self'
    if $S1 == $S2 goto __label_5
    set $S2, 'null'
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
  __label_6: # case
.annotate 'line', 2867
    .return('P')
  __label_4: # default
.annotate 'line', 2869
    .return('')
  __label_3: # switch end
# }
  __label_2: # endif
# }
.annotate 'line', 2872

.end # checkresult


.sub 'getName' :method
# Body
# {
.annotate 'line', 2875
# s: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 2876
    .return($S1)
# }
.annotate 'line', 2877

.end # getName


.sub 'checkIdentifier' :method
# Body
# {
.annotate 'line', 2880
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2881
    unless_null $P1, __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 2882
    $P3('Bad thing')
  __label_1: # endif
.annotate 'line', 2883
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'($P1)
.annotate 'line', 2884
# s: $S1
    null $S1
.annotate 'line', 2885
    unless_null $P2, __label_2
# {
.annotate 'line', 2886
# sname: $S2
    set $P4, $P1
    null $S2
    if_null $P4, __label_4
    set $S2, $P4
  __label_4:
# switch
.annotate 'line', 2887
    set $S3, $S2
    set $S4, 'self'
    if $S3 == $S4 goto __label_7
    set $S4, 'null'
    if $S3 == $S4 goto __label_8
    goto __label_6
  __label_7: # case
.annotate 'line', 2889
    set $S1, 'self'
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 2891
    set $S1, 'null'
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 2893
    set $S1, ''
  __label_5: # switch end
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 2897
    $P4 = $P2.'getreg'()
    set $S1, $P4
  __label_3: # endif
.annotate 'line', 2898
    .return($S1)
# }
.annotate 'line', 2899

.end # checkIdentifier


.sub 'getIdentifier' :method
# Body
# {
.annotate 'line', 2902
# var value: $P1
    $P1 = self.'checkIdentifier'()
.annotate 'line', 2903
    set $S1, $P1
    ne $S1, '', __label_1
.const 'Sub' $P2 = 'WSubId_59'
.annotate 'line', 2904
    getattribute $P3, self, 'name'
    $P2($P3)
  __label_1: # endif
.annotate 'line', 2905
    .return($P1)
# }
.annotate 'line', 2906

.end # getIdentifier


.sub 'optimize' :method
# Body
# {
.annotate 'line', 2909
# var name: $P1
    getattribute $P1, self, 'name'
.annotate 'line', 2910
# var desc: $P2
    getattribute $P4, self, 'owner'
    $P2 = $P4.'getvar'($P1)
.annotate 'line', 2911
    if_null $P2, __label_1
# {
.annotate 'line', 2912
    $P4 = $P2.'isconst'()
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 2913
    .tailcall $P2.'getvalue'()
  __label_3: # endif
.annotate 'line', 2914
# flags: $I1
    $P4 = $P2.'getflags'()
    set $I1, $P4
.annotate 'line', 2915
    band $I2, $I1, 1
    unless $I2 goto __label_4
# {
.annotate 'line', 2916
    band $I3, $I1, 2
    unless $I3 goto __label_5
.annotate 'line', 2917
    new $P5, [ 'LexicalVolatileExpr' ]
    $P5.'LexicalVolatileExpr'(self, $P2)
    set $P4, $P5
    .return($P4)
  __label_5: # endif
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 2921
# var sym: $P3
    root_new $P4, ['parrot';'ResizablePMCArray']
    getattribute $P6, self, 'name'
    push $P4, $P6
    $P3 = self.'findsymbol'($P4)
.annotate 'line', 2922
    if_null $P3, __label_6
# {
.annotate 'line', 2923
# id: $S1
    $P4 = $P3.'makesubid'()
    null $S1
    if_null $P4, __label_7
    set $S1, $P4
  __label_7:
.annotate 'line', 2924
    box $P4, $S1
    setattribute self, 'subid', $P4
# }
  __label_6: # endif
# }
  __label_2: # endif
.annotate 'line', 2927
    .return(self)
# }
.annotate 'line', 2928

.end # optimize


.sub 'emit_getid' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2931
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
# {
.annotate 'line', 2932
# id: $S1
    getattribute $P3, self, 'subid'
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 2933
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createreg'('P')
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 2934
    concat $S5, ".const 'Sub' ", $S2
    concat $S5, $S5, " = '"
    concat $S5, $S5, $S1
    concat $S5, $S5, "'"
    __ARG_1.'say'($S5)
.annotate 'line', 2935
    .return($S2)
# }
  __label_1: # endif
.annotate 'line', 2937
# id: $S3
    $P2 = self.'getIdentifier'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 2938
# var desc: $P1
    getattribute $P2, self, 'owner'
    getattribute $P3, self, 'name'
    $P1 = $P2.'getvar'($P3)
.annotate 'line', 2939
# flags: $I1
    unless_null $P1, __label_6
    null $I1
    goto __label_5
  __label_6:
    $I1 = $P1.'getflags'()
  __label_5:
.annotate 'line', 2940
    band $I2, $I1, 1
    unless $I2 goto __label_7
# {
.annotate 'line', 2941
    band $I3, $I1, 2
    unless $I3 goto __label_8
# {
.annotate 'line', 2942
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_9
    set $S4, $P2
  __label_9:
.annotate 'line', 2943
    isnull $I2, $S4
    not $I2
    unless $I2 goto __label_11
    isne $I2, $S4, ''
  __label_11:
    unless $I2 goto __label_10
.annotate 'line', 2944
    __ARG_1.'emitfind_lex'($S3, $S4)
  __label_10: # endif
# }
  __label_8: # endif
# }
  __label_7: # endif
.annotate 'line', 2947
    .return($S3)
# }
.annotate 'line', 2948

.end # emit_getid


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2951
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 2952
    self.'annotate'(__ARG_1)
.annotate 'line', 2953
# id: $S1
    $P1 = self.'emit_getid'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2954
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 2956

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 2959
    self.'annotate'(__ARG_1)
.annotate 'line', 2960
    .tailcall self.'emit_getid'(__ARG_1)
# }
.annotate 'line', 2961

.end # emit_get


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 2964
    self.'annotate'(__ARG_1)
.annotate 'line', 2965
    $P1 = self.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# predefined die
.annotate 'line', 2966
    die "NO"
  __label_1: # endif
.annotate 'line', 2967
# typeleft: $S1
    $P1 = self.'checkresult'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 2968
# lreg: $S2
    $P1 = self.'getIdentifier'()
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 2969
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_4
    unless $P1 goto __label_4
# {
# switch
.annotate 'line', 2970
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_8
    set $S6, 'P'
    if $S5 == $S6 goto __label_9
    goto __label_7
  __label_8: # case
  __label_9: # case
.annotate 'line', 2973
    __ARG_1.'emitnull'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 2974
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 2976
    getattribute $P3, self, 'start'
    $P2("Can't assign null to that type", $P3)
  __label_6: # switch end
# }
    goto __label_5
  __label_4: # else
.annotate 'line', 2979
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    unless $I1 goto __label_10
.annotate 'line', 2980
    __ARG_2.'emit'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 2982
# typeright: $S3
    $P1 = __ARG_2.'checkresult'()
    null $S3
    if_null $P1, __label_12
    set $S3, $P1
  __label_12:
.annotate 'line', 2983
    ne $S3, 'v', __label_13
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 2984
    getattribute $P1, self, 'start'
    $P4("Can't assign from void expression", $P1)
  __label_13: # endif
.annotate 'line', 2985
    ne $S1, $S3, __label_14
# {
.annotate 'line', 2986
    __ARG_2.'emit'(__ARG_1, $S2)
# }
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 2989
# rreg: $S4
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_16
    set $S4, $P1
  __label_16:
.annotate 'line', 2990
    self.'annotate'(__ARG_1)
.annotate 'line', 2991
    iseq $I1, $S1, 'P'
    unless $I1 goto __label_19
    isne $I1, $S3, 'P'
  __label_19:
    unless $I1 goto __label_17
.annotate 'line', 2992
    __ARG_1.'emitbox'($S2, $S4)
    goto __label_18
  __label_17: # else
.annotate 'line', 2994
    __ARG_1.'emitset'($S2, $S4)
  __label_18: # endif
# }
  __label_15: # endif
# }
  __label_11: # endif
  __label_5: # endif
.annotate 'line', 2997
    .return($S2)
# }
.annotate 'line', 2998

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IdentifierExpr' ]
.annotate 'line', 2844
    get_class $P1, [ 'SimpleExpr' ]
    addparent $P0, $P1
.annotate 'line', 2846
    addattribute $P0, 'name'
.annotate 'line', 2847
    addattribute $P0, 'subid'
.end
.namespace [ 'LexicalVolatileExpr' ]

.sub 'LexicalVolatileExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3008
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3009
    setattribute self, 'desc', __ARG_2
# }
.annotate 'line', 3010

.end # LexicalVolatileExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3011
    .return('P')
# }

.end # checkresult


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3014
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3015
# lexname: $S1
    $P2 = $P1.'getlex'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3016
# reg: $S2
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 3017
    __ARG_1.'emitfind_lex'($S2, $S1)
.annotate 'line', 3018
    .return($S2)
# }
.annotate 'line', 3019

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3022
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 3023
    self.'annotate'(__ARG_1)
.annotate 'line', 3024
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 3025
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_1: # endif
# }
.annotate 'line', 3027

.end # emit


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3030
# lreg: $S1
    getattribute $P3, self, 'owner'
    $P2 = $P3.'tempreg'('P')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
# switch-case
.annotate 'line', 3032
    $I1 = __ARG_2.'isnull'()
    if $I1 goto __label_4
.annotate 'line', 3035
    isa $I1, __ARG_2, [ 'IndexExpr' ]
    if $I1 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3033
    __ARG_1.'emitnull'($S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3036
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3039
# typeright: $S2
    $P2 = __ARG_2.'checkresult'()
    null $S2
    if_null $P2, __label_6
    set $S2, $P2
  __label_6:
.annotate 'line', 3040
    ne 'P', $S2, __label_7
.annotate 'line', 3041
    __ARG_2.'emit'(__ARG_1, $S1)
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3043
# rreg: $S3
    $P3 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_9
    set $S3, $P3
  __label_9:
.annotate 'line', 3044
    self.'annotate'(__ARG_1)
.annotate 'line', 3045
    __ARG_1.'emitbox'($S1, $S3)
# }
  __label_8: # endif
  __label_2: # switch end
.annotate 'line', 3049
# var desc: $P1
    getattribute $P1, self, 'desc'
.annotate 'line', 3050
# lexname: $S4
    $P2 = $P1.'getlex'()
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
.annotate 'line', 3051
    __ARG_1.'say'("store_lex '", $S4, "', ", $S1)
# }
.annotate 'line', 3052

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LexicalVolatileExpr' ]
.annotate 'line', 3003
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3005
    addattribute $P0, 'desc'
.end
.namespace [ 'OpExpr' ]

.sub 'initop' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3061
    self.'Expr'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3062

.end # initop

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExpr' ]
.annotate 'line', 3057
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpClassExpr' ]

.sub 'OpClassExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3073
    self.'initop'(__ARG_2, __ARG_3)
.annotate 'line', 3074
.const 'Sub' $P3 = 'WSubId_60'
    $P2 = $P3(__ARG_1, __ARG_2)
    setattribute self, 'clspec', $P2
# }
.annotate 'line', 3075

.end # OpClassExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3076
    .return('P')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3079
# var clspec: $P1
    getattribute $P1, self, 'clspec'
.annotate 'line', 3082
    set $S1, __ARG_2
    ne $S1, '', __label_1
.annotate 'line', 3083
    getattribute $P2, self, 'owner'
    __ARG_2 = $P2.'tempreg'('P')
  __label_1: # endif
.annotate 'line', 3084
    __ARG_1.'print'('    get_class ', __ARG_2, ', ')
.annotate 'line', 3085
    getattribute $P2, self, 'owner'
    $P1.'emit'(__ARG_1, $P2)
.annotate 'line', 3086
    __ARG_1.'say'()
# }
.annotate 'line', 3087

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpClassExpr' ]
.annotate 'line', 3067
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3069
    addattribute $P0, 'clspec'
.end
.namespace [ 'OpUnaryExpr' ]

.sub 'OpUnaryExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3097
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3098
    setattribute self, 'subexpr', __ARG_3
# }
.annotate 'line', 3099

.end # OpUnaryExpr


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3102
    getattribute $P3, self, 'subexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'subexpr', $P2
# }
.annotate 'line', 3103

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3106
    self.'optimizearg'()
.annotate 'line', 3107
    .return(self)
# }
.annotate 'line', 3108

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryExpr' ]
.annotate 'line', 3092
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3094
    addattribute $P0, 'subexpr'
.end
.namespace [ 'OpBinaryExpr' ]

.sub 'initbinary' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3119
    self.'initop'(__ARG_1, __ARG_2)
.annotate 'line', 3120
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3121
    setattribute self, 'rexpr', __ARG_4
# }
.annotate 'line', 3122

.end # initbinary


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3125
    self.'initbinary'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 3126
    .return(self)
# }
.annotate 'line', 3127

.end # set


.sub 'setfrom' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3130
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    getattribute $P3, __ARG_1, 'lexpr'
    getattribute $P4, __ARG_1, 'rexpr'
    .tailcall self.'set'($P1, $P2, $P3, $P4)
# }
.annotate 'line', 3131

.end # setfrom


.sub 'optimizearg' :method
# Body
# {
.annotate 'line', 3134
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3135
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
# }
.annotate 'line', 3136

.end # optimizearg


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3139
    self.'optimizearg'()
.annotate 'line', 3140
    .return(self)
# }
.annotate 'line', 3141

.end # optimize


.sub 'emit_intleft' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3144
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3145

.end # emit_intleft


.sub 'emit_intright' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3148
    getattribute $P1, self, 'rexpr'
    .tailcall $P1.'emit_getint'(__ARG_1)
# }
.annotate 'line', 3149

.end # emit_intright

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryExpr' ]
.annotate 'line', 3113
    get_class $P1, [ 'OpExpr' ]
    addparent $P0, $P1
.annotate 'line', 3115
    addattribute $P0, 'lexpr'
.annotate 'line', 3116
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpBinaryIntExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3158
    .return('I')
# }
.annotate 'line', 3159

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3162
    self.'optimizearg'()
.annotate 'line', 3163
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3164
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3165
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3166
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3167
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3168
.const 'Sub' $P4 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    $P6 = self.'do_op'($I1, $I2)
    .tailcall $P4($P3, $P5, $P6)
# }
  __label_1: # endif
.annotate 'line', 3170
    .return(self)
# }
.annotate 'line', 3171

.end # optimize

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinaryIntExpr' ]
.annotate 'line', 3154
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDelExBase' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3180
    .return('I')
# }
.annotate 'line', 3181

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDelExBase' ]
.annotate 'line', 3176
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDeleteExpr' ]

.sub 'OpDeleteExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3189
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3190

.end # OpDeleteExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3193
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3194
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_3
    $P2 = $P1.'checkresult'()
    set $S1, $P2
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 3195
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3196
    self.'annotate'(__ARG_1)
.annotate 'line', 3197
    __ARG_1.'print'('    delete ')
.annotate 'line', 3198
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3199
    __ARG_1.'say'()
.annotate 'line', 3200
    set $S1, __ARG_2
    eq $S1, '', __label_4
.annotate 'line', 3201
    __ARG_1.'emitset'(__ARG_2, '1')
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 3204
    getattribute $P2, self, 'start'
    $P3("delete with invalid operator", $P2)
  __label_2: # endif
# }
.annotate 'line', 3205

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDeleteExpr' ]
.annotate 'line', 3185
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpExistsExpr' ]

.sub 'OpExistsExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3212
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3213

.end # OpExistsExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3216
# var expr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3217
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
.annotate 'line', 3218
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_6
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    isne $I1, $S2, 'S'
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 3219
    $P1.'emit_prep'(__ARG_1)
.annotate 'line', 3220
    self.'annotate'(__ARG_1)
.annotate 'line', 3221
    __ARG_1.'print'('    exists ', $S1, ', ')
.annotate 'line', 3222
    $P1.'emit_aux'(__ARG_1)
.annotate 'line', 3223
    __ARG_1.'say'()
# }
    goto __label_5
  __label_4: # else
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 3226
    getattribute $P2, self, 'start'
    $P3("exists with invalid operator", $P2)
  __label_5: # endif
# }
.annotate 'line', 3227

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpExistsExpr' ]
.annotate 'line', 3208
    get_class $P1, [ 'OpDelExBase' ]
    addparent $P0, $P1
.end
.namespace [ 'OpUnaryMinusExpr' ]

.sub 'OpUnaryMinusExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3236
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3237

.end # OpUnaryMinusExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3240
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3241

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3244
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3245
    .return(self)
# }
.annotate 'line', 3246

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3249
    self.'optimizearg'()
.annotate 'line', 3250
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3251
# var numval: $P1
    getattribute $P5, self, 'subexpr'
    getattribute $P1, $P5, 'numval'
.annotate 'line', 3252
# i: $I1
    set $P3, $P1
    set $I1, $P3
.annotate 'line', 3253
.const 'Sub' $P6 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $I2, $I1
    .tailcall $P6($P3, $P4, $I2)
# }
  __label_1: # endif
# {
.annotate 'line', 3256
    getattribute $P4, self, 'subexpr'
    $P3 = $P4.'isfloatliteral'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 3257
# var numval: $P2
    getattribute $P5, self, 'subexpr'
    getattribute $P2, $P5, 'numval'
.annotate 'line', 3258
# n: $N1
# predefined string
    set $S1, $P2
    set $N1, $S1
.annotate 'line', 3259
.const 'Sub' $P7 = 'WSubId_61'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'subexpr'
    getattribute $P4, $P5, 'start'
    neg $N2, $N1
    .tailcall $P7($P3, $P4, $N2)
# }
  __label_2: # endif
# }
.annotate 'line', 3262
    .return(self)
# }
.annotate 'line', 3263

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3266
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3267
    self.'annotate'(__ARG_1)
.annotate 'line', 3268
    __ARG_1.'emitarg2'('neg', __ARG_2, $S1)
# }
.annotate 'line', 3269

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpUnaryMinusExpr' ]
.annotate 'line', 3232
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotExpr' ]

.sub 'OpNotExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3278
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3279

.end # OpNotExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3280
    .return(1)
# }

.end # isnegable


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3283
    .return('I')
# }
.annotate 'line', 3284

.end # checkresult


.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3287
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 3288
    .return(self)
# }
.annotate 'line', 3289

.end # set


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3292
    self.'optimizearg'()
.annotate 'line', 3293
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3294
    $P3 = $P1.'isintegerliteral'()
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 3295
# var numval: $P2
    getattribute $P2, $P1, 'numval'
.annotate 'line', 3296
# n: $I1
    set $P3, $P2
    set $I1, $P3
.annotate 'line', 3297
.const 'Sub' $P4 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P5, $P1, 'start'
    not $I2, $I1
    .tailcall $P4($P3, $P5, $I2)
# }
  __label_1: # endif
.annotate 'line', 3299
    $P3 = $P1.'isnegable'()
    if_null $P3, __label_2
    unless $P3 goto __label_2
.annotate 'line', 3300
    .tailcall $P1.'negated'()
  __label_2: # endif
.annotate 'line', 3301
    .return(self)
# }
.annotate 'line', 3302

.end # optimize


.sub 'negated' :method
# Body
# {
.annotate 'line', 3305
    getattribute $P1, self, 'subexpr'
    .return($P1)
# }
.annotate 'line', 3306

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3309
# var subexpr: $P1
    getattribute $P1, self, 'subexpr'
.annotate 'line', 3310
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 3311
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3312
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'I'
    if $S2 == $S3 goto __label_4
    set $S3, 'P'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 3314
    __ARG_1.'emitarg2'('not', __ARG_2, $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 3317
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 3320
    __ARG_1.'emitarg2'('isfalse', __ARG_2, $S1)
  __label_2: # switch end
# }
.annotate 'line', 3322

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotExpr' ]
.annotate 'line', 3274
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpIncDec' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3331
    getattribute $P1, self, 'subexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3332

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpIncDec' ]
.annotate 'line', 3327
    get_class $P1, [ 'OpUnaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncDec' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3341
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3342
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3343
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3344

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncDec' ]
.annotate 'line', 3337
    get_class $P1, [ 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreIncExpr' ]

.sub 'OpPreIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3351
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3352

.end # OpPreIncExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3355
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3356
    self.'annotate'(__ARG_1)
.annotate 'line', 3357
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3358
    .return($S1)
# }
.annotate 'line', 3359

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreIncExpr' ]
.annotate 'line', 3347
    get_class $P1, [ 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPreDecExpr' ]

.sub 'OpPreDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3366
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3367

.end # OpPreDecExpr


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3370
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3371
    self.'annotate'(__ARG_1)
.annotate 'line', 3372
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3373
    .return($S1)
# }
.annotate 'line', 3374

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPreDecExpr' ]
.annotate 'line', 3362
    get_class $P1, [ 'OpPreIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostIncExpr' ]

.sub 'OpPostIncExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3383
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3384

.end # OpPostIncExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3387
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3388
    self.'annotate'(__ARG_1)
.annotate 'line', 3389
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3390
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3391
    __ARG_1.'emitinc'($S1)
.annotate 'line', 3392
    .return($S1)
# }
.annotate 'line', 3393

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostIncExpr' ]
.annotate 'line', 3379
    get_class $P1, [ 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpPostDecExpr' ]

.sub 'OpPostDecExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 3400
    self.'OpUnaryExpr'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 3401

.end # OpPostDecExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3404
# reg: $S1
    getattribute $P2, self, 'subexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3405
    self.'annotate'(__ARG_1)
.annotate 'line', 3406
    set $S2, __ARG_2
    eq $S2, '', __label_2
.annotate 'line', 3407
    __ARG_1.'emitset'(__ARG_2, $S1)
  __label_2: # endif
.annotate 'line', 3408
    __ARG_1.'emitdec'($S1)
.annotate 'line', 3409
    .return($S1)
# }
.annotate 'line', 3410

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpPostDecExpr' ]
.annotate 'line', 3396
    get_class $P1, [ 'OpIncDec' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseAssignExpr' ]

.sub 'set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 3421
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 3422
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 3423
    setattribute self, 'rexpr', __ARG_4
.annotate 'line', 3424
    .return(self)
# }
.annotate 'line', 3425

.end # set


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3428
    getattribute $P1, self, 'lexpr'
    .tailcall $P1.'checkresult'()
# }
.annotate 'line', 3429

.end # checkresult


.sub 'optimize_base' :method
# Body
# {
.annotate 'line', 3432
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 3433
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'rexpr', $P2
.annotate 'line', 3434
    .return(self)
# }
.annotate 'line', 3435

.end # optimize_base


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3438
    .tailcall self.'optimize_base'()
# }
.annotate 'line', 3439

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3442
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3443
    set $S2, __ARG_2
    eq $S2, '', __label_2
# {
.annotate 'line', 3444
    self.'annotate'(__ARG_1)
.annotate 'line', 3445
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
  __label_2: # endif
# }
.annotate 'line', 3447

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseAssignExpr' ]
.annotate 'line', 3415
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3417
    addattribute $P0, 'lexpr'
.annotate 'line', 3418
    addattribute $P0, 'rexpr'
.end
.namespace [ 'OpAssignExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3456
    self.'annotate'(__ARG_1)
.annotate 'line', 3457
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3458
    getattribute $P2, self, 'rexpr'
    .tailcall $P1.'emit_assign_get'(__ARG_1, $P2)
# }
.annotate 'line', 3459

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignExpr' ]
.annotate 'line', 3452
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAssignToExpr' ]

.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3468
    self.'annotate'(__ARG_1)
.annotate 'line', 3469
# reg: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3470
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 3471
    __ARG_1.'emitassign'(__ARG_2, $S1)
  __label_2: # endif
# }
.annotate 'line', 3472

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3475
    self.'annotate'(__ARG_1)
.annotate 'line', 3476
# reg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3477
# reg2: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3478
    __ARG_1.'emitassign'($S1, $S2)
.annotate 'line', 3479
    .return($S1)
# }
.annotate 'line', 3480

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAssignToExpr' ]
.annotate 'line', 3464
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpAddToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3489
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3490
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3491
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3492
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3493
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3494
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_6
    isa $I1, $P2, [ 'ConcatString' ]
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 3495
    $P2.'emit_concat_to'(__ARG_1, $S3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 3497
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_7
    set $S4, $P3
  __label_7:
.annotate 'line', 3498
# aux: $S5
    null $S5
.annotate 'line', 3499
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3500
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_10
    set $S7, 'I'
    if $S6 == $S7 goto __label_11
    set $S7, 'N'
    if $S6 == $S7 goto __label_12
    goto __label_9
  __label_10: # case
.annotate 'line', 3502
    eq $S2, 'S', __label_13
# {
.annotate 'line', 3503
    $P3 = self.'tempreg'('S')
    set $S5, $P3
.annotate 'line', 3504
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3505
    set $S4, $S5
# }
  __label_13: # endif
.annotate 'line', 3507
    __ARG_1.'emitconcat1'($S3, $S4)
    goto __label_8 # break
  __label_11: # case
  __label_12: # case
.annotate 'line', 3511
    eq $S1, $S2, __label_14
# {
.annotate 'line', 3512
    $P3 = self.'tempreg'($S1)
    set $S5, $P3
.annotate 'line', 3513
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3514
    set $S4, $S5
# }
  __label_14: # endif
.annotate 'line', 3516
    __ARG_1.'emitaddto'($S3, $S4)
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 3519
    __ARG_1.'emitaddto'($S3, $S4)
  __label_8: # switch end
# }
  __label_5: # endif
.annotate 'line', 3522
    .return($S3)
# }
.annotate 'line', 3523

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddToExpr' ]
.annotate 'line', 3485
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3532
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3533
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3534
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 3535
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 3536
# reg: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 3537
# reg2: $S4
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 3538
# aux: $S5
    null $S5
.annotate 'line', 3539
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 3540
    set $S6, $S1
    set $S7, 'S'
    if $S6 == $S7 goto __label_7
    set $S7, 'I'
    if $S6 == $S7 goto __label_8
    set $S7, 'N'
    if $S6 == $S7 goto __label_9
    goto __label_6
  __label_7: # case
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 3542
    getattribute $P3, self, 'start'
    $P4("-= can't be applied to string", $P3)
  __label_8: # case
  __label_9: # case
.annotate 'line', 3545
    eq $S1, $S2, __label_10
# {
.annotate 'line', 3546
    $P5 = self.'tempreg'($S1)
    set $S5, $P5
.annotate 'line', 3547
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3548
    set $S4, $S5
# }
  __label_10: # endif
.annotate 'line', 3550
    __ARG_1.'emitsubto'($S3, $S4)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 3553
    __ARG_1.'emitsubto'($S3, $S4)
  __label_5: # switch end
.annotate 'line', 3555
    .return($S3)
# }
.annotate 'line', 3556

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubToExpr' ]
.annotate 'line', 3528
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3565
# ltype: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3566
# rtype: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3567
# lreg: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3568
# rreg: $S4
    null $S4
# switch
.annotate 'line', 3569
    set $S5, $S1
    set $S6, 'S'
    if $S5 == $S6 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 3571
    ne $S2, 'I', __label_7
.annotate 'line', 3572
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
    goto __label_8
  __label_7: # else
# {
.annotate 'line', 3574
    $P3 = self.'tempreg'('I')
    set $S4, $P3
.annotate 'line', 3575
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S4)
# }
  __label_8: # endif
.annotate 'line', 3577
    self.'annotate'(__ARG_1)
.annotate 'line', 3578
    __ARG_1.'emitrepeat'($S3, $S3, $S4)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 3581
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    set $S4, $P1
.annotate 'line', 3582
    self.'annotate'(__ARG_1)
.annotate 'line', 3583
    __ARG_1.'emitarg2'('mul', $S3, $S4)
  __label_4: # switch end
.annotate 'line', 3585
    .return($S3)
# }
.annotate 'line', 3586

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulToExpr' ]
.annotate 'line', 3561
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3595
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3596
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3597
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3598
    self.'annotate'(__ARG_1)
.annotate 'line', 3599
    __ARG_1.'emitarg2'('div', $S2, $S3)
.annotate 'line', 3600
    .return($S2)
# }
.annotate 'line', 3601

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivToExpr' ]
.annotate 'line', 3591
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModToExpr' ]

.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 3610
# type: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3611
# reg: $S2
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3612
# reg2: $S3
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3613
    self.'annotate'(__ARG_1)
.annotate 'line', 3614
    __ARG_1.'emitarg2'('mod', $S2, $S3)
.annotate 'line', 3615
    .return($S2)
# }
.annotate 'line', 3616

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModToExpr' ]
.annotate 'line', 3606
    get_class $P1, [ 'OpBaseAssignExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ComparatorBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3623
    .return('I')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3626
    self.'optimizearg'()
.annotate 'line', 3627
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3628
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3629
    $I3 = $P1.'isintegerliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isintegerliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 3630
# li: $I1
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I1, $P3
.annotate 'line', 3631
# ri: $I2
# predefined int
    getattribute $P3, $P2, 'numval'
    set $I2, $P3
.annotate 'line', 3632
.const 'Sub' $P4 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    $P6 = self.'int_op'($I1, $I2)
    .tailcall $P4($P3, $P5, $P6)
# }
  __label_1: # endif
.annotate 'line', 3634
    .return(self)
# }
.annotate 'line', 3635

.end # optimize


.sub 'emit_comparator' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 3638
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3639
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 3640
# regl: $S3
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 3641
# regr: $S4
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P1, __label_4
    set $S4, $P1
  __label_4:
.annotate 'line', 3642
    self.'annotate'(__ARG_1)
.annotate 'line', 3643
# aux: $S5
    null $S5
# switch-case
.annotate 'line', 3645
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_8
    iseq $I1, $S2, 'N'
  __label_8:
    if $I1 goto __label_7
.annotate 'line', 3650
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_10
    iseq $I1, $S2, 'I'
  __label_10:
    if $I1 goto __label_9
.annotate 'line', 3655
    iseq $I1, $S2, 'I'
    unless $I1 goto __label_12
    iseq $I1, $S1, 'P'
  __label_12:
    if $I1 goto __label_11
.annotate 'line', 3660
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_14
    iseq $I1, $S1, 'I'
  __label_14:
    if $I1 goto __label_13
.annotate 'line', 3665
    iseq $I1, $S2, 'S'
    unless $I1 goto __label_16
    iseq $I1, $S1, 'P'
  __label_16:
    if $I1 goto __label_15
.annotate 'line', 3670
    iseq $I1, $S2, 'P'
    unless $I1 goto __label_18
    iseq $I1, $S1, 'S'
  __label_18:
    if $I1 goto __label_17
    goto __label_6
  __label_7: # case
.annotate 'line', 3646
    $P1 = self.'tempreg'('N')
    set $S5, $P1
.annotate 'line', 3647
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3648
    set $S3, $S5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 3651
    $P2 = self.'tempreg'('N')
    set $S5, $P2
.annotate 'line', 3652
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3653
    set $S4, $S5
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 3656
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 3657
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3658
    set $S3, $S5
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 3661
    $P4 = self.'tempreg'('I')
    set $S5, $P4
.annotate 'line', 3662
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3663
    set $S4, $S5
    goto __label_5 # break
  __label_15: # case
.annotate 'line', 3666
    $P5 = self.'tempreg'('S')
    set $S5, $P5
.annotate 'line', 3667
    __ARG_1.'emitset'($S5, $S3)
.annotate 'line', 3668
    set $S3, $S5
    goto __label_5 # break
  __label_17: # case
.annotate 'line', 3671
    $P6 = self.'tempreg'('S')
    set $S5, $P6
.annotate 'line', 3672
    __ARG_1.'emitset'($S5, $S4)
.annotate 'line', 3673
    set $S4, $S5
    goto __label_5 # break
  __label_6: # default
  __label_5: # switch end
.annotate 'line', 3674
# switch
.annotate 'line', 3677
    set $I1, __ARG_3
    null $I2
    if $I1 == $I2 goto __label_21
    set $I2, 1
    if $I1 == $I2 goto __label_22
    set $I2, 2
    if $I1 == $I2 goto __label_23
    goto __label_20
  __label_21: # case
.annotate 'line', 3679
    self.'emitop'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_22: # case
.annotate 'line', 3682
    self.'emitop_if'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_23: # case
.annotate 'line', 3685
    self.'emitop_else'(__ARG_1, __ARG_2, $S3, $S4)
    goto __label_19 # break
  __label_20: # default
  __label_19: # switch end
.annotate 'line', 3686
# }
.annotate 'line', 3688

.end # emit_comparator


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3691
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3692

.end # emit


.sub 'emit_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3695
    self.'emit_comparator'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 3696

.end # emit_if


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3699
    self.'emit_comparator'(__ARG_1, __ARG_2, 2)
# }
.annotate 'line', 3700

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ComparatorBaseExpr' ]
.annotate 'line', 3621
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'NullCheckerExpr' ]

.sub 'NullCheckerExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3
# Body
# {
.annotate 'line', 3715
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 3716
    setattribute self, 'expr', __ARG_2
.annotate 'line', 3717
    box $P1, __ARG_3
    setattribute self, 'checknull', $P1
# }
.annotate 'line', 3718

.end # NullCheckerExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 3719
    .return('I')
# }

.end # checkresult


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3720
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3723
# checkneg: $I1
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
.annotate 'line', 3724
    box $P1, $I1
    setattribute self, 'checknull', $P1
.annotate 'line', 3725
    .return(self)
# }
.annotate 'line', 3726

.end # negated


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3729
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3730
    self.'annotate'(__ARG_1)
.annotate 'line', 3731
    __ARG_1.'emitarg2'('isnull', __ARG_2, $S1)
.annotate 'line', 3732
    getattribute $P1, self, 'checknull'
    isfalse $I1, $P1
    unless $I1 goto __label_2
.annotate 'line', 3733
    __ARG_1.'emitarg1'('not', __ARG_2)
  __label_2: # endif
# }
.annotate 'line', 3734

.end # emit


.sub 'emit_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 3737
# reg: $S1
    getattribute $P2, self, 'expr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 3738
    self.'annotate'(__ARG_1)
.annotate 'line', 3739
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
.annotate 'line', 3740

.end # emit_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NullCheckerExpr' ]
.annotate 'line', 3708
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 3710
    addattribute $P0, 'expr'
.annotate 'line', 3711
    addattribute $P0, 'checknull'
.end
.namespace [ 'OpEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3747
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3750
    new $P1, [ 'OpNotEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3751

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3754
    self.'optimizearg'()
.annotate 'line', 3755
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3756
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3757
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3758
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3759
    unless $I1 goto __label_1
# {
.annotate 'line', 3760
    unless $I2 goto __label_2
.annotate 'line', 3761
.const 'Sub' $P4 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    .tailcall $P4($P3, $P5, 1)
    goto __label_3
  __label_2: # else
.annotate 'line', 3763
    new $P7, [ 'NullCheckerExpr' ]
    getattribute $P8, self, 'rexpr'
    $P7.'NullCheckerExpr'(self, $P8, 1)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3765
    unless $I2 goto __label_4
.annotate 'line', 3766
    new $P5, [ 'NullCheckerExpr' ]
    getattribute $P6, self, 'lexpr'
    $P5.'NullCheckerExpr'(self, $P6, 1)
    set $P3, $P5
    .return($P3)
  __label_4: # endif
.annotate 'line', 3767
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3768
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3769
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3770
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3771
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3773
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3774
# ri: $I4
# predefined int
    getattribute $P5, $P2, 'numval'
    set $I4, $P5
.annotate 'line', 3775
.const 'Sub' $P9 = 'WSubId_21'
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    iseq $I5, $I3, $I4
    .tailcall $P9($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 3777
# ls: $S3
    getattribute $P10, $P1, 'strval'
    getattribute $P8, $P10, 'str'
    null $S3
    if_null $P8, __label_14
    set $S3, $P8
  __label_14:
.annotate 'line', 3778
# rs: $S4
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_15
    set $S4, $P11
  __label_15:
.annotate 'line', 3779
.const 'Sub' $P13 = 'WSubId_21'
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    iseq $I6, $S3, $S4
    .tailcall $P13($P14, $P15, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3783
    .return(self)
# }
.annotate 'line', 3784

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3787
    __ARG_1.'emitbinop'('iseq', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3788

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3791
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3792

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3795
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3796

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3799
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3800

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpEqualExpr' ]
.annotate 'line', 3745
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpNotEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3807
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3810
    new $P1, [ 'OpEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3811

.end # negated


.sub 'optimize' :method
# Body
# {
.annotate 'line', 3814
    self.'optimizearg'()
.annotate 'line', 3815
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 3816
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 3817
# lnull: $I1
    $P3 = $P1.'isnull'()
    set $I1, $P3
.annotate 'line', 3818
# rnull: $I2
    $P3 = $P2.'isnull'()
    set $I2, $P3
.annotate 'line', 3819
    unless $I1 goto __label_1
# {
.annotate 'line', 3820
    unless $I2 goto __label_2
.annotate 'line', 3821
.const 'Sub' $P4 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P5, self, 'start'
    .tailcall $P4($P3, $P5, 0)
    goto __label_3
  __label_2: # else
.annotate 'line', 3823
    new $P7, [ 'NullCheckerExpr' ]
    getattribute $P8, self, 'rexpr'
    $P7.'NullCheckerExpr'(self, $P8, 0)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 3825
    unless $I2 goto __label_4
.annotate 'line', 3826
    new $P5, [ 'NullCheckerExpr' ]
    getattribute $P6, self, 'lexpr'
    $P5.'NullCheckerExpr'(self, $P6, 0)
    set $P3, $P5
    .return($P3)
  __label_4: # endif
.annotate 'line', 3827
    $I5 = $P1.'isliteral'()
    unless $I5 goto __label_6
    $I5 = $P2.'isliteral'()
  __label_6:
    unless $I5 goto __label_5
# {
.annotate 'line', 3828
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 3829
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_8
    set $S2, $P3
  __label_8:
.annotate 'line', 3830
    ne $S1, $S2, __label_9
# {
# switch
.annotate 'line', 3831
    set $S5, $S1
    set $S6, 'I'
    if $S5 == $S6 goto __label_12
    set $S6, 'S'
    if $S5 == $S6 goto __label_13
    goto __label_11
  __label_12: # case
.annotate 'line', 3833
# li: $I3
# predefined int
    getattribute $P3, $P1, 'numval'
    set $I3, $P3
.annotate 'line', 3834
# ri: $I4
# predefined int
    getattribute $P5, $P2, 'numval'
    set $I4, $P5
.annotate 'line', 3835
.const 'Sub' $P9 = 'WSubId_21'
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'start'
    isne $I5, $I3, $I4
    .tailcall $P9($P6, $P7, $I5)
  __label_13: # case
.annotate 'line', 3837
# ls: $S3
    getattribute $P10, $P1, 'strval'
    getattribute $P8, $P10, 'str'
    null $S3
    if_null $P8, __label_14
    set $S3, $P8
  __label_14:
.annotate 'line', 3838
# rs: $S4
    getattribute $P12, $P2, 'strval'
    getattribute $P11, $P12, 'str'
    null $S4
    if_null $P11, __label_15
    set $S4, $P11
  __label_15:
.annotate 'line', 3839
.const 'Sub' $P13 = 'WSubId_21'
    getattribute $P14, self, 'owner'
    getattribute $P15, self, 'start'
    isne $I6, $S3, $S4
    .tailcall $P13($P14, $P15, $I6)
  __label_11: # default
  __label_10: # switch end
# }
  __label_9: # endif
# }
  __label_5: # endif
.annotate 'line', 3843
    .return(self)
# }
.annotate 'line', 3844

.end # optimize


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3847
    __ARG_1.'emitbinop'('isne', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3848

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3851
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3852

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3855
    __ARG_1.'emitcompare'('ne', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3856

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3859
    __ARG_1.'emitcompare'('eq', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3860

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpNotEqualExpr' ]
.annotate 'line', 3805
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSameExpr' ]

.sub 'OpSameExpr' :method
        .param int __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 3870
    self.'initbinary'(__ARG_2, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 3871
    box $P1, __ARG_1
    setattribute self, 'positive', $P1
# }
.annotate 'line', 3872

.end # OpSameExpr


.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3873
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3876
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3877
    new $P2, [ 'OpSameExpr' ]
    not $I2, $I1
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    getattribute $P5, self, 'lexpr'
    getattribute $P6, self, 'rexpr'
    $P2.'OpSameExpr'($I2, $P3, $P4, $P5, $P6)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 3878

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3881
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
.annotate 'line', 3882

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3885
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3886
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'issame'
    goto __label_1
  __label_2:
    set $S1, 'isntsame'
  __label_1:
.annotate 'line', 3887
    __ARG_1.'emitbinop'($S1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3888

.end # emitop


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 3891
    self.'emit_comparator'(__ARG_1, __ARG_2)
# }
.annotate 'line', 3892

.end # emit


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3895
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3896
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'eq_addr'
    goto __label_1
  __label_2:
    set $S1, 'ne_addr'
  __label_1:
.annotate 'line', 3897
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3898

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3901
# positive: $I1
    getattribute $P1, self, 'positive'
    set $I1, $P1
.annotate 'line', 3902
# op: $S1
    unless $I1 goto __label_2
    set $S1, 'ne_addr'
    goto __label_1
  __label_2:
    set $S1, 'eq_addr'
  __label_1:
.annotate 'line', 3903
    __ARG_1.'emitcompare'($S1, __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3904

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSameExpr' ]
.annotate 'line', 3865
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 3867
    addattribute $P0, 'positive'
.end
.namespace [ 'OpLessExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3911
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3914
    new $P1, [ 'OpGreaterEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3915

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3918
    islt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3919

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3922
    __ARG_1.'emitbinop'('islt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3923

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3926
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3927

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3930
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3931

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessExpr' ]
.annotate 'line', 3909
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterExpr' ]

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
    new $P1, [ 'OpLessEqualExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3942

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3945
    isgt $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3946

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3949
    __ARG_1.'emitbinop'('isgt', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3950

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3953
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3954

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3957
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3958

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterExpr' ]
.annotate 'line', 3936
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpLessEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3965
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3968
    new $P1, [ 'OpGreaterExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3969

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3972
    isle $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 3973

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3976
    __ARG_1.'emitbinop'('isle', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 3977

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3980
    __ARG_1.'emitcompare'('le', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3981

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 3984
    __ARG_1.'emitcompare'('gt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 3985

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpLessEqualExpr' ]
.annotate 'line', 3963
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpGreaterEqualExpr' ]

.sub 'isnegable' :method
# Body
# {
.annotate 'line', 3992
    .return(1)
# }

.end # isnegable


.sub 'negated' :method
# Body
# {
.annotate 'line', 3995
    new $P1, [ 'OpLessExpr' ]
    .tailcall $P1.'setfrom'(self)
# }
.annotate 'line', 3996

.end # negated


.sub 'int_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 3999
    isge $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4000

.end # int_op


.sub 'emitop' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4003
    __ARG_1.'emitbinop'('isge', __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4004

.end # emitop


.sub 'emitop_if' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4007
    __ARG_1.'emitcompare'('ge', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4008

.end # emitop_if


.sub 'emitop_else' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4011
    __ARG_1.'emitcompare'('lt', __ARG_3, __ARG_4, __ARG_2)
# }
.annotate 'line', 4012

.end # emitop_else

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpGreaterEqualExpr' ]
.annotate 'line', 3990
    get_class $P1, [ 'ComparatorBaseExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBoolExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4021
    .return('I')
# }
.annotate 'line', 4022

.end # checkresult

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBoolExpr' ]
.annotate 'line', 4017
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolAndExpr' ]

.sub 'OpBoolAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4031
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4032

.end # OpBoolAndExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4035
    self.'optimizearg'()
.annotate 'line', 4036
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4037
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4038
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4039
    eq $I1, 0, __label_2
.annotate 'line', 4040
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4042
.const 'Sub' $P5 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall $P5($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4044
    .return(self)
# }
.annotate 'line', 4045

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4048
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
.annotate 'line', 4049
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_6
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_6:
    unless $I1 goto __label_4
# {
.annotate 'line', 4050
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_7
    set $S2, $P3
  __label_7:
.annotate 'line', 4051
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_8
    set $S3, $P1
  __label_8:
.annotate 'line', 4052
    __ARG_1.'emitbinop'('and', $S1, $S2, $S3)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 4055
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_9
    set $S4, $P1
  __label_9:
.annotate 'line', 4056
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4057
    __ARG_1.'emitunless'($S1, $S4)
.annotate 'line', 4058
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4059
    __ARG_1.'emitlabel'($S4)
# }
  __label_5: # endif
# }
.annotate 'line', 4061

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolAndExpr' ]
.annotate 'line', 4027
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBoolOrExpr' ]

.sub 'OpBoolOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4070
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4071

.end # OpBoolOrExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4074
    self.'optimizearg'()
.annotate 'line', 4075
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'isintegerliteral'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 4076
# var lval: $P1
    getattribute $P4, self, 'lexpr'
    getattribute $P1, $P4, 'numval'
.annotate 'line', 4077
# ln: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 4078
    ne $I1, 0, __label_2
.annotate 'line', 4079
    getattribute $P2, self, 'rexpr'
    .return($P2)
    goto __label_3
  __label_2: # else
.annotate 'line', 4081
.const 'Sub' $P5 = 'WSubId_21'
    getattribute $P3, self, 'owner'
    getattribute $P4, self, 'start'
    .tailcall $P5($P3, $P4, $I1)
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 4083
    .return(self)
# }
.annotate 'line', 4084

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4087
# res: $S1
    null $S1
.annotate 'line', 4088
    if_null __ARG_2, __label_1
.annotate 'line', 4089
    set $S1, __ARG_2
    goto __label_2
  __label_1: # else
.annotate 'line', 4091
    $P1 = self.'tempreg'('I')
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 4092
    getattribute $P1, self, 'lexpr'
    $I1 = $P1.'issimple'()
    unless $I1 goto __label_5
    getattribute $P2, self, 'rexpr'
    $I1 = $P2.'issimple'()
  __label_5:
    unless $I1 goto __label_3
# {
.annotate 'line', 4093
# lreg: $S2
    $P3 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 4094
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_7
    set $S3, $P1
  __label_7:
.annotate 'line', 4095
    __ARG_1.'emitbinop'('or', $S1, $S2, $S3)
# }
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 4098
# l: $S4
    getattribute $P2, self, 'owner'
    $P1 = $P2.'genlabel'()
    null $S4
    if_null $P1, __label_8
    set $S4, $P1
  __label_8:
.annotate 'line', 4099
    getattribute $P1, self, 'lexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4100
    __ARG_1.'emitif'($S1, $S4)
.annotate 'line', 4101
    getattribute $P1, self, 'rexpr'
    $P1.'emit'(__ARG_1, $S1)
.annotate 'line', 4102
    __ARG_1.'emitlabel'($S4)
# }
  __label_4: # endif
# }
.annotate 'line', 4104

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBoolOrExpr' ]
.annotate 'line', 4066
    get_class $P1, [ 'OpBaseBoolExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBaseBinExpr' ]
.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBaseBinExpr' ]
.annotate 'line', 4109
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinAndExpr' ]

.sub 'OpBinAndExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4119
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4120

.end # OpBinAndExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4123
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
.annotate 'line', 4124
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4125
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4126
    self.'annotate'(__ARG_1)
.annotate 'line', 4127
    __ARG_1.'emitbinop'('band', $S1, $S2, $S3)
# }
.annotate 'line', 4128

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4131
    band $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4132

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinAndExpr' ]
.annotate 'line', 4115
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinOrExpr' ]

.sub 'OpBinOrExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4141
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4142

.end # OpBinOrExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4145
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
.annotate 'line', 4146
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4147
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4148
    self.'annotate'(__ARG_1)
.annotate 'line', 4149
    __ARG_1.'emitbinop'('bor', $S1, $S2, $S3)
# }
.annotate 'line', 4150

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4153
    bor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4154

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinOrExpr' ]
.annotate 'line', 4137
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpBinXorExpr' ]

.sub 'OpBinXorExpr' :method
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

.end # OpBinXorExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4167
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
.annotate 'line', 4168
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4169
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4170
    self.'annotate'(__ARG_1)
.annotate 'line', 4171
    __ARG_1.'emitbinop'('bxor', $S1, $S2, $S3)
# }
.annotate 'line', 4172

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4175
    bxor $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4176

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpBinXorExpr' ]
.annotate 'line', 4159
    get_class $P1, [ 'OpBaseBinExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ConcatString' ]

.sub 'ConcatString' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4186
    self.'Expr'(__ARG_1, __ARG_2)
# switch-case
.annotate 'line', 4188
    isa $I1, __ARG_3, [ 'ConcatString' ]
    if $I1 goto __label_3
.annotate 'line', 4195
    isa $I1, __ARG_4, [ 'ConcatString' ]
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4189
    getattribute $P2, __ARG_3, 'values'
    setattribute self, 'values', $P2
.annotate 'line', 4190
    isa $I2, __ARG_4, [ 'ConcatString' ]
    unless $I2 goto __label_5
.annotate 'line', 4191
    getattribute $P3, self, 'values'
    getattribute $P4, __ARG_4, 'values'
    $P3.'append'($P4)
    goto __label_6
  __label_5: # else
.annotate 'line', 4193
    getattribute $P5, self, 'values'
# predefined push
    push $P5, __ARG_4
  __label_6: # endif
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4196
    getattribute $P7, __ARG_4, 'values'
    setattribute self, 'values', $P7
.annotate 'line', 4197
    getattribute $P8, self, 'values'
    $P8.'unshift'(__ARG_3)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 4200
    root_new $P10, ['parrot';'ResizablePMCArray']
    push $P10, __ARG_3
    push $P10, __ARG_4
    setattribute self, 'values', $P10
  __label_1: # switch end
# }
.annotate 'line', 4202

.end # ConcatString


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4203
    .return('S')
# }

.end # checkresult


.sub 'getregs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4206
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 4207
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4208
    new $P2, ['FixedStringArray'], $I1
.annotate 'line', 4209
# i: $I2
    null $I2
# for loop
.annotate 'line', 4210
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4211
# predefined string
    $P4 = $P1[$I2]
    $P3 = $P4.'emit_get'(__ARG_1)
    set $S1, $P3
    $P2[$I2] = $S1
  __label_1: # for iteration
.annotate 'line', 4210
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4212
    .return($P2)
# }
.annotate 'line', 4213

.end # getregs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4216
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4217
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4218
# auxreg: $S1
    set $S1, '$S0'
.annotate 'line', 4219
    self.'annotate'(__ARG_1)
.annotate 'line', 4220
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4221
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4222
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_1: # for iteration
.annotate 'line', 4221
    inc $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 4223
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
.annotate 'line', 4224

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4227
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4228
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4229
# auxreg: $S1
    $P2 = self.'tempreg'('S')
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4230
    self.'annotate'(__ARG_1)
.annotate 'line', 4231
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'($S1, $P2, $P3)
# for loop
.annotate 'line', 4232
# i: $I2
    set $I2, 2
  __label_4: # for condition
    ge $I2, $I1, __label_3
.annotate 'line', 4233
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'($S1, $P2)
  __label_2: # for iteration
.annotate 'line', 4232
    inc $I2
    goto __label_4
  __label_3: # for end
.annotate 'line', 4234
    .return($S1)
# }
.annotate 'line', 4235

.end # emit_get


.sub 'emit_concat_to' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4238
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4239
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4240
    self.'annotate'(__ARG_1)
# for loop
.annotate 'line', 4241
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4242
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4241
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4243

.end # emit_concat_to


.sub 'emit_concat_set' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4246
# var regvalues: $P1
    $P1 = self.'getregs'(__ARG_1)
.annotate 'line', 4247
# nvalues: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 4248
    self.'annotate'(__ARG_1)
.annotate 'line', 4249
    $P2 = $P1[0]
    $P3 = $P1[1]
    __ARG_1.'emitconcat'(__ARG_2, $P2, $P3)
# for loop
.annotate 'line', 4250
# i: $I2
    set $I2, 2
  __label_3: # for condition
    ge $I2, $I1, __label_2
.annotate 'line', 4251
    $P2 = $P1[$I2]
    __ARG_1.'emitconcat1'(__ARG_2, $P2)
  __label_1: # for iteration
.annotate 'line', 4250
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4252

.end # emit_concat_set

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConcatString' ]
.annotate 'line', 4181
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4183
    addattribute $P0, 'values'
.end
.namespace [ 'OpAddExpr' ]

.sub 'OpAddExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4261
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4262

.end # OpAddExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4265
    self.'optimizearg'()
.annotate 'line', 4266
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4267
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4268
# ltype: $S1
    $P10 = $P1.'checkresult'()
    null $S1
    if_null $P10, __label_1
    set $S1, $P10
  __label_1:
.annotate 'line', 4269
# rtype: $S2
    $P10 = $P2.'checkresult'()
    null $S2
    if_null $P10, __label_2
    set $S2, $P10
  __label_2:
.annotate 'line', 4270
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_4
    $I3 = $P2.'isliteral'()
  __label_4:
    unless $I3 goto __label_3
# {
.annotate 'line', 4271
    iseq $I4, $S1, 'S'
    unless $I4 goto __label_6
    iseq $I4, $S2, 'S'
  __label_6:
    unless $I4 goto __label_5
# {
.annotate 'line', 4276
# var etok: $P3
    getattribute $P3, $P1, 'strval'
.annotate 'line', 4277
# var rtok: $P4
    getattribute $P4, $P2, 'strval'
.annotate 'line', 4278
# var t: $P5
    isa $I3, $P3, [ 'TokenSingleQuoted' ]
    unless $I3 goto __label_9
.annotate 'line', 4279
    isa $I3, $P4, [ 'TokenSingleQuoted' ]
  __label_9:
    unless $I3 goto __label_8
.annotate 'line', 4281
    new $P10, [ 'TokenSingleQuoted' ]
    getattribute $P11, $P3, 'file'
    getattribute $P12, $P3, 'line'
# predefined string
.annotate 'line', 4282
    getattribute $P13, $P3, 'str'
.annotate 'line', 4278
    set $S3, $P13
# predefined string
.annotate 'line', 4282
    getattribute $P14, $P4, 'str'
.annotate 'line', 4278
    set $S4, $P14
.annotate 'line', 4282
    concat $S5, $S3, $S4
    $P10.'TokenSingleQuoted'($P11, $P12, $S5)
    set $P5, $P10
    goto __label_7
  __label_8:
.annotate 'line', 4284
    new $P15, [ 'TokenQuoted' ]
    getattribute $P16, $P3, 'file'
    getattribute $P17, $P3, 'line'
# predefined string
.annotate 'line', 4285
    $P18 = $P3.'getasquoted'()
.annotate 'line', 4278
    set $S6, $P18
# predefined string
.annotate 'line', 4285
    $P19 = $P4.'getasquoted'()
.annotate 'line', 4278
    set $S7, $P19
.annotate 'line', 4285
    concat $S8, $S6, $S7
    $P15.'TokenQuoted'($P16, $P17, $S8)
    set $P5, $P15
  __label_7:
.annotate 'line', 4286
    new $P11, [ 'StringLiteral' ]
    getattribute $P12, self, 'owner'
    $P11.'StringLiteral'($P12, $P5)
    set $P10, $P11
    .return($P10)
# }
  __label_5: # endif
.annotate 'line', 4288
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_11
    iseq $I3, $S2, 'I'
  __label_11:
    unless $I3 goto __label_10
# {
.annotate 'line', 4289
# var lval: $P6
    getattribute $P6, $P1, 'numval'
.annotate 'line', 4290
# ln: $I1
    set $P10, $P6
    set $I1, $P10
.annotate 'line', 4291
# var rval: $P7
    getattribute $P7, $P2, 'numval'
.annotate 'line', 4292
# rn: $I2
    set $P10, $P7
    set $I2, $P10
.annotate 'line', 4293
.const 'Sub' $P20 = 'WSubId_21'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $I3, $I1, $I2
    .tailcall $P20($P10, $P11, $I3)
# }
  __label_10: # endif
# {
.annotate 'line', 4296
.const 'Sub' $P21 = 'WSubId_62'
    $P10 = $P21($S1, $S2)
    if_null $P10, __label_12
    unless $P10 goto __label_12
# {
.annotate 'line', 4297
# var lvalf: $P8
    getattribute $P8, $P1, 'numval'
.annotate 'line', 4298
# lf: $N1
# predefined string
    set $S3, $P8
    set $N1, $S3
.annotate 'line', 4299
# var rvalf: $P9
    getattribute $P9, $P2, 'numval'
.annotate 'line', 4300
# rf: $N2
# predefined string
    set $S3, $P9
    set $N2, $S3
.annotate 'line', 4301
.const 'Sub' $P22 = 'WSubId_61'
    getattribute $P10, self, 'owner'
    getattribute $P11, self, 'start'
    add $N3, $N1, $N2
    .tailcall $P22($P10, $P11, $N3)
# }
  __label_12: # endif
# }
# }
  __label_3: # endif
.annotate 'line', 4305
    iseq $I3, $S1, 'S'
    unless $I3 goto __label_14
    iseq $I3, $S2, 'S'
  __label_14:
    unless $I3 goto __label_13
# {
.annotate 'line', 4306
    new $P11, [ 'ConcatString' ]
    getattribute $P12, self, 'owner'
    getattribute $P13, self, 'start'
    $P11.'ConcatString'($P12, $P13, $P1, $P2)
    set $P10, $P11
    .return($P10)
# }
  __label_13: # endif
.annotate 'line', 4308
    .return(self)
# }
.annotate 'line', 4309

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4312
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4313
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4314
    ne $S1, $S2, __label_3
.annotate 'line', 4315
    .return($S1)
  __label_3: # endif
.annotate 'line', 4316
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'S'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4317
    .return('S')
  __label_4: # endif
.annotate 'line', 4318
    iseq $I1, $S1, 'S'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4319
    .return('S')
  __label_6: # endif
.annotate 'line', 4320
.const 'Sub' $P3 = 'WSubId_62'
    $P1 = $P3($S1, $S2)
    if_null $P1, __label_8
    unless $P1 goto __label_8
.annotate 'line', 4321
    .return('N')
  __label_8: # endif
.annotate 'line', 4322
    .return('I')
# }
.annotate 'line', 4323

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4326
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4327
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4328
# restype: $S1
    $P3 = self.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4329
# ltype: $S2
    $P3 = $P1.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4330
# rtype: $S3
    $P3 = $P2.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 4332
# rleft: $S4
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S4
    if_null $P3, __label_4
    set $S4, $P3
  __label_4:
.annotate 'line', 4333
# rright: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_5
    set $S5, $P3
  __label_5:
.annotate 'line', 4334
    ne $S1, 'S', __label_6
# {
.annotate 'line', 4335
    isne $I1, $S2, 'S'
    if $I1 goto __label_9
    isne $I1, $S3, 'S'
  __label_9:
    unless $I1 goto __label_8
# {
.annotate 'line', 4336
# aux: $S6
    $P3 = self.'tempreg'('S')
    null $S6
    if_null $P3, __label_10
    set $S6, $P3
  __label_10:
.annotate 'line', 4337
    eq $S2, 'S', __label_11
# {
.annotate 'line', 4338
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4339
    set $S4, $S6
# }
    goto __label_12
  __label_11: # else
# {
.annotate 'line', 4342
    __ARG_1.'emitset'($S6, $S5)
.annotate 'line', 4343
    set $S5, $S6
# }
  __label_12: # endif
# }
  __label_8: # endif
.annotate 'line', 4346
    __ARG_1.'emitconcat'(__ARG_2, $S4, $S5)
# }
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 4349
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_15
    isne $I1, $S2, 'I'
    if $I1 goto __label_16
    isne $I1, $S3, 'I'
  __label_16:
  __label_15:
    unless $I1 goto __label_13
# {
.annotate 'line', 4350
# l: $S7
    null $S7
.annotate 'line', 4351
    ne $S2, 'I', __label_17
    set $S7, $S4
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4353
    $P3 = self.'tempreg'('I')
    set $S7, $P3
.annotate 'line', 4354
    __ARG_1.'emitset'($S7, $S4)
# }
  __label_18: # endif
.annotate 'line', 4356
# r: $S8
    null $S8
.annotate 'line', 4357
    ne $S3, 'I', __label_19
    set $S8, $S5
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 4359
    $P3 = self.'tempreg'('I')
    set $S8, $P3
.annotate 'line', 4360
    __ARG_1.'emitset'($S8, $S5)
# }
  __label_20: # endif
.annotate 'line', 4362
    __ARG_1.'emitadd'(__ARG_2, $S7, $S8)
# }
    goto __label_14
  __label_13: # else
.annotate 'line', 4365
    __ARG_1.'emitadd'(__ARG_2, $S4, $S5)
  __label_14: # endif
# }
  __label_7: # endif
# }
.annotate 'line', 4367

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpAddExpr' ]
.annotate 'line', 4257
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpSubExpr' ]

.sub 'OpSubExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4376
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4377

.end # OpSubExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4380
    self.'optimizearg'()
.annotate 'line', 4381
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4382
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4383
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4384
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4385
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4386
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4387
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4388
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4389
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4390
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4391
.const 'Sub' $P6 = 'WSubId_21'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    sub $I3, $I1, $I2
    .tailcall $P6($P5, $P7, $I3)
# }
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 4394
    .return(self)
# }
.annotate 'line', 4395

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4398
# rl: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'checkresult'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4399
# rr: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'checkresult'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4400
    ne $S1, $S2, __label_3
.annotate 'line', 4401
    .return($S1)
  __label_3: # endif
.annotate 'line', 4402
    iseq $I1, $S1, 'I'
    unless $I1 goto __label_5
    iseq $I1, $S2, 'N'
  __label_5:
    unless $I1 goto __label_4
.annotate 'line', 4403
    .return('N')
  __label_4: # endif
.annotate 'line', 4404
    iseq $I1, $S1, 'N'
    unless $I1 goto __label_7
    iseq $I1, $S2, 'I'
  __label_7:
    unless $I1 goto __label_6
.annotate 'line', 4405
    .return('N')
  __label_6: # endif
.annotate 'line', 4406
    .return('I')
# }
.annotate 'line', 4407

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4410
# lreg: $S1
    getattribute $P2, self, 'lexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4411
# rreg: $S2
    getattribute $P2, self, 'rexpr'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4412
    __ARG_1.'emitsub'(__ARG_2, $S1, $S2)
# }
.annotate 'line', 4413

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpSubExpr' ]
.annotate 'line', 4372
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpMulExpr' ]

.sub 'OpMulExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4422
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4423

.end # OpMulExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4426
    self.'optimizearg'()
.annotate 'line', 4427
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4428
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4429
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4430
# ltype: $S1
    $P7 = $P1.'checkresult'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 4431
# rtype: $S2
    $P7 = $P2.'checkresult'()
    null $S2
    if_null $P7, __label_4
    set $S2, $P7
  __label_4:
.annotate 'line', 4432
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4433
# var lval: $P3
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4434
# ln: $I1
    set $P7, $P3
    set $I1, $P7
.annotate 'line', 4435
# var rval: $P4
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4436
# rn: $I2
    set $P7, $P4
    set $I2, $P7
.annotate 'line', 4437
.const 'Sub' $P8 = 'WSubId_21'
    getattribute $P7, self, 'owner'
    getattribute $P9, self, 'start'
    mul $I3, $I1, $I2
    .tailcall $P8($P7, $P9, $I3)
# }
  __label_5: # endif
# {
.annotate 'line', 4440
.const 'Sub' $P10 = 'WSubId_62'
    $P7 = $P10($S1, $S2)
    if_null $P7, __label_7
    unless $P7 goto __label_7
# {
.annotate 'line', 4441
# var lvalf: $P5
    getattribute $P5, $P1, 'numval'
.annotate 'line', 4442
# lf: $N1
# predefined string
    set $S3, $P5
    set $N1, $S3
.annotate 'line', 4443
# var rvalf: $P6
    getattribute $P6, $P2, 'numval'
.annotate 'line', 4444
# rf: $N2
# predefined string
    set $S3, $P6
    set $N2, $S3
.annotate 'line', 4445
.const 'Sub' $P11 = 'WSubId_61'
    getattribute $P7, self, 'owner'
    getattribute $P9, self, 'start'
    mul $N3, $N1, $N2
    .tailcall $P11($P7, $P9, $N3)
# }
  __label_7: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4449
    .return(self)
# }
.annotate 'line', 4450

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4453
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4454
# rl: $S1
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 4455
# rr: $S2
    getattribute $P3, self, 'rexpr'
    $P2 = $P3.'checkresult'()
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 4456
    ne $S1, $S2, __label_3
.annotate 'line', 4457
    .return($S1)
  __label_3: # endif
.annotate 'line', 4458
    ne $S1, 'S', __label_4
.annotate 'line', 4459
    .return('S')
    goto __label_5
  __label_4: # else
.annotate 'line', 4461
    .return('N')
  __label_5: # endif
# }
.annotate 'line', 4462

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4465
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4466
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4467
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 4468
# rtype: $S2
    $P3 = $P2.'checkresult'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 4469
# lreg: $S3
    null $S3
# rreg: $S4
    null $S4
.annotate 'line', 4470
    ne $S1, 'S', __label_3
# {
.annotate 'line', 4471
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4472
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4473
# rval: $S5
    null $S5
# switch
.annotate 'line', 4474
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_6
    goto __label_5
  __label_6: # case
.annotate 'line', 4476
    set $S5, $S4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 4479
    $P3 = self.'tempreg'('I')
    set $S5, $P3
.annotate 'line', 4480
    __ARG_1.'emitset'($S5, $S4)
  __label_4: # switch end
.annotate 'line', 4482
    self.'annotate'(__ARG_1)
.annotate 'line', 4483
    __ARG_1.'emitrepeat'(__ARG_2, $S3, $S5)
.annotate 'line', 4484
    .return()
# }
  __label_3: # endif
.annotate 'line', 4486
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
.annotate 'line', 4487
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4488
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4489
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
.annotate 'line', 4490
    .return()
# }
  __label_7: # endif
.annotate 'line', 4495
    ne $S1, 'N', __label_11
# {
.annotate 'line', 4496
    $P3 = $P1.'emit_get'(__ARG_1)
    set $S3, $P3
.annotate 'line', 4497
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S4, $P3
.annotate 'line', 4498
# rval: $S6
    null $S6
# switch
.annotate 'line', 4499
    set $S7, $S2
    set $S8, 'I'
    if $S7 == $S8 goto __label_14
    set $S8, 'N'
    if $S7 == $S8 goto __label_15
    goto __label_13
  __label_14: # case
.annotate 'line', 4501
    $P3 = self.'tempreg'('N')
    set $S6, $P3
.annotate 'line', 4502
    __ARG_1.'emitset'($S6, $S4)
.annotate 'line', 4503
    set $S6, $S4
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4506
    set $S6, $S4
    goto __label_12 # break
  __label_13: # default
.annotate 'line', 4509
    $P4 = self.'tempreg'('N')
    set $S6, $P4
.annotate 'line', 4510
    __ARG_1.'emitset'($S6, $S4)
  __label_12: # switch end
.annotate 'line', 4512
    set $S7, __ARG_2
    eq $S7, '', __label_16
# {
.annotate 'line', 4513
    self.'annotate'(__ARG_1)
.annotate 'line', 4514
    __ARG_1.'emitmul'(__ARG_2, $S3, $S6)
# }
  __label_16: # endif
.annotate 'line', 4516
    .return()
# }
  __label_11: # endif
.annotate 'line', 4519
# nleft: $I1
    null $I1
# nright: $I2
    null $I2
.annotate 'line', 4520
    $P3 = $P1.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_19
    $I3 = $P1.'isidentifier'()
  __label_19:
    unless $I3 goto __label_17
# {
.annotate 'line', 4521
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S3, $P4
.annotate 'line', 4522
    $P1.'emit'(__ARG_1, $S3)
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4525
    $P3 = $P1.'getIntegerValue'()
    set $I1, $P3
.annotate 'line', 4526
    set $S3, $I1
# }
  __label_18: # endif
.annotate 'line', 4528
    $P3 = $P2.'issimple'()
    isfalse $I3, $P3
    if $I3 goto __label_22
    $I3 = $P2.'isidentifier'()
  __label_22:
    unless $I3 goto __label_20
# {
.annotate 'line', 4529
    $P5 = self.'checkresult'()
    $P4 = self.'tempreg'($P5)
    set $S4, $P4
.annotate 'line', 4530
    $P2.'emit'(__ARG_1, $S4)
# }
    goto __label_21
  __label_20: # else
# {
# switch
.annotate 'line', 4533
    set $S7, $S2
    set $S8, 'S'
    if $S7 == $S8 goto __label_25
    set $S8, 'N'
    if $S7 == $S8 goto __label_26
    set $S8, 'I'
    if $S7 == $S8 goto __label_27
    goto __label_24
  __label_25: # case
.annotate 'line', 4535
    $P4 = self.'checkresult'()
    $P3 = self.'tempreg'($P4)
    set $S4, $P3
.annotate 'line', 4536
    $P2.'emit'(__ARG_1, $S4)
    goto __label_23 # break
  __label_26: # case
.annotate 'line', 4539
    $P5 = $P2.'emit_get'(__ARG_1)
    set $S4, $P5
    goto __label_23 # break
  __label_27: # case
  __label_24: # default
.annotate 'line', 4543
    $P6 = $P2.'getIntegerValue'()
    set $I2, $P6
.annotate 'line', 4544
    set $S4, $I2
    goto __label_23 # break
  __label_23: # switch end
.annotate 'line', 4545
# }
  __label_21: # endif
.annotate 'line', 4548
    self.'annotate'(__ARG_1)
.annotate 'line', 4549
    set $S7, __ARG_2
    ne $S7, '', __label_28
.annotate 'line', 4550
    $P3 = self.'checkresult'()
    __ARG_2 = self.'tempreg'($P3)
  __label_28: # endif
.annotate 'line', 4551
    __ARG_1.'emitmul'(__ARG_2, $S3, $S4)
# }
.annotate 'line', 4552

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpMulExpr' ]
.annotate 'line', 4418
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpDivExpr' ]

.sub 'OpDivExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4561
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4562

.end # OpDivExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4565
    self.'optimizearg'()
.annotate 'line', 4566
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4567
# var rexpr: $P2
    getattribute $P2, self, 'rexpr'
.annotate 'line', 4568
    $I3 = $P1.'isliteral'()
    unless $I3 goto __label_2
    $I3 = $P2.'isliteral'()
  __label_2:
    unless $I3 goto __label_1
# {
.annotate 'line', 4569
# ltype: $S1
    $P5 = $P1.'checkresult'()
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 4570
# rtype: $S2
    $P5 = $P2.'checkresult'()
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 4571
# var lval: $P3
    null $P3
.annotate 'line', 4572
# var rval: $P4
    null $P4
.annotate 'line', 4573
    iseq $I3, $S1, 'I'
    unless $I3 goto __label_6
    iseq $I3, $S2, 'I'
  __label_6:
    unless $I3 goto __label_5
# {
.annotate 'line', 4574
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4575
# ln: $I1
    set $P5, $P3
    set $I1, $P5
.annotate 'line', 4576
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4577
# rn: $I2
    set $P5, $P4
    set $I2, $P5
.annotate 'line', 4578
    eq $I2, 0, __label_7
.annotate 'line', 4579
.const 'Sub' $P6 = 'WSubId_21'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    set $N4, $I1
    set $N5, $I2
    div $N3, $N4, $N5
    .tailcall $P6($P5, $P7, $N3)
  __label_7: # endif
# }
  __label_5: # endif
# {
.annotate 'line', 4582
.const 'Sub' $P8 = 'WSubId_62'
    $P5 = $P8($S1, $S2)
    if_null $P5, __label_8
    unless $P5 goto __label_8
# {
.annotate 'line', 4583
    getattribute $P3, $P1, 'numval'
.annotate 'line', 4584
# lf: $N1
# predefined string
    set $S3, $P3
    set $N1, $S3
.annotate 'line', 4585
    getattribute $P4, $P2, 'numval'
.annotate 'line', 4586
# rf: $N2
# predefined string
    set $S3, $P4
    set $N2, $S3
.annotate 'line', 4587
    set $N3, 0
    eq $N2, $N3, __label_9
.annotate 'line', 4588
.const 'Sub' $P9 = 'WSubId_61'
    getattribute $P5, self, 'owner'
    getattribute $P7, self, 'start'
    div $N4, $N1, $N2
    .tailcall $P9($P5, $P7, $N4)
  __label_9: # endif
# }
  __label_8: # endif
# }
# }
  __label_1: # endif
.annotate 'line', 4592
    .return(self)
# }
.annotate 'line', 4593

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4596
    .return('N')
# }
.annotate 'line', 4597

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4600
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 4601
# var aux: $P2
    null $P2
.annotate 'line', 4602
# var lreg: $P3
    $P3 = $P1.'emit_get'(__ARG_1)
.annotate 'line', 4603
    $P6 = $P1.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_1
# {
.annotate 'line', 4604
    $P2 = self.'tempreg'('N')
.annotate 'line', 4605
    __ARG_1.'emitset'($P2, $P3)
.annotate 'line', 4606
    set $P3, $P2
# }
  __label_1: # endif
.annotate 'line', 4608
# var rexpr: $P4
    getattribute $P4, self, 'rexpr'
.annotate 'line', 4609
# var rreg: $P5
    $P5 = $P4.'emit_get'(__ARG_1)
.annotate 'line', 4610
    $P6 = $P4.'checkresult'()
    set $S1, $P6
    eq $S1, 'N', __label_2
# {
.annotate 'line', 4611
    $P2 = self.'tempreg'('N')
.annotate 'line', 4612
    __ARG_1.'emitset'($P2, $P5)
.annotate 'line', 4613
    set $P5, $P2
# }
  __label_2: # endif
.annotate 'line', 4615
    self.'annotate'(__ARG_1)
.annotate 'line', 4616
    __ARG_1.'emitdiv'(__ARG_2, $P3, $P5)
# }
.annotate 'line', 4617

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpDivExpr' ]
.annotate 'line', 4557
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpModExpr' ]

.sub 'OpModExpr' :method
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

.end # OpModExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4630
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4631
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4632
    self.'annotate'(__ARG_1)
.annotate 'line', 4633
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4634

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4637
    mod $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4638

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpModExpr' ]
.annotate 'line', 4622
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpCModExpr' ]

.sub 'OpCModExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4647
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4648

.end # OpCModExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4651
    .return('I')
# }
.annotate 'line', 4652

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4655
# lreg: $S1
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 4656
# rreg: $S2
    $P1 = self.'emit_intright'(__ARG_1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 4657
    self.'annotate'(__ARG_1)
.annotate 'line', 4662
    __ARG_1.'emitbinop'('mod', __ARG_2, $S1, $S2)
# }
.annotate 'line', 4663

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpCModExpr' ]
.annotate 'line', 4643
    get_class $P1, [ 'OpBinaryExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftleftExpr' ]

.sub 'OpShiftleftExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4672
    self.'set'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
# }
.annotate 'line', 4673

.end # OpShiftleftExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4676
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
.annotate 'line', 4677
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4678
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4679
    self.'annotate'(__ARG_1)
.annotate 'line', 4680
    __ARG_1.'emitbinop'('shl', $S1, $S2, $S3)
# }
.annotate 'line', 4681

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4684
    shl $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4685

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftleftExpr' ]
.annotate 'line', 4668
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'OpShiftrightExpr' ]

.sub 'OpShiftrightExpr' :method
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

.end # OpShiftrightExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4698
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
.annotate 'line', 4699
# lreg: $S2
    $P1 = self.'emit_intleft'(__ARG_1)
    null $S2
    if_null $P1, __label_4
    set $S2, $P1
  __label_4:
.annotate 'line', 4700
# rreg: $S3
    $P1 = self.'emit_intright'(__ARG_1)
    null $S3
    if_null $P1, __label_5
    set $S3, $P1
  __label_5:
.annotate 'line', 4701
    self.'annotate'(__ARG_1)
.annotate 'line', 4702
    __ARG_1.'emitbinop'('shr', $S1, $S2, $S3)
# }
.annotate 'line', 4703

.end # emit


.sub 'do_op' :method
        .param int __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 4706
    shr $I1, __ARG_1, __ARG_2
    .return($I1)
# }
.annotate 'line', 4707

.end # do_op

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpShiftrightExpr' ]
.annotate 'line', 4690
    get_class $P1, [ 'OpBinaryIntExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'ArgumentModifierList' ]

.sub 'ArgumentModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4716
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 4717

.end # ArgumentModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4720
# isflat: $I1
    null $I1
# isnamed: $I2
    null $I2
.annotate 'line', 4721
# setname: $S1
    set $S1, ''
.annotate 'line', 4722
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
# switch
.annotate 'line', 4723
    $P5 = $P1.'getname'()
    set $S2, $P5
    set $S3, 'flat'
    if $S2 == $S3 goto __label_5
    set $S3, 'named'
    if $S2 == $S3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 4725
    set $I1, 1
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 4728
    set $I2, 1
# switch
.annotate 'line', 4729
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
.annotate 'line', 4733
# var argmod: $P2
    $P2 = $P1.'getarg'(0)
.annotate 'line', 4734
    $P7 = $P2.'isstringliteral'()
    isfalse $I5, $P7
    unless $I5 goto __label_11
.const 'Sub' $P8 = 'WSubId_1'
.annotate 'line', 4735
    getattribute $P9, self, 'start'
    $P8('Invalid modifier', $P9)
  __label_11: # endif
.annotate 'line', 4736
    $P10 = $P2.'getPirString'()
    set $S1, $P10
    goto __label_7 # break
  __label_8: # default
.annotate 'line', 4737
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 4739
    getattribute $P12, self, 'start'
    $P11('Invalid modifier', $P12)
  __label_7: # switch end
  __label_4: # default
  __label_3: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 4744
    and $I3, $I1, $I2
    if $I3 goto __label_14
.annotate 'line', 4747
    set $I3, $I1
    if $I3 goto __label_15
.annotate 'line', 4750
    set $I3, $I2
    if $I3 goto __label_16
    goto __label_13
  __label_14: # case
.annotate 'line', 4745
    __ARG_1.'print'(' :flat :named')
    goto __label_12 # break
  __label_15: # case
.annotate 'line', 4748
    __ARG_1.'print'(' :flat')
    goto __label_12 # break
  __label_16: # case
.annotate 'line', 4751
    __ARG_1.'print'(' :named')
.annotate 'line', 4752
    eq $S1, '', __label_17
.annotate 'line', 4753
    __ARG_1.'print'("(", $S1, ")")
  __label_17: # endif
    goto __label_12 # break
  __label_13: # default
  __label_12: # switch end
.annotate 'line', 4754
# }
.annotate 'line', 4756

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentModifierList' ]
.annotate 'line', 4712
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'Argument' ]

.sub 'Argument' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4765
    setattribute self, 'arg', __ARG_1
.annotate 'line', 4766
    setattribute self, 'modifiers', __ARG_2
# }
.annotate 'line', 4767

.end # Argument


.sub 'optimize' :method
# Body
# {
.annotate 'line', 4770
    getattribute $P3, self, 'arg'
    $P2 = $P3.'optimize'()
    setattribute self, 'arg', $P2
.annotate 'line', 4771
    .return(self)
# }
.annotate 'line', 4772

.end # optimize


.sub 'hascompilevalue' :method
# Body
# {
.annotate 'line', 4775
    getattribute $P1, self, 'arg'
    .tailcall $P1.'hascompilevalue'()
# }
.annotate 'line', 4776

.end # hascompilevalue

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Argument' ]
.annotate 'line', 4761
    addattribute $P0, 'arg'
.annotate 'line', 4762
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseArgument' :subid('WSubId_63')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4781
# var modifier: $P1
    null $P1
.annotate 'line', 4782
# var expr: $P2
.const 'Sub' $P4 = 'WSubId_37'
    $P2 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 4783
# var t: $P3
    $P3 = __ARG_1.'get'()
.annotate 'line', 4784
    $P5 = $P3.'isop'(':')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 4785
    $P3 = __ARG_1.'get'()
.annotate 'line', 4786
    $P5 = $P3.'isop'('[')
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 4787
    new $P6, [ 'ArgumentModifierList' ]
    $P6.'ArgumentModifierList'(__ARG_1, __ARG_2)
    set $P1, $P6
# }
    goto __label_4
  __label_3: # else
.const 'Sub' $P7 = 'WSubId_40'
.annotate 'line', 4790
    $P7('modifier list', $P3)
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 4793
    __ARG_1.'unget'($P3)
  __label_2: # endif
.annotate 'line', 4794
    new $P6, [ 'Argument' ]
    $P6.'Argument'($P2, $P1)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 4795

.end # parseArgument

.namespace [ 'ArgumentList' ]

.sub 'ArgumentList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 4806
    setattribute self, 'owner', __ARG_1
.annotate 'line', 4807
    setattribute self, 'start', __ARG_2
.annotate 'line', 4808
# var t: $P1
    $P1 = __ARG_3.'get'()
.annotate 'line', 4809
    $P2 = $P1.'isop'(__ARG_4)
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 4810
    __ARG_3.'unget'($P1)
.annotate 'line', 4811
.const 'Sub' $P3 = 'parseArgument'
.annotate 'line', 4812
.const 'Sub' $P5 = 'WSubId_36'
.const 'Sub' $P6 = 'WSubId_63'
    $P4 = $P5(__ARG_3, __ARG_1, $P6, __ARG_4)
    setattribute self, 'args', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 4814

.end # ArgumentList


.sub 'numargs' :method
# Body
# {
.annotate 'line', 4817
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4818
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined elements
.annotate 'line', 4816
    elements $I1, $P1
  __label_1:
.annotate 'line', 4818
    .return($I1)
# }
.annotate 'line', 4819

.end # numargs


.sub 'getrawargs' :method
# Body
# {
.annotate 'line', 4822
    getattribute $P1, self, 'args'
    .return($P1)
# }
.annotate 'line', 4823

.end # getrawargs


.sub 'getarg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4826
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4827
    $P2 = $P1[__ARG_1]
    .return($P2)
# }
.annotate 'line', 4828

.end # getarg


.sub 'getfreearg' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 4831
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4832
    $P3 = $P1[__ARG_1]
    getattribute $P2, $P3, 'arg'
    .return($P2)
# }
.annotate 'line', 4833

.end # getfreearg


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_38'
.annotate 'line', 4836
    getattribute $P2, self, 'args'
    $P1($P2)
.annotate 'line', 4837
    .return(self)
# }
.annotate 'line', 4838

.end # optimize


.sub 'getargvalues' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4841
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 4842
    unless_null $P1, __label_1
# {
.annotate 'line', 4843
    new $P2, ['ResizableStringArray']
.annotate 'line', 4844
# pnull: $S1
    set $S1, ''
.annotate 'line', 4845
# var args: $P3
    getattribute $P3, self, 'args'
.annotate 'line', 4846
    if_null $P3, __label_2
# {
.annotate 'line', 4847
    iter $P6, $P3
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P4, $P6
# {
.annotate 'line', 4848
# var arg: $P5
    getattribute $P5, $P4, 'arg'
.annotate 'line', 4849
# reg: $S2
    null $S2
.annotate 'line', 4850
    $P7 = $P5.'isnull'()
    if_null $P7, __label_5
    unless $P7 goto __label_5
# {
.annotate 'line', 4851
    ne $S1, '', __label_7
# {
.annotate 'line', 4852
    getattribute $P9, self, 'owner'
    $P8 = $P9.'tempreg'('P')
    set $S1, $P8
.annotate 'line', 4853
    __ARG_1.'emitnull'($S1)
# }
  __label_7: # endif
.annotate 'line', 4855
    set $S2, $S1
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 4858
    $P7 = $P5.'emit_get'(__ARG_1)
    set $S2, $P7
  __label_6: # endif
.annotate 'line', 4859
# predefined push
    push $P2, $S2
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
.annotate 'line', 4862
    setattribute self, 'argregs', $P2
# }
  __label_1: # endif
.annotate 'line', 4864
    .return($P1)
# }
.annotate 'line', 4865

.end # getargvalues


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4868
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 4869
# var argreg: $P2
    $P2 = self.'getargvalues'(__ARG_1)
.annotate 'line', 4871
# sep: $S1
    set $S1, ''
.annotate 'line', 4872
# n: $I1
    $P4 = self.'numargs'()
    set $I1, $P4
# for loop
.annotate 'line', 4873
# i: $I2
    null $I2
  __label_3: # for condition
    ge $I2, $I1, __label_2
# {
.annotate 'line', 4874
    $P4 = $P2[$I2]
    __ARG_1.'print'($S1, $P4)
.annotate 'line', 4875
# var modifiers: $P3
    $P4 = $P1[$I2]
    getattribute $P3, $P4, 'modifiers'
.annotate 'line', 4876
    if_null $P3, __label_4
.annotate 'line', 4877
    $P3.'emitmodifiers'(__ARG_1)
  __label_4: # endif
.annotate 'line', 4878
    set $S1, ', '
# }
  __label_1: # for iteration
.annotate 'line', 4873
    inc $I2
    goto __label_3
  __label_2: # for end
# }
.annotate 'line', 4880

.end # emitargs

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArgumentList' ]
.annotate 'line', 4799
    addattribute $P0, 'owner'
.annotate 'line', 4800
    addattribute $P0, 'start'
.annotate 'line', 4801
    addattribute $P0, 'args'
.annotate 'line', 4802
    addattribute $P0, 'argregs'
.end
.namespace [ ]

.sub 'arglist_hascompilevalue' :subid('WSubId_64')
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 4885
    iter $P2, __ARG_1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $P1, $P2
.annotate 'line', 4886
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_3
.annotate 'line', 4887
    .return(0)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 4888
    .return(1)
# }
.annotate 'line', 4889

.end # arglist_hascompilevalue

.namespace [ 'CallPredefExpr' ]

.sub 'CallPredefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 4900
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 4901
    setattribute self, 'predef', __ARG_3
.annotate 'line', 4902
    setattribute self, 'args', __ARG_4
# }
.annotate 'line', 4903

.end # CallPredefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 4906
    getattribute $P1, self, 'predef'
    .tailcall $P1.'result'()
# }
.annotate 'line', 4907

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 4910
# var predef: $P1
    getattribute $P1, self, 'predef'
.annotate 'line', 4911
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 4912
    new $P3, ['ResizableStringArray']
.annotate 'line', 4913
# var arg: $P4
    null $P4
.annotate 'line', 4914
# pnull: $S1
    set $S1, ''
# switch
.annotate 'line', 4915
    $P6 = $P1.'params'()
    set $I3, $P6
    set $I4, -1
    if $I3 == $I4 goto __label_3
    set $I4, -2
    if $I3 == $I4 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 4917
    iter $P7, $P2
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P4, $P7
# {
.annotate 'line', 4918
# reg: $S2
    getattribute $P9, $P4, 'arg'
    $P8 = $P9.'emit_get'(__ARG_1)
    null $S2
    if_null $P8, __label_7
    set $S2, $P8
  __label_7:
.annotate 'line', 4920
    ne $S2, 'null', __label_8
# {
.annotate 'line', 4921
    ne $S1, '', __label_9
# {
.annotate 'line', 4922
    $P6 = self.'tempreg'('P')
    set $S1, $P6
.annotate 'line', 4923
    __ARG_1.'emitnull'($S1)
# }
  __label_9: # endif
.annotate 'line', 4925
    set $S2, $S1
# }
  __label_8: # endif
.annotate 'line', 4927
# predefined push
    push $P3, $S2
# }
    goto __label_5
  __label_6: # endfor
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 4931
# var rawargs: $P5
    root_new $P5, ['parrot';'ResizablePMCArray']
.annotate 'line', 4932
    iter $P10, $P2
    set $P10, 0
  __label_10: # for iteration
    unless $P10 goto __label_11
    shift $P4, $P10
.annotate 'line', 4933
    getattribute $P8, $P4, 'arg'
# predefined push
    push $P5, $P8
    goto __label_10
  __label_11: # endfor
.annotate 'line', 4934
    getattribute $P9, self, 'predef'
    getattribute $P11, self, 'start'
    $P9.'expand'(__ARG_1, self, $P11, __ARG_2, $P5)
.annotate 'line', 4935
    .return()
  __label_2: # default
.annotate 'line', 4937
# n: $I1
    getattribute $P12, self, 'args'
    set $I1, $P12
# for loop
.annotate 'line', 4938
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 4939
    $P13 = $P2[$I2]
    getattribute $P4, $P13, 'arg'
.annotate 'line', 4940
# argtype: $S3
    $P6 = $P4.'checkresult'()
    null $S3
    if_null $P6, __label_15
    set $S3, $P6
  __label_15:
.annotate 'line', 4941
# paramtype: $S4
    $P6 = $P1.'paramtype'($I2)
    null $S4
    if_null $P6, __label_16
    set $S4, $P6
  __label_16:
.annotate 'line', 4942
# argr: $S5
    null $S5
.annotate 'line', 4943
    $P6 = $P4.'isnull'()
    if_null $P6, __label_17
    unless $P6 goto __label_17
# {
# switch
.annotate 'line', 4944
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
.annotate 'line', 4948
    $P8 = self.'tempreg'($S4)
    set $S5, $P8
.annotate 'line', 4949
    __ARG_1.'emitnull'($S5)
    goto __label_19 # break
  __label_20: # default
.annotate 'line', 4952
    ne $S1, '', __label_24
# {
.annotate 'line', 4953
    $P9 = self.'tempreg'('P')
    set $S1, $P9
.annotate 'line', 4954
    __ARG_1.'emitnull'($S1)
# }
  __label_24: # endif
.annotate 'line', 4956
    set $S5, $S1
  __label_19: # switch end
# }
    goto __label_18
  __label_17: # else
# {
.annotate 'line', 4960
    iseq $I3, $S3, $S4
    if $I3 goto __label_27
    iseq $I3, $S4, '?'
  __label_27:
    unless $I3 goto __label_25
.annotate 'line', 4961
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S5, $P6
    goto __label_26
  __label_25: # else
# {
.annotate 'line', 4963
# aux: $S6
    null $S6
.annotate 'line', 4964
    $P6 = self.'tempreg'($S4)
    set $S5, $P6
# switch
.annotate 'line', 4965
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
.annotate 'line', 4967
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
.annotate 'line', 4971
    $P6 = $P4.'emit_get'(__ARG_1)
    set $S6, $P6
.annotate 'line', 4972
    __ARG_1.'emitbox'($S5, $S6)
    goto __label_34 # break
  __label_35: # default
.annotate 'line', 4975
    $P4.'emit'(__ARG_1, $S5)
  __label_34: # switch end
    goto __label_28 # break
  __label_31: # case
  __label_32: # case
  __label_33: # case
.annotate 'line', 4981
    $P8 = $P4.'emit_get'(__ARG_1)
    set $S6, $P8
.annotate 'line', 4982
    __ARG_1.'emitset'($S5, $S6)
    goto __label_28 # break
  __label_29: # default
.annotate 'line', 4985
    $P4.'emit'(__ARG_1, $S5)
  __label_28: # switch end
# }
  __label_26: # endif
# }
  __label_18: # endif
.annotate 'line', 4989
# predefined push
    push $P3, $S5
# }
  __label_12: # for iteration
.annotate 'line', 4938
    inc $I2
    goto __label_14
  __label_13: # for end
  __label_1: # switch end
.annotate 'line', 4992
    getattribute $P6, self, 'predef'
    getattribute $P8, self, 'start'
    $P6.'expand'(__ARG_1, self, $P8, __ARG_2, $P3)
# }
.annotate 'line', 4993

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallPredefExpr' ]
.annotate 'line', 4893
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 4895
    addattribute $P0, 'predef'
.annotate 'line', 4896
    addattribute $P0, 'args'
.end
.namespace [ ]

.sub 'genpredefcallexpr' :subid('WSubId_66')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5000
# callname: $S1
    $P3 = __ARG_2.'name'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5001
    __ARG_1.'use_predef'($S1)
.annotate 'line', 5002
# nargs: $I1
    unless_null __ARG_3, __label_3
    null $I1
    goto __label_2
  __label_3:
    $I1 = __ARG_3.'numargs'()
  __label_2:
.annotate 'line', 5003
# var rawargs: $P1
    ne $I1, 0, __label_5
    root_new $P3, ['parrot';'ResizablePMCArray']
    set $P1, $P3
    goto __label_4
  __label_5:
    $P1 = __ARG_3.'getrawargs'()
  __label_4:
.annotate 'line', 5006
    isa $I2, __ARG_2, [ 'PredefFunctionEval' ]
    unless $I2 goto __label_6
# {
.annotate 'line', 5007
.const 'Sub' $P5 = 'WSubId_64'
    $P3 = $P5($P1)
    if_null $P3, __label_7
    unless $P3 goto __label_7
# {
.annotate 'line', 5008
# var evalfun: $P2
    getattribute $P2, __ARG_2, 'evalfun'
.annotate 'line', 5009
    getattribute $P3, __ARG_1, 'owner'
    getattribute $P4, __ARG_1, 'start'
    .tailcall $P2($P3, $P4, $P1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 5013
    new $P4, [ 'CallPredefExpr' ]
    getattribute $P6, __ARG_1, 'owner'
    getattribute $P7, __ARG_1, 'start'
    $P4.'CallPredefExpr'($P6, $P7, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
# }
.annotate 'line', 5014

.end # genpredefcallexpr

.namespace [ 'CallExpr' ]

.sub 'CallExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5024
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5025
    setattribute self, 'funref', __ARG_4
.annotate 'line', 5026
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5027
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5028
    __ARG_1.'unget'($P1)
.annotate 'line', 5029
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_2, __ARG_3, __ARG_1, ')')
    set $P3, $P4
    setattribute self, 'args', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 5031

.end # CallExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5032
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5035
# var funref: $P1
    getattribute $P6, self, 'funref'
    $P1 = $P6.'optimize'()
.annotate 'line', 5036
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5037
# nargs: $I1
    null $I1
.annotate 'line', 5038
    if_null $P2, __label_1
# {
.annotate 'line', 5039
    $P2 = $P2.'optimize'()
.annotate 'line', 5040
    $P6 = $P2.'numargs'()
    set $I1, $P6
# }
  __label_1: # endif
.annotate 'line', 5043
    isa $I2, $P1, [ 'MemberExpr' ]
    unless $I2 goto __label_2
.annotate 'line', 5044
    new $P7, [ 'CallMemberExpr' ]
    $P7.'CallMemberExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_2: # endif
.annotate 'line', 5045
    isa $I2, $P1, [ 'MemberRefExpr' ]
    unless $I2 goto __label_3
.annotate 'line', 5046
    new $P7, [ 'CallMemberRefExpr' ]
    $P7.'CallMemberRefExpr'(self, $P1, $P2)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 5049
    $P6 = $P1.'isidentifier'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
# {
.annotate 'line', 5050
# callname: $S1
    $P7 = $P1.'getName'()
    null $S1
    if_null $P7, __label_5
    set $S1, $P7
  __label_5:
.annotate 'line', 5051
# var predef: $P3
.const 'Sub' $P8 = 'WSubId_65'
    $P3 = $P8($S1, $I1)
.annotate 'line', 5052
    if_null $P3, __label_6
.annotate 'line', 5053
.const 'Sub' $P9 = 'WSubId_66'
    getattribute $P6, self, 'owner'
    .tailcall $P9($P6, $P3, $P2)
  __label_6: # endif
.annotate 'line', 5054
# call: $S2
    $P6 = $P1.'checkIdentifier'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5055
    ne $S2, '', __label_8
# {
.annotate 'line', 5056
    new $P4, ['ResizableStringArray']
    set $P4, 1
    set $S4, $S1
    $P4[0] = $S4
.annotate 'line', 5057
# var sym: $P5
    $P5 = self.'findsymbol'($P4)
.annotate 'line', 5058
    if_null $P5, __label_9
# {
.annotate 'line', 5059
# id: $S3
    $P6 = $P5.'makesubid'()
    null $S3
    if_null $P6, __label_10
    set $S3, $P6
  __label_10:
.annotate 'line', 5060
    box $P6, $S3
    setattribute self, 'subid', $P6
# }
  __label_9: # endif
# }
  __label_8: # endif
# }
  __label_4: # endif
.annotate 'line', 5065
    setattribute self, 'funref', $P1
.annotate 'line', 5066
    setattribute self, 'args', $P2
.annotate 'line', 5067
    .return(self)
# }
.annotate 'line', 5068

.end # optimize


.sub 'cantailcall' :method
# Body
# {
.annotate 'line', 5071
    .return(1)
# }
.annotate 'line', 5072

.end # cantailcall


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5075
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 5076
# reg: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'createreg'('P')
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5077
# predefined string
    getattribute $P2, self, 'subid'
    set $S3, $P2
    concat $S4, ".const 'Sub' ", $S1
    concat $S4, $S4, " = '"
    concat $S4, $S4, $S3
    concat $S4, $S4, "'"
    __ARG_1.'say'($S4)
.annotate 'line', 5078
    .return($S1)
# }
  __label_1: # endif
.annotate 'line', 5080
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5081
# call: $S2
    null $S2
.annotate 'line', 5082
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
# {
.annotate 'line', 5083
    $P3 = $P1.'checkIdentifier'()
    set $S2, $P3
.annotate 'line', 5084
    ne $S2, '', __label_5
.annotate 'line', 5085
    root_new $P2, ['parrot';'ResizablePMCArray']
    box $P3, "'"
    push $P2, $P3
    $P4 = $P1.'getName'()
    push $P2, $P4
    box $P3, "'"
    push $P2, $P3
# predefined join
    join $S2, "", $P2
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 5088
    $P2 = $P1.'emit_get'(__ARG_1)
    set $S2, $P2
  __label_4: # endif
.annotate 'line', 5089
    .return($S2)
# }
.annotate 'line', 5090

.end # emitcall


.sub 'prepareargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5093
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5094
    if_null $P1, __label_1
.annotate 'line', 5095
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
# }
.annotate 'line', 5096

.end # prepareargs


.sub 'emitargs' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5099
    __ARG_1.'print'('(')
.annotate 'line', 5100
# var args: $P1
    getattribute $P1, self, 'args'
.annotate 'line', 5101
    if_null $P1, __label_1
.annotate 'line', 5102
    $P1.'emitargs'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5103
    __ARG_1.'say'(')')
# }
.annotate 'line', 5104

.end # emitargs


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5107
# call: $S1
    $P1 = self.'emitcall'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5108
    self.'prepareargs'(__ARG_1)
.annotate 'line', 5110
    self.'annotate'(__ARG_1)
.annotate 'line', 5112
    __ARG_1.'print'('    ')
.annotate 'line', 5113
    isnull $I1, __ARG_2
    not $I1
    unless $I1 goto __label_3
    set $S2, __ARG_2
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
# {
.annotate 'line', 5114
    set $S3, __ARG_2
    ne $S3, '.tailcall', __label_4
.annotate 'line', 5115
    __ARG_1.'print'('.tailcall ')
    goto __label_5
  __label_4: # else
.annotate 'line', 5117
    __ARG_1.'print'(__ARG_2, ' = ')
  __label_5: # endif
# }
  __label_2: # endif
.annotate 'line', 5120
    __ARG_1.'print'($S1)
.annotate 'line', 5121
    self.'emitargs'(__ARG_1)
# }
.annotate 'line', 5122

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallExpr' ]
.annotate 'line', 5016
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5018
    addattribute $P0, 'funref'
.annotate 'line', 5019
    addattribute $P0, 'args'
.annotate 'line', 5020
    addattribute $P0, 'subid'
.end
.namespace [ 'CallMemberExpr' ]

.sub 'CallMemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5134
    getattribute $P5, __ARG_1, 'owner'
    getattribute $P6, __ARG_1, 'start'
    self.'Expr'($P5, $P6)
.annotate 'line', 5135
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5136
    setattribute self, 'args', __ARG_3
.annotate 'line', 5141
# var first: $P1
    getattribute $P1, __ARG_2, 'left'
  __label_2: # while
.annotate 'line', 5142
    isa $I1, $P1, [ 'MemberExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5143
    getattribute $P1, $P1, 'left'
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 5144
    isa $I1, $P1, [ 'IdentifierExpr' ]
    unless $I1 goto __label_3
# {
.annotate 'line', 5145
# var idfirst: $P2
    $P2 = $P1.'checkIdentifier'()
.annotate 'line', 5146
    isnull $I1, $P2
    if $I1 goto __label_5
    set $S1, $P2
    iseq $I1, $S1, ''
  __label_5:
    unless $I1 goto __label_4
# {
.annotate 'line', 5147
# var key: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5148
    __ARG_2.'buildkey'($P3)
.annotate 'line', 5149
# var sym: $P4
    $P4 = self.'findsymbol'($P3)
.annotate 'line', 5150
    if_null $P4, __label_6
.annotate 'line', 5151
    $P6 = $P4.'makesubid'()
    setattribute self, 'subid', $P6
  __label_6: # endif
# }
  __label_4: # endif
# }
  __label_3: # endif
# }
.annotate 'line', 5154

.end # CallMemberExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5157
    getattribute $P2, self, 'subid'
    if_null $P2, __label_1
# {
.annotate 'line', 5158
# reg: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'createreg'('P')
    null $S1
    if_null $P3, __label_2
    set $S1, $P3
  __label_2:
.annotate 'line', 5159
# predefined string
    getattribute $P2, self, 'subid'
    set $S2, $P2
    concat $S3, ".const 'Sub' ", $S1
    concat $S3, $S3, " = '"
    concat $S3, $S3, $S2
    concat $S3, $S3, "'"
    __ARG_1.'say'($S3)
.annotate 'line', 5160
    .return($S1)
# }
  __label_1: # endif
.annotate 'line', 5162
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5163
    root_new $P2, ['parrot';'ResizablePMCArray']
    $P4 = $P1.'emit_left_get'(__ARG_1)
    push $P2, $P4
    box $P3, ".'"
    push $P2, $P3
.annotate 'line', 5164
    $P5 = $P1.'get_member'()
.annotate 'line', 5163
    push $P2, $P5
    box $P3, "'"
    push $P2, $P3
# predefined join
.annotate 'line', 5156
    join $S2, "", $P2
.annotate 'line', 5163
    .return($S2)
# }
.annotate 'line', 5165

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberExpr' ]
.annotate 'line', 5130
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'CallMemberRefExpr' ]

.sub 'CallMemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5175
    getattribute $P1, __ARG_1, 'owner'
    getattribute $P2, __ARG_1, 'start'
    self.'Expr'($P1, $P2)
.annotate 'line', 5176
    setattribute self, 'funref', __ARG_2
.annotate 'line', 5177
    setattribute self, 'args', __ARG_3
# }
.annotate 'line', 5178

.end # CallMemberRefExpr


.sub 'emitcall' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5181
# var funref: $P1
    getattribute $P1, self, 'funref'
.annotate 'line', 5182
# var right: $P2
    getattribute $P2, $P1, 'right'
.annotate 'line', 5183
# var type: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 5184
    set $S3, $P3
    isne $I1, $S3, 'P'
    unless $I1 goto __label_2
    set $S4, $P3
    isne $I1, $S4, 'S'
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 5185
    getattribute $P5, $P1, 'start'
    $P4("Invalid expression type in '.*'", $P5)
  __label_1: # endif
.annotate 'line', 5188
# lreg: $S1
    $P5 = $P1.'emit_left_get'(__ARG_1)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 5189
# rreg: $S2
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P5, __label_4
    set $S2, $P5
  __label_4:
.annotate 'line', 5190
    concat $S3, $S1, '.'
    concat $S3, $S3, $S2
    .return($S3)
# }
.annotate 'line', 5191

.end # emitcall

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CallMemberRefExpr' ]
.annotate 'line', 5171
    get_class $P1, [ 'CallExpr' ]
    addparent $P0, $P1
.end
.namespace [ 'MemberExprBase' ]

.sub 'MemberExprBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5201
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5202
    setattribute self, 'left', __ARG_3
# }
.annotate 'line', 5203

.end # MemberExprBase


.sub 'emit_left_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5206
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5207
# type: $S1
    $P2 = $P1.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5208
# reg: $S2
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 5209
    eq $S1, 'P', __label_3
# {
.annotate 'line', 5210
# auxreg: $S3
    set $S3, $S2
.annotate 'line', 5211
    $P2 = self.'tempreg'('P')
    set $S2, $P2
.annotate 'line', 5212
    __ARG_1.'emitbox'($S2, $S3)
# }
  __label_3: # endif
.annotate 'line', 5214
    .return($S2)
# }
.annotate 'line', 5215

.end # emit_left_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExprBase' ]
.annotate 'line', 5196
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5198
    addattribute $P0, 'left'
.end
.namespace [ 'MemberExpr' ]

.sub 'MemberExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5224
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5225
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5226

.end # MemberExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5227
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5230
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5231
    .return(self)
# }
.annotate 'line', 5232

.end # optimize


.sub 'buildkey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5235
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5236
    isa $I1, $P1, [ 'IdentifierExpr' ]
    unless $I1 goto __label_1
.annotate 'line', 5237
    $P2 = $P1.'getName'()
# predefined push
    push __ARG_1, $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 5239
    $P1.'buildkey'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5240
    getattribute $P3, self, 'right'
    $P2 = $P3.'getidentifier'()
# predefined push
    push __ARG_1, $P2
# }
.annotate 'line', 5241

.end # buildkey


.sub 'get_member' :method
# Body
# {
.annotate 'line', 5244
    getattribute $P1, self, 'right'
    .return($P1)
# }
.annotate 'line', 5245

.end # get_member


.sub '__emit_assign_aux' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5248
# ident: $S1
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5249
    self.'annotate'(__ARG_1)
.annotate 'line', 5250
    __ARG_1.'say'('    ', "setattribute ", __ARG_2, ", '", $S1, "', ", __ARG_3)
# }
.annotate 'line', 5251

.end # __emit_assign_aux


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5254
# result: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5255
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5256
    .return($S1)
# }
.annotate 'line', 5257

.end # emit_get


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5260
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5261
# ident: $S2
    getattribute $P2, self, 'right'
    $P1 = $P2.'getidentifier'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5262
    self.'annotate'(__ARG_1)
.annotate 'line', 5263
    __ARG_1.'say'('    ', 'getattribute ', __ARG_2, ', ', $S1, ", '", $S2, "'")
# }
.annotate 'line', 5264

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5267
    self.'emit'(__ARG_1, __ARG_2)
# }
.annotate 'line', 5268

.end # emit_init


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5271
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5272
# value: $S2
    null $S2
.annotate 'line', 5273
    ne __ARG_2, 'P', __label_2
# {
.annotate 'line', 5275
    ne __ARG_3, 'null', __label_4
# {
.annotate 'line', 5276
    $P1 = self.'tempreg'('P')
    set __ARG_3, $P1
.annotate 'line', 5277
    __ARG_1.'emitnull'(__ARG_3)
# }
  __label_4: # endif
.annotate 'line', 5279
    set $S2, __ARG_3
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5282
    $P1 = self.'tempreg'('P')
    set $S2, $P1
.annotate 'line', 5283
    __ARG_1.'emitbox'($S2, __ARG_3)
# }
  __label_3: # endif
.annotate 'line', 5285
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
# }
.annotate 'line', 5286

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5289
# obj: $S1
    getattribute $P2, self, 'left'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5290
# value: $S2
    $P1 = self.'tempreg'('P')
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 5291
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_3
    unless $P1 goto __label_3
.annotate 'line', 5292
    __ARG_1.'emitnull'($S2)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 5294
# rreg: $S3
    $P2 = __ARG_2.'emit_get'(__ARG_1)
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 5295
    $P1 = __ARG_2.'checkresult'()
    set $S4, $P1
    eq $S4, 'P', __label_6
.annotate 'line', 5296
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7
  __label_6: # else
.annotate 'line', 5298
    set $S2, $S3
  __label_7: # endif
# }
  __label_4: # endif
.annotate 'line', 5300
    self.'__emit_assign_aux'(__ARG_1, $S1, $S2)
.annotate 'line', 5301
    .return($S2)
# }
.annotate 'line', 5302

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberExpr' ]
.annotate 'line', 5218
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5220
    addattribute $P0, 'right'
.end
.namespace [ 'MemberRefExpr' ]

.sub 'MemberRefExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5312
    self.'MemberExprBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5313
    setattribute self, 'right', __ARG_4
# }
.annotate 'line', 5314

.end # MemberRefExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5315
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5318
    getattribute $P3, self, 'left'
    $P2 = $P3.'optimize'()
    setattribute self, 'left', $P2
.annotate 'line', 5319
    getattribute $P3, self, 'right'
    $P2 = $P3.'optimize'()
    setattribute self, 'right', $P2
.annotate 'line', 5320
    .return(self)
# }
.annotate 'line', 5321

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 5325
    getattribute $P2, self, 'start'
.annotate 'line', 5324
    $P1('Member reference can be used only for method calls', $P2)
# }
.annotate 'line', 5326

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MemberRefExpr' ]
.annotate 'line', 5307
    get_class $P1, [ 'MemberExprBase' ]
    addparent $P0, $P1
.annotate 'line', 5309
    addattribute $P0, 'right'
.end
.namespace [ 'IndexExpr' ]

.sub 'IndexExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5340
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5341
    setattribute self, 'left', __ARG_4
.annotate 'line', 5342
    new $P3, [ 'SimpleArgList' ]
    $P3.'SimpleArgList'(__ARG_1, __ARG_2, ']')
    set $P2, $P3
    setattribute self, 'args', $P2
# }
.annotate 'line', 5343

.end # IndexExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5346
    getattribute $P2, self, 'left'
    $P1 = $P2.'checkresult'()
    set $S1, $P1
    ne $S1, 'S', __label_1
.annotate 'line', 5347
    .return('S')
    goto __label_2
  __label_1: # else
.annotate 'line', 5349
    .return('P')
  __label_2: # endif
# }
.annotate 'line', 5350

.end # checkresult


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5353
# var left: $P1
    getattribute $P5, self, 'left'
    $P1 = $P5.'optimize'()
.annotate 'line', 5354
    setattribute self, 'left', $P1
.annotate 'line', 5355
# var args: $P2
    getattribute $P2, self, 'args'
.annotate 'line', 5356
    $P2.'optimizeargs'()
.annotate 'line', 5360
    $I2 = $P1.'isstringliteral'()
    unless $I2 goto __label_2
    $P5 = $P2.'numargs'()
    set $I3, $P5
    iseq $I2, $I3, 1
  __label_2:
    unless $I2 goto __label_1
# {
.annotate 'line', 5361
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 5362
    $P5 = $P3.'isintegerliteral'()
    if_null $P5, __label_3
    unless $P5 goto __label_3
# {
.annotate 'line', 5363
# ival: $I1
    $P6 = $P3.'getIntegerValue'()
    set $I1, $P6
.annotate 'line', 5364
# sval: $S1
    $P5 = $P1.'get_value'()
    null $S1
    if_null $P5, __label_4
    set $S1, $P5
  __label_4:
.annotate 'line', 5365
# var t: $P4
    new $P4, [ 'TokenQuoted' ]
    getattribute $P6, self, 'start'
    getattribute $P5, $P6, 'file'
    getattribute $P8, self, 'start'
    getattribute $P7, $P8, 'line'
.annotate 'line', 5366
# predefined substr
.annotate 'line', 5365
    substr $S2, $S1, $I1, 1
    $P4.'TokenQuoted'($P5, $P7, $S2)
.annotate 'line', 5367
    new $P6, [ 'StringLiteral' ]
    getattribute $P7, self, 'owner'
    $P6.'StringLiteral'($P7, $P4)
    set $P5, $P6
    .return($P5)
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5370
    .return(self)
# }
.annotate 'line', 5371

.end # optimize


.sub 'emit_prep' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5374
    getattribute $P2, self, 'regleft'
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_2
    getattribute $P3, self, 'argregs'
    isnull $I1, $P3
    not $I1
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_6'
.annotate 'line', 5375
    getattribute $P5, self, 'start'
    $P4('wrong call to IndexExpr.emit_args', $P5)
  __label_1: # endif
.annotate 'line', 5376
# var left: $P1
    getattribute $P1, self, 'left'
.annotate 'line', 5377
    $P5 = $P1.'isidentifier'()
    if_null $P5, __label_4
    unless $P5 goto __label_4
.annotate 'line', 5378
    $P3 = $P1.'getIdentifier'()
    goto __label_3
  __label_4:
.annotate 'line', 5379
    $P3 = $P1.'emit_get'(__ARG_1)
  __label_3:
.annotate 'line', 5377
    setattribute self, 'regleft', $P3
.annotate 'line', 5380
    getattribute $P5, self, 'args'
    $P3 = $P5.'getargvalues'(__ARG_1)
    setattribute self, 'argregs', $P3
# }
.annotate 'line', 5381

.end # emit_prep


.sub 'emit_aux' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5384
# var regleft: $P1
    getattribute $P1, self, 'regleft'
.annotate 'line', 5385
# var argregs: $P2
    getattribute $P2, self, 'argregs'
.annotate 'line', 5386
    isnull $I1, $P1
    if $I1 goto __label_2
    isnull $I1, $P2
  __label_2:
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_6'
.annotate 'line', 5387
    getattribute $P4, self, 'start'
    $P3('wrong call to IndexExpr.emit_aux', $P4)
  __label_1: # endif
.annotate 'line', 5388
    getattribute $P4, self, 'regleft'
    __ARG_1.'print'($P4, '[')
.annotate 'line', 5389
# predefined join
    join $S1, '; ', $P2
    __ARG_1.'print'($S1)
.annotate 'line', 5390
    __ARG_1.'print'(']')
# }
.annotate 'line', 5391

.end # emit_aux


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5394
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5395
# type: $S1
    $P2 = self.'checkresult'()
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 5396
    ne $S1, 'S', __label_2
# {
.annotate 'line', 5397
# var argregs: $P1
    getattribute $P1, self, 'argregs'
.annotate 'line', 5398
# nargs: $I1
# predefined elements
    elements $I1, $P1
.annotate 'line', 5399
    eq $I1, 1, __label_4
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 5400
    getattribute $P2, self, 'start'
    $P3('Bad string index', $P2)
  __label_4: # endif
.annotate 'line', 5401
    set $S2, __ARG_2
    ne $S2, '', __label_5
.annotate 'line', 5402
    __ARG_2 = self.'tempreg'('S')
  __label_5: # endif
.annotate 'line', 5403
    getattribute $P2, self, 'regleft'
    $P4 = $P1[0]
    __ARG_1.'say'('    ', 'substr ', __ARG_2, ', ', $P2, ', ', $P4, ', ', 1)
# }
    goto __label_3
  __label_2: # else
# {
.annotate 'line', 5406
    self.'annotate'(__ARG_1)
.annotate 'line', 5407
    __ARG_1.'print'('    ', __ARG_2, ' = ')
.annotate 'line', 5408
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5409
    __ARG_1.'say'('')
# }
  __label_3: # endif
# }
.annotate 'line', 5411

.end # emit


.sub 'emit_assign' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5414
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5415
    self.'annotate'(__ARG_1)
.annotate 'line', 5416
    __ARG_1.'print'('    ')
.annotate 'line', 5417
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5418
    __ARG_1.'say'(' = ', __ARG_3)
# }
.annotate 'line', 5419

.end # emit_assign


.sub 'emit_assign_get' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5422
    self.'emit_prep'(__ARG_1)
.annotate 'line', 5423
# rreg: $S1
    null $S1
.annotate 'line', 5424
    $P1 = __ARG_2.'isnull'()
    if_null $P1, __label_1
    unless $P1 goto __label_1
# {
.annotate 'line', 5425
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 5426
    __ARG_1.'emitnull'($S1)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 5429
    $P1 = __ARG_2.'emit_get'(__ARG_1)
    set $S1, $P1
  __label_2: # endif
.annotate 'line', 5430
    self.'annotate'(__ARG_1)
.annotate 'line', 5431
    __ARG_1.'print'('    ')
.annotate 'line', 5432
    self.'emit_aux'(__ARG_1)
.annotate 'line', 5433
    __ARG_1.'say'(' = ', $S1)
.annotate 'line', 5434
    .return($S1)
# }
.annotate 'line', 5435

.end # emit_assign_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IndexExpr' ]
.annotate 'line', 5331
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5333
    addattribute $P0, 'left'
.annotate 'line', 5334
    addattribute $P0, 'regleft'
.annotate 'line', 5335
    addattribute $P0, 'args'
.annotate 'line', 5336
    addattribute $P0, 'argregs'
.end
.namespace [ 'ArrayExpr' ]

.sub 'ArrayExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5446
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5447
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5448
    $P2 = $P1.'isop'(']')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 5449
    __ARG_1.'unget'($P1)
.annotate 'line', 5450
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 5451
.const 'Sub' $P5 = 'WSubId_36'
.const 'Sub' $P6 = 'WSubId_37'
    $P4 = $P5(__ARG_1, __ARG_2, $P6, ']')
    setattribute self, 'values', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 5453

.end # ArrayExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5454
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_38'
.annotate 'line', 5457
    getattribute $P2, self, 'values'
    $P1($P2)
.annotate 'line', 5458
    .return(self)
# }
.annotate 'line', 5459

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5462
    set $S2, __ARG_2
    eq $S2, '', __label_1
# {
.annotate 'line', 5463
# value: $S1
    $P1 = self.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_3
    set $S1, $P1
  __label_3:
.annotate 'line', 5464
    __ARG_1.'emitset'(__ARG_2, $S1)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 5470
    self.'emit_init'(__ARG_1, '')
# }
  __label_2: # endif
# }
.annotate 'line', 5472

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5475
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5476
    self.'emit_init'(__ARG_1, $S1)
.annotate 'line', 5477
    .return($S1)
# }
.annotate 'line', 5478

.end # emit_get


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 5481
    self.'annotate'(__ARG_1)
.annotate 'line', 5482
# itemreg: $S1
    null $S1
.annotate 'line', 5483
# it_p: $S2
    null $S2
.annotate 'line', 5484
    eq __ARG_2, '', __label_1
# {
.annotate 'line', 5485
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'ResizablePMCArray']")
.annotate 'line', 5486
    $P3 = self.'tempreg'('P')
    set $S2, $P3
# }
  __label_1: # endif
.annotate 'line', 5488
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 5489
    if_null $P1, __label_2
# {
.annotate 'line', 5490
    iter $P4, $P1
    set $P4, 0
  __label_3: # for iteration
    unless $P4 goto __label_4
    shift $P2, $P4
# {
# switch
.annotate 'line', 5491
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
.annotate 'line', 5493
# aux: $S3
    $P5 = $P2.'emit_get'(__ARG_1)
    null $S3
    if_null $P5, __label_10
    set $S3, $P5
  __label_10:
.annotate 'line', 5494
    eq __ARG_2, '', __label_11
# {
.annotate 'line', 5495
    __ARG_1.'emitbox'($S2, $S3)
.annotate 'line', 5496
    set $S1, $S2
# }
  __label_11: # endif
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 5500
    $P3 = $P2.'isnull'()
    if_null $P3, __label_12
    unless $P3 goto __label_12
# {
.annotate 'line', 5501
    eq __ARG_2, '', __label_14
# {
.annotate 'line', 5502
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5503
    __ARG_1.'emitnull'($S1)
# }
  __label_14: # endif
# }
    goto __label_13
  __label_12: # else
.annotate 'line', 5507
    $P3 = $P2.'emit_get'(__ARG_1)
    set $S1, $P3
  __label_13: # endif
  __label_5: # switch end
.annotate 'line', 5509
    eq __ARG_2, '', __label_15
# {
.annotate 'line', 5510
    self.'annotate'(__ARG_1)
.annotate 'line', 5511
    __ARG_1.'emitarg2'('push', __ARG_2, $S1)
# }
  __label_15: # endif
# }
    goto __label_3
  __label_4: # endfor
# }
  __label_2: # endif
# }
.annotate 'line', 5515

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ArrayExpr' ]
.annotate 'line', 5440
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5442
    addattribute $P0, 'values'
.end
.namespace [ 'HashExpr' ]

.sub 'HashExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5527
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5528
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5529
# var keys: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 5530
# var values: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 5531
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_1
# {
.annotate 'line', 5532
    __ARG_1.'unget'($P1)
  __label_2: # do
.annotate 'line', 5533
# {
.annotate 'line', 5534
# var key: $P4
.const 'Sub' $P7 = 'WSubId_37'
    $P4 = $P7(__ARG_1, __ARG_2)
.const 'Sub' $P8 = 'WSubId_54'
.annotate 'line', 5535
    $P8(':', __ARG_1)
.annotate 'line', 5536
# var value: $P5
.const 'Sub' $P9 = 'WSubId_37'
    $P5 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 5537
# predefined push
    push $P2, $P4
.annotate 'line', 5538
# predefined push
    push $P3, $P5
# }
  __label_4: # continue
.annotate 'line', 5540
    $P1 = __ARG_1.'get'()
    $P6 = $P1.'isop'(',')
    if_null $P6, __label_3
    if $P6 goto __label_2
  __label_3: # enddo
.annotate 'line', 5541
    $P6 = $P1.'isop'('}')
    isfalse $I1, $P6
    unless $I1 goto __label_5
.const 'Sub' $P10 = 'WSubId_40'
.annotate 'line', 5542
    $P10("',' or '}'", $P1)
  __label_5: # endif
# }
  __label_1: # endif
.annotate 'line', 5544
    setattribute self, 'keys', $P2
.annotate 'line', 5545
    setattribute self, 'values', $P3
# }
.annotate 'line', 5546

.end # HashExpr


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5547
    .return('P')
# }

.end # checkresult


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_38'
.annotate 'line', 5550
    getattribute $P2, self, 'keys'
    $P1($P2)
.const 'Sub' $P3 = 'WSubId_38'
.annotate 'line', 5551
    getattribute $P2, self, 'values'
    $P3($P2)
.annotate 'line', 5552
    .return(self)
# }
.annotate 'line', 5553

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5556
    self.'annotate'(__ARG_1)
.annotate 'line', 5561
    set $S6, __ARG_2
    eq $S6, '', __label_1
.annotate 'line', 5562
    __ARG_1.'say'('    ', 'root_new ', __ARG_2, ", ['parrot';'Hash']")
  __label_1: # endif
.annotate 'line', 5564
# var keys: $P1
    getattribute $P1, self, 'keys'
.annotate 'line', 5565
# var values: $P2
    getattribute $P2, self, 'values'
.annotate 'line', 5566
# n: $I1
    set $P5, $P1
    set $I1, $P5
# for loop
.annotate 'line', 5567
# i: $I2
    null $I2
  __label_4: # for condition
    ge $I2, $I1, __label_3
# {
.annotate 'line', 5568
# var key: $P3
    $P3 = $P1[$I2]
.annotate 'line', 5569
# item: $S1
    null $S1
.annotate 'line', 5570
    $P5 = $P3.'isidentifier'()
    if_null $P5, __label_5
    unless $P5 goto __label_5
# {
.annotate 'line', 5571
# id: $S2
    $P6 = $P3.'getName'()
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5572
    $P5 = self.'tempreg'('P')
    set $S1, $P5
.annotate 'line', 5573
    __ARG_1.'say'('    ', 'get_hll_global ', $S1, ", '", $S2, "'")
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 5576
    $P5 = $P3.'emit_get'(__ARG_1)
    set $S1, $P5
  __label_6: # endif
.annotate 'line', 5578
# var value: $P4
    $P4 = $P2[$I2]
.annotate 'line', 5579
# itemreg: $S3
    null $S3
# switch-case
.annotate 'line', 5581
    $I3 = $P4.'isnull'()
    if $I3 goto __label_10
.annotate 'line', 5587
    $I3 = $P4.'isidentifier'()
    if $I3 goto __label_11
    goto __label_9
  __label_10: # case
.annotate 'line', 5582
    set $S6, __ARG_2
    eq $S6, '', __label_12
# {
.annotate 'line', 5583
    $P5 = self.'tempreg'('P')
    set $S3, $P5
.annotate 'line', 5584
    __ARG_1.'emitnull'($S3)
# }
  __label_12: # endif
    goto __label_8 # break
  __label_11: # case
.annotate 'line', 5588
# s: $S4
    $P5 = $P4.'checkIdentifier'()
    null $S4
    if_null $P5, __label_13
    set $S4, $P5
  __label_13:
.annotate 'line', 5589
    isnull $I3, $S4
    not $I3
    unless $I3 goto __label_16
    isne $I3, $S4, ''
  __label_16:
    unless $I3 goto __label_14
.annotate 'line', 5590
    set $S3, $S4
    goto __label_15
  __label_14: # else
# {
.annotate 'line', 5592
# id: $S5
    $P6 = $P4.'getName'()
    null $S5
    if_null $P6, __label_17
    set $S5, $P6
  __label_17:
.annotate 'line', 5593
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getvar'($S5)
    unless_null $P5, __label_18
# {
.annotate 'line', 5594
    $P7 = self.'tempreg'('P')
    set $S3, $P7
.annotate 'line', 5595
    __ARG_1.'say'('    ', 'get_hll_global ', $S3, ", '", $S5, "'")
# }
    goto __label_19
  __label_18: # else
.annotate 'line', 5598
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_19: # endif
# }
  __label_15: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5602
    $P5 = $P4.'emit_get'(__ARG_1)
    set $S3, $P5
  __label_8: # switch end
.annotate 'line', 5604
    set $S6, __ARG_2
    eq $S6, '', __label_20
.annotate 'line', 5605
    __ARG_1.'say'('    ', __ARG_2, '[', $S1, '] = ', $S3)
  __label_20: # endif
# }
  __label_2: # for iteration
.annotate 'line', 5567
    inc $I2
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 5607

.end # emit


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5610
# container: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 5611
    self.'emit'(__ARG_1, $S1)
.annotate 'line', 5612
    .return($S1)
# }
.annotate 'line', 5613

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'HashExpr' ]
.annotate 'line', 5520
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5522
    addattribute $P0, 'keys'
.annotate 'line', 5523
    addattribute $P0, 'values'
.end
.namespace [ 'NewBaseExpr' ]

.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5626
    .return('P')
# }

.end # checkresult


.sub 'parseinitializer' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 5631
    new $P3, [ 'ArgumentList' ]
    getattribute $P4, self, 'owner'
    getattribute $P5, self, 'start'
    $P3.'ArgumentList'($P4, $P5, __ARG_1, ')')
    set $P2, $P3
    setattribute self, 'initializer', $P2
# }
.annotate 'line', 5632

.end # parseinitializer


.sub 'optimize_initializer' :method
# Body
# {
.annotate 'line', 5635
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5636
    if_null $P1, __label_1
.annotate 'line', 5637
    $P3 = $P1.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
# }
.annotate 'line', 5638

.end # optimize_initializer


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5641
    self.'optimize_initializer'()
.annotate 'line', 5642
    .return(self)
# }
.annotate 'line', 5643

.end # optimize


.sub 'emit_constructor' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 5646
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5647
    if_null $P1, __label_1
.annotate 'line', 5648
    $P1.'getargvalues'(__ARG_1)
  __label_1: # endif
.annotate 'line', 5649
    __ARG_1.'print'('    ', __ARG_2, ".'", __ARG_3, "'(")
.annotate 'line', 5650
    if_null $P1, __label_2
.annotate 'line', 5651
    $P1.'emitargs'(__ARG_1)
  __label_2: # endif
.annotate 'line', 5652
    __ARG_1.'say'(")")
# }
.annotate 'line', 5653

.end # emit_constructor

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewBaseExpr' ]
.annotate 'line', 5618
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5620
    addattribute $P0, 'initializer'
.end
.namespace [ 'NewExpr' ]

.sub 'NewExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5664
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5666
    $I2 = __ARG_4.'isstring'()
    if $I2 goto __label_2
    $I2 = __ARG_4.'isidentifier'()
  __label_2:
    not $I1, $I2
    unless $I1 goto __label_1
.const 'Sub' $P2 = 'WSubId_1'
.annotate 'line', 5667
    $P2("Unimplemented", __ARG_4)
  __label_1: # endif
.annotate 'line', 5668
    setattribute self, 'value', __ARG_4
.annotate 'line', 5669
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 5671
    $P3 = $P1.'isop'('(')
    if_null $P3, __label_3
    unless $P3 goto __label_3
.annotate 'line', 5672
    self.'parseinitializer'(__ARG_1)
    goto __label_4
  __label_3: # else
.annotate 'line', 5674
    __ARG_1.'unget'($P1)
  __label_4: # endif
# }
.annotate 'line', 5675

.end # NewExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5678
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 5679
    isa $I1, $P1, [ 'Token' ]
    unless $I1 goto __label_2
    $I1 = $P1.'isidentifier'()
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 5682
# var desc: $P2
    getattribute $P3, self, 'owner'
    $P4 = $P1.'getidentifier'()
    $P2 = $P3.'getvar'($P4)
.annotate 'line', 5683
    isnull $I1, $P2
    not $I1
    unless $I1 goto __label_4
    $I1 = $P2.'isconst'()
  __label_4:
    unless $I1 goto __label_3
# {
.annotate 'line', 5684
    $P1 = $P2.'getvalue'()
.annotate 'line', 5685
    isa $I2, $P1, [ 'StringLiteral' ]
    not $I1, $I2
    unless $I1 goto __label_5
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 5686
    $P5('Constant value must evaluate to a string', $P1)
  __label_5: # endif
.annotate 'line', 5687
    getattribute $P4, $P1, 'strval'
    setattribute self, 'value', $P4
# }
  __label_3: # endif
# }
  __label_1: # endif
.annotate 'line', 5690
    self.'optimize_initializer'()
.annotate 'line', 5691
    .return(self)
# }
.annotate 'line', 5692

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param int __ARG_3 :optional
# Body
# {
.annotate 'line', 5695
    self.'annotate'(__ARG_1)
.annotate 'line', 5697
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5698
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# Constant BYNAME evaluated at compile time
# Constant BYIDENT evaluated at compile time
.annotate 'line', 5701
# type: $I2
    getattribute $P7, self, 'value'
    $P6 = $P7.'isstring'()
    if_null $P6, __label_4
    unless $P6 goto __label_4
    null $I2
    goto __label_3
  __label_4:
.annotate 'line', 5702
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
.annotate 'line', 5704
# reginit: $S1
    set $S1, ''
.annotate 'line', 5705
# regnew: $S2
    set $P6, __ARG_2
    null $S2
    if_null $P6, __label_7
    set $S2, $P6
  __label_7:
.annotate 'line', 5706
# constructor: $S3
    null $S3
# switch
.annotate 'line', 5707
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
.annotate 'line', 5712
    ne $I2, 1, __label_13
# {
.annotate 'line', 5713
    not $I5, __ARG_3
    unless $I5 goto __label_15
.annotate 'line', 5714
    $P6 = self.'tempreg'('P')
    set $S2, $P6
  __label_15: # endif
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 5717
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5718
    $P6 = $P2.'emit_get'(__ARG_1)
    set $S1, $P6
.annotate 'line', 5719
    concat $S0, ', ', $S1
    set $S1, $S0
# }
  __label_14: # endif
    goto __label_8 # break
  __label_9: # default
.annotate 'line', 5723
    eq $I2, 1, __label_16
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 5724
    getattribute $P6, self, 'start'
    $P10('Multiple init arguments not allowed here', $P6)
  __label_16: # endif
.annotate 'line', 5725
    not $I3, __ARG_3
    unless $I3 goto __label_17
.annotate 'line', 5726
    $P7 = self.'tempreg'('P')
    set $S2, $P7
  __label_17: # endif
  __label_8: # switch end
# switch
.annotate 'line', 5729
    set $I3, $I2
    null $I4
    if $I3 == $I4 goto __label_20
    set $I4, 1
    if $I3 == $I4 goto __label_21
    goto __label_19
  __label_20: # case
.annotate 'line', 5732
# name: $S4
    getattribute $P7, self, 'value'
    $P6 = $P7.'rawstring'()
    null $S4
    if_null $P6, __label_22
    set $S4, $P6
  __label_22:
.annotate 'line', 5733
# var aux: $P3
# predefined get_class
    get_class $P3, $S4
.annotate 'line', 5734
    isnull $I5, $P3
    unless $I5 goto __label_24
    $I5 = self.'dowarnings'()
  __label_24:
    unless $I5 goto __label_23
.const 'Sub' $P11 = 'WSubId_67'
.annotate 'line', 5735
    concat $S5, "Can't locate class ", $S4
    concat $S5, $S5, " at compile time"
    getattribute $P8, self, 'value'
    $P11($S5, $P8)
  __label_23: # endif
.annotate 'line', 5739
    getattribute $P9, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", [ ", $P9, " ]", $S1)
.annotate 'line', 5740
    le $I1, 1, __label_25
# {
.annotate 'line', 5741
    getattribute $P12, self, 'value'
    __ARG_1.'say'($S2, ".'", $P12, "'()")
# }
  __label_25: # endif
    goto __label_18 # break
  __label_21: # case
.annotate 'line', 5745
# var id: $P4
    getattribute $P6, self, 'owner'
    getattribute $P7, self, 'value'
    $P4 = $P6.'getvar'($P7)
.annotate 'line', 5746
    unless_null $P4, __label_26
# {
.annotate 'line', 5748
# var cl: $P5
    getattribute $P8, self, 'owner'
    getattribute $P9, self, 'value'
    $P5 = $P8.'checkclass'($P9)
.annotate 'line', 5749
    if_null $P5, __label_28
# {
.annotate 'line', 5750
    $P6 = $P5.'getclasskey'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, $S1)
# }
    goto __label_29
  __label_28: # else
# {
.annotate 'line', 5753
    $P6 = self.'dowarnings'()
    if_null $P6, __label_30
    unless $P6 goto __label_30
.const 'Sub' $P13 = 'WSubId_67'
.annotate 'line', 5754
    $P13('Checking: new unknown type')
  __label_30: # endif
.annotate 'line', 5755
    getattribute $P6, self, 'value'
    __ARG_1.'say'('    ', 'new ', $S2, ", ['", $P6, "']", $S1)
# }
  __label_29: # endif
.annotate 'line', 5757
    getattribute $P6, self, 'value'
    set $S3, $P6
# }
    goto __label_27
  __label_26: # else
# {
.annotate 'line', 5761
    $P6 = $P4.'getreg'()
    __ARG_1.'say'('    ', 'new ', $S2, ", ", $P6, "", $S1)
# }
  __label_27: # endif
    goto __label_18 # break
  __label_19: # default
.annotate 'line', 5763
.const 'Sub' $P14 = 'WSubId_6'
.annotate 'line', 5765
    $P14('Unexpected type in new')
  __label_18: # switch end
.annotate 'line', 5767
    isgt $I3, $I1, 1
    if $I3 goto __label_32
    isge $I3, $I1, 0
    unless $I3 goto __label_33
    iseq $I3, $I2, 1
  __label_33:
  __label_32:
    unless $I3 goto __label_31
# {
.annotate 'line', 5768
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5769
    not $I3, __ARG_3
    unless $I3 goto __label_34
.annotate 'line', 5770
    __ARG_1.'emitset'(__ARG_2, $S2)
  __label_34: # endif
# }
  __label_31: # endif
# }
.annotate 'line', 5772

.end # emit


.sub 'emit_init' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5775
    .tailcall self.'emit'(__ARG_1, __ARG_2, 1)
# }
.annotate 'line', 5776

.end # emit_init

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewExpr' ]
.annotate 'line', 5658
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5660
    addattribute $P0, 'value'
.end
.namespace [ 'NewIndexedExpr' ]

.sub 'NewIndexedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5787
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5788
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5789
# var nskey: $P1
    new $P1, [ 'ClassSpecifierParrotKey' ]
    $P1.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5790
    setattribute self, 'nskey', $P1
.annotate 'line', 5791
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5792
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5793
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5795
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5796

.end # NewIndexedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5799
# reginit: $S1
    null $S1
.annotate 'line', 5800
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5801
# numinits: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
# switch
.annotate 'line', 5802
    set $I2, $I1
    null $I3
    if $I2 == $I3 goto __label_5
    set $I3, 1
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 5806
# var initval: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 5807
    $P4 = $P2.'emit_get'(__ARG_1)
    set $S1, $P4
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 5808
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 5810
    getattribute $P6, self, 'start'
    $P5('Multiple init arguments not allowed here', $P6)
  __label_3: # switch end
.annotate 'line', 5812
# var nskey: $P3
    getattribute $P3, self, 'nskey'
.annotate 'line', 5813
    __ARG_1.'print'('    ')
.annotate 'line', 5814
    $P4 = $P3.'hasHLL'()
    if_null $P4, __label_7
    unless $P4 goto __label_7
.annotate 'line', 5815
    __ARG_1.'print'("root_")
  __label_7: # endif
.annotate 'line', 5816
    __ARG_1.'print'("new ", __ARG_2, ", ")
.annotate 'line', 5817
    null $P4
    $P3.'emit'(__ARG_1, $P4)
.annotate 'line', 5818
    if_null $S1, __label_8
.annotate 'line', 5819
    __ARG_1.'print'(', ', $S1)
  __label_8: # endif
.annotate 'line', 5820
    __ARG_1.'say'()
# }
.annotate 'line', 5821

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewIndexedExpr' ]
.annotate 'line', 5781
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5783
    addattribute $P0, 'nskey'
.end
.namespace [ 'NewQualifiedExpr' ]

.sub 'NewQualifiedExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5832
    self.'Expr'(__ARG_2, __ARG_3)
.annotate 'line', 5833
    setattribute self, 'owner', __ARG_2
.annotate 'line', 5834
# var nskey: $P1
    new $P1, [ 'ClassSpecifierId' ]
    $P1.'ClassSpecifierId'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 5835
    setattribute self, 'nskey', $P1
.annotate 'line', 5836
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5837
    $P3 = $P2.'isop'('(')
    if_null $P3, __label_1
    unless $P3 goto __label_1
.annotate 'line', 5838
    self.'parseinitializer'(__ARG_1)
    goto __label_2
  __label_1: # else
.annotate 'line', 5840
    __ARG_1.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 5841

.end # NewQualifiedExpr


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5844
# reginit: $S1
    null $S1
.annotate 'line', 5845
# var initializer: $P1
    getattribute $P1, self, 'initializer'
.annotate 'line', 5847
# numinits: $I1
    unless_null $P1, __label_2
    set $I1, -1
    goto __label_1
  __label_2:
    $I1 = $P1.'numargs'()
  __label_1:
.annotate 'line', 5848
# regnew: $S2
    set $P3, __ARG_2
    null $S2
    if_null $P3, __label_3
    set $S2, $P3
  __label_3:
.annotate 'line', 5849
    le $I1, 0, __label_4
.annotate 'line', 5850
    $P3 = self.'tempreg'('P')
    set $S2, $P3
  __label_4: # endif
.annotate 'line', 5851
# var nskey: $P2
    getattribute $P2, self, 'nskey'
.annotate 'line', 5852
    __ARG_1.'print'('    ', 'new ', $S2, ", ")
.annotate 'line', 5853
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5854
    __ARG_1.'say'()
.annotate 'line', 5856
    lt $I1, 0, __label_5
# {
.annotate 'line', 5857
# constructor: $S3
    $P3 = $P2.'last'()
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5858
    self.'emit_constructor'(__ARG_1, $S2, $S3)
.annotate 'line', 5859
    __ARG_1.'emitset'(__ARG_2, $S2)
# }
  __label_5: # endif
# }
.annotate 'line', 5861

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NewQualifiedExpr' ]
.annotate 'line', 5826
    get_class $P1, [ 'NewBaseExpr' ]
    addparent $P0, $P1
.annotate 'line', 5828
    addattribute $P0, 'nskey'
.end
.namespace [ ]

.sub 'parseNew' :subid('WSubId_68')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 5868
# var t: $P1
    $P1 = __ARG_1.'get'()
# switch-case
.annotate 'line', 5871
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 5875
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 5878
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_5
    goto __label_2
  __label_3: # case
.annotate 'line', 5873
    new $P4, [ 'CallExpr' ]
.annotate 'line', 5874
    new $P6, [ 'StringLiteral' ]
    $P6.'StringLiteral'(__ARG_2, __ARG_3)
    set $P5, $P6
    $P4.'CallExpr'(__ARG_1, __ARG_2, __ARG_3, $P5)
    set $P3, $P4
.annotate 'line', 5873
    .return($P3)
  __label_4: # case
.annotate 'line', 5877
    new $P8, [ 'NewIndexedExpr' ]
    $P8.'NewIndexedExpr'(__ARG_1, __ARG_2, __ARG_3)
    set $P7, $P8
    .return($P7)
  __label_5: # case
.annotate 'line', 5881
# var t2: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 5882
    __ARG_1.'unget'($P2)
.annotate 'line', 5883
    $P9 = $P2.'isop'('.')
    if_null $P9, __label_6
    unless $P9 goto __label_6
# {
.annotate 'line', 5885
    new $P11, [ 'NewQualifiedExpr' ]
    $P11.'NewQualifiedExpr'(__ARG_1, __ARG_2, $P1)
    set $P10, $P11
    .return($P10)
# }
  __label_6: # endif
  __label_2: # default
.annotate 'line', 5890
    new $P4, [ 'NewExpr' ]
    $P4.'NewExpr'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # switch end
# }
.annotate 'line', 5892

.end # parseNew

.namespace [ 'OpInstanceOfExpr' ]

.sub 'OpInstanceOfExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 5903
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5904
    setattribute self, 'lexpr', __ARG_3
.annotate 'line', 5905
.const 'Sub' $P3 = 'WSubId_60'
    $P2 = $P3(__ARG_4, self)
    setattribute self, 'checked', $P2
# }
.annotate 'line', 5906

.end # OpInstanceOfExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5909
    getattribute $P3, self, 'lexpr'
    $P2 = $P3.'optimize'()
    setattribute self, 'lexpr', $P2
.annotate 'line', 5910
    .return(self)
# }
.annotate 'line', 5911

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5912
    .return('I')
# }

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5915
# var lexpr: $P1
    getattribute $P1, self, 'lexpr'
.annotate 'line', 5916
# ltype: $S1
    $P3 = $P1.'checkresult'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5917
    eq $S1, 'P', __label_2
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 5918
    getattribute $P3, $P1, 'start'
    $P4('Invalid instanceof left operand', $P3)
  __label_2: # endif
.annotate 'line', 5919
# var checked: $P2
    getattribute $P2, self, 'checked'
.annotate 'line', 5921
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
.annotate 'line', 5922
# check: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_6
    set $S3, $P3
  __label_6:
.annotate 'line', 5923
    self.'annotate'(__ARG_1)
.annotate 'line', 5924
    __ARG_1.'print'('    isa ', $S2, ', ', $S3, ', ')
.annotate 'line', 5925
    getattribute $P3, self, 'owner'
    $P2.'emit'(__ARG_1, $P3)
.annotate 'line', 5926
    __ARG_1.'say'()
# }
.annotate 'line', 5927

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpInstanceOfExpr' ]
.annotate 'line', 5896
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5898
    addattribute $P0, 'lexpr'
.annotate 'line', 5899
    addattribute $P0, 'checked'
.end
.namespace [ 'OpConditionalExpr' ]

.sub 'OpConditionalExpr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 5944
    self.'Expr'(__ARG_1, __ARG_2)
.annotate 'line', 5945
    new $P3, [ 'Condition' ]
    $P2 = $P3.'set'(__ARG_3)
    setattribute self, 'condition', $P2
.annotate 'line', 5946
    setattribute self, 'etrue', __ARG_4
.annotate 'line', 5947
    setattribute self, 'efalse', __ARG_5
.annotate 'line', 5948
    .return(self)
# }
.annotate 'line', 5949

.end # OpConditionalExpr


.sub 'optimize' :method
# Body
# {
.annotate 'line', 5952
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
# switch
.annotate 'line', 5953
    getattribute $P2, self, 'condition'
    $P1 = $P2.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 5955
    getattribute $P3, self, 'etrue'
    .tailcall $P3.'optimize'()
  __label_4: # case
.annotate 'line', 5957
    getattribute $P4, self, 'efalse'
    .tailcall $P4.'optimize'()
  __label_2: # default
.annotate 'line', 5959
    getattribute $P7, self, 'etrue'
    $P6 = $P7.'optimize'()
    setattribute self, 'etrue', $P6
.annotate 'line', 5960
    getattribute $P10, self, 'efalse'
    $P9 = $P10.'optimize'()
    setattribute self, 'efalse', $P9
.annotate 'line', 5961
    .return(self)
  __label_1: # switch end
# }
.annotate 'line', 5963

.end # optimize


.sub 'checkresult' :method
# Body
# {
.annotate 'line', 5966
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 5967
    $P2 = $P1.'isnull'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 5968
    getattribute $P3, self, 'efalse'
    .tailcall $P3.'checkresult'()
    goto __label_2
  __label_1: # else
.annotate 'line', 5970
    .tailcall $P1.'checkresult'()
  __label_2: # endif
# }
.annotate 'line', 5971

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 5974
# cond_end: $S1
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 5975
# cond_false: $S2
    getattribute $P4, self, 'owner'
    $P3 = $P4.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 5976
    getattribute $P3, self, 'condition'
    $P3.'emit_else'(__ARG_1, $S2)
.annotate 'line', 5977
# var etrue: $P1
    getattribute $P1, self, 'etrue'
.annotate 'line', 5978
# tres: $S3
    $P3 = self.'checkresult'()
    null $S3
    if_null $P3, __label_3
    set $S3, $P3
  __label_3:
.annotate 'line', 5979
    $P3 = $P1.'isnull'()
    if_null $P3, __label_4
    unless $P3 goto __label_4
.annotate 'line', 5980
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_5
  __label_4: # else
.annotate 'line', 5982
    $P1.'emit'(__ARG_1, __ARG_2)
  __label_5: # endif
.annotate 'line', 5983
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 5984
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 5985
# var efalse: $P2
    getattribute $P2, self, 'efalse'
.annotate 'line', 5986
    $P3 = $P2.'isnull'()
    if_null $P3, __label_6
    unless $P3 goto __label_6
.annotate 'line', 5987
    __ARG_1.'emitnull'(__ARG_2)
    goto __label_7
  __label_6: # else
# {
.annotate 'line', 5989
# tfalse: $S4
    $P4 = $P2.'checkresult'()
    null $S4
    if_null $P4, __label_8
    set $S4, $P4
  __label_8:
.annotate 'line', 5990
    iseq $I1, $S3, 'P'
    unless $I1 goto __label_11
    isne $I1, $S4, 'P'
  __label_11:
    unless $I1 goto __label_9
# {
.annotate 'line', 5991
# r: $S5
    $P3 = $P2.'emit_get'(__ARG_1)
    null $S5
    if_null $P3, __label_12
    set $S5, $P3
  __label_12:
.annotate 'line', 5992
    __ARG_1.'emitbox'(__ARG_2, $S5)
# }
    goto __label_10
  __label_9: # else
.annotate 'line', 5995
    $P2.'emit'(__ARG_1, __ARG_2)
  __label_10: # endif
# }
  __label_7: # endif
.annotate 'line', 5997
    __ARG_1.'emitlabel'($S1)
# }
.annotate 'line', 5998

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'OpConditionalExpr' ]
.annotate 'line', 5932
    get_class $P1, [ 'Expr' ]
    addparent $P0, $P1
.annotate 'line', 5938
    addattribute $P0, 'condition'
.annotate 'line', 5939
    addattribute $P0, 'etrue'
.annotate 'line', 5940
    addattribute $P0, 'efalse'
.end
.namespace [ ]
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
.annotate 'line', 6042
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
.annotate 'line', 6043
    .return(1)
  __label_4: # case
.annotate 'line', 6044
    .return(2)
  __label_5: # case
.annotate 'line', 6045
    .return(3)
  __label_2: # default
.annotate 'line', 6046
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6048

.end # getOpCode_2


.sub 'getOpCode_4' :subid('WSubId_72')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6052
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
.annotate 'line', 6053
    .return(8)
  __label_4: # case
.annotate 'line', 6054
    .return(11)
  __label_5: # case
.annotate 'line', 6055
    .return(9)
  __label_6: # case
.annotate 'line', 6056
    .return(10)
  __label_2: # default
.annotate 'line', 6058
    $P2 = __ARG_1.'iskeyword'('delete')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(31)
    goto __label_8
  __label_7: # else
.annotate 'line', 6059
    $P3 = __ARG_1.'iskeyword'('exists')
    if_null $P3, __label_9
    unless $P3 goto __label_9
    .return(32)
    goto __label_10
  __label_9: # else
.annotate 'line', 6060
    .return(0)
  __label_10: # endif
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6062

.end # getOpCode_4


.sub 'getOpCode_5' :subid('WSubId_75')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6066
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
.annotate 'line', 6067
    .return(19)
  __label_4: # case
.annotate 'line', 6068
    .return(20)
  __label_5: # case
.annotate 'line', 6069
    .return(21)
  __label_6: # case
.annotate 'line', 6070
    .return(22)
  __label_2: # default
.annotate 'line', 6071
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6073

.end # getOpCode_5


.sub 'getOpCode_7' :subid('WSubId_78')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6077
    $P1 = __ARG_1.'checkop'()
    set $S1, $P1
    set $S2, '<<'
    if $S1 == $S2 goto __label_3
    set $S2, '>>'
    if $S1 == $S2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6078
    .return(28)
  __label_4: # case
.annotate 'line', 6079
    .return(29)
  __label_2: # default
.annotate 'line', 6080
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6082

.end # getOpCode_7


.sub 'getOpCode_8' :subid('WSubId_80')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6086
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
.annotate 'line', 6087
    .return(14)
  __label_4: # case
.annotate 'line', 6088
    .return(16)
  __label_5: # case
.annotate 'line', 6089
    .return(15)
  __label_6: # case
.annotate 'line', 6090
    .return(17)
  __label_2: # default
.annotate 'line', 6092
    $P2 = __ARG_1.'iskeyword'('instanceof')
    if_null $P2, __label_7
    unless $P2 goto __label_7
    .return(27)
    goto __label_8
  __label_7: # else
.annotate 'line', 6093
    .return(0)
  __label_8: # endif
  __label_1: # switch end
# }
.annotate 'line', 6095

.end # getOpCode_8


.sub 'getOpCode_9' :subid('WSubId_82')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6099
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
.annotate 'line', 6100
    .return(12)
  __label_4: # case
.annotate 'line', 6101
    .return(13)
  __label_5: # case
.annotate 'line', 6102
    .return(25)
  __label_6: # case
.annotate 'line', 6103
    .return(26)
  __label_2: # default
.annotate 'line', 6104
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6106

.end # getOpCode_9


.sub 'getOpCode_16' :subid('WSubId_91')
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6110
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
.annotate 'line', 6111
    .return(4)
  __label_4: # case
.annotate 'line', 6112
    .return(5)
  __label_5: # case
.annotate 'line', 6113
    .return(6)
  __label_6: # case
.annotate 'line', 6114
    .return(18)
  __label_7: # case
.annotate 'line', 6115
    .return(23)
  __label_8: # case
.annotate 'line', 6116
    .return(24)
  __label_9: # case
.annotate 'line', 6117
    .return(30)
  __label_2: # default
.annotate 'line', 6118
    .return(0)
  __label_1: # switch end
# }
.annotate 'line', 6120

.end # getOpCode_16


.sub 'parseExpr_0' :subid('WSubId_69')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6124
.const 'Sub' $P3 = 'parseExpr'
.annotate 'line', 6126
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6127
# var expr: $P2
    null $P2
# switch-case
.annotate 'line', 6130
    $I1 = $P1.'isop'('(')
    if $I1 goto __label_3
.annotate 'line', 6134
    $I1 = $P1.'isop'('[')
    if $I1 goto __label_4
.annotate 'line', 6136
    $I1 = $P1.'isop'('{')
    if $I1 goto __label_5
.annotate 'line', 6138
    $I1 = $P1.'isstring'()
    if $I1 goto __label_6
.annotate 'line', 6140
    $I1 = $P1.'isint'()
    if $I1 goto __label_7
.annotate 'line', 6142
    $I1 = $P1.'isfloat'()
    if $I1 goto __label_8
.annotate 'line', 6144
    $I1 = $P1.'iskeyword'('new')
    if $I1 goto __label_9
.annotate 'line', 6146
    $I1 = $P1.'iskeyword'('function')
    if $I1 goto __label_10
.annotate 'line', 6148
    $I1 = $P1.'iskeyword'('class')
    if $I1 goto __label_11
.annotate 'line', 6150
    $I1 = $P1.'isidentifier'()
    if $I1 goto __label_12
    goto __label_2
  __label_3: # case
.annotate 'line', 6131
.const 'Sub' $P4 = 'WSubId_37'
    $P2 = $P4(__ARG_1, __ARG_2)
.const 'Sub' $P5 = 'WSubId_54'
.annotate 'line', 6132
    $P5(')', __ARG_1)
.annotate 'line', 6133
    .return($P2)
  __label_4: # case
.annotate 'line', 6135
    new $P7, [ 'ArrayExpr' ]
    $P7.'ArrayExpr'(__ARG_1, __ARG_2, $P1)
    set $P6, $P7
    .return($P6)
  __label_5: # case
.annotate 'line', 6137
    new $P9, [ 'HashExpr' ]
    $P9.'HashExpr'(__ARG_1, __ARG_2, $P1)
    set $P8, $P9
    .return($P8)
  __label_6: # case
.annotate 'line', 6139
    new $P11, [ 'StringLiteral' ]
    $P11.'StringLiteral'(__ARG_2, $P1)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6141
    new $P13, [ 'IntegerLiteral' ]
    $P13.'IntegerLiteral'(__ARG_2, $P1)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6143
    new $P15, [ 'FloatLiteral' ]
    $P15.'FloatLiteral'(__ARG_2, $P1)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6145
.const 'Sub' $P16 = 'WSubId_68'
    .tailcall $P16(__ARG_1, __ARG_2, $P1)
  __label_10: # case
.annotate 'line', 6147
    new $P18, [ 'FunctionExpr' ]
    $P18.'FunctionExpr'(__ARG_1, __ARG_2, $P1)
    set $P17, $P18
    .return($P17)
  __label_11: # case
.annotate 'line', 6149
    new $P20, [ 'OpClassExpr' ]
    $P20.'OpClassExpr'(__ARG_1, __ARG_2, $P1)
    set $P19, $P20
    .return($P19)
  __label_12: # case
.annotate 'line', 6151
    new $P22, [ 'IdentifierExpr' ]
    $P22.'IdentifierExpr'(__ARG_2, $P1)
    set $P21, $P22
    .return($P21)
  __label_2: # default
.const 'Sub' $P23 = 'WSubId_40'
.annotate 'line', 6153
    $P23('expression', $P1)
  __label_1: # switch end
# }
.annotate 'line', 6155

.end # parseExpr_0


.sub 'parseExpr_2' :subid('WSubId_71')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6159
.const 'Sub' $P5 = 'parseExpr_0'
.const 'Sub' $P6 = 'getOpCode_2'
.annotate 'line', 6161
# var subexp: $P1
.const 'Sub' $P7 = 'WSubId_69'
    $P1 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6162
# var t: $P2
    null $P2
.annotate 'line', 6163
# var start: $P3
    null $P3
.annotate 'line', 6164
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6165
.const 'Sub' $P9 = 'WSubId_70'
    $P2 = __ARG_1.'get'()
    $P8 = $P9($P2)
    set $I1, $P8
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6166
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_5
    set $I3, 2
    if $I2 == $I3 goto __label_6
    set $I3, 3
    if $I2 == $I3 goto __label_7
    goto __label_4
  __label_5: # case
.annotate 'line', 6168
    new $P10, [ 'CallExpr' ]
    $P10.'CallExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P10
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6171
    new $P11, [ 'IndexExpr' ]
    $P11.'IndexExpr'(__ARG_1, __ARG_2, $P2, $P1)
    set $P1, $P11
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6174
    set $P3, $P2
.annotate 'line', 6175
    $P2 = __ARG_1.'get'()
.annotate 'line', 6176
    $P12 = $P2.'isop'('*')
    if_null $P12, __label_8
    unless $P12 goto __label_8
# {
.annotate 'line', 6177
# var right: $P4
.const 'Sub' $P13 = 'WSubId_69'
    $P4 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6178
    new $P8, [ 'MemberRefExpr' ]
    $P8.'MemberRefExpr'(__ARG_2, $P2, $P1, $P4)
    set $P1, $P8
# }
    goto __label_9
  __label_8: # else
.annotate 'line', 6181
    new $P8, [ 'MemberExpr' ]
    $P8.'MemberExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P8
  __label_9: # endif
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6182
.const 'Sub' $P14 = 'WSubId_6'
.annotate 'line', 6184
    $P14('Unexpected code in parseExpr_2')
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6187
    __ARG_1.'unget'($P2)
.annotate 'line', 6188
    .return($P1)
# }
.annotate 'line', 6189

.end # parseExpr_2


.sub 'parseExpr_3' :subid('WSubId_74')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6193
.const 'Sub' $P3 = 'parseExpr_2'
.annotate 'line', 6195
# var subexp: $P1
.const 'Sub' $P4 = 'WSubId_71'
    $P1 = $P4(__ARG_1, __ARG_2)
.annotate 'line', 6196
# var t: $P2
    $P2 = __ARG_1.'get'()
# switch-case
.annotate 'line', 6198
    $I1 = $P2.'isop'('++')
    if $I1 goto __label_3
.annotate 'line', 6200
    $I1 = $P2.'isop'('--')
    if $I1 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6199
    new $P6, [ 'OpPostIncExpr' ]
    $P6.'OpPostIncExpr'(__ARG_2, $P2, $P1)
    set $P5, $P6
    .return($P5)
  __label_4: # case
.annotate 'line', 6201
    new $P8, [ 'OpPostDecExpr' ]
    $P8.'OpPostDecExpr'(__ARG_2, $P2, $P1)
    set $P7, $P8
    .return($P7)
  __label_2: # default
.annotate 'line', 6203
    __ARG_1.'unget'($P2)
.annotate 'line', 6204
    .return($P1)
  __label_1: # switch end
# }
.annotate 'line', 6206

.end # parseExpr_3


.sub 'parseExpr_4' :subid('WSubId_73')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6210
.const 'Sub' $P3 = 'parseExpr_4'
.const 'Sub' $P4 = 'parseExpr_3'
.const 'Sub' $P5 = 'getOpCode_4'
.annotate 'line', 6212
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 6213
# code: $I1
.const 'Sub' $P7 = 'WSubId_72'
    $P6 = $P7($P1)
    set $I1, $P6
.annotate 'line', 6214
    eq $I1, 0, __label_1
# {
.annotate 'line', 6215
# var subexpr: $P2
.const 'Sub' $P8 = 'WSubId_73'
    $P2 = $P8(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6216
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
.annotate 'line', 6218
    new $P9, [ 'OpUnaryMinusExpr' ]
    $P9.'OpUnaryMinusExpr'(__ARG_2, $P1, $P2)
    set $P6, $P9
    .return($P6)
  __label_6: # case
.annotate 'line', 6220
    new $P11, [ 'OpNotExpr' ]
    $P11.'OpNotExpr'(__ARG_2, $P1, $P2)
    set $P10, $P11
    .return($P10)
  __label_7: # case
.annotate 'line', 6222
    new $P13, [ 'OpPreIncExpr' ]
    $P13.'OpPreIncExpr'(__ARG_2, $P1, $P2)
    set $P12, $P13
    .return($P12)
  __label_8: # case
.annotate 'line', 6224
    new $P15, [ 'OpPreDecExpr' ]
    $P15.'OpPreDecExpr'(__ARG_2, $P1, $P2)
    set $P14, $P15
    .return($P14)
  __label_9: # case
.annotate 'line', 6226
    new $P17, [ 'OpDeleteExpr' ]
    $P17.'OpDeleteExpr'(__ARG_2, $P1, $P2)
    set $P16, $P17
    .return($P16)
  __label_10: # case
.annotate 'line', 6228
    new $P19, [ 'OpExistsExpr' ]
    $P19.'OpExistsExpr'(__ARG_2, $P1, $P2)
    set $P18, $P19
    .return($P18)
  __label_4: # default
.const 'Sub' $P20 = 'WSubId_6'
.annotate 'line', 6230
    $P20('Invalid code in parseExpr_4', $P1)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6234
    __ARG_1.'unget'($P1)
.annotate 'line', 6235
.const 'Sub' $P21 = 'WSubId_74'
    .tailcall $P21(__ARG_1, __ARG_2)
# }
  __label_2: # endif
# }
.annotate 'line', 6237

.end # parseExpr_4


.sub 'parseExpr_5' :subid('WSubId_76')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6241
.const 'Sub' $P4 = 'parseExpr_4'
.const 'Sub' $P5 = 'getOpCode_5'
.annotate 'line', 6243
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_73'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6244
# var t: $P2
    null $P2
.annotate 'line', 6245
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6246
.const 'Sub' $P8 = 'WSubId_75'
    $P2 = __ARG_1.'get'()
    $P7 = $P8($P2)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
.annotate 'line', 6247
# var rexpr: $P3
.const 'Sub' $P9 = 'WSubId_73'
    $P3 = $P9(__ARG_1, __ARG_2)
# switch
.annotate 'line', 6248
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
.annotate 'line', 6250
    new $P7, [ 'OpMulExpr' ]
    $P7.'OpMulExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P7
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6253
    new $P10, [ 'OpDivExpr' ]
    $P10.'OpDivExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P10
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6256
    new $P11, [ 'OpModExpr' ]
    $P11.'OpModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P11
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6259
    new $P12, [ 'OpCModExpr' ]
    $P12.'OpCModExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P12
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6260
.const 'Sub' $P13 = 'WSubId_6'
.annotate 'line', 6262
    $P13('Invalid code in parseExpr_5', $P2)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6265
    __ARG_1.'unget'($P2)
.annotate 'line', 6266
    .return($P1)
# }
.annotate 'line', 6267

.end # parseExpr_5


.sub 'parseExpr_6' :subid('WSubId_77')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6271
.const 'Sub' $P5 = 'parseExpr_5'
.annotate 'line', 6273
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_76'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6274
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6275
    $P2 = __ARG_1.'get'()
    $I1 = $P2.'isop'('+')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('-')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6276
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_76'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6277
# var expr: $P4
    null $P4
.annotate 'line', 6278
    $P8 = $P2.'isop'('+')
    if_null $P8, __label_4
    unless $P8 goto __label_4
.annotate 'line', 6279
    new $P9, [ 'OpAddExpr' ]
    $P9.'OpAddExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P9
    goto __label_5
  __label_4: # else
.annotate 'line', 6281
    new $P10, [ 'OpSubExpr' ]
    $P10.'OpSubExpr'(__ARG_2, $P2, $P1, $P3)
    set $P4, $P10
  __label_5: # endif
.annotate 'line', 6282
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6284
    __ARG_1.'unget'($P2)
.annotate 'line', 6285
    .return($P1)
# }
.annotate 'line', 6286

.end # parseExpr_6


.sub 'parseExpr_7' :subid('WSubId_79')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6290
.const 'Sub' $P4 = 'parseExpr_6'
.annotate 'line', 6292
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_77'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6293
# var rexpr: $P2
    null $P2
.annotate 'line', 6294
# var t: $P3
    null $P3
.annotate 'line', 6295
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6296
.const 'Sub' $P7 = 'WSubId_78'
    $P3 = __ARG_1.'get'()
    $P6 = $P7($P3)
    set $I1, $P6
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6297
    set $I2, $I1
    set $I3, 28
    if $I2 == $I3 goto __label_5
    set $I3, 29
    if $I2 == $I3 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 6299
.const 'Sub' $P8 = 'WSubId_77'
    $P2 = $P8(__ARG_1, __ARG_2)
.annotate 'line', 6300
    new $P9, [ 'OpShiftleftExpr' ]
    $P9.'OpShiftleftExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P9
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6303
.const 'Sub' $P10 = 'WSubId_77'
    $P2 = $P10(__ARG_1, __ARG_2)
.annotate 'line', 6304
    new $P11, [ 'OpShiftrightExpr' ]
    $P11.'OpShiftrightExpr'(__ARG_2, $P3, $P1, $P2)
    set $P1, $P11
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6305
.const 'Sub' $P12 = 'WSubId_6'
.annotate 'line', 6307
    $P12('Invalid code in parseExpr_7', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6310
    __ARG_1.'unget'($P3)
.annotate 'line', 6311
    .return($P1)
# }
.annotate 'line', 6312

.end # parseExpr_7


.sub 'parseExpr_8' :subid('WSubId_81')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6316
.const 'Sub' $P4 = 'parseExpr_7'
.const 'Sub' $P5 = 'getOpCode_8'
.annotate 'line', 6318
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_79'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6319
# var rexpr: $P2
    null $P2
.annotate 'line', 6320
# var t: $P3
    null $P3
.annotate 'line', 6321
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6322
.const 'Sub' $P8 = 'WSubId_80'
    $P3 = __ARG_1.'get'()
    $P7 = $P8($P3)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6323
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
.annotate 'line', 6325
.const 'Sub' $P9 = 'WSubId_79'
    $P2 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 6326
    new $P10, [ 'OpLessExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6329
.const 'Sub' $P11 = 'WSubId_79'
    $P2 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6330
    new $P12, [ 'OpGreaterExpr' ]
    $P1 = $P12.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6333
.const 'Sub' $P13 = 'WSubId_79'
    $P2 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6334
    new $P14, [ 'OpLessEqualExpr' ]
    $P1 = $P14.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6337
.const 'Sub' $P15 = 'WSubId_79'
    $P2 = $P15(__ARG_1, __ARG_2)
.annotate 'line', 6338
    new $P16, [ 'OpGreaterEqualExpr' ]
    $P1 = $P16.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6341
    new $P17, [ 'OpInstanceOfExpr' ]
    $P17.'OpInstanceOfExpr'(__ARG_2, $P3, $P1, __ARG_1)
    set $P1, $P17
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6342
.const 'Sub' $P18 = 'WSubId_6'
.annotate 'line', 6344
    $P18('Invalid code in parseExpr_9', $P3)
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

.end # parseExpr_8


.sub 'parseExpr_9' :subid('WSubId_83')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6353
.const 'Sub' $P4 = 'parseExpr_8'
.const 'Sub' $P5 = 'getOpCode_9'
.annotate 'line', 6355
# var lexpr: $P1
.const 'Sub' $P6 = 'WSubId_81'
    $P1 = $P6(__ARG_1, __ARG_2)
.annotate 'line', 6356
# var rexpr: $P2
    null $P2
.annotate 'line', 6357
# var t: $P3
    null $P3
.annotate 'line', 6358
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6359
.const 'Sub' $P8 = 'WSubId_82'
    $P3 = __ARG_1.'get'()
    $P7 = $P8($P3)
    set $I1, $P7
    eq $I1, 0, __label_1
# {
# switch
.annotate 'line', 6360
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
.annotate 'line', 6362
.const 'Sub' $P9 = 'WSubId_81'
    $P2 = $P9(__ARG_1, __ARG_2)
.annotate 'line', 6363
    new $P10, [ 'OpEqualExpr' ]
    $P1 = $P10.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6366
.const 'Sub' $P11 = 'WSubId_81'
    $P2 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6367
    new $P12, [ 'OpNotEqualExpr' ]
    $P1 = $P12.'set'(__ARG_2, $P3, $P1, $P2)
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6370
.const 'Sub' $P13 = 'WSubId_81'
    $P2 = $P13(__ARG_1, __ARG_2)
.annotate 'line', 6371
    new $P14, [ 'OpSameExpr' ]
    $P14.'OpSameExpr'(1, __ARG_2, $P3, $P1, $P2)
    set $P1, $P14
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6374
.const 'Sub' $P15 = 'WSubId_81'
    $P2 = $P15(__ARG_1, __ARG_2)
.annotate 'line', 6375
    new $P16, [ 'OpSameExpr' ]
    $P16.'OpSameExpr'(0, __ARG_2, $P3, $P1, $P2)
    set $P1, $P16
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6376
.const 'Sub' $P17 = 'WSubId_6'
.annotate 'line', 6378
    $P17('Invalid code in parseExpr_8', $P3)
  __label_3: # switch end
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6381
    __ARG_1.'unget'($P3)
.annotate 'line', 6382
    .return($P1)
# }
.annotate 'line', 6383

.end # parseExpr_9


.sub 'parseExpr_10' :subid('WSubId_84')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6387
.const 'Sub' $P4 = 'parseExpr_9'
.annotate 'line', 6389
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_83'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6390
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6391
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('&')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6392
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_83'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6393
    new $P6, [ 'OpBinAndExpr' ]
    $P6.'OpBinAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6395
    __ARG_1.'unget'($P2)
.annotate 'line', 6396
    .return($P1)
# }
.annotate 'line', 6397

.end # parseExpr_10


.sub 'parseExpr_11' :subid('WSubId_85')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6401
.const 'Sub' $P4 = 'parseExpr_10'
.annotate 'line', 6403
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_84'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6404
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6405
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('^')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6406
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_84'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6407
    new $P6, [ 'OpBinXorExpr' ]
    $P6.'OpBinXorExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6409
    __ARG_1.'unget'($P2)
.annotate 'line', 6410
    .return($P1)
# }
.annotate 'line', 6411

.end # parseExpr_11


.sub 'parseExpr_12' :subid('WSubId_86')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6415
.const 'Sub' $P4 = 'parseExpr_11'
.annotate 'line', 6417
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_85'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6418
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6419
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('|')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6420
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_85'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6421
    new $P6, [ 'OpBinOrExpr' ]
    $P6.'OpBinOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6423
    __ARG_1.'unget'($P2)
.annotate 'line', 6424
    .return($P1)
# }
.annotate 'line', 6425

.end # parseExpr_12


.sub 'parseExpr_13' :subid('WSubId_87')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6429
.const 'Sub' $P4 = 'parseExpr_12'
.annotate 'line', 6431
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_86'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6432
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6433
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('&&')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6434
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_86'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6435
    new $P6, [ 'OpBoolAndExpr' ]
    $P6.'OpBoolAndExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6437
    __ARG_1.'unget'($P2)
.annotate 'line', 6438
    .return($P1)
# }
.annotate 'line', 6439

.end # parseExpr_13


.sub 'parseExpr_14' :subid('WSubId_88')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6443
.const 'Sub' $P4 = 'parseExpr_13'
.annotate 'line', 6445
# var lexpr: $P1
.const 'Sub' $P5 = 'WSubId_87'
    $P1 = $P5(__ARG_1, __ARG_2)
.annotate 'line', 6446
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 6447
    $P2 = __ARG_1.'get'()
    $P6 = $P2.'isop'('||')
    if_null $P6, __label_1
    unless $P6 goto __label_1
# {
.annotate 'line', 6448
# var rexpr: $P3
.const 'Sub' $P7 = 'WSubId_86'
    $P3 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6449
    new $P6, [ 'OpBoolOrExpr' ]
    $P6.'OpBoolOrExpr'(__ARG_2, $P2, $P1, $P3)
    set $P1, $P6
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6451
    __ARG_1.'unget'($P2)
.annotate 'line', 6452
    .return($P1)
# }
.annotate 'line', 6453

.end # parseExpr_14


.sub 'parseExpr_15' :subid('WSubId_90')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6457
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_14'
.annotate 'line', 6459
# var econd: $P1
.const 'Sub' $P7 = 'WSubId_88'
    $P1 = $P7(__ARG_1, __ARG_2)
.annotate 'line', 6460
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 6461
    $P8 = $P2.'isop'('?')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 6462
# var etrue: $P3
.const 'Sub' $P9 = 'WSubId_89'
    $P3 = $P9(__ARG_1, __ARG_2)
.const 'Sub' $P10 = 'WSubId_54'
.annotate 'line', 6463
    $P10(':', __ARG_1)
.annotate 'line', 6464
# var efalse: $P4
.const 'Sub' $P11 = 'WSubId_89'
    $P4 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6465
    new $P12, [ 'OpConditionalExpr' ]
    $P12.'OpConditionalExpr'(__ARG_2, $P2, $P1, $P3, $P4)
    set $P8, $P12
    .return($P8)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6468
    __ARG_1.'unget'($P2)
.annotate 'line', 6469
    .return($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6471

.end # parseExpr_15


.sub 'parseExpr_16' :subid('WSubId_89')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6475
.const 'Sub' $P5 = 'parseExpr_16'
.const 'Sub' $P6 = 'parseExpr_15'
.const 'Sub' $P7 = 'getOpCode_16'
.annotate 'line', 6477
# var lexpr: $P1
.const 'Sub' $P8 = 'WSubId_90'
    $P1 = $P8(__ARG_1, __ARG_2)
.annotate 'line', 6478
# var t: $P2
    null $P2
.annotate 'line', 6479
# code: $I1
    null $I1
  __label_2: # while
.annotate 'line', 6480
.const 'Sub' $P10 = 'WSubId_91'
    $P2 = __ARG_1.'get'()
    $P9 = $P10($P2)
    set $I1, $P9
    eq $I1, 0, __label_1
# {
.annotate 'line', 6481
# var rexpr: $P3
.const 'Sub' $P11 = 'WSubId_89'
    $P3 = $P11(__ARG_1, __ARG_2)
.annotate 'line', 6482
# var expr: $P4
    null $P4
# switch
.annotate 'line', 6483
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
.annotate 'line', 6485
    new $P4, [ 'OpAssignExpr' ]
    goto __label_3 # break
  __label_6: # case
.annotate 'line', 6488
    new $P4, [ 'OpAssignToExpr' ]
    goto __label_3 # break
  __label_7: # case
.annotate 'line', 6491
    new $P4, [ 'OpAddToExpr' ]
    goto __label_3 # break
  __label_8: # case
.annotate 'line', 6494
    new $P4, [ 'OpSubToExpr' ]
    goto __label_3 # break
  __label_9: # case
.annotate 'line', 6497
    new $P4, [ 'OpMulToExpr' ]
    goto __label_3 # break
  __label_10: # case
.annotate 'line', 6500
    new $P4, [ 'OpDivToExpr' ]
    goto __label_3 # break
  __label_11: # case
.annotate 'line', 6503
    new $P4, [ 'OpModToExpr' ]
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 6504
.const 'Sub' $P12 = 'WSubId_6'
.annotate 'line', 6506
    $P12('Unexpected code in parseExpr_16', $P2)
  __label_3: # switch end
.annotate 'line', 6508
    $P4.'set'(__ARG_2, $P2, $P1, $P3)
.annotate 'line', 6509
    set $P1, $P4
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6511
    __ARG_1.'unget'($P2)
.annotate 'line', 6512
    .return($P1)
# }
.annotate 'line', 6513

.end # parseExpr_16


.sub 'parseExpr' :subid('WSubId_37')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6517
.const 'Sub' $P1 = 'parseExpr_16'
.annotate 'line', 6519
.const 'Sub' $P2 = 'WSubId_89'
    .tailcall $P2(__ARG_1, __ARG_2)
# }
.annotate 'line', 6520

.end # parseExpr

.namespace [ 'Breakable' ]

.sub 'genbreaklabel' :method
# Body
# {
.annotate 'line', 6535
    getattribute $P1, self, 'brlabel'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6536
    $P2('attempt to generate break label twice')
  __label_1: # endif
.annotate 'line', 6537
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6538
    box $P1, $S1
    setattribute self, 'brlabel', $P1
.annotate 'line', 6539
    .return($S1)
# }
.annotate 'line', 6540

.end # genbreaklabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6543
# var label: $P1
    getattribute $P1, self, 'brlabel'
.annotate 'line', 6544
    unless_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6545
    $P2('attempt to get break label before creating it')
  __label_1: # endif
.annotate 'line', 6546
    .return($P1)
# }
.annotate 'line', 6547

.end # getbreaklabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Breakable' ]
.annotate 'line', 6531
    addattribute $P0, 'brlabel'
.end
.namespace [ 'Continuable' ]

.sub 'gencontinuelabel' :method
# Body
# {
.annotate 'line', 6556
    getattribute $P1, self, 'cntlabel'
    if_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6557
    $P2('attempt to generate continue label twice')
  __label_1: # endif
.annotate 'line', 6558
# label: $S1
    $P1 = self.'genlabel'()
    null $S1
    if_null $P1, __label_2
    set $S1, $P1
  __label_2:
.annotate 'line', 6559
    box $P1, $S1
    setattribute self, 'cntlabel', $P1
.annotate 'line', 6560
    .return($S1)
# }
.annotate 'line', 6561

.end # gencontinuelabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6564
# var label: $P1
    getattribute $P1, self, 'cntlabel'
.annotate 'line', 6565
    unless_null $P1, __label_1
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 6566
    $P2('attempt to get continue label before creating it')
  __label_1: # endif
.annotate 'line', 6567
    .return($P1)
# }
.annotate 'line', 6568

.end # getcontinuelabel

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Continuable' ]
.annotate 'line', 6550
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
.annotate 'line', 6552
    addattribute $P0, 'cntlabel'
.end
.namespace [ 'ReturnYieldStatement' ]

.sub 'parse' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6584
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6585
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6586
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 6587
    __ARG_2.'unget'($P1)
.annotate 'line', 6588
    new $P4, [ 'ArgumentList' ]
    $P4.'ArgumentList'(__ARG_3, __ARG_1, __ARG_2, ";")
    set $P3, $P4
    setattribute self, 'values', $P3
# }
  __label_1: # endif
# }
.annotate 'line', 6590

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6593
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6594
    if_null $P1, __label_1
.annotate 'line', 6595
    $P1 = $P1.'optimize'()
  __label_1: # endif
.annotate 'line', 6596
    .return(self)
# }
.annotate 'line', 6597

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6601
# var values: $P1
    getattribute $P1, self, 'values'
.annotate 'line', 6602
# n: $I1
    unless_null $P1, __label_2
    null $I1
    goto __label_1
  __label_2:
# predefined int
    $P3 = $P1.'numargs'()
    set $I1, $P3
  __label_1:
.annotate 'line', 6605
    iseq $I2, $I1, 1
    unless $I2 goto __label_4
    isa $I2, self, [ 'ReturnStatement' ]
  __label_4:
    unless $I2 goto __label_3
# {
.annotate 'line', 6606
# var func: $P2
    $P2 = $P1.'getfreearg'(0)
.annotate 'line', 6607
    $P3 = $P2.'cantailcall'()
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 6608
    self.'annotate'(__ARG_1)
.annotate 'line', 6609
    .tailcall $P2.'emit'(__ARG_1, '.tailcall')
# }
  __label_5: # endif
# }
  __label_3: # endif
.annotate 'line', 6613
    le $I1, 0, __label_6
.annotate 'line', 6614
    $P1.'getargvalues'(__ARG_1)
  __label_6: # endif
.annotate 'line', 6616
    self.'annotate'(__ARG_1)
.annotate 'line', 6617
    self.'emitret'(__ARG_1)
.annotate 'line', 6618
    le $I1, 0, __label_7
.annotate 'line', 6619
    $P1.'emitargs'(__ARG_1)
  __label_7: # endif
.annotate 'line', 6620
    __ARG_1.'say'(')')
# }
.annotate 'line', 6621

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnYieldStatement' ]
.annotate 'line', 6578
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6580
    addattribute $P0, 'values'
.end
.namespace [ 'ReturnStatement' ]

.sub 'ReturnStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6628
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6629

.end # ReturnStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6632
    __ARG_1.'print'('    ', '.return(')
# }
.annotate 'line', 6633

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ReturnStatement' ]
.annotate 'line', 6624
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'YieldStatement' ]

.sub 'YieldStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6640
    self.'parse'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 6641

.end # YieldStatement


.sub 'emitret' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6644
    __ARG_1.'print'('    ', '.yield(')
# }
.annotate 'line', 6645

.end # emitret

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'YieldStatement' ]
.annotate 'line', 6636
    get_class $P1, [ 'ReturnYieldStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'LabelStatement' ]

.sub 'LabelStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6658
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6659
    setattribute self, 'name', __ARG_1
.annotate 'line', 6660
    getattribute $P3, self, 'owner'
    $P2 = $P3.'createlabel'(__ARG_1)
    setattribute self, 'value', $P2
# }
.annotate 'line', 6661

.end # LabelStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6662
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6665
    self.'annotate'(__ARG_1)
.annotate 'line', 6666
    getattribute $P1, self, 'value'
# predefined string
    getattribute $P2, self, 'name'
    set $S1, $P2
    concat $S2, 'label ', $S1
    __ARG_1.'emitlabel'($P1, $S2)
# }
.annotate 'line', 6667

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LabelStatement' ]
.annotate 'line', 6652
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6654
    addattribute $P0, 'name'
.annotate 'line', 6655
    addattribute $P0, 'value'
.end
.namespace [ 'Reflabel' ]

.sub 'Reflabel' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 6681
    setattribute self, 'owner', __ARG_1
.annotate 'line', 6682
    box $P1, __ARG_2
    setattribute self, 'label', $P1
# }
.annotate 'line', 6683

.end # Reflabel


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6684
    .return(self)
# }

.end # optimize


.sub 'emit_get' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6687
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6688
# value: $S2
    getattribute $P2, self, 'owner'
    $P1 = $P2.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6689
    .return($S2)
# }
.annotate 'line', 6690

.end # emit_get

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'Reflabel' ]
.annotate 'line', 6676
    addattribute $P0, 'owner'
.annotate 'line', 6677
    addattribute $P0, 'label'
.end
.namespace [ 'GotoStatement' ]

.sub 'GotoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6703
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6704
# var t: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P2 = 'WSubId_92'
.annotate 'line', 6705
    $P2($P1)
.annotate 'line', 6706
    setattribute self, 'label', $P1
.const 'Sub' $P4 = 'WSubId_54'
.annotate 'line', 6707
    $P4(';', __ARG_2)
# }
.annotate 'line', 6708

.end # GotoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6709
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6712
    self.'annotate'(__ARG_1)
.annotate 'line', 6713
# label: $S1
    getattribute $P1, self, 'label'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6714
# value: $S2
    $P1 = self.'getlabel'($S1)
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6715
    concat $S3, 'goto ', $S1
    __ARG_1.'emitgoto'($S2, $S3)
# }
.annotate 'line', 6716

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'GotoStatement' ]
.annotate 'line', 6697
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 6699
    addattribute $P0, 'label'
.end
.namespace [ 'ConditionalStatement' ]

.sub 'parseconditionshort' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6727
.const 'Sub' $P2 = 'WSubId_37'
    $P1 = $P2(__ARG_1, self)
    self.'set'($P1)
# }
.annotate 'line', 6728

.end # parseconditionshort


.sub 'parsecondition' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_54'
.annotate 'line', 6731
    $P1('(', __ARG_1)
.annotate 'line', 6732
.const 'Sub' $P3 = 'WSubId_37'
    $P2 = $P3(__ARG_1, self)
    self.'set'($P2)
.const 'Sub' $P4 = 'WSubId_54'
.annotate 'line', 6733
    $P4(')', __ARG_1)
# }
.annotate 'line', 6734

.end # parsecondition

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConditionalStatement' ]
.annotate 'line', 6723
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
    get_class $P2, [ 'Condition' ]
    addparent $P0, $P2
.end
.namespace [ 'IfStatement' ]

.sub 'IfStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6747
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6748
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6749
.const 'Sub' $P4 = 'WSubId_93'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'truebranch', $P3
.annotate 'line', 6750
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 6751
    $P2 = $P1.'iskeyword'("else")
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 6752
.const 'Sub' $P6 = 'WSubId_93'
    $P5 = $P6(__ARG_2, self)
    setattribute self, 'falsebranch', $P5
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 6754
    new $P8, [ 'EmptyStatement' ]
    setattribute self, 'falsebranch', $P8
.annotate 'line', 6755
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
# }
.annotate 'line', 6757

.end # IfStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6760
    self.'optimize_condition'()
.annotate 'line', 6761
    getattribute $P3, self, 'truebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'truebranch', $P2
.annotate 'line', 6762
    getattribute $P3, self, 'falsebranch'
    $P2 = $P3.'optimize'()
    setattribute self, 'falsebranch', $P2
# switch
.annotate 'line', 6763
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6765
    getattribute $P2, self, 'truebranch'
    .return($P2)
  __label_4: # case
.annotate 'line', 6767
    getattribute $P3, self, 'falsebranch'
    .return($P3)
  __label_2: # default
  __label_1: # switch end
.annotate 'line', 6769
    .return(self)
# }
.annotate 'line', 6770

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6773
# var truebranch: $P1
    getattribute $P1, self, 'truebranch'
.annotate 'line', 6774
# var falsebranch: $P2
    getattribute $P2, self, 'falsebranch'
.annotate 'line', 6775
# t_empty: $I1
    $P3 = $P1.'isempty'()
    set $I1, $P3
.annotate 'line', 6776
# f_empty: $I2
    $P3 = $P2.'isempty'()
    set $I2, $P3
.annotate 'line', 6777
# elselabel: $S1
    set $S1, ''
.annotate 'line', 6778
    not $I3, $I2
    unless $I3 goto __label_1
.annotate 'line', 6779
    $P3 = self.'genlabel'()
    set $S1, $P3
  __label_1: # endif
.annotate 'line', 6780
# endlabel: $S2
    $P3 = self.'genlabel'()
    null $S2
    if_null $P3, __label_2
    set $S2, $P3
  __label_2:
.annotate 'line', 6781
# cond_false: $S3
    unless $I2 goto __label_4
    set $S3, $S2
    goto __label_3
  __label_4:
    set $S3, $S1
  __label_3:
.annotate 'line', 6782
    self.'annotate'(__ARG_1)
.annotate 'line', 6783
    self.'emit_else'(__ARG_1, $S3)
.annotate 'line', 6784
    $P1.'emit'(__ARG_1)
.annotate 'line', 6786
    not $I3, $I2
    unless $I3 goto __label_5
# {
.annotate 'line', 6787
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6788
    __ARG_1.'emitlabel'($S1, 'else')
.annotate 'line', 6789
    $P2.'emit'(__ARG_1)
# }
  __label_5: # endif
.annotate 'line', 6791
    __ARG_1.'emitlabel'($S2, 'endif')
# }
.annotate 'line', 6792

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IfStatement' ]
.annotate 'line', 6741
    get_class $P1, [ 'ConditionalStatement' ]
    addparent $P0, $P1
.annotate 'line', 6743
    addattribute $P0, 'truebranch'
.annotate 'line', 6744
    addattribute $P0, 'falsebranch'
.end
.namespace [ 'LoopStatement' ]

.sub 'parsebody' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6804
.const 'Sub' $P3 = 'WSubId_93'
    $P2 = $P3(__ARG_1, self)
    setattribute self, 'body', $P2
# }
.annotate 'line', 6805

.end # parsebody


.sub 'emit_infinite' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6808
# breaklabel: $S1
    $P1 = self.'genbreaklabel'()
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6809
# continuelabel: $S2
    $P1 = self.'gencontinuelabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 6811
    self.'annotate'(__ARG_1)
.annotate 'line', 6812
    __ARG_1.'emitlabel'($S2, 'Infinite loop')
.annotate 'line', 6813
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 6814
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6815
    __ARG_1.'emitlabel'($S1, 'Infinite loop end')
# }
.annotate 'line', 6816

.end # emit_infinite

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LoopStatement' ]
.annotate 'line', 6799
    get_class $P1, [ 'Continuable' ]
    addparent $P0, $P1
.annotate 'line', 6801
    addattribute $P0, 'body'
.end
.namespace [ 'WhileStatement' ]

.sub 'WhileStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6827
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6828
    self.'parsecondition'(__ARG_2)
.annotate 'line', 6829
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 6830

.end # WhileStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6833
    self.'optimize_condition'()
.annotate 'line', 6834
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 6835
    .return(self)
# }
.annotate 'line', 6836

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
# switch
.annotate 'line', 6839
    $P1 = self.'getvalue'()
    set $I1, $P1
    set $I2, 1
    if $I1 == $I2 goto __label_3
    set $I2, 2
    if $I1 == $I2 goto __label_4
    goto __label_2
  __label_3: # case
.annotate 'line', 6841
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 6844
    __ARG_1.'comment'('while(false) optimized out')
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6847
# breaklabel: $S1
    $P2 = self.'genbreaklabel'()
    null $S1
    if_null $P2, __label_5
    set $S1, $P2
  __label_5:
.annotate 'line', 6848
# continuelabel: $S2
    $P3 = self.'gencontinuelabel'()
    null $S2
    if_null $P3, __label_6
    set $S2, $P3
  __label_6:
.annotate 'line', 6850
    self.'annotate'(__ARG_1)
.annotate 'line', 6851
    __ARG_1.'emitlabel'($S2, 'while')
.annotate 'line', 6852
    self.'emit_else'(__ARG_1, $S1)
.annotate 'line', 6853
    getattribute $P4, self, 'body'
    $P4.'emit'(__ARG_1)
.annotate 'line', 6854
    __ARG_1.'emitgoto'($S2)
.annotate 'line', 6855
    __ARG_1.'emitlabel'($S1, 'endwhile')
  __label_1: # switch end
# }
.annotate 'line', 6857

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WhileStatement' ]
.annotate 'line', 6823
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'DoStatement' ]

.sub 'DoStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6868
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 6869
    self.'parsebody'(__ARG_2)
.const 'Sub' $P1 = 'WSubId_94'
.annotate 'line', 6870
    $P1('while', __ARG_2)
.annotate 'line', 6871
    self.'parsecondition'(__ARG_2)
# }
.annotate 'line', 6872

.end # DoStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6875
    self.'optimize_condition'()
.annotate 'line', 6876
# var body: $P1
    getattribute $P2, self, 'body'
    $P1 = $P2.'optimize'()
.annotate 'line', 6877
    $I1 = $P1.'isempty'()
    unless $I1 goto __label_2
    $P2 = self.'getvalue'()
    set $I2, $P2
    iseq $I1, $I2, 2
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 6878
    new $P3, [ 'EmptyStatement' ]
    .return($P3)
  __label_1: # endif
.annotate 'line', 6879
    setattribute self, 'body', $P1
.annotate 'line', 6880
    .return(self)
# }
.annotate 'line', 6881

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6884
# var body: $P1
    getattribute $P1, self, 'body'
.annotate 'line', 6885
# condvalue: $I1
    $P2 = self.'getvalue'()
    set $I1, $P2
# switch
.annotate 'line', 6886
    set $I2, $I1
    set $I3, 1
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
.annotate 'line', 6888
    self.'emit_infinite'(__ARG_1)
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 6891
# looplabel: $S1
    $P2 = self.'genlabel'()
    null $S1
    if_null $P2, __label_4
    set $S1, $P2
  __label_4:
.annotate 'line', 6892
# breaklabel: $S2
    $P3 = self.'genbreaklabel'()
    null $S2
    if_null $P3, __label_5
    set $S2, $P3
  __label_5:
.annotate 'line', 6893
# continuelabel: $S3
    $P4 = self.'gencontinuelabel'()
    null $S3
    if_null $P4, __label_6
    set $S3, $P4
  __label_6:
.annotate 'line', 6895
    self.'annotate'(__ARG_1)
.annotate 'line', 6896
    __ARG_1.'emitlabel'($S1, 'do')
.annotate 'line', 6898
    $P1.'emit'(__ARG_1)
.annotate 'line', 6899
    __ARG_1.'emitlabel'($S3, 'continue')
.annotate 'line', 6900
    eq $I1, 2, __label_7
.annotate 'line', 6901
    self.'emit_if'(__ARG_1, $S1, $S2)
  __label_7: # endif
.annotate 'line', 6902
    __ARG_1.'emitlabel'($S2, 'enddo')
  __label_1: # switch end
# }
.annotate 'line', 6904

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DoStatement' ]
.annotate 'line', 6864
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'ConditionalStatement' ]
    addparent $P0, $P2
.end
.namespace [ 'ContinueStatement' ]

.sub 'ContinueStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6915
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = 'WSubId_54'
.annotate 'line', 6916
    $P1(';', __ARG_2)
# }
.annotate 'line', 6917

.end # ContinueStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6918
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6921
    self.'annotate'(__ARG_1)
.annotate 'line', 6922
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getcontinuelabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6923
    __ARG_1.'emitgoto'($S1, 'continue')
# }
.annotate 'line', 6924

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ContinueStatement' ]
.annotate 'line', 6911
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'BreakStatement' ]

.sub 'BreakStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 6935
    self.'Statement'(__ARG_1, __ARG_3)
.const 'Sub' $P1 = 'WSubId_54'
.annotate 'line', 6936
    $P1(';', __ARG_2)
# }
.annotate 'line', 6937

.end # BreakStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 6938
    .return(self)
# }

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6941
    self.'annotate'(__ARG_1)
.annotate 'line', 6942
# label: $S1
    getattribute $P2, self, 'start'
    $P1 = self.'getbreaklabel'($P2)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 6943
    __ARG_1.'emitgoto'($S1, 'break')
# }
.annotate 'line', 6944

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'BreakStatement' ]
.annotate 'line', 6931
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.end
.namespace [ 'SwitchBaseStatement' ]

.sub 'SwitchBaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 6959
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 6960
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_value', $P2
.annotate 'line', 6961
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'case_st', $P2
.annotate 'line', 6962
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'default_st', $P2
# }
.annotate 'line', 6963

.end # SwitchBaseStatement


.sub 'parse_cases' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 6966
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 6967
    $P1 = __ARG_1.'get'()
    $I1 = $P1.'iskeyword'('case')
    if $I1 goto __label_3
    $I1 = $P1.'iskeyword'('default')
  __label_3:
    unless $I1 goto __label_1
# {
.annotate 'line', 6968
    $P3 = $P1.'iskeyword'('case')
    if_null $P3, __label_4
    unless $P3 goto __label_4
# {
.annotate 'line', 6969
    getattribute $P4, self, 'case_value'
.const 'Sub' $P6 = 'WSubId_37'
    $P5 = $P6(__ARG_1, self)
# predefined push
    push $P4, $P5
.annotate 'line', 6970
    $P1 = __ARG_1.'get'()
.annotate 'line', 6971
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_6
.const 'Sub' $P7 = 'WSubId_40'
.annotate 'line', 6972
    $P7("':' in case", $P1)
  __label_6: # endif
.annotate 'line', 6973
# var st: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
  __label_8: # while
.annotate 'line', 6974
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
.annotate 'line', 6975
    __ARG_1.'unget'($P1)
.annotate 'line', 6976
.const 'Sub' $P8 = 'WSubId_93'
    $P3 = $P8(__ARG_1, self)
# predefined push
    push $P2, $P3
# }
    goto __label_8
  __label_7: # endwhile
.annotate 'line', 6978
    getattribute $P3, self, 'case_st'
# predefined push
    push $P3, $P2
.annotate 'line', 6979
    __ARG_1.'unget'($P1)
# }
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 6982
    $P1 = __ARG_1.'get'()
.annotate 'line', 6983
    $P3 = $P1.'isop'(':')
    isfalse $I1, $P3
    unless $I1 goto __label_11
.const 'Sub' $P9 = 'WSubId_40'
.annotate 'line', 6984
    $P9("':' in default", $P1)
  __label_11: # endif
  __label_13: # while
.annotate 'line', 6985
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
.annotate 'line', 6986
    __ARG_1.'unget'($P1)
.annotate 'line', 6987
    getattribute $P3, self, 'default_st'
.const 'Sub' $P10 = 'WSubId_93'
    $P4 = $P10(__ARG_1, self)
# predefined push
    push $P3, $P4
# }
    goto __label_13
  __label_12: # endwhile
.annotate 'line', 6989
    __ARG_1.'unget'($P1)
# }
  __label_5: # endif
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 6992
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_16
.const 'Sub' $P11 = 'WSubId_40'
.annotate 'line', 6993
    $P11("'}' in switch", $P1)
  __label_16: # endif
# }
.annotate 'line', 6994

.end # parse_cases


.sub 'optimize_cases' :method
# Body
# {
.const 'Sub' $P2 = 'WSubId_38'
.annotate 'line', 6997
    getattribute $P3, self, 'case_value'
    $P2($P3)
.annotate 'line', 6998
    getattribute $P3, self, 'case_st'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.const 'Sub' $P5 = 'WSubId_38'
.annotate 'line', 6999
    $P5($P1)
    goto __label_1
  __label_2: # endfor
.const 'Sub' $P6 = 'WSubId_38'
.annotate 'line', 7000
    getattribute $P3, self, 'default_st'
    $P6($P3)
# }
.annotate 'line', 7001

.end # optimize_cases

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchBaseStatement' ]
.annotate 'line', 6951
    get_class $P1, [ 'Breakable' ]
    addparent $P0, $P1
    get_class $P2, [ 'Statement' ]
    addparent $P0, $P2
.annotate 'line', 6953
    addattribute $P0, 'case_value'
.annotate 'line', 6954
    addattribute $P0, 'case_st'
.annotate 'line', 6955
    addattribute $P0, 'default_st'
.end
.namespace [ 'SwitchStatement' ]

.sub 'SwitchStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7014
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7015
.const 'Sub' $P4 = 'WSubId_37'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'condition', $P3
.annotate 'line', 7016
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7017
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_40'
.annotate 'line', 7018
    $P5("')' in switch", $P1)
  __label_1: # endif
.annotate 'line', 7019
    $P1 = __ARG_2.'get'()
.annotate 'line', 7020
    $P2 = $P1.'isop'('{')
    isfalse $I1, $P2
    unless $I1 goto __label_2
.const 'Sub' $P6 = 'WSubId_40'
.annotate 'line', 7021
    $P6("'{' in switch", $P1)
  __label_2: # endif
.annotate 'line', 7022
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7023

.end # SwitchStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7026
    getattribute $P3, self, 'condition'
    $P2 = $P3.'optimize'()
    setattribute self, 'condition', $P2
.annotate 'line', 7027
    self.'optimize_cases'()
.annotate 'line', 7028
    .return(self)
# }
.annotate 'line', 7029

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7033
# type: $S1
    set $S1, ''
.annotate 'line', 7034
    getattribute $P7, self, 'case_value'
    iter $P8, $P7
    set $P8, 0
  __label_1: # for iteration
    unless $P8 goto __label_2
    shift $P1, $P8
# {
.annotate 'line', 7035
# t: $S2
    $P9 = $P1.'checkresult'()
    null $S2
    if_null $P9, __label_3
    set $S2, $P9
  __label_3:
.annotate 'line', 7036
    ne $S2, 'N', __label_4
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 7037
    getattribute $P7, self, 'start'
    $P10("Invalid type in case", $P7)
  __label_4: # endif
.annotate 'line', 7038
    ne $S1, '', __label_5
.annotate 'line', 7039
    set $S1, $S2
    goto __label_6
  __label_5: # else
.annotate 'line', 7040
    eq $S1, $S2, __label_7
.annotate 'line', 7041
    set $S1, 'P'
  __label_7: # endif
  __label_6: # endif
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 7044
# var condition: $P2
    getattribute $P2, self, 'condition'
.annotate 'line', 7045
# var condtype: $P3
    $P3 = $P2.'checkresult'()
.annotate 'line', 7049
    ne $S1, '', __label_8
.annotate 'line', 7050
    set $S1, $P3
  __label_8: # endif
.annotate 'line', 7052
    __ARG_1.'comment'('switch')
.annotate 'line', 7053
# reg: $S3
    $P7 = self.'tempreg'($S1)
    null $S3
    if_null $P7, __label_9
    set $S3, $P7
  __label_9:
.annotate 'line', 7054
    set $S8, $P3
    ne $S8, $S1, __label_10
.annotate 'line', 7055
    $P2.'emit'(__ARG_1, $S3)
    goto __label_11
  __label_10: # else
# {
.annotate 'line', 7057
# regcond: $S4
    $P7 = $P2.'emit_get'(__ARG_1)
    null $S4
    if_null $P7, __label_12
    set $S4, $P7
  __label_12:
.annotate 'line', 7058
    __ARG_1.'emitset'($S3, $S4)
# }
  __label_11: # endif
.annotate 'line', 7062
    self.'genbreaklabel'()
.annotate 'line', 7063
# defaultlabel: $S5
    $P7 = self.'genlabel'()
    null $S5
    if_null $P7, __label_13
    set $S5, $P7
  __label_13:
.annotate 'line', 7064
    new $P4, ['ResizableStringArray']
.annotate 'line', 7065
# regval: $S6
    $P7 = self.'tempreg'($S1)
    null $S6
    if_null $P7, __label_14
    set $S6, $P7
  __label_14:
.annotate 'line', 7066
    getattribute $P7, self, 'case_value'
    iter $P11, $P7
    set $P11, 0
  __label_15: # for iteration
    unless $P11 goto __label_16
    shift $P5, $P11
# {
.annotate 'line', 7067
# label: $S7
    $P9 = self.'genlabel'()
    null $S7
    if_null $P9, __label_17
    set $S7, $P9
  __label_17:
.annotate 'line', 7068
# predefined push
    push $P4, $S7
.annotate 'line', 7069
    $P5.'emit'(__ARG_1, $S6)
.annotate 'line', 7070
    __ARG_1.'say'('    ', 'if ', $S3, ' == ', $S6, ' goto ', $S7)
# }
    goto __label_15
  __label_16: # endfor
.annotate 'line', 7072
    __ARG_1.'emitgoto'($S5)
.annotate 'line', 7075
    self.'annotate'(__ARG_1)
.annotate 'line', 7076
# var case_st: $P6
    getattribute $P6, self, 'case_st'
.annotate 'line', 7077
# n: $I1
    set $P7, $P6
    set $I1, $P7
# for loop
.annotate 'line', 7078
# i: $I2
    null $I2
  __label_20: # for condition
    ge $I2, $I1, __label_19
# {
.annotate 'line', 7079
    $P7 = $P4[$I2]
    __ARG_1.'emitlabel'($P7, 'case')
.const 'Sub' $P12 = 'WSubId_52'
.annotate 'line', 7080
    $P7 = $P6[$I2]
    $P12(__ARG_1, $P7)
# }
  __label_18: # for iteration
.annotate 'line', 7078
    inc $I2
    goto __label_20
  __label_19: # for end
.annotate 'line', 7083
    __ARG_1.'emitlabel'($S5, 'default')
.const 'Sub' $P13 = 'WSubId_52'
.annotate 'line', 7084
    getattribute $P7, self, 'default_st'
    $P13(__ARG_1, $P7)
.annotate 'line', 7086
    getattribute $P9, self, 'start'
    $P7 = self.'getbreaklabel'($P9)
    __ARG_1.'emitlabel'($P7, 'switch end')
# }
.annotate 'line', 7087

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchStatement' ]
.annotate 'line', 7008
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7010
    addattribute $P0, 'condition'
.end
.namespace [ 'SwitchCaseStatement' ]

.sub 'SwitchCaseStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7099
    self.'SwitchBaseStatement'(__ARG_1, __ARG_3)
.annotate 'line', 7100
    self.'parse_cases'(__ARG_2)
# }
.annotate 'line', 7101

.end # SwitchCaseStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7104
    self.'optimize_cases'()
.annotate 'line', 7105
    .return(self)
# }
.annotate 'line', 7106

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7110
    self.'genbreaklabel'()
.annotate 'line', 7111
# defaultlabel: $S1
    $P4 = self.'genlabel'()
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 7112
    new $P1, ['ResizableStringArray']
.annotate 'line', 7114
    __ARG_1.'comment'('switch-case')
.annotate 'line', 7115
# reg: $S2
    $P4 = self.'tempreg'('I')
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 7116
    getattribute $P4, self, 'case_value'
    iter $P5, $P4
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P2, $P5
# {
.annotate 'line', 7117
# label: $S3
    $P6 = self.'genlabel'()
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7118
# predefined push
    push $P1, $S3
.annotate 'line', 7119
    $P2.'emit'(__ARG_1, $S2)
.annotate 'line', 7120
    __ARG_1.'say'('    ', 'if ', $S2, ' goto ', $S3)
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 7122
    __ARG_1.'emitgoto'($S1)
.annotate 'line', 7125
    self.'annotate'(__ARG_1)
.annotate 'line', 7126
# var case_st: $P3
    getattribute $P3, self, 'case_st'
.annotate 'line', 7127
# n: $I1
    set $P4, $P3
    set $I1, $P4
# for loop
.annotate 'line', 7128
# i: $I2
    null $I2
  __label_8: # for condition
    ge $I2, $I1, __label_7
# {
.annotate 'line', 7129
    $P4 = $P1[$I2]
    __ARG_1.'emitlabel'($P4, 'case')
.const 'Sub' $P7 = 'WSubId_52'
.annotate 'line', 7130
    $P4 = $P3[$I2]
    $P7(__ARG_1, $P4)
# }
  __label_6: # for iteration
.annotate 'line', 7128
    inc $I2
    goto __label_8
  __label_7: # for end
.annotate 'line', 7133
    __ARG_1.'emitlabel'($S1, 'default')
.const 'Sub' $P8 = 'WSubId_52'
.annotate 'line', 7134
    getattribute $P4, self, 'default_st'
    $P8(__ARG_1, $P4)
.annotate 'line', 7136
    getattribute $P6, self, 'start'
    $P4 = self.'getbreaklabel'($P6)
    __ARG_1.'emitlabel'($P4, 'switch end')
# }
.annotate 'line', 7137

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SwitchCaseStatement' ]
.annotate 'line', 7094
    get_class $P1, [ 'SwitchBaseStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseSwitch' :subid('WSubId_50')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7144
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7145
    $P2 = $P1.'isop'('(')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7146
    new $P4, [ 'SwitchStatement' ]
    $P4.'SwitchStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 7147
    $P2 = $P1.'isop'('{')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 7148
    new $P4, [ 'SwitchCaseStatement' ]
    $P4.'SwitchCaseStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.const 'Sub' $P5 = 'WSubId_40'
.annotate 'line', 7149
    $P5("'(' in switch", $P1)
# }
.annotate 'line', 7150

.end # parseSwitch

.namespace [ 'ForStatement' ]

.sub 'ForStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7163
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7164
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7165
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 7166
    __ARG_2.'unget'($P1)
.annotate 'line', 7167
.const 'Sub' $P4 = 'WSubId_93'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'initializer', $P3
# }
  __label_1: # endif
.annotate 'line', 7169
    $P1 = __ARG_2.'get'()
.annotate 'line', 7170
    $P2 = $P1.'isop'(';')
    isfalse $I1, $P2
    unless $I1 goto __label_2
# {
.annotate 'line', 7171
    __ARG_2.'unget'($P1)
.annotate 'line', 7172
    self.'parseconditionshort'(__ARG_2)
.const 'Sub' $P5 = 'WSubId_54'
.annotate 'line', 7173
    $P5(';', __ARG_2)
# }
  __label_2: # endif
.annotate 'line', 7175
    $P1 = __ARG_2.'get'()
.annotate 'line', 7176
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_3
# {
.annotate 'line', 7177
    __ARG_2.'unget'($P1)
.annotate 'line', 7178
.const 'Sub' $P6 = 'WSubId_37'
    $P3 = $P6(__ARG_2, self)
    setattribute self, 'iteration', $P3
.const 'Sub' $P7 = 'WSubId_54'
.annotate 'line', 7179
    $P7(')', __ARG_2)
# }
  __label_3: # endif
.annotate 'line', 7181
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7182

.end # ForStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7185
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_1
.annotate 'line', 7186
    getattribute $P4, self, 'initializer'
    $P3 = $P4.'optimize'()
    setattribute self, 'initializer', $P3
  __label_1: # endif
.annotate 'line', 7187
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_2
.annotate 'line', 7188
    self.'optimize_condition'()
  __label_2: # endif
.annotate 'line', 7189
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_3
.annotate 'line', 7190
    getattribute $P4, self, 'iteration'
    $P3 = $P4.'optimize'()
    setattribute self, 'iteration', $P3
  __label_3: # endif
.annotate 'line', 7191
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7192
    .return(self)
# }
.annotate 'line', 7193

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7196
    getattribute $P1, self, 'initializer'
    isnull $I1, $P1
    unless $I1 goto __label_3
.annotate 'line', 7197
    getattribute $P2, self, 'condexpr'
    isnull $I1, $P2
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 7198
    getattribute $P3, self, 'iteration'
    isnull $I1, $P3
  __label_2:
    unless $I1 goto __label_1
# {
.annotate 'line', 7199
    self.'emit_infinite'(__ARG_1)
.annotate 'line', 7200
    .return()
# }
  __label_1: # endif
.annotate 'line', 7202
    __ARG_1.'comment'('for loop')
.annotate 'line', 7203
# continuelabel: $S1
    $P1 = self.'gencontinuelabel'()
    null $S1
    if_null $P1, __label_4
    set $S1, $P1
  __label_4:
.annotate 'line', 7204
# breaklabel: $S2
    $P1 = self.'genbreaklabel'()
    null $S2
    if_null $P1, __label_5
    set $S2, $P1
  __label_5:
.annotate 'line', 7205
# condlabel: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_6
    set $S3, $P1
  __label_6:
.annotate 'line', 7206
    getattribute $P1, self, 'initializer'
    if_null $P1, __label_7
.annotate 'line', 7207
    getattribute $P2, self, 'initializer'
    $P2.'emit'(__ARG_1)
  __label_7: # endif
.annotate 'line', 7209
    __ARG_1.'emitlabel'($S3, 'for condition')
.annotate 'line', 7210
    getattribute $P1, self, 'condexpr'
    if_null $P1, __label_8
.annotate 'line', 7211
    self.'emit_else'(__ARG_1, $S2)
  __label_8: # endif
.annotate 'line', 7213
    getattribute $P1, self, 'body'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7214
    __ARG_1.'emitlabel'($S1, 'for iteration')
.annotate 'line', 7215
    getattribute $P1, self, 'iteration'
    if_null $P1, __label_9
.annotate 'line', 7216
# unused: $S4
    getattribute $P3, self, 'iteration'
    $P2 = $P3.'emit_get'(__ARG_1)
    null $S4
    if_null $P2, __label_10
    set $S4, $P2
  __label_10:
  __label_9: # endif
.annotate 'line', 7217
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7219
    __ARG_1.'emitlabel'($S2, 'for end')
# }
.annotate 'line', 7220

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForStatement' ]
.annotate 'line', 7156
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
    get_class $P3, [ 'ConditionalStatement' ]
    addparent $P0, $P3
.annotate 'line', 7158
    addattribute $P0, 'initializer'
.annotate 'line', 7159
    addattribute $P0, 'iteration'
.end
.namespace [ 'ForeachStatement' ]

.sub 'ForeachStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param string __ARG_5
# Body
# {
.annotate 'line', 7235
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7236
# sname: $S1
    set $P1, __ARG_4
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7237
    eq __ARG_5, '', __label_2
# {
.annotate 'line', 7238
# deftype: $S2
.const 'Sub' $P2 = 'WSubId_95'
    $P1 = $P2(__ARG_5)
    null $S2
    if_null $P1, __label_3
    set $S2, $P1
  __label_3:
.annotate 'line', 7239
    self.'createvar'($S1, $S2)
.annotate 'line', 7240
    box $P1, $S2
    setattribute self, 'deftype', $P1
# }
  __label_2: # endif
.annotate 'line', 7242
    setattribute self, 'varname', __ARG_4
.annotate 'line', 7243
.const 'Sub' $P4 = 'WSubId_37'
    $P3 = $P4(__ARG_2, self)
    setattribute self, 'container', $P3
.const 'Sub' $P5 = 'WSubId_54'
.annotate 'line', 7244
    $P5(')', __ARG_2)
.annotate 'line', 7245
    self.'parsebody'(__ARG_2)
# }
.annotate 'line', 7246

.end # ForeachStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7249
    getattribute $P3, self, 'container'
    $P2 = $P3.'optimize'()
    setattribute self, 'container', $P2
.annotate 'line', 7250
    getattribute $P3, self, 'body'
    $P2 = $P3.'optimize'()
    setattribute self, 'body', $P2
.annotate 'line', 7251
    .return(self)
# }
.annotate 'line', 7252

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7255
    self.'annotate'(__ARG_1)
.annotate 'line', 7256
# regcont: $S1
    null $S1
.annotate 'line', 7257
    getattribute $P3, self, 'container'
    $P2 = $P3.'checkresult'()
    set $S6, $P2
    ne $S6, 'S', __label_1
# {
.annotate 'line', 7258
# value: $S2
    getattribute $P5, self, 'container'
    $P4 = $P5.'emit_get'(__ARG_1)
    null $S2
    if_null $P4, __label_3
    set $S2, $P4
  __label_3:
.annotate 'line', 7259
    $P2 = self.'tempreg'('P')
    set $S1, $P2
.annotate 'line', 7260
    __ARG_1.'emitbox'($S1, $S2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7263
    getattribute $P3, self, 'container'
    $P2 = $P3.'emit_get'(__ARG_1)
    set $S1, $P2
  __label_2: # endif
.annotate 'line', 7265
# var itvar: $P1
    getattribute $P2, self, 'varname'
    $P1 = self.'getvar'($P2)
.annotate 'line', 7266
    unless_null $P1, __label_4
.const 'Sub' $P6 = 'WSubId_59'
.annotate 'line', 7267
    getattribute $P2, self, 'varname'
    $P6($P2)
  __label_4: # endif
.annotate 'line', 7269
# iterator: $S3
    $P2 = self.'createreg'('P')
    null $S3
    if_null $P2, __label_5
    set $S3, $P2
  __label_5:
.annotate 'line', 7270
# continuelabel: $S4
    $P2 = self.'gencontinuelabel'()
    null $S4
    if_null $P2, __label_6
    set $S4, $P2
  __label_6:
.annotate 'line', 7271
# breaklabel: $S5
    $P2 = self.'genbreaklabel'()
    null $S5
    if_null $P2, __label_7
    set $S5, $P2
  __label_7:
.annotate 'line', 7272
    __ARG_1.'emitarg2'('iter', $S3, $S1)
.annotate 'line', 7273
    __ARG_1.'emitset'($S3, '0')
.annotate 'line', 7274
    __ARG_1.'emitlabel'($S4, 'for iteration')
.annotate 'line', 7275
    __ARG_1.'emitunless'($S3, $S5)
.annotate 'line', 7276
    $P2 = $P1.'getreg'()
    __ARG_1.'emitarg2'('shift', $P2, $S3)
.annotate 'line', 7277
    getattribute $P2, self, 'body'
    $P2.'emit'(__ARG_1)
.annotate 'line', 7278
    __ARG_1.'emitgoto'($S4)
.annotate 'line', 7279
    __ARG_1.'emitlabel'($S5, 'endfor')
# }
.annotate 'line', 7280

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ForeachStatement' ]
.annotate 'line', 7227
    get_class $P1, [ 'LoopStatement' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7229
    addattribute $P0, 'deftype'
.annotate 'line', 7230
    addattribute $P0, 'varname'
.annotate 'line', 7231
    addattribute $P0, 'container'
.end
.namespace [ ]

.sub 'parseFor' :subid('WSubId_51')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.const 'Sub' $P4 = 'WSubId_54'
.annotate 'line', 7287
    $P4('(', __ARG_2)
.annotate 'line', 7288
# var aux: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7289
# var in1: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7290
    $P5 = $P2.'iskeyword'('in')
    if_null $P5, __label_1
    unless $P5 goto __label_1
.annotate 'line', 7291
    new $P7, [ 'ForeachStatement' ]
    $P7.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, '')
    set $P6, $P7
    .return($P6)
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7293
# var in2: $P3
    $P3 = __ARG_2.'get'()
.annotate 'line', 7294
    $P5 = $P3.'iskeyword'('in')
    if_null $P5, __label_3
    unless $P5 goto __label_3
.annotate 'line', 7295
    new $P7, [ 'ForeachStatement' ]
    $P7.'ForeachStatement'(__ARG_1, __ARG_2, __ARG_3, $P2, $P1)
    set $P6, $P7
    .return($P6)
  __label_3: # endif
.annotate 'line', 7296
    __ARG_2.'unget'($P3)
.annotate 'line', 7297
    __ARG_2.'unget'($P2)
.annotate 'line', 7298
    __ARG_2.'unget'($P1)
# }
  __label_2: # endif
.annotate 'line', 7300
    new $P6, [ 'ForStatement' ]
    $P6.'ForStatement'(__ARG_1, __ARG_2, __ARG_3)
    set $P5, $P6
    .return($P5)
# }
.annotate 'line', 7301

.end # parseFor

.namespace [ 'ThrowStatement' ]

.sub 'ThrowStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7313
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7314
.const 'Sub' $P3 = 'WSubId_37'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'excep', $P2
# }
.annotate 'line', 7315

.end # ThrowStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7318
    getattribute $P3, self, 'excep'
    $P2 = $P3.'optimize'()
    setattribute self, 'excep', $P2
.annotate 'line', 7319
    .return(self)
# }
.annotate 'line', 7320

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7323
# var excep: $P1
    getattribute $P1, self, 'excep'
.annotate 'line', 7324
# reg: $S1
    $P2 = $P1.'emit_get'(__ARG_1)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7325
    self.'annotate'(__ARG_1)
# switch
.annotate 'line', 7326
    $P2 = $P1.'checkresult'()
    set $S2, $P2
    set $S3, 'P'
    if $S2 == $S3 goto __label_4
    set $S3, 'S'
    if $S2 == $S3 goto __label_5
    goto __label_3
  __label_4: # case
.annotate 'line', 7328
    __ARG_1.'emitarg1'('throw', $S1)
    goto __label_2 # break
  __label_5: # case
.annotate 'line', 7331
    __ARG_1.'emitarg1'('die', $S1)
    goto __label_2 # break
  __label_3: # default
.annotate 'line', 7332
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7334
    getattribute $P4, self, 'start'
    $P3("Invalid throw argument", $P4)
  __label_2: # switch end
# }
.annotate 'line', 7336

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ThrowStatement' ]
.annotate 'line', 7307
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7309
    addattribute $P0, 'excep'
.end
.namespace [ 'TryModifierList' ]

.sub 'TryModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7348
    setattribute self, 'start', __ARG_1
.annotate 'line', 7349
    self.'ModifierList'(__ARG_2, __ARG_3)
# }
.annotate 'line', 7350

.end # TryModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 7353
# var modiflist: $P1
    $P1 = self.'getlist'()
.annotate 'line', 7354
    iter $P6, $P1
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P2, $P6
# {
.annotate 'line', 7355
# modifname: $S1
    $P7 = $P2.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
.annotate 'line', 7356
# nargs: $I1
    $P7 = $P2.'numargs'()
    set $I1, $P7
# switch
.annotate 'line', 7357
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
.annotate 'line', 7360
    eq $I1, 1, __label_10
.const 'Sub' $P8 = 'WSubId_1'
.annotate 'line', 7361
    getattribute $P7, self, 'start'
    $P8('Wrong modifier args', $P7)
  __label_10: # endif
.annotate 'line', 7362
# var arg: $P3
    $P3 = $P2.'getarg'(0)
.annotate 'line', 7363
# argreg: $S2
    $P9 = $P3.'emit_get'(__ARG_1)
    null $S2
    if_null $P9, __label_11
    set $S2, $P9
  __label_11:
.annotate 'line', 7364
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S2, ")")
    goto __label_4 # break
  __label_8: # case
  __label_9: # case
.annotate 'line', 7368
    new $P4, ['ResizableStringArray']
# for loop
.annotate 'line', 7369
# i: $I2
    null $I2
  __label_14: # for condition
    ge $I2, $I1, __label_13
# {
.annotate 'line', 7370
# var arg: $P5
    $P5 = $P2.'getarg'($I2)
.annotate 'line', 7371
    $P7 = $P5.'emit_get'(__ARG_1)
# predefined push
    push $P4, $P7
# }
  __label_12: # for iteration
.annotate 'line', 7369
    inc $I2
    goto __label_14
  __label_13: # for end
.annotate 'line', 7374
# predefined join
.annotate 'line', 7373
    join $S3, ', ', $P4
    __ARG_1.'say'('    ', __ARG_2, ".'", $S1, "'(", $S3, ")")
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 7375
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 7377
    concat $S4, "Modifier '", $S1
    concat $S4, $S4, "' not valid for try"
    getattribute $P7, self, 'start'
    $P10($S4, $P7)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 7380

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryModifierList' ]
.annotate 'line', 7343
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.annotate 'line', 7345
    addattribute $P0, 'start'
.end
.namespace [ 'TryStatement' ]

.sub 'TryStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7392
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7393
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7394
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 7395
    new $P5, [ 'TryModifierList' ]
    $P5.'TryModifierList'($P1, __ARG_2, self)
    set $P4, $P5
    setattribute self, 'modifiers', $P4
    goto __label_2
  __label_1: # else
.annotate 'line', 7397
    __ARG_2.'unget'($P1)
  __label_2: # endif
.annotate 'line', 7399
.const 'Sub' $P6 = 'WSubId_93'
    $P3 = $P6(__ARG_2, self)
    setattribute self, 'stry', $P3
.annotate 'line', 7400
    $P1 = __ARG_2.'get'()
.annotate 'line', 7401
    $P2 = $P1.'iskeyword'('catch')
    isfalse $I1, $P2
    unless $I1 goto __label_3
.const 'Sub' $P7 = 'WSubId_2'
.annotate 'line', 7402
    $P7('catch', $P1)
  __label_3: # endif
.annotate 'line', 7403
    $P1 = __ARG_2.'get'()
.annotate 'line', 7404
    $P2 = $P1.'isop'('(')
    isfalse $I1, $P2
    unless $I1 goto __label_4
.const 'Sub' $P8 = 'WSubId_40'
.annotate 'line', 7405
    $P8("'(' after 'catch'", $P1)
  __label_4: # endif
.annotate 'line', 7406
    $P1 = __ARG_2.'get'()
.annotate 'line', 7407
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_5
# {
.annotate 'line', 7408
# exname: $S1
    $P3 = $P1.'getidentifier'()
    null $S1
    if_null $P3, __label_6
    set $S1, $P3
  __label_6:
.annotate 'line', 7409
    setattribute self, 'exname', $P1
.annotate 'line', 7410
    self.'createvar'($S1, 'P')
.annotate 'line', 7411
    $P1 = __ARG_2.'get'()
.annotate 'line', 7412
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_7
.const 'Sub' $P9 = 'WSubId_40'
.annotate 'line', 7413
    $P9("')' in 'catch'", $P1)
  __label_7: # endif
# }
  __label_5: # endif
.annotate 'line', 7415
.const 'Sub' $P10 = 'WSubId_93'
    $P3 = $P10(__ARG_2, self)
    setattribute self, 'scatch', $P3
# }
.annotate 'line', 7416

.end # TryStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7419
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_1
.annotate 'line', 7420
    getattribute $P2, self, 'modifiers'
    $P2.'optimize'()
  __label_1: # endif
.annotate 'line', 7421
    getattribute $P3, self, 'stry'
    $P2 = $P3.'optimize'()
    setattribute self, 'stry', $P2
.annotate 'line', 7422
    getattribute $P3, self, 'scatch'
    $P2 = $P3.'optimize'()
    setattribute self, 'scatch', $P2
.annotate 'line', 7423
    .return(self)
# }
.annotate 'line', 7424

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7427
# reghandler: $S1
    $P1 = self.'tempreg'('P')
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7428
# labelhandler: $S2
    $P1 = self.'genlabel'()
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7429
# labelpasthandler: $S3
    $P1 = self.'genlabel'()
    null $S3
    if_null $P1, __label_3
    set $S3, $P1
  __label_3:
.annotate 'line', 7430
# exreg: $S4
    getattribute $P2, self, 'exname'
    if_null $P2, __label_5
.annotate 'line', 7431
    getattribute $P4, self, 'exname'
    $P3 = self.'getvar'($P4)
    $P1 = $P3.'getreg'()
    goto __label_4
  __label_5:
.annotate 'line', 7432
    $P1 = self.'tempreg'('P')
  __label_4:
    null $S4
    if_null $P1, __label_6
    set $S4, $P1
  __label_6:
.annotate 'line', 7434
    self.'annotate'(__ARG_1)
.annotate 'line', 7435
    __ARG_1.'comment'('try: create handler')
.annotate 'line', 7437
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ExceptionHandler'")
.annotate 'line', 7438
    __ARG_1.'say'('    ', 'set_label ', $S1, ', ', $S2)
.annotate 'line', 7440
    getattribute $P1, self, 'modifiers'
    if_null $P1, __label_7
.annotate 'line', 7441
    getattribute $P2, self, 'modifiers'
    $P2.'emitmodifiers'(__ARG_1, $S1)
  __label_7: # endif
.annotate 'line', 7443
    __ARG_1.'emitarg1'('push_eh', $S1)
.annotate 'line', 7444
    __ARG_1.'comment'('try: begin')
.annotate 'line', 7445
    getattribute $P1, self, 'stry'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7446
    __ARG_1.'comment'('try: end')
.annotate 'line', 7447
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7449
    self.'annotate'(__ARG_1)
.annotate 'line', 7450
    __ARG_1.'emitgoto'($S3)
.annotate 'line', 7452
    __ARG_1.'comment'('catch')
.annotate 'line', 7453
    __ARG_1.'emitlabel'($S2)
.annotate 'line', 7454
    __ARG_1.'say'('    ', '.get_results(', $S4, ')')
.annotate 'line', 7455
    __ARG_1.'emitarg1'('finalize', $S4)
.annotate 'line', 7456
    __ARG_1.'say'('    ', 'pop_eh')
.annotate 'line', 7457
    getattribute $P1, self, 'scatch'
    $P1.'emit'(__ARG_1)
.annotate 'line', 7459
    __ARG_1.'comment'('catch end')
.annotate 'line', 7460
    __ARG_1.'emitlabel'($S3)
# }
.annotate 'line', 7461

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'TryStatement' ]
.annotate 'line', 7383
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 7385
    addattribute $P0, 'stry'
.annotate 'line', 7386
    addattribute $P0, 'modifiers'
.annotate 'line', 7387
    addattribute $P0, 'exname'
.annotate 'line', 7388
    addattribute $P0, 'scatch'
.end
.namespace [ 'VarBaseStatement' ]

.sub 'initvarbase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7474
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7475
    setattribute self, 'name', __ARG_3
.annotate 'line', 7476
# var vdata: $P1
    $P1 = self.'createvar'(__ARG_3, 'P', __ARG_4)
.annotate 'line', 7477
    $P3 = $P1.'getreg'()
    setattribute self, 'reg', $P3
# }
.annotate 'line', 7478

.end # initvarbase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarBaseStatement' ]
.annotate 'line', 7468
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7470
    addattribute $P0, 'name'
.annotate 'line', 7471
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareBase' ]

.sub 'DeclareBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
# Body
# {
.annotate 'line', 7493
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7494
    setattribute self, 'name', __ARG_3
.annotate 'line', 7495
    box $P1, __ARG_4
    setattribute self, 'basetype', $P1
# }
.annotate 'line', 7496

.end # DeclareBase

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareBase' ]
.annotate 'line', 7485
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7487
    addattribute $P0, 'name'
.annotate 'line', 7488
    addattribute $P0, 'basetype'
.annotate 'line', 7489
    addattribute $P0, 'reg'
.end
.namespace [ 'DeclareSingleStatement' ]

.sub 'DeclareSingleStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7507
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7508
# var vdata: $P1
    getattribute $P3, self, 'name'
    getattribute $P4, self, 'basetype'
    $P1 = self.'createvar'($P3, $P4)
.annotate 'line', 7509
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7510
# var t: $P2
    $P2 = __ARG_5.'get'()
.annotate 'line', 7511
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 7513
.const 'Sub' $P6 = 'WSubId_37'
    $P5 = $P6(__ARG_5, self)
    setattribute self, 'init', $P5
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 7516
    __ARG_5.'unget'($P2)
  __label_2: # endif
# }
.annotate 'line', 7517

.end # DeclareSingleStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7520
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7521
    if_null $P1, __label_1
.annotate 'line', 7522
    $P3 = $P1.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7523
    .return(self)
# }
.annotate 'line', 7524

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7527
    self.'annotate'(__ARG_1)
.annotate 'line', 7528
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7529
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7530
# basetype: $S3
    getattribute $P2, self, 'basetype'
    null $S3
    if_null $P2, __label_3
    set $S3, $P2
  __label_3:
.annotate 'line', 7531
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7532
    concat $S7, $S1, ': '
    concat $S7, $S7, $S2
    __ARG_1.'comment'($S7)
.annotate 'line', 7534
    isnull $I1, $P1
    if $I1 goto __label_6
    $I1 = $P1.'isnull'()
  __label_6:
    unless $I1 goto __label_4
.annotate 'line', 7535
    __ARG_1.'emitnull'($S2)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7537
# itype: $S4
    $P2 = $P1.'checkresult'()
    null $S4
    if_null $P2, __label_7
    set $S4, $P2
  __label_7:
.annotate 'line', 7538
    ne $S4, $S3, __label_8
# {
.annotate 'line', 7539
    iseq $I1, $S4, 'S'
    unless $I1 goto __label_12
    isa $I1, $P1, [ 'ConcatString' ]
  __label_12:
    unless $I1 goto __label_10
.annotate 'line', 7540
    $P1.'emit_concat_set'(__ARG_1, $S2)
    goto __label_11
  __label_10: # else
.annotate 'line', 7542
    $P1.'emit'(__ARG_1, $S2)
  __label_11: # endif
# }
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 7545
    isa $I1, $P1, [ 'IndexExpr' ]
    unless $I1 goto __label_13
# {
.annotate 'line', 7547
    $P1.'emit'(__ARG_1, $S2)
# }
    goto __label_14
  __label_13: # else
# {
.annotate 'line', 7550
# ireg: $S5
    null $S5
# switch
.annotate 'line', 7551
    set $S7, $S4
    set $S8, 'v'
    if $S7 == $S8 goto __label_17
    set $S8, ''
    if $S7 == $S8 goto __label_18
    goto __label_16
  __label_17: # case
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7553
    getattribute $P2, self, 'start'
    $P3('Invalid initialization from void value', $P2)
  __label_18: # case
.annotate 'line', 7555
    $P4 = $P1.'emit_get'(__ARG_1)
    set $S5, $P4
    goto __label_15 # break
  __label_16: # default
.annotate 'line', 7558
    $P5 = self.'tempreg'($S4)
    set $S5, $P5
.annotate 'line', 7559
    $P1.'emit'(__ARG_1, $S5)
  __label_15: # switch end
.annotate 'line', 7561
    iseq $I1, $S3, 'S'
    unless $I1 goto __label_21
    iseq $I1, $S4, 'P'
  __label_21:
    unless $I1 goto __label_19
# {
.annotate 'line', 7562
# auxlabel: $S6
    $P2 = self.'genlabel'()
    null $S6
    if_null $P2, __label_22
    set $S6, $P2
  __label_22:
.annotate 'line', 7563
    __ARG_1.'emitnull'($S2)
.annotate 'line', 7564
    __ARG_1.'emitif_null'($S5, $S6)
.annotate 'line', 7565
    __ARG_1.'emitset'($S2, $S5)
.annotate 'line', 7566
    __ARG_1.'emitlabel'($S6)
# }
    goto __label_20
  __label_19: # else
.annotate 'line', 7569
    __ARG_1.'emitset'($S2, $S5)
  __label_20: # endif
# }
  __label_14: # endif
# }
  __label_9: # endif
# }
  __label_5: # endif
# }
.annotate 'line', 7573

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareSingleStatement' ]
.annotate 'line', 7501
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7503
    addattribute $P0, 'init'
.end
.namespace [ 'DeclareArrayStatement' ]

.sub 'DeclareArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param string __ARG_5
        .param pmc __ARG_6
# Body
# {
.annotate 'line', 7588
    self.'DeclareBase'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
.annotate 'line', 7589
    box $P3, __ARG_5
    setattribute self, 'arraytype', $P3
.annotate 'line', 7590
# var vdata: $P1
    getattribute $P3, self, 'name'
    $P1 = self.'createvar'($P3, 'P')
.annotate 'line', 7591
    $P4 = $P1.'getreg'()
    setattribute self, 'reg', $P4
.annotate 'line', 7592
# var t: $P2
    $P2 = __ARG_6.'get'()
.annotate 'line', 7593
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7595
    __ARG_6.'unget'($P2)
.annotate 'line', 7596
.const 'Sub' $P5 = 'WSubId_37'
    $P4 = $P5(__ARG_6, self)
    setattribute self, 'size', $P4
.const 'Sub' $P6 = 'WSubId_54'
.annotate 'line', 7597
    $P6(']', __ARG_6)
# }
  __label_1: # endif
.annotate 'line', 7599
    $P2 = __ARG_6.'get'()
.annotate 'line', 7600
    $P3 = $P2.'isop'('=')
    if_null $P3, __label_2
    unless $P3 goto __label_2
# {
.annotate 'line', 7601
    $P2 = __ARG_6.'get'()
.annotate 'line', 7602
    $P3 = $P2.'isop'('[')
    isfalse $I1, $P3
    unless $I1 goto __label_4
.const 'Sub' $P7 = 'WSubId_40'
.annotate 'line', 7603
    $P7("array initializer", $P2)
  __label_4: # endif
.annotate 'line', 7604
    $P2 = __ARG_6.'get'()
.annotate 'line', 7605
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_5
# {
.annotate 'line', 7606
    __ARG_6.'unget'($P2)
.annotate 'line', 7607
.const 'Sub' $P8 = 'parseExpr'
.annotate 'line', 7608
.const 'Sub' $P9 = 'WSubId_36'
.const 'Sub' $P10 = 'WSubId_37'
    $P4 = $P9(__ARG_6, self, $P10, ']')
    setattribute self, 'initarray', $P4
# }
  __label_5: # endif
# }
    goto __label_3
  __label_2: # else
.annotate 'line', 7612
    __ARG_6.'unget'($P2)
  __label_3: # endif
# }
.annotate 'line', 7613

.end # DeclareArrayStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7616
    getattribute $P1, self, 'size'
    if_null $P1, __label_1
.annotate 'line', 7617
    getattribute $P4, self, 'size'
    $P3 = $P4.'optimize'()
    setattribute self, 'size', $P3
  __label_1: # endif
.const 'Sub' $P5 = 'WSubId_38'
.annotate 'line', 7618
    getattribute $P1, self, 'initarray'
    $P5($P1)
.annotate 'line', 7619
    .return(self)
# }
.annotate 'line', 7620

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7623
    self.'annotate'(__ARG_1)
.annotate 'line', 7625
# var reg: $P1
    getattribute $P1, self, 'reg'
.annotate 'line', 7626
# var size: $P2
    getattribute $P2, self, 'size'
.annotate 'line', 7627
# var init: $P3
    getattribute $P3, self, 'initarray'
.annotate 'line', 7628
# var basetype: $P4
    getattribute $P4, self, 'basetype'
.annotate 'line', 7629
# arraytype: $S1
# predefined string
    getattribute $P6, self, 'arraytype'
    set $S4, $P6
    concat $S1, $S4, 'Array'
.annotate 'line', 7630
    if_null $P2, __label_1
# {
.annotate 'line', 7632
# regsize: $S2
    $P6 = $P2.'emit_get'(__ARG_1)
    null $S2
    if_null $P6, __label_3
    set $S2, $P6
  __label_3:
.annotate 'line', 7633
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Fixed", $S1, "'], ", $S2)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7637
    __ARG_1.'say'('    ', 'new ', $P1, ", ['Resizable", $S1, "']")
# }
  __label_2: # endif
.annotate 'line', 7639
    if_null $P3, __label_4
# {
.annotate 'line', 7640
# itemreg: $S3
    $P6 = self.'tempreg'($P4)
    null $S3
    if_null $P6, __label_5
    set $S3, $P6
  __label_5:
.annotate 'line', 7641
# n: $I1
# predefined elements
    elements $I1, $P3
.annotate 'line', 7642
    unless_null $P2, __label_6
# {
.annotate 'line', 7643
    le $I1, 0, __label_7
# {
.annotate 'line', 7645
    __ARG_1.'emitset'($P1, $I1)
# }
  __label_7: # endif
# }
  __label_6: # endif
.annotate 'line', 7648
# i: $I2
    null $I2
.annotate 'line', 7649
    iter $P7, $P3
    set $P7, 0
  __label_8: # for iteration
    unless $P7 goto __label_9
    shift $P5, $P7
# {
.annotate 'line', 7650
    $P5.'emit'(__ARG_1, $S3)
.annotate 'line', 7651
    __ARG_1.'say'('    ', $P1, '[', $I2, '] = ', $S3)
.annotate 'line', 7652
    inc $I2
# }
    goto __label_8
  __label_9: # endfor
# }
  __label_4: # endif
# }
.annotate 'line', 7655

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareArrayStatement' ]
.annotate 'line', 7578
    get_class $P1, [ 'DeclareBase' ]
    addparent $P0, $P1
.annotate 'line', 7580
    addattribute $P0, 'size'
.annotate 'line', 7581
    addattribute $P0, 'initarray'
.annotate 'line', 7582
    addattribute $P0, 'arraytype'
.end
.namespace [ ]

.sub 'parseDeclareHelper' :subid('WSubId_97')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7662
# var next: $P1
    null $P1
.annotate 'line', 7663
# var r: $P2
    null $P2
  __label_1: # do
.annotate 'line', 7664
# {
.annotate 'line', 7665
# var name: $P3
    $P3 = __ARG_4.'get'()
.const 'Sub' $P6 = 'WSubId_92'
.annotate 'line', 7666
    $P6($P3)
.annotate 'line', 7667
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 7668
# var item: $P5
    null $P5
.annotate 'line', 7669
    $P7 = $P4.'isop'('[')
    if_null $P7, __label_4
    unless $P7 goto __label_4
.annotate 'line', 7670
    $P5 = __ARG_2(__ARG_3, __ARG_5, __ARG_4, $P3)
    goto __label_5
  __label_4: # else
# {
.annotate 'line', 7672
    __ARG_4.'unget'($P4)
.annotate 'line', 7673
    $P5 = __ARG_1(__ARG_3, __ARG_5, $P3, __ARG_4)
# }
  __label_5: # endif
.annotate 'line', 7675
.const 'Sub' $P8 = 'WSubId_96'
    $P2 = $P8($P2, $P5)
.annotate 'line', 7676
    $P1 = __ARG_4.'get'()
# }
  __label_3: # continue
.annotate 'line', 7677
    $P7 = $P1.'isop'(',')
    if_null $P7, __label_2
    if $P7 goto __label_1
  __label_2: # enddo
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 7678
    $P9(';', $P1)
.annotate 'line', 7679
    .return($P2)
# }
.annotate 'line', 7680

.end # parseDeclareHelper

.namespace [ 'IntStatement' ]

.sub 'IntStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7688
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', __ARG_4)
# }
.annotate 'line', 7689

.end # IntStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntStatement' ]
.annotate 'line', 7684
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'IntArrayStatement' ]

.sub 'IntArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7696
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'I', 'Integer', __ARG_4)
# }
.annotate 'line', 7697

.end # IntArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'IntArrayStatement' ]
.annotate 'line', 7692
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newIntSingle' :subid('WSubId_98')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7703
    new $P2, [ 'IntStatement' ]
    $P2.'IntStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7704

.end # newIntSingle


.sub 'newIntArray' :subid('WSubId_99')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7708
    new $P2, [ 'IntArrayStatement' ]
    $P2.'IntArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7709

.end # newIntArray


.sub 'parseInt' :subid('WSubId_48')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7713
.const 'Sub' $P1 = 'newIntSingle'
.const 'Sub' $P2 = 'newIntArray'
.annotate 'line', 7714
.const 'Sub' $P3 = 'WSubId_97'
.const 'Sub' $P4 = 'WSubId_98'
.const 'Sub' $P5 = 'WSubId_99'
    .tailcall $P3($P4, $P5, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7715

.end # parseInt

.namespace [ 'FloatStatement' ]

.sub 'FloatStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7723
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', __ARG_4)
# }
.annotate 'line', 7724

.end # FloatStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatStatement' ]
.annotate 'line', 7719
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FloatArrayStatement' ]

.sub 'FloatArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7731
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'N', 'Float', __ARG_4)
# }
.annotate 'line', 7732

.end # FloatArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FloatArrayStatement' ]
.annotate 'line', 7727
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newFloatSingle' :subid('WSubId_100')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7738
    new $P2, [ 'FloatStatement' ]
    $P2.'FloatStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7739

.end # newFloatSingle


.sub 'newFloatArray' :subid('WSubId_101')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7743
    new $P2, [ 'FloatArrayStatement' ]
    $P2.'FloatArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7744

.end # newFloatArray


.sub 'parseFloat' :subid('WSubId_49')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7748
.const 'Sub' $P1 = 'newFloatSingle'
.const 'Sub' $P2 = 'newFloatArray'
.annotate 'line', 7749
.const 'Sub' $P3 = 'WSubId_97'
.const 'Sub' $P4 = 'WSubId_100'
.const 'Sub' $P5 = 'WSubId_101'
    .tailcall $P3($P4, $P5, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7750

.end # parseFloat

.namespace [ 'StringStatement' ]

.sub 'StringStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7758
    self.'DeclareSingleStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', __ARG_4)
# }
.annotate 'line', 7759

.end # StringStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringStatement' ]
.annotate 'line', 7754
    get_class $P1, [ 'DeclareSingleStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'StringArrayStatement' ]

.sub 'StringArrayStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7766
    self.'DeclareArrayStatement'(__ARG_1, __ARG_2, __ARG_3, 'S', 'String', __ARG_4)
# }
.annotate 'line', 7767

.end # StringArrayStatement

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'StringArrayStatement' ]
.annotate 'line', 7762
    get_class $P1, [ 'DeclareArrayStatement' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'newStringSingle' :subid('WSubId_102')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7773
    new $P2, [ 'StringStatement' ]
    $P2.'StringStatement'(__ARG_1, __ARG_2, __ARG_3, __ARG_4)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7774

.end # newStringSingle


.sub 'newStringArray' :subid('WSubId_103')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7778
    new $P2, [ 'StringArrayStatement' ]
    $P2.'StringArrayStatement'(__ARG_1, __ARG_2, __ARG_4, __ARG_3)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 7779

.end # newStringArray


.sub 'parseString' :subid('WSubId_47')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7783
.const 'Sub' $P1 = 'newStringSingle'
.const 'Sub' $P2 = 'newStringArray'
.annotate 'line', 7784
.const 'Sub' $P3 = 'WSubId_97'
.const 'Sub' $P4 = 'WSubId_102'
.const 'Sub' $P5 = 'WSubId_103'
    .tailcall $P3($P4, $P5, __ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 7785

.end # parseString

.namespace [ 'ConstStatement' ]

.sub 'ConstStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
        .param pmc __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 7801
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 7802
    box $P1, __ARG_3
    setattribute self, 'type', $P1
.annotate 'line', 7803
    setattribute self, 'name', __ARG_4
.annotate 'line', 7804
    setattribute self, 'value', __ARG_5
.annotate 'line', 7805
    $P2 = self.'createconst'(__ARG_4, __ARG_3)
    setattribute self, 'data', $P2
# }
.annotate 'line', 7806

.end # ConstStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7809
# var value: $P1
    getattribute $P1, self, 'value'
.annotate 'line', 7810
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 7811
# type: $S1
    getattribute $P3, self, 'type'
    null $S1
    if_null $P3, __label_1
    set $S1, $P3
  __label_1:
.annotate 'line', 7812
    $P1 = $P1.'optimize'()
.annotate 'line', 7813
    $P3 = $P1.'hascompilevalue'()
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 7815
    getattribute $P5, self, 'start'
.annotate 'line', 7814
    $P4('Value for const is not evaluable at compile time', $P5)
# }
  __label_2: # endif
.annotate 'line', 7817
    getattribute $P3, self, 'data'
    $P3.'setvalue'($P1)
.annotate 'line', 7818
    .return(self)
# }
.annotate 'line', 7819

.end # optimize


.sub 'checkresult' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_6'
.annotate 'line', 7822
    getattribute $P2, self, 'start'
    $P1('Direct use of const', $P2)
# }
.annotate 'line', 7823

.end # checkresult


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7826
# predefined string
    getattribute $P1, self, 'name'
    set $S1, $P1
    concat $S2, 'Constant ', $S1
    concat $S2, $S2, ' evaluated at compile time'
    __ARG_1.'comment'($S2)
# }
.annotate 'line', 7827

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ConstStatement' ]
.annotate 'line', 7791
    get_class $P1, [ 'Statement' ]
    addparent $P0, $P1
.annotate 'line', 7793
    addattribute $P0, 'type'
.annotate 'line', 7794
    addattribute $P0, 'name'
.annotate 'line', 7795
    addattribute $P0, 'data'
.annotate 'line', 7796
    addattribute $P0, 'value'
.end
.namespace [ ]

.sub 'parseConst' :subid('WSubId_44')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7832
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7833
# type: $S1
.const 'Sub' $P6 = 'WSubId_95'
    $P5 = $P6($P1)
    null $S1
    if_null $P5, __label_1
    set $S1, $P5
  __label_1:
.annotate 'line', 7834
    isne $I1, $S1, 'I'
    unless $I1 goto __label_4
    isne $I1, $S1, 'N'
  __label_4:
    unless $I1 goto __label_3
    isne $I1, $S1, 'S'
  __label_3:
    unless $I1 goto __label_2
.const 'Sub' $P7 = 'WSubId_1'
.annotate 'line', 7835
    $P7('Invalid type for const', __ARG_1)
  __label_2: # endif
.annotate 'line', 7837
# var multi: $P2
    null $P2
  __label_5: # do
.annotate 'line', 7838
# {
.annotate 'line', 7839
    $P1 = __ARG_2.'get'()
.annotate 'line', 7840
# var name: $P3
    set $P3, $P1
.const 'Sub' $P8 = 'WSubId_54'
.annotate 'line', 7841
    $P8('=', __ARG_2)
.annotate 'line', 7842
# var value: $P4
.const 'Sub' $P9 = 'WSubId_37'
    $P4 = $P9(__ARG_2, __ARG_3)
.annotate 'line', 7843
.const 'Sub' $P10 = 'WSubId_96'
.annotate 'line', 7844
    new $P11, [ 'ConstStatement' ]
    $P11.'ConstStatement'($P1, __ARG_3, $S1, $P3, $P4)
    set $P5, $P11
.annotate 'line', 7843
    $P2 = $P10($P2, $P5)
# }
  __label_7: # continue
.annotate 'line', 7845
    $P1 = __ARG_2.'get'()
    $P5 = $P1.'isop'(',')
    if_null $P5, __label_6
    if $P5 goto __label_5
  __label_6: # enddo
.annotate 'line', 7846
    .return($P2)
# }
.annotate 'line', 7847

.end # parseConst

.namespace [ 'VarStatement' ]

.sub 'VarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
        .param int __ARG_5
# Body
# {
.annotate 'line', 7858
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4, __ARG_5)
.annotate 'line', 7859
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7860
    $P2 = $P1.'isop'('=')
    if_null $P2, __label_1
    unless $P2 goto __label_1
# {
.annotate 'line', 7861
.const 'Sub' $P5 = 'WSubId_37'
    $P4 = $P5(__ARG_2, self)
    setattribute self, 'init', $P4
.annotate 'line', 7862
    $P1 = __ARG_2.'get'()
# }
  __label_1: # endif
.const 'Sub' $P6 = 'WSubId_4'
.annotate 'line', 7864
    $P6(';', $P1)
# }
.annotate 'line', 7865

.end # VarStatement


.sub 'optimize_init' :method
# Body
# {
.annotate 'line', 7868
    getattribute $P1, self, 'init'
    if_null $P1, __label_1
.annotate 'line', 7869
    getattribute $P4, self, 'init'
    $P3 = $P4.'optimize'()
    setattribute self, 'init', $P3
  __label_1: # endif
.annotate 'line', 7870
    .return(self)
# }
.annotate 'line', 7871

.end # optimize_init


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7874
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7875

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7878
    self.'annotate'(__ARG_1)
.annotate 'line', 7879
# name: $S1
    getattribute $P2, self, 'name'
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 7880
# reg: $S2
    getattribute $P2, self, 'reg'
    null $S2
    if_null $P2, __label_2
    set $S2, $P2
  __label_2:
.annotate 'line', 7881
# var init: $P1
    getattribute $P1, self, 'init'
.annotate 'line', 7882
    concat $S4, 'var ', $S1
    concat $S4, $S4, ': '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7883
    if_null $P1, __label_3
.annotate 'line', 7884
    $P2 = $P1.'isnull'()
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 7885
    null $P1
  __label_4: # endif
  __label_3: # endif
.annotate 'line', 7886
    if_null $P1, __label_5
# {
# switch
.annotate 'line', 7887
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
.annotate 'line', 7889
    isa $I1, $P1, [ 'MemberExpr' ]
    if $I1 goto __label_17
    isa $I1, $P1, [ 'ArrayExpr' ]
  __label_17:
    if $I1 goto __label_16
    isa $I1, $P1, [ 'NewExpr' ]
  __label_16:
    unless $I1 goto __label_14
.annotate 'line', 7890
    $P1.'emit_init'(__ARG_1, $S2)
    goto __label_15
  __label_14: # else
.annotate 'line', 7892
    $P1.'emit'(__ARG_1, $S2)
  __label_15: # endif
    goto __label_7 # break
  __label_10: # case
  __label_11: # case
  __label_12: # case
.annotate 'line', 7897
# value: $S3
    $P3 = $P1.'emit_get'(__ARG_1)
    null $S3
    if_null $P3, __label_18
    set $S3, $P3
  __label_18:
.annotate 'line', 7898
    __ARG_1.'emitbox'($S2, $S3)
    goto __label_7 # break
  __label_13: # case
.annotate 'line', 7899
.const 'Sub' $P4 = 'WSubId_1'
.annotate 'line', 7901
    getattribute $P5, self, 'name'
    $P4("Can't use void function as initializer", $P5)
  __label_8: # default
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 7903
    getattribute $P7, self, 'name'
    $P6("Invalid var initializer", $P7)
  __label_7: # switch end
# }
    goto __label_6
  __label_5: # else
.annotate 'line', 7907
    __ARG_1.'emitnull'($S2)
  __label_6: # endif
# }
.annotate 'line', 7908

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'VarStatement' ]
.annotate 'line', 7853
    get_class $P1, [ 'VarBaseStatement' ]
    addparent $P0, $P1
.annotate 'line', 7855
    addattribute $P0, 'init'
.end
.namespace [ 'ResizableVarStatement' ]

.sub 'ResizableVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7915
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.const 'Sub' $P1 = 'WSubId_54'
.annotate 'line', 7916
    $P1(';', __ARG_2)
# }
.annotate 'line', 7917

.end # ResizableVarStatement


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7920
    self.'annotate'(__ARG_1)
.annotate 'line', 7921
# reg: $S1
    getattribute $P1, self, 'reg'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7922
# predefined string
    getattribute $P1, self, 'name'
    set $S2, $P1
    concat $S3, 'var ', $S2
    concat $S3, $S3, '[] : '
    concat $S3, $S3, $S1
    __ARG_1.'comment'($S3)
.annotate 'line', 7923
    __ARG_1.'say'('    ', 'new ', $S1, ", 'ResizablePMCArray'")
# }
.annotate 'line', 7924

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ResizableVarStatement' ]
.annotate 'line', 7911
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'FixedVarStatement' ]

.sub 'FixedVarStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 7933
    self.'initvarbase'(__ARG_1, __ARG_3, __ARG_4)
.annotate 'line', 7934
.const 'Sub' $P3 = 'WSubId_37'
    $P2 = $P3(__ARG_2, self)
    setattribute self, 'exprsize', $P2
.const 'Sub' $P4 = 'WSubId_54'
.annotate 'line', 7935
    $P4(']', __ARG_2)
.const 'Sub' $P5 = 'WSubId_54'
.annotate 'line', 7936
    $P5(';', __ARG_2)
# }
.annotate 'line', 7937

.end # FixedVarStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 7940
    getattribute $P3, self, 'exprsize'
    $P2 = $P3.'optimize'()
    setattribute self, 'exprsize', $P2
.annotate 'line', 7941
    .tailcall self.'optimize_init'()
# }
.annotate 'line', 7942

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 7945
# regsize: $S1
    getattribute $P2, self, 'exprsize'
    $P1 = $P2.'emit_get'(__ARG_1)
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 7946
    self.'annotate'(__ARG_1)
.annotate 'line', 7947
# reg: $S2
    getattribute $P1, self, 'reg'
    null $S2
    if_null $P1, __label_2
    set $S2, $P1
  __label_2:
.annotate 'line', 7948
# predefined string
    getattribute $P1, self, 'name'
    set $S3, $P1
    concat $S4, 'var ', $S3
    concat $S4, $S4, '[] : '
    concat $S4, $S4, $S2
    __ARG_1.'comment'($S4)
.annotate 'line', 7949
    __ARG_1.'say'('    ', 'new ', $S2, ", 'FixedPMCArray', ", $S1)
# }
.annotate 'line', 7950

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FixedVarStatement' ]
.annotate 'line', 7927
    get_class $P1, [ 'VarStatement' ]
    addparent $P0, $P1
.annotate 'line', 7929
    addattribute $P0, 'exprsize'
.end
.namespace [ ]

.sub 'parseVar' :subid('WSubId_46')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param int __ARG_4 :optional
# Body
# {
.annotate 'line', 7955
# var name: $P1
    $P1 = __ARG_2.'get'()
.const 'Sub' $P3 = 'WSubId_92'
.annotate 'line', 7956
    $P3($P1)
.annotate 'line', 7957
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 7958
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_1
    unless $P4 goto __label_1
# {
.annotate 'line', 7959
    $P2 = __ARG_2.'get'()
.annotate 'line', 7960
    $P4 = $P2.'isop'(']')
    if_null $P4, __label_3
    unless $P4 goto __label_3
.annotate 'line', 7961
    new $P6, [ 'ResizableVarStatement' ]
    $P6.'ResizableVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P5, $P6
    .return($P5)
    goto __label_4
  __label_3: # else
# {
.annotate 'line', 7963
    __ARG_2.'unget'($P2)
.annotate 'line', 7964
    new $P5, [ 'FixedVarStatement' ]
    $P5.'FixedVarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1)
    set $P4, $P5
    .return($P4)
# }
  __label_4: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 7968
    __ARG_2.'unget'($P2)
.annotate 'line', 7969
    new $P5, [ 'VarStatement' ]
    $P5.'VarStatement'(__ARG_1, __ARG_2, __ARG_3, $P1, __ARG_4)
    set $P4, $P5
    .return($P4)
# }
  __label_2: # endif
# }
.annotate 'line', 7971

.end # parseVar


.sub 'parseVolatile' :subid('WSubId_45')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7975
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 7976
    $P2 = $P1.'iskeyword'('var')
    isfalse $I1, $P2
    unless $I1 goto __label_1
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 7977
    $P3("invalid volatile type", $P1)
  __label_1: # endif
.annotate 'line', 7978
.const 'Sub' $P4 = 'WSubId_46'
    .tailcall $P4(__ARG_1, __ARG_2, __ARG_3, 1)
# }
.annotate 'line', 7979

.end # parseVolatile

.namespace [ 'CompoundStatement' ]

.sub 'CompoundStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 7992
    self.'Statement'(__ARG_1, __ARG_3)
.annotate 'line', 7993
    root_new $P4, ['parrot';'Hash']
    setattribute self, 'labels', $P4
.annotate 'line', 7994
    root_new $P4, ['parrot';'ResizablePMCArray']
    setattribute self, 'statements', $P4
.annotate 'line', 7995
# var t: $P1
    null $P1
  __label_2: # while
.annotate 'line', 7996
    $P1 = __ARG_2.'get'()
    $P3 = $P1.'isop'('}')
    isfalse $I1, $P3
    unless $I1 goto __label_1
# {
.annotate 'line', 7997
    __ARG_2.'unget'($P1)
.annotate 'line', 7998
# var c: $P2
.const 'Sub' $P6 = 'WSubId_93'
    $P2 = $P6(__ARG_2, self)
.annotate 'line', 7999
    unless_null $P2, __label_3
.const 'Sub' $P7 = 'WSubId_6'
.annotate 'line', 8000
    $P7('Unexpected null statement')
  __label_3: # endif
.annotate 'line', 8001
    getattribute $P3, self, 'statements'
# predefined push
    push $P3, $P2
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8003
    setattribute self, 'end', $P1
# }
.annotate 'line', 8004

.end # CompoundStatement


.sub 'getlabel' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8007
# s: $S1
    set $P2, __ARG_1
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8008
# var labels: $P1
    getattribute $P1, self, 'labels'
.annotate 'line', 8009
# exist: $S2
    $S2 = $P1[$S1]
.annotate 'line', 8010
    isnull $I1, $S2
    if $I1 goto __label_3
    iseq $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.annotate 'line', 8011
    getattribute $P3, self, 'owner'
    $P2 = $P3.'getlabel'(__ARG_1)
    set $S2, $P2
  __label_2: # endif
.annotate 'line', 8012
    .return($S2)
# }
.annotate 'line', 8013

.end # getlabel


.sub 'createlabel' :method
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
    not $I1
    unless $I1 goto __label_3
    isne $I1, $S2, ''
  __label_3:
    unless $I1 goto __label_2
.const 'Sub' $P3 = 'WSubId_1'
.annotate 'line', 8020
    $P3('Label already defined', __ARG_1)
  __label_2: # endif
.annotate 'line', 8021
# value: $S3
    $P2 = self.'genlabel'()
    null $S3
    if_null $P2, __label_4
    set $S3, $P2
  __label_4:
.annotate 'line', 8022
    $P1[$S1] = $S3
.annotate 'line', 8023
    .return($S3)
# }
.annotate 'line', 8024

.end # createlabel


.sub 'getend' :method
# Body
# {
.annotate 'line', 8025
    getattribute $P1, self, 'end'
    .return($P1)
# }

.end # getend


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8028
    __ARG_1.'comment'('{')
.annotate 'line', 8029
    getattribute $P2, self, 'statements'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8030
    $P1.'emit'(__ARG_1)
.annotate 'line', 8031
    self.'freetemps'()
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8033
    __ARG_1.'comment'('}')
# }
.annotate 'line', 8034

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'CompoundStatement' ]
.annotate 'line', 7985
    get_class $P1, [ 'MultiStatementBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'BlockStatement' ]
    addparent $P0, $P2
.annotate 'line', 7987
    addattribute $P0, 'end'
.annotate 'line', 7988
    addattribute $P0, 'labels'
.end
.namespace [ 'RegisterStore' ]

.sub 'RegisterStore' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8049
    box $P3, __ARG_1
    setattribute self, 'type', $P3
.annotate 'line', 8051
    box $P3, 1
    setattribute self, 'nreg', $P3
.annotate 'line', 8052
    new $P1, ['ResizableStringArray']
.annotate 'line', 8053
    new $P2, ['ResizableStringArray']
.annotate 'line', 8054
    setattribute self, 'tempreg', $P1
.annotate 'line', 8055
    setattribute self, 'freereg', $P2
# }
.annotate 'line', 8056

.end # RegisterStore


.sub 'createreg' :method
# Body
# {
.annotate 'line', 8059
# var n: $P1
    getattribute $P1, self, 'nreg'
.annotate 'line', 8060
# i: $I1
    set $P2, $P1
    set $I1, $P2
.annotate 'line', 8061
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S1, $I2
.annotate 'line', 8062
    assign $P1, $I1
# predefined string
.annotate 'line', 8063
    getattribute $P2, self, 'type'
.annotate 'line', 8058
    set $S2, $P2
.annotate 'line', 8063
    concat $S3, '$', $S2
    concat $S3, $S3, $S1
    .return($S3)
# }
.annotate 'line', 8064

.end # createreg


.sub 'tempreg' :method
# Body
# {
.annotate 'line', 8067
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8068
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8069
# reg: $S1
    null $S1
.annotate 'line', 8070
# predefined elements
    elements $I1, $P1
    le $I1, 0, __label_1
.annotate 'line', 8071
    $P3 = $P1.'pop'()
    set $S1, $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8073
    $P4 = self.'createreg'()
    set $S1, $P4
  __label_2: # endif
.annotate 'line', 8074
# predefined push
    push $P2, $S1
.annotate 'line', 8075
    .return($S1)
# }
.annotate 'line', 8076

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8079
# var freereg: $P1
    getattribute $P1, self, 'freereg'
.annotate 'line', 8080
# var tempreg: $P2
    getattribute $P2, self, 'tempreg'
.annotate 'line', 8081
# n: $I1
# predefined elements
    elements $I1, $P2
# for loop
.annotate 'line', 8082
# i: $I2
    sub $I2, $I1, 1
  __label_3: # for condition
    lt $I2, 0, __label_2
# {
.annotate 'line', 8083
# s: $S1
    $S1 = $P2[$I2]
.annotate 'line', 8084
# predefined push
    push $P1, $S1
# }
  __label_1: # for iteration
.annotate 'line', 8082
    dec $I2
    goto __label_3
  __label_2: # for end
.annotate 'line', 8086
    assign $P2, 0
# }
.annotate 'line', 8087

.end # freetemps

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RegisterStore' ]
.annotate 'line', 8043
    addattribute $P0, 'type'
.annotate 'line', 8044
    addattribute $P0, 'nreg'
.annotate 'line', 8045
    addattribute $P0, 'tempreg'
.annotate 'line', 8046
    addattribute $P0, 'freereg'
.end
.namespace [ 'ParameterModifierList' ]

.sub 'ParameterModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8098
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8099

.end # ParameterModifierList


.sub 'emitmodifiers' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param string __ARG_3
# Body
# {
.annotate 'line', 8102
# var named: $P1
    null $P1
.annotate 'line', 8103
# var slurpy: $P2
    null $P2
.annotate 'line', 8104
# var modarglist: $P3
    $P3 = self.'getlist'()
.annotate 'line', 8105
    iter $P6, $P3
    set $P6, 0
  __label_1: # for iteration
    unless $P6 goto __label_2
    shift $P4, $P6
# {
.annotate 'line', 8106
# modname: $S1
    $P7 = $P4.'getname'()
    null $S1
    if_null $P7, __label_3
    set $S1, $P7
  __label_3:
# switch
.annotate 'line', 8107
    set $S3, $S1
    set $S4, 'named'
    if $S3 == $S4 goto __label_6
    set $S4, 'slurpy'
    if $S3 == $S4 goto __label_7
    goto __label_5
  __label_6: # case
.annotate 'line', 8109
    set $P1, $P4
    goto __label_4 # break
  __label_7: # case
.annotate 'line', 8112
    set $P2, $P4
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 8115
    __ARG_1.'print'(' :', $S1)
  __label_4: # switch end
# }
    goto __label_1
  __label_2: # endfor
# switch-case
.annotate 'line', 8119
    isnull $I1, $P1
    not $I1
    unless $I1 goto __label_11
    isnull $I1, $P2
    not $I1
  __label_11:
    if $I1 goto __label_10
.annotate 'line', 8126
    isnull $I1, $P1
    not $I1
    if $I1 goto __label_12
.annotate 'line', 8143
    isnull $I1, $P2
    not $I1
    if $I1 goto __label_13
    goto __label_9
  __label_10: # case
.annotate 'line', 8124
    __ARG_1.'print'(" :named :slurpy")
    goto __label_8 # break
  __label_12: # case
.annotate 'line', 8127
# setname: $S2
    null $S2
# switch
.annotate 'line', 8128
    $P7 = $P1.'numargs'()
    set $I2, $P7
    null $I3
    if $I2 == $I3 goto __label_16
    set $I3, 1
    if $I2 == $I3 goto __label_17
    goto __label_15
  __label_16: # case
.annotate 'line', 8130
    concat $S0, "'", __ARG_3
    concat $S0, $S0, "'"
    set $S2, $S0
    goto __label_14 # break
  __label_17: # case
.annotate 'line', 8133
# var argmod: $P5
    $P5 = $P1.'getarg'(0)
.annotate 'line', 8134
    $P8 = $P5.'isstringliteral'()
    isfalse $I4, $P8
    unless $I4 goto __label_18
.const 'Sub' $P9 = 'WSubId_1'
.annotate 'line', 8135
    $P9('Invalid modifier', __ARG_2)
  __label_18: # endif
.annotate 'line', 8136
    $P10 = $P5.'getPirString'()
    set $S2, $P10
    goto __label_14 # break
  __label_15: # default
.annotate 'line', 8137
.const 'Sub' $P11 = 'WSubId_1'
.annotate 'line', 8139
    $P11('Invalid modifier', __ARG_2)
  __label_14: # switch end
.annotate 'line', 8141
    __ARG_1.'print'(" :named(", $S2, ")")
    goto __label_8 # break
  __label_13: # case
.annotate 'line', 8144
    __ARG_1.'print'(" :slurpy")
    goto __label_8 # break
  __label_9: # default
  __label_8: # switch end
.annotate 'line', 8145
# }
.annotate 'line', 8147

.end # emitmodifiers

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ParameterModifierList' ]
.annotate 'line', 8094
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionParameter' ]

.sub 'FunctionParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8157
    setattribute self, 'func', __ARG_1
.annotate 'line', 8158
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8159
# type: $S1
.const 'Sub' $P3 = 'WSubId_95'
    $P4 = $P1.'checkkeyword'()
    $P2 = $P3($P4)
    null $S1
    if_null $P2, __label_1
    set $S1, $P2
  __label_1:
.annotate 'line', 8160
    eq $S1, '', __label_2
.annotate 'line', 8161
    $P1 = __ARG_2.'get'()
    goto __label_3
  __label_2: # else
.annotate 'line', 8163
    set $S1, 'P'
  __label_3: # endif
.annotate 'line', 8164
# argname: $S2
# predefined string
    $P2 = __ARG_1.'getparamnum'()
    set $S3, $P2
    concat $S2, '__ARG_', $S3
.annotate 'line', 8165
    __ARG_1.'createvarnamed'($P1, $S1, $S2)
.annotate 'line', 8167
# predefined string
    set $S3, $P1
    box $P2, $S3
    setattribute self, 'name', $P2
.annotate 'line', 8168
    $P1 = __ARG_2.'get'()
.annotate 'line', 8169
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_4
    unless $P2 goto __label_4
.annotate 'line', 8170
    new $P6, [ 'ParameterModifierList' ]
    getattribute $P7, __ARG_1, 'owner'
    $P6.'ParameterModifierList'(__ARG_2, $P7)
    set $P5, $P6
    setattribute self, 'modifiers', $P5
    goto __label_5
  __label_4: # else
.annotate 'line', 8172
    __ARG_2.'unget'($P1)
  __label_5: # endif
# }
.annotate 'line', 8173

.end # FunctionParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8176
# var func: $P1
    getattribute $P1, self, 'func'
.annotate 'line', 8177
# paramname: $S1
    getattribute $P4, self, 'name'
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 8178
# var param: $P2
    $P2 = $P1.'getvar'($S1)
.annotate 'line', 8179
# ptype: $S2
.const 'Sub' $P5 = 'WSubId_104'
    $P6 = $P2.'gettype'()
    $P4 = $P5($P6)
    null $S2
    if_null $P4, __label_2
    set $S2, $P4
  __label_2:
.annotate 'line', 8180
    $P4 = $P2.'getreg'()
    __ARG_1.'print'('        .param ', $S2, ' ', $P4)
.annotate 'line', 8181
# var modarg: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8182
    if_null $P3, __label_3
.annotate 'line', 8183
    getattribute $P4, $P1, 'start'
    $P3.'emitmodifiers'(__ARG_1, $P4, $S1)
  __label_3: # endif
.annotate 'line', 8184
    __ARG_1.'say'('')
# }
.annotate 'line', 8185

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionParameter' ]
.annotate 'line', 8152
    addattribute $P0, 'func'
.annotate 'line', 8153
    addattribute $P0, 'name'
.annotate 'line', 8154
    addattribute $P0, 'modifiers'
.end
.namespace [ ]

.sub 'parseParameter' :subid('WSubId_105')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8190
    new $P2, [ 'FunctionParameter' ]
    $P2.'FunctionParameter'(__ARG_2, __ARG_1)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8191

.end # parseParameter

.namespace [ 'FunctionModifierList' ]

.sub 'FunctionModifierList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8201
    self.'ModifierList'(__ARG_1, __ARG_2)
# }
.annotate 'line', 8202

.end # FunctionModifierList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8205
    $P3 = self.'getlist'()
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
# {
.annotate 'line', 8206
# nargmods: $I1
    $P5 = $P1.'numargs'()
    set $I1, $P5
.annotate 'line', 8207
    $P3 = $P1.'getname'()
    __ARG_1.'print'(' :', $P3)
.annotate 'line', 8208
    le $I1, 0, __label_3
# {
.annotate 'line', 8209
    __ARG_1.'print'('(')
# for loop
.annotate 'line', 8210
# iargmod: $I2
    null $I2
  __label_6: # for condition
    ge $I2, $I1, __label_5
# {
.annotate 'line', 8211
# var argmod: $P2
    $P2 = $P1.'getarg'($I2)
.annotate 'line', 8212
    $P3 = $P2.'isstringliteral'()
    isfalse $I3, $P3
    unless $I3 goto __label_7
.const 'Sub' $P6 = 'WSubId_1'
.annotate 'line', 8213
    getattribute $P5, $P2, 'start'
    $P6('Invalid modifier', $P5)
  __label_7: # endif
.annotate 'line', 8214
    $P3 = $P2.'getPirString'()
    __ARG_1.'print'($P3)
# }
  __label_4: # for iteration
.annotate 'line', 8210
    inc $I2
    goto __label_6
  __label_5: # for end
.annotate 'line', 8216
    __ARG_1.'print'(')')
# }
  __label_3: # endif
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8219

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionModifierList' ]
.annotate 'line', 8197
    get_class $P1, [ 'ModifierList' ]
    addparent $P0, $P1
.end
.namespace [ 'FunctionBase' ]

.sub 'FunctionBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8241
    self.'Statement'(__ARG_1, __ARG_2)
.annotate 'line', 8242
    box $P1, 0
    setattribute self, 'nlabel', $P1
.annotate 'line', 8243
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('I')
    set $P2, $P3
    setattribute self, 'regstI', $P2
.annotate 'line', 8244
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('N')
    set $P2, $P3
    setattribute self, 'regstN', $P2
.annotate 'line', 8245
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('S')
    set $P2, $P3
    setattribute self, 'regstS', $P2
.annotate 'line', 8246
    new $P3, [ 'RegisterStore' ]
    $P3.'RegisterStore'('P')
    set $P2, $P3
    setattribute self, 'regstP', $P2
# }
.annotate 'line', 8247

.end # FunctionBase


.sub 'getouter' :method
# Body
# {
.annotate 'line', 8249
    .return(self)
# }

.end # getouter


.sub 'makesubid' :method
# Body
# {
.annotate 'line', 8253
# var subid: $P1
    getattribute $P1, self, 'subid'
.annotate 'line', 8254
    unless_null $P1, __label_1
.annotate 'line', 8255
    $P1 = self.'generatesubid'()
    setattribute self, 'subid', $P1
  __label_1: # endif
.annotate 'line', 8256
    .return($P1)
# }
.annotate 'line', 8257

.end # makesubid


.sub 'same_scope_as' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8261
# r: $I1
    issame $I1, self, __ARG_1
.annotate 'line', 8262
    .return($I1)
# }
.annotate 'line', 8263

.end # same_scope_as


.sub 'parse_parameters' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8266
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8267
    $P2 = $P1.'isop'(')')
    isfalse $I1, $P2
    unless $I1 goto __label_1
# {
.annotate 'line', 8268
    __ARG_1.'unget'($P1)
.annotate 'line', 8269
.const 'Sub' $P3 = 'parseParameter'
.annotate 'line', 8270
.const 'Sub' $P5 = 'WSubId_36'
.const 'Sub' $P6 = 'WSubId_105'
    $P4 = $P5(__ARG_1, self, $P6, ')')
    setattribute self, 'params', $P4
# }
  __label_1: # endif
# }
.annotate 'line', 8272

.end # parse_parameters


.sub 'addlocalfunction' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8276
# var localfun: $P1
    getattribute $P1, self, 'localfun'
.annotate 'line', 8277
    unless_null $P1, __label_1
.annotate 'line', 8278
    root_new $P3, ['parrot';'ResizablePMCArray']
    push $P3, __ARG_1
    setattribute self, 'localfun', $P3
    goto __label_2
  __label_1: # else
.annotate 'line', 8280
# predefined push
    push $P1, __ARG_1
  __label_2: # endif
# }
.annotate 'line', 8281

.end # addlocalfunction


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8284
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8285
    unless_null $P1, __label_1
# {
.annotate 'line', 8287
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, __ARG_1
    setattribute self, 'usednamespaces', $P4
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8290
    iter $P6, $P1
    set $P6, 0
  __label_3: # for iteration
    unless $P6 goto __label_4
    shift $P2, $P6
.annotate 'line', 8291
    ne_addr __ARG_1, $P2, __label_5
.annotate 'line', 8292
    .return()
  __label_5: # endif
    goto __label_3
  __label_4: # endfor
.annotate 'line', 8293
# predefined push
    push $P1, __ARG_1
# }
  __label_2: # endif
# }
.annotate 'line', 8295

.end # usenamespace


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8298
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8299
    if_null $P1, __label_1
# {
.annotate 'line', 8300
# var found: $P2
    null $P2
.annotate 'line', 8301
    iter $P4, $P1
    set $P4, 0
  __label_2: # for iteration
    unless $P4 goto __label_3
    shift $P3, $P4
# {
.annotate 'line', 8302
    $P2 = $P3.'findsymbol'(__ARG_1)
.annotate 'line', 8303
    if_null $P2, __label_4
.annotate 'line', 8304
    .return($P2)
  __label_4: # endif
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8307
    getattribute $P5, self, 'owner'
    .tailcall $P5.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8308

.end # findsymbol


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8312
# var usedns: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 8313
    if_null $P1, __label_1
# {
.annotate 'line', 8314
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 8315
    $P2.'fixnamespaces'()
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8317
    getattribute $P6, self, 'body'
    $P5 = $P6.'optimize'()
    setattribute self, 'body', $P5
.annotate 'line', 8318
    .return(self)
# }
.annotate 'line', 8319

.end # optimize


.sub 'setusedlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8323
# var lexicals: $P1
    getattribute $P1, self, 'usedlexicals'
.annotate 'line', 8324
    unless_null $P1, __label_1
.annotate 'line', 8325
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'usedlexicals', $P1
  __label_1: # endif
.annotate 'line', 8326
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8327

.end # setusedlex


.sub 'setlex' :method
        .param string __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 8330
# var lexicals: $P1
    getattribute $P1, self, 'lexicals'
.annotate 'line', 8331
    unless_null $P1, __label_1
.annotate 'line', 8332
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'lexicals', $P1
  __label_1: # endif
.annotate 'line', 8333
    $P1[__ARG_2] = __ARG_1
# }
.annotate 'line', 8334

.end # setlex


.sub 'createlex' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8339
# var lex: $P1
    $P1 = __ARG_1.'getlex'()
.annotate 'line', 8340
# lexname: $S1
    null $S1
.annotate 'line', 8341
    if_null $P1, __label_1
.annotate 'line', 8342
    set $S1, $P1
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 8344
# reg: $S2
    $P2 = __ARG_1.'getreg'()
    null $S2
    if_null $P2, __label_3
    set $S2, $P2
  __label_3:
.annotate 'line', 8345
# lexnum: $I1
    $P2 = self.'getlexnum'()
    set $I1, $P2
.annotate 'line', 8346
# predefined string
    set $S3, $I1
    concat $S0, '__WLEX_', $S3
    set $S1, $S0
.annotate 'line', 8347
    self.'setlex'($S1, $S2)
.annotate 'line', 8348
    __ARG_1.'setlex'($S1)
# }
  __label_2: # endif
.annotate 'line', 8350
    .return($S1)
# }
.annotate 'line', 8351

.end # createlex


.sub 'createreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8355
# var store: $P1
    null $P1
# switch
.annotate 'line', 8356
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
.annotate 'line', 8358
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8360
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8362
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8364
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 8366
    concat $S4, 'Invalid type in createreg: ', __ARG_1
    $P2($S4)
  __label_1: # switch end
.annotate 'line', 8368
# reg: $S1
    $P3 = $P1.'createreg'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 8369
    .return($S1)
# }
.annotate 'line', 8370

.end # createreg


.sub 'tempreg' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8373
# var store: $P1
    null $P1
# switch
.annotate 'line', 8374
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
.annotate 'line', 8376
    getattribute $P1, self, 'regstI'
    goto __label_1 # break
  __label_4: # case
.annotate 'line', 8378
    getattribute $P1, self, 'regstN'
    goto __label_1 # break
  __label_5: # case
.annotate 'line', 8380
    getattribute $P1, self, 'regstS'
    goto __label_1 # break
  __label_6: # case
.annotate 'line', 8382
    getattribute $P1, self, 'regstP'
    goto __label_1 # break
  __label_2: # default
.const 'Sub' $P2 = 'WSubId_6'
.annotate 'line', 8384
    concat $S4, "Invalid type '", __ARG_1
    concat $S4, $S4, "' in tempreg"
    $P2($S4)
  __label_1: # switch end
.annotate 'line', 8386
# reg: $S1
    $P3 = $P1.'tempreg'()
    null $S1
    if_null $P3, __label_7
    set $S1, $P3
  __label_7:
.annotate 'line', 8387
    .return($S1)
# }
.annotate 'line', 8388

.end # tempreg


.sub 'freetemps' :method
# Body
# {
.annotate 'line', 8391
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
.annotate 'line', 8392
    $P1.'freetemps'()
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 8393

.end # freetemps


.sub 'genlabel' :method
# Body
# {
.annotate 'line', 8396
# n: $I1
    getattribute $P2, self, 'nlabel'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 8395
    set $S1, $I1
.annotate 'line', 8397
    concat $S2, '__label_', $S1
    .return($S2)
# }
.annotate 'line', 8398

.end # genlabel


.sub 'getbreaklabel' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 8401
    $P1('break not allowed here', __ARG_1)
# }
.annotate 'line', 8402

.end # getbreaklabel


.sub 'getcontinuelabel' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 8405
    $P1('continue not allowed here', __ARG_1)
# }
.annotate 'line', 8406

.end # getcontinuelabel


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8410
# name: $S1
    getattribute $P9, self, 'name'
    null $S1
    if_null $P9, __label_1
    set $S1, $P9
  __label_1:
.annotate 'line', 8411
    __ARG_1.'say'()
.annotate 'line', 8412
    __ARG_1.'print'(".sub ")
.annotate 'line', 8413
    $P9 = self.'isanonymous'()
    if_null $P9, __label_2
    unless $P9 goto __label_2
.annotate 'line', 8414
    __ARG_1.'print'("'' :anon")
    goto __label_3
  __label_2: # else
.annotate 'line', 8416
    __ARG_1.'print'("'", $S1, "'")
  __label_3: # endif
.annotate 'line', 8417
    getattribute $P9, self, 'subid'
    if_null $P9, __label_4
.annotate 'line', 8418
    getattribute $P10, self, 'subid'
    __ARG_1.'print'(" :subid('", $P10, "')")
  __label_4: # endif
.annotate 'line', 8419
    getattribute $P9, self, 'outer'
    if_null $P9, __label_5
# {
.annotate 'line', 8420
# var outer: $P1
    getattribute $P1, self, 'outer'
.annotate 'line', 8421
# var outerid: $P2
    getattribute $P2, $P1, 'subid'
.annotate 'line', 8422
    if_null $P2, __label_6
.annotate 'line', 8423
    __ARG_1.'print'(" :outer('", $P2, "')")
  __label_6: # endif
# }
  __label_5: # endif
.annotate 'line', 8427
    $P9 = self.'ismethod'()
    if_null $P9, __label_7
    unless $P9 goto __label_7
.annotate 'line', 8428
    __ARG_1.'print'(' :method')
  __label_7: # endif
.annotate 'line', 8429
# var modifiers: $P3
    getattribute $P3, self, 'modifiers'
.annotate 'line', 8430
    if_null $P3, __label_8
.annotate 'line', 8431
    $P3.'emit'(__ARG_1)
    goto __label_9
  __label_8: # else
# {
.annotate 'line', 8433
    ne $S1, 'main', __label_10
.annotate 'line', 8434
    __ARG_1.'print'(' :main')
  __label_10: # endif
# }
  __label_9: # endif
.annotate 'line', 8436
    __ARG_1.'say'()
.const 'Sub' $P11 = 'WSubId_52'
.annotate 'line', 8439
    getattribute $P9, self, 'params'
    $P11(__ARG_1, $P9)
.annotate 'line', 8441
# var lexicals: $P4
    getattribute $P4, self, 'lexicals'
.annotate 'line', 8442
# var usedlexicals: $P5
    getattribute $P5, self, 'usedlexicals'
.annotate 'line', 8443
    isnull $I1, $P4
    not $I1
    if $I1 goto __label_12
    isnull $I1, $P5
    not $I1
  __label_12:
    unless $I1 goto __label_11
# {
.annotate 'line', 8444
    getattribute $P9, self, 'start'
    __ARG_1.'annotate'($P9)
.annotate 'line', 8446
    if_null $P4, __label_13
# {
.annotate 'line', 8447
    iter $P12, $P4
    set $P12, 0
  __label_14: # for iteration
    unless $P12 goto __label_15
    shift $S2, $P12
.annotate 'line', 8448
    $P9 = $P4[$S2]
    __ARG_1.'say'(".lex '", $P9, "', ", $S2)
    goto __label_14
  __label_15: # endfor
# }
  __label_13: # endif
.annotate 'line', 8451
    if_null $P5, __label_16
# {
.annotate 'line', 8452
    iter $P13, $P5
    set $P13, 0
  __label_17: # for iteration
    unless $P13 goto __label_18
    shift $S3, $P13
.annotate 'line', 8453
    $P9 = $P5[$S3]
    __ARG_1.'emitfind_lex'($S3, $P9)
    goto __label_17
  __label_18: # endfor
# }
  __label_16: # endif
# }
  __label_11: # endif
.annotate 'line', 8457
# var body: $P6
    getattribute $P6, self, 'body'
.annotate 'line', 8458
    $P9 = $P6.'isempty'()
    if_null $P9, __label_19
    unless $P9 goto __label_19
.annotate 'line', 8459
    __ARG_1.'comment'('Empty body')
    goto __label_20
  __label_19: # else
# {
.annotate 'line', 8461
    __ARG_1.'comment'('Body')
.annotate 'line', 8462
    $P6.'emit'(__ARG_1)
.annotate 'line', 8463
    $P9 = $P6.'getend'()
    __ARG_1.'annotate'($P9)
# }
  __label_20: # endif
.annotate 'line', 8465
    __ARG_1.'say'("\n.end # ", $S1, "\n")
.annotate 'line', 8468
# var localfun: $P7
    getattribute $P7, self, 'localfun'
.annotate 'line', 8469
    if_null $P7, __label_21
# {
.annotate 'line', 8470
    iter $P14, $P7
    set $P14, 0
  __label_22: # for iteration
    unless $P14 goto __label_23
    shift $P8, $P14
.annotate 'line', 8471
    $P8.'emit'(__ARG_1)
    goto __label_22
  __label_23: # endfor
# }
  __label_21: # endif
# }
.annotate 'line', 8473

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionBase' ]
.annotate 'line', 8222
    get_class $P1, [ 'BlockStatement' ]
    addparent $P0, $P1
.annotate 'line', 8224
    addattribute $P0, 'name'
.annotate 'line', 8225
    addattribute $P0, 'subid'
.annotate 'line', 8226
    addattribute $P0, 'modifiers'
.annotate 'line', 8227
    addattribute $P0, 'params'
.annotate 'line', 8228
    addattribute $P0, 'body'
.annotate 'line', 8229
    addattribute $P0, 'regstI'
.annotate 'line', 8230
    addattribute $P0, 'regstN'
.annotate 'line', 8231
    addattribute $P0, 'regstS'
.annotate 'line', 8232
    addattribute $P0, 'regstP'
.annotate 'line', 8233
    addattribute $P0, 'nlabel'
.annotate 'line', 8234
    addattribute $P0, 'localfun'
.annotate 'line', 8235
    addattribute $P0, 'lexicals'
.annotate 'line', 8236
    addattribute $P0, 'usedlexicals'
.annotate 'line', 8237
    addattribute $P0, 'outer'
.end
.namespace [ 'FunctionStatement' ]

.sub 'FunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8487
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8488
    box $P1, 0
    setattribute self, 'paramnum', $P1
.annotate 'line', 8489
    box $P1, 0
    setattribute self, 'lexnum', $P1
.annotate 'line', 8490
    self.'parse'(__ARG_2)
# }
.annotate 'line', 8491

.end # FunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8493
    .return(0)
# }

.end # isanonymous


.sub 'getparamnum' :method
# Body
# {
# predefined int
.annotate 'line', 8497
    getattribute $P1, self, 'paramnum'
    inc $P1
.annotate 'line', 8495
    set $I1, $P1
.annotate 'line', 8497
    .return($I1)
# }
.annotate 'line', 8498

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
# predefined int
.annotate 'line', 8502
    getattribute $P1, self, 'lexnum'
    inc $P1
.annotate 'line', 8500
    set $I1, $P1
.annotate 'line', 8502
    .return($I1)
# }
.annotate 'line', 8503

.end # getlexnum


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8504
    .return(0)
# }

.end # ismethod


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8508
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8509
    setattribute self, 'name', $P1
.annotate 'line', 8510
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8511
    $P5 = $P2.'isop'('[')
    if_null $P5, __label_1
    unless $P5 goto __label_1
# {
.annotate 'line', 8512
    new $P8, [ 'FunctionModifierList' ]
    getattribute $P9, self, 'owner'
    $P8.'FunctionModifierList'(__ARG_1, $P9)
    set $P7, $P8
    setattribute self, 'modifiers', $P7
.annotate 'line', 8513
    $P2 = __ARG_1.'get'()
# }
  __label_1: # endif
.const 'Sub' $P10 = 'WSubId_4'
.annotate 'line', 8515
    $P10('(', $P2)
.annotate 'line', 8516
    self.'parse_parameters'(__ARG_1)
.annotate 'line', 8518
# var fullname: $P3
    getattribute $P6, self, 'owner'
    $P5 = $P6.'getpath'()
# predefined clone
    clone $P3, $P5
.annotate 'line', 8519
    $P5 = $P1.'getidentifier'()
# predefined push
    push $P3, $P5
.annotate 'line', 8520
# var cfunction: $P4
    $P4 = self.'createconst'('__FUNCTION__', 'S')
.annotate 'line', 8521
    new $P6, [ 'StringLiteral' ]
.annotate 'line', 8522
    new $P8, [ 'TokenQuoted' ]
    getattribute $P9, $P1, 'file'
    getattribute $P11, $P1, 'line'
.annotate 'line', 8523
# predefined join
.annotate 'line', 8521
    join $S1, '.', $P3
    $P8.'TokenQuoted'($P9, $P11, $S1)
    set $P7, $P8
    $P6.'StringLiteral'(self, $P7)
    set $P5, $P6
    $P4.'setvalue'($P5)
.annotate 'line', 8525
    $P2 = __ARG_1.'get'()
.annotate 'line', 8526
    $P5 = $P2.'isop'('{')
    isfalse $I1, $P5
    unless $I1 goto __label_2
.const 'Sub' $P12 = 'WSubId_2'
.annotate 'line', 8527
    $P12('{', $P2)
  __label_2: # endif
.annotate 'line', 8528
    new $P7, [ 'CompoundStatement' ]
    $P7.'CompoundStatement'($P2, __ARG_1, self)
    set $P6, $P7
    setattribute self, 'body', $P6
.annotate 'line', 8529
    .return(self)
# }
.annotate 'line', 8530

.end # parse

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'FunctionStatement' ]
.annotate 'line', 8480
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.annotate 'line', 8482
    addattribute $P0, 'paramnum'
.annotate 'line', 8483
    addattribute $P0, 'lexnum'
.end
.namespace [ 'LocalFunctionStatement' ]

.sub 'LocalFunctionStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8541
    self.'FunctionBase'(__ARG_1, __ARG_3)
.annotate 'line', 8542
    $P4 = __ARG_3.'getouter'()
    setattribute self, 'outer', $P4
.annotate 'line', 8543
    getattribute $P3, self, 'outer'
    $P3.'makesubid'()
.annotate 'line', 8544
# var subid: $P1
    $P1 = self.'makesubid'()
.annotate 'line', 8545
    setattribute self, 'name', $P1
.annotate 'line', 8546
    self.'parse_parameters'(__ARG_2)
.annotate 'line', 8547
# var t: $P2
    $P2 = __ARG_2.'get'()
.const 'Sub' $P5 = 'WSubId_4'
.annotate 'line', 8548
    $P5('{', $P2)
.annotate 'line', 8549
    new $P6, [ 'CompoundStatement' ]
    $P6.'CompoundStatement'($P2, __ARG_2, self)
    set $P4, $P6
    setattribute self, 'body', $P4
.annotate 'line', 8550
    __ARG_3.'addlocalfunction'(self)
# }
.annotate 'line', 8551

.end # LocalFunctionStatement


.sub 'isanonymous' :method
# Body
# {
.annotate 'line', 8552
    .return(1)
# }

.end # isanonymous


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8553
    .return(0)
# }

.end # ismethod


.sub 'getsubid' :method
# Body
# {
.annotate 'line', 8556
    getattribute $P1, self, 'subid'
    .return($P1)
# }
.annotate 'line', 8557

.end # getsubid


.sub 'getparamnum' :method
# Body
# {
.annotate 'line', 8561
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getparamnum'()
# }
.annotate 'line', 8562

.end # getparamnum


.sub 'getlexnum' :method
# Body
# {
.annotate 'line', 8566
    getattribute $P1, self, 'outer'
    .tailcall $P1.'getlexnum'()
# }
.annotate 'line', 8567

.end # getlexnum


.sub 'getvar' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8570
# var r: $P1
    $P1 = self.'getlocalvar'(__ARG_1)
.annotate 'line', 8571
    unless_null $P1, __label_1
.annotate 'line', 8572
    $P1 = self.'getusedvar'(__ARG_1)
  __label_1: # endif
.annotate 'line', 8573
    unless_null $P1, __label_2
# {
.annotate 'line', 8576
    getattribute $P6, self, 'owner'
    $P1 = $P6.'getvar'(__ARG_1)
.annotate 'line', 8577
    unless_null $P1, __label_3
# {
.annotate 'line', 8579
    ne __ARG_1, 'self', __label_5
# {
.annotate 'line', 8580
# var ownerscope: $P2
    getattribute $P2, self, 'outer'
.annotate 'line', 8581
    getattribute $P7, self, 'outer'
    $P6 = $P7.'ismethod'()
    if_null $P6, __label_6
    unless $P6 goto __label_6
# {
.annotate 'line', 8582
# lexself: $S1
    $P8 = $P2.'makelexicalself'()
    null $S1
    if_null $P8, __label_7
    set $S1, $P8
  __label_7:
.annotate 'line', 8583
    $P1 = self.'createvar'(__ARG_1, 'P')
.annotate 'line', 8584
# reg: $S2
    $P6 = $P1.'getreg'()
    null $S2
    if_null $P6, __label_8
    set $S2, $P6
  __label_8:
.annotate 'line', 8585
    self.'setusedlex'($S1, $S2)
# }
  __label_6: # endif
# }
  __label_5: # endif
# }
    goto __label_4
  __label_3: # else
.annotate 'line', 8589
    $P6 = $P1.'gettype'()
    set $S5, $P6
    iseq $I2, $S5, 'P'
    unless $I2 goto __label_10
    $P7 = $P1.'isconst'()
    isfalse $I2, $P7
  __label_10:
    unless $I2 goto __label_9
# {
.annotate 'line', 8590
# var scope: $P3
    $P3 = $P1.'getscope'()
.annotate 'line', 8591
# var ownerscope: $P4
    $P4 = $P3.'getouter'()
.annotate 'line', 8592
# var outer: $P5
    getattribute $P5, self, 'outer'
.annotate 'line', 8593
    isa $I2, $P4, [ 'FunctionBase' ]
    unless $I2 goto __label_11
# {
.annotate 'line', 8594
    $P6 = $P4.'same_scope_as'($P5)
    if_null $P6, __label_12
    unless $P6 goto __label_12
# {
.annotate 'line', 8595
# lexname: $S3
    $P7 = $P3.'makelexical'($P1)
    null $S3
    if_null $P7, __label_13
    set $S3, $P7
  __label_13:
.annotate 'line', 8596
# flags: $I1
    $I2 = $P1.'getflags'()
    bor $I1, $I2, 2
.annotate 'line', 8597
    $P1 = self.'createvar'(__ARG_1, 'P', $I1)
.annotate 'line', 8598
    box $P6, $S3
    setattribute $P1, 'lexname', $P6
.annotate 'line', 8599
# reg: $S4
    $P6 = $P1.'getreg'()
    null $S4
    if_null $P6, __label_14
    set $S4, $P6
  __label_14:
.annotate 'line', 8600
    self.'setusedlex'($S3, $S4)
# }
  __label_12: # endif
# }
  __label_11: # endif
# }
  __label_9: # endif
  __label_4: # endif
# }
  __label_2: # endif
.annotate 'line', 8605
    isnull $I2, $P1
    not $I2
    unless $I2 goto __label_16
    isa $I3, $P1, [ 'VarData' ]
    not $I2, $I3
  __label_16:
    unless $I2 goto __label_15
.const 'Sub' $P9 = 'WSubId_6'
.annotate 'line', 8606
    $P9('Incorrect data for variable in LocalFunction')
  __label_15: # endif
.annotate 'line', 8607
    .return($P1)
# }
.annotate 'line', 8608

.end # getvar

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'LocalFunctionStatement' ]
.annotate 'line', 8537
    get_class $P1, [ 'FunctionBase' ]
    addparent $P0, $P1
.end
.namespace [ 'MethodStatement' ]

.sub 'MethodStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8619
    self.'FunctionStatement'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8620

.end # MethodStatement


.sub 'ismethod' :method
# Body
# {
.annotate 'line', 8621
    .return(1)
# }

.end # ismethod

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MethodStatement' ]
.annotate 'line', 8615
    get_class $P1, [ 'FunctionStatement' ]
    addparent $P0, $P1
.end
.namespace [ 'SigParameter' ]

.sub 'SigParameter' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8635
# var name: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8636
    $P4 = $P1.'isidentifier'()
    isfalse $I1, $P4
    unless $I1 goto __label_1
.const 'Sub' $P5 = 'WSubId_3'
.annotate 'line', 8637
    $P5($P1)
  __label_1: # endif
.annotate 'line', 8638
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8639
    $P4 = $P2.'isidentifier'()
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 8640
# type: $S1
.const 'Sub' $P7 = 'WSubId_95'
    $P8 = $P1.'checkkeyword'()
    $P6 = $P7($P8)
    null $S1
    if_null $P6, __label_3
    set $S1, $P6
  __label_3:
.annotate 'line', 8641
    set $P1, $P2
.annotate 'line', 8642
    __ARG_2.'createvar'($P1, $S1)
.annotate 'line', 8643
    $P2 = __ARG_1.'get'()
# }
  __label_2: # endif
.annotate 'line', 8645
    setattribute self, 'name', $P1
.annotate 'line', 8646
# var data: $P3
    $P4 = $P1.'getidentifier'()
    $P3 = __ARG_2.'getvar'($P4)
.annotate 'line', 8647
    $P6 = $P3.'getreg'()
    setattribute self, 'reg', $P6
.annotate 'line', 8648
    $P4 = $P2.'isop'('[')
    if_null $P4, __label_4
    unless $P4 goto __label_4
.annotate 'line', 8649
    new $P9, [ 'ParameterModifierList' ]
    $P9.'ParameterModifierList'(__ARG_1, self)
    set $P8, $P9
    setattribute self, 'modifiers', $P8
    goto __label_5
  __label_4: # else
.annotate 'line', 8651
    __ARG_1.'unget'($P2)
  __label_5: # endif
# }
.annotate 'line', 8652

.end # SigParameter


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8655
    getattribute $P3, self, 'reg'
    __ARG_1.'print'($P3)
.annotate 'line', 8656
# var modifiers: $P1
    getattribute $P1, self, 'modifiers'
.annotate 'line', 8657
    if_null $P1, __label_1
# {
.annotate 'line', 8658
# var name: $P2
    getattribute $P2, self, 'name'
.annotate 'line', 8659
    $P1.'emitmodifiers'(__ARG_1, $P2, $P2)
# }
  __label_1: # endif
# }
.annotate 'line', 8661

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameter' ]
.annotate 'line', 8630
    addattribute $P0, 'name'
.annotate 'line', 8631
    addattribute $P0, 'modifiers'
.annotate 'line', 8632
    addattribute $P0, 'reg'
.end
.namespace [ ]

.sub 'parseSigParameter' :subid('WSubId_106')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8666
    new $P2, [ 'SigParameter' ]
    $P2.'SigParameter'(__ARG_1, __ARG_2)
    set $P1, $P2
    .return($P1)
# }
.annotate 'line', 8667

.end # parseSigParameter

.namespace [ 'SigParameterList' ]

.sub 'SigParameterList' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8674
.const 'Sub' $P1 = 'parseSigParameter'
.annotate 'line', 8675
.const 'Sub' $P4 = 'WSubId_36'
.const 'Sub' $P5 = 'WSubId_106'
    $P3 = $P4(__ARG_1, __ARG_2, $P5, ')')
    setattribute self, 'params', $P3
# }
.annotate 'line', 8676

.end # SigParameterList


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8679
    __ARG_1.'print'('(')
.annotate 'line', 8680
# sep: $S1
    set $S1, ''
.annotate 'line', 8681
    getattribute $P2, self, 'params'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
# {
.annotate 'line', 8682
    __ARG_1.'print'($S1)
.annotate 'line', 8683
    $P1.'emit'(__ARG_1)
.annotate 'line', 8684
    set $S1, ', '
# }
    goto __label_1
  __label_2: # endfor
.annotate 'line', 8686
    __ARG_1.'print'(')')
# }
.annotate 'line', 8687

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'SigParameterList' ]
.annotate 'line', 8671
    addattribute $P0, 'params'
.end
.namespace [ 'MultiAssignStatement' ]

.sub 'MultiAssignStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8696
    setattribute self, 'params', __ARG_1
.annotate 'line', 8697
    setattribute self, 'expr', __ARG_2
# }
.annotate 'line', 8698

.end # MultiAssignStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8701
    getattribute $P3, self, 'expr'
    $P2 = $P3.'optimize'()
    setattribute self, 'expr', $P2
.annotate 'line', 8702
    .return(self)
# }
.annotate 'line', 8703

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8706
# var expr: $P1
    getattribute $P1, self, 'expr'
.annotate 'line', 8707
# var call: $P2
    $P2 = $P1.'emitcall'(__ARG_1)
.annotate 'line', 8708
    $P1.'prepareargs'(__ARG_1)
.annotate 'line', 8709
    __ARG_1.'print'('    ')
.annotate 'line', 8710
    getattribute $P3, self, 'params'
    $P3.'emit'(__ARG_1)
.annotate 'line', 8711
    __ARG_1.'print'(' = ', $P2)
.annotate 'line', 8712
    $P1.'emitargs'(__ARG_1)
.annotate 'line', 8713
    __ARG_1.'say'()
# }
.annotate 'line', 8714

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'MultiAssignStatement' ]
.annotate 'line', 8692
    addattribute $P0, 'params'
.annotate 'line', 8693
    addattribute $P0, 'expr'
.end
.namespace [ ]
# Constant CLASSSPECIFIER_invalid evaluated at compile time
# Constant CLASSSPECIFIER_str evaluated at compile time
# Constant CLASSSPECIFIER_parrotkey evaluated at compile time
# Constant CLASSSPECIFIER_id evaluated at compile time
.namespace [ 'ClassSpecifier' ]

.sub 'ClassSpecifier' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8731
    self.'initbase'(__ARG_2, __ARG_1)
# }
.annotate 'line', 8732

.end # ClassSpecifier


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8733
    .return(0)
# }

.end # reftype


.sub 'annotate' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8737
    getattribute $P1, self, 'start'
    __ARG_1.'annotate'($P1)
# }
.annotate 'line', 8738

.end # annotate

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifier' ]
.annotate 'line', 8727
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.end
.namespace [ 'ClassSpecifierStr' ]

.sub 'ClassSpecifierStr' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8746
    self.'ClassSpecifier'(__ARG_1, __ARG_2)
.annotate 'line', 8747
    setattribute self, 'name', __ARG_2
# }
.annotate 'line', 8748

.end # ClassSpecifierStr


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8749
    .return(1)
# }

.end # reftype


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8753
# basestr: $S1
    getattribute $P1, self, 'name'
    null $S1
    if_null $P1, __label_1
    set $S1, $P1
  __label_1:
.annotate 'line', 8754
    __ARG_1.'print'($S1)
# }
.annotate 'line', 8755

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierStr' ]
.annotate 'line', 8741
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8743
    addattribute $P0, 'name'
.end
.namespace [ 'ClassSpecifierParrotKey' ]

.sub 'ClassSpecifierParrotKey' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8764
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8765
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8766
# var t: $P2
    $P2 = __ARG_1.'get'()
.annotate 'line', 8767
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_1
.const 'Sub' $P4 = 'WSubId_40'
.annotate 'line', 8768
    $P4('literal string', $P2)
  __label_1: # endif
.annotate 'line', 8769
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
.annotate 'line', 8770
    $P2 = __ARG_1.'get'()
.annotate 'line', 8771
    $P3 = $P2.'isop'(']')
    isfalse $I1, $P3
    unless $I1 goto __label_2
# {
# switch
.annotate 'line', 8772
    $P5 = $P2.'checkop'()
    set $S1, $P5
    set $S2, ':'
    if $S1 == $S2 goto __label_5
    set $S2, ','
    if $S1 == $S2 goto __label_6
    goto __label_4
  __label_5: # case
.annotate 'line', 8774
    box $P6, 1
    setattribute self, 'hll', $P6
  __label_6: # case
    goto __label_3 # break
  __label_4: # default
.annotate 'line', 8776
.const 'Sub' $P7 = 'WSubId_41'
.annotate 'line', 8778
    $P7('token in class key', $P2)
  __label_3: # switch end
  __label_7: # do
.annotate 'line', 8780
# {
.annotate 'line', 8781
    $P2 = __ARG_1.'get'()
.annotate 'line', 8782
    $P3 = $P2.'isstring'()
    isfalse $I1, $P3
    unless $I1 goto __label_10
.const 'Sub' $P8 = 'WSubId_40'
.annotate 'line', 8783
    $P8('literal string', $P2)
  __label_10: # endif
.annotate 'line', 8784
    $P3 = $P2.'rawstring'()
# predefined push
    push $P1, $P3
# }
  __label_9: # continue
.annotate 'line', 8785
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'(',')
    if_null $P3, __label_8
    if $P3 goto __label_7
  __label_8: # enddo
.const 'Sub' $P9 = 'WSubId_4'
.annotate 'line', 8786
    $P9(']', $P2)
# }
  __label_2: # endif
.annotate 'line', 8788
    setattribute self, 'key', $P1
# }
.annotate 'line', 8789

.end # ClassSpecifierParrotKey


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8790
    .return(2)
# }

.end # reftype


.sub 'hasHLL' :method
# Body
# {
# predefined int
.annotate 'line', 8793
    getattribute $P1, self, 'hll'
    isnull $I1, $P1
    not $I1
    .return($I1)
# }
.annotate 'line', 8794

.end # hasHLL


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8798
.const 'Sub' $P2 = 'WSubId_58'
    getattribute $P3, self, 'key'
    $P1 = $P2($P3)
    __ARG_1.'print'($P1)
# }
.annotate 'line', 8799

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierParrotKey' ]
.annotate 'line', 8758
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8760
    addattribute $P0, 'key'
.annotate 'line', 8761
    addattribute $P0, 'hll'
.end
.namespace [ 'ClassSpecifierId' ]

.sub 'ClassSpecifierId' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8807
    self.'ClassSpecifier'(__ARG_2, __ARG_3)
.annotate 'line', 8808
# var key: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
# predefined string
    set $S1, __ARG_3
    box $P3, $S1
    push $P1, $P3
.annotate 'line', 8809
# var t: $P2
    null $P2
  __label_2: # while
.annotate 'line', 8810
    $P2 = __ARG_1.'get'()
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_1
    unless $P3 goto __label_1
# {
.annotate 'line', 8811
    $P2 = __ARG_1.'get'()
.annotate 'line', 8812
# predefined string
    set $S1, $P2
# predefined push
    push $P1, $S1
# }
    goto __label_2
  __label_1: # endwhile
.annotate 'line', 8814
    __ARG_1.'unget'($P2)
.annotate 'line', 8815
    setattribute self, 'key', $P1
# }
.annotate 'line', 8816

.end # ClassSpecifierId


.sub 'reftype' :method
# Body
# {
.annotate 'line', 8817
    .return(3)
# }

.end # reftype


.sub 'last' :method
# Body
# {
.annotate 'line', 8821
# var key: $P1
    getattribute $P1, self, 'key'
.annotate 'line', 8822
    $P2 = $P1[-1]
    .return($P2)
# }
.annotate 'line', 8823

.end # last


.sub 'emit' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8827
# var key: $P1
    getattribute $P2, self, 'key'
    $P1 = __ARG_2.'findclasskey'($P2)
.annotate 'line', 8828
    unless_null $P1, __label_1
# {
.annotate 'line', 8829
    $P2 = self.'dowarnings'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.const 'Sub' $P3 = 'WSubId_67'
.annotate 'line', 8830
    getattribute $P4, self, 'key'
# predefined join
    join $S1, ".", $P4
    concat $S2, "class ", $S1
    concat $S2, $S2, " not found at compile time"
    $P3($S2)
  __label_3: # endif
.annotate 'line', 8831
.const 'Sub' $P5 = 'WSubId_58'
    getattribute $P4, self, 'key'
    $P2 = $P5($P4)
    __ARG_1.'print'($P2)
# }
    goto __label_2
  __label_1: # else
.annotate 'line', 8833
    $P2 = $P1.'getclasskey'()
    __ARG_1.'print'($P2)
  __label_2: # endif
# }
.annotate 'line', 8834

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassSpecifierId' ]
.annotate 'line', 8802
    get_class $P1, [ 'ClassSpecifier' ]
    addparent $P0, $P1
.annotate 'line', 8804
    addattribute $P0, 'key'
.end
.namespace [ ]

.sub 'parseClassSpecifier' :subid('WSubId_60')
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 8839
# var t: $P1
    $P1 = __ARG_1.'get'()
.annotate 'line', 8840
    $P2 = $P1.'isstring'()
    if_null $P2, __label_1
    unless $P2 goto __label_1
.annotate 'line', 8841
    new $P4, [ 'ClassSpecifierStr' ]
    $P4.'ClassSpecifierStr'(__ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_1: # endif
.annotate 'line', 8842
    $P2 = $P1.'isop'('[')
    if_null $P2, __label_2
    unless $P2 goto __label_2
.annotate 'line', 8843
    new $P4, [ 'ClassSpecifierParrotKey' ]
    $P4.'ClassSpecifierParrotKey'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_2: # endif
.annotate 'line', 8844
    $P2 = $P1.'isidentifier'()
    if_null $P2, __label_3
    unless $P2 goto __label_3
.annotate 'line', 8845
    new $P4, [ 'ClassSpecifierId' ]
    $P4.'ClassSpecifierId'(__ARG_1, __ARG_2, $P1)
    set $P3, $P4
    .return($P3)
  __label_3: # endif
.const 'Sub' $P5 = 'WSubId_1'
.annotate 'line', 8846
    $P5('Invalid class', $P1)
# }
.annotate 'line', 8847

.end # parseClassSpecifier

.namespace [ 'ClassBase' ]

.sub 'ClassBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8859
    self.'initbase'(__ARG_1, __ARG_3)
.annotate 'line', 8860
    setattribute self, 'name', __ARG_2
.annotate 'line', 8861
# var classns: $P1
    $P2 = __ARG_3.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 8862
    getattribute $P2, self, 'name'
# predefined push
    push $P1, $P2
.annotate 'line', 8863
    setattribute self, 'classns', $P1
# }
.annotate 'line', 8864

.end # ClassBase


.sub 'getclasskey' :method
# Body
# {
.annotate 'line', 8867
.const 'Sub' $P1 = 'WSubId_58'
    getattribute $P2, self, 'classns'
    .tailcall $P1($P2)
# }
.annotate 'line', 8868

.end # getclasskey

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassBase' ]
.annotate 'line', 8853
    get_class $P1, [ 'CommonBase' ]
    addparent $P0, $P1
.annotate 'line', 8855
    addattribute $P0, 'name'
.annotate 'line', 8856
    addattribute $P0, 'classns'
.end
.namespace [ 'ClassStatement' ]

.sub 'ClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param pmc __ARG_4
# Body
# {
.annotate 'line', 8881
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
.annotate 'line', 8882
    setattribute self, 'parent', __ARG_3
.annotate 'line', 8883
# var functions: $P1
    root_new $P1, ['parrot';'ResizablePMCArray']
.annotate 'line', 8884
    setattribute self, 'functions', $P1
.annotate 'line', 8885
# var members: $P2
    root_new $P2, ['parrot';'ResizablePMCArray']
.annotate 'line', 8886
    setattribute self, 'members', $P2
.annotate 'line', 8887
# var constants: $P3
    root_new $P3, ['parrot';'ResizablePMCArray']
.annotate 'line', 8888
    setattribute self, 'constants', $P3
.annotate 'line', 8890
# var t: $P4
    $P4 = __ARG_4.'get'()
.annotate 'line', 8891
    $P9 = $P4.'isop'(':')
    if_null $P9, __label_1
    unless $P9 goto __label_1
# {
.const 'Sub' $P8 = "WSubId_60"
.annotate 'line', 8893
.const 'Sub' $P11 = 'WSubId_36'
    $P10 = $P11(__ARG_4, self, $P8)
    setattribute self, 'bases', $P10
.annotate 'line', 8894
    $P4 = __ARG_4.'get'()
# }
  __label_1: # endif
.const 'Sub' $P12 = 'WSubId_4'
.annotate 'line', 8896
    $P12('{', $P4)
# for loop
.annotate 'line', 8897
    $P4 = __ARG_4.'get'()
  __label_4: # for condition
    $P9 = $P4.'isop'('}')
    isfalse $I1, $P9
    unless $I1 goto __label_3
# {
# switch
.annotate 'line', 8898
    $P10 = $P4.'checkkeyword'()
    set $S1, $P10
    set $S2, 'function'
    if $S1 == $S2 goto __label_7
    set $S2, 'var'
    if $S1 == $S2 goto __label_8
    set $S2, 'const'
    if $S1 == $S2 goto __label_9
    goto __label_6
  __label_7: # case
.annotate 'line', 8900
# var f: $P5
    new $P5, [ 'MethodStatement' ]
    $P5.'MethodStatement'($P4, __ARG_4, self)
.annotate 'line', 8901
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 8904
# var name: $P6
    $P6 = __ARG_4.'get'()
.annotate 'line', 8905
    $P13 = $P6.'isidentifier'()
    isfalse $I2, $P13
    unless $I2 goto __label_10
.const 'Sub' $P14 = 'WSubId_40'
.annotate 'line', 8906
    $P14("member identifier", $P6)
  __label_10: # endif
.annotate 'line', 8907
# predefined push
    push $P2, $P6
.annotate 'line', 8908
    $P4 = __ARG_4.'get'()
.annotate 'line', 8909
    $P15 = $P4.'isop'(';')
    isfalse $I3, $P15
    unless $I3 goto __label_11
.const 'Sub' $P16 = 'WSubId_40'
.annotate 'line', 8910
    $P16("';' in member declaration", $P4)
  __label_11: # endif
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 8913
# var cst: $P7
.const 'Sub' $P17 = 'WSubId_44'
    $P7 = $P17($P4, __ARG_4, self)
.annotate 'line', 8914
# predefined push
    push $P3, $P7
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 8915
.const 'Sub' $P18 = 'WSubId_41'
.annotate 'line', 8917
    $P18("item in class", $P4)
  __label_5: # switch end
# }
  __label_2: # for iteration
.annotate 'line', 8897
    $P4 = __ARG_4.'get'()
    goto __label_4
  __label_3: # for end
# }
.annotate 'line', 8920

.end # ClassStatement


.sub 'getpath' :method
# Body
# {
.annotate 'line', 8923
    getattribute $P1, self, 'classns'
    .return($P1)
# }
.annotate 'line', 8924

.end # getpath


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 8927
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 8928

.end # generatesubid


.sub 'findsymbol' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8931
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findsymbol'(__ARG_1)
# }
.annotate 'line', 8932

.end # findsymbol


.sub 'findclasskey' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8935
    getattribute $P1, self, 'parent'
    .tailcall $P1.'findclasskey'(__ARG_1)
# }
.annotate 'line', 8936

.end # findclasskey


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8939
    getattribute $P1, self, 'parent'
    .tailcall $P1.'checkclass'(__ARG_1)
# }
.annotate 'line', 8940

.end # checkclass


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 8943
    getattribute $P1, self, 'owner'
    .tailcall $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 8944

.end # use_predef


.sub 'optimize' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_38'
.annotate 'line', 8947
    getattribute $P2, self, 'constants'
    $P1($P2)
.const 'Sub' $P3 = 'WSubId_38'
.annotate 'line', 8948
    getattribute $P2, self, 'functions'
    $P3($P2)
.annotate 'line', 8949
    .return(self)
# }
.annotate 'line', 8950

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 8953
# var classns: $P1
    getattribute $P1, self, 'classns'
.annotate 'line', 8954
.const 'Sub' $P6 = 'WSubId_107'
    $P5 = $P6($P1)
    __ARG_1.'say'($P5)
.const 'Sub' $P7 = 'WSubId_52'
.annotate 'line', 8955
    getattribute $P5, self, 'functions'
    $P7(__ARG_1, $P5)
.annotate 'line', 8957
    __ARG_1.'say'('.sub Winxed_class_init :anon :load :init')
.annotate 'line', 8959
    $P5 = self.'getclasskey'()
    __ARG_1.'say'('    ', 'newclass $P0, ', $P5)
.annotate 'line', 8960
# n: $I1
    set $I1, 1
.annotate 'line', 8961
# var bases: $P2
    getattribute $P2, self, 'bases'
.annotate 'line', 8962
    if_null $P2, __label_1
# {
.annotate 'line', 8963
    getattribute $P5, self, 'bases'
    iter $P8, $P5
    set $P8, 0
  __label_2: # for iteration
    unless $P8 goto __label_3
    shift $P3, $P8
# {
.annotate 'line', 8964
    $P3.'annotate'(__ARG_1)
.annotate 'line', 8965
# reg: $S1
    set $I2, $I1
    inc $I1
    set $S2, $I2
    concat $S1, "$P", $S2
.annotate 'line', 8966
    __ARG_1.'print'('    ', 'get_class ', $S1, ', ')
.annotate 'line', 8967
    getattribute $P5, self, 'parent'
    $P3.'emit'(__ARG_1, $P5)
.annotate 'line', 8968
    __ARG_1.'say'()
.annotate 'line', 8969
    __ARG_1.'say'('    ', 'addparent $P0, ', $S1)
# }
    goto __label_2
  __label_3: # endfor
# }
  __label_1: # endif
.annotate 'line', 8972
    getattribute $P5, self, 'members'
    iter $P9, $P5
    set $P9, 0
  __label_4: # for iteration
    unless $P9 goto __label_5
    shift $P4, $P9
# {
.annotate 'line', 8973
    __ARG_1.'annotate'($P4)
.annotate 'line', 8974
    __ARG_1.'say'('    ', "addattribute $P0, '", $P4, "'")
# }
    goto __label_4
  __label_5: # endfor
.annotate 'line', 8977
    __ARG_1.'say'('.end')
# }
.annotate 'line', 8978

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'ClassStatement' ]
.annotate 'line', 8871
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
    get_class $P2, [ 'VarContainer' ]
    addparent $P0, $P2
.annotate 'line', 8873
    addattribute $P0, 'parent'
.annotate 'line', 8874
    addattribute $P0, 'bases'
.annotate 'line', 8875
    addattribute $P0, 'constants'
.annotate 'line', 8876
    addattribute $P0, 'functions'
.annotate 'line', 8877
    addattribute $P0, 'members'
.end
.namespace [ 'DeclareClassStatement' ]

.sub 'DeclareClassStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8985
    self.'ClassBase'(__ARG_1, __ARG_2, __ARG_3)
# }
.annotate 'line', 8986

.end # DeclareClassStatement


.sub 'optimize' :method
# Body
# {
.annotate 'line', 8989
    .return(self)
# }
.annotate 'line', 8990

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Empty body

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'DeclareClassStatement' ]
.annotate 'line', 8981
    get_class $P1, [ 'ClassBase' ]
    addparent $P0, $P1
.end
.namespace [ ]

.sub 'parseClass' :subid('WSubId_108')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 8998
# var name: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 8999
# var t: $P2
    $P2 = __ARG_2.'get'()
.annotate 'line', 9000
    $I1 = $P2.'isop'(';')
    if $I1 goto __label_3
    $I1 = $P2.'isop'('.')
  __label_3:
    unless $I1 goto __label_1
# {
# for loop
  __label_6: # for condition
.annotate 'line', 9001
    $P3 = $P2.'isop'('.')
    if_null $P3, __label_5
    unless $P3 goto __label_5
# {
.annotate 'line', 9002
# predefined string
    set $S1, $P1
    __ARG_3 = __ARG_3.'declarenamespace'($P1, $S1)
.annotate 'line', 9003
    $P1 = __ARG_2.'get'()
# }
  __label_4: # for iteration
.annotate 'line', 9001
    $P2 = __ARG_2.'get'()
    goto __label_6
  __label_5: # for end
.const 'Sub' $P4 = 'WSubId_4'
.annotate 'line', 9005
    $P4(';', $P2)
.annotate 'line', 9006
    new $P5, [ 'DeclareClassStatement' ]
    $P5.'DeclareClassStatement'(__ARG_1, $P1, __ARG_3)
    set $P3, $P5
    __ARG_3.'declareclass'($P3)
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9009
    __ARG_2.'unget'($P2)
.annotate 'line', 9010
    new $P5, [ 'ClassStatement' ]
    $P5.'ClassStatement'(__ARG_1, $P1, __ARG_3, __ARG_2)
    set $P3, $P5
    __ARG_3.'addclass'($P3)
# }
  __label_2: # endif
# }
.annotate 'line', 9012

.end # parseClass


.sub 'include_parrot' :subid('WSubId_110')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9020
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9021
    $P7 = $P1.'isstring'()
    isfalse $I4, $P7
    unless $I4 goto __label_1
.const 'Sub' $P8 = 'WSubId_40'
.annotate 'line', 9022
    $P8('literal string', $P1)
  __label_1: # endif
.const 'Sub' $P9 = 'WSubId_54'
.annotate 'line', 9023
    $P9(';', __ARG_2)
.annotate 'line', 9024
# filename: $S1
    $P7 = $P1.'rawstring'()
    null $S1
    if_null $P7, __label_2
    set $S1, $P7
  __label_2:
.annotate 'line', 9025
# var interp: $P2
# predefined getinterp
    getinterp $P2
# Constant IGLOBALS_LIB_PATHS evaluated at compile time
# Constant PARROT_LIB_PATH_INCLUDE evaluated at compile time
.annotate 'line', 9030
# var libpaths: $P3
    $P3 = $P2[9]
.annotate 'line', 9031
# var paths: $P4
    $P4 = $P3[0]
.annotate 'line', 9032
# var file: $P5
    new $P5, [ 'FileHandle' ]
.annotate 'line', 9033
    iter $P10, $P4
    set $P10, 0
  __label_3: # for iteration
    unless $P10 goto __label_4
    shift $S2, $P10
# {
.annotate 'line', 9034
# filepath: $S3
    concat $S3, $S2, $S1
.annotate 'line', 9035
# try: create handler
    new $P7, 'ExceptionHandler'
    set_label $P7, __label_5
    push_eh $P7
# try: begin
# {
.annotate 'line', 9036
    $P5.'open'($S3, 'r')
    goto __label_4 # break
.annotate 'line', 9037
# }
# try: end
    pop_eh
    goto __label_6
.annotate 'line', 9035
# catch
  __label_5:
    .get_results($P11)
    finalize $P11
    pop_eh
# catch end
  __label_6:
# }
    goto __label_3
  __label_4: # endfor
.annotate 'line', 9042
    $P7 = $P5.'is_closed'()
    if_null $P7, __label_7
    unless $P7 goto __label_7
.const 'Sub' $P12 = 'WSubId_1'
.annotate 'line', 9043
    $P12('File not found', $P1)
  __label_7: # endif
# Constant MACRO_CONST evaluated at compile time
# for loop
.annotate 'line', 9048
# line: $S4
    $P7 = $P5.'readline'()
    null $S4
    if_null $P7, __label_11
    set $S4, $P7
  __label_11:
  __label_10: # for condition
    $P11 = $P5.'eof'()
    isfalse $I4, $P11
    unless $I4 goto __label_9
# {
.annotate 'line', 9049
# predefined substr
    substr $S8, $S4, 0, 12
    ne $S8, '.macro_const', __label_12
# {
.annotate 'line', 9050
# pos: $I1
    set $I1, 12
.annotate 'line', 9051
# c: $S5
    null $S5
  __label_14: # while
.annotate 'line', 9052
# predefined substr
    substr $S5, $S4, $I1, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_15
    iseq $I4, $S5, "\t"
  __label_15:
    unless $I4 goto __label_13
.annotate 'line', 9053
    inc $I1
    goto __label_14
  __label_13: # endwhile
.annotate 'line', 9054
# pos2: $I2
    set $I2, $I1
  __label_17: # while
.annotate 'line', 9055
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_21
    isne $I4, $S5, "\t"
  __label_21:
    unless $I4 goto __label_20
.annotate 'line', 9056
    isne $I4, $S5, "\n"
  __label_20:
    unless $I4 goto __label_19
    isne $I4, $S5, "\r"
  __label_19:
    unless $I4 goto __label_18
    isne $I4, $S5, ""
  __label_18:
    unless $I4 goto __label_16
.annotate 'line', 9057
    inc $I2
    goto __label_17
  __label_16: # endwhile
.annotate 'line', 9058
    ne $I2, $I1, __label_22
    goto __label_8 # continue
  __label_22: # endif
.annotate 'line', 9060
# name: $S6
    sub $I4, $I2, $I1
# predefined substr
    substr $S6, $S4, $I1, $I4
  __label_24: # while
.annotate 'line', 9061
# predefined substr
    substr $S5, $S4, $I2, 1
    iseq $I4, $S5, " "
    if $I4 goto __label_25
    iseq $I4, $S5, "\t"
  __label_25:
    unless $I4 goto __label_23
.annotate 'line', 9062
    inc $I2
    goto __label_24
  __label_23: # endwhile
.annotate 'line', 9063
    set $I1, $I2
  __label_27: # while
.annotate 'line', 9064
# predefined substr
    substr $S5, $S4, $I2, 1
    isne $I4, $S5, " "
    unless $I4 goto __label_31
    isne $I4, $S5, "\t"
  __label_31:
    unless $I4 goto __label_30
.annotate 'line', 9065
    isne $I4, $S5, "\n"
  __label_30:
    unless $I4 goto __label_29
    isne $I4, $S5, "\r"
  __label_29:
    unless $I4 goto __label_28
    isne $I4, $S5, ""
  __label_28:
    unless $I4 goto __label_26
.annotate 'line', 9066
    inc $I2
    goto __label_27
  __label_26: # endwhile
.annotate 'line', 9067
    ne $I2, $I1, __label_32
    goto __label_8 # continue
  __label_32: # endif
.annotate 'line', 9069
# value: $S7
    sub $I4, $I2, $I1
# predefined substr
    substr $S7, $S4, $I1, $I4
.annotate 'line', 9071
# ivalue: $I3
    null $I3
.annotate 'line', 9072
# predefined substr
    substr $S8, $S7, 0, 2
    iseq $I4, $S8, '0x'
    if $I4 goto __label_35
# predefined substr
    substr $S9, $S7, 0, 2
    iseq $I4, $S9, '0X'
  __label_35:
    unless $I4 goto __label_33
.annotate 'line', 9073
# predefined substr
    substr $S10, $S7, 2
    box $P11, $S10
    $P7 = $P11.'to_int'(16)
    set $I3, $P7
    goto __label_34
  __label_33: # else
.annotate 'line', 9075
    set $I3, $S7
  __label_34: # endif
.annotate 'line', 9076
# var cst: $P6
    $P6 = __ARG_3.'createconst'($S6, 'I', 4)
.annotate 'line', 9077
.const 'Sub' $P13 = 'WSubId_21'
.annotate 'line', 9078
    new $P14, [ 'TokenInteger' ]
    getattribute $P15, __ARG_1, 'file'
    getattribute $P16, __ARG_1, 'line'
    $P14.'TokenInteger'($P15, $P16, $S6)
    set $P11, $P14
.annotate 'line', 9077
    $P7 = $P13(__ARG_3, $P11, $I3)
    $P6.'setvalue'($P7)
# }
  __label_12: # endif
# }
  __label_8: # for iteration
.annotate 'line', 9048
    $P7 = $P5.'readline'()
    set $S4, $P7
    goto __label_10
  __label_9: # for end
.annotate 'line', 9082
    $P5.'close'()
# }
.annotate 'line', 9083

.end # include_parrot


.sub 'parsensUsing' :subid('WSubId_109')
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9089
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9090
    $P8 = $P1.'iskeyword'('namespace')
    if_null $P8, __label_1
    unless $P8 goto __label_1
# {
.annotate 'line', 9091
# var nskey: $P2
.const 'Sub' $P9 = 'WSubId_55'
    $P2 = $P9(__ARG_2)
.annotate 'line', 9092
# nelems: $I1
# predefined elements
    elements $I1, $P2
.annotate 'line', 9093
    ge $I1, 1, __label_2
.const 'Sub' $P10 = 'WSubId_1'
.annotate 'line', 9094
    $P10('Unsupported', $P1)
  __label_2: # endif
.const 'Sub' $P11 = 'WSubId_54'
.annotate 'line', 9095
    $P11(';', __ARG_2)
.annotate 'line', 9096
# var nssym: $P3
    $P3 = __ARG_3.'findns'($P2)
.annotate 'line', 9097
    unless_null $P3, __label_3
.const 'Sub' $P12 = 'WSubId_1'
.annotate 'line', 9098
    $P12('unknown namespace', $P1)
  __label_3: # endif
.annotate 'line', 9099
    __ARG_3.'usenamespace'($P3)
.annotate 'line', 9100
    .return()
# }
  __label_1: # endif
.annotate 'line', 9102
    $P8 = $P1.'iskeyword'('extern')
    isfalse $I3, $P8
    unless $I3 goto __label_4
# {
.annotate 'line', 9103
    __ARG_2.'unget'($P1)
.annotate 'line', 9104
# var key: $P4
.const 'Sub' $P13 = 'WSubId_55'
    $P4 = $P13(__ARG_2)
.annotate 'line', 9105
# nelems: $I2
# predefined elements
    elements $I2, $P4
.annotate 'line', 9106
    ge $I2, 1, __label_5
.const 'Sub' $P14 = 'WSubId_1'
.annotate 'line', 9107
    $P14('Unsupported at namespace level', $P1)
  __label_5: # endif
.const 'Sub' $P15 = 'WSubId_54'
.annotate 'line', 9108
    $P15(';', __ARG_2)
.annotate 'line', 9109
    __ARG_3.'use'($P4)
.annotate 'line', 9110
    .return()
# }
  __label_4: # endif
.annotate 'line', 9112
    $P1 = __ARG_2.'get'()
# switch-case
.annotate 'line', 9114
    $I3 = $P1.'isstring'()
    if $I3 goto __label_8
.annotate 'line', 9120
    $I3 = $P1.'isidentifier'()
    if $I3 goto __label_9
    goto __label_7
  __label_8: # case
.annotate 'line', 9116
# reqlib: $S1
    set $P8, $P1
    null $S1
    if_null $P8, __label_10
    set $S1, $P8
  __label_10:
.annotate 'line', 9117
    __ARG_3.'addlib'($S1)
.const 'Sub' $P16 = 'WSubId_54'
.annotate 'line', 9118
    $P16(';', __ARG_2)
    goto __label_6 # break
  __label_9: # case
.annotate 'line', 9121
    __ARG_2.'unget'($P1)
.annotate 'line', 9122
# var module: $P5
.const 'Sub' $P17 = 'WSubId_55'
    $P5 = $P17(__ARG_2)
.annotate 'line', 9123
    $P1 = __ARG_2.'get'()
.annotate 'line', 9124
    $P18 = $P1.'isop'(';')
    isfalse $I4, $P18
    unless $I4 goto __label_11
# {
.annotate 'line', 9125
    __ARG_2.'unget'($P1)
.const 'Sub' $P7 = "WSubId_57"
.annotate 'line', 9127
# var names: $P6
.const 'Sub' $P19 = 'WSubId_36'
    null $P8
    $P6 = $P19(__ARG_2, $P8, $P7, ';')
.annotate 'line', 9128
    __ARG_3.'addextern'($P5, $P6)
# }
  __label_11: # endif
.annotate 'line', 9130
# reqmodule: $S2
# predefined join
    join $S3, '/', $P5
    concat $S2, '"', $S3
    concat $S2, $S2, '.pbc"'
.annotate 'line', 9131
    __ARG_3.'addload'($S2)
    goto __label_6 # break
  __label_7: # default
.annotate 'line', 9132
.const 'Sub' $P20 = 'WSubId_40'
.annotate 'line', 9134
    $P20('string literal or identifier', $P1)
  __label_6: # switch end
# }
.annotate 'line', 9136

.end # parsensUsing

.namespace [ 'External' ]

.sub 'External' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9146
    setattribute self, 'module', __ARG_1
.annotate 'line', 9147
    setattribute self, 'names', __ARG_2
# }
.annotate 'line', 9148

.end # External


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9153
    __ARG_1.'say'(".sub 'importextern' :anon :load :init\n    .local pmc ex, curns, srcns, symbols\n    ex = new ['Exporter']\n    curns = get_namespace\n    symbols = new ['ResizableStringArray']\n")
.annotate 'line', 9161
    __ARG_1.'print'("    srcns = get_root_namespace ['parrot'; '")
.annotate 'line', 9162
    getattribute $P1, self, 'module'
# predefined join
    join $S2, "'; '", $P1
    __ARG_1.'print'($S2)
.annotate 'line', 9163
    __ARG_1.'say'("']")
.annotate 'line', 9164
    getattribute $P1, self, 'names'
    iter $P2, $P1
    set $P2, 0
  __label_1: # for iteration
    unless $P2 goto __label_2
    shift $S1, $P2
.annotate 'line', 9165
    __ARG_1.'say'("    push symbols, '", $S1, "'")
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9166
    __ARG_1.'say'("    ex.'destination'(curns)\n    ex.'import'(srcns :named('source'), curns :named('destination'), symbols :named('globals'))\n.end\n")
# }
.annotate 'line', 9172

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'External' ]
.annotate 'line', 9142
    addattribute $P0, 'module'
.annotate 'line', 9143
    addattribute $P0, 'names'
.end
.namespace [ 'NamespaceBase' ]

.sub 'NamespaceBase' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9191
    setattribute self, 'nspath', __ARG_1
.annotate 'line', 9192
    unless_null __ARG_2, __label_1
# {
.annotate 'line', 9193
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'namespaces', $P2
.annotate 'line', 9194
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9195
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'classes', $P2
.annotate 'line', 9196
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'functions', $P2
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9199
    getattribute $P2, __ARG_2, 'locals'
    setattribute self, 'locals', $P2
.annotate 'line', 9200
    getattribute $P2, __ARG_2, 'namespaces'
    setattribute self, 'namespaces', $P2
.annotate 'line', 9201
    getattribute $P2, __ARG_2, 'usednamespaces'
    setattribute self, 'usednamespaces', $P2
.annotate 'line', 9202
    getattribute $P2, __ARG_2, 'classes'
    setattribute self, 'classes', $P2
.annotate 'line', 9203
    getattribute $P2, __ARG_2, 'functions'
    setattribute self, 'functions', $P2
# }
  __label_2: # endif
.annotate 'line', 9205
    root_new $P2, ['parrot';'ResizablePMCArray']
    setattribute self, 'items', $P2
# }
.annotate 'line', 9206

.end # NamespaceBase


.sub 'fixnamespaces' :method
# Body
# {
.annotate 'line', 9209
# var ns: $P1
    null $P1
.annotate 'line', 9210
    getattribute $P3, self, 'namespaces'
    iter $P4, $P3
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P1, $P4
.annotate 'line', 9211
    $P1.'fixnamespaces'()
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9212
    getattribute $P3, self, 'usednamespaces'
    iter $P5, $P3
    set $P5, 0
  __label_3: # for iteration
    unless $P5 goto __label_4
    shift $P1, $P5
.annotate 'line', 9213
    getattribute $P6, $P1, 'usednamespaces'
    iter $P7, $P6
    set $P7, 0
  __label_5: # for iteration
    unless $P7 goto __label_6
    shift $P2, $P7
.annotate 'line', 9214
    self.'usenamespace'($P2)
    goto __label_5
  __label_6: # endfor
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9215

.end # fixnamespaces


.sub 'getpath' :method
# Body
# {
.annotate 'line', 9218
    getattribute $P1, self, 'nspath'
    .return($P1)
# }
.annotate 'line', 9219

.end # getpath


.sub 'usenamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9222
    ne_addr __ARG_1, self, __label_1
.annotate 'line', 9223
    .return()
  __label_1: # endif
.annotate 'line', 9224
# var usednamespaces: $P1
    getattribute $P1, self, 'usednamespaces'
.annotate 'line', 9225
    iter $P3, $P1
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P2, $P3
.annotate 'line', 9226
    ne_addr $P2, __ARG_1, __label_4
.annotate 'line', 9227
    .return()
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9228
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9229

.end # usenamespace


.sub 'use' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9232
# var sym: $P1
    $P1 = self.'findsymbol'(__ARG_1)
.annotate 'line', 9233
    if_null $P1, __label_1
# {
.annotate 'line', 9234
    isa $I1, $P1, [ 'FunctionStatement' ]
    unless $I1 goto __label_3
.annotate 'line', 9235
    getattribute $P3, self, 'functions'
# predefined push
    push $P3, $P1
  __label_3: # endif
# }
    goto __label_2
  __label_1: # else
# {
.annotate 'line', 9238
# name: $S1
    $P3 = __ARG_1.'pop'()
    null $S1
    if_null $P3, __label_4
    set $S1, $P3
  __label_4:
.annotate 'line', 9239
# var ns: $P2
    $P2 = self.'findns'(__ARG_1)
.annotate 'line', 9240
    if_null $P2, __label_5
# {
.annotate 'line', 9241
    $P1 = $P2.'getvar'($S1)
.annotate 'line', 9242
    if_null $P1, __label_6
.annotate 'line', 9243
    self.'createvarused'($S1, $P1)
  __label_6: # endif
# }
  __label_5: # endif
# }
  __label_2: # endif
# }
.annotate 'line', 9246

.end # use


.sub 'getusedns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9249
    getattribute $P2, self, 'usednamespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9250
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9251
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
    null $P2
.annotate 'line', 9252
    .return($P2)
# }
.annotate 'line', 9253

.end # getusedns


.sub 'getlocalns' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9256
    getattribute $P2, self, 'namespaces'
    iter $P3, $P2
    set $P3, 0
  __label_1: # for iteration
    unless $P3 goto __label_2
    shift $P1, $P3
.annotate 'line', 9257
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9258
    .return($P1)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9259
    .tailcall self.'getusedns'(__ARG_1)
# }
.annotate 'line', 9260

.end # getlocalns


.sub 'addextern' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9264
# var ext: $P1
    new $P1, [ 'External' ]
    $P1.'External'(__ARG_1, __ARG_2)
.annotate 'line', 9265
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9266
    unless_null $P2, __label_1
.annotate 'line', 9267
    root_new $P4, ['parrot';'ResizablePMCArray']
    push $P4, $P1
    set $P2, $P4
    setattribute self, 'externals', $P2
    goto __label_2
  __label_1: # else
.annotate 'line', 9269
# predefined push
    push $P2, $P1
  __label_2: # endif
# }
.annotate 'line', 9270

.end # addextern


.sub 'checkclass_base' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9274
# var classes: $P1
    getattribute $P1, self, 'classes'
.annotate 'line', 9275
# var cl: $P2
    null $P2
.annotate 'line', 9276
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $P2, $P4
.annotate 'line', 9277
    getattribute $P5, $P2, 'name'
    set $S1, $P5
    ne $S1, __ARG_1, __label_3
.annotate 'line', 9278
    .return($P2)
  __label_3: # endif
    goto __label_1
  __label_2: # endfor
.annotate 'line', 9279
    getattribute $P5, self, 'usednamespaces'
    iter $P6, $P5
    set $P6, 0
  __label_4: # for iteration
    unless $P6 goto __label_5
    shift $P3, $P6
.annotate 'line', 9280
    $P2 = $P3.'checkclass_base'(__ARG_1)
    if_null $P2, __label_6
.annotate 'line', 9281
    .return($P2)
  __label_6: # endif
    goto __label_4
  __label_5: # endfor
    null $P5
.annotate 'line', 9282
    .return($P5)
# }
.annotate 'line', 9283

.end # checkclass_base


.sub 'findclasskey_base' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9288
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9289
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9291
    .return($P3)
  __label_4: # case
.annotate 'line', 9294
    sub $I4, $I1, 1
    $P4 = __ARG_1[$I4]
    .tailcall self.'checkclass_base'($P4)
  __label_2: # default
.annotate 'line', 9299
# basename: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9300
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9301
    if_null $P1, __label_5
# {
.annotate 'line', 9302
# var found: $P2
    add $I5, __ARG_2, 1
    $P2 = $P1.'findclasskey'(__ARG_1, $I5)
.annotate 'line', 9303
    if_null $P2, __label_6
.annotate 'line', 9304
    .return($P2)
  __label_6: # endif
# }
  __label_5: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9307
    .return($P3)
# }
.annotate 'line', 9308

.end # findclasskey_base


.sub 'findsymbolbyname' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9311
# var sym: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9312
    if_null $P1, __label_1
.annotate 'line', 9313
    .return($P1)
  __label_1: # endif
.annotate 'line', 9314
    getattribute $P2, self, 'functions'
    iter $P3, $P2
    set $P3, 0
  __label_2: # for iteration
    unless $P3 goto __label_3
    shift $P1, $P3
.annotate 'line', 9315
    getattribute $P4, $P1, 'name'
    set $S1, $P4
    ne $S1, __ARG_1, __label_4
.annotate 'line', 9316
    .return($P1)
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
    null $P2
.annotate 'line', 9317
    .return($P2)
# }
.annotate 'line', 9318

.end # findsymbolbyname


.sub 'findlocalsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9323
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
.annotate 'line', 9324
# name: $S1
    null $S1
.annotate 'line', 9325
# var sym: $P1
    null $P1
.annotate 'line', 9326
# var ns: $P2
    null $P2
# switch
.annotate 'line', 9327
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    set $I3, 1
    if $I2 == $I3 goto __label_4
    goto __label_2
  __label_3: # case
    null $P3
.annotate 'line', 9329
    .return($P3)
  __label_4: # case
.annotate 'line', 9331
    sub $I4, $I1, 1
    $S1 = __ARG_1[$I4]
.annotate 'line', 9333
    $P1 = self.'findsymbolbyname'($S1)
    if_null $P1, __label_5
.annotate 'line', 9334
    .return($P1)
  __label_5: # endif
.annotate 'line', 9335
    getattribute $P4, self, 'usednamespaces'
    iter $P5, $P4
    set $P5, 0
  __label_6: # for iteration
    unless $P5 goto __label_7
    shift $P2, $P5
.annotate 'line', 9336
    $P1 = $P2.'findsymbolbyname'($S1)
    if_null $P1, __label_8
.annotate 'line', 9337
    .return($P1)
  __label_8: # endif
    goto __label_6
  __label_7: # endfor
    goto __label_1 # break
  __label_2: # default
.annotate 'line', 9343
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9344
    $P2 = self.'getlocalns'($S1)
.annotate 'line', 9345
    isnull $I5, $P2
    not $I5
    unless $I5 goto __label_10
.annotate 'line', 9346
    add $I6, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I6)
    isnull $I5, $P1
    not $I5
  __label_10:
    unless $I5 goto __label_9
.annotate 'line', 9347
    .return($P1)
  __label_9: # endif
.annotate 'line', 9348
    $P2 = self.'getusedns'($S1)
.annotate 'line', 9349
    isnull $I7, $P2
    not $I7
    unless $I7 goto __label_12
.annotate 'line', 9350
    add $I8, __ARG_2, 1
    $P1 = $P2.'findlocalsymbol'(__ARG_1, $I8)
    isnull $I7, $P1
    not $I7
  __label_12:
    unless $I7 goto __label_11
.annotate 'line', 9351
    .return($P1)
  __label_11: # endif
  __label_1: # switch end
    null $P3
.annotate 'line', 9353
    .return($P3)
# }
.annotate 'line', 9354

.end # findlocalsymbol


.sub 'findlocalns' :method
        .param pmc __ARG_1
        .param int __ARG_2
# Body
# {
.annotate 'line', 9357
# nelems: $I1
# predefined elements
    elements $I1, __ARG_1
# switch
.annotate 'line', 9358
    sub $I2, $I1, __ARG_2
    null $I3
    if $I2 == $I3 goto __label_3
    goto __label_2
  __label_3: # case
    null $P2
.annotate 'line', 9360
    .return($P2)
  __label_2: # default
.annotate 'line', 9362
# name: $S1
    $S1 = __ARG_1[__ARG_2]
.annotate 'line', 9363
# var ns: $P1
    $P1 = self.'getlocalns'($S1)
.annotate 'line', 9364
    if_null $P1, __label_4
# {
.annotate 'line', 9365
    sub $I4, $I1, __ARG_2
    ne $I4, 1, __label_5
.annotate 'line', 9366
    .return($P1)
    goto __label_6
  __label_5: # else
.annotate 'line', 9368
    add $I5, __ARG_2, 1
    .tailcall $P1.'findlocalns'(__ARG_1, $I5)
  __label_6: # endif
# }
  __label_4: # endif
  __label_1: # switch end
    null $P2
.annotate 'line', 9371
    .return($P2)
# }
.annotate 'line', 9372

.end # findlocalns


.sub 'declarenamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
# Body
# {
.annotate 'line', 9375
# var child: $P1
    new $P1, [ 'NamespaceStatement' ]
    null $P2
    $P1.'NamespaceStatement'(self, __ARG_1, $P2, __ARG_2, $P2)
.annotate 'line', 9376
    getattribute $P2, self, 'namespaces'
# predefined push
    push $P2, $P1
.annotate 'line', 9377
    .return($P1)
# }
.annotate 'line', 9378

.end # declarenamespace


.sub 'childnamespace' :method
        .param pmc __ARG_1
        .param string __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9381
# var existns: $P1
    $P1 = self.'getlocalns'(__ARG_2)
.annotate 'line', 9382
# var child: $P2
    new $P2, [ 'NamespaceStatement' ]
    $P2.'NamespaceStatement'(self, __ARG_1, $P1, __ARG_2, __ARG_3)
.annotate 'line', 9383
    getattribute $P3, self, 'namespaces'
# predefined push
    push $P3, $P2
.annotate 'line', 9384
    getattribute $P3, self, 'items'
# predefined push
    push $P3, $P2
.annotate 'line', 9385
    .return($P2)
# }
.annotate 'line', 9386

.end # childnamespace


.sub 'declareclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9389
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9390

.end # declareclass


.sub 'addclass' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9393
    getattribute $P1, self, 'classes'
# predefined push
    push $P1, __ARG_1
.annotate 'line', 9394
    getattribute $P1, self, 'items'
# predefined push
    push $P1, __ARG_1
# }
.annotate 'line', 9395

.end # addclass


.sub 'parsenamespace' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
# Body
# {
.annotate 'line', 9398
# var t: $P1
    $P1 = __ARG_2.'get'()
.annotate 'line', 9399
# name: $S1
    set $P4, $P1
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9400
    $P1 = __ARG_2.'get'()
.annotate 'line', 9402
# var modifier: $P2
    null $P2
.annotate 'line', 9403
    $P4 = $P1.'isop'('[')
    if_null $P4, __label_2
    unless $P4 goto __label_2
# {
.annotate 'line', 9404
    new $P5, [ 'ModifierList' ]
    $P5.'ModifierList'(__ARG_2, self)
    set $P2, $P5
.annotate 'line', 9405
    $P1 = __ARG_2.'get'()
# }
  __label_2: # endif
.const 'Sub' $P6 = 'WSubId_4'
.annotate 'line', 9408
    $P6('{', $P1)
.annotate 'line', 9409
# var child: $P3
    $P3 = self.'childnamespace'(__ARG_1, $S1, $P2)
.annotate 'line', 9410
    $P3.'parse'(__ARG_2)
# }
.annotate 'line', 9411

.end # parsenamespace


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9414
# var items: $P1
    getattribute $P1, self, 'items'
.annotate 'line', 9415
# var functions: $P2
    getattribute $P2, self, 'functions'
.annotate 'line', 9416
# var classes: $P3
    getattribute $P3, self, 'classes'
.annotate 'line', 9417
# var t: $P4
    null $P4
# for loop
.annotate 'line', 9418
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
.annotate 'line', 9420
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
.annotate 'line', 9422
    self.'parsenamespace'($P4, __ARG_1)
    goto __label_5 # break
  __label_8: # case
.annotate 'line', 9425
# var cst: $P5
.const 'Sub' $P9 = 'WSubId_44'
    $P5 = $P9($P4, __ARG_1, self)
.annotate 'line', 9426
# predefined push
    push $P1, $P5
    goto __label_5 # break
  __label_9: # case
.annotate 'line', 9429
# var f: $P6
    new $P6, [ 'FunctionStatement' ]
    $P6.'FunctionStatement'($P4, __ARG_1, self)
.annotate 'line', 9430
# predefined push
    push $P2, $P6
.annotate 'line', 9431
# predefined push
    push $P1, $P6
    goto __label_5 # break
  __label_10: # case
.annotate 'line', 9432
.const 'Sub' $P10 = 'WSubId_108'
.annotate 'line', 9434
    $P10($P4, __ARG_1, self)
    goto __label_5 # break
  __label_11: # case
.annotate 'line', 9435
.const 'Sub' $P11 = 'WSubId_109'
.annotate 'line', 9437
    $P11($P4, __ARG_1, self)
    goto __label_5 # break
  __label_12: # case
.annotate 'line', 9438
.const 'Sub' $P12 = 'WSubId_110'
.annotate 'line', 9440
    $P12($P4, __ARG_1, self)
    goto __label_5 # break
  __label_13: # case
.annotate 'line', 9443
    $P4 = __ARG_1.'get'()
.annotate 'line', 9444
    $P13 = $P4.'isstring'()
    isfalse $I2, $P13
    unless $I2 goto __label_15
.const 'Sub' $P14 = 'WSubId_40'
.annotate 'line', 9445
    $P14('string literal', $P4)
  __label_15: # endif
.const 'Sub' $P15 = 'WSubId_54'
.annotate 'line', 9446
    $P15(';', __ARG_1)
.annotate 'line', 9447
    new $P18, [ 'StringLiteral' ]
    $P18.'StringLiteral'(self, $P4)
    set $P17, $P18
    $P16 = $P17.'getPirString'()
    self.'addload'($P16)
    goto __label_5 # break
  __label_14: # case
.annotate 'line', 9450
    $P4 = __ARG_1.'get'()
.annotate 'line', 9451
    $P19 = $P4.'isstring'()
    isfalse $I3, $P19
    unless $I3 goto __label_16
.const 'Sub' $P20 = 'WSubId_40'
.annotate 'line', 9452
    $P20('string literal', $P4)
  __label_16: # endif
.const 'Sub' $P21 = 'WSubId_54'
.annotate 'line', 9453
    $P21(';', __ARG_1)
.annotate 'line', 9454
    new $P24, [ 'StringLiteral' ]
    $P24.'StringLiteral'(self, $P4)
    set $P23, $P24
    $P22 = $P23.'getPirString'()
    self.'addlib'($P22)
    goto __label_5 # break
  __label_6: # default
.annotate 'line', 9455
.const 'Sub' $P25 = 'WSubId_41'
.annotate 'line', 9457
    $P25("token", $P4)
  __label_5: # switch end
# }
  __label_1: # for iteration
.annotate 'line', 9418
    $P4 = __ARG_1.'get'()
    goto __label_3
  __label_2: # for end
.annotate 'line', 9460
    if_null $P4, __label_17
    unless $P4 goto __label_17
.annotate 'line', 9461
    self.'close_ns'($P4)
    goto __label_18
  __label_17: # else
.annotate 'line', 9463
    self.'unclosed_ns'()
  __label_18: # endif
# }
.annotate 'line', 9464

.end # parse


.sub 'optimize_base' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_38'
.annotate 'line', 9467
    getattribute $P2, self, 'items'
    $P1($P2)
# }
.annotate 'line', 9468

.end # optimize_base


.sub 'emit_base' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9471
# var path: $P1
    $P1 = self.'getpath'()
.annotate 'line', 9472
# s: $S1
.const 'Sub' $P5 = 'WSubId_107'
    $P4 = $P5($P1)
    null $S1
    if_null $P4, __label_1
    set $S1, $P4
  __label_1:
.annotate 'line', 9474
# activate: $I1
    set $I1, 1
.annotate 'line', 9476
# var externals: $P2
    getattribute $P2, self, 'externals'
.annotate 'line', 9477
    if_null $P2, __label_2
# {
.annotate 'line', 9478
    __ARG_1.'say'($S1)
.annotate 'line', 9479
    null $I1
.const 'Sub' $P6 = 'WSubId_52'
.annotate 'line', 9480
    $P6(__ARG_1, $P2)
# }
  __label_2: # endif
.annotate 'line', 9483
    getattribute $P4, self, 'items'
    iter $P7, $P4
    set $P7, 0
  __label_3: # for iteration
    unless $P7 goto __label_4
    shift $P3, $P7
# {
.annotate 'line', 9484
    isa $I2, $P3, [ 'NamespaceStatement' ]
    if $I2 goto __label_7
.annotate 'line', 9485
    isa $I2, $P3, [ 'ClassStatement' ]
  __label_7:
    unless $I2 goto __label_5
.annotate 'line', 9486
    set $I1, 1
    goto __label_6
  __label_5: # else
.annotate 'line', 9488
    unless $I1 goto __label_8
# {
.annotate 'line', 9489
    __ARG_1.'say'($S1)
.annotate 'line', 9490
    null $I1
# }
  __label_8: # endif
  __label_6: # endif
.annotate 'line', 9492
    $P3.'emit'(__ARG_1)
# }
    goto __label_3
  __label_4: # endfor
# }
.annotate 'line', 9494

.end # emit_base

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceBase' ]
.annotate 'line', 9179
    get_class $P1, [ 'VarContainer' ]
    addparent $P0, $P1
.annotate 'line', 9181
    addattribute $P0, 'nspath'
.annotate 'line', 9182
    addattribute $P0, 'externals'
.annotate 'line', 9183
    addattribute $P0, 'namespaces'
.annotate 'line', 9184
    addattribute $P0, 'classes'
.annotate 'line', 9185
    addattribute $P0, 'functions'
.annotate 'line', 9186
    addattribute $P0, 'items'
.annotate 'line', 9187
    addattribute $P0, 'owner'
.end
.namespace [ 'NamespaceStatement' ]

.sub 'NamespaceStatement' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
        .param string __ARG_4
        .param pmc __ARG_5
# Body
# {
.annotate 'line', 9512
# var nspath: $P1
    $P2 = __ARG_1.'getpath'()
# predefined clone
    clone $P1, $P2
.annotate 'line', 9513
# predefined push
    push $P1, __ARG_4
.annotate 'line', 9514
    self.'NamespaceBase'($P1, __ARG_3)
.annotate 'line', 9516
    setattribute self, 'parent', __ARG_1
.annotate 'line', 9517
    setattribute self, 'start', __ARG_2
.annotate 'line', 9518
    setattribute self, 'owner', __ARG_1
.annotate 'line', 9519
    box $P2, __ARG_4
    setattribute self, 'name', $P2
.annotate 'line', 9520
    setattribute self, 'modifier', __ARG_5
.annotate 'line', 9521
    if_null __ARG_5, __label_1
# {
.annotate 'line', 9522
    $P2 = __ARG_5.'pick'('HLL')
    if_null $P2, __label_2
.annotate 'line', 9523
    getattribute $P4, self, 'name'
    setattribute self, 'hll', $P4
  __label_2: # endif
# }
  __label_1: # endif
# }
.annotate 'line', 9525

.end # NamespaceStatement


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9528
    getattribute $P1, self, 'parent'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9529

.end # dowarnings


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9532
    getattribute $P1, self, 'owner'
    .tailcall $P1.'generatesubid'()
# }
.annotate 'line', 9533

.end # generatesubid


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9536
    getattribute $P1, self, 'owner'
    $P1.'use_predef'(__ARG_1)
# }
.annotate 'line', 9537

.end # use_predef


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9540
    getattribute $P1, self, 'parent'
    $P1.'addlib'(__ARG_1)
# }
.annotate 'line', 9541

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9544
    getattribute $P1, self, 'parent'
    $P1.'addload'(__ARG_1)
# }
.annotate 'line', 9545

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9548
# var cl: $P1
    $P1 = self.'checkclass_base'(__ARG_1)
.annotate 'line', 9549
    unless_null $P1, __label_1
.annotate 'line', 9550
    getattribute $P2, self, 'parent'
    .tailcall $P2.'checkclass'(__ARG_1)
  __label_1: # endif
.annotate 'line', 9551
    .return($P1)
# }
.annotate 'line', 9552

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9557
# var cl: $P1
    $P1 = self.'findclasskey_base'(__ARG_1, __ARG_2)
.annotate 'line', 9558
    isnull $I1, $P1
    unless $I1 goto __label_2
    iseq $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9559
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findclasskey'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9560
    .return($P1)
# }
.annotate 'line', 9561

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9564
# var sym: $P1
    $P1 = self.'findlocalsymbol'(__ARG_1, __ARG_2)
.annotate 'line', 9565
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9566
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findsymbol'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9567
    .return($P1)
# }
.annotate 'line', 9568

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9571
# var ns: $P1
    $P1 = self.'findlocalns'(__ARG_1, __ARG_2)
.annotate 'line', 9572
    isnull $I1, $P1
    unless $I1 goto __label_2
    isle $I1, __ARG_2, 0
  __label_2:
    unless $I1 goto __label_1
.annotate 'line', 9573
    getattribute $P2, self, 'parent'
    .tailcall $P2.'findns'(__ARG_1, __ARG_2)
  __label_1: # endif
.annotate 'line', 9574
    .return($P1)
# }
.annotate 'line', 9575

.end # findns


.sub 'unclosed_ns' :method
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 9578
    getattribute $P2, self, 'start'
    $P1('unclosed namespace', $P2)
# }
.annotate 'line', 9579

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Empty body

.end # close_ns


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9586
# var modifier: $P1
    getattribute $P1, self, 'modifier'
.annotate 'line', 9587
    if_null $P1, __label_1
.annotate 'line', 9588
    $P3 = $P1.'optimize'()
    setattribute self, 'modifier', $P3
  __label_1: # endif
.annotate 'line', 9589
    self.'optimize_base'()
.annotate 'line', 9590
    .return(self)
# }
.annotate 'line', 9591

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9594
# var hll: $P1
    getattribute $P1, self, 'hll'
.annotate 'line', 9595
    if_null $P1, __label_1
.annotate 'line', 9596
    __ARG_1.'say'(".HLL '", $P1, "'")
  __label_1: # endif
.annotate 'line', 9598
    self.'emit_base'(__ARG_1)
.annotate 'line', 9600
    if_null $P1, __label_2
.annotate 'line', 9601
    __ARG_1.'say'(".HLL 'parrot'")
  __label_2: # endif
# }
.annotate 'line', 9602

.end # emit

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'NamespaceStatement' ]
.annotate 'line', 9501
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9503
    addattribute $P0, 'parent'
.annotate 'line', 9504
    addattribute $P0, 'start'
.annotate 'line', 9505
    addattribute $P0, 'name'
.annotate 'line', 9506
    addattribute $P0, 'modifier'
.annotate 'line', 9507
    addattribute $P0, 'hll'
.end
.namespace [ 'RootNamespace' ]

.sub 'RootNamespace' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9619
    new $P1, ['ResizableStringArray']
.annotate 'line', 9620
    null $P2
    self.'NamespaceBase'($P1, $P2)
.annotate 'line', 9621
    setattribute self, 'unit', __ARG_1
.annotate 'line', 9622
    root_new $P3, ['parrot';'Hash']
    setattribute self, 'predefs_used', $P3
.annotate 'line', 9623
    box $P2, 0
    setattribute self, 'subidgen', $P2
# }
.annotate 'line', 9624

.end # RootNamespace


.sub 'use_predef' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9627
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9628
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9629

.end # use_predef


.sub 'predef_is_used' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9632
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9633
    $P2 = $P1[__ARG_1]
    unless_null $P2, __label_2
    null $I1
    goto __label_1
  __label_2:
    set $I1, 1
  __label_1:
    .return($I1)
# }
.annotate 'line', 9634

.end # predef_is_used


.sub 'generatesubid' :method
# Body
# {
.annotate 'line', 9638
# idgen: $I1
    getattribute $P2, self, 'subidgen'
    inc $P2
    set $P1, $P2
    set $I1, $P1
# predefined string
.annotate 'line', 9637
    set $S1, $I1
.annotate 'line', 9639
    concat $S2, 'WSubId_', $S1
    .return($S2)
# }
.annotate 'line', 9640

.end # generatesubid


.sub 'addlib' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9644
# var libs: $P1
    getattribute $P1, self, 'libs'
.annotate 'line', 9645
    unless_null $P1, __label_1
.annotate 'line', 9646
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'libs', $P1
  __label_1: # endif
.annotate 'line', 9647
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9648

.end # addlib


.sub 'addload' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9651
# var loads: $P1
    getattribute $P1, self, 'loads'
.annotate 'line', 9652
    unless_null $P1, __label_1
.annotate 'line', 9653
    root_new $P1, ['parrot';'Hash']
    setattribute self, 'loads', $P1
  __label_1: # endif
.annotate 'line', 9654
    $P1[__ARG_1] = 1
# }
.annotate 'line', 9655

.end # addload


.sub 'checkclass' :method
        .param string __ARG_1
# Body
# {
.annotate 'line', 9658
    .tailcall self.'checkclass_base'(__ARG_1)
# }
.annotate 'line', 9659

.end # checkclass


.sub 'findclasskey' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9663
    .tailcall self.'findclasskey_base'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9664

.end # findclasskey


.sub 'findsymbol' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9667
    .tailcall self.'findlocalsymbol'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9668

.end # findsymbol


.sub 'findns' :method
        .param pmc __ARG_1
        .param int __ARG_2 :optional
# Body
# {
.annotate 'line', 9671
    .tailcall self.'findlocalns'(__ARG_1, __ARG_2)
# }
.annotate 'line', 9672

.end # findns


.sub 'unclosed_ns' :method
# Empty body

.end # unclosed_ns


.sub 'close_ns' :method
        .param pmc __ARG_1
# Body
# {
.const 'Sub' $P1 = 'WSubId_1'
.annotate 'line', 9679
    $P1('Cannot close root namespace', __ARG_1)
# }
.annotate 'line', 9680

.end # close_ns


.sub 'dowarnings' :method
# Body
# {
.annotate 'line', 9683
    getattribute $P1, self, 'unit'
    .tailcall $P1.'dowarnings'()
# }
.annotate 'line', 9684

.end # dowarnings


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9687
    self.'optimize_base'()
.annotate 'line', 9688
    .return(self)
# }
.annotate 'line', 9689

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9692
# var predefs_used: $P1
    getattribute $P1, self, 'predefs_used'
.annotate 'line', 9695
    $P5 = $P1['chomp']
    if_null $P5, __label_1
.annotate 'line', 9696
    self.'addload'('"String/Utils.pbc"')
  __label_1: # endif
.annotate 'line', 9699
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
.annotate 'line', 9702
    iter $P6, $P2
    set $P6, 0
  __label_2: # for iteration
    unless $P6 goto __label_3
    shift $S1, $P6
.annotate 'line', 9703
    $P5 = $P1[$S1]
    if_null $P5, __label_4
# {
.annotate 'line', 9704
    self.'addlib'("'trans_ops'")
    goto __label_3 # break
.annotate 'line', 9705
# }
  __label_4: # endif
    goto __label_2
  __label_3: # endfor
.annotate 'line', 9708
# somelib: $I1
    null $I1
.annotate 'line', 9709
# var libs: $P3
    getattribute $P3, self, 'libs'
.annotate 'line', 9710
    if_null $P3, __label_5
# {
.annotate 'line', 9711
    set $I1, 1
.annotate 'line', 9712
    iter $P7, $P3
    set $P7, 0
  __label_6: # for iteration
    unless $P7 goto __label_7
    shift $S2, $P7
.annotate 'line', 9713
    __ARG_1.'say'('.loadlib ', $S2)
    goto __label_6
  __label_7: # endfor
# }
  __label_5: # endif
.annotate 'line', 9716
# someload: $I2
    null $I2
.annotate 'line', 9717
# var loads: $P4
    getattribute $P4, self, 'loads'
.annotate 'line', 9718
    if_null $P4, __label_8
# {
.annotate 'line', 9719
    set $I2, 1
.annotate 'line', 9720
    __ARG_1.'print'("\n.sub initial_load_bytecode :anon :load :init\n")
.annotate 'line', 9721
    iter $P8, $P4
    set $P8, 0
  __label_9: # for iteration
    unless $P8 goto __label_10
    shift $S3, $P8
.annotate 'line', 9722
    __ARG_1.'say'('    load_bytecode ', $S3)
    goto __label_9
  __label_10: # endfor
.annotate 'line', 9723
    __ARG_1.'print'(".end\n\n")
# }
  __label_8: # endif
.annotate 'line', 9725
    or $I3, $I1, $I2
    unless $I3 goto __label_11
.annotate 'line', 9726
    __ARG_1.'comment'('end libs')
  __label_11: # endif
.annotate 'line', 9728
    self.'emit_base'(__ARG_1)
# }
.annotate 'line', 9729

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9732
# var locals: $P1
    getattribute $P1, self, 'locals'
.annotate 'line', 9733
    iter $P4, $P1
    set $P4, 0
  __label_1: # for iteration
    unless $P4 goto __label_2
    shift $S1, $P4
# {
.annotate 'line', 9734
# var data: $P2
    $P2 = $P1[$S1]
.annotate 'line', 9735
    isa $I2, $P2, [ 'VarData' ]
    not $I1, $I2
    if $I1 goto __label_5
.annotate 'line', 9736
    $P5 = $P2.'gettype'()
    set $S2, $P5
    isne $I1, $S2, 'I'
  __label_5:
    if $I1 goto __label_4
.annotate 'line', 9737
    $I3 = $P2.'getflags'()
    band $I1, $I3, 4
  __label_4:
    unless $I1 goto __label_3
    goto __label_1 # continue
  __label_3: # endif
.annotate 'line', 9739
# var value: $P3
    $P3 = $P2.'getvalue'()
.annotate 'line', 9740
    $P5 = $P3.'getIntegerValue'()
    __ARG_1.'say'('.macro_const ', $S1, ' ', $P5)
# }
    goto __label_1
  __label_2: # endfor
# }
.annotate 'line', 9742

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'RootNamespace' ]
.annotate 'line', 9609
    get_class $P1, [ 'NamespaceBase' ]
    addparent $P0, $P1
.annotate 'line', 9611
    addattribute $P0, 'unit'
.annotate 'line', 9612
    addattribute $P0, 'predefs_used'
.annotate 'line', 9613
    addattribute $P0, 'libs'
.annotate 'line', 9614
    addattribute $P0, 'loads'
.annotate 'line', 9615
    addattribute $P0, 'subidgen'
.end
.namespace [ ]
# Constant EVAL_NAME evaluated at compile time
.namespace [ 'WinxedCompileUnit' ]

.sub 'init' :method :vtable
# Body
# {
.annotate 'line', 9758
    box $P6, 1
    setattribute self, 'warnings', $P6
.annotate 'line', 9759
# var rootns: $P1
    new $P1, [ 'RootNamespace' ]
    $P1.'RootNamespace'(self)
.annotate 'line', 9762
# var taux: $P2
    new $P2, [ 'TokenIdentifier' ]
    $P2.'TokenIdentifier'('__predefconst__', 0, 'predefconst')
.annotate 'line', 9764
# var cfalse: $P3
    $P3 = $P1.'createconst'('false', 'I', 4)
.annotate 'line', 9765
.const 'Sub' $P7 = 'WSubId_21'
.annotate 'line', 9766
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9765
    $P6 = $P7($P1, $P8, 0)
    $P3.'setvalue'($P6)
.annotate 'line', 9767
# var ctrue: $P4
    $P4 = $P1.'createconst'('true', 'I', 4)
.annotate 'line', 9768
.const 'Sub' $P12 = 'WSubId_21'
.annotate 'line', 9769
    new $P9, [ 'TokenInteger' ]
    getattribute $P10, $P2, 'file'
    getattribute $P11, $P2, 'line'
    $P9.'TokenInteger'($P10, $P11, 'false')
    set $P8, $P9
.annotate 'line', 9768
    $P6 = $P12($P1, $P8, 1)
    $P4.'setvalue'($P6)
.annotate 'line', 9773
# var cstage: $P5
    $P5 = $P1.'createconst'('__STAGE__', 'S', 4)
.annotate 'line', 9774
    new $P8, [ 'StringLiteral' ]
.annotate 'line', 9775
    new $P10, [ 'TokenQuoted' ]
    getattribute $P11, $P2, 'file'
    getattribute $P13, $P2, 'line'
# predefined string
# predefined int
.annotate 'line', 9774
    set $I2, "2"
    add $I1, $I2, 1
    set $S1, $I1
    $P10.'TokenQuoted'($P11, $P13, $S1)
    set $P9, $P10
    $P8.'StringLiteral'($P1, $P9)
    set $P6, $P8
    $P5.'setvalue'($P6)
.annotate 'line', 9777
    setattribute self, 'rootns', $P1
# }
.annotate 'line', 9778

.end # init


.sub 'setwarnmode' :method
        .param int __ARG_1
# Body
# {
.annotate 'line', 9781
    getattribute $P1, self, 'warnings'
    assign $P1, __ARG_1
# }
.annotate 'line', 9782

.end # setwarnmode


.sub 'dowarnings' :method
# Body
# {
# predefined int
.annotate 'line', 9785
    getattribute $P1, self, 'warnings'
.annotate 'line', 9784
    set $I1, $P1
.annotate 'line', 9785
    .return($I1)
# }
.annotate 'line', 9786

.end # dowarnings


.sub 'parse' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9789
    getattribute $P1, self, 'rootns'
    $P1.'parse'(__ARG_1)
.annotate 'line', 9790
    getattribute $P1, self, 'rootns'
    $P1.'fixnamespaces'()
# }
.annotate 'line', 9791

.end # parse


.sub 'optimize' :method
# Body
# {
.annotate 'line', 9794
    getattribute $P3, self, 'rootns'
    $P2 = $P3.'optimize'()
    setattribute self, 'rootns', $P2
# }
.annotate 'line', 9795

.end # optimize


.sub 'emit' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9798
    __ARG_1.'comment'('THIS IS A GENERATED FILE! DO NOT EDIT!')
.annotate 'line', 9799
    __ARG_1.'comment'('Begin generated code')
.annotate 'line', 9800
    __ARG_1.'say'('')
.annotate 'line', 9802
    getattribute $P1, self, 'rootns'
    $P1.'emit'(__ARG_1)
.annotate 'line', 9804
    __ARG_1.'comment'('End generated code')
# }
.annotate 'line', 9805

.end # emit


.sub 'emitinclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9808
    __ARG_1.'comment'('DO NOT EDIT THIS FILE')
.annotate 'line', 9809
    __ARG_1.'comment'('Generated automatically from Winxed sources')
.annotate 'line', 9811
    getattribute $P1, self, 'rootns'
    $P1.'emitinclude'(__ARG_1)
.annotate 'line', 9813
    __ARG_1.'comment'('End')
# }
.annotate 'line', 9814

.end # emitinclude

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedCompileUnit' ]
.annotate 'line', 9753
    addattribute $P0, 'rootns'
.annotate 'line', 9754
    addattribute $P0, 'warnings'
.end
.namespace [ 'WinxedHLL' ]

.sub '__private_compile_tail' :method
        .param pmc __ARG_1
        .param pmc __ARG_2
        .param pmc __ARG_3
# Body
# {
.annotate 'line', 9823
    set $S2, __ARG_2
    ne $S2, 'parse', __label_1
.annotate 'line', 9824
    .return(__ARG_1)
  __label_1: # endif
.annotate 'line', 9825
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9826
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9827
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9828
    if_null __ARG_3, __label_2
    unless __ARG_3 goto __label_2
.annotate 'line', 9829
    $P2.'disable_annotations'()
  __label_2: # endif
.annotate 'line', 9830
    __ARG_1.'emit'($P2)
.annotate 'line', 9831
    $P2.'close'()
.annotate 'line', 9832
    $P1.'close'()
.annotate 'line', 9833
# pircode: $S1
    $P5 = $P1.'read'(0)
    null $S1
    if_null $P5, __label_3
    set $S1, $P5
  __label_3:
.annotate 'line', 9834
# var object: $P3
    null $P3
# switch
.annotate 'line', 9835
    set $S2, __ARG_2
    set $S3, 'pir'
    if $S2 == $S3 goto __label_6
    set $S3, 'pbc'
    if $S2 == $S3 goto __label_7
    set $S3, ''
    if $S2 == $S3 goto __label_8
    goto __label_5
  __label_6: # case
.annotate 'line', 9837
    new $P3, [ 'String' ]
.annotate 'line', 9838
    assign $P3, $S1
    goto __label_4 # break
  __label_7: # case
  __label_8: # case
.annotate 'line', 9842
# var pircomp: $P4
# predefined compreg
    compreg $P4, 'PIR'
.annotate 'line', 9843
    $P3 = $P4($S1)
    goto __label_4 # break
  __label_5: # default
.annotate 'line', 9844
# predefined string
.annotate 'line', 9846
    set $S4, __ARG_2
    concat $S5, 'Invalid target: ', $S4
# predefined die
    die $S5
  __label_4: # switch end
.annotate 'line', 9848
    .return($P3)
# }
.annotate 'line', 9849

.end # __private_compile_tail


.sub '__private_geninclude' :method
        .param pmc __ARG_1
# Body
# {
.annotate 'line', 9852
# var handleout: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9853
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9854
# var emit: $P2
    new $P2, [ 'Emit' ]
    $P2.'Emit'($P1)
.annotate 'line', 9855
    __ARG_1.'emitinclude'($P2)
.annotate 'line', 9856
    $P2.'close'()
.annotate 'line', 9857
    $P1.'close'()
.annotate 'line', 9858
    .tailcall $P1.'read'(0)
# }
.annotate 'line', 9859

.end # __private_geninclude


.sub 'compile' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9865
    unless_null __ARG_2, __label_1
.annotate 'line', 9866
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9867
# var handlein: $P1
    new $P1, [ 'StringHandle' ]
.annotate 'line', 9868
    $P1.'open'('__eval__', 'w')
.annotate 'line', 9869
    $P1.'puts'(__ARG_1)
.annotate 'line', 9870
    $P1.'close'()
.annotate 'line', 9871
    $P1.'open'('__eval__', 'r')
.annotate 'line', 9872
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, '__eval__')
.annotate 'line', 9873
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9874
    unless __ARG_4 goto __label_2
.annotate 'line', 9875
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9876
    $P3.'parse'($P2)
.annotate 'line', 9877
    $P1.'close'()
.annotate 'line', 9878
    $P3.'optimize'()
.annotate 'line', 9879
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9880
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9882
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9883

.end # compile


.sub 'compile_from_file' :method
        .param string __ARG_1
        .param string __ARG_2 :optional :named('target')
        .param int __ARG_3 :optional :named('noan')
        .param int __ARG_4 :optional :named('nowarn')
# Body
# {
.annotate 'line', 9889
    unless_null __ARG_2, __label_1
.annotate 'line', 9890
    set __ARG_2, ''
  __label_1: # endif
.annotate 'line', 9891
# var handlein: $P1
    new $P1, [ 'FileHandle' ]
.annotate 'line', 9892
    $P1.'open'(__ARG_1, 'r')
.annotate 'line', 9893
    $P1.'encoding'('utf8')
.annotate 'line', 9894
# var tk: $P2
    new $P2, [ 'Tokenizer' ]
    $P2.'Tokenizer'($P1, __ARG_1)
.annotate 'line', 9895
# var winxed: $P3
    new $P3, [ 'WinxedCompileUnit' ]
.annotate 'line', 9896
    unless __ARG_4 goto __label_2
.annotate 'line', 9897
    $P3.'setwarnmode'(0)
  __label_2: # endif
.annotate 'line', 9898
    $P3.'parse'($P2)
.annotate 'line', 9899
    $P1.'close'()
.annotate 'line', 9900
    $P3.'optimize'()
.annotate 'line', 9901
    ne __ARG_2, 'include', __label_3
.annotate 'line', 9902
    .tailcall self.'__private_geninclude'($P3)
    goto __label_4
  __label_3: # else
.annotate 'line', 9904
    .tailcall self.'__private_compile_tail'($P3, __ARG_2, __ARG_3)
  __label_4: # endif
# }
.annotate 'line', 9905

.end # compile_from_file

.sub Winxed_class_init :anon :load :init
    newclass $P0, [ 'WinxedHLL' ]
.end
.namespace [ ]

.sub 'initializer' :init :load
# Body
# {
.annotate 'line', 9914
# var comp: $P1
    new $P1, [ 'WinxedHLL' ]
.annotate 'line', 9915
# predefined compreg
    compreg 'winxed', $P1
# }
.annotate 'line', 9916

.end # initializer

# End generated code
