
.namespace []
.sub "_block11"  :anon :subid("10_1306203213.36377")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1306203213.36377" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 25
    .const 'Sub' $P14 = "11_1306203213.36377" 
    capture_lex $P14
    $P187 = $P14()
.annotate 'line', 1
    .return ($P187)
    .const 'Sub' $P189 = "30_1306203213.36377" 
    .return ($P189)
.end


.namespace []
.sub "" :load :init :subid("post31") :outer("10_1306203213.36377")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1306203213.36377" 
    .local pmc block
    set block, $P12
    $P192 = get_root_global ["parrot"], "P6metaclass"
    $P192."new_class"("PAST::Block", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Block"]
.sub "_block13"  :subid("11_1306203213.36377") :outer("10_1306203213.36377")
.annotate 'line', 25
    .const 'Sub' $P171 = "28_1306203213.36377" 
    capture_lex $P171
    .const 'Sub' $P165 = "27_1306203213.36377" 
    capture_lex $P165
    .const 'Sub' $P155 = "26_1306203213.36377" 
    capture_lex $P155
    .const 'Sub' $P144 = "25_1306203213.36377" 
    capture_lex $P144
    .const 'Sub' $P133 = "24_1306203213.36377" 
    capture_lex $P133
    .const 'Sub' $P122 = "23_1306203213.36377" 
    capture_lex $P122
    .const 'Sub' $P114 = "22_1306203213.36377" 
    capture_lex $P114
    .const 'Sub' $P108 = "21_1306203213.36377" 
    capture_lex $P108
    .const 'Sub' $P97 = "20_1306203213.36377" 
    capture_lex $P97
    .const 'Sub' $P87 = "19_1306203213.36377" 
    capture_lex $P87
    .const 'Sub' $P76 = "18_1306203213.36377" 
    capture_lex $P76
    .const 'Sub' $P65 = "17_1306203213.36377" 
    capture_lex $P65
    .const 'Sub' $P54 = "16_1306203213.36377" 
    capture_lex $P54
    .const 'Sub' $P48 = "15_1306203213.36377" 
    capture_lex $P48
    .const 'Sub' $P37 = "14_1306203213.36377" 
    capture_lex $P37
    .const 'Sub' $P26 = "13_1306203213.36377" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1306203213.36377" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 266
    .const 'Sub' $P171 = "28_1306203213.36377" 
    newclosure $P182, $P171
.annotate 'line', 25
    .return ($P182)
    .const 'Sub' $P184 = "29_1306203213.36377" 
    .return ($P184)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "blocktype"  :subid("12_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_18 :optional
    .param int has_param_18 :opt_flag
.annotate 'line', 25
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    if has_param_18, optparam_32
    new $P19, "Undef"
    set param_18, $P19
  optparam_32:
    .lex "$value", param_18
.annotate 'line', 26
    find_lex $P20, "self"
    find_lex $P21, "$value"
    find_lex $P22, "$value"
    defined $I23, $P22
    $P24 = $P20."attr"("blocktype", $P21, $I23)
.annotate 'line', 25
    .return ($P24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "closure"  :subid("13_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_29 :optional
    .param int has_param_29 :opt_flag
.annotate 'line', 35
    new $P28, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P28, control_27
    push_eh $P28
    .lex "self", self
    if has_param_29, optparam_33
    new $P30, "Undef"
    set param_29, $P30
  optparam_33:
    .lex "$value", param_29
.annotate 'line', 36
    find_lex $P31, "self"
    find_lex $P32, "$value"
    find_lex $P33, "$value"
    defined $I34, $P33
    $P35 = $P31."attr"("closure", $P32, $I34)
.annotate 'line', 35
    .return ($P35)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "control"  :subid("14_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_40 :optional
    .param int has_param_40 :opt_flag
.annotate 'line', 45
    new $P39, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P39, control_38
    push_eh $P39
    .lex "self", self
    if has_param_40, optparam_34
    new $P41, "Undef"
    set param_40, $P41
  optparam_34:
    .lex "$value", param_40
.annotate 'line', 46
    find_lex $P42, "self"
    find_lex $P43, "$value"
    find_lex $P44, "$value"
    defined $I45, $P44
    $P46 = $P42."attr"("control", $P43, $I45)
.annotate 'line', 45
    .return ($P46)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "loadinit"  :subid("15_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_51 :optional
    .param int has_param_51 :opt_flag
.annotate 'line', 65
    new $P50, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P50, control_49
    push_eh $P50
    .lex "self", self
    if has_param_51, optparam_35
    new $P52, "Undef"
    set param_51, $P52
  optparam_35:
    .lex "$value", param_51
.annotate 'line', 66

		.local pmc value
		value = find_lex '$value'
		.local int has_value
		has_value = defined value
		if has_value goto getset_value
		$I0 = exists self['loadinit']
		if $I0 goto getset_value
		$P0 = get_hll_global ['PAST'], 'Stmts'
		value = $P0.'new'()
		has_value = 1
		getset_value:
		.tailcall self.'attr'('loadinit', value, has_value)
	
.annotate 'line', 65
    .return ()
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, "payload"
    .return ($P53)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "namespace"  :subid("16_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_57 :optional
    .param int has_param_57 :opt_flag
.annotate 'line', 87
    new $P56, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P56, control_55
    push_eh $P56
    .lex "self", self
    if has_param_57, optparam_36
    new $P58, "Undef"
    set param_57, $P58
  optparam_36:
    .lex "$value", param_57
.annotate 'line', 88
    find_lex $P59, "self"
    find_lex $P60, "$value"
    find_lex $P61, "$value"
    defined $I62, $P61
    $P63 = $P59."attr"("namespace", $P60, $I62)
.annotate 'line', 87
    .return ($P63)
  control_55:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P64, exception, "payload"
    .return ($P64)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "multi"  :subid("17_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_68 :optional
    .param int has_param_68 :opt_flag
.annotate 'line', 95
    new $P67, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P67, control_66
    push_eh $P67
    .lex "self", self
    if has_param_68, optparam_37
    new $P69, "Undef"
    set param_68, $P69
  optparam_37:
    .lex "$value", param_68
.annotate 'line', 96
    find_lex $P70, "self"
    find_lex $P71, "$value"
    find_lex $P72, "$value"
    defined $I73, $P72
    $P74 = $P70."attr"("multi", $P71, $I73)
.annotate 'line', 95
    .return ($P74)
  control_66:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P75, exception, "payload"
    .return ($P75)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "hll"  :subid("18_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_79 :optional
    .param int has_param_79 :opt_flag
.annotate 'line', 103
    new $P78, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P78, control_77
    push_eh $P78
    .lex "self", self
    if has_param_79, optparam_38
    new $P80, "Undef"
    set param_79, $P80
  optparam_38:
    .lex "$value", param_79
.annotate 'line', 104
    find_lex $P81, "self"
    find_lex $P82, "$value"
    find_lex $P83, "$value"
    defined $I84, $P83
    $P85 = $P81."attr"("hll", $P82, $I84)
.annotate 'line', 103
    .return ($P85)
  control_77:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P86, exception, "payload"
    .return ($P86)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "loadlibs"  :subid("19_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_90 :slurpy
.annotate 'line', 112
    new $P89, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P89, control_88
    push_eh $P89
    .lex "self", self
    .lex "@libs", param_90
.annotate 'line', 113
    find_lex $P91, "self"
    find_lex $P92, "@libs"
    find_lex $P93, "@libs"
    elements $I94, $P93
    $P95 = $P91."attr"("loadlibs", $P92, $I94)
.annotate 'line', 112
    .return ($P95)
  control_88:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P96, exception, "payload"
    .return ($P96)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "nsentry"  :subid("20_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_100 :optional
    .param int has_param_100 :opt_flag
.annotate 'line', 120
    new $P99, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P99, control_98
    push_eh $P99
    .lex "self", self
    if has_param_100, optparam_39
    new $P101, "Undef"
    set param_100, $P101
  optparam_39:
    .lex "$value", param_100
.annotate 'line', 121
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I105, $P104
    $P106 = $P102."attr"("nsentry", $P103, $I105)
.annotate 'line', 120
    .return ($P106)
  control_98:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symbol"  :subid("21_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_111
    .param pmc param_112 :slurpy :named
.annotate 'line', 139
    new $P110, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P110, control_109
    push_eh $P110
    .lex "self", self
    .lex "$name", param_111
    .lex "%attr", param_112
.annotate 'line', 140

		.local pmc name
		name = find_lex '$name'
		.local pmc attr
		attr = find_lex '%attr'
		.local pmc symtable
		symtable = self['symtable']
		unless null symtable goto have_symtable
		symtable = new 'Hash'
		self['symtable'] = symtable
	  have_symtable:
		.local pmc symbol
		symbol = symtable[name]
		if null symbol goto symbol_empty
		unless attr goto attr_done
		.local pmc it
		it = iter attr
	  attr_loop:
		unless it goto attr_done
		$S0 = shift it
		$P0 = attr[$S0]
		symbol[$S0] = $P0
		goto attr_loop
	  attr_done:
		.return (symbol)
	  symbol_empty:
		unless attr goto symbol_done
		symtable[name] = attr
	  symbol_done:
		.return (attr)
	
.annotate 'line', 139
    .return ()
  control_109:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symbol_defaults"  :subid("22_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_117 :slurpy :named
.annotate 'line', 187
    new $P116, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P116, control_115
    push_eh $P116
    .lex "self", self
    .lex "%attr", param_117
.annotate 'line', 188
    find_lex $P118, "self"
    find_lex $P119, "%attr"
    $P120 = $P118."symbol"("", $P119 :flat)
.annotate 'line', 187
    .return ($P120)
  control_115:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symtable"  :subid("23_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_125 :optional
    .param int has_param_125 :opt_flag
.annotate 'line', 196
    new $P124, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P124, control_123
    push_eh $P124
    .lex "self", self
    if has_param_125, optparam_40
    new $P126, "Undef"
    set param_125, $P126
  optparam_40:
    .lex "$value", param_125
.annotate 'line', 197
    find_lex $P127, "self"
    find_lex $P128, "$value"
    find_lex $P129, "$value"
    defined $I130, $P129
    $P131 = $P127."attr"("symtable", $P128, $I130)
.annotate 'line', 196
    .return ($P131)
  control_123:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "lexical"  :subid("24_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_136 :optional
    .param int has_param_136 :opt_flag
.annotate 'line', 206
    new $P135, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P135, control_134
    push_eh $P135
    .lex "self", self
    if has_param_136, optparam_41
    new $P137, "Undef"
    set param_136, $P137
  optparam_41:
    .lex "$value", param_136
.annotate 'line', 207
    find_lex $P138, "self"
    find_lex $P139, "$value"
    find_lex $P140, "$value"
    defined $I141, $P140
    $P142 = $P138."attr"("lexical", $P139, $I141, 1)
.annotate 'line', 206
    .return ($P142)
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "compiler"  :subid("25_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_147 :optional
    .param int has_param_147 :opt_flag
.annotate 'line', 216
    new $P146, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P146, control_145
    push_eh $P146
    .lex "self", self
    if has_param_147, optparam_42
    new $P148, "Undef"
    set param_147, $P148
  optparam_42:
    .lex "$value", param_147
.annotate 'line', 217
    find_lex $P149, "self"
    find_lex $P150, "$value"
    find_lex $P151, "$value"
    defined $I152, $P151
    $P153 = $P149."attr"("compiler", $P150, $I152)
.annotate 'line', 216
    .return ($P153)
  control_145:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P154, exception, "payload"
    .return ($P154)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "scope"  :subid("26_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_158 :slurpy
.annotate 'line', 226
    new $P157, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P157, control_156
    push_eh $P157
    .lex "self", self
    .lex "@value", param_158
.annotate 'line', 227
    find_lex $P159, "self"
    find_lex $P160, "@value"
    find_lex $P161, "@value"
    elements $I162, $P161
    $P163 = $P159."attr"("scope", $P160, $I162)
.annotate 'line', 226
    .return ($P163)
  control_156:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "subid"  :subid("27_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_168 :optional
    .param int has_param_168 :opt_flag
.annotate 'line', 236
    new $P167, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P167, control_166
    push_eh $P167
    .lex "self", self
    if has_param_168, optparam_43
    new $P169, "Undef"
    set param_168, $P169
  optparam_43:
    .lex "$value", param_168
.annotate 'line', 237

		.local pmc value
		value = find_lex '$value'
		.local int has_value
		has_value = defined value
		if has_value goto getset_value
		$I0 = exists self['subid']
		if $I0 goto getset_value
		value = self.'unique'()
		.local pmc suffix
		suffix = get_global '$!subid_suffix'
		unless null suffix goto have_suffix
		$N0 = time
		$S0 = $N0
		$S0 = concat '_', $S0
		suffix = box $S0
		set_global '$!subid_suffix', suffix
	  have_suffix:
		value .= suffix
		has_value = 1
	  getset_value:
		.tailcall self.'attr'('subid', value, has_value)
	
.annotate 'line', 236
    .return ()
  control_166:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P170, exception, "payload"
    .return ($P170)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "pirflags"  :subid("28_1306203213.36377") :method :outer("11_1306203213.36377")
    .param pmc param_174 :optional
    .param int has_param_174 :opt_flag
.annotate 'line', 266
    new $P173, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P173, control_172
    push_eh $P173
    .lex "self", self
    if has_param_174, optparam_44
    new $P175, "Undef"
    set param_174, $P175
  optparam_44:
    .lex "$value", param_174
.annotate 'line', 267
    find_lex $P176, "self"
    find_lex $P177, "$value"
    find_lex $P178, "$value"
    defined $I179, $P178
    $P180 = $P176."attr"("pirflags", $P177, $I179)
.annotate 'line', 266
    .return ($P180)
  control_172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P181, exception, "payload"
    .return ($P181)
.end


.namespace ["PAST";"Block"]
.sub "_block183" :load :anon :subid("29_1306203213.36377")
.annotate 'line', 25
    .const 'Sub' $P185 = "11_1306203213.36377" 
    $P186 = $P185()
    .return ($P186)
.end


.namespace []
.sub "_block188" :load :anon :subid("30_1306203213.36377")
.annotate 'line', 1
    .const 'Sub' $P190 = "10_1306203213.36377" 
    $P191 = $P190()
    .return ($P191)
.end

