
.namespace []
.sub "_block11"  :anon :subid("10_1294463507.06313")
.annotate 'line', 0
    get_hll_global $P14, ["POST";"Sub"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 6
    get_hll_global $P14, ["POST";"Sub"], "_block13" 
    capture_lex $P14
    $P320 = $P14()
.annotate 'line', 1
    .return ($P320)
    .const 'Sub' $P322 = "42_1294463507.06313" 
    .return ($P322)
.end


.namespace ["POST";"Sub"]
.sub "_block13"  :subid("11_1294463507.06313") :outer("10_1294463507.06313")
.annotate 'line', 6
    .const 'Sub' $P300 = "40_1294463507.06313" 
    capture_lex $P300
    .const 'Sub' $P290 = "39_1294463507.06313" 
    capture_lex $P290
    .const 'Sub' $P282 = "38_1294463507.06313" 
    capture_lex $P282
    .const 'Sub' $P272 = "37_1294463507.06313" 
    capture_lex $P272
    .const 'Sub' $P265 = "36_1294463507.06313" 
    capture_lex $P265
    .const 'Sub' $P259 = "35_1294463507.06313" 
    capture_lex $P259
    .const 'Sub' $P250 = "34_1294463507.06313" 
    capture_lex $P250
    .const 'Sub' $P240 = "33_1294463507.06313" 
    capture_lex $P240
    .const 'Sub' $P231 = "32_1294463507.06313" 
    capture_lex $P231
    .const 'Sub' $P221 = "31_1294463507.06313" 
    capture_lex $P221
    .const 'Sub' $P212 = "30_1294463507.06313" 
    capture_lex $P212
    .const 'Sub' $P202 = "29_1294463507.06313" 
    capture_lex $P202
    .const 'Sub' $P193 = "28_1294463507.06313" 
    capture_lex $P193
    .const 'Sub' $P183 = "27_1294463507.06313" 
    capture_lex $P183
    .const 'Sub' $P174 = "26_1294463507.06313" 
    capture_lex $P174
    .const 'Sub' $P164 = "25_1294463507.06313" 
    capture_lex $P164
    .const 'Sub' $P155 = "24_1294463507.06313" 
    capture_lex $P155
    .const 'Sub' $P145 = "23_1294463507.06313" 
    capture_lex $P145
    .const 'Sub' $P136 = "22_1294463507.06313" 
    capture_lex $P136
    .const 'Sub' $P126 = "21_1294463507.06313" 
    capture_lex $P126
    .const 'Sub' $P117 = "20_1294463507.06313" 
    capture_lex $P117
    .const 'Sub' $P107 = "19_1294463507.06313" 
    capture_lex $P107
    .const 'Sub' $P99 = "18_1294463507.06313" 
    capture_lex $P99
    .const 'Sub' $P93 = "17_1294463507.06313" 
    capture_lex $P93
    .const 'Sub' $P75 = "16_1294463507.06313" 
    capture_lex $P75
    .const 'Sub' $P51 = "15_1294463507.06313" 
    capture_lex $P51
    .const 'Sub' $P45 = "14_1294463507.06313" 
    capture_lex $P45
    .const 'Sub' $P21 = "13_1294463507.06313" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1294463507.06313" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .return ()
    .const 'Sub' $P317 = "41_1294463507.06313" 
    .return ($P317)
.end


.namespace ["POST";"Sub"]
.sub "" :load :init :subid("post43") :outer("11_1294463507.06313")
.annotate 'line', 6
    get_hll_global $P14, ["POST";"Sub"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 130
    load_bytecode "nqp-setting.pbc"
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "symtable" :nsentry :subid("12_1294463507.06313") :method :outer("11_1294463507.06313")
.annotate 'line', 6
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
    push_eh $P17
    .lex "self", self
    find_lex $P18, "self"
    unless_null $P18, vivify_44
    $P18 = root_new ['parrot';'Hash']
  vivify_44:
    set $P19, $P18["symtable"]
    unless_null $P19, vivify_45
    new $P19, "Undef"
  vivify_45:
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "symbol" :nsentry :subid("13_1294463507.06313") :method :outer("11_1294463507.06313")
    .param pmc param_24
    .param pmc param_25 :optional
    .param int has_param_25 :opt_flag
.annotate 'line', 13
    new $P23, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P23, control_22
    push_eh $P23
    .lex "self", self
    .lex "$name", param_24
    if has_param_25, optparam_46
    new $P26, "Undef"
    set param_25, $P26
  optparam_46:
    .lex "$value", param_25
.annotate 'line', 14
    $P27 = root_new ['parrot';'Hash']
    .lex "%symtable", $P27
    find_lex $P28, "self"
    unless_null $P28, vivify_47
    $P28 = root_new ['parrot';'Hash']
  vivify_47:
    set $P29, $P28["symtable"]
    unless_null $P29, vivify_48
    new $P29, "Undef"
  vivify_48:
    store_lex "%symtable", $P29
.annotate 'line', 15
    find_lex $P31, "%symtable"
    if $P31, unless_30_end
.annotate 'line', 16
    $P32 = "hash"()
    find_lex $P33, "self"
    unless_null $P33, vivify_49
    $P33 = root_new ['parrot';'Hash']
    store_lex "self", $P33
  vivify_49:
    set $P33["symtable"], $P32
.annotate 'line', 17
    find_lex $P34, "self"
    unless_null $P34, vivify_50
    $P34 = root_new ['parrot';'Hash']
  vivify_50:
    set $P35, $P34["symtable"]
    unless_null $P35, vivify_51
    new $P35, "Undef"
  vivify_51:
    store_lex "%symtable", $P35
  unless_30_end:
.annotate 'line', 20
    find_lex $P37, "$value"
    unless $P37, if_36_end
.annotate 'line', 21
    find_lex $P38, "$value"
    find_lex $P39, "$name"
    find_lex $P40, "%symtable"
    unless_null $P40, vivify_52
    $P40 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P40
  vivify_52:
    set $P40[$P39], $P38
  if_36_end:
.annotate 'line', 20
    find_lex $P41, "$name"
    find_lex $P42, "%symtable"
    unless_null $P42, vivify_53
    $P42 = root_new ['parrot';'Hash']
  vivify_53:
    set $P43, $P42[$P41]
    unless_null $P43, vivify_54
    new $P43, "Undef"
  vivify_54:
.annotate 'line', 13
    .return ($P43)
  control_22:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "labels" :nsentry :subid("14_1294463507.06313") :method :outer("11_1294463507.06313")
.annotate 'line', 30
    new $P47, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P47, control_46
    push_eh $P47
    .lex "self", self
    find_lex $P48, "self"
    unless_null $P48, vivify_55
    $P48 = root_new ['parrot';'Hash']
  vivify_55:
    set $P49, $P48["labels"]
    unless_null $P49, vivify_56
    new $P49, "Undef"
  vivify_56:
    .return ($P49)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P50, exception, "payload"
    .return ($P50)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "label" :nsentry :subid("15_1294463507.06313") :method :outer("11_1294463507.06313")
    .param pmc param_54
    .param pmc param_55 :optional
    .param int has_param_55 :opt_flag
.annotate 'line', 37
    new $P53, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P53, control_52
    push_eh $P53
    .lex "self", self
    .lex "$name", param_54
    if has_param_55, optparam_57
    new $P56, "Undef"
    set param_55, $P56
  optparam_57:
    .lex "$value", param_55
.annotate 'line', 38
    $P57 = root_new ['parrot';'Hash']
    .lex "%labels", $P57
    find_lex $P58, "self"
    unless_null $P58, vivify_58
    $P58 = root_new ['parrot';'Hash']
  vivify_58:
    set $P59, $P58["labels"]
    unless_null $P59, vivify_59
    new $P59, "Undef"
  vivify_59:
    store_lex "%labels", $P59
.annotate 'line', 39
    find_lex $P61, "%labels"
    if $P61, unless_60_end
.annotate 'line', 40
    $P62 = "hash"()
    find_lex $P63, "self"
    unless_null $P63, vivify_60
    $P63 = root_new ['parrot';'Hash']
    store_lex "self", $P63
  vivify_60:
    set $P63["labels"], $P62
.annotate 'line', 41
    find_lex $P64, "self"
    unless_null $P64, vivify_61
    $P64 = root_new ['parrot';'Hash']
  vivify_61:
    set $P65, $P64["labels"]
    unless_null $P65, vivify_62
    new $P65, "Undef"
  vivify_62:
    store_lex "%labels", $P65
  unless_60_end:
.annotate 'line', 44
    find_lex $P67, "$value"
    unless $P67, if_66_end
.annotate 'line', 45
    find_lex $P68, "$value"
    find_lex $P69, "$name"
    find_lex $P70, "%labels"
    unless_null $P70, vivify_63
    $P70 = root_new ['parrot';'Hash']
    store_lex "%labels", $P70
  vivify_63:
    set $P70[$P69], $P68
  if_66_end:
.annotate 'line', 44
    find_lex $P71, "$name"
    find_lex $P72, "%labels"
    unless_null $P72, vivify_64
    $P72 = root_new ['parrot';'Hash']
  vivify_64:
    set $P73, $P72[$P71]
    unless_null $P73, vivify_65
    new $P73, "Undef"
  vivify_65:
.annotate 'line', 37
    .return ($P73)
  control_52:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "param" :nsentry :subid("16_1294463507.06313") :method :outer("11_1294463507.06313")
    .param pmc param_78
    .param pmc param_79
.annotate 'line', 55
    new $P77, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P77, control_76
    push_eh $P77
    .lex "self", self
    .lex "$name", param_78
    .lex "$param", param_79
.annotate 'line', 56
    $P80 = root_new ['parrot';'ResizablePMCArray']
    .lex "@params", $P80
    find_lex $P81, "self"
    unless_null $P81, vivify_66
    $P81 = root_new ['parrot';'Hash']
  vivify_66:
    set $P82, $P81["params"]
    unless_null $P82, vivify_67
    new $P82, "Undef"
  vivify_67:
    store_lex "@params", $P82
.annotate 'line', 57
    find_lex $P84, "@params"
    if $P84, unless_83_end
.annotate 'line', 58
    $P85 = "list"()
    find_lex $P86, "self"
    unless_null $P86, vivify_68
    $P86 = root_new ['parrot';'Hash']
    store_lex "self", $P86
  vivify_68:
    set $P86["params"], $P85
.annotate 'line', 59
    find_lex $P87, "self"
    unless_null $P87, vivify_69
    $P87 = root_new ['parrot';'Hash']
  vivify_69:
    set $P88, $P87["params"]
    unless_null $P88, vivify_70
    new $P88, "Undef"
  vivify_70:
    store_lex "@params", $P88
  unless_83_end:
.annotate 'line', 64
    find_lex $P89, "@params"
    find_lex $P90, "$param"
    $P91 = $P89."push"($P90)
.annotate 'line', 55
    .return ($P91)
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P92, exception, "payload"
    .return ($P92)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "constant_index" :nsentry :subid("17_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 71
    new $P95, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P95, control_94
    push_eh $P95
    .lex "self", self
    find_lex $P96, "self"
    unless_null $P96, vivify_71
    $P96 = root_new ['parrot';'Hash']
  vivify_71:
    set $P97, $P96["constant_index"]
    unless_null $P97, vivify_72
    new $P97, "Undef"
  vivify_72:
    .return ($P97)
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "constant_index" :nsentry :subid("18_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_102
.annotate 'line', 72
    new $P101, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P101, control_100
    push_eh $P101
    .lex "self", self
    .lex "$idx", param_102
    find_lex $P103, "$idx"
    find_lex $P104, "self"
    unless_null $P104, vivify_73
    $P104 = root_new ['parrot';'Hash']
    store_lex "self", $P104
  vivify_73:
    set $P104["constant_index"], $P103
    find_lex $P105, "$idx"
    .return ($P105)
  control_100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "main" :nsentry :subid("19_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 84
    new $P109, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P109, control_108
    push_eh $P109
    .lex "self", self
    find_lex $P111, "self"
    unless_null $P111, vivify_74
    $P111 = root_new ['parrot';'Hash']
  vivify_74:
    set $P112, $P111["main"]
    unless_null $P112, vivify_75
    new $P112, "Undef"
  vivify_75:
    set $P110, $P112
    defined $I114, $P110
    if $I114, default_113
    new $P115, "Integer"
    assign $P115, 0
    set $P110, $P115
  default_113:
    .return ($P110)
  control_108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "main" :nsentry :subid("20_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_120
.annotate 'line', 85
    new $P119, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P119, control_118
    push_eh $P119
    .lex "self", self
    .lex "$val", param_120
    find_lex $P121, "$val"
    istrue $I122, $P121
    new $P123, 'Integer'
    set $P123, $I122
    find_lex $P124, "self"
    unless_null $P124, vivify_76
    $P124 = root_new ['parrot';'Hash']
    store_lex "self", $P124
  vivify_76:
    set $P124["main"], $P123
    .return ($P123)
  control_118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_init" :nsentry :subid("21_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 88
    new $P128, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P128, control_127
    push_eh $P128
    .lex "self", self
    find_lex $P130, "self"
    unless_null $P130, vivify_77
    $P130 = root_new ['parrot';'Hash']
  vivify_77:
    set $P131, $P130["init"]
    unless_null $P131, vivify_78
    new $P131, "Undef"
  vivify_78:
    set $P129, $P131
    defined $I133, $P129
    if $I133, default_132
    new $P134, "Integer"
    assign $P134, 0
    set $P129, $P134
  default_132:
    .return ($P129)
  control_127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_init" :nsentry :subid("22_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_139
.annotate 'line', 89
    new $P138, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P138, control_137
    push_eh $P138
    .lex "self", self
    .lex "$val", param_139
    find_lex $P140, "$val"
    istrue $I141, $P140
    new $P142, 'Integer'
    set $P142, $I141
    find_lex $P143, "self"
    unless_null $P143, vivify_79
    $P143 = root_new ['parrot';'Hash']
    store_lex "self", $P143
  vivify_79:
    set $P143["init"], $P142
    .return ($P142)
  control_137:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P144, exception, "payload"
    .return ($P144)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "load" :nsentry :subid("23_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 91
    new $P147, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P147, control_146
    push_eh $P147
    .lex "self", self
    find_lex $P149, "self"
    unless_null $P149, vivify_80
    $P149 = root_new ['parrot';'Hash']
  vivify_80:
    set $P150, $P149["load"]
    unless_null $P150, vivify_81
    new $P150, "Undef"
  vivify_81:
    set $P148, $P150
    defined $I152, $P148
    if $I152, default_151
    new $P153, "Integer"
    assign $P153, 0
    set $P148, $P153
  default_151:
    .return ($P148)
  control_146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P154, exception, "payload"
    .return ($P154)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "load" :nsentry :subid("24_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_158
.annotate 'line', 92
    new $P157, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P157, control_156
    push_eh $P157
    .lex "self", self
    .lex "$val", param_158
    find_lex $P159, "$val"
    istrue $I160, $P159
    new $P161, 'Integer'
    set $P161, $I160
    find_lex $P162, "self"
    unless_null $P162, vivify_82
    $P162 = root_new ['parrot';'Hash']
    store_lex "self", $P162
  vivify_82:
    set $P162["load"], $P161
    .return ($P161)
  control_156:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, "payload"
    .return ($P163)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "immediate" :nsentry :subid("25_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 94
    new $P166, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P166, control_165
    push_eh $P166
    .lex "self", self
    find_lex $P168, "self"
    unless_null $P168, vivify_83
    $P168 = root_new ['parrot';'Hash']
  vivify_83:
    set $P169, $P168["immediate"]
    unless_null $P169, vivify_84
    new $P169, "Undef"
  vivify_84:
    set $P167, $P169
    defined $I171, $P167
    if $I171, default_170
    new $P172, "Integer"
    assign $P172, 0
    set $P167, $P172
  default_170:
    .return ($P167)
  control_165:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P173, exception, "payload"
    .return ($P173)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "immediate" :nsentry :subid("26_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_177
.annotate 'line', 95
    new $P176, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P176, control_175
    push_eh $P176
    .lex "self", self
    .lex "$val", param_177
    find_lex $P178, "$val"
    istrue $I179, $P178
    new $P180, 'Integer'
    set $P180, $I179
    find_lex $P181, "self"
    unless_null $P181, vivify_85
    $P181 = root_new ['parrot';'Hash']
    store_lex "self", $P181
  vivify_85:
    set $P181["immediate"], $P180
    .return ($P180)
  control_175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P182, exception, "payload"
    .return ($P182)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "postcomp" :nsentry :subid("27_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 97
    new $P185, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P185, control_184
    push_eh $P185
    .lex "self", self
    find_lex $P187, "self"
    unless_null $P187, vivify_86
    $P187 = root_new ['parrot';'Hash']
  vivify_86:
    set $P188, $P187["postcomp"]
    unless_null $P188, vivify_87
    new $P188, "Undef"
  vivify_87:
    set $P186, $P188
    defined $I190, $P186
    if $I190, default_189
    new $P191, "Integer"
    assign $P191, 0
    set $P186, $P191
  default_189:
    .return ($P186)
  control_184:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "postcomp" :nsentry :subid("28_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_196
.annotate 'line', 98
    new $P195, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P195, control_194
    push_eh $P195
    .lex "self", self
    .lex "$val", param_196
    find_lex $P197, "$val"
    istrue $I198, $P197
    new $P199, 'Integer'
    set $P199, $I198
    find_lex $P200, "self"
    unless_null $P200, vivify_88
    $P200 = root_new ['parrot';'Hash']
    store_lex "self", $P200
  vivify_88:
    set $P200["postcomp"], $P199
    .return ($P199)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, "payload"
    .return ($P201)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "anon" :nsentry :subid("29_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 100
    new $P204, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P204, control_203
    push_eh $P204
    .lex "self", self
    find_lex $P206, "self"
    unless_null $P206, vivify_89
    $P206 = root_new ['parrot';'Hash']
  vivify_89:
    set $P207, $P206["anon"]
    unless_null $P207, vivify_90
    new $P207, "Undef"
  vivify_90:
    set $P205, $P207
    defined $I209, $P205
    if $I209, default_208
    new $P210, "Integer"
    assign $P210, 0
    set $P205, $P210
  default_208:
    .return ($P205)
  control_203:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P211, exception, "payload"
    .return ($P211)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "anon" :nsentry :subid("30_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_215
.annotate 'line', 101
    new $P214, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P214, control_213
    push_eh $P214
    .lex "self", self
    .lex "$val", param_215
    find_lex $P216, "$val"
    istrue $I217, $P216
    new $P218, 'Integer'
    set $P218, $I217
    find_lex $P219, "self"
    unless_null $P219, vivify_91
    $P219 = root_new ['parrot';'Hash']
    store_lex "self", $P219
  vivify_91:
    set $P219["anon"], $P218
    .return ($P218)
  control_213:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P220, exception, "payload"
    .return ($P220)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_method" :nsentry :subid("31_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 103
    new $P223, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P223, control_222
    push_eh $P223
    .lex "self", self
    find_lex $P225, "self"
    unless_null $P225, vivify_92
    $P225 = root_new ['parrot';'Hash']
  vivify_92:
    set $P226, $P225["method"]
    unless_null $P226, vivify_93
    new $P226, "Undef"
  vivify_93:
    set $P224, $P226
    defined $I228, $P224
    if $I228, default_227
    new $P229, "Integer"
    assign $P229, 0
    set $P224, $P229
  default_227:
    .return ($P224)
  control_222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P230, exception, "payload"
    .return ($P230)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_method" :nsentry :subid("32_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_234
.annotate 'line', 104
    new $P233, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P233, control_232
    push_eh $P233
    .lex "self", self
    .lex "$val", param_234
    find_lex $P235, "$val"
    istrue $I236, $P235
    new $P237, 'Integer'
    set $P237, $I236
    find_lex $P238, "self"
    unless_null $P238, vivify_94
    $P238 = root_new ['parrot';'Hash']
    store_lex "self", $P238
  vivify_94:
    set $P238["method"], $P237
    .return ($P237)
  control_232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P239, exception, "payload"
    .return ($P239)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "lex" :nsentry :subid("33_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 106
    new $P242, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P242, control_241
    push_eh $P242
    .lex "self", self
    find_lex $P244, "self"
    unless_null $P244, vivify_95
    $P244 = root_new ['parrot';'Hash']
  vivify_95:
    set $P245, $P244["lex"]
    unless_null $P245, vivify_96
    new $P245, "Undef"
  vivify_96:
    set $P243, $P245
    defined $I247, $P243
    if $I247, default_246
    new $P248, "Integer"
    assign $P248, 0
    set $P243, $P248
  default_246:
    .return ($P243)
  control_241:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P249, exception, "payload"
    .return ($P249)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "lex" :nsentry :subid("34_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_253
.annotate 'line', 107
    new $P252, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P252, control_251
    push_eh $P252
    .lex "self", self
    .lex "$val", param_253
    find_lex $P254, "$val"
    istrue $I255, $P254
    new $P256, 'Integer'
    set $P256, $I255
    find_lex $P257, "self"
    unless_null $P257, vivify_97
    $P257 = root_new ['parrot';'Hash']
    store_lex "self", $P257
  vivify_97:
    set $P257["lex"], $P256
    .return ($P256)
  control_251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, "payload"
    .return ($P258)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "nsentry" :nsentry :subid("35_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 110
    new $P261, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P261, control_260
    push_eh $P261
    .lex "self", self
    find_lex $P262, "self"
    unless_null $P262, vivify_98
    $P262 = root_new ['parrot';'Hash']
  vivify_98:
    set $P263, $P262["nsentry"]
    unless_null $P263, vivify_99
    new $P263, "Undef"
  vivify_99:
    .return ($P263)
  control_260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P264, exception, "payload"
    .return ($P264)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "nsentry" :nsentry :subid("36_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_268
.annotate 'line', 111
    new $P267, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P267, control_266
    push_eh $P267
    .lex "self", self
    .lex "$val", param_268
    find_lex $P269, "$val"
    find_lex $P270, "self"
    unless_null $P270, vivify_100
    $P270 = root_new ['parrot';'Hash']
    store_lex "self", $P270
  vivify_100:
    set $P270["nsentry"], $P269
    .return ($P269)
  control_266:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P271, exception, "payload"
    .return ($P271)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "vtable" :nsentry :subid("37_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_)
.annotate 'line', 113
    new $P274, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P274, control_273
    push_eh $P274
    .lex "self", self
    find_lex $P276, "self"
    unless_null $P276, vivify_101
    $P276 = root_new ['parrot';'Hash']
  vivify_101:
    set $P277, $P276["vtable"]
    unless_null $P277, vivify_102
    new $P277, "Undef"
  vivify_102:
    set $P275, $P277
    defined $I279, $P275
    if $I279, default_278
    new $P280, "Integer"
    assign $P280, -1
    set $P275, $P280
  default_278:
    .return ($P275)
  control_273:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P281, exception, "payload"
    .return ($P281)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "vtable" :nsentry :subid("38_1294463507.06313") :method :outer("11_1294463507.06313") :multi(_,_)
    .param pmc param_285
.annotate 'line', 114
    new $P284, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P284, control_283
    push_eh $P284
    .lex "self", self
    .lex "$val", param_285
    find_lex $P286, "$val"
    find_lex $P287, "self"
    unless_null $P287, vivify_103
    $P287 = root_new ['parrot';'Hash']
    store_lex "self", $P287
  vivify_103:
    set $P287["vtable"], $P286
    find_lex $P288, "$val"
    .return ($P288)
  control_283:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P289, exception, "payload"
    .return ($P289)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "set_flag" :nsentry :subid("39_1294463507.06313") :method :outer("11_1294463507.06313")
    .param pmc param_293
    .param pmc param_294
.annotate 'line', 116
    new $P292, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P292, control_291
    push_eh $P292
    .lex "self", self
    .lex "$name", param_293
    .lex "$val", param_294
    find_lex $P295, "$val"
    find_lex $P296, "$name"
    find_lex $P297, "self"
    unless_null $P297, vivify_104
    $P297 = root_new ['parrot';'Hash']
    store_lex "self", $P297
  vivify_104:
    set $P297[$P296], $P295
    find_lex $P298, "$val"
    .return ($P298)
  control_291:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P299, exception, "payload"
    .return ($P299)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "full_name" :nsentry :subid("40_1294463507.06313") :method :outer("11_1294463507.06313")
.annotate 'line', 120
    new $P302, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P302, control_301
    push_eh $P302
    .lex "self", self
.annotate 'line', 121
    find_lex $P305, "self"
    unless_null $P305, vivify_105
    $P305 = root_new ['parrot';'Hash']
  vivify_105:
    set $P306, $P305["namespace"]
    unless_null $P306, vivify_106
    new $P306, "Undef"
  vivify_106:
    if $P306, if_304
.annotate 'line', 125
    find_lex $P313, "self"
    $P314 = $P313."name"()
.annotate 'line', 124
    set $P303, $P314
.annotate 'line', 121
    goto if_304_end
  if_304:
.annotate 'line', 122
    find_lex $P307, "self"
    unless_null $P307, vivify_107
    $P307 = root_new ['parrot';'Hash']
  vivify_107:
    set $P308, $P307["namespace"]
    unless_null $P308, vivify_108
    new $P308, "Undef"
  vivify_108:
    $P309 = $P308."Str"()
    find_lex $P310, "self"
    $S311 = $P310."name"()
    concat $P312, $P309, $S311
.annotate 'line', 121
    set $P303, $P312
  if_304_end:
.annotate 'line', 120
    .return ($P303)
  control_301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P315, exception, "payload"
    .return ($P315)
.end


.namespace ["POST";"Sub"]
.sub "_block316" :load :anon :subid("41_1294463507.06313")
.annotate 'line', 6
    .const 'Sub' $P318 = "11_1294463507.06313" 
    $P319 = $P318()
    .return ($P319)
.end


.namespace []
.sub "_block321" :load :anon :subid("42_1294463507.06313")
.annotate 'line', 1
    .const 'Sub' $P323 = "10_1294463507.06313" 
    $P324 = $P323()
    .return ($P324)
.end

