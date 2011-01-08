
.namespace []
.sub "_block11"  :anon :subid("10_1294467572.9376")
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
    $P437 = $P14()
.annotate 'line', 1
    .return ($P437)
    .const 'Sub' $P439 = "60_1294467572.9376" 
    .return ($P439)
.end


.namespace ["POST";"Sub"]
.sub "_block13"  :subid("11_1294467572.9376") :outer("10_1294467572.9376")
.annotate 'line', 6
    .const 'Sub' $P417 = "58_1294467572.9376" 
    capture_lex $P417
    .const 'Sub' $P407 = "57_1294467572.9376" 
    capture_lex $P407
    .const 'Sub' $P400 = "56_1294467572.9376" 
    capture_lex $P400
    .const 'Sub' $P394 = "55_1294467572.9376" 
    capture_lex $P394
    .const 'Sub' $P387 = "54_1294467572.9376" 
    capture_lex $P387
    .const 'Sub' $P381 = "53_1294467572.9376" 
    capture_lex $P381
    .const 'Sub' $P374 = "52_1294467572.9376" 
    capture_lex $P374
    .const 'Sub' $P368 = "51_1294467572.9376" 
    capture_lex $P368
    .const 'Sub' $P361 = "50_1294467572.9376" 
    capture_lex $P361
    .const 'Sub' $P355 = "49_1294467572.9376" 
    capture_lex $P355
    .const 'Sub' $P348 = "48_1294467572.9376" 
    capture_lex $P348
    .const 'Sub' $P342 = "47_1294467572.9376" 
    capture_lex $P342
    .const 'Sub' $P335 = "46_1294467572.9376" 
    capture_lex $P335
    .const 'Sub' $P329 = "45_1294467572.9376" 
    capture_lex $P329
    .const 'Sub' $P322 = "44_1294467572.9376" 
    capture_lex $P322
    .const 'Sub' $P316 = "43_1294467572.9376" 
    capture_lex $P316
    .const 'Sub' $P309 = "42_1294467572.9376" 
    capture_lex $P309
    .const 'Sub' $P303 = "41_1294467572.9376" 
    capture_lex $P303
    .const 'Sub' $P296 = "40_1294467572.9376" 
    capture_lex $P296
    .const 'Sub' $P290 = "39_1294467572.9376" 
    capture_lex $P290
    .const 'Sub' $P282 = "38_1294467572.9376" 
    capture_lex $P282
    .const 'Sub' $P272 = "37_1294467572.9376" 
    capture_lex $P272
    .const 'Sub' $P265 = "36_1294467572.9376" 
    capture_lex $P265
    .const 'Sub' $P259 = "35_1294467572.9376" 
    capture_lex $P259
    .const 'Sub' $P250 = "34_1294467572.9376" 
    capture_lex $P250
    .const 'Sub' $P240 = "33_1294467572.9376" 
    capture_lex $P240
    .const 'Sub' $P231 = "32_1294467572.9376" 
    capture_lex $P231
    .const 'Sub' $P221 = "31_1294467572.9376" 
    capture_lex $P221
    .const 'Sub' $P212 = "30_1294467572.9376" 
    capture_lex $P212
    .const 'Sub' $P202 = "29_1294467572.9376" 
    capture_lex $P202
    .const 'Sub' $P193 = "28_1294467572.9376" 
    capture_lex $P193
    .const 'Sub' $P183 = "27_1294467572.9376" 
    capture_lex $P183
    .const 'Sub' $P174 = "26_1294467572.9376" 
    capture_lex $P174
    .const 'Sub' $P164 = "25_1294467572.9376" 
    capture_lex $P164
    .const 'Sub' $P155 = "24_1294467572.9376" 
    capture_lex $P155
    .const 'Sub' $P145 = "23_1294467572.9376" 
    capture_lex $P145
    .const 'Sub' $P136 = "22_1294467572.9376" 
    capture_lex $P136
    .const 'Sub' $P126 = "21_1294467572.9376" 
    capture_lex $P126
    .const 'Sub' $P117 = "20_1294467572.9376" 
    capture_lex $P117
    .const 'Sub' $P107 = "19_1294467572.9376" 
    capture_lex $P107
    .const 'Sub' $P99 = "18_1294467572.9376" 
    capture_lex $P99
    .const 'Sub' $P93 = "17_1294467572.9376" 
    capture_lex $P93
    .const 'Sub' $P75 = "16_1294467572.9376" 
    capture_lex $P75
    .const 'Sub' $P51 = "15_1294467572.9376" 
    capture_lex $P51
    .const 'Sub' $P45 = "14_1294467572.9376" 
    capture_lex $P45
    .const 'Sub' $P21 = "13_1294467572.9376" 
    capture_lex $P21
    .const 'Sub' $P15 = "12_1294467572.9376" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .return ()
    .const 'Sub' $P434 = "59_1294467572.9376" 
    .return ($P434)
.end


.namespace ["POST";"Sub"]
.sub "" :load :init :subid("post61") :outer("11_1294467572.9376")
.annotate 'line', 6
    get_hll_global $P14, ["POST";"Sub"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 157
    load_bytecode "nqp-setting.pbc"
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "symtable" :nsentry :subid("12_1294467572.9376") :method :outer("11_1294467572.9376")
.annotate 'line', 6
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
    push_eh $P17
    .lex "self", self
    find_lex $P18, "self"
    unless_null $P18, vivify_62
    $P18 = root_new ['parrot';'Hash']
  vivify_62:
    set $P19, $P18["symtable"]
    unless_null $P19, vivify_63
    new $P19, "Undef"
  vivify_63:
    .return ($P19)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P20, exception, "payload"
    .return ($P20)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "symbol" :nsentry :subid("13_1294467572.9376") :method :outer("11_1294467572.9376")
    .param pmc param_24
    .param pmc param_25 :optional
    .param int has_param_25 :opt_flag
.annotate 'line', 13
    new $P23, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P23, control_22
    push_eh $P23
    .lex "self", self
    .lex "$name", param_24
    if has_param_25, optparam_64
    new $P26, "Undef"
    set param_25, $P26
  optparam_64:
    .lex "$value", param_25
.annotate 'line', 14
    $P27 = root_new ['parrot';'Hash']
    .lex "%symtable", $P27
    find_lex $P28, "self"
    unless_null $P28, vivify_65
    $P28 = root_new ['parrot';'Hash']
  vivify_65:
    set $P29, $P28["symtable"]
    unless_null $P29, vivify_66
    new $P29, "Undef"
  vivify_66:
    store_lex "%symtable", $P29
.annotate 'line', 15
    find_lex $P31, "%symtable"
    if $P31, unless_30_end
.annotate 'line', 16
    $P32 = "hash"()
    find_lex $P33, "self"
    unless_null $P33, vivify_67
    $P33 = root_new ['parrot';'Hash']
    store_lex "self", $P33
  vivify_67:
    set $P33["symtable"], $P32
.annotate 'line', 17
    find_lex $P34, "self"
    unless_null $P34, vivify_68
    $P34 = root_new ['parrot';'Hash']
  vivify_68:
    set $P35, $P34["symtable"]
    unless_null $P35, vivify_69
    new $P35, "Undef"
  vivify_69:
    store_lex "%symtable", $P35
  unless_30_end:
.annotate 'line', 20
    find_lex $P37, "$value"
    unless $P37, if_36_end
.annotate 'line', 21
    find_lex $P38, "$value"
    find_lex $P39, "$name"
    find_lex $P40, "%symtable"
    unless_null $P40, vivify_70
    $P40 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P40
  vivify_70:
    set $P40[$P39], $P38
  if_36_end:
.annotate 'line', 20
    find_lex $P41, "$name"
    find_lex $P42, "%symtable"
    unless_null $P42, vivify_71
    $P42 = root_new ['parrot';'Hash']
  vivify_71:
    set $P43, $P42[$P41]
    unless_null $P43, vivify_72
    new $P43, "Undef"
  vivify_72:
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
.sub "labels" :nsentry :subid("14_1294467572.9376") :method :outer("11_1294467572.9376")
.annotate 'line', 30
    new $P47, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P47, control_46
    push_eh $P47
    .lex "self", self
    find_lex $P48, "self"
    unless_null $P48, vivify_73
    $P48 = root_new ['parrot';'Hash']
  vivify_73:
    set $P49, $P48["labels"]
    unless_null $P49, vivify_74
    new $P49, "Undef"
  vivify_74:
    .return ($P49)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P50, exception, "payload"
    .return ($P50)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "label" :nsentry :subid("15_1294467572.9376") :method :outer("11_1294467572.9376")
    .param pmc param_54
    .param pmc param_55 :optional
    .param int has_param_55 :opt_flag
.annotate 'line', 37
    new $P53, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P53, control_52
    push_eh $P53
    .lex "self", self
    .lex "$name", param_54
    if has_param_55, optparam_75
    new $P56, "Undef"
    set param_55, $P56
  optparam_75:
    .lex "$value", param_55
.annotate 'line', 38
    $P57 = root_new ['parrot';'Hash']
    .lex "%labels", $P57
    find_lex $P58, "self"
    unless_null $P58, vivify_76
    $P58 = root_new ['parrot';'Hash']
  vivify_76:
    set $P59, $P58["labels"]
    unless_null $P59, vivify_77
    new $P59, "Undef"
  vivify_77:
    store_lex "%labels", $P59
.annotate 'line', 39
    find_lex $P61, "%labels"
    if $P61, unless_60_end
.annotate 'line', 40
    $P62 = "hash"()
    find_lex $P63, "self"
    unless_null $P63, vivify_78
    $P63 = root_new ['parrot';'Hash']
    store_lex "self", $P63
  vivify_78:
    set $P63["labels"], $P62
.annotate 'line', 41
    find_lex $P64, "self"
    unless_null $P64, vivify_79
    $P64 = root_new ['parrot';'Hash']
  vivify_79:
    set $P65, $P64["labels"]
    unless_null $P65, vivify_80
    new $P65, "Undef"
  vivify_80:
    store_lex "%labels", $P65
  unless_60_end:
.annotate 'line', 44
    find_lex $P67, "$value"
    unless $P67, if_66_end
.annotate 'line', 45
    find_lex $P68, "$value"
    find_lex $P69, "$name"
    find_lex $P70, "%labels"
    unless_null $P70, vivify_81
    $P70 = root_new ['parrot';'Hash']
    store_lex "%labels", $P70
  vivify_81:
    set $P70[$P69], $P68
  if_66_end:
.annotate 'line', 44
    find_lex $P71, "$name"
    find_lex $P72, "%labels"
    unless_null $P72, vivify_82
    $P72 = root_new ['parrot';'Hash']
  vivify_82:
    set $P73, $P72[$P71]
    unless_null $P73, vivify_83
    new $P73, "Undef"
  vivify_83:
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
.sub "param" :nsentry :subid("16_1294467572.9376") :method :outer("11_1294467572.9376")
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
    unless_null $P81, vivify_84
    $P81 = root_new ['parrot';'Hash']
  vivify_84:
    set $P82, $P81["params"]
    unless_null $P82, vivify_85
    new $P82, "Undef"
  vivify_85:
    store_lex "@params", $P82
.annotate 'line', 57
    find_lex $P84, "@params"
    if $P84, unless_83_end
.annotate 'line', 58
    $P85 = "list"()
    find_lex $P86, "self"
    unless_null $P86, vivify_86
    $P86 = root_new ['parrot';'Hash']
    store_lex "self", $P86
  vivify_86:
    set $P86["params"], $P85
.annotate 'line', 59
    find_lex $P87, "self"
    unless_null $P87, vivify_87
    $P87 = root_new ['parrot';'Hash']
  vivify_87:
    set $P88, $P87["params"]
    unless_null $P88, vivify_88
    new $P88, "Undef"
  vivify_88:
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
.sub "constant_index" :nsentry :subid("17_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 71
    new $P95, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P95, control_94
    push_eh $P95
    .lex "self", self
    find_lex $P96, "self"
    unless_null $P96, vivify_89
    $P96 = root_new ['parrot';'Hash']
  vivify_89:
    set $P97, $P96["constant_index"]
    unless_null $P97, vivify_90
    new $P97, "Undef"
  vivify_90:
    .return ($P97)
  control_94:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P98, exception, "payload"
    .return ($P98)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "constant_index" :nsentry :subid("18_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_102
.annotate 'line', 72
    new $P101, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P101, control_100
    push_eh $P101
    .lex "self", self
    .lex "$idx", param_102
    find_lex $P103, "$idx"
    find_lex $P104, "self"
    unless_null $P104, vivify_91
    $P104 = root_new ['parrot';'Hash']
    store_lex "self", $P104
  vivify_91:
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
.sub "main" :nsentry :subid("19_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 84
    new $P109, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P109, control_108
    push_eh $P109
    .lex "self", self
    find_lex $P111, "self"
    unless_null $P111, vivify_92
    $P111 = root_new ['parrot';'Hash']
  vivify_92:
    set $P112, $P111["main"]
    unless_null $P112, vivify_93
    new $P112, "Undef"
  vivify_93:
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
.sub "main" :nsentry :subid("20_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
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
    unless_null $P124, vivify_94
    $P124 = root_new ['parrot';'Hash']
    store_lex "self", $P124
  vivify_94:
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
.sub "is_init" :nsentry :subid("21_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 88
    new $P128, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P128, control_127
    push_eh $P128
    .lex "self", self
    find_lex $P130, "self"
    unless_null $P130, vivify_95
    $P130 = root_new ['parrot';'Hash']
  vivify_95:
    set $P131, $P130["init"]
    unless_null $P131, vivify_96
    new $P131, "Undef"
  vivify_96:
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
.sub "is_init" :nsentry :subid("22_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
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
    unless_null $P143, vivify_97
    $P143 = root_new ['parrot';'Hash']
    store_lex "self", $P143
  vivify_97:
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
.sub "load" :nsentry :subid("23_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 91
    new $P147, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P147, control_146
    push_eh $P147
    .lex "self", self
    find_lex $P149, "self"
    unless_null $P149, vivify_98
    $P149 = root_new ['parrot';'Hash']
  vivify_98:
    set $P150, $P149["load"]
    unless_null $P150, vivify_99
    new $P150, "Undef"
  vivify_99:
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
.sub "load" :nsentry :subid("24_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
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
    unless_null $P162, vivify_100
    $P162 = root_new ['parrot';'Hash']
    store_lex "self", $P162
  vivify_100:
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
.sub "immediate" :nsentry :subid("25_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 94
    new $P166, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P166, control_165
    push_eh $P166
    .lex "self", self
    find_lex $P168, "self"
    unless_null $P168, vivify_101
    $P168 = root_new ['parrot';'Hash']
  vivify_101:
    set $P169, $P168["immediate"]
    unless_null $P169, vivify_102
    new $P169, "Undef"
  vivify_102:
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
.sub "immediate" :nsentry :subid("26_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
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
    unless_null $P181, vivify_103
    $P181 = root_new ['parrot';'Hash']
    store_lex "self", $P181
  vivify_103:
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
.sub "postcomp" :nsentry :subid("27_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 97
    new $P185, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P185, control_184
    push_eh $P185
    .lex "self", self
    find_lex $P187, "self"
    unless_null $P187, vivify_104
    $P187 = root_new ['parrot';'Hash']
  vivify_104:
    set $P188, $P187["postcomp"]
    unless_null $P188, vivify_105
    new $P188, "Undef"
  vivify_105:
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
.sub "postcomp" :nsentry :subid("28_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
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
    unless_null $P200, vivify_106
    $P200 = root_new ['parrot';'Hash']
    store_lex "self", $P200
  vivify_106:
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
.sub "anon" :nsentry :subid("29_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 100
    new $P204, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P204, control_203
    push_eh $P204
    .lex "self", self
    find_lex $P206, "self"
    unless_null $P206, vivify_107
    $P206 = root_new ['parrot';'Hash']
  vivify_107:
    set $P207, $P206["anon"]
    unless_null $P207, vivify_108
    new $P207, "Undef"
  vivify_108:
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
.sub "anon" :nsentry :subid("30_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
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
    unless_null $P219, vivify_109
    $P219 = root_new ['parrot';'Hash']
    store_lex "self", $P219
  vivify_109:
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
.sub "is_method" :nsentry :subid("31_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 103
    new $P223, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P223, control_222
    push_eh $P223
    .lex "self", self
    find_lex $P225, "self"
    unless_null $P225, vivify_110
    $P225 = root_new ['parrot';'Hash']
  vivify_110:
    set $P226, $P225["method"]
    unless_null $P226, vivify_111
    new $P226, "Undef"
  vivify_111:
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
.sub "is_method" :nsentry :subid("32_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
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
    unless_null $P238, vivify_112
    $P238 = root_new ['parrot';'Hash']
    store_lex "self", $P238
  vivify_112:
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
.sub "lex" :nsentry :subid("33_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 106
    new $P242, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P242, control_241
    push_eh $P242
    .lex "self", self
    find_lex $P244, "self"
    unless_null $P244, vivify_113
    $P244 = root_new ['parrot';'Hash']
  vivify_113:
    set $P245, $P244["lex"]
    unless_null $P245, vivify_114
    new $P245, "Undef"
  vivify_114:
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
.sub "lex" :nsentry :subid("34_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
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
    unless_null $P257, vivify_115
    $P257 = root_new ['parrot';'Hash']
    store_lex "self", $P257
  vivify_115:
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
.sub "nsentry" :nsentry :subid("35_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 109
    new $P261, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P261, control_260
    push_eh $P261
    .lex "self", self
    find_lex $P262, "self"
    unless_null $P262, vivify_116
    $P262 = root_new ['parrot';'Hash']
  vivify_116:
    set $P263, $P262["nsentry"]
    unless_null $P263, vivify_117
    new $P263, "Undef"
  vivify_117:
    .return ($P263)
  control_260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P264, exception, "payload"
    .return ($P264)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "nsentry" :nsentry :subid("36_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_268
.annotate 'line', 110
    new $P267, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P267, control_266
    push_eh $P267
    .lex "self", self
    .lex "$val", param_268
    find_lex $P269, "$val"
    find_lex $P270, "self"
    unless_null $P270, vivify_118
    $P270 = root_new ['parrot';'Hash']
    store_lex "self", $P270
  vivify_118:
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
.sub "vtable" :nsentry :subid("37_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 112
    new $P274, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P274, control_273
    push_eh $P274
    .lex "self", self
    find_lex $P276, "self"
    unless_null $P276, vivify_119
    $P276 = root_new ['parrot';'Hash']
  vivify_119:
    set $P277, $P276["vtable"]
    unless_null $P277, vivify_120
    new $P277, "Undef"
  vivify_120:
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
.sub "vtable" :nsentry :subid("38_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_285
.annotate 'line', 113
    new $P284, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P284, control_283
    push_eh $P284
    .lex "self", self
    .lex "$val", param_285
    find_lex $P286, "$val"
    find_lex $P287, "self"
    unless_null $P287, vivify_121
    $P287 = root_new ['parrot';'Hash']
    store_lex "self", $P287
  vivify_121:
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
.sub "blocktype" :nsentry :subid("39_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 115
    new $P292, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P292, control_291
    push_eh $P292
    .lex "self", self
    find_lex $P293, "self"
    unless_null $P293, vivify_122
    $P293 = root_new ['parrot';'Hash']
  vivify_122:
    set $P294, $P293["blocktype"]
    unless_null $P294, vivify_123
    new $P294, "Undef"
  vivify_123:
    .return ($P294)
  control_291:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P295, exception, "payload"
    .return ($P295)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "blocktype" :nsentry :subid("40_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_299
.annotate 'line', 116
    new $P298, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P298, control_297
    push_eh $P298
    .lex "self", self
    .lex "$val", param_299
    find_lex $P300, "$val"
    find_lex $P301, "self"
    unless_null $P301, vivify_124
    $P301 = root_new ['parrot';'Hash']
    store_lex "self", $P301
  vivify_124:
    set $P301["blocktype"], $P300
    .return ($P300)
  control_297:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P302, exception, "payload"
    .return ($P302)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "namespace" :nsentry :subid("41_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 118
    new $P305, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P305, control_304
    push_eh $P305
    .lex "self", self
    find_lex $P306, "self"
    unless_null $P306, vivify_125
    $P306 = root_new ['parrot';'Hash']
  vivify_125:
    set $P307, $P306["namespace"]
    unless_null $P307, vivify_126
    new $P307, "Undef"
  vivify_126:
    .return ($P307)
  control_304:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P308, exception, "payload"
    .return ($P308)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "namespace" :nsentry :subid("42_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_312
.annotate 'line', 119
    new $P311, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P311, control_310
    push_eh $P311
    .lex "self", self
    .lex "$val", param_312
    find_lex $P313, "$val"
    find_lex $P314, "self"
    unless_null $P314, vivify_127
    $P314 = root_new ['parrot';'Hash']
    store_lex "self", $P314
  vivify_127:
    set $P314["namespace"], $P313
    .return ($P313)
  control_310:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P315, exception, "payload"
    .return ($P315)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "hll" :nsentry :subid("43_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 121
    new $P318, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P318, control_317
    push_eh $P318
    .lex "self", self
    find_lex $P319, "self"
    unless_null $P319, vivify_128
    $P319 = root_new ['parrot';'Hash']
  vivify_128:
    set $P320, $P319["hll"]
    unless_null $P320, vivify_129
    new $P320, "Undef"
  vivify_129:
    .return ($P320)
  control_317:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P321, exception, "payload"
    .return ($P321)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "hll" :nsentry :subid("44_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_325
.annotate 'line', 122
    new $P324, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P324, control_323
    push_eh $P324
    .lex "self", self
    .lex "$val", param_325
    find_lex $P326, "$val"
    find_lex $P327, "self"
    unless_null $P327, vivify_130
    $P327 = root_new ['parrot';'Hash']
    store_lex "self", $P327
  vivify_130:
    set $P327["hll"], $P326
    .return ($P326)
  control_323:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P328, exception, "payload"
    .return ($P328)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "loadlibs" :nsentry :subid("45_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 124
    new $P331, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P331, control_330
    push_eh $P331
    .lex "self", self
    find_lex $P332, "self"
    unless_null $P332, vivify_131
    $P332 = root_new ['parrot';'Hash']
  vivify_131:
    set $P333, $P332["loadlibs"]
    unless_null $P333, vivify_132
    new $P333, "Undef"
  vivify_132:
    .return ($P333)
  control_330:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P334, exception, "payload"
    .return ($P334)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "loadlibs" :nsentry :subid("46_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_338
.annotate 'line', 125
    new $P337, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P337, control_336
    push_eh $P337
    .lex "self", self
    .lex "$val", param_338
    find_lex $P339, "$val"
    find_lex $P340, "self"
    unless_null $P340, vivify_133
    $P340 = root_new ['parrot';'Hash']
    store_lex "self", $P340
  vivify_133:
    set $P340["loadlibs"], $P339
    .return ($P339)
  control_336:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P341, exception, "payload"
    .return ($P341)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "outer" :nsentry :subid("47_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 127
    new $P344, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P344, control_343
    push_eh $P344
    .lex "self", self
    find_lex $P345, "self"
    unless_null $P345, vivify_134
    $P345 = root_new ['parrot';'Hash']
  vivify_134:
    set $P346, $P345["outer"]
    unless_null $P346, vivify_135
    new $P346, "Undef"
  vivify_135:
    .return ($P346)
  control_343:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P347, exception, "payload"
    .return ($P347)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "outer" :nsentry :subid("48_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_351
.annotate 'line', 128
    new $P350, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P350, control_349
    push_eh $P350
    .lex "self", self
    .lex "$val", param_351
    find_lex $P352, "$val"
    find_lex $P353, "self"
    unless_null $P353, vivify_136
    $P353 = root_new ['parrot';'Hash']
    store_lex "self", $P353
  vivify_136:
    set $P353["outer"], $P352
    .return ($P352)
  control_349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P354, exception, "payload"
    .return ($P354)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "multi" :nsentry :subid("49_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 130
    new $P357, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P357, control_356
    push_eh $P357
    .lex "self", self
    find_lex $P358, "self"
    unless_null $P358, vivify_137
    $P358 = root_new ['parrot';'Hash']
  vivify_137:
    set $P359, $P358["multi"]
    unless_null $P359, vivify_138
    new $P359, "Undef"
  vivify_138:
    .return ($P359)
  control_356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P360, exception, "payload"
    .return ($P360)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "multi" :nsentry :subid("50_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_364
.annotate 'line', 131
    new $P363, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P363, control_362
    push_eh $P363
    .lex "self", self
    .lex "$val", param_364
    find_lex $P365, "$val"
    find_lex $P366, "self"
    unless_null $P366, vivify_139
    $P366 = root_new ['parrot';'Hash']
    store_lex "self", $P366
  vivify_139:
    set $P366["multi"], $P365
    .return ($P365)
  control_362:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P367, exception, "payload"
    .return ($P367)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "pirflags" :nsentry :subid("51_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 133
    new $P370, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P370, control_369
    push_eh $P370
    .lex "self", self
    find_lex $P371, "self"
    unless_null $P371, vivify_140
    $P371 = root_new ['parrot';'Hash']
  vivify_140:
    set $P372, $P371["pirflags"]
    unless_null $P372, vivify_141
    new $P372, "Undef"
  vivify_141:
    .return ($P372)
  control_369:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, "payload"
    .return ($P373)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "pirflags" :nsentry :subid("52_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_377
.annotate 'line', 134
    new $P376, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P376, control_375
    push_eh $P376
    .lex "self", self
    .lex "$val", param_377
    find_lex $P378, "$val"
    find_lex $P379, "self"
    unless_null $P379, vivify_142
    $P379 = root_new ['parrot';'Hash']
    store_lex "self", $P379
  vivify_142:
    set $P379["pirflags"], $P378
    .return ($P378)
  control_375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P380, exception, "payload"
    .return ($P380)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler" :nsentry :subid("53_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 136
    new $P383, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P383, control_382
    push_eh $P383
    .lex "self", self
    find_lex $P384, "self"
    unless_null $P384, vivify_143
    $P384 = root_new ['parrot';'Hash']
  vivify_143:
    set $P385, $P384["compiler"]
    unless_null $P385, vivify_144
    new $P385, "Undef"
  vivify_144:
    .return ($P385)
  control_382:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P386, exception, "payload"
    .return ($P386)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler" :nsentry :subid("54_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_390
.annotate 'line', 137
    new $P389, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P389, control_388
    push_eh $P389
    .lex "self", self
    .lex "$val", param_390
    find_lex $P391, "$val"
    find_lex $P392, "self"
    unless_null $P392, vivify_145
    $P392 = root_new ['parrot';'Hash']
    store_lex "self", $P392
  vivify_145:
    set $P392["compiler"], $P391
    .return ($P391)
  control_388:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P393, exception, "payload"
    .return ($P393)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler_args" :nsentry :subid("55_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_)
.annotate 'line', 139
    new $P396, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P396, control_395
    push_eh $P396
    .lex "self", self
    find_lex $P397, "self"
    unless_null $P397, vivify_146
    $P397 = root_new ['parrot';'Hash']
  vivify_146:
    set $P398, $P397["compiler_args"]
    unless_null $P398, vivify_147
    new $P398, "Undef"
  vivify_147:
    .return ($P398)
  control_395:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P399, exception, "payload"
    .return ($P399)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler_args" :nsentry :subid("56_1294467572.9376") :method :outer("11_1294467572.9376") :multi(_,_)
    .param pmc param_403
.annotate 'line', 140
    new $P402, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P402, control_401
    push_eh $P402
    .lex "self", self
    .lex "$val", param_403
    find_lex $P404, "$val"
    find_lex $P405, "self"
    unless_null $P405, vivify_148
    $P405 = root_new ['parrot';'Hash']
    store_lex "self", $P405
  vivify_148:
    set $P405["compiler_args"], $P404
    .return ($P404)
  control_401:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P406, exception, "payload"
    .return ($P406)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "set_flag" :nsentry :subid("57_1294467572.9376") :method :outer("11_1294467572.9376")
    .param pmc param_410
    .param pmc param_411
.annotate 'line', 143
    new $P409, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P409, control_408
    push_eh $P409
    .lex "self", self
    .lex "$name", param_410
    .lex "$val", param_411
    find_lex $P412, "$val"
    find_lex $P413, "$name"
    find_lex $P414, "self"
    unless_null $P414, vivify_149
    $P414 = root_new ['parrot';'Hash']
    store_lex "self", $P414
  vivify_149:
    set $P414[$P413], $P412
    find_lex $P415, "$val"
    .return ($P415)
  control_408:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P416, exception, "payload"
    .return ($P416)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "full_name" :nsentry :subid("58_1294467572.9376") :method :outer("11_1294467572.9376")
.annotate 'line', 147
    new $P419, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P419, control_418
    push_eh $P419
    .lex "self", self
.annotate 'line', 148
    find_lex $P422, "self"
    unless_null $P422, vivify_150
    $P422 = root_new ['parrot';'Hash']
  vivify_150:
    set $P423, $P422["namespace"]
    unless_null $P423, vivify_151
    new $P423, "Undef"
  vivify_151:
    if $P423, if_421
.annotate 'line', 152
    find_lex $P430, "self"
    $P431 = $P430."name"()
.annotate 'line', 151
    set $P420, $P431
.annotate 'line', 148
    goto if_421_end
  if_421:
.annotate 'line', 149
    find_lex $P424, "self"
    unless_null $P424, vivify_152
    $P424 = root_new ['parrot';'Hash']
  vivify_152:
    set $P425, $P424["namespace"]
    unless_null $P425, vivify_153
    new $P425, "Undef"
  vivify_153:
    $P426 = $P425."Str"()
    find_lex $P427, "self"
    $S428 = $P427."name"()
    concat $P429, $P426, $S428
.annotate 'line', 148
    set $P420, $P429
  if_421_end:
.annotate 'line', 147
    .return ($P420)
  control_418:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P432, exception, "payload"
    .return ($P432)
.end


.namespace ["POST";"Sub"]
.sub "_block433" :load :anon :subid("59_1294467572.9376")
.annotate 'line', 6
    .const 'Sub' $P435 = "11_1294467572.9376" 
    $P436 = $P435()
    .return ($P436)
.end


.namespace []
.sub "_block438" :load :anon :subid("60_1294467572.9376")
.annotate 'line', 1
    .const 'Sub' $P440 = "10_1294467572.9376" 
    $P441 = $P440()
    .return ($P441)
.end

