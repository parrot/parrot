
.namespace []
.sub "_block1000"  :anon :subid("10_1308206309.65745")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206309.65745" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 25
    .const 'Sub' $P1003 = "11_1308206309.65745" 
    capture_lex $P1003
    $P273 = $P1003()
.annotate 'line', 1
    .return ($P273)
    .const 'Sub' $P1108 = "32_1308206309.65745" 
    .return ($P1108)
.end


.namespace []
.sub "" :load :init :subid("post33") :outer("10_1308206309.65745")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206309.65745" 
    .local pmc block
    set block, $P1001
    $P1110 = get_root_global ["parrot"], "P6metaclass"
    $P1110."new_class"("PAST::Block", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Block"]
.sub "_block1002"  :subid("11_1308206309.65745") :outer("10_1308206309.65745")
.annotate 'line', 25
    .const 'Sub' $P1099 = "30_1308206309.65745" 
    capture_lex $P1099
    .const 'Sub' $P1095 = "29_1308206309.65745" 
    capture_lex $P1095
    .const 'Sub' $P1087 = "28_1308206309.65745" 
    capture_lex $P1087
    .const 'Sub' $P1083 = "27_1308206309.65745" 
    capture_lex $P1083
    .const 'Sub' $P1079 = "26_1308206309.65745" 
    capture_lex $P1079
    .const 'Sub' $P1075 = "25_1308206309.65745" 
    capture_lex $P1075
    .const 'Sub' $P1071 = "24_1308206309.65745" 
    capture_lex $P1071
    .const 'Sub' $P1067 = "23_1308206309.65745" 
    capture_lex $P1067
    .const 'Sub' $P1043 = "21_1308206309.65745" 
    capture_lex $P1043
    .const 'Sub' $P1039 = "20_1308206309.65745" 
    capture_lex $P1039
    .const 'Sub' $P1035 = "19_1308206309.65745" 
    capture_lex $P1035
    .const 'Sub' $P1031 = "18_1308206309.65745" 
    capture_lex $P1031
    .const 'Sub' $P1027 = "17_1308206309.65745" 
    capture_lex $P1027
    .const 'Sub' $P1023 = "16_1308206309.65745" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "15_1308206309.65745" 
    capture_lex $P1016
    .const 'Sub' $P1012 = "14_1308206309.65745" 
    capture_lex $P1012
    .const 'Sub' $P1008 = "13_1308206309.65745" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308206309.65745" 
    capture_lex $P1004
.annotate 'line', 219
    get_global $P101, "$subid_suffix"
    unless_null $P101, vivify_34
    new $P101, "Undef"
    set_global "$subid_suffix", $P101
  vivify_34:
.annotate 'line', 25
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 209
    get_global $P231, "$subid_suffix"
.annotate 'line', 251
    .const 'Sub' $P1099 = "30_1308206309.65745" 
    newclosure $P1103, $P1099
.annotate 'line', 25
    .return ($P1103)
    .const 'Sub' $P1105 = "31_1308206309.65745" 
    .return ($P1105)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "blocktype"  :subid("12_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'line', 25
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    if has_param_1007, optparam_35
    new $P102, "Undef"
    set param_1007, $P102
  optparam_35:
    .lex "$value", param_1007
.annotate 'line', 26
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I106, $P105
    $P107 = $P103."attr"("blocktype", $P104, $I106)
.annotate 'line', 25
    .return ($P107)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "closure"  :subid("13_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'line', 35
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_36
    new $P109, "Undef"
    set param_1011, $P109
  optparam_36:
    .lex "$value", param_1011
.annotate 'line', 36
    find_lex $P110, "self"
    find_lex $P111, "$value"
    find_lex $P112, "$value"
    defined $I113, $P112
    $P114 = $P110."attr"("closure", $P111, $I113)
.annotate 'line', 35
    .return ($P114)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, "payload"
    .return ($P115)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "control"  :subid("14_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1015 :optional
    .param int has_param_1015 :opt_flag
.annotate 'line', 45
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    if has_param_1015, optparam_37
    new $P116, "Undef"
    set param_1015, $P116
  optparam_37:
    .lex "$value", param_1015
.annotate 'line', 46
    find_lex $P117, "self"
    find_lex $P118, "$value"
    find_lex $P119, "$value"
    defined $I120, $P119
    $P121 = $P117."attr"("control", $P118, $I120)
.annotate 'line', 45
    .return ($P121)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, "payload"
    .return ($P122)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "loadinit"  :subid("15_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1019 :optional
    .param int has_param_1019 :opt_flag
.annotate 'line', 65
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    if has_param_1019, optparam_38
    new $P123, "Undef"
    set param_1019, $P123
  optparam_38:
    .lex "$value", param_1019
.annotate 'line', 66
    new $P124, "Undef"
    set $P1020, $P124
    .lex "$has_value", $P1020
    find_lex $P125, "$value"
    defined $I126, $P125
    new $P127, 'Integer'
    set $P127, $I126
    store_lex "$has_value", $P127
.annotate 'line', 68
    find_lex $P129, "$has_value"
    unless $P129, unless_1022
    set $P128, $P129
    goto unless_1022_end
  unless_1022:
    find_lex $P130, "self"
    exists $I131, $P130["loadinit"]
    new $P128, 'Integer'
    set $P128, $I131
  unless_1022_end:
    if $P128, unless_1021_end
.annotate 'line', 69
    get_hll_global $P132, ["PAST"], "Stmts"
    $P133 = $P132."new"()
    store_lex "$value", $P133
.annotate 'line', 70
    new $P134, "Integer"
    assign $P134, 1
    store_lex "$has_value", $P134
  unless_1021_end:
.annotate 'line', 73
    find_lex $P135, "self"
    find_lex $P136, "$value"
    find_lex $P137, "$has_value"
    $P138 = $P135."attr"("loadinit", $P136, $P137)
.annotate 'line', 65
    .return ($P138)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P139, exception, "payload"
    .return ($P139)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "namespace"  :subid("16_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1026 :optional
    .param int has_param_1026 :opt_flag
.annotate 'line', 81
    new $P1025, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1025, control_1024
    push_eh $P1025
    .lex "self", self
    if has_param_1026, optparam_39
    new $P140, "Undef"
    set param_1026, $P140
  optparam_39:
    .lex "$value", param_1026
.annotate 'line', 82
    find_lex $P141, "self"
    find_lex $P142, "$value"
    find_lex $P143, "$value"
    defined $I144, $P143
    $P145 = $P141."attr"("namespace", $P142, $I144)
.annotate 'line', 81
    .return ($P145)
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P146, exception, "payload"
    .return ($P146)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "multi"  :subid("17_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1030 :optional
    .param int has_param_1030 :opt_flag
.annotate 'line', 89
    new $P1029, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1029, control_1028
    push_eh $P1029
    .lex "self", self
    if has_param_1030, optparam_40
    new $P147, "Undef"
    set param_1030, $P147
  optparam_40:
    .lex "$value", param_1030
.annotate 'line', 90
    find_lex $P148, "self"
    find_lex $P149, "$value"
    find_lex $P150, "$value"
    defined $I151, $P150
    $P152 = $P148."attr"("multi", $P149, $I151)
.annotate 'line', 89
    .return ($P152)
  control_1028:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, "payload"
    .return ($P153)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "hll"  :subid("18_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1034 :optional
    .param int has_param_1034 :opt_flag
.annotate 'line', 97
    new $P1033, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1033, control_1032
    push_eh $P1033
    .lex "self", self
    if has_param_1034, optparam_41
    new $P154, "Undef"
    set param_1034, $P154
  optparam_41:
    .lex "$value", param_1034
.annotate 'line', 98
    find_lex $P155, "self"
    find_lex $P156, "$value"
    find_lex $P157, "$value"
    defined $I158, $P157
    $P159 = $P155."attr"("hll", $P156, $I158)
.annotate 'line', 97
    .return ($P159)
  control_1032:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P160, exception, "payload"
    .return ($P160)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "loadlibs"  :subid("19_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1038 :slurpy
.annotate 'line', 106
    new $P1037, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1037, control_1036
    push_eh $P1037
    .lex "self", self
    .lex "@libs", param_1038
.annotate 'line', 107
    find_lex $P161, "self"
    find_lex $P162, "@libs"
    find_lex $P163, "@libs"
    elements $I164, $P163
    $P165 = $P161."attr"("loadlibs", $P162, $I164)
.annotate 'line', 106
    .return ($P165)
  control_1036:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P166, exception, "payload"
    .return ($P166)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "nsentry"  :subid("20_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1042 :optional
    .param int has_param_1042 :opt_flag
.annotate 'line', 114
    new $P1041, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1041, control_1040
    push_eh $P1041
    .lex "self", self
    if has_param_1042, optparam_42
    new $P167, "Undef"
    set param_1042, $P167
  optparam_42:
    .lex "$value", param_1042
.annotate 'line', 115
    find_lex $P168, "self"
    find_lex $P169, "$value"
    find_lex $P170, "$value"
    defined $I171, $P170
    $P172 = $P168."attr"("nsentry", $P169, $I171)
.annotate 'line', 114
    .return ($P172)
  control_1040:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P173, exception, "payload"
    .return ($P173)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symbol"  :subid("21_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1046
    .param pmc param_1047 :slurpy :named
.annotate 'line', 133
    .const 'Sub' $P1060 = "22_1308206309.65745" 
    capture_lex $P1060
    new $P1045, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1045, control_1044
    push_eh $P1045
    .lex "self", self
    .lex "$name", param_1046
    .lex "%attr", param_1047
.annotate 'line', 134
    $P1049 = root_new ['parrot';'Hash']
    set $P1048, $P1049
    .lex "%symtable", $P1048
.annotate 'line', 141
    $P1051 = root_new ['parrot';'Hash']
    set $P1050, $P1051
    .lex "%symbol", $P1050
.annotate 'line', 134
    find_lex $P1052, "self"
    unless_null $P1052, vivify_43
    $P1052 = root_new ['parrot';'Hash']
  vivify_43:
    set $P174, $P1052["symtable"]
    unless_null $P174, vivify_44
    new $P174, "Undef"
  vivify_44:
    store_lex "%symtable", $P174
.annotate 'line', 136
    find_lex $P175, "%symtable"
    defined $I176, $P175
    if $I176, unless_1053_end
.annotate 'line', 137
    $P1054 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1054
.annotate 'line', 138
    find_lex $P177, "%symtable"
    find_lex $P1055, "self"
    unless_null $P1055, vivify_45
    $P1055 = root_new ['parrot';'Hash']
    store_lex "self", $P1055
  vivify_45:
    set $P1055["symtable"], $P177
  unless_1053_end:
.annotate 'line', 141
    find_lex $P178, "$name"
    find_lex $P1056, "%symtable"
    unless_null $P1056, vivify_46
    $P1056 = root_new ['parrot';'Hash']
  vivify_46:
    set $P179, $P1056[$P178]
    unless_null $P179, vivify_47
    new $P179, "Undef"
  vivify_47:
    store_lex "%symbol", $P179
.annotate 'line', 142
    find_lex $P180, "%symbol"
    defined $I181, $P180
    unless $I181, if_1057_end
.annotate 'line', 143
    find_lex $P182, "%attr"
    unless $P182, if_1058_end
.annotate 'line', 144
    find_lex $P184, "%attr"
    defined $I185, $P184
    unless $I185, for_undef_48
    iter $P183, $P184
    new $P190, 'ExceptionHandler'
    set_label $P190, loop1064_handler
    $P190."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P190
  loop1064_test:
    unless $P183, loop1064_done
    shift $P186, $P183
  loop1064_redo:
    .const 'Sub' $P1060 = "22_1308206309.65745" 
    capture_lex $P1060
    $P1060($P186)
  loop1064_next:
    goto loop1064_test
  loop1064_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P191, exception, 'type'
    eq $P191, .CONTROL_LOOP_NEXT, loop1064_next
    eq $P191, .CONTROL_LOOP_REDO, loop1064_redo
  loop1064_done:
    pop_eh 
  for_undef_48:
  if_1058_end:
.annotate 'line', 146
    new $P192, "Exception"
    set $P192['type'], .CONTROL_RETURN
    find_lex $P193, "%symbol"
    setattribute $P192, 'payload', $P193
    throw $P192
  if_1057_end:
.annotate 'line', 149
    find_lex $P194, "%attr"
    unless $P194, if_1065_end
.annotate 'line', 150
    find_lex $P195, "%attr"
    find_lex $P196, "$name"
    find_lex $P1066, "%symtable"
    unless_null $P1066, vivify_52
    $P1066 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1066
  vivify_52:
    set $P1066[$P196], $P195
  if_1065_end:
.annotate 'line', 153
    new $P197, "Exception"
    set $P197['type'], .CONTROL_RETURN
    find_lex $P198, "%attr"
    setattribute $P197, 'payload', $P198
    throw $P197
.annotate 'line', 133
    .return ()
  control_1044:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P199, exception, "payload"
    .return ($P199)
.end


.namespace ["PAST";"Block"]
.sub "_block1059"  :anon :subid("22_1308206309.65745") :outer("21_1308206309.65745")
    .param pmc param_1061
.annotate 'line', 144
    .lex "$_", param_1061
    find_lex $P187, "$_"
    find_lex $P1062, "%attr"
    unless_null $P1062, vivify_49
    $P1062 = root_new ['parrot';'Hash']
  vivify_49:
    set $P188, $P1062[$P187]
    unless_null $P188, vivify_50
    new $P188, "Undef"
  vivify_50:
    find_lex $P189, "$_"
    find_lex $P1063, "%symbol"
    unless_null $P1063, vivify_51
    $P1063 = root_new ['parrot';'Hash']
    store_lex "%symbol", $P1063
  vivify_51:
    set $P1063[$P189], $P188
    .return ($P188)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symbol_defaults"  :subid("23_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1070 :slurpy :named
.annotate 'line', 170
    new $P1069, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1069, control_1068
    push_eh $P1069
    .lex "self", self
    .lex "%attr", param_1070
.annotate 'line', 171
    find_lex $P200, "self"
    find_lex $P201, "%attr"
    $P202 = $P200."symbol"("", $P201 :flat)
.annotate 'line', 170
    .return ($P202)
  control_1068:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P203, exception, "payload"
    .return ($P203)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symtable"  :subid("24_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1074 :optional
    .param int has_param_1074 :opt_flag
.annotate 'line', 179
    new $P1073, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1073, control_1072
    push_eh $P1073
    .lex "self", self
    if has_param_1074, optparam_53
    new $P204, "Undef"
    set param_1074, $P204
  optparam_53:
    .lex "$value", param_1074
.annotate 'line', 180
    find_lex $P205, "self"
    find_lex $P206, "$value"
    find_lex $P207, "$value"
    defined $I208, $P207
    $P209 = $P205."attr"("symtable", $P206, $I208)
.annotate 'line', 179
    .return ($P209)
  control_1072:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P210, exception, "payload"
    .return ($P210)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "lexical"  :subid("25_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1078 :optional
    .param int has_param_1078 :opt_flag
.annotate 'line', 189
    new $P1077, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1077, control_1076
    push_eh $P1077
    .lex "self", self
    if has_param_1078, optparam_54
    new $P211, "Undef"
    set param_1078, $P211
  optparam_54:
    .lex "$value", param_1078
.annotate 'line', 190
    find_lex $P212, "self"
    find_lex $P213, "$value"
    find_lex $P214, "$value"
    defined $I215, $P214
    $P216 = $P212."attr"("lexical", $P213, $I215, 1)
.annotate 'line', 189
    .return ($P216)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P217, exception, "payload"
    .return ($P217)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "compiler"  :subid("26_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1082 :optional
    .param int has_param_1082 :opt_flag
.annotate 'line', 199
    new $P1081, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1081, control_1080
    push_eh $P1081
    .lex "self", self
    if has_param_1082, optparam_55
    new $P218, "Undef"
    set param_1082, $P218
  optparam_55:
    .lex "$value", param_1082
.annotate 'line', 200
    find_lex $P219, "self"
    find_lex $P220, "$value"
    find_lex $P221, "$value"
    defined $I222, $P221
    $P223 = $P219."attr"("compiler", $P220, $I222)
.annotate 'line', 199
    .return ($P223)
  control_1080:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "scope"  :subid("27_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1086 :slurpy
.annotate 'line', 209
    new $P1085, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1085, control_1084
    push_eh $P1085
    .lex "self", self
    .lex "@value", param_1086
.annotate 'line', 210
    find_lex $P225, "self"
    find_lex $P226, "@value"
    find_lex $P227, "@value"
    elements $I228, $P227
    $P229 = $P225."attr"("scope", $P226, $I228)
.annotate 'line', 209
    .return ($P229)
  control_1084:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P230, exception, "payload"
    .return ($P230)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "subid"  :subid("28_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1090 :optional
    .param int has_param_1090 :opt_flag
.annotate 'line', 221
    new $P1089, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1089, control_1088
    push_eh $P1089
    .lex "self", self
    if has_param_1090, optparam_56
    new $P232, "Undef"
    set param_1090, $P232
  optparam_56:
    .lex "$value", param_1090
.annotate 'line', 222
    new $P233, "Undef"
    set $P1091, $P233
    .lex "$has_value", $P1091
    find_lex $P234, "$value"
    defined $I235, $P234
    new $P236, 'Integer'
    set $P236, $I235
    store_lex "$has_value", $P236
.annotate 'line', 224
    find_lex $P238, "$has_value"
    unless $P238, unless_1093
    set $P237, $P238
    goto unless_1093_end
  unless_1093:
    find_lex $P239, "self"
    exists $I240, $P239["subid"]
    new $P237, 'Integer'
    set $P237, $I240
  unless_1093_end:
    if $P237, unless_1092_end
.annotate 'line', 225
    find_lex $P241, "self"
    $P242 = $P241."unique"()
    store_lex "$value", $P242
.annotate 'line', 227
    get_global $P243, "$subid_suffix"
    defined $I244, $P243
    if $I244, unless_1094_end
    new $P245, "String"
    assign $P245, "_"
    time $N246
    set $S247, $N246
    concat $P248, $P245, $S247
    set_global "$subid_suffix", $P248
  unless_1094_end:
.annotate 'line', 229
    find_lex $P249, "$value"
    get_global $P250, "$subid_suffix"
    concat $P251, $P249, $P250
    store_lex "$value", $P251
.annotate 'line', 230
    new $P252, "Integer"
    assign $P252, 1
    store_lex "$has_value", $P252
  unless_1092_end:
.annotate 'line', 233
    find_lex $P253, "self"
    find_lex $P254, "$value"
    find_lex $P255, "$has_value"
    $P256 = $P253."attr"("subid", $P254, $P255)
.annotate 'line', 221
    .return ($P256)
  control_1088:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P257, exception, "payload"
    .return ($P257)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "pirflags"  :subid("29_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1098 :optional
    .param int has_param_1098 :opt_flag
.annotate 'line', 240
    new $P1097, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1097, control_1096
    push_eh $P1097
    .lex "self", self
    if has_param_1098, optparam_57
    new $P258, "Undef"
    set param_1098, $P258
  optparam_57:
    .lex "$value", param_1098
.annotate 'line', 241
    find_lex $P259, "self"
    find_lex $P260, "$value"
    find_lex $P261, "$value"
    defined $I262, $P261
    $P263 = $P259."attr"("pirflags", $P260, $I262)
.annotate 'line', 240
    .return ($P263)
  control_1096:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P264, exception, "payload"
    .return ($P264)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "tempregs"  :subid("30_1308206309.65745") :method :outer("11_1308206309.65745")
    .param pmc param_1102 :optional
    .param int has_param_1102 :opt_flag
.annotate 'line', 251
    new $P1101, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1101, control_1100
    push_eh $P1101
    .lex "self", self
    if has_param_1102, optparam_58
    new $P265, "Undef"
    set param_1102, $P265
  optparam_58:
    .lex "$value", param_1102
.annotate 'line', 252
    find_lex $P266, "self"
    find_lex $P267, "$value"
    find_lex $P268, "$value"
    defined $I269, $P268
    $P270 = $P266."attr"("tempregs", $P267, $I269)
.annotate 'line', 251
    .return ($P270)
  control_1100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P271, exception, "payload"
    .return ($P271)
.end


.namespace ["PAST";"Block"]
.sub "_block1104" :load :anon :subid("31_1308206309.65745")
.annotate 'line', 25
    .const 'Sub' $P1106 = "11_1308206309.65745" 
    $P272 = $P1106()
    .return ($P272)
.end


.namespace []
.sub "_block1107" :load :anon :subid("32_1308206309.65745")
.annotate 'line', 1
    .const 'Sub' $P1109 = "10_1308206309.65745" 
    $P274 = $P1109()
    .return ($P274)
.end

