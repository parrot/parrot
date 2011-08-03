
.namespace []
.sub "_block1000"  :anon :subid("10_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312406958.11441" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312406958.11441" 
    capture_lex $P1003
    $P108 = $P1003()
.annotate 'line', 1
    .return ($P108)
    .const 'Sub' $P1533 = "62_1312406958.11441" 
    .return ($P1533)
.end


.namespace []
.sub "" :load :init :subid("post63") :outer("10_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312406958.11441" 
    .local pmc block
    set block, $P1001
    $P1535 = get_root_global ["parrot"], "P6metaclass"
    $P1535."new_class"("POST::PBCCompiler", "PCT::HLLCompiler" :named("parent"))
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1002"  :subid("11_1312406958.11441") :outer("10_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1504 = "60_1312406958.11441" 
    capture_lex $P1504
    .const 'Sub' $P1496 = "58_1312406958.11441" 
    capture_lex $P1496
    .const 'Sub' $P1487 = "57_1312406958.11441" 
    capture_lex $P1487
    .const 'Sub' $P1459 = "55_1312406958.11441" 
    capture_lex $P1459
    .const 'Sub' $P1447 = "54_1312406958.11441" 
    capture_lex $P1447
    .const 'Sub' $P1439 = "53_1312406958.11441" 
    capture_lex $P1439
    .const 'Sub' $P1430 = "51_1312406958.11441" 
    capture_lex $P1430
    .const 'Sub' $P1404 = "50_1312406958.11441" 
    capture_lex $P1404
    .const 'Sub' $P1377 = "46_1312406958.11441" 
    capture_lex $P1377
    .const 'Sub' $P1350 = "43_1312406958.11441" 
    capture_lex $P1350
    .const 'Sub' $P1335 = "42_1312406958.11441" 
    capture_lex $P1335
    .const 'Sub' $P1330 = "41_1312406958.11441" 
    capture_lex $P1330
    .const 'Sub' $P1324 = "40_1312406958.11441" 
    capture_lex $P1324
    .const 'Sub' $P1310 = "38_1312406958.11441" 
    capture_lex $P1310
    .const 'Sub' $P1298 = "37_1312406958.11441" 
    capture_lex $P1298
    .const 'Sub' $P1285 = "36_1312406958.11441" 
    capture_lex $P1285
    .const 'Sub' $P1221 = "32_1312406958.11441" 
    capture_lex $P1221
    .const 'Sub' $P1206 = "30_1312406958.11441" 
    capture_lex $P1206
    .const 'Sub' $P1197 = "28_1312406958.11441" 
    capture_lex $P1197
    .const 'Sub' $P1169 = "25_1312406958.11441" 
    capture_lex $P1169
    .const 'Sub' $P1081 = "22_1312406958.11441" 
    capture_lex $P1081
    .const 'Sub' $P1076 = "21_1312406958.11441" 
    capture_lex $P1076
    .const 'Sub' $P1062 = "20_1312406958.11441" 
    capture_lex $P1062
    .const 'Sub' $P1056 = "19_1312406958.11441" 
    capture_lex $P1056
    .const 'Sub' $P1038 = "17_1312406958.11441" 
    capture_lex $P1038
    .const 'Sub' $P1032 = "16_1312406958.11441" 
    capture_lex $P1032
    .const 'Sub' $P1023 = "15_1312406958.11441" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "14_1312406958.11441" 
    capture_lex $P1016
    .const 'Sub' $P1005 = "12_1312406958.11441" 
    capture_lex $P1005
.annotate 'line', 58
    .const 'Sub' $P1005 = "12_1312406958.11441" 
    newclosure $P1014, $P1005
    set $P1004, $P1014
    .lex "trigger", $P1004
.annotate 'line', 125
    .const 'Sub' $P1016 = "14_1312406958.11441" 
    newclosure $P1021, $P1016
    set $P1015, $P1021
    .lex "get_or_create_number", $P1015
.annotate 'line', 136
    .const 'Sub' $P1023 = "15_1312406958.11441" 
    newclosure $P1030, $P1023
    set $P1022, $P1030
    .lex "get_or_create_pmc", $P1022
.annotate 'line', 141
    .const 'Sub' $P1032 = "16_1312406958.11441" 
    newclosure $P1037, $P1032
    set $P1031, $P1037
    .lex "get_or_create_string", $P1031
.annotate 'line', 16
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    find_lex $P107, "trigger"
    find_lex $P107, "get_or_create_number"
    find_lex $P107, "get_or_create_pmc"
    find_lex $P107, "get_or_create_string"
.annotate 'line', 708
    .const 'Sub' $P1504 = "60_1312406958.11441" 
    newclosure $P1528, $P1504
.annotate 'line', 16
    .return ($P1528)
    .const 'Sub' $P1530 = "61_1312406958.11441" 
    .return ($P1530)
.end


.namespace ["POST";"PBCCompiler"]
.sub "" :load :init :subid("post64") :outer("11_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312406958.11441" 
    .local pmc block
    set block, $P1003
.annotate 'line', 17
    get_hll_global $P108, ["POST"], "PBCCompiler"
    $P108."language"("newPOST")
.annotate 'line', 18
    get_hll_global $P108, ["POST"], "PBCCompiler"
    new $P109, "ResizablePMCArray"
    push $P109, "pbc"
    push $P109, "mainpmc"
    $P108."language"($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "trigger"  :subid("12_1312406958.11441") :outer("11_1312406958.11441")
    .param pmc param_1008
    .param pmc param_1009
.annotate 'file', ''
.annotate 'line', 58
    .const 'Sub' $P1011 = "13_1312406958.11441" 
    capture_lex $P1011
    new $P1007, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1007, control_1006
    push_eh $P1007
    .lex "$view", param_1008
    .lex "$flag", param_1009
.annotate 'line', 59
    find_lex $P102, "$view"
    find_lex $P103, "$flag"
    $P104 = $P102."subs_by_flag"($P103)
    defined $I101, $P104
    unless $I101, for_undef_65
    iter $P101, $P104
    new $P108, 'ExceptionHandler'
    set_label $P108, loop1013_handler
    $P108."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P108
  loop1013_test:
    unless $P101, loop1013_done
    shift $P105, $P101
  loop1013_redo:
    .const 'Sub' $P1011 = "13_1312406958.11441" 
    capture_lex $P1011
    $P1011($P105)
  loop1013_next:
    goto loop1013_test
  loop1013_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, 'type'
    eq $P109, .CONTROL_LOOP_NEXT, loop1013_next
    eq $P109, .CONTROL_LOOP_REDO, loop1013_redo
  loop1013_done:
    pop_eh 
  for_undef_65:
.annotate 'line', 58
    .return ($P101)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1010"  :anon :subid("13_1312406958.11441") :outer("12_1312406958.11441")
    .param pmc param_1012
.annotate 'file', ''
.annotate 'line', 59
    .lex "$_", param_1012
    find_lex $P106, "$_"
    $P107 = $P106()
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_or_create_number"  :subid("14_1312406958.11441") :outer("11_1312406958.11441")
    .param pmc param_1019
.annotate 'file', ''
.annotate 'line', 125
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "$num", param_1019
.annotate 'line', 126

		$P0 = find_caller_lex '%context'
		$P0 = $P0['constants']
		$P1 = find_lex '$num'
		$N1 = $P1
		$P1020 = $P0.'get_or_create_constant'($N1)
	
.annotate 'line', 125
    .return ($P1020)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_or_create_pmc"  :subid("15_1312406958.11441") :outer("11_1312406958.11441")
    .param pmc param_1026
.annotate 'file', ''
.annotate 'line', 136
    new $P1025, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1025, control_1024
    push_eh $P1025
    .lex "$pmc", param_1026
.annotate 'line', 137
    $P1028 = root_new ['parrot';'Hash']
    set $P1027, $P1028
    .lex "%context", $P1027
    find_caller_lex $P104, "%context"
    store_lex "%context", $P104
.annotate 'line', 138
    find_lex $P1029, "%context"
    unless_null $P1029, vivify_66
    $P1029 = root_new ['parrot';'Hash']
  vivify_66:
    set $P104, $P1029["constants"]
    unless_null $P104, vivify_67
    new $P104, "Undef"
  vivify_67:
    find_lex $P105, "$pmc"
    $P106 = $P104."get_or_create_constant"($P105)
.annotate 'line', 136
    .return ($P106)
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_or_create_string"  :subid("16_1312406958.11441") :outer("11_1312406958.11441")
    .param pmc param_1035
.annotate 'file', ''
.annotate 'line', 141
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "$str", param_1035
.annotate 'line', 142

		$P0 = find_caller_lex '%context'
		$P0 = $P0['constants']
		$P1 = find_lex '$str'
		$S1 = $P1
		$P1036 = $P0.'get_or_create_constant'($S1)
	
.annotate 'line', 141
    .return ($P1036)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "packfile"  :subid("17_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1041
    .param pmc param_1042 :slurpy :named
.annotate 'file', ''
.annotate 'line', 36
    .const 'Sub' $P1052 = "18_1312406958.11441" 
    capture_lex $P1052
    new $P1040, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1040, control_1039
    push_eh $P1040
    .lex "self", self
    .lex "$post", param_1041
    .lex "%adverbs", param_1042
.annotate 'line', 40
    $P1044 = root_new ['parrot';'Hash']
    set $P1043, $P1044
    .lex "%context", $P1043
    find_lex $P107, "self"
    find_lex $P108, "$post"
    find_lex $P109, "%adverbs"
    $P110 = $P107."create_context"($P108, $P109)
    store_lex "%context", $P110
.annotate 'line', 41
    find_lex $P1046, "%adverbs"
    unless_null $P1046, vivify_68
    $P1046 = root_new ['parrot';'Hash']
  vivify_68:
    set $P107, $P1046["DEBUG"]
    unless_null $P107, vivify_69
    new $P107, "Undef"
  vivify_69:
    set $P1045, $P107
    defined $I1048, $P1045
    if $I1048, default_1047
    new $P108, "Integer"
    assign $P108, 0
    set $P1045, $P108
  default_1047:
    find_lex $P1049, "%context"
    unless_null $P1049, vivify_70
    $P1049 = root_new ['parrot';'Hash']
    store_lex "%context", $P1049
  vivify_70:
    set $P1049["DEBUG"], $P1045
.annotate 'line', 43
    find_lex $P107, "$post"
    find_lex $P1050, "%context"
    unless_null $P1050, vivify_71
    $P1050 = root_new ['parrot';'Hash']
    store_lex "%context", $P1050
  vivify_71:
    set $P1050["pir_file"], $P107
.annotate 'line', 48
    find_lex $P107, "self"
    find_lex $P108, "$post"
    $P107."enumerate_subs"($P108)
.annotate 'line', 50
    find_lex $P108, "$post"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_72
    iter $P107, $P109
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1054_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
  loop1054_test:
    unless $P107, loop1054_done
    shift $P110, $P107
  loop1054_redo:
    .const 'Sub' $P1052 = "18_1312406958.11441" 
    capture_lex $P1052
    $P1052($P110)
  loop1054_next:
    goto loop1054_test
  loop1054_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, .CONTROL_LOOP_NEXT, loop1054_next
    eq $P112, .CONTROL_LOOP_REDO, loop1054_redo
  loop1054_done:
    pop_eh 
  for_undef_72:
.annotate 'line', 36
    find_lex $P1055, "%context"
    unless_null $P1055, vivify_73
    $P1055 = root_new ['parrot';'Hash']
  vivify_73:
    set $P107, $P1055["packfile"]
    unless_null $P107, vivify_74
    new $P107, "Undef"
  vivify_74:
    .return ($P107)
  control_1039:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1051"  :anon :subid("18_1312406958.11441") :outer("17_1312406958.11441")
    .param pmc param_1053
.annotate 'file', ''
.annotate 'line', 50
    .lex "$s", param_1053
.annotate 'line', 51
    find_lex $P111, "self"
    find_lex $P112, "$s"
    find_lex $P113, "%context"
    $P114 = $P111."to_pbc"($P112, $P113)
.annotate 'line', 50
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "mainpmc"  :subid("19_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1059
    .param pmc param_1060 :slurpy :named
.annotate 'file', ''
.annotate 'line', 62
    new $P1058, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1058, control_1057
    push_eh $P1058
    .lex "self", self
    .lex "$packfile", param_1059
    .lex "%adverbs", param_1060
.annotate 'line', 63
    new $P107, "Undef"
    set $P1061, $P107
    .lex "$view", $P1061
    find_lex $P108, "$packfile"
    $P109 = $P108."view"()
    store_lex "$view", $P109
.annotate 'line', 65
    find_lex $P108, "$view"
    "trigger"($P108, "load")
.annotate 'line', 66
    find_lex $P108, "$view"
    "trigger"($P108, "init")
.annotate 'line', 68
    find_lex $P108, "$view"
    $P109 = $P108."main_sub"()
.annotate 'line', 62
    .return ($P109)
  control_1057:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("20_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1065
    .param pmc param_1066 :slurpy :named
.annotate 'file', ''
.annotate 'line', 91
    new $P1064, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1064, control_1063
    push_eh $P1064
    .lex "self", self
    .lex "$post", param_1065
    .lex "%adverbs", param_1066
.annotate 'line', 93
    new $P107, "Undef"
    set $P1067, $P107
    .lex "$packfile", $P1067
.annotate 'line', 95
    new $P108, "Undef"
    set $P1068, $P108
    .lex "$main_sub", $P1068
.annotate 'line', 97
    new $P109, "Undef"
    set $P1069, $P109
    .lex "$unlink", $P1069
.annotate 'line', 98
    new $P110, "Undef"
    set $P1070, $P110
    .lex "$filename", $P1070
.annotate 'line', 105
    new $P111, "Undef"
    set $P1071, $P111
    .lex "$handle", $P1071
.annotate 'line', 110
    new $P112, "Undef"
    set $P1072, $P112
    .lex "$view", $P1072
.annotate 'line', 93
    find_lex $P113, "self"
    find_lex $P114, "$post"
    find_lex $P115, "%adverbs"
    $P116 = $P113."packfile"($P114, $P115 :flat)
    store_lex "$packfile", $P116
.annotate 'line', 95
    find_lex $P1073, "$post"
    unless_null $P1073, vivify_75
    $P1073 = root_new ['parrot';'Hash']
  vivify_75:
    set $P113, $P1073["main_sub"]
    unless_null $P113, vivify_76
    new $P113, "Undef"
  vivify_76:
    store_lex "$main_sub", $P113
.annotate 'line', 91
    find_lex $P113, "$unlink"
.annotate 'line', 98
    find_lex $P1074, "%adverbs"
    unless_null $P1074, vivify_77
    $P1074 = root_new ['parrot';'Hash']
  vivify_77:
    set $P113, $P1074["output"]
    unless_null $P113, vivify_78
    new $P113, "Undef"
  vivify_78:
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    store_lex "$filename", $P114
.annotate 'line', 99
    find_lex $P113, "$filename"
    isfalse $I101, $P113
    unless $I101, if_1075_end
.annotate 'line', 101
    new $P114, "String"
    assign $P114, "/tmp/temp.pbc"
    store_lex "$filename", $P114
.annotate 'line', 102
    new $P114, "Integer"
    assign $P114, 1
    store_lex "$unlink", $P114
  if_1075_end:
.annotate 'line', 105
    new $P113, "FileHandle"
    store_lex "$handle", $P113
.annotate 'line', 106
    find_lex $P113, "$handle"
    find_lex $P114, "$filename"
    $P113."open"($P114, "w")
.annotate 'line', 107
    find_lex $P113, "$handle"
    find_lex $P114, "$packfile"
    set $S101, $P114
    $P113."print"($S101)
.annotate 'line', 108
    find_lex $P113, "$handle"
    $P113."close"()
.annotate 'line', 110
    find_lex $P113, "$filename"
    set $S101, $P113
    load_bytecode $P114, $S101
    store_lex "$view", $P114
.annotate 'line', 112
    find_lex $P113, "$view"
    "trigger"($P113, "load")
.annotate 'line', 113
    find_lex $P113, "$view"
    "trigger"($P113, "init")
.annotate 'line', 115
    find_lex $P113, "$view"
    $P114 = $P113."main_sub"()
.annotate 'line', 91
    .return ($P114)
  control_1063:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, "payload"
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("21_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["Undef"],_)
    .param pmc param_1079
    .param pmc param_1080
.annotate 'file', ''
.annotate 'line', 159
    new $P1078, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1078, control_1077
    push_eh $P1078
    .lex "self", self
    .lex "$what", param_1079
    .lex "%context", param_1080
    .return ()
  control_1077:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("22_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Sub"],_)
    .param pmc param_1084
    .param pmc param_1085
.annotate 'file', ''
.annotate 'line', 163
    .const 'Sub' $P1138 = "24_1312406958.11441" 
    capture_lex $P1138
    .const 'Sub' $P1117 = "23_1312406958.11441" 
    capture_lex $P1117
    new $P1083, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1083, control_1082
    push_eh $P1083
    .lex "self", self
    .lex "$sub", param_1084
    .lex "%context", param_1085
.annotate 'line', 168
    $P1087 = root_new ['parrot';'ResizablePMCArray']
    set $P1086, $P1087
    .lex "@n_regs_used", $P1086
.annotate 'line', 172
    new $P107, "Undef"
    set $P1088, $P107
    .lex "$bc", $P1088
.annotate 'line', 178
    new $P108, "Undef"
    set $P1089, $P108
    .lex "$sb", $P1089
.annotate 'line', 180
    new $P109, "Undef"
    set $P1090, $P109
    .lex "$subname", $P1090
.annotate 'line', 186
    new $P110, "Undef"
    set $P1091, $P110
    .lex "$start_offset", $P1091
.annotate 'line', 215
    new $P111, "Undef"
    set $P1092, $P111
    .lex "$end_offset", $P1092
.annotate 'line', 222
    $P1094 = root_new ['parrot';'Hash']
    set $P1093, $P1094
    .lex "%sub", $P1093
.annotate 'line', 249
    new $P112, "Undef"
    set $P1095, $P112
    .lex "$idx", $P1095
.annotate 'line', 165
    find_lex $P113, "$sub"
    find_lex $P1096, "%context"
    unless_null $P1096, vivify_79
    $P1096 = root_new ['parrot';'Hash']
    store_lex "%context", $P1096
  vivify_79:
    set $P1096["sub"], $P113
.annotate 'line', 168
    find_lex $P1097, "%context"
    unless_null $P1097, vivify_80
    $P1097 = root_new ['parrot';'Hash']
  vivify_80:
    set $P113, $P1097["regalloc"]
    unless_null $P113, vivify_81
    new $P113, "Undef"
  vivify_81:
    find_lex $P114, "$sub"
    $P115 = $P113."process"($P114)
    store_lex "@n_regs_used", $P115
.annotate 'line', 169
    find_lex $P1099, "%context"
    unless_null $P1099, vivify_82
    $P1099 = root_new ['parrot';'Hash']
  vivify_82:
    set $P113, $P1099["DEBUG"]
    unless_null $P113, vivify_83
    new $P113, "Undef"
  vivify_83:
    unless $P113, if_1098_end
    find_lex $P114, "self"
    new $P115, "String"
    assign $P115, "n_regs_used "
    find_lex $P116, "@n_regs_used"
    $S101 = $P116."join"("-")
    concat $P117, $P115, $S101
    $P114."debug"($P117)
  if_1098_end:
.annotate 'line', 170
    find_lex $P1101, "%context"
    unless_null $P1101, vivify_84
    $P1101 = root_new ['parrot';'Hash']
  vivify_84:
    set $P113, $P1101["DEBUG"]
    unless_null $P113, vivify_85
    new $P113, "Undef"
  vivify_85:
    unless $P113, if_1100_end
    find_lex $P114, "self"
    find_lex $P115, "$sub"
    $P114."dumper"($P115, "sub")
  if_1100_end:
.annotate 'line', 172
    find_lex $P1102, "%context"
    unless_null $P1102, vivify_86
    $P1102 = root_new ['parrot';'Hash']
  vivify_86:
    set $P113, $P1102["bytecode"]
    unless_null $P113, vivify_87
    new $P113, "Undef"
  vivify_87:
    store_lex "$bc", $P113
.annotate 'line', 175
    $P113 = "hash"()
    find_lex $P1103, "%context"
    unless_null $P1103, vivify_88
    $P1103 = root_new ['parrot';'Hash']
    store_lex "%context", $P1103
  vivify_88:
    set $P1103["labels_todo"], $P113
.annotate 'line', 178
    new $P113, "StringBuilder"
    store_lex "$sb", $P113
.annotate 'line', 179
    find_lex $P113, "$sb"
    find_lex $P114, "$sub"
    $P115 = $P114."name"()
    set $S101, $P115
    push $P113, $S101
.annotate 'line', 180
    find_lex $P113, "$sb"
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    store_lex "$subname", $P114
.annotate 'line', 182
    find_lex $P1105, "%context"
    unless_null $P1105, vivify_89
    $P1105 = root_new ['parrot';'Hash']
  vivify_89:
    set $P113, $P1105["DEBUG"]
    unless_null $P113, vivify_90
    new $P113, "Undef"
  vivify_90:
    unless $P113, if_1104_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Emitting "
    find_lex $P116, "$subname"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1104_end:
.annotate 'line', 184
    find_lex $P113, "$subname"
    "get_or_create_string"($P113)
.annotate 'line', 186
    find_lex $P113, "$bc"
    set $N101, $P113
    new $P114, 'Float'
    set $P114, $N101
    store_lex "$start_offset", $P114
.annotate 'line', 187
    find_lex $P1107, "%context"
    unless_null $P1107, vivify_91
    $P1107 = root_new ['parrot';'Hash']
  vivify_91:
    set $P113, $P1107["DEBUG"]
    unless_null $P113, vivify_92
    new $P113, "Undef"
  vivify_92:
    unless $P113, if_1106_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "From "
    find_lex $P116, "$start_offset"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1106_end:
.annotate 'line', 190
    find_lex $P1109, "$sub"
    unless_null $P1109, vivify_93
    $P1109 = root_new ['parrot';'Hash']
  vivify_93:
    set $P113, $P1109["params"]
    unless_null $P113, vivify_94
    new $P113, "Undef"
  vivify_94:
    if $P113, unless_1108_end
    $P114 = "list"()
    find_lex $P1110, "$sub"
    unless_null $P1110, vivify_95
    $P1110 = root_new ['parrot';'Hash']
    store_lex "$sub", $P1110
  vivify_95:
    set $P1110["params"], $P114
  unless_1108_end:
.annotate 'line', 191
    find_lex $P113, "$sub"
    $P114 = $P113."is_method"()
    unless $P114, if_1111_end
    find_lex $P1112, "$sub"
    unless_null $P1112, vivify_96
    $P1112 = root_new ['parrot';'Hash']
  vivify_96:
    set $P115, $P1112["params"]
    unless_null $P115, vivify_97
    new $P115, "Undef"
  vivify_97:
    get_hll_global $P116, ["POST"], "Value"
    $P117 = $P116."new"("self" :named("name"))
    $P115."unshift"($P117)
  if_1111_end:
.annotate 'line', 193
    find_lex $P1114, "$sub"
    unless_null $P1114, vivify_98
    $P1114 = root_new ['parrot';'Hash']
  vivify_98:
    set $P113, $P1114["params"]
    unless_null $P113, vivify_99
    new $P113, "Undef"
  vivify_99:
    set $N101, $P113
    unless $N101, if_1113_end
.annotate 'line', 194
    find_lex $P114, "self"
    find_lex $P1115, "$sub"
    unless_null $P1115, vivify_100
    $P1115 = root_new ['parrot';'Hash']
  vivify_100:
    set $P115, $P1115["params"]
    unless_null $P115, vivify_101
    new $P115, "Undef"
  vivify_101:
    find_lex $P116, "%context"
    $P114."build_pcc_call"("get_params_pc", $P115, $P116)
  if_1113_end:
.annotate 'line', 198
    find_lex $P114, "$sub"
    $P115 = $P114."list"()
    defined $I101, $P115
    unless $I101, for_undef_102
    iter $P113, $P115
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1119_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1119_test:
    unless $P113, loop1119_done
    shift $P116, $P113
  loop1119_redo:
    .const 'Sub' $P1117 = "23_1312406958.11441" 
    capture_lex $P1117
    $P1117($P116)
  loop1119_next:
    goto loop1119_test
  loop1119_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1119_next
    eq $P118, .CONTROL_LOOP_REDO, loop1119_redo
  loop1119_done:
    pop_eh 
  for_undef_102:
.annotate 'line', 202
    find_lex $P1121, "%context"
    unless_null $P1121, vivify_103
    $P1121 = root_new ['parrot';'Hash']
  vivify_103:
    set $P113, $P1121["DEBUG"]
    unless_null $P113, vivify_104
    new $P113, "Undef"
  vivify_104:
    unless $P113, if_1120_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Middle "
    find_lex $P116, "$bc"
    set $N101, $P116
    set $S101, $N101
    concat $P116, $P115, $S101
    $P114."debug"($P116)
  if_1120_end:
.annotate 'line', 205
    find_lex $P1123, "%context"
    unless_null $P1123, vivify_105
    $P1123 = root_new ['parrot';'Hash']
  vivify_105:
    set $P113, $P1123["DEBUG"]
    unless_null $P113, vivify_106
    new $P113, "Undef"
  vivify_106:
    unless $P113, if_1122_end
    find_lex $P114, "self"
    $P114."debug"("Emitting default return")
  if_1122_end:
.annotate 'line', 206
    find_lex $P113, "$bc"
.annotate 'line', 207
    new $P114, "ResizablePMCArray"
    push $P114, "set_returns_pc"
    push $P114, 0
    push $P113, $P114
.annotate 'line', 211
    find_lex $P113, "$bc"
    new $P114, "ResizablePMCArray"
    push $P114, "returncc"
    push $P113, $P114
.annotate 'line', 215
    find_lex $P113, "$bc"
    set $N101, $P113
    new $P114, 'Float'
    set $P114, $N101
    store_lex "$end_offset", $P114
.annotate 'line', 216
    find_lex $P1125, "%context"
    unless_null $P1125, vivify_107
    $P1125 = root_new ['parrot';'Hash']
  vivify_107:
    set $P113, $P1125["DEBUG"]
    unless_null $P113, vivify_108
    new $P113, "Undef"
  vivify_108:
    unless $P113, if_1124_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "To "
    find_lex $P116, "$end_offset"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1124_end:
.annotate 'line', 219
    find_lex $P113, "self"
    find_lex $P114, "$sub"
    find_lex $P1126, "%context"
    unless_null $P1126, vivify_109
    $P1126 = root_new ['parrot';'Hash']
  vivify_109:
    set $P115, $P1126["labels_todo"]
    unless_null $P115, vivify_110
    new $P115, "Undef"
  vivify_110:
    find_lex $P1127, "%context"
    unless_null $P1127, vivify_111
    $P1127 = root_new ['parrot';'Hash']
  vivify_111:
    set $P116, $P1127["bytecode"]
    unless_null $P116, vivify_112
    new $P116, "Undef"
  vivify_112:
    find_lex $P117, "%context"
    $P113."fixup_labels"($P114, $P115, $P116, $P117)
.annotate 'line', 222
    find_lex $P113, "$start_offset"
    find_lex $P114, "$end_offset"
    find_lex $P115, "$subname"
.annotate 'line', 227
    find_lex $P1129, "$sub"
    unless_null $P1129, vivify_113
    $P1129 = root_new ['parrot';'Hash']
  vivify_113:
    set $P116, $P1129["subid"]
    unless_null $P116, vivify_114
    new $P116, "Undef"
  vivify_114:
    set $P1128, $P116
    defined $I1131, $P1128
    if $I1131, default_1130
    find_lex $P117, "$subname"
    set $P1128, $P117
  default_1130:
.annotate 'line', 228
    find_lex $P118, "$sub"
    $P119 = $P118."nsentry"()
    set $P1132, $P119
    defined $I1134, $P1132
    if $I1134, default_1133
    find_lex $P120, "$subname"
    set $P1132, $P120
  default_1133:
.annotate 'line', 231
    find_lex $P122, "$sub"
    $P123 = $P122."is_method"()
    if $P123, if_1135
    new $P125, "String"
    assign $P125, ""
    set $P121, $P125
    goto if_1135_end
  if_1135:
    find_lex $P124, "$subname"
    set $P121, $P124
  if_1135_end:
.annotate 'line', 222
    find_lex $P126, "@n_regs_used"
.annotate 'line', 235
    find_lex $P127, "self"
    find_lex $P128, "$sub"
    find_lex $P129, "%context"
    $P130 = $P127."create_sub_pf_flags"($P128, $P129)
.annotate 'line', 236
    find_lex $P131, "self"
    find_lex $P132, "$sub"
    find_lex $P133, "%context"
    $P134 = $P131."create_sub_comp_flags"($P132, $P133)
.annotate 'line', 222
    $P135 = "hash"($P113 :named("start_offs"), $P114 :named("end_offs"), $P115 :named("name"), $P1128 :named("subid"), $P1132 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P121 :named("method_name"), $P126 :named("n_regs_used"), $P130 :named("pf_flags"), $P134 :named("comp_flags"))
    store_lex "%sub", $P135
.annotate 'line', 239
    find_lex $P113, "$sub"
    $P114 = $P113."namespace"()
    defined $I101, $P114
    unless $I101, if_1136_end
    .const 'Sub' $P1138 = "24_1312406958.11441" 
    capture_lex $P1138
    $P1138()
  if_1136_end:
.annotate 'line', 249
    find_lex $P113, "$sub"
    $P114 = $P113."constant_index"()
    store_lex "$idx", $P114
.annotate 'line', 250
    find_lex $P113, "$idx"
    defined $I101, $P113
    if $I101, if_1142
.annotate 'line', 255
    find_lex $P1147, "%context"
    unless_null $P1147, vivify_117
    $P1147 = root_new ['parrot';'Hash']
  vivify_117:
    set $P114, $P1147["constants"]
    unless_null $P114, vivify_118
    new $P114, "Undef"
  vivify_118:
    find_lex $P115, "%sub"
    new $P116, "Sub", $P115
    push $P114, $P116
.annotate 'line', 256
    find_lex $P1148, "%context"
    unless_null $P1148, vivify_119
    $P1148 = root_new ['parrot';'Hash']
  vivify_119:
    set $P114, $P1148["constants"]
    unless_null $P114, vivify_120
    new $P114, "Undef"
  vivify_120:
    $P115 = $P114."pmc_count"()
    sub $P116, $P115, 1
    store_lex "$idx", $P116
.annotate 'line', 257
    find_lex $P114, "$sub"
    find_lex $P115, "$idx"
    $P114."constant_index"($P115)
.annotate 'line', 258
    find_lex $P1150, "%context"
    unless_null $P1150, vivify_121
    $P1150 = root_new ['parrot';'Hash']
  vivify_121:
    set $P114, $P1150["DEBUG"]
    unless_null $P114, vivify_122
    new $P114, "Undef"
  vivify_122:
    unless $P114, if_1149_end
    find_lex $P115, "self"
    new $P116, 'String'
    set $P116, "Allocate new constant "
    find_lex $P117, "$idx"
    concat $P118, $P116, $P117
    $P115."debug"($P118)
  if_1149_end:
.annotate 'line', 254
    goto if_1142_end
  if_1142:
.annotate 'line', 251
    find_lex $P1144, "%context"
    unless_null $P1144, vivify_123
    $P1144 = root_new ['parrot';'Hash']
  vivify_123:
    set $P114, $P1144["DEBUG"]
    unless_null $P114, vivify_124
    new $P114, "Undef"
  vivify_124:
    unless $P114, if_1143_end
    find_lex $P115, "self"
    new $P116, 'String'
    set $P116, "Reusing old constant "
    find_lex $P117, "$idx"
    concat $P118, $P116, $P117
    $P115."debug"($P118)
  if_1143_end:
.annotate 'line', 252
    find_lex $P114, "%sub"
    new $P115, "Sub", $P114
    find_lex $P116, "$idx"
    set $I102, $P116
    find_lex $P1145, "%context"
    unless_null $P1145, vivify_125
    $P1145 = root_new ['parrot';'Hash']
    store_lex "%context", $P1145
  vivify_125:
    set $P1146, $P1145["constants"]
    unless_null $P1146, vivify_126
    $P1146 = root_new ['parrot';'ResizablePMCArray']
    set $P1145["constants"], $P1146
  vivify_126:
    set $P1146[$I102], $P115
  if_1142_end:
.annotate 'line', 262
    find_lex $P1152, "%context"
    unless_null $P1152, vivify_127
    $P1152 = root_new ['parrot';'Hash']
  vivify_127:
    set $P114, $P1152["got_main_sub"]
    unless_null $P114, vivify_128
    new $P114, "Undef"
  vivify_128:
    isfalse $I101, $P114
    if $I101, if_1151
    new $P113, 'Integer'
    set $P113, $I101
    goto if_1151_end
  if_1151:
.annotate 'line', 263
    find_lex $P1154, "%context"
    unless_null $P1154, vivify_129
    $P1154 = root_new ['parrot';'Hash']
  vivify_129:
    set $P115, $P1154["DEBUG"]
    unless_null $P115, vivify_130
    new $P115, "Undef"
  vivify_130:
    unless $P115, if_1153_end
    find_lex $P116, "self"
    new $P117, 'String'
    set $P117, "main_sub is "
    find_lex $P1155, "%context"
    unless_null $P1155, vivify_131
    $P1155 = root_new ['parrot';'Hash']
  vivify_131:
    set $P118, $P1155["bytecode"]
    unless_null $P118, vivify_132
    new $P118, "Undef"
  vivify_132:
    $P119 = $P118."main_sub"()
    set $S101, $P119
    concat $P118, $P117, $S101
    $P116."debug"($P118)
  if_1153_end:
.annotate 'line', 264
    find_lex $P115, "$sub"
    $P116 = $P115."main"()
    if $P116, if_1156
.annotate 'line', 270
    find_lex $P1162, "%context"
    unless_null $P1162, vivify_133
    $P1162 = root_new ['parrot';'Hash']
  vivify_133:
    set $P117, $P1162["bytecode"]
    unless_null $P117, vivify_134
    new $P117, "Undef"
  vivify_134:
    $N101 = $P117."main_sub"()
    iseq $I102, $N101, -1.0
    unless $I102, if_1161_end
.annotate 'line', 272
    find_lex $P1164, "%context"
    unless_null $P1164, vivify_135
    $P1164 = root_new ['parrot';'Hash']
  vivify_135:
    set $P118, $P1164["DEBUG"]
    unless_null $P118, vivify_136
    new $P118, "Undef"
  vivify_136:
    unless $P118, if_1163_end
    find_lex $P119, "self"
    $P119."debug"("Got first sub")
  if_1163_end:
.annotate 'line', 273
    find_lex $P1165, "%context"
    unless_null $P1165, vivify_137
    $P1165 = root_new ['parrot';'Hash']
  vivify_137:
    set $P118, $P1165["bytecode"]
    unless_null $P118, vivify_138
    new $P118, "Undef"
  vivify_138:
    find_lex $P119, "$idx"
    $P118."main_sub"($P119)
  if_1161_end:
.annotate 'line', 270
    goto if_1156_end
  if_1156:
.annotate 'line', 265
    find_lex $P1158, "%context"
    unless_null $P1158, vivify_139
    $P1158 = root_new ['parrot';'Hash']
  vivify_139:
    set $P117, $P1158["DEBUG"]
    unless_null $P117, vivify_140
    new $P117, "Undef"
  vivify_140:
    unless $P117, if_1157_end
    find_lex $P118, "self"
    $P118."debug"("Got first :main")
  if_1157_end:
.annotate 'line', 267
    find_lex $P1159, "%context"
    unless_null $P1159, vivify_141
    $P1159 = root_new ['parrot';'Hash']
  vivify_141:
    set $P117, $P1159["bytecode"]
    unless_null $P117, vivify_142
    new $P117, "Undef"
  vivify_142:
    find_lex $P118, "$idx"
    $P117."main_sub"($P118)
.annotate 'line', 268
    new $P117, "Integer"
    assign $P117, 1
    find_lex $P1160, "%context"
    unless_null $P1160, vivify_143
    $P1160 = root_new ['parrot';'Hash']
    store_lex "%context", $P1160
  vivify_143:
    set $P1160["got_main_sub"], $P117
  if_1156_end:
.annotate 'line', 276
    find_lex $P1167, "%context"
    unless_null $P1167, vivify_144
    $P1167 = root_new ['parrot';'Hash']
  vivify_144:
    set $P116, $P1167["DEBUG"]
    unless_null $P116, vivify_145
    new $P116, "Undef"
  vivify_145:
    if $P116, if_1166
    set $P115, $P116
    goto if_1166_end
  if_1166:
    find_lex $P117, "self"
    new $P118, 'String'
    set $P118, ":main sub is "
    find_lex $P1168, "%context"
    unless_null $P1168, vivify_146
    $P1168 = root_new ['parrot';'Hash']
  vivify_146:
    set $P119, $P1168["bytecode"]
    unless_null $P119, vivify_147
    new $P119, "Undef"
  vivify_147:
    $P120 = $P119."main_sub"()
    set $S101, $P120
    concat $P119, $P118, $S101
    $P121 = $P117."debug"($P119)
    set $P115, $P121
  if_1166_end:
.annotate 'line', 262
    set $P113, $P115
  if_1151_end:
.annotate 'line', 163
    .return ($P113)
  control_1082:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1116"  :anon :subid("23_1312406958.11441") :outer("22_1312406958.11441")
    .param pmc param_1118
.annotate 'file', ''
.annotate 'line', 198
    .lex "$_", param_1118
.annotate 'line', 199
    find_lex $P117, "self"
    find_lex $P118, "$_"
    find_lex $P119, "%context"
    $P120 = $P117."to_pbc"($P118, $P119)
.annotate 'line', 198
    .return ($P120)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1137"  :anon :subid("24_1312406958.11441") :outer("22_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 240
    new $P115, "Undef"
    set $P1139, $P115
    .lex "$nskey", $P1139
    find_lex $P116, "$sub"
    $P117 = $P116."namespace"()
    find_lex $P118, "%context"
    $P119 = $P117."to_pmc"($P118)
    set $P120, $P119[0]
    unless_null $P120, vivify_115
    new $P120, "Undef"
  vivify_115:
    store_lex "$nskey", $P120
.annotate 'line', 241
    find_lex $P117, "$nskey"
    typeof $S101, $P117
    iseq $I102, $S101, "Key"
    if $I102, if_1140
    new $P116, 'Integer'
    set $P116, $I102
    goto if_1140_end
  if_1140:
.annotate 'line', 242
    find_lex $P118, "$nskey"
    find_lex $P1141, "%sub"
    unless_null $P1141, vivify_116
    $P1141 = root_new ['parrot';'Hash']
    store_lex "%sub", $P1141
  vivify_116:
    set $P1141["namespace_name"], $P118
.annotate 'line', 241
    set $P116, $P118
  if_1140_end:
.annotate 'line', 239
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("25_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Op"],_)
    .param pmc param_1172
    .param pmc param_1173
.annotate 'file', ''
.annotate 'line', 280
    .const 'Sub' $P1191 = "27_1312406958.11441" 
    capture_lex $P1191
    .const 'Sub' $P1180 = "26_1312406958.11441" 
    capture_lex $P1180
    new $P1171, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1171, control_1170
    push_eh $P1171
    .lex "self", self
    .lex "$op", param_1172
    .lex "%context", param_1173
.annotate 'line', 282
    new $P107, "Undef"
    set $P1174, $P107
    .lex "$fullname", $P1174
.annotate 'line', 297
    $P1176 = root_new ['parrot';'ResizablePMCArray']
    set $P1175, $P1176
    .lex "@op", $P1175
.annotate 'line', 282
    find_lex $P108, "$op"
    $P109 = $P108."pirop"()
    store_lex "$fullname", $P109
.annotate 'line', 283
    find_lex $P1178, "%context"
    unless_null $P1178, vivify_148
    $P1178 = root_new ['parrot';'Hash']
  vivify_148:
    set $P108, $P1178["DEBUG"]
    unless_null $P108, vivify_149
    new $P108, "Undef"
  vivify_149:
    unless $P108, if_1177_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Short name "
    find_lex $P111, "$fullname"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1177_end:
.annotate 'line', 285
    find_lex $P109, "$op"
    $P110 = $P109."list"()
    defined $I101, $P110
    unless $I101, for_undef_150
    iter $P108, $P110
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1184_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1184_test:
    unless $P108, loop1184_done
    shift $P111, $P108
  loop1184_redo:
    .const 'Sub' $P1180 = "26_1312406958.11441" 
    capture_lex $P1180
    $P1180($P111)
  loop1184_next:
    goto loop1184_test
  loop1184_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1184_next
    eq $P114, .CONTROL_LOOP_REDO, loop1184_redo
  loop1184_done:
    pop_eh 
  for_undef_150:
.annotate 'line', 290
    find_lex $P1186, "%context"
    unless_null $P1186, vivify_151
    $P1186 = root_new ['parrot';'Hash']
  vivify_151:
    set $P108, $P1186["DEBUG"]
    unless_null $P108, vivify_152
    new $P108, "Undef"
  vivify_152:
    unless $P108, if_1185_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Fullname "
    find_lex $P111, "$fullname"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1185_end:
.annotate 'line', 293
    find_lex $P1187, "%context"
    unless_null $P1187, vivify_153
    $P1187 = root_new ['parrot';'Hash']
  vivify_153:
    set $P108, $P1187["bytecode"]
    unless_null $P108, vivify_154
    new $P108, "Undef"
  vivify_154:
    set $N101, $P108
    new $P109, 'Float'
    set $P109, $N101
    find_lex $P1188, "%context"
    unless_null $P1188, vivify_155
    $P1188 = root_new ['parrot';'Hash']
    store_lex "%context", $P1188
  vivify_155:
    set $P1188["opcode_offset"], $P109
.annotate 'line', 295
    find_lex $P108, "$fullname"
    find_lex $P1189, "%context"
    unless_null $P1189, vivify_156
    $P1189 = root_new ['parrot';'Hash']
    store_lex "%context", $P1189
  vivify_156:
    set $P1189["opcode_fullname"], $P108
.annotate 'line', 297
    find_lex $P108, "$fullname"
    $P109 = "list"($P108)
    store_lex "@op", $P109
.annotate 'line', 298
    find_lex $P109, "$op"
    $P110 = $P109."list"()
    defined $I101, $P110
    unless $I101, for_undef_157
    iter $P108, $P110
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1193_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1193_test:
    unless $P108, loop1193_done
    shift $P111, $P108
  loop1193_redo:
    .const 'Sub' $P1191 = "27_1312406958.11441" 
    capture_lex $P1191
    $P1191($P111)
  loop1193_next:
    goto loop1193_test
  loop1193_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1193_next
    eq $P113, .CONTROL_LOOP_REDO, loop1193_redo
  loop1193_done:
    pop_eh 
  for_undef_157:
.annotate 'line', 301
    find_lex $P1195, "%context"
    unless_null $P1195, vivify_158
    $P1195 = root_new ['parrot';'Hash']
  vivify_158:
    set $P108, $P1195["DEBUG"]
    unless_null $P108, vivify_159
    new $P108, "Undef"
  vivify_159:
    unless $P108, if_1194_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Op size "
    find_lex $P111, "@op"
    set $N101, $P111
    set $S101, $N101
    concat $P111, $P110, $S101
    $P109."debug"($P111)
  if_1194_end:
.annotate 'line', 302
    find_lex $P1196, "%context"
    unless_null $P1196, vivify_160
    $P1196 = root_new ['parrot';'Hash']
  vivify_160:
    set $P108, $P1196["bytecode"]
    unless_null $P108, vivify_161
    new $P108, "Undef"
  vivify_161:
    find_lex $P109, "@op"
    push $P108, $P109
.annotate 'line', 280
    .return ($P108)
  control_1170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1179"  :anon :subid("26_1312406958.11441") :outer("25_1312406958.11441")
    .param pmc param_1182
.annotate 'file', ''
.annotate 'line', 286
    new $P112, "Undef"
    set $P1181, $P112
    .lex "$type", $P1181
    .lex "$_", param_1182
    find_lex $P114, "$_"
    $P115 = $P114."type"()
    unless $P115, unless_1183
    set $P113, $P115
    goto unless_1183_end
  unless_1183:
    find_lex $P116, "self"
    find_lex $P117, "$_"
    $P118 = $P117."name"()
    find_lex $P119, "%context"
    $P120 = $P116."get_register"($P118, $P119)
    $P121 = $P120."type"()
    set $P113, $P121
  unless_1183_end:
    store_lex "$type", $P113
.annotate 'line', 287
    find_lex $P113, "$fullname"
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    concat $P115, $P114, "_"
    find_lex $P116, "$type"
    set $S102, $P116
    concat $P117, $P115, $S102
    store_lex "$fullname", $P117
.annotate 'line', 285
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1190"  :anon :subid("27_1312406958.11441") :outer("25_1312406958.11441")
    .param pmc param_1192
.annotate 'file', ''
.annotate 'line', 298
    .lex "$_", param_1192
.annotate 'line', 299
    find_lex $P112, "@op"
    find_lex $P113, "self"
    find_lex $P114, "$_"
    find_lex $P115, "%context"
    $P116 = $P113."to_op"($P114, $P115)
    $P117 = $P112."push"($P116)
.annotate 'line', 298
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("28_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Node"],_)
    .param pmc param_1200
    .param pmc param_1201
.annotate 'file', ''
.annotate 'line', 306
    .const 'Sub' $P1203 = "29_1312406958.11441" 
    capture_lex $P1203
    new $P1199, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1199, control_1198
    push_eh $P1199
    .lex "self", self
    .lex "$node", param_1200
    .lex "%context", param_1201
.annotate 'line', 307
    find_lex $P108, "$node"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_162
    iter $P107, $P109
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1205_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
  loop1205_test:
    unless $P107, loop1205_done
    shift $P110, $P107
  loop1205_redo:
    .const 'Sub' $P1203 = "29_1312406958.11441" 
    capture_lex $P1203
    $P1203($P110)
  loop1205_next:
    goto loop1205_test
  loop1205_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, .CONTROL_LOOP_NEXT, loop1205_next
    eq $P112, .CONTROL_LOOP_REDO, loop1205_redo
  loop1205_done:
    pop_eh 
  for_undef_162:
.annotate 'line', 306
    .return ($P107)
  control_1198:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1202"  :anon :subid("29_1312406958.11441") :outer("28_1312406958.11441")
    .param pmc param_1204
.annotate 'file', ''
.annotate 'line', 307
    .lex "$_", param_1204
.annotate 'line', 308
    find_lex $P111, "self"
    find_lex $P112, "$_"
    find_lex $P113, "%context"
    $P114 = $P111."to_pbc"($P112, $P113)
.annotate 'line', 307
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Label"],_)
    .param pmc param_1209
    .param pmc param_1210
.annotate 'file', ''
.annotate 'line', 312
    .const 'Sub' $P1218 = "31_1312406958.11441" 
    capture_lex $P1218
    new $P1208, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1208, control_1207
    push_eh $P1208
    .lex "self", self
    .lex "$l", param_1209
    .lex "%context", param_1210
.annotate 'line', 313
    new $P107, "Undef"
    set $P1211, $P107
    .lex "$bc", $P1211
.annotate 'line', 316
    new $P108, "Undef"
    set $P1212, $P108
    .lex "$pos", $P1212
.annotate 'line', 313
    find_lex $P1213, "%context"
    unless_null $P1213, vivify_163
    $P1213 = root_new ['parrot';'Hash']
  vivify_163:
    set $P109, $P1213["bytecode"]
    unless_null $P109, vivify_164
    new $P109, "Undef"
  vivify_164:
    store_lex "$bc", $P109
.annotate 'line', 314
    find_lex $P109, "$l"
    $P110 = $P109."declared"()
    if $P110, unless_1214_end
    find_lex $P111, "self"
    $P111."panic"("Trying to emit undelcared label!")
  unless_1214_end:
.annotate 'line', 316
    find_lex $P109, "$bc"
    set $N101, $P109
    new $P110, 'Float'
    set $P110, $N101
    store_lex "$pos", $P110
.annotate 'line', 317
    find_lex $P1216, "%context"
    unless_null $P1216, vivify_165
    $P1216 = root_new ['parrot';'Hash']
  vivify_165:
    set $P109, $P1216["DEBUG"]
    unless_null $P109, vivify_166
    new $P109, "Undef"
  vivify_166:
    unless $P109, if_1215_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Declare label '"
    find_lex $P112, "$l"
    $P113 = $P112."name"()
    set $S101, $P113
    concat $P112, $P111, $S101
    concat $P114, $P112, "' at "
    find_lex $P115, "$pos"
    concat $P116, $P114, $P115
    $P110."debug"($P116)
  if_1215_end:
.annotate 'line', 319
    find_lex $P109, "$l"
    find_lex $P110, "$pos"
    $P109."position"($P110)
.annotate 'line', 321
    find_lex $P110, "$l"
    $P111 = $P110."list"()
    defined $I101, $P111
    unless $I101, for_undef_167
    iter $P109, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1220_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1220_test:
    unless $P109, loop1220_done
    shift $P112, $P109
  loop1220_redo:
    .const 'Sub' $P1218 = "31_1312406958.11441" 
    capture_lex $P1218
    $P1218($P112)
  loop1220_next:
    goto loop1220_test
  loop1220_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1220_next
    eq $P114, .CONTROL_LOOP_REDO, loop1220_redo
  loop1220_done:
    pop_eh 
  for_undef_167:
.annotate 'line', 312
    .return ($P109)
  control_1207:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1217"  :anon :subid("31_1312406958.11441") :outer("30_1312406958.11441")
    .param pmc param_1219
.annotate 'file', ''
.annotate 'line', 321
    .lex "$_", param_1219
.annotate 'line', 322
    find_lex $P113, "self"
    find_lex $P114, "$_"
    find_lex $P115, "%context"
    $P116 = $P113."to_pbc"($P114, $P115)
.annotate 'line', 321
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("32_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Call"],_)
    .param pmc param_1224
    .param pmc param_1225
.annotate 'file', ''
.annotate 'line', 326
    .const 'Sub' $P1242 = "33_1312406958.11441" 
    capture_lex $P1242
    new $P1223, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1223, control_1222
    push_eh $P1223
    .lex "self", self
    .lex "$call", param_1224
    .lex "%context", param_1225
.annotate 'line', 327
    new $P107, "Undef"
    set $P1226, $P107
    .lex "$bc", $P1226
.annotate 'line', 328
    new $P108, "Undef"
    set $P1227, $P108
    .lex "$calltype", $P1227
.annotate 'line', 329
    new $P109, "Undef"
    set $P1228, $P109
    .lex "$is_tailcall", $P1228
.annotate 'line', 327
    find_lex $P1229, "%context"
    unless_null $P1229, vivify_168
    $P1229 = root_new ['parrot';'Hash']
  vivify_168:
    set $P110, $P1229["bytecode"]
    unless_null $P110, vivify_169
    new $P110, "Undef"
  vivify_169:
    store_lex "$bc", $P110
.annotate 'line', 328
    find_lex $P110, "$call"
    $P111 = $P110."calltype"()
    store_lex "$calltype", $P111
.annotate 'line', 329
    find_lex $P110, "$calltype"
    set $S101, $P110
    iseq $I101, $S101, "tailcall"
    new $P111, 'Integer'
    set $P111, $I101
    store_lex "$is_tailcall", $P111
.annotate 'line', 331
    find_lex $P112, "$calltype"
    set $S101, $P112
    iseq $I101, $S101, "call"
    unless $I101, unless_1231
    new $P111, 'Integer'
    set $P111, $I101
    goto unless_1231_end
  unless_1231:
    find_lex $P113, "$calltype"
    set $S102, $P113
    iseq $I102, $S102, "tailcall"
    new $P111, 'Integer'
    set $P111, $I102
  unless_1231_end:
    if $P111, if_1230
.annotate 'line', 409
    find_lex $P116, "$calltype"
    set $S103, $P116
    iseq $I103, $S103, "return"
    if $I103, if_1281
.annotate 'line', 413
    find_lex $P119, "$calltype"
    set $S104, $P119
    iseq $I104, $S104, "results"
    if $I104, if_1283
.annotate 'line', 418
    find_lex $P120, "self"
    new $P121, 'String'
    set $P121, "NYI "
    find_lex $P122, "$calltype"
    set $S105, $P122
    concat $P124, $P121, $S105
    $P125 = $P120."panic"($P124)
.annotate 'line', 417
    set $P118, $P125
.annotate 'line', 413
    goto if_1283_end
  if_1283:
.annotate 'line', 415
    find_lex $P120, "self"
    find_lex $P1284, "$call"
    unless_null $P1284, vivify_170
    $P1284 = root_new ['parrot';'Hash']
  vivify_170:
    set $P121, $P1284["params"]
    unless_null $P121, vivify_171
    new $P121, "Undef"
  vivify_171:
    find_lex $P122, "%context"
    $P123 = $P120."build_pcc_call"("get_results_pc", $P121, $P122)
.annotate 'line', 413
    set $P118, $P123
  if_1283_end:
    set $P115, $P118
.annotate 'line', 409
    goto if_1281_end
  if_1281:
.annotate 'line', 410
    find_lex $P117, "self"
    find_lex $P1282, "$call"
    unless_null $P1282, vivify_172
    $P1282 = root_new ['parrot';'Hash']
  vivify_172:
    set $P118, $P1282["params"]
    unless_null $P118, vivify_173
    new $P118, "Undef"
  vivify_173:
    find_lex $P119, "%context"
    $P117."build_pcc_call"("set_returns_pc", $P118, $P119)
.annotate 'line', 411
    find_lex $P117, "$bc"
    new $P118, "ResizablePMCArray"
    push $P118, "returncc"
    push $P117, $P118
.annotate 'line', 409
    set $P115, $P117
  if_1281_end:
    set $P110, $P115
.annotate 'line', 331
    goto if_1230_end
  if_1230:
.annotate 'line', 332
    find_lex $P114, "$call"
    $P115 = $P114."invocant"()
    unless $P115, if_1232_end
.annotate 'line', 333
    find_lex $P1234, "$call"
    unless_null $P1234, vivify_174
    $P1234 = root_new ['parrot';'Hash']
  vivify_174:
    set $P116, $P1234["params"]
    unless_null $P116, vivify_175
    new $P116, "Undef"
  vivify_175:
    if $P116, unless_1233_end
    $P117 = "list"()
    find_lex $P1235, "$call"
    unless_null $P1235, vivify_176
    $P1235 = root_new ['parrot';'Hash']
    store_lex "$call", $P1235
  vivify_176:
    set $P1235["params"], $P117
  unless_1233_end:
.annotate 'line', 334
    find_lex $P1236, "$call"
    unless_null $P1236, vivify_177
    $P1236 = root_new ['parrot';'Hash']
  vivify_177:
    set $P116, $P1236["params"]
    unless_null $P116, vivify_178
    new $P116, "Undef"
  vivify_178:
    find_lex $P117, "$call"
    $P118 = $P117."invocant"()
    $P116."unshift"($P118)
  if_1232_end:
.annotate 'line', 337
    find_lex $P114, "self"
    find_lex $P1237, "$call"
    unless_null $P1237, vivify_179
    $P1237 = root_new ['parrot';'Hash']
  vivify_179:
    set $P115, $P1237["params"]
    unless_null $P115, vivify_180
    new $P115, "Undef"
  vivify_180:
    find_lex $P116, "%context"
    $P114."build_pcc_call"("set_args_pc", $P115, $P116)
.annotate 'line', 339
    find_lex $P114, "$call"
    $P115 = $P114."invocant"()
    if $P115, if_1238
.annotate 'line', 353
    .const 'Sub' $P1242 = "33_1312406958.11441" 
    capture_lex $P1242
    $P1242()
    goto if_1238_end
  if_1238:
.annotate 'line', 340
    find_lex $P116, "$call"
    $P117 = $P116."name"()
    get_hll_global $P118, ["POST"], "Constant"
    $P119 = $P117."isa"($P118)
    if $P119, if_1239
.annotate 'line', 350
    find_lex $P120, "self"
    $P120."panic"("NYI $P0.$S0()")
.annotate 'line', 349
    goto if_1239_end
  if_1239:
.annotate 'line', 341
    find_lex $P120, "$bc"
.annotate 'line', 343
    find_lex $P122, "$is_tailcall"
    if $P122, if_1240
    new $P124, "String"
    assign $P124, "callmethodcc_p_sc"
    set $P121, $P124
    goto if_1240_end
  if_1240:
    new $P123, "String"
    assign $P123, "tailcallmethod_p_sc"
    set $P121, $P123
  if_1240_end:
.annotate 'line', 345
    find_lex $P125, "self"
    find_lex $P126, "$call"
    $P127 = $P126."invocant"()
    find_lex $P128, "%context"
    $P129 = $P125."to_op"($P127, $P128)
.annotate 'line', 346
    find_lex $P130, "self"
    find_lex $P131, "$call"
    $P132 = $P131."name"()
    find_lex $P133, "%context"
    $P134 = $P130."to_op"($P132, $P133)
    new $P135, "ResizablePMCArray"
    push $P135, $P121
    push $P135, $P129
    push $P135, $P134
    push $P120, $P135
  if_1239_end:
  if_1238_end:
.annotate 'line', 405
    find_lex $P115, "$is_tailcall"
    unless $P115, unless_1279
    set $P114, $P115
    goto unless_1279_end
  unless_1279:
.annotate 'line', 406
    find_lex $P116, "self"
    find_lex $P1280, "$call"
    unless_null $P1280, vivify_210
    $P1280 = root_new ['parrot';'Hash']
  vivify_210:
    set $P117, $P1280["results"]
    unless_null $P117, vivify_211
    new $P117, "Undef"
  vivify_211:
    find_lex $P118, "%context"
    $P119 = $P116."build_pcc_call"("get_results_pc", $P117, $P118)
.annotate 'line', 405
    set $P114, $P119
  unless_1279_end:
.annotate 'line', 331
    set $P110, $P114
  if_1230_end:
.annotate 'line', 326
    .return ($P110)
  control_1222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1241"  :anon :subid("33_1312406958.11441") :outer("32_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 353
    .const 'Sub' $P1248 = "34_1312406958.11441" 
    capture_lex $P1248
.annotate 'line', 354
    new $P116, "Undef"
    set $P1243, $P116
    .lex "$SUB", $P1243
.annotate 'line', 355
    new $P117, "Undef"
    set $P1244, $P117
    .lex "$processed", $P1244
.annotate 'line', 399
    new $P118, "Undef"
    set $P1245, $P118
    .lex "$o", $P1245
.annotate 'line', 353
    find_lex $P119, "$SUB"
.annotate 'line', 355
    new $P119, "Integer"
    assign $P119, 0
    store_lex "$processed", $P119
.annotate 'line', 356
    find_lex $P119, "$call"
    $P120 = $P119."name"()
    get_hll_global $P121, ["POST"], "Constant"
    $P122 = $P120."isa"($P121)
    unless $P122, if_1246_end
    .const 'Sub' $P1248 = "34_1312406958.11441" 
    capture_lex $P1248
    $P1248()
  if_1246_end:
.annotate 'line', 384
    find_lex $P119, "$processed"
    if $P119, unless_1268_end
.annotate 'line', 385
    find_lex $P120, "$call"
    $P121 = $P120."name"()
    get_hll_global $P122, ["POST"], "Constant"
    $P123 = $P121."isa"($P122)
    if $P123, if_1269
.annotate 'line', 394
    find_lex $P1273, "%context"
    unless_null $P1273, vivify_198
    $P1273 = root_new ['parrot';'Hash']
  vivify_198:
    set $P124, $P1273["DEBUG"]
    unless_null $P124, vivify_199
    new $P124, "Undef"
  vivify_199:
    unless $P124, if_1272_end
    find_lex $P125, "self"
    new $P126, "String"
    assign $P126, "Name is "
    find_lex $P1274, "$call"
    unless_null $P1274, vivify_200
    $P1274 = root_new ['parrot';'Hash']
  vivify_200:
    set $P127, $P1274["name"]
    unless_null $P127, vivify_201
    new $P127, "Undef"
  vivify_201:
    $S103 = $P127."WHAT"()
    concat $P128, $P126, $S103
    $P125."debug"($P128)
  if_1272_end:
.annotate 'line', 395
    find_lex $P1275, "$call"
    unless_null $P1275, vivify_202
    $P1275 = root_new ['parrot';'Hash']
  vivify_202:
    set $P124, $P1275["name"]
    unless_null $P124, vivify_203
    new $P124, "Undef"
  vivify_203:
    store_lex "$SUB", $P124
.annotate 'line', 393
    goto if_1269_end
  if_1269:
.annotate 'line', 386
    find_lex $P1270, "%context"
    unless_null $P1270, vivify_204
    $P1270 = root_new ['parrot';'Hash']
  vivify_204:
    set $P124, $P1270["sub"]
    unless_null $P124, vivify_205
    new $P124, "Undef"
  vivify_205:
    $P125 = $P124."symbol"("!SUB")
    store_lex "$SUB", $P125
.annotate 'line', 387
    find_lex $P124, "$bc"
.annotate 'line', 389
    find_lex $P125, "self"
    find_lex $P126, "$SUB"
    find_lex $P127, "%context"
    $P128 = $P125."to_op"($P126, $P127)
.annotate 'line', 390
    find_lex $P129, "self"
    find_lex $P1271, "$call"
    unless_null $P1271, vivify_206
    $P1271 = root_new ['parrot';'Hash']
  vivify_206:
    set $P130, $P1271["name"]
    unless_null $P130, vivify_207
    new $P130, "Undef"
  vivify_207:
    find_lex $P131, "%context"
    $P132 = $P129."to_op"($P130, $P131)
    new $P133, "ResizablePMCArray"
    push $P133, "find_sub_not_null_p_sc"
    push $P133, $P128
    push $P133, $P132
    push $P124, $P133
  if_1269_end:
  unless_1268_end:
.annotate 'line', 399
    find_lex $P120, "$is_tailcall"
    if $P120, if_1276
    new $P122, "String"
    assign $P122, "invokecc_p"
    set $P119, $P122
    goto if_1276_end
  if_1276:
    new $P121, "String"
    assign $P121, "tailcall_p"
    set $P119, $P121
  if_1276_end:
    store_lex "$o", $P119
.annotate 'line', 401
    find_lex $P1278, "%context"
    unless_null $P1278, vivify_208
    $P1278 = root_new ['parrot';'Hash']
  vivify_208:
    set $P119, $P1278["DEBUG"]
    unless_null $P119, vivify_209
    new $P119, "Undef"
  vivify_209:
    unless $P119, if_1277_end
    find_lex $P120, "self"
    find_lex $P121, "$o"
    $P120."debug"($P121)
  if_1277_end:
.annotate 'line', 402
    find_lex $P119, "$bc"
    find_lex $P120, "$o"
    find_lex $P121, "self"
    find_lex $P122, "$SUB"
    find_lex $P123, "%context"
    $P124 = $P121."to_op"($P122, $P123)
    new $P125, "ResizablePMCArray"
    push $P125, $P120
    push $P125, $P124
    push $P119, $P125
.annotate 'line', 353
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1247"  :anon :subid("34_1312406958.11441") :outer("33_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 356
    .const 'Sub' $P1261 = "35_1312406958.11441" 
    capture_lex $P1261
.annotate 'line', 359
    new $P123, "Undef"
    set $P1249, $P123
    .lex "$full_name", $P1249
.annotate 'line', 362
    new $P124, "Undef"
    set $P1250, $P124
    .lex "$invocable_sub", $P1250
.annotate 'line', 356
    find_lex $P125, "$full_name"
.annotate 'line', 360
    find_lex $P1252, "%context"
    unless_null $P1252, vivify_181
    $P1252 = root_new ['parrot';'Hash']
  vivify_181:
    set $P125, $P1252["sub"]
    unless_null $P125, vivify_182
    new $P125, "Undef"
  vivify_182:
    $P126 = $P125."namespace"()
    unless $P126, if_1251_end
    find_lex $P1253, "%context"
    unless_null $P1253, vivify_183
    $P1253 = root_new ['parrot';'Hash']
  vivify_183:
    set $P127, $P1253["sub"]
    unless_null $P127, vivify_184
    new $P127, "Undef"
  vivify_184:
    $P128 = $P127."namespace"()
    $P129 = $P128."Str"()
    store_lex "$full_name", $P129
  if_1251_end:
.annotate 'line', 361
    find_lex $P125, "$full_name"
    set $S103, $P125
    new $P126, 'String'
    set $P126, $S103
    find_lex $P1254, "$call"
    unless_null $P1254, vivify_185
    $P1254 = root_new ['parrot';'Hash']
  vivify_185:
    set $P1255, $P1254["name"]
    unless_null $P1255, vivify_186
    $P1255 = root_new ['parrot';'Hash']
  vivify_186:
    set $P127, $P1255["value"]
    unless_null $P127, vivify_187
    new $P127, "Undef"
  vivify_187:
    set $S104, $P127
    concat $P128, $P126, $S104
    store_lex "$full_name", $P128
.annotate 'line', 362
    find_lex $P1256, "%context"
    unless_null $P1256, vivify_188
    $P1256 = root_new ['parrot';'Hash']
  vivify_188:
    set $P125, $P1256["pir_file"]
    unless_null $P125, vivify_189
    new $P125, "Undef"
  vivify_189:
    find_lex $P126, "$full_name"
    $P127 = $P125."sub"($P126)
    store_lex "$invocable_sub", $P127
.annotate 'line', 363
    find_lex $P1258, "%context"
    unless_null $P1258, vivify_190
    $P1258 = root_new ['parrot';'Hash']
  vivify_190:
    set $P125, $P1258["DEBUG"]
    unless_null $P125, vivify_191
    new $P125, "Undef"
  vivify_191:
    unless $P125, if_1257_end
    find_lex $P126, "self"
    new $P127, 'String'
    set $P127, "invocable_sub '"
    find_lex $P128, "$full_name"
    concat $P129, $P127, $P128
    concat $P130, $P129, "'"
    $P126."debug"($P130)
  if_1257_end:
.annotate 'line', 364
    find_lex $P126, "$invocable_sub"
    if $P126, if_1259
    set $P125, $P126
    goto if_1259_end
  if_1259:
    .const 'Sub' $P1261 = "35_1312406958.11441" 
    capture_lex $P1261
    $P129 = $P1261()
    set $P125, $P129
  if_1259_end:
.annotate 'line', 356
    .return ($P125)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1260"  :anon :subid("35_1312406958.11441") :outer("34_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 365
    new $P127, "Undef"
    set $P1262, $P127
    .lex "$idx", $P1262
    find_lex $P128, "$invocable_sub"
    $P129 = $P128."constant_index"()
    store_lex "$idx", $P129
.annotate 'line', 366
    find_lex $P128, "$idx"
    defined $I103, $P128
    if $I103, unless_1263_end
.annotate 'line', 368
    find_lex $P1264, "%context"
    unless_null $P1264, vivify_192
    $P1264 = root_new ['parrot';'Hash']
  vivify_192:
    set $P129, $P1264["constants"]
    unless_null $P129, vivify_193
    new $P129, "Undef"
  vivify_193:
    new $P130, "Integer"
    push $P129, $P130
    store_lex "$idx", $P129
.annotate 'line', 369
    find_lex $P129, "$invocable_sub"
    find_lex $P130, "$idx"
    $P129."constant_index"($P130)
.annotate 'line', 370
    find_lex $P1266, "%context"
    unless_null $P1266, vivify_194
    $P1266 = root_new ['parrot';'Hash']
  vivify_194:
    set $P129, $P1266["DEBUG"]
    unless_null $P129, vivify_195
    new $P129, "Undef"
  vivify_195:
    unless $P129, if_1265_end
    find_lex $P130, "self"
    new $P131, 'String'
    set $P131, "Allocate constant for it "
    find_lex $P132, "$idx"
    concat $P133, $P131, $P132
    $P130."debug"($P133)
  if_1265_end:
  unless_1263_end:
.annotate 'line', 373
    find_lex $P1267, "%context"
    unless_null $P1267, vivify_196
    $P1267 = root_new ['parrot';'Hash']
  vivify_196:
    set $P128, $P1267["sub"]
    unless_null $P128, vivify_197
    new $P128, "Undef"
  vivify_197:
    $P129 = $P128."symbol"("!SUB")
    store_lex "$SUB", $P129
.annotate 'line', 374
    find_lex $P128, "$bc"
.annotate 'line', 376
    find_lex $P129, "self"
    find_lex $P130, "$SUB"
    find_lex $P131, "%context"
    $P132 = $P129."to_op"($P130, $P131)
    find_lex $P133, "$idx"
    new $P134, "ResizablePMCArray"
    push $P134, "set_p_pc"
    push $P134, $P132
    push $P134, $P133
.annotate 'line', 377
    push $P128, $P134
.annotate 'line', 380
    new $P128, "Integer"
    assign $P128, 1
    store_lex "$processed", $P128
.annotate 'line', 364
    .return ($P128)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("36_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Key"],_)
    .param pmc param_1288
    .param pmc param_1289
.annotate 'file', ''
.annotate 'line', 425
    new $P1287, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1287, control_1286
    push_eh $P1287
    .lex "self", self
    .lex "$key", param_1288
    .lex "%context", param_1289
.annotate 'line', 428
    new $P107, "Undef"
    set $P1290, $P107
    .lex "$key_pmc", $P1290
.annotate 'line', 434
    new $P108, "Undef"
    set $P1291, $P108
    .lex "$constants", $P1291
.annotate 'line', 435
    new $P109, "Undef"
    set $P1292, $P109
    .lex "$idx", $P1292
.annotate 'line', 427
    find_lex $P1294, "%context"
    unless_null $P1294, vivify_212
    $P1294 = root_new ['parrot';'Hash']
  vivify_212:
    set $P110, $P1294["DEBUG"]
    unless_null $P110, vivify_213
    new $P110, "Undef"
  vivify_213:
    unless $P110, if_1293_end
    find_lex $P111, "self"
    $P111."debug"("Want key")
  if_1293_end:
.annotate 'line', 428
    find_lex $P110, "$key"
    find_lex $P111, "%context"
    $P112 = $P110."to_pmc"($P111)
    set $P113, $P112[0]
    unless_null $P113, vivify_214
    new $P113, "Undef"
  vivify_214:
    store_lex "$key_pmc", $P113
.annotate 'line', 429
    find_lex $P1296, "%context"
    unless_null $P1296, vivify_215
    $P1296 = root_new ['parrot';'Hash']
  vivify_215:
    set $P110, $P1296["DEBUG"]
    unless_null $P110, vivify_216
    new $P110, "Undef"
  vivify_216:
    unless $P110, if_1295_end
    find_lex $P111, "self"
    $P111."debug"("Got key")
  if_1295_end:
.annotate 'line', 434
    find_lex $P1297, "%context"
    unless_null $P1297, vivify_217
    $P1297 = root_new ['parrot';'Hash']
  vivify_217:
    set $P110, $P1297["constants"]
    unless_null $P110, vivify_218
    new $P110, "Undef"
  vivify_218:
    store_lex "$constants", $P110
.annotate 'line', 425
    find_lex $P110, "$idx"
.annotate 'line', 436

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
.annotate 'line', 425
    find_lex $P110, "$idx"
    .return ($P110)
  control_1286:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("37_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Constant"],_)
    .param pmc param_1301
    .param pmc param_1302
.annotate 'file', ''
.annotate 'line', 452
    new $P1300, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1300, control_1299
    push_eh $P1300
    .lex "self", self
    .lex "$op", param_1301
    .lex "%context", param_1302
.annotate 'line', 453
    new $P107, "Undef"
    set $P1303, $P107
    .lex "$idx", $P1303
.annotate 'line', 454
    new $P108, "Undef"
    set $P1304, $P108
    .lex "$type", $P1304
.annotate 'line', 452
    find_lex $P109, "$idx"
.annotate 'line', 454
    find_lex $P109, "$op"
    $P110 = $P109."type"()
    store_lex "$type", $P110
.annotate 'line', 455
    find_lex $P110, "$type"
    set $S101, $P110
    iseq $I101, $S101, "ic"
    unless $I101, unless_1306
    new $P109, 'Integer'
    set $P109, $I101
    goto unless_1306_end
  unless_1306:
    find_lex $P111, "$type"
    set $S102, $P111
    iseq $I102, $S102, "kic"
    new $P109, 'Integer'
    set $P109, $I102
  unless_1306_end:
    if $P109, if_1305
.annotate 'line', 458
    find_lex $P112, "$type"
    set $S103, $P112
    iseq $I103, $S103, "nc"
    if $I103, if_1307
.annotate 'line', 462
    find_lex $P113, "self"
    $P113."panic"("NYI")
.annotate 'line', 461
    goto if_1307_end
  if_1307:
.annotate 'line', 459
    find_lex $P113, "$op"
    $P114 = $P113."value"()
    $P115 = "get_or_create_number"($P114)
    store_lex "$idx", $P115
  if_1307_end:
.annotate 'line', 458
    goto if_1305_end
  if_1305:
.annotate 'line', 456
    find_lex $P112, "$op"
    $P113 = $P112."value"()
    store_lex "$idx", $P113
  if_1305_end:
.annotate 'line', 465
    find_lex $P1309, "%context"
    unless_null $P1309, vivify_219
    $P1309 = root_new ['parrot';'Hash']
  vivify_219:
    set $P109, $P1309["DEBUG"]
    unless_null $P109, vivify_220
    new $P109, "Undef"
  vivify_220:
    unless $P109, if_1308_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Index "
    find_lex $P112, "$idx"
    concat $P113, $P111, $P112
    $P110."debug"($P113)
  if_1308_end:
.annotate 'line', 452
    find_lex $P109, "$idx"
    .return ($P109)
  control_1299:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"String"],_)
    .param pmc param_1313
    .param pmc param_1314
.annotate 'file', ''
.annotate 'line', 469
    .const 'Sub' $P1321 = "39_1312406958.11441" 
    capture_lex $P1321
    new $P1312, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1312, control_1311
    push_eh $P1312
    .lex "self", self
    .lex "$str", param_1313
    .lex "%context", param_1314
.annotate 'line', 470
    new $P107, "Undef"
    set $P1315, $P107
    .lex "$idx", $P1315
.annotate 'line', 471
    new $P108, "Undef"
    set $P1316, $P108
    .lex "$type", $P1316
.annotate 'line', 469
    find_lex $P109, "$idx"
.annotate 'line', 471
    find_lex $P109, "$str"
    $P110 = $P109."type"()
    store_lex "$type", $P110
.annotate 'line', 472
    find_lex $P109, "$type"
    set $S101, $P109
    isne $I101, $S101, "sc"
    unless $I101, if_1317_end
.annotate 'line', 473
    find_lex $P110, "self"
    $P110."panic"("attempt to pass a non-sc value off as a string")
  if_1317_end:
.annotate 'line', 475
    find_lex $P110, "$str"
    $S101 = $P110."encoding"()
    iseq $I101, $S101, "fixed_8"
    if $I101, if_1319
    new $P109, 'Integer'
    set $P109, $I101
    goto if_1319_end
  if_1319:
    find_lex $P111, "$str"
    $S102 = $P111."charset"()
    iseq $I102, $S102, "ascii"
    new $P109, 'Integer'
    set $P109, $I102
  if_1319_end:
    if $P109, if_1318
.annotate 'line', 478
    .const 'Sub' $P1321 = "39_1312406958.11441" 
    capture_lex $P1321
    $P1321()
    goto if_1318_end
  if_1318:
.annotate 'line', 476
    find_lex $P112, "$str"
    $P113 = $P112."value"()
    $P114 = "get_or_create_string"($P113)
    store_lex "$idx", $P114
  if_1318_end:
.annotate 'line', 469
    find_lex $P109, "$idx"
    .return ($P109)
  control_1311:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1320"  :anon :subid("39_1312406958.11441") :outer("38_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 480
    new $P112, "Undef"
    set $P1322, $P112
    .lex "$bb", $P1322
.annotate 'line', 481
    new $P113, "Undef"
    set $P1323, $P113
    .lex "$str_val", $P1323
.annotate 'line', 480
    new $P114, "ByteBuffer"
    store_lex "$bb", $P114
.annotate 'line', 481
    find_lex $P114, "$str"
    $P115 = $P114."value"()
    store_lex "$str_val", $P115
.annotate 'line', 482

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 490
    find_lex $P114, "$bb"
.annotate 'line', 491
    find_lex $P115, "$str"
    $P116 = $P115."encoding"()
    $P117 = $P114."get_string"($P116)
.annotate 'line', 490
    $P118 = "get_or_create_string"($P117)
    store_lex "$idx", $P118
.annotate 'line', 478
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Value"],_)
    .param pmc param_1327
    .param pmc param_1328
.annotate 'file', ''
.annotate 'line', 498
    new $P1326, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1326, control_1325
    push_eh $P1326
    .lex "self", self
    .lex "$val", param_1327
    .lex "%context", param_1328
.annotate 'line', 500
    new $P107, "Undef"
    set $P1329, $P107
    .lex "$orig", $P1329
    find_lex $P108, "self"
    find_lex $P109, "$val"
    $P110 = $P109."name"()
    find_lex $P111, "%context"
    $P112 = $P108."get_register"($P110, $P111)
    store_lex "$orig", $P112
.annotate 'line', 501
    find_lex $P108, "self"
    find_lex $P109, "$orig"
    find_lex $P110, "%context"
    $P111 = $P108."to_op"($P109, $P110)
.annotate 'line', 498
    .return ($P111)
  control_1325:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("41_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Register"],_)
    .param pmc param_1333
    .param pmc param_1334
.annotate 'file', ''
.annotate 'line', 504
    new $P1332, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1332, control_1331
    push_eh $P1332
    .lex "self", self
    .lex "$reg", param_1333
    .lex "%context", param_1334
.annotate 'line', 505
    find_lex $P107, "$reg"
    $P108 = $P107."regno"()
.annotate 'line', 504
    .return ($P108)
  control_1331:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("42_1312406958.11441") :method :outer("11_1312406958.11441") :multi(_,["POST";"Label"],_)
    .param pmc param_1338
    .param pmc param_1339
.annotate 'file', ''
.annotate 'line', 508
    new $P1337, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1337, control_1336
    push_eh $P1337
    .lex "self", self
    .lex "$l", param_1338
    .lex "%context", param_1339
.annotate 'line', 510
    new $P107, "Undef"
    set $P1340, $P107
    .lex "$bc", $P1340
.annotate 'line', 511
    new $P108, "Undef"
    set $P1341, $P108
    .lex "$pos", $P1341
.annotate 'line', 510
    find_lex $P1342, "%context"
    unless_null $P1342, vivify_221
    $P1342 = root_new ['parrot';'Hash']
  vivify_221:
    set $P109, $P1342["bytecode"]
    unless_null $P109, vivify_222
    new $P109, "Undef"
  vivify_222:
    store_lex "$bc", $P109
.annotate 'line', 511
    find_lex $P109, "$bc"
    set $N101, $P109
    new $P110, 'Float'
    set $P110, $N101
    store_lex "$pos", $P110
.annotate 'line', 515
    find_lex $P109, "$l"
    $P110 = $P109."name"()
.annotate 'line', 514
    find_lex $P1343, "%context"
    unless_null $P1343, vivify_223
    $P1343 = root_new ['parrot';'Hash']
  vivify_223:
    set $P111, $P1343["opcode_offset"]
    unless_null $P111, vivify_224
    new $P111, "Undef"
  vivify_224:
    find_lex $P1344, "%context"
    unless_null $P1344, vivify_225
    $P1344 = root_new ['parrot';'Hash']
  vivify_225:
    set $P112, $P1344["opcode_fullname"]
    unless_null $P112, vivify_226
    new $P112, "Undef"
  vivify_226:
    $P113 = "hash"($P110 :named("name"), $P111 :named("offset"), $P112 :named("opname"))
    find_lex $P114, "$pos"
    find_lex $P1345, "%context"
    unless_null $P1345, vivify_227
    $P1345 = root_new ['parrot';'Hash']
    store_lex "%context", $P1345
  vivify_227:
    set $P1346, $P1345["labels_todo"]
    unless_null $P1346, vivify_228
    $P1346 = root_new ['parrot';'Hash']
    set $P1345["labels_todo"], $P1346
  vivify_228:
    set $P1346[$P114], $P113
.annotate 'line', 520
    find_lex $P1348, "%context"
    unless_null $P1348, vivify_229
    $P1348 = root_new ['parrot';'Hash']
  vivify_229:
    set $P109, $P1348["DEBUG"]
    unless_null $P109, vivify_230
    new $P109, "Undef"
  vivify_230:
    unless $P109, if_1347_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Todo label '"
    find_lex $P112, "$l"
    $P113 = $P112."name"()
    set $S101, $P113
    concat $P112, $P111, $S101
    concat $P114, $P112, "' at "
    find_lex $P115, "$pos"
    concat $P116, $P114, $P115
    concat $P117, $P116, ", "
    find_lex $P1349, "%context"
    unless_null $P1349, vivify_231
    $P1349 = root_new ['parrot';'Hash']
  vivify_231:
    set $P118, $P1349["opcode_offset"]
    unless_null $P118, vivify_232
    new $P118, "Undef"
  vivify_232:
    set $S102, $P118
    concat $P119, $P117, $S102
    $P110."debug"($P119)
  if_1347_end:
.annotate 'line', 508
    .return (0)
  control_1336:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("43_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1353
    .param pmc param_1354
    .param pmc param_1355
.annotate 'file', ''
.annotate 'line', 532
    .const 'Sub' $P1367 = "44_1312406958.11441" 
    capture_lex $P1367
    new $P1352, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1352, control_1351
    push_eh $P1352
    .lex "self", self
    .lex "$opname", param_1353
    .lex "@args", param_1354
    .lex "%context", param_1355
.annotate 'line', 533
    new $P107, "Undef"
    set $P1356, $P107
    .lex "$bc", $P1356
.annotate 'line', 534
    new $P108, "Undef"
    set $P1357, $P108
    .lex "$signature", $P1357
.annotate 'line', 535
    new $P109, "Undef"
    set $P1358, $P109
    .lex "$sig_idx", $P1358
.annotate 'line', 542
    $P1360 = root_new ['parrot';'ResizablePMCArray']
    set $P1359, $P1360
    .lex "@op", $P1359
.annotate 'line', 533
    find_lex $P1361, "%context"
    unless_null $P1361, vivify_233
    $P1361 = root_new ['parrot';'Hash']
  vivify_233:
    set $P110, $P1361["bytecode"]
    unless_null $P110, vivify_234
    new $P110, "Undef"
  vivify_234:
    store_lex "$bc", $P110
.annotate 'line', 534
    find_lex $P110, "self"
    find_lex $P111, "@args"
    find_lex $P112, "%context"
    $P113 = $P110."build_args_signature"($P111, $P112)
    store_lex "$signature", $P113
.annotate 'line', 535
    find_lex $P110, "$signature"
    $P111 = "get_or_create_pmc"($P110)
    store_lex "$sig_idx", $P111
.annotate 'line', 537
    find_lex $P1363, "%context"
    unless_null $P1363, vivify_235
    $P1363 = root_new ['parrot';'Hash']
  vivify_235:
    set $P110, $P1363["DEBUG"]
    unless_null $P110, vivify_236
    new $P110, "Undef"
  vivify_236:
    unless $P110, if_1362_end
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "Sig: "
    find_lex $P113, "$sig_idx"
    concat $P114, $P112, $P113
    $P111."debug"($P114)
  if_1362_end:
.annotate 'line', 539
    find_lex $P1365, "%context"
    unless_null $P1365, vivify_237
    $P1365 = root_new ['parrot';'Hash']
  vivify_237:
    set $P110, $P1365["DEBUG"]
    unless_null $P110, vivify_238
    new $P110, "Undef"
  vivify_238:
    unless $P110, if_1364_end
    find_lex $P111, "self"
    find_lex $P112, "$opname"
    $P111."debug"($P112)
  if_1364_end:
.annotate 'line', 542
    find_lex $P110, "$opname"
    find_lex $P111, "$sig_idx"
    $P112 = "list"($P110, $P111)
    store_lex "@op", $P112
.annotate 'line', 544
    find_lex $P111, "@args"
    defined $I101, $P111
    unless $I101, for_undef_239
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1376_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1376_test:
    unless $P110, loop1376_done
    shift $P112, $P110
  loop1376_redo:
    .const 'Sub' $P1367 = "44_1312406958.11441" 
    capture_lex $P1367
    $P1367($P112)
  loop1376_next:
    goto loop1376_test
  loop1376_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1376_next
    eq $P114, .CONTROL_LOOP_REDO, loop1376_redo
  loop1376_done:
    pop_eh 
  for_undef_239:
.annotate 'line', 555
    find_lex $P110, "$bc"
    find_lex $P111, "@op"
    push $P110, $P111
.annotate 'line', 532
    .return ($P110)
  control_1351:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1366"  :anon :subid("44_1312406958.11441") :outer("43_1312406958.11441")
    .param pmc param_1368
.annotate 'file', ''
.annotate 'line', 544
    .const 'Sub' $P1371 = "45_1312406958.11441" 
    capture_lex $P1371
    .lex "$arg", param_1368
.annotate 'line', 546
    find_lex $P113, "$arg"
    $P114 = $P113."modifier"()
    isa $I102, $P114, "Hash"
    unless $I102, if_1369_end
    .const 'Sub' $P1371 = "45_1312406958.11441" 
    capture_lex $P1371
    $P1371()
  if_1369_end:
.annotate 'line', 552
    find_lex $P113, "@op"
    find_lex $P114, "self"
    find_lex $P115, "$arg"
    find_lex $P116, "%context"
    $P117 = $P114."to_op"($P115, $P116)
    $P118 = $P113."push"($P117)
.annotate 'line', 544
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1370"  :anon :subid("45_1312406958.11441") :outer("44_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 547
    new $P115, "Undef"
    set $P1372, $P115
    .lex "$name", $P1372
    find_lex $P116, "$arg"
    $P117 = $P116."modifier"()
    set $P118, $P117["named"]
    unless_null $P118, vivify_240
    new $P118, "Undef"
  vivify_240:
    set $P1373, $P118
    defined $I1375, $P1373
    if $I1375, default_1374
    find_lex $P119, "$arg"
    $P120 = $P119."name"()
    set $P1373, $P120
  default_1374:
    store_lex "$name", $P1373
.annotate 'line', 548
    find_lex $P116, "@op"
.annotate 'line', 549
    find_lex $P117, "$name"
    $P118 = "get_or_create_string"($P117)
    $P119 = $P116."push"($P118)
.annotate 'line', 546
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("46_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1380
    .param pmc param_1381
.annotate 'file', ''
.annotate 'line', 558
    .const 'Sub' $P1399 = "49_1312406958.11441" 
    capture_lex $P1399
    .const 'Sub' $P1388 = "47_1312406958.11441" 
    capture_lex $P1388
    new $P1379, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1379, control_1378
    push_eh $P1379
    .lex "self", self
    .lex "@args", param_1380
    .lex "%context", param_1381
.annotate 'line', 559
    $P1383 = root_new ['parrot';'ResizablePMCArray']
    set $P1382, $P1383
    .lex "@sig", $P1382
.annotate 'line', 572
    new $P107, "Undef"
    set $P1384, $P107
    .lex "$elements", $P1384
.annotate 'line', 573
    new $P108, "Undef"
    set $P1385, $P108
    .lex "$signature", $P1385
.annotate 'line', 581
    new $P109, "Undef"
    set $P1386, $P109
    .lex "$idx", $P1386
.annotate 'line', 558
    find_lex $P110, "@sig"
.annotate 'line', 560
    find_lex $P111, "@args"
    defined $I101, $P111
    unless $I101, for_undef_241
    iter $P110, $P111
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1396_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1396_test:
    unless $P110, loop1396_done
    shift $P112, $P110
  loop1396_redo:
    .const 'Sub' $P1388 = "47_1312406958.11441" 
    capture_lex $P1388
    $P1388($P112)
  loop1396_next:
    goto loop1396_test
  loop1396_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1396_next
    eq $P116, .CONTROL_LOOP_REDO, loop1396_redo
  loop1396_done:
    pop_eh 
  for_undef_241:
.annotate 'line', 572
    find_lex $P110, "@sig"
    set $N101, $P110
    new $P111, 'Float'
    set $P111, $N101
    store_lex "$elements", $P111
.annotate 'line', 573

        $P1397 = find_lex '$elements'
        $I99 = $P1397
        $P1397 = find_lex '$signature'
        $P1397 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1397
.annotate 'line', 581
    new $P110, "Integer"
    assign $P110, 0
    store_lex "$idx", $P110
.annotate 'line', 582
    find_lex $P111, "@sig"
    defined $I101, $P111
    unless $I101, for_undef_243
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1403_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1403_test:
    unless $P110, loop1403_done
    shift $P112, $P110
  loop1403_redo:
    .const 'Sub' $P1399 = "49_1312406958.11441" 
    capture_lex $P1399
    $P1399($P112)
  loop1403_next:
    goto loop1403_test
  loop1403_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1403_next
    eq $P114, .CONTROL_LOOP_REDO, loop1403_redo
  loop1403_done:
    pop_eh 
  for_undef_243:
.annotate 'line', 558
    find_lex $P110, "$signature"
    .return ($P110)
  control_1378:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "_block1387"  :anon :subid("47_1312406958.11441") :outer("46_1312406958.11441")
    .param pmc param_1389
.annotate 'file', ''
.annotate 'line', 560
    .const 'Sub' $P1393 = "48_1312406958.11441" 
    capture_lex $P1393
    .lex "$arg", param_1389
.annotate 'line', 562
    new $P113, "Undef"
    set $P1390, $P113
    .lex "$s", $P1390
    find_lex $P114, "self"
    find_lex $P115, "$arg"
    find_lex $P116, "%context"
    $P117 = $P114."build_single_arg"($P115, $P116)
    store_lex "$s", $P117
.annotate 'line', 563
    find_lex $P115, "$s"
    isa $I102, $P115, "Integer"
    if $I102, if_1391
.annotate 'line', 567
    find_lex $P117, "$s"
    defined $I103, $P117
    unless $I103, for_undef_242
    iter $P116, $P117
    new $P120, 'ExceptionHandler'
    set_label $P120, loop1395_handler
    $P120."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P120
  loop1395_test:
    unless $P116, loop1395_done
    shift $P119, $P116
  loop1395_redo:
    .const 'Sub' $P1393 = "48_1312406958.11441" 
    capture_lex $P1393
    $P1393($P119)
  loop1395_next:
    goto loop1395_test
  loop1395_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, 'type'
    eq $P121, .CONTROL_LOOP_NEXT, loop1395_next
    eq $P121, .CONTROL_LOOP_REDO, loop1395_redo
  loop1395_done:
    pop_eh 
  for_undef_242:
.annotate 'line', 566
    set $P114, $P116
.annotate 'line', 563
    goto if_1391_end
  if_1391:
.annotate 'line', 564
    find_lex $P116, "@sig"
    find_lex $P117, "$s"
    $P118 = $P116."push"($P117)
.annotate 'line', 563
    set $P114, $P118
  if_1391_end:
.annotate 'line', 560
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1392"  :anon :subid("48_1312406958.11441") :outer("47_1312406958.11441")
    .param pmc param_1394
.annotate 'file', ''
.annotate 'line', 567
    .lex "$_", param_1394
    find_lex $P120, "@sig"
    find_lex $P121, "$_"
    $P122 = $P120."push"($P121)
    .return ($P122)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1398"  :anon :subid("49_1312406958.11441") :outer("46_1312406958.11441")
    .param pmc param_1400
.annotate 'file', ''
.annotate 'line', 582
    .lex "$val", param_1400
.annotate 'line', 583
    find_lex $P113, "$val"
    find_lex $P114, "$idx"
    set $I102, $P114
    find_lex $P1401, "$signature"
    unless_null $P1401, vivify_244
    $P1401 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1401
  vivify_244:
    set $P1401[$I102], $P113
.annotate 'line', 582
    find_lex $P113, "$idx"
    clone $P1402, $P113
    inc $P113
    .return ($P1402)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("50_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1407
    .param pmc param_1408
.annotate 'file', ''
.annotate 'line', 590
    new $P1406, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1406, control_1405
    push_eh $P1406
    .lex "self", self
    .lex "$arg", param_1407
    .lex "%context", param_1408
.annotate 'line', 593
    new $P107, "Undef"
    set $P1409, $P107
    .lex "$type", $P1409
.annotate 'line', 595
    new $P108, "Undef"
    set $P1410, $P108
    .lex "$res", $P1410
.annotate 'line', 609
    new $P109, "Undef"
    set $P1411, $P109
    .lex "$mod", $P1411
.annotate 'line', 593
    find_lex $P110, "$arg"
    $P111 = $P110."type"()
    set $P1412, $P111
    defined $I1414, $P1412
    if $I1414, default_1413
    find_lex $P112, "self"
    find_lex $P113, "$arg"
    $P114 = $P113."name"()
    find_lex $P115, "%context"
    $P116 = $P112."get_register"($P114, $P115)
    $P117 = $P116."type"()
    set $P1412, $P117
  default_1413:
    store_lex "$type", $P1412
.annotate 'line', 590
    find_lex $P110, "$res"
.annotate 'line', 598
    find_lex $P110, "$type"
    set $S101, $P110
    iseq $I101, $S101, "i"
    if $I101, if_1415
.annotate 'line', 599
    find_lex $P111, "$type"
    set $S102, $P111
    iseq $I102, $S102, "s"
    if $I102, if_1416
.annotate 'line', 600
    find_lex $P112, "$type"
    set $S103, $P112
    iseq $I103, $S103, "p"
    if $I103, if_1417
.annotate 'line', 601
    find_lex $P113, "$type"
    set $S104, $P113
    iseq $I104, $S104, "n"
    if $I104, if_1418
.annotate 'line', 603
    find_lex $P114, "$type"
    set $S105, $P114
    iseq $I105, $S105, "ic"
    if $I105, if_1419
.annotate 'line', 604
    find_lex $P115, "$type"
    set $S106, $P115
    iseq $I106, $S106, "sc"
    if $I106, if_1420
.annotate 'line', 605
    find_lex $P116, "$type"
    set $S107, $P116
    iseq $I107, $S107, "pc"
    if $I107, if_1421
.annotate 'line', 606
    find_lex $P117, "$type"
    set $S108, $P117
    iseq $I108, $S108, "nc"
    if $I108, if_1422
.annotate 'line', 607
    find_lex $P118, "self"
    new $P119, 'String'
    set $P119, "Unknown arg type '"
    find_lex $P120, "$type"
    concat $P121, $P119, $P120
    concat $P122, $P121, "'"
    $P118."panic"($P122)
    goto if_1422_end
  if_1422:
.annotate 'line', 606
    new $P118, "Integer"
    assign $P118, 3
    add $P119, $P118, 16
    store_lex "$res", $P119
  if_1422_end:
    goto if_1421_end
  if_1421:
.annotate 'line', 605
    new $P117, "Integer"
    assign $P117, 2
    add $P118, $P117, 16
    store_lex "$res", $P118
  if_1421_end:
    goto if_1420_end
  if_1420:
.annotate 'line', 604
    new $P116, "Integer"
    assign $P116, 1
    add $P117, $P116, 16
    store_lex "$res", $P117
  if_1420_end:
    goto if_1419_end
  if_1419:
.annotate 'line', 603
    new $P115, "Integer"
    assign $P115, 0
    add $P116, $P115, 16
    store_lex "$res", $P116
  if_1419_end:
    goto if_1418_end
  if_1418:
.annotate 'line', 601
    new $P114, "Integer"
    assign $P114, 3
    store_lex "$res", $P114
  if_1418_end:
    goto if_1417_end
  if_1417:
.annotate 'line', 600
    new $P113, "Integer"
    assign $P113, 2
    store_lex "$res", $P113
  if_1417_end:
    goto if_1416_end
  if_1416:
.annotate 'line', 599
    new $P112, "Integer"
    assign $P112, 1
    store_lex "$res", $P112
  if_1416_end:
    goto if_1415_end
  if_1415:
.annotate 'line', 598
    new $P111, "Integer"
    assign $P111, 0
    store_lex "$res", $P111
  if_1415_end:
.annotate 'line', 609
    find_lex $P110, "$arg"
    $P111 = $P110."modifier"()
    store_lex "$mod", $P111
.annotate 'line', 610
    find_lex $P110, "$mod"
    unless $P110, if_1423_end
.annotate 'line', 611
    find_lex $P111, "$mod"
    isa $I101, $P111, "Hash"
    if $I101, if_1424
.annotate 'line', 616
    find_lex $P112, "$mod"
    set $S101, $P112
    iseq $I102, $S101, "slurpy"
    if $I102, if_1425
.annotate 'line', 617
    find_lex $P113, "$mod"
    set $S102, $P113
    iseq $I103, $S102, "flat"
    if $I103, if_1426
.annotate 'line', 618
    find_lex $P114, "$mod"
    set $S103, $P114
    iseq $I104, $S103, "optional"
    if $I104, if_1427
.annotate 'line', 619
    find_lex $P115, "$mod"
    set $S104, $P115
    iseq $I105, $S104, "opt_flag"
    if $I105, if_1428
.annotate 'line', 620
    find_lex $P116, "$mod"
    set $S105, $P116
    iseq $I106, $S105, "slurpy named"
    if $I106, if_1429
.annotate 'line', 621
    find_lex $P117, "self"
    new $P118, 'String'
    set $P118, "Unsupported modifier "
    find_lex $P119, "$mod"
    concat $P120, $P118, $P119
    $P117."panic"($P120)
    goto if_1429_end
  if_1429:
.annotate 'line', 620
    find_lex $P117, "$res"
    add $P118, $P117, 32
    add $P119, $P118, 512
    store_lex "$res", $P119
  if_1429_end:
    goto if_1428_end
  if_1428:
.annotate 'line', 619
    find_lex $P116, "$res"
    add $P117, $P116, 256
    store_lex "$res", $P117
  if_1428_end:
    goto if_1427_end
  if_1427:
.annotate 'line', 618
    find_lex $P115, "$res"
    add $P116, $P115, 128
    store_lex "$res", $P116
  if_1427_end:
    goto if_1426_end
  if_1426:
.annotate 'line', 617
    find_lex $P114, "$res"
    add $P115, $P114, 32
    store_lex "$res", $P115
  if_1426_end:
    goto if_1425_end
  if_1425:
.annotate 'line', 616
    find_lex $P113, "$res"
    add $P114, $P113, 32
    store_lex "$res", $P114
  if_1425_end:
    goto if_1424_end
  if_1424:
.annotate 'line', 614
    new $P112, "Integer"
    assign $P112, 1
    add $P113, $P112, 16
    add $P114, $P113, 512
    find_lex $P115, "$res"
    add $P116, $P115, 512
    $P117 = "list"($P114, $P116)
    store_lex "$res", $P117
  if_1424_end:
  if_1423_end:
.annotate 'line', 590
    find_lex $P110, "$res"
    .return ($P110)
  control_1405:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("51_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1433
.annotate 'file', ''
.annotate 'line', 632
    .const 'Sub' $P1435 = "52_1312406958.11441" 
    capture_lex $P1435
    new $P1432, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1432, control_1431
    push_eh $P1432
    .lex "self", self
    .lex "$post", param_1433
.annotate 'line', 633
    find_lex $P108, "$post"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_245
    iter $P107, $P109
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1438_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1438_test:
    unless $P107, loop1438_done
    shift $P110, $P107
  loop1438_redo:
    .const 'Sub' $P1435 = "52_1312406958.11441" 
    capture_lex $P1435
    $P1435($P110)
  loop1438_next:
    goto loop1438_test
  loop1438_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1438_next
    eq $P113, .CONTROL_LOOP_REDO, loop1438_redo
  loop1438_done:
    pop_eh 
  for_undef_245:
.annotate 'line', 632
    .return ($P107)
  control_1431:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1434"  :anon :subid("52_1312406958.11441") :outer("51_1312406958.11441")
    .param pmc param_1436
.annotate 'file', ''
.annotate 'line', 633
    .lex "$sub", param_1436
.annotate 'line', 635
    find_lex $P112, "$sub"
    get_hll_global $P113, ["POST"], "Sub"
    $P114 = $P112."isa"($P113)
    if $P114, if_1437
    set $P111, $P114
    goto if_1437_end
  if_1437:
    find_lex $P115, "$post"
    find_lex $P116, "$sub"
    $P117 = $P116."full_name"()
    find_lex $P118, "$sub"
    $P119 = $P115."sub"($P117, $P118)
    set $P111, $P119
  if_1437_end:
.annotate 'line', 633
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("53_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1442
    .param pmc param_1443
.annotate 'file', ''
.annotate 'line', 640
    new $P1441, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1441, control_1440
    push_eh $P1441
    .lex "self", self
    .lex "$sub", param_1442
    .lex "%context", param_1443
.annotate 'line', 648
    new $P107, "Undef"
    set $P1444, $P107
    .lex "$res", $P1444
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$res", $P108
.annotate 'line', 649
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 1
    find_lex $P110, "$sub"
    $N101 = $P110."outer"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 650
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 8
    find_lex $P110, "$sub"
    $N101 = $P110."anon"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 651
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 16
    find_lex $P110, "$sub"
    $N101 = $P110."main"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 652
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 32
    find_lex $P110, "$sub"
    $N101 = $P110."load"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 653
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 64
    find_lex $P110, "$sub"
    $N101 = $P110."immediate"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 654
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 128
    find_lex $P110, "$sub"
    $N101 = $P110."postcomp"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 656
    find_lex $P1446, "%context"
    unless_null $P1446, vivify_246
    $P1446 = root_new ['parrot';'Hash']
  vivify_246:
    set $P108, $P1446["DEBUG"]
    unless_null $P108, vivify_247
    new $P108, "Undef"
  vivify_247:
    unless $P108, if_1445_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "pf_flags "
    find_lex $P111, "$res"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1445_end:
.annotate 'line', 640
    find_lex $P108, "$res"
    .return ($P108)
  control_1440:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("54_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1450
    .param pmc param_1451
.annotate 'file', ''
.annotate 'line', 661
    new $P1449, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1449, control_1448
    push_eh $P1449
    .lex "self", self
    .lex "$sub", param_1450
    .lex "%context", param_1451
.annotate 'line', 666
    new $P107, "Undef"
    set $P1452, $P107
    .lex "$res", $P1452
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$res", $P108
.annotate 'line', 667
    find_lex $P108, "$sub"
    $P109 = $P108."vtable"()
    unless $P109, if_1453_end
    find_lex $P110, "$res"
    add $P111, $P110, 2
    store_lex "$res", $P111
  if_1453_end:
.annotate 'line', 668
    find_lex $P108, "$sub"
    $P109 = $P108."is_method"()
    unless $P109, if_1454_end
    find_lex $P110, "$res"
    add $P111, $P110, 4
    store_lex "$res", $P111
  if_1454_end:
.annotate 'line', 669
    find_lex $P108, "$sub"
    $P109 = $P108."is_init"()
    unless $P109, if_1455_end
    find_lex $P110, "$res"
    add $P111, $P110, 1024
    store_lex "$res", $P111
  if_1455_end:
.annotate 'line', 670
    find_lex $P108, "$sub"
    $P109 = $P108."nsentry"()
    unless $P109, if_1456_end
    find_lex $P110, "$res"
    add $P111, $P110, 2048
    store_lex "$res", $P111
  if_1456_end:
.annotate 'line', 672
    find_lex $P1458, "%context"
    unless_null $P1458, vivify_248
    $P1458 = root_new ['parrot';'Hash']
  vivify_248:
    set $P108, $P1458["DEBUG"]
    unless_null $P108, vivify_249
    new $P108, "Undef"
  vivify_249:
    unless $P108, if_1457_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "comp_flags "
    find_lex $P111, "$res"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1457_end:
.annotate 'line', 661
    find_lex $P108, "$res"
    .return ($P108)
  control_1448:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("55_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1462
    .param pmc param_1463
    .param pmc param_1464
    .param pmc param_1465
.annotate 'file', ''
.annotate 'line', 677
    .const 'Sub' $P1469 = "56_1312406958.11441" 
    capture_lex $P1469
    new $P1461, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1461, control_1460
    push_eh $P1461
    .lex "self", self
    .lex "$sub", param_1462
    .lex "$labels_todo", param_1463
    .lex "$bc", param_1464
    .lex "%context", param_1465
.annotate 'line', 678
    find_lex $P1467, "%context"
    unless_null $P1467, vivify_250
    $P1467 = root_new ['parrot';'Hash']
  vivify_250:
    set $P107, $P1467["DEBUG"]
    unless_null $P107, vivify_251
    new $P107, "Undef"
  vivify_251:
    unless $P107, if_1466_end
    find_lex $P108, "self"
    $P108."debug"("Fixup labels")
  if_1466_end:
.annotate 'line', 679
    find_lex $P108, "$labels_todo"
    defined $I101, $P108
    unless $I101, for_undef_252
    iter $P107, $P108
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1486_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1486_test:
    unless $P107, loop1486_done
    shift $P109, $P107
  loop1486_redo:
    .const 'Sub' $P1469 = "56_1312406958.11441" 
    capture_lex $P1469
    $P1469($P109)
  loop1486_next:
    goto loop1486_test
  loop1486_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1486_next
    eq $P115, .CONTROL_LOOP_REDO, loop1486_redo
  loop1486_done:
    pop_eh 
  for_undef_252:
.annotate 'line', 677
    .return ($P107)
  control_1460:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1468"  :anon :subid("56_1312406958.11441") :outer("55_1312406958.11441")
    .param pmc param_1470
.annotate 'file', ''
.annotate 'line', 679
    .lex "$kv", param_1470
.annotate 'line', 680
    new $P110, "Undef"
    set $P1471, $P110
    .lex "$offset", $P1471
.annotate 'line', 681
    $P1473 = root_new ['parrot';'Hash']
    set $P1472, $P1473
    .lex "%todo", $P1472
.annotate 'line', 684
    new $P111, "Undef"
    set $P1474, $P111
    .lex "$op", $P1474
.annotate 'line', 687
    new $P112, "Undef"
    set $P1475, $P112
    .lex "$delta", $P1475
.annotate 'line', 680
    find_lex $P113, "$kv"
    $P114 = $P113."key"()
    store_lex "$offset", $P114
.annotate 'line', 681
    find_lex $P113, "$kv"
    $P114 = $P113."value"()
    store_lex "%todo", $P114
.annotate 'line', 682
    find_lex $P1477, "%context"
    unless_null $P1477, vivify_253
    $P1477 = root_new ['parrot';'Hash']
  vivify_253:
    set $P113, $P1477["DEBUG"]
    unless_null $P113, vivify_254
    new $P113, "Undef"
  vivify_254:
    unless $P113, if_1476_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Fixing '"
    find_lex $P1478, "%todo"
    unless_null $P1478, vivify_255
    $P1478 = root_new ['parrot';'Hash']
  vivify_255:
    set $P116, $P1478["name"]
    unless_null $P116, vivify_256
    new $P116, "Undef"
  vivify_256:
    set $S101, $P116
    concat $P117, $P115, $S101
    concat $P118, $P117, "' from op "
    find_lex $P1479, "%todo"
    unless_null $P1479, vivify_257
    $P1479 = root_new ['parrot';'Hash']
  vivify_257:
    set $P119, $P1479["opname"]
    unless_null $P119, vivify_258
    new $P119, "Undef"
  vivify_258:
    set $S102, $P119
    concat $P120, $P118, $S102
    concat $P121, $P120, " at "
    find_lex $P122, "$offset"
    set $S103, $P122
    concat $P123, $P121, $S103
    $P114."debug"($P123)
  if_1476_end:
.annotate 'line', 684
    find_lex $P1480, "%todo"
    unless_null $P1480, vivify_259
    $P1480 = root_new ['parrot';'Hash']
  vivify_259:
    set $P113, $P1480["opname"]
    unless_null $P113, vivify_260
    new $P113, "Undef"
  vivify_260:
    set $S101, $P113
    find_lex $P114, "$bc"
    $P115 = $P114."opmap"()
    set $P116, $P115[$S101]
    unless_null $P116, vivify_261
    new $P116, "Undef"
  vivify_261:
    store_lex "$op", $P116
.annotate 'line', 685
    find_lex $P1482, "%context"
    unless_null $P1482, vivify_262
    $P1482 = root_new ['parrot';'Hash']
  vivify_262:
    set $P113, $P1482["DEBUG"]
    unless_null $P113, vivify_263
    new $P113, "Undef"
  vivify_263:
    unless $P113, if_1481_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Op length is "
    find_lex $P116, "$op"
    $P117 = $P116."length"()
    set $S101, $P117
    concat $P116, $P115, $S101
    $P114."debug"($P116)
  if_1481_end:
.annotate 'line', 687
    find_lex $P113, "$sub"
    find_lex $P1483, "%todo"
    unless_null $P1483, vivify_264
    $P1483 = root_new ['parrot';'Hash']
  vivify_264:
    set $P114, $P1483["name"]
    unless_null $P114, vivify_265
    new $P114, "Undef"
  vivify_265:
    $P115 = $P113."label"($P114)
    $P116 = $P115."position"()
    find_lex $P1484, "%todo"
    unless_null $P1484, vivify_266
    $P1484 = root_new ['parrot';'Hash']
  vivify_266:
    set $P117, $P1484["offset"]
    unless_null $P117, vivify_267
    new $P117, "Undef"
  vivify_267:
    sub $P118, $P116, $P117
    store_lex "$delta", $P118
.annotate 'line', 689
    find_lex $P113, "$delta"
    find_lex $P114, "$offset"
    find_lex $P115, "$op"
    $N101 = $P115."length"()
    add $P116, $P114, $N101
    set $I102, $P116
    find_lex $P1485, "$bc"
    unless_null $P1485, vivify_268
    $P1485 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1485
  vivify_268:
    set $P1485[$I102], $P113
.annotate 'line', 679
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("57_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1490
    .param pmc param_1491
.annotate 'file', ''
.annotate 'line', 694
    new $P1489, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1489, control_1488
    push_eh $P1489
    .lex "self", self
    .lex "$name", param_1490
    .lex "%context", param_1491
.annotate 'line', 695
    new $P107, "Undef"
    set $P1492, $P107
    .lex "$reg", $P1492
    find_lex $P1493, "%context"
    unless_null $P1493, vivify_269
    $P1493 = root_new ['parrot';'Hash']
  vivify_269:
    set $P108, $P1493["sub"]
    unless_null $P108, vivify_270
    new $P108, "Undef"
  vivify_270:
    find_lex $P109, "$name"
    $P110 = $P108."symbol"($P109)
    store_lex "$reg", $P110
.annotate 'line', 696
    find_lex $P108, "$reg"
    isfalse $I101, $P108
    unless $I101, if_1494_end
.annotate 'line', 697
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Register '"
    find_lex $P111, "$name"
    set $S101, $P111
    concat $P112, $P110, $S101
    concat $P113, $P112, "' not predeclared in '"
    find_lex $P1495, "%context"
    unless_null $P1495, vivify_271
    $P1495 = root_new ['parrot';'Hash']
  vivify_271:
    set $P114, $P1495["sub"]
    unless_null $P114, vivify_272
    new $P114, "Undef"
  vivify_272:
    $P115 = $P114."name"()
    set $S102, $P115
    concat $P114, $P113, $S102
    concat $P116, $P114, "'"
    $P109."panic"($P116)
  if_1494_end:
.annotate 'line', 694
    find_lex $P108, "$reg"
    .return ($P108)
  control_1488:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "debug"  :subid("58_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1499 :slurpy
.annotate 'file', ''
.annotate 'line', 702
    .const 'Sub' $P1501 = "59_1312406958.11441" 
    capture_lex $P1501
    new $P1498, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1498, control_1497
    push_eh $P1498
    .lex "self", self
    .lex "@args", param_1499
.annotate 'line', 703
    find_lex $P108, "@args"
    defined $I101, $P108
    unless $I101, for_undef_273
    iter $P107, $P108
    new $P110, 'ExceptionHandler'
    set_label $P110, loop1503_handler
    $P110."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P110
  loop1503_test:
    unless $P107, loop1503_done
    shift $P109, $P107
  loop1503_redo:
    .const 'Sub' $P1501 = "59_1312406958.11441" 
    capture_lex $P1501
    $P1501($P109)
  loop1503_next:
    goto loop1503_test
  loop1503_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, .CONTROL_LOOP_NEXT, loop1503_next
    eq $P111, .CONTROL_LOOP_REDO, loop1503_redo
  loop1503_done:
    pop_eh 
  for_undef_273:
.annotate 'line', 702
    .return ($P107)
  control_1497:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1500"  :anon :subid("59_1312406958.11441") :outer("58_1312406958.11441")
    .param pmc param_1502
.annotate 'file', ''
.annotate 'line', 703
    .lex "$_", param_1502
.annotate 'line', 704
    find_lex $P110, "$_"
    say $P110
.annotate 'line', 703
    .return ()
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("60_1312406958.11441") :method :outer("11_1312406958.11441")
    .param pmc param_1507
    .param pmc param_1508
.annotate 'file', ''
.annotate 'line', 708
    new $P1506, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1506, control_1505
    push_eh $P1506
    .lex "self", self
    .lex "$past", param_1507
    .lex "%adverbs", param_1508
.annotate 'line', 709
    $P1510 = root_new ['parrot';'Hash']
    set $P1509, $P1510
    .lex "%context", $P1509
.annotate 'line', 717
    new $P107, "Undef"
    set $P1511, $P107
    .lex "$pfdir", $P1511
.annotate 'line', 708
    find_lex $P108, "%context"
.annotate 'line', 711
    find_lex $P108, "self"
    find_lex $P1512, "%context"
    unless_null $P1512, vivify_274
    $P1512 = root_new ['parrot';'Hash']
    store_lex "%context", $P1512
  vivify_274:
    set $P1512["compiler"], $P108
.annotate 'line', 713
    new $P108, "Packfile"
    find_lex $P1513, "%context"
    unless_null $P1513, vivify_275
    $P1513 = root_new ['parrot';'Hash']
    store_lex "%context", $P1513
  vivify_275:
    set $P1513["packfile"], $P108
.annotate 'line', 717
    find_lex $P1514, "%context"
    unless_null $P1514, vivify_276
    $P1514 = root_new ['parrot';'Hash']
  vivify_276:
    set $P108, $P1514["packfile"]
    unless_null $P108, vivify_277
    new $P108, "Undef"
  vivify_277:
    $P109 = $P108."get_directory"()
    store_lex "$pfdir", $P109
.annotate 'line', 720
    new $P108, "PackfileConstantTable"
    find_lex $P1515, "%context"
    unless_null $P1515, vivify_278
    $P1515 = root_new ['parrot';'Hash']
    store_lex "%context", $P1515
  vivify_278:
    set $P1515["constants"], $P108
.annotate 'line', 723
    new $P108, "FixedIntegerArray"
    find_lex $P1516, "%context"
    unless_null $P1516, vivify_279
    $P1516 = root_new ['parrot';'Hash']
    store_lex "%context", $P1516
  vivify_279:
    set $P1517, $P1516["constants"]
    unless_null $P1517, vivify_280
    $P1517 = root_new ['parrot';'ResizablePMCArray']
    set $P1516["constants"], $P1517
  vivify_280:
    set $P1517[0], $P108
.annotate 'line', 726
    find_lex $P1518, "%context"
    unless_null $P1518, vivify_281
    $P1518 = root_new ['parrot';'Hash']
  vivify_281:
    set $P108, $P1518["constants"]
    unless_null $P108, vivify_282
    new $P108, "Undef"
  vivify_282:
    find_lex $P1519, "$pfdir"
    unless_null $P1519, vivify_283
    $P1519 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1519
  vivify_283:
    set $P1519["CONSTANTS_hello.pir"], $P108
.annotate 'line', 729
    new $P108, "PackfileBytecodeSegment"
    find_lex $P1520, "%context"
    unless_null $P1520, vivify_284
    $P1520 = root_new ['parrot';'Hash']
    store_lex "%context", $P1520
  vivify_284:
    set $P1520["bytecode"], $P108
.annotate 'line', 730
    find_lex $P1521, "%context"
    unless_null $P1521, vivify_285
    $P1521 = root_new ['parrot';'Hash']
  vivify_285:
    set $P108, $P1521["bytecode"]
    unless_null $P108, vivify_286
    new $P108, "Undef"
  vivify_286:
    $P108."main_sub"(-1)
.annotate 'line', 732
    new $P108, "Integer"
    assign $P108, 0
    find_lex $P1522, "%context"
    unless_null $P1522, vivify_287
    $P1522 = root_new ['parrot';'Hash']
    store_lex "%context", $P1522
  vivify_287:
    set $P1522["got_main_sub"], $P108
.annotate 'line', 735
    find_lex $P1523, "%context"
    unless_null $P1523, vivify_288
    $P1523 = root_new ['parrot';'Hash']
  vivify_288:
    set $P108, $P1523["bytecode"]
    unless_null $P108, vivify_289
    new $P108, "Undef"
  vivify_289:
    find_lex $P1524, "$pfdir"
    unless_null $P1524, vivify_290
    $P1524 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1524
  vivify_290:
    set $P1524["BYTECODE_hello.pir"], $P108
.annotate 'line', 744
    get_hll_global $P108, ["POST"], "VanillaAllocator"
    $P109 = $P108."new"()
    find_lex $P1525, "%context"
    unless_null $P1525, vivify_291
    $P1525 = root_new ['parrot';'Hash']
    store_lex "%context", $P1525
  vivify_291:
    set $P1525["regalloc"], $P109
.annotate 'line', 746
    find_lex $P1526, "%adverbs"
    unless_null $P1526, vivify_292
    $P1526 = root_new ['parrot';'Hash']
  vivify_292:
    set $P108, $P1526["debug"]
    unless_null $P108, vivify_293
    new $P108, "Undef"
  vivify_293:
    find_lex $P1527, "%context"
    unless_null $P1527, vivify_294
    $P1527 = root_new ['parrot';'Hash']
    store_lex "%context", $P1527
  vivify_294:
    set $P1527["DEBUG"], $P108
.annotate 'line', 708
    find_lex $P108, "%context"
    .return ($P108)
  control_1505:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1529" :load :anon :subid("61_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1531 = "11_1312406958.11441" 
    $P107 = $P1531()
    .return ($P107)
.end


.namespace []
.sub "_block1532" :load :anon :subid("62_1312406958.11441")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1534 = "10_1312406958.11441" 
    $P101 = $P1534()
    .return ($P101)
.end

