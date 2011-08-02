
.namespace []
.sub "_block1000"  :anon :subid("10_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312323127.11962" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312323127.11962" 
    capture_lex $P1003
    $P104 = $P1003()
.annotate 'line', 1
    .return ($P104)
    .const 'Sub' $P1518 = "60_1312323127.11962" 
    .return ($P1518)
.end


.namespace []
.sub "" :load :init :subid("post61") :outer("10_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312323127.11962" 
    .local pmc block
    set block, $P1001
    $P1520 = get_root_global ["parrot"], "P6metaclass"
    $P1520."new_class"("POST::PBCCompiler", "PCT::HLLCompiler" :named("parent"))
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1002"  :subid("11_1312323127.11962") :outer("10_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1489 = "58_1312323127.11962" 
    capture_lex $P1489
    .const 'Sub' $P1481 = "56_1312323127.11962" 
    capture_lex $P1481
    .const 'Sub' $P1472 = "55_1312323127.11962" 
    capture_lex $P1472
    .const 'Sub' $P1444 = "53_1312323127.11962" 
    capture_lex $P1444
    .const 'Sub' $P1432 = "52_1312323127.11962" 
    capture_lex $P1432
    .const 'Sub' $P1424 = "51_1312323127.11962" 
    capture_lex $P1424
    .const 'Sub' $P1415 = "49_1312323127.11962" 
    capture_lex $P1415
    .const 'Sub' $P1389 = "48_1312323127.11962" 
    capture_lex $P1389
    .const 'Sub' $P1362 = "44_1312323127.11962" 
    capture_lex $P1362
    .const 'Sub' $P1333 = "41_1312323127.11962" 
    capture_lex $P1333
    .const 'Sub' $P1318 = "40_1312323127.11962" 
    capture_lex $P1318
    .const 'Sub' $P1313 = "39_1312323127.11962" 
    capture_lex $P1313
    .const 'Sub' $P1307 = "38_1312323127.11962" 
    capture_lex $P1307
    .const 'Sub' $P1291 = "36_1312323127.11962" 
    capture_lex $P1291
    .const 'Sub' $P1278 = "35_1312323127.11962" 
    capture_lex $P1278
    .const 'Sub' $P1265 = "34_1312323127.11962" 
    capture_lex $P1265
    .const 'Sub' $P1201 = "30_1312323127.11962" 
    capture_lex $P1201
    .const 'Sub' $P1186 = "28_1312323127.11962" 
    capture_lex $P1186
    .const 'Sub' $P1177 = "26_1312323127.11962" 
    capture_lex $P1177
    .const 'Sub' $P1149 = "23_1312323127.11962" 
    capture_lex $P1149
    .const 'Sub' $P1059 = "20_1312323127.11962" 
    capture_lex $P1059
    .const 'Sub' $P1054 = "19_1312323127.11962" 
    capture_lex $P1054
    .const 'Sub' $P1035 = "17_1312323127.11962" 
    capture_lex $P1035
    .const 'Sub' $P1029 = "16_1312323127.11962" 
    capture_lex $P1029
    .const 'Sub' $P1015 = "14_1312323127.11962" 
    capture_lex $P1015
    .const 'Sub' $P1005 = "12_1312323127.11962" 
    capture_lex $P1005
.annotate 'line', 58
    .const 'Sub' $P1005 = "12_1312323127.11962" 
    newclosure $P1014, $P1005
    set $P1004, $P1014
    .lex "trigger", $P1004
.annotate 'line', 16
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    find_lex $P103, "trigger"
.annotate 'line', 690
    .const 'Sub' $P1489 = "58_1312323127.11962" 
    newclosure $P1513, $P1489
.annotate 'line', 16
    .return ($P1513)
    .const 'Sub' $P1515 = "59_1312323127.11962" 
    .return ($P1515)
.end


.namespace ["POST";"PBCCompiler"]
.sub "" :load :init :subid("post62") :outer("11_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312323127.11962" 
    .local pmc block
    set block, $P1003
.annotate 'line', 17
    get_hll_global $P104, ["POST"], "PBCCompiler"
    $P104."language"("newPOST")
.annotate 'line', 18
    get_hll_global $P104, ["POST"], "PBCCompiler"
    new $P105, "ResizablePMCArray"
    push $P105, "pbc"
    push $P105, "mainpmc"
    $P104."language"($P105)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "trigger"  :subid("12_1312323127.11962") :outer("11_1312323127.11962")
    .param pmc param_1008
    .param pmc param_1009
.annotate 'file', ''
.annotate 'line', 58
    .const 'Sub' $P1011 = "13_1312323127.11962" 
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
    unless $I101, for_undef_63
    iter $P101, $P104
    new $P108, 'ExceptionHandler'
    set_label $P108, loop1013_handler
    $P108."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P108
  loop1013_test:
    unless $P101, loop1013_done
    shift $P105, $P101
  loop1013_redo:
    .const 'Sub' $P1011 = "13_1312323127.11962" 
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
  for_undef_63:
.annotate 'line', 58
    .return ($P101)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1010"  :anon :subid("13_1312323127.11962") :outer("12_1312323127.11962")
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
.sub "packfile"  :subid("14_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1018
    .param pmc param_1019 :slurpy :named
.annotate 'file', ''
.annotate 'line', 36
    .const 'Sub' $P1025 = "15_1312323127.11962" 
    capture_lex $P1025
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
    .lex "$post", param_1018
    .lex "%adverbs", param_1019
.annotate 'line', 40
    $P1021 = root_new ['parrot';'Hash']
    set $P1020, $P1021
    .lex "%context", $P1020
    find_lex $P103, "self"
    find_lex $P104, "$post"
    find_lex $P105, "%adverbs"
    $P106 = $P103."create_context"($P104, $P105)
    store_lex "%context", $P106
.annotate 'line', 41
    new $P103, "Integer"
    assign $P103, 0
    find_lex $P1022, "%context"
    unless_null $P1022, vivify_64
    $P1022 = root_new ['parrot';'Hash']
    store_lex "%context", $P1022
  vivify_64:
    set $P1022["DEBUG"], $P103
.annotate 'line', 43
    find_lex $P103, "$post"
    find_lex $P1023, "%context"
    unless_null $P1023, vivify_65
    $P1023 = root_new ['parrot';'Hash']
    store_lex "%context", $P1023
  vivify_65:
    set $P1023["pir_file"], $P103
.annotate 'line', 48
    find_lex $P103, "self"
    find_lex $P104, "$post"
    $P103."enumerate_subs"($P104)
.annotate 'line', 50
    find_lex $P104, "$post"
    $P105 = $P104."list"()
    defined $I101, $P105
    unless $I101, for_undef_66
    iter $P103, $P105
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1027_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1027_test:
    unless $P103, loop1027_done
    shift $P106, $P103
  loop1027_redo:
    .const 'Sub' $P1025 = "15_1312323127.11962" 
    capture_lex $P1025
    $P1025($P106)
  loop1027_next:
    goto loop1027_test
  loop1027_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1027_next
    eq $P108, .CONTROL_LOOP_REDO, loop1027_redo
  loop1027_done:
    pop_eh 
  for_undef_66:
.annotate 'line', 36
    find_lex $P1028, "%context"
    unless_null $P1028, vivify_67
    $P1028 = root_new ['parrot';'Hash']
  vivify_67:
    set $P103, $P1028["packfile"]
    unless_null $P103, vivify_68
    new $P103, "Undef"
  vivify_68:
    .return ($P103)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1024"  :anon :subid("15_1312323127.11962") :outer("14_1312323127.11962")
    .param pmc param_1026
.annotate 'file', ''
.annotate 'line', 50
    .lex "$s", param_1026
.annotate 'line', 51
    find_lex $P107, "self"
    find_lex $P108, "$s"
    find_lex $P109, "%context"
    $P110 = $P107."to_pbc"($P108, $P109)
.annotate 'line', 50
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "mainpmc"  :subid("16_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1032
    .param pmc param_1033 :slurpy :named
.annotate 'file', ''
.annotate 'line', 62
    new $P1031, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1031, control_1030
    push_eh $P1031
    .lex "self", self
    .lex "$packfile", param_1032
    .lex "%adverbs", param_1033
.annotate 'line', 63
    new $P103, "Undef"
    set $P1034, $P103
    .lex "$view", $P1034
    find_lex $P104, "$packfile"
    $P105 = $P104."view"()
    store_lex "$view", $P105
.annotate 'line', 69
    find_lex $P104, "$view"
    $P105 = $P104."main_sub"()
.annotate 'line', 62
    .return ($P105)
  control_1030:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("17_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1038
    .param pmc param_1039 :slurpy :named
.annotate 'file', ''
.annotate 'line', 92
    .const 'Sub' $P1049 = "18_1312323127.11962" 
    capture_lex $P1049
    new $P1037, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1037, control_1036
    push_eh $P1037
    .lex "self", self
    .lex "$post", param_1038
    .lex "%adverbs", param_1039
.annotate 'line', 94
    new $P103, "Undef"
    set $P1040, $P103
    .lex "$packfile", $P1040
.annotate 'line', 96
    new $P104, "Undef"
    set $P1041, $P104
    .lex "$main_sub", $P1041
.annotate 'line', 98
    new $P105, "Undef"
    set $P1042, $P105
    .lex "$unlink", $P1042
.annotate 'line', 99
    new $P106, "Undef"
    set $P1043, $P106
    .lex "$filename", $P1043
.annotate 'line', 106
    new $P107, "Undef"
    set $P1044, $P107
    .lex "$handle", $P1044
.annotate 'line', 94
    find_lex $P108, "self"
    find_lex $P109, "$post"
    find_lex $P110, "%adverbs"
    $P111 = $P108."packfile"($P109, $P110 :flat)
    store_lex "$packfile", $P111
.annotate 'line', 96
    find_lex $P1045, "$post"
    unless_null $P1045, vivify_69
    $P1045 = root_new ['parrot';'Hash']
  vivify_69:
    set $P108, $P1045["main_sub"]
    unless_null $P108, vivify_70
    new $P108, "Undef"
  vivify_70:
    store_lex "$main_sub", $P108
.annotate 'line', 92
    find_lex $P108, "$unlink"
.annotate 'line', 99
    find_lex $P1046, "%adverbs"
    unless_null $P1046, vivify_71
    $P1046 = root_new ['parrot';'Hash']
  vivify_71:
    set $P108, $P1046["output"]
    unless_null $P108, vivify_72
    new $P108, "Undef"
  vivify_72:
    set $S101, $P108
    new $P109, 'String'
    set $P109, $S101
    store_lex "$filename", $P109
.annotate 'line', 100
    find_lex $P108, "$filename"
    isfalse $I101, $P108
    unless $I101, if_1047_end
.annotate 'line', 102
    new $P109, "String"
    assign $P109, "/tmp/temp.pbc"
    store_lex "$filename", $P109
.annotate 'line', 103
    new $P109, "Integer"
    assign $P109, 1
    store_lex "$unlink", $P109
  if_1047_end:
.annotate 'line', 106
    new $P108, "FileHandle"
    store_lex "$handle", $P108
.annotate 'line', 107
    find_lex $P108, "$handle"
    find_lex $P109, "$filename"
    $P108."open"($P109, "w")
.annotate 'line', 108
    find_lex $P108, "$handle"
    find_lex $P109, "$packfile"
    set $S101, $P109
    $P108."print"($S101)
.annotate 'line', 109
    find_lex $P108, "$handle"
    $P108."close"()
.annotate 'line', 111
    new $P108, "Exception"
    set $P108['type'], .CONTROL_RETURN
    .const 'Sub' $P1049 = "18_1312323127.11962" 
    newclosure $P1053, $P1049
    setattribute $P108, 'payload', $P1053
    throw $P108
.annotate 'line', 92
    .return ()
  control_1036:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "_block1048"  :anon :subid("18_1312323127.11962") :outer("17_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 111
    new $P1051, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1051, control_1050
    push_eh $P1051
.annotate 'line', 113
    find_lex $P109, "$filename"
    set $S101, $P109
    load_bytecode $S101
.annotate 'line', 120

            $P1052 = find_lex '$main_sub'
            $S99 = $P1052
            $P1052 = find_sub_not_null $S99
            $P1052()
        
.annotate 'line', 111
    .return ($P1052)
  control_1050:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("19_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["Undef"],_)
    .param pmc param_1057
    .param pmc param_1058
.annotate 'file', ''
.annotate 'line', 133
    new $P1056, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1056, control_1055
    push_eh $P1056
    .lex "self", self
    .lex "$what", param_1057
    .lex "%context", param_1058
    .return ()
  control_1055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("20_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Sub"],_)
    .param pmc param_1062
    .param pmc param_1063
.annotate 'file', ''
.annotate 'line', 137
    .const 'Sub' $P1118 = "22_1312323127.11962" 
    capture_lex $P1118
    .const 'Sub' $P1097 = "21_1312323127.11962" 
    capture_lex $P1097
    new $P1061, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1061, control_1060
    push_eh $P1061
    .lex "self", self
    .lex "$sub", param_1062
    .lex "%context", param_1063
.annotate 'line', 142
    $P1065 = root_new ['parrot';'ResizablePMCArray']
    set $P1064, $P1065
    .lex "@n_regs_used", $P1064
.annotate 'line', 146
    new $P103, "Undef"
    set $P1066, $P103
    .lex "$bc", $P1066
.annotate 'line', 152
    new $P104, "Undef"
    set $P1067, $P104
    .lex "$sb", $P1067
.annotate 'line', 154
    new $P105, "Undef"
    set $P1068, $P105
    .lex "$subname", $P1068
.annotate 'line', 160
    new $P106, "Undef"
    set $P1069, $P106
    .lex "$constants", $P1069
.annotate 'line', 168
    new $P107, "Undef"
    set $P1070, $P107
    .lex "$start_offset", $P1070
.annotate 'line', 197
    new $P108, "Undef"
    set $P1071, $P108
    .lex "$end_offset", $P1071
.annotate 'line', 204
    $P1073 = root_new ['parrot';'Hash']
    set $P1072, $P1073
    .lex "%sub", $P1072
.annotate 'line', 231
    new $P109, "Undef"
    set $P1074, $P109
    .lex "$idx", $P1074
.annotate 'line', 139
    find_lex $P110, "$sub"
    find_lex $P1075, "%context"
    unless_null $P1075, vivify_73
    $P1075 = root_new ['parrot';'Hash']
    store_lex "%context", $P1075
  vivify_73:
    set $P1075["sub"], $P110
.annotate 'line', 142
    find_lex $P1076, "%context"
    unless_null $P1076, vivify_74
    $P1076 = root_new ['parrot';'Hash']
  vivify_74:
    set $P110, $P1076["regalloc"]
    unless_null $P110, vivify_75
    new $P110, "Undef"
  vivify_75:
    find_lex $P111, "$sub"
    $P112 = $P110."process"($P111)
    store_lex "@n_regs_used", $P112
.annotate 'line', 143
    find_lex $P1078, "%context"
    unless_null $P1078, vivify_76
    $P1078 = root_new ['parrot';'Hash']
  vivify_76:
    set $P110, $P1078["DEBUG"]
    unless_null $P110, vivify_77
    new $P110, "Undef"
  vivify_77:
    unless $P110, if_1077_end
    find_lex $P111, "self"
    new $P112, "String"
    assign $P112, "n_regs_used "
    find_lex $P113, "@n_regs_used"
    $S101 = $P113."join"("-")
    concat $P114, $P112, $S101
    $P111."debug"($P114)
  if_1077_end:
.annotate 'line', 144
    find_lex $P1080, "%context"
    unless_null $P1080, vivify_78
    $P1080 = root_new ['parrot';'Hash']
  vivify_78:
    set $P110, $P1080["DEBUG"]
    unless_null $P110, vivify_79
    new $P110, "Undef"
  vivify_79:
    unless $P110, if_1079_end
    find_lex $P111, "self"
    find_lex $P112, "$sub"
    $P111."dumper"($P112, "sub")
  if_1079_end:
.annotate 'line', 146
    find_lex $P1081, "%context"
    unless_null $P1081, vivify_80
    $P1081 = root_new ['parrot';'Hash']
  vivify_80:
    set $P110, $P1081["bytecode"]
    unless_null $P110, vivify_81
    new $P110, "Undef"
  vivify_81:
    store_lex "$bc", $P110
.annotate 'line', 149
    $P110 = "hash"()
    find_lex $P1082, "%context"
    unless_null $P1082, vivify_82
    $P1082 = root_new ['parrot';'Hash']
    store_lex "%context", $P1082
  vivify_82:
    set $P1082["labels_todo"], $P110
.annotate 'line', 152
    new $P110, "StringBuilder"
    store_lex "$sb", $P110
.annotate 'line', 153
    find_lex $P110, "$sb"
    find_lex $P111, "$sub"
    $P112 = $P111."name"()
    set $S101, $P112
    push $P110, $S101
.annotate 'line', 154
    find_lex $P110, "$sb"
    set $S101, $P110
    new $P111, 'String'
    set $P111, $S101
    store_lex "$subname", $P111
.annotate 'line', 156
    find_lex $P1084, "%context"
    unless_null $P1084, vivify_83
    $P1084 = root_new ['parrot';'Hash']
  vivify_83:
    set $P110, $P1084["DEBUG"]
    unless_null $P110, vivify_84
    new $P110, "Undef"
  vivify_84:
    unless $P110, if_1083_end
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "Emitting "
    find_lex $P113, "$subname"
    concat $P114, $P112, $P113
    $P111."debug"($P114)
  if_1083_end:
.annotate 'line', 160
    find_lex $P1085, "%context"
    unless_null $P1085, vivify_85
    $P1085 = root_new ['parrot';'Hash']
  vivify_85:
    set $P110, $P1085["constants"]
    unless_null $P110, vivify_86
    new $P110, "Undef"
  vivify_86:
    store_lex "$constants", $P110
.annotate 'line', 161

		$P0 = find_lex '$constants'
		$P1 = find_lex '$subname'
		$S1 = $P1
		$P0.'get_or_create_constant'($S1)
	
.annotate 'line', 168
    find_lex $P110, "$bc"
    set $N101, $P110
    new $P111, 'Float'
    set $P111, $N101
    store_lex "$start_offset", $P111
.annotate 'line', 169
    find_lex $P1087, "%context"
    unless_null $P1087, vivify_87
    $P1087 = root_new ['parrot';'Hash']
  vivify_87:
    set $P110, $P1087["DEBUG"]
    unless_null $P110, vivify_88
    new $P110, "Undef"
  vivify_88:
    unless $P110, if_1086_end
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "From "
    find_lex $P113, "$start_offset"
    concat $P114, $P112, $P113
    $P111."debug"($P114)
  if_1086_end:
.annotate 'line', 172
    find_lex $P1089, "$sub"
    unless_null $P1089, vivify_89
    $P1089 = root_new ['parrot';'Hash']
  vivify_89:
    set $P110, $P1089["params"]
    unless_null $P110, vivify_90
    new $P110, "Undef"
  vivify_90:
    if $P110, unless_1088_end
    $P111 = "list"()
    find_lex $P1090, "$sub"
    unless_null $P1090, vivify_91
    $P1090 = root_new ['parrot';'Hash']
    store_lex "$sub", $P1090
  vivify_91:
    set $P1090["params"], $P111
  unless_1088_end:
.annotate 'line', 173
    find_lex $P110, "$sub"
    $P111 = $P110."is_method"()
    unless $P111, if_1091_end
    find_lex $P1092, "$sub"
    unless_null $P1092, vivify_92
    $P1092 = root_new ['parrot';'Hash']
  vivify_92:
    set $P112, $P1092["params"]
    unless_null $P112, vivify_93
    new $P112, "Undef"
  vivify_93:
    get_hll_global $P113, ["POST"], "Value"
    $P114 = $P113."new"("self" :named("name"))
    $P112."unshift"($P114)
  if_1091_end:
.annotate 'line', 175
    find_lex $P1094, "$sub"
    unless_null $P1094, vivify_94
    $P1094 = root_new ['parrot';'Hash']
  vivify_94:
    set $P110, $P1094["params"]
    unless_null $P110, vivify_95
    new $P110, "Undef"
  vivify_95:
    set $N101, $P110
    unless $N101, if_1093_end
.annotate 'line', 176
    find_lex $P111, "self"
    find_lex $P1095, "$sub"
    unless_null $P1095, vivify_96
    $P1095 = root_new ['parrot';'Hash']
  vivify_96:
    set $P112, $P1095["params"]
    unless_null $P112, vivify_97
    new $P112, "Undef"
  vivify_97:
    find_lex $P113, "%context"
    $P111."build_pcc_call"("get_params_pc", $P112, $P113)
  if_1093_end:
.annotate 'line', 180
    find_lex $P111, "$sub"
    $P112 = $P111."list"()
    defined $I101, $P112
    unless $I101, for_undef_98
    iter $P110, $P112
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1099_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1099_test:
    unless $P110, loop1099_done
    shift $P113, $P110
  loop1099_redo:
    .const 'Sub' $P1097 = "21_1312323127.11962" 
    capture_lex $P1097
    $P1097($P113)
  loop1099_next:
    goto loop1099_test
  loop1099_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1099_next
    eq $P115, .CONTROL_LOOP_REDO, loop1099_redo
  loop1099_done:
    pop_eh 
  for_undef_98:
.annotate 'line', 184
    find_lex $P1101, "%context"
    unless_null $P1101, vivify_99
    $P1101 = root_new ['parrot';'Hash']
  vivify_99:
    set $P110, $P1101["DEBUG"]
    unless_null $P110, vivify_100
    new $P110, "Undef"
  vivify_100:
    unless $P110, if_1100_end
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "Middle "
    find_lex $P113, "$bc"
    set $N101, $P113
    set $S101, $N101
    concat $P113, $P112, $S101
    $P111."debug"($P113)
  if_1100_end:
.annotate 'line', 187
    find_lex $P1103, "%context"
    unless_null $P1103, vivify_101
    $P1103 = root_new ['parrot';'Hash']
  vivify_101:
    set $P110, $P1103["DEBUG"]
    unless_null $P110, vivify_102
    new $P110, "Undef"
  vivify_102:
    unless $P110, if_1102_end
    find_lex $P111, "self"
    $P111."debug"("Emitting default return")
  if_1102_end:
.annotate 'line', 188
    find_lex $P110, "$bc"
.annotate 'line', 189
    new $P111, "ResizablePMCArray"
    push $P111, "set_returns_pc"
    push $P111, 0
    push $P110, $P111
.annotate 'line', 193
    find_lex $P110, "$bc"
    new $P111, "ResizablePMCArray"
    push $P111, "returncc"
    push $P110, $P111
.annotate 'line', 197
    find_lex $P110, "$bc"
    set $N101, $P110
    new $P111, 'Float'
    set $P111, $N101
    store_lex "$end_offset", $P111
.annotate 'line', 198
    find_lex $P1105, "%context"
    unless_null $P1105, vivify_103
    $P1105 = root_new ['parrot';'Hash']
  vivify_103:
    set $P110, $P1105["DEBUG"]
    unless_null $P110, vivify_104
    new $P110, "Undef"
  vivify_104:
    unless $P110, if_1104_end
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "To "
    find_lex $P113, "$end_offset"
    concat $P114, $P112, $P113
    $P111."debug"($P114)
  if_1104_end:
.annotate 'line', 201
    find_lex $P110, "self"
    find_lex $P111, "$sub"
    find_lex $P1106, "%context"
    unless_null $P1106, vivify_105
    $P1106 = root_new ['parrot';'Hash']
  vivify_105:
    set $P112, $P1106["labels_todo"]
    unless_null $P112, vivify_106
    new $P112, "Undef"
  vivify_106:
    find_lex $P1107, "%context"
    unless_null $P1107, vivify_107
    $P1107 = root_new ['parrot';'Hash']
  vivify_107:
    set $P113, $P1107["bytecode"]
    unless_null $P113, vivify_108
    new $P113, "Undef"
  vivify_108:
    find_lex $P114, "%context"
    $P110."fixup_labels"($P111, $P112, $P113, $P114)
.annotate 'line', 204
    find_lex $P110, "$start_offset"
    find_lex $P111, "$end_offset"
    find_lex $P112, "$subname"
.annotate 'line', 209
    find_lex $P1109, "$sub"
    unless_null $P1109, vivify_109
    $P1109 = root_new ['parrot';'Hash']
  vivify_109:
    set $P113, $P1109["subid"]
    unless_null $P113, vivify_110
    new $P113, "Undef"
  vivify_110:
    set $P1108, $P113
    defined $I1111, $P1108
    if $I1111, default_1110
    find_lex $P114, "$subname"
    set $P1108, $P114
  default_1110:
.annotate 'line', 210
    find_lex $P115, "$sub"
    $P116 = $P115."nsentry"()
    set $P1112, $P116
    defined $I1114, $P1112
    if $I1114, default_1113
    find_lex $P117, "$subname"
    set $P1112, $P117
  default_1113:
.annotate 'line', 213
    find_lex $P119, "$sub"
    $P120 = $P119."is_method"()
    if $P120, if_1115
    new $P122, "String"
    assign $P122, ""
    set $P118, $P122
    goto if_1115_end
  if_1115:
    find_lex $P121, "$subname"
    set $P118, $P121
  if_1115_end:
.annotate 'line', 204
    find_lex $P123, "@n_regs_used"
.annotate 'line', 217
    find_lex $P124, "self"
    find_lex $P125, "$sub"
    find_lex $P126, "%context"
    $P127 = $P124."create_sub_pf_flags"($P125, $P126)
.annotate 'line', 218
    find_lex $P128, "self"
    find_lex $P129, "$sub"
    find_lex $P130, "%context"
    $P131 = $P128."create_sub_comp_flags"($P129, $P130)
.annotate 'line', 204
    $P132 = "hash"($P110 :named("start_offs"), $P111 :named("end_offs"), $P112 :named("name"), $P1108 :named("subid"), $P1112 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P118 :named("method_name"), $P123 :named("n_regs_used"), $P127 :named("pf_flags"), $P131 :named("comp_flags"))
    store_lex "%sub", $P132
.annotate 'line', 221
    find_lex $P110, "$sub"
    $P111 = $P110."namespace"()
    defined $I101, $P111
    unless $I101, if_1116_end
    .const 'Sub' $P1118 = "22_1312323127.11962" 
    capture_lex $P1118
    $P1118()
  if_1116_end:
.annotate 'line', 231
    find_lex $P110, "$sub"
    $P111 = $P110."constant_index"()
    store_lex "$idx", $P111
.annotate 'line', 232
    find_lex $P110, "$idx"
    defined $I101, $P110
    if $I101, if_1122
.annotate 'line', 237
    find_lex $P1127, "%context"
    unless_null $P1127, vivify_113
    $P1127 = root_new ['parrot';'Hash']
  vivify_113:
    set $P111, $P1127["constants"]
    unless_null $P111, vivify_114
    new $P111, "Undef"
  vivify_114:
    find_lex $P112, "%sub"
    new $P113, "Sub", $P112
    push $P111, $P113
.annotate 'line', 238
    find_lex $P1128, "%context"
    unless_null $P1128, vivify_115
    $P1128 = root_new ['parrot';'Hash']
  vivify_115:
    set $P111, $P1128["constants"]
    unless_null $P111, vivify_116
    new $P111, "Undef"
  vivify_116:
    $P112 = $P111."pmc_count"()
    store_lex "$idx", $P112
.annotate 'line', 239
    find_lex $P111, "$sub"
    find_lex $P112, "$idx"
    $P111."constant_index"($P112)
.annotate 'line', 240
    find_lex $P1130, "%context"
    unless_null $P1130, vivify_117
    $P1130 = root_new ['parrot';'Hash']
  vivify_117:
    set $P111, $P1130["DEBUG"]
    unless_null $P111, vivify_118
    new $P111, "Undef"
  vivify_118:
    unless $P111, if_1129_end
    find_lex $P112, "self"
    new $P113, 'String'
    set $P113, "Allocate new constant "
    find_lex $P114, "$idx"
    concat $P115, $P113, $P114
    $P112."debug"($P115)
  if_1129_end:
.annotate 'line', 236
    goto if_1122_end
  if_1122:
.annotate 'line', 233
    find_lex $P1124, "%context"
    unless_null $P1124, vivify_119
    $P1124 = root_new ['parrot';'Hash']
  vivify_119:
    set $P111, $P1124["DEBUG"]
    unless_null $P111, vivify_120
    new $P111, "Undef"
  vivify_120:
    unless $P111, if_1123_end
    find_lex $P112, "self"
    new $P113, 'String'
    set $P113, "Reusing old constant "
    find_lex $P114, "$idx"
    concat $P115, $P113, $P114
    $P112."debug"($P115)
  if_1123_end:
.annotate 'line', 234
    find_lex $P111, "%sub"
    new $P112, "Sub", $P111
    find_lex $P113, "$idx"
    set $I102, $P113
    find_lex $P1125, "%context"
    unless_null $P1125, vivify_121
    $P1125 = root_new ['parrot';'Hash']
    store_lex "%context", $P1125
  vivify_121:
    set $P1126, $P1125["constants"]
    unless_null $P1126, vivify_122
    $P1126 = root_new ['parrot';'ResizablePMCArray']
    set $P1125["constants"], $P1126
  vivify_122:
    set $P1126[$I102], $P112
  if_1122_end:
.annotate 'line', 244
    find_lex $P1132, "%context"
    unless_null $P1132, vivify_123
    $P1132 = root_new ['parrot';'Hash']
  vivify_123:
    set $P111, $P1132["got_main_sub"]
    unless_null $P111, vivify_124
    new $P111, "Undef"
  vivify_124:
    isfalse $I101, $P111
    if $I101, if_1131
    new $P110, 'Integer'
    set $P110, $I101
    goto if_1131_end
  if_1131:
.annotate 'line', 245
    find_lex $P1134, "%context"
    unless_null $P1134, vivify_125
    $P1134 = root_new ['parrot';'Hash']
  vivify_125:
    set $P112, $P1134["DEBUG"]
    unless_null $P112, vivify_126
    new $P112, "Undef"
  vivify_126:
    unless $P112, if_1133_end
    find_lex $P113, "self"
    new $P114, 'String'
    set $P114, "main_sub is "
    find_lex $P1135, "%context"
    unless_null $P1135, vivify_127
    $P1135 = root_new ['parrot';'Hash']
  vivify_127:
    set $P115, $P1135["bytecode"]
    unless_null $P115, vivify_128
    new $P115, "Undef"
  vivify_128:
    $P116 = $P115."main_sub"()
    set $S101, $P116
    concat $P115, $P114, $S101
    $P113."debug"($P115)
  if_1133_end:
.annotate 'line', 246
    find_lex $P112, "$sub"
    $P113 = $P112."main"()
    if $P113, if_1136
.annotate 'line', 252
    find_lex $P1142, "%context"
    unless_null $P1142, vivify_129
    $P1142 = root_new ['parrot';'Hash']
  vivify_129:
    set $P114, $P1142["bytecode"]
    unless_null $P114, vivify_130
    new $P114, "Undef"
  vivify_130:
    $N101 = $P114."main_sub"()
    iseq $I102, $N101, -1.0
    unless $I102, if_1141_end
.annotate 'line', 254
    find_lex $P1144, "%context"
    unless_null $P1144, vivify_131
    $P1144 = root_new ['parrot';'Hash']
  vivify_131:
    set $P115, $P1144["DEBUG"]
    unless_null $P115, vivify_132
    new $P115, "Undef"
  vivify_132:
    unless $P115, if_1143_end
    find_lex $P116, "self"
    $P116."debug"("Got first sub")
  if_1143_end:
.annotate 'line', 255
    find_lex $P1145, "%context"
    unless_null $P1145, vivify_133
    $P1145 = root_new ['parrot';'Hash']
  vivify_133:
    set $P115, $P1145["bytecode"]
    unless_null $P115, vivify_134
    new $P115, "Undef"
  vivify_134:
    find_lex $P116, "$idx"
    $P115."main_sub"($P116)
  if_1141_end:
.annotate 'line', 252
    goto if_1136_end
  if_1136:
.annotate 'line', 247
    find_lex $P1138, "%context"
    unless_null $P1138, vivify_135
    $P1138 = root_new ['parrot';'Hash']
  vivify_135:
    set $P114, $P1138["DEBUG"]
    unless_null $P114, vivify_136
    new $P114, "Undef"
  vivify_136:
    unless $P114, if_1137_end
    find_lex $P115, "self"
    $P115."debug"("Got first :main")
  if_1137_end:
.annotate 'line', 249
    find_lex $P1139, "%context"
    unless_null $P1139, vivify_137
    $P1139 = root_new ['parrot';'Hash']
  vivify_137:
    set $P114, $P1139["bytecode"]
    unless_null $P114, vivify_138
    new $P114, "Undef"
  vivify_138:
    find_lex $P115, "$idx"
    $P114."main_sub"($P115)
.annotate 'line', 250
    new $P114, "Integer"
    assign $P114, 1
    find_lex $P1140, "%context"
    unless_null $P1140, vivify_139
    $P1140 = root_new ['parrot';'Hash']
    store_lex "%context", $P1140
  vivify_139:
    set $P1140["got_main_sub"], $P114
  if_1136_end:
.annotate 'line', 258
    find_lex $P1147, "%context"
    unless_null $P1147, vivify_140
    $P1147 = root_new ['parrot';'Hash']
  vivify_140:
    set $P113, $P1147["DEBUG"]
    unless_null $P113, vivify_141
    new $P113, "Undef"
  vivify_141:
    if $P113, if_1146
    set $P112, $P113
    goto if_1146_end
  if_1146:
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, ":main sub is "
    find_lex $P1148, "%context"
    unless_null $P1148, vivify_142
    $P1148 = root_new ['parrot';'Hash']
  vivify_142:
    set $P116, $P1148["bytecode"]
    unless_null $P116, vivify_143
    new $P116, "Undef"
  vivify_143:
    $P117 = $P116."main_sub"()
    set $S101, $P117
    concat $P116, $P115, $S101
    $P118 = $P114."debug"($P116)
    set $P112, $P118
  if_1146_end:
.annotate 'line', 244
    set $P110, $P112
  if_1131_end:
.annotate 'line', 137
    .return ($P110)
  control_1060:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, "payload"
    .return ($P111)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1096"  :anon :subid("21_1312323127.11962") :outer("20_1312323127.11962")
    .param pmc param_1098
.annotate 'file', ''
.annotate 'line', 180
    .lex "$_", param_1098
.annotate 'line', 181
    find_lex $P114, "self"
    find_lex $P115, "$_"
    find_lex $P116, "%context"
    $P117 = $P114."to_pbc"($P115, $P116)
.annotate 'line', 180
    .return ($P117)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1117"  :anon :subid("22_1312323127.11962") :outer("20_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 222
    new $P112, "Undef"
    set $P1119, $P112
    .lex "$nskey", $P1119
    find_lex $P113, "$sub"
    $P114 = $P113."namespace"()
    find_lex $P115, "%context"
    $P116 = $P114."to_pmc"($P115)
    set $P117, $P116[0]
    unless_null $P117, vivify_111
    new $P117, "Undef"
  vivify_111:
    store_lex "$nskey", $P117
.annotate 'line', 223
    find_lex $P114, "$nskey"
    typeof $S101, $P114
    iseq $I102, $S101, "Key"
    if $I102, if_1120
    new $P113, 'Integer'
    set $P113, $I102
    goto if_1120_end
  if_1120:
.annotate 'line', 224
    find_lex $P115, "$nskey"
    find_lex $P1121, "%sub"
    unless_null $P1121, vivify_112
    $P1121 = root_new ['parrot';'Hash']
    store_lex "%sub", $P1121
  vivify_112:
    set $P1121["namespace_name"], $P115
.annotate 'line', 223
    set $P113, $P115
  if_1120_end:
.annotate 'line', 221
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("23_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Op"],_)
    .param pmc param_1152
    .param pmc param_1153
.annotate 'file', ''
.annotate 'line', 262
    .const 'Sub' $P1171 = "25_1312323127.11962" 
    capture_lex $P1171
    .const 'Sub' $P1160 = "24_1312323127.11962" 
    capture_lex $P1160
    new $P1151, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1151, control_1150
    push_eh $P1151
    .lex "self", self
    .lex "$op", param_1152
    .lex "%context", param_1153
.annotate 'line', 264
    new $P103, "Undef"
    set $P1154, $P103
    .lex "$fullname", $P1154
.annotate 'line', 279
    $P1156 = root_new ['parrot';'ResizablePMCArray']
    set $P1155, $P1156
    .lex "@op", $P1155
.annotate 'line', 264
    find_lex $P104, "$op"
    $P105 = $P104."pirop"()
    store_lex "$fullname", $P105
.annotate 'line', 265
    find_lex $P1158, "%context"
    unless_null $P1158, vivify_144
    $P1158 = root_new ['parrot';'Hash']
  vivify_144:
    set $P104, $P1158["DEBUG"]
    unless_null $P104, vivify_145
    new $P104, "Undef"
  vivify_145:
    unless $P104, if_1157_end
    find_lex $P105, "self"
    new $P106, 'String'
    set $P106, "Short name "
    find_lex $P107, "$fullname"
    concat $P108, $P106, $P107
    $P105."debug"($P108)
  if_1157_end:
.annotate 'line', 267
    find_lex $P105, "$op"
    $P106 = $P105."list"()
    defined $I101, $P106
    unless $I101, for_undef_146
    iter $P104, $P106
    new $P109, 'ExceptionHandler'
    set_label $P109, loop1164_handler
    $P109."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P109
  loop1164_test:
    unless $P104, loop1164_done
    shift $P107, $P104
  loop1164_redo:
    .const 'Sub' $P1160 = "24_1312323127.11962" 
    capture_lex $P1160
    $P1160($P107)
  loop1164_next:
    goto loop1164_test
  loop1164_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, .CONTROL_LOOP_NEXT, loop1164_next
    eq $P110, .CONTROL_LOOP_REDO, loop1164_redo
  loop1164_done:
    pop_eh 
  for_undef_146:
.annotate 'line', 272
    find_lex $P1166, "%context"
    unless_null $P1166, vivify_147
    $P1166 = root_new ['parrot';'Hash']
  vivify_147:
    set $P104, $P1166["DEBUG"]
    unless_null $P104, vivify_148
    new $P104, "Undef"
  vivify_148:
    unless $P104, if_1165_end
    find_lex $P105, "self"
    new $P106, 'String'
    set $P106, "Fullname "
    find_lex $P107, "$fullname"
    concat $P108, $P106, $P107
    $P105."debug"($P108)
  if_1165_end:
.annotate 'line', 275
    find_lex $P1167, "%context"
    unless_null $P1167, vivify_149
    $P1167 = root_new ['parrot';'Hash']
  vivify_149:
    set $P104, $P1167["bytecode"]
    unless_null $P104, vivify_150
    new $P104, "Undef"
  vivify_150:
    set $N101, $P104
    new $P105, 'Float'
    set $P105, $N101
    find_lex $P1168, "%context"
    unless_null $P1168, vivify_151
    $P1168 = root_new ['parrot';'Hash']
    store_lex "%context", $P1168
  vivify_151:
    set $P1168["opcode_offset"], $P105
.annotate 'line', 277
    find_lex $P104, "$fullname"
    find_lex $P1169, "%context"
    unless_null $P1169, vivify_152
    $P1169 = root_new ['parrot';'Hash']
    store_lex "%context", $P1169
  vivify_152:
    set $P1169["opcode_fullname"], $P104
.annotate 'line', 279
    find_lex $P104, "$fullname"
    $P105 = "list"($P104)
    store_lex "@op", $P105
.annotate 'line', 280
    find_lex $P105, "$op"
    $P106 = $P105."list"()
    defined $I101, $P106
    unless $I101, for_undef_153
    iter $P104, $P106
    new $P108, 'ExceptionHandler'
    set_label $P108, loop1173_handler
    $P108."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P108
  loop1173_test:
    unless $P104, loop1173_done
    shift $P107, $P104
  loop1173_redo:
    .const 'Sub' $P1171 = "25_1312323127.11962" 
    capture_lex $P1171
    $P1171($P107)
  loop1173_next:
    goto loop1173_test
  loop1173_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, 'type'
    eq $P109, .CONTROL_LOOP_NEXT, loop1173_next
    eq $P109, .CONTROL_LOOP_REDO, loop1173_redo
  loop1173_done:
    pop_eh 
  for_undef_153:
.annotate 'line', 283
    find_lex $P1175, "%context"
    unless_null $P1175, vivify_154
    $P1175 = root_new ['parrot';'Hash']
  vivify_154:
    set $P104, $P1175["DEBUG"]
    unless_null $P104, vivify_155
    new $P104, "Undef"
  vivify_155:
    unless $P104, if_1174_end
    find_lex $P105, "self"
    new $P106, 'String'
    set $P106, "Op size "
    find_lex $P107, "@op"
    set $N101, $P107
    set $S101, $N101
    concat $P107, $P106, $S101
    $P105."debug"($P107)
  if_1174_end:
.annotate 'line', 284
    find_lex $P1176, "%context"
    unless_null $P1176, vivify_156
    $P1176 = root_new ['parrot';'Hash']
  vivify_156:
    set $P104, $P1176["bytecode"]
    unless_null $P104, vivify_157
    new $P104, "Undef"
  vivify_157:
    find_lex $P105, "@op"
    push $P104, $P105
.annotate 'line', 262
    .return ($P104)
  control_1150:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1159"  :anon :subid("24_1312323127.11962") :outer("23_1312323127.11962")
    .param pmc param_1162
.annotate 'file', ''
.annotate 'line', 268
    new $P108, "Undef"
    set $P1161, $P108
    .lex "$type", $P1161
    .lex "$_", param_1162
    find_lex $P110, "$_"
    $P111 = $P110."type"()
    unless $P111, unless_1163
    set $P109, $P111
    goto unless_1163_end
  unless_1163:
    find_lex $P112, "self"
    find_lex $P113, "$_"
    $P114 = $P113."name"()
    find_lex $P115, "%context"
    $P116 = $P112."get_register"($P114, $P115)
    $P117 = $P116."type"()
    set $P109, $P117
  unless_1163_end:
    store_lex "$type", $P109
.annotate 'line', 269
    find_lex $P109, "$fullname"
    set $S101, $P109
    new $P110, 'String'
    set $P110, $S101
    concat $P111, $P110, "_"
    find_lex $P112, "$type"
    set $S102, $P112
    concat $P113, $P111, $S102
    store_lex "$fullname", $P113
.annotate 'line', 267
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1170"  :anon :subid("25_1312323127.11962") :outer("23_1312323127.11962")
    .param pmc param_1172
.annotate 'file', ''
.annotate 'line', 280
    .lex "$_", param_1172
.annotate 'line', 281
    find_lex $P108, "@op"
    find_lex $P109, "self"
    find_lex $P110, "$_"
    find_lex $P111, "%context"
    $P112 = $P109."to_op"($P110, $P111)
    $P113 = $P108."push"($P112)
.annotate 'line', 280
    .return ($P113)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("26_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Node"],_)
    .param pmc param_1180
    .param pmc param_1181
.annotate 'file', ''
.annotate 'line', 288
    .const 'Sub' $P1183 = "27_1312323127.11962" 
    capture_lex $P1183
    new $P1179, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1179, control_1178
    push_eh $P1179
    .lex "self", self
    .lex "$node", param_1180
    .lex "%context", param_1181
.annotate 'line', 289
    find_lex $P104, "$node"
    $P105 = $P104."list"()
    defined $I101, $P105
    unless $I101, for_undef_158
    iter $P103, $P105
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1185_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1185_test:
    unless $P103, loop1185_done
    shift $P106, $P103
  loop1185_redo:
    .const 'Sub' $P1183 = "27_1312323127.11962" 
    capture_lex $P1183
    $P1183($P106)
  loop1185_next:
    goto loop1185_test
  loop1185_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1185_next
    eq $P108, .CONTROL_LOOP_REDO, loop1185_redo
  loop1185_done:
    pop_eh 
  for_undef_158:
.annotate 'line', 288
    .return ($P103)
  control_1178:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1182"  :anon :subid("27_1312323127.11962") :outer("26_1312323127.11962")
    .param pmc param_1184
.annotate 'file', ''
.annotate 'line', 289
    .lex "$_", param_1184
.annotate 'line', 290
    find_lex $P107, "self"
    find_lex $P108, "$_"
    find_lex $P109, "%context"
    $P110 = $P107."to_pbc"($P108, $P109)
.annotate 'line', 289
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("28_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Label"],_)
    .param pmc param_1189
    .param pmc param_1190
.annotate 'file', ''
.annotate 'line', 294
    .const 'Sub' $P1198 = "29_1312323127.11962" 
    capture_lex $P1198
    new $P1188, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1188, control_1187
    push_eh $P1188
    .lex "self", self
    .lex "$l", param_1189
    .lex "%context", param_1190
.annotate 'line', 295
    new $P103, "Undef"
    set $P1191, $P103
    .lex "$bc", $P1191
.annotate 'line', 298
    new $P104, "Undef"
    set $P1192, $P104
    .lex "$pos", $P1192
.annotate 'line', 295
    find_lex $P1193, "%context"
    unless_null $P1193, vivify_159
    $P1193 = root_new ['parrot';'Hash']
  vivify_159:
    set $P105, $P1193["bytecode"]
    unless_null $P105, vivify_160
    new $P105, "Undef"
  vivify_160:
    store_lex "$bc", $P105
.annotate 'line', 296
    find_lex $P105, "$l"
    $P106 = $P105."declared"()
    if $P106, unless_1194_end
    find_lex $P107, "self"
    $P107."panic"("Trying to emit undelcared label!")
  unless_1194_end:
.annotate 'line', 298
    find_lex $P105, "$bc"
    set $N101, $P105
    new $P106, 'Float'
    set $P106, $N101
    store_lex "$pos", $P106
.annotate 'line', 299
    find_lex $P1196, "%context"
    unless_null $P1196, vivify_161
    $P1196 = root_new ['parrot';'Hash']
  vivify_161:
    set $P105, $P1196["DEBUG"]
    unless_null $P105, vivify_162
    new $P105, "Undef"
  vivify_162:
    unless $P105, if_1195_end
    find_lex $P106, "self"
    new $P107, 'String'
    set $P107, "Declare label '"
    find_lex $P108, "$l"
    $P109 = $P108."name"()
    set $S101, $P109
    concat $P108, $P107, $S101
    concat $P110, $P108, "' at "
    find_lex $P111, "$pos"
    concat $P112, $P110, $P111
    $P106."debug"($P112)
  if_1195_end:
.annotate 'line', 301
    find_lex $P105, "$l"
    find_lex $P106, "$pos"
    $P105."position"($P106)
.annotate 'line', 303
    find_lex $P106, "$l"
    $P107 = $P106."list"()
    defined $I101, $P107
    unless $I101, for_undef_163
    iter $P105, $P107
    new $P109, 'ExceptionHandler'
    set_label $P109, loop1200_handler
    $P109."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P109
  loop1200_test:
    unless $P105, loop1200_done
    shift $P108, $P105
  loop1200_redo:
    .const 'Sub' $P1198 = "29_1312323127.11962" 
    capture_lex $P1198
    $P1198($P108)
  loop1200_next:
    goto loop1200_test
  loop1200_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, .CONTROL_LOOP_NEXT, loop1200_next
    eq $P110, .CONTROL_LOOP_REDO, loop1200_redo
  loop1200_done:
    pop_eh 
  for_undef_163:
.annotate 'line', 294
    .return ($P105)
  control_1187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1197"  :anon :subid("29_1312323127.11962") :outer("28_1312323127.11962")
    .param pmc param_1199
.annotate 'file', ''
.annotate 'line', 303
    .lex "$_", param_1199
.annotate 'line', 304
    find_lex $P109, "self"
    find_lex $P110, "$_"
    find_lex $P111, "%context"
    $P112 = $P109."to_pbc"($P110, $P111)
.annotate 'line', 303
    .return ($P112)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Call"],_)
    .param pmc param_1204
    .param pmc param_1205
.annotate 'file', ''
.annotate 'line', 308
    .const 'Sub' $P1222 = "31_1312323127.11962" 
    capture_lex $P1222
    new $P1203, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1203, control_1202
    push_eh $P1203
    .lex "self", self
    .lex "$call", param_1204
    .lex "%context", param_1205
.annotate 'line', 309
    new $P103, "Undef"
    set $P1206, $P103
    .lex "$bc", $P1206
.annotate 'line', 310
    new $P104, "Undef"
    set $P1207, $P104
    .lex "$calltype", $P1207
.annotate 'line', 311
    new $P105, "Undef"
    set $P1208, $P105
    .lex "$is_tailcall", $P1208
.annotate 'line', 309
    find_lex $P1209, "%context"
    unless_null $P1209, vivify_164
    $P1209 = root_new ['parrot';'Hash']
  vivify_164:
    set $P106, $P1209["bytecode"]
    unless_null $P106, vivify_165
    new $P106, "Undef"
  vivify_165:
    store_lex "$bc", $P106
.annotate 'line', 310
    find_lex $P106, "$call"
    $P107 = $P106."calltype"()
    store_lex "$calltype", $P107
.annotate 'line', 311
    find_lex $P106, "$calltype"
    set $S101, $P106
    iseq $I101, $S101, "tailcall"
    new $P107, 'Integer'
    set $P107, $I101
    store_lex "$is_tailcall", $P107
.annotate 'line', 313
    find_lex $P108, "$calltype"
    set $S101, $P108
    iseq $I101, $S101, "call"
    unless $I101, unless_1211
    new $P107, 'Integer'
    set $P107, $I101
    goto unless_1211_end
  unless_1211:
    find_lex $P109, "$calltype"
    set $S102, $P109
    iseq $I102, $S102, "tailcall"
    new $P107, 'Integer'
    set $P107, $I102
  unless_1211_end:
    if $P107, if_1210
.annotate 'line', 391
    find_lex $P112, "$calltype"
    set $S103, $P112
    iseq $I103, $S103, "return"
    if $I103, if_1261
.annotate 'line', 395
    find_lex $P115, "$calltype"
    set $S104, $P115
    iseq $I104, $S104, "results"
    if $I104, if_1263
.annotate 'line', 400
    find_lex $P116, "self"
    new $P117, 'String'
    set $P117, "NYI "
    find_lex $P118, "$calltype"
    set $S105, $P118
    concat $P120, $P117, $S105
    $P121 = $P116."panic"($P120)
.annotate 'line', 399
    set $P114, $P121
.annotate 'line', 395
    goto if_1263_end
  if_1263:
.annotate 'line', 397
    find_lex $P116, "self"
    find_lex $P1264, "$call"
    unless_null $P1264, vivify_166
    $P1264 = root_new ['parrot';'Hash']
  vivify_166:
    set $P117, $P1264["params"]
    unless_null $P117, vivify_167
    new $P117, "Undef"
  vivify_167:
    find_lex $P118, "%context"
    $P119 = $P116."build_pcc_call"("get_results_pc", $P117, $P118)
.annotate 'line', 395
    set $P114, $P119
  if_1263_end:
    set $P111, $P114
.annotate 'line', 391
    goto if_1261_end
  if_1261:
.annotate 'line', 392
    find_lex $P113, "self"
    find_lex $P1262, "$call"
    unless_null $P1262, vivify_168
    $P1262 = root_new ['parrot';'Hash']
  vivify_168:
    set $P114, $P1262["params"]
    unless_null $P114, vivify_169
    new $P114, "Undef"
  vivify_169:
    find_lex $P115, "%context"
    $P113."build_pcc_call"("set_returns_pc", $P114, $P115)
.annotate 'line', 393
    find_lex $P113, "$bc"
    new $P114, "ResizablePMCArray"
    push $P114, "returncc"
    push $P113, $P114
.annotate 'line', 391
    set $P111, $P113
  if_1261_end:
    set $P106, $P111
.annotate 'line', 313
    goto if_1210_end
  if_1210:
.annotate 'line', 314
    find_lex $P110, "$call"
    $P111 = $P110."invocant"()
    unless $P111, if_1212_end
.annotate 'line', 315
    find_lex $P1214, "$call"
    unless_null $P1214, vivify_170
    $P1214 = root_new ['parrot';'Hash']
  vivify_170:
    set $P112, $P1214["params"]
    unless_null $P112, vivify_171
    new $P112, "Undef"
  vivify_171:
    if $P112, unless_1213_end
    $P113 = "list"()
    find_lex $P1215, "$call"
    unless_null $P1215, vivify_172
    $P1215 = root_new ['parrot';'Hash']
    store_lex "$call", $P1215
  vivify_172:
    set $P1215["params"], $P113
  unless_1213_end:
.annotate 'line', 316
    find_lex $P1216, "$call"
    unless_null $P1216, vivify_173
    $P1216 = root_new ['parrot';'Hash']
  vivify_173:
    set $P112, $P1216["params"]
    unless_null $P112, vivify_174
    new $P112, "Undef"
  vivify_174:
    find_lex $P113, "$call"
    $P114 = $P113."invocant"()
    $P112."unshift"($P114)
  if_1212_end:
.annotate 'line', 319
    find_lex $P110, "self"
    find_lex $P1217, "$call"
    unless_null $P1217, vivify_175
    $P1217 = root_new ['parrot';'Hash']
  vivify_175:
    set $P111, $P1217["params"]
    unless_null $P111, vivify_176
    new $P111, "Undef"
  vivify_176:
    find_lex $P112, "%context"
    $P110."build_pcc_call"("set_args_pc", $P111, $P112)
.annotate 'line', 321
    find_lex $P110, "$call"
    $P111 = $P110."invocant"()
    if $P111, if_1218
.annotate 'line', 335
    .const 'Sub' $P1222 = "31_1312323127.11962" 
    capture_lex $P1222
    $P1222()
    goto if_1218_end
  if_1218:
.annotate 'line', 322
    find_lex $P112, "$call"
    $P113 = $P112."name"()
    get_hll_global $P114, ["POST"], "Constant"
    $P115 = $P113."isa"($P114)
    if $P115, if_1219
.annotate 'line', 332
    find_lex $P116, "self"
    $P116."panic"("NYI $P0.$S0()")
.annotate 'line', 331
    goto if_1219_end
  if_1219:
.annotate 'line', 323
    find_lex $P116, "$bc"
.annotate 'line', 325
    find_lex $P118, "$is_tailcall"
    if $P118, if_1220
    new $P120, "String"
    assign $P120, "callmethodcc_p_sc"
    set $P117, $P120
    goto if_1220_end
  if_1220:
    new $P119, "String"
    assign $P119, "tailcallmethod_p_sc"
    set $P117, $P119
  if_1220_end:
.annotate 'line', 327
    find_lex $P121, "self"
    find_lex $P122, "$call"
    $P123 = $P122."invocant"()
    find_lex $P124, "%context"
    $P125 = $P121."to_op"($P123, $P124)
.annotate 'line', 328
    find_lex $P126, "self"
    find_lex $P127, "$call"
    $P128 = $P127."name"()
    find_lex $P129, "%context"
    $P130 = $P126."to_op"($P128, $P129)
    new $P131, "ResizablePMCArray"
    push $P131, $P117
    push $P131, $P125
    push $P131, $P130
    push $P116, $P131
  if_1219_end:
  if_1218_end:
.annotate 'line', 387
    find_lex $P111, "$is_tailcall"
    unless $P111, unless_1259
    set $P110, $P111
    goto unless_1259_end
  unless_1259:
.annotate 'line', 388
    find_lex $P112, "self"
    find_lex $P1260, "$call"
    unless_null $P1260, vivify_206
    $P1260 = root_new ['parrot';'Hash']
  vivify_206:
    set $P113, $P1260["results"]
    unless_null $P113, vivify_207
    new $P113, "Undef"
  vivify_207:
    find_lex $P114, "%context"
    $P115 = $P112."build_pcc_call"("get_results_pc", $P113, $P114)
.annotate 'line', 387
    set $P110, $P115
  unless_1259_end:
.annotate 'line', 313
    set $P106, $P110
  if_1210_end:
.annotate 'line', 308
    .return ($P106)
  control_1202:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1221"  :anon :subid("31_1312323127.11962") :outer("30_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 335
    .const 'Sub' $P1228 = "32_1312323127.11962" 
    capture_lex $P1228
.annotate 'line', 336
    new $P112, "Undef"
    set $P1223, $P112
    .lex "$SUB", $P1223
.annotate 'line', 337
    new $P113, "Undef"
    set $P1224, $P113
    .lex "$processed", $P1224
.annotate 'line', 381
    new $P114, "Undef"
    set $P1225, $P114
    .lex "$o", $P1225
.annotate 'line', 335
    find_lex $P115, "$SUB"
.annotate 'line', 337
    new $P115, "Integer"
    assign $P115, 0
    store_lex "$processed", $P115
.annotate 'line', 338
    find_lex $P115, "$call"
    $P116 = $P115."name"()
    get_hll_global $P117, ["POST"], "Constant"
    $P118 = $P116."isa"($P117)
    unless $P118, if_1226_end
    .const 'Sub' $P1228 = "32_1312323127.11962" 
    capture_lex $P1228
    $P1228()
  if_1226_end:
.annotate 'line', 366
    find_lex $P115, "$processed"
    if $P115, unless_1248_end
.annotate 'line', 367
    find_lex $P116, "$call"
    $P117 = $P116."name"()
    get_hll_global $P118, ["POST"], "Constant"
    $P119 = $P117."isa"($P118)
    if $P119, if_1249
.annotate 'line', 376
    find_lex $P1253, "%context"
    unless_null $P1253, vivify_194
    $P1253 = root_new ['parrot';'Hash']
  vivify_194:
    set $P120, $P1253["DEBUG"]
    unless_null $P120, vivify_195
    new $P120, "Undef"
  vivify_195:
    unless $P120, if_1252_end
    find_lex $P121, "self"
    new $P122, "String"
    assign $P122, "Name is "
    find_lex $P1254, "$call"
    unless_null $P1254, vivify_196
    $P1254 = root_new ['parrot';'Hash']
  vivify_196:
    set $P123, $P1254["name"]
    unless_null $P123, vivify_197
    new $P123, "Undef"
  vivify_197:
    $S103 = $P123."WHAT"()
    concat $P124, $P122, $S103
    $P121."debug"($P124)
  if_1252_end:
.annotate 'line', 377
    find_lex $P1255, "$call"
    unless_null $P1255, vivify_198
    $P1255 = root_new ['parrot';'Hash']
  vivify_198:
    set $P120, $P1255["name"]
    unless_null $P120, vivify_199
    new $P120, "Undef"
  vivify_199:
    store_lex "$SUB", $P120
.annotate 'line', 375
    goto if_1249_end
  if_1249:
.annotate 'line', 368
    find_lex $P1250, "%context"
    unless_null $P1250, vivify_200
    $P1250 = root_new ['parrot';'Hash']
  vivify_200:
    set $P120, $P1250["sub"]
    unless_null $P120, vivify_201
    new $P120, "Undef"
  vivify_201:
    $P121 = $P120."symbol"("!SUB")
    store_lex "$SUB", $P121
.annotate 'line', 369
    find_lex $P120, "$bc"
.annotate 'line', 371
    find_lex $P121, "self"
    find_lex $P122, "$SUB"
    find_lex $P123, "%context"
    $P124 = $P121."to_op"($P122, $P123)
.annotate 'line', 372
    find_lex $P125, "self"
    find_lex $P1251, "$call"
    unless_null $P1251, vivify_202
    $P1251 = root_new ['parrot';'Hash']
  vivify_202:
    set $P126, $P1251["name"]
    unless_null $P126, vivify_203
    new $P126, "Undef"
  vivify_203:
    find_lex $P127, "%context"
    $P128 = $P125."to_op"($P126, $P127)
    new $P129, "ResizablePMCArray"
    push $P129, "find_sub_not_null_p_sc"
    push $P129, $P124
    push $P129, $P128
    push $P120, $P129
  if_1249_end:
  unless_1248_end:
.annotate 'line', 381
    find_lex $P116, "$is_tailcall"
    if $P116, if_1256
    new $P118, "String"
    assign $P118, "invokecc_p"
    set $P115, $P118
    goto if_1256_end
  if_1256:
    new $P117, "String"
    assign $P117, "tailcall_p"
    set $P115, $P117
  if_1256_end:
    store_lex "$o", $P115
.annotate 'line', 383
    find_lex $P1258, "%context"
    unless_null $P1258, vivify_204
    $P1258 = root_new ['parrot';'Hash']
  vivify_204:
    set $P115, $P1258["DEBUG"]
    unless_null $P115, vivify_205
    new $P115, "Undef"
  vivify_205:
    unless $P115, if_1257_end
    find_lex $P116, "self"
    find_lex $P117, "$o"
    $P116."debug"($P117)
  if_1257_end:
.annotate 'line', 384
    find_lex $P115, "$bc"
    find_lex $P116, "$o"
    find_lex $P117, "self"
    find_lex $P118, "$SUB"
    find_lex $P119, "%context"
    $P120 = $P117."to_op"($P118, $P119)
    new $P121, "ResizablePMCArray"
    push $P121, $P116
    push $P121, $P120
    push $P115, $P121
.annotate 'line', 335
    .return ($P115)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1227"  :anon :subid("32_1312323127.11962") :outer("31_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 338
    .const 'Sub' $P1241 = "33_1312323127.11962" 
    capture_lex $P1241
.annotate 'line', 341
    new $P119, "Undef"
    set $P1229, $P119
    .lex "$full_name", $P1229
.annotate 'line', 344
    new $P120, "Undef"
    set $P1230, $P120
    .lex "$invocable_sub", $P1230
.annotate 'line', 338
    find_lex $P121, "$full_name"
.annotate 'line', 342
    find_lex $P1232, "%context"
    unless_null $P1232, vivify_177
    $P1232 = root_new ['parrot';'Hash']
  vivify_177:
    set $P121, $P1232["sub"]
    unless_null $P121, vivify_178
    new $P121, "Undef"
  vivify_178:
    $P122 = $P121."namespace"()
    unless $P122, if_1231_end
    find_lex $P1233, "%context"
    unless_null $P1233, vivify_179
    $P1233 = root_new ['parrot';'Hash']
  vivify_179:
    set $P123, $P1233["sub"]
    unless_null $P123, vivify_180
    new $P123, "Undef"
  vivify_180:
    $P124 = $P123."namespace"()
    $P125 = $P124."Str"()
    store_lex "$full_name", $P125
  if_1231_end:
.annotate 'line', 343
    find_lex $P121, "$full_name"
    set $S103, $P121
    new $P122, 'String'
    set $P122, $S103
    find_lex $P1234, "$call"
    unless_null $P1234, vivify_181
    $P1234 = root_new ['parrot';'Hash']
  vivify_181:
    set $P1235, $P1234["name"]
    unless_null $P1235, vivify_182
    $P1235 = root_new ['parrot';'Hash']
  vivify_182:
    set $P123, $P1235["value"]
    unless_null $P123, vivify_183
    new $P123, "Undef"
  vivify_183:
    set $S104, $P123
    concat $P124, $P122, $S104
    store_lex "$full_name", $P124
.annotate 'line', 344
    find_lex $P1236, "%context"
    unless_null $P1236, vivify_184
    $P1236 = root_new ['parrot';'Hash']
  vivify_184:
    set $P121, $P1236["pir_file"]
    unless_null $P121, vivify_185
    new $P121, "Undef"
  vivify_185:
    find_lex $P122, "$full_name"
    $P123 = $P121."sub"($P122)
    store_lex "$invocable_sub", $P123
.annotate 'line', 345
    find_lex $P1238, "%context"
    unless_null $P1238, vivify_186
    $P1238 = root_new ['parrot';'Hash']
  vivify_186:
    set $P121, $P1238["DEBUG"]
    unless_null $P121, vivify_187
    new $P121, "Undef"
  vivify_187:
    unless $P121, if_1237_end
    find_lex $P122, "self"
    new $P123, 'String'
    set $P123, "invocable_sub '"
    find_lex $P124, "$full_name"
    concat $P125, $P123, $P124
    concat $P126, $P125, "'"
    $P122."debug"($P126)
  if_1237_end:
.annotate 'line', 346
    find_lex $P122, "$invocable_sub"
    if $P122, if_1239
    set $P121, $P122
    goto if_1239_end
  if_1239:
    .const 'Sub' $P1241 = "33_1312323127.11962" 
    capture_lex $P1241
    $P125 = $P1241()
    set $P121, $P125
  if_1239_end:
.annotate 'line', 338
    .return ($P121)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1240"  :anon :subid("33_1312323127.11962") :outer("32_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 347
    new $P123, "Undef"
    set $P1242, $P123
    .lex "$idx", $P1242
    find_lex $P124, "$invocable_sub"
    $P125 = $P124."constant_index"()
    store_lex "$idx", $P125
.annotate 'line', 348
    find_lex $P124, "$idx"
    defined $I103, $P124
    if $I103, unless_1243_end
.annotate 'line', 350
    find_lex $P1244, "%context"
    unless_null $P1244, vivify_188
    $P1244 = root_new ['parrot';'Hash']
  vivify_188:
    set $P125, $P1244["constants"]
    unless_null $P125, vivify_189
    new $P125, "Undef"
  vivify_189:
    new $P126, "Integer"
    push $P125, $P126
    store_lex "$idx", $P125
.annotate 'line', 351
    find_lex $P125, "$invocable_sub"
    find_lex $P126, "$idx"
    $P125."constant_index"($P126)
.annotate 'line', 352
    find_lex $P1246, "%context"
    unless_null $P1246, vivify_190
    $P1246 = root_new ['parrot';'Hash']
  vivify_190:
    set $P125, $P1246["DEBUG"]
    unless_null $P125, vivify_191
    new $P125, "Undef"
  vivify_191:
    unless $P125, if_1245_end
    find_lex $P126, "self"
    new $P127, 'String'
    set $P127, "Allocate constant for it "
    find_lex $P128, "$idx"
    concat $P129, $P127, $P128
    $P126."debug"($P129)
  if_1245_end:
  unless_1243_end:
.annotate 'line', 355
    find_lex $P1247, "%context"
    unless_null $P1247, vivify_192
    $P1247 = root_new ['parrot';'Hash']
  vivify_192:
    set $P124, $P1247["sub"]
    unless_null $P124, vivify_193
    new $P124, "Undef"
  vivify_193:
    $P125 = $P124."symbol"("!SUB")
    store_lex "$SUB", $P125
.annotate 'line', 356
    find_lex $P124, "$bc"
.annotate 'line', 358
    find_lex $P125, "self"
    find_lex $P126, "$SUB"
    find_lex $P127, "%context"
    $P128 = $P125."to_op"($P126, $P127)
    find_lex $P129, "$idx"
    new $P130, "ResizablePMCArray"
    push $P130, "set_p_pc"
    push $P130, $P128
    push $P130, $P129
.annotate 'line', 359
    push $P124, $P130
.annotate 'line', 362
    new $P124, "Integer"
    assign $P124, 1
    store_lex "$processed", $P124
.annotate 'line', 346
    .return ($P124)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("34_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Key"],_)
    .param pmc param_1268
    .param pmc param_1269
.annotate 'file', ''
.annotate 'line', 407
    new $P1267, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1267, control_1266
    push_eh $P1267
    .lex "self", self
    .lex "$key", param_1268
    .lex "%context", param_1269
.annotate 'line', 410
    new $P103, "Undef"
    set $P1270, $P103
    .lex "$key_pmc", $P1270
.annotate 'line', 416
    new $P104, "Undef"
    set $P1271, $P104
    .lex "$constants", $P1271
.annotate 'line', 417
    new $P105, "Undef"
    set $P1272, $P105
    .lex "$idx", $P1272
.annotate 'line', 409
    find_lex $P1274, "%context"
    unless_null $P1274, vivify_208
    $P1274 = root_new ['parrot';'Hash']
  vivify_208:
    set $P106, $P1274["DEBUG"]
    unless_null $P106, vivify_209
    new $P106, "Undef"
  vivify_209:
    unless $P106, if_1273_end
    find_lex $P107, "self"
    $P107."debug"("Want key")
  if_1273_end:
.annotate 'line', 410
    find_lex $P106, "$key"
    find_lex $P107, "%context"
    $P108 = $P106."to_pmc"($P107)
    set $P109, $P108[0]
    unless_null $P109, vivify_210
    new $P109, "Undef"
  vivify_210:
    store_lex "$key_pmc", $P109
.annotate 'line', 411
    find_lex $P1276, "%context"
    unless_null $P1276, vivify_211
    $P1276 = root_new ['parrot';'Hash']
  vivify_211:
    set $P106, $P1276["DEBUG"]
    unless_null $P106, vivify_212
    new $P106, "Undef"
  vivify_212:
    unless $P106, if_1275_end
    find_lex $P107, "self"
    $P107."debug"("Got key")
  if_1275_end:
.annotate 'line', 416
    find_lex $P1277, "%context"
    unless_null $P1277, vivify_213
    $P1277 = root_new ['parrot';'Hash']
  vivify_213:
    set $P106, $P1277["constants"]
    unless_null $P106, vivify_214
    new $P106, "Undef"
  vivify_214:
    store_lex "$constants", $P106
.annotate 'line', 407
    find_lex $P106, "$idx"
.annotate 'line', 418

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
.annotate 'line', 407
    find_lex $P106, "$idx"
    .return ($P106)
  control_1266:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("35_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Constant"],_)
    .param pmc param_1281
    .param pmc param_1282
.annotate 'file', ''
.annotate 'line', 434
    new $P1280, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1280, control_1279
    push_eh $P1280
    .lex "self", self
    .lex "$op", param_1281
    .lex "%context", param_1282
.annotate 'line', 435
    new $P103, "Undef"
    set $P1283, $P103
    .lex "$idx", $P1283
.annotate 'line', 436
    new $P104, "Undef"
    set $P1284, $P104
    .lex "$type", $P1284
.annotate 'line', 434
    find_lex $P105, "$idx"
.annotate 'line', 436
    find_lex $P105, "$op"
    $P106 = $P105."type"()
    store_lex "$type", $P106
.annotate 'line', 437
    find_lex $P106, "$type"
    set $S101, $P106
    iseq $I101, $S101, "ic"
    unless $I101, unless_1286
    new $P105, 'Integer'
    set $P105, $I101
    goto unless_1286_end
  unless_1286:
    find_lex $P107, "$type"
    set $S102, $P107
    iseq $I102, $S102, "kic"
    new $P105, 'Integer'
    set $P105, $I102
  unless_1286_end:
    if $P105, if_1285
.annotate 'line', 440
    find_lex $P108, "$type"
    set $S103, $P108
    iseq $I103, $S103, "nc"
    if $I103, if_1287
.annotate 'line', 444
    find_lex $P109, "self"
    $P109."panic"("NYI")
.annotate 'line', 443
    goto if_1287_end
  if_1287:
.annotate 'line', 441
    find_lex $P1288, "%context"
    unless_null $P1288, vivify_215
    $P1288 = root_new ['parrot';'Hash']
  vivify_215:
    set $P109, $P1288["constants"]
    unless_null $P109, vivify_216
    new $P109, "Undef"
  vivify_216:
    find_lex $P110, "$op"
    $P111 = $P110."value"()
    $P112 = $P109."get_or_create_number"($P111)
    store_lex "$idx", $P112
  if_1287_end:
.annotate 'line', 440
    goto if_1285_end
  if_1285:
.annotate 'line', 438
    find_lex $P108, "$op"
    $P109 = $P108."value"()
    store_lex "$idx", $P109
  if_1285_end:
.annotate 'line', 447
    find_lex $P1290, "%context"
    unless_null $P1290, vivify_217
    $P1290 = root_new ['parrot';'Hash']
  vivify_217:
    set $P105, $P1290["DEBUG"]
    unless_null $P105, vivify_218
    new $P105, "Undef"
  vivify_218:
    unless $P105, if_1289_end
    find_lex $P106, "self"
    new $P107, 'String'
    set $P107, "Index "
    find_lex $P108, "$idx"
    concat $P109, $P107, $P108
    $P106."debug"($P109)
  if_1289_end:
.annotate 'line', 434
    find_lex $P105, "$idx"
    .return ($P105)
  control_1279:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("36_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"String"],_)
    .param pmc param_1294
    .param pmc param_1295
.annotate 'file', ''
.annotate 'line', 451
    .const 'Sub' $P1303 = "37_1312323127.11962" 
    capture_lex $P1303
    new $P1293, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1293, control_1292
    push_eh $P1293
    .lex "self", self
    .lex "$str", param_1294
    .lex "%context", param_1295
.annotate 'line', 452
    new $P103, "Undef"
    set $P1296, $P103
    .lex "$idx", $P1296
.annotate 'line', 453
    new $P104, "Undef"
    set $P1297, $P104
    .lex "$type", $P1297
.annotate 'line', 451
    find_lex $P105, "$idx"
.annotate 'line', 453
    find_lex $P105, "$str"
    $P106 = $P105."type"()
    store_lex "$type", $P106
.annotate 'line', 454
    find_lex $P105, "$type"
    set $S101, $P105
    isne $I101, $S101, "sc"
    unless $I101, if_1298_end
.annotate 'line', 455
    find_lex $P106, "self"
    $P106."panic"("attempt to pass a non-sc value off as a string")
  if_1298_end:
.annotate 'line', 457
    find_lex $P106, "$str"
    $S101 = $P106."encoding"()
    iseq $I101, $S101, "fixed_8"
    if $I101, if_1300
    new $P105, 'Integer'
    set $P105, $I101
    goto if_1300_end
  if_1300:
    find_lex $P107, "$str"
    $S102 = $P107."charset"()
    iseq $I102, $S102, "ascii"
    new $P105, 'Integer'
    set $P105, $I102
  if_1300_end:
    if $P105, if_1299
.annotate 'line', 460
    .const 'Sub' $P1303 = "37_1312323127.11962" 
    capture_lex $P1303
    $P1303()
    goto if_1299_end
  if_1299:
.annotate 'line', 458
    find_lex $P1301, "%context"
    unless_null $P1301, vivify_221
    $P1301 = root_new ['parrot';'Hash']
  vivify_221:
    set $P108, $P1301["constants"]
    unless_null $P108, vivify_222
    new $P108, "Undef"
  vivify_222:
    find_lex $P109, "$str"
    $P110 = $P109."value"()
    $P111 = $P108."get_or_create_string"($P110)
    store_lex "$idx", $P111
  if_1299_end:
.annotate 'line', 451
    find_lex $P105, "$idx"
    .return ($P105)
  control_1292:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1302"  :anon :subid("37_1312323127.11962") :outer("36_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 462
    new $P108, "Undef"
    set $P1304, $P108
    .lex "$bb", $P1304
.annotate 'line', 463
    new $P109, "Undef"
    set $P1305, $P109
    .lex "$str_val", $P1305
.annotate 'line', 462
    new $P110, "ByteBuffer"
    store_lex "$bb", $P110
.annotate 'line', 463
    find_lex $P110, "$str"
    $P111 = $P110."value"()
    store_lex "$str_val", $P111
.annotate 'line', 464

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 472
    find_lex $P1306, "%context"
    unless_null $P1306, vivify_219
    $P1306 = root_new ['parrot';'Hash']
  vivify_219:
    set $P110, $P1306["constants"]
    unless_null $P110, vivify_220
    new $P110, "Undef"
  vivify_220:
    find_lex $P111, "$bb"
.annotate 'line', 473
    find_lex $P112, "$str"
    $P113 = $P112."encoding"()
    $P114 = $P111."get_string"($P113)
.annotate 'line', 472
    $P115 = $P110."get_or_create_string"($P114)
    store_lex "$idx", $P115
.annotate 'line', 460
    .return ($P115)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Value"],_)
    .param pmc param_1310
    .param pmc param_1311
.annotate 'file', ''
.annotate 'line', 480
    new $P1309, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1309, control_1308
    push_eh $P1309
    .lex "self", self
    .lex "$val", param_1310
    .lex "%context", param_1311
.annotate 'line', 482
    new $P103, "Undef"
    set $P1312, $P103
    .lex "$orig", $P1312
    find_lex $P104, "self"
    find_lex $P105, "$val"
    $P106 = $P105."name"()
    find_lex $P107, "%context"
    $P108 = $P104."get_register"($P106, $P107)
    store_lex "$orig", $P108
.annotate 'line', 483
    find_lex $P104, "self"
    find_lex $P105, "$orig"
    find_lex $P106, "%context"
    $P107 = $P104."to_op"($P105, $P106)
.annotate 'line', 480
    .return ($P107)
  control_1308:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("39_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Register"],_)
    .param pmc param_1316
    .param pmc param_1317
.annotate 'file', ''
.annotate 'line', 486
    new $P1315, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1315, control_1314
    push_eh $P1315
    .lex "self", self
    .lex "$reg", param_1316
    .lex "%context", param_1317
.annotate 'line', 487
    find_lex $P103, "$reg"
    $P104 = $P103."regno"()
.annotate 'line', 486
    .return ($P104)
  control_1314:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1312323127.11962") :method :outer("11_1312323127.11962") :multi(_,["POST";"Label"],_)
    .param pmc param_1321
    .param pmc param_1322
.annotate 'file', ''
.annotate 'line', 490
    new $P1320, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1320, control_1319
    push_eh $P1320
    .lex "self", self
    .lex "$l", param_1321
    .lex "%context", param_1322
.annotate 'line', 492
    new $P103, "Undef"
    set $P1323, $P103
    .lex "$bc", $P1323
.annotate 'line', 493
    new $P104, "Undef"
    set $P1324, $P104
    .lex "$pos", $P1324
.annotate 'line', 492
    find_lex $P1325, "%context"
    unless_null $P1325, vivify_223
    $P1325 = root_new ['parrot';'Hash']
  vivify_223:
    set $P105, $P1325["bytecode"]
    unless_null $P105, vivify_224
    new $P105, "Undef"
  vivify_224:
    store_lex "$bc", $P105
.annotate 'line', 493
    find_lex $P105, "$bc"
    set $N101, $P105
    new $P106, 'Float'
    set $P106, $N101
    store_lex "$pos", $P106
.annotate 'line', 497
    find_lex $P105, "$l"
    $P106 = $P105."name"()
.annotate 'line', 496
    find_lex $P1326, "%context"
    unless_null $P1326, vivify_225
    $P1326 = root_new ['parrot';'Hash']
  vivify_225:
    set $P107, $P1326["opcode_offset"]
    unless_null $P107, vivify_226
    new $P107, "Undef"
  vivify_226:
    find_lex $P1327, "%context"
    unless_null $P1327, vivify_227
    $P1327 = root_new ['parrot';'Hash']
  vivify_227:
    set $P108, $P1327["opcode_fullname"]
    unless_null $P108, vivify_228
    new $P108, "Undef"
  vivify_228:
    $P109 = "hash"($P106 :named("name"), $P107 :named("offset"), $P108 :named("opname"))
    find_lex $P110, "$pos"
    find_lex $P1328, "%context"
    unless_null $P1328, vivify_229
    $P1328 = root_new ['parrot';'Hash']
    store_lex "%context", $P1328
  vivify_229:
    set $P1329, $P1328["labels_todo"]
    unless_null $P1329, vivify_230
    $P1329 = root_new ['parrot';'Hash']
    set $P1328["labels_todo"], $P1329
  vivify_230:
    set $P1329[$P110], $P109
.annotate 'line', 502
    find_lex $P1331, "%context"
    unless_null $P1331, vivify_231
    $P1331 = root_new ['parrot';'Hash']
  vivify_231:
    set $P105, $P1331["DEBUG"]
    unless_null $P105, vivify_232
    new $P105, "Undef"
  vivify_232:
    unless $P105, if_1330_end
    find_lex $P106, "self"
    new $P107, 'String'
    set $P107, "Todo label '"
    find_lex $P108, "$l"
    $P109 = $P108."name"()
    set $S101, $P109
    concat $P108, $P107, $S101
    concat $P110, $P108, "' at "
    find_lex $P111, "$pos"
    concat $P112, $P110, $P111
    concat $P113, $P112, ", "
    find_lex $P1332, "%context"
    unless_null $P1332, vivify_233
    $P1332 = root_new ['parrot';'Hash']
  vivify_233:
    set $P114, $P1332["opcode_offset"]
    unless_null $P114, vivify_234
    new $P114, "Undef"
  vivify_234:
    set $S102, $P114
    concat $P115, $P113, $S102
    $P106."debug"($P115)
  if_1330_end:
.annotate 'line', 490
    .return (0)
  control_1319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("41_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1336
    .param pmc param_1337
    .param pmc param_1338
.annotate 'file', ''
.annotate 'line', 514
    .const 'Sub' $P1351 = "42_1312323127.11962" 
    capture_lex $P1351
    new $P1335, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1335, control_1334
    push_eh $P1335
    .lex "self", self
    .lex "$opname", param_1336
    .lex "@args", param_1337
    .lex "%context", param_1338
.annotate 'line', 515
    new $P103, "Undef"
    set $P1339, $P103
    .lex "$bc", $P1339
.annotate 'line', 516
    new $P104, "Undef"
    set $P1340, $P104
    .lex "$signature", $P1340
.annotate 'line', 517
    new $P105, "Undef"
    set $P1341, $P105
    .lex "$sig_idx", $P1341
.annotate 'line', 524
    $P1343 = root_new ['parrot';'ResizablePMCArray']
    set $P1342, $P1343
    .lex "@op", $P1342
.annotate 'line', 515
    find_lex $P1344, "%context"
    unless_null $P1344, vivify_235
    $P1344 = root_new ['parrot';'Hash']
  vivify_235:
    set $P106, $P1344["bytecode"]
    unless_null $P106, vivify_236
    new $P106, "Undef"
  vivify_236:
    store_lex "$bc", $P106
.annotate 'line', 516
    find_lex $P106, "self"
    find_lex $P107, "@args"
    find_lex $P108, "%context"
    $P109 = $P106."build_args_signature"($P107, $P108)
    store_lex "$signature", $P109
.annotate 'line', 517
    find_lex $P1345, "%context"
    unless_null $P1345, vivify_237
    $P1345 = root_new ['parrot';'Hash']
  vivify_237:
    set $P106, $P1345["constants"]
    unless_null $P106, vivify_238
    new $P106, "Undef"
  vivify_238:
    find_lex $P107, "$signature"
    $P108 = $P106."get_or_create_pmc"($P107)
    store_lex "$sig_idx", $P108
.annotate 'line', 519
    find_lex $P1347, "%context"
    unless_null $P1347, vivify_239
    $P1347 = root_new ['parrot';'Hash']
  vivify_239:
    set $P106, $P1347["DEBUG"]
    unless_null $P106, vivify_240
    new $P106, "Undef"
  vivify_240:
    unless $P106, if_1346_end
    find_lex $P107, "self"
    new $P108, 'String'
    set $P108, "Sig: "
    find_lex $P109, "$sig_idx"
    concat $P110, $P108, $P109
    $P107."debug"($P110)
  if_1346_end:
.annotate 'line', 521
    find_lex $P1349, "%context"
    unless_null $P1349, vivify_241
    $P1349 = root_new ['parrot';'Hash']
  vivify_241:
    set $P106, $P1349["DEBUG"]
    unless_null $P106, vivify_242
    new $P106, "Undef"
  vivify_242:
    unless $P106, if_1348_end
    find_lex $P107, "self"
    find_lex $P108, "$opname"
    $P107."debug"($P108)
  if_1348_end:
.annotate 'line', 524
    find_lex $P106, "$opname"
    find_lex $P107, "$sig_idx"
    $P108 = "list"($P106, $P107)
    store_lex "@op", $P108
.annotate 'line', 526
    find_lex $P107, "@args"
    defined $I101, $P107
    unless $I101, for_undef_243
    iter $P106, $P107
    new $P109, 'ExceptionHandler'
    set_label $P109, loop1361_handler
    $P109."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P109
  loop1361_test:
    unless $P106, loop1361_done
    shift $P108, $P106
  loop1361_redo:
    .const 'Sub' $P1351 = "42_1312323127.11962" 
    capture_lex $P1351
    $P1351($P108)
  loop1361_next:
    goto loop1361_test
  loop1361_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, .CONTROL_LOOP_NEXT, loop1361_next
    eq $P110, .CONTROL_LOOP_REDO, loop1361_redo
  loop1361_done:
    pop_eh 
  for_undef_243:
.annotate 'line', 537
    find_lex $P106, "$bc"
    find_lex $P107, "@op"
    push $P106, $P107
.annotate 'line', 514
    .return ($P106)
  control_1334:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1350"  :anon :subid("42_1312323127.11962") :outer("41_1312323127.11962")
    .param pmc param_1352
.annotate 'file', ''
.annotate 'line', 526
    .const 'Sub' $P1355 = "43_1312323127.11962" 
    capture_lex $P1355
    .lex "$arg", param_1352
.annotate 'line', 528
    find_lex $P109, "$arg"
    $P110 = $P109."modifier"()
    isa $I102, $P110, "Hash"
    unless $I102, if_1353_end
    .const 'Sub' $P1355 = "43_1312323127.11962" 
    capture_lex $P1355
    $P1355()
  if_1353_end:
.annotate 'line', 534
    find_lex $P109, "@op"
    find_lex $P110, "self"
    find_lex $P111, "$arg"
    find_lex $P112, "%context"
    $P113 = $P110."to_op"($P111, $P112)
    $P114 = $P109."push"($P113)
.annotate 'line', 526
    .return ($P114)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1354"  :anon :subid("43_1312323127.11962") :outer("42_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 529
    new $P111, "Undef"
    set $P1356, $P111
    .lex "$name", $P1356
    find_lex $P112, "$arg"
    $P113 = $P112."modifier"()
    set $P114, $P113["named"]
    unless_null $P114, vivify_244
    new $P114, "Undef"
  vivify_244:
    set $P1357, $P114
    defined $I1359, $P1357
    if $I1359, default_1358
    find_lex $P115, "$arg"
    $P116 = $P115."name"()
    set $P1357, $P116
  default_1358:
    store_lex "$name", $P1357
.annotate 'line', 530
    find_lex $P112, "@op"
.annotate 'line', 531
    find_lex $P1360, "%context"
    unless_null $P1360, vivify_245
    $P1360 = root_new ['parrot';'Hash']
  vivify_245:
    set $P113, $P1360["constants"]
    unless_null $P113, vivify_246
    new $P113, "Undef"
  vivify_246:
    find_lex $P114, "$name"
    $P115 = $P113."get_or_create_string"($P114)
    $P116 = $P112."push"($P115)
.annotate 'line', 528
    .return ($P116)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("44_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1365
    .param pmc param_1366
.annotate 'file', ''
.annotate 'line', 540
    .const 'Sub' $P1384 = "47_1312323127.11962" 
    capture_lex $P1384
    .const 'Sub' $P1373 = "45_1312323127.11962" 
    capture_lex $P1373
    new $P1364, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1364, control_1363
    push_eh $P1364
    .lex "self", self
    .lex "@args", param_1365
    .lex "%context", param_1366
.annotate 'line', 541
    $P1368 = root_new ['parrot';'ResizablePMCArray']
    set $P1367, $P1368
    .lex "@sig", $P1367
.annotate 'line', 554
    new $P103, "Undef"
    set $P1369, $P103
    .lex "$elements", $P1369
.annotate 'line', 555
    new $P104, "Undef"
    set $P1370, $P104
    .lex "$signature", $P1370
.annotate 'line', 563
    new $P105, "Undef"
    set $P1371, $P105
    .lex "$idx", $P1371
.annotate 'line', 540
    find_lex $P106, "@sig"
.annotate 'line', 542
    find_lex $P107, "@args"
    defined $I101, $P107
    unless $I101, for_undef_247
    iter $P106, $P107
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1381_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
  loop1381_test:
    unless $P106, loop1381_done
    shift $P108, $P106
  loop1381_redo:
    .const 'Sub' $P1373 = "45_1312323127.11962" 
    capture_lex $P1373
    $P1373($P108)
  loop1381_next:
    goto loop1381_test
  loop1381_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, .CONTROL_LOOP_NEXT, loop1381_next
    eq $P112, .CONTROL_LOOP_REDO, loop1381_redo
  loop1381_done:
    pop_eh 
  for_undef_247:
.annotate 'line', 554
    find_lex $P106, "@sig"
    set $N101, $P106
    new $P107, 'Float'
    set $P107, $N101
    store_lex "$elements", $P107
.annotate 'line', 555

        $P1382 = find_lex '$elements'
        $I99 = $P1382
        $P1382 = find_lex '$signature'
        $P1382 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1382
.annotate 'line', 563
    new $P106, "Integer"
    assign $P106, 0
    store_lex "$idx", $P106
.annotate 'line', 564
    find_lex $P107, "@sig"
    defined $I101, $P107
    unless $I101, for_undef_249
    iter $P106, $P107
    new $P109, 'ExceptionHandler'
    set_label $P109, loop1388_handler
    $P109."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P109
  loop1388_test:
    unless $P106, loop1388_done
    shift $P108, $P106
  loop1388_redo:
    .const 'Sub' $P1384 = "47_1312323127.11962" 
    capture_lex $P1384
    $P1384($P108)
  loop1388_next:
    goto loop1388_test
  loop1388_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, .CONTROL_LOOP_NEXT, loop1388_next
    eq $P110, .CONTROL_LOOP_REDO, loop1388_redo
  loop1388_done:
    pop_eh 
  for_undef_249:
.annotate 'line', 540
    find_lex $P106, "$signature"
    .return ($P106)
  control_1363:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "_block1372"  :anon :subid("45_1312323127.11962") :outer("44_1312323127.11962")
    .param pmc param_1374
.annotate 'file', ''
.annotate 'line', 542
    .const 'Sub' $P1378 = "46_1312323127.11962" 
    capture_lex $P1378
    .lex "$arg", param_1374
.annotate 'line', 544
    new $P109, "Undef"
    set $P1375, $P109
    .lex "$s", $P1375
    find_lex $P110, "self"
    find_lex $P111, "$arg"
    find_lex $P112, "%context"
    $P113 = $P110."build_single_arg"($P111, $P112)
    store_lex "$s", $P113
.annotate 'line', 545
    find_lex $P111, "$s"
    isa $I102, $P111, "Integer"
    if $I102, if_1376
.annotate 'line', 549
    find_lex $P113, "$s"
    defined $I103, $P113
    unless $I103, for_undef_248
    iter $P112, $P113
    new $P116, 'ExceptionHandler'
    set_label $P116, loop1380_handler
    $P116."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P116
  loop1380_test:
    unless $P112, loop1380_done
    shift $P115, $P112
  loop1380_redo:
    .const 'Sub' $P1378 = "46_1312323127.11962" 
    capture_lex $P1378
    $P1378($P115)
  loop1380_next:
    goto loop1380_test
  loop1380_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, 'type'
    eq $P117, .CONTROL_LOOP_NEXT, loop1380_next
    eq $P117, .CONTROL_LOOP_REDO, loop1380_redo
  loop1380_done:
    pop_eh 
  for_undef_248:
.annotate 'line', 548
    set $P110, $P112
.annotate 'line', 545
    goto if_1376_end
  if_1376:
.annotate 'line', 546
    find_lex $P112, "@sig"
    find_lex $P113, "$s"
    $P114 = $P112."push"($P113)
.annotate 'line', 545
    set $P110, $P114
  if_1376_end:
.annotate 'line', 542
    .return ($P110)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1377"  :anon :subid("46_1312323127.11962") :outer("45_1312323127.11962")
    .param pmc param_1379
.annotate 'file', ''
.annotate 'line', 549
    .lex "$_", param_1379
    find_lex $P116, "@sig"
    find_lex $P117, "$_"
    $P118 = $P116."push"($P117)
    .return ($P118)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1383"  :anon :subid("47_1312323127.11962") :outer("44_1312323127.11962")
    .param pmc param_1385
.annotate 'file', ''
.annotate 'line', 564
    .lex "$val", param_1385
.annotate 'line', 565
    find_lex $P109, "$val"
    find_lex $P110, "$idx"
    set $I102, $P110
    find_lex $P1386, "$signature"
    unless_null $P1386, vivify_250
    $P1386 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1386
  vivify_250:
    set $P1386[$I102], $P109
.annotate 'line', 564
    find_lex $P109, "$idx"
    clone $P1387, $P109
    inc $P109
    .return ($P1387)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("48_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1392
    .param pmc param_1393
.annotate 'file', ''
.annotate 'line', 572
    new $P1391, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1391, control_1390
    push_eh $P1391
    .lex "self", self
    .lex "$arg", param_1392
    .lex "%context", param_1393
.annotate 'line', 575
    new $P103, "Undef"
    set $P1394, $P103
    .lex "$type", $P1394
.annotate 'line', 577
    new $P104, "Undef"
    set $P1395, $P104
    .lex "$res", $P1395
.annotate 'line', 591
    new $P105, "Undef"
    set $P1396, $P105
    .lex "$mod", $P1396
.annotate 'line', 575
    find_lex $P106, "$arg"
    $P107 = $P106."type"()
    set $P1397, $P107
    defined $I1399, $P1397
    if $I1399, default_1398
    find_lex $P108, "self"
    find_lex $P109, "$arg"
    $P110 = $P109."name"()
    find_lex $P111, "%context"
    $P112 = $P108."get_register"($P110, $P111)
    $P113 = $P112."type"()
    set $P1397, $P113
  default_1398:
    store_lex "$type", $P1397
.annotate 'line', 572
    find_lex $P106, "$res"
.annotate 'line', 580
    find_lex $P106, "$type"
    set $S101, $P106
    iseq $I101, $S101, "i"
    if $I101, if_1400
.annotate 'line', 581
    find_lex $P107, "$type"
    set $S102, $P107
    iseq $I102, $S102, "s"
    if $I102, if_1401
.annotate 'line', 582
    find_lex $P108, "$type"
    set $S103, $P108
    iseq $I103, $S103, "p"
    if $I103, if_1402
.annotate 'line', 583
    find_lex $P109, "$type"
    set $S104, $P109
    iseq $I104, $S104, "n"
    if $I104, if_1403
.annotate 'line', 585
    find_lex $P110, "$type"
    set $S105, $P110
    iseq $I105, $S105, "ic"
    if $I105, if_1404
.annotate 'line', 586
    find_lex $P111, "$type"
    set $S106, $P111
    iseq $I106, $S106, "sc"
    if $I106, if_1405
.annotate 'line', 587
    find_lex $P112, "$type"
    set $S107, $P112
    iseq $I107, $S107, "pc"
    if $I107, if_1406
.annotate 'line', 588
    find_lex $P113, "$type"
    set $S108, $P113
    iseq $I108, $S108, "nc"
    if $I108, if_1407
.annotate 'line', 589
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "Unknown arg type '"
    find_lex $P116, "$type"
    concat $P117, $P115, $P116
    concat $P118, $P117, "'"
    $P114."panic"($P118)
    goto if_1407_end
  if_1407:
.annotate 'line', 588
    new $P114, "Integer"
    assign $P114, 3
    add $P115, $P114, 16
    store_lex "$res", $P115
  if_1407_end:
    goto if_1406_end
  if_1406:
.annotate 'line', 587
    new $P113, "Integer"
    assign $P113, 2
    add $P114, $P113, 16
    store_lex "$res", $P114
  if_1406_end:
    goto if_1405_end
  if_1405:
.annotate 'line', 586
    new $P112, "Integer"
    assign $P112, 1
    add $P113, $P112, 16
    store_lex "$res", $P113
  if_1405_end:
    goto if_1404_end
  if_1404:
.annotate 'line', 585
    new $P111, "Integer"
    assign $P111, 0
    add $P112, $P111, 16
    store_lex "$res", $P112
  if_1404_end:
    goto if_1403_end
  if_1403:
.annotate 'line', 583
    new $P110, "Integer"
    assign $P110, 3
    store_lex "$res", $P110
  if_1403_end:
    goto if_1402_end
  if_1402:
.annotate 'line', 582
    new $P109, "Integer"
    assign $P109, 2
    store_lex "$res", $P109
  if_1402_end:
    goto if_1401_end
  if_1401:
.annotate 'line', 581
    new $P108, "Integer"
    assign $P108, 1
    store_lex "$res", $P108
  if_1401_end:
    goto if_1400_end
  if_1400:
.annotate 'line', 580
    new $P107, "Integer"
    assign $P107, 0
    store_lex "$res", $P107
  if_1400_end:
.annotate 'line', 591
    find_lex $P106, "$arg"
    $P107 = $P106."modifier"()
    store_lex "$mod", $P107
.annotate 'line', 592
    find_lex $P106, "$mod"
    unless $P106, if_1408_end
.annotate 'line', 593
    find_lex $P107, "$mod"
    isa $I101, $P107, "Hash"
    if $I101, if_1409
.annotate 'line', 598
    find_lex $P108, "$mod"
    set $S101, $P108
    iseq $I102, $S101, "slurpy"
    if $I102, if_1410
.annotate 'line', 599
    find_lex $P109, "$mod"
    set $S102, $P109
    iseq $I103, $S102, "flat"
    if $I103, if_1411
.annotate 'line', 600
    find_lex $P110, "$mod"
    set $S103, $P110
    iseq $I104, $S103, "optional"
    if $I104, if_1412
.annotate 'line', 601
    find_lex $P111, "$mod"
    set $S104, $P111
    iseq $I105, $S104, "opt_flag"
    if $I105, if_1413
.annotate 'line', 602
    find_lex $P112, "$mod"
    set $S105, $P112
    iseq $I106, $S105, "slurpy named"
    if $I106, if_1414
.annotate 'line', 603
    find_lex $P113, "self"
    new $P114, 'String'
    set $P114, "Unsupported modifier "
    find_lex $P115, "$mod"
    concat $P116, $P114, $P115
    $P113."panic"($P116)
    goto if_1414_end
  if_1414:
.annotate 'line', 602
    find_lex $P113, "$res"
    add $P114, $P113, 32
    add $P115, $P114, 512
    store_lex "$res", $P115
  if_1414_end:
    goto if_1413_end
  if_1413:
.annotate 'line', 601
    find_lex $P112, "$res"
    add $P113, $P112, 256
    store_lex "$res", $P113
  if_1413_end:
    goto if_1412_end
  if_1412:
.annotate 'line', 600
    find_lex $P111, "$res"
    add $P112, $P111, 128
    store_lex "$res", $P112
  if_1412_end:
    goto if_1411_end
  if_1411:
.annotate 'line', 599
    find_lex $P110, "$res"
    add $P111, $P110, 32
    store_lex "$res", $P111
  if_1411_end:
    goto if_1410_end
  if_1410:
.annotate 'line', 598
    find_lex $P109, "$res"
    add $P110, $P109, 32
    store_lex "$res", $P110
  if_1410_end:
    goto if_1409_end
  if_1409:
.annotate 'line', 596
    new $P108, "Integer"
    assign $P108, 1
    add $P109, $P108, 16
    add $P110, $P109, 512
    find_lex $P111, "$res"
    add $P112, $P111, 512
    $P113 = "list"($P110, $P112)
    store_lex "$res", $P113
  if_1409_end:
  if_1408_end:
.annotate 'line', 572
    find_lex $P106, "$res"
    .return ($P106)
  control_1390:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("49_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1418
.annotate 'file', ''
.annotate 'line', 614
    .const 'Sub' $P1420 = "50_1312323127.11962" 
    capture_lex $P1420
    new $P1417, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1417, control_1416
    push_eh $P1417
    .lex "self", self
    .lex "$post", param_1418
.annotate 'line', 615
    find_lex $P104, "$post"
    $P105 = $P104."list"()
    defined $I101, $P105
    unless $I101, for_undef_251
    iter $P103, $P105
    new $P108, 'ExceptionHandler'
    set_label $P108, loop1423_handler
    $P108."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P108
  loop1423_test:
    unless $P103, loop1423_done
    shift $P106, $P103
  loop1423_redo:
    .const 'Sub' $P1420 = "50_1312323127.11962" 
    capture_lex $P1420
    $P1420($P106)
  loop1423_next:
    goto loop1423_test
  loop1423_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, 'type'
    eq $P109, .CONTROL_LOOP_NEXT, loop1423_next
    eq $P109, .CONTROL_LOOP_REDO, loop1423_redo
  loop1423_done:
    pop_eh 
  for_undef_251:
.annotate 'line', 614
    .return ($P103)
  control_1416:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1419"  :anon :subid("50_1312323127.11962") :outer("49_1312323127.11962")
    .param pmc param_1421
.annotate 'file', ''
.annotate 'line', 615
    .lex "$sub", param_1421
.annotate 'line', 617
    find_lex $P108, "$sub"
    get_hll_global $P109, ["POST"], "Sub"
    $P110 = $P108."isa"($P109)
    if $P110, if_1422
    set $P107, $P110
    goto if_1422_end
  if_1422:
    find_lex $P111, "$post"
    find_lex $P112, "$sub"
    $P113 = $P112."full_name"()
    find_lex $P114, "$sub"
    $P115 = $P111."sub"($P113, $P114)
    set $P107, $P115
  if_1422_end:
.annotate 'line', 615
    .return ($P107)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("51_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1427
    .param pmc param_1428
.annotate 'file', ''
.annotate 'line', 622
    new $P1426, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1426, control_1425
    push_eh $P1426
    .lex "self", self
    .lex "$sub", param_1427
    .lex "%context", param_1428
.annotate 'line', 630
    new $P103, "Undef"
    set $P1429, $P103
    .lex "$res", $P1429
    new $P104, "Integer"
    assign $P104, 0
    store_lex "$res", $P104
.annotate 'line', 631
    find_lex $P104, "$res"
    new $P105, "Integer"
    assign $P105, 1
    find_lex $P106, "$sub"
    $N101 = $P106."outer"()
    mul $P107, $P105, $N101
    add $P108, $P104, $P107
    store_lex "$res", $P108
.annotate 'line', 632
    find_lex $P104, "$res"
    new $P105, "Integer"
    assign $P105, 8
    find_lex $P106, "$sub"
    $N101 = $P106."anon"()
    mul $P107, $P105, $N101
    add $P108, $P104, $P107
    store_lex "$res", $P108
.annotate 'line', 633
    find_lex $P104, "$res"
    new $P105, "Integer"
    assign $P105, 16
    find_lex $P106, "$sub"
    $N101 = $P106."main"()
    mul $P107, $P105, $N101
    add $P108, $P104, $P107
    store_lex "$res", $P108
.annotate 'line', 634
    find_lex $P104, "$res"
    new $P105, "Integer"
    assign $P105, 32
    find_lex $P106, "$sub"
    $N101 = $P106."load"()
    mul $P107, $P105, $N101
    add $P108, $P104, $P107
    store_lex "$res", $P108
.annotate 'line', 635
    find_lex $P104, "$res"
    new $P105, "Integer"
    assign $P105, 64
    find_lex $P106, "$sub"
    $N101 = $P106."immediate"()
    mul $P107, $P105, $N101
    add $P108, $P104, $P107
    store_lex "$res", $P108
.annotate 'line', 636
    find_lex $P104, "$res"
    new $P105, "Integer"
    assign $P105, 128
    find_lex $P106, "$sub"
    $N101 = $P106."postcomp"()
    mul $P107, $P105, $N101
    add $P108, $P104, $P107
    store_lex "$res", $P108
.annotate 'line', 638
    find_lex $P1431, "%context"
    unless_null $P1431, vivify_252
    $P1431 = root_new ['parrot';'Hash']
  vivify_252:
    set $P104, $P1431["DEBUG"]
    unless_null $P104, vivify_253
    new $P104, "Undef"
  vivify_253:
    unless $P104, if_1430_end
    find_lex $P105, "self"
    new $P106, 'String'
    set $P106, "pf_flags "
    find_lex $P107, "$res"
    concat $P108, $P106, $P107
    $P105."debug"($P108)
  if_1430_end:
.annotate 'line', 622
    find_lex $P104, "$res"
    .return ($P104)
  control_1425:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("52_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1435
    .param pmc param_1436
.annotate 'file', ''
.annotate 'line', 643
    new $P1434, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1434, control_1433
    push_eh $P1434
    .lex "self", self
    .lex "$sub", param_1435
    .lex "%context", param_1436
.annotate 'line', 648
    new $P103, "Undef"
    set $P1437, $P103
    .lex "$res", $P1437
    new $P104, "Integer"
    assign $P104, 0
    store_lex "$res", $P104
.annotate 'line', 649
    find_lex $P104, "$sub"
    $P105 = $P104."vtable"()
    unless $P105, if_1438_end
    find_lex $P106, "$res"
    add $P107, $P106, 2
    store_lex "$res", $P107
  if_1438_end:
.annotate 'line', 650
    find_lex $P104, "$sub"
    $P105 = $P104."is_method"()
    unless $P105, if_1439_end
    find_lex $P106, "$res"
    add $P107, $P106, 4
    store_lex "$res", $P107
  if_1439_end:
.annotate 'line', 651
    find_lex $P104, "$sub"
    $P105 = $P104."is_init"()
    unless $P105, if_1440_end
    find_lex $P106, "$res"
    add $P107, $P106, 1024
    store_lex "$res", $P107
  if_1440_end:
.annotate 'line', 652
    find_lex $P104, "$sub"
    $P105 = $P104."nsentry"()
    unless $P105, if_1441_end
    find_lex $P106, "$res"
    add $P107, $P106, 2048
    store_lex "$res", $P107
  if_1441_end:
.annotate 'line', 654
    find_lex $P1443, "%context"
    unless_null $P1443, vivify_254
    $P1443 = root_new ['parrot';'Hash']
  vivify_254:
    set $P104, $P1443["DEBUG"]
    unless_null $P104, vivify_255
    new $P104, "Undef"
  vivify_255:
    unless $P104, if_1442_end
    find_lex $P105, "self"
    new $P106, 'String'
    set $P106, "comp_flags "
    find_lex $P107, "$res"
    concat $P108, $P106, $P107
    $P105."debug"($P108)
  if_1442_end:
.annotate 'line', 643
    find_lex $P104, "$res"
    .return ($P104)
  control_1433:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("53_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1447
    .param pmc param_1448
    .param pmc param_1449
    .param pmc param_1450
.annotate 'file', ''
.annotate 'line', 659
    .const 'Sub' $P1454 = "54_1312323127.11962" 
    capture_lex $P1454
    new $P1446, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1446, control_1445
    push_eh $P1446
    .lex "self", self
    .lex "$sub", param_1447
    .lex "$labels_todo", param_1448
    .lex "$bc", param_1449
    .lex "%context", param_1450
.annotate 'line', 660
    find_lex $P1452, "%context"
    unless_null $P1452, vivify_256
    $P1452 = root_new ['parrot';'Hash']
  vivify_256:
    set $P103, $P1452["DEBUG"]
    unless_null $P103, vivify_257
    new $P103, "Undef"
  vivify_257:
    unless $P103, if_1451_end
    find_lex $P104, "self"
    $P104."debug"("Fixup labels")
  if_1451_end:
.annotate 'line', 661
    find_lex $P104, "$labels_todo"
    defined $I101, $P104
    unless $I101, for_undef_258
    iter $P103, $P104
    new $P110, 'ExceptionHandler'
    set_label $P110, loop1471_handler
    $P110."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P110
  loop1471_test:
    unless $P103, loop1471_done
    shift $P105, $P103
  loop1471_redo:
    .const 'Sub' $P1454 = "54_1312323127.11962" 
    capture_lex $P1454
    $P1454($P105)
  loop1471_next:
    goto loop1471_test
  loop1471_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P111, exception, 'type'
    eq $P111, .CONTROL_LOOP_NEXT, loop1471_next
    eq $P111, .CONTROL_LOOP_REDO, loop1471_redo
  loop1471_done:
    pop_eh 
  for_undef_258:
.annotate 'line', 659
    .return ($P103)
  control_1445:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1453"  :anon :subid("54_1312323127.11962") :outer("53_1312323127.11962")
    .param pmc param_1455
.annotate 'file', ''
.annotate 'line', 661
    .lex "$kv", param_1455
.annotate 'line', 662
    new $P106, "Undef"
    set $P1456, $P106
    .lex "$offset", $P1456
.annotate 'line', 663
    $P1458 = root_new ['parrot';'Hash']
    set $P1457, $P1458
    .lex "%todo", $P1457
.annotate 'line', 666
    new $P107, "Undef"
    set $P1459, $P107
    .lex "$op", $P1459
.annotate 'line', 669
    new $P108, "Undef"
    set $P1460, $P108
    .lex "$delta", $P1460
.annotate 'line', 662
    find_lex $P109, "$kv"
    $P110 = $P109."key"()
    store_lex "$offset", $P110
.annotate 'line', 663
    find_lex $P109, "$kv"
    $P110 = $P109."value"()
    store_lex "%todo", $P110
.annotate 'line', 664
    find_lex $P1462, "%context"
    unless_null $P1462, vivify_259
    $P1462 = root_new ['parrot';'Hash']
  vivify_259:
    set $P109, $P1462["DEBUG"]
    unless_null $P109, vivify_260
    new $P109, "Undef"
  vivify_260:
    unless $P109, if_1461_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Fixing '"
    find_lex $P1463, "%todo"
    unless_null $P1463, vivify_261
    $P1463 = root_new ['parrot';'Hash']
  vivify_261:
    set $P112, $P1463["name"]
    unless_null $P112, vivify_262
    new $P112, "Undef"
  vivify_262:
    set $S101, $P112
    concat $P113, $P111, $S101
    concat $P114, $P113, "' from op "
    find_lex $P1464, "%todo"
    unless_null $P1464, vivify_263
    $P1464 = root_new ['parrot';'Hash']
  vivify_263:
    set $P115, $P1464["opname"]
    unless_null $P115, vivify_264
    new $P115, "Undef"
  vivify_264:
    set $S102, $P115
    concat $P116, $P114, $S102
    concat $P117, $P116, " at "
    find_lex $P118, "$offset"
    set $S103, $P118
    concat $P119, $P117, $S103
    $P110."debug"($P119)
  if_1461_end:
.annotate 'line', 666
    find_lex $P1465, "%todo"
    unless_null $P1465, vivify_265
    $P1465 = root_new ['parrot';'Hash']
  vivify_265:
    set $P109, $P1465["opname"]
    unless_null $P109, vivify_266
    new $P109, "Undef"
  vivify_266:
    set $S101, $P109
    find_lex $P110, "$bc"
    $P111 = $P110."opmap"()
    set $P112, $P111[$S101]
    unless_null $P112, vivify_267
    new $P112, "Undef"
  vivify_267:
    store_lex "$op", $P112
.annotate 'line', 667
    find_lex $P1467, "%context"
    unless_null $P1467, vivify_268
    $P1467 = root_new ['parrot';'Hash']
  vivify_268:
    set $P109, $P1467["DEBUG"]
    unless_null $P109, vivify_269
    new $P109, "Undef"
  vivify_269:
    unless $P109, if_1466_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Op length is "
    find_lex $P112, "$op"
    $P113 = $P112."length"()
    set $S101, $P113
    concat $P112, $P111, $S101
    $P110."debug"($P112)
  if_1466_end:
.annotate 'line', 669
    find_lex $P109, "$sub"
    find_lex $P1468, "%todo"
    unless_null $P1468, vivify_270
    $P1468 = root_new ['parrot';'Hash']
  vivify_270:
    set $P110, $P1468["name"]
    unless_null $P110, vivify_271
    new $P110, "Undef"
  vivify_271:
    $P111 = $P109."label"($P110)
    $P112 = $P111."position"()
    find_lex $P1469, "%todo"
    unless_null $P1469, vivify_272
    $P1469 = root_new ['parrot';'Hash']
  vivify_272:
    set $P113, $P1469["offset"]
    unless_null $P113, vivify_273
    new $P113, "Undef"
  vivify_273:
    sub $P114, $P112, $P113
    store_lex "$delta", $P114
.annotate 'line', 671
    find_lex $P109, "$delta"
    find_lex $P110, "$offset"
    find_lex $P111, "$op"
    $N101 = $P111."length"()
    add $P112, $P110, $N101
    set $I102, $P112
    find_lex $P1470, "$bc"
    unless_null $P1470, vivify_274
    $P1470 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1470
  vivify_274:
    set $P1470[$I102], $P109
.annotate 'line', 661
    .return ($P109)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("55_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1475
    .param pmc param_1476
.annotate 'file', ''
.annotate 'line', 676
    new $P1474, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1474, control_1473
    push_eh $P1474
    .lex "self", self
    .lex "$name", param_1475
    .lex "%context", param_1476
.annotate 'line', 677
    new $P103, "Undef"
    set $P1477, $P103
    .lex "$reg", $P1477
    find_lex $P1478, "%context"
    unless_null $P1478, vivify_275
    $P1478 = root_new ['parrot';'Hash']
  vivify_275:
    set $P104, $P1478["sub"]
    unless_null $P104, vivify_276
    new $P104, "Undef"
  vivify_276:
    find_lex $P105, "$name"
    $P106 = $P104."symbol"($P105)
    store_lex "$reg", $P106
.annotate 'line', 678
    find_lex $P104, "$reg"
    isfalse $I101, $P104
    unless $I101, if_1479_end
.annotate 'line', 679
    find_lex $P105, "self"
    new $P106, 'String'
    set $P106, "Register '"
    find_lex $P107, "$name"
    set $S101, $P107
    concat $P108, $P106, $S101
    concat $P109, $P108, "' not predeclared in '"
    find_lex $P1480, "%context"
    unless_null $P1480, vivify_277
    $P1480 = root_new ['parrot';'Hash']
  vivify_277:
    set $P110, $P1480["sub"]
    unless_null $P110, vivify_278
    new $P110, "Undef"
  vivify_278:
    $P111 = $P110."name"()
    set $S102, $P111
    concat $P110, $P109, $S102
    concat $P112, $P110, "'"
    $P105."panic"($P112)
  if_1479_end:
.annotate 'line', 676
    find_lex $P104, "$reg"
    .return ($P104)
  control_1473:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "debug"  :subid("56_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1484 :slurpy
.annotate 'file', ''
.annotate 'line', 684
    .const 'Sub' $P1486 = "57_1312323127.11962" 
    capture_lex $P1486
    new $P1483, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1483, control_1482
    push_eh $P1483
    .lex "self", self
    .lex "@args", param_1484
.annotate 'line', 685
    find_lex $P104, "@args"
    defined $I101, $P104
    unless $I101, for_undef_279
    iter $P103, $P104
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1488_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1488_test:
    unless $P103, loop1488_done
    shift $P105, $P103
  loop1488_redo:
    .const 'Sub' $P1486 = "57_1312323127.11962" 
    capture_lex $P1486
    $P1486($P105)
  loop1488_next:
    goto loop1488_test
  loop1488_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop1488_next
    eq $P107, .CONTROL_LOOP_REDO, loop1488_redo
  loop1488_done:
    pop_eh 
  for_undef_279:
.annotate 'line', 684
    .return ($P103)
  control_1482:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1485"  :anon :subid("57_1312323127.11962") :outer("56_1312323127.11962")
    .param pmc param_1487
.annotate 'file', ''
.annotate 'line', 685
    .lex "$_", param_1487
.annotate 'line', 686
    find_lex $P106, "$_"
    say $P106
.annotate 'line', 685
    .return ()
.end


.namespace ["POST";"PBCCompiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("58_1312323127.11962") :method :outer("11_1312323127.11962")
    .param pmc param_1492
    .param pmc param_1493
.annotate 'file', ''
.annotate 'line', 690
    new $P1491, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1491, control_1490
    push_eh $P1491
    .lex "self", self
    .lex "$past", param_1492
    .lex "%adverbs", param_1493
.annotate 'line', 691
    $P1495 = root_new ['parrot';'Hash']
    set $P1494, $P1495
    .lex "%context", $P1494
.annotate 'line', 699
    new $P103, "Undef"
    set $P1496, $P103
    .lex "$pfdir", $P1496
.annotate 'line', 690
    find_lex $P104, "%context"
.annotate 'line', 693
    find_lex $P104, "self"
    find_lex $P1497, "%context"
    unless_null $P1497, vivify_280
    $P1497 = root_new ['parrot';'Hash']
    store_lex "%context", $P1497
  vivify_280:
    set $P1497["compiler"], $P104
.annotate 'line', 695
    new $P104, "Packfile"
    find_lex $P1498, "%context"
    unless_null $P1498, vivify_281
    $P1498 = root_new ['parrot';'Hash']
    store_lex "%context", $P1498
  vivify_281:
    set $P1498["packfile"], $P104
.annotate 'line', 699
    find_lex $P1499, "%context"
    unless_null $P1499, vivify_282
    $P1499 = root_new ['parrot';'Hash']
  vivify_282:
    set $P104, $P1499["packfile"]
    unless_null $P104, vivify_283
    new $P104, "Undef"
  vivify_283:
    $P105 = $P104."get_directory"()
    store_lex "$pfdir", $P105
.annotate 'line', 702
    new $P104, "PackfileConstantTable"
    find_lex $P1500, "%context"
    unless_null $P1500, vivify_284
    $P1500 = root_new ['parrot';'Hash']
    store_lex "%context", $P1500
  vivify_284:
    set $P1500["constants"], $P104
.annotate 'line', 705
    new $P104, "FixedIntegerArray"
    find_lex $P1501, "%context"
    unless_null $P1501, vivify_285
    $P1501 = root_new ['parrot';'Hash']
    store_lex "%context", $P1501
  vivify_285:
    set $P1502, $P1501["constants"]
    unless_null $P1502, vivify_286
    $P1502 = root_new ['parrot';'ResizablePMCArray']
    set $P1501["constants"], $P1502
  vivify_286:
    set $P1502[0], $P104
.annotate 'line', 708
    find_lex $P1503, "%context"
    unless_null $P1503, vivify_287
    $P1503 = root_new ['parrot';'Hash']
  vivify_287:
    set $P104, $P1503["constants"]
    unless_null $P104, vivify_288
    new $P104, "Undef"
  vivify_288:
    find_lex $P1504, "$pfdir"
    unless_null $P1504, vivify_289
    $P1504 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1504
  vivify_289:
    set $P1504["CONSTANTS_hello.pir"], $P104
.annotate 'line', 711
    new $P104, "PackfileBytecodeSegment"
    find_lex $P1505, "%context"
    unless_null $P1505, vivify_290
    $P1505 = root_new ['parrot';'Hash']
    store_lex "%context", $P1505
  vivify_290:
    set $P1505["bytecode"], $P104
.annotate 'line', 712
    find_lex $P1506, "%context"
    unless_null $P1506, vivify_291
    $P1506 = root_new ['parrot';'Hash']
  vivify_291:
    set $P104, $P1506["bytecode"]
    unless_null $P104, vivify_292
    new $P104, "Undef"
  vivify_292:
    $P104."main_sub"(-1)
.annotate 'line', 714
    new $P104, "Integer"
    assign $P104, 0
    find_lex $P1507, "%context"
    unless_null $P1507, vivify_293
    $P1507 = root_new ['parrot';'Hash']
    store_lex "%context", $P1507
  vivify_293:
    set $P1507["got_main_sub"], $P104
.annotate 'line', 717
    find_lex $P1508, "%context"
    unless_null $P1508, vivify_294
    $P1508 = root_new ['parrot';'Hash']
  vivify_294:
    set $P104, $P1508["bytecode"]
    unless_null $P104, vivify_295
    new $P104, "Undef"
  vivify_295:
    find_lex $P1509, "$pfdir"
    unless_null $P1509, vivify_296
    $P1509 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1509
  vivify_296:
    set $P1509["BYTECODE_hello.pir"], $P104
.annotate 'line', 726
    get_hll_global $P104, ["POST"], "VanillaAllocator"
    $P105 = $P104."new"()
    find_lex $P1510, "%context"
    unless_null $P1510, vivify_297
    $P1510 = root_new ['parrot';'Hash']
    store_lex "%context", $P1510
  vivify_297:
    set $P1510["regalloc"], $P105
.annotate 'line', 728
    find_lex $P1511, "%adverbs"
    unless_null $P1511, vivify_298
    $P1511 = root_new ['parrot';'Hash']
  vivify_298:
    set $P104, $P1511["debug"]
    unless_null $P104, vivify_299
    new $P104, "Undef"
  vivify_299:
    find_lex $P1512, "%context"
    unless_null $P1512, vivify_300
    $P1512 = root_new ['parrot';'Hash']
    store_lex "%context", $P1512
  vivify_300:
    set $P1512["DEBUG"], $P104
.annotate 'line', 690
    find_lex $P104, "%context"
    .return ($P104)
  control_1490:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"PBCCompiler"]
.sub "_block1514" :load :anon :subid("59_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1516 = "11_1312323127.11962" 
    $P103 = $P1516()
    .return ($P103)
.end


.namespace []
.sub "_block1517" :load :anon :subid("60_1312323127.11962")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1519 = "10_1312323127.11962" 
    $P101 = $P1519()
    .return ($P101)
.end

