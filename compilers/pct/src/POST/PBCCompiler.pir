
.namespace []
.sub "_block1000"  :anon :subid("10_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312496167.40609" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312496167.40609" 
    capture_lex $P1003
    $P108 = $P1003()
.annotate 'line', 1
    .return ($P108)
    .const 'Sub' $P1551 = "65_1312496167.40609" 
    .return ($P1551)
.end


.namespace []
.sub "" :load :init :subid("post66") :outer("10_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312496167.40609" 
    .local pmc block
    set block, $P1001
    $P1553 = get_root_global ["parrot"], "P6metaclass"
    $P1553."new_class"("POST::PBCCompiler", "PCT::HLLCompiler" :named("parent"))
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1002"  :subid("11_1312496167.40609") :outer("10_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1522 = "63_1312496167.40609" 
    capture_lex $P1522
    .const 'Sub' $P1514 = "61_1312496167.40609" 
    capture_lex $P1514
    .const 'Sub' $P1505 = "60_1312496167.40609" 
    capture_lex $P1505
    .const 'Sub' $P1477 = "58_1312496167.40609" 
    capture_lex $P1477
    .const 'Sub' $P1465 = "57_1312496167.40609" 
    capture_lex $P1465
    .const 'Sub' $P1457 = "56_1312496167.40609" 
    capture_lex $P1457
    .const 'Sub' $P1448 = "54_1312496167.40609" 
    capture_lex $P1448
    .const 'Sub' $P1422 = "53_1312496167.40609" 
    capture_lex $P1422
    .const 'Sub' $P1395 = "49_1312496167.40609" 
    capture_lex $P1395
    .const 'Sub' $P1368 = "46_1312496167.40609" 
    capture_lex $P1368
    .const 'Sub' $P1353 = "45_1312496167.40609" 
    capture_lex $P1353
    .const 'Sub' $P1348 = "44_1312496167.40609" 
    capture_lex $P1348
    .const 'Sub' $P1342 = "43_1312496167.40609" 
    capture_lex $P1342
    .const 'Sub' $P1328 = "41_1312496167.40609" 
    capture_lex $P1328
    .const 'Sub' $P1316 = "40_1312496167.40609" 
    capture_lex $P1316
    .const 'Sub' $P1303 = "39_1312496167.40609" 
    capture_lex $P1303
    .const 'Sub' $P1239 = "35_1312496167.40609" 
    capture_lex $P1239
    .const 'Sub' $P1224 = "33_1312496167.40609" 
    capture_lex $P1224
    .const 'Sub' $P1215 = "31_1312496167.40609" 
    capture_lex $P1215
    .const 'Sub' $P1171 = "25_1312496167.40609" 
    capture_lex $P1171
    .const 'Sub' $P1083 = "22_1312496167.40609" 
    capture_lex $P1083
    .const 'Sub' $P1078 = "21_1312496167.40609" 
    capture_lex $P1078
    .const 'Sub' $P1062 = "20_1312496167.40609" 
    capture_lex $P1062
    .const 'Sub' $P1056 = "19_1312496167.40609" 
    capture_lex $P1056
    .const 'Sub' $P1038 = "17_1312496167.40609" 
    capture_lex $P1038
    .const 'Sub' $P1032 = "16_1312496167.40609" 
    capture_lex $P1032
    .const 'Sub' $P1023 = "15_1312496167.40609" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "14_1312496167.40609" 
    capture_lex $P1016
    .const 'Sub' $P1005 = "12_1312496167.40609" 
    capture_lex $P1005
.annotate 'line', 58
    .const 'Sub' $P1005 = "12_1312496167.40609" 
    newclosure $P1014, $P1005
    set $P1004, $P1014
    .lex "trigger", $P1004
.annotate 'line', 112
    .const 'Sub' $P1016 = "14_1312496167.40609" 
    newclosure $P1021, $P1016
    set $P1015, $P1021
    .lex "get_or_create_number", $P1015
.annotate 'line', 123
    .const 'Sub' $P1023 = "15_1312496167.40609" 
    newclosure $P1030, $P1023
    set $P1022, $P1030
    .lex "get_or_create_pmc", $P1022
.annotate 'line', 128
    .const 'Sub' $P1032 = "16_1312496167.40609" 
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
.annotate 'line', 707
    .const 'Sub' $P1522 = "63_1312496167.40609" 
    newclosure $P1546, $P1522
.annotate 'line', 16
    .return ($P1546)
    .const 'Sub' $P1548 = "64_1312496167.40609" 
    .return ($P1548)
.end


.namespace ["POST";"PBCCompiler"]
.sub "" :load :init :subid("post67") :outer("11_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312496167.40609" 
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
.sub "trigger"  :subid("12_1312496167.40609") :outer("11_1312496167.40609")
    .param pmc param_1008
    .param pmc param_1009
.annotate 'file', ''
.annotate 'line', 58
    .const 'Sub' $P1011 = "13_1312496167.40609" 
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
    unless $I101, for_undef_68
    iter $P101, $P104
    new $P108, 'ExceptionHandler'
    set_label $P108, loop1013_handler
    $P108."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P108
  loop1013_test:
    unless $P101, loop1013_done
    shift $P105, $P101
  loop1013_redo:
    .const 'Sub' $P1011 = "13_1312496167.40609" 
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
  for_undef_68:
.annotate 'line', 58
    .return ($P101)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1010"  :anon :subid("13_1312496167.40609") :outer("12_1312496167.40609")
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
.sub "get_or_create_number"  :subid("14_1312496167.40609") :outer("11_1312496167.40609")
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
.sub "get_or_create_pmc"  :subid("15_1312496167.40609") :outer("11_1312496167.40609")
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
    unless_null $P1029, vivify_69
    $P1029 = root_new ['parrot';'Hash']
  vivify_69:
    set $P104, $P1029["constants"]
    unless_null $P104, vivify_70
    new $P104, "Undef"
  vivify_70:
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
.sub "get_or_create_string"  :subid("16_1312496167.40609") :outer("11_1312496167.40609")
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
.sub "packfile"  :subid("17_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1041
    .param pmc param_1042 :slurpy :named
.annotate 'file', ''
.annotate 'line', 36
    .const 'Sub' $P1052 = "18_1312496167.40609" 
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
    unless_null $P1046, vivify_71
    $P1046 = root_new ['parrot';'Hash']
  vivify_71:
    set $P107, $P1046["DEBUG"]
    unless_null $P107, vivify_72
    new $P107, "Undef"
  vivify_72:
    set $P1045, $P107
    defined $I1048, $P1045
    if $I1048, default_1047
    new $P108, "Integer"
    assign $P108, 0
    set $P1045, $P108
  default_1047:
    find_lex $P1049, "%context"
    unless_null $P1049, vivify_73
    $P1049 = root_new ['parrot';'Hash']
    store_lex "%context", $P1049
  vivify_73:
    set $P1049["DEBUG"], $P1045
.annotate 'line', 43
    find_lex $P107, "$post"
    find_lex $P1050, "%context"
    unless_null $P1050, vivify_74
    $P1050 = root_new ['parrot';'Hash']
    store_lex "%context", $P1050
  vivify_74:
    set $P1050["pir_file"], $P107
.annotate 'line', 48
    find_lex $P107, "self"
    find_lex $P108, "$post"
    $P107."enumerate_subs"($P108)
.annotate 'line', 50
    find_lex $P108, "$post"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_75
    iter $P107, $P109
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1054_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
  loop1054_test:
    unless $P107, loop1054_done
    shift $P110, $P107
  loop1054_redo:
    .const 'Sub' $P1052 = "18_1312496167.40609" 
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
  for_undef_75:
.annotate 'line', 36
    find_lex $P1055, "%context"
    unless_null $P1055, vivify_76
    $P1055 = root_new ['parrot';'Hash']
  vivify_76:
    set $P107, $P1055["packfile"]
    unless_null $P107, vivify_77
    new $P107, "Undef"
  vivify_77:
    .return ($P107)
  control_1039:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1051"  :anon :subid("18_1312496167.40609") :outer("17_1312496167.40609")
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
.sub "mainpmc"  :subid("19_1312496167.40609") :method :outer("11_1312496167.40609")
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
.sub "pbc"  :subid("20_1312496167.40609") :method :outer("11_1312496167.40609")
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
    unless_null $P1071, vivify_78
    $P1071 = root_new ['parrot';'Hash']
  vivify_78:
    set $P111, $P1071["output"]
    unless_null $P111, vivify_79
    new $P111, "Undef"
  vivify_79:
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
    unless_null $P1074, vivify_80
    $P1074 = root_new ['parrot';'Hash']
  vivify_80:
    set $P112, $P1074["cleanup"]
    unless_null $P112, vivify_81
    new $P112, "Undef"
  vivify_81:
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
.sub "to_pbc"  :subid("21_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["Undef"],_)
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
.sub "to_pbc"  :subid("22_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Sub"],_)
    .param pmc param_1086
    .param pmc param_1087
.annotate 'file', ''
.annotate 'line', 150
    .const 'Sub' $P1140 = "24_1312496167.40609" 
    capture_lex $P1140
    .const 'Sub' $P1119 = "23_1312496167.40609" 
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
    unless_null $P1098, vivify_82
    $P1098 = root_new ['parrot';'Hash']
    store_lex "%context", $P1098
  vivify_82:
    set $P1098["sub"], $P113
.annotate 'line', 155
    find_lex $P1099, "%context"
    unless_null $P1099, vivify_83
    $P1099 = root_new ['parrot';'Hash']
  vivify_83:
    set $P113, $P1099["regalloc"]
    unless_null $P113, vivify_84
    new $P113, "Undef"
  vivify_84:
    find_lex $P114, "$sub"
    $P115 = $P113."process"($P114)
    store_lex "@n_regs_used", $P115
.annotate 'line', 156
    find_lex $P1101, "%context"
    unless_null $P1101, vivify_85
    $P1101 = root_new ['parrot';'Hash']
  vivify_85:
    set $P113, $P1101["DEBUG"]
    unless_null $P113, vivify_86
    new $P113, "Undef"
  vivify_86:
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
    unless_null $P1103, vivify_87
    $P1103 = root_new ['parrot';'Hash']
  vivify_87:
    set $P113, $P1103["DEBUG"]
    unless_null $P113, vivify_88
    new $P113, "Undef"
  vivify_88:
    unless $P113, if_1102_end
    find_lex $P114, "self"
    find_lex $P115, "$sub"
    $P114."dumper"($P115, "sub")
  if_1102_end:
.annotate 'line', 159
    find_lex $P1104, "%context"
    unless_null $P1104, vivify_89
    $P1104 = root_new ['parrot';'Hash']
  vivify_89:
    set $P113, $P1104["bytecode"]
    unless_null $P113, vivify_90
    new $P113, "Undef"
  vivify_90:
    store_lex "$bc", $P113
.annotate 'line', 162
    $P113 = "hash"()
    find_lex $P1105, "%context"
    unless_null $P1105, vivify_91
    $P1105 = root_new ['parrot';'Hash']
    store_lex "%context", $P1105
  vivify_91:
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
    unless_null $P1107, vivify_92
    $P1107 = root_new ['parrot';'Hash']
  vivify_92:
    set $P113, $P1107["DEBUG"]
    unless_null $P113, vivify_93
    new $P113, "Undef"
  vivify_93:
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
    unless_null $P1109, vivify_94
    $P1109 = root_new ['parrot';'Hash']
  vivify_94:
    set $P113, $P1109["DEBUG"]
    unless_null $P113, vivify_95
    new $P113, "Undef"
  vivify_95:
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
    unless_null $P1111, vivify_96
    $P1111 = root_new ['parrot';'Hash']
  vivify_96:
    set $P113, $P1111["params"]
    unless_null $P113, vivify_97
    new $P113, "Undef"
  vivify_97:
    if $P113, unless_1110_end
    $P114 = "list"()
    find_lex $P1112, "$sub"
    unless_null $P1112, vivify_98
    $P1112 = root_new ['parrot';'Hash']
    store_lex "$sub", $P1112
  vivify_98:
    set $P1112["params"], $P114
  unless_1110_end:
.annotate 'line', 178
    find_lex $P113, "$sub"
    $P114 = $P113."is_method"()
    unless $P114, if_1113_end
    find_lex $P1114, "$sub"
    unless_null $P1114, vivify_99
    $P1114 = root_new ['parrot';'Hash']
  vivify_99:
    set $P115, $P1114["params"]
    unless_null $P115, vivify_100
    new $P115, "Undef"
  vivify_100:
    get_hll_global $P116, ["POST"], "Value"
    $P117 = $P116."new"("self" :named("name"))
    $P115."unshift"($P117)
  if_1113_end:
.annotate 'line', 180
    find_lex $P1116, "$sub"
    unless_null $P1116, vivify_101
    $P1116 = root_new ['parrot';'Hash']
  vivify_101:
    set $P113, $P1116["params"]
    unless_null $P113, vivify_102
    new $P113, "Undef"
  vivify_102:
    set $N101, $P113
    unless $N101, if_1115_end
.annotate 'line', 181
    find_lex $P114, "self"
    find_lex $P1117, "$sub"
    unless_null $P1117, vivify_103
    $P1117 = root_new ['parrot';'Hash']
  vivify_103:
    set $P115, $P1117["params"]
    unless_null $P115, vivify_104
    new $P115, "Undef"
  vivify_104:
    find_lex $P116, "%context"
    $P114."build_pcc_call"("get_params_pc", $P115, $P116)
  if_1115_end:
.annotate 'line', 185
    find_lex $P114, "$sub"
    $P115 = $P114."list"()
    defined $I101, $P115
    unless $I101, for_undef_105
    iter $P113, $P115
    new $P117, 'ExceptionHandler'
    set_label $P117, loop1121_handler
    $P117."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P117
  loop1121_test:
    unless $P113, loop1121_done
    shift $P116, $P113
  loop1121_redo:
    .const 'Sub' $P1119 = "23_1312496167.40609" 
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
  for_undef_105:
.annotate 'line', 189
    find_lex $P1123, "%context"
    unless_null $P1123, vivify_106
    $P1123 = root_new ['parrot';'Hash']
  vivify_106:
    set $P113, $P1123["DEBUG"]
    unless_null $P113, vivify_107
    new $P113, "Undef"
  vivify_107:
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
    unless_null $P1125, vivify_108
    $P1125 = root_new ['parrot';'Hash']
  vivify_108:
    set $P113, $P1125["DEBUG"]
    unless_null $P113, vivify_109
    new $P113, "Undef"
  vivify_109:
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
    unless_null $P1127, vivify_110
    $P1127 = root_new ['parrot';'Hash']
  vivify_110:
    set $P113, $P1127["DEBUG"]
    unless_null $P113, vivify_111
    new $P113, "Undef"
  vivify_111:
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
    unless_null $P1128, vivify_112
    $P1128 = root_new ['parrot';'Hash']
  vivify_112:
    set $P115, $P1128["labels_todo"]
    unless_null $P115, vivify_113
    new $P115, "Undef"
  vivify_113:
    find_lex $P1129, "%context"
    unless_null $P1129, vivify_114
    $P1129 = root_new ['parrot';'Hash']
  vivify_114:
    set $P116, $P1129["bytecode"]
    unless_null $P116, vivify_115
    new $P116, "Undef"
  vivify_115:
    find_lex $P117, "%context"
    $P113."fixup_labels"($P114, $P115, $P116, $P117)
.annotate 'line', 209
    find_lex $P113, "$start_offset"
    find_lex $P114, "$end_offset"
    find_lex $P115, "$subname"
.annotate 'line', 214
    find_lex $P1131, "$sub"
    unless_null $P1131, vivify_116
    $P1131 = root_new ['parrot';'Hash']
  vivify_116:
    set $P116, $P1131["subid"]
    unless_null $P116, vivify_117
    new $P116, "Undef"
  vivify_117:
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
    .const 'Sub' $P1140 = "24_1312496167.40609" 
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
    unless_null $P1149, vivify_120
    $P1149 = root_new ['parrot';'Hash']
  vivify_120:
    set $P114, $P1149["constants"]
    unless_null $P114, vivify_121
    new $P114, "Undef"
  vivify_121:
    find_lex $P115, "%sub"
    new $P116, "Sub", $P115
    push $P114, $P116
.annotate 'line', 243
    find_lex $P1150, "%context"
    unless_null $P1150, vivify_122
    $P1150 = root_new ['parrot';'Hash']
  vivify_122:
    set $P114, $P1150["constants"]
    unless_null $P114, vivify_123
    new $P114, "Undef"
  vivify_123:
    $P115 = $P114."pmc_count"()
    sub $P116, $P115, 1
    store_lex "$idx", $P116
.annotate 'line', 244
    find_lex $P114, "$sub"
    find_lex $P115, "$idx"
    $P114."constant_index"($P115)
.annotate 'line', 245
    find_lex $P1152, "%context"
    unless_null $P1152, vivify_124
    $P1152 = root_new ['parrot';'Hash']
  vivify_124:
    set $P114, $P1152["DEBUG"]
    unless_null $P114, vivify_125
    new $P114, "Undef"
  vivify_125:
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
    unless_null $P1146, vivify_126
    $P1146 = root_new ['parrot';'Hash']
  vivify_126:
    set $P114, $P1146["DEBUG"]
    unless_null $P114, vivify_127
    new $P114, "Undef"
  vivify_127:
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
    unless_null $P1147, vivify_128
    $P1147 = root_new ['parrot';'Hash']
    store_lex "%context", $P1147
  vivify_128:
    set $P1148, $P1147["constants"]
    unless_null $P1148, vivify_129
    $P1148 = root_new ['parrot';'ResizablePMCArray']
    set $P1147["constants"], $P1148
  vivify_129:
    set $P1148[$I102], $P115
  if_1144_end:
.annotate 'line', 249
    find_lex $P1154, "%context"
    unless_null $P1154, vivify_130
    $P1154 = root_new ['parrot';'Hash']
  vivify_130:
    set $P114, $P1154["got_main_sub"]
    unless_null $P114, vivify_131
    new $P114, "Undef"
  vivify_131:
    isfalse $I101, $P114
    if $I101, if_1153
    new $P113, 'Integer'
    set $P113, $I101
    goto if_1153_end
  if_1153:
.annotate 'line', 250
    find_lex $P1156, "%context"
    unless_null $P1156, vivify_132
    $P1156 = root_new ['parrot';'Hash']
  vivify_132:
    set $P115, $P1156["DEBUG"]
    unless_null $P115, vivify_133
    new $P115, "Undef"
  vivify_133:
    unless $P115, if_1155_end
    find_lex $P116, "self"
    new $P117, 'String'
    set $P117, "main_sub is "
    find_lex $P1157, "%context"
    unless_null $P1157, vivify_134
    $P1157 = root_new ['parrot';'Hash']
  vivify_134:
    set $P118, $P1157["bytecode"]
    unless_null $P118, vivify_135
    new $P118, "Undef"
  vivify_135:
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
    unless_null $P1164, vivify_136
    $P1164 = root_new ['parrot';'Hash']
  vivify_136:
    set $P117, $P1164["bytecode"]
    unless_null $P117, vivify_137
    new $P117, "Undef"
  vivify_137:
    $N101 = $P117."main_sub"()
    iseq $I102, $N101, -1.0
    unless $I102, if_1163_end
.annotate 'line', 259
    find_lex $P1166, "%context"
    unless_null $P1166, vivify_138
    $P1166 = root_new ['parrot';'Hash']
  vivify_138:
    set $P118, $P1166["DEBUG"]
    unless_null $P118, vivify_139
    new $P118, "Undef"
  vivify_139:
    unless $P118, if_1165_end
    find_lex $P119, "self"
    $P119."debug"("Got first sub")
  if_1165_end:
.annotate 'line', 260
    find_lex $P1167, "%context"
    unless_null $P1167, vivify_140
    $P1167 = root_new ['parrot';'Hash']
  vivify_140:
    set $P118, $P1167["bytecode"]
    unless_null $P118, vivify_141
    new $P118, "Undef"
  vivify_141:
    find_lex $P119, "$idx"
    $P118."main_sub"($P119)
  if_1163_end:
.annotate 'line', 257
    goto if_1158_end
  if_1158:
.annotate 'line', 252
    find_lex $P1160, "%context"
    unless_null $P1160, vivify_142
    $P1160 = root_new ['parrot';'Hash']
  vivify_142:
    set $P117, $P1160["DEBUG"]
    unless_null $P117, vivify_143
    new $P117, "Undef"
  vivify_143:
    unless $P117, if_1159_end
    find_lex $P118, "self"
    $P118."debug"("Got first :main")
  if_1159_end:
.annotate 'line', 254
    find_lex $P1161, "%context"
    unless_null $P1161, vivify_144
    $P1161 = root_new ['parrot';'Hash']
  vivify_144:
    set $P117, $P1161["bytecode"]
    unless_null $P117, vivify_145
    new $P117, "Undef"
  vivify_145:
    find_lex $P118, "$idx"
    $P117."main_sub"($P118)
.annotate 'line', 255
    new $P117, "Integer"
    assign $P117, 1
    find_lex $P1162, "%context"
    unless_null $P1162, vivify_146
    $P1162 = root_new ['parrot';'Hash']
    store_lex "%context", $P1162
  vivify_146:
    set $P1162["got_main_sub"], $P117
  if_1158_end:
.annotate 'line', 263
    find_lex $P1169, "%context"
    unless_null $P1169, vivify_147
    $P1169 = root_new ['parrot';'Hash']
  vivify_147:
    set $P116, $P1169["DEBUG"]
    unless_null $P116, vivify_148
    new $P116, "Undef"
  vivify_148:
    if $P116, if_1168
    set $P115, $P116
    goto if_1168_end
  if_1168:
    find_lex $P117, "self"
    new $P118, 'String'
    set $P118, ":main sub is "
    find_lex $P1170, "%context"
    unless_null $P1170, vivify_149
    $P1170 = root_new ['parrot';'Hash']
  vivify_149:
    set $P119, $P1170["bytecode"]
    unless_null $P119, vivify_150
    new $P119, "Undef"
  vivify_150:
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
.sub "_block1118"  :anon :subid("23_1312496167.40609") :outer("22_1312496167.40609")
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
.sub "_block1139"  :anon :subid("24_1312496167.40609") :outer("22_1312496167.40609")
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
    unless_null $P120, vivify_118
    new $P120, "Undef"
  vivify_118:
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
    unless_null $P1143, vivify_119
    $P1143 = root_new ['parrot';'Hash']
    store_lex "%sub", $P1143
  vivify_119:
    set $P1143["namespace_name"], $P118
.annotate 'line', 228
    set $P116, $P118
  if_1142_end:
.annotate 'line', 226
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("25_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Op"],_)
    .param pmc param_1174
    .param pmc param_1175
.annotate 'file', ''
.annotate 'line', 267
    .const 'Sub' $P1209 = "30_1312496167.40609" 
    capture_lex $P1209
    .const 'Sub' $P1198 = "29_1312496167.40609" 
    capture_lex $P1198
    .const 'Sub' $P1182 = "26_1312496167.40609" 
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
.annotate 'line', 270
    $P1178 = root_new ['parrot';'ResizablePMCArray']
    set $P1177, $P1178
    .lex "@calls", $P1177
.annotate 'line', 296
    $P1180 = root_new ['parrot';'ResizablePMCArray']
    set $P1179, $P1180
    .lex "@op", $P1179
.annotate 'line', 269
    find_lex $P108, "$op"
    $P109 = $P108."pirop"()
    store_lex "$fullname", $P109
.annotate 'line', 270
    new $P108, "ResizablePMCArray"
    push $P108, "call"
    push $P108, "callmethod"
    push $P108, "return"
    push $P108, "yield"
    push $P108, "tailcall"
    store_lex "@calls", $P108
.annotate 'line', 271
    find_lex $P109, "@calls"
    defined $I101, $P109
    unless $I101, for_undef_151
    iter $P108, $P109
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1194_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1194_test:
    unless $P108, loop1194_done
    shift $P110, $P108
  loop1194_redo:
    .const 'Sub' $P1182 = "26_1312496167.40609" 
    capture_lex $P1182
    $P1182($P110)
  loop1194_next:
    goto loop1194_test
  loop1194_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1194_next
    eq $P113, .CONTROL_LOOP_REDO, loop1194_redo
  loop1194_done:
    pop_eh 
  for_undef_151:
.annotate 'line', 282
    find_lex $P1196, "%context"
    unless_null $P1196, vivify_153
    $P1196 = root_new ['parrot';'Hash']
  vivify_153:
    set $P108, $P1196["DEBUG"]
    unless_null $P108, vivify_154
    new $P108, "Undef"
  vivify_154:
    unless $P108, if_1195_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Short name "
    find_lex $P111, "$fullname"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1195_end:
.annotate 'line', 284
    find_lex $P109, "$op"
    $P110 = $P109."list"()
    defined $I101, $P110
    unless $I101, for_undef_155
    iter $P108, $P110
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1202_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1202_test:
    unless $P108, loop1202_done
    shift $P111, $P108
  loop1202_redo:
    .const 'Sub' $P1198 = "29_1312496167.40609" 
    capture_lex $P1198
    $P1198($P111)
  loop1202_next:
    goto loop1202_test
  loop1202_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1202_next
    eq $P114, .CONTROL_LOOP_REDO, loop1202_redo
  loop1202_done:
    pop_eh 
  for_undef_155:
.annotate 'line', 289
    find_lex $P1204, "%context"
    unless_null $P1204, vivify_156
    $P1204 = root_new ['parrot';'Hash']
  vivify_156:
    set $P108, $P1204["DEBUG"]
    unless_null $P108, vivify_157
    new $P108, "Undef"
  vivify_157:
    unless $P108, if_1203_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Fullname "
    find_lex $P111, "$fullname"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1203_end:
.annotate 'line', 292
    find_lex $P1205, "%context"
    unless_null $P1205, vivify_158
    $P1205 = root_new ['parrot';'Hash']
  vivify_158:
    set $P108, $P1205["bytecode"]
    unless_null $P108, vivify_159
    new $P108, "Undef"
  vivify_159:
    set $N101, $P108
    new $P109, 'Float'
    set $P109, $N101
    find_lex $P1206, "%context"
    unless_null $P1206, vivify_160
    $P1206 = root_new ['parrot';'Hash']
    store_lex "%context", $P1206
  vivify_160:
    set $P1206["opcode_offset"], $P109
.annotate 'line', 294
    find_lex $P108, "$fullname"
    find_lex $P1207, "%context"
    unless_null $P1207, vivify_161
    $P1207 = root_new ['parrot';'Hash']
    store_lex "%context", $P1207
  vivify_161:
    set $P1207["opcode_fullname"], $P108
.annotate 'line', 296
    find_lex $P108, "$fullname"
    $P109 = "list"($P108)
    store_lex "@op", $P109
.annotate 'line', 297
    find_lex $P109, "$op"
    $P110 = $P109."list"()
    defined $I101, $P110
    unless $I101, for_undef_162
    iter $P108, $P110
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1211_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1211_test:
    unless $P108, loop1211_done
    shift $P111, $P108
  loop1211_redo:
    .const 'Sub' $P1209 = "30_1312496167.40609" 
    capture_lex $P1209
    $P1209($P111)
  loop1211_next:
    goto loop1211_test
  loop1211_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1211_next
    eq $P113, .CONTROL_LOOP_REDO, loop1211_redo
  loop1211_done:
    pop_eh 
  for_undef_162:
.annotate 'line', 300
    find_lex $P1213, "%context"
    unless_null $P1213, vivify_163
    $P1213 = root_new ['parrot';'Hash']
  vivify_163:
    set $P108, $P1213["DEBUG"]
    unless_null $P108, vivify_164
    new $P108, "Undef"
  vivify_164:
    unless $P108, if_1212_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Op size "
    find_lex $P111, "@op"
    set $N101, $P111
    set $S101, $N101
    concat $P111, $P110, $S101
    $P109."debug"($P111)
  if_1212_end:
.annotate 'line', 301
    find_lex $P1214, "%context"
    unless_null $P1214, vivify_165
    $P1214 = root_new ['parrot';'Hash']
  vivify_165:
    set $P108, $P1214["bytecode"]
    unless_null $P108, vivify_166
    new $P108, "Undef"
  vivify_166:
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
.sub "_block1181"  :anon :subid("26_1312496167.40609") :outer("25_1312496167.40609")
    .param pmc param_1183
.annotate 'file', ''
.annotate 'line', 271
    .const 'Sub' $P1186 = "27_1312496167.40609" 
    capture_lex $P1186
    .lex "$_", param_1183
.annotate 'line', 272
    find_lex $P112, "$fullname"
    set $S101, $P112
    find_lex $P113, "$_"
    set $S102, $P113
    iseq $I102, $S101, $S102
    if $I102, if_1184
    new $P111, 'Integer'
    set $P111, $I102
    goto if_1184_end
  if_1184:
    .const 'Sub' $P1186 = "27_1312496167.40609" 
    capture_lex $P1186
    $P115 = $P1186()
    set $P111, $P115
  if_1184_end:
.annotate 'line', 271
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "_block1185"  :anon :subid("27_1312496167.40609") :outer("26_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 272
    .const 'Sub' $P1191 = "28_1312496167.40609" 
    capture_lex $P1191
.annotate 'line', 273
    new $P114, "Undef"
    set $P1187, $P114
    .lex "$newpost", $P1187
.annotate 'line', 274
    $P1189 = root_new ['parrot';'ResizablePMCArray']
    set $P1188, $P1189
    .lex "@args", $P1188
.annotate 'line', 273
    get_hll_global $P115, ["POST"], "Call"
    find_lex $P116, "$_"
    $P117 = $P115."new"($P116 :named("calltype"))
    store_lex "$newpost", $P117
.annotate 'line', 274
    new $P115, "ResizablePMCArray"
    store_lex "@args", $P115
.annotate 'line', 275
    find_lex $P116, "$op"
    $P117 = $P116."list"()
    defined $I103, $P117
    unless $I103, for_undef_152
    iter $P115, $P117
    new $P122, 'ExceptionHandler'
    set_label $P122, loop1193_handler
    $P122."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P122
  loop1193_test:
    unless $P115, loop1193_done
    shift $P118, $P115
  loop1193_redo:
    .const 'Sub' $P1191 = "28_1312496167.40609" 
    capture_lex $P1191
    $P1191($P118)
  loop1193_next:
    goto loop1193_test
  loop1193_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, 'type'
    eq $P123, .CONTROL_LOOP_NEXT, loop1193_next
    eq $P123, .CONTROL_LOOP_REDO, loop1193_redo
  loop1193_done:
    pop_eh 
  for_undef_152:
.annotate 'line', 276
    find_lex $P115, "$newpost"
    find_lex $P116, "@args"
    $P115."params"($P116)
.annotate 'line', 277
    new $P115, "Exception"
    set $P115['type'], .CONTROL_RETURN
    find_lex $P116, "self"
    find_lex $P117, "$newpost"
    find_lex $P118, "%context"
    $P119 = $P116."to_pbc"($P117, $P118)
    setattribute $P115, 'payload', $P119
    throw $P115
.annotate 'line', 272
    .return ()
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1190"  :anon :subid("28_1312496167.40609") :outer("27_1312496167.40609")
    .param pmc param_1192
.annotate 'file', ''
.annotate 'line', 275
    .lex "$_", param_1192
    find_lex $P119, "@args"
    find_lex $P120, "$_"
    $P121 = $P119."push"($P120)
    .return ($P121)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1197"  :anon :subid("29_1312496167.40609") :outer("25_1312496167.40609")
    .param pmc param_1200
.annotate 'file', ''
.annotate 'line', 285
    new $P112, "Undef"
    set $P1199, $P112
    .lex "$type", $P1199
    .lex "$_", param_1200
    find_lex $P114, "$_"
    $P115 = $P114."type"()
    unless $P115, unless_1201
    set $P113, $P115
    goto unless_1201_end
  unless_1201:
    find_lex $P116, "self"
    find_lex $P117, "$_"
    $P118 = $P117."name"()
    find_lex $P119, "%context"
    $P120 = $P116."get_register"($P118, $P119)
    $P121 = $P120."type"()
    set $P113, $P121
  unless_1201_end:
    store_lex "$type", $P113
.annotate 'line', 286
    find_lex $P113, "$fullname"
    set $S101, $P113
    new $P114, 'String'
    set $P114, $S101
    concat $P115, $P114, "_"
    find_lex $P116, "$type"
    set $S102, $P116
    concat $P117, $P115, $S102
    store_lex "$fullname", $P117
.annotate 'line', 284
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1208"  :anon :subid("30_1312496167.40609") :outer("25_1312496167.40609")
    .param pmc param_1210
.annotate 'file', ''
.annotate 'line', 297
    .lex "$_", param_1210
.annotate 'line', 298
    find_lex $P112, "@op"
    find_lex $P113, "self"
    find_lex $P114, "$_"
    find_lex $P115, "%context"
    $P116 = $P113."to_op"($P114, $P115)
    $P117 = $P112."push"($P116)
.annotate 'line', 297
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("31_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Node"],_)
    .param pmc param_1218
    .param pmc param_1219
.annotate 'file', ''
.annotate 'line', 305
    .const 'Sub' $P1221 = "32_1312496167.40609" 
    capture_lex $P1221
    new $P1217, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1217, control_1216
    push_eh $P1217
    .lex "self", self
    .lex "$node", param_1218
    .lex "%context", param_1219
.annotate 'line', 306
    find_lex $P108, "$node"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_167
    iter $P107, $P109
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1223_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
  loop1223_test:
    unless $P107, loop1223_done
    shift $P110, $P107
  loop1223_redo:
    .const 'Sub' $P1221 = "32_1312496167.40609" 
    capture_lex $P1221
    $P1221($P110)
  loop1223_next:
    goto loop1223_test
  loop1223_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, .CONTROL_LOOP_NEXT, loop1223_next
    eq $P112, .CONTROL_LOOP_REDO, loop1223_redo
  loop1223_done:
    pop_eh 
  for_undef_167:
.annotate 'line', 305
    .return ($P107)
  control_1216:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1220"  :anon :subid("32_1312496167.40609") :outer("31_1312496167.40609")
    .param pmc param_1222
.annotate 'file', ''
.annotate 'line', 306
    .lex "$_", param_1222
.annotate 'line', 307
    find_lex $P111, "self"
    find_lex $P112, "$_"
    find_lex $P113, "%context"
    $P114 = $P111."to_pbc"($P112, $P113)
.annotate 'line', 306
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("33_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Label"],_)
    .param pmc param_1227
    .param pmc param_1228
.annotate 'file', ''
.annotate 'line', 311
    .const 'Sub' $P1236 = "34_1312496167.40609" 
    capture_lex $P1236
    new $P1226, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1226, control_1225
    push_eh $P1226
    .lex "self", self
    .lex "$l", param_1227
    .lex "%context", param_1228
.annotate 'line', 312
    new $P107, "Undef"
    set $P1229, $P107
    .lex "$bc", $P1229
.annotate 'line', 315
    new $P108, "Undef"
    set $P1230, $P108
    .lex "$pos", $P1230
.annotate 'line', 312
    find_lex $P1231, "%context"
    unless_null $P1231, vivify_168
    $P1231 = root_new ['parrot';'Hash']
  vivify_168:
    set $P109, $P1231["bytecode"]
    unless_null $P109, vivify_169
    new $P109, "Undef"
  vivify_169:
    store_lex "$bc", $P109
.annotate 'line', 313
    find_lex $P109, "$l"
    $P110 = $P109."declared"()
    if $P110, unless_1232_end
    find_lex $P111, "self"
    $P111."panic"("Trying to emit undelcared label!")
  unless_1232_end:
.annotate 'line', 315
    find_lex $P109, "$bc"
    set $N101, $P109
    new $P110, 'Float'
    set $P110, $N101
    store_lex "$pos", $P110
.annotate 'line', 316
    find_lex $P1234, "%context"
    unless_null $P1234, vivify_170
    $P1234 = root_new ['parrot';'Hash']
  vivify_170:
    set $P109, $P1234["DEBUG"]
    unless_null $P109, vivify_171
    new $P109, "Undef"
  vivify_171:
    unless $P109, if_1233_end
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
  if_1233_end:
.annotate 'line', 318
    find_lex $P109, "$l"
    find_lex $P110, "$pos"
    $P109."position"($P110)
.annotate 'line', 320
    find_lex $P110, "$l"
    $P111 = $P110."list"()
    defined $I101, $P111
    unless $I101, for_undef_172
    iter $P109, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1238_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1238_test:
    unless $P109, loop1238_done
    shift $P112, $P109
  loop1238_redo:
    .const 'Sub' $P1236 = "34_1312496167.40609" 
    capture_lex $P1236
    $P1236($P112)
  loop1238_next:
    goto loop1238_test
  loop1238_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1238_next
    eq $P114, .CONTROL_LOOP_REDO, loop1238_redo
  loop1238_done:
    pop_eh 
  for_undef_172:
.annotate 'line', 311
    .return ($P109)
  control_1225:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1235"  :anon :subid("34_1312496167.40609") :outer("33_1312496167.40609")
    .param pmc param_1237
.annotate 'file', ''
.annotate 'line', 320
    .lex "$_", param_1237
.annotate 'line', 321
    find_lex $P113, "self"
    find_lex $P114, "$_"
    find_lex $P115, "%context"
    $P116 = $P113."to_pbc"($P114, $P115)
.annotate 'line', 320
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("35_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Call"],_)
    .param pmc param_1242
    .param pmc param_1243
.annotate 'file', ''
.annotate 'line', 325
    .const 'Sub' $P1260 = "36_1312496167.40609" 
    capture_lex $P1260
    new $P1241, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1241, control_1240
    push_eh $P1241
    .lex "self", self
    .lex "$call", param_1242
    .lex "%context", param_1243
.annotate 'line', 326
    new $P107, "Undef"
    set $P1244, $P107
    .lex "$bc", $P1244
.annotate 'line', 327
    new $P108, "Undef"
    set $P1245, $P108
    .lex "$calltype", $P1245
.annotate 'line', 328
    new $P109, "Undef"
    set $P1246, $P109
    .lex "$is_tailcall", $P1246
.annotate 'line', 326
    find_lex $P1247, "%context"
    unless_null $P1247, vivify_173
    $P1247 = root_new ['parrot';'Hash']
  vivify_173:
    set $P110, $P1247["bytecode"]
    unless_null $P110, vivify_174
    new $P110, "Undef"
  vivify_174:
    store_lex "$bc", $P110
.annotate 'line', 327
    find_lex $P110, "$call"
    $P111 = $P110."calltype"()
    store_lex "$calltype", $P111
.annotate 'line', 328
    find_lex $P110, "$calltype"
    set $S101, $P110
    iseq $I101, $S101, "tailcall"
    new $P111, 'Integer'
    set $P111, $I101
    store_lex "$is_tailcall", $P111
.annotate 'line', 330
    find_lex $P112, "$calltype"
    set $S101, $P112
    iseq $I101, $S101, "call"
    unless $I101, unless_1249
    new $P111, 'Integer'
    set $P111, $I101
    goto unless_1249_end
  unless_1249:
    find_lex $P113, "$calltype"
    set $S102, $P113
    iseq $I102, $S102, "tailcall"
    new $P111, 'Integer'
    set $P111, $I102
  unless_1249_end:
    if $P111, if_1248
.annotate 'line', 408
    find_lex $P116, "$calltype"
    set $S103, $P116
    iseq $I103, $S103, "return"
    if $I103, if_1299
.annotate 'line', 412
    find_lex $P119, "$calltype"
    set $S104, $P119
    iseq $I104, $S104, "results"
    if $I104, if_1301
.annotate 'line', 417
    find_lex $P120, "self"
    new $P121, 'String'
    set $P121, "NYI "
    find_lex $P122, "$calltype"
    set $S105, $P122
    concat $P124, $P121, $S105
    $P125 = $P120."panic"($P124)
.annotate 'line', 416
    set $P118, $P125
.annotate 'line', 412
    goto if_1301_end
  if_1301:
.annotate 'line', 414
    find_lex $P120, "self"
    find_lex $P1302, "$call"
    unless_null $P1302, vivify_175
    $P1302 = root_new ['parrot';'Hash']
  vivify_175:
    set $P121, $P1302["params"]
    unless_null $P121, vivify_176
    new $P121, "Undef"
  vivify_176:
    find_lex $P122, "%context"
    $P123 = $P120."build_pcc_call"("get_results_pc", $P121, $P122)
.annotate 'line', 412
    set $P118, $P123
  if_1301_end:
    set $P115, $P118
.annotate 'line', 408
    goto if_1299_end
  if_1299:
.annotate 'line', 409
    find_lex $P117, "self"
    find_lex $P1300, "$call"
    unless_null $P1300, vivify_177
    $P1300 = root_new ['parrot';'Hash']
  vivify_177:
    set $P118, $P1300["params"]
    unless_null $P118, vivify_178
    new $P118, "Undef"
  vivify_178:
    find_lex $P119, "%context"
    $P117."build_pcc_call"("set_returns_pc", $P118, $P119)
.annotate 'line', 410
    find_lex $P117, "$bc"
    new $P118, "ResizablePMCArray"
    push $P118, "returncc"
    push $P117, $P118
.annotate 'line', 408
    set $P115, $P117
  if_1299_end:
    set $P110, $P115
.annotate 'line', 330
    goto if_1248_end
  if_1248:
.annotate 'line', 331
    find_lex $P114, "$call"
    $P115 = $P114."invocant"()
    unless $P115, if_1250_end
.annotate 'line', 332
    find_lex $P1252, "$call"
    unless_null $P1252, vivify_179
    $P1252 = root_new ['parrot';'Hash']
  vivify_179:
    set $P116, $P1252["params"]
    unless_null $P116, vivify_180
    new $P116, "Undef"
  vivify_180:
    if $P116, unless_1251_end
    $P117 = "list"()
    find_lex $P1253, "$call"
    unless_null $P1253, vivify_181
    $P1253 = root_new ['parrot';'Hash']
    store_lex "$call", $P1253
  vivify_181:
    set $P1253["params"], $P117
  unless_1251_end:
.annotate 'line', 333
    find_lex $P1254, "$call"
    unless_null $P1254, vivify_182
    $P1254 = root_new ['parrot';'Hash']
  vivify_182:
    set $P116, $P1254["params"]
    unless_null $P116, vivify_183
    new $P116, "Undef"
  vivify_183:
    find_lex $P117, "$call"
    $P118 = $P117."invocant"()
    $P116."unshift"($P118)
  if_1250_end:
.annotate 'line', 336
    find_lex $P114, "self"
    find_lex $P1255, "$call"
    unless_null $P1255, vivify_184
    $P1255 = root_new ['parrot';'Hash']
  vivify_184:
    set $P115, $P1255["params"]
    unless_null $P115, vivify_185
    new $P115, "Undef"
  vivify_185:
    find_lex $P116, "%context"
    $P114."build_pcc_call"("set_args_pc", $P115, $P116)
.annotate 'line', 338
    find_lex $P114, "$call"
    $P115 = $P114."invocant"()
    if $P115, if_1256
.annotate 'line', 352
    .const 'Sub' $P1260 = "36_1312496167.40609" 
    capture_lex $P1260
    $P1260()
    goto if_1256_end
  if_1256:
.annotate 'line', 339
    find_lex $P116, "$call"
    $P117 = $P116."name"()
    get_hll_global $P118, ["POST"], "Constant"
    $P119 = $P117."isa"($P118)
    if $P119, if_1257
.annotate 'line', 349
    find_lex $P120, "self"
    $P120."panic"("NYI $P0.$S0()")
.annotate 'line', 348
    goto if_1257_end
  if_1257:
.annotate 'line', 340
    find_lex $P120, "$bc"
.annotate 'line', 342
    find_lex $P122, "$is_tailcall"
    if $P122, if_1258
    new $P124, "String"
    assign $P124, "callmethodcc_p_sc"
    set $P121, $P124
    goto if_1258_end
  if_1258:
    new $P123, "String"
    assign $P123, "tailcallmethod_p_sc"
    set $P121, $P123
  if_1258_end:
.annotate 'line', 344
    find_lex $P125, "self"
    find_lex $P126, "$call"
    $P127 = $P126."invocant"()
    find_lex $P128, "%context"
    $P129 = $P125."to_op"($P127, $P128)
.annotate 'line', 345
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
  if_1257_end:
  if_1256_end:
.annotate 'line', 404
    find_lex $P115, "$is_tailcall"
    unless $P115, unless_1297
    set $P114, $P115
    goto unless_1297_end
  unless_1297:
.annotate 'line', 405
    find_lex $P116, "self"
    find_lex $P1298, "$call"
    unless_null $P1298, vivify_215
    $P1298 = root_new ['parrot';'Hash']
  vivify_215:
    set $P117, $P1298["results"]
    unless_null $P117, vivify_216
    new $P117, "Undef"
  vivify_216:
    find_lex $P118, "%context"
    $P119 = $P116."build_pcc_call"("get_results_pc", $P117, $P118)
.annotate 'line', 404
    set $P114, $P119
  unless_1297_end:
.annotate 'line', 330
    set $P110, $P114
  if_1248_end:
.annotate 'line', 325
    .return ($P110)
  control_1240:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1259"  :anon :subid("36_1312496167.40609") :outer("35_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 352
    .const 'Sub' $P1266 = "37_1312496167.40609" 
    capture_lex $P1266
.annotate 'line', 353
    new $P116, "Undef"
    set $P1261, $P116
    .lex "$SUB", $P1261
.annotate 'line', 354
    new $P117, "Undef"
    set $P1262, $P117
    .lex "$processed", $P1262
.annotate 'line', 398
    new $P118, "Undef"
    set $P1263, $P118
    .lex "$o", $P1263
.annotate 'line', 352
    find_lex $P119, "$SUB"
.annotate 'line', 354
    new $P119, "Integer"
    assign $P119, 0
    store_lex "$processed", $P119
.annotate 'line', 355
    find_lex $P119, "$call"
    $P120 = $P119."name"()
    get_hll_global $P121, ["POST"], "Constant"
    $P122 = $P120."isa"($P121)
    unless $P122, if_1264_end
    .const 'Sub' $P1266 = "37_1312496167.40609" 
    capture_lex $P1266
    $P1266()
  if_1264_end:
.annotate 'line', 383
    find_lex $P119, "$processed"
    if $P119, unless_1286_end
.annotate 'line', 384
    find_lex $P120, "$call"
    $P121 = $P120."name"()
    get_hll_global $P122, ["POST"], "Constant"
    $P123 = $P121."isa"($P122)
    if $P123, if_1287
.annotate 'line', 393
    find_lex $P1291, "%context"
    unless_null $P1291, vivify_203
    $P1291 = root_new ['parrot';'Hash']
  vivify_203:
    set $P124, $P1291["DEBUG"]
    unless_null $P124, vivify_204
    new $P124, "Undef"
  vivify_204:
    unless $P124, if_1290_end
    find_lex $P125, "self"
    new $P126, "String"
    assign $P126, "Name is "
    find_lex $P1292, "$call"
    unless_null $P1292, vivify_205
    $P1292 = root_new ['parrot';'Hash']
  vivify_205:
    set $P127, $P1292["name"]
    unless_null $P127, vivify_206
    new $P127, "Undef"
  vivify_206:
    $S103 = $P127."WHAT"()
    concat $P128, $P126, $S103
    $P125."debug"($P128)
  if_1290_end:
.annotate 'line', 394
    find_lex $P1293, "$call"
    unless_null $P1293, vivify_207
    $P1293 = root_new ['parrot';'Hash']
  vivify_207:
    set $P124, $P1293["name"]
    unless_null $P124, vivify_208
    new $P124, "Undef"
  vivify_208:
    store_lex "$SUB", $P124
.annotate 'line', 392
    goto if_1287_end
  if_1287:
.annotate 'line', 385
    find_lex $P1288, "%context"
    unless_null $P1288, vivify_209
    $P1288 = root_new ['parrot';'Hash']
  vivify_209:
    set $P124, $P1288["sub"]
    unless_null $P124, vivify_210
    new $P124, "Undef"
  vivify_210:
    $P125 = $P124."symbol"("!SUB")
    store_lex "$SUB", $P125
.annotate 'line', 386
    find_lex $P124, "$bc"
.annotate 'line', 388
    find_lex $P125, "self"
    find_lex $P126, "$SUB"
    find_lex $P127, "%context"
    $P128 = $P125."to_op"($P126, $P127)
.annotate 'line', 389
    find_lex $P129, "self"
    find_lex $P1289, "$call"
    unless_null $P1289, vivify_211
    $P1289 = root_new ['parrot';'Hash']
  vivify_211:
    set $P130, $P1289["name"]
    unless_null $P130, vivify_212
    new $P130, "Undef"
  vivify_212:
    find_lex $P131, "%context"
    $P132 = $P129."to_op"($P130, $P131)
    new $P133, "ResizablePMCArray"
    push $P133, "find_sub_not_null_p_sc"
    push $P133, $P128
    push $P133, $P132
    push $P124, $P133
  if_1287_end:
  unless_1286_end:
.annotate 'line', 398
    find_lex $P120, "$is_tailcall"
    if $P120, if_1294
    new $P122, "String"
    assign $P122, "invokecc_p"
    set $P119, $P122
    goto if_1294_end
  if_1294:
    new $P121, "String"
    assign $P121, "tailcall_p"
    set $P119, $P121
  if_1294_end:
    store_lex "$o", $P119
.annotate 'line', 400
    find_lex $P1296, "%context"
    unless_null $P1296, vivify_213
    $P1296 = root_new ['parrot';'Hash']
  vivify_213:
    set $P119, $P1296["DEBUG"]
    unless_null $P119, vivify_214
    new $P119, "Undef"
  vivify_214:
    unless $P119, if_1295_end
    find_lex $P120, "self"
    find_lex $P121, "$o"
    $P120."debug"($P121)
  if_1295_end:
.annotate 'line', 401
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
.annotate 'line', 352
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1265"  :anon :subid("37_1312496167.40609") :outer("36_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 355
    .const 'Sub' $P1279 = "38_1312496167.40609" 
    capture_lex $P1279
.annotate 'line', 358
    new $P123, "Undef"
    set $P1267, $P123
    .lex "$full_name", $P1267
.annotate 'line', 361
    new $P124, "Undef"
    set $P1268, $P124
    .lex "$invocable_sub", $P1268
.annotate 'line', 355
    find_lex $P125, "$full_name"
.annotate 'line', 359
    find_lex $P1270, "%context"
    unless_null $P1270, vivify_186
    $P1270 = root_new ['parrot';'Hash']
  vivify_186:
    set $P125, $P1270["sub"]
    unless_null $P125, vivify_187
    new $P125, "Undef"
  vivify_187:
    $P126 = $P125."namespace"()
    unless $P126, if_1269_end
    find_lex $P1271, "%context"
    unless_null $P1271, vivify_188
    $P1271 = root_new ['parrot';'Hash']
  vivify_188:
    set $P127, $P1271["sub"]
    unless_null $P127, vivify_189
    new $P127, "Undef"
  vivify_189:
    $P128 = $P127."namespace"()
    $P129 = $P128."Str"()
    store_lex "$full_name", $P129
  if_1269_end:
.annotate 'line', 360
    find_lex $P125, "$full_name"
    set $S103, $P125
    new $P126, 'String'
    set $P126, $S103
    find_lex $P1272, "$call"
    unless_null $P1272, vivify_190
    $P1272 = root_new ['parrot';'Hash']
  vivify_190:
    set $P1273, $P1272["name"]
    unless_null $P1273, vivify_191
    $P1273 = root_new ['parrot';'Hash']
  vivify_191:
    set $P127, $P1273["value"]
    unless_null $P127, vivify_192
    new $P127, "Undef"
  vivify_192:
    set $S104, $P127
    concat $P128, $P126, $S104
    store_lex "$full_name", $P128
.annotate 'line', 361
    find_lex $P1274, "%context"
    unless_null $P1274, vivify_193
    $P1274 = root_new ['parrot';'Hash']
  vivify_193:
    set $P125, $P1274["pir_file"]
    unless_null $P125, vivify_194
    new $P125, "Undef"
  vivify_194:
    find_lex $P126, "$full_name"
    $P127 = $P125."sub"($P126)
    store_lex "$invocable_sub", $P127
.annotate 'line', 362
    find_lex $P1276, "%context"
    unless_null $P1276, vivify_195
    $P1276 = root_new ['parrot';'Hash']
  vivify_195:
    set $P125, $P1276["DEBUG"]
    unless_null $P125, vivify_196
    new $P125, "Undef"
  vivify_196:
    unless $P125, if_1275_end
    find_lex $P126, "self"
    new $P127, 'String'
    set $P127, "invocable_sub '"
    find_lex $P128, "$full_name"
    concat $P129, $P127, $P128
    concat $P130, $P129, "'"
    $P126."debug"($P130)
  if_1275_end:
.annotate 'line', 363
    find_lex $P126, "$invocable_sub"
    if $P126, if_1277
    set $P125, $P126
    goto if_1277_end
  if_1277:
    .const 'Sub' $P1279 = "38_1312496167.40609" 
    capture_lex $P1279
    $P129 = $P1279()
    set $P125, $P129
  if_1277_end:
.annotate 'line', 355
    .return ($P125)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1278"  :anon :subid("38_1312496167.40609") :outer("37_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 364
    new $P127, "Undef"
    set $P1280, $P127
    .lex "$idx", $P1280
    find_lex $P128, "$invocable_sub"
    $P129 = $P128."constant_index"()
    store_lex "$idx", $P129
.annotate 'line', 365
    find_lex $P128, "$idx"
    defined $I103, $P128
    if $I103, unless_1281_end
.annotate 'line', 367
    find_lex $P1282, "%context"
    unless_null $P1282, vivify_197
    $P1282 = root_new ['parrot';'Hash']
  vivify_197:
    set $P129, $P1282["constants"]
    unless_null $P129, vivify_198
    new $P129, "Undef"
  vivify_198:
    new $P130, "Integer"
    push $P129, $P130
    store_lex "$idx", $P129
.annotate 'line', 368
    find_lex $P129, "$invocable_sub"
    find_lex $P130, "$idx"
    $P129."constant_index"($P130)
.annotate 'line', 369
    find_lex $P1284, "%context"
    unless_null $P1284, vivify_199
    $P1284 = root_new ['parrot';'Hash']
  vivify_199:
    set $P129, $P1284["DEBUG"]
    unless_null $P129, vivify_200
    new $P129, "Undef"
  vivify_200:
    unless $P129, if_1283_end
    find_lex $P130, "self"
    new $P131, 'String'
    set $P131, "Allocate constant for it "
    find_lex $P132, "$idx"
    concat $P133, $P131, $P132
    $P130."debug"($P133)
  if_1283_end:
  unless_1281_end:
.annotate 'line', 372
    find_lex $P1285, "%context"
    unless_null $P1285, vivify_201
    $P1285 = root_new ['parrot';'Hash']
  vivify_201:
    set $P128, $P1285["sub"]
    unless_null $P128, vivify_202
    new $P128, "Undef"
  vivify_202:
    $P129 = $P128."symbol"("!SUB")
    store_lex "$SUB", $P129
.annotate 'line', 373
    find_lex $P128, "$bc"
.annotate 'line', 375
    find_lex $P129, "self"
    find_lex $P130, "$SUB"
    find_lex $P131, "%context"
    $P132 = $P129."to_op"($P130, $P131)
    find_lex $P133, "$idx"
    new $P134, "ResizablePMCArray"
    push $P134, "set_p_pc"
    push $P134, $P132
    push $P134, $P133
.annotate 'line', 376
    push $P128, $P134
.annotate 'line', 379
    new $P128, "Integer"
    assign $P128, 1
    store_lex "$processed", $P128
.annotate 'line', 363
    .return ($P128)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("39_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Key"],_)
    .param pmc param_1306
    .param pmc param_1307
.annotate 'file', ''
.annotate 'line', 424
    new $P1305, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1305, control_1304
    push_eh $P1305
    .lex "self", self
    .lex "$key", param_1306
    .lex "%context", param_1307
.annotate 'line', 427
    new $P107, "Undef"
    set $P1308, $P107
    .lex "$key_pmc", $P1308
.annotate 'line', 433
    new $P108, "Undef"
    set $P1309, $P108
    .lex "$constants", $P1309
.annotate 'line', 434
    new $P109, "Undef"
    set $P1310, $P109
    .lex "$idx", $P1310
.annotate 'line', 426
    find_lex $P1312, "%context"
    unless_null $P1312, vivify_217
    $P1312 = root_new ['parrot';'Hash']
  vivify_217:
    set $P110, $P1312["DEBUG"]
    unless_null $P110, vivify_218
    new $P110, "Undef"
  vivify_218:
    unless $P110, if_1311_end
    find_lex $P111, "self"
    $P111."debug"("Want key")
  if_1311_end:
.annotate 'line', 427
    find_lex $P110, "$key"
    find_lex $P111, "%context"
    $P112 = $P110."to_pmc"($P111)
    set $P113, $P112[0]
    unless_null $P113, vivify_219
    new $P113, "Undef"
  vivify_219:
    store_lex "$key_pmc", $P113
.annotate 'line', 428
    find_lex $P1314, "%context"
    unless_null $P1314, vivify_220
    $P1314 = root_new ['parrot';'Hash']
  vivify_220:
    set $P110, $P1314["DEBUG"]
    unless_null $P110, vivify_221
    new $P110, "Undef"
  vivify_221:
    unless $P110, if_1313_end
    find_lex $P111, "self"
    $P111."debug"("Got key")
  if_1313_end:
.annotate 'line', 433
    find_lex $P1315, "%context"
    unless_null $P1315, vivify_222
    $P1315 = root_new ['parrot';'Hash']
  vivify_222:
    set $P110, $P1315["constants"]
    unless_null $P110, vivify_223
    new $P110, "Undef"
  vivify_223:
    store_lex "$constants", $P110
.annotate 'line', 424
    find_lex $P110, "$idx"
.annotate 'line', 435

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
.annotate 'line', 424
    find_lex $P110, "$idx"
    .return ($P110)
  control_1304:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Constant"],_)
    .param pmc param_1319
    .param pmc param_1320
.annotate 'file', ''
.annotate 'line', 451
    new $P1318, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1318, control_1317
    push_eh $P1318
    .lex "self", self
    .lex "$op", param_1319
    .lex "%context", param_1320
.annotate 'line', 452
    new $P107, "Undef"
    set $P1321, $P107
    .lex "$idx", $P1321
.annotate 'line', 453
    new $P108, "Undef"
    set $P1322, $P108
    .lex "$type", $P1322
.annotate 'line', 451
    find_lex $P109, "$idx"
.annotate 'line', 453
    find_lex $P109, "$op"
    $P110 = $P109."type"()
    store_lex "$type", $P110
.annotate 'line', 454
    find_lex $P110, "$type"
    set $S101, $P110
    iseq $I101, $S101, "ic"
    unless $I101, unless_1324
    new $P109, 'Integer'
    set $P109, $I101
    goto unless_1324_end
  unless_1324:
    find_lex $P111, "$type"
    set $S102, $P111
    iseq $I102, $S102, "kic"
    new $P109, 'Integer'
    set $P109, $I102
  unless_1324_end:
    if $P109, if_1323
.annotate 'line', 457
    find_lex $P112, "$type"
    set $S103, $P112
    iseq $I103, $S103, "nc"
    if $I103, if_1325
.annotate 'line', 461
    find_lex $P113, "self"
    $P113."panic"("NYI")
.annotate 'line', 460
    goto if_1325_end
  if_1325:
.annotate 'line', 458
    find_lex $P113, "$op"
    $P114 = $P113."value"()
    $P115 = "get_or_create_number"($P114)
    store_lex "$idx", $P115
  if_1325_end:
.annotate 'line', 457
    goto if_1323_end
  if_1323:
.annotate 'line', 455
    find_lex $P112, "$op"
    $P113 = $P112."value"()
    store_lex "$idx", $P113
  if_1323_end:
.annotate 'line', 464
    find_lex $P1327, "%context"
    unless_null $P1327, vivify_224
    $P1327 = root_new ['parrot';'Hash']
  vivify_224:
    set $P109, $P1327["DEBUG"]
    unless_null $P109, vivify_225
    new $P109, "Undef"
  vivify_225:
    unless $P109, if_1326_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Index "
    find_lex $P112, "$idx"
    concat $P113, $P111, $P112
    $P110."debug"($P113)
  if_1326_end:
.annotate 'line', 451
    find_lex $P109, "$idx"
    .return ($P109)
  control_1317:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("41_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"String"],_)
    .param pmc param_1331
    .param pmc param_1332
.annotate 'file', ''
.annotate 'line', 468
    .const 'Sub' $P1339 = "42_1312496167.40609" 
    capture_lex $P1339
    new $P1330, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1330, control_1329
    push_eh $P1330
    .lex "self", self
    .lex "$str", param_1331
    .lex "%context", param_1332
.annotate 'line', 469
    new $P107, "Undef"
    set $P1333, $P107
    .lex "$idx", $P1333
.annotate 'line', 470
    new $P108, "Undef"
    set $P1334, $P108
    .lex "$type", $P1334
.annotate 'line', 468
    find_lex $P109, "$idx"
.annotate 'line', 470
    find_lex $P109, "$str"
    $P110 = $P109."type"()
    store_lex "$type", $P110
.annotate 'line', 471
    find_lex $P109, "$type"
    set $S101, $P109
    isne $I101, $S101, "sc"
    unless $I101, if_1335_end
.annotate 'line', 472
    find_lex $P110, "self"
    $P110."panic"("attempt to pass a non-sc value off as a string")
  if_1335_end:
.annotate 'line', 474
    find_lex $P110, "$str"
    $S101 = $P110."encoding"()
    iseq $I101, $S101, "fixed_8"
    if $I101, if_1337
    new $P109, 'Integer'
    set $P109, $I101
    goto if_1337_end
  if_1337:
    find_lex $P111, "$str"
    $S102 = $P111."charset"()
    iseq $I102, $S102, "ascii"
    new $P109, 'Integer'
    set $P109, $I102
  if_1337_end:
    if $P109, if_1336
.annotate 'line', 477
    .const 'Sub' $P1339 = "42_1312496167.40609" 
    capture_lex $P1339
    $P1339()
    goto if_1336_end
  if_1336:
.annotate 'line', 475
    find_lex $P112, "$str"
    $P113 = $P112."value"()
    $P114 = "get_or_create_string"($P113)
    store_lex "$idx", $P114
  if_1336_end:
.annotate 'line', 468
    find_lex $P109, "$idx"
    .return ($P109)
  control_1329:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1338"  :anon :subid("42_1312496167.40609") :outer("41_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 479
    new $P112, "Undef"
    set $P1340, $P112
    .lex "$bb", $P1340
.annotate 'line', 480
    new $P113, "Undef"
    set $P1341, $P113
    .lex "$str_val", $P1341
.annotate 'line', 479
    new $P114, "ByteBuffer"
    store_lex "$bb", $P114
.annotate 'line', 480
    find_lex $P114, "$str"
    $P115 = $P114."value"()
    store_lex "$str_val", $P115
.annotate 'line', 481

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 489
    find_lex $P114, "$bb"
.annotate 'line', 490
    find_lex $P115, "$str"
    $P116 = $P115."encoding"()
    $P117 = $P114."get_string"($P116)
.annotate 'line', 489
    $P118 = "get_or_create_string"($P117)
    store_lex "$idx", $P118
.annotate 'line', 477
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("43_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Value"],_)
    .param pmc param_1345
    .param pmc param_1346
.annotate 'file', ''
.annotate 'line', 497
    new $P1344, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1344, control_1343
    push_eh $P1344
    .lex "self", self
    .lex "$val", param_1345
    .lex "%context", param_1346
.annotate 'line', 499
    new $P107, "Undef"
    set $P1347, $P107
    .lex "$orig", $P1347
    find_lex $P108, "self"
    find_lex $P109, "$val"
    $P110 = $P109."name"()
    find_lex $P111, "%context"
    $P112 = $P108."get_register"($P110, $P111)
    store_lex "$orig", $P112
.annotate 'line', 500
    find_lex $P108, "self"
    find_lex $P109, "$orig"
    find_lex $P110, "%context"
    $P111 = $P108."to_op"($P109, $P110)
.annotate 'line', 497
    .return ($P111)
  control_1343:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("44_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Register"],_)
    .param pmc param_1351
    .param pmc param_1352
.annotate 'file', ''
.annotate 'line', 503
    new $P1350, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1350, control_1349
    push_eh $P1350
    .lex "self", self
    .lex "$reg", param_1351
    .lex "%context", param_1352
.annotate 'line', 504
    find_lex $P107, "$reg"
    $P108 = $P107."regno"()
.annotate 'line', 503
    .return ($P108)
  control_1349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("45_1312496167.40609") :method :outer("11_1312496167.40609") :multi(_,["POST";"Label"],_)
    .param pmc param_1356
    .param pmc param_1357
.annotate 'file', ''
.annotate 'line', 507
    new $P1355, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1355, control_1354
    push_eh $P1355
    .lex "self", self
    .lex "$l", param_1356
    .lex "%context", param_1357
.annotate 'line', 509
    new $P107, "Undef"
    set $P1358, $P107
    .lex "$bc", $P1358
.annotate 'line', 510
    new $P108, "Undef"
    set $P1359, $P108
    .lex "$pos", $P1359
.annotate 'line', 509
    find_lex $P1360, "%context"
    unless_null $P1360, vivify_226
    $P1360 = root_new ['parrot';'Hash']
  vivify_226:
    set $P109, $P1360["bytecode"]
    unless_null $P109, vivify_227
    new $P109, "Undef"
  vivify_227:
    store_lex "$bc", $P109
.annotate 'line', 510
    find_lex $P109, "$bc"
    set $N101, $P109
    new $P110, 'Float'
    set $P110, $N101
    store_lex "$pos", $P110
.annotate 'line', 514
    find_lex $P109, "$l"
    $P110 = $P109."name"()
.annotate 'line', 513
    find_lex $P1361, "%context"
    unless_null $P1361, vivify_228
    $P1361 = root_new ['parrot';'Hash']
  vivify_228:
    set $P111, $P1361["opcode_offset"]
    unless_null $P111, vivify_229
    new $P111, "Undef"
  vivify_229:
    find_lex $P1362, "%context"
    unless_null $P1362, vivify_230
    $P1362 = root_new ['parrot';'Hash']
  vivify_230:
    set $P112, $P1362["opcode_fullname"]
    unless_null $P112, vivify_231
    new $P112, "Undef"
  vivify_231:
    $P113 = "hash"($P110 :named("name"), $P111 :named("offset"), $P112 :named("opname"))
    find_lex $P114, "$pos"
    find_lex $P1363, "%context"
    unless_null $P1363, vivify_232
    $P1363 = root_new ['parrot';'Hash']
    store_lex "%context", $P1363
  vivify_232:
    set $P1364, $P1363["labels_todo"]
    unless_null $P1364, vivify_233
    $P1364 = root_new ['parrot';'Hash']
    set $P1363["labels_todo"], $P1364
  vivify_233:
    set $P1364[$P114], $P113
.annotate 'line', 519
    find_lex $P1366, "%context"
    unless_null $P1366, vivify_234
    $P1366 = root_new ['parrot';'Hash']
  vivify_234:
    set $P109, $P1366["DEBUG"]
    unless_null $P109, vivify_235
    new $P109, "Undef"
  vivify_235:
    unless $P109, if_1365_end
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
    find_lex $P1367, "%context"
    unless_null $P1367, vivify_236
    $P1367 = root_new ['parrot';'Hash']
  vivify_236:
    set $P118, $P1367["opcode_offset"]
    unless_null $P118, vivify_237
    new $P118, "Undef"
  vivify_237:
    set $S102, $P118
    concat $P119, $P117, $S102
    $P110."debug"($P119)
  if_1365_end:
.annotate 'line', 507
    .return (0)
  control_1354:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("46_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1371
    .param pmc param_1372
    .param pmc param_1373
.annotate 'file', ''
.annotate 'line', 531
    .const 'Sub' $P1385 = "47_1312496167.40609" 
    capture_lex $P1385
    new $P1370, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1370, control_1369
    push_eh $P1370
    .lex "self", self
    .lex "$opname", param_1371
    .lex "@args", param_1372
    .lex "%context", param_1373
.annotate 'line', 532
    new $P107, "Undef"
    set $P1374, $P107
    .lex "$bc", $P1374
.annotate 'line', 533
    new $P108, "Undef"
    set $P1375, $P108
    .lex "$signature", $P1375
.annotate 'line', 534
    new $P109, "Undef"
    set $P1376, $P109
    .lex "$sig_idx", $P1376
.annotate 'line', 541
    $P1378 = root_new ['parrot';'ResizablePMCArray']
    set $P1377, $P1378
    .lex "@op", $P1377
.annotate 'line', 532
    find_lex $P1379, "%context"
    unless_null $P1379, vivify_238
    $P1379 = root_new ['parrot';'Hash']
  vivify_238:
    set $P110, $P1379["bytecode"]
    unless_null $P110, vivify_239
    new $P110, "Undef"
  vivify_239:
    store_lex "$bc", $P110
.annotate 'line', 533
    find_lex $P110, "self"
    find_lex $P111, "@args"
    find_lex $P112, "%context"
    $P113 = $P110."build_args_signature"($P111, $P112)
    store_lex "$signature", $P113
.annotate 'line', 534
    find_lex $P110, "$signature"
    $P111 = "get_or_create_pmc"($P110)
    store_lex "$sig_idx", $P111
.annotate 'line', 536
    find_lex $P1381, "%context"
    unless_null $P1381, vivify_240
    $P1381 = root_new ['parrot';'Hash']
  vivify_240:
    set $P110, $P1381["DEBUG"]
    unless_null $P110, vivify_241
    new $P110, "Undef"
  vivify_241:
    unless $P110, if_1380_end
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "Sig: "
    find_lex $P113, "$sig_idx"
    concat $P114, $P112, $P113
    $P111."debug"($P114)
  if_1380_end:
.annotate 'line', 538
    find_lex $P1383, "%context"
    unless_null $P1383, vivify_242
    $P1383 = root_new ['parrot';'Hash']
  vivify_242:
    set $P110, $P1383["DEBUG"]
    unless_null $P110, vivify_243
    new $P110, "Undef"
  vivify_243:
    unless $P110, if_1382_end
    find_lex $P111, "self"
    find_lex $P112, "$opname"
    $P111."debug"($P112)
  if_1382_end:
.annotate 'line', 541
    find_lex $P110, "$opname"
    find_lex $P111, "$sig_idx"
    $P112 = "list"($P110, $P111)
    store_lex "@op", $P112
.annotate 'line', 543
    find_lex $P111, "@args"
    defined $I101, $P111
    unless $I101, for_undef_244
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1394_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1394_test:
    unless $P110, loop1394_done
    shift $P112, $P110
  loop1394_redo:
    .const 'Sub' $P1385 = "47_1312496167.40609" 
    capture_lex $P1385
    $P1385($P112)
  loop1394_next:
    goto loop1394_test
  loop1394_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1394_next
    eq $P114, .CONTROL_LOOP_REDO, loop1394_redo
  loop1394_done:
    pop_eh 
  for_undef_244:
.annotate 'line', 554
    find_lex $P110, "$bc"
    find_lex $P111, "@op"
    push $P110, $P111
.annotate 'line', 531
    .return ($P110)
  control_1369:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1384"  :anon :subid("47_1312496167.40609") :outer("46_1312496167.40609")
    .param pmc param_1386
.annotate 'file', ''
.annotate 'line', 543
    .const 'Sub' $P1389 = "48_1312496167.40609" 
    capture_lex $P1389
    .lex "$arg", param_1386
.annotate 'line', 545
    find_lex $P113, "$arg"
    $P114 = $P113."modifier"()
    isa $I102, $P114, "Hash"
    unless $I102, if_1387_end
    .const 'Sub' $P1389 = "48_1312496167.40609" 
    capture_lex $P1389
    $P1389()
  if_1387_end:
.annotate 'line', 551
    find_lex $P113, "@op"
    find_lex $P114, "self"
    find_lex $P115, "$arg"
    find_lex $P116, "%context"
    $P117 = $P114."to_op"($P115, $P116)
    $P118 = $P113."push"($P117)
.annotate 'line', 543
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1388"  :anon :subid("48_1312496167.40609") :outer("47_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 546
    new $P115, "Undef"
    set $P1390, $P115
    .lex "$name", $P1390
    find_lex $P116, "$arg"
    $P117 = $P116."modifier"()
    set $P118, $P117["named"]
    unless_null $P118, vivify_245
    new $P118, "Undef"
  vivify_245:
    set $P1391, $P118
    defined $I1393, $P1391
    if $I1393, default_1392
    find_lex $P119, "$arg"
    $P120 = $P119."name"()
    set $P1391, $P120
  default_1392:
    store_lex "$name", $P1391
.annotate 'line', 547
    find_lex $P116, "@op"
.annotate 'line', 548
    find_lex $P117, "$name"
    $P118 = "get_or_create_string"($P117)
    $P119 = $P116."push"($P118)
.annotate 'line', 545
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("49_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1398
    .param pmc param_1399
.annotate 'file', ''
.annotate 'line', 557
    .const 'Sub' $P1417 = "52_1312496167.40609" 
    capture_lex $P1417
    .const 'Sub' $P1406 = "50_1312496167.40609" 
    capture_lex $P1406
    new $P1397, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1397, control_1396
    push_eh $P1397
    .lex "self", self
    .lex "@args", param_1398
    .lex "%context", param_1399
.annotate 'line', 558
    $P1401 = root_new ['parrot';'ResizablePMCArray']
    set $P1400, $P1401
    .lex "@sig", $P1400
.annotate 'line', 571
    new $P107, "Undef"
    set $P1402, $P107
    .lex "$elements", $P1402
.annotate 'line', 572
    new $P108, "Undef"
    set $P1403, $P108
    .lex "$signature", $P1403
.annotate 'line', 580
    new $P109, "Undef"
    set $P1404, $P109
    .lex "$idx", $P1404
.annotate 'line', 557
    find_lex $P110, "@sig"
.annotate 'line', 559
    find_lex $P111, "@args"
    defined $I101, $P111
    unless $I101, for_undef_246
    iter $P110, $P111
    new $P115, 'ExceptionHandler'
    set_label $P115, loop1414_handler
    $P115."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P115
  loop1414_test:
    unless $P110, loop1414_done
    shift $P112, $P110
  loop1414_redo:
    .const 'Sub' $P1406 = "50_1312496167.40609" 
    capture_lex $P1406
    $P1406($P112)
  loop1414_next:
    goto loop1414_test
  loop1414_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, 'type'
    eq $P116, .CONTROL_LOOP_NEXT, loop1414_next
    eq $P116, .CONTROL_LOOP_REDO, loop1414_redo
  loop1414_done:
    pop_eh 
  for_undef_246:
.annotate 'line', 571
    find_lex $P110, "@sig"
    set $N101, $P110
    new $P111, 'Float'
    set $P111, $N101
    store_lex "$elements", $P111
.annotate 'line', 572

        $P1415 = find_lex '$elements'
        $I99 = $P1415
        $P1415 = find_lex '$signature'
        $P1415 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1415
.annotate 'line', 580
    new $P110, "Integer"
    assign $P110, 0
    store_lex "$idx", $P110
.annotate 'line', 581
    find_lex $P111, "@sig"
    defined $I101, $P111
    unless $I101, for_undef_248
    iter $P110, $P111
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1421_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1421_test:
    unless $P110, loop1421_done
    shift $P112, $P110
  loop1421_redo:
    .const 'Sub' $P1417 = "52_1312496167.40609" 
    capture_lex $P1417
    $P1417($P112)
  loop1421_next:
    goto loop1421_test
  loop1421_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1421_next
    eq $P114, .CONTROL_LOOP_REDO, loop1421_redo
  loop1421_done:
    pop_eh 
  for_undef_248:
.annotate 'line', 557
    find_lex $P110, "$signature"
    .return ($P110)
  control_1396:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "_block1405"  :anon :subid("50_1312496167.40609") :outer("49_1312496167.40609")
    .param pmc param_1407
.annotate 'file', ''
.annotate 'line', 559
    .const 'Sub' $P1411 = "51_1312496167.40609" 
    capture_lex $P1411
    .lex "$arg", param_1407
.annotate 'line', 561
    new $P113, "Undef"
    set $P1408, $P113
    .lex "$s", $P1408
    find_lex $P114, "self"
    find_lex $P115, "$arg"
    find_lex $P116, "%context"
    $P117 = $P114."build_single_arg"($P115, $P116)
    store_lex "$s", $P117
.annotate 'line', 562
    find_lex $P115, "$s"
    isa $I102, $P115, "Integer"
    if $I102, if_1409
.annotate 'line', 566
    find_lex $P117, "$s"
    defined $I103, $P117
    unless $I103, for_undef_247
    iter $P116, $P117
    new $P120, 'ExceptionHandler'
    set_label $P120, loop1413_handler
    $P120."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P120
  loop1413_test:
    unless $P116, loop1413_done
    shift $P119, $P116
  loop1413_redo:
    .const 'Sub' $P1411 = "51_1312496167.40609" 
    capture_lex $P1411
    $P1411($P119)
  loop1413_next:
    goto loop1413_test
  loop1413_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, 'type'
    eq $P121, .CONTROL_LOOP_NEXT, loop1413_next
    eq $P121, .CONTROL_LOOP_REDO, loop1413_redo
  loop1413_done:
    pop_eh 
  for_undef_247:
.annotate 'line', 565
    set $P114, $P116
.annotate 'line', 562
    goto if_1409_end
  if_1409:
.annotate 'line', 563
    find_lex $P116, "@sig"
    find_lex $P117, "$s"
    $P118 = $P116."push"($P117)
.annotate 'line', 562
    set $P114, $P118
  if_1409_end:
.annotate 'line', 559
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1410"  :anon :subid("51_1312496167.40609") :outer("50_1312496167.40609")
    .param pmc param_1412
.annotate 'file', ''
.annotate 'line', 566
    .lex "$_", param_1412
    find_lex $P120, "@sig"
    find_lex $P121, "$_"
    $P122 = $P120."push"($P121)
    .return ($P122)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1416"  :anon :subid("52_1312496167.40609") :outer("49_1312496167.40609")
    .param pmc param_1418
.annotate 'file', ''
.annotate 'line', 581
    .lex "$val", param_1418
.annotate 'line', 582
    find_lex $P113, "$val"
    find_lex $P114, "$idx"
    set $I102, $P114
    find_lex $P1419, "$signature"
    unless_null $P1419, vivify_249
    $P1419 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1419
  vivify_249:
    set $P1419[$I102], $P113
.annotate 'line', 581
    find_lex $P113, "$idx"
    clone $P1420, $P113
    inc $P113
    .return ($P1420)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("53_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1425
    .param pmc param_1426
.annotate 'file', ''
.annotate 'line', 589
    new $P1424, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1424, control_1423
    push_eh $P1424
    .lex "self", self
    .lex "$arg", param_1425
    .lex "%context", param_1426
.annotate 'line', 592
    new $P107, "Undef"
    set $P1427, $P107
    .lex "$type", $P1427
.annotate 'line', 594
    new $P108, "Undef"
    set $P1428, $P108
    .lex "$res", $P1428
.annotate 'line', 608
    new $P109, "Undef"
    set $P1429, $P109
    .lex "$mod", $P1429
.annotate 'line', 592
    find_lex $P110, "$arg"
    $P111 = $P110."type"()
    set $P1430, $P111
    defined $I1432, $P1430
    if $I1432, default_1431
    find_lex $P112, "self"
    find_lex $P113, "$arg"
    $P114 = $P113."name"()
    find_lex $P115, "%context"
    $P116 = $P112."get_register"($P114, $P115)
    $P117 = $P116."type"()
    set $P1430, $P117
  default_1431:
    store_lex "$type", $P1430
.annotate 'line', 589
    find_lex $P110, "$res"
.annotate 'line', 597
    find_lex $P110, "$type"
    set $S101, $P110
    iseq $I101, $S101, "i"
    if $I101, if_1433
.annotate 'line', 598
    find_lex $P111, "$type"
    set $S102, $P111
    iseq $I102, $S102, "s"
    if $I102, if_1434
.annotate 'line', 599
    find_lex $P112, "$type"
    set $S103, $P112
    iseq $I103, $S103, "p"
    if $I103, if_1435
.annotate 'line', 600
    find_lex $P113, "$type"
    set $S104, $P113
    iseq $I104, $S104, "n"
    if $I104, if_1436
.annotate 'line', 602
    find_lex $P114, "$type"
    set $S105, $P114
    iseq $I105, $S105, "ic"
    if $I105, if_1437
.annotate 'line', 603
    find_lex $P115, "$type"
    set $S106, $P115
    iseq $I106, $S106, "sc"
    if $I106, if_1438
.annotate 'line', 604
    find_lex $P116, "$type"
    set $S107, $P116
    iseq $I107, $S107, "pc"
    if $I107, if_1439
.annotate 'line', 605
    find_lex $P117, "$type"
    set $S108, $P117
    iseq $I108, $S108, "nc"
    if $I108, if_1440
.annotate 'line', 606
    find_lex $P118, "self"
    new $P119, 'String'
    set $P119, "Unknown arg type '"
    find_lex $P120, "$type"
    concat $P121, $P119, $P120
    concat $P122, $P121, "'"
    $P118."panic"($P122)
    goto if_1440_end
  if_1440:
.annotate 'line', 605
    new $P118, "Integer"
    assign $P118, 3
    add $P119, $P118, 16
    store_lex "$res", $P119
  if_1440_end:
    goto if_1439_end
  if_1439:
.annotate 'line', 604
    new $P117, "Integer"
    assign $P117, 2
    add $P118, $P117, 16
    store_lex "$res", $P118
  if_1439_end:
    goto if_1438_end
  if_1438:
.annotate 'line', 603
    new $P116, "Integer"
    assign $P116, 1
    add $P117, $P116, 16
    store_lex "$res", $P117
  if_1438_end:
    goto if_1437_end
  if_1437:
.annotate 'line', 602
    new $P115, "Integer"
    assign $P115, 0
    add $P116, $P115, 16
    store_lex "$res", $P116
  if_1437_end:
    goto if_1436_end
  if_1436:
.annotate 'line', 600
    new $P114, "Integer"
    assign $P114, 3
    store_lex "$res", $P114
  if_1436_end:
    goto if_1435_end
  if_1435:
.annotate 'line', 599
    new $P113, "Integer"
    assign $P113, 2
    store_lex "$res", $P113
  if_1435_end:
    goto if_1434_end
  if_1434:
.annotate 'line', 598
    new $P112, "Integer"
    assign $P112, 1
    store_lex "$res", $P112
  if_1434_end:
    goto if_1433_end
  if_1433:
.annotate 'line', 597
    new $P111, "Integer"
    assign $P111, 0
    store_lex "$res", $P111
  if_1433_end:
.annotate 'line', 608
    find_lex $P110, "$arg"
    $P111 = $P110."modifier"()
    store_lex "$mod", $P111
.annotate 'line', 609
    find_lex $P110, "$mod"
    unless $P110, if_1441_end
.annotate 'line', 610
    find_lex $P111, "$mod"
    isa $I101, $P111, "Hash"
    if $I101, if_1442
.annotate 'line', 615
    find_lex $P112, "$mod"
    set $S101, $P112
    iseq $I102, $S101, "slurpy"
    if $I102, if_1443
.annotate 'line', 616
    find_lex $P113, "$mod"
    set $S102, $P113
    iseq $I103, $S102, "flat"
    if $I103, if_1444
.annotate 'line', 617
    find_lex $P114, "$mod"
    set $S103, $P114
    iseq $I104, $S103, "optional"
    if $I104, if_1445
.annotate 'line', 618
    find_lex $P115, "$mod"
    set $S104, $P115
    iseq $I105, $S104, "opt_flag"
    if $I105, if_1446
.annotate 'line', 619
    find_lex $P116, "$mod"
    set $S105, $P116
    iseq $I106, $S105, "slurpy named"
    if $I106, if_1447
.annotate 'line', 620
    find_lex $P117, "self"
    new $P118, 'String'
    set $P118, "Unsupported modifier "
    find_lex $P119, "$mod"
    concat $P120, $P118, $P119
    $P117."panic"($P120)
    goto if_1447_end
  if_1447:
.annotate 'line', 619
    find_lex $P117, "$res"
    add $P118, $P117, 32
    add $P119, $P118, 512
    store_lex "$res", $P119
  if_1447_end:
    goto if_1446_end
  if_1446:
.annotate 'line', 618
    find_lex $P116, "$res"
    add $P117, $P116, 256
    store_lex "$res", $P117
  if_1446_end:
    goto if_1445_end
  if_1445:
.annotate 'line', 617
    find_lex $P115, "$res"
    add $P116, $P115, 128
    store_lex "$res", $P116
  if_1445_end:
    goto if_1444_end
  if_1444:
.annotate 'line', 616
    find_lex $P114, "$res"
    add $P115, $P114, 32
    store_lex "$res", $P115
  if_1444_end:
    goto if_1443_end
  if_1443:
.annotate 'line', 615
    find_lex $P113, "$res"
    add $P114, $P113, 32
    store_lex "$res", $P114
  if_1443_end:
    goto if_1442_end
  if_1442:
.annotate 'line', 613
    new $P112, "Integer"
    assign $P112, 1
    add $P113, $P112, 16
    add $P114, $P113, 512
    find_lex $P115, "$res"
    add $P116, $P115, 512
    $P117 = "list"($P114, $P116)
    store_lex "$res", $P117
  if_1442_end:
  if_1441_end:
.annotate 'line', 589
    find_lex $P110, "$res"
    .return ($P110)
  control_1423:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("54_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1451
.annotate 'file', ''
.annotate 'line', 631
    .const 'Sub' $P1453 = "55_1312496167.40609" 
    capture_lex $P1453
    new $P1450, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1450, control_1449
    push_eh $P1450
    .lex "self", self
    .lex "$post", param_1451
.annotate 'line', 632
    find_lex $P108, "$post"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_250
    iter $P107, $P109
    new $P112, 'ExceptionHandler'
    set_label $P112, loop1456_handler
    $P112."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P112
  loop1456_test:
    unless $P107, loop1456_done
    shift $P110, $P107
  loop1456_redo:
    .const 'Sub' $P1453 = "55_1312496167.40609" 
    capture_lex $P1453
    $P1453($P110)
  loop1456_next:
    goto loop1456_test
  loop1456_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P113, exception, 'type'
    eq $P113, .CONTROL_LOOP_NEXT, loop1456_next
    eq $P113, .CONTROL_LOOP_REDO, loop1456_redo
  loop1456_done:
    pop_eh 
  for_undef_250:
.annotate 'line', 631
    .return ($P107)
  control_1449:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1452"  :anon :subid("55_1312496167.40609") :outer("54_1312496167.40609")
    .param pmc param_1454
.annotate 'file', ''
.annotate 'line', 632
    .lex "$sub", param_1454
.annotate 'line', 634
    find_lex $P112, "$sub"
    get_hll_global $P113, ["POST"], "Sub"
    $P114 = $P112."isa"($P113)
    if $P114, if_1455
    set $P111, $P114
    goto if_1455_end
  if_1455:
    find_lex $P115, "$post"
    find_lex $P116, "$sub"
    $P117 = $P116."full_name"()
    find_lex $P118, "$sub"
    $P119 = $P115."sub"($P117, $P118)
    set $P111, $P119
  if_1455_end:
.annotate 'line', 632
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("56_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1460
    .param pmc param_1461
.annotate 'file', ''
.annotate 'line', 639
    new $P1459, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1459, control_1458
    push_eh $P1459
    .lex "self", self
    .lex "$sub", param_1460
    .lex "%context", param_1461
.annotate 'line', 647
    new $P107, "Undef"
    set $P1462, $P107
    .lex "$res", $P1462
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$res", $P108
.annotate 'line', 648
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 1
    find_lex $P110, "$sub"
    $N101 = $P110."outer"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 649
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 8
    find_lex $P110, "$sub"
    $N101 = $P110."anon"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 650
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 16
    find_lex $P110, "$sub"
    $N101 = $P110."main"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 651
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 32
    find_lex $P110, "$sub"
    $N101 = $P110."load"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 652
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 64
    find_lex $P110, "$sub"
    $N101 = $P110."immediate"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 653
    find_lex $P108, "$res"
    new $P109, "Integer"
    assign $P109, 128
    find_lex $P110, "$sub"
    $N101 = $P110."postcomp"()
    mul $P111, $P109, $N101
    add $P112, $P108, $P111
    store_lex "$res", $P112
.annotate 'line', 655
    find_lex $P1464, "%context"
    unless_null $P1464, vivify_251
    $P1464 = root_new ['parrot';'Hash']
  vivify_251:
    set $P108, $P1464["DEBUG"]
    unless_null $P108, vivify_252
    new $P108, "Undef"
  vivify_252:
    unless $P108, if_1463_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "pf_flags "
    find_lex $P111, "$res"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1463_end:
.annotate 'line', 639
    find_lex $P108, "$res"
    .return ($P108)
  control_1458:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("57_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1468
    .param pmc param_1469
.annotate 'file', ''
.annotate 'line', 660
    new $P1467, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1467, control_1466
    push_eh $P1467
    .lex "self", self
    .lex "$sub", param_1468
    .lex "%context", param_1469
.annotate 'line', 665
    new $P107, "Undef"
    set $P1470, $P107
    .lex "$res", $P1470
    new $P108, "Integer"
    assign $P108, 0
    store_lex "$res", $P108
.annotate 'line', 666
    find_lex $P108, "$sub"
    $P109 = $P108."vtable"()
    unless $P109, if_1471_end
    find_lex $P110, "$res"
    add $P111, $P110, 2
    store_lex "$res", $P111
  if_1471_end:
.annotate 'line', 667
    find_lex $P108, "$sub"
    $P109 = $P108."is_method"()
    unless $P109, if_1472_end
    find_lex $P110, "$res"
    add $P111, $P110, 4
    store_lex "$res", $P111
  if_1472_end:
.annotate 'line', 668
    find_lex $P108, "$sub"
    $P109 = $P108."is_init"()
    unless $P109, if_1473_end
    find_lex $P110, "$res"
    add $P111, $P110, 1024
    store_lex "$res", $P111
  if_1473_end:
.annotate 'line', 669
    find_lex $P108, "$sub"
    $P109 = $P108."nsentry"()
    unless $P109, if_1474_end
    find_lex $P110, "$res"
    add $P111, $P110, 2048
    store_lex "$res", $P111
  if_1474_end:
.annotate 'line', 671
    find_lex $P1476, "%context"
    unless_null $P1476, vivify_253
    $P1476 = root_new ['parrot';'Hash']
  vivify_253:
    set $P108, $P1476["DEBUG"]
    unless_null $P108, vivify_254
    new $P108, "Undef"
  vivify_254:
    unless $P108, if_1475_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "comp_flags "
    find_lex $P111, "$res"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1475_end:
.annotate 'line', 660
    find_lex $P108, "$res"
    .return ($P108)
  control_1466:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("58_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1480
    .param pmc param_1481
    .param pmc param_1482
    .param pmc param_1483
.annotate 'file', ''
.annotate 'line', 676
    .const 'Sub' $P1487 = "59_1312496167.40609" 
    capture_lex $P1487
    new $P1479, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1479, control_1478
    push_eh $P1479
    .lex "self", self
    .lex "$sub", param_1480
    .lex "$labels_todo", param_1481
    .lex "$bc", param_1482
    .lex "%context", param_1483
.annotate 'line', 677
    find_lex $P1485, "%context"
    unless_null $P1485, vivify_255
    $P1485 = root_new ['parrot';'Hash']
  vivify_255:
    set $P107, $P1485["DEBUG"]
    unless_null $P107, vivify_256
    new $P107, "Undef"
  vivify_256:
    unless $P107, if_1484_end
    find_lex $P108, "self"
    $P108."debug"("Fixup labels")
  if_1484_end:
.annotate 'line', 678
    find_lex $P108, "$labels_todo"
    defined $I101, $P108
    unless $I101, for_undef_257
    iter $P107, $P108
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1504_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1504_test:
    unless $P107, loop1504_done
    shift $P109, $P107
  loop1504_redo:
    .const 'Sub' $P1487 = "59_1312496167.40609" 
    capture_lex $P1487
    $P1487($P109)
  loop1504_next:
    goto loop1504_test
  loop1504_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1504_next
    eq $P115, .CONTROL_LOOP_REDO, loop1504_redo
  loop1504_done:
    pop_eh 
  for_undef_257:
.annotate 'line', 676
    .return ($P107)
  control_1478:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1486"  :anon :subid("59_1312496167.40609") :outer("58_1312496167.40609")
    .param pmc param_1488
.annotate 'file', ''
.annotate 'line', 678
    .lex "$kv", param_1488
.annotate 'line', 679
    new $P110, "Undef"
    set $P1489, $P110
    .lex "$offset", $P1489
.annotate 'line', 680
    $P1491 = root_new ['parrot';'Hash']
    set $P1490, $P1491
    .lex "%todo", $P1490
.annotate 'line', 683
    new $P111, "Undef"
    set $P1492, $P111
    .lex "$op", $P1492
.annotate 'line', 686
    new $P112, "Undef"
    set $P1493, $P112
    .lex "$delta", $P1493
.annotate 'line', 679
    find_lex $P113, "$kv"
    $P114 = $P113."key"()
    store_lex "$offset", $P114
.annotate 'line', 680
    find_lex $P113, "$kv"
    $P114 = $P113."value"()
    store_lex "%todo", $P114
.annotate 'line', 681
    find_lex $P1495, "%context"
    unless_null $P1495, vivify_258
    $P1495 = root_new ['parrot';'Hash']
  vivify_258:
    set $P113, $P1495["DEBUG"]
    unless_null $P113, vivify_259
    new $P113, "Undef"
  vivify_259:
    unless $P113, if_1494_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Fixing '"
    find_lex $P1496, "%todo"
    unless_null $P1496, vivify_260
    $P1496 = root_new ['parrot';'Hash']
  vivify_260:
    set $P116, $P1496["name"]
    unless_null $P116, vivify_261
    new $P116, "Undef"
  vivify_261:
    set $S101, $P116
    concat $P117, $P115, $S101
    concat $P118, $P117, "' from op "
    find_lex $P1497, "%todo"
    unless_null $P1497, vivify_262
    $P1497 = root_new ['parrot';'Hash']
  vivify_262:
    set $P119, $P1497["opname"]
    unless_null $P119, vivify_263
    new $P119, "Undef"
  vivify_263:
    set $S102, $P119
    concat $P120, $P118, $S102
    concat $P121, $P120, " at "
    find_lex $P122, "$offset"
    set $S103, $P122
    concat $P123, $P121, $S103
    $P114."debug"($P123)
  if_1494_end:
.annotate 'line', 683
    find_lex $P1498, "%todo"
    unless_null $P1498, vivify_264
    $P1498 = root_new ['parrot';'Hash']
  vivify_264:
    set $P113, $P1498["opname"]
    unless_null $P113, vivify_265
    new $P113, "Undef"
  vivify_265:
    set $S101, $P113
    find_lex $P114, "$bc"
    $P115 = $P114."opmap"()
    set $P116, $P115[$S101]
    unless_null $P116, vivify_266
    new $P116, "Undef"
  vivify_266:
    store_lex "$op", $P116
.annotate 'line', 684
    find_lex $P1500, "%context"
    unless_null $P1500, vivify_267
    $P1500 = root_new ['parrot';'Hash']
  vivify_267:
    set $P113, $P1500["DEBUG"]
    unless_null $P113, vivify_268
    new $P113, "Undef"
  vivify_268:
    unless $P113, if_1499_end
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Op length is "
    find_lex $P116, "$op"
    $P117 = $P116."length"()
    set $S101, $P117
    concat $P116, $P115, $S101
    $P114."debug"($P116)
  if_1499_end:
.annotate 'line', 686
    find_lex $P113, "$sub"
    find_lex $P1501, "%todo"
    unless_null $P1501, vivify_269
    $P1501 = root_new ['parrot';'Hash']
  vivify_269:
    set $P114, $P1501["name"]
    unless_null $P114, vivify_270
    new $P114, "Undef"
  vivify_270:
    $P115 = $P113."label"($P114)
    $P116 = $P115."position"()
    find_lex $P1502, "%todo"
    unless_null $P1502, vivify_271
    $P1502 = root_new ['parrot';'Hash']
  vivify_271:
    set $P117, $P1502["offset"]
    unless_null $P117, vivify_272
    new $P117, "Undef"
  vivify_272:
    sub $P118, $P116, $P117
    store_lex "$delta", $P118
.annotate 'line', 688
    find_lex $P113, "$delta"
    find_lex $P114, "$offset"
    find_lex $P115, "$op"
    $N101 = $P115."length"()
    add $P116, $P114, $N101
    set $I102, $P116
    find_lex $P1503, "$bc"
    unless_null $P1503, vivify_273
    $P1503 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1503
  vivify_273:
    set $P1503[$I102], $P113
.annotate 'line', 678
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("60_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1508
    .param pmc param_1509
.annotate 'file', ''
.annotate 'line', 693
    new $P1507, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1507, control_1506
    push_eh $P1507
    .lex "self", self
    .lex "$name", param_1508
    .lex "%context", param_1509
.annotate 'line', 694
    new $P107, "Undef"
    set $P1510, $P107
    .lex "$reg", $P1510
    find_lex $P1511, "%context"
    unless_null $P1511, vivify_274
    $P1511 = root_new ['parrot';'Hash']
  vivify_274:
    set $P108, $P1511["sub"]
    unless_null $P108, vivify_275
    new $P108, "Undef"
  vivify_275:
    find_lex $P109, "$name"
    $P110 = $P108."symbol"($P109)
    store_lex "$reg", $P110
.annotate 'line', 695
    find_lex $P108, "$reg"
    isfalse $I101, $P108
    unless $I101, if_1512_end
.annotate 'line', 696
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Register '"
    find_lex $P111, "$name"
    set $S101, $P111
    concat $P112, $P110, $S101
    concat $P113, $P112, "' not predeclared in '"
    find_lex $P1513, "%context"
    unless_null $P1513, vivify_276
    $P1513 = root_new ['parrot';'Hash']
  vivify_276:
    set $P114, $P1513["sub"]
    unless_null $P114, vivify_277
    new $P114, "Undef"
  vivify_277:
    $P115 = $P114."name"()
    set $S102, $P115
    concat $P114, $P113, $S102
    concat $P116, $P114, "'"
    $P109."panic"($P116)
  if_1512_end:
.annotate 'line', 693
    find_lex $P108, "$reg"
    .return ($P108)
  control_1506:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "debug"  :subid("61_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1517 :slurpy
.annotate 'file', ''
.annotate 'line', 701
    .const 'Sub' $P1519 = "62_1312496167.40609" 
    capture_lex $P1519
    new $P1516, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1516, control_1515
    push_eh $P1516
    .lex "self", self
    .lex "@args", param_1517
.annotate 'line', 702
    find_lex $P108, "@args"
    defined $I101, $P108
    unless $I101, for_undef_278
    iter $P107, $P108
    new $P110, 'ExceptionHandler'
    set_label $P110, loop1521_handler
    $P110."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P110
  loop1521_test:
    unless $P107, loop1521_done
    shift $P109, $P107
  loop1521_redo:
    .const 'Sub' $P1519 = "62_1312496167.40609" 
    capture_lex $P1519
    $P1519($P109)
  loop1521_next:
    goto loop1521_test
  loop1521_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, .CONTROL_LOOP_NEXT, loop1521_next
    eq $P111, .CONTROL_LOOP_REDO, loop1521_redo
  loop1521_done:
    pop_eh 
  for_undef_278:
.annotate 'line', 701
    .return ($P107)
  control_1515:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1518"  :anon :subid("62_1312496167.40609") :outer("61_1312496167.40609")
    .param pmc param_1520
.annotate 'file', ''
.annotate 'line', 702
    .lex "$_", param_1520
.annotate 'line', 703
    find_lex $P110, "$_"
    say $P110
.annotate 'line', 702
    .return ()
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("63_1312496167.40609") :method :outer("11_1312496167.40609")
    .param pmc param_1525
    .param pmc param_1526
.annotate 'file', ''
.annotate 'line', 707
    new $P1524, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1524, control_1523
    push_eh $P1524
    .lex "self", self
    .lex "$past", param_1525
    .lex "%adverbs", param_1526
.annotate 'line', 708
    $P1528 = root_new ['parrot';'Hash']
    set $P1527, $P1528
    .lex "%context", $P1527
.annotate 'line', 716
    new $P107, "Undef"
    set $P1529, $P107
    .lex "$pfdir", $P1529
.annotate 'line', 707
    find_lex $P108, "%context"
.annotate 'line', 710
    find_lex $P108, "self"
    find_lex $P1530, "%context"
    unless_null $P1530, vivify_279
    $P1530 = root_new ['parrot';'Hash']
    store_lex "%context", $P1530
  vivify_279:
    set $P1530["compiler"], $P108
.annotate 'line', 712
    new $P108, "Packfile"
    find_lex $P1531, "%context"
    unless_null $P1531, vivify_280
    $P1531 = root_new ['parrot';'Hash']
    store_lex "%context", $P1531
  vivify_280:
    set $P1531["packfile"], $P108
.annotate 'line', 716
    find_lex $P1532, "%context"
    unless_null $P1532, vivify_281
    $P1532 = root_new ['parrot';'Hash']
  vivify_281:
    set $P108, $P1532["packfile"]
    unless_null $P108, vivify_282
    new $P108, "Undef"
  vivify_282:
    $P109 = $P108."get_directory"()
    store_lex "$pfdir", $P109
.annotate 'line', 719
    new $P108, "PackfileConstantTable"
    find_lex $P1533, "%context"
    unless_null $P1533, vivify_283
    $P1533 = root_new ['parrot';'Hash']
    store_lex "%context", $P1533
  vivify_283:
    set $P1533["constants"], $P108
.annotate 'line', 722
    new $P108, "FixedIntegerArray"
    find_lex $P1534, "%context"
    unless_null $P1534, vivify_284
    $P1534 = root_new ['parrot';'Hash']
    store_lex "%context", $P1534
  vivify_284:
    set $P1535, $P1534["constants"]
    unless_null $P1535, vivify_285
    $P1535 = root_new ['parrot';'ResizablePMCArray']
    set $P1534["constants"], $P1535
  vivify_285:
    set $P1535[0], $P108
.annotate 'line', 725
    find_lex $P1536, "%context"
    unless_null $P1536, vivify_286
    $P1536 = root_new ['parrot';'Hash']
  vivify_286:
    set $P108, $P1536["constants"]
    unless_null $P108, vivify_287
    new $P108, "Undef"
  vivify_287:
    find_lex $P1537, "$pfdir"
    unless_null $P1537, vivify_288
    $P1537 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1537
  vivify_288:
    set $P1537["CONSTANTS_hello.pir"], $P108
.annotate 'line', 728
    new $P108, "PackfileBytecodeSegment"
    find_lex $P1538, "%context"
    unless_null $P1538, vivify_289
    $P1538 = root_new ['parrot';'Hash']
    store_lex "%context", $P1538
  vivify_289:
    set $P1538["bytecode"], $P108
.annotate 'line', 729
    find_lex $P1539, "%context"
    unless_null $P1539, vivify_290
    $P1539 = root_new ['parrot';'Hash']
  vivify_290:
    set $P108, $P1539["bytecode"]
    unless_null $P108, vivify_291
    new $P108, "Undef"
  vivify_291:
    $P108."main_sub"(-1)
.annotate 'line', 731
    new $P108, "Integer"
    assign $P108, 0
    find_lex $P1540, "%context"
    unless_null $P1540, vivify_292
    $P1540 = root_new ['parrot';'Hash']
    store_lex "%context", $P1540
  vivify_292:
    set $P1540["got_main_sub"], $P108
.annotate 'line', 734
    find_lex $P1541, "%context"
    unless_null $P1541, vivify_293
    $P1541 = root_new ['parrot';'Hash']
  vivify_293:
    set $P108, $P1541["bytecode"]
    unless_null $P108, vivify_294
    new $P108, "Undef"
  vivify_294:
    find_lex $P1542, "$pfdir"
    unless_null $P1542, vivify_295
    $P1542 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1542
  vivify_295:
    set $P1542["BYTECODE_hello.pir"], $P108
.annotate 'line', 743
    get_hll_global $P108, ["POST"], "VanillaAllocator"
    $P109 = $P108."new"()
    find_lex $P1543, "%context"
    unless_null $P1543, vivify_296
    $P1543 = root_new ['parrot';'Hash']
    store_lex "%context", $P1543
  vivify_296:
    set $P1543["regalloc"], $P109
.annotate 'line', 745
    find_lex $P1544, "%adverbs"
    unless_null $P1544, vivify_297
    $P1544 = root_new ['parrot';'Hash']
  vivify_297:
    set $P108, $P1544["debug"]
    unless_null $P108, vivify_298
    new $P108, "Undef"
  vivify_298:
    find_lex $P1545, "%context"
    unless_null $P1545, vivify_299
    $P1545 = root_new ['parrot';'Hash']
    store_lex "%context", $P1545
  vivify_299:
    set $P1545["DEBUG"], $P108
.annotate 'line', 707
    find_lex $P108, "%context"
    .return ($P108)
  control_1523:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1547" :load :anon :subid("64_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1549 = "11_1312496167.40609" 
    $P107 = $P1549()
    .return ($P107)
.end


.namespace []
.sub "_block1550" :load :anon :subid("65_1312496167.40609")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1552 = "10_1312496167.40609" 
    $P101 = $P1552()
    .return ($P101)
.end

