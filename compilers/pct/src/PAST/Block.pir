
.namespace []
.sub "_block1000"  :anon :subid("10_1312695754.3284")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312695754.3284" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 25
    .const 'Sub' $P1003 = "11_1312695754.3284" 
    capture_lex $P1003
    $P103 = $P1003()
.annotate 'line', 1
    .return ($P103)
    .const 'Sub' $P1108 = "32_1312695754.3284" 
    .return ($P1108)
.end


.namespace []
.sub "" :load :init :subid("post33") :outer("10_1312695754.3284")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312695754.3284" 
    .local pmc block
    set block, $P1001
    $P1110 = get_root_global ["parrot"], "P6metaclass"
    $P1110."new_class"("PAST::Block", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Block"]
.sub "_block1002"  :subid("11_1312695754.3284") :outer("10_1312695754.3284")
.annotate 'file', ''
.annotate 'line', 25
    .const 'Sub' $P1099 = "30_1312695754.3284" 
    capture_lex $P1099
    .const 'Sub' $P1095 = "29_1312695754.3284" 
    capture_lex $P1095
    .const 'Sub' $P1087 = "28_1312695754.3284" 
    capture_lex $P1087
    .const 'Sub' $P1083 = "27_1312695754.3284" 
    capture_lex $P1083
    .const 'Sub' $P1079 = "26_1312695754.3284" 
    capture_lex $P1079
    .const 'Sub' $P1075 = "25_1312695754.3284" 
    capture_lex $P1075
    .const 'Sub' $P1071 = "24_1312695754.3284" 
    capture_lex $P1071
    .const 'Sub' $P1067 = "23_1312695754.3284" 
    capture_lex $P1067
    .const 'Sub' $P1043 = "21_1312695754.3284" 
    capture_lex $P1043
    .const 'Sub' $P1039 = "20_1312695754.3284" 
    capture_lex $P1039
    .const 'Sub' $P1035 = "19_1312695754.3284" 
    capture_lex $P1035
    .const 'Sub' $P1031 = "18_1312695754.3284" 
    capture_lex $P1031
    .const 'Sub' $P1027 = "17_1312695754.3284" 
    capture_lex $P1027
    .const 'Sub' $P1023 = "16_1312695754.3284" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "15_1312695754.3284" 
    capture_lex $P1016
    .const 'Sub' $P1012 = "14_1312695754.3284" 
    capture_lex $P1012
    .const 'Sub' $P1008 = "13_1312695754.3284" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1312695754.3284" 
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
    get_global $P102, "$subid_suffix"
.annotate 'line', 251
    .const 'Sub' $P1099 = "30_1312695754.3284" 
    newclosure $P1103, $P1099
.annotate 'line', 25
    .return ($P1103)
    .const 'Sub' $P1105 = "31_1312695754.3284" 
    .return ($P1105)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "blocktype"  :subid("12_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'file', ''
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
    defined $I101, $P105
    $P106 = $P103."attr"("blocktype", $P104, $I101)
.annotate 'line', 25
    .return ($P106)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "closure"  :subid("13_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'file', ''
.annotate 'line', 35
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_36
    new $P102, "Undef"
    set param_1011, $P102
  optparam_36:
    .lex "$value", param_1011
.annotate 'line', 36
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("closure", $P104, $I101)
.annotate 'line', 35
    .return ($P106)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "control"  :subid("14_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1015 :optional
    .param int has_param_1015 :opt_flag
.annotate 'file', ''
.annotate 'line', 45
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    if has_param_1015, optparam_37
    new $P102, "Undef"
    set param_1015, $P102
  optparam_37:
    .lex "$value", param_1015
.annotate 'line', 46
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("control", $P104, $I101)
.annotate 'line', 45
    .return ($P106)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "loadinit"  :subid("15_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1019 :optional
    .param int has_param_1019 :opt_flag
.annotate 'file', ''
.annotate 'line', 65
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    if has_param_1019, optparam_38
    new $P102, "Undef"
    set param_1019, $P102
  optparam_38:
    .lex "$value", param_1019
.annotate 'line', 66
    new $P103, "Undef"
    set $P1020, $P103
    .lex "$has_value", $P1020
    find_lex $P104, "$value"
    defined $I101, $P104
    new $P105, 'Integer'
    set $P105, $I101
    store_lex "$has_value", $P105
.annotate 'line', 68
    find_lex $P105, "$has_value"
    unless $P105, unless_1022
    set $P104, $P105
    goto unless_1022_end
  unless_1022:
    find_lex $P106, "self"
    exists $I101, $P106["loadinit"]
    new $P104, 'Integer'
    set $P104, $I101
  unless_1022_end:
    if $P104, unless_1021_end
.annotate 'line', 69
    get_hll_global $P107, ["PAST"], "Stmts"
    $P108 = $P107."new"()
    store_lex "$value", $P108
.annotate 'line', 70
    new $P107, "Integer"
    assign $P107, 1
    store_lex "$has_value", $P107
  unless_1021_end:
.annotate 'line', 73
    find_lex $P104, "self"
    find_lex $P105, "$value"
    find_lex $P106, "$has_value"
    $P107 = $P104."attr"("loadinit", $P105, $P106)
.annotate 'line', 65
    .return ($P107)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "namespace"  :subid("16_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1026 :optional
    .param int has_param_1026 :opt_flag
.annotate 'file', ''
.annotate 'line', 81
    new $P1025, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1025, control_1024
    push_eh $P1025
    .lex "self", self
    if has_param_1026, optparam_39
    new $P102, "Undef"
    set param_1026, $P102
  optparam_39:
    .lex "$value", param_1026
.annotate 'line', 82
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("namespace", $P104, $I101)
.annotate 'line', 81
    .return ($P106)
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "multi"  :subid("17_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1030 :optional
    .param int has_param_1030 :opt_flag
.annotate 'file', ''
.annotate 'line', 89
    new $P1029, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1029, control_1028
    push_eh $P1029
    .lex "self", self
    if has_param_1030, optparam_40
    new $P102, "Undef"
    set param_1030, $P102
  optparam_40:
    .lex "$value", param_1030
.annotate 'line', 90
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("multi", $P104, $I101)
.annotate 'line', 89
    .return ($P106)
  control_1028:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "hll"  :subid("18_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1034 :optional
    .param int has_param_1034 :opt_flag
.annotate 'file', ''
.annotate 'line', 97
    new $P1033, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1033, control_1032
    push_eh $P1033
    .lex "self", self
    if has_param_1034, optparam_41
    new $P102, "Undef"
    set param_1034, $P102
  optparam_41:
    .lex "$value", param_1034
.annotate 'line', 98
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("hll", $P104, $I101)
.annotate 'line', 97
    .return ($P106)
  control_1032:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "loadlibs"  :subid("19_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1038 :slurpy
.annotate 'file', ''
.annotate 'line', 106
    new $P1037, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1037, control_1036
    push_eh $P1037
    .lex "self", self
    .lex "@libs", param_1038
.annotate 'line', 107
    find_lex $P102, "self"
    find_lex $P103, "@libs"
    find_lex $P104, "@libs"
    elements $I101, $P104
    $P105 = $P102."attr"("loadlibs", $P103, $I101)
.annotate 'line', 106
    .return ($P105)
  control_1036:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "nsentry"  :subid("20_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1042 :optional
    .param int has_param_1042 :opt_flag
.annotate 'file', ''
.annotate 'line', 114
    new $P1041, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1041, control_1040
    push_eh $P1041
    .lex "self", self
    if has_param_1042, optparam_42
    new $P102, "Undef"
    set param_1042, $P102
  optparam_42:
    .lex "$value", param_1042
.annotate 'line', 115
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("nsentry", $P104, $I101)
.annotate 'line', 114
    .return ($P106)
  control_1040:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symbol"  :subid("21_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1046
    .param pmc param_1047 :slurpy :named
.annotate 'file', ''
.annotate 'line', 133
    .const 'Sub' $P1060 = "22_1312695754.3284" 
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
    set $P102, $P1052["symtable"]
    unless_null $P102, vivify_44
    new $P102, "Undef"
  vivify_44:
    store_lex "%symtable", $P102
.annotate 'line', 136
    find_lex $P102, "%symtable"
    defined $I101, $P102
    if $I101, unless_1053_end
.annotate 'line', 137
    $P1054 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1054
.annotate 'line', 138
    find_lex $P103, "%symtable"
    find_lex $P1055, "self"
    unless_null $P1055, vivify_45
    $P1055 = root_new ['parrot';'Hash']
    store_lex "self", $P1055
  vivify_45:
    set $P1055["symtable"], $P103
  unless_1053_end:
.annotate 'line', 141
    find_lex $P102, "$name"
    find_lex $P1056, "%symtable"
    unless_null $P1056, vivify_46
    $P1056 = root_new ['parrot';'Hash']
  vivify_46:
    set $P103, $P1056[$P102]
    unless_null $P103, vivify_47
    new $P103, "Undef"
  vivify_47:
    store_lex "%symbol", $P103
.annotate 'line', 142
    find_lex $P102, "%symbol"
    defined $I101, $P102
    unless $I101, if_1057_end
.annotate 'line', 143
    find_lex $P103, "%attr"
    unless $P103, if_1058_end
.annotate 'line', 144
    find_lex $P105, "%attr"
    defined $I102, $P105
    unless $I102, for_undef_48
    iter $P104, $P105
    new $P110, 'ExceptionHandler'
    set_label $P110, loop1064_handler
    $P110."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P110
  loop1064_test:
    unless $P104, loop1064_done
    shift $P106, $P104
  loop1064_redo:
    .const 'Sub' $P1060 = "22_1312695754.3284" 
    capture_lex $P1060
    $P1060($P106)
  loop1064_next:
    goto loop1064_test
  loop1064_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, .CONTROL_LOOP_NEXT, loop1064_next
    eq $P111, .CONTROL_LOOP_REDO, loop1064_redo
  loop1064_done:
    pop_eh 
  for_undef_48:
  if_1058_end:
.annotate 'line', 146
    new $P103, "Exception"
    set $P103['type'], .CONTROL_RETURN
    find_lex $P104, "%symbol"
    setattribute $P103, 'payload', $P104
    throw $P103
  if_1057_end:
.annotate 'line', 149
    find_lex $P102, "%attr"
    unless $P102, if_1065_end
.annotate 'line', 150
    find_lex $P103, "%attr"
    find_lex $P104, "$name"
    find_lex $P1066, "%symtable"
    unless_null $P1066, vivify_52
    $P1066 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1066
  vivify_52:
    set $P1066[$P104], $P103
  if_1065_end:
.annotate 'line', 153
    new $P102, "Exception"
    set $P102['type'], .CONTROL_RETURN
    find_lex $P103, "%attr"
    setattribute $P102, 'payload', $P103
    throw $P102
.annotate 'line', 133
    .return ()
  control_1044:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Block"]
.sub "_block1059"  :anon :subid("22_1312695754.3284") :outer("21_1312695754.3284")
    .param pmc param_1061
.annotate 'file', ''
.annotate 'line', 144
    .lex "$_", param_1061
    find_lex $P107, "$_"
    find_lex $P1062, "%attr"
    unless_null $P1062, vivify_49
    $P1062 = root_new ['parrot';'Hash']
  vivify_49:
    set $P108, $P1062[$P107]
    unless_null $P108, vivify_50
    new $P108, "Undef"
  vivify_50:
    find_lex $P109, "$_"
    find_lex $P1063, "%symbol"
    unless_null $P1063, vivify_51
    $P1063 = root_new ['parrot';'Hash']
    store_lex "%symbol", $P1063
  vivify_51:
    set $P1063[$P109], $P108
    .return ($P108)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symbol_defaults"  :subid("23_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1070 :slurpy :named
.annotate 'file', ''
.annotate 'line', 170
    new $P1069, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1069, control_1068
    push_eh $P1069
    .lex "self", self
    .lex "%attr", param_1070
.annotate 'line', 171
    find_lex $P102, "self"
    find_lex $P103, "%attr"
    $P104 = $P102."symbol"("", $P103 :flat)
.annotate 'line', 170
    .return ($P104)
  control_1068:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "symtable"  :subid("24_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1074 :optional
    .param int has_param_1074 :opt_flag
.annotate 'file', ''
.annotate 'line', 179
    new $P1073, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1073, control_1072
    push_eh $P1073
    .lex "self", self
    if has_param_1074, optparam_53
    new $P102, "Undef"
    set param_1074, $P102
  optparam_53:
    .lex "$value", param_1074
.annotate 'line', 180
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("symtable", $P104, $I101)
.annotate 'line', 179
    .return ($P106)
  control_1072:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "lexical"  :subid("25_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1078 :optional
    .param int has_param_1078 :opt_flag
.annotate 'file', ''
.annotate 'line', 189
    new $P1077, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1077, control_1076
    push_eh $P1077
    .lex "self", self
    if has_param_1078, optparam_54
    new $P102, "Undef"
    set param_1078, $P102
  optparam_54:
    .lex "$value", param_1078
.annotate 'line', 190
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("lexical", $P104, $I101, 1)
.annotate 'line', 189
    .return ($P106)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "compiler"  :subid("26_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1082 :optional
    .param int has_param_1082 :opt_flag
.annotate 'file', ''
.annotate 'line', 199
    new $P1081, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1081, control_1080
    push_eh $P1081
    .lex "self", self
    if has_param_1082, optparam_55
    new $P102, "Undef"
    set param_1082, $P102
  optparam_55:
    .lex "$value", param_1082
.annotate 'line', 200
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("compiler", $P104, $I101)
.annotate 'line', 199
    .return ($P106)
  control_1080:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "scope"  :subid("27_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1086 :slurpy
.annotate 'file', ''
.annotate 'line', 209
    new $P1085, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1085, control_1084
    push_eh $P1085
    .lex "self", self
    .lex "@value", param_1086
.annotate 'line', 210
    find_lex $P102, "self"
    find_lex $P103, "@value"
    find_lex $P104, "@value"
    elements $I101, $P104
    $P105 = $P102."attr"("scope", $P103, $I101)
.annotate 'line', 209
    .return ($P105)
  control_1084:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "subid"  :subid("28_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1090 :optional
    .param int has_param_1090 :opt_flag
.annotate 'file', ''
.annotate 'line', 221
    new $P1089, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1089, control_1088
    push_eh $P1089
    .lex "self", self
    if has_param_1090, optparam_56
    new $P102, "Undef"
    set param_1090, $P102
  optparam_56:
    .lex "$value", param_1090
.annotate 'line', 222
    new $P103, "Undef"
    set $P1091, $P103
    .lex "$has_value", $P1091
    find_lex $P104, "$value"
    defined $I101, $P104
    new $P105, 'Integer'
    set $P105, $I101
    store_lex "$has_value", $P105
.annotate 'line', 224
    find_lex $P105, "$has_value"
    unless $P105, unless_1093
    set $P104, $P105
    goto unless_1093_end
  unless_1093:
    find_lex $P106, "self"
    exists $I101, $P106["subid"]
    new $P104, 'Integer'
    set $P104, $I101
  unless_1093_end:
    if $P104, unless_1092_end
.annotate 'line', 225
    find_lex $P107, "self"
    $P108 = $P107."unique"()
    store_lex "$value", $P108
.annotate 'line', 227
    get_global $P107, "$subid_suffix"
    defined $I102, $P107
    if $I102, unless_1094_end
    new $P108, "String"
    assign $P108, "_"
    time $N101
    set $S101, $N101
    concat $P109, $P108, $S101
    set_global "$subid_suffix", $P109
  unless_1094_end:
.annotate 'line', 229
    find_lex $P107, "$value"
    get_global $P108, "$subid_suffix"
    concat $P109, $P107, $P108
    store_lex "$value", $P109
.annotate 'line', 230
    new $P107, "Integer"
    assign $P107, 1
    store_lex "$has_value", $P107
  unless_1092_end:
.annotate 'line', 233
    find_lex $P104, "self"
    find_lex $P105, "$value"
    find_lex $P106, "$has_value"
    $P107 = $P104."attr"("subid", $P105, $P106)
.annotate 'line', 221
    .return ($P107)
  control_1088:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "pirflags"  :subid("29_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1098 :optional
    .param int has_param_1098 :opt_flag
.annotate 'file', ''
.annotate 'line', 240
    new $P1097, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1097, control_1096
    push_eh $P1097
    .lex "self", self
    if has_param_1098, optparam_57
    new $P102, "Undef"
    set param_1098, $P102
  optparam_57:
    .lex "$value", param_1098
.annotate 'line', 241
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("pirflags", $P104, $I101)
.annotate 'line', 240
    .return ($P106)
  control_1096:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.include "except_types.pasm"
.sub "tempregs"  :subid("30_1312695754.3284") :method :outer("11_1312695754.3284")
    .param pmc param_1102 :optional
    .param int has_param_1102 :opt_flag
.annotate 'file', ''
.annotate 'line', 251
    new $P1101, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1101, control_1100
    push_eh $P1101
    .lex "self", self
    if has_param_1102, optparam_58
    new $P102, "Undef"
    set param_1102, $P102
  optparam_58:
    .lex "$value", param_1102
.annotate 'line', 252
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$value"
    defined $I101, $P105
    $P106 = $P103."attr"("tempregs", $P104, $I101)
.annotate 'line', 251
    .return ($P106)
  control_1100:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Block"]
.sub "_block1104" :load :anon :subid("31_1312695754.3284")
.annotate 'file', ''
.annotate 'line', 25
    .const 'Sub' $P1106 = "11_1312695754.3284" 
    $P102 = $P1106()
    .return ($P102)
.end


.namespace []
.sub "_block1107" :load :anon :subid("32_1312695754.3284")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1109 = "10_1312695754.3284" 
    $P101 = $P1109()
    .return ($P101)
.end

