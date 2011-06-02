
.namespace []
.sub "_block11"  :anon :subid("10_1307045670.11972")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307045670.11972" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 3
    .const 'Sub' $P14 = "11_1307045670.11972" 
    capture_lex $P14
    $P510 = $P14()
.annotate 'line', 1
    .return ($P510)
    .const 'Sub' $P512 = "64_1307045670.11972" 
    .return ($P512)
.end


.namespace []
.sub "" :load :init :subid("post65") :outer("10_1307045670.11972")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307045670.11972" 
    .local pmc block
    set block, $P12
    $P515 = get_root_global ["parrot"], "P6metaclass"
    $P515."new_class"("POST::Sub", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Sub"]
.sub "_block13"  :subid("11_1307045670.11972") :outer("10_1307045670.11972")
.annotate 'line', 3
    .const 'Sub' $P482 = "62_1307045670.11972" 
    capture_lex $P482
    .const 'Sub' $P457 = "61_1307045670.11972" 
    capture_lex $P457
    .const 'Sub' $P441 = "60_1307045670.11972" 
    capture_lex $P441
    .const 'Sub' $P431 = "59_1307045670.11972" 
    capture_lex $P431
    .const 'Sub' $P416 = "58_1307045670.11972" 
    capture_lex $P416
    .const 'Sub' $P409 = "57_1307045670.11972" 
    capture_lex $P409
    .const 'Sub' $P402 = "56_1307045670.11972" 
    capture_lex $P402
    .const 'Sub' $P396 = "55_1307045670.11972" 
    capture_lex $P396
    .const 'Sub' $P389 = "54_1307045670.11972" 
    capture_lex $P389
    .const 'Sub' $P383 = "53_1307045670.11972" 
    capture_lex $P383
    .const 'Sub' $P376 = "52_1307045670.11972" 
    capture_lex $P376
    .const 'Sub' $P370 = "51_1307045670.11972" 
    capture_lex $P370
    .const 'Sub' $P363 = "50_1307045670.11972" 
    capture_lex $P363
    .const 'Sub' $P357 = "49_1307045670.11972" 
    capture_lex $P357
    .const 'Sub' $P350 = "48_1307045670.11972" 
    capture_lex $P350
    .const 'Sub' $P344 = "47_1307045670.11972" 
    capture_lex $P344
    .const 'Sub' $P337 = "46_1307045670.11972" 
    capture_lex $P337
    .const 'Sub' $P331 = "45_1307045670.11972" 
    capture_lex $P331
    .const 'Sub' $P324 = "44_1307045670.11972" 
    capture_lex $P324
    .const 'Sub' $P318 = "43_1307045670.11972" 
    capture_lex $P318
    .const 'Sub' $P311 = "42_1307045670.11972" 
    capture_lex $P311
    .const 'Sub' $P305 = "41_1307045670.11972" 
    capture_lex $P305
    .const 'Sub' $P298 = "40_1307045670.11972" 
    capture_lex $P298
    .const 'Sub' $P292 = "39_1307045670.11972" 
    capture_lex $P292
    .const 'Sub' $P284 = "38_1307045670.11972" 
    capture_lex $P284
    .const 'Sub' $P274 = "37_1307045670.11972" 
    capture_lex $P274
    .const 'Sub' $P267 = "36_1307045670.11972" 
    capture_lex $P267
    .const 'Sub' $P261 = "35_1307045670.11972" 
    capture_lex $P261
    .const 'Sub' $P252 = "34_1307045670.11972" 
    capture_lex $P252
    .const 'Sub' $P242 = "33_1307045670.11972" 
    capture_lex $P242
    .const 'Sub' $P233 = "32_1307045670.11972" 
    capture_lex $P233
    .const 'Sub' $P223 = "31_1307045670.11972" 
    capture_lex $P223
    .const 'Sub' $P214 = "30_1307045670.11972" 
    capture_lex $P214
    .const 'Sub' $P204 = "29_1307045670.11972" 
    capture_lex $P204
    .const 'Sub' $P195 = "28_1307045670.11972" 
    capture_lex $P195
    .const 'Sub' $P185 = "27_1307045670.11972" 
    capture_lex $P185
    .const 'Sub' $P176 = "26_1307045670.11972" 
    capture_lex $P176
    .const 'Sub' $P166 = "25_1307045670.11972" 
    capture_lex $P166
    .const 'Sub' $P157 = "24_1307045670.11972" 
    capture_lex $P157
    .const 'Sub' $P147 = "23_1307045670.11972" 
    capture_lex $P147
    .const 'Sub' $P138 = "22_1307045670.11972" 
    capture_lex $P138
    .const 'Sub' $P128 = "21_1307045670.11972" 
    capture_lex $P128
    .const 'Sub' $P119 = "20_1307045670.11972" 
    capture_lex $P119
    .const 'Sub' $P109 = "19_1307045670.11972" 
    capture_lex $P109
    .const 'Sub' $P101 = "18_1307045670.11972" 
    capture_lex $P101
    .const 'Sub' $P95 = "17_1307045670.11972" 
    capture_lex $P95
    .const 'Sub' $P77 = "16_1307045670.11972" 
    capture_lex $P77
    .const 'Sub' $P53 = "15_1307045670.11972" 
    capture_lex $P53
    .const 'Sub' $P47 = "14_1307045670.11972" 
    capture_lex $P47
    .const 'Sub' $P23 = "13_1307045670.11972" 
    capture_lex $P23
    .const 'Sub' $P17 = "12_1307045670.11972" 
    capture_lex $P17
    get_global $P15, "@paramfmt"
    unless_null $P15, vivify_76
    $P15 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P15
  vivify_76:
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P16, "@paramfmt"
    .return ()
    .const 'Sub' $P489 = "63_1307045670.11972" 
    .return ($P489)
.end


.namespace ["POST";"Sub"]
.sub "" :load :init :subid("post66") :outer("11_1307045670.11972")
.annotate 'line', 3
    .const 'Sub' $P14 = "11_1307045670.11972" 
    .local pmc block
    set block, $P14
.annotate 'line', 5
    new $P492, "String"
    assign $P492, "    .param pmc %0\n"
    get_global $P493, "@paramfmt"
    unless_null $P493, vivify_67
    $P493 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P493
  vivify_67:
    set $P493[0], $P492
.annotate 'line', 6
    new $P494, "String"
    assign $P494, "    .param pmc %0 :optional\n    .param int has_%0 :opt_flag\n"
    get_global $P495, "@paramfmt"
    unless_null $P495, vivify_68
    $P495 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P495
  vivify_68:
    set $P495[1], $P494
.annotate 'line', 7
    new $P496, "String"
    assign $P496, "    .param pmc %0 :slurpy\n"
    get_global $P497, "@paramfmt"
    unless_null $P497, vivify_69
    $P497 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P497
  vivify_69:
    set $P497[2], $P496
.annotate 'line', 8
    new $P498, "String"
    assign $P498, "    .param pmc %0 :slurpy\n"
    get_global $P499, "@paramfmt"
    unless_null $P499, vivify_70
    $P499 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P499
  vivify_70:
    set $P499[3], $P498
.annotate 'line', 9
    new $P500, "String"
    assign $P500, "    .param pmc %0 :named(%1)\n"
    get_global $P501, "@paramfmt"
    unless_null $P501, vivify_71
    $P501 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P501
  vivify_71:
    set $P501[4], $P500
.annotate 'line', 10
    new $P502, "String"
    assign $P502, "    .param pmc %0 :optional :named(%1)\n    .param int has_%0 :opt_flag\n"
    get_global $P503, "@paramfmt"
    unless_null $P503, vivify_72
    $P503 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P503
  vivify_72:
    set $P503[5], $P502
.annotate 'line', 11
    new $P504, "String"
    assign $P504, "    .param pmc %0 :slurpy :named\n"
    get_global $P505, "@paramfmt"
    unless_null $P505, vivify_73
    $P505 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P505
  vivify_73:
    set $P505[6], $P504
.annotate 'line', 12
    new $P506, "String"
    assign $P506, "    .param pmc %0 :slurpy :named\n"
    get_global $P507, "@paramfmt"
    unless_null $P507, vivify_74
    $P507 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P507
  vivify_74:
    set $P507[7], $P506
.annotate 'line', 13
    new $P508, "String"
    assign $P508, "    .param pmc %0 :call_sig\n"
    get_global $P509, "@paramfmt"
    unless_null $P509, vivify_75
    $P509 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P509
  vivify_75:
    set $P509[8], $P508
.annotate 'line', 231
    load_bytecode "nqp-setting.pbc"
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "symtable"  :subid("12_1307045670.11972") :method :outer("11_1307045670.11972")
.annotate 'line', 19
    new $P19, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P19, control_18
    push_eh $P19
    .lex "self", self
    find_lex $P20, "self"
    unless_null $P20, vivify_77
    $P20 = root_new ['parrot';'Hash']
  vivify_77:
    set $P21, $P20["symtable"]
    unless_null $P21, vivify_78
    new $P21, "Undef"
  vivify_78:
    .return ($P21)
  control_18:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "symbol"  :subid("13_1307045670.11972") :method :outer("11_1307045670.11972")
    .param pmc param_26
    .param pmc param_27 :optional
    .param int has_param_27 :opt_flag
.annotate 'line', 26
    new $P25, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P25, control_24
    push_eh $P25
    .lex "self", self
    .lex "$name", param_26
    if has_param_27, optparam_79
    new $P28, "Undef"
    set param_27, $P28
  optparam_79:
    .lex "$value", param_27
.annotate 'line', 27
    $P29 = root_new ['parrot';'Hash']
    .lex "%symtable", $P29
    find_lex $P30, "self"
    unless_null $P30, vivify_80
    $P30 = root_new ['parrot';'Hash']
  vivify_80:
    set $P31, $P30["symtable"]
    unless_null $P31, vivify_81
    new $P31, "Undef"
  vivify_81:
    store_lex "%symtable", $P31
.annotate 'line', 28
    find_lex $P33, "%symtable"
    if $P33, unless_32_end
.annotate 'line', 29
    $P34 = "hash"()
    find_lex $P35, "self"
    unless_null $P35, vivify_82
    $P35 = root_new ['parrot';'Hash']
    store_lex "self", $P35
  vivify_82:
    set $P35["symtable"], $P34
.annotate 'line', 30
    find_lex $P36, "self"
    unless_null $P36, vivify_83
    $P36 = root_new ['parrot';'Hash']
  vivify_83:
    set $P37, $P36["symtable"]
    unless_null $P37, vivify_84
    new $P37, "Undef"
  vivify_84:
    store_lex "%symtable", $P37
  unless_32_end:
.annotate 'line', 33
    find_lex $P39, "$value"
    unless $P39, if_38_end
.annotate 'line', 34
    find_lex $P40, "$value"
    find_lex $P41, "$name"
    find_lex $P42, "%symtable"
    unless_null $P42, vivify_85
    $P42 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P42
  vivify_85:
    set $P42[$P41], $P40
  if_38_end:
.annotate 'line', 33
    find_lex $P43, "$name"
    find_lex $P44, "%symtable"
    unless_null $P44, vivify_86
    $P44 = root_new ['parrot';'Hash']
  vivify_86:
    set $P45, $P44[$P43]
    unless_null $P45, vivify_87
    new $P45, "Undef"
  vivify_87:
.annotate 'line', 26
    .return ($P45)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P46, exception, "payload"
    .return ($P46)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "labels"  :subid("14_1307045670.11972") :method :outer("11_1307045670.11972")
.annotate 'line', 43
    new $P49, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P49, control_48
    push_eh $P49
    .lex "self", self
    find_lex $P50, "self"
    unless_null $P50, vivify_88
    $P50 = root_new ['parrot';'Hash']
  vivify_88:
    set $P51, $P50["labels"]
    unless_null $P51, vivify_89
    new $P51, "Undef"
  vivify_89:
    .return ($P51)
  control_48:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "label"  :subid("15_1307045670.11972") :method :outer("11_1307045670.11972")
    .param pmc param_56
    .param pmc param_57 :optional
    .param int has_param_57 :opt_flag
.annotate 'line', 50
    new $P55, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P55, control_54
    push_eh $P55
    .lex "self", self
    .lex "$name", param_56
    if has_param_57, optparam_90
    new $P58, "Undef"
    set param_57, $P58
  optparam_90:
    .lex "$value", param_57
.annotate 'line', 51
    $P59 = root_new ['parrot';'Hash']
    .lex "%labels", $P59
    find_lex $P60, "self"
    unless_null $P60, vivify_91
    $P60 = root_new ['parrot';'Hash']
  vivify_91:
    set $P61, $P60["labels"]
    unless_null $P61, vivify_92
    new $P61, "Undef"
  vivify_92:
    store_lex "%labels", $P61
.annotate 'line', 52
    find_lex $P63, "%labels"
    if $P63, unless_62_end
.annotate 'line', 53
    $P64 = "hash"()
    find_lex $P65, "self"
    unless_null $P65, vivify_93
    $P65 = root_new ['parrot';'Hash']
    store_lex "self", $P65
  vivify_93:
    set $P65["labels"], $P64
.annotate 'line', 54
    find_lex $P66, "self"
    unless_null $P66, vivify_94
    $P66 = root_new ['parrot';'Hash']
  vivify_94:
    set $P67, $P66["labels"]
    unless_null $P67, vivify_95
    new $P67, "Undef"
  vivify_95:
    store_lex "%labels", $P67
  unless_62_end:
.annotate 'line', 57
    find_lex $P69, "$value"
    unless $P69, if_68_end
.annotate 'line', 58
    find_lex $P70, "$value"
    find_lex $P71, "$name"
    find_lex $P72, "%labels"
    unless_null $P72, vivify_96
    $P72 = root_new ['parrot';'Hash']
    store_lex "%labels", $P72
  vivify_96:
    set $P72[$P71], $P70
  if_68_end:
.annotate 'line', 57
    find_lex $P73, "$name"
    find_lex $P74, "%labels"
    unless_null $P74, vivify_97
    $P74 = root_new ['parrot';'Hash']
  vivify_97:
    set $P75, $P74[$P73]
    unless_null $P75, vivify_98
    new $P75, "Undef"
  vivify_98:
.annotate 'line', 50
    .return ($P75)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P76, exception, "payload"
    .return ($P76)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "param"  :subid("16_1307045670.11972") :method :outer("11_1307045670.11972")
    .param pmc param_80
    .param pmc param_81
.annotate 'line', 68
    new $P79, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P79, control_78
    push_eh $P79
    .lex "self", self
    .lex "$name", param_80
    .lex "$param", param_81
.annotate 'line', 69
    $P82 = root_new ['parrot';'ResizablePMCArray']
    .lex "@params", $P82
    find_lex $P83, "self"
    unless_null $P83, vivify_99
    $P83 = root_new ['parrot';'Hash']
  vivify_99:
    set $P84, $P83["params"]
    unless_null $P84, vivify_100
    new $P84, "Undef"
  vivify_100:
    store_lex "@params", $P84
.annotate 'line', 70
    find_lex $P86, "@params"
    if $P86, unless_85_end
.annotate 'line', 71
    $P87 = "list"()
    find_lex $P88, "self"
    unless_null $P88, vivify_101
    $P88 = root_new ['parrot';'Hash']
    store_lex "self", $P88
  vivify_101:
    set $P88["params"], $P87
.annotate 'line', 72
    find_lex $P89, "self"
    unless_null $P89, vivify_102
    $P89 = root_new ['parrot';'Hash']
  vivify_102:
    set $P90, $P89["params"]
    unless_null $P90, vivify_103
    new $P90, "Undef"
  vivify_103:
    store_lex "@params", $P90
  unless_85_end:
.annotate 'line', 77
    find_lex $P91, "@params"
    find_lex $P92, "$param"
    $P93 = $P91."push"($P92)
.annotate 'line', 68
    .return ($P93)
  control_78:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P94, exception, "payload"
    .return ($P94)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "constant_index"  :subid("17_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 84
    new $P97, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P97, control_96
    push_eh $P97
    .lex "self", self
    find_lex $P98, "self"
    unless_null $P98, vivify_104
    $P98 = root_new ['parrot';'Hash']
  vivify_104:
    set $P99, $P98["constant_index"]
    unless_null $P99, vivify_105
    new $P99, "Undef"
  vivify_105:
    .return ($P99)
  control_96:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "constant_index"  :subid("18_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_104
.annotate 'line', 85
    new $P103, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P103, control_102
    push_eh $P103
    .lex "self", self
    .lex "$idx", param_104
    find_lex $P105, "$idx"
    find_lex $P106, "self"
    unless_null $P106, vivify_106
    $P106 = root_new ['parrot';'Hash']
    store_lex "self", $P106
  vivify_106:
    set $P106["constant_index"], $P105
    find_lex $P107, "$idx"
    .return ($P107)
  control_102:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "main"  :subid("19_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 90
    new $P111, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P111, control_110
    push_eh $P111
    .lex "self", self
    find_lex $P113, "self"
    unless_null $P113, vivify_107
    $P113 = root_new ['parrot';'Hash']
  vivify_107:
    set $P114, $P113["main"]
    unless_null $P114, vivify_108
    new $P114, "Undef"
  vivify_108:
    set $P112, $P114
    defined $I116, $P112
    if $I116, default_115
    new $P117, "Integer"
    assign $P117, 0
    set $P112, $P117
  default_115:
    .return ($P112)
  control_110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, "payload"
    .return ($P118)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "main"  :subid("20_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_122
.annotate 'line', 91
    new $P121, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P121, control_120
    push_eh $P121
    .lex "self", self
    .lex "$val", param_122
    find_lex $P123, "$val"
    istrue $I124, $P123
    new $P125, 'Integer'
    set $P125, $I124
    find_lex $P126, "self"
    unless_null $P126, vivify_109
    $P126 = root_new ['parrot';'Hash']
    store_lex "self", $P126
  vivify_109:
    set $P126["main"], $P125
    .return ($P125)
  control_120:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, "payload"
    .return ($P127)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_init"  :subid("21_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 94
    new $P130, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P130, control_129
    push_eh $P130
    .lex "self", self
    find_lex $P132, "self"
    unless_null $P132, vivify_110
    $P132 = root_new ['parrot';'Hash']
  vivify_110:
    set $P133, $P132["init"]
    unless_null $P133, vivify_111
    new $P133, "Undef"
  vivify_111:
    set $P131, $P133
    defined $I135, $P131
    if $I135, default_134
    new $P136, "Integer"
    assign $P136, 0
    set $P131, $P136
  default_134:
    .return ($P131)
  control_129:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, "payload"
    .return ($P137)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_init"  :subid("22_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_141
.annotate 'line', 95
    new $P140, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P140, control_139
    push_eh $P140
    .lex "self", self
    .lex "$val", param_141
    find_lex $P142, "$val"
    istrue $I143, $P142
    new $P144, 'Integer'
    set $P144, $I143
    find_lex $P145, "self"
    unless_null $P145, vivify_112
    $P145 = root_new ['parrot';'Hash']
    store_lex "self", $P145
  vivify_112:
    set $P145["init"], $P144
    .return ($P144)
  control_139:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P146, exception, "payload"
    .return ($P146)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "load"  :subid("23_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 97
    new $P149, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P149, control_148
    push_eh $P149
    .lex "self", self
    find_lex $P151, "self"
    unless_null $P151, vivify_113
    $P151 = root_new ['parrot';'Hash']
  vivify_113:
    set $P152, $P151["load"]
    unless_null $P152, vivify_114
    new $P152, "Undef"
  vivify_114:
    set $P150, $P152
    defined $I154, $P150
    if $I154, default_153
    new $P155, "Integer"
    assign $P155, 0
    set $P150, $P155
  default_153:
    .return ($P150)
  control_148:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "load"  :subid("24_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_160
.annotate 'line', 98
    new $P159, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P159, control_158
    push_eh $P159
    .lex "self", self
    .lex "$val", param_160
    find_lex $P161, "$val"
    istrue $I162, $P161
    new $P163, 'Integer'
    set $P163, $I162
    find_lex $P164, "self"
    unless_null $P164, vivify_115
    $P164 = root_new ['parrot';'Hash']
    store_lex "self", $P164
  vivify_115:
    set $P164["load"], $P163
    .return ($P163)
  control_158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, "payload"
    .return ($P165)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "immediate"  :subid("25_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 100
    new $P168, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P168, control_167
    push_eh $P168
    .lex "self", self
    find_lex $P170, "self"
    unless_null $P170, vivify_116
    $P170 = root_new ['parrot';'Hash']
  vivify_116:
    set $P171, $P170["immediate"]
    unless_null $P171, vivify_117
    new $P171, "Undef"
  vivify_117:
    set $P169, $P171
    defined $I173, $P169
    if $I173, default_172
    new $P174, "Integer"
    assign $P174, 0
    set $P169, $P174
  default_172:
    .return ($P169)
  control_167:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P175, exception, "payload"
    .return ($P175)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "immediate"  :subid("26_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_179
.annotate 'line', 101
    new $P178, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P178, control_177
    push_eh $P178
    .lex "self", self
    .lex "$val", param_179
    find_lex $P180, "$val"
    istrue $I181, $P180
    new $P182, 'Integer'
    set $P182, $I181
    find_lex $P183, "self"
    unless_null $P183, vivify_118
    $P183 = root_new ['parrot';'Hash']
    store_lex "self", $P183
  vivify_118:
    set $P183["immediate"], $P182
    .return ($P182)
  control_177:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P184, exception, "payload"
    .return ($P184)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "postcomp"  :subid("27_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 103
    new $P187, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P187, control_186
    push_eh $P187
    .lex "self", self
    find_lex $P189, "self"
    unless_null $P189, vivify_119
    $P189 = root_new ['parrot';'Hash']
  vivify_119:
    set $P190, $P189["postcomp"]
    unless_null $P190, vivify_120
    new $P190, "Undef"
  vivify_120:
    set $P188, $P190
    defined $I192, $P188
    if $I192, default_191
    new $P193, "Integer"
    assign $P193, 0
    set $P188, $P193
  default_191:
    .return ($P188)
  control_186:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P194, exception, "payload"
    .return ($P194)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "postcomp"  :subid("28_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_198
.annotate 'line', 104
    new $P197, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P197, control_196
    push_eh $P197
    .lex "self", self
    .lex "$val", param_198
    find_lex $P199, "$val"
    istrue $I200, $P199
    new $P201, 'Integer'
    set $P201, $I200
    find_lex $P202, "self"
    unless_null $P202, vivify_121
    $P202 = root_new ['parrot';'Hash']
    store_lex "self", $P202
  vivify_121:
    set $P202["postcomp"], $P201
    .return ($P201)
  control_196:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P203, exception, "payload"
    .return ($P203)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "anon"  :subid("29_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 106
    new $P206, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P206, control_205
    push_eh $P206
    .lex "self", self
    find_lex $P208, "self"
    unless_null $P208, vivify_122
    $P208 = root_new ['parrot';'Hash']
  vivify_122:
    set $P209, $P208["anon"]
    unless_null $P209, vivify_123
    new $P209, "Undef"
  vivify_123:
    set $P207, $P209
    defined $I211, $P207
    if $I211, default_210
    new $P212, "Integer"
    assign $P212, 0
    set $P207, $P212
  default_210:
    .return ($P207)
  control_205:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P213, exception, "payload"
    .return ($P213)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "anon"  :subid("30_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_217
.annotate 'line', 107
    new $P216, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P216, control_215
    push_eh $P216
    .lex "self", self
    .lex "$val", param_217
    find_lex $P218, "$val"
    istrue $I219, $P218
    new $P220, 'Integer'
    set $P220, $I219
    find_lex $P221, "self"
    unless_null $P221, vivify_124
    $P221 = root_new ['parrot';'Hash']
    store_lex "self", $P221
  vivify_124:
    set $P221["anon"], $P220
    .return ($P220)
  control_215:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P222, exception, "payload"
    .return ($P222)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_method"  :subid("31_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 109
    new $P225, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P225, control_224
    push_eh $P225
    .lex "self", self
    find_lex $P227, "self"
    unless_null $P227, vivify_125
    $P227 = root_new ['parrot';'Hash']
  vivify_125:
    set $P228, $P227["method"]
    unless_null $P228, vivify_126
    new $P228, "Undef"
  vivify_126:
    set $P226, $P228
    defined $I230, $P226
    if $I230, default_229
    new $P231, "Integer"
    assign $P231, 0
    set $P226, $P231
  default_229:
    .return ($P226)
  control_224:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_method"  :subid("32_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_236
.annotate 'line', 110
    new $P235, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P235, control_234
    push_eh $P235
    .lex "self", self
    .lex "$val", param_236
    find_lex $P237, "$val"
    istrue $I238, $P237
    new $P239, 'Integer'
    set $P239, $I238
    find_lex $P240, "self"
    unless_null $P240, vivify_127
    $P240 = root_new ['parrot';'Hash']
    store_lex "self", $P240
  vivify_127:
    set $P240["method"], $P239
    .return ($P239)
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P241, exception, "payload"
    .return ($P241)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "lex"  :subid("33_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 112
    new $P244, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P244, control_243
    push_eh $P244
    .lex "self", self
    find_lex $P246, "self"
    unless_null $P246, vivify_128
    $P246 = root_new ['parrot';'Hash']
  vivify_128:
    set $P247, $P246["lex"]
    unless_null $P247, vivify_129
    new $P247, "Undef"
  vivify_129:
    set $P245, $P247
    defined $I249, $P245
    if $I249, default_248
    new $P250, "Integer"
    assign $P250, 0
    set $P245, $P250
  default_248:
    .return ($P245)
  control_243:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P251, exception, "payload"
    .return ($P251)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "lex"  :subid("34_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_255
.annotate 'line', 113
    new $P254, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P254, control_253
    push_eh $P254
    .lex "self", self
    .lex "$val", param_255
    find_lex $P256, "$val"
    istrue $I257, $P256
    new $P258, 'Integer'
    set $P258, $I257
    find_lex $P259, "self"
    unless_null $P259, vivify_130
    $P259 = root_new ['parrot';'Hash']
    store_lex "self", $P259
  vivify_130:
    set $P259["lex"], $P258
    .return ($P258)
  control_253:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P260, exception, "payload"
    .return ($P260)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "nsentry"  :subid("35_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 115
    new $P263, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P263, control_262
    push_eh $P263
    .lex "self", self
    find_lex $P264, "self"
    unless_null $P264, vivify_131
    $P264 = root_new ['parrot';'Hash']
  vivify_131:
    set $P265, $P264["nsentry"]
    unless_null $P265, vivify_132
    new $P265, "Undef"
  vivify_132:
    .return ($P265)
  control_262:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "nsentry"  :subid("36_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_270
.annotate 'line', 116
    new $P269, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P269, control_268
    push_eh $P269
    .lex "self", self
    .lex "$val", param_270
    find_lex $P271, "$val"
    find_lex $P272, "self"
    unless_null $P272, vivify_133
    $P272 = root_new ['parrot';'Hash']
    store_lex "self", $P272
  vivify_133:
    set $P272["nsentry"], $P271
    .return ($P271)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P273, exception, "payload"
    .return ($P273)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "vtable"  :subid("37_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 118
    new $P276, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P276, control_275
    push_eh $P276
    .lex "self", self
    find_lex $P278, "self"
    unless_null $P278, vivify_134
    $P278 = root_new ['parrot';'Hash']
  vivify_134:
    set $P279, $P278["vtable"]
    unless_null $P279, vivify_135
    new $P279, "Undef"
  vivify_135:
    set $P277, $P279
    defined $I281, $P277
    if $I281, default_280
    new $P282, "Integer"
    assign $P282, -1
    set $P277, $P282
  default_280:
    .return ($P277)
  control_275:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P283, exception, "payload"
    .return ($P283)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "vtable"  :subid("38_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_287
.annotate 'line', 119
    new $P286, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P286, control_285
    push_eh $P286
    .lex "self", self
    .lex "$val", param_287
    find_lex $P288, "$val"
    find_lex $P289, "self"
    unless_null $P289, vivify_136
    $P289 = root_new ['parrot';'Hash']
    store_lex "self", $P289
  vivify_136:
    set $P289["vtable"], $P288
    find_lex $P290, "$val"
    .return ($P290)
  control_285:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P291, exception, "payload"
    .return ($P291)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "blocktype"  :subid("39_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 121
    new $P294, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P294, control_293
    push_eh $P294
    .lex "self", self
    find_lex $P295, "self"
    unless_null $P295, vivify_137
    $P295 = root_new ['parrot';'Hash']
  vivify_137:
    set $P296, $P295["blocktype"]
    unless_null $P296, vivify_138
    new $P296, "Undef"
  vivify_138:
    .return ($P296)
  control_293:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P297, exception, "payload"
    .return ($P297)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "blocktype"  :subid("40_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_301
.annotate 'line', 122
    new $P300, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P300, control_299
    push_eh $P300
    .lex "self", self
    .lex "$val", param_301
    find_lex $P302, "$val"
    find_lex $P303, "self"
    unless_null $P303, vivify_139
    $P303 = root_new ['parrot';'Hash']
    store_lex "self", $P303
  vivify_139:
    set $P303["blocktype"], $P302
    .return ($P302)
  control_299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P304, exception, "payload"
    .return ($P304)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "namespace"  :subid("41_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 124
    new $P307, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P307, control_306
    push_eh $P307
    .lex "self", self
    find_lex $P308, "self"
    unless_null $P308, vivify_140
    $P308 = root_new ['parrot';'Hash']
  vivify_140:
    set $P309, $P308["namespace"]
    unless_null $P309, vivify_141
    new $P309, "Undef"
  vivify_141:
    .return ($P309)
  control_306:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P310, exception, "payload"
    .return ($P310)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "namespace"  :subid("42_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_314
.annotate 'line', 125
    new $P313, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P313, control_312
    push_eh $P313
    .lex "self", self
    .lex "$val", param_314
    find_lex $P315, "$val"
    find_lex $P316, "self"
    unless_null $P316, vivify_142
    $P316 = root_new ['parrot';'Hash']
    store_lex "self", $P316
  vivify_142:
    set $P316["namespace"], $P315
    .return ($P315)
  control_312:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P317, exception, "payload"
    .return ($P317)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "hll"  :subid("43_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 127
    new $P320, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P320, control_319
    push_eh $P320
    .lex "self", self
    find_lex $P321, "self"
    unless_null $P321, vivify_143
    $P321 = root_new ['parrot';'Hash']
  vivify_143:
    set $P322, $P321["hll"]
    unless_null $P322, vivify_144
    new $P322, "Undef"
  vivify_144:
    .return ($P322)
  control_319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P323, exception, "payload"
    .return ($P323)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "hll"  :subid("44_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_327
.annotate 'line', 128
    new $P326, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P326, control_325
    push_eh $P326
    .lex "self", self
    .lex "$val", param_327
    find_lex $P328, "$val"
    find_lex $P329, "self"
    unless_null $P329, vivify_145
    $P329 = root_new ['parrot';'Hash']
    store_lex "self", $P329
  vivify_145:
    set $P329["hll"], $P328
    .return ($P328)
  control_325:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P330, exception, "payload"
    .return ($P330)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "loadlibs"  :subid("45_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 130
    new $P333, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P333, control_332
    push_eh $P333
    .lex "self", self
    find_lex $P334, "self"
    unless_null $P334, vivify_146
    $P334 = root_new ['parrot';'Hash']
  vivify_146:
    set $P335, $P334["loadlibs"]
    unless_null $P335, vivify_147
    new $P335, "Undef"
  vivify_147:
    .return ($P335)
  control_332:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P336, exception, "payload"
    .return ($P336)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "loadlibs"  :subid("46_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_340
.annotate 'line', 131
    new $P339, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P339, control_338
    push_eh $P339
    .lex "self", self
    .lex "$val", param_340
    find_lex $P341, "$val"
    find_lex $P342, "self"
    unless_null $P342, vivify_148
    $P342 = root_new ['parrot';'Hash']
    store_lex "self", $P342
  vivify_148:
    set $P342["loadlibs"], $P341
    .return ($P341)
  control_338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P343, exception, "payload"
    .return ($P343)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "outer"  :subid("47_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 133
    new $P346, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P346, control_345
    push_eh $P346
    .lex "self", self
    find_lex $P347, "self"
    unless_null $P347, vivify_149
    $P347 = root_new ['parrot';'Hash']
  vivify_149:
    set $P348, $P347["outer"]
    unless_null $P348, vivify_150
    new $P348, "Undef"
  vivify_150:
    .return ($P348)
  control_345:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P349, exception, "payload"
    .return ($P349)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "outer"  :subid("48_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_353
.annotate 'line', 134
    new $P352, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P352, control_351
    push_eh $P352
    .lex "self", self
    .lex "$val", param_353
    find_lex $P354, "$val"
    find_lex $P355, "self"
    unless_null $P355, vivify_151
    $P355 = root_new ['parrot';'Hash']
    store_lex "self", $P355
  vivify_151:
    set $P355["outer"], $P354
    .return ($P354)
  control_351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P356, exception, "payload"
    .return ($P356)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "multi"  :subid("49_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 136
    new $P359, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P359, control_358
    push_eh $P359
    .lex "self", self
    find_lex $P360, "self"
    unless_null $P360, vivify_152
    $P360 = root_new ['parrot';'Hash']
  vivify_152:
    set $P361, $P360["multi"]
    unless_null $P361, vivify_153
    new $P361, "Undef"
  vivify_153:
    .return ($P361)
  control_358:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P362, exception, "payload"
    .return ($P362)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "multi"  :subid("50_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_366
.annotate 'line', 137
    new $P365, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P365, control_364
    push_eh $P365
    .lex "self", self
    .lex "$val", param_366
    find_lex $P367, "$val"
    find_lex $P368, "self"
    unless_null $P368, vivify_154
    $P368 = root_new ['parrot';'Hash']
    store_lex "self", $P368
  vivify_154:
    set $P368["multi"], $P367
    .return ($P367)
  control_364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P369, exception, "payload"
    .return ($P369)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "pirflags"  :subid("51_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 139
    new $P372, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P372, control_371
    push_eh $P372
    .lex "self", self
    find_lex $P373, "self"
    unless_null $P373, vivify_155
    $P373 = root_new ['parrot';'Hash']
  vivify_155:
    set $P374, $P373["pirflags"]
    unless_null $P374, vivify_156
    new $P374, "Undef"
  vivify_156:
    .return ($P374)
  control_371:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, "payload"
    .return ($P375)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "pirflags"  :subid("52_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_379
.annotate 'line', 140
    new $P378, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P378, control_377
    push_eh $P378
    .lex "self", self
    .lex "$val", param_379
    find_lex $P380, "$val"
    find_lex $P381, "self"
    unless_null $P381, vivify_157
    $P381 = root_new ['parrot';'Hash']
    store_lex "self", $P381
  vivify_157:
    set $P381["pirflags"], $P380
    .return ($P380)
  control_377:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P382, exception, "payload"
    .return ($P382)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler"  :subid("53_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 142
    new $P385, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P385, control_384
    push_eh $P385
    .lex "self", self
    find_lex $P386, "self"
    unless_null $P386, vivify_158
    $P386 = root_new ['parrot';'Hash']
  vivify_158:
    set $P387, $P386["compiler"]
    unless_null $P387, vivify_159
    new $P387, "Undef"
  vivify_159:
    .return ($P387)
  control_384:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P388, exception, "payload"
    .return ($P388)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler"  :subid("54_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_392
.annotate 'line', 143
    new $P391, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P391, control_390
    push_eh $P391
    .lex "self", self
    .lex "$val", param_392
    find_lex $P393, "$val"
    find_lex $P394, "self"
    unless_null $P394, vivify_160
    $P394 = root_new ['parrot';'Hash']
    store_lex "self", $P394
  vivify_160:
    set $P394["compiler"], $P393
    .return ($P393)
  control_390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P395, exception, "payload"
    .return ($P395)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler_args"  :subid("55_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 145
    new $P398, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P398, control_397
    push_eh $P398
    .lex "self", self
    find_lex $P399, "self"
    unless_null $P399, vivify_161
    $P399 = root_new ['parrot';'Hash']
  vivify_161:
    set $P400, $P399["compiler_args"]
    unless_null $P400, vivify_162
    new $P400, "Undef"
  vivify_162:
    .return ($P400)
  control_397:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P401, exception, "payload"
    .return ($P401)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler_args"  :subid("56_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_405
.annotate 'line', 146
    new $P404, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P404, control_403
    push_eh $P404
    .lex "self", self
    .lex "$val", param_405
    find_lex $P406, "$val"
    find_lex $P407, "self"
    unless_null $P407, vivify_163
    $P407 = root_new ['parrot';'Hash']
    store_lex "self", $P407
  vivify_163:
    set $P407["compiler_args"], $P406
    .return ($P406)
  control_403:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P408, exception, "payload"
    .return ($P408)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "subid"  :subid("57_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_,_)
    .param pmc param_412
.annotate 'line', 148
    new $P411, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P411, control_410
    push_eh $P411
    .lex "self", self
    .lex "$value", param_412
    find_lex $P413, "$value"
    find_lex $P414, "self"
    unless_null $P414, vivify_164
    $P414 = root_new ['parrot';'Hash']
    store_lex "self", $P414
  vivify_164:
    set $P414["subid"], $P413
    .return ($P413)
  control_410:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P415, exception, "payload"
    .return ($P415)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "subid"  :subid("58_1307045670.11972") :method :outer("11_1307045670.11972") :multi(_)
.annotate 'line', 149
    new $P418, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P418, control_417
    push_eh $P418
    .lex "self", self
.annotate 'line', 150
    new $P419, "Undef"
    .lex "$value", $P419
    find_lex $P420, "self"
    unless_null $P420, vivify_165
    $P420 = root_new ['parrot';'Hash']
  vivify_165:
    set $P421, $P420["subid"]
    unless_null $P421, vivify_166
    new $P421, "Undef"
  vivify_166:
    store_lex "$value", $P421
.annotate 'line', 151
    find_lex $P423, "$value"
    defined $I424, $P423
    if $I424, unless_422_end
.annotate 'line', 152
    find_lex $P425, "self"
    $P426 = $P425."unique"("post")
    store_lex "$value", $P426
.annotate 'line', 153
    find_lex $P427, "$value"
    find_lex $P428, "self"
    unless_null $P428, vivify_167
    $P428 = root_new ['parrot';'Hash']
    store_lex "self", $P428
  vivify_167:
    set $P428["subid"], $P427
  unless_422_end:
.annotate 'line', 151
    find_lex $P429, "$value"
.annotate 'line', 149
    .return ($P429)
  control_417:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P430, exception, "payload"
    .return ($P430)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "set_flag"  :subid("59_1307045670.11972") :method :outer("11_1307045670.11972")
    .param pmc param_434
    .param pmc param_435
.annotate 'line', 158
    new $P433, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P433, control_432
    push_eh $P433
    .lex "self", self
    .lex "$name", param_434
    .lex "$val", param_435
    find_lex $P436, "$val"
    find_lex $P437, "$name"
    find_lex $P438, "self"
    unless_null $P438, vivify_168
    $P438 = root_new ['parrot';'Hash']
    store_lex "self", $P438
  vivify_168:
    set $P438[$P437], $P436
    find_lex $P439, "$val"
    .return ($P439)
  control_432:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P440, exception, "payload"
    .return ($P440)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "full_name"  :subid("60_1307045670.11972") :method :outer("11_1307045670.11972")
.annotate 'line', 162
    new $P443, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P443, control_442
    push_eh $P443
    .lex "self", self
.annotate 'line', 163
    find_lex $P446, "self"
    unless_null $P446, vivify_169
    $P446 = root_new ['parrot';'Hash']
  vivify_169:
    set $P447, $P446["namespace"]
    unless_null $P447, vivify_170
    new $P447, "Undef"
  vivify_170:
    if $P447, if_445
.annotate 'line', 167
    find_lex $P454, "self"
    $P455 = $P454."name"()
.annotate 'line', 166
    set $P444, $P455
.annotate 'line', 163
    goto if_445_end
  if_445:
.annotate 'line', 164
    find_lex $P448, "self"
    unless_null $P448, vivify_171
    $P448 = root_new ['parrot';'Hash']
  vivify_171:
    set $P449, $P448["namespace"]
    unless_null $P449, vivify_172
    new $P449, "Undef"
  vivify_172:
    $P450 = $P449."Str"()
    find_lex $P451, "self"
    $S452 = $P451."name"()
    concat $P453, $P450, $S452
.annotate 'line', 163
    set $P444, $P453
  if_445_end:
.annotate 'line', 162
    .return ($P444)
  control_442:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P456, exception, "payload"
    .return ($P456)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "add_directive"  :subid("61_1307045670.11972") :method :outer("11_1307045670.11972")
    .param pmc param_460
.annotate 'line', 171
    new $P459, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P459, control_458
    push_eh $P459
    .lex "self", self
    .lex "$line", param_460
.annotate 'line', 172
    new $P461, "Undef"
    .lex "$dlist", $P461
    find_lex $P462, "self"
    unless_null $P462, vivify_173
    $P462 = root_new ['parrot';'Hash']
  vivify_173:
    set $P463, $P462["directives"]
    unless_null $P463, vivify_174
    new $P463, "Undef"
  vivify_174:
    store_lex "$dlist", $P463
.annotate 'line', 173
    find_lex $P466, "$dlist"
    set $S467, $P466
    find_lex $P468, "$line"
    set $S469, $P468
    index $I470, $S467, $S469
    set $N471, $I470
    islt $I472, $N471, 0.0
    if $I472, if_465
    new $P464, 'Integer'
    set $P464, $I472
    goto if_465_end
  if_465:
.annotate 'line', 174
    find_lex $P473, "$dlist"
    set $S474, $P473
    new $P475, 'String'
    set $P475, $S474
    find_lex $P476, "$line"
    set $S477, $P476
    concat $P478, $P475, $S477
    concat $P479, $P478, "\n"
    find_lex $P480, "self"
    unless_null $P480, vivify_175
    $P480 = root_new ['parrot';'Hash']
    store_lex "self", $P480
  vivify_175:
    set $P480["directives"], $P479
.annotate 'line', 173
    set $P464, $P479
  if_465_end:
.annotate 'line', 171
    .return ($P464)
  control_458:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P481, exception, "payload"
    .return ($P481)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "add_param"  :subid("62_1307045670.11972") :method :outer("11_1307045670.11972")
    .param pmc param_485
    .param pmc param_486 :slurpy :named
.annotate 'line', 179
    new $P484, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P484, control_483
    push_eh $P484
    .lex "self", self
    .lex "$pname", param_485
    .lex "%adverbs", param_486
.annotate 'line', 180

    .local pmc pname
    .local pmc adverbs

    find_lex pname, '$pname'
    find_lex adverbs, '%adverbs'

    .local int optional, slurpy, call_sig
    .local string named
    optional = adverbs['optional']
    slurpy = adverbs['slurpy']
    named = adverbs['named']
    call_sig = adverbs['call_sig']

    .local int paramseq
    paramseq = isne optional, 0
    unless slurpy goto slurpy_done
    paramseq += 2
  slurpy_done:
    unless named goto named_done
    paramseq += 4
  named_done:
    unless call_sig goto call_sig_done
    paramseq += 8
  call_sig_done:

    .local pmc paramlist
    paramlist = self['paramlist']
    unless null paramlist goto have_paramlist
    paramlist = new 'ResizablePMCArray'
    self['paramlist'] = paramlist
  have_paramlist:

    .local pmc code
    code = paramlist[paramseq]
    unless null code goto have_code
    code = new 'StringBuilder'
    paramlist[paramseq] = code
  have_code:

    .local pmc paramfmt
    paramfmt = get_hll_global ['POST';'Sub'], '@paramfmt'
    $S0 = paramfmt[paramseq]
    named = self.'escape'(named)
    code.'append_format'($S0, pname, named)

    .return ()
    
.annotate 'line', 179
    .return ()
  control_483:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P487, exception, "payload"
    .return ($P487)
.end


.namespace ["POST";"Sub"]
.sub "_block488" :load :anon :subid("63_1307045670.11972")
.annotate 'line', 3
    .const 'Sub' $P490 = "11_1307045670.11972" 
    $P491 = $P490()
    .return ($P491)
.end


.namespace []
.sub "_block511" :load :anon :subid("64_1307045670.11972")
.annotate 'line', 1
    .const 'Sub' $P513 = "10_1307045670.11972" 
    $P514 = $P513()
    .return ($P514)
.end

