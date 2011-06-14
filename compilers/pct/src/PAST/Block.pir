
.namespace []
.sub "_block11"  :anon :subid("10_1308013491.05146")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308013491.05146" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 25
    .const 'Sub' $P14 = "11_1308013491.05146" 
    capture_lex $P14
    $P275 = $P14()
.annotate 'line', 1
    .return ($P275)
    .const 'Sub' $P277 = "31_1308013491.05146" 
    .return ($P277)
.end


.namespace []
.sub "" :load :init :subid("post32") :outer("10_1308013491.05146")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308013491.05146" 
    .local pmc block
    set block, $P12
    $P280 = get_root_global ["parrot"], "P6metaclass"
    $P280."new_class"("PAST::Block", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Block"]
.sub "_block13"  :subid("11_1308013491.05146") :outer("10_1308013491.05146")
.annotate 'line', 25
    .const 'Sub' $P259 = "29_1308013491.05146" 
    capture_lex $P259
    .const 'Sub' $P226 = "28_1308013491.05146" 
    capture_lex $P226
    .const 'Sub' $P215 = "27_1308013491.05146" 
    capture_lex $P215
    .const 'Sub' $P204 = "26_1308013491.05146" 
    capture_lex $P204
    .const 'Sub' $P193 = "25_1308013491.05146" 
    capture_lex $P193
    .const 'Sub' $P182 = "24_1308013491.05146" 
    capture_lex $P182
    .const 'Sub' $P174 = "23_1308013491.05146" 
    capture_lex $P174
    .const 'Sub' $P126 = "21_1308013491.05146" 
    capture_lex $P126
    .const 'Sub' $P115 = "20_1308013491.05146" 
    capture_lex $P115
    .const 'Sub' $P105 = "19_1308013491.05146" 
    capture_lex $P105
    .const 'Sub' $P94 = "18_1308013491.05146" 
    capture_lex $P94
    .const 'Sub' $P83 = "17_1308013491.05146" 
    capture_lex $P83
    .const 'Sub' $P72 = "16_1308013491.05146" 
    capture_lex $P72
    .const 'Sub' $P49 = "15_1308013491.05146" 
    capture_lex $P49
    .const 'Sub' $P38 = "14_1308013491.05146" 
    capture_lex $P38
    .const 'Sub' $P27 = "13_1308013491.05146" 
    capture_lex $P27
    .const 'Sub' $P16 = "12_1308013491.05146" 
    capture_lex $P16
.annotate 'line', 219
    get_global $P15, "$subid_suffix"
    unless_null $P15, vivify_33
    new $P15, "Undef"
    set_global "$subid_suffix", $P15
  vivify_33:
.annotate 'line', 25
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 209
    get_global $P225, "$subid_suffix"
.annotate 'line', 240
    .const 'Sub' $P259 = "29_1308013491.05146" 
    newclosure $P270, $P259
.annotate 'line', 25
    .return ($P270)
    .const 'Sub' $P272 = "30_1308013491.05146" 
    .return ($P272)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "blocktype"  :subid("12_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_19 :optional
    .param int has_param_19 :opt_flag
.annotate 'line', 25
    new $P18, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P18, control_17
    push_eh $P18
    .lex "self", self
    if has_param_19, optparam_34
    new $P20, "Undef"
    set param_19, $P20
  optparam_34:
    .lex "$value", param_19
.annotate 'line', 26
    find_lex $P21, "self"
    find_lex $P22, "$value"
    find_lex $P23, "$value"
    defined $I24, $P23
    $P25 = $P21."attr"("blocktype", $P22, $I24)
.annotate 'line', 25
    .return ($P25)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P26, exception, "payload"
    .return ($P26)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "closure"  :subid("13_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_30 :optional
    .param int has_param_30 :opt_flag
.annotate 'line', 35
    new $P29, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P29, control_28
    push_eh $P29
    .lex "self", self
    if has_param_30, optparam_35
    new $P31, "Undef"
    set param_30, $P31
  optparam_35:
    .lex "$value", param_30
.annotate 'line', 36
    find_lex $P32, "self"
    find_lex $P33, "$value"
    find_lex $P34, "$value"
    defined $I35, $P34
    $P36 = $P32."attr"("closure", $P33, $I35)
.annotate 'line', 35
    .return ($P36)
  control_28:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "control"  :subid("14_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_41 :optional
    .param int has_param_41 :opt_flag
.annotate 'line', 45
    new $P40, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P40, control_39
    push_eh $P40
    .lex "self", self
    if has_param_41, optparam_36
    new $P42, "Undef"
    set param_41, $P42
  optparam_36:
    .lex "$value", param_41
.annotate 'line', 46
    find_lex $P43, "self"
    find_lex $P44, "$value"
    find_lex $P45, "$value"
    defined $I46, $P45
    $P47 = $P43."attr"("control", $P44, $I46)
.annotate 'line', 45
    .return ($P47)
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "loadinit"  :subid("15_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_52 :optional
    .param int has_param_52 :opt_flag
.annotate 'line', 65
    new $P51, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P51, control_50
    push_eh $P51
    .lex "self", self
    if has_param_52, optparam_37
    new $P53, "Undef"
    set param_52, $P53
  optparam_37:
    .lex "$value", param_52
.annotate 'line', 66
    new $P54, "Undef"
    .lex "$has_value", $P54
    find_lex $P55, "$value"
    defined $I56, $P55
    new $P57, 'Integer'
    set $P57, $I56
    store_lex "$has_value", $P57
.annotate 'line', 68
    find_lex $P61, "$has_value"
    unless $P61, unless_60
    set $P59, $P61
    goto unless_60_end
  unless_60:
    find_lex $P62, "self"
    exists $I63, $P62["loadinit"]
    new $P59, 'Integer'
    set $P59, $I63
  unless_60_end:
    if $P59, unless_58_end
.annotate 'line', 69
    get_hll_global $P64, ["PAST"], "Stmts"
    $P65 = $P64."new"()
    store_lex "$value", $P65
.annotate 'line', 70
    new $P66, "Integer"
    assign $P66, 1
    store_lex "$has_value", $P66
  unless_58_end:
.annotate 'line', 73
    find_lex $P67, "self"
    find_lex $P68, "$value"
    find_lex $P69, "$has_value"
    $P70 = $P67."attr"("loadinit", $P68, $P69)
.annotate 'line', 65
    .return ($P70)
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, "payload"
    .return ($P71)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "namespace"  :subid("16_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_75 :optional
    .param int has_param_75 :opt_flag
.annotate 'line', 81
    new $P74, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P74, control_73
    push_eh $P74
    .lex "self", self
    if has_param_75, optparam_38
    new $P76, "Undef"
    set param_75, $P76
  optparam_38:
    .lex "$value", param_75
.annotate 'line', 82
    find_lex $P77, "self"
    find_lex $P78, "$value"
    find_lex $P79, "$value"
    defined $I80, $P79
    $P81 = $P77."attr"("namespace", $P78, $I80)
.annotate 'line', 81
    .return ($P81)
  control_73:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, "payload"
    .return ($P82)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "multi"  :subid("17_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_86 :optional
    .param int has_param_86 :opt_flag
.annotate 'line', 89
    new $P85, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P85, control_84
    push_eh $P85
    .lex "self", self
    if has_param_86, optparam_39
    new $P87, "Undef"
    set param_86, $P87
  optparam_39:
    .lex "$value", param_86
.annotate 'line', 90
    find_lex $P88, "self"
    find_lex $P89, "$value"
    find_lex $P90, "$value"
    defined $I91, $P90
    $P92 = $P88."attr"("multi", $P89, $I91)
.annotate 'line', 89
    .return ($P92)
  control_84:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P93, exception, "payload"
    .return ($P93)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "hll"  :subid("18_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_97 :optional
    .param int has_param_97 :opt_flag
.annotate 'line', 97
    new $P96, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P96, control_95
    push_eh $P96
    .lex "self", self
    if has_param_97, optparam_40
    new $P98, "Undef"
    set param_97, $P98
  optparam_40:
    .lex "$value", param_97
.annotate 'line', 98
    find_lex $P99, "self"
    find_lex $P100, "$value"
    find_lex $P101, "$value"
    defined $I102, $P101
    $P103 = $P99."attr"("hll", $P100, $I102)
.annotate 'line', 97
    .return ($P103)
  control_95:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "loadlibs"  :subid("19_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_108 :slurpy
.annotate 'line', 106
    new $P107, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P107, control_106
    push_eh $P107
    .lex "self", self
    .lex "@libs", param_108
.annotate 'line', 107
    find_lex $P109, "self"
    find_lex $P110, "@libs"
    find_lex $P111, "@libs"
    elements $I112, $P111
    $P113 = $P109."attr"("loadlibs", $P110, $I112)
.annotate 'line', 106
    .return ($P113)
  control_106:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "nsentry"  :subid("20_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_118 :optional
    .param int has_param_118 :opt_flag
.annotate 'line', 114
    new $P117, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P117, control_116
    push_eh $P117
    .lex "self", self
    if has_param_118, optparam_41
    new $P119, "Undef"
    set param_118, $P119
  optparam_41:
    .lex "$value", param_118
.annotate 'line', 115
    find_lex $P120, "self"
    find_lex $P121, "$value"
    find_lex $P122, "$value"
    defined $I123, $P122
    $P124 = $P120."attr"("nsentry", $P121, $I123)
.annotate 'line', 114
    .return ($P124)
  control_116:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, "payload"
    .return ($P125)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symbol"  :subid("21_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_129
    .param pmc param_130 :slurpy :named
.annotate 'line', 133
    .const 'Sub' $P154 = "22_1308013491.05146" 
    capture_lex $P154
    new $P128, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P128, control_127
    push_eh $P128
    .lex "self", self
    .lex "$name", param_129
    .lex "%attr", param_130
.annotate 'line', 134
    $P131 = root_new ['parrot';'Hash']
    .lex "%symtable", $P131
.annotate 'line', 141
    $P132 = root_new ['parrot';'Hash']
    .lex "%symbol", $P132
.annotate 'line', 134
    find_lex $P133, "self"
    unless_null $P133, vivify_42
    $P133 = root_new ['parrot';'Hash']
  vivify_42:
    set $P134, $P133["symtable"]
    unless_null $P134, vivify_43
    new $P134, "Undef"
  vivify_43:
    store_lex "%symtable", $P134
.annotate 'line', 136
    find_lex $P136, "%symtable"
    defined $I137, $P136
    if $I137, unless_135_end
.annotate 'line', 137
    $P138 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P138
.annotate 'line', 138
    find_lex $P139, "%symtable"
    find_lex $P140, "self"
    unless_null $P140, vivify_44
    $P140 = root_new ['parrot';'Hash']
    store_lex "self", $P140
  vivify_44:
    set $P140["symtable"], $P139
  unless_135_end:
.annotate 'line', 141
    find_lex $P141, "$name"
    find_lex $P142, "%symtable"
    unless_null $P142, vivify_45
    $P142 = root_new ['parrot';'Hash']
  vivify_45:
    set $P143, $P142[$P141]
    unless_null $P143, vivify_46
    new $P143, "Undef"
  vivify_46:
    store_lex "%symbol", $P143
.annotate 'line', 142
    find_lex $P145, "%symbol"
    defined $I146, $P145
    unless $I146, if_144_end
.annotate 'line', 143
    find_lex $P148, "%attr"
    unless $P148, if_147_end
.annotate 'line', 144
    find_lex $P150, "%attr"
    defined $I151, $P150
    unless $I151, for_undef_47
    iter $P149, $P150
    new $P162, 'ExceptionHandler'
    set_label $P162, loop161_handler
    $P162."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P162
  loop161_test:
    unless $P149, loop161_done
    shift $P152, $P149
  loop161_redo:
    .const 'Sub' $P154 = "22_1308013491.05146" 
    capture_lex $P154
    $P154($P152)
  loop161_next:
    goto loop161_test
  loop161_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, 'type'
    eq $P163, .CONTROL_LOOP_NEXT, loop161_next
    eq $P163, .CONTROL_LOOP_REDO, loop161_redo
  loop161_done:
    pop_eh 
  for_undef_47:
  if_147_end:
.annotate 'line', 146
    new $P164, "Exception"
    set $P164['type'], .CONTROL_RETURN
    find_lex $P165, "%symbol"
    setattribute $P164, 'payload', $P165
    throw $P164
  if_144_end:
.annotate 'line', 149
    find_lex $P167, "%attr"
    unless $P167, if_166_end
.annotate 'line', 150
    find_lex $P168, "%attr"
    find_lex $P169, "$name"
    find_lex $P170, "%symtable"
    unless_null $P170, vivify_51
    $P170 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P170
  vivify_51:
    set $P170[$P169], $P168
  if_166_end:
.annotate 'line', 153
    new $P171, "Exception"
    set $P171['type'], .CONTROL_RETURN
    find_lex $P172, "%attr"
    setattribute $P171, 'payload', $P172
    throw $P171
.annotate 'line', 133
    .return ()
  control_127:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P173, exception, "payload"
    .return ($P173)
.end


.namespace ["PAST";"Block"]
.sub "_block153"  :anon :subid("22_1308013491.05146") :outer("21_1308013491.05146")
    .param pmc param_155
.annotate 'line', 144
    .lex "$_", param_155
    find_lex $P156, "$_"
    find_lex $P157, "%attr"
    unless_null $P157, vivify_48
    $P157 = root_new ['parrot';'Hash']
  vivify_48:
    set $P158, $P157[$P156]
    unless_null $P158, vivify_49
    new $P158, "Undef"
  vivify_49:
    find_lex $P159, "$_"
    find_lex $P160, "%symbol"
    unless_null $P160, vivify_50
    $P160 = root_new ['parrot';'Hash']
    store_lex "%symbol", $P160
  vivify_50:
    set $P160[$P159], $P158
    .return ($P158)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symbol_defaults"  :subid("23_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_177 :slurpy :named
.annotate 'line', 170
    new $P176, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P176, control_175
    push_eh $P176
    .lex "self", self
    .lex "%attr", param_177
.annotate 'line', 171
    find_lex $P178, "self"
    find_lex $P179, "%attr"
    $P180 = $P178."symbol"("", $P179 :flat)
.annotate 'line', 170
    .return ($P180)
  control_175:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P181, exception, "payload"
    .return ($P181)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symtable"  :subid("24_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_185 :optional
    .param int has_param_185 :opt_flag
.annotate 'line', 179
    new $P184, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P184, control_183
    push_eh $P184
    .lex "self", self
    if has_param_185, optparam_52
    new $P186, "Undef"
    set param_185, $P186
  optparam_52:
    .lex "$value", param_185
.annotate 'line', 180
    find_lex $P187, "self"
    find_lex $P188, "$value"
    find_lex $P189, "$value"
    defined $I190, $P189
    $P191 = $P187."attr"("symtable", $P188, $I190)
.annotate 'line', 179
    .return ($P191)
  control_183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "lexical"  :subid("25_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_196 :optional
    .param int has_param_196 :opt_flag
.annotate 'line', 189
    new $P195, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P195, control_194
    push_eh $P195
    .lex "self", self
    if has_param_196, optparam_53
    new $P197, "Undef"
    set param_196, $P197
  optparam_53:
    .lex "$value", param_196
.annotate 'line', 190
    find_lex $P198, "self"
    find_lex $P199, "$value"
    find_lex $P200, "$value"
    defined $I201, $P200
    $P202 = $P198."attr"("lexical", $P199, $I201, 1)
.annotate 'line', 189
    .return ($P202)
  control_194:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P203, exception, "payload"
    .return ($P203)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "compiler"  :subid("26_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_207 :optional
    .param int has_param_207 :opt_flag
.annotate 'line', 199
    new $P206, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P206, control_205
    push_eh $P206
    .lex "self", self
    if has_param_207, optparam_54
    new $P208, "Undef"
    set param_207, $P208
  optparam_54:
    .lex "$value", param_207
.annotate 'line', 200
    find_lex $P209, "self"
    find_lex $P210, "$value"
    find_lex $P211, "$value"
    defined $I212, $P211
    $P213 = $P209."attr"("compiler", $P210, $I212)
.annotate 'line', 199
    .return ($P213)
  control_205:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, "payload"
    .return ($P214)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "scope"  :subid("27_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_218 :slurpy
.annotate 'line', 209
    new $P217, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P217, control_216
    push_eh $P217
    .lex "self", self
    .lex "@value", param_218
.annotate 'line', 210
    find_lex $P219, "self"
    find_lex $P220, "@value"
    find_lex $P221, "@value"
    elements $I222, $P221
    $P223 = $P219."attr"("scope", $P220, $I222)
.annotate 'line', 209
    .return ($P223)
  control_216:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "subid"  :subid("28_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_229 :optional
    .param int has_param_229 :opt_flag
.annotate 'line', 221
    new $P228, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P228, control_227
    push_eh $P228
    .lex "self", self
    if has_param_229, optparam_55
    new $P230, "Undef"
    set param_229, $P230
  optparam_55:
    .lex "$value", param_229
.annotate 'line', 222
    new $P231, "Undef"
    .lex "$has_value", $P231
    find_lex $P232, "$value"
    defined $I233, $P232
    new $P234, 'Integer'
    set $P234, $I233
    store_lex "$has_value", $P234
.annotate 'line', 224
    find_lex $P238, "$has_value"
    unless $P238, unless_237
    set $P236, $P238
    goto unless_237_end
  unless_237:
    find_lex $P239, "self"
    exists $I240, $P239["subid"]
    new $P236, 'Integer'
    set $P236, $I240
  unless_237_end:
    if $P236, unless_235_end
.annotate 'line', 225
    find_lex $P241, "self"
    $P242 = $P241."unique"()
    store_lex "$value", $P242
.annotate 'line', 227
    get_global $P244, "$subid_suffix"
    defined $I245, $P244
    if $I245, unless_243_end
    new $P246, "String"
    assign $P246, "_"
    time $N247
    set $S248, $N247
    concat $P249, $P246, $S248
    set_global "$subid_suffix", $P249
  unless_243_end:
.annotate 'line', 229
    find_lex $P250, "$value"
    get_global $P251, "$subid_suffix"
    concat $P252, $P250, $P251
    store_lex "$value", $P252
.annotate 'line', 230
    new $P253, "Integer"
    assign $P253, 1
    store_lex "$has_value", $P253
  unless_235_end:
.annotate 'line', 233
    find_lex $P254, "self"
    find_lex $P255, "$value"
    find_lex $P256, "$has_value"
    $P257 = $P254."attr"("subid", $P255, $P256)
.annotate 'line', 221
    .return ($P257)
  control_227:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P258, exception, "payload"
    .return ($P258)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "pirflags"  :subid("29_1308013491.05146") :method :outer("11_1308013491.05146")
    .param pmc param_262 :optional
    .param int has_param_262 :opt_flag
.annotate 'line', 240
    new $P261, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P261, control_260
    push_eh $P261
    .lex "self", self
    if has_param_262, optparam_56
    new $P263, "Undef"
    set param_262, $P263
  optparam_56:
    .lex "$value", param_262
.annotate 'line', 241
    find_lex $P264, "self"
    find_lex $P265, "$value"
    find_lex $P266, "$value"
    defined $I267, $P266
    $P268 = $P264."attr"("pirflags", $P265, $I267)
.annotate 'line', 240
    .return ($P268)
  control_260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P269, exception, "payload"
    .return ($P269)
.end


.namespace ["PAST";"Block"]
.sub "_block271" :load :anon :subid("30_1308013491.05146")
.annotate 'line', 25
    .const 'Sub' $P273 = "11_1308013491.05146" 
    $P274 = $P273()
    .return ($P274)
.end


.namespace []
.sub "_block276" :load :anon :subid("31_1308013491.05146")
.annotate 'line', 1
    .const 'Sub' $P278 = "10_1308013491.05146" 
    $P279 = $P278()
    .return ($P279)
.end

