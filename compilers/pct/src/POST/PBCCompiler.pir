
.namespace []
.sub "_block1000"  :anon :subid("10_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312474859.77612" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312474859.77612" 
    capture_lex $P1003
    $P108 = $P1003()
.annotate 'line', 1
    .return ($P108)
    .const 'Sub' $P1535 = "62_1312474859.77612" 
    .return ($P1535)
.end


.namespace []
.sub "" :load :init :subid("post63") :outer("10_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312474859.77612" 
    .local pmc block
    set block, $P1001
    $P1537 = get_root_global ["parrot"], "P6metaclass"
    $P1537."new_class"("POST::PBCCompiler", "PCT::HLLCompiler" :named("parent"))
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1002"  :subid("11_1312474859.77612") :outer("10_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1506 = "60_1312474859.77612" 
    capture_lex $P1506
    .const 'Sub' $P1498 = "58_1312474859.77612" 
    capture_lex $P1498
    .const 'Sub' $P1489 = "57_1312474859.77612" 
    capture_lex $P1489
    .const 'Sub' $P1461 = "55_1312474859.77612" 
    capture_lex $P1461
    .const 'Sub' $P1449 = "54_1312474859.77612" 
    capture_lex $P1449
    .const 'Sub' $P1441 = "53_1312474859.77612" 
    capture_lex $P1441
    .const 'Sub' $P1432 = "51_1312474859.77612" 
    capture_lex $P1432
    .const 'Sub' $P1406 = "50_1312474859.77612" 
    capture_lex $P1406
    .const 'Sub' $P1379 = "46_1312474859.77612" 
    capture_lex $P1379
    .const 'Sub' $P1352 = "43_1312474859.77612" 
    capture_lex $P1352
    .const 'Sub' $P1337 = "42_1312474859.77612" 
    capture_lex $P1337
    .const 'Sub' $P1332 = "41_1312474859.77612" 
    capture_lex $P1332
    .const 'Sub' $P1326 = "40_1312474859.77612" 
    capture_lex $P1326
    .const 'Sub' $P1312 = "38_1312474859.77612" 
    capture_lex $P1312
    .const 'Sub' $P1300 = "37_1312474859.77612" 
    capture_lex $P1300
    .const 'Sub' $P1287 = "36_1312474859.77612" 
    capture_lex $P1287
    .const 'Sub' $P1223 = "32_1312474859.77612" 
    capture_lex $P1223
    .const 'Sub' $P1208 = "30_1312474859.77612" 
    capture_lex $P1208
    .const 'Sub' $P1199 = "28_1312474859.77612" 
    capture_lex $P1199
    .const 'Sub' $P1171 = "25_1312474859.77612" 
    capture_lex $P1171
    .const 'Sub' $P1083 = "22_1312474859.77612" 
    capture_lex $P1083
    .const 'Sub' $P1078 = "21_1312474859.77612" 
    capture_lex $P1078
    .const 'Sub' $P1062 = "20_1312474859.77612" 
    capture_lex $P1062
    .const 'Sub' $P1056 = "19_1312474859.77612" 
    capture_lex $P1056
    .const 'Sub' $P1038 = "17_1312474859.77612" 
    capture_lex $P1038
    .const 'Sub' $P1032 = "16_1312474859.77612" 
    capture_lex $P1032
    .const 'Sub' $P1023 = "15_1312474859.77612" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "14_1312474859.77612" 
    capture_lex $P1016
    .const 'Sub' $P1005 = "12_1312474859.77612" 
    capture_lex $P1005
.annotate 'line', 58
    .const 'Sub' $P1005 = "12_1312474859.77612" 
    newclosure $P1014, $P1005
    set $P1004, $P1014
    .lex "trigger", $P1004
.annotate 'line', 112
    .const 'Sub' $P1016 = "14_1312474859.77612" 
    newclosure $P1021, $P1016
    set $P1015, $P1021
    .lex "get_or_create_number", $P1015
.annotate 'line', 123
    .const 'Sub' $P1023 = "15_1312474859.77612" 
    newclosure $P1030, $P1023
    set $P1022, $P1030
    .lex "get_or_create_pmc", $P1022
.annotate 'line', 128
    .const 'Sub' $P1032 = "16_1312474859.77612" 
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
.annotate 'line', 695
    .const 'Sub' $P1506 = "60_1312474859.77612" 
    newclosure $P1530, $P1506
.annotate 'line', 16
    .return ($P1530)
    .const 'Sub' $P1532 = "61_1312474859.77612" 
    .return ($P1532)
.end


.namespace ["POST";"PBCCompiler"]
.sub "" :load :init :subid("post64") :outer("11_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312474859.77612" 
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
.sub "trigger"  :subid("12_1312474859.77612") :outer("11_1312474859.77612")
    .param pmc param_1008
    .param pmc param_1009
.annotate 'file', ''
.annotate 'line', 58
    .const 'Sub' $P1011 = "13_1312474859.77612" 
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
    .const 'Sub' $P1011 = "13_1312474859.77612" 
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
.sub "_block1010"  :anon :subid("13_1312474859.77612") :outer("12_1312474859.77612")
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
.sub "get_or_create_number"  :subid("14_1312474859.77612") :outer("11_1312474859.77612")
    .param pmc param_1019
.annotate 'file', ''
.annotate 'line', 112
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "$num", param_1019
.annotate 'line', 113

		$P0 = find_caller_lex '%context'
		$P0 = $P0['constants']
		$P1 = find_lex '$num'
		$N1 = $P1
		$P1020 = $P0.'get_or_create_constant'($N1)
	
.annotate 'line', 112
    .return ($P1020)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_or_create_pmc"  :subid("15_1312474859.77612") :outer("11_1312474859.77612")
    .param pmc param_1026
.annotate 'file', ''
.annotate 'line', 123
    new $P1025, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1025, control_1024
    push_eh $P1025
    .lex "$pmc", param_1026
.annotate 'line', 124
    $P1028 = root_new ['parrot';'Hash']
    set $P1027, $P1028
    .lex "%context", $P1027
    find_caller_lex $P104, "%context"
    store_lex "%context", $P104
.annotate 'line', 125
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
.annotate 'line', 123
    .return ($P106)
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_or_create_string"  :subid("16_1312474859.77612") :outer("11_1312474859.77612")
    .param pmc param_1035
.annotate 'file', ''
.annotate 'line', 128
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "$str", param_1035
.annotate 'line', 129

		$P0 = find_caller_lex '%context'
		$P0 = $P0['constants']
		$P1 = find_lex '$str'
		$S1 = $P1
		$P1036 = $P0.'get_or_create_constant'($S1)
	
.annotate 'line', 128
    .return ($P1036)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "packfile"  :subid("17_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1041
    .param pmc param_1042 :slurpy :named
.annotate 'file', ''
.annotate 'line', 36
    .const 'Sub' $P1052 = "18_1312474859.77612" 
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
    .const 'Sub' $P1052 = "18_1312474859.77612" 
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
.sub "_block1051"  :anon :subid("18_1312474859.77612") :outer("17_1312474859.77612")
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
.sub "mainpmc"  :subid("19_1312474859.77612") :method :outer("11_1312474859.77612")
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
.sub "pbc"  :subid("20_1312474859.77612") :method :outer("11_1312474859.77612")
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
.annotate 'line', 82
    new $P107, "Undef"
    set $P1067, $P107
    .lex "$unlink", $P1067
.annotate 'line', 83
    new $P108, "Undef"
    set $P1068, $P108
    .lex "$filename", $P1068
.annotate 'line', 90
    new $P109, "Undef"
    set $P1069, $P109
    .lex "$handle", $P1069
.annotate 'line', 95
    new $P110, "Undef"
    set $P1070, $P110
    .lex "$view", $P1070
.annotate 'line', 80
    load_bytecode "osutils.pbc"
.annotate 'line', 79
    find_lex $P111, "$unlink"
.annotate 'line', 83
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
.annotate 'line', 84
    find_lex $P111, "$filename"
    isfalse $I101, $P111
    unless $I101, if_1072_end
.annotate 'line', 86
    $P112 = "tempdir"(".pbc" :named("SUFFIX"))
    store_lex "$filename", $P112
.annotate 'line', 87
    find_lex $P1074, "%adverbs"
    unless_null $P1074, vivify_77
    $P1074 = root_new ['parrot';'Hash']
  vivify_77:
    set $P112, $P1074["cleanup"]
    unless_null $P112, vivify_78
    new $P112, "Undef"
  vivify_78:
    set $P1073, $P112
    defined $I1076, $P1073
    if $I1076, default_1075
    new $P113, "Integer"
    assign $P113, 1
    set $P1073, $P113
  default_1075:
    store_lex "$unlink", $P1073
  if_1072_end:
.annotate 'line', 90
    new $P111, "FileHandle"
    store_lex "$handle", $P111
.annotate 'line', 91
    find_lex $P111, "$handle"
    find_lex $P112, "$filename"
    $P111."open"($P112, "w")
.annotate 'line', 92
    find_lex $P111, "$handle"
    find_lex $P112, "$packfile"
    set $S101, $P112
    $P111."print"($S101)
.annotate 'line', 93
    find_lex $P111, "$handle"
    $P111."close"()
.annotate 'line', 95
    find_lex $P111, "$filename"
    set $S101, $P111
    load_bytecode $P112, $S101
    store_lex "$view", $P112
.annotate 'line', 97
    find_lex $P111, "$unlink"
    unless $P111, if_1077_end
    find_lex $P112, "$filename"
    "unlink"($P112)
  if_1077_end:
.annotate 'line', 99
    find_lex $P111, "$view"
    "trigger"($P111, "load")
.annotate 'line', 100
    find_lex $P111, "$view"
    "trigger"($P111, "init")
.annotate 'line', 102
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
.sub "to_pbc"  :subid("21_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["Undef"],_)
    .param pmc param_1081
    .param pmc param_1082
.annotate 'file', ''
.annotate 'line', 146
    new $P1080, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1080, control_1079
    push_eh $P1080
    .lex "self", self
    .lex "$what", param_1081
    .lex "%context", param_1082
    .return ()
  control_1079:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("22_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Sub"],_)
    .param pmc param_1086
    .param pmc param_1087
.annotate 'file', ''
.annotate 'line', 150
    .const 'Sub' $P1140 = "24_1312474859.77612" 
    capture_lex $P1140
    .const 'Sub' $P1119 = "23_1312474859.77612" 
    capture_lex $P1119
    new $P1085, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1085, control_1084
    push_eh $P1085
    .lex "self", self
    .lex "$sub", param_1086
    .lex "%context", param_1087
.annotate 'line', 155
    $P1089 = root_new ['parrot';'ResizablePMCArray']
    set $P1088, $P1089
    .lex "@n_regs_used", $P1088
.annotate 'line', 159
    new $P107, "Undef"
    set $P1090, $P107
    .lex "$bc", $P1090
.annotate 'line', 165
    new $P108, "Undef"
    set $P1091, $P108
    .lex "$sb", $P1091
.annotate 'line', 167
    new $P109, "Undef"
    set $P1092, $P109
    .lex "$subname", $P1092
.annotate 'line', 173
    new $P110, "Undef"
    set $P1093, $P110
    .lex "$start_offset", $P1093
.annotate 'line', 202
    new $P111, "Undef"
    set $P1094, $P111
    .lex "$end_offset", $P1094
.annotate 'line', 209
    $P1096 = root_new ['parrot';'Hash']
    set $P1095, $P1096
    .lex "%sub", $P1095
.annotate 'line', 236
    new $P112, "Undef"
    set $P1097, $P112
    .lex "$idx", $P1097
.annotate 'line', 152
    find_lex $P113, "$sub"
    find_lex $P1098, "%context"
    unless_null $P1098, vivify_79
    $P1098 = root_new ['parrot';'Hash']
    store_lex "%context", $P1098
  vivify_79:
    set $P1098["sub"], $P113
.annotate 'line', 155
    find_lex $P1099, "%context"
    unless_null $P1099, vivify_80
    $P1099 = root_new ['parrot';'Hash']
  vivify_80:
    set $P113, $P1099["regalloc"]
    unless_null $P113, vivify_81
    new $P113, "Undef"
  vivify_81:
    find_lex $P114, "$sub"
    $P115 = $P113."process"($P114)
    store_lex "@n_regs_used", $P115
.annotate 'line', 156
    find_lex $P1101, "%context"
    unless_null $P1101, vivify_82
    $P1101 = root_new ['parrot';'Hash']
  vivify_82:
    set $P113, $P1101["DEBUG"]
    unless_null $P113, vivify_83
    new $P113, "Undef"
  vivify_83:
    unless $P113, if_1100_end
    find_lex $P114, "self"
    new $P115, "String"
    assign $P115, "n_regs_used "
    find_lex $P116, "@n_regs_used"
    $S101 = $P116."join"("-")
    concat $P117, $P115, $S101
    $P114."debug"($P117)
  if_1100_end:
.annotate 'line', 157
    find_lex $P1103, "%context"
    unless_null $P1103, vivify_84
    $P1103 = root_new ['parrot';'Hash']
  vivify_84:
    set $P113, $P1103["DEBUG"]
    unless_null $P113, vivify_85
    new $P113, "Undef"
  vivify_85:
    unless $P113, if_1102_end
    find_lex $P114, "self"
    find_lex $P115, "$sub"
    $P114."dumper"($P115, "sub")
  if_1102_end:
.annotate 'line', 159
    find_lex $P1104, "%context"
    unless_null $P1104, vivify_86
    $P1104 = root_new ['parrot';'Hash']
  vivify_86:
    set $P113, $P1104["bytecode"]
    unless_null $P113, vivify_87
    new $P113, "Undef"
  vivify_87:
    store_lex "$bc", $P113
.annotate 'line', 162
    $P113 = "hash"()
    find_lex $P1105, "%context"
    unless_null $P1105, vivify_88
    $P1105 = root_new ['parrot';'Hash']
    store_lex "%context", $P1105
  vivify_88:
    set $P1105["labels_todo"], $P113
.annotate 'line', 165
    new $P113, "StringBuilder"
    store_lex "$sb", $P113
.annotate 'line', 166
    find_lex $P113, "$sb"
    find_lex $P114, "$sub"
    $P115 = $P114."name"()
    set $S101, $P115
    push $P113, $S101
.annotate 'line', 167
    find_lex $P113, "$sb"
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    store_lex "$subname", $P114
.annotate 'line', 169
    find_lex $P1107, "%context"
    unless_null $P1107, vivify_89
    $P1107 = root_new ['parrot';'Hash']
  vivify_89:
    set $P113, $P1107["DEBUG"]
    unless_null $P113, vivify_90
    new $P113, "Undef"
  vivify_90:
    unless $P113, if_1106_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Emitting "
    find_lex $P116, "$subname"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1106_end:
.annotate 'line', 171
    find_lex $P113, "$subname"
    "get_or_create_string"($P113)
.annotate 'line', 173
    find_lex $P113, "$bc"
    set $N101, $P113
    new $P114, 'Float'
    set $P114, $N101
    store_lex "$start_offset", $P114
.annotate 'line', 174
    find_lex $P1109, "%context"
    unless_null $P1109, vivify_91
    $P1109 = root_new ['parrot';'Hash']
  vivify_91:
    set $P113, $P1109["DEBUG"]
    unless_null $P113, vivify_92
    new $P113, "Undef"
  vivify_92:
    unless $P113, if_1108_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "From "
    find_lex $P116, "$start_offset"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1108_end:
.annotate 'line', 177
    find_lex $P1111, "$sub"
    unless_null $P1111, vivify_93
    $P1111 = root_new ['parrot';'Hash']
  vivify_93:
    set $P113, $P1111["params"]
    unless_null $P113, vivify_94
    new $P113, "Undef"
  vivify_94:
    if $P113, unless_1110_end
    $P114 = "list"()
    find_lex $P1112, "$sub"
    unless_null $P1112, vivify_95
    $P1112 = root_new ['parrot';'Hash']
    store_lex "$sub", $P1112
  vivify_95:
    set $P1112["params"], $P114
  unless_1110_end:
.annotate 'line', 178
    find_lex $P113, "$sub"
    $P114 = $P113."is_method"()
    unless $P114, if_1113_end
    find_lex $P1114, "$sub"
    unless_null $P1114, vivify_96
    $P1114 = root_new ['parrot';'Hash']
  vivify_96:
    set $P115, $P1114["params"]
    unless_null $P115, vivify_97
    new $P115, "Undef"
  vivify_97:
    get_hll_global $P116, ["POST"], "Value"
    $P117 = $P116."new"("self" :named("name"))
    $P115."unshift"($P117)
  if_1113_end:
.annotate 'line', 180
    find_lex $P1116, "$sub"
    unless_null $P1116, vivify_98
    $P1116 = root_new ['parrot';'Hash']
  vivify_98:
    set $P113, $P1116["params"]
    unless_null $P113, vivify_99
    new $P113, "Undef"
  vivify_99:
    set $N101, $P113
    unless $N101, if_1115_end
.annotate 'line', 181
    find_lex $P114, "self"
    find_lex $P1117, "$sub"
    unless_null $P1117, vivify_100
    $P1117 = root_new ['parrot';'Hash']
  vivify_100:
    set $P115, $P1117["params"]
    unless_null $P115, vivify_101
    new $P115, "Undef"
  vivify_101:
    find_lex $P116, "%context"
    $P114."build_pcc_call"("get_params_pc", $P115, $P116)
  if_1115_end:
.annotate 'line', 185
    find_lex $P114, "$sub"
    $P115 = $P114."list"()
    defined $I101, $P115
    unless $I101, for_undef_102
    iter $P113, $P115
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1121_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1121_test:
    unless $P113, loop1121_done
    shift $P116, $P113
  loop1121_redo:
    .const 'Sub' $P1119 = "23_1312474859.77612" 
    capture_lex $P1119
    $P1119($P116)
  loop1121_next:
    goto loop1121_test
  loop1121_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P118, exception, 'type'
    eq $P118, .CONTROL_LOOP_NEXT, loop1121_next
    eq $P118, .CONTROL_LOOP_REDO, loop1121_redo
  loop1121_done:
    pop_eh 
  for_undef_102:
.annotate 'line', 189
    find_lex $P1123, "%context"
    unless_null $P1123, vivify_103
    $P1123 = root_new ['parrot';'Hash']
  vivify_103:
    set $P113, $P1123["DEBUG"]
    unless_null $P113, vivify_104
    new $P113, "Undef"
  vivify_104:
    unless $P113, if_1122_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Middle "
    find_lex $P116, "$bc"
    set $N101, $P116
    set $S101, $N101
    concat $P116, $P115, $S101
    $P114."debug"($P116)
  if_1122_end:
.annotate 'line', 192
    find_lex $P1125, "%context"
    unless_null $P1125, vivify_105
    $P1125 = root_new ['parrot';'Hash']
  vivify_105:
    set $P113, $P1125["DEBUG"]
    unless_null $P113, vivify_106
    new $P113, "Undef"
  vivify_106:
    unless $P113, if_1124_end
    find_lex $P114, "self"
    $P114."debug"("Emitting default return")
  if_1124_end:
.annotate 'line', 193
    find_lex $P113, "$bc"
.annotate 'line', 194
    new $P114, "ResizablePMCArray"
    push $P114, "set_returns_pc"
    push $P114, 0
    push $P113, $P114
.annotate 'line', 198
    find_lex $P113, "$bc"
    new $P114, "ResizablePMCArray"
    push $P114, "returncc"
    push $P113, $P114
.annotate 'line', 202
    find_lex $P113, "$bc"
    set $N101, $P113
    new $P114, 'Float'
    set $P114, $N101
    store_lex "$end_offset", $P114
.annotate 'line', 203
    find_lex $P1127, "%context"
    unless_null $P1127, vivify_107
    $P1127 = root_new ['parrot';'Hash']
  vivify_107:
    set $P113, $P1127["DEBUG"]
    unless_null $P113, vivify_108
    new $P113, "Undef"
  vivify_108:
    unless $P113, if_1126_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "To "
    find_lex $P116, "$end_offset"
    concat $P117, $P115, $P116
    $P114."debug"($P117)
  if_1126_end:
.annotate 'line', 206
    find_lex $P113, "self"
    find_lex $P114, "$sub"
    find_lex $P1128, "%context"
    unless_null $P1128, vivify_109
    $P1128 = root_new ['parrot';'Hash']
  vivify_109:
    set $P115, $P1128["labels_todo"]
    unless_null $P115, vivify_110
    new $P115, "Undef"
  vivify_110:
    find_lex $P1129, "%context"
    unless_null $P1129, vivify_111
    $P1129 = root_new ['parrot';'Hash']
  vivify_111:
    set $P116, $P1129["bytecode"]
    unless_null $P116, vivify_112
    new $P116, "Undef"
  vivify_112:
    find_lex $P117, "%context"
    $P113."fixup_labels"($P114, $P115, $P116, $P117)
.annotate 'line', 209
    find_lex $P113, "$start_offset"
    find_lex $P114, "$end_offset"
    find_lex $P115, "$subname"
.annotate 'line', 214
    find_lex $P1131, "$sub"
    unless_null $P1131, vivify_113
    $P1131 = root_new ['parrot';'Hash']
  vivify_113:
    set $P116, $P1131["subid"]
    unless_null $P116, vivify_114
    new $P116, "Undef"
  vivify_114:
    set $P1130, $P116
    defined $I1133, $P1130
    if $I1133, default_1132
    find_lex $P117, "$subname"
    set $P1130, $P117
  default_1132:
.annotate 'line', 215
    find_lex $P118, "$sub"
    $P119 = $P118."nsentry"()
    set $P1134, $P119
    defined $I1136, $P1134
    if $I1136, default_1135
    find_lex $P120, "$subname"
    set $P1134, $P120
  default_1135:
.annotate 'line', 218
    find_lex $P122, "$sub"
    $P123 = $P122."is_method"()
    if $P123, if_1137
    new $P125, "String"
    assign $P125, ""
    set $P121, $P125
    goto if_1137_end
  if_1137:
    find_lex $P124, "$subname"
    set $P121, $P124
  if_1137_end:
.annotate 'line', 209
    find_lex $P126, "@n_regs_used"
.annotate 'line', 222
    find_lex $P127, "self"
    find_lex $P128, "$sub"
    find_lex $P129, "%context"
    $P130 = $P127."create_sub_pf_flags"($P128, $P129)
.annotate 'line', 223
    find_lex $P131, "self"
    find_lex $P132, "$sub"
    find_lex $P133, "%context"
    $P134 = $P131."create_sub_comp_flags"($P132, $P133)
.annotate 'line', 209
    $P135 = "hash"($P113 :named("start_offs"), $P114 :named("end_offs"), $P115 :named("name"), $P1130 :named("subid"), $P1134 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P121 :named("method_name"), $P126 :named("n_regs_used"), $P130 :named("pf_flags"), $P134 :named("comp_flags"))
    store_lex "%sub", $P135
.annotate 'line', 226
    find_lex $P113, "$sub"
    $P114 = $P113."namespace"()
    defined $I101, $P114
    unless $I101, if_1138_end
    .const 'Sub' $P1140 = "24_1312474859.77612" 
    capture_lex $P1140
    $P1140()
  if_1138_end:
.annotate 'line', 236
    find_lex $P113, "$sub"
    $P114 = $P113."constant_index"()
    store_lex "$idx", $P114
.annotate 'line', 237
    find_lex $P113, "$idx"
    defined $I101, $P113
    if $I101, if_1144
.annotate 'line', 242
    find_lex $P1149, "%context"
    unless_null $P1149, vivify_117
    $P1149 = root_new ['parrot';'Hash']
  vivify_117:
    set $P114, $P1149["constants"]
    unless_null $P114, vivify_118
    new $P114, "Undef"
  vivify_118:
    find_lex $P115, "%sub"
    new $P116, "Sub", $P115
    push $P114, $P116
.annotate 'line', 243
    find_lex $P1150, "%context"
    unless_null $P1150, vivify_119
    $P1150 = root_new ['parrot';'Hash']
  vivify_119:
    set $P114, $P1150["constants"]
    unless_null $P114, vivify_120
    new $P114, "Undef"
  vivify_120:
    $P115 = $P114."pmc_count"()
    sub $P116, $P115, 1
    store_lex "$idx", $P116
.annotate 'line', 244
    find_lex $P114, "$sub"
    find_lex $P115, "$idx"
    $P114."constant_index"($P115)
.annotate 'line', 245
    find_lex $P1152, "%context"
    unless_null $P1152, vivify_121
    $P1152 = root_new ['parrot';'Hash']
  vivify_121:
    set $P114, $P1152["DEBUG"]
    unless_null $P114, vivify_122
    new $P114, "Undef"
  vivify_122:
    unless $P114, if_1151_end
    find_lex $P115, "self"
    new $P116, 'String'
    set $P116, "Allocate new constant "
    find_lex $P117, "$idx"
    concat $P118, $P116, $P117
    $P115."debug"($P118)
  if_1151_end:
.annotate 'line', 241
    goto if_1144_end
  if_1144:
.annotate 'line', 238
    find_lex $P1146, "%context"
    unless_null $P1146, vivify_123
    $P1146 = root_new ['parrot';'Hash']
  vivify_123:
    set $P114, $P1146["DEBUG"]
    unless_null $P114, vivify_124
    new $P114, "Undef"
  vivify_124:
    unless $P114, if_1145_end
    find_lex $P115, "self"
    new $P116, 'String'
    set $P116, "Reusing old constant "
    find_lex $P117, "$idx"
    concat $P118, $P116, $P117
    $P115."debug"($P118)
  if_1145_end:
.annotate 'line', 239
    find_lex $P114, "%sub"
    new $P115, "Sub", $P114
    find_lex $P116, "$idx"
    set $I102, $P116
    find_lex $P1147, "%context"
    unless_null $P1147, vivify_125
    $P1147 = root_new ['parrot';'Hash']
    store_lex "%context", $P1147
  vivify_125:
    set $P1148, $P1147["constants"]
    unless_null $P1148, vivify_126
    $P1148 = root_new ['parrot';'ResizablePMCArray']
    set $P1147["constants"], $P1148
  vivify_126:
    set $P1148[$I102], $P115
  if_1144_end:
.annotate 'line', 249
    find_lex $P1154, "%context"
    unless_null $P1154, vivify_127
    $P1154 = root_new ['parrot';'Hash']
  vivify_127:
    set $P114, $P1154["got_main_sub"]
    unless_null $P114, vivify_128
    new $P114, "Undef"
  vivify_128:
    isfalse $I101, $P114
    if $I101, if_1153
    new $P113, 'Integer'
    set $P113, $I101
    goto if_1153_end
  if_1153:
.annotate 'line', 250
    find_lex $P1156, "%context"
    unless_null $P1156, vivify_129
    $P1156 = root_new ['parrot';'Hash']
  vivify_129:
    set $P115, $P1156["DEBUG"]
    unless_null $P115, vivify_130
    new $P115, "Undef"
  vivify_130:
    unless $P115, if_1155_end
    find_lex $P116, "self"
    new $P117, 'String'
    set $P117, "main_sub is "
    find_lex $P1157, "%context"
    unless_null $P1157, vivify_131
    $P1157 = root_new ['parrot';'Hash']
  vivify_131:
    set $P118, $P1157["bytecode"]
    unless_null $P118, vivify_132
    new $P118, "Undef"
  vivify_132:
    $P119 = $P118."main_sub"()
    set $S101, $P119
    concat $P118, $P117, $S101
    $P116."debug"($P118)
  if_1155_end:
.annotate 'line', 251
    find_lex $P115, "$sub"
    $P116 = $P115."main"()
    if $P116, if_1158
.annotate 'line', 257
    find_lex $P1164, "%context"
    unless_null $P1164, vivify_133
    $P1164 = root_new ['parrot';'Hash']
  vivify_133:
    set $P117, $P1164["bytecode"]
    unless_null $P117, vivify_134
    new $P117, "Undef"
  vivify_134:
    $N101 = $P117."main_sub"()
    iseq $I102, $N101, -1.0
    unless $I102, if_1163_end
.annotate 'line', 259
    find_lex $P1166, "%context"
    unless_null $P1166, vivify_135
    $P1166 = root_new ['parrot';'Hash']
  vivify_135:
    set $P118, $P1166["DEBUG"]
    unless_null $P118, vivify_136
    new $P118, "Undef"
  vivify_136:
    unless $P118, if_1165_end
    find_lex $P119, "self"
    $P119."debug"("Got first sub")
  if_1165_end:
.annotate 'line', 260
    find_lex $P1167, "%context"
    unless_null $P1167, vivify_137
    $P1167 = root_new ['parrot';'Hash']
  vivify_137:
    set $P118, $P1167["bytecode"]
    unless_null $P118, vivify_138
    new $P118, "Undef"
  vivify_138:
    find_lex $P119, "$idx"
    $P118."main_sub"($P119)
  if_1163_end:
.annotate 'line', 257
    goto if_1158_end
  if_1158:
.annotate 'line', 252
    find_lex $P1160, "%context"
    unless_null $P1160, vivify_139
    $P1160 = root_new ['parrot';'Hash']
  vivify_139:
    set $P117, $P1160["DEBUG"]
    unless_null $P117, vivify_140
    new $P117, "Undef"
  vivify_140:
    unless $P117, if_1159_end
    find_lex $P118, "self"
    $P118."debug"("Got first :main")
  if_1159_end:
.annotate 'line', 254
    find_lex $P1161, "%context"
    unless_null $P1161, vivify_141
    $P1161 = root_new ['parrot';'Hash']
  vivify_141:
    set $P117, $P1161["bytecode"]
    unless_null $P117, vivify_142
    new $P117, "Undef"
  vivify_142:
    find_lex $P118, "$idx"
    $P117."main_sub"($P118)
.annotate 'line', 255
    new $P117, "Integer"
    assign $P117, 1
    find_lex $P1162, "%context"
    unless_null $P1162, vivify_143
    $P1162 = root_new ['parrot';'Hash']
    store_lex "%context", $P1162
  vivify_143:
    set $P1162["got_main_sub"], $P117
  if_1158_end:
.annotate 'line', 263
    find_lex $P1169, "%context"
    unless_null $P1169, vivify_144
    $P1169 = root_new ['parrot';'Hash']
  vivify_144:
    set $P116, $P1169["DEBUG"]
    unless_null $P116, vivify_145
    new $P116, "Undef"
  vivify_145:
    if $P116, if_1168
    set $P115, $P116
    goto if_1168_end
  if_1168:
    find_lex $P117, "self"
    new $P118, 'String'
    set $P118, ":main sub is "
    find_lex $P1170, "%context"
    unless_null $P1170, vivify_146
    $P1170 = root_new ['parrot';'Hash']
  vivify_146:
    set $P119, $P1170["bytecode"]
    unless_null $P119, vivify_147
    new $P119, "Undef"
  vivify_147:
    $P120 = $P119."main_sub"()
    set $S101, $P120
    concat $P119, $P118, $S101
    $P121 = $P117."debug"($P119)
    set $P115, $P121
  if_1168_end:
.annotate 'line', 249
    set $P113, $P115
  if_1153_end:
.annotate 'line', 150
    .return ($P113)
  control_1084:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1118"  :anon :subid("23_1312474859.77612") :outer("22_1312474859.77612")
    .param pmc param_1120
.annotate 'file', ''
.annotate 'line', 185
    .lex "$_", param_1120
.annotate 'line', 186
    find_lex $P117, "self"
    find_lex $P118, "$_"
    find_lex $P119, "%context"
    $P120 = $P117."to_pbc"($P118, $P119)
.annotate 'line', 185
    .return ($P120)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1139"  :anon :subid("24_1312474859.77612") :outer("22_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 227
    new $P115, "Undef"
    set $P1141, $P115
    .lex "$nskey", $P1141
    find_lex $P116, "$sub"
    $P117 = $P116."namespace"()
    find_lex $P118, "%context"
    $P119 = $P117."to_pmc"($P118)
    set $P120, $P119[0]
    unless_null $P120, vivify_115
    new $P120, "Undef"
  vivify_115:
    store_lex "$nskey", $P120
.annotate 'line', 228
    find_lex $P117, "$nskey"
    typeof $S101, $P117
    iseq $I102, $S101, "Key"
    if $I102, if_1142
    new $P116, 'Integer'
    set $P116, $I102
    goto if_1142_end
  if_1142:
.annotate 'line', 229
    find_lex $P118, "$nskey"
    find_lex $P1143, "%sub"
    unless_null $P1143, vivify_116
    $P1143 = root_new ['parrot';'Hash']
    store_lex "%sub", $P1143
  vivify_116:
    set $P1143["namespace_name"], $P118
.annotate 'line', 228
    set $P116, $P118
  if_1142_end:
.annotate 'line', 226
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("25_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Op"],_)
    .param pmc param_1174
    .param pmc param_1175
.annotate 'file', ''
.annotate 'line', 267
    .const 'Sub' $P1193 = "27_1312474859.77612" 
    capture_lex $P1193
    .const 'Sub' $P1182 = "26_1312474859.77612" 
    capture_lex $P1182
    new $P1173, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1173, control_1172
    push_eh $P1173
    .lex "self", self
    .lex "$op", param_1174
    .lex "%context", param_1175
.annotate 'line', 269
    new $P107, "Undef"
    set $P1176, $P107
    .lex "$fullname", $P1176
.annotate 'line', 284
    $P1178 = root_new ['parrot';'ResizablePMCArray']
    set $P1177, $P1178
    .lex "@op", $P1177
.annotate 'line', 269
    find_lex $P108, "$op"
    $P109 = $P108."pirop"()
    store_lex "$fullname", $P109
.annotate 'line', 270
    find_lex $P1180, "%context"
    unless_null $P1180, vivify_148
    $P1180 = root_new ['parrot';'Hash']
  vivify_148:
    set $P108, $P1180["DEBUG"]
    unless_null $P108, vivify_149
    new $P108, "Undef"
  vivify_149:
    unless $P108, if_1179_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Short name "
    find_lex $P111, "$fullname"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1179_end:
.annotate 'line', 272
    find_lex $P109, "$op"
    $P110 = $P109."list"()
    defined $I101, $P110
    unless $I101, for_undef_150
    iter $P108, $P110
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1186_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1186_test:
    unless $P108, loop1186_done
    shift $P111, $P108
  loop1186_redo:
    .const 'Sub' $P1182 = "26_1312474859.77612" 
    capture_lex $P1182
    $P1182($P111)
  loop1186_next:
    goto loop1186_test
  loop1186_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1186_next
    eq $P114, .CONTROL_LOOP_REDO, loop1186_redo
  loop1186_done:
    pop_eh 
  for_undef_150:
.annotate 'line', 277
    find_lex $P1188, "%context"
    unless_null $P1188, vivify_151
    $P1188 = root_new ['parrot';'Hash']
  vivify_151:
    set $P108, $P1188["DEBUG"]
    unless_null $P108, vivify_152
    new $P108, "Undef"
  vivify_152:
    unless $P108, if_1187_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Fullname "
    find_lex $P111, "$fullname"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1187_end:
.annotate 'line', 280
    find_lex $P1189, "%context"
    unless_null $P1189, vivify_153
    $P1189 = root_new ['parrot';'Hash']
  vivify_153:
    set $P108, $P1189["bytecode"]
    unless_null $P108, vivify_154
    new $P108, "Undef"
  vivify_154:
    set $N101, $P108
    new $P109, 'Float'
    set $P109, $N101
    find_lex $P1190, "%context"
    unless_null $P1190, vivify_155
    $P1190 = root_new ['parrot';'Hash']
    store_lex "%context", $P1190
  vivify_155:
    set $P1190["opcode_offset"], $P109
.annotate 'line', 282
    find_lex $P108, "$fullname"
    find_lex $P1191, "%context"
    unless_null $P1191, vivify_156
    $P1191 = root_new ['parrot';'Hash']
    store_lex "%context", $P1191
  vivify_156:
    set $P1191["opcode_fullname"], $P108
.annotate 'line', 284
    find_lex $P108, "$fullname"
    $P109 = "list"($P108)
    store_lex "@op", $P109
.annotate 'line', 285
    find_lex $P109, "$op"
    $P110 = $P109."list"()
    defined $I101, $P110
    unless $I101, for_undef_157
    iter $P108, $P110
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1195_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1195_test:
    unless $P108, loop1195_done
    shift $P111, $P108
  loop1195_redo:
    .const 'Sub' $P1193 = "27_1312474859.77612" 
    capture_lex $P1193
    $P1193($P111)
  loop1195_next:
    goto loop1195_test
  loop1195_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1195_next
    eq $P113, .CONTROL_LOOP_REDO, loop1195_redo
  loop1195_done:
    pop_eh 
  for_undef_157:
.annotate 'line', 288
    find_lex $P1197, "%context"
    unless_null $P1197, vivify_158
    $P1197 = root_new ['parrot';'Hash']
  vivify_158:
    set $P108, $P1197["DEBUG"]
    unless_null $P108, vivify_159
    new $P108, "Undef"
  vivify_159:
    unless $P108, if_1196_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Op size "
    find_lex $P111, "@op"
    set $N101, $P111
    set $S101, $N101
    concat $P111, $P110, $S101
    $P109."debug"($P111)
  if_1196_end:
.annotate 'line', 289
    find_lex $P1198, "%context"
    unless_null $P1198, vivify_160
    $P1198 = root_new ['parrot';'Hash']
  vivify_160:
    set $P108, $P1198["bytecode"]
    unless_null $P108, vivify_161
    new $P108, "Undef"
  vivify_161:
    find_lex $P109, "@op"
    push $P108, $P109
.annotate 'line', 267
    .return ($P108)
  control_1172:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1181"  :anon :subid("26_1312474859.77612") :outer("25_1312474859.77612")
    .param pmc param_1184
.annotate 'file', ''
.annotate 'line', 273
    new $P112, "Undef"
    set $P1183, $P112
    .lex "$type", $P1183
    .lex "$_", param_1184
    find_lex $P114, "$_"
    $P115 = $P114."type"()
    unless $P115, unless_1185
    set $P113, $P115
    goto unless_1185_end
  unless_1185:
    find_lex $P116, "self"
    find_lex $P117, "$_"
    $P118 = $P117."name"()
    find_lex $P119, "%context"
    $P120 = $P116."get_register"($P118, $P119)
    $P121 = $P120."type"()
    set $P113, $P121
  unless_1185_end:
    store_lex "$type", $P113
.annotate 'line', 274
    find_lex $P113, "$fullname"
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    concat $P115, $P114, "_"
    find_lex $P116, "$type"
    set $S102, $P116
    concat $P117, $P115, $S102
    store_lex "$fullname", $P117
.annotate 'line', 272
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1192"  :anon :subid("27_1312474859.77612") :outer("25_1312474859.77612")
    .param pmc param_1194
.annotate 'file', ''
.annotate 'line', 285
    .lex "$_", param_1194
.annotate 'line', 286
    find_lex $P112, "@op"
    find_lex $P113, "self"
    find_lex $P114, "$_"
    find_lex $P115, "%context"
    $P116 = $P113."to_op"($P114, $P115)
    $P117 = $P112."push"($P116)
.annotate 'line', 285
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("28_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Node"],_)
    .param pmc param_1202
    .param pmc param_1203
.annotate 'file', ''
.annotate 'line', 293
    .const 'Sub' $P1205 = "29_1312474859.77612" 
    capture_lex $P1205
    new $P1201, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1201, control_1200
    push_eh $P1201
    .lex "self", self
    .lex "$node", param_1202
    .lex "%context", param_1203
.annotate 'line', 294
    find_lex $P108, "$node"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_162
    iter $P107, $P109
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1207_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
  loop1207_test:
    unless $P107, loop1207_done
    shift $P110, $P107
  loop1207_redo:
    .const 'Sub' $P1205 = "29_1312474859.77612" 
    capture_lex $P1205
    $P1205($P110)
  loop1207_next:
    goto loop1207_test
  loop1207_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, .CONTROL_LOOP_NEXT, loop1207_next
    eq $P112, .CONTROL_LOOP_REDO, loop1207_redo
  loop1207_done:
    pop_eh 
  for_undef_162:
.annotate 'line', 293
    .return ($P107)
  control_1200:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1204"  :anon :subid("29_1312474859.77612") :outer("28_1312474859.77612")
    .param pmc param_1206
.annotate 'file', ''
.annotate 'line', 294
    .lex "$_", param_1206
.annotate 'line', 295
    find_lex $P111, "self"
    find_lex $P112, "$_"
    find_lex $P113, "%context"
    $P114 = $P111."to_pbc"($P112, $P113)
.annotate 'line', 294
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Label"],_)
    .param pmc param_1211
    .param pmc param_1212
.annotate 'file', ''
.annotate 'line', 299
    .const 'Sub' $P1220 = "31_1312474859.77612" 
    capture_lex $P1220
    new $P1210, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1210, control_1209
    push_eh $P1210
    .lex "self", self
    .lex "$l", param_1211
    .lex "%context", param_1212
.annotate 'line', 300
    new $P107, "Undef"
    set $P1213, $P107
    .lex "$bc", $P1213
.annotate 'line', 303
    new $P108, "Undef"
    set $P1214, $P108
    .lex "$pos", $P1214
.annotate 'line', 300
    find_lex $P1215, "%context"
    unless_null $P1215, vivify_163
    $P1215 = root_new ['parrot';'Hash']
  vivify_163:
    set $P109, $P1215["bytecode"]
    unless_null $P109, vivify_164
    new $P109, "Undef"
  vivify_164:
    store_lex "$bc", $P109
.annotate 'line', 301
    find_lex $P109, "$l"
    $P110 = $P109."declared"()
    if $P110, unless_1216_end
    find_lex $P111, "self"
    $P111."panic"("Trying to emit undelcared label!")
  unless_1216_end:
.annotate 'line', 303
    find_lex $P109, "$bc"
    set $N101, $P109
    new $P110, 'Float'
    set $P110, $N101
    store_lex "$pos", $P110
.annotate 'line', 304
    find_lex $P1218, "%context"
    unless_null $P1218, vivify_165
    $P1218 = root_new ['parrot';'Hash']
  vivify_165:
    set $P109, $P1218["DEBUG"]
    unless_null $P109, vivify_166
    new $P109, "Undef"
  vivify_166:
    unless $P109, if_1217_end
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
  if_1217_end:
.annotate 'line', 306
    find_lex $P109, "$l"
    find_lex $P110, "$pos"
    $P109."position"($P110)
.annotate 'line', 308
    find_lex $P110, "$l"
    $P111 = $P110."list"()
    defined $I101, $P111
    unless $I101, for_undef_167
    iter $P109, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1222_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1222_test:
    unless $P109, loop1222_done
    shift $P112, $P109
  loop1222_redo:
    .const 'Sub' $P1220 = "31_1312474859.77612" 
    capture_lex $P1220
    $P1220($P112)
  loop1222_next:
    goto loop1222_test
  loop1222_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1222_next
    eq $P114, .CONTROL_LOOP_REDO, loop1222_redo
  loop1222_done:
    pop_eh 
  for_undef_167:
.annotate 'line', 299
    .return ($P109)
  control_1209:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1219"  :anon :subid("31_1312474859.77612") :outer("30_1312474859.77612")
    .param pmc param_1221
.annotate 'file', ''
.annotate 'line', 308
    .lex "$_", param_1221
.annotate 'line', 309
    find_lex $P113, "self"
    find_lex $P114, "$_"
    find_lex $P115, "%context"
    $P116 = $P113."to_pbc"($P114, $P115)
.annotate 'line', 308
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("32_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Call"],_)
    .param pmc param_1226
    .param pmc param_1227
.annotate 'file', ''
.annotate 'line', 313
    .const 'Sub' $P1244 = "33_1312474859.77612" 
    capture_lex $P1244
    new $P1225, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1225, control_1224
    push_eh $P1225
    .lex "self", self
    .lex "$call", param_1226
    .lex "%context", param_1227
.annotate 'line', 314
    new $P107, "Undef"
    set $P1228, $P107
    .lex "$bc", $P1228
.annotate 'line', 315
    new $P108, "Undef"
    set $P1229, $P108
    .lex "$calltype", $P1229
.annotate 'line', 316
    new $P109, "Undef"
    set $P1230, $P109
    .lex "$is_tailcall", $P1230
.annotate 'line', 314
    find_lex $P1231, "%context"
    unless_null $P1231, vivify_168
    $P1231 = root_new ['parrot';'Hash']
  vivify_168:
    set $P110, $P1231["bytecode"]
    unless_null $P110, vivify_169
    new $P110, "Undef"
  vivify_169:
    store_lex "$bc", $P110
.annotate 'line', 315
    find_lex $P110, "$call"
    $P111 = $P110."calltype"()
    store_lex "$calltype", $P111
.annotate 'line', 316
    find_lex $P110, "$calltype"
    set $S101, $P110
    iseq $I101, $S101, "tailcall"
    new $P111, 'Integer'
    set $P111, $I101
    store_lex "$is_tailcall", $P111
.annotate 'line', 318
    find_lex $P112, "$calltype"
    set $S101, $P112
    iseq $I101, $S101, "call"
    unless $I101, unless_1233
    new $P111, 'Integer'
    set $P111, $I101
    goto unless_1233_end
  unless_1233:
    find_lex $P113, "$calltype"
    set $S102, $P113
    iseq $I102, $S102, "tailcall"
    new $P111, 'Integer'
    set $P111, $I102
  unless_1233_end:
    if $P111, if_1232
.annotate 'line', 396
    find_lex $P116, "$calltype"
    set $S103, $P116
    iseq $I103, $S103, "return"
    if $I103, if_1283
.annotate 'line', 400
    find_lex $P119, "$calltype"
    set $S104, $P119
    iseq $I104, $S104, "results"
    if $I104, if_1285
.annotate 'line', 405
    find_lex $P120, "self"
    new $P121, 'String'
    set $P121, "NYI "
    find_lex $P122, "$calltype"
    set $S105, $P122
    concat $P124, $P121, $S105
    $P125 = $P120."panic"($P124)
.annotate 'line', 404
    set $P118, $P125
.annotate 'line', 400
    goto if_1285_end
  if_1285:
.annotate 'line', 402
    find_lex $P120, "self"
    find_lex $P1286, "$call"
    unless_null $P1286, vivify_170
    $P1286 = root_new ['parrot';'Hash']
  vivify_170:
    set $P121, $P1286["params"]
    unless_null $P121, vivify_171
    new $P121, "Undef"
  vivify_171:
    find_lex $P122, "%context"
    $P123 = $P120."build_pcc_call"("get_results_pc", $P121, $P122)
.annotate 'line', 400
    set $P118, $P123
  if_1285_end:
    set $P115, $P118
.annotate 'line', 396
    goto if_1283_end
  if_1283:
.annotate 'line', 397
    find_lex $P117, "self"
    find_lex $P1284, "$call"
    unless_null $P1284, vivify_172
    $P1284 = root_new ['parrot';'Hash']
  vivify_172:
    set $P118, $P1284["params"]
    unless_null $P118, vivify_173
    new $P118, "Undef"
  vivify_173:
    find_lex $P119, "%context"
    $P117."build_pcc_call"("set_returns_pc", $P118, $P119)
.annotate 'line', 398
    find_lex $P117, "$bc"
    new $P118, "ResizablePMCArray"
    push $P118, "returncc"
    push $P117, $P118
.annotate 'line', 396
    set $P115, $P117
  if_1283_end:
    set $P110, $P115
.annotate 'line', 318
    goto if_1232_end
  if_1232:
.annotate 'line', 319
    find_lex $P114, "$call"
    $P115 = $P114."invocant"()
    unless $P115, if_1234_end
.annotate 'line', 320
    find_lex $P1236, "$call"
    unless_null $P1236, vivify_174
    $P1236 = root_new ['parrot';'Hash']
  vivify_174:
    set $P116, $P1236["params"]
    unless_null $P116, vivify_175
    new $P116, "Undef"
  vivify_175:
    if $P116, unless_1235_end
    $P117 = "list"()
    find_lex $P1237, "$call"
    unless_null $P1237, vivify_176
    $P1237 = root_new ['parrot';'Hash']
    store_lex "$call", $P1237
  vivify_176:
    set $P1237["params"], $P117
  unless_1235_end:
.annotate 'line', 321
    find_lex $P1238, "$call"
    unless_null $P1238, vivify_177
    $P1238 = root_new ['parrot';'Hash']
  vivify_177:
    set $P116, $P1238["params"]
    unless_null $P116, vivify_178
    new $P116, "Undef"
  vivify_178:
    find_lex $P117, "$call"
    $P118 = $P117."invocant"()
    $P116."unshift"($P118)
  if_1234_end:
.annotate 'line', 324
    find_lex $P114, "self"
    find_lex $P1239, "$call"
    unless_null $P1239, vivify_179
    $P1239 = root_new ['parrot';'Hash']
  vivify_179:
    set $P115, $P1239["params"]
    unless_null $P115, vivify_180
    new $P115, "Undef"
  vivify_180:
    find_lex $P116, "%context"
    $P114."build_pcc_call"("set_args_pc", $P115, $P116)
.annotate 'line', 326
    find_lex $P114, "$call"
    $P115 = $P114."invocant"()
    if $P115, if_1240
.annotate 'line', 340
    .const 'Sub' $P1244 = "33_1312474859.77612" 
    capture_lex $P1244
    $P1244()
    goto if_1240_end
  if_1240:
.annotate 'line', 327
    find_lex $P116, "$call"
    $P117 = $P116."name"()
    get_hll_global $P118, ["POST"], "Constant"
    $P119 = $P117."isa"($P118)
    if $P119, if_1241
.annotate 'line', 337
    find_lex $P120, "self"
    $P120."panic"("NYI $P0.$S0()")
.annotate 'line', 336
    goto if_1241_end
  if_1241:
.annotate 'line', 328
    find_lex $P120, "$bc"
.annotate 'line', 330
    find_lex $P122, "$is_tailcall"
    if $P122, if_1242
    new $P124, "String"
    assign $P124, "callmethodcc_p_sc"
    set $P121, $P124
    goto if_1242_end
  if_1242:
    new $P123, "String"
    assign $P123, "tailcallmethod_p_sc"
    set $P121, $P123
  if_1242_end:
.annotate 'line', 332
    find_lex $P125, "self"
    find_lex $P126, "$call"
    $P127 = $P126."invocant"()
    find_lex $P128, "%context"
    $P129 = $P125."to_op"($P127, $P128)
.annotate 'line', 333
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
  if_1241_end:
  if_1240_end:
.annotate 'line', 392
    find_lex $P115, "$is_tailcall"
    unless $P115, unless_1281
    set $P114, $P115
    goto unless_1281_end
  unless_1281:
.annotate 'line', 393
    find_lex $P116, "self"
    find_lex $P1282, "$call"
    unless_null $P1282, vivify_210
    $P1282 = root_new ['parrot';'Hash']
  vivify_210:
    set $P117, $P1282["results"]
    unless_null $P117, vivify_211
    new $P117, "Undef"
  vivify_211:
    find_lex $P118, "%context"
    $P119 = $P116."build_pcc_call"("get_results_pc", $P117, $P118)
.annotate 'line', 392
    set $P114, $P119
  unless_1281_end:
.annotate 'line', 318
    set $P110, $P114
  if_1232_end:
.annotate 'line', 313
    .return ($P110)
  control_1224:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1243"  :anon :subid("33_1312474859.77612") :outer("32_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 340
    .const 'Sub' $P1250 = "34_1312474859.77612" 
    capture_lex $P1250
.annotate 'line', 341
    new $P116, "Undef"
    set $P1245, $P116
    .lex "$SUB", $P1245
.annotate 'line', 342
    new $P117, "Undef"
    set $P1246, $P117
    .lex "$processed", $P1246
.annotate 'line', 386
    new $P118, "Undef"
    set $P1247, $P118
    .lex "$o", $P1247
.annotate 'line', 340
    find_lex $P119, "$SUB"
.annotate 'line', 342
    new $P119, "Integer"
    assign $P119, 0
    store_lex "$processed", $P119
.annotate 'line', 343
    find_lex $P119, "$call"
    $P120 = $P119."name"()
    get_hll_global $P121, ["POST"], "Constant"
    $P122 = $P120."isa"($P121)
    unless $P122, if_1248_end
    .const 'Sub' $P1250 = "34_1312474859.77612" 
    capture_lex $P1250
    $P1250()
  if_1248_end:
.annotate 'line', 371
    find_lex $P119, "$processed"
    if $P119, unless_1270_end
.annotate 'line', 372
    find_lex $P120, "$call"
    $P121 = $P120."name"()
    get_hll_global $P122, ["POST"], "Constant"
    $P123 = $P121."isa"($P122)
    if $P123, if_1271
.annotate 'line', 381
    find_lex $P1275, "%context"
    unless_null $P1275, vivify_198
    $P1275 = root_new ['parrot';'Hash']
  vivify_198:
    set $P124, $P1275["DEBUG"]
    unless_null $P124, vivify_199
    new $P124, "Undef"
  vivify_199:
    unless $P124, if_1274_end
    find_lex $P125, "self"
    new $P126, "String"
    assign $P126, "Name is "
    find_lex $P1276, "$call"
    unless_null $P1276, vivify_200
    $P1276 = root_new ['parrot';'Hash']
  vivify_200:
    set $P127, $P1276["name"]
    unless_null $P127, vivify_201
    new $P127, "Undef"
  vivify_201:
    $S103 = $P127."WHAT"()
    concat $P128, $P126, $S103
    $P125."debug"($P128)
  if_1274_end:
.annotate 'line', 382
    find_lex $P1277, "$call"
    unless_null $P1277, vivify_202
    $P1277 = root_new ['parrot';'Hash']
  vivify_202:
    set $P124, $P1277["name"]
    unless_null $P124, vivify_203
    new $P124, "Undef"
  vivify_203:
    store_lex "$SUB", $P124
.annotate 'line', 380
    goto if_1271_end
  if_1271:
.annotate 'line', 373
    find_lex $P1272, "%context"
    unless_null $P1272, vivify_204
    $P1272 = root_new ['parrot';'Hash']
  vivify_204:
    set $P124, $P1272["sub"]
    unless_null $P124, vivify_205
    new $P124, "Undef"
  vivify_205:
    $P125 = $P124."symbol"("!SUB")
    store_lex "$SUB", $P125
.annotate 'line', 374
    find_lex $P124, "$bc"
.annotate 'line', 376
    find_lex $P125, "self"
    find_lex $P126, "$SUB"
    find_lex $P127, "%context"
    $P128 = $P125."to_op"($P126, $P127)
.annotate 'line', 377
    find_lex $P129, "self"
    find_lex $P1273, "$call"
    unless_null $P1273, vivify_206
    $P1273 = root_new ['parrot';'Hash']
  vivify_206:
    set $P130, $P1273["name"]
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
  if_1271_end:
  unless_1270_end:
.annotate 'line', 386
    find_lex $P120, "$is_tailcall"
    if $P120, if_1278
    new $P122, "String"
    assign $P122, "invokecc_p"
    set $P119, $P122
    goto if_1278_end
  if_1278:
    new $P121, "String"
    assign $P121, "tailcall_p"
    set $P119, $P121
  if_1278_end:
    store_lex "$o", $P119
.annotate 'line', 388
    find_lex $P1280, "%context"
    unless_null $P1280, vivify_208
    $P1280 = root_new ['parrot';'Hash']
  vivify_208:
    set $P119, $P1280["DEBUG"]
    unless_null $P119, vivify_209
    new $P119, "Undef"
  vivify_209:
    unless $P119, if_1279_end
    find_lex $P120, "self"
    find_lex $P121, "$o"
    $P120."debug"($P121)
  if_1279_end:
.annotate 'line', 389
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
.annotate 'line', 340
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1249"  :anon :subid("34_1312474859.77612") :outer("33_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 343
    .const 'Sub' $P1263 = "35_1312474859.77612" 
    capture_lex $P1263
.annotate 'line', 346
    new $P123, "Undef"
    set $P1251, $P123
    .lex "$full_name", $P1251
.annotate 'line', 349
    new $P124, "Undef"
    set $P1252, $P124
    .lex "$invocable_sub", $P1252
.annotate 'line', 343
    find_lex $P125, "$full_name"
.annotate 'line', 347
    find_lex $P1254, "%context"
    unless_null $P1254, vivify_181
    $P1254 = root_new ['parrot';'Hash']
  vivify_181:
    set $P125, $P1254["sub"]
    unless_null $P125, vivify_182
    new $P125, "Undef"
  vivify_182:
    $P126 = $P125."namespace"()
    unless $P126, if_1253_end
    find_lex $P1255, "%context"
    unless_null $P1255, vivify_183
    $P1255 = root_new ['parrot';'Hash']
  vivify_183:
    set $P127, $P1255["sub"]
    unless_null $P127, vivify_184
    new $P127, "Undef"
  vivify_184:
    $P128 = $P127."namespace"()
    $P129 = $P128."Str"()
    store_lex "$full_name", $P129
  if_1253_end:
.annotate 'line', 348
    find_lex $P125, "$full_name"
    set $S103, $P125
    new $P126, 'String'
    set $P126, $S103
    find_lex $P1256, "$call"
    unless_null $P1256, vivify_185
    $P1256 = root_new ['parrot';'Hash']
  vivify_185:
    set $P1257, $P1256["name"]
    unless_null $P1257, vivify_186
    $P1257 = root_new ['parrot';'Hash']
  vivify_186:
    set $P127, $P1257["value"]
    unless_null $P127, vivify_187
    new $P127, "Undef"
  vivify_187:
    set $S104, $P127
    concat $P128, $P126, $S104
    store_lex "$full_name", $P128
.annotate 'line', 349
    find_lex $P1258, "%context"
    unless_null $P1258, vivify_188
    $P1258 = root_new ['parrot';'Hash']
  vivify_188:
    set $P125, $P1258["pir_file"]
    unless_null $P125, vivify_189
    new $P125, "Undef"
  vivify_189:
    find_lex $P126, "$full_name"
    $P127 = $P125."sub"($P126)
    store_lex "$invocable_sub", $P127
.annotate 'line', 350
    find_lex $P1260, "%context"
    unless_null $P1260, vivify_190
    $P1260 = root_new ['parrot';'Hash']
  vivify_190:
    set $P125, $P1260["DEBUG"]
    unless_null $P125, vivify_191
    new $P125, "Undef"
  vivify_191:
    unless $P125, if_1259_end
    find_lex $P126, "self"
    new $P127, 'String'
    set $P127, "invocable_sub '"
    find_lex $P128, "$full_name"
    concat $P129, $P127, $P128
    concat $P130, $P129, "'"
    $P126."debug"($P130)
  if_1259_end:
.annotate 'line', 351
    find_lex $P126, "$invocable_sub"
    if $P126, if_1261
    set $P125, $P126
    goto if_1261_end
  if_1261:
    .const 'Sub' $P1263 = "35_1312474859.77612" 
    capture_lex $P1263
    $P129 = $P1263()
    set $P125, $P129
  if_1261_end:
.annotate 'line', 343
    .return ($P125)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1262"  :anon :subid("35_1312474859.77612") :outer("34_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 352
    new $P127, "Undef"
    set $P1264, $P127
    .lex "$idx", $P1264
    find_lex $P128, "$invocable_sub"
    $P129 = $P128."constant_index"()
    store_lex "$idx", $P129
.annotate 'line', 353
    find_lex $P128, "$idx"
    defined $I103, $P128
    if $I103, unless_1265_end
.annotate 'line', 355
    find_lex $P1266, "%context"
    unless_null $P1266, vivify_192
    $P1266 = root_new ['parrot';'Hash']
  vivify_192:
    set $P129, $P1266["constants"]
    unless_null $P129, vivify_193
    new $P129, "Undef"
  vivify_193:
    new $P130, "Integer"
    push $P129, $P130
    store_lex "$idx", $P129
.annotate 'line', 356
    find_lex $P129, "$invocable_sub"
    find_lex $P130, "$idx"
    $P129."constant_index"($P130)
.annotate 'line', 357
    find_lex $P1268, "%context"
    unless_null $P1268, vivify_194
    $P1268 = root_new ['parrot';'Hash']
  vivify_194:
    set $P129, $P1268["DEBUG"]
    unless_null $P129, vivify_195
    new $P129, "Undef"
  vivify_195:
    unless $P129, if_1267_end
    find_lex $P130, "self"
    new $P131, 'String'
    set $P131, "Allocate constant for it "
    find_lex $P132, "$idx"
    concat $P133, $P131, $P132
    $P130."debug"($P133)
  if_1267_end:
  unless_1265_end:
.annotate 'line', 360
    find_lex $P1269, "%context"
    unless_null $P1269, vivify_196
    $P1269 = root_new ['parrot';'Hash']
  vivify_196:
    set $P128, $P1269["sub"]
    unless_null $P128, vivify_197
    new $P128, "Undef"
  vivify_197:
    $P129 = $P128."symbol"("!SUB")
    store_lex "$SUB", $P129
.annotate 'line', 361
    find_lex $P128, "$bc"
.annotate 'line', 363
    find_lex $P129, "self"
    find_lex $P130, "$SUB"
    find_lex $P131, "%context"
    $P132 = $P129."to_op"($P130, $P131)
    find_lex $P133, "$idx"
    new $P134, "ResizablePMCArray"
    push $P134, "set_p_pc"
    push $P134, $P132
    push $P134, $P133
.annotate 'line', 364
    push $P128, $P134
.annotate 'line', 367
    new $P128, "Integer"
    assign $P128, 1
    store_lex "$processed", $P128
.annotate 'line', 351
    .return ($P128)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("36_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Key"],_)
    .param pmc param_1290
    .param pmc param_1291
.annotate 'file', ''
.annotate 'line', 412
    new $P1289, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1289, control_1288
    push_eh $P1289
    .lex "self", self
    .lex "$key", param_1290
    .lex "%context", param_1291
.annotate 'line', 415
    new $P107, "Undef"
    set $P1292, $P107
    .lex "$key_pmc", $P1292
.annotate 'line', 421
    new $P108, "Undef"
    set $P1293, $P108
    .lex "$constants", $P1293
.annotate 'line', 422
    new $P109, "Undef"
    set $P1294, $P109
    .lex "$idx", $P1294
.annotate 'line', 414
    find_lex $P1296, "%context"
    unless_null $P1296, vivify_212
    $P1296 = root_new ['parrot';'Hash']
  vivify_212:
    set $P110, $P1296["DEBUG"]
    unless_null $P110, vivify_213
    new $P110, "Undef"
  vivify_213:
    unless $P110, if_1295_end
    find_lex $P111, "self"
    $P111."debug"("Want key")
  if_1295_end:
.annotate 'line', 415
    find_lex $P110, "$key"
    find_lex $P111, "%context"
    $P112 = $P110."to_pmc"($P111)
    set $P113, $P112[0]
    unless_null $P113, vivify_214
    new $P113, "Undef"
  vivify_214:
    store_lex "$key_pmc", $P113
.annotate 'line', 416
    find_lex $P1298, "%context"
    unless_null $P1298, vivify_215
    $P1298 = root_new ['parrot';'Hash']
  vivify_215:
    set $P110, $P1298["DEBUG"]
    unless_null $P110, vivify_216
    new $P110, "Undef"
  vivify_216:
    unless $P110, if_1297_end
    find_lex $P111, "self"
    $P111."debug"("Got key")
  if_1297_end:
.annotate 'line', 421
    find_lex $P1299, "%context"
    unless_null $P1299, vivify_217
    $P1299 = root_new ['parrot';'Hash']
  vivify_217:
    set $P110, $P1299["constants"]
    unless_null $P110, vivify_218
    new $P110, "Undef"
  vivify_218:
    store_lex "$constants", $P110
.annotate 'line', 412
    find_lex $P110, "$idx"
.annotate 'line', 423

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
.annotate 'line', 412
    find_lex $P110, "$idx"
    .return ($P110)
  control_1288:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("37_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Constant"],_)
    .param pmc param_1303
    .param pmc param_1304
.annotate 'file', ''
.annotate 'line', 439
    new $P1302, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1302, control_1301
    push_eh $P1302
    .lex "self", self
    .lex "$op", param_1303
    .lex "%context", param_1304
.annotate 'line', 440
    new $P107, "Undef"
    set $P1305, $P107
    .lex "$idx", $P1305
.annotate 'line', 441
    new $P108, "Undef"
    set $P1306, $P108
    .lex "$type", $P1306
.annotate 'line', 439
    find_lex $P109, "$idx"
.annotate 'line', 441
    find_lex $P109, "$op"
    $P110 = $P109."type"()
    store_lex "$type", $P110
.annotate 'line', 442
    find_lex $P110, "$type"
    set $S101, $P110
    iseq $I101, $S101, "ic"
    unless $I101, unless_1308
    new $P109, 'Integer'
    set $P109, $I101
    goto unless_1308_end
  unless_1308:
    find_lex $P111, "$type"
    set $S102, $P111
    iseq $I102, $S102, "kic"
    new $P109, 'Integer'
    set $P109, $I102
  unless_1308_end:
    if $P109, if_1307
.annotate 'line', 445
    find_lex $P112, "$type"
    set $S103, $P112
    iseq $I103, $S103, "nc"
    if $I103, if_1309
.annotate 'line', 449
    find_lex $P113, "self"
    $P113."panic"("NYI")
.annotate 'line', 448
    goto if_1309_end
  if_1309:
.annotate 'line', 446
    find_lex $P113, "$op"
    $P114 = $P113."value"()
    $P115 = "get_or_create_number"($P114)
    store_lex "$idx", $P115
  if_1309_end:
.annotate 'line', 445
    goto if_1307_end
  if_1307:
.annotate 'line', 443
    find_lex $P112, "$op"
    $P113 = $P112."value"()
    store_lex "$idx", $P113
  if_1307_end:
.annotate 'line', 452
    find_lex $P1311, "%context"
    unless_null $P1311, vivify_219
    $P1311 = root_new ['parrot';'Hash']
  vivify_219:
    set $P109, $P1311["DEBUG"]
    unless_null $P109, vivify_220
    new $P109, "Undef"
  vivify_220:
    unless $P109, if_1310_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Index "
    find_lex $P112, "$idx"
    concat $P113, $P111, $P112
    $P110."debug"($P113)
  if_1310_end:
.annotate 'line', 439
    find_lex $P109, "$idx"
    .return ($P109)
  control_1301:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"String"],_)
    .param pmc param_1315
    .param pmc param_1316
.annotate 'file', ''
.annotate 'line', 456
    .const 'Sub' $P1323 = "39_1312474859.77612" 
    capture_lex $P1323
    new $P1314, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1314, control_1313
    push_eh $P1314
    .lex "self", self
    .lex "$str", param_1315
    .lex "%context", param_1316
.annotate 'line', 457
    new $P107, "Undef"
    set $P1317, $P107
    .lex "$idx", $P1317
.annotate 'line', 458
    new $P108, "Undef"
    set $P1318, $P108
    .lex "$type", $P1318
.annotate 'line', 456
    find_lex $P109, "$idx"
.annotate 'line', 458
    find_lex $P109, "$str"
    $P110 = $P109."type"()
    store_lex "$type", $P110
.annotate 'line', 459
    find_lex $P109, "$type"
    set $S101, $P109
    isne $I101, $S101, "sc"
    unless $I101, if_1319_end
.annotate 'line', 460
    find_lex $P110, "self"
    $P110."panic"("attempt to pass a non-sc value off as a string")
  if_1319_end:
.annotate 'line', 462
    find_lex $P110, "$str"
    $S101 = $P110."encoding"()
    iseq $I101, $S101, "fixed_8"
    if $I101, if_1321
    new $P109, 'Integer'
    set $P109, $I101
    goto if_1321_end
  if_1321:
    find_lex $P111, "$str"
    $S102 = $P111."charset"()
    iseq $I102, $S102, "ascii"
    new $P109, 'Integer'
    set $P109, $I102
  if_1321_end:
    if $P109, if_1320
.annotate 'line', 465
    .const 'Sub' $P1323 = "39_1312474859.77612" 
    capture_lex $P1323
    $P1323()
    goto if_1320_end
  if_1320:
.annotate 'line', 463
    find_lex $P112, "$str"
    $P113 = $P112."value"()
    $P114 = "get_or_create_string"($P113)
    store_lex "$idx", $P114
  if_1320_end:
.annotate 'line', 456
    find_lex $P109, "$idx"
    .return ($P109)
  control_1313:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1322"  :anon :subid("39_1312474859.77612") :outer("38_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 467
    new $P112, "Undef"
    set $P1324, $P112
    .lex "$bb", $P1324
.annotate 'line', 468
    new $P113, "Undef"
    set $P1325, $P113
    .lex "$str_val", $P1325
.annotate 'line', 467
    new $P114, "ByteBuffer"
    store_lex "$bb", $P114
.annotate 'line', 468
    find_lex $P114, "$str"
    $P115 = $P114."value"()
    store_lex "$str_val", $P115
.annotate 'line', 469

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 477
    find_lex $P114, "$bb"
.annotate 'line', 478
    find_lex $P115, "$str"
    $P116 = $P115."encoding"()
    $P117 = $P114."get_string"($P116)
.annotate 'line', 477
    $P118 = "get_or_create_string"($P117)
    store_lex "$idx", $P118
.annotate 'line', 465
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Value"],_)
    .param pmc param_1329
    .param pmc param_1330
.annotate 'file', ''
.annotate 'line', 485
    new $P1328, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1328, control_1327
    push_eh $P1328
    .lex "self", self
    .lex "$val", param_1329
    .lex "%context", param_1330
.annotate 'line', 487
    new $P107, "Undef"
    set $P1331, $P107
    .lex "$orig", $P1331
    find_lex $P108, "self"
    find_lex $P109, "$val"
    $P110 = $P109."name"()
    find_lex $P111, "%context"
    $P112 = $P108."get_register"($P110, $P111)
    store_lex "$orig", $P112
.annotate 'line', 488
    find_lex $P108, "self"
    find_lex $P109, "$orig"
    find_lex $P110, "%context"
    $P111 = $P108."to_op"($P109, $P110)
.annotate 'line', 485
    .return ($P111)
  control_1327:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("41_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Register"],_)
    .param pmc param_1335
    .param pmc param_1336
.annotate 'file', ''
.annotate 'line', 491
    new $P1334, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1334, control_1333
    push_eh $P1334
    .lex "self", self
    .lex "$reg", param_1335
    .lex "%context", param_1336
.annotate 'line', 492
    find_lex $P107, "$reg"
    $P108 = $P107."regno"()
.annotate 'line', 491
    .return ($P108)
  control_1333:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("42_1312474859.77612") :method :outer("11_1312474859.77612") :multi(_,["POST";"Label"],_)
    .param pmc param_1340
    .param pmc param_1341
.annotate 'file', ''
.annotate 'line', 495
    new $P1339, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1339, control_1338
    push_eh $P1339
    .lex "self", self
    .lex "$l", param_1340
    .lex "%context", param_1341
.annotate 'line', 497
    new $P107, "Undef"
    set $P1342, $P107
    .lex "$bc", $P1342
.annotate 'line', 498
    new $P108, "Undef"
    set $P1343, $P108
    .lex "$pos", $P1343
.annotate 'line', 497
    find_lex $P1344, "%context"
    unless_null $P1344, vivify_221
    $P1344 = root_new ['parrot';'Hash']
  vivify_221:
    set $P109, $P1344["bytecode"]
    unless_null $P109, vivify_222
    new $P109, "Undef"
  vivify_222:
    store_lex "$bc", $P109
.annotate 'line', 498
    find_lex $P109, "$bc"
    set $N101, $P109
    new $P110, 'Float'
    set $P110, $N101
    store_lex "$pos", $P110
.annotate 'line', 502
    find_lex $P109, "$l"
    $P110 = $P109."name"()
.annotate 'line', 501
    find_lex $P1345, "%context"
    unless_null $P1345, vivify_223
    $P1345 = root_new ['parrot';'Hash']
  vivify_223:
    set $P111, $P1345["opcode_offset"]
    unless_null $P111, vivify_224
    new $P111, "Undef"
  vivify_224:
    find_lex $P1346, "%context"
    unless_null $P1346, vivify_225
    $P1346 = root_new ['parrot';'Hash']
  vivify_225:
    set $P112, $P1346["opcode_fullname"]
    unless_null $P112, vivify_226
    new $P112, "Undef"
  vivify_226:
    $P113 = "hash"($P110 :named("name"), $P111 :named("offset"), $P112 :named("opname"))
    find_lex $P114, "$pos"
    find_lex $P1347, "%context"
    unless_null $P1347, vivify_227
    $P1347 = root_new ['parrot';'Hash']
    store_lex "%context", $P1347
  vivify_227:
    set $P1348, $P1347["labels_todo"]
    unless_null $P1348, vivify_228
    $P1348 = root_new ['parrot';'Hash']
    set $P1347["labels_todo"], $P1348
  vivify_228:
    set $P1348[$P114], $P113
.annotate 'line', 507
    find_lex $P1350, "%context"
    unless_null $P1350, vivify_229
    $P1350 = root_new ['parrot';'Hash']
  vivify_229:
    set $P109, $P1350["DEBUG"]
    unless_null $P109, vivify_230
    new $P109, "Undef"
  vivify_230:
    unless $P109, if_1349_end
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
    find_lex $P1351, "%context"
    unless_null $P1351, vivify_231
    $P1351 = root_new ['parrot';'Hash']
  vivify_231:
    set $P118, $P1351["opcode_offset"]
    unless_null $P118, vivify_232
    new $P118, "Undef"
  vivify_232:
    set $S102, $P118
    concat $P119, $P117, $S102
    $P110."debug"($P119)
  if_1349_end:
.annotate 'line', 495
    .return (0)
  control_1338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("43_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1355
    .param pmc param_1356
    .param pmc param_1357
.annotate 'file', ''
.annotate 'line', 519
    .const 'Sub' $P1369 = "44_1312474859.77612" 
    capture_lex $P1369
    new $P1354, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1354, control_1353
    push_eh $P1354
    .lex "self", self
    .lex "$opname", param_1355
    .lex "@args", param_1356
    .lex "%context", param_1357
.annotate 'line', 520
    new $P107, "Undef"
    set $P1358, $P107
    .lex "$bc", $P1358
.annotate 'line', 521
    new $P108, "Undef"
    set $P1359, $P108
    .lex "$signature", $P1359
.annotate 'line', 522
    new $P109, "Undef"
    set $P1360, $P109
    .lex "$sig_idx", $P1360
.annotate 'line', 529
    $P1362 = root_new ['parrot';'ResizablePMCArray']
    set $P1361, $P1362
    .lex "@op", $P1361
.annotate 'line', 520
    find_lex $P1363, "%context"
    unless_null $P1363, vivify_233
    $P1363 = root_new ['parrot';'Hash']
  vivify_233:
    set $P110, $P1363["bytecode"]
    unless_null $P110, vivify_234
    new $P110, "Undef"
  vivify_234:
    store_lex "$bc", $P110
.annotate 'line', 521
    find_lex $P110, "self"
    find_lex $P111, "@args"
    find_lex $P112, "%context"
    $P113 = $P110."build_args_signature"($P111, $P112)
    store_lex "$signature", $P113
.annotate 'line', 522
    find_lex $P110, "$signature"
    $P111 = "get_or_create_pmc"($P110)
    store_lex "$sig_idx", $P111
.annotate 'line', 524
    find_lex $P1365, "%context"
    unless_null $P1365, vivify_235
    $P1365 = root_new ['parrot';'Hash']
  vivify_235:
    set $P110, $P1365["DEBUG"]
    unless_null $P110, vivify_236
    new $P110, "Undef"
  vivify_236:
    unless $P110, if_1364_end
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "Sig: "
    find_lex $P113, "$sig_idx"
    concat $P114, $P112, $P113
    $P111."debug"($P114)
  if_1364_end:
.annotate 'line', 526
    find_lex $P1367, "%context"
    unless_null $P1367, vivify_237
    $P1367 = root_new ['parrot';'Hash']
  vivify_237:
    set $P110, $P1367["DEBUG"]
    unless_null $P110, vivify_238
    new $P110, "Undef"
  vivify_238:
    unless $P110, if_1366_end
    find_lex $P111, "self"
    find_lex $P112, "$opname"
    $P111."debug"($P112)
  if_1366_end:
.annotate 'line', 529
    find_lex $P110, "$opname"
    find_lex $P111, "$sig_idx"
    $P112 = "list"($P110, $P111)
    store_lex "@op", $P112
.annotate 'line', 531
    find_lex $P111, "@args"
    defined $I101, $P111
    unless $I101, for_undef_239
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1378_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1378_test:
    unless $P110, loop1378_done
    shift $P112, $P110
  loop1378_redo:
    .const 'Sub' $P1369 = "44_1312474859.77612" 
    capture_lex $P1369
    $P1369($P112)
  loop1378_next:
    goto loop1378_test
  loop1378_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1378_next
    eq $P114, .CONTROL_LOOP_REDO, loop1378_redo
  loop1378_done:
    pop_eh 
  for_undef_239:
.annotate 'line', 542
    find_lex $P110, "$bc"
    find_lex $P111, "@op"
    push $P110, $P111
.annotate 'line', 519
    .return ($P110)
  control_1353:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1368"  :anon :subid("44_1312474859.77612") :outer("43_1312474859.77612")
    .param pmc param_1370
.annotate 'file', ''
.annotate 'line', 531
    .const 'Sub' $P1373 = "45_1312474859.77612" 
    capture_lex $P1373
    .lex "$arg", param_1370
.annotate 'line', 533
    find_lex $P113, "$arg"
    $P114 = $P113."modifier"()
    isa $I102, $P114, "Hash"
    unless $I102, if_1371_end
    .const 'Sub' $P1373 = "45_1312474859.77612" 
    capture_lex $P1373
    $P1373()
  if_1371_end:
.annotate 'line', 539
    find_lex $P113, "@op"
    find_lex $P114, "self"
    find_lex $P115, "$arg"
    find_lex $P116, "%context"
    $P117 = $P114."to_op"($P115, $P116)
    $P118 = $P113."push"($P117)
.annotate 'line', 531
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1372"  :anon :subid("45_1312474859.77612") :outer("44_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 534
    new $P115, "Undef"
    set $P1374, $P115
    .lex "$name", $P1374
    find_lex $P116, "$arg"
    $P117 = $P116."modifier"()
    set $P118, $P117["named"]
    unless_null $P118, vivify_240
    new $P118, "Undef"
  vivify_240:
    set $P1375, $P118
    defined $I1377, $P1375
    if $I1377, default_1376
    find_lex $P119, "$arg"
    $P120 = $P119."name"()
    set $P1375, $P120
  default_1376:
    store_lex "$name", $P1375
.annotate 'line', 535
    find_lex $P116, "@op"
.annotate 'line', 536
    find_lex $P117, "$name"
    $P118 = "get_or_create_string"($P117)
    $P119 = $P116."push"($P118)
.annotate 'line', 533
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("46_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1382
    .param pmc param_1383
.annotate 'file', ''
.annotate 'line', 545
    .const 'Sub' $P1401 = "49_1312474859.77612" 
    capture_lex $P1401
    .const 'Sub' $P1390 = "47_1312474859.77612" 
    capture_lex $P1390
    new $P1381, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1381, control_1380
    push_eh $P1381
    .lex "self", self
    .lex "@args", param_1382
    .lex "%context", param_1383
.annotate 'line', 546
    $P1385 = root_new ['parrot';'ResizablePMCArray']
    set $P1384, $P1385
    .lex "@sig", $P1384
.annotate 'line', 559
    new $P107, "Undef"
    set $P1386, $P107
    .lex "$elements", $P1386
.annotate 'line', 560
    new $P108, "Undef"
    set $P1387, $P108
    .lex "$signature", $P1387
.annotate 'line', 568
    new $P109, "Undef"
    set $P1388, $P109
    .lex "$idx", $P1388
.annotate 'line', 545
    find_lex $P110, "@sig"
.annotate 'line', 547
    find_lex $P111, "@args"
    defined $I101, $P111
    unless $I101, for_undef_241
    iter $P110, $P111
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1398_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1398_test:
    unless $P110, loop1398_done
    shift $P112, $P110
  loop1398_redo:
    .const 'Sub' $P1390 = "47_1312474859.77612" 
    capture_lex $P1390
    $P1390($P112)
  loop1398_next:
    goto loop1398_test
  loop1398_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1398_next
    eq $P116, .CONTROL_LOOP_REDO, loop1398_redo
  loop1398_done:
    pop_eh 
  for_undef_241:
.annotate 'line', 559
    find_lex $P110, "@sig"
    set $N101, $P110
    new $P111, 'Float'
    set $P111, $N101
    store_lex "$elements", $P111
.annotate 'line', 560

        $P1399 = find_lex '$elements'
        $I99 = $P1399
        $P1399 = find_lex '$signature'
        $P1399 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1399
.annotate 'line', 568
    new $P110, "Integer"
    assign $P110, 0
    store_lex "$idx", $P110
.annotate 'line', 569
    find_lex $P111, "@sig"
    defined $I101, $P111
    unless $I101, for_undef_243
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1405_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1405_test:
    unless $P110, loop1405_done
    shift $P112, $P110
  loop1405_redo:
    .const 'Sub' $P1401 = "49_1312474859.77612" 
    capture_lex $P1401
    $P1401($P112)
  loop1405_next:
    goto loop1405_test
  loop1405_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1405_next
    eq $P114, .CONTROL_LOOP_REDO, loop1405_redo
  loop1405_done:
    pop_eh 
  for_undef_243:
.annotate 'line', 545
    find_lex $P110, "$signature"
    .return ($P110)
  control_1380:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "_block1389"  :anon :subid("47_1312474859.77612") :outer("46_1312474859.77612")
    .param pmc param_1391
.annotate 'file', ''
.annotate 'line', 547
    .const 'Sub' $P1395 = "48_1312474859.77612" 
    capture_lex $P1395
    .lex "$arg", param_1391
.annotate 'line', 549
    new $P113, "Undef"
    set $P1392, $P113
    .lex "$s", $P1392
    find_lex $P114, "self"
    find_lex $P115, "$arg"
    find_lex $P116, "%context"
    $P117 = $P114."build_single_arg"($P115, $P116)
    store_lex "$s", $P117
.annotate 'line', 550
    find_lex $P115, "$s"
    isa $I102, $P115, "Integer"
    if $I102, if_1393
.annotate 'line', 554
    find_lex $P117, "$s"
    defined $I103, $P117
    unless $I103, for_undef_242
    iter $P116, $P117
    new $P120, 'ExceptionHandler'
    set_label $P120, loop1397_handler
    $P120."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P120
  loop1397_test:
    unless $P116, loop1397_done
    shift $P119, $P116
  loop1397_redo:
    .const 'Sub' $P1395 = "48_1312474859.77612" 
    capture_lex $P1395
    $P1395($P119)
  loop1397_next:
    goto loop1397_test
  loop1397_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, 'type'
    eq $P121, .CONTROL_LOOP_NEXT, loop1397_next
    eq $P121, .CONTROL_LOOP_REDO, loop1397_redo
  loop1397_done:
    pop_eh 
  for_undef_242:
.annotate 'line', 553
    set $P114, $P116
.annotate 'line', 550
    goto if_1393_end
  if_1393:
.annotate 'line', 551
    find_lex $P116, "@sig"
    find_lex $P117, "$s"
    $P118 = $P116."push"($P117)
.annotate 'line', 550
    set $P114, $P118
  if_1393_end:
.annotate 'line', 547
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1394"  :anon :subid("48_1312474859.77612") :outer("47_1312474859.77612")
    .param pmc param_1396
.annotate 'file', ''
.annotate 'line', 554
    .lex "$_", param_1396
    find_lex $P120, "@sig"
    find_lex $P121, "$_"
    $P122 = $P120."push"($P121)
    .return ($P122)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1400"  :anon :subid("49_1312474859.77612") :outer("46_1312474859.77612")
    .param pmc param_1402
.annotate 'file', ''
.annotate 'line', 569
    .lex "$val", param_1402
.annotate 'line', 570
    find_lex $P113, "$val"
    find_lex $P114, "$idx"
    set $I102, $P114
    find_lex $P1403, "$signature"
    unless_null $P1403, vivify_244
    $P1403 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1403
  vivify_244:
    set $P1403[$I102], $P113
.annotate 'line', 569
    find_lex $P113, "$idx"
    clone $P1404, $P113
    inc $P113
    .return ($P1404)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("50_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1409
    .param pmc param_1410
.annotate 'file', ''
.annotate 'line', 577
    new $P1408, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1408, control_1407
    push_eh $P1408
    .lex "self", self
    .lex "$arg", param_1409
    .lex "%context", param_1410
.annotate 'line', 580
    new $P107, "Undef"
    set $P1411, $P107
    .lex "$type", $P1411
.annotate 'line', 582
    new $P108, "Undef"
    set $P1412, $P108
    .lex "$res", $P1412
.annotate 'line', 596
    new $P109, "Undef"
    set $P1413, $P109
    .lex "$mod", $P1413
.annotate 'line', 580
    find_lex $P110, "$arg"
    $P111 = $P110."type"()
    set $P1414, $P111
    defined $I1416, $P1414
    if $I1416, default_1415
    find_lex $P112, "self"
    find_lex $P113, "$arg"
    $P114 = $P113."name"()
    find_lex $P115, "%context"
    $P116 = $P112."get_register"($P114, $P115)
    $P117 = $P116."type"()
    set $P1414, $P117
  default_1415:
    store_lex "$type", $P1414
.annotate 'line', 577
    find_lex $P110, "$res"
.annotate 'line', 585
    find_lex $P110, "$type"
    set $S101, $P110
    iseq $I101, $S101, "i"
    if $I101, if_1417
.annotate 'line', 586
    find_lex $P111, "$type"
    set $S102, $P111
    iseq $I102, $S102, "s"
    if $I102, if_1418
.annotate 'line', 587
    find_lex $P112, "$type"
    set $S103, $P112
    iseq $I103, $S103, "p"
    if $I103, if_1419
.annotate 'line', 588
    find_lex $P113, "$type"
    set $S104, $P113
    iseq $I104, $S104, "n"
    if $I104, if_1420
.annotate 'line', 590
    find_lex $P114, "$type"
    set $S105, $P114
    iseq $I105, $S105, "ic"
    if $I105, if_1421
.annotate 'line', 591
    find_lex $P115, "$type"
    set $S106, $P115
    iseq $I106, $S106, "sc"
    if $I106, if_1422
.annotate 'line', 592
    find_lex $P116, "$type"
    set $S107, $P116
    iseq $I107, $S107, "pc"
    if $I107, if_1423
.annotate 'line', 593
    find_lex $P117, "$type"
    set $S108, $P117
    iseq $I108, $S108, "nc"
    if $I108, if_1424
.annotate 'line', 594
    find_lex $P118, "self"
    new $P119, 'String'
    set $P119, "Unknown arg type '"
    find_lex $P120, "$type"
    concat $P121, $P119, $P120
    concat $P122, $P121, "'"
    $P118."panic"($P122)
    goto if_1424_end
  if_1424:
.annotate 'line', 593
    new $P118, "Integer"
    assign $P118, 3
    add $P119, $P118, 16
    store_lex "$res", $P119
  if_1424_end:
    goto if_1423_end
  if_1423:
.annotate 'line', 592
    new $P117, "Integer"
    assign $P117, 2
    add $P118, $P117, 16
    store_lex "$res", $P118
  if_1423_end:
    goto if_1422_end
  if_1422:
.annotate 'line', 591
    new $P116, "Integer"
    assign $P116, 1
    add $P117, $P116, 16
    store_lex "$res", $P117
  if_1422_end:
    goto if_1421_end
  if_1421:
.annotate 'line', 590
    new $P115, "Integer"
    assign $P115, 0
    add $P116, $P115, 16
    store_lex "$res", $P116
  if_1421_end:
    goto if_1420_end
  if_1420:
.annotate 'line', 588
    new $P114, "Integer"
    assign $P114, 3
    store_lex "$res", $P114
  if_1420_end:
    goto if_1419_end
  if_1419:
.annotate 'line', 587
    new $P113, "Integer"
    assign $P113, 2
    store_lex "$res", $P113
  if_1419_end:
    goto if_1418_end
  if_1418:
.annotate 'line', 586
    new $P112, "Integer"
    assign $P112, 1
    store_lex "$res", $P112
  if_1418_end:
    goto if_1417_end
  if_1417:
.annotate 'line', 585
    new $P111, "Integer"
    assign $P111, 0
    store_lex "$res", $P111
  if_1417_end:
.annotate 'line', 596
    find_lex $P110, "$arg"
    $P111 = $P110."modifier"()
    store_lex "$mod", $P111
.annotate 'line', 597
    find_lex $P110, "$mod"
    unless $P110, if_1425_end
.annotate 'line', 598
    find_lex $P111, "$mod"
    isa $I101, $P111, "Hash"
    if $I101, if_1426
.annotate 'line', 603
    find_lex $P112, "$mod"
    set $S101, $P112
    iseq $I102, $S101, "slurpy"
    if $I102, if_1427
.annotate 'line', 604
    find_lex $P113, "$mod"
    set $S102, $P113
    iseq $I103, $S102, "flat"
    if $I103, if_1428
.annotate 'line', 605
    find_lex $P114, "$mod"
    set $S103, $P114
    iseq $I104, $S103, "optional"
    if $I104, if_1429
.annotate 'line', 606
    find_lex $P115, "$mod"
    set $S104, $P115
    iseq $I105, $S104, "opt_flag"
    if $I105, if_1430
.annotate 'line', 607
    find_lex $P116, "$mod"
    set $S105, $P116
    iseq $I106, $S105, "slurpy named"
    if $I106, if_1431
.annotate 'line', 608
    find_lex $P117, "self"
    new $P118, 'String'
    set $P118, "Unsupported modifier "
    find_lex $P119, "$mod"
    concat $P120, $P118, $P119
    $P117."panic"($P120)
    goto if_1431_end
  if_1431:
.annotate 'line', 607
    find_lex $P117, "$res"
    add $P118, $P117, 32
    add $P119, $P118, 512
    store_lex "$res", $P119
  if_1431_end:
    goto if_1430_end
  if_1430:
.annotate 'line', 606
    find_lex $P116, "$res"
    add $P117, $P116, 256
    store_lex "$res", $P117
  if_1430_end:
    goto if_1429_end
  if_1429:
.annotate 'line', 605
    find_lex $P115, "$res"
    add $P116, $P115, 128
    store_lex "$res", $P116
  if_1429_end:
    goto if_1428_end
  if_1428:
.annotate 'line', 604
    find_lex $P114, "$res"
    add $P115, $P114, 32
    store_lex "$res", $P115
  if_1428_end:
    goto if_1427_end
  if_1427:
.annotate 'line', 603
    find_lex $P113, "$res"
    add $P114, $P113, 32
    store_lex "$res", $P114
  if_1427_end:
    goto if_1426_end
  if_1426:
.annotate 'line', 601
    new $P112, "Integer"
    assign $P112, 1
    add $P113, $P112, 16
    add $P114, $P113, 512
    find_lex $P115, "$res"
    add $P116, $P115, 512
    $P117 = "list"($P114, $P116)
    store_lex "$res", $P117
  if_1426_end:
  if_1425_end:
.annotate 'line', 577
    find_lex $P110, "$res"
    .return ($P110)
  control_1407:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("51_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1435
.annotate 'file', ''
.annotate 'line', 619
    .const 'Sub' $P1437 = "52_1312474859.77612" 
    capture_lex $P1437
    new $P1434, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1434, control_1433
    push_eh $P1434
    .lex "self", self
    .lex "$post", param_1435
.annotate 'line', 620
    find_lex $P108, "$post"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_245
    iter $P107, $P109
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1440_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1440_test:
    unless $P107, loop1440_done
    shift $P110, $P107
  loop1440_redo:
    .const 'Sub' $P1437 = "52_1312474859.77612" 
    capture_lex $P1437
    $P1437($P110)
  loop1440_next:
    goto loop1440_test
  loop1440_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1440_next
    eq $P113, .CONTROL_LOOP_REDO, loop1440_redo
  loop1440_done:
    pop_eh 
  for_undef_245:
.annotate 'line', 619
    .return ($P107)
  control_1433:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1436"  :anon :subid("52_1312474859.77612") :outer("51_1312474859.77612")
    .param pmc param_1438
.annotate 'file', ''
.annotate 'line', 620
    .lex "$sub", param_1438
.annotate 'line', 622
    find_lex $P112, "$sub"
    get_hll_global $P113, ["POST"], "Sub"
    $P114 = $P112."isa"($P113)
    if $P114, if_1439
    set $P111, $P114
    goto if_1439_end
  if_1439:
    find_lex $P115, "$post"
    find_lex $P116, "$sub"
    $P117 = $P116."full_name"()
    find_lex $P118, "$sub"
    $P119 = $P115."sub"($P117, $P118)
    set $P111, $P119
  if_1439_end:
.annotate 'line', 620
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("53_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1444
    .param pmc param_1445
.annotate 'file', ''
.annotate 'line', 627
    new $P1443, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1443, control_1442
    push_eh $P1443
    .lex "self", self
    .lex "$sub", param_1444
    .lex "%context", param_1445
.annotate 'line', 635
    new $P107, "Undef"
    set $P1446, $P107
    .lex "$res", $P1446
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$res", $P108
.annotate 'line', 636
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 1
    find_lex $P110, "$sub"
    $N101 = $P110."outer"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 637
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 8
    find_lex $P110, "$sub"
    $N101 = $P110."anon"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 638
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 16
    find_lex $P110, "$sub"
    $N101 = $P110."main"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 639
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 32
    find_lex $P110, "$sub"
    $N101 = $P110."load"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 640
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 64
    find_lex $P110, "$sub"
    $N101 = $P110."immediate"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 641
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 128
    find_lex $P110, "$sub"
    $N101 = $P110."postcomp"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 643
    find_lex $P1448, "%context"
    unless_null $P1448, vivify_246
    $P1448 = root_new ['parrot';'Hash']
  vivify_246:
    set $P108, $P1448["DEBUG"]
    unless_null $P108, vivify_247
    new $P108, "Undef"
  vivify_247:
    unless $P108, if_1447_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "pf_flags "
    find_lex $P111, "$res"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1447_end:
.annotate 'line', 627
    find_lex $P108, "$res"
    .return ($P108)
  control_1442:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("54_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1452
    .param pmc param_1453
.annotate 'file', ''
.annotate 'line', 648
    new $P1451, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1451, control_1450
    push_eh $P1451
    .lex "self", self
    .lex "$sub", param_1452
    .lex "%context", param_1453
.annotate 'line', 653
    new $P107, "Undef"
    set $P1454, $P107
    .lex "$res", $P1454
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$res", $P108
.annotate 'line', 654
    find_lex $P108, "$sub"
    $P109 = $P108."vtable"()
    unless $P109, if_1455_end
    find_lex $P110, "$res"
    add $P111, $P110, 2
    store_lex "$res", $P111
  if_1455_end:
.annotate 'line', 655
    find_lex $P108, "$sub"
    $P109 = $P108."is_method"()
    unless $P109, if_1456_end
    find_lex $P110, "$res"
    add $P111, $P110, 4
    store_lex "$res", $P111
  if_1456_end:
.annotate 'line', 656
    find_lex $P108, "$sub"
    $P109 = $P108."is_init"()
    unless $P109, if_1457_end
    find_lex $P110, "$res"
    add $P111, $P110, 1024
    store_lex "$res", $P111
  if_1457_end:
.annotate 'line', 657
    find_lex $P108, "$sub"
    $P109 = $P108."nsentry"()
    unless $P109, if_1458_end
    find_lex $P110, "$res"
    add $P111, $P110, 2048
    store_lex "$res", $P111
  if_1458_end:
.annotate 'line', 659
    find_lex $P1460, "%context"
    unless_null $P1460, vivify_248
    $P1460 = root_new ['parrot';'Hash']
  vivify_248:
    set $P108, $P1460["DEBUG"]
    unless_null $P108, vivify_249
    new $P108, "Undef"
  vivify_249:
    unless $P108, if_1459_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "comp_flags "
    find_lex $P111, "$res"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1459_end:
.annotate 'line', 648
    find_lex $P108, "$res"
    .return ($P108)
  control_1450:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("55_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1464
    .param pmc param_1465
    .param pmc param_1466
    .param pmc param_1467
.annotate 'file', ''
.annotate 'line', 664
    .const 'Sub' $P1471 = "56_1312474859.77612" 
    capture_lex $P1471
    new $P1463, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1463, control_1462
    push_eh $P1463
    .lex "self", self
    .lex "$sub", param_1464
    .lex "$labels_todo", param_1465
    .lex "$bc", param_1466
    .lex "%context", param_1467
.annotate 'line', 665
    find_lex $P1469, "%context"
    unless_null $P1469, vivify_250
    $P1469 = root_new ['parrot';'Hash']
  vivify_250:
    set $P107, $P1469["DEBUG"]
    unless_null $P107, vivify_251
    new $P107, "Undef"
  vivify_251:
    unless $P107, if_1468_end
    find_lex $P108, "self"
    $P108."debug"("Fixup labels")
  if_1468_end:
.annotate 'line', 666
    find_lex $P108, "$labels_todo"
    defined $I101, $P108
    unless $I101, for_undef_252
    iter $P107, $P108
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1488_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1488_test:
    unless $P107, loop1488_done
    shift $P109, $P107
  loop1488_redo:
    .const 'Sub' $P1471 = "56_1312474859.77612" 
    capture_lex $P1471
    $P1471($P109)
  loop1488_next:
    goto loop1488_test
  loop1488_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1488_next
    eq $P115, .CONTROL_LOOP_REDO, loop1488_redo
  loop1488_done:
    pop_eh 
  for_undef_252:
.annotate 'line', 664
    .return ($P107)
  control_1462:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1470"  :anon :subid("56_1312474859.77612") :outer("55_1312474859.77612")
    .param pmc param_1472
.annotate 'file', ''
.annotate 'line', 666
    .lex "$kv", param_1472
.annotate 'line', 667
    new $P110, "Undef"
    set $P1473, $P110
    .lex "$offset", $P1473
.annotate 'line', 668
    $P1475 = root_new ['parrot';'Hash']
    set $P1474, $P1475
    .lex "%todo", $P1474
.annotate 'line', 671
    new $P111, "Undef"
    set $P1476, $P111
    .lex "$op", $P1476
.annotate 'line', 674
    new $P112, "Undef"
    set $P1477, $P112
    .lex "$delta", $P1477
.annotate 'line', 667
    find_lex $P113, "$kv"
    $P114 = $P113."key"()
    store_lex "$offset", $P114
.annotate 'line', 668
    find_lex $P113, "$kv"
    $P114 = $P113."value"()
    store_lex "%todo", $P114
.annotate 'line', 669
    find_lex $P1479, "%context"
    unless_null $P1479, vivify_253
    $P1479 = root_new ['parrot';'Hash']
  vivify_253:
    set $P113, $P1479["DEBUG"]
    unless_null $P113, vivify_254
    new $P113, "Undef"
  vivify_254:
    unless $P113, if_1478_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Fixing '"
    find_lex $P1480, "%todo"
    unless_null $P1480, vivify_255
    $P1480 = root_new ['parrot';'Hash']
  vivify_255:
    set $P116, $P1480["name"]
    unless_null $P116, vivify_256
    new $P116, "Undef"
  vivify_256:
    set $S101, $P116
    concat $P117, $P115, $S101
    concat $P118, $P117, "' from op "
    find_lex $P1481, "%todo"
    unless_null $P1481, vivify_257
    $P1481 = root_new ['parrot';'Hash']
  vivify_257:
    set $P119, $P1481["opname"]
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
  if_1478_end:
.annotate 'line', 671
    find_lex $P1482, "%todo"
    unless_null $P1482, vivify_259
    $P1482 = root_new ['parrot';'Hash']
  vivify_259:
    set $P113, $P1482["opname"]
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
.annotate 'line', 672
    find_lex $P1484, "%context"
    unless_null $P1484, vivify_262
    $P1484 = root_new ['parrot';'Hash']
  vivify_262:
    set $P113, $P1484["DEBUG"]
    unless_null $P113, vivify_263
    new $P113, "Undef"
  vivify_263:
    unless $P113, if_1483_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Op length is "
    find_lex $P116, "$op"
    $P117 = $P116."length"()
    set $S101, $P117
    concat $P116, $P115, $S101
    $P114."debug"($P116)
  if_1483_end:
.annotate 'line', 674
    find_lex $P113, "$sub"
    find_lex $P1485, "%todo"
    unless_null $P1485, vivify_264
    $P1485 = root_new ['parrot';'Hash']
  vivify_264:
    set $P114, $P1485["name"]
    unless_null $P114, vivify_265
    new $P114, "Undef"
  vivify_265:
    $P115 = $P113."label"($P114)
    $P116 = $P115."position"()
    find_lex $P1486, "%todo"
    unless_null $P1486, vivify_266
    $P1486 = root_new ['parrot';'Hash']
  vivify_266:
    set $P117, $P1486["offset"]
    unless_null $P117, vivify_267
    new $P117, "Undef"
  vivify_267:
    sub $P118, $P116, $P117
    store_lex "$delta", $P118
.annotate 'line', 676
    find_lex $P113, "$delta"
    find_lex $P114, "$offset"
    find_lex $P115, "$op"
    $N101 = $P115."length"()
    add $P116, $P114, $N101
    set $I102, $P116
    find_lex $P1487, "$bc"
    unless_null $P1487, vivify_268
    $P1487 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1487
  vivify_268:
    set $P1487[$I102], $P113
.annotate 'line', 666
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("57_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1492
    .param pmc param_1493
.annotate 'file', ''
.annotate 'line', 681
    new $P1491, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1491, control_1490
    push_eh $P1491
    .lex "self", self
    .lex "$name", param_1492
    .lex "%context", param_1493
.annotate 'line', 682
    new $P107, "Undef"
    set $P1494, $P107
    .lex "$reg", $P1494
    find_lex $P1495, "%context"
    unless_null $P1495, vivify_269
    $P1495 = root_new ['parrot';'Hash']
  vivify_269:
    set $P108, $P1495["sub"]
    unless_null $P108, vivify_270
    new $P108, "Undef"
  vivify_270:
    find_lex $P109, "$name"
    $P110 = $P108."symbol"($P109)
    store_lex "$reg", $P110
.annotate 'line', 683
    find_lex $P108, "$reg"
    isfalse $I101, $P108
    unless $I101, if_1496_end
.annotate 'line', 684
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Register '"
    find_lex $P111, "$name"
    set $S101, $P111
    concat $P112, $P110, $S101
    concat $P113, $P112, "' not predeclared in '"
    find_lex $P1497, "%context"
    unless_null $P1497, vivify_271
    $P1497 = root_new ['parrot';'Hash']
  vivify_271:
    set $P114, $P1497["sub"]
    unless_null $P114, vivify_272
    new $P114, "Undef"
  vivify_272:
    $P115 = $P114."name"()
    set $S102, $P115
    concat $P114, $P113, $S102
    concat $P116, $P114, "'"
    $P109."panic"($P116)
  if_1496_end:
.annotate 'line', 681
    find_lex $P108, "$reg"
    .return ($P108)
  control_1490:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "debug"  :subid("58_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1501 :slurpy
.annotate 'file', ''
.annotate 'line', 689
    .const 'Sub' $P1503 = "59_1312474859.77612" 
    capture_lex $P1503
    new $P1500, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1500, control_1499
    push_eh $P1500
    .lex "self", self
    .lex "@args", param_1501
.annotate 'line', 690
    find_lex $P108, "@args"
    defined $I101, $P108
    unless $I101, for_undef_273
    iter $P107, $P108
    new $P110, 'ExceptionHandler'
    set_label $P110, loop1505_handler
    $P110."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P110
  loop1505_test:
    unless $P107, loop1505_done
    shift $P109, $P107
  loop1505_redo:
    .const 'Sub' $P1503 = "59_1312474859.77612" 
    capture_lex $P1503
    $P1503($P109)
  loop1505_next:
    goto loop1505_test
  loop1505_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, .CONTROL_LOOP_NEXT, loop1505_next
    eq $P111, .CONTROL_LOOP_REDO, loop1505_redo
  loop1505_done:
    pop_eh 
  for_undef_273:
.annotate 'line', 689
    .return ($P107)
  control_1499:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1502"  :anon :subid("59_1312474859.77612") :outer("58_1312474859.77612")
    .param pmc param_1504
.annotate 'file', ''
.annotate 'line', 690
    .lex "$_", param_1504
.annotate 'line', 691
    find_lex $P110, "$_"
    say $P110
.annotate 'line', 690
    .return ()
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("60_1312474859.77612") :method :outer("11_1312474859.77612")
    .param pmc param_1509
    .param pmc param_1510
.annotate 'file', ''
.annotate 'line', 695
    new $P1508, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1508, control_1507
    push_eh $P1508
    .lex "self", self
    .lex "$past", param_1509
    .lex "%adverbs", param_1510
.annotate 'line', 696
    $P1512 = root_new ['parrot';'Hash']
    set $P1511, $P1512
    .lex "%context", $P1511
.annotate 'line', 704
    new $P107, "Undef"
    set $P1513, $P107
    .lex "$pfdir", $P1513
.annotate 'line', 695
    find_lex $P108, "%context"
.annotate 'line', 698
    find_lex $P108, "self"
    find_lex $P1514, "%context"
    unless_null $P1514, vivify_274
    $P1514 = root_new ['parrot';'Hash']
    store_lex "%context", $P1514
  vivify_274:
    set $P1514["compiler"], $P108
.annotate 'line', 700
    new $P108, "Packfile"
    find_lex $P1515, "%context"
    unless_null $P1515, vivify_275
    $P1515 = root_new ['parrot';'Hash']
    store_lex "%context", $P1515
  vivify_275:
    set $P1515["packfile"], $P108
.annotate 'line', 704
    find_lex $P1516, "%context"
    unless_null $P1516, vivify_276
    $P1516 = root_new ['parrot';'Hash']
  vivify_276:
    set $P108, $P1516["packfile"]
    unless_null $P108, vivify_277
    new $P108, "Undef"
  vivify_277:
    $P109 = $P108."get_directory"()
    store_lex "$pfdir", $P109
.annotate 'line', 707
    new $P108, "PackfileConstantTable"
    find_lex $P1517, "%context"
    unless_null $P1517, vivify_278
    $P1517 = root_new ['parrot';'Hash']
    store_lex "%context", $P1517
  vivify_278:
    set $P1517["constants"], $P108
.annotate 'line', 710
    new $P108, "FixedIntegerArray"
    find_lex $P1518, "%context"
    unless_null $P1518, vivify_279
    $P1518 = root_new ['parrot';'Hash']
    store_lex "%context", $P1518
  vivify_279:
    set $P1519, $P1518["constants"]
    unless_null $P1519, vivify_280
    $P1519 = root_new ['parrot';'ResizablePMCArray']
    set $P1518["constants"], $P1519
  vivify_280:
    set $P1519[0], $P108
.annotate 'line', 713
    find_lex $P1520, "%context"
    unless_null $P1520, vivify_281
    $P1520 = root_new ['parrot';'Hash']
  vivify_281:
    set $P108, $P1520["constants"]
    unless_null $P108, vivify_282
    new $P108, "Undef"
  vivify_282:
    find_lex $P1521, "$pfdir"
    unless_null $P1521, vivify_283
    $P1521 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1521
  vivify_283:
    set $P1521["CONSTANTS_hello.pir"], $P108
.annotate 'line', 716
    new $P108, "PackfileBytecodeSegment"
    find_lex $P1522, "%context"
    unless_null $P1522, vivify_284
    $P1522 = root_new ['parrot';'Hash']
    store_lex "%context", $P1522
  vivify_284:
    set $P1522["bytecode"], $P108
.annotate 'line', 717
    find_lex $P1523, "%context"
    unless_null $P1523, vivify_285
    $P1523 = root_new ['parrot';'Hash']
  vivify_285:
    set $P108, $P1523["bytecode"]
    unless_null $P108, vivify_286
    new $P108, "Undef"
  vivify_286:
    $P108."main_sub"(-1)
.annotate 'line', 719
    new $P108, "Integer"
    assign $P108, 0
    find_lex $P1524, "%context"
    unless_null $P1524, vivify_287
    $P1524 = root_new ['parrot';'Hash']
    store_lex "%context", $P1524
  vivify_287:
    set $P1524["got_main_sub"], $P108
.annotate 'line', 722
    find_lex $P1525, "%context"
    unless_null $P1525, vivify_288
    $P1525 = root_new ['parrot';'Hash']
  vivify_288:
    set $P108, $P1525["bytecode"]
    unless_null $P108, vivify_289
    new $P108, "Undef"
  vivify_289:
    find_lex $P1526, "$pfdir"
    unless_null $P1526, vivify_290
    $P1526 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1526
  vivify_290:
    set $P1526["BYTECODE_hello.pir"], $P108
.annotate 'line', 731
    get_hll_global $P108, ["POST"], "VanillaAllocator"
    $P109 = $P108."new"()
    find_lex $P1527, "%context"
    unless_null $P1527, vivify_291
    $P1527 = root_new ['parrot';'Hash']
    store_lex "%context", $P1527
  vivify_291:
    set $P1527["regalloc"], $P109
.annotate 'line', 733
    find_lex $P1528, "%adverbs"
    unless_null $P1528, vivify_292
    $P1528 = root_new ['parrot';'Hash']
  vivify_292:
    set $P108, $P1528["debug"]
    unless_null $P108, vivify_293
    new $P108, "Undef"
  vivify_293:
    find_lex $P1529, "%context"
    unless_null $P1529, vivify_294
    $P1529 = root_new ['parrot';'Hash']
    store_lex "%context", $P1529
  vivify_294:
    set $P1529["DEBUG"], $P108
.annotate 'line', 695
    find_lex $P108, "%context"
    .return ($P108)
  control_1507:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1531" :load :anon :subid("61_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1533 = "11_1312474859.77612" 
    $P107 = $P1533()
    .return ($P107)
.end


.namespace []
.sub "_block1534" :load :anon :subid("62_1312474859.77612")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1536 = "10_1312474859.77612" 
    $P101 = $P1536()
    .return ($P101)
.end

