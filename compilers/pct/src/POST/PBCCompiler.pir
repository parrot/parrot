
.namespace []
.sub "_block1000"  :anon :subid("10_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312473152.51907" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312473152.51907" 
    capture_lex $P1003
    $P108 = $P1003()
.annotate 'line', 1
    .return ($P108)
    .const 'Sub' $P1530 = "62_1312473152.51907" 
    .return ($P1530)
.end


.namespace []
.sub "" :load :init :subid("post63") :outer("10_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312473152.51907" 
    .local pmc block
    set block, $P1001
    $P1532 = get_root_global ["parrot"], "P6metaclass"
    $P1532."new_class"("POST::PBCCompiler", "PCT::HLLCompiler" :named("parent"))
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1002"  :subid("11_1312473152.51907") :outer("10_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1501 = "60_1312473152.51907" 
    capture_lex $P1501
    .const 'Sub' $P1493 = "58_1312473152.51907" 
    capture_lex $P1493
    .const 'Sub' $P1484 = "57_1312473152.51907" 
    capture_lex $P1484
    .const 'Sub' $P1456 = "55_1312473152.51907" 
    capture_lex $P1456
    .const 'Sub' $P1444 = "54_1312473152.51907" 
    capture_lex $P1444
    .const 'Sub' $P1436 = "53_1312473152.51907" 
    capture_lex $P1436
    .const 'Sub' $P1427 = "51_1312473152.51907" 
    capture_lex $P1427
    .const 'Sub' $P1401 = "50_1312473152.51907" 
    capture_lex $P1401
    .const 'Sub' $P1374 = "46_1312473152.51907" 
    capture_lex $P1374
    .const 'Sub' $P1347 = "43_1312473152.51907" 
    capture_lex $P1347
    .const 'Sub' $P1332 = "42_1312473152.51907" 
    capture_lex $P1332
    .const 'Sub' $P1327 = "41_1312473152.51907" 
    capture_lex $P1327
    .const 'Sub' $P1321 = "40_1312473152.51907" 
    capture_lex $P1321
    .const 'Sub' $P1307 = "38_1312473152.51907" 
    capture_lex $P1307
    .const 'Sub' $P1295 = "37_1312473152.51907" 
    capture_lex $P1295
    .const 'Sub' $P1282 = "36_1312473152.51907" 
    capture_lex $P1282
    .const 'Sub' $P1218 = "32_1312473152.51907" 
    capture_lex $P1218
    .const 'Sub' $P1203 = "30_1312473152.51907" 
    capture_lex $P1203
    .const 'Sub' $P1194 = "28_1312473152.51907" 
    capture_lex $P1194
    .const 'Sub' $P1166 = "25_1312473152.51907" 
    capture_lex $P1166
    .const 'Sub' $P1078 = "22_1312473152.51907" 
    capture_lex $P1078
    .const 'Sub' $P1073 = "21_1312473152.51907" 
    capture_lex $P1073
    .const 'Sub' $P1062 = "20_1312473152.51907" 
    capture_lex $P1062
    .const 'Sub' $P1056 = "19_1312473152.51907" 
    capture_lex $P1056
    .const 'Sub' $P1038 = "17_1312473152.51907" 
    capture_lex $P1038
    .const 'Sub' $P1032 = "16_1312473152.51907" 
    capture_lex $P1032
    .const 'Sub' $P1023 = "15_1312473152.51907" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "14_1312473152.51907" 
    capture_lex $P1016
    .const 'Sub' $P1005 = "12_1312473152.51907" 
    capture_lex $P1005
.annotate 'line', 58
    .const 'Sub' $P1005 = "12_1312473152.51907" 
    newclosure $P1014, $P1005
    set $P1004, $P1014
    .lex "trigger", $P1004
.annotate 'line', 110
    .const 'Sub' $P1016 = "14_1312473152.51907" 
    newclosure $P1021, $P1016
    set $P1015, $P1021
    .lex "get_or_create_number", $P1015
.annotate 'line', 121
    .const 'Sub' $P1023 = "15_1312473152.51907" 
    newclosure $P1030, $P1023
    set $P1022, $P1030
    .lex "get_or_create_pmc", $P1022
.annotate 'line', 126
    .const 'Sub' $P1032 = "16_1312473152.51907" 
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
.annotate 'line', 693
    .const 'Sub' $P1501 = "60_1312473152.51907" 
    newclosure $P1525, $P1501
.annotate 'line', 16
    .return ($P1525)
    .const 'Sub' $P1527 = "61_1312473152.51907" 
    .return ($P1527)
.end


.namespace ["POST";"PBCCompiler"]
.sub "" :load :init :subid("post64") :outer("11_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312473152.51907" 
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
.sub "trigger"  :subid("12_1312473152.51907") :outer("11_1312473152.51907")
    .param pmc param_1008
    .param pmc param_1009
.annotate 'file', ''
.annotate 'line', 58
    .const 'Sub' $P1011 = "13_1312473152.51907" 
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
    .const 'Sub' $P1011 = "13_1312473152.51907" 
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
.sub "_block1010"  :anon :subid("13_1312473152.51907") :outer("12_1312473152.51907")
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
.sub "get_or_create_number"  :subid("14_1312473152.51907") :outer("11_1312473152.51907")
    .param pmc param_1019
.annotate 'file', ''
.annotate 'line', 110
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "$num", param_1019
.annotate 'line', 111

		$P0 = find_caller_lex '%context'
		$P0 = $P0['constants']
		$P1 = find_lex '$num'
		$N1 = $P1
		$P1020 = $P0.'get_or_create_constant'($N1)
	
.annotate 'line', 110
    .return ($P1020)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_or_create_pmc"  :subid("15_1312473152.51907") :outer("11_1312473152.51907")
    .param pmc param_1026
.annotate 'file', ''
.annotate 'line', 121
    new $P1025, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1025, control_1024
    push_eh $P1025
    .lex "$pmc", param_1026
.annotate 'line', 122
    $P1028 = root_new ['parrot';'Hash']
    set $P1027, $P1028
    .lex "%context", $P1027
    find_caller_lex $P104, "%context"
    store_lex "%context", $P104
.annotate 'line', 123
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
.annotate 'line', 121
    .return ($P106)
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_or_create_string"  :subid("16_1312473152.51907") :outer("11_1312473152.51907")
    .param pmc param_1035
.annotate 'file', ''
.annotate 'line', 126
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "$str", param_1035
.annotate 'line', 127

		$P0 = find_caller_lex '%context'
		$P0 = $P0['constants']
		$P1 = find_lex '$str'
		$S1 = $P1
		$P1036 = $P0.'get_or_create_constant'($S1)
	
.annotate 'line', 126
    .return ($P1036)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "packfile"  :subid("17_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1041
    .param pmc param_1042 :slurpy :named
.annotate 'file', ''
.annotate 'line', 36
    .const 'Sub' $P1052 = "18_1312473152.51907" 
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
    .const 'Sub' $P1052 = "18_1312473152.51907" 
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
.sub "_block1051"  :anon :subid("18_1312473152.51907") :outer("17_1312473152.51907")
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
.sub "mainpmc"  :subid("19_1312473152.51907") :method :outer("11_1312473152.51907")
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
.sub "pbc"  :subid("20_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1065
    .param pmc param_1066 :slurpy :named
.annotate 'file', ''
.annotate 'line', 79
    new $P1064, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1064, control_1063
    push_eh $P1064
    .lex "self", self
    .lex "$packfile", param_1065
    .lex "%adverbs", param_1066
.annotate 'line', 80
    new $P107, "Undef"
    set $P1067, $P107
    .lex "$unlink", $P1067
.annotate 'line', 81
    new $P108, "Undef"
    set $P1068, $P108
    .lex "$filename", $P1068
.annotate 'line', 88
    new $P109, "Undef"
    set $P1069, $P109
    .lex "$handle", $P1069
.annotate 'line', 93
    new $P110, "Undef"
    set $P1070, $P110
    .lex "$view", $P1070
.annotate 'line', 79
    find_lex $P111, "$unlink"
.annotate 'line', 81
    find_lex $P1071, "%adverbs"
    unless_null $P1071, vivify_75
    $P1071 = root_new ['parrot';'Hash']
  vivify_75:
    set $P111, $P1071["output"]
    unless_null $P111, vivify_76
    new $P111, "Undef"
  vivify_76:
    set $S101, $P111
    new $P112, 'String'
    set $P112, $S101
    store_lex "$filename", $P112
.annotate 'line', 82
    find_lex $P111, "$filename"
    isfalse $I101, $P111
    unless $I101, if_1072_end
.annotate 'line', 84
    new $P112, "String"
    assign $P112, "/tmp/temp.pbc"
    store_lex "$filename", $P112
.annotate 'line', 85
    new $P112, "Integer"
    assign $P112, 1
    store_lex "$unlink", $P112
  if_1072_end:
.annotate 'line', 88
    new $P111, "FileHandle"
    store_lex "$handle", $P111
.annotate 'line', 89
    find_lex $P111, "$handle"
    find_lex $P112, "$filename"
    $P111."open"($P112, "w")
.annotate 'line', 90
    find_lex $P111, "$handle"
    find_lex $P112, "$packfile"
    set $S101, $P112
    $P111."print"($S101)
.annotate 'line', 91
    find_lex $P111, "$handle"
    $P111."close"()
.annotate 'line', 93
    find_lex $P111, "$filename"
    set $S101, $P111
    load_bytecode $P112, $S101
    store_lex "$view", $P112
.annotate 'line', 97
    find_lex $P111, "$view"
    "trigger"($P111, "load")
.annotate 'line', 98
    find_lex $P111, "$view"
    "trigger"($P111, "init")
.annotate 'line', 100
    find_lex $P111, "$view"
    $P112 = $P111."main_sub"()
.annotate 'line', 79
    .return ($P112)
  control_1063:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("21_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["Undef"],_)
    .param pmc param_1076
    .param pmc param_1077
.annotate 'file', ''
.annotate 'line', 144
    new $P1075, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1075, control_1074
    push_eh $P1075
    .lex "self", self
    .lex "$what", param_1076
    .lex "%context", param_1077
    .return ()
  control_1074:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("22_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Sub"],_)
    .param pmc param_1081
    .param pmc param_1082
.annotate 'file', ''
.annotate 'line', 148
    .const 'Sub' $P1135 = "24_1312473152.51907" 
    capture_lex $P1135
    .const 'Sub' $P1114 = "23_1312473152.51907" 
    capture_lex $P1114
    new $P1080, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1080, control_1079
    push_eh $P1080
    .lex "self", self
    .lex "$sub", param_1081
    .lex "%context", param_1082
.annotate 'line', 153
    $P1084 = root_new ['parrot';'ResizablePMCArray']
    set $P1083, $P1084
    .lex "@n_regs_used", $P1083
.annotate 'line', 157
    new $P107, "Undef"
    set $P1085, $P107
    .lex "$bc", $P1085
.annotate 'line', 163
    new $P108, "Undef"
    set $P1086, $P108
    .lex "$sb", $P1086
.annotate 'line', 165
    new $P109, "Undef"
    set $P1087, $P109
    .lex "$subname", $P1087
.annotate 'line', 171
    new $P110, "Undef"
    set $P1088, $P110
    .lex "$start_offset", $P1088
.annotate 'line', 200
    new $P111, "Undef"
    set $P1089, $P111
    .lex "$end_offset", $P1089
.annotate 'line', 207
    $P1091 = root_new ['parrot';'Hash']
    set $P1090, $P1091
    .lex "%sub", $P1090
.annotate 'line', 234
    new $P112, "Undef"
    set $P1092, $P112
    .lex "$idx", $P1092
.annotate 'line', 150
    find_lex $P113, "$sub"
    find_lex $P1093, "%context"
    unless_null $P1093, vivify_77
    $P1093 = root_new ['parrot';'Hash']
    store_lex "%context", $P1093
  vivify_77:
    set $P1093["sub"], $P113
.annotate 'line', 153
    find_lex $P1094, "%context"
    unless_null $P1094, vivify_78
    $P1094 = root_new ['parrot';'Hash']
  vivify_78:
    set $P113, $P1094["regalloc"]
    unless_null $P113, vivify_79
    new $P113, "Undef"
  vivify_79:
    find_lex $P114, "$sub"
    $P115 = $P113."process"($P114)
    store_lex "@n_regs_used", $P115
.annotate 'line', 154
    find_lex $P1096, "%context"
    unless_null $P1096, vivify_80
    $P1096 = root_new ['parrot';'Hash']
  vivify_80:
    set $P113, $P1096["DEBUG"]
    unless_null $P113, vivify_81
    new $P113, "Undef"
  vivify_81:
    unless $P113, if_1095_end
    find_lex $P114, "self"
    new $P115, "String"
    assign $P115, "n_regs_used "
    find_lex $P116, "@n_regs_used"
    $S101 = $P116."join"("-")
    concat $P117, $P115, $S101
    $P114."debug"($P117)
  if_1095_end:
.annotate 'line', 155
    find_lex $P1098, "%context"
    unless_null $P1098, vivify_82
    $P1098 = root_new ['parrot';'Hash']
  vivify_82:
    set $P113, $P1098["DEBUG"]
    unless_null $P113, vivify_83
    new $P113, "Undef"
  vivify_83:
    unless $P113, if_1097_end
    find_lex $P114, "self"
    find_lex $P115, "$sub"
    $P114."dumper"($P115, "sub")
  if_1097_end:
.annotate 'line', 157
    find_lex $P1099, "%context"
    unless_null $P1099, vivify_84
    $P1099 = root_new ['parrot';'Hash']
  vivify_84:
    set $P113, $P1099["bytecode"]
    unless_null $P113, vivify_85
    new $P113, "Undef"
  vivify_85:
    store_lex "$bc", $P113
.annotate 'line', 160
    $P113 = "hash"()
    find_lex $P1100, "%context"
    unless_null $P1100, vivify_86
    $P1100 = root_new ['parrot';'Hash']
    store_lex "%context", $P1100
  vivify_86:
    set $P1100["labels_todo"], $P113
.annotate 'line', 163
    new $P113, "StringBuilder"
    store_lex "$sb", $P113
.annotate 'line', 164
    find_lex $P113, "$sb"
    find_lex $P114, "$sub"
    $P115 = $P114."name"()
    set $S101, $P115
    push $P113, $S101
.annotate 'line', 165
    find_lex $P113, "$sb"
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    store_lex "$subname", $P114
.annotate 'line', 167
    find_lex $P1102, "%context"
    unless_null $P1102, vivify_87
    $P1102 = root_new ['parrot';'Hash']
  vivify_87:
    set $P113, $P1102["DEBUG"]
    unless_null $P113, vivify_88
    new $P113, "Undef"
  vivify_88:
    unless $P113, if_1101_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Emitting "
    find_lex $P116, "$subname"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1101_end:
.annotate 'line', 169
    find_lex $P113, "$subname"
    "get_or_create_string"($P113)
.annotate 'line', 171
    find_lex $P113, "$bc"
    set $N101, $P113
    new $P114, 'Float'
    set $P114, $N101
    store_lex "$start_offset", $P114
.annotate 'line', 172
    find_lex $P1104, "%context"
    unless_null $P1104, vivify_89
    $P1104 = root_new ['parrot';'Hash']
  vivify_89:
    set $P113, $P1104["DEBUG"]
    unless_null $P113, vivify_90
    new $P113, "Undef"
  vivify_90:
    unless $P113, if_1103_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "From "
    find_lex $P116, "$start_offset"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1103_end:
.annotate 'line', 175
    find_lex $P1106, "$sub"
    unless_null $P1106, vivify_91
    $P1106 = root_new ['parrot';'Hash']
  vivify_91:
    set $P113, $P1106["params"]
    unless_null $P113, vivify_92
    new $P113, "Undef"
  vivify_92:
    if $P113, unless_1105_end
    $P114 = "list"()
    find_lex $P1107, "$sub"
    unless_null $P1107, vivify_93
    $P1107 = root_new ['parrot';'Hash']
    store_lex "$sub", $P1107
  vivify_93:
    set $P1107["params"], $P114
  unless_1105_end:
.annotate 'line', 176
    find_lex $P113, "$sub"
    $P114 = $P113."is_method"()
    unless $P114, if_1108_end
    find_lex $P1109, "$sub"
    unless_null $P1109, vivify_94
    $P1109 = root_new ['parrot';'Hash']
  vivify_94:
    set $P115, $P1109["params"]
    unless_null $P115, vivify_95
    new $P115, "Undef"
  vivify_95:
    get_hll_global $P116, ["POST"], "Value"
    $P117 = $P116."new"("self" :named("name"))
    $P115."unshift"($P117)
  if_1108_end:
.annotate 'line', 178
    find_lex $P1111, "$sub"
    unless_null $P1111, vivify_96
    $P1111 = root_new ['parrot';'Hash']
  vivify_96:
    set $P113, $P1111["params"]
    unless_null $P113, vivify_97
    new $P113, "Undef"
  vivify_97:
    set $N101, $P113
    unless $N101, if_1110_end
.annotate 'line', 179
    find_lex $P114, "self"
    find_lex $P1112, "$sub"
    unless_null $P1112, vivify_98
    $P1112 = root_new ['parrot';'Hash']
  vivify_98:
    set $P115, $P1112["params"]
    unless_null $P115, vivify_99
    new $P115, "Undef"
  vivify_99:
    find_lex $P116, "%context"
    $P114."build_pcc_call"("get_params_pc", $P115, $P116)
  if_1110_end:
.annotate 'line', 183
    find_lex $P114, "$sub"
    $P115 = $P114."list"()
    defined $I101, $P115
    unless $I101, for_undef_100
    iter $P113, $P115
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1116_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1116_test:
    unless $P113, loop1116_done
    shift $P116, $P113
  loop1116_redo:
    .const 'Sub' $P1114 = "23_1312473152.51907" 
    capture_lex $P1114
    $P1114($P116)
  loop1116_next:
    goto loop1116_test
  loop1116_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1116_next
    eq $P118, .CONTROL_LOOP_REDO, loop1116_redo
  loop1116_done:
    pop_eh 
  for_undef_100:
.annotate 'line', 187
    find_lex $P1118, "%context"
    unless_null $P1118, vivify_101
    $P1118 = root_new ['parrot';'Hash']
  vivify_101:
    set $P113, $P1118["DEBUG"]
    unless_null $P113, vivify_102
    new $P113, "Undef"
  vivify_102:
    unless $P113, if_1117_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Middle "
    find_lex $P116, "$bc"
    set $N101, $P116
    set $S101, $N101
    concat $P116, $P115, $S101
    $P114."debug"($P116)
  if_1117_end:
.annotate 'line', 190
    find_lex $P1120, "%context"
    unless_null $P1120, vivify_103
    $P1120 = root_new ['parrot';'Hash']
  vivify_103:
    set $P113, $P1120["DEBUG"]
    unless_null $P113, vivify_104
    new $P113, "Undef"
  vivify_104:
    unless $P113, if_1119_end
    find_lex $P114, "self"
    $P114."debug"("Emitting default return")
  if_1119_end:
.annotate 'line', 191
    find_lex $P113, "$bc"
.annotate 'line', 192
    new $P114, "ResizablePMCArray"
    push $P114, "set_returns_pc"
    push $P114, 0
    push $P113, $P114
.annotate 'line', 196
    find_lex $P113, "$bc"
    new $P114, "ResizablePMCArray"
    push $P114, "returncc"
    push $P113, $P114
.annotate 'line', 200
    find_lex $P113, "$bc"
    set $N101, $P113
    new $P114, 'Float'
    set $P114, $N101
    store_lex "$end_offset", $P114
.annotate 'line', 201
    find_lex $P1122, "%context"
    unless_null $P1122, vivify_105
    $P1122 = root_new ['parrot';'Hash']
  vivify_105:
    set $P113, $P1122["DEBUG"]
    unless_null $P113, vivify_106
    new $P113, "Undef"
  vivify_106:
    unless $P113, if_1121_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "To "
    find_lex $P116, "$end_offset"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1121_end:
.annotate 'line', 204
    find_lex $P113, "self"
    find_lex $P114, "$sub"
    find_lex $P1123, "%context"
    unless_null $P1123, vivify_107
    $P1123 = root_new ['parrot';'Hash']
  vivify_107:
    set $P115, $P1123["labels_todo"]
    unless_null $P115, vivify_108
    new $P115, "Undef"
  vivify_108:
    find_lex $P1124, "%context"
    unless_null $P1124, vivify_109
    $P1124 = root_new ['parrot';'Hash']
  vivify_109:
    set $P116, $P1124["bytecode"]
    unless_null $P116, vivify_110
    new $P116, "Undef"
  vivify_110:
    find_lex $P117, "%context"
    $P113."fixup_labels"($P114, $P115, $P116, $P117)
.annotate 'line', 207
    find_lex $P113, "$start_offset"
    find_lex $P114, "$end_offset"
    find_lex $P115, "$subname"
.annotate 'line', 212
    find_lex $P1126, "$sub"
    unless_null $P1126, vivify_111
    $P1126 = root_new ['parrot';'Hash']
  vivify_111:
    set $P116, $P1126["subid"]
    unless_null $P116, vivify_112
    new $P116, "Undef"
  vivify_112:
    set $P1125, $P116
    defined $I1128, $P1125
    if $I1128, default_1127
    find_lex $P117, "$subname"
    set $P1125, $P117
  default_1127:
.annotate 'line', 213
    find_lex $P118, "$sub"
    $P119 = $P118."nsentry"()
    set $P1129, $P119
    defined $I1131, $P1129
    if $I1131, default_1130
    find_lex $P120, "$subname"
    set $P1129, $P120
  default_1130:
.annotate 'line', 216
    find_lex $P122, "$sub"
    $P123 = $P122."is_method"()
    if $P123, if_1132
    new $P125, "String"
    assign $P125, ""
    set $P121, $P125
    goto if_1132_end
  if_1132:
    find_lex $P124, "$subname"
    set $P121, $P124
  if_1132_end:
.annotate 'line', 207
    find_lex $P126, "@n_regs_used"
.annotate 'line', 220
    find_lex $P127, "self"
    find_lex $P128, "$sub"
    find_lex $P129, "%context"
    $P130 = $P127."create_sub_pf_flags"($P128, $P129)
.annotate 'line', 221
    find_lex $P131, "self"
    find_lex $P132, "$sub"
    find_lex $P133, "%context"
    $P134 = $P131."create_sub_comp_flags"($P132, $P133)
.annotate 'line', 207
    $P135 = "hash"($P113 :named("start_offs"), $P114 :named("end_offs"), $P115 :named("name"), $P1125 :named("subid"), $P1129 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P121 :named("method_name"), $P126 :named("n_regs_used"), $P130 :named("pf_flags"), $P134 :named("comp_flags"))
    store_lex "%sub", $P135
.annotate 'line', 224
    find_lex $P113, "$sub"
    $P114 = $P113."namespace"()
    defined $I101, $P114
    unless $I101, if_1133_end
    .const 'Sub' $P1135 = "24_1312473152.51907" 
    capture_lex $P1135
    $P1135()
  if_1133_end:
.annotate 'line', 234
    find_lex $P113, "$sub"
    $P114 = $P113."constant_index"()
    store_lex "$idx", $P114
.annotate 'line', 235
    find_lex $P113, "$idx"
    defined $I101, $P113
    if $I101, if_1139
.annotate 'line', 240
    find_lex $P1144, "%context"
    unless_null $P1144, vivify_115
    $P1144 = root_new ['parrot';'Hash']
  vivify_115:
    set $P114, $P1144["constants"]
    unless_null $P114, vivify_116
    new $P114, "Undef"
  vivify_116:
    find_lex $P115, "%sub"
    new $P116, "Sub", $P115
    push $P114, $P116
.annotate 'line', 241
    find_lex $P1145, "%context"
    unless_null $P1145, vivify_117
    $P1145 = root_new ['parrot';'Hash']
  vivify_117:
    set $P114, $P1145["constants"]
    unless_null $P114, vivify_118
    new $P114, "Undef"
  vivify_118:
    $P115 = $P114."pmc_count"()
    sub $P116, $P115, 1
    store_lex "$idx", $P116
.annotate 'line', 242
    find_lex $P114, "$sub"
    find_lex $P115, "$idx"
    $P114."constant_index"($P115)
.annotate 'line', 243
    find_lex $P1147, "%context"
    unless_null $P1147, vivify_119
    $P1147 = root_new ['parrot';'Hash']
  vivify_119:
    set $P114, $P1147["DEBUG"]
    unless_null $P114, vivify_120
    new $P114, "Undef"
  vivify_120:
    unless $P114, if_1146_end
    find_lex $P115, "self"
    new $P116, 'String'
    set $P116, "Allocate new constant "
    find_lex $P117, "$idx"
    concat $P118, $P116, $P117
    $P115."debug"($P118)
  if_1146_end:
.annotate 'line', 239
    goto if_1139_end
  if_1139:
.annotate 'line', 236
    find_lex $P1141, "%context"
    unless_null $P1141, vivify_121
    $P1141 = root_new ['parrot';'Hash']
  vivify_121:
    set $P114, $P1141["DEBUG"]
    unless_null $P114, vivify_122
    new $P114, "Undef"
  vivify_122:
    unless $P114, if_1140_end
    find_lex $P115, "self"
    new $P116, 'String'
    set $P116, "Reusing old constant "
    find_lex $P117, "$idx"
    concat $P118, $P116, $P117
    $P115."debug"($P118)
  if_1140_end:
.annotate 'line', 237
    find_lex $P114, "%sub"
    new $P115, "Sub", $P114
    find_lex $P116, "$idx"
    set $I102, $P116
    find_lex $P1142, "%context"
    unless_null $P1142, vivify_123
    $P1142 = root_new ['parrot';'Hash']
    store_lex "%context", $P1142
  vivify_123:
    set $P1143, $P1142["constants"]
    unless_null $P1143, vivify_124
    $P1143 = root_new ['parrot';'ResizablePMCArray']
    set $P1142["constants"], $P1143
  vivify_124:
    set $P1143[$I102], $P115
  if_1139_end:
.annotate 'line', 247
    find_lex $P1149, "%context"
    unless_null $P1149, vivify_125
    $P1149 = root_new ['parrot';'Hash']
  vivify_125:
    set $P114, $P1149["got_main_sub"]
    unless_null $P114, vivify_126
    new $P114, "Undef"
  vivify_126:
    isfalse $I101, $P114
    if $I101, if_1148
    new $P113, 'Integer'
    set $P113, $I101
    goto if_1148_end
  if_1148:
.annotate 'line', 248
    find_lex $P1151, "%context"
    unless_null $P1151, vivify_127
    $P1151 = root_new ['parrot';'Hash']
  vivify_127:
    set $P115, $P1151["DEBUG"]
    unless_null $P115, vivify_128
    new $P115, "Undef"
  vivify_128:
    unless $P115, if_1150_end
    find_lex $P116, "self"
    new $P117, 'String'
    set $P117, "main_sub is "
    find_lex $P1152, "%context"
    unless_null $P1152, vivify_129
    $P1152 = root_new ['parrot';'Hash']
  vivify_129:
    set $P118, $P1152["bytecode"]
    unless_null $P118, vivify_130
    new $P118, "Undef"
  vivify_130:
    $P119 = $P118."main_sub"()
    set $S101, $P119
    concat $P118, $P117, $S101
    $P116."debug"($P118)
  if_1150_end:
.annotate 'line', 249
    find_lex $P115, "$sub"
    $P116 = $P115."main"()
    if $P116, if_1153
.annotate 'line', 255
    find_lex $P1159, "%context"
    unless_null $P1159, vivify_131
    $P1159 = root_new ['parrot';'Hash']
  vivify_131:
    set $P117, $P1159["bytecode"]
    unless_null $P117, vivify_132
    new $P117, "Undef"
  vivify_132:
    $N101 = $P117."main_sub"()
    iseq $I102, $N101, -1.0
    unless $I102, if_1158_end
.annotate 'line', 257
    find_lex $P1161, "%context"
    unless_null $P1161, vivify_133
    $P1161 = root_new ['parrot';'Hash']
  vivify_133:
    set $P118, $P1161["DEBUG"]
    unless_null $P118, vivify_134
    new $P118, "Undef"
  vivify_134:
    unless $P118, if_1160_end
    find_lex $P119, "self"
    $P119."debug"("Got first sub")
  if_1160_end:
.annotate 'line', 258
    find_lex $P1162, "%context"
    unless_null $P1162, vivify_135
    $P1162 = root_new ['parrot';'Hash']
  vivify_135:
    set $P118, $P1162["bytecode"]
    unless_null $P118, vivify_136
    new $P118, "Undef"
  vivify_136:
    find_lex $P119, "$idx"
    $P118."main_sub"($P119)
  if_1158_end:
.annotate 'line', 255
    goto if_1153_end
  if_1153:
.annotate 'line', 250
    find_lex $P1155, "%context"
    unless_null $P1155, vivify_137
    $P1155 = root_new ['parrot';'Hash']
  vivify_137:
    set $P117, $P1155["DEBUG"]
    unless_null $P117, vivify_138
    new $P117, "Undef"
  vivify_138:
    unless $P117, if_1154_end
    find_lex $P118, "self"
    $P118."debug"("Got first :main")
  if_1154_end:
.annotate 'line', 252
    find_lex $P1156, "%context"
    unless_null $P1156, vivify_139
    $P1156 = root_new ['parrot';'Hash']
  vivify_139:
    set $P117, $P1156["bytecode"]
    unless_null $P117, vivify_140
    new $P117, "Undef"
  vivify_140:
    find_lex $P118, "$idx"
    $P117."main_sub"($P118)
.annotate 'line', 253
    new $P117, "Integer"
    assign $P117, 1
    find_lex $P1157, "%context"
    unless_null $P1157, vivify_141
    $P1157 = root_new ['parrot';'Hash']
    store_lex "%context", $P1157
  vivify_141:
    set $P1157["got_main_sub"], $P117
  if_1153_end:
.annotate 'line', 261
    find_lex $P1164, "%context"
    unless_null $P1164, vivify_142
    $P1164 = root_new ['parrot';'Hash']
  vivify_142:
    set $P116, $P1164["DEBUG"]
    unless_null $P116, vivify_143
    new $P116, "Undef"
  vivify_143:
    if $P116, if_1163
    set $P115, $P116
    goto if_1163_end
  if_1163:
    find_lex $P117, "self"
    new $P118, 'String'
    set $P118, ":main sub is "
    find_lex $P1165, "%context"
    unless_null $P1165, vivify_144
    $P1165 = root_new ['parrot';'Hash']
  vivify_144:
    set $P119, $P1165["bytecode"]
    unless_null $P119, vivify_145
    new $P119, "Undef"
  vivify_145:
    $P120 = $P119."main_sub"()
    set $S101, $P120
    concat $P119, $P118, $S101
    $P121 = $P117."debug"($P119)
    set $P115, $P121
  if_1163_end:
.annotate 'line', 247
    set $P113, $P115
  if_1148_end:
.annotate 'line', 148
    .return ($P113)
  control_1079:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1113"  :anon :subid("23_1312473152.51907") :outer("22_1312473152.51907")
    .param pmc param_1115
.annotate 'file', ''
.annotate 'line', 183
    .lex "$_", param_1115
.annotate 'line', 184
    find_lex $P117, "self"
    find_lex $P118, "$_"
    find_lex $P119, "%context"
    $P120 = $P117."to_pbc"($P118, $P119)
.annotate 'line', 183
    .return ($P120)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1134"  :anon :subid("24_1312473152.51907") :outer("22_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 225
    new $P115, "Undef"
    set $P1136, $P115
    .lex "$nskey", $P1136
    find_lex $P116, "$sub"
    $P117 = $P116."namespace"()
    find_lex $P118, "%context"
    $P119 = $P117."to_pmc"($P118)
    set $P120, $P119[0]
    unless_null $P120, vivify_113
    new $P120, "Undef"
  vivify_113:
    store_lex "$nskey", $P120
.annotate 'line', 226
    find_lex $P117, "$nskey"
    typeof $S101, $P117
    iseq $I102, $S101, "Key"
    if $I102, if_1137
    new $P116, 'Integer'
    set $P116, $I102
    goto if_1137_end
  if_1137:
.annotate 'line', 227
    find_lex $P118, "$nskey"
    find_lex $P1138, "%sub"
    unless_null $P1138, vivify_114
    $P1138 = root_new ['parrot';'Hash']
    store_lex "%sub", $P1138
  vivify_114:
    set $P1138["namespace_name"], $P118
.annotate 'line', 226
    set $P116, $P118
  if_1137_end:
.annotate 'line', 224
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("25_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Op"],_)
    .param pmc param_1169
    .param pmc param_1170
.annotate 'file', ''
.annotate 'line', 265
    .const 'Sub' $P1188 = "27_1312473152.51907" 
    capture_lex $P1188
    .const 'Sub' $P1177 = "26_1312473152.51907" 
    capture_lex $P1177
    new $P1168, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1168, control_1167
    push_eh $P1168
    .lex "self", self
    .lex "$op", param_1169
    .lex "%context", param_1170
.annotate 'line', 267
    new $P107, "Undef"
    set $P1171, $P107
    .lex "$fullname", $P1171
.annotate 'line', 282
    $P1173 = root_new ['parrot';'ResizablePMCArray']
    set $P1172, $P1173
    .lex "@op", $P1172
.annotate 'line', 267
    find_lex $P108, "$op"
    $P109 = $P108."pirop"()
    store_lex "$fullname", $P109
.annotate 'line', 268
    find_lex $P1175, "%context"
    unless_null $P1175, vivify_146
    $P1175 = root_new ['parrot';'Hash']
  vivify_146:
    set $P108, $P1175["DEBUG"]
    unless_null $P108, vivify_147
    new $P108, "Undef"
  vivify_147:
    unless $P108, if_1174_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Short name "
    find_lex $P111, "$fullname"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1174_end:
.annotate 'line', 270
    find_lex $P109, "$op"
    $P110 = $P109."list"()
    defined $I101, $P110
    unless $I101, for_undef_148
    iter $P108, $P110
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1181_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1181_test:
    unless $P108, loop1181_done
    shift $P111, $P108
  loop1181_redo:
    .const 'Sub' $P1177 = "26_1312473152.51907" 
    capture_lex $P1177
    $P1177($P111)
  loop1181_next:
    goto loop1181_test
  loop1181_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1181_next
    eq $P114, .CONTROL_LOOP_REDO, loop1181_redo
  loop1181_done:
    pop_eh 
  for_undef_148:
.annotate 'line', 275
    find_lex $P1183, "%context"
    unless_null $P1183, vivify_149
    $P1183 = root_new ['parrot';'Hash']
  vivify_149:
    set $P108, $P1183["DEBUG"]
    unless_null $P108, vivify_150
    new $P108, "Undef"
  vivify_150:
    unless $P108, if_1182_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Fullname "
    find_lex $P111, "$fullname"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1182_end:
.annotate 'line', 278
    find_lex $P1184, "%context"
    unless_null $P1184, vivify_151
    $P1184 = root_new ['parrot';'Hash']
  vivify_151:
    set $P108, $P1184["bytecode"]
    unless_null $P108, vivify_152
    new $P108, "Undef"
  vivify_152:
    set $N101, $P108
    new $P109, 'Float'
    set $P109, $N101
    find_lex $P1185, "%context"
    unless_null $P1185, vivify_153
    $P1185 = root_new ['parrot';'Hash']
    store_lex "%context", $P1185
  vivify_153:
    set $P1185["opcode_offset"], $P109
.annotate 'line', 280
    find_lex $P108, "$fullname"
    find_lex $P1186, "%context"
    unless_null $P1186, vivify_154
    $P1186 = root_new ['parrot';'Hash']
    store_lex "%context", $P1186
  vivify_154:
    set $P1186["opcode_fullname"], $P108
.annotate 'line', 282
    find_lex $P108, "$fullname"
    $P109 = "list"($P108)
    store_lex "@op", $P109
.annotate 'line', 283
    find_lex $P109, "$op"
    $P110 = $P109."list"()
    defined $I101, $P110
    unless $I101, for_undef_155
    iter $P108, $P110
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1190_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1190_test:
    unless $P108, loop1190_done
    shift $P111, $P108
  loop1190_redo:
    .const 'Sub' $P1188 = "27_1312473152.51907" 
    capture_lex $P1188
    $P1188($P111)
  loop1190_next:
    goto loop1190_test
  loop1190_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1190_next
    eq $P113, .CONTROL_LOOP_REDO, loop1190_redo
  loop1190_done:
    pop_eh 
  for_undef_155:
.annotate 'line', 286
    find_lex $P1192, "%context"
    unless_null $P1192, vivify_156
    $P1192 = root_new ['parrot';'Hash']
  vivify_156:
    set $P108, $P1192["DEBUG"]
    unless_null $P108, vivify_157
    new $P108, "Undef"
  vivify_157:
    unless $P108, if_1191_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Op size "
    find_lex $P111, "@op"
    set $N101, $P111
    set $S101, $N101
    concat $P111, $P110, $S101
    $P109."debug"($P111)
  if_1191_end:
.annotate 'line', 287
    find_lex $P1193, "%context"
    unless_null $P1193, vivify_158
    $P1193 = root_new ['parrot';'Hash']
  vivify_158:
    set $P108, $P1193["bytecode"]
    unless_null $P108, vivify_159
    new $P108, "Undef"
  vivify_159:
    find_lex $P109, "@op"
    push $P108, $P109
.annotate 'line', 265
    .return ($P108)
  control_1167:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1176"  :anon :subid("26_1312473152.51907") :outer("25_1312473152.51907")
    .param pmc param_1179
.annotate 'file', ''
.annotate 'line', 271
    new $P112, "Undef"
    set $P1178, $P112
    .lex "$type", $P1178
    .lex "$_", param_1179
    find_lex $P114, "$_"
    $P115 = $P114."type"()
    unless $P115, unless_1180
    set $P113, $P115
    goto unless_1180_end
  unless_1180:
    find_lex $P116, "self"
    find_lex $P117, "$_"
    $P118 = $P117."name"()
    find_lex $P119, "%context"
    $P120 = $P116."get_register"($P118, $P119)
    $P121 = $P120."type"()
    set $P113, $P121
  unless_1180_end:
    store_lex "$type", $P113
.annotate 'line', 272
    find_lex $P113, "$fullname"
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    concat $P115, $P114, "_"
    find_lex $P116, "$type"
    set $S102, $P116
    concat $P117, $P115, $S102
    store_lex "$fullname", $P117
.annotate 'line', 270
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1187"  :anon :subid("27_1312473152.51907") :outer("25_1312473152.51907")
    .param pmc param_1189
.annotate 'file', ''
.annotate 'line', 283
    .lex "$_", param_1189
.annotate 'line', 284
    find_lex $P112, "@op"
    find_lex $P113, "self"
    find_lex $P114, "$_"
    find_lex $P115, "%context"
    $P116 = $P113."to_op"($P114, $P115)
    $P117 = $P112."push"($P116)
.annotate 'line', 283
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("28_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Node"],_)
    .param pmc param_1197
    .param pmc param_1198
.annotate 'file', ''
.annotate 'line', 291
    .const 'Sub' $P1200 = "29_1312473152.51907" 
    capture_lex $P1200
    new $P1196, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1196, control_1195
    push_eh $P1196
    .lex "self", self
    .lex "$node", param_1197
    .lex "%context", param_1198
.annotate 'line', 292
    find_lex $P108, "$node"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_160
    iter $P107, $P109
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1202_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
  loop1202_test:
    unless $P107, loop1202_done
    shift $P110, $P107
  loop1202_redo:
    .const 'Sub' $P1200 = "29_1312473152.51907" 
    capture_lex $P1200
    $P1200($P110)
  loop1202_next:
    goto loop1202_test
  loop1202_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, .CONTROL_LOOP_NEXT, loop1202_next
    eq $P112, .CONTROL_LOOP_REDO, loop1202_redo
  loop1202_done:
    pop_eh 
  for_undef_160:
.annotate 'line', 291
    .return ($P107)
  control_1195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1199"  :anon :subid("29_1312473152.51907") :outer("28_1312473152.51907")
    .param pmc param_1201
.annotate 'file', ''
.annotate 'line', 292
    .lex "$_", param_1201
.annotate 'line', 293
    find_lex $P111, "self"
    find_lex $P112, "$_"
    find_lex $P113, "%context"
    $P114 = $P111."to_pbc"($P112, $P113)
.annotate 'line', 292
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Label"],_)
    .param pmc param_1206
    .param pmc param_1207
.annotate 'file', ''
.annotate 'line', 297
    .const 'Sub' $P1215 = "31_1312473152.51907" 
    capture_lex $P1215
    new $P1205, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1205, control_1204
    push_eh $P1205
    .lex "self", self
    .lex "$l", param_1206
    .lex "%context", param_1207
.annotate 'line', 298
    new $P107, "Undef"
    set $P1208, $P107
    .lex "$bc", $P1208
.annotate 'line', 301
    new $P108, "Undef"
    set $P1209, $P108
    .lex "$pos", $P1209
.annotate 'line', 298
    find_lex $P1210, "%context"
    unless_null $P1210, vivify_161
    $P1210 = root_new ['parrot';'Hash']
  vivify_161:
    set $P109, $P1210["bytecode"]
    unless_null $P109, vivify_162
    new $P109, "Undef"
  vivify_162:
    store_lex "$bc", $P109
.annotate 'line', 299
    find_lex $P109, "$l"
    $P110 = $P109."declared"()
    if $P110, unless_1211_end
    find_lex $P111, "self"
    $P111."panic"("Trying to emit undelcared label!")
  unless_1211_end:
.annotate 'line', 301
    find_lex $P109, "$bc"
    set $N101, $P109
    new $P110, 'Float'
    set $P110, $N101
    store_lex "$pos", $P110
.annotate 'line', 302
    find_lex $P1213, "%context"
    unless_null $P1213, vivify_163
    $P1213 = root_new ['parrot';'Hash']
  vivify_163:
    set $P109, $P1213["DEBUG"]
    unless_null $P109, vivify_164
    new $P109, "Undef"
  vivify_164:
    unless $P109, if_1212_end
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
  if_1212_end:
.annotate 'line', 304
    find_lex $P109, "$l"
    find_lex $P110, "$pos"
    $P109."position"($P110)
.annotate 'line', 306
    find_lex $P110, "$l"
    $P111 = $P110."list"()
    defined $I101, $P111
    unless $I101, for_undef_165
    iter $P109, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1217_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1217_test:
    unless $P109, loop1217_done
    shift $P112, $P109
  loop1217_redo:
    .const 'Sub' $P1215 = "31_1312473152.51907" 
    capture_lex $P1215
    $P1215($P112)
  loop1217_next:
    goto loop1217_test
  loop1217_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1217_next
    eq $P114, .CONTROL_LOOP_REDO, loop1217_redo
  loop1217_done:
    pop_eh 
  for_undef_165:
.annotate 'line', 297
    .return ($P109)
  control_1204:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1214"  :anon :subid("31_1312473152.51907") :outer("30_1312473152.51907")
    .param pmc param_1216
.annotate 'file', ''
.annotate 'line', 306
    .lex "$_", param_1216
.annotate 'line', 307
    find_lex $P113, "self"
    find_lex $P114, "$_"
    find_lex $P115, "%context"
    $P116 = $P113."to_pbc"($P114, $P115)
.annotate 'line', 306
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("32_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Call"],_)
    .param pmc param_1221
    .param pmc param_1222
.annotate 'file', ''
.annotate 'line', 311
    .const 'Sub' $P1239 = "33_1312473152.51907" 
    capture_lex $P1239
    new $P1220, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1220, control_1219
    push_eh $P1220
    .lex "self", self
    .lex "$call", param_1221
    .lex "%context", param_1222
.annotate 'line', 312
    new $P107, "Undef"
    set $P1223, $P107
    .lex "$bc", $P1223
.annotate 'line', 313
    new $P108, "Undef"
    set $P1224, $P108
    .lex "$calltype", $P1224
.annotate 'line', 314
    new $P109, "Undef"
    set $P1225, $P109
    .lex "$is_tailcall", $P1225
.annotate 'line', 312
    find_lex $P1226, "%context"
    unless_null $P1226, vivify_166
    $P1226 = root_new ['parrot';'Hash']
  vivify_166:
    set $P110, $P1226["bytecode"]
    unless_null $P110, vivify_167
    new $P110, "Undef"
  vivify_167:
    store_lex "$bc", $P110
.annotate 'line', 313
    find_lex $P110, "$call"
    $P111 = $P110."calltype"()
    store_lex "$calltype", $P111
.annotate 'line', 314
    find_lex $P110, "$calltype"
    set $S101, $P110
    iseq $I101, $S101, "tailcall"
    new $P111, 'Integer'
    set $P111, $I101
    store_lex "$is_tailcall", $P111
.annotate 'line', 316
    find_lex $P112, "$calltype"
    set $S101, $P112
    iseq $I101, $S101, "call"
    unless $I101, unless_1228
    new $P111, 'Integer'
    set $P111, $I101
    goto unless_1228_end
  unless_1228:
    find_lex $P113, "$calltype"
    set $S102, $P113
    iseq $I102, $S102, "tailcall"
    new $P111, 'Integer'
    set $P111, $I102
  unless_1228_end:
    if $P111, if_1227
.annotate 'line', 394
    find_lex $P116, "$calltype"
    set $S103, $P116
    iseq $I103, $S103, "return"
    if $I103, if_1278
.annotate 'line', 398
    find_lex $P119, "$calltype"
    set $S104, $P119
    iseq $I104, $S104, "results"
    if $I104, if_1280
.annotate 'line', 403
    find_lex $P120, "self"
    new $P121, 'String'
    set $P121, "NYI "
    find_lex $P122, "$calltype"
    set $S105, $P122
    concat $P124, $P121, $S105
    $P125 = $P120."panic"($P124)
.annotate 'line', 402
    set $P118, $P125
.annotate 'line', 398
    goto if_1280_end
  if_1280:
.annotate 'line', 400
    find_lex $P120, "self"
    find_lex $P1281, "$call"
    unless_null $P1281, vivify_168
    $P1281 = root_new ['parrot';'Hash']
  vivify_168:
    set $P121, $P1281["params"]
    unless_null $P121, vivify_169
    new $P121, "Undef"
  vivify_169:
    find_lex $P122, "%context"
    $P123 = $P120."build_pcc_call"("get_results_pc", $P121, $P122)
.annotate 'line', 398
    set $P118, $P123
  if_1280_end:
    set $P115, $P118
.annotate 'line', 394
    goto if_1278_end
  if_1278:
.annotate 'line', 395
    find_lex $P117, "self"
    find_lex $P1279, "$call"
    unless_null $P1279, vivify_170
    $P1279 = root_new ['parrot';'Hash']
  vivify_170:
    set $P118, $P1279["params"]
    unless_null $P118, vivify_171
    new $P118, "Undef"
  vivify_171:
    find_lex $P119, "%context"
    $P117."build_pcc_call"("set_returns_pc", $P118, $P119)
.annotate 'line', 396
    find_lex $P117, "$bc"
    new $P118, "ResizablePMCArray"
    push $P118, "returncc"
    push $P117, $P118
.annotate 'line', 394
    set $P115, $P117
  if_1278_end:
    set $P110, $P115
.annotate 'line', 316
    goto if_1227_end
  if_1227:
.annotate 'line', 317
    find_lex $P114, "$call"
    $P115 = $P114."invocant"()
    unless $P115, if_1229_end
.annotate 'line', 318
    find_lex $P1231, "$call"
    unless_null $P1231, vivify_172
    $P1231 = root_new ['parrot';'Hash']
  vivify_172:
    set $P116, $P1231["params"]
    unless_null $P116, vivify_173
    new $P116, "Undef"
  vivify_173:
    if $P116, unless_1230_end
    $P117 = "list"()
    find_lex $P1232, "$call"
    unless_null $P1232, vivify_174
    $P1232 = root_new ['parrot';'Hash']
    store_lex "$call", $P1232
  vivify_174:
    set $P1232["params"], $P117
  unless_1230_end:
.annotate 'line', 319
    find_lex $P1233, "$call"
    unless_null $P1233, vivify_175
    $P1233 = root_new ['parrot';'Hash']
  vivify_175:
    set $P116, $P1233["params"]
    unless_null $P116, vivify_176
    new $P116, "Undef"
  vivify_176:
    find_lex $P117, "$call"
    $P118 = $P117."invocant"()
    $P116."unshift"($P118)
  if_1229_end:
.annotate 'line', 322
    find_lex $P114, "self"
    find_lex $P1234, "$call"
    unless_null $P1234, vivify_177
    $P1234 = root_new ['parrot';'Hash']
  vivify_177:
    set $P115, $P1234["params"]
    unless_null $P115, vivify_178
    new $P115, "Undef"
  vivify_178:
    find_lex $P116, "%context"
    $P114."build_pcc_call"("set_args_pc", $P115, $P116)
.annotate 'line', 324
    find_lex $P114, "$call"
    $P115 = $P114."invocant"()
    if $P115, if_1235
.annotate 'line', 338
    .const 'Sub' $P1239 = "33_1312473152.51907" 
    capture_lex $P1239
    $P1239()
    goto if_1235_end
  if_1235:
.annotate 'line', 325
    find_lex $P116, "$call"
    $P117 = $P116."name"()
    get_hll_global $P118, ["POST"], "Constant"
    $P119 = $P117."isa"($P118)
    if $P119, if_1236
.annotate 'line', 335
    find_lex $P120, "self"
    $P120."panic"("NYI $P0.$S0()")
.annotate 'line', 334
    goto if_1236_end
  if_1236:
.annotate 'line', 326
    find_lex $P120, "$bc"
.annotate 'line', 328
    find_lex $P122, "$is_tailcall"
    if $P122, if_1237
    new $P124, "String"
    assign $P124, "callmethodcc_p_sc"
    set $P121, $P124
    goto if_1237_end
  if_1237:
    new $P123, "String"
    assign $P123, "tailcallmethod_p_sc"
    set $P121, $P123
  if_1237_end:
.annotate 'line', 330
    find_lex $P125, "self"
    find_lex $P126, "$call"
    $P127 = $P126."invocant"()
    find_lex $P128, "%context"
    $P129 = $P125."to_op"($P127, $P128)
.annotate 'line', 331
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
  if_1236_end:
  if_1235_end:
.annotate 'line', 390
    find_lex $P115, "$is_tailcall"
    unless $P115, unless_1276
    set $P114, $P115
    goto unless_1276_end
  unless_1276:
.annotate 'line', 391
    find_lex $P116, "self"
    find_lex $P1277, "$call"
    unless_null $P1277, vivify_208
    $P1277 = root_new ['parrot';'Hash']
  vivify_208:
    set $P117, $P1277["results"]
    unless_null $P117, vivify_209
    new $P117, "Undef"
  vivify_209:
    find_lex $P118, "%context"
    $P119 = $P116."build_pcc_call"("get_results_pc", $P117, $P118)
.annotate 'line', 390
    set $P114, $P119
  unless_1276_end:
.annotate 'line', 316
    set $P110, $P114
  if_1227_end:
.annotate 'line', 311
    .return ($P110)
  control_1219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1238"  :anon :subid("33_1312473152.51907") :outer("32_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 338
    .const 'Sub' $P1245 = "34_1312473152.51907" 
    capture_lex $P1245
.annotate 'line', 339
    new $P116, "Undef"
    set $P1240, $P116
    .lex "$SUB", $P1240
.annotate 'line', 340
    new $P117, "Undef"
    set $P1241, $P117
    .lex "$processed", $P1241
.annotate 'line', 384
    new $P118, "Undef"
    set $P1242, $P118
    .lex "$o", $P1242
.annotate 'line', 338
    find_lex $P119, "$SUB"
.annotate 'line', 340
    new $P119, "Integer"
    assign $P119, 0
    store_lex "$processed", $P119
.annotate 'line', 341
    find_lex $P119, "$call"
    $P120 = $P119."name"()
    get_hll_global $P121, ["POST"], "Constant"
    $P122 = $P120."isa"($P121)
    unless $P122, if_1243_end
    .const 'Sub' $P1245 = "34_1312473152.51907" 
    capture_lex $P1245
    $P1245()
  if_1243_end:
.annotate 'line', 369
    find_lex $P119, "$processed"
    if $P119, unless_1265_end
.annotate 'line', 370
    find_lex $P120, "$call"
    $P121 = $P120."name"()
    get_hll_global $P122, ["POST"], "Constant"
    $P123 = $P121."isa"($P122)
    if $P123, if_1266
.annotate 'line', 379
    find_lex $P1270, "%context"
    unless_null $P1270, vivify_196
    $P1270 = root_new ['parrot';'Hash']
  vivify_196:
    set $P124, $P1270["DEBUG"]
    unless_null $P124, vivify_197
    new $P124, "Undef"
  vivify_197:
    unless $P124, if_1269_end
    find_lex $P125, "self"
    new $P126, "String"
    assign $P126, "Name is "
    find_lex $P1271, "$call"
    unless_null $P1271, vivify_198
    $P1271 = root_new ['parrot';'Hash']
  vivify_198:
    set $P127, $P1271["name"]
    unless_null $P127, vivify_199
    new $P127, "Undef"
  vivify_199:
    $S103 = $P127."WHAT"()
    concat $P128, $P126, $S103
    $P125."debug"($P128)
  if_1269_end:
.annotate 'line', 380
    find_lex $P1272, "$call"
    unless_null $P1272, vivify_200
    $P1272 = root_new ['parrot';'Hash']
  vivify_200:
    set $P124, $P1272["name"]
    unless_null $P124, vivify_201
    new $P124, "Undef"
  vivify_201:
    store_lex "$SUB", $P124
.annotate 'line', 378
    goto if_1266_end
  if_1266:
.annotate 'line', 371
    find_lex $P1267, "%context"
    unless_null $P1267, vivify_202
    $P1267 = root_new ['parrot';'Hash']
  vivify_202:
    set $P124, $P1267["sub"]
    unless_null $P124, vivify_203
    new $P124, "Undef"
  vivify_203:
    $P125 = $P124."symbol"("!SUB")
    store_lex "$SUB", $P125
.annotate 'line', 372
    find_lex $P124, "$bc"
.annotate 'line', 374
    find_lex $P125, "self"
    find_lex $P126, "$SUB"
    find_lex $P127, "%context"
    $P128 = $P125."to_op"($P126, $P127)
.annotate 'line', 375
    find_lex $P129, "self"
    find_lex $P1268, "$call"
    unless_null $P1268, vivify_204
    $P1268 = root_new ['parrot';'Hash']
  vivify_204:
    set $P130, $P1268["name"]
    unless_null $P130, vivify_205
    new $P130, "Undef"
  vivify_205:
    find_lex $P131, "%context"
    $P132 = $P129."to_op"($P130, $P131)
    new $P133, "ResizablePMCArray"
    push $P133, "find_sub_not_null_p_sc"
    push $P133, $P128
    push $P133, $P132
    push $P124, $P133
  if_1266_end:
  unless_1265_end:
.annotate 'line', 384
    find_lex $P120, "$is_tailcall"
    if $P120, if_1273
    new $P122, "String"
    assign $P122, "invokecc_p"
    set $P119, $P122
    goto if_1273_end
  if_1273:
    new $P121, "String"
    assign $P121, "tailcall_p"
    set $P119, $P121
  if_1273_end:
    store_lex "$o", $P119
.annotate 'line', 386
    find_lex $P1275, "%context"
    unless_null $P1275, vivify_206
    $P1275 = root_new ['parrot';'Hash']
  vivify_206:
    set $P119, $P1275["DEBUG"]
    unless_null $P119, vivify_207
    new $P119, "Undef"
  vivify_207:
    unless $P119, if_1274_end
    find_lex $P120, "self"
    find_lex $P121, "$o"
    $P120."debug"($P121)
  if_1274_end:
.annotate 'line', 387
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
.annotate 'line', 338
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1244"  :anon :subid("34_1312473152.51907") :outer("33_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 341
    .const 'Sub' $P1258 = "35_1312473152.51907" 
    capture_lex $P1258
.annotate 'line', 344
    new $P123, "Undef"
    set $P1246, $P123
    .lex "$full_name", $P1246
.annotate 'line', 347
    new $P124, "Undef"
    set $P1247, $P124
    .lex "$invocable_sub", $P1247
.annotate 'line', 341
    find_lex $P125, "$full_name"
.annotate 'line', 345
    find_lex $P1249, "%context"
    unless_null $P1249, vivify_179
    $P1249 = root_new ['parrot';'Hash']
  vivify_179:
    set $P125, $P1249["sub"]
    unless_null $P125, vivify_180
    new $P125, "Undef"
  vivify_180:
    $P126 = $P125."namespace"()
    unless $P126, if_1248_end
    find_lex $P1250, "%context"
    unless_null $P1250, vivify_181
    $P1250 = root_new ['parrot';'Hash']
  vivify_181:
    set $P127, $P1250["sub"]
    unless_null $P127, vivify_182
    new $P127, "Undef"
  vivify_182:
    $P128 = $P127."namespace"()
    $P129 = $P128."Str"()
    store_lex "$full_name", $P129
  if_1248_end:
.annotate 'line', 346
    find_lex $P125, "$full_name"
    set $S103, $P125
    new $P126, 'String'
    set $P126, $S103
    find_lex $P1251, "$call"
    unless_null $P1251, vivify_183
    $P1251 = root_new ['parrot';'Hash']
  vivify_183:
    set $P1252, $P1251["name"]
    unless_null $P1252, vivify_184
    $P1252 = root_new ['parrot';'Hash']
  vivify_184:
    set $P127, $P1252["value"]
    unless_null $P127, vivify_185
    new $P127, "Undef"
  vivify_185:
    set $S104, $P127
    concat $P128, $P126, $S104
    store_lex "$full_name", $P128
.annotate 'line', 347
    find_lex $P1253, "%context"
    unless_null $P1253, vivify_186
    $P1253 = root_new ['parrot';'Hash']
  vivify_186:
    set $P125, $P1253["pir_file"]
    unless_null $P125, vivify_187
    new $P125, "Undef"
  vivify_187:
    find_lex $P126, "$full_name"
    $P127 = $P125."sub"($P126)
    store_lex "$invocable_sub", $P127
.annotate 'line', 348
    find_lex $P1255, "%context"
    unless_null $P1255, vivify_188
    $P1255 = root_new ['parrot';'Hash']
  vivify_188:
    set $P125, $P1255["DEBUG"]
    unless_null $P125, vivify_189
    new $P125, "Undef"
  vivify_189:
    unless $P125, if_1254_end
    find_lex $P126, "self"
    new $P127, 'String'
    set $P127, "invocable_sub '"
    find_lex $P128, "$full_name"
    concat $P129, $P127, $P128
    concat $P130, $P129, "'"
    $P126."debug"($P130)
  if_1254_end:
.annotate 'line', 349
    find_lex $P126, "$invocable_sub"
    if $P126, if_1256
    set $P125, $P126
    goto if_1256_end
  if_1256:
    .const 'Sub' $P1258 = "35_1312473152.51907" 
    capture_lex $P1258
    $P129 = $P1258()
    set $P125, $P129
  if_1256_end:
.annotate 'line', 341
    .return ($P125)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1257"  :anon :subid("35_1312473152.51907") :outer("34_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 350
    new $P127, "Undef"
    set $P1259, $P127
    .lex "$idx", $P1259
    find_lex $P128, "$invocable_sub"
    $P129 = $P128."constant_index"()
    store_lex "$idx", $P129
.annotate 'line', 351
    find_lex $P128, "$idx"
    defined $I103, $P128
    if $I103, unless_1260_end
.annotate 'line', 353
    find_lex $P1261, "%context"
    unless_null $P1261, vivify_190
    $P1261 = root_new ['parrot';'Hash']
  vivify_190:
    set $P129, $P1261["constants"]
    unless_null $P129, vivify_191
    new $P129, "Undef"
  vivify_191:
    new $P130, "Integer"
    push $P129, $P130
    store_lex "$idx", $P129
.annotate 'line', 354
    find_lex $P129, "$invocable_sub"
    find_lex $P130, "$idx"
    $P129."constant_index"($P130)
.annotate 'line', 355
    find_lex $P1263, "%context"
    unless_null $P1263, vivify_192
    $P1263 = root_new ['parrot';'Hash']
  vivify_192:
    set $P129, $P1263["DEBUG"]
    unless_null $P129, vivify_193
    new $P129, "Undef"
  vivify_193:
    unless $P129, if_1262_end
    find_lex $P130, "self"
    new $P131, 'String'
    set $P131, "Allocate constant for it "
    find_lex $P132, "$idx"
    concat $P133, $P131, $P132
    $P130."debug"($P133)
  if_1262_end:
  unless_1260_end:
.annotate 'line', 358
    find_lex $P1264, "%context"
    unless_null $P1264, vivify_194
    $P1264 = root_new ['parrot';'Hash']
  vivify_194:
    set $P128, $P1264["sub"]
    unless_null $P128, vivify_195
    new $P128, "Undef"
  vivify_195:
    $P129 = $P128."symbol"("!SUB")
    store_lex "$SUB", $P129
.annotate 'line', 359
    find_lex $P128, "$bc"
.annotate 'line', 361
    find_lex $P129, "self"
    find_lex $P130, "$SUB"
    find_lex $P131, "%context"
    $P132 = $P129."to_op"($P130, $P131)
    find_lex $P133, "$idx"
    new $P134, "ResizablePMCArray"
    push $P134, "set_p_pc"
    push $P134, $P132
    push $P134, $P133
.annotate 'line', 362
    push $P128, $P134
.annotate 'line', 365
    new $P128, "Integer"
    assign $P128, 1
    store_lex "$processed", $P128
.annotate 'line', 349
    .return ($P128)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("36_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Key"],_)
    .param pmc param_1285
    .param pmc param_1286
.annotate 'file', ''
.annotate 'line', 410
    new $P1284, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1284, control_1283
    push_eh $P1284
    .lex "self", self
    .lex "$key", param_1285
    .lex "%context", param_1286
.annotate 'line', 413
    new $P107, "Undef"
    set $P1287, $P107
    .lex "$key_pmc", $P1287
.annotate 'line', 419
    new $P108, "Undef"
    set $P1288, $P108
    .lex "$constants", $P1288
.annotate 'line', 420
    new $P109, "Undef"
    set $P1289, $P109
    .lex "$idx", $P1289
.annotate 'line', 412
    find_lex $P1291, "%context"
    unless_null $P1291, vivify_210
    $P1291 = root_new ['parrot';'Hash']
  vivify_210:
    set $P110, $P1291["DEBUG"]
    unless_null $P110, vivify_211
    new $P110, "Undef"
  vivify_211:
    unless $P110, if_1290_end
    find_lex $P111, "self"
    $P111."debug"("Want key")
  if_1290_end:
.annotate 'line', 413
    find_lex $P110, "$key"
    find_lex $P111, "%context"
    $P112 = $P110."to_pmc"($P111)
    set $P113, $P112[0]
    unless_null $P113, vivify_212
    new $P113, "Undef"
  vivify_212:
    store_lex "$key_pmc", $P113
.annotate 'line', 414
    find_lex $P1293, "%context"
    unless_null $P1293, vivify_213
    $P1293 = root_new ['parrot';'Hash']
  vivify_213:
    set $P110, $P1293["DEBUG"]
    unless_null $P110, vivify_214
    new $P110, "Undef"
  vivify_214:
    unless $P110, if_1292_end
    find_lex $P111, "self"
    $P111."debug"("Got key")
  if_1292_end:
.annotate 'line', 419
    find_lex $P1294, "%context"
    unless_null $P1294, vivify_215
    $P1294 = root_new ['parrot';'Hash']
  vivify_215:
    set $P110, $P1294["constants"]
    unless_null $P110, vivify_216
    new $P110, "Undef"
  vivify_216:
    store_lex "$constants", $P110
.annotate 'line', 410
    find_lex $P110, "$idx"
.annotate 'line', 421

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
.annotate 'line', 410
    find_lex $P110, "$idx"
    .return ($P110)
  control_1283:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("37_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Constant"],_)
    .param pmc param_1298
    .param pmc param_1299
.annotate 'file', ''
.annotate 'line', 437
    new $P1297, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1297, control_1296
    push_eh $P1297
    .lex "self", self
    .lex "$op", param_1298
    .lex "%context", param_1299
.annotate 'line', 438
    new $P107, "Undef"
    set $P1300, $P107
    .lex "$idx", $P1300
.annotate 'line', 439
    new $P108, "Undef"
    set $P1301, $P108
    .lex "$type", $P1301
.annotate 'line', 437
    find_lex $P109, "$idx"
.annotate 'line', 439
    find_lex $P109, "$op"
    $P110 = $P109."type"()
    store_lex "$type", $P110
.annotate 'line', 440
    find_lex $P110, "$type"
    set $S101, $P110
    iseq $I101, $S101, "ic"
    unless $I101, unless_1303
    new $P109, 'Integer'
    set $P109, $I101
    goto unless_1303_end
  unless_1303:
    find_lex $P111, "$type"
    set $S102, $P111
    iseq $I102, $S102, "kic"
    new $P109, 'Integer'
    set $P109, $I102
  unless_1303_end:
    if $P109, if_1302
.annotate 'line', 443
    find_lex $P112, "$type"
    set $S103, $P112
    iseq $I103, $S103, "nc"
    if $I103, if_1304
.annotate 'line', 447
    find_lex $P113, "self"
    $P113."panic"("NYI")
.annotate 'line', 446
    goto if_1304_end
  if_1304:
.annotate 'line', 444
    find_lex $P113, "$op"
    $P114 = $P113."value"()
    $P115 = "get_or_create_number"($P114)
    store_lex "$idx", $P115
  if_1304_end:
.annotate 'line', 443
    goto if_1302_end
  if_1302:
.annotate 'line', 441
    find_lex $P112, "$op"
    $P113 = $P112."value"()
    store_lex "$idx", $P113
  if_1302_end:
.annotate 'line', 450
    find_lex $P1306, "%context"
    unless_null $P1306, vivify_217
    $P1306 = root_new ['parrot';'Hash']
  vivify_217:
    set $P109, $P1306["DEBUG"]
    unless_null $P109, vivify_218
    new $P109, "Undef"
  vivify_218:
    unless $P109, if_1305_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Index "
    find_lex $P112, "$idx"
    concat $P113, $P111, $P112
    $P110."debug"($P113)
  if_1305_end:
.annotate 'line', 437
    find_lex $P109, "$idx"
    .return ($P109)
  control_1296:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"String"],_)
    .param pmc param_1310
    .param pmc param_1311
.annotate 'file', ''
.annotate 'line', 454
    .const 'Sub' $P1318 = "39_1312473152.51907" 
    capture_lex $P1318
    new $P1309, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1309, control_1308
    push_eh $P1309
    .lex "self", self
    .lex "$str", param_1310
    .lex "%context", param_1311
.annotate 'line', 455
    new $P107, "Undef"
    set $P1312, $P107
    .lex "$idx", $P1312
.annotate 'line', 456
    new $P108, "Undef"
    set $P1313, $P108
    .lex "$type", $P1313
.annotate 'line', 454
    find_lex $P109, "$idx"
.annotate 'line', 456
    find_lex $P109, "$str"
    $P110 = $P109."type"()
    store_lex "$type", $P110
.annotate 'line', 457
    find_lex $P109, "$type"
    set $S101, $P109
    isne $I101, $S101, "sc"
    unless $I101, if_1314_end
.annotate 'line', 458
    find_lex $P110, "self"
    $P110."panic"("attempt to pass a non-sc value off as a string")
  if_1314_end:
.annotate 'line', 460
    find_lex $P110, "$str"
    $S101 = $P110."encoding"()
    iseq $I101, $S101, "fixed_8"
    if $I101, if_1316
    new $P109, 'Integer'
    set $P109, $I101
    goto if_1316_end
  if_1316:
    find_lex $P111, "$str"
    $S102 = $P111."charset"()
    iseq $I102, $S102, "ascii"
    new $P109, 'Integer'
    set $P109, $I102
  if_1316_end:
    if $P109, if_1315
.annotate 'line', 463
    .const 'Sub' $P1318 = "39_1312473152.51907" 
    capture_lex $P1318
    $P1318()
    goto if_1315_end
  if_1315:
.annotate 'line', 461
    find_lex $P112, "$str"
    $P113 = $P112."value"()
    $P114 = "get_or_create_string"($P113)
    store_lex "$idx", $P114
  if_1315_end:
.annotate 'line', 454
    find_lex $P109, "$idx"
    .return ($P109)
  control_1308:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1317"  :anon :subid("39_1312473152.51907") :outer("38_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 465
    new $P112, "Undef"
    set $P1319, $P112
    .lex "$bb", $P1319
.annotate 'line', 466
    new $P113, "Undef"
    set $P1320, $P113
    .lex "$str_val", $P1320
.annotate 'line', 465
    new $P114, "ByteBuffer"
    store_lex "$bb", $P114
.annotate 'line', 466
    find_lex $P114, "$str"
    $P115 = $P114."value"()
    store_lex "$str_val", $P115
.annotate 'line', 467

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 475
    find_lex $P114, "$bb"
.annotate 'line', 476
    find_lex $P115, "$str"
    $P116 = $P115."encoding"()
    $P117 = $P114."get_string"($P116)
.annotate 'line', 475
    $P118 = "get_or_create_string"($P117)
    store_lex "$idx", $P118
.annotate 'line', 463
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Value"],_)
    .param pmc param_1324
    .param pmc param_1325
.annotate 'file', ''
.annotate 'line', 483
    new $P1323, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1323, control_1322
    push_eh $P1323
    .lex "self", self
    .lex "$val", param_1324
    .lex "%context", param_1325
.annotate 'line', 485
    new $P107, "Undef"
    set $P1326, $P107
    .lex "$orig", $P1326
    find_lex $P108, "self"
    find_lex $P109, "$val"
    $P110 = $P109."name"()
    find_lex $P111, "%context"
    $P112 = $P108."get_register"($P110, $P111)
    store_lex "$orig", $P112
.annotate 'line', 486
    find_lex $P108, "self"
    find_lex $P109, "$orig"
    find_lex $P110, "%context"
    $P111 = $P108."to_op"($P109, $P110)
.annotate 'line', 483
    .return ($P111)
  control_1322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("41_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Register"],_)
    .param pmc param_1330
    .param pmc param_1331
.annotate 'file', ''
.annotate 'line', 489
    new $P1329, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1329, control_1328
    push_eh $P1329
    .lex "self", self
    .lex "$reg", param_1330
    .lex "%context", param_1331
.annotate 'line', 490
    find_lex $P107, "$reg"
    $P108 = $P107."regno"()
.annotate 'line', 489
    .return ($P108)
  control_1328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("42_1312473152.51907") :method :outer("11_1312473152.51907") :multi(_,["POST";"Label"],_)
    .param pmc param_1335
    .param pmc param_1336
.annotate 'file', ''
.annotate 'line', 493
    new $P1334, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1334, control_1333
    push_eh $P1334
    .lex "self", self
    .lex "$l", param_1335
    .lex "%context", param_1336
.annotate 'line', 495
    new $P107, "Undef"
    set $P1337, $P107
    .lex "$bc", $P1337
.annotate 'line', 496
    new $P108, "Undef"
    set $P1338, $P108
    .lex "$pos", $P1338
.annotate 'line', 495
    find_lex $P1339, "%context"
    unless_null $P1339, vivify_219
    $P1339 = root_new ['parrot';'Hash']
  vivify_219:
    set $P109, $P1339["bytecode"]
    unless_null $P109, vivify_220
    new $P109, "Undef"
  vivify_220:
    store_lex "$bc", $P109
.annotate 'line', 496
    find_lex $P109, "$bc"
    set $N101, $P109
    new $P110, 'Float'
    set $P110, $N101
    store_lex "$pos", $P110
.annotate 'line', 500
    find_lex $P109, "$l"
    $P110 = $P109."name"()
.annotate 'line', 499
    find_lex $P1340, "%context"
    unless_null $P1340, vivify_221
    $P1340 = root_new ['parrot';'Hash']
  vivify_221:
    set $P111, $P1340["opcode_offset"]
    unless_null $P111, vivify_222
    new $P111, "Undef"
  vivify_222:
    find_lex $P1341, "%context"
    unless_null $P1341, vivify_223
    $P1341 = root_new ['parrot';'Hash']
  vivify_223:
    set $P112, $P1341["opcode_fullname"]
    unless_null $P112, vivify_224
    new $P112, "Undef"
  vivify_224:
    $P113 = "hash"($P110 :named("name"), $P111 :named("offset"), $P112 :named("opname"))
    find_lex $P114, "$pos"
    find_lex $P1342, "%context"
    unless_null $P1342, vivify_225
    $P1342 = root_new ['parrot';'Hash']
    store_lex "%context", $P1342
  vivify_225:
    set $P1343, $P1342["labels_todo"]
    unless_null $P1343, vivify_226
    $P1343 = root_new ['parrot';'Hash']
    set $P1342["labels_todo"], $P1343
  vivify_226:
    set $P1343[$P114], $P113
.annotate 'line', 505
    find_lex $P1345, "%context"
    unless_null $P1345, vivify_227
    $P1345 = root_new ['parrot';'Hash']
  vivify_227:
    set $P109, $P1345["DEBUG"]
    unless_null $P109, vivify_228
    new $P109, "Undef"
  vivify_228:
    unless $P109, if_1344_end
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
    find_lex $P1346, "%context"
    unless_null $P1346, vivify_229
    $P1346 = root_new ['parrot';'Hash']
  vivify_229:
    set $P118, $P1346["opcode_offset"]
    unless_null $P118, vivify_230
    new $P118, "Undef"
  vivify_230:
    set $S102, $P118
    concat $P119, $P117, $S102
    $P110."debug"($P119)
  if_1344_end:
.annotate 'line', 493
    .return (0)
  control_1333:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("43_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1350
    .param pmc param_1351
    .param pmc param_1352
.annotate 'file', ''
.annotate 'line', 517
    .const 'Sub' $P1364 = "44_1312473152.51907" 
    capture_lex $P1364
    new $P1349, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1349, control_1348
    push_eh $P1349
    .lex "self", self
    .lex "$opname", param_1350
    .lex "@args", param_1351
    .lex "%context", param_1352
.annotate 'line', 518
    new $P107, "Undef"
    set $P1353, $P107
    .lex "$bc", $P1353
.annotate 'line', 519
    new $P108, "Undef"
    set $P1354, $P108
    .lex "$signature", $P1354
.annotate 'line', 520
    new $P109, "Undef"
    set $P1355, $P109
    .lex "$sig_idx", $P1355
.annotate 'line', 527
    $P1357 = root_new ['parrot';'ResizablePMCArray']
    set $P1356, $P1357
    .lex "@op", $P1356
.annotate 'line', 518
    find_lex $P1358, "%context"
    unless_null $P1358, vivify_231
    $P1358 = root_new ['parrot';'Hash']
  vivify_231:
    set $P110, $P1358["bytecode"]
    unless_null $P110, vivify_232
    new $P110, "Undef"
  vivify_232:
    store_lex "$bc", $P110
.annotate 'line', 519
    find_lex $P110, "self"
    find_lex $P111, "@args"
    find_lex $P112, "%context"
    $P113 = $P110."build_args_signature"($P111, $P112)
    store_lex "$signature", $P113
.annotate 'line', 520
    find_lex $P110, "$signature"
    $P111 = "get_or_create_pmc"($P110)
    store_lex "$sig_idx", $P111
.annotate 'line', 522
    find_lex $P1360, "%context"
    unless_null $P1360, vivify_233
    $P1360 = root_new ['parrot';'Hash']
  vivify_233:
    set $P110, $P1360["DEBUG"]
    unless_null $P110, vivify_234
    new $P110, "Undef"
  vivify_234:
    unless $P110, if_1359_end
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "Sig: "
    find_lex $P113, "$sig_idx"
    concat $P114, $P112, $P113
    $P111."debug"($P114)
  if_1359_end:
.annotate 'line', 524
    find_lex $P1362, "%context"
    unless_null $P1362, vivify_235
    $P1362 = root_new ['parrot';'Hash']
  vivify_235:
    set $P110, $P1362["DEBUG"]
    unless_null $P110, vivify_236
    new $P110, "Undef"
  vivify_236:
    unless $P110, if_1361_end
    find_lex $P111, "self"
    find_lex $P112, "$opname"
    $P111."debug"($P112)
  if_1361_end:
.annotate 'line', 527
    find_lex $P110, "$opname"
    find_lex $P111, "$sig_idx"
    $P112 = "list"($P110, $P111)
    store_lex "@op", $P112
.annotate 'line', 529
    find_lex $P111, "@args"
    defined $I101, $P111
    unless $I101, for_undef_237
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1373_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1373_test:
    unless $P110, loop1373_done
    shift $P112, $P110
  loop1373_redo:
    .const 'Sub' $P1364 = "44_1312473152.51907" 
    capture_lex $P1364
    $P1364($P112)
  loop1373_next:
    goto loop1373_test
  loop1373_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1373_next
    eq $P114, .CONTROL_LOOP_REDO, loop1373_redo
  loop1373_done:
    pop_eh 
  for_undef_237:
.annotate 'line', 540
    find_lex $P110, "$bc"
    find_lex $P111, "@op"
    push $P110, $P111
.annotate 'line', 517
    .return ($P110)
  control_1348:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1363"  :anon :subid("44_1312473152.51907") :outer("43_1312473152.51907")
    .param pmc param_1365
.annotate 'file', ''
.annotate 'line', 529
    .const 'Sub' $P1368 = "45_1312473152.51907" 
    capture_lex $P1368
    .lex "$arg", param_1365
.annotate 'line', 531
    find_lex $P113, "$arg"
    $P114 = $P113."modifier"()
    isa $I102, $P114, "Hash"
    unless $I102, if_1366_end
    .const 'Sub' $P1368 = "45_1312473152.51907" 
    capture_lex $P1368
    $P1368()
  if_1366_end:
.annotate 'line', 537
    find_lex $P113, "@op"
    find_lex $P114, "self"
    find_lex $P115, "$arg"
    find_lex $P116, "%context"
    $P117 = $P114."to_op"($P115, $P116)
    $P118 = $P113."push"($P117)
.annotate 'line', 529
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1367"  :anon :subid("45_1312473152.51907") :outer("44_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 532
    new $P115, "Undef"
    set $P1369, $P115
    .lex "$name", $P1369
    find_lex $P116, "$arg"
    $P117 = $P116."modifier"()
    set $P118, $P117["named"]
    unless_null $P118, vivify_238
    new $P118, "Undef"
  vivify_238:
    set $P1370, $P118
    defined $I1372, $P1370
    if $I1372, default_1371
    find_lex $P119, "$arg"
    $P120 = $P119."name"()
    set $P1370, $P120
  default_1371:
    store_lex "$name", $P1370
.annotate 'line', 533
    find_lex $P116, "@op"
.annotate 'line', 534
    find_lex $P117, "$name"
    $P118 = "get_or_create_string"($P117)
    $P119 = $P116."push"($P118)
.annotate 'line', 531
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("46_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1377
    .param pmc param_1378
.annotate 'file', ''
.annotate 'line', 543
    .const 'Sub' $P1396 = "49_1312473152.51907" 
    capture_lex $P1396
    .const 'Sub' $P1385 = "47_1312473152.51907" 
    capture_lex $P1385
    new $P1376, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1376, control_1375
    push_eh $P1376
    .lex "self", self
    .lex "@args", param_1377
    .lex "%context", param_1378
.annotate 'line', 544
    $P1380 = root_new ['parrot';'ResizablePMCArray']
    set $P1379, $P1380
    .lex "@sig", $P1379
.annotate 'line', 557
    new $P107, "Undef"
    set $P1381, $P107
    .lex "$elements", $P1381
.annotate 'line', 558
    new $P108, "Undef"
    set $P1382, $P108
    .lex "$signature", $P1382
.annotate 'line', 566
    new $P109, "Undef"
    set $P1383, $P109
    .lex "$idx", $P1383
.annotate 'line', 543
    find_lex $P110, "@sig"
.annotate 'line', 545
    find_lex $P111, "@args"
    defined $I101, $P111
    unless $I101, for_undef_239
    iter $P110, $P111
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1393_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1393_test:
    unless $P110, loop1393_done
    shift $P112, $P110
  loop1393_redo:
    .const 'Sub' $P1385 = "47_1312473152.51907" 
    capture_lex $P1385
    $P1385($P112)
  loop1393_next:
    goto loop1393_test
  loop1393_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1393_next
    eq $P116, .CONTROL_LOOP_REDO, loop1393_redo
  loop1393_done:
    pop_eh 
  for_undef_239:
.annotate 'line', 557
    find_lex $P110, "@sig"
    set $N101, $P110
    new $P111, 'Float'
    set $P111, $N101
    store_lex "$elements", $P111
.annotate 'line', 558

        $P1394 = find_lex '$elements'
        $I99 = $P1394
        $P1394 = find_lex '$signature'
        $P1394 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1394
.annotate 'line', 566
    new $P110, "Integer"
    assign $P110, 0
    store_lex "$idx", $P110
.annotate 'line', 567
    find_lex $P111, "@sig"
    defined $I101, $P111
    unless $I101, for_undef_241
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1400_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1400_test:
    unless $P110, loop1400_done
    shift $P112, $P110
  loop1400_redo:
    .const 'Sub' $P1396 = "49_1312473152.51907" 
    capture_lex $P1396
    $P1396($P112)
  loop1400_next:
    goto loop1400_test
  loop1400_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1400_next
    eq $P114, .CONTROL_LOOP_REDO, loop1400_redo
  loop1400_done:
    pop_eh 
  for_undef_241:
.annotate 'line', 543
    find_lex $P110, "$signature"
    .return ($P110)
  control_1375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "_block1384"  :anon :subid("47_1312473152.51907") :outer("46_1312473152.51907")
    .param pmc param_1386
.annotate 'file', ''
.annotate 'line', 545
    .const 'Sub' $P1390 = "48_1312473152.51907" 
    capture_lex $P1390
    .lex "$arg", param_1386
.annotate 'line', 547
    new $P113, "Undef"
    set $P1387, $P113
    .lex "$s", $P1387
    find_lex $P114, "self"
    find_lex $P115, "$arg"
    find_lex $P116, "%context"
    $P117 = $P114."build_single_arg"($P115, $P116)
    store_lex "$s", $P117
.annotate 'line', 548
    find_lex $P115, "$s"
    isa $I102, $P115, "Integer"
    if $I102, if_1388
.annotate 'line', 552
    find_lex $P117, "$s"
    defined $I103, $P117
    unless $I103, for_undef_240
    iter $P116, $P117
    new $P120, 'ExceptionHandler'
    set_label $P120, loop1392_handler
    $P120."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P120
  loop1392_test:
    unless $P116, loop1392_done
    shift $P119, $P116
  loop1392_redo:
    .const 'Sub' $P1390 = "48_1312473152.51907" 
    capture_lex $P1390
    $P1390($P119)
  loop1392_next:
    goto loop1392_test
  loop1392_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, 'type'
    eq $P121, .CONTROL_LOOP_NEXT, loop1392_next
    eq $P121, .CONTROL_LOOP_REDO, loop1392_redo
  loop1392_done:
    pop_eh 
  for_undef_240:
.annotate 'line', 551
    set $P114, $P116
.annotate 'line', 548
    goto if_1388_end
  if_1388:
.annotate 'line', 549
    find_lex $P116, "@sig"
    find_lex $P117, "$s"
    $P118 = $P116."push"($P117)
.annotate 'line', 548
    set $P114, $P118
  if_1388_end:
.annotate 'line', 545
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1389"  :anon :subid("48_1312473152.51907") :outer("47_1312473152.51907")
    .param pmc param_1391
.annotate 'file', ''
.annotate 'line', 552
    .lex "$_", param_1391
    find_lex $P120, "@sig"
    find_lex $P121, "$_"
    $P122 = $P120."push"($P121)
    .return ($P122)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1395"  :anon :subid("49_1312473152.51907") :outer("46_1312473152.51907")
    .param pmc param_1397
.annotate 'file', ''
.annotate 'line', 567
    .lex "$val", param_1397
.annotate 'line', 568
    find_lex $P113, "$val"
    find_lex $P114, "$idx"
    set $I102, $P114
    find_lex $P1398, "$signature"
    unless_null $P1398, vivify_242
    $P1398 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1398
  vivify_242:
    set $P1398[$I102], $P113
.annotate 'line', 567
    find_lex $P113, "$idx"
    clone $P1399, $P113
    inc $P113
    .return ($P1399)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("50_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1404
    .param pmc param_1405
.annotate 'file', ''
.annotate 'line', 575
    new $P1403, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1403, control_1402
    push_eh $P1403
    .lex "self", self
    .lex "$arg", param_1404
    .lex "%context", param_1405
.annotate 'line', 578
    new $P107, "Undef"
    set $P1406, $P107
    .lex "$type", $P1406
.annotate 'line', 580
    new $P108, "Undef"
    set $P1407, $P108
    .lex "$res", $P1407
.annotate 'line', 594
    new $P109, "Undef"
    set $P1408, $P109
    .lex "$mod", $P1408
.annotate 'line', 578
    find_lex $P110, "$arg"
    $P111 = $P110."type"()
    set $P1409, $P111
    defined $I1411, $P1409
    if $I1411, default_1410
    find_lex $P112, "self"
    find_lex $P113, "$arg"
    $P114 = $P113."name"()
    find_lex $P115, "%context"
    $P116 = $P112."get_register"($P114, $P115)
    $P117 = $P116."type"()
    set $P1409, $P117
  default_1410:
    store_lex "$type", $P1409
.annotate 'line', 575
    find_lex $P110, "$res"
.annotate 'line', 583
    find_lex $P110, "$type"
    set $S101, $P110
    iseq $I101, $S101, "i"
    if $I101, if_1412
.annotate 'line', 584
    find_lex $P111, "$type"
    set $S102, $P111
    iseq $I102, $S102, "s"
    if $I102, if_1413
.annotate 'line', 585
    find_lex $P112, "$type"
    set $S103, $P112
    iseq $I103, $S103, "p"
    if $I103, if_1414
.annotate 'line', 586
    find_lex $P113, "$type"
    set $S104, $P113
    iseq $I104, $S104, "n"
    if $I104, if_1415
.annotate 'line', 588
    find_lex $P114, "$type"
    set $S105, $P114
    iseq $I105, $S105, "ic"
    if $I105, if_1416
.annotate 'line', 589
    find_lex $P115, "$type"
    set $S106, $P115
    iseq $I106, $S106, "sc"
    if $I106, if_1417
.annotate 'line', 590
    find_lex $P116, "$type"
    set $S107, $P116
    iseq $I107, $S107, "pc"
    if $I107, if_1418
.annotate 'line', 591
    find_lex $P117, "$type"
    set $S108, $P117
    iseq $I108, $S108, "nc"
    if $I108, if_1419
.annotate 'line', 592
    find_lex $P118, "self"
    new $P119, 'String'
    set $P119, "Unknown arg type '"
    find_lex $P120, "$type"
    concat $P121, $P119, $P120
    concat $P122, $P121, "'"
    $P118."panic"($P122)
    goto if_1419_end
  if_1419:
.annotate 'line', 591
    new $P118, "Integer"
    assign $P118, 3
    add $P119, $P118, 16
    store_lex "$res", $P119
  if_1419_end:
    goto if_1418_end
  if_1418:
.annotate 'line', 590
    new $P117, "Integer"
    assign $P117, 2
    add $P118, $P117, 16
    store_lex "$res", $P118
  if_1418_end:
    goto if_1417_end
  if_1417:
.annotate 'line', 589
    new $P116, "Integer"
    assign $P116, 1
    add $P117, $P116, 16
    store_lex "$res", $P117
  if_1417_end:
    goto if_1416_end
  if_1416:
.annotate 'line', 588
    new $P115, "Integer"
    assign $P115, 0
    add $P116, $P115, 16
    store_lex "$res", $P116
  if_1416_end:
    goto if_1415_end
  if_1415:
.annotate 'line', 586
    new $P114, "Integer"
    assign $P114, 3
    store_lex "$res", $P114
  if_1415_end:
    goto if_1414_end
  if_1414:
.annotate 'line', 585
    new $P113, "Integer"
    assign $P113, 2
    store_lex "$res", $P113
  if_1414_end:
    goto if_1413_end
  if_1413:
.annotate 'line', 584
    new $P112, "Integer"
    assign $P112, 1
    store_lex "$res", $P112
  if_1413_end:
    goto if_1412_end
  if_1412:
.annotate 'line', 583
    new $P111, "Integer"
    assign $P111, 0
    store_lex "$res", $P111
  if_1412_end:
.annotate 'line', 594
    find_lex $P110, "$arg"
    $P111 = $P110."modifier"()
    store_lex "$mod", $P111
.annotate 'line', 595
    find_lex $P110, "$mod"
    unless $P110, if_1420_end
.annotate 'line', 596
    find_lex $P111, "$mod"
    isa $I101, $P111, "Hash"
    if $I101, if_1421
.annotate 'line', 601
    find_lex $P112, "$mod"
    set $S101, $P112
    iseq $I102, $S101, "slurpy"
    if $I102, if_1422
.annotate 'line', 602
    find_lex $P113, "$mod"
    set $S102, $P113
    iseq $I103, $S102, "flat"
    if $I103, if_1423
.annotate 'line', 603
    find_lex $P114, "$mod"
    set $S103, $P114
    iseq $I104, $S103, "optional"
    if $I104, if_1424
.annotate 'line', 604
    find_lex $P115, "$mod"
    set $S104, $P115
    iseq $I105, $S104, "opt_flag"
    if $I105, if_1425
.annotate 'line', 605
    find_lex $P116, "$mod"
    set $S105, $P116
    iseq $I106, $S105, "slurpy named"
    if $I106, if_1426
.annotate 'line', 606
    find_lex $P117, "self"
    new $P118, 'String'
    set $P118, "Unsupported modifier "
    find_lex $P119, "$mod"
    concat $P120, $P118, $P119
    $P117."panic"($P120)
    goto if_1426_end
  if_1426:
.annotate 'line', 605
    find_lex $P117, "$res"
    add $P118, $P117, 32
    add $P119, $P118, 512
    store_lex "$res", $P119
  if_1426_end:
    goto if_1425_end
  if_1425:
.annotate 'line', 604
    find_lex $P116, "$res"
    add $P117, $P116, 256
    store_lex "$res", $P117
  if_1425_end:
    goto if_1424_end
  if_1424:
.annotate 'line', 603
    find_lex $P115, "$res"
    add $P116, $P115, 128
    store_lex "$res", $P116
  if_1424_end:
    goto if_1423_end
  if_1423:
.annotate 'line', 602
    find_lex $P114, "$res"
    add $P115, $P114, 32
    store_lex "$res", $P115
  if_1423_end:
    goto if_1422_end
  if_1422:
.annotate 'line', 601
    find_lex $P113, "$res"
    add $P114, $P113, 32
    store_lex "$res", $P114
  if_1422_end:
    goto if_1421_end
  if_1421:
.annotate 'line', 599
    new $P112, "Integer"
    assign $P112, 1
    add $P113, $P112, 16
    add $P114, $P113, 512
    find_lex $P115, "$res"
    add $P116, $P115, 512
    $P117 = "list"($P114, $P116)
    store_lex "$res", $P117
  if_1421_end:
  if_1420_end:
.annotate 'line', 575
    find_lex $P110, "$res"
    .return ($P110)
  control_1402:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("51_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1430
.annotate 'file', ''
.annotate 'line', 617
    .const 'Sub' $P1432 = "52_1312473152.51907" 
    capture_lex $P1432
    new $P1429, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1429, control_1428
    push_eh $P1429
    .lex "self", self
    .lex "$post", param_1430
.annotate 'line', 618
    find_lex $P108, "$post"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_243
    iter $P107, $P109
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1435_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1435_test:
    unless $P107, loop1435_done
    shift $P110, $P107
  loop1435_redo:
    .const 'Sub' $P1432 = "52_1312473152.51907" 
    capture_lex $P1432
    $P1432($P110)
  loop1435_next:
    goto loop1435_test
  loop1435_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1435_next
    eq $P113, .CONTROL_LOOP_REDO, loop1435_redo
  loop1435_done:
    pop_eh 
  for_undef_243:
.annotate 'line', 617
    .return ($P107)
  control_1428:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1431"  :anon :subid("52_1312473152.51907") :outer("51_1312473152.51907")
    .param pmc param_1433
.annotate 'file', ''
.annotate 'line', 618
    .lex "$sub", param_1433
.annotate 'line', 620
    find_lex $P112, "$sub"
    get_hll_global $P113, ["POST"], "Sub"
    $P114 = $P112."isa"($P113)
    if $P114, if_1434
    set $P111, $P114
    goto if_1434_end
  if_1434:
    find_lex $P115, "$post"
    find_lex $P116, "$sub"
    $P117 = $P116."full_name"()
    find_lex $P118, "$sub"
    $P119 = $P115."sub"($P117, $P118)
    set $P111, $P119
  if_1434_end:
.annotate 'line', 618
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("53_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1439
    .param pmc param_1440
.annotate 'file', ''
.annotate 'line', 625
    new $P1438, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1438, control_1437
    push_eh $P1438
    .lex "self", self
    .lex "$sub", param_1439
    .lex "%context", param_1440
.annotate 'line', 633
    new $P107, "Undef"
    set $P1441, $P107
    .lex "$res", $P1441
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$res", $P108
.annotate 'line', 634
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 1
    find_lex $P110, "$sub"
    $N101 = $P110."outer"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 635
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 8
    find_lex $P110, "$sub"
    $N101 = $P110."anon"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 636
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 16
    find_lex $P110, "$sub"
    $N101 = $P110."main"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 637
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 32
    find_lex $P110, "$sub"
    $N101 = $P110."load"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 638
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 64
    find_lex $P110, "$sub"
    $N101 = $P110."immediate"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 639
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 128
    find_lex $P110, "$sub"
    $N101 = $P110."postcomp"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 641
    find_lex $P1443, "%context"
    unless_null $P1443, vivify_244
    $P1443 = root_new ['parrot';'Hash']
  vivify_244:
    set $P108, $P1443["DEBUG"]
    unless_null $P108, vivify_245
    new $P108, "Undef"
  vivify_245:
    unless $P108, if_1442_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "pf_flags "
    find_lex $P111, "$res"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1442_end:
.annotate 'line', 625
    find_lex $P108, "$res"
    .return ($P108)
  control_1437:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("54_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1447
    .param pmc param_1448
.annotate 'file', ''
.annotate 'line', 646
    new $P1446, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1446, control_1445
    push_eh $P1446
    .lex "self", self
    .lex "$sub", param_1447
    .lex "%context", param_1448
.annotate 'line', 651
    new $P107, "Undef"
    set $P1449, $P107
    .lex "$res", $P1449
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$res", $P108
.annotate 'line', 652
    find_lex $P108, "$sub"
    $P109 = $P108."vtable"()
    unless $P109, if_1450_end
    find_lex $P110, "$res"
    add $P111, $P110, 2
    store_lex "$res", $P111
  if_1450_end:
.annotate 'line', 653
    find_lex $P108, "$sub"
    $P109 = $P108."is_method"()
    unless $P109, if_1451_end
    find_lex $P110, "$res"
    add $P111, $P110, 4
    store_lex "$res", $P111
  if_1451_end:
.annotate 'line', 654
    find_lex $P108, "$sub"
    $P109 = $P108."is_init"()
    unless $P109, if_1452_end
    find_lex $P110, "$res"
    add $P111, $P110, 1024
    store_lex "$res", $P111
  if_1452_end:
.annotate 'line', 655
    find_lex $P108, "$sub"
    $P109 = $P108."nsentry"()
    unless $P109, if_1453_end
    find_lex $P110, "$res"
    add $P111, $P110, 2048
    store_lex "$res", $P111
  if_1453_end:
.annotate 'line', 657
    find_lex $P1455, "%context"
    unless_null $P1455, vivify_246
    $P1455 = root_new ['parrot';'Hash']
  vivify_246:
    set $P108, $P1455["DEBUG"]
    unless_null $P108, vivify_247
    new $P108, "Undef"
  vivify_247:
    unless $P108, if_1454_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "comp_flags "
    find_lex $P111, "$res"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1454_end:
.annotate 'line', 646
    find_lex $P108, "$res"
    .return ($P108)
  control_1445:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("55_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1459
    .param pmc param_1460
    .param pmc param_1461
    .param pmc param_1462
.annotate 'file', ''
.annotate 'line', 662
    .const 'Sub' $P1466 = "56_1312473152.51907" 
    capture_lex $P1466
    new $P1458, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1458, control_1457
    push_eh $P1458
    .lex "self", self
    .lex "$sub", param_1459
    .lex "$labels_todo", param_1460
    .lex "$bc", param_1461
    .lex "%context", param_1462
.annotate 'line', 663
    find_lex $P1464, "%context"
    unless_null $P1464, vivify_248
    $P1464 = root_new ['parrot';'Hash']
  vivify_248:
    set $P107, $P1464["DEBUG"]
    unless_null $P107, vivify_249
    new $P107, "Undef"
  vivify_249:
    unless $P107, if_1463_end
    find_lex $P108, "self"
    $P108."debug"("Fixup labels")
  if_1463_end:
.annotate 'line', 664
    find_lex $P108, "$labels_todo"
    defined $I101, $P108
    unless $I101, for_undef_250
    iter $P107, $P108
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1483_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1483_test:
    unless $P107, loop1483_done
    shift $P109, $P107
  loop1483_redo:
    .const 'Sub' $P1466 = "56_1312473152.51907" 
    capture_lex $P1466
    $P1466($P109)
  loop1483_next:
    goto loop1483_test
  loop1483_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1483_next
    eq $P115, .CONTROL_LOOP_REDO, loop1483_redo
  loop1483_done:
    pop_eh 
  for_undef_250:
.annotate 'line', 662
    .return ($P107)
  control_1457:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1465"  :anon :subid("56_1312473152.51907") :outer("55_1312473152.51907")
    .param pmc param_1467
.annotate 'file', ''
.annotate 'line', 664
    .lex "$kv", param_1467
.annotate 'line', 665
    new $P110, "Undef"
    set $P1468, $P110
    .lex "$offset", $P1468
.annotate 'line', 666
    $P1470 = root_new ['parrot';'Hash']
    set $P1469, $P1470
    .lex "%todo", $P1469
.annotate 'line', 669
    new $P111, "Undef"
    set $P1471, $P111
    .lex "$op", $P1471
.annotate 'line', 672
    new $P112, "Undef"
    set $P1472, $P112
    .lex "$delta", $P1472
.annotate 'line', 665
    find_lex $P113, "$kv"
    $P114 = $P113."key"()
    store_lex "$offset", $P114
.annotate 'line', 666
    find_lex $P113, "$kv"
    $P114 = $P113."value"()
    store_lex "%todo", $P114
.annotate 'line', 667
    find_lex $P1474, "%context"
    unless_null $P1474, vivify_251
    $P1474 = root_new ['parrot';'Hash']
  vivify_251:
    set $P113, $P1474["DEBUG"]
    unless_null $P113, vivify_252
    new $P113, "Undef"
  vivify_252:
    unless $P113, if_1473_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Fixing '"
    find_lex $P1475, "%todo"
    unless_null $P1475, vivify_253
    $P1475 = root_new ['parrot';'Hash']
  vivify_253:
    set $P116, $P1475["name"]
    unless_null $P116, vivify_254
    new $P116, "Undef"
  vivify_254:
    set $S101, $P116
    concat $P117, $P115, $S101
    concat $P118, $P117, "' from op "
    find_lex $P1476, "%todo"
    unless_null $P1476, vivify_255
    $P1476 = root_new ['parrot';'Hash']
  vivify_255:
    set $P119, $P1476["opname"]
    unless_null $P119, vivify_256
    new $P119, "Undef"
  vivify_256:
    set $S102, $P119
    concat $P120, $P118, $S102
    concat $P121, $P120, " at "
    find_lex $P122, "$offset"
    set $S103, $P122
    concat $P123, $P121, $S103
    $P114."debug"($P123)
  if_1473_end:
.annotate 'line', 669
    find_lex $P1477, "%todo"
    unless_null $P1477, vivify_257
    $P1477 = root_new ['parrot';'Hash']
  vivify_257:
    set $P113, $P1477["opname"]
    unless_null $P113, vivify_258
    new $P113, "Undef"
  vivify_258:
    set $S101, $P113
    find_lex $P114, "$bc"
    $P115 = $P114."opmap"()
    set $P116, $P115[$S101]
    unless_null $P116, vivify_259
    new $P116, "Undef"
  vivify_259:
    store_lex "$op", $P116
.annotate 'line', 670
    find_lex $P1479, "%context"
    unless_null $P1479, vivify_260
    $P1479 = root_new ['parrot';'Hash']
  vivify_260:
    set $P113, $P1479["DEBUG"]
    unless_null $P113, vivify_261
    new $P113, "Undef"
  vivify_261:
    unless $P113, if_1478_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Op length is "
    find_lex $P116, "$op"
    $P117 = $P116."length"()
    set $S101, $P117
    concat $P116, $P115, $S101
    $P114."debug"($P116)
  if_1478_end:
.annotate 'line', 672
    find_lex $P113, "$sub"
    find_lex $P1480, "%todo"
    unless_null $P1480, vivify_262
    $P1480 = root_new ['parrot';'Hash']
  vivify_262:
    set $P114, $P1480["name"]
    unless_null $P114, vivify_263
    new $P114, "Undef"
  vivify_263:
    $P115 = $P113."label"($P114)
    $P116 = $P115."position"()
    find_lex $P1481, "%todo"
    unless_null $P1481, vivify_264
    $P1481 = root_new ['parrot';'Hash']
  vivify_264:
    set $P117, $P1481["offset"]
    unless_null $P117, vivify_265
    new $P117, "Undef"
  vivify_265:
    sub $P118, $P116, $P117
    store_lex "$delta", $P118
.annotate 'line', 674
    find_lex $P113, "$delta"
    find_lex $P114, "$offset"
    find_lex $P115, "$op"
    $N101 = $P115."length"()
    add $P116, $P114, $N101
    set $I102, $P116
    find_lex $P1482, "$bc"
    unless_null $P1482, vivify_266
    $P1482 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1482
  vivify_266:
    set $P1482[$I102], $P113
.annotate 'line', 664
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("57_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1487
    .param pmc param_1488
.annotate 'file', ''
.annotate 'line', 679
    new $P1486, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1486, control_1485
    push_eh $P1486
    .lex "self", self
    .lex "$name", param_1487
    .lex "%context", param_1488
.annotate 'line', 680
    new $P107, "Undef"
    set $P1489, $P107
    .lex "$reg", $P1489
    find_lex $P1490, "%context"
    unless_null $P1490, vivify_267
    $P1490 = root_new ['parrot';'Hash']
  vivify_267:
    set $P108, $P1490["sub"]
    unless_null $P108, vivify_268
    new $P108, "Undef"
  vivify_268:
    find_lex $P109, "$name"
    $P110 = $P108."symbol"($P109)
    store_lex "$reg", $P110
.annotate 'line', 681
    find_lex $P108, "$reg"
    isfalse $I101, $P108
    unless $I101, if_1491_end
.annotate 'line', 682
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Register '"
    find_lex $P111, "$name"
    set $S101, $P111
    concat $P112, $P110, $S101
    concat $P113, $P112, "' not predeclared in '"
    find_lex $P1492, "%context"
    unless_null $P1492, vivify_269
    $P1492 = root_new ['parrot';'Hash']
  vivify_269:
    set $P114, $P1492["sub"]
    unless_null $P114, vivify_270
    new $P114, "Undef"
  vivify_270:
    $P115 = $P114."name"()
    set $S102, $P115
    concat $P114, $P113, $S102
    concat $P116, $P114, "'"
    $P109."panic"($P116)
  if_1491_end:
.annotate 'line', 679
    find_lex $P108, "$reg"
    .return ($P108)
  control_1485:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "debug"  :subid("58_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1496 :slurpy
.annotate 'file', ''
.annotate 'line', 687
    .const 'Sub' $P1498 = "59_1312473152.51907" 
    capture_lex $P1498
    new $P1495, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1495, control_1494
    push_eh $P1495
    .lex "self", self
    .lex "@args", param_1496
.annotate 'line', 688
    find_lex $P108, "@args"
    defined $I101, $P108
    unless $I101, for_undef_271
    iter $P107, $P108
    new $P110, 'ExceptionHandler'
    set_label $P110, loop1500_handler
    $P110."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P110
  loop1500_test:
    unless $P107, loop1500_done
    shift $P109, $P107
  loop1500_redo:
    .const 'Sub' $P1498 = "59_1312473152.51907" 
    capture_lex $P1498
    $P1498($P109)
  loop1500_next:
    goto loop1500_test
  loop1500_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, .CONTROL_LOOP_NEXT, loop1500_next
    eq $P111, .CONTROL_LOOP_REDO, loop1500_redo
  loop1500_done:
    pop_eh 
  for_undef_271:
.annotate 'line', 687
    .return ($P107)
  control_1494:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1497"  :anon :subid("59_1312473152.51907") :outer("58_1312473152.51907")
    .param pmc param_1499
.annotate 'file', ''
.annotate 'line', 688
    .lex "$_", param_1499
.annotate 'line', 689
    find_lex $P110, "$_"
    say $P110
.annotate 'line', 688
    .return ()
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("60_1312473152.51907") :method :outer("11_1312473152.51907")
    .param pmc param_1504
    .param pmc param_1505
.annotate 'file', ''
.annotate 'line', 693
    new $P1503, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1503, control_1502
    push_eh $P1503
    .lex "self", self
    .lex "$past", param_1504
    .lex "%adverbs", param_1505
.annotate 'line', 694
    $P1507 = root_new ['parrot';'Hash']
    set $P1506, $P1507
    .lex "%context", $P1506
.annotate 'line', 702
    new $P107, "Undef"
    set $P1508, $P107
    .lex "$pfdir", $P1508
.annotate 'line', 693
    find_lex $P108, "%context"
.annotate 'line', 696
    find_lex $P108, "self"
    find_lex $P1509, "%context"
    unless_null $P1509, vivify_272
    $P1509 = root_new ['parrot';'Hash']
    store_lex "%context", $P1509
  vivify_272:
    set $P1509["compiler"], $P108
.annotate 'line', 698
    new $P108, "Packfile"
    find_lex $P1510, "%context"
    unless_null $P1510, vivify_273
    $P1510 = root_new ['parrot';'Hash']
    store_lex "%context", $P1510
  vivify_273:
    set $P1510["packfile"], $P108
.annotate 'line', 702
    find_lex $P1511, "%context"
    unless_null $P1511, vivify_274
    $P1511 = root_new ['parrot';'Hash']
  vivify_274:
    set $P108, $P1511["packfile"]
    unless_null $P108, vivify_275
    new $P108, "Undef"
  vivify_275:
    $P109 = $P108."get_directory"()
    store_lex "$pfdir", $P109
.annotate 'line', 705
    new $P108, "PackfileConstantTable"
    find_lex $P1512, "%context"
    unless_null $P1512, vivify_276
    $P1512 = root_new ['parrot';'Hash']
    store_lex "%context", $P1512
  vivify_276:
    set $P1512["constants"], $P108
.annotate 'line', 708
    new $P108, "FixedIntegerArray"
    find_lex $P1513, "%context"
    unless_null $P1513, vivify_277
    $P1513 = root_new ['parrot';'Hash']
    store_lex "%context", $P1513
  vivify_277:
    set $P1514, $P1513["constants"]
    unless_null $P1514, vivify_278
    $P1514 = root_new ['parrot';'ResizablePMCArray']
    set $P1513["constants"], $P1514
  vivify_278:
    set $P1514[0], $P108
.annotate 'line', 711
    find_lex $P1515, "%context"
    unless_null $P1515, vivify_279
    $P1515 = root_new ['parrot';'Hash']
  vivify_279:
    set $P108, $P1515["constants"]
    unless_null $P108, vivify_280
    new $P108, "Undef"
  vivify_280:
    find_lex $P1516, "$pfdir"
    unless_null $P1516, vivify_281
    $P1516 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1516
  vivify_281:
    set $P1516["CONSTANTS_hello.pir"], $P108
.annotate 'line', 714
    new $P108, "PackfileBytecodeSegment"
    find_lex $P1517, "%context"
    unless_null $P1517, vivify_282
    $P1517 = root_new ['parrot';'Hash']
    store_lex "%context", $P1517
  vivify_282:
    set $P1517["bytecode"], $P108
.annotate 'line', 715
    find_lex $P1518, "%context"
    unless_null $P1518, vivify_283
    $P1518 = root_new ['parrot';'Hash']
  vivify_283:
    set $P108, $P1518["bytecode"]
    unless_null $P108, vivify_284
    new $P108, "Undef"
  vivify_284:
    $P108."main_sub"(-1)
.annotate 'line', 717
    new $P108, "Integer"
    assign $P108, 0
    find_lex $P1519, "%context"
    unless_null $P1519, vivify_285
    $P1519 = root_new ['parrot';'Hash']
    store_lex "%context", $P1519
  vivify_285:
    set $P1519["got_main_sub"], $P108
.annotate 'line', 720
    find_lex $P1520, "%context"
    unless_null $P1520, vivify_286
    $P1520 = root_new ['parrot';'Hash']
  vivify_286:
    set $P108, $P1520["bytecode"]
    unless_null $P108, vivify_287
    new $P108, "Undef"
  vivify_287:
    find_lex $P1521, "$pfdir"
    unless_null $P1521, vivify_288
    $P1521 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1521
  vivify_288:
    set $P1521["BYTECODE_hello.pir"], $P108
.annotate 'line', 729
    get_hll_global $P108, ["POST"], "VanillaAllocator"
    $P109 = $P108."new"()
    find_lex $P1522, "%context"
    unless_null $P1522, vivify_289
    $P1522 = root_new ['parrot';'Hash']
    store_lex "%context", $P1522
  vivify_289:
    set $P1522["regalloc"], $P109
.annotate 'line', 731
    find_lex $P1523, "%adverbs"
    unless_null $P1523, vivify_290
    $P1523 = root_new ['parrot';'Hash']
  vivify_290:
    set $P108, $P1523["debug"]
    unless_null $P108, vivify_291
    new $P108, "Undef"
  vivify_291:
    find_lex $P1524, "%context"
    unless_null $P1524, vivify_292
    $P1524 = root_new ['parrot';'Hash']
    store_lex "%context", $P1524
  vivify_292:
    set $P1524["DEBUG"], $P108
.annotate 'line', 693
    find_lex $P108, "%context"
    .return ($P108)
  control_1502:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1526" :load :anon :subid("61_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1528 = "11_1312473152.51907" 
    $P107 = $P1528()
    .return ($P107)
.end


.namespace []
.sub "_block1529" :load :anon :subid("62_1312473152.51907")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1531 = "10_1312473152.51907" 
    $P101 = $P1531()
    .return ($P101)
.end

