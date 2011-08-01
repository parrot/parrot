
.namespace []
.sub "_block1000"  :anon :subid("10_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312182912.80612" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312182912.80612" 
    capture_lex $P1003
    $P101 = $P1003()
.annotate 'line', 1
    .return ($P101)
    .const 'Sub' $P1480 = "55_1312182912.80612" 
    .return ($P1480)
.end


.namespace []
.sub "" :load :init :subid("post56") :outer("10_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312182912.80612" 
    .local pmc block
    set block, $P1001
    $P1482 = get_root_global ["parrot"], "P6metaclass"
    $P1482."new_class"("POST::PBCCompiler", "PCT::HLLCompiler" :named("parent"))
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1002"  :subid("11_1312182912.80612") :outer("10_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 16
    .const 'Sub' $P1451 = "53_1312182912.80612" 
    capture_lex $P1451
    .const 'Sub' $P1443 = "51_1312182912.80612" 
    capture_lex $P1443
    .const 'Sub' $P1434 = "50_1312182912.80612" 
    capture_lex $P1434
    .const 'Sub' $P1406 = "48_1312182912.80612" 
    capture_lex $P1406
    .const 'Sub' $P1394 = "47_1312182912.80612" 
    capture_lex $P1394
    .const 'Sub' $P1386 = "46_1312182912.80612" 
    capture_lex $P1386
    .const 'Sub' $P1377 = "44_1312182912.80612" 
    capture_lex $P1377
    .const 'Sub' $P1351 = "43_1312182912.80612" 
    capture_lex $P1351
    .const 'Sub' $P1324 = "39_1312182912.80612" 
    capture_lex $P1324
    .const 'Sub' $P1295 = "36_1312182912.80612" 
    capture_lex $P1295
    .const 'Sub' $P1280 = "35_1312182912.80612" 
    capture_lex $P1280
    .const 'Sub' $P1275 = "34_1312182912.80612" 
    capture_lex $P1275
    .const 'Sub' $P1269 = "33_1312182912.80612" 
    capture_lex $P1269
    .const 'Sub' $P1253 = "31_1312182912.80612" 
    capture_lex $P1253
    .const 'Sub' $P1240 = "30_1312182912.80612" 
    capture_lex $P1240
    .const 'Sub' $P1227 = "29_1312182912.80612" 
    capture_lex $P1227
    .const 'Sub' $P1163 = "25_1312182912.80612" 
    capture_lex $P1163
    .const 'Sub' $P1148 = "23_1312182912.80612" 
    capture_lex $P1148
    .const 'Sub' $P1139 = "21_1312182912.80612" 
    capture_lex $P1139
    .const 'Sub' $P1111 = "18_1312182912.80612" 
    capture_lex $P1111
    .const 'Sub' $P1023 = "15_1312182912.80612" 
    capture_lex $P1023
    .const 'Sub' $P1018 = "14_1312182912.80612" 
    capture_lex $P1018
    .const 'Sub' $P1004 = "12_1312182912.80612" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 607
    .const 'Sub' $P1451 = "53_1312182912.80612" 
    newclosure $P1475, $P1451
.annotate 'line', 16
    .return ($P1475)
    .const 'Sub' $P1477 = "54_1312182912.80612" 
    .return ($P1477)
.end


.namespace ["POST";"PBCCompiler"]
.sub "" :load :init :subid("post57") :outer("11_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312182912.80612" 
    .local pmc block
    set block, $P1003
.annotate 'line', 17
    get_hll_global $P101, ["POST"], "PBCCompiler"
    $P101."language"("newPOST")
.annotate 'line', 18
    get_hll_global $P101, ["POST"], "PBCCompiler"
    new $P102, "ResizablePMCArray"
    push $P102, "pbc"
    push $P102, "mainpmc"
    $P101."language"($P102)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("12_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1007
    .param pmc param_1008
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 36
    .const 'Sub' $P1014 = "13_1312182912.80612" 
    capture_lex $P1014
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    .lex "$post", param_1007
    .lex "%adverbs", param_1008
.annotate 'line', 40
    $P1010 = root_new ['parrot';'Hash']
    set $P1009, $P1010
    .lex "%context", $P1009
    find_lex $P100, "self"
    find_lex $P101, "$post"
    find_lex $P102, "%adverbs"
    $P103 = $P100."create_context"($P101, $P102)
    store_lex "%context", $P103
.annotate 'line', 41
    new $P100, "Integer"
    assign $P100, 0
    find_lex $P1011, "%context"
    unless_null $P1011, vivify_58
    $P1011 = root_new ['parrot';'Hash']
    store_lex "%context", $P1011
  vivify_58:
    set $P1011["DEBUG"], $P100
.annotate 'line', 43
    find_lex $P100, "$post"
    find_lex $P1012, "%context"
    unless_null $P1012, vivify_59
    $P1012 = root_new ['parrot';'Hash']
    store_lex "%context", $P1012
  vivify_59:
    set $P1012["pir_file"], $P100
.annotate 'line', 48
    find_lex $P100, "self"
    find_lex $P101, "$post"
    $P100."enumerate_subs"($P101)
.annotate 'line', 50
    find_lex $P101, "$post"
    $P102 = $P101."list"()
    defined $I100, $P102
    unless $I100, for_undef_60
    iter $P100, $P102
    new $P104, 'ExceptionHandler'
    set_label $P104, loop1016_handler
    $P104."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P104
  loop1016_test:
    unless $P100, loop1016_done
    shift $P103, $P100
  loop1016_redo:
    .const 'Sub' $P1014 = "13_1312182912.80612" 
    capture_lex $P1014
    $P1014($P103)
  loop1016_next:
    goto loop1016_test
  loop1016_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, 'type'
    eq $P105, .CONTROL_LOOP_NEXT, loop1016_next
    eq $P105, .CONTROL_LOOP_REDO, loop1016_redo
  loop1016_done:
    pop_eh 
  for_undef_60:
.annotate 'line', 36
    find_lex $P1017, "%context"
    unless_null $P1017, vivify_61
    $P1017 = root_new ['parrot';'Hash']
  vivify_61:
    set $P100, $P1017["packfile"]
    unless_null $P100, vivify_62
    new $P100, "Undef"
  vivify_62:
    .return ($P100)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1013"  :anon :subid("13_1312182912.80612") :outer("12_1312182912.80612")
    .param pmc param_1015
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 50
    .lex "$s", param_1015
.annotate 'line', 51
    find_lex $P104, "self"
    find_lex $P105, "$s"
    find_lex $P106, "%context"
    $P107 = $P104."to_pbc"($P105, $P106)
.annotate 'line', 50
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("14_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["Undef"],_)
    .param pmc param_1021
    .param pmc param_1022
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 60
    new $P1020, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1020, control_1019
    push_eh $P1020
    .lex "self", self
    .lex "$what", param_1021
    .lex "%context", param_1022
    .return ()
  control_1019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("15_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Sub"],_)
    .param pmc param_1026
    .param pmc param_1027
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 64
    .const 'Sub' $P1081 = "17_1312182912.80612" 
    capture_lex $P1081
    .const 'Sub' $P1060 = "16_1312182912.80612" 
    capture_lex $P1060
    new $P1025, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1025, control_1024
    push_eh $P1025
    .lex "self", self
    .lex "$sub", param_1026
    .lex "%context", param_1027
.annotate 'line', 69
    $P1029 = root_new ['parrot';'ResizablePMCArray']
    set $P1028, $P1029
    .lex "@n_regs_used", $P1028
.annotate 'line', 73
    new $P100, "Undef"
    set $P1030, $P100
    .lex "$bc", $P1030
.annotate 'line', 79
    new $P101, "Undef"
    set $P1031, $P101
    .lex "$sb", $P1031
.annotate 'line', 81
    new $P102, "Undef"
    set $P1032, $P102
    .lex "$subname", $P1032
.annotate 'line', 86
    new $P103, "Undef"
    set $P1033, $P103
    .lex "$start_offset", $P1033
.annotate 'line', 115
    new $P104, "Undef"
    set $P1034, $P104
    .lex "$end_offset", $P1034
.annotate 'line', 122
    $P1036 = root_new ['parrot';'Hash']
    set $P1035, $P1036
    .lex "%sub", $P1035
.annotate 'line', 149
    new $P105, "Undef"
    set $P1037, $P105
    .lex "$idx", $P1037
.annotate 'line', 66
    find_lex $P106, "$sub"
    find_lex $P1038, "%context"
    unless_null $P1038, vivify_63
    $P1038 = root_new ['parrot';'Hash']
    store_lex "%context", $P1038
  vivify_63:
    set $P1038["sub"], $P106
.annotate 'line', 69
    find_lex $P1039, "%context"
    unless_null $P1039, vivify_64
    $P1039 = root_new ['parrot';'Hash']
  vivify_64:
    set $P106, $P1039["regalloc"]
    unless_null $P106, vivify_65
    new $P106, "Undef"
  vivify_65:
    find_lex $P107, "$sub"
    $P108 = $P106."process"($P107)
    store_lex "@n_regs_used", $P108
.annotate 'line', 70
    find_lex $P1041, "%context"
    unless_null $P1041, vivify_66
    $P1041 = root_new ['parrot';'Hash']
  vivify_66:
    set $P106, $P1041["DEBUG"]
    unless_null $P106, vivify_67
    new $P106, "Undef"
  vivify_67:
    unless $P106, if_1040_end
    find_lex $P107, "self"
    new $P108, "String"
    assign $P108, "n_regs_used "
    find_lex $P109, "@n_regs_used"
    $S100 = $P109."join"("-")
    concat $P110, $P108, $S100
    $P107."debug"($P110)
  if_1040_end:
.annotate 'line', 71
    find_lex $P1043, "%context"
    unless_null $P1043, vivify_68
    $P1043 = root_new ['parrot';'Hash']
  vivify_68:
    set $P106, $P1043["DEBUG"]
    unless_null $P106, vivify_69
    new $P106, "Undef"
  vivify_69:
    unless $P106, if_1042_end
    find_lex $P107, "self"
    find_lex $P108, "$sub"
    $P107."dumper"($P108, "sub")
  if_1042_end:
.annotate 'line', 73
    find_lex $P1044, "%context"
    unless_null $P1044, vivify_70
    $P1044 = root_new ['parrot';'Hash']
  vivify_70:
    set $P106, $P1044["bytecode"]
    unless_null $P106, vivify_71
    new $P106, "Undef"
  vivify_71:
    store_lex "$bc", $P106
.annotate 'line', 76
    $P106 = "hash"()
    find_lex $P1045, "%context"
    unless_null $P1045, vivify_72
    $P1045 = root_new ['parrot';'Hash']
    store_lex "%context", $P1045
  vivify_72:
    set $P1045["labels_todo"], $P106
.annotate 'line', 79
    $P106 = "new"("StringBuilder")
    store_lex "$sb", $P106
.annotate 'line', 80
    find_lex $P106, "$sb"
    find_lex $P107, "$sub"
    $P108 = $P107."name"()
    set $S100, $P108
    $P106."push"($S100)
.annotate 'line', 81
    find_lex $P106, "$sb"
    set $S100, $P106
    new $P107, 'String'
    set $P107, $S100
    store_lex "$subname", $P107
.annotate 'line', 83
    find_lex $P1047, "%context"
    unless_null $P1047, vivify_73
    $P1047 = root_new ['parrot';'Hash']
  vivify_73:
    set $P106, $P1047["DEBUG"]
    unless_null $P106, vivify_74
    new $P106, "Undef"
  vivify_74:
    unless $P106, if_1046_end
    find_lex $P107, "self"
    new $P108, 'String'
    set $P108, "Emitting "
    find_lex $P109, "$subname"
    concat $P110, $P108, $P109
    $P107."debug"($P110)
  if_1046_end:
.annotate 'line', 84
    find_lex $P1048, "%context"
    unless_null $P1048, vivify_75
    $P1048 = root_new ['parrot';'Hash']
  vivify_75:
    set $P106, $P1048["constants"]
    unless_null $P106, vivify_76
    new $P106, "Undef"
  vivify_76:
    find_lex $P107, "$subname"
    $P106."get_or_create_string"($P107)
.annotate 'line', 86
    find_lex $P106, "$bc"
    set $N100, $P106
    new $P107, 'Float'
    set $P107, $N100
    store_lex "$start_offset", $P107
.annotate 'line', 87
    find_lex $P1050, "%context"
    unless_null $P1050, vivify_77
    $P1050 = root_new ['parrot';'Hash']
  vivify_77:
    set $P106, $P1050["DEBUG"]
    unless_null $P106, vivify_78
    new $P106, "Undef"
  vivify_78:
    unless $P106, if_1049_end
    find_lex $P107, "self"
    new $P108, 'String'
    set $P108, "From "
    find_lex $P109, "$start_offset"
    concat $P110, $P108, $P109
    $P107."debug"($P110)
  if_1049_end:
.annotate 'line', 90
    find_lex $P1052, "$sub"
    unless_null $P1052, vivify_79
    $P1052 = root_new ['parrot';'Hash']
  vivify_79:
    set $P106, $P1052["params"]
    unless_null $P106, vivify_80
    new $P106, "Undef"
  vivify_80:
    if $P106, unless_1051_end
    $P107 = "list"()
    find_lex $P1053, "$sub"
    unless_null $P1053, vivify_81
    $P1053 = root_new ['parrot';'Hash']
    store_lex "$sub", $P1053
  vivify_81:
    set $P1053["params"], $P107
  unless_1051_end:
.annotate 'line', 91
    find_lex $P106, "$sub"
    $P107 = $P106."is_method"()
    unless $P107, if_1054_end
    find_lex $P1055, "$sub"
    unless_null $P1055, vivify_82
    $P1055 = root_new ['parrot';'Hash']
  vivify_82:
    set $P108, $P1055["params"]
    unless_null $P108, vivify_83
    new $P108, "Undef"
  vivify_83:
    get_hll_global $P109, ["POST"], "Value"
    $P110 = $P109."new"("self" :named("name"))
    $P108."unshift"($P110)
  if_1054_end:
.annotate 'line', 93
    find_lex $P1057, "$sub"
    unless_null $P1057, vivify_84
    $P1057 = root_new ['parrot';'Hash']
  vivify_84:
    set $P106, $P1057["params"]
    unless_null $P106, vivify_85
    new $P106, "Undef"
  vivify_85:
    set $N100, $P106
    unless $N100, if_1056_end
.annotate 'line', 94
    find_lex $P107, "self"
    find_lex $P1058, "$sub"
    unless_null $P1058, vivify_86
    $P1058 = root_new ['parrot';'Hash']
  vivify_86:
    set $P108, $P1058["params"]
    unless_null $P108, vivify_87
    new $P108, "Undef"
  vivify_87:
    find_lex $P109, "%context"
    $P107."build_pcc_call"("get_params_pc", $P108, $P109)
  if_1056_end:
.annotate 'line', 98
    find_lex $P107, "$sub"
    $P108 = $P107."list"()
    defined $I100, $P108
    unless $I100, for_undef_88
    iter $P106, $P108
    new $P110, 'ExceptionHandler'
    set_label $P110, loop1062_handler
    $P110."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P110
  loop1062_test:
    unless $P106, loop1062_done
    shift $P109, $P106
  loop1062_redo:
    .const 'Sub' $P1060 = "16_1312182912.80612" 
    capture_lex $P1060
    $P1060($P109)
  loop1062_next:
    goto loop1062_test
  loop1062_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, .CONTROL_LOOP_NEXT, loop1062_next
    eq $P111, .CONTROL_LOOP_REDO, loop1062_redo
  loop1062_done:
    pop_eh 
  for_undef_88:
.annotate 'line', 102
    find_lex $P1064, "%context"
    unless_null $P1064, vivify_89
    $P1064 = root_new ['parrot';'Hash']
  vivify_89:
    set $P106, $P1064["DEBUG"]
    unless_null $P106, vivify_90
    new $P106, "Undef"
  vivify_90:
    unless $P106, if_1063_end
    find_lex $P107, "self"
    new $P108, 'String'
    set $P108, "Middle "
    find_lex $P109, "$bc"
    set $N100, $P109
    set $S100, $N100
    concat $P109, $P108, $S100
    $P107."debug"($P109)
  if_1063_end:
.annotate 'line', 105
    find_lex $P1066, "%context"
    unless_null $P1066, vivify_91
    $P1066 = root_new ['parrot';'Hash']
  vivify_91:
    set $P106, $P1066["DEBUG"]
    unless_null $P106, vivify_92
    new $P106, "Undef"
  vivify_92:
    unless $P106, if_1065_end
    find_lex $P107, "self"
    $P107."debug"("Emitting default return")
  if_1065_end:
.annotate 'line', 106
    find_lex $P106, "$bc"
.annotate 'line', 107
    new $P107, "ResizablePMCArray"
    push $P107, "set_returns_pc"
    push $P107, 0
    $P106."push"($P107)
.annotate 'line', 111
    find_lex $P106, "$bc"
    new $P107, "ResizablePMCArray"
    push $P107, "returncc"
    $P106."push"($P107)
.annotate 'line', 115
    find_lex $P106, "$bc"
    set $N100, $P106
    new $P107, 'Float'
    set $P107, $N100
    store_lex "$end_offset", $P107
.annotate 'line', 116
    find_lex $P1068, "%context"
    unless_null $P1068, vivify_93
    $P1068 = root_new ['parrot';'Hash']
  vivify_93:
    set $P106, $P1068["DEBUG"]
    unless_null $P106, vivify_94
    new $P106, "Undef"
  vivify_94:
    unless $P106, if_1067_end
    find_lex $P107, "self"
    new $P108, 'String'
    set $P108, "To "
    find_lex $P109, "$end_offset"
    concat $P110, $P108, $P109
    $P107."debug"($P110)
  if_1067_end:
.annotate 'line', 119
    find_lex $P106, "self"
    find_lex $P107, "$sub"
    find_lex $P1069, "%context"
    unless_null $P1069, vivify_95
    $P1069 = root_new ['parrot';'Hash']
  vivify_95:
    set $P108, $P1069["labels_todo"]
    unless_null $P108, vivify_96
    new $P108, "Undef"
  vivify_96:
    find_lex $P1070, "%context"
    unless_null $P1070, vivify_97
    $P1070 = root_new ['parrot';'Hash']
  vivify_97:
    set $P109, $P1070["bytecode"]
    unless_null $P109, vivify_98
    new $P109, "Undef"
  vivify_98:
    find_lex $P110, "%context"
    $P106."fixup_labels"($P107, $P108, $P109, $P110)
.annotate 'line', 122
    find_lex $P106, "$start_offset"
    find_lex $P107, "$end_offset"
    find_lex $P108, "$subname"
.annotate 'line', 127
    find_lex $P1072, "$sub"
    unless_null $P1072, vivify_99
    $P1072 = root_new ['parrot';'Hash']
  vivify_99:
    set $P109, $P1072["subid"]
    unless_null $P109, vivify_100
    new $P109, "Undef"
  vivify_100:
    set $P1071, $P109
    defined $I1074, $P1071
    if $I1074, default_1073
    find_lex $P110, "$subname"
    set $P1071, $P110
  default_1073:
.annotate 'line', 128
    find_lex $P111, "$sub"
    $P112 = $P111."nsentry"()
    set $P1075, $P112
    defined $I1077, $P1075
    if $I1077, default_1076
    find_lex $P113, "$subname"
    set $P1075, $P113
  default_1076:
.annotate 'line', 131
    find_lex $P115, "$sub"
    $P116 = $P115."is_method"()
    if $P116, if_1078
    new $P118, "String"
    assign $P118, ""
    set $P114, $P118
    goto if_1078_end
  if_1078:
    find_lex $P117, "$subname"
    set $P114, $P117
  if_1078_end:
.annotate 'line', 122
    find_lex $P119, "@n_regs_used"
.annotate 'line', 135
    find_lex $P120, "self"
    find_lex $P121, "$sub"
    find_lex $P122, "%context"
    $P123 = $P120."create_sub_pf_flags"($P121, $P122)
.annotate 'line', 136
    find_lex $P124, "self"
    find_lex $P125, "$sub"
    find_lex $P126, "%context"
    $P127 = $P124."create_sub_comp_flags"($P125, $P126)
.annotate 'line', 122
    $P128 = "hash"($P106 :named("start_offs"), $P107 :named("end_offs"), $P108 :named("name"), $P1071 :named("subid"), $P1075 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P114 :named("method_name"), $P119 :named("n_regs_used"), $P123 :named("pf_flags"), $P127 :named("comp_flags"))
    store_lex "%sub", $P128
.annotate 'line', 139
    find_lex $P106, "$sub"
    $P107 = $P106."namespace"()
    $P108 = "defined"($P107)
    unless $P108, if_1079_end
    .const 'Sub' $P1081 = "17_1312182912.80612" 
    capture_lex $P1081
    $P1081()
  if_1079_end:
.annotate 'line', 149
    find_lex $P106, "$sub"
    $P107 = $P106."constant_index"()
    store_lex "$idx", $P107
.annotate 'line', 150
    find_lex $P106, "$idx"
    $P107 = "defined"($P106)
    if $P107, if_1085
.annotate 'line', 155
    find_lex $P1090, "%context"
    unless_null $P1090, vivify_103
    $P1090 = root_new ['parrot';'Hash']
  vivify_103:
    set $P108, $P1090["constants"]
    unless_null $P108, vivify_104
    new $P108, "Undef"
  vivify_104:
    find_lex $P109, "%sub"
    $P110 = "new"("Sub", $P109)
    $P111 = $P108."push"($P110)
    store_lex "$idx", $P111
.annotate 'line', 156
    find_lex $P108, "$sub"
    find_lex $P109, "$idx"
    $P108."constant_index"($P109)
.annotate 'line', 157
    find_lex $P1092, "%context"
    unless_null $P1092, vivify_105
    $P1092 = root_new ['parrot';'Hash']
  vivify_105:
    set $P108, $P1092["DEBUG"]
    unless_null $P108, vivify_106
    new $P108, "Undef"
  vivify_106:
    unless $P108, if_1091_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Allocate new constant "
    find_lex $P111, "$idx"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1091_end:
.annotate 'line', 154
    goto if_1085_end
  if_1085:
.annotate 'line', 151
    find_lex $P1087, "%context"
    unless_null $P1087, vivify_107
    $P1087 = root_new ['parrot';'Hash']
  vivify_107:
    set $P108, $P1087["DEBUG"]
    unless_null $P108, vivify_108
    new $P108, "Undef"
  vivify_108:
    unless $P108, if_1086_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "Reusing old constant "
    find_lex $P111, "$idx"
    concat $P112, $P110, $P111
    $P109."debug"($P112)
  if_1086_end:
.annotate 'line', 152
    find_lex $P108, "%sub"
    $P109 = "new"("Sub", $P108)
    find_lex $P110, "$idx"
    set $I100, $P110
    find_lex $P1088, "%context"
    unless_null $P1088, vivify_109
    $P1088 = root_new ['parrot';'Hash']
    store_lex "%context", $P1088
  vivify_109:
    set $P1089, $P1088["constants"]
    unless_null $P1089, vivify_110
    $P1089 = root_new ['parrot';'ResizablePMCArray']
    set $P1088["constants"], $P1089
  vivify_110:
    set $P1089[$I100], $P109
  if_1085_end:
.annotate 'line', 161
    find_lex $P1094, "%context"
    unless_null $P1094, vivify_111
    $P1094 = root_new ['parrot';'Hash']
  vivify_111:
    set $P107, $P1094["got_main_sub"]
    unless_null $P107, vivify_112
    new $P107, "Undef"
  vivify_112:
    isfalse $I100, $P107
    if $I100, if_1093
    new $P106, 'Integer'
    set $P106, $I100
    goto if_1093_end
  if_1093:
.annotate 'line', 162
    find_lex $P1096, "%context"
    unless_null $P1096, vivify_113
    $P1096 = root_new ['parrot';'Hash']
  vivify_113:
    set $P108, $P1096["DEBUG"]
    unless_null $P108, vivify_114
    new $P108, "Undef"
  vivify_114:
    unless $P108, if_1095_end
    find_lex $P109, "self"
    new $P110, 'String'
    set $P110, "main_sub is "
    find_lex $P1097, "%context"
    unless_null $P1097, vivify_115
    $P1097 = root_new ['parrot';'Hash']
  vivify_115:
    set $P111, $P1097["bytecode"]
    unless_null $P111, vivify_116
    new $P111, "Undef"
  vivify_116:
    $P112 = $P111."main_sub"()
    set $S100, $P112
    concat $P111, $P110, $S100
    $P109."debug"($P111)
  if_1095_end:
.annotate 'line', 163
    find_lex $P108, "$sub"
    $P109 = $P108."main"()
    if $P109, if_1098
.annotate 'line', 169
    find_lex $P1104, "%context"
    unless_null $P1104, vivify_117
    $P1104 = root_new ['parrot';'Hash']
  vivify_117:
    set $P110, $P1104["bytecode"]
    unless_null $P110, vivify_118
    new $P110, "Undef"
  vivify_118:
    $N100 = $P110."main_sub"()
    iseq $I101, $N100, -1.0
    unless $I101, if_1103_end
.annotate 'line', 171
    find_lex $P1106, "%context"
    unless_null $P1106, vivify_119
    $P1106 = root_new ['parrot';'Hash']
  vivify_119:
    set $P111, $P1106["DEBUG"]
    unless_null $P111, vivify_120
    new $P111, "Undef"
  vivify_120:
    unless $P111, if_1105_end
    find_lex $P112, "self"
    $P112."debug"("Got first sub")
  if_1105_end:
.annotate 'line', 172
    find_lex $P1107, "%context"
    unless_null $P1107, vivify_121
    $P1107 = root_new ['parrot';'Hash']
  vivify_121:
    set $P111, $P1107["bytecode"]
    unless_null $P111, vivify_122
    new $P111, "Undef"
  vivify_122:
    find_lex $P112, "$idx"
    $P111."main_sub"($P112)
  if_1103_end:
.annotate 'line', 169
    goto if_1098_end
  if_1098:
.annotate 'line', 164
    find_lex $P1100, "%context"
    unless_null $P1100, vivify_123
    $P1100 = root_new ['parrot';'Hash']
  vivify_123:
    set $P110, $P1100["DEBUG"]
    unless_null $P110, vivify_124
    new $P110, "Undef"
  vivify_124:
    unless $P110, if_1099_end
    find_lex $P111, "self"
    $P111."debug"("Got first :main")
  if_1099_end:
.annotate 'line', 166
    find_lex $P1101, "%context"
    unless_null $P1101, vivify_125
    $P1101 = root_new ['parrot';'Hash']
  vivify_125:
    set $P110, $P1101["bytecode"]
    unless_null $P110, vivify_126
    new $P110, "Undef"
  vivify_126:
    find_lex $P111, "$idx"
    $P110."main_sub"($P111)
.annotate 'line', 167
    new $P110, "Integer"
    assign $P110, 1
    find_lex $P1102, "%context"
    unless_null $P1102, vivify_127
    $P1102 = root_new ['parrot';'Hash']
    store_lex "%context", $P1102
  vivify_127:
    set $P1102["got_main_sub"], $P110
  if_1098_end:
.annotate 'line', 175
    find_lex $P1109, "%context"
    unless_null $P1109, vivify_128
    $P1109 = root_new ['parrot';'Hash']
  vivify_128:
    set $P109, $P1109["DEBUG"]
    unless_null $P109, vivify_129
    new $P109, "Undef"
  vivify_129:
    if $P109, if_1108
    set $P108, $P109
    goto if_1108_end
  if_1108:
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, ":main sub is "
    find_lex $P1110, "%context"
    unless_null $P1110, vivify_130
    $P1110 = root_new ['parrot';'Hash']
  vivify_130:
    set $P112, $P1110["bytecode"]
    unless_null $P112, vivify_131
    new $P112, "Undef"
  vivify_131:
    $P113 = $P112."main_sub"()
    set $S100, $P113
    concat $P112, $P111, $S100
    $P114 = $P110."debug"($P112)
    set $P108, $P114
  if_1108_end:
.annotate 'line', 161
    set $P106, $P108
  if_1093_end:
.annotate 'line', 64
    .return ($P106)
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1059"  :anon :subid("16_1312182912.80612") :outer("15_1312182912.80612")
    .param pmc param_1061
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 98
    .lex "$_", param_1061
.annotate 'line', 99
    find_lex $P110, "self"
    find_lex $P111, "$_"
    find_lex $P112, "%context"
    $P113 = $P110."to_pbc"($P111, $P112)
.annotate 'line', 98
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1080"  :anon :subid("17_1312182912.80612") :outer("15_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 140
    new $P109, "Undef"
    set $P1082, $P109
    .lex "$nskey", $P1082
    find_lex $P110, "$sub"
    $P111 = $P110."namespace"()
    find_lex $P112, "%context"
    $P113 = $P111."to_pmc"($P112)
    set $P114, $P113[0]
    unless_null $P114, vivify_101
    new $P114, "Undef"
  vivify_101:
    store_lex "$nskey", $P114
.annotate 'line', 141
    find_lex $P111, "$nskey"
    typeof $S100, $P111
    iseq $I100, $S100, "Key"
    if $I100, if_1083
    new $P110, 'Integer'
    set $P110, $I100
    goto if_1083_end
  if_1083:
.annotate 'line', 142
    find_lex $P112, "$nskey"
    find_lex $P1084, "%sub"
    unless_null $P1084, vivify_102
    $P1084 = root_new ['parrot';'Hash']
    store_lex "%sub", $P1084
  vivify_102:
    set $P1084["namespace_name"], $P112
.annotate 'line', 141
    set $P110, $P112
  if_1083_end:
.annotate 'line', 139
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("18_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Op"],_)
    .param pmc param_1114
    .param pmc param_1115
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 179
    .const 'Sub' $P1133 = "20_1312182912.80612" 
    capture_lex $P1133
    .const 'Sub' $P1122 = "19_1312182912.80612" 
    capture_lex $P1122
    new $P1113, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1113, control_1112
    push_eh $P1113
    .lex "self", self
    .lex "$op", param_1114
    .lex "%context", param_1115
.annotate 'line', 181
    new $P100, "Undef"
    set $P1116, $P100
    .lex "$fullname", $P1116
.annotate 'line', 196
    $P1118 = root_new ['parrot';'ResizablePMCArray']
    set $P1117, $P1118
    .lex "@op", $P1117
.annotate 'line', 181
    find_lex $P101, "$op"
    $P102 = $P101."pirop"()
    store_lex "$fullname", $P102
.annotate 'line', 182
    find_lex $P1120, "%context"
    unless_null $P1120, vivify_132
    $P1120 = root_new ['parrot';'Hash']
  vivify_132:
    set $P101, $P1120["DEBUG"]
    unless_null $P101, vivify_133
    new $P101, "Undef"
  vivify_133:
    unless $P101, if_1119_end
    find_lex $P102, "self"
    new $P103, 'String'
    set $P103, "Short name "
    find_lex $P104, "$fullname"
    concat $P105, $P103, $P104
    $P102."debug"($P105)
  if_1119_end:
.annotate 'line', 184
    find_lex $P102, "$op"
    $P103 = $P102."list"()
    defined $I100, $P103
    unless $I100, for_undef_134
    iter $P101, $P103
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1126_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1126_test:
    unless $P101, loop1126_done
    shift $P104, $P101
  loop1126_redo:
    .const 'Sub' $P1122 = "19_1312182912.80612" 
    capture_lex $P1122
    $P1122($P104)
  loop1126_next:
    goto loop1126_test
  loop1126_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop1126_next
    eq $P107, .CONTROL_LOOP_REDO, loop1126_redo
  loop1126_done:
    pop_eh 
  for_undef_134:
.annotate 'line', 189
    find_lex $P1128, "%context"
    unless_null $P1128, vivify_135
    $P1128 = root_new ['parrot';'Hash']
  vivify_135:
    set $P101, $P1128["DEBUG"]
    unless_null $P101, vivify_136
    new $P101, "Undef"
  vivify_136:
    unless $P101, if_1127_end
    find_lex $P102, "self"
    new $P103, 'String'
    set $P103, "Fullname "
    find_lex $P104, "$fullname"
    concat $P105, $P103, $P104
    $P102."debug"($P105)
  if_1127_end:
.annotate 'line', 192
    find_lex $P1129, "%context"
    unless_null $P1129, vivify_137
    $P1129 = root_new ['parrot';'Hash']
  vivify_137:
    set $P101, $P1129["bytecode"]
    unless_null $P101, vivify_138
    new $P101, "Undef"
  vivify_138:
    set $N100, $P101
    new $P102, 'Float'
    set $P102, $N100
    find_lex $P1130, "%context"
    unless_null $P1130, vivify_139
    $P1130 = root_new ['parrot';'Hash']
    store_lex "%context", $P1130
  vivify_139:
    set $P1130["opcode_offset"], $P102
.annotate 'line', 194
    find_lex $P101, "$fullname"
    find_lex $P1131, "%context"
    unless_null $P1131, vivify_140
    $P1131 = root_new ['parrot';'Hash']
    store_lex "%context", $P1131
  vivify_140:
    set $P1131["opcode_fullname"], $P101
.annotate 'line', 196
    find_lex $P101, "$fullname"
    $P102 = "list"($P101)
    store_lex "@op", $P102
.annotate 'line', 197
    find_lex $P102, "$op"
    $P103 = $P102."list"()
    defined $I100, $P103
    unless $I100, for_undef_141
    iter $P101, $P103
    new $P105, 'ExceptionHandler'
    set_label $P105, loop1135_handler
    $P105."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P105
  loop1135_test:
    unless $P101, loop1135_done
    shift $P104, $P101
  loop1135_redo:
    .const 'Sub' $P1133 = "20_1312182912.80612" 
    capture_lex $P1133
    $P1133($P104)
  loop1135_next:
    goto loop1135_test
  loop1135_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, 'type'
    eq $P106, .CONTROL_LOOP_NEXT, loop1135_next
    eq $P106, .CONTROL_LOOP_REDO, loop1135_redo
  loop1135_done:
    pop_eh 
  for_undef_141:
.annotate 'line', 200
    find_lex $P1137, "%context"
    unless_null $P1137, vivify_142
    $P1137 = root_new ['parrot';'Hash']
  vivify_142:
    set $P101, $P1137["DEBUG"]
    unless_null $P101, vivify_143
    new $P101, "Undef"
  vivify_143:
    unless $P101, if_1136_end
    find_lex $P102, "self"
    new $P103, 'String'
    set $P103, "Op size "
    find_lex $P104, "@op"
    set $N100, $P104
    set $S100, $N100
    concat $P104, $P103, $S100
    $P102."debug"($P104)
  if_1136_end:
.annotate 'line', 201
    find_lex $P1138, "%context"
    unless_null $P1138, vivify_144
    $P1138 = root_new ['parrot';'Hash']
  vivify_144:
    set $P101, $P1138["bytecode"]
    unless_null $P101, vivify_145
    new $P101, "Undef"
  vivify_145:
    find_lex $P102, "@op"
    $P103 = $P101."push"($P102)
.annotate 'line', 179
    .return ($P103)
  control_1112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1121"  :anon :subid("19_1312182912.80612") :outer("18_1312182912.80612")
    .param pmc param_1124
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 185
    new $P105, "Undef"
    set $P1123, $P105
    .lex "$type", $P1123
    .lex "$_", param_1124
    find_lex $P107, "$_"
    $P108 = $P107."type"()
    unless $P108, unless_1125
    set $P106, $P108
    goto unless_1125_end
  unless_1125:
    find_lex $P109, "self"
    find_lex $P110, "$_"
    $P111 = $P110."name"()
    find_lex $P112, "%context"
    $P113 = $P109."get_register"($P111, $P112)
    $P114 = $P113."type"()
    set $P106, $P114
  unless_1125_end:
    store_lex "$type", $P106
.annotate 'line', 186
    find_lex $P106, "$fullname"
    set $S100, $P106
    new $P107, 'String'
    set $P107, $S100
    concat $P108, $P107, "_"
    find_lex $P109, "$type"
    set $S101, $P109
    concat $P110, $P108, $S101
    store_lex "$fullname", $P110
.annotate 'line', 184
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1132"  :anon :subid("20_1312182912.80612") :outer("18_1312182912.80612")
    .param pmc param_1134
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 197
    .lex "$_", param_1134
.annotate 'line', 198
    find_lex $P105, "@op"
    find_lex $P106, "self"
    find_lex $P107, "$_"
    find_lex $P108, "%context"
    $P109 = $P106."to_op"($P107, $P108)
    $P110 = $P105."push"($P109)
.annotate 'line', 197
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("21_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Node"],_)
    .param pmc param_1142
    .param pmc param_1143
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 205
    .const 'Sub' $P1145 = "22_1312182912.80612" 
    capture_lex $P1145
    new $P1141, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1141, control_1140
    push_eh $P1141
    .lex "self", self
    .lex "$node", param_1142
    .lex "%context", param_1143
.annotate 'line', 206
    find_lex $P101, "$node"
    $P102 = $P101."list"()
    defined $I100, $P102
    unless $I100, for_undef_146
    iter $P100, $P102
    new $P104, 'ExceptionHandler'
    set_label $P104, loop1147_handler
    $P104."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P104
  loop1147_test:
    unless $P100, loop1147_done
    shift $P103, $P100
  loop1147_redo:
    .const 'Sub' $P1145 = "22_1312182912.80612" 
    capture_lex $P1145
    $P1145($P103)
  loop1147_next:
    goto loop1147_test
  loop1147_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, 'type'
    eq $P105, .CONTROL_LOOP_NEXT, loop1147_next
    eq $P105, .CONTROL_LOOP_REDO, loop1147_redo
  loop1147_done:
    pop_eh 
  for_undef_146:
.annotate 'line', 205
    .return ($P100)
  control_1140:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1144"  :anon :subid("22_1312182912.80612") :outer("21_1312182912.80612")
    .param pmc param_1146
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 206
    .lex "$_", param_1146
.annotate 'line', 207
    find_lex $P104, "self"
    find_lex $P105, "$_"
    find_lex $P106, "%context"
    $P107 = $P104."to_pbc"($P105, $P106)
.annotate 'line', 206
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("23_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Label"],_)
    .param pmc param_1151
    .param pmc param_1152
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 211
    .const 'Sub' $P1160 = "24_1312182912.80612" 
    capture_lex $P1160
    new $P1150, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1150, control_1149
    push_eh $P1150
    .lex "self", self
    .lex "$l", param_1151
    .lex "%context", param_1152
.annotate 'line', 212
    new $P100, "Undef"
    set $P1153, $P100
    .lex "$bc", $P1153
.annotate 'line', 215
    new $P101, "Undef"
    set $P1154, $P101
    .lex "$pos", $P1154
.annotate 'line', 212
    find_lex $P1155, "%context"
    unless_null $P1155, vivify_147
    $P1155 = root_new ['parrot';'Hash']
  vivify_147:
    set $P102, $P1155["bytecode"]
    unless_null $P102, vivify_148
    new $P102, "Undef"
  vivify_148:
    store_lex "$bc", $P102
.annotate 'line', 213
    find_lex $P102, "$l"
    $P103 = $P102."declared"()
    if $P103, unless_1156_end
    find_lex $P104, "self"
    $P104."panic"("Trying to emit undelcared label!")
  unless_1156_end:
.annotate 'line', 215
    find_lex $P102, "$bc"
    set $N100, $P102
    new $P103, 'Float'
    set $P103, $N100
    store_lex "$pos", $P103
.annotate 'line', 216
    find_lex $P1158, "%context"
    unless_null $P1158, vivify_149
    $P1158 = root_new ['parrot';'Hash']
  vivify_149:
    set $P102, $P1158["DEBUG"]
    unless_null $P102, vivify_150
    new $P102, "Undef"
  vivify_150:
    unless $P102, if_1157_end
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "Declare label '"
    find_lex $P105, "$l"
    $P106 = $P105."name"()
    set $S100, $P106
    concat $P105, $P104, $S100
    concat $P107, $P105, "' at "
    find_lex $P108, "$pos"
    concat $P109, $P107, $P108
    $P103."debug"($P109)
  if_1157_end:
.annotate 'line', 218
    find_lex $P102, "$l"
    find_lex $P103, "$pos"
    $P102."position"($P103)
.annotate 'line', 220
    find_lex $P103, "$l"
    $P104 = $P103."list"()
    defined $I100, $P104
    unless $I100, for_undef_151
    iter $P102, $P104
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1162_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1162_test:
    unless $P102, loop1162_done
    shift $P105, $P102
  loop1162_redo:
    .const 'Sub' $P1160 = "24_1312182912.80612" 
    capture_lex $P1160
    $P1160($P105)
  loop1162_next:
    goto loop1162_test
  loop1162_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop1162_next
    eq $P107, .CONTROL_LOOP_REDO, loop1162_redo
  loop1162_done:
    pop_eh 
  for_undef_151:
.annotate 'line', 211
    .return ($P102)
  control_1149:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1159"  :anon :subid("24_1312182912.80612") :outer("23_1312182912.80612")
    .param pmc param_1161
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 220
    .lex "$_", param_1161
.annotate 'line', 221
    find_lex $P106, "self"
    find_lex $P107, "$_"
    find_lex $P108, "%context"
    $P109 = $P106."to_pbc"($P107, $P108)
.annotate 'line', 220
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("25_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Call"],_)
    .param pmc param_1166
    .param pmc param_1167
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 225
    .const 'Sub' $P1184 = "26_1312182912.80612" 
    capture_lex $P1184
    new $P1165, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1165, control_1164
    push_eh $P1165
    .lex "self", self
    .lex "$call", param_1166
    .lex "%context", param_1167
.annotate 'line', 226
    new $P100, "Undef"
    set $P1168, $P100
    .lex "$bc", $P1168
.annotate 'line', 227
    new $P101, "Undef"
    set $P1169, $P101
    .lex "$calltype", $P1169
.annotate 'line', 228
    new $P102, "Undef"
    set $P1170, $P102
    .lex "$is_tailcall", $P1170
.annotate 'line', 226
    find_lex $P1171, "%context"
    unless_null $P1171, vivify_152
    $P1171 = root_new ['parrot';'Hash']
  vivify_152:
    set $P103, $P1171["bytecode"]
    unless_null $P103, vivify_153
    new $P103, "Undef"
  vivify_153:
    store_lex "$bc", $P103
.annotate 'line', 227
    find_lex $P103, "$call"
    $P104 = $P103."calltype"()
    store_lex "$calltype", $P104
.annotate 'line', 228
    find_lex $P103, "$calltype"
    set $S100, $P103
    iseq $I100, $S100, "tailcall"
    new $P104, 'Integer'
    set $P104, $I100
    store_lex "$is_tailcall", $P104
.annotate 'line', 230
    find_lex $P105, "$calltype"
    set $S100, $P105
    iseq $I100, $S100, "call"
    unless $I100, unless_1173
    new $P104, 'Integer'
    set $P104, $I100
    goto unless_1173_end
  unless_1173:
    find_lex $P106, "$calltype"
    set $S101, $P106
    iseq $I101, $S101, "tailcall"
    new $P104, 'Integer'
    set $P104, $I101
  unless_1173_end:
    if $P104, if_1172
.annotate 'line', 308
    find_lex $P109, "$calltype"
    set $S102, $P109
    iseq $I102, $S102, "return"
    if $I102, if_1223
.annotate 'line', 312
    find_lex $P111, "$calltype"
    set $S103, $P111
    iseq $I103, $S103, "results"
    if $I103, if_1225
.annotate 'line', 317
    find_lex $P113, "self"
    new $P114, 'String'
    set $P114, "NYI "
    find_lex $P115, "$calltype"
    set $S104, $P115
    concat $P117, $P114, $S104
    $P118 = $P113."panic"($P117)
.annotate 'line', 316
    set $P110, $P118
.annotate 'line', 312
    goto if_1225_end
  if_1225:
.annotate 'line', 314
    find_lex $P113, "self"
    find_lex $P1226, "$call"
    unless_null $P1226, vivify_154
    $P1226 = root_new ['parrot';'Hash']
  vivify_154:
    set $P114, $P1226["params"]
    unless_null $P114, vivify_155
    new $P114, "Undef"
  vivify_155:
    find_lex $P115, "%context"
    $P116 = $P113."build_pcc_call"("get_results_pc", $P114, $P115)
.annotate 'line', 312
    set $P110, $P116
  if_1225_end:
    set $P108, $P110
.annotate 'line', 308
    goto if_1223_end
  if_1223:
.annotate 'line', 309
    find_lex $P110, "self"
    find_lex $P1224, "$call"
    unless_null $P1224, vivify_156
    $P1224 = root_new ['parrot';'Hash']
  vivify_156:
    set $P111, $P1224["params"]
    unless_null $P111, vivify_157
    new $P111, "Undef"
  vivify_157:
    find_lex $P112, "%context"
    $P110."build_pcc_call"("set_returns_pc", $P111, $P112)
.annotate 'line', 310
    find_lex $P110, "$bc"
    new $P111, "ResizablePMCArray"
    push $P111, "returncc"
    $P112 = $P110."push"($P111)
.annotate 'line', 308
    set $P108, $P112
  if_1223_end:
    set $P103, $P108
.annotate 'line', 230
    goto if_1172_end
  if_1172:
.annotate 'line', 231
    find_lex $P107, "$call"
    $P108 = $P107."invocant"()
    unless $P108, if_1174_end
.annotate 'line', 232
    find_lex $P1176, "$call"
    unless_null $P1176, vivify_158
    $P1176 = root_new ['parrot';'Hash']
  vivify_158:
    set $P109, $P1176["params"]
    unless_null $P109, vivify_159
    new $P109, "Undef"
  vivify_159:
    if $P109, unless_1175_end
    $P110 = "list"()
    find_lex $P1177, "$call"
    unless_null $P1177, vivify_160
    $P1177 = root_new ['parrot';'Hash']
    store_lex "$call", $P1177
  vivify_160:
    set $P1177["params"], $P110
  unless_1175_end:
.annotate 'line', 233
    find_lex $P1178, "$call"
    unless_null $P1178, vivify_161
    $P1178 = root_new ['parrot';'Hash']
  vivify_161:
    set $P109, $P1178["params"]
    unless_null $P109, vivify_162
    new $P109, "Undef"
  vivify_162:
    find_lex $P110, "$call"
    $P111 = $P110."invocant"()
    $P109."unshift"($P111)
  if_1174_end:
.annotate 'line', 236
    find_lex $P107, "self"
    find_lex $P1179, "$call"
    unless_null $P1179, vivify_163
    $P1179 = root_new ['parrot';'Hash']
  vivify_163:
    set $P108, $P1179["params"]
    unless_null $P108, vivify_164
    new $P108, "Undef"
  vivify_164:
    find_lex $P109, "%context"
    $P107."build_pcc_call"("set_args_pc", $P108, $P109)
.annotate 'line', 238
    find_lex $P107, "$call"
    $P108 = $P107."invocant"()
    if $P108, if_1180
.annotate 'line', 252
    .const 'Sub' $P1184 = "26_1312182912.80612" 
    capture_lex $P1184
    $P1184()
    goto if_1180_end
  if_1180:
.annotate 'line', 239
    find_lex $P109, "$call"
    $P110 = $P109."name"()
    get_hll_global $P111, ["POST"], "Constant"
    $P112 = $P110."isa"($P111)
    if $P112, if_1181
.annotate 'line', 249
    find_lex $P113, "self"
    $P113."panic"("NYI $P0.$S0()")
.annotate 'line', 248
    goto if_1181_end
  if_1181:
.annotate 'line', 240
    find_lex $P113, "$bc"
.annotate 'line', 242
    find_lex $P115, "$is_tailcall"
    if $P115, if_1182
    new $P117, "String"
    assign $P117, "callmethodcc_p_sc"
    set $P114, $P117
    goto if_1182_end
  if_1182:
    new $P116, "String"
    assign $P116, "tailcallmethod_p_sc"
    set $P114, $P116
  if_1182_end:
.annotate 'line', 244
    find_lex $P118, "self"
    find_lex $P119, "$call"
    $P120 = $P119."invocant"()
    find_lex $P121, "%context"
    $P122 = $P118."to_op"($P120, $P121)
.annotate 'line', 245
    find_lex $P123, "self"
    find_lex $P124, "$call"
    $P125 = $P124."name"()
    find_lex $P126, "%context"
    $P127 = $P123."to_op"($P125, $P126)
    new $P128, "ResizablePMCArray"
    push $P128, $P114
    push $P128, $P122
    push $P128, $P127
    $P113."push"($P128)
  if_1181_end:
  if_1180_end:
.annotate 'line', 304
    find_lex $P108, "$is_tailcall"
    unless $P108, unless_1221
    set $P107, $P108
    goto unless_1221_end
  unless_1221:
.annotate 'line', 305
    find_lex $P109, "self"
    find_lex $P1222, "$call"
    unless_null $P1222, vivify_194
    $P1222 = root_new ['parrot';'Hash']
  vivify_194:
    set $P110, $P1222["results"]
    unless_null $P110, vivify_195
    new $P110, "Undef"
  vivify_195:
    find_lex $P111, "%context"
    $P112 = $P109."build_pcc_call"("get_results_pc", $P110, $P111)
.annotate 'line', 304
    set $P107, $P112
  unless_1221_end:
.annotate 'line', 230
    set $P103, $P107
  if_1172_end:
.annotate 'line', 225
    .return ($P103)
  control_1164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1183"  :anon :subid("26_1312182912.80612") :outer("25_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 252
    .const 'Sub' $P1190 = "27_1312182912.80612" 
    capture_lex $P1190
.annotate 'line', 253
    new $P109, "Undef"
    set $P1185, $P109
    .lex "$SUB", $P1185
.annotate 'line', 254
    new $P110, "Undef"
    set $P1186, $P110
    .lex "$processed", $P1186
.annotate 'line', 298
    new $P111, "Undef"
    set $P1187, $P111
    .lex "$o", $P1187
.annotate 'line', 252
    find_lex $P112, "$SUB"
.annotate 'line', 254
    new $P112, "Integer"
    assign $P112, 0
    store_lex "$processed", $P112
.annotate 'line', 255
    find_lex $P112, "$call"
    $P113 = $P112."name"()
    get_hll_global $P114, ["POST"], "Constant"
    $P115 = $P113."isa"($P114)
    unless $P115, if_1188_end
    .const 'Sub' $P1190 = "27_1312182912.80612" 
    capture_lex $P1190
    $P1190()
  if_1188_end:
.annotate 'line', 283
    find_lex $P112, "$processed"
    if $P112, unless_1210_end
.annotate 'line', 284
    find_lex $P113, "$call"
    $P114 = $P113."name"()
    get_hll_global $P115, ["POST"], "Constant"
    $P116 = $P114."isa"($P115)
    if $P116, if_1211
.annotate 'line', 293
    find_lex $P1215, "%context"
    unless_null $P1215, vivify_182
    $P1215 = root_new ['parrot';'Hash']
  vivify_182:
    set $P117, $P1215["DEBUG"]
    unless_null $P117, vivify_183
    new $P117, "Undef"
  vivify_183:
    unless $P117, if_1214_end
    find_lex $P118, "self"
    new $P119, "String"
    assign $P119, "Name is "
    find_lex $P1216, "$call"
    unless_null $P1216, vivify_184
    $P1216 = root_new ['parrot';'Hash']
  vivify_184:
    set $P120, $P1216["name"]
    unless_null $P120, vivify_185
    new $P120, "Undef"
  vivify_185:
    $S102 = $P120."WHAT"()
    concat $P121, $P119, $S102
    $P118."debug"($P121)
  if_1214_end:
.annotate 'line', 294
    find_lex $P1217, "$call"
    unless_null $P1217, vivify_186
    $P1217 = root_new ['parrot';'Hash']
  vivify_186:
    set $P117, $P1217["name"]
    unless_null $P117, vivify_187
    new $P117, "Undef"
  vivify_187:
    store_lex "$SUB", $P117
.annotate 'line', 292
    goto if_1211_end
  if_1211:
.annotate 'line', 285
    find_lex $P1212, "%context"
    unless_null $P1212, vivify_188
    $P1212 = root_new ['parrot';'Hash']
  vivify_188:
    set $P117, $P1212["sub"]
    unless_null $P117, vivify_189
    new $P117, "Undef"
  vivify_189:
    $P118 = $P117."symbol"("!SUB")
    store_lex "$SUB", $P118
.annotate 'line', 286
    find_lex $P117, "$bc"
.annotate 'line', 288
    find_lex $P118, "self"
    find_lex $P119, "$SUB"
    find_lex $P120, "%context"
    $P121 = $P118."to_op"($P119, $P120)
.annotate 'line', 289
    find_lex $P122, "self"
    find_lex $P1213, "$call"
    unless_null $P1213, vivify_190
    $P1213 = root_new ['parrot';'Hash']
  vivify_190:
    set $P123, $P1213["name"]
    unless_null $P123, vivify_191
    new $P123, "Undef"
  vivify_191:
    find_lex $P124, "%context"
    $P125 = $P122."to_op"($P123, $P124)
    new $P126, "ResizablePMCArray"
    push $P126, "find_sub_not_null_p_sc"
    push $P126, $P121
    push $P126, $P125
    $P117."push"($P126)
  if_1211_end:
  unless_1210_end:
.annotate 'line', 298
    find_lex $P113, "$is_tailcall"
    if $P113, if_1218
    new $P115, "String"
    assign $P115, "invokecc_p"
    set $P112, $P115
    goto if_1218_end
  if_1218:
    new $P114, "String"
    assign $P114, "tailcall_p"
    set $P112, $P114
  if_1218_end:
    store_lex "$o", $P112
.annotate 'line', 300
    find_lex $P1220, "%context"
    unless_null $P1220, vivify_192
    $P1220 = root_new ['parrot';'Hash']
  vivify_192:
    set $P112, $P1220["DEBUG"]
    unless_null $P112, vivify_193
    new $P112, "Undef"
  vivify_193:
    unless $P112, if_1219_end
    find_lex $P113, "self"
    find_lex $P114, "$o"
    $P113."debug"($P114)
  if_1219_end:
.annotate 'line', 301
    find_lex $P112, "$bc"
    find_lex $P113, "$o"
    find_lex $P114, "self"
    find_lex $P115, "$SUB"
    find_lex $P116, "%context"
    $P117 = $P114."to_op"($P115, $P116)
    new $P118, "ResizablePMCArray"
    push $P118, $P113
    push $P118, $P117
    $P119 = $P112."push"($P118)
.annotate 'line', 252
    .return ($P119)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1189"  :anon :subid("27_1312182912.80612") :outer("26_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 255
    .const 'Sub' $P1203 = "28_1312182912.80612" 
    capture_lex $P1203
.annotate 'line', 258
    new $P116, "Undef"
    set $P1191, $P116
    .lex "$full_name", $P1191
.annotate 'line', 261
    new $P117, "Undef"
    set $P1192, $P117
    .lex "$invocable_sub", $P1192
.annotate 'line', 255
    find_lex $P118, "$full_name"
.annotate 'line', 259
    find_lex $P1194, "%context"
    unless_null $P1194, vivify_165
    $P1194 = root_new ['parrot';'Hash']
  vivify_165:
    set $P118, $P1194["sub"]
    unless_null $P118, vivify_166
    new $P118, "Undef"
  vivify_166:
    $P119 = $P118."namespace"()
    unless $P119, if_1193_end
    find_lex $P1195, "%context"
    unless_null $P1195, vivify_167
    $P1195 = root_new ['parrot';'Hash']
  vivify_167:
    set $P120, $P1195["sub"]
    unless_null $P120, vivify_168
    new $P120, "Undef"
  vivify_168:
    $P121 = $P120."namespace"()
    $P122 = $P121."Str"()
    store_lex "$full_name", $P122
  if_1193_end:
.annotate 'line', 260
    find_lex $P118, "$full_name"
    set $S102, $P118
    new $P119, 'String'
    set $P119, $S102
    find_lex $P1196, "$call"
    unless_null $P1196, vivify_169
    $P1196 = root_new ['parrot';'Hash']
  vivify_169:
    set $P1197, $P1196["name"]
    unless_null $P1197, vivify_170
    $P1197 = root_new ['parrot';'Hash']
  vivify_170:
    set $P120, $P1197["value"]
    unless_null $P120, vivify_171
    new $P120, "Undef"
  vivify_171:
    set $S103, $P120
    concat $P121, $P119, $S103
    store_lex "$full_name", $P121
.annotate 'line', 261
    find_lex $P1198, "%context"
    unless_null $P1198, vivify_172
    $P1198 = root_new ['parrot';'Hash']
  vivify_172:
    set $P118, $P1198["pir_file"]
    unless_null $P118, vivify_173
    new $P118, "Undef"
  vivify_173:
    find_lex $P119, "$full_name"
    $P120 = $P118."sub"($P119)
    store_lex "$invocable_sub", $P120
.annotate 'line', 262
    find_lex $P1200, "%context"
    unless_null $P1200, vivify_174
    $P1200 = root_new ['parrot';'Hash']
  vivify_174:
    set $P118, $P1200["DEBUG"]
    unless_null $P118, vivify_175
    new $P118, "Undef"
  vivify_175:
    unless $P118, if_1199_end
    find_lex $P119, "self"
    new $P120, 'String'
    set $P120, "invocable_sub '"
    find_lex $P121, "$full_name"
    concat $P122, $P120, $P121
    concat $P123, $P122, "'"
    $P119."debug"($P123)
  if_1199_end:
.annotate 'line', 263
    find_lex $P119, "$invocable_sub"
    if $P119, if_1201
    set $P118, $P119
    goto if_1201_end
  if_1201:
    .const 'Sub' $P1203 = "28_1312182912.80612" 
    capture_lex $P1203
    $P122 = $P1203()
    set $P118, $P122
  if_1201_end:
.annotate 'line', 255
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1202"  :anon :subid("28_1312182912.80612") :outer("27_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 264
    new $P120, "Undef"
    set $P1204, $P120
    .lex "$idx", $P1204
    find_lex $P121, "$invocable_sub"
    $P122 = $P121."constant_index"()
    store_lex "$idx", $P122
.annotate 'line', 265
    find_lex $P121, "$idx"
    $P122 = "defined"($P121)
    if $P122, unless_1205_end
.annotate 'line', 267
    find_lex $P1206, "%context"
    unless_null $P1206, vivify_176
    $P1206 = root_new ['parrot';'Hash']
  vivify_176:
    set $P123, $P1206["constants"]
    unless_null $P123, vivify_177
    new $P123, "Undef"
  vivify_177:
    $P124 = "new"("Integer")
    $P125 = $P123."push"($P124)
    store_lex "$idx", $P125
.annotate 'line', 268
    find_lex $P123, "$invocable_sub"
    find_lex $P124, "$idx"
    $P123."constant_index"($P124)
.annotate 'line', 269
    find_lex $P1208, "%context"
    unless_null $P1208, vivify_178
    $P1208 = root_new ['parrot';'Hash']
  vivify_178:
    set $P123, $P1208["DEBUG"]
    unless_null $P123, vivify_179
    new $P123, "Undef"
  vivify_179:
    unless $P123, if_1207_end
    find_lex $P124, "self"
    new $P125, 'String'
    set $P125, "Allocate constant for it "
    find_lex $P126, "$idx"
    concat $P127, $P125, $P126
    $P124."debug"($P127)
  if_1207_end:
  unless_1205_end:
.annotate 'line', 272
    find_lex $P1209, "%context"
    unless_null $P1209, vivify_180
    $P1209 = root_new ['parrot';'Hash']
  vivify_180:
    set $P121, $P1209["sub"]
    unless_null $P121, vivify_181
    new $P121, "Undef"
  vivify_181:
    $P122 = $P121."symbol"("!SUB")
    store_lex "$SUB", $P122
.annotate 'line', 273
    find_lex $P121, "$bc"
.annotate 'line', 275
    find_lex $P122, "self"
    find_lex $P123, "$SUB"
    find_lex $P124, "%context"
    $P125 = $P122."to_op"($P123, $P124)
    find_lex $P126, "$idx"
    new $P127, "ResizablePMCArray"
    push $P127, "set_p_pc"
    push $P127, $P125
    push $P127, $P126
.annotate 'line', 276
    $P121."push"($P127)
.annotate 'line', 279
    new $P121, "Integer"
    assign $P121, 1
    store_lex "$processed", $P121
.annotate 'line', 263
    .return ($P121)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("29_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Key"],_)
    .param pmc param_1230
    .param pmc param_1231
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 324
    new $P1229, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1229, control_1228
    push_eh $P1229
    .lex "self", self
    .lex "$key", param_1230
    .lex "%context", param_1231
.annotate 'line', 327
    new $P100, "Undef"
    set $P1232, $P100
    .lex "$key_pmc", $P1232
.annotate 'line', 333
    new $P101, "Undef"
    set $P1233, $P101
    .lex "$constants", $P1233
.annotate 'line', 334
    new $P102, "Undef"
    set $P1234, $P102
    .lex "$idx", $P1234
.annotate 'line', 326
    find_lex $P1236, "%context"
    unless_null $P1236, vivify_196
    $P1236 = root_new ['parrot';'Hash']
  vivify_196:
    set $P103, $P1236["DEBUG"]
    unless_null $P103, vivify_197
    new $P103, "Undef"
  vivify_197:
    unless $P103, if_1235_end
    find_lex $P104, "self"
    $P104."debug"("Want key")
  if_1235_end:
.annotate 'line', 327
    find_lex $P103, "$key"
    find_lex $P104, "%context"
    $P105 = $P103."to_pmc"($P104)
    set $P106, $P105[0]
    unless_null $P106, vivify_198
    new $P106, "Undef"
  vivify_198:
    store_lex "$key_pmc", $P106
.annotate 'line', 328
    find_lex $P1238, "%context"
    unless_null $P1238, vivify_199
    $P1238 = root_new ['parrot';'Hash']
  vivify_199:
    set $P103, $P1238["DEBUG"]
    unless_null $P103, vivify_200
    new $P103, "Undef"
  vivify_200:
    unless $P103, if_1237_end
    find_lex $P104, "self"
    $P104."debug"("Got key")
  if_1237_end:
.annotate 'line', 333
    find_lex $P1239, "%context"
    unless_null $P1239, vivify_201
    $P1239 = root_new ['parrot';'Hash']
  vivify_201:
    set $P103, $P1239["constants"]
    unless_null $P103, vivify_202
    new $P103, "Undef"
  vivify_202:
    store_lex "$constants", $P103
.annotate 'line', 324
    find_lex $P103, "$idx"
.annotate 'line', 335

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
.annotate 'line', 324
    find_lex $P103, "$idx"
    .return ($P103)
  control_1228:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("30_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Constant"],_)
    .param pmc param_1243
    .param pmc param_1244
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 351
    new $P1242, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1242, control_1241
    push_eh $P1242
    .lex "self", self
    .lex "$op", param_1243
    .lex "%context", param_1244
.annotate 'line', 352
    new $P100, "Undef"
    set $P1245, $P100
    .lex "$idx", $P1245
.annotate 'line', 353
    new $P101, "Undef"
    set $P1246, $P101
    .lex "$type", $P1246
.annotate 'line', 351
    find_lex $P102, "$idx"
.annotate 'line', 353
    find_lex $P102, "$op"
    $P103 = $P102."type"()
    store_lex "$type", $P103
.annotate 'line', 354
    find_lex $P103, "$type"
    set $S100, $P103
    iseq $I100, $S100, "ic"
    unless $I100, unless_1248
    new $P102, 'Integer'
    set $P102, $I100
    goto unless_1248_end
  unless_1248:
    find_lex $P104, "$type"
    set $S101, $P104
    iseq $I101, $S101, "kic"
    new $P102, 'Integer'
    set $P102, $I101
  unless_1248_end:
    if $P102, if_1247
.annotate 'line', 357
    find_lex $P105, "$type"
    set $S102, $P105
    iseq $I102, $S102, "nc"
    if $I102, if_1249
.annotate 'line', 361
    find_lex $P106, "self"
    $P106."panic"("NYI")
.annotate 'line', 360
    goto if_1249_end
  if_1249:
.annotate 'line', 358
    find_lex $P1250, "%context"
    unless_null $P1250, vivify_203
    $P1250 = root_new ['parrot';'Hash']
  vivify_203:
    set $P106, $P1250["constants"]
    unless_null $P106, vivify_204
    new $P106, "Undef"
  vivify_204:
    find_lex $P107, "$op"
    $P108 = $P107."value"()
    $P109 = $P106."get_or_create_number"($P108)
    store_lex "$idx", $P109
  if_1249_end:
.annotate 'line', 357
    goto if_1247_end
  if_1247:
.annotate 'line', 355
    find_lex $P105, "$op"
    $P106 = $P105."value"()
    store_lex "$idx", $P106
  if_1247_end:
.annotate 'line', 364
    find_lex $P1252, "%context"
    unless_null $P1252, vivify_205
    $P1252 = root_new ['parrot';'Hash']
  vivify_205:
    set $P102, $P1252["DEBUG"]
    unless_null $P102, vivify_206
    new $P102, "Undef"
  vivify_206:
    unless $P102, if_1251_end
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "Index "
    find_lex $P105, "$idx"
    concat $P106, $P104, $P105
    $P103."debug"($P106)
  if_1251_end:
.annotate 'line', 351
    find_lex $P102, "$idx"
    .return ($P102)
  control_1241:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("31_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"String"],_)
    .param pmc param_1256
    .param pmc param_1257
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 368
    .const 'Sub' $P1265 = "32_1312182912.80612" 
    capture_lex $P1265
    new $P1255, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1255, control_1254
    push_eh $P1255
    .lex "self", self
    .lex "$str", param_1256
    .lex "%context", param_1257
.annotate 'line', 369
    new $P100, "Undef"
    set $P1258, $P100
    .lex "$idx", $P1258
.annotate 'line', 370
    new $P101, "Undef"
    set $P1259, $P101
    .lex "$type", $P1259
.annotate 'line', 368
    find_lex $P102, "$idx"
.annotate 'line', 370
    find_lex $P102, "$str"
    $P103 = $P102."type"()
    store_lex "$type", $P103
.annotate 'line', 371
    find_lex $P102, "$type"
    set $S100, $P102
    isne $I100, $S100, "sc"
    unless $I100, if_1260_end
.annotate 'line', 372
    find_lex $P103, "self"
    $P103."panic"("attempt to pass a non-sc value off as a string")
  if_1260_end:
.annotate 'line', 374
    find_lex $P103, "$str"
    $S100 = $P103."encoding"()
    iseq $I100, $S100, "fixed_8"
    if $I100, if_1262
    new $P102, 'Integer'
    set $P102, $I100
    goto if_1262_end
  if_1262:
    find_lex $P104, "$str"
    $S101 = $P104."charset"()
    iseq $I101, $S101, "ascii"
    new $P102, 'Integer'
    set $P102, $I101
  if_1262_end:
    if $P102, if_1261
.annotate 'line', 377
    .const 'Sub' $P1265 = "32_1312182912.80612" 
    capture_lex $P1265
    $P1265()
    goto if_1261_end
  if_1261:
.annotate 'line', 375
    find_lex $P1263, "%context"
    unless_null $P1263, vivify_209
    $P1263 = root_new ['parrot';'Hash']
  vivify_209:
    set $P105, $P1263["constants"]
    unless_null $P105, vivify_210
    new $P105, "Undef"
  vivify_210:
    find_lex $P106, "$str"
    $P107 = $P106."value"()
    $P108 = $P105."get_or_create_string"($P107)
    store_lex "$idx", $P108
  if_1261_end:
.annotate 'line', 368
    find_lex $P102, "$idx"
    .return ($P102)
  control_1254:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1264"  :anon :subid("32_1312182912.80612") :outer("31_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 379
    new $P105, "Undef"
    set $P1266, $P105
    .lex "$bb", $P1266
.annotate 'line', 380
    new $P106, "Undef"
    set $P1267, $P106
    .lex "$str_val", $P1267
.annotate 'line', 379
    $P107 = "new"("ByteBuffer")
    store_lex "$bb", $P107
.annotate 'line', 380
    find_lex $P107, "$str"
    $P108 = $P107."value"()
    store_lex "$str_val", $P108
.annotate 'line', 381

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 389
    find_lex $P1268, "%context"
    unless_null $P1268, vivify_207
    $P1268 = root_new ['parrot';'Hash']
  vivify_207:
    set $P107, $P1268["constants"]
    unless_null $P107, vivify_208
    new $P107, "Undef"
  vivify_208:
    find_lex $P108, "$bb"
.annotate 'line', 390
    find_lex $P109, "$str"
    $P110 = $P109."encoding"()
    $P111 = $P108."get_string"($P110)
.annotate 'line', 389
    $P112 = $P107."get_or_create_string"($P111)
    store_lex "$idx", $P112
.annotate 'line', 377
    .return ($P112)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("33_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Value"],_)
    .param pmc param_1272
    .param pmc param_1273
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 397
    new $P1271, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1271, control_1270
    push_eh $P1271
    .lex "self", self
    .lex "$val", param_1272
    .lex "%context", param_1273
.annotate 'line', 399
    new $P100, "Undef"
    set $P1274, $P100
    .lex "$orig", $P1274
    find_lex $P101, "self"
    find_lex $P102, "$val"
    $P103 = $P102."name"()
    find_lex $P104, "%context"
    $P105 = $P101."get_register"($P103, $P104)
    store_lex "$orig", $P105
.annotate 'line', 400
    find_lex $P101, "self"
    find_lex $P102, "$orig"
    find_lex $P103, "%context"
    $P104 = $P101."to_op"($P102, $P103)
.annotate 'line', 397
    .return ($P104)
  control_1270:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("34_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Register"],_)
    .param pmc param_1278
    .param pmc param_1279
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 403
    new $P1277, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1277, control_1276
    push_eh $P1277
    .lex "self", self
    .lex "$reg", param_1278
    .lex "%context", param_1279
.annotate 'line', 404
    find_lex $P100, "$reg"
    $P101 = $P100."regno"()
.annotate 'line', 403
    .return ($P101)
  control_1276:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("35_1312182912.80612") :method :outer("11_1312182912.80612") :multi(_,["POST";"Label"],_)
    .param pmc param_1283
    .param pmc param_1284
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 407
    new $P1282, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1282, control_1281
    push_eh $P1282
    .lex "self", self
    .lex "$l", param_1283
    .lex "%context", param_1284
.annotate 'line', 409
    new $P100, "Undef"
    set $P1285, $P100
    .lex "$bc", $P1285
.annotate 'line', 410
    new $P101, "Undef"
    set $P1286, $P101
    .lex "$pos", $P1286
.annotate 'line', 409
    find_lex $P1287, "%context"
    unless_null $P1287, vivify_211
    $P1287 = root_new ['parrot';'Hash']
  vivify_211:
    set $P102, $P1287["bytecode"]
    unless_null $P102, vivify_212
    new $P102, "Undef"
  vivify_212:
    store_lex "$bc", $P102
.annotate 'line', 410
    find_lex $P102, "$bc"
    set $N100, $P102
    new $P103, 'Float'
    set $P103, $N100
    store_lex "$pos", $P103
.annotate 'line', 414
    find_lex $P102, "$l"
    $P103 = $P102."name"()
.annotate 'line', 413
    find_lex $P1288, "%context"
    unless_null $P1288, vivify_213
    $P1288 = root_new ['parrot';'Hash']
  vivify_213:
    set $P104, $P1288["opcode_offset"]
    unless_null $P104, vivify_214
    new $P104, "Undef"
  vivify_214:
    find_lex $P1289, "%context"
    unless_null $P1289, vivify_215
    $P1289 = root_new ['parrot';'Hash']
  vivify_215:
    set $P105, $P1289["opcode_fullname"]
    unless_null $P105, vivify_216
    new $P105, "Undef"
  vivify_216:
    $P106 = "hash"($P103 :named("name"), $P104 :named("offset"), $P105 :named("opname"))
    find_lex $P107, "$pos"
    find_lex $P1290, "%context"
    unless_null $P1290, vivify_217
    $P1290 = root_new ['parrot';'Hash']
    store_lex "%context", $P1290
  vivify_217:
    set $P1291, $P1290["labels_todo"]
    unless_null $P1291, vivify_218
    $P1291 = root_new ['parrot';'Hash']
    set $P1290["labels_todo"], $P1291
  vivify_218:
    set $P1291[$P107], $P106
.annotate 'line', 419
    find_lex $P1293, "%context"
    unless_null $P1293, vivify_219
    $P1293 = root_new ['parrot';'Hash']
  vivify_219:
    set $P102, $P1293["DEBUG"]
    unless_null $P102, vivify_220
    new $P102, "Undef"
  vivify_220:
    unless $P102, if_1292_end
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "Todo label '"
    find_lex $P105, "$l"
    $P106 = $P105."name"()
    set $S100, $P106
    concat $P105, $P104, $S100
    concat $P107, $P105, "' at "
    find_lex $P108, "$pos"
    concat $P109, $P107, $P108
    concat $P110, $P109, ", "
    find_lex $P1294, "%context"
    unless_null $P1294, vivify_221
    $P1294 = root_new ['parrot';'Hash']
  vivify_221:
    set $P111, $P1294["opcode_offset"]
    unless_null $P111, vivify_222
    new $P111, "Undef"
  vivify_222:
    set $S101, $P111
    concat $P112, $P110, $S101
    $P103."debug"($P112)
  if_1292_end:
.annotate 'line', 407
    .return (0)
  control_1281:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("36_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1298
    .param pmc param_1299
    .param pmc param_1300
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 431
    .const 'Sub' $P1313 = "37_1312182912.80612" 
    capture_lex $P1313
    new $P1297, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1297, control_1296
    push_eh $P1297
    .lex "self", self
    .lex "$opname", param_1298
    .lex "@args", param_1299
    .lex "%context", param_1300
.annotate 'line', 432
    new $P100, "Undef"
    set $P1301, $P100
    .lex "$bc", $P1301
.annotate 'line', 433
    new $P101, "Undef"
    set $P1302, $P101
    .lex "$signature", $P1302
.annotate 'line', 434
    new $P102, "Undef"
    set $P1303, $P102
    .lex "$sig_idx", $P1303
.annotate 'line', 441
    $P1305 = root_new ['parrot';'ResizablePMCArray']
    set $P1304, $P1305
    .lex "@op", $P1304
.annotate 'line', 432
    find_lex $P1306, "%context"
    unless_null $P1306, vivify_223
    $P1306 = root_new ['parrot';'Hash']
  vivify_223:
    set $P103, $P1306["bytecode"]
    unless_null $P103, vivify_224
    new $P103, "Undef"
  vivify_224:
    store_lex "$bc", $P103
.annotate 'line', 433
    find_lex $P103, "self"
    find_lex $P104, "@args"
    find_lex $P105, "%context"
    $P106 = $P103."build_args_signature"($P104, $P105)
    store_lex "$signature", $P106
.annotate 'line', 434
    find_lex $P1307, "%context"
    unless_null $P1307, vivify_225
    $P1307 = root_new ['parrot';'Hash']
  vivify_225:
    set $P103, $P1307["constants"]
    unless_null $P103, vivify_226
    new $P103, "Undef"
  vivify_226:
    find_lex $P104, "$signature"
    $P105 = $P103."get_or_create_pmc"($P104)
    store_lex "$sig_idx", $P105
.annotate 'line', 436
    find_lex $P1309, "%context"
    unless_null $P1309, vivify_227
    $P1309 = root_new ['parrot';'Hash']
  vivify_227:
    set $P103, $P1309["DEBUG"]
    unless_null $P103, vivify_228
    new $P103, "Undef"
  vivify_228:
    unless $P103, if_1308_end
    find_lex $P104, "self"
    new $P105, 'String'
    set $P105, "Sig: "
    find_lex $P106, "$sig_idx"
    concat $P107, $P105, $P106
    $P104."debug"($P107)
  if_1308_end:
.annotate 'line', 438
    find_lex $P1311, "%context"
    unless_null $P1311, vivify_229
    $P1311 = root_new ['parrot';'Hash']
  vivify_229:
    set $P103, $P1311["DEBUG"]
    unless_null $P103, vivify_230
    new $P103, "Undef"
  vivify_230:
    unless $P103, if_1310_end
    find_lex $P104, "self"
    find_lex $P105, "$opname"
    $P104."debug"($P105)
  if_1310_end:
.annotate 'line', 441
    find_lex $P103, "$opname"
    find_lex $P104, "$sig_idx"
    $P105 = "list"($P103, $P104)
    store_lex "@op", $P105
.annotate 'line', 443
    find_lex $P104, "@args"
    defined $I100, $P104
    unless $I100, for_undef_231
    iter $P103, $P104
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1323_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1323_test:
    unless $P103, loop1323_done
    shift $P105, $P103
  loop1323_redo:
    .const 'Sub' $P1313 = "37_1312182912.80612" 
    capture_lex $P1313
    $P1313($P105)
  loop1323_next:
    goto loop1323_test
  loop1323_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop1323_next
    eq $P107, .CONTROL_LOOP_REDO, loop1323_redo
  loop1323_done:
    pop_eh 
  for_undef_231:
.annotate 'line', 454
    find_lex $P103, "$bc"
    find_lex $P104, "@op"
    $P105 = $P103."push"($P104)
.annotate 'line', 431
    .return ($P105)
  control_1296:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1312"  :anon :subid("37_1312182912.80612") :outer("36_1312182912.80612")
    .param pmc param_1314
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 443
    .const 'Sub' $P1317 = "38_1312182912.80612" 
    capture_lex $P1317
    .lex "$arg", param_1314
.annotate 'line', 445
    find_lex $P106, "$arg"
    $P107 = $P106."modifier"()
    isa $I101, $P107, "Hash"
    unless $I101, if_1315_end
    .const 'Sub' $P1317 = "38_1312182912.80612" 
    capture_lex $P1317
    $P1317()
  if_1315_end:
.annotate 'line', 451
    find_lex $P106, "@op"
    find_lex $P107, "self"
    find_lex $P108, "$arg"
    find_lex $P109, "%context"
    $P110 = $P107."to_op"($P108, $P109)
    $P111 = $P106."push"($P110)
.annotate 'line', 443
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1316"  :anon :subid("38_1312182912.80612") :outer("37_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 446
    new $P108, "Undef"
    set $P1318, $P108
    .lex "$name", $P1318
    find_lex $P109, "$arg"
    $P110 = $P109."modifier"()
    set $P111, $P110["named"]
    unless_null $P111, vivify_232
    new $P111, "Undef"
  vivify_232:
    set $P1319, $P111
    defined $I1321, $P1319
    if $I1321, default_1320
    find_lex $P112, "$arg"
    $P113 = $P112."name"()
    set $P1319, $P113
  default_1320:
    store_lex "$name", $P1319
.annotate 'line', 447
    find_lex $P109, "@op"
.annotate 'line', 448
    find_lex $P1322, "%context"
    unless_null $P1322, vivify_233
    $P1322 = root_new ['parrot';'Hash']
  vivify_233:
    set $P110, $P1322["constants"]
    unless_null $P110, vivify_234
    new $P110, "Undef"
  vivify_234:
    find_lex $P111, "$name"
    $P112 = $P110."get_or_create_string"($P111)
    $P113 = $P109."push"($P112)
.annotate 'line', 445
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("39_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1327
    .param pmc param_1328
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 457
    .const 'Sub' $P1346 = "42_1312182912.80612" 
    capture_lex $P1346
    .const 'Sub' $P1335 = "40_1312182912.80612" 
    capture_lex $P1335
    new $P1326, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1326, control_1325
    push_eh $P1326
    .lex "self", self
    .lex "@args", param_1327
    .lex "%context", param_1328
.annotate 'line', 458
    $P1330 = root_new ['parrot';'ResizablePMCArray']
    set $P1329, $P1330
    .lex "@sig", $P1329
.annotate 'line', 471
    new $P100, "Undef"
    set $P1331, $P100
    .lex "$elements", $P1331
.annotate 'line', 472
    new $P101, "Undef"
    set $P1332, $P101
    .lex "$signature", $P1332
.annotate 'line', 480
    new $P102, "Undef"
    set $P1333, $P102
    .lex "$idx", $P1333
.annotate 'line', 457
    find_lex $P103, "@sig"
.annotate 'line', 459
    find_lex $P104, "@args"
    defined $I100, $P104
    unless $I100, for_undef_235
    iter $P103, $P104
    new $P108, 'ExceptionHandler'
    set_label $P108, loop1343_handler
    $P108."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P108
  loop1343_test:
    unless $P103, loop1343_done
    shift $P105, $P103
  loop1343_redo:
    .const 'Sub' $P1335 = "40_1312182912.80612" 
    capture_lex $P1335
    $P1335($P105)
  loop1343_next:
    goto loop1343_test
  loop1343_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, 'type'
    eq $P109, .CONTROL_LOOP_NEXT, loop1343_next
    eq $P109, .CONTROL_LOOP_REDO, loop1343_redo
  loop1343_done:
    pop_eh 
  for_undef_235:
.annotate 'line', 471
    find_lex $P103, "@sig"
    set $N100, $P103
    new $P104, 'Float'
    set $P104, $N100
    store_lex "$elements", $P104
.annotate 'line', 472

        $P1344 = find_lex '$elements'
        $I99 = $P1344
        $P1344 = find_lex '$signature'
        $P1344 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1344
.annotate 'line', 480
    new $P103, "Integer"
    assign $P103, 0
    store_lex "$idx", $P103
.annotate 'line', 481
    find_lex $P104, "@sig"
    defined $I100, $P104
    unless $I100, for_undef_237
    iter $P103, $P104
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1350_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1350_test:
    unless $P103, loop1350_done
    shift $P105, $P103
  loop1350_redo:
    .const 'Sub' $P1346 = "42_1312182912.80612" 
    capture_lex $P1346
    $P1346($P105)
  loop1350_next:
    goto loop1350_test
  loop1350_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop1350_next
    eq $P107, .CONTROL_LOOP_REDO, loop1350_redo
  loop1350_done:
    pop_eh 
  for_undef_237:
.annotate 'line', 457
    find_lex $P103, "$signature"
    .return ($P103)
  control_1325:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "_block1334"  :anon :subid("40_1312182912.80612") :outer("39_1312182912.80612")
    .param pmc param_1336
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 459
    .const 'Sub' $P1340 = "41_1312182912.80612" 
    capture_lex $P1340
    .lex "$arg", param_1336
.annotate 'line', 461
    new $P106, "Undef"
    set $P1337, $P106
    .lex "$s", $P1337
    find_lex $P107, "self"
    find_lex $P108, "$arg"
    find_lex $P109, "%context"
    $P110 = $P107."build_single_arg"($P108, $P109)
    store_lex "$s", $P110
.annotate 'line', 462
    find_lex $P108, "$s"
    isa $I101, $P108, "Integer"
    if $I101, if_1338
.annotate 'line', 466
    find_lex $P110, "$s"
    defined $I102, $P110
    unless $I102, for_undef_236
    iter $P109, $P110
    new $P113, 'ExceptionHandler'
    set_label $P113, loop1342_handler
    $P113."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P113
  loop1342_test:
    unless $P109, loop1342_done
    shift $P112, $P109
  loop1342_redo:
    .const 'Sub' $P1340 = "41_1312182912.80612" 
    capture_lex $P1340
    $P1340($P112)
  loop1342_next:
    goto loop1342_test
  loop1342_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, 'type'
    eq $P114, .CONTROL_LOOP_NEXT, loop1342_next
    eq $P114, .CONTROL_LOOP_REDO, loop1342_redo
  loop1342_done:
    pop_eh 
  for_undef_236:
.annotate 'line', 465
    set $P107, $P109
.annotate 'line', 462
    goto if_1338_end
  if_1338:
.annotate 'line', 463
    find_lex $P109, "@sig"
    find_lex $P110, "$s"
    $P111 = $P109."push"($P110)
.annotate 'line', 462
    set $P107, $P111
  if_1338_end:
.annotate 'line', 459
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1339"  :anon :subid("41_1312182912.80612") :outer("40_1312182912.80612")
    .param pmc param_1341
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 466
    .lex "$_", param_1341
    find_lex $P113, "@sig"
    find_lex $P114, "$_"
    $P115 = $P113."push"($P114)
    .return ($P115)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1345"  :anon :subid("42_1312182912.80612") :outer("39_1312182912.80612")
    .param pmc param_1347
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 481
    .lex "$val", param_1347
.annotate 'line', 482
    find_lex $P106, "$val"
    find_lex $P107, "$idx"
    set $I101, $P107
    find_lex $P1348, "$signature"
    unless_null $P1348, vivify_238
    $P1348 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1348
  vivify_238:
    set $P1348[$I101], $P106
.annotate 'line', 481
    find_lex $P106, "$idx"
    clone $P1349, $P106
    inc $P106
    .return ($P1349)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("43_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1354
    .param pmc param_1355
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 489
    new $P1353, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1353, control_1352
    push_eh $P1353
    .lex "self", self
    .lex "$arg", param_1354
    .lex "%context", param_1355
.annotate 'line', 492
    new $P100, "Undef"
    set $P1356, $P100
    .lex "$type", $P1356
.annotate 'line', 494
    new $P101, "Undef"
    set $P1357, $P101
    .lex "$res", $P1357
.annotate 'line', 508
    new $P102, "Undef"
    set $P1358, $P102
    .lex "$mod", $P1358
.annotate 'line', 492
    find_lex $P103, "$arg"
    $P104 = $P103."type"()
    set $P1359, $P104
    defined $I1361, $P1359
    if $I1361, default_1360
    find_lex $P105, "self"
    find_lex $P106, "$arg"
    $P107 = $P106."name"()
    find_lex $P108, "%context"
    $P109 = $P105."get_register"($P107, $P108)
    $P110 = $P109."type"()
    set $P1359, $P110
  default_1360:
    store_lex "$type", $P1359
.annotate 'line', 489
    find_lex $P103, "$res"
.annotate 'line', 497
    find_lex $P103, "$type"
    set $S100, $P103
    iseq $I100, $S100, "i"
    if $I100, if_1362
.annotate 'line', 498
    find_lex $P104, "$type"
    set $S101, $P104
    iseq $I101, $S101, "s"
    if $I101, if_1363
.annotate 'line', 499
    find_lex $P105, "$type"
    set $S102, $P105
    iseq $I102, $S102, "p"
    if $I102, if_1364
.annotate 'line', 500
    find_lex $P106, "$type"
    set $S103, $P106
    iseq $I103, $S103, "n"
    if $I103, if_1365
.annotate 'line', 502
    find_lex $P107, "$type"
    set $S104, $P107
    iseq $I104, $S104, "ic"
    if $I104, if_1366
.annotate 'line', 503
    find_lex $P108, "$type"
    set $S105, $P108
    iseq $I105, $S105, "sc"
    if $I105, if_1367
.annotate 'line', 504
    find_lex $P109, "$type"
    set $S106, $P109
    iseq $I106, $S106, "pc"
    if $I106, if_1368
.annotate 'line', 505
    find_lex $P110, "$type"
    set $S107, $P110
    iseq $I107, $S107, "nc"
    if $I107, if_1369
.annotate 'line', 506
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "Unknown arg type '"
    find_lex $P113, "$type"
    concat $P114, $P112, $P113
    concat $P115, $P114, "'"
    $P111."panic"($P115)
    goto if_1369_end
  if_1369:
.annotate 'line', 505
    new $P111, "Integer"
    assign $P111, 3
    add $P112, $P111, 16
    store_lex "$res", $P112
  if_1369_end:
    goto if_1368_end
  if_1368:
.annotate 'line', 504
    new $P110, "Integer"
    assign $P110, 2
    add $P111, $P110, 16
    store_lex "$res", $P111
  if_1368_end:
    goto if_1367_end
  if_1367:
.annotate 'line', 503
    new $P109, "Integer"
    assign $P109, 1
    add $P110, $P109, 16
    store_lex "$res", $P110
  if_1367_end:
    goto if_1366_end
  if_1366:
.annotate 'line', 502
    new $P108, "Integer"
    assign $P108, 0
    add $P109, $P108, 16
    store_lex "$res", $P109
  if_1366_end:
    goto if_1365_end
  if_1365:
.annotate 'line', 500
    new $P107, "Integer"
    assign $P107, 3
    store_lex "$res", $P107
  if_1365_end:
    goto if_1364_end
  if_1364:
.annotate 'line', 499
    new $P106, "Integer"
    assign $P106, 2
    store_lex "$res", $P106
  if_1364_end:
    goto if_1363_end
  if_1363:
.annotate 'line', 498
    new $P105, "Integer"
    assign $P105, 1
    store_lex "$res", $P105
  if_1363_end:
    goto if_1362_end
  if_1362:
.annotate 'line', 497
    new $P104, "Integer"
    assign $P104, 0
    store_lex "$res", $P104
  if_1362_end:
.annotate 'line', 508
    find_lex $P103, "$arg"
    $P104 = $P103."modifier"()
    store_lex "$mod", $P104
.annotate 'line', 509
    find_lex $P103, "$mod"
    unless $P103, if_1370_end
.annotate 'line', 510
    find_lex $P104, "$mod"
    isa $I100, $P104, "Hash"
    if $I100, if_1371
.annotate 'line', 515
    find_lex $P105, "$mod"
    set $S100, $P105
    iseq $I101, $S100, "slurpy"
    if $I101, if_1372
.annotate 'line', 516
    find_lex $P106, "$mod"
    set $S101, $P106
    iseq $I102, $S101, "flat"
    if $I102, if_1373
.annotate 'line', 517
    find_lex $P107, "$mod"
    set $S102, $P107
    iseq $I103, $S102, "optional"
    if $I103, if_1374
.annotate 'line', 518
    find_lex $P108, "$mod"
    set $S103, $P108
    iseq $I104, $S103, "opt_flag"
    if $I104, if_1375
.annotate 'line', 519
    find_lex $P109, "$mod"
    set $S104, $P109
    iseq $I105, $S104, "slurpy named"
    if $I105, if_1376
.annotate 'line', 520
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Unsupported modifier "
    find_lex $P112, "$mod"
    concat $P113, $P111, $P112
    $P110."panic"($P113)
    goto if_1376_end
  if_1376:
.annotate 'line', 519
    find_lex $P110, "$res"
    add $P111, $P110, 32
    add $P112, $P111, 512
    store_lex "$res", $P112
  if_1376_end:
    goto if_1375_end
  if_1375:
.annotate 'line', 518
    find_lex $P109, "$res"
    add $P110, $P109, 256
    store_lex "$res", $P110
  if_1375_end:
    goto if_1374_end
  if_1374:
.annotate 'line', 517
    find_lex $P108, "$res"
    add $P109, $P108, 128
    store_lex "$res", $P109
  if_1374_end:
    goto if_1373_end
  if_1373:
.annotate 'line', 516
    find_lex $P107, "$res"
    add $P108, $P107, 32
    store_lex "$res", $P108
  if_1373_end:
    goto if_1372_end
  if_1372:
.annotate 'line', 515
    find_lex $P106, "$res"
    add $P107, $P106, 32
    store_lex "$res", $P107
  if_1372_end:
    goto if_1371_end
  if_1371:
.annotate 'line', 513
    new $P105, "Integer"
    assign $P105, 1
    add $P106, $P105, 16
    add $P107, $P106, 512
    find_lex $P108, "$res"
    add $P109, $P108, 512
    $P110 = "list"($P107, $P109)
    store_lex "$res", $P110
  if_1371_end:
  if_1370_end:
.annotate 'line', 489
    find_lex $P103, "$res"
    .return ($P103)
  control_1352:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("44_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1380
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 531
    .const 'Sub' $P1382 = "45_1312182912.80612" 
    capture_lex $P1382
    new $P1379, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1379, control_1378
    push_eh $P1379
    .lex "self", self
    .lex "$post", param_1380
.annotate 'line', 532
    find_lex $P101, "$post"
    $P102 = $P101."list"()
    defined $I100, $P102
    unless $I100, for_undef_239
    iter $P100, $P102
    new $P105, 'ExceptionHandler'
    set_label $P105, loop1385_handler
    $P105."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P105
  loop1385_test:
    unless $P100, loop1385_done
    shift $P103, $P100
  loop1385_redo:
    .const 'Sub' $P1382 = "45_1312182912.80612" 
    capture_lex $P1382
    $P1382($P103)
  loop1385_next:
    goto loop1385_test
  loop1385_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, 'type'
    eq $P106, .CONTROL_LOOP_NEXT, loop1385_next
    eq $P106, .CONTROL_LOOP_REDO, loop1385_redo
  loop1385_done:
    pop_eh 
  for_undef_239:
.annotate 'line', 531
    .return ($P100)
  control_1378:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1381"  :anon :subid("45_1312182912.80612") :outer("44_1312182912.80612")
    .param pmc param_1383
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 532
    .lex "$sub", param_1383
.annotate 'line', 534
    find_lex $P105, "$sub"
    get_hll_global $P106, ["POST"], "Sub"
    $P107 = $P105."isa"($P106)
    if $P107, if_1384
    set $P104, $P107
    goto if_1384_end
  if_1384:
    find_lex $P108, "$post"
    find_lex $P109, "$sub"
    $P110 = $P109."full_name"()
    find_lex $P111, "$sub"
    $P112 = $P108."sub"($P110, $P111)
    set $P104, $P112
  if_1384_end:
.annotate 'line', 532
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("46_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1389
    .param pmc param_1390
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 539
    new $P1388, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1388, control_1387
    push_eh $P1388
    .lex "self", self
    .lex "$sub", param_1389
    .lex "%context", param_1390
.annotate 'line', 547
    new $P100, "Undef"
    set $P1391, $P100
    .lex "$res", $P1391
    new $P101, "Integer"
    assign $P101, 0
    store_lex "$res", $P101
.annotate 'line', 548
    find_lex $P101, "$res"
    new $P102, "Integer"
    assign $P102, 1
    find_lex $P103, "$sub"
    $N100 = $P103."outer"()
    mul $P104, $P102, $N100
    add $P105, $P101, $P104
    store_lex "$res", $P105
.annotate 'line', 549
    find_lex $P101, "$res"
    new $P102, "Integer"
    assign $P102, 8
    find_lex $P103, "$sub"
    $N100 = $P103."anon"()
    mul $P104, $P102, $N100
    add $P105, $P101, $P104
    store_lex "$res", $P105
.annotate 'line', 550
    find_lex $P101, "$res"
    new $P102, "Integer"
    assign $P102, 16
    find_lex $P103, "$sub"
    $N100 = $P103."main"()
    mul $P104, $P102, $N100
    add $P105, $P101, $P104
    store_lex "$res", $P105
.annotate 'line', 551
    find_lex $P101, "$res"
    new $P102, "Integer"
    assign $P102, 32
    find_lex $P103, "$sub"
    $N100 = $P103."load"()
    mul $P104, $P102, $N100
    add $P105, $P101, $P104
    store_lex "$res", $P105
.annotate 'line', 552
    find_lex $P101, "$res"
    new $P102, "Integer"
    assign $P102, 64
    find_lex $P103, "$sub"
    $N100 = $P103."immediate"()
    mul $P104, $P102, $N100
    add $P105, $P101, $P104
    store_lex "$res", $P105
.annotate 'line', 553
    find_lex $P101, "$res"
    new $P102, "Integer"
    assign $P102, 128
    find_lex $P103, "$sub"
    $N100 = $P103."postcomp"()
    mul $P104, $P102, $N100
    add $P105, $P101, $P104
    store_lex "$res", $P105
.annotate 'line', 555
    find_lex $P1393, "%context"
    unless_null $P1393, vivify_240
    $P1393 = root_new ['parrot';'Hash']
  vivify_240:
    set $P101, $P1393["DEBUG"]
    unless_null $P101, vivify_241
    new $P101, "Undef"
  vivify_241:
    unless $P101, if_1392_end
    find_lex $P102, "self"
    new $P103, 'String'
    set $P103, "pf_flags "
    find_lex $P104, "$res"
    concat $P105, $P103, $P104
    $P102."debug"($P105)
  if_1392_end:
.annotate 'line', 539
    find_lex $P101, "$res"
    .return ($P101)
  control_1387:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("47_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1397
    .param pmc param_1398
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 560
    new $P1396, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1396, control_1395
    push_eh $P1396
    .lex "self", self
    .lex "$sub", param_1397
    .lex "%context", param_1398
.annotate 'line', 565
    new $P100, "Undef"
    set $P1399, $P100
    .lex "$res", $P1399
    new $P101, "Integer"
    assign $P101, 0
    store_lex "$res", $P101
.annotate 'line', 566
    find_lex $P101, "$sub"
    $P102 = $P101."vtable"()
    unless $P102, if_1400_end
    find_lex $P103, "$res"
    add $P104, $P103, 2
    store_lex "$res", $P104
  if_1400_end:
.annotate 'line', 567
    find_lex $P101, "$sub"
    $P102 = $P101."is_method"()
    unless $P102, if_1401_end
    find_lex $P103, "$res"
    add $P104, $P103, 4
    store_lex "$res", $P104
  if_1401_end:
.annotate 'line', 568
    find_lex $P101, "$sub"
    $P102 = $P101."is_init"()
    unless $P102, if_1402_end
    find_lex $P103, "$res"
    add $P104, $P103, 1024
    store_lex "$res", $P104
  if_1402_end:
.annotate 'line', 569
    find_lex $P101, "$sub"
    $P102 = $P101."nsentry"()
    unless $P102, if_1403_end
    find_lex $P103, "$res"
    add $P104, $P103, 2048
    store_lex "$res", $P104
  if_1403_end:
.annotate 'line', 571
    find_lex $P1405, "%context"
    unless_null $P1405, vivify_242
    $P1405 = root_new ['parrot';'Hash']
  vivify_242:
    set $P101, $P1405["DEBUG"]
    unless_null $P101, vivify_243
    new $P101, "Undef"
  vivify_243:
    unless $P101, if_1404_end
    find_lex $P102, "self"
    new $P103, 'String'
    set $P103, "comp_flags "
    find_lex $P104, "$res"
    concat $P105, $P103, $P104
    $P102."debug"($P105)
  if_1404_end:
.annotate 'line', 560
    find_lex $P101, "$res"
    .return ($P101)
  control_1395:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("48_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1409
    .param pmc param_1410
    .param pmc param_1411
    .param pmc param_1412
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 576
    .const 'Sub' $P1416 = "49_1312182912.80612" 
    capture_lex $P1416
    new $P1408, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1408, control_1407
    push_eh $P1408
    .lex "self", self
    .lex "$sub", param_1409
    .lex "$labels_todo", param_1410
    .lex "$bc", param_1411
    .lex "%context", param_1412
.annotate 'line', 577
    find_lex $P1414, "%context"
    unless_null $P1414, vivify_244
    $P1414 = root_new ['parrot';'Hash']
  vivify_244:
    set $P100, $P1414["DEBUG"]
    unless_null $P100, vivify_245
    new $P100, "Undef"
  vivify_245:
    unless $P100, if_1413_end
    find_lex $P101, "self"
    $P101."debug"("Fixup labels")
  if_1413_end:
.annotate 'line', 578
    find_lex $P101, "$labels_todo"
    defined $I100, $P101
    unless $I100, for_undef_246
    iter $P100, $P101
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1433_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1433_test:
    unless $P100, loop1433_done
    shift $P102, $P100
  loop1433_redo:
    .const 'Sub' $P1416 = "49_1312182912.80612" 
    capture_lex $P1416
    $P1416($P102)
  loop1433_next:
    goto loop1433_test
  loop1433_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1433_next
    eq $P108, .CONTROL_LOOP_REDO, loop1433_redo
  loop1433_done:
    pop_eh 
  for_undef_246:
.annotate 'line', 576
    .return ($P100)
  control_1407:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1415"  :anon :subid("49_1312182912.80612") :outer("48_1312182912.80612")
    .param pmc param_1417
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 578
    .lex "$kv", param_1417
.annotate 'line', 579
    new $P103, "Undef"
    set $P1418, $P103
    .lex "$offset", $P1418
.annotate 'line', 580
    $P1420 = root_new ['parrot';'Hash']
    set $P1419, $P1420
    .lex "%todo", $P1419
.annotate 'line', 583
    new $P104, "Undef"
    set $P1421, $P104
    .lex "$op", $P1421
.annotate 'line', 586
    new $P105, "Undef"
    set $P1422, $P105
    .lex "$delta", $P1422
.annotate 'line', 579
    find_lex $P106, "$kv"
    $P107 = $P106."key"()
    store_lex "$offset", $P107
.annotate 'line', 580
    find_lex $P106, "$kv"
    $P107 = $P106."value"()
    store_lex "%todo", $P107
.annotate 'line', 581
    find_lex $P1424, "%context"
    unless_null $P1424, vivify_247
    $P1424 = root_new ['parrot';'Hash']
  vivify_247:
    set $P106, $P1424["DEBUG"]
    unless_null $P106, vivify_248
    new $P106, "Undef"
  vivify_248:
    unless $P106, if_1423_end
    find_lex $P107, "self"
    new $P108, 'String'
    set $P108, "Fixing '"
    find_lex $P1425, "%todo"
    unless_null $P1425, vivify_249
    $P1425 = root_new ['parrot';'Hash']
  vivify_249:
    set $P109, $P1425["name"]
    unless_null $P109, vivify_250
    new $P109, "Undef"
  vivify_250:
    set $S100, $P109
    concat $P110, $P108, $S100
    concat $P111, $P110, "' from op "
    find_lex $P1426, "%todo"
    unless_null $P1426, vivify_251
    $P1426 = root_new ['parrot';'Hash']
  vivify_251:
    set $P112, $P1426["opname"]
    unless_null $P112, vivify_252
    new $P112, "Undef"
  vivify_252:
    set $S101, $P112
    concat $P113, $P111, $S101
    concat $P114, $P113, " at "
    find_lex $P115, "$offset"
    set $S102, $P115
    concat $P116, $P114, $S102
    $P107."debug"($P116)
  if_1423_end:
.annotate 'line', 583
    find_lex $P1427, "%todo"
    unless_null $P1427, vivify_253
    $P1427 = root_new ['parrot';'Hash']
  vivify_253:
    set $P106, $P1427["opname"]
    unless_null $P106, vivify_254
    new $P106, "Undef"
  vivify_254:
    set $S100, $P106
    find_lex $P107, "$bc"
    $P108 = $P107."opmap"()
    set $P109, $P108[$S100]
    unless_null $P109, vivify_255
    new $P109, "Undef"
  vivify_255:
    store_lex "$op", $P109
.annotate 'line', 584
    find_lex $P1429, "%context"
    unless_null $P1429, vivify_256
    $P1429 = root_new ['parrot';'Hash']
  vivify_256:
    set $P106, $P1429["DEBUG"]
    unless_null $P106, vivify_257
    new $P106, "Undef"
  vivify_257:
    unless $P106, if_1428_end
    find_lex $P107, "self"
    new $P108, 'String'
    set $P108, "Op length is "
    find_lex $P109, "$op"
    $P110 = $P109."length"()
    set $S100, $P110
    concat $P109, $P108, $S100
    $P107."debug"($P109)
  if_1428_end:
.annotate 'line', 586
    find_lex $P106, "$sub"
    find_lex $P1430, "%todo"
    unless_null $P1430, vivify_258
    $P1430 = root_new ['parrot';'Hash']
  vivify_258:
    set $P107, $P1430["name"]
    unless_null $P107, vivify_259
    new $P107, "Undef"
  vivify_259:
    $P108 = $P106."label"($P107)
    $P109 = $P108."position"()
    find_lex $P1431, "%todo"
    unless_null $P1431, vivify_260
    $P1431 = root_new ['parrot';'Hash']
  vivify_260:
    set $P110, $P1431["offset"]
    unless_null $P110, vivify_261
    new $P110, "Undef"
  vivify_261:
    sub $P111, $P109, $P110
    store_lex "$delta", $P111
.annotate 'line', 588
    find_lex $P106, "$delta"
    find_lex $P107, "$offset"
    find_lex $P108, "$op"
    $N100 = $P108."length"()
    add $P109, $P107, $N100
    set $I101, $P109
    find_lex $P1432, "$bc"
    unless_null $P1432, vivify_262
    $P1432 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1432
  vivify_262:
    set $P1432[$I101], $P106
.annotate 'line', 578
    .return ($P106)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("50_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1437
    .param pmc param_1438
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 593
    new $P1436, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1436, control_1435
    push_eh $P1436
    .lex "self", self
    .lex "$name", param_1437
    .lex "%context", param_1438
.annotate 'line', 594
    new $P100, "Undef"
    set $P1439, $P100
    .lex "$reg", $P1439
    find_lex $P1440, "%context"
    unless_null $P1440, vivify_263
    $P1440 = root_new ['parrot';'Hash']
  vivify_263:
    set $P101, $P1440["sub"]
    unless_null $P101, vivify_264
    new $P101, "Undef"
  vivify_264:
    find_lex $P102, "$name"
    $P103 = $P101."symbol"($P102)
    store_lex "$reg", $P103
.annotate 'line', 595
    find_lex $P101, "$reg"
    isfalse $I100, $P101
    unless $I100, if_1441_end
.annotate 'line', 596
    find_lex $P102, "self"
    new $P103, 'String'
    set $P103, "Register '"
    find_lex $P104, "$name"
    set $S100, $P104
    concat $P105, $P103, $S100
    concat $P106, $P105, "' not predeclared in '"
    find_lex $P1442, "%context"
    unless_null $P1442, vivify_265
    $P1442 = root_new ['parrot';'Hash']
  vivify_265:
    set $P107, $P1442["sub"]
    unless_null $P107, vivify_266
    new $P107, "Undef"
  vivify_266:
    $P108 = $P107."name"()
    set $S101, $P108
    concat $P107, $P106, $S101
    concat $P109, $P107, "'"
    $P102."panic"($P109)
  if_1441_end:
.annotate 'line', 593
    find_lex $P101, "$reg"
    .return ($P101)
  control_1435:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "debug"  :subid("51_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1446 :slurpy
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 601
    .const 'Sub' $P1448 = "52_1312182912.80612" 
    capture_lex $P1448
    new $P1445, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1445, control_1444
    push_eh $P1445
    .lex "self", self
    .lex "@args", param_1446
.annotate 'line', 602
    find_lex $P101, "@args"
    defined $I100, $P101
    unless $I100, for_undef_267
    iter $P100, $P101
    new $P103, 'ExceptionHandler'
    set_label $P103, loop1450_handler
    $P103."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P103
  loop1450_test:
    unless $P100, loop1450_done
    shift $P102, $P100
  loop1450_redo:
    .const 'Sub' $P1448 = "52_1312182912.80612" 
    capture_lex $P1448
    $P1448($P102)
  loop1450_next:
    goto loop1450_test
  loop1450_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, 'type'
    eq $P104, .CONTROL_LOOP_NEXT, loop1450_next
    eq $P104, .CONTROL_LOOP_REDO, loop1450_redo
  loop1450_done:
    pop_eh 
  for_undef_267:
.annotate 'line', 601
    .return ($P100)
  control_1444:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1447"  :anon :subid("52_1312182912.80612") :outer("51_1312182912.80612")
    .param pmc param_1449
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 602
    .lex "$_", param_1449
.annotate 'line', 603
    find_lex $P103, "$_"
    say $P103
.annotate 'line', 602
    .return ()
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("53_1312182912.80612") :method :outer("11_1312182912.80612")
    .param pmc param_1454
    .param pmc param_1455
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 607
    new $P1453, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1453, control_1452
    push_eh $P1453
    .lex "self", self
    .lex "$past", param_1454
    .lex "%adverbs", param_1455
.annotate 'line', 608
    $P1457 = root_new ['parrot';'Hash']
    set $P1456, $P1457
    .lex "%context", $P1456
.annotate 'line', 616
    new $P100, "Undef"
    set $P1458, $P100
    .lex "$pfdir", $P1458
.annotate 'line', 607
    find_lex $P101, "%context"
.annotate 'line', 610
    find_lex $P101, "self"
    find_lex $P1459, "%context"
    unless_null $P1459, vivify_268
    $P1459 = root_new ['parrot';'Hash']
    store_lex "%context", $P1459
  vivify_268:
    set $P1459["compiler"], $P101
.annotate 'line', 612
    new $P101, "Packfile"
    find_lex $P1460, "%context"
    unless_null $P1460, vivify_269
    $P1460 = root_new ['parrot';'Hash']
    store_lex "%context", $P1460
  vivify_269:
    set $P1460["packfile"], $P101
.annotate 'line', 616
    find_lex $P1461, "%context"
    unless_null $P1461, vivify_270
    $P1461 = root_new ['parrot';'Hash']
  vivify_270:
    set $P101, $P1461["packfile"]
    unless_null $P101, vivify_271
    new $P101, "Undef"
  vivify_271:
    $P102 = $P101."get_directory"()
    store_lex "$pfdir", $P102
.annotate 'line', 619
    new $P101, "PackfileConstantTable"
    find_lex $P1462, "%context"
    unless_null $P1462, vivify_272
    $P1462 = root_new ['parrot';'Hash']
    store_lex "%context", $P1462
  vivify_272:
    set $P1462["constants"], $P101
.annotate 'line', 622
    new $P101, "FixedIntegerArray"
    find_lex $P1463, "%context"
    unless_null $P1463, vivify_273
    $P1463 = root_new ['parrot';'Hash']
    store_lex "%context", $P1463
  vivify_273:
    set $P1464, $P1463["constants"]
    unless_null $P1464, vivify_274
    $P1464 = root_new ['parrot';'ResizablePMCArray']
    set $P1463["constants"], $P1464
  vivify_274:
    set $P1464[0], $P101
.annotate 'line', 625
    find_lex $P1465, "%context"
    unless_null $P1465, vivify_275
    $P1465 = root_new ['parrot';'Hash']
  vivify_275:
    set $P101, $P1465["constants"]
    unless_null $P101, vivify_276
    new $P101, "Undef"
  vivify_276:
    find_lex $P1466, "$pfdir"
    unless_null $P1466, vivify_277
    $P1466 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1466
  vivify_277:
    set $P1466["CONSTANTS_hello.pir"], $P101
.annotate 'line', 628
    new $P101, "PackfileBytecodeSegment"
    find_lex $P1467, "%context"
    unless_null $P1467, vivify_278
    $P1467 = root_new ['parrot';'Hash']
    store_lex "%context", $P1467
  vivify_278:
    set $P1467["bytecode"], $P101
.annotate 'line', 629
    find_lex $P1468, "%context"
    unless_null $P1468, vivify_279
    $P1468 = root_new ['parrot';'Hash']
  vivify_279:
    set $P101, $P1468["bytecode"]
    unless_null $P101, vivify_280
    new $P101, "Undef"
  vivify_280:
    $P101."main_sub"(-1)
.annotate 'line', 631
    new $P101, "Integer"
    assign $P101, 0
    find_lex $P1469, "%context"
    unless_null $P1469, vivify_281
    $P1469 = root_new ['parrot';'Hash']
    store_lex "%context", $P1469
  vivify_281:
    set $P1469["got_main_sub"], $P101
.annotate 'line', 634
    find_lex $P1470, "%context"
    unless_null $P1470, vivify_282
    $P1470 = root_new ['parrot';'Hash']
  vivify_282:
    set $P101, $P1470["bytecode"]
    unless_null $P101, vivify_283
    new $P101, "Undef"
  vivify_283:
    find_lex $P1471, "$pfdir"
    unless_null $P1471, vivify_284
    $P1471 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1471
  vivify_284:
    set $P1471["BYTECODE_hello.pir"], $P101
.annotate 'line', 643
    get_hll_global $P101, ["POST"], "VanillaAllocator"
    $P102 = $P101."new"()
    find_lex $P1472, "%context"
    unless_null $P1472, vivify_285
    $P1472 = root_new ['parrot';'Hash']
    store_lex "%context", $P1472
  vivify_285:
    set $P1472["regalloc"], $P102
.annotate 'line', 645
    find_lex $P1473, "%adverbs"
    unless_null $P1473, vivify_286
    $P1473 = root_new ['parrot';'Hash']
  vivify_286:
    set $P101, $P1473["debug"]
    unless_null $P101, vivify_287
    new $P101, "Undef"
  vivify_287:
    find_lex $P1474, "%context"
    unless_null $P1474, vivify_288
    $P1474 = root_new ['parrot';'Hash']
    store_lex "%context", $P1474
  vivify_288:
    set $P1474["DEBUG"], $P101
.annotate 'line', 607
    find_lex $P101, "%context"
    .return ($P101)
  control_1452:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1476" :load :anon :subid("54_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 16
    .const 'Sub' $P1478 = "11_1312182912.80612" 
    $P100 = $P1478()
    .return ($P100)
.end


.namespace []
.sub "_block1479" :load :anon :subid("55_1312182912.80612")
.annotate 'file', "PBCCompiler.pm"
.annotate 'line', 1
    .const 'Sub' $P1481 = "10_1312182912.80612" 
    $P100 = $P1481()
    .return ($P100)
.end

