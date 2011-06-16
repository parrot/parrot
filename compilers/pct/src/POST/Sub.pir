
.namespace []
.sub "_block1000"  :anon :subid("10_1308206297.03251")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206297.03251" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 3
    .const 'Sub' $P1003 = "11_1308206297.03251" 
    capture_lex $P1003
    $P297 = $P1003()
.annotate 'line', 1
    .return ($P297)
    .const 'Sub' $P1309 = "64_1308206297.03251" 
    .return ($P1309)
.end


.namespace []
.sub "" :load :init :subid("post65") :outer("10_1308206297.03251")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206297.03251" 
    .local pmc block
    set block, $P1001
    $P1311 = get_root_global ["parrot"], "P6metaclass"
    $P1311."new_class"("POST::Sub", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Sub"]
.sub "_block1002"  :subid("11_1308206297.03251") :outer("10_1308206297.03251")
.annotate 'line', 3
    .const 'Sub' $P1291 = "62_1308206297.03251" 
    capture_lex $P1291
    .const 'Sub' $P1283 = "61_1308206297.03251" 
    capture_lex $P1283
    .const 'Sub' $P1277 = "60_1308206297.03251" 
    capture_lex $P1277
    .const 'Sub' $P1271 = "59_1308206297.03251" 
    capture_lex $P1271
    .const 'Sub' $P1264 = "58_1308206297.03251" 
    capture_lex $P1264
    .const 'Sub' $P1259 = "57_1308206297.03251" 
    capture_lex $P1259
    .const 'Sub' $P1254 = "56_1308206297.03251" 
    capture_lex $P1254
    .const 'Sub' $P1250 = "55_1308206297.03251" 
    capture_lex $P1250
    .const 'Sub' $P1245 = "54_1308206297.03251" 
    capture_lex $P1245
    .const 'Sub' $P1241 = "53_1308206297.03251" 
    capture_lex $P1241
    .const 'Sub' $P1236 = "52_1308206297.03251" 
    capture_lex $P1236
    .const 'Sub' $P1232 = "51_1308206297.03251" 
    capture_lex $P1232
    .const 'Sub' $P1227 = "50_1308206297.03251" 
    capture_lex $P1227
    .const 'Sub' $P1223 = "49_1308206297.03251" 
    capture_lex $P1223
    .const 'Sub' $P1218 = "48_1308206297.03251" 
    capture_lex $P1218
    .const 'Sub' $P1214 = "47_1308206297.03251" 
    capture_lex $P1214
    .const 'Sub' $P1209 = "46_1308206297.03251" 
    capture_lex $P1209
    .const 'Sub' $P1205 = "45_1308206297.03251" 
    capture_lex $P1205
    .const 'Sub' $P1200 = "44_1308206297.03251" 
    capture_lex $P1200
    .const 'Sub' $P1196 = "43_1308206297.03251" 
    capture_lex $P1196
    .const 'Sub' $P1191 = "42_1308206297.03251" 
    capture_lex $P1191
    .const 'Sub' $P1187 = "41_1308206297.03251" 
    capture_lex $P1187
    .const 'Sub' $P1182 = "40_1308206297.03251" 
    capture_lex $P1182
    .const 'Sub' $P1178 = "39_1308206297.03251" 
    capture_lex $P1178
    .const 'Sub' $P1173 = "38_1308206297.03251" 
    capture_lex $P1173
    .const 'Sub' $P1166 = "37_1308206297.03251" 
    capture_lex $P1166
    .const 'Sub' $P1161 = "36_1308206297.03251" 
    capture_lex $P1161
    .const 'Sub' $P1157 = "35_1308206297.03251" 
    capture_lex $P1157
    .const 'Sub' $P1152 = "34_1308206297.03251" 
    capture_lex $P1152
    .const 'Sub' $P1145 = "33_1308206297.03251" 
    capture_lex $P1145
    .const 'Sub' $P1140 = "32_1308206297.03251" 
    capture_lex $P1140
    .const 'Sub' $P1133 = "31_1308206297.03251" 
    capture_lex $P1133
    .const 'Sub' $P1128 = "30_1308206297.03251" 
    capture_lex $P1128
    .const 'Sub' $P1121 = "29_1308206297.03251" 
    capture_lex $P1121
    .const 'Sub' $P1116 = "28_1308206297.03251" 
    capture_lex $P1116
    .const 'Sub' $P1109 = "27_1308206297.03251" 
    capture_lex $P1109
    .const 'Sub' $P1104 = "26_1308206297.03251" 
    capture_lex $P1104
    .const 'Sub' $P1097 = "25_1308206297.03251" 
    capture_lex $P1097
    .const 'Sub' $P1092 = "24_1308206297.03251" 
    capture_lex $P1092
    .const 'Sub' $P1085 = "23_1308206297.03251" 
    capture_lex $P1085
    .const 'Sub' $P1080 = "22_1308206297.03251" 
    capture_lex $P1080
    .const 'Sub' $P1073 = "21_1308206297.03251" 
    capture_lex $P1073
    .const 'Sub' $P1068 = "20_1308206297.03251" 
    capture_lex $P1068
    .const 'Sub' $P1061 = "19_1308206297.03251" 
    capture_lex $P1061
    .const 'Sub' $P1056 = "18_1308206297.03251" 
    capture_lex $P1056
    .const 'Sub' $P1052 = "17_1308206297.03251" 
    capture_lex $P1052
    .const 'Sub' $P1041 = "16_1308206297.03251" 
    capture_lex $P1041
    .const 'Sub' $P1027 = "15_1308206297.03251" 
    capture_lex $P1027
    .const 'Sub' $P1023 = "14_1308206297.03251" 
    capture_lex $P1023
    .const 'Sub' $P1009 = "13_1308206297.03251" 
    capture_lex $P1009
    .const 'Sub' $P1005 = "12_1308206297.03251" 
    capture_lex $P1005
    get_global $P1004, "@paramfmt"
    unless_null $P1004, vivify_76
    $P1004 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1004
  vivify_76:
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P101, "@paramfmt"
    .return ()
    .const 'Sub' $P1297 = "63_1308206297.03251" 
    .return ($P1297)
.end


.namespace ["POST";"Sub"]
.sub "" :load :init :subid("post66") :outer("11_1308206297.03251")
.annotate 'line', 3
    .const 'Sub' $P1003 = "11_1308206297.03251" 
    .local pmc block
    set block, $P1003
.annotate 'line', 5
    new $P288, "String"
    assign $P288, "    .param pmc %0\n"
    get_global $P1299, "@paramfmt"
    unless_null $P1299, vivify_67
    $P1299 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1299
  vivify_67:
    set $P1299[0], $P288
.annotate 'line', 6
    new $P289, "String"
    assign $P289, "    .param pmc %0 :optional\n    .param int has_%0 :opt_flag\n"
    get_global $P1300, "@paramfmt"
    unless_null $P1300, vivify_68
    $P1300 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1300
  vivify_68:
    set $P1300[1], $P289
.annotate 'line', 7
    new $P290, "String"
    assign $P290, "    .param pmc %0 :slurpy\n"
    get_global $P1301, "@paramfmt"
    unless_null $P1301, vivify_69
    $P1301 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1301
  vivify_69:
    set $P1301[2], $P290
.annotate 'line', 8
    new $P291, "String"
    assign $P291, "    .param pmc %0 :slurpy\n"
    get_global $P1302, "@paramfmt"
    unless_null $P1302, vivify_70
    $P1302 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1302
  vivify_70:
    set $P1302[3], $P291
.annotate 'line', 9
    new $P292, "String"
    assign $P292, "    .param pmc %0 :named(%1)\n"
    get_global $P1303, "@paramfmt"
    unless_null $P1303, vivify_71
    $P1303 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1303
  vivify_71:
    set $P1303[4], $P292
.annotate 'line', 10
    new $P293, "String"
    assign $P293, "    .param pmc %0 :optional :named(%1)\n    .param int has_%0 :opt_flag\n"
    get_global $P1304, "@paramfmt"
    unless_null $P1304, vivify_72
    $P1304 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1304
  vivify_72:
    set $P1304[5], $P293
.annotate 'line', 11
    new $P294, "String"
    assign $P294, "    .param pmc %0 :slurpy :named\n"
    get_global $P1305, "@paramfmt"
    unless_null $P1305, vivify_73
    $P1305 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1305
  vivify_73:
    set $P1305[6], $P294
.annotate 'line', 12
    new $P295, "String"
    assign $P295, "    .param pmc %0 :slurpy :named\n"
    get_global $P1306, "@paramfmt"
    unless_null $P1306, vivify_74
    $P1306 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1306
  vivify_74:
    set $P1306[7], $P295
.annotate 'line', 13
    new $P296, "String"
    assign $P296, "    .param pmc %0 :call_sig\n"
    get_global $P1307, "@paramfmt"
    unless_null $P1307, vivify_75
    $P1307 = root_new ['parrot';'ResizablePMCArray']
    set_global "@paramfmt", $P1307
  vivify_75:
    set $P1307[8], $P296
.annotate 'line', 231
    load_bytecode "nqp-setting.pbc"
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "symtable"  :subid("12_1308206297.03251") :method :outer("11_1308206297.03251")
.annotate 'line', 19
    new $P1007, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1007, control_1006
    push_eh $P1007
    .lex "self", self
    find_lex $P1008, "self"
    unless_null $P1008, vivify_77
    $P1008 = root_new ['parrot';'Hash']
  vivify_77:
    set $P102, $P1008["symtable"]
    unless_null $P102, vivify_78
    new $P102, "Undef"
  vivify_78:
    .return ($P102)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "symbol"  :subid("13_1308206297.03251") :method :outer("11_1308206297.03251")
    .param pmc param_1012
    .param pmc param_1013 :optional
    .param int has_param_1013 :opt_flag
.annotate 'line', 26
    new $P1011, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1011, control_1010
    push_eh $P1011
    .lex "self", self
    .lex "$name", param_1012
    if has_param_1013, optparam_79
    new $P104, "Undef"
    set param_1013, $P104
  optparam_79:
    .lex "$value", param_1013
.annotate 'line', 27
    $P1015 = root_new ['parrot';'Hash']
    set $P1014, $P1015
    .lex "%symtable", $P1014
    find_lex $P1016, "self"
    unless_null $P1016, vivify_80
    $P1016 = root_new ['parrot';'Hash']
  vivify_80:
    set $P105, $P1016["symtable"]
    unless_null $P105, vivify_81
    new $P105, "Undef"
  vivify_81:
    store_lex "%symtable", $P105
.annotate 'line', 28
    find_lex $P106, "%symtable"
    if $P106, unless_1017_end
.annotate 'line', 29
    $P107 = "hash"()
    find_lex $P1018, "self"
    unless_null $P1018, vivify_82
    $P1018 = root_new ['parrot';'Hash']
    store_lex "self", $P1018
  vivify_82:
    set $P1018["symtable"], $P107
.annotate 'line', 30
    find_lex $P1019, "self"
    unless_null $P1019, vivify_83
    $P1019 = root_new ['parrot';'Hash']
  vivify_83:
    set $P108, $P1019["symtable"]
    unless_null $P108, vivify_84
    new $P108, "Undef"
  vivify_84:
    store_lex "%symtable", $P108
  unless_1017_end:
.annotate 'line', 33
    find_lex $P109, "$value"
    unless $P109, if_1020_end
.annotate 'line', 34
    find_lex $P110, "$value"
    find_lex $P111, "$name"
    find_lex $P1021, "%symtable"
    unless_null $P1021, vivify_85
    $P1021 = root_new ['parrot';'Hash']
    store_lex "%symtable", $P1021
  vivify_85:
    set $P1021[$P111], $P110
  if_1020_end:
.annotate 'line', 33
    find_lex $P112, "$name"
    find_lex $P1022, "%symtable"
    unless_null $P1022, vivify_86
    $P1022 = root_new ['parrot';'Hash']
  vivify_86:
    set $P113, $P1022[$P112]
    unless_null $P113, vivify_87
    new $P113, "Undef"
  vivify_87:
.annotate 'line', 26
    .return ($P113)
  control_1010:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "labels"  :subid("14_1308206297.03251") :method :outer("11_1308206297.03251")
.annotate 'line', 43
    new $P1025, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1025, control_1024
    push_eh $P1025
    .lex "self", self
    find_lex $P1026, "self"
    unless_null $P1026, vivify_88
    $P1026 = root_new ['parrot';'Hash']
  vivify_88:
    set $P115, $P1026["labels"]
    unless_null $P115, vivify_89
    new $P115, "Undef"
  vivify_89:
    .return ($P115)
  control_1024:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "label"  :subid("15_1308206297.03251") :method :outer("11_1308206297.03251")
    .param pmc param_1030
    .param pmc param_1031 :optional
    .param int has_param_1031 :opt_flag
.annotate 'line', 50
    new $P1029, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1029, control_1028
    push_eh $P1029
    .lex "self", self
    .lex "$name", param_1030
    if has_param_1031, optparam_90
    new $P117, "Undef"
    set param_1031, $P117
  optparam_90:
    .lex "$value", param_1031
.annotate 'line', 51
    $P1033 = root_new ['parrot';'Hash']
    set $P1032, $P1033
    .lex "%labels", $P1032
    find_lex $P1034, "self"
    unless_null $P1034, vivify_91
    $P1034 = root_new ['parrot';'Hash']
  vivify_91:
    set $P118, $P1034["labels"]
    unless_null $P118, vivify_92
    new $P118, "Undef"
  vivify_92:
    store_lex "%labels", $P118
.annotate 'line', 52
    find_lex $P119, "%labels"
    if $P119, unless_1035_end
.annotate 'line', 53
    $P120 = "hash"()
    find_lex $P1036, "self"
    unless_null $P1036, vivify_93
    $P1036 = root_new ['parrot';'Hash']
    store_lex "self", $P1036
  vivify_93:
    set $P1036["labels"], $P120
.annotate 'line', 54
    find_lex $P1037, "self"
    unless_null $P1037, vivify_94
    $P1037 = root_new ['parrot';'Hash']
  vivify_94:
    set $P121, $P1037["labels"]
    unless_null $P121, vivify_95
    new $P121, "Undef"
  vivify_95:
    store_lex "%labels", $P121
  unless_1035_end:
.annotate 'line', 57
    find_lex $P122, "$value"
    unless $P122, if_1038_end
.annotate 'line', 58
    find_lex $P123, "$value"
    find_lex $P124, "$name"
    find_lex $P1039, "%labels"
    unless_null $P1039, vivify_96
    $P1039 = root_new ['parrot';'Hash']
    store_lex "%labels", $P1039
  vivify_96:
    set $P1039[$P124], $P123
  if_1038_end:
.annotate 'line', 57
    find_lex $P125, "$name"
    find_lex $P1040, "%labels"
    unless_null $P1040, vivify_97
    $P1040 = root_new ['parrot';'Hash']
  vivify_97:
    set $P126, $P1040[$P125]
    unless_null $P126, vivify_98
    new $P126, "Undef"
  vivify_98:
.annotate 'line', 50
    .return ($P126)
  control_1028:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, "payload"
    .return ($P127)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "param"  :subid("16_1308206297.03251") :method :outer("11_1308206297.03251")
    .param pmc param_1044
    .param pmc param_1045
.annotate 'line', 68
    new $P1043, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1043, control_1042
    push_eh $P1043
    .lex "self", self
    .lex "$name", param_1044
    .lex "$param", param_1045
.annotate 'line', 69
    $P1047 = root_new ['parrot';'ResizablePMCArray']
    set $P1046, $P1047
    .lex "@params", $P1046
    find_lex $P1048, "self"
    unless_null $P1048, vivify_99
    $P1048 = root_new ['parrot';'Hash']
  vivify_99:
    set $P128, $P1048["params"]
    unless_null $P128, vivify_100
    new $P128, "Undef"
  vivify_100:
    store_lex "@params", $P128
.annotate 'line', 70
    find_lex $P129, "@params"
    if $P129, unless_1049_end
.annotate 'line', 71
    $P130 = "list"()
    find_lex $P1050, "self"
    unless_null $P1050, vivify_101
    $P1050 = root_new ['parrot';'Hash']
    store_lex "self", $P1050
  vivify_101:
    set $P1050["params"], $P130
.annotate 'line', 72
    find_lex $P1051, "self"
    unless_null $P1051, vivify_102
    $P1051 = root_new ['parrot';'Hash']
  vivify_102:
    set $P131, $P1051["params"]
    unless_null $P131, vivify_103
    new $P131, "Undef"
  vivify_103:
    store_lex "@params", $P131
  unless_1049_end:
.annotate 'line', 77
    find_lex $P132, "@params"
    find_lex $P133, "$param"
    $P134 = $P132."push"($P133)
.annotate 'line', 68
    .return ($P134)
  control_1042:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "constant_index"  :subid("17_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 84
    new $P1054, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1054, control_1053
    push_eh $P1054
    .lex "self", self
    find_lex $P1055, "self"
    unless_null $P1055, vivify_104
    $P1055 = root_new ['parrot';'Hash']
  vivify_104:
    set $P136, $P1055["constant_index"]
    unless_null $P136, vivify_105
    new $P136, "Undef"
  vivify_105:
    .return ($P136)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, "payload"
    .return ($P137)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "constant_index"  :subid("18_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1059
.annotate 'line', 85
    new $P1058, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1058, control_1057
    push_eh $P1058
    .lex "self", self
    .lex "$idx", param_1059
    find_lex $P138, "$idx"
    find_lex $P1060, "self"
    unless_null $P1060, vivify_106
    $P1060 = root_new ['parrot';'Hash']
    store_lex "self", $P1060
  vivify_106:
    set $P1060["constant_index"], $P138
    find_lex $P139, "$idx"
    .return ($P139)
  control_1057:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P140, exception, "payload"
    .return ($P140)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "main"  :subid("19_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 90
    new $P1063, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1063, control_1062
    push_eh $P1063
    .lex "self", self
    find_lex $P1065, "self"
    unless_null $P1065, vivify_107
    $P1065 = root_new ['parrot';'Hash']
  vivify_107:
    set $P141, $P1065["main"]
    unless_null $P141, vivify_108
    new $P141, "Undef"
  vivify_108:
    set $P1064, $P141
    defined $I1067, $P1064
    if $I1067, default_1066
    new $P142, "Integer"
    assign $P142, 0
    set $P1064, $P142
  default_1066:
    .return ($P1064)
  control_1062:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P143, exception, "payload"
    .return ($P143)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "main"  :subid("20_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1071
.annotate 'line', 91
    new $P1070, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1070, control_1069
    push_eh $P1070
    .lex "self", self
    .lex "$val", param_1071
    find_lex $P144, "$val"
    istrue $I145, $P144
    new $P146, 'Integer'
    set $P146, $I145
    find_lex $P1072, "self"
    unless_null $P1072, vivify_109
    $P1072 = root_new ['parrot';'Hash']
    store_lex "self", $P1072
  vivify_109:
    set $P1072["main"], $P146
    .return ($P146)
  control_1069:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P147, exception, "payload"
    .return ($P147)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_init"  :subid("21_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 94
    new $P1075, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1075, control_1074
    push_eh $P1075
    .lex "self", self
    find_lex $P1077, "self"
    unless_null $P1077, vivify_110
    $P1077 = root_new ['parrot';'Hash']
  vivify_110:
    set $P148, $P1077["init"]
    unless_null $P148, vivify_111
    new $P148, "Undef"
  vivify_111:
    set $P1076, $P148
    defined $I1079, $P1076
    if $I1079, default_1078
    new $P149, "Integer"
    assign $P149, 0
    set $P1076, $P149
  default_1078:
    .return ($P1076)
  control_1074:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_init"  :subid("22_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1083
.annotate 'line', 95
    new $P1082, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1082, control_1081
    push_eh $P1082
    .lex "self", self
    .lex "$val", param_1083
    find_lex $P151, "$val"
    istrue $I152, $P151
    new $P153, 'Integer'
    set $P153, $I152
    find_lex $P1084, "self"
    unless_null $P1084, vivify_112
    $P1084 = root_new ['parrot';'Hash']
    store_lex "self", $P1084
  vivify_112:
    set $P1084["init"], $P153
    .return ($P153)
  control_1081:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P154, exception, "payload"
    .return ($P154)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "load"  :subid("23_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 97
    new $P1087, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1087, control_1086
    push_eh $P1087
    .lex "self", self
    find_lex $P1089, "self"
    unless_null $P1089, vivify_113
    $P1089 = root_new ['parrot';'Hash']
  vivify_113:
    set $P155, $P1089["load"]
    unless_null $P155, vivify_114
    new $P155, "Undef"
  vivify_114:
    set $P1088, $P155
    defined $I1091, $P1088
    if $I1091, default_1090
    new $P156, "Integer"
    assign $P156, 0
    set $P1088, $P156
  default_1090:
    .return ($P1088)
  control_1086:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P157, exception, "payload"
    .return ($P157)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "load"  :subid("24_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1095
.annotate 'line', 98
    new $P1094, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1094, control_1093
    push_eh $P1094
    .lex "self", self
    .lex "$val", param_1095
    find_lex $P158, "$val"
    istrue $I159, $P158
    new $P160, 'Integer'
    set $P160, $I159
    find_lex $P1096, "self"
    unless_null $P1096, vivify_115
    $P1096 = root_new ['parrot';'Hash']
    store_lex "self", $P1096
  vivify_115:
    set $P1096["load"], $P160
    .return ($P160)
  control_1093:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P161, exception, "payload"
    .return ($P161)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "immediate"  :subid("25_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 100
    new $P1099, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1099, control_1098
    push_eh $P1099
    .lex "self", self
    find_lex $P1101, "self"
    unless_null $P1101, vivify_116
    $P1101 = root_new ['parrot';'Hash']
  vivify_116:
    set $P162, $P1101["immediate"]
    unless_null $P162, vivify_117
    new $P162, "Undef"
  vivify_117:
    set $P1100, $P162
    defined $I1103, $P1100
    if $I1103, default_1102
    new $P163, "Integer"
    assign $P163, 0
    set $P1100, $P163
  default_1102:
    .return ($P1100)
  control_1098:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P164, exception, "payload"
    .return ($P164)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "immediate"  :subid("26_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1107
.annotate 'line', 101
    new $P1106, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1106, control_1105
    push_eh $P1106
    .lex "self", self
    .lex "$val", param_1107
    find_lex $P165, "$val"
    istrue $I166, $P165
    new $P167, 'Integer'
    set $P167, $I166
    find_lex $P1108, "self"
    unless_null $P1108, vivify_118
    $P1108 = root_new ['parrot';'Hash']
    store_lex "self", $P1108
  vivify_118:
    set $P1108["immediate"], $P167
    .return ($P167)
  control_1105:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "postcomp"  :subid("27_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 103
    new $P1111, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1111, control_1110
    push_eh $P1111
    .lex "self", self
    find_lex $P1113, "self"
    unless_null $P1113, vivify_119
    $P1113 = root_new ['parrot';'Hash']
  vivify_119:
    set $P169, $P1113["postcomp"]
    unless_null $P169, vivify_120
    new $P169, "Undef"
  vivify_120:
    set $P1112, $P169
    defined $I1115, $P1112
    if $I1115, default_1114
    new $P170, "Integer"
    assign $P170, 0
    set $P1112, $P170
  default_1114:
    .return ($P1112)
  control_1110:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "postcomp"  :subid("28_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1119
.annotate 'line', 104
    new $P1118, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1118, control_1117
    push_eh $P1118
    .lex "self", self
    .lex "$val", param_1119
    find_lex $P172, "$val"
    istrue $I173, $P172
    new $P174, 'Integer'
    set $P174, $I173
    find_lex $P1120, "self"
    unless_null $P1120, vivify_121
    $P1120 = root_new ['parrot';'Hash']
    store_lex "self", $P1120
  vivify_121:
    set $P1120["postcomp"], $P174
    .return ($P174)
  control_1117:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P175, exception, "payload"
    .return ($P175)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "anon"  :subid("29_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 106
    new $P1123, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1123, control_1122
    push_eh $P1123
    .lex "self", self
    find_lex $P1125, "self"
    unless_null $P1125, vivify_122
    $P1125 = root_new ['parrot';'Hash']
  vivify_122:
    set $P176, $P1125["anon"]
    unless_null $P176, vivify_123
    new $P176, "Undef"
  vivify_123:
    set $P1124, $P176
    defined $I1127, $P1124
    if $I1127, default_1126
    new $P177, "Integer"
    assign $P177, 0
    set $P1124, $P177
  default_1126:
    .return ($P1124)
  control_1122:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P178, exception, "payload"
    .return ($P178)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "anon"  :subid("30_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1131
.annotate 'line', 107
    new $P1130, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1130, control_1129
    push_eh $P1130
    .lex "self", self
    .lex "$val", param_1131
    find_lex $P179, "$val"
    istrue $I180, $P179
    new $P181, 'Integer'
    set $P181, $I180
    find_lex $P1132, "self"
    unless_null $P1132, vivify_124
    $P1132 = root_new ['parrot';'Hash']
    store_lex "self", $P1132
  vivify_124:
    set $P1132["anon"], $P181
    .return ($P181)
  control_1129:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P182, exception, "payload"
    .return ($P182)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_method"  :subid("31_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 109
    new $P1135, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1135, control_1134
    push_eh $P1135
    .lex "self", self
    find_lex $P1137, "self"
    unless_null $P1137, vivify_125
    $P1137 = root_new ['parrot';'Hash']
  vivify_125:
    set $P183, $P1137["method"]
    unless_null $P183, vivify_126
    new $P183, "Undef"
  vivify_126:
    set $P1136, $P183
    defined $I1139, $P1136
    if $I1139, default_1138
    new $P184, "Integer"
    assign $P184, 0
    set $P1136, $P184
  default_1138:
    .return ($P1136)
  control_1134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P185, exception, "payload"
    .return ($P185)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "is_method"  :subid("32_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1143
.annotate 'line', 110
    new $P1142, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1142, control_1141
    push_eh $P1142
    .lex "self", self
    .lex "$val", param_1143
    find_lex $P186, "$val"
    istrue $I187, $P186
    new $P188, 'Integer'
    set $P188, $I187
    find_lex $P1144, "self"
    unless_null $P1144, vivify_127
    $P1144 = root_new ['parrot';'Hash']
    store_lex "self", $P1144
  vivify_127:
    set $P1144["method"], $P188
    .return ($P188)
  control_1141:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P189, exception, "payload"
    .return ($P189)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "lex"  :subid("33_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 112
    new $P1147, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1147, control_1146
    push_eh $P1147
    .lex "self", self
    find_lex $P1149, "self"
    unless_null $P1149, vivify_128
    $P1149 = root_new ['parrot';'Hash']
  vivify_128:
    set $P190, $P1149["lex"]
    unless_null $P190, vivify_129
    new $P190, "Undef"
  vivify_129:
    set $P1148, $P190
    defined $I1151, $P1148
    if $I1151, default_1150
    new $P191, "Integer"
    assign $P191, 0
    set $P1148, $P191
  default_1150:
    .return ($P1148)
  control_1146:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P192, exception, "payload"
    .return ($P192)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "lex"  :subid("34_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1155
.annotate 'line', 113
    new $P1154, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1154, control_1153
    push_eh $P1154
    .lex "self", self
    .lex "$val", param_1155
    find_lex $P193, "$val"
    istrue $I194, $P193
    new $P195, 'Integer'
    set $P195, $I194
    find_lex $P1156, "self"
    unless_null $P1156, vivify_130
    $P1156 = root_new ['parrot';'Hash']
    store_lex "self", $P1156
  vivify_130:
    set $P1156["lex"], $P195
    .return ($P195)
  control_1153:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P196, exception, "payload"
    .return ($P196)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "nsentry"  :subid("35_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 115
    new $P1159, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1159, control_1158
    push_eh $P1159
    .lex "self", self
    find_lex $P1160, "self"
    unless_null $P1160, vivify_131
    $P1160 = root_new ['parrot';'Hash']
  vivify_131:
    set $P197, $P1160["nsentry"]
    unless_null $P197, vivify_132
    new $P197, "Undef"
  vivify_132:
    .return ($P197)
  control_1158:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P198, exception, "payload"
    .return ($P198)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "nsentry"  :subid("36_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1164
.annotate 'line', 116
    new $P1163, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1163, control_1162
    push_eh $P1163
    .lex "self", self
    .lex "$val", param_1164
    find_lex $P199, "$val"
    find_lex $P1165, "self"
    unless_null $P1165, vivify_133
    $P1165 = root_new ['parrot';'Hash']
    store_lex "self", $P1165
  vivify_133:
    set $P1165["nsentry"], $P199
    .return ($P199)
  control_1162:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P200, exception, "payload"
    .return ($P200)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "vtable"  :subid("37_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 118
    new $P1168, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1168, control_1167
    push_eh $P1168
    .lex "self", self
    find_lex $P1170, "self"
    unless_null $P1170, vivify_134
    $P1170 = root_new ['parrot';'Hash']
  vivify_134:
    set $P201, $P1170["vtable"]
    unless_null $P201, vivify_135
    new $P201, "Undef"
  vivify_135:
    set $P1169, $P201
    defined $I1172, $P1169
    if $I1172, default_1171
    new $P202, "Integer"
    assign $P202, -1
    set $P1169, $P202
  default_1171:
    .return ($P1169)
  control_1167:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P203, exception, "payload"
    .return ($P203)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "vtable"  :subid("38_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1176
.annotate 'line', 119
    new $P1175, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1175, control_1174
    push_eh $P1175
    .lex "self", self
    .lex "$val", param_1176
    find_lex $P204, "$val"
    find_lex $P1177, "self"
    unless_null $P1177, vivify_136
    $P1177 = root_new ['parrot';'Hash']
    store_lex "self", $P1177
  vivify_136:
    set $P1177["vtable"], $P204
    find_lex $P205, "$val"
    .return ($P205)
  control_1174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P206, exception, "payload"
    .return ($P206)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "blocktype"  :subid("39_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 121
    new $P1180, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1180, control_1179
    push_eh $P1180
    .lex "self", self
    find_lex $P1181, "self"
    unless_null $P1181, vivify_137
    $P1181 = root_new ['parrot';'Hash']
  vivify_137:
    set $P207, $P1181["blocktype"]
    unless_null $P207, vivify_138
    new $P207, "Undef"
  vivify_138:
    .return ($P207)
  control_1179:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P208, exception, "payload"
    .return ($P208)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "blocktype"  :subid("40_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1185
.annotate 'line', 122
    new $P1184, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1184, control_1183
    push_eh $P1184
    .lex "self", self
    .lex "$val", param_1185
    find_lex $P209, "$val"
    find_lex $P1186, "self"
    unless_null $P1186, vivify_139
    $P1186 = root_new ['parrot';'Hash']
    store_lex "self", $P1186
  vivify_139:
    set $P1186["blocktype"], $P209
    .return ($P209)
  control_1183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P210, exception, "payload"
    .return ($P210)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "namespace"  :subid("41_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 124
    new $P1189, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1189, control_1188
    push_eh $P1189
    .lex "self", self
    find_lex $P1190, "self"
    unless_null $P1190, vivify_140
    $P1190 = root_new ['parrot';'Hash']
  vivify_140:
    set $P211, $P1190["namespace"]
    unless_null $P211, vivify_141
    new $P211, "Undef"
  vivify_141:
    .return ($P211)
  control_1188:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P212, exception, "payload"
    .return ($P212)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "namespace"  :subid("42_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1194
.annotate 'line', 125
    new $P1193, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1193, control_1192
    push_eh $P1193
    .lex "self", self
    .lex "$val", param_1194
    find_lex $P213, "$val"
    find_lex $P1195, "self"
    unless_null $P1195, vivify_142
    $P1195 = root_new ['parrot';'Hash']
    store_lex "self", $P1195
  vivify_142:
    set $P1195["namespace"], $P213
    .return ($P213)
  control_1192:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, "payload"
    .return ($P214)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "hll"  :subid("43_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 127
    new $P1198, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1198, control_1197
    push_eh $P1198
    .lex "self", self
    find_lex $P1199, "self"
    unless_null $P1199, vivify_143
    $P1199 = root_new ['parrot';'Hash']
  vivify_143:
    set $P215, $P1199["hll"]
    unless_null $P215, vivify_144
    new $P215, "Undef"
  vivify_144:
    .return ($P215)
  control_1197:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P216, exception, "payload"
    .return ($P216)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "hll"  :subid("44_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1203
.annotate 'line', 128
    new $P1202, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1202, control_1201
    push_eh $P1202
    .lex "self", self
    .lex "$val", param_1203
    find_lex $P217, "$val"
    find_lex $P1204, "self"
    unless_null $P1204, vivify_145
    $P1204 = root_new ['parrot';'Hash']
    store_lex "self", $P1204
  vivify_145:
    set $P1204["hll"], $P217
    .return ($P217)
  control_1201:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P218, exception, "payload"
    .return ($P218)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "loadlibs"  :subid("45_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 130
    new $P1207, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1207, control_1206
    push_eh $P1207
    .lex "self", self
    find_lex $P1208, "self"
    unless_null $P1208, vivify_146
    $P1208 = root_new ['parrot';'Hash']
  vivify_146:
    set $P219, $P1208["loadlibs"]
    unless_null $P219, vivify_147
    new $P219, "Undef"
  vivify_147:
    .return ($P219)
  control_1206:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P220, exception, "payload"
    .return ($P220)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "loadlibs"  :subid("46_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1212
.annotate 'line', 131
    new $P1211, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1211, control_1210
    push_eh $P1211
    .lex "self", self
    .lex "$val", param_1212
    find_lex $P221, "$val"
    find_lex $P1213, "self"
    unless_null $P1213, vivify_148
    $P1213 = root_new ['parrot';'Hash']
    store_lex "self", $P1213
  vivify_148:
    set $P1213["loadlibs"], $P221
    .return ($P221)
  control_1210:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P222, exception, "payload"
    .return ($P222)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "outer"  :subid("47_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 133
    new $P1216, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1216, control_1215
    push_eh $P1216
    .lex "self", self
    find_lex $P1217, "self"
    unless_null $P1217, vivify_149
    $P1217 = root_new ['parrot';'Hash']
  vivify_149:
    set $P223, $P1217["outer"]
    unless_null $P223, vivify_150
    new $P223, "Undef"
  vivify_150:
    .return ($P223)
  control_1215:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P224, exception, "payload"
    .return ($P224)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "outer"  :subid("48_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1221
.annotate 'line', 134
    new $P1220, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1220, control_1219
    push_eh $P1220
    .lex "self", self
    .lex "$val", param_1221
    find_lex $P225, "$val"
    find_lex $P1222, "self"
    unless_null $P1222, vivify_151
    $P1222 = root_new ['parrot';'Hash']
    store_lex "self", $P1222
  vivify_151:
    set $P1222["outer"], $P225
    .return ($P225)
  control_1219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P226, exception, "payload"
    .return ($P226)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "multi"  :subid("49_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 136
    new $P1225, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1225, control_1224
    push_eh $P1225
    .lex "self", self
    find_lex $P1226, "self"
    unless_null $P1226, vivify_152
    $P1226 = root_new ['parrot';'Hash']
  vivify_152:
    set $P227, $P1226["multi"]
    unless_null $P227, vivify_153
    new $P227, "Undef"
  vivify_153:
    .return ($P227)
  control_1224:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P228, exception, "payload"
    .return ($P228)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "multi"  :subid("50_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1230
.annotate 'line', 137
    new $P1229, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1229, control_1228
    push_eh $P1229
    .lex "self", self
    .lex "$val", param_1230
    find_lex $P229, "$val"
    find_lex $P1231, "self"
    unless_null $P1231, vivify_154
    $P1231 = root_new ['parrot';'Hash']
    store_lex "self", $P1231
  vivify_154:
    set $P1231["multi"], $P229
    .return ($P229)
  control_1228:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P230, exception, "payload"
    .return ($P230)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "pirflags"  :subid("51_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 139
    new $P1234, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1234, control_1233
    push_eh $P1234
    .lex "self", self
    find_lex $P1235, "self"
    unless_null $P1235, vivify_155
    $P1235 = root_new ['parrot';'Hash']
  vivify_155:
    set $P231, $P1235["pirflags"]
    unless_null $P231, vivify_156
    new $P231, "Undef"
  vivify_156:
    .return ($P231)
  control_1233:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "pirflags"  :subid("52_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1239
.annotate 'line', 140
    new $P1238, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1238, control_1237
    push_eh $P1238
    .lex "self", self
    .lex "$val", param_1239
    find_lex $P233, "$val"
    find_lex $P1240, "self"
    unless_null $P1240, vivify_157
    $P1240 = root_new ['parrot';'Hash']
    store_lex "self", $P1240
  vivify_157:
    set $P1240["pirflags"], $P233
    .return ($P233)
  control_1237:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P234, exception, "payload"
    .return ($P234)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler"  :subid("53_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 142
    new $P1243, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1243, control_1242
    push_eh $P1243
    .lex "self", self
    find_lex $P1244, "self"
    unless_null $P1244, vivify_158
    $P1244 = root_new ['parrot';'Hash']
  vivify_158:
    set $P235, $P1244["compiler"]
    unless_null $P235, vivify_159
    new $P235, "Undef"
  vivify_159:
    .return ($P235)
  control_1242:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P236, exception, "payload"
    .return ($P236)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler"  :subid("54_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1248
.annotate 'line', 143
    new $P1247, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1247, control_1246
    push_eh $P1247
    .lex "self", self
    .lex "$val", param_1248
    find_lex $P237, "$val"
    find_lex $P1249, "self"
    unless_null $P1249, vivify_160
    $P1249 = root_new ['parrot';'Hash']
    store_lex "self", $P1249
  vivify_160:
    set $P1249["compiler"], $P237
    .return ($P237)
  control_1246:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P238, exception, "payload"
    .return ($P238)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler_args"  :subid("55_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 145
    new $P1252, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1252, control_1251
    push_eh $P1252
    .lex "self", self
    find_lex $P1253, "self"
    unless_null $P1253, vivify_161
    $P1253 = root_new ['parrot';'Hash']
  vivify_161:
    set $P239, $P1253["compiler_args"]
    unless_null $P239, vivify_162
    new $P239, "Undef"
  vivify_162:
    .return ($P239)
  control_1251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P240, exception, "payload"
    .return ($P240)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "compiler_args"  :subid("56_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1257
.annotate 'line', 146
    new $P1256, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1256, control_1255
    push_eh $P1256
    .lex "self", self
    .lex "$val", param_1257
    find_lex $P241, "$val"
    find_lex $P1258, "self"
    unless_null $P1258, vivify_163
    $P1258 = root_new ['parrot';'Hash']
    store_lex "self", $P1258
  vivify_163:
    set $P1258["compiler_args"], $P241
    .return ($P241)
  control_1255:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P242, exception, "payload"
    .return ($P242)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "subid"  :subid("57_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_,_)
    .param pmc param_1262
.annotate 'line', 148
    new $P1261, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1261, control_1260
    push_eh $P1261
    .lex "self", self
    .lex "$value", param_1262
    find_lex $P243, "$value"
    find_lex $P1263, "self"
    unless_null $P1263, vivify_164
    $P1263 = root_new ['parrot';'Hash']
    store_lex "self", $P1263
  vivify_164:
    set $P1263["subid"], $P243
    .return ($P243)
  control_1260:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P244, exception, "payload"
    .return ($P244)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "subid"  :subid("58_1308206297.03251") :method :outer("11_1308206297.03251") :multi(_)
.annotate 'line', 149
    new $P1266, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1266, control_1265
    push_eh $P1266
    .lex "self", self
.annotate 'line', 150
    new $P245, "Undef"
    set $P1267, $P245
    .lex "$value", $P1267
    find_lex $P1268, "self"
    unless_null $P1268, vivify_165
    $P1268 = root_new ['parrot';'Hash']
  vivify_165:
    set $P246, $P1268["subid"]
    unless_null $P246, vivify_166
    new $P246, "Undef"
  vivify_166:
    store_lex "$value", $P246
.annotate 'line', 151
    find_lex $P247, "$value"
    defined $I248, $P247
    if $I248, unless_1269_end
.annotate 'line', 152
    find_lex $P249, "self"
    $P250 = $P249."unique"("post")
    store_lex "$value", $P250
.annotate 'line', 153
    find_lex $P251, "$value"
    find_lex $P1270, "self"
    unless_null $P1270, vivify_167
    $P1270 = root_new ['parrot';'Hash']
    store_lex "self", $P1270
  vivify_167:
    set $P1270["subid"], $P251
  unless_1269_end:
.annotate 'line', 151
    find_lex $P252, "$value"
.annotate 'line', 149
    .return ($P252)
  control_1265:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P253, exception, "payload"
    .return ($P253)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "set_flag"  :subid("59_1308206297.03251") :method :outer("11_1308206297.03251")
    .param pmc param_1274
    .param pmc param_1275
.annotate 'line', 158
    new $P1273, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1273, control_1272
    push_eh $P1273
    .lex "self", self
    .lex "$name", param_1274
    .lex "$val", param_1275
    find_lex $P254, "$val"
    find_lex $P255, "$name"
    find_lex $P1276, "self"
    unless_null $P1276, vivify_168
    $P1276 = root_new ['parrot';'Hash']
    store_lex "self", $P1276
  vivify_168:
    set $P1276[$P255], $P254
    find_lex $P256, "$val"
    .return ($P256)
  control_1272:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P257, exception, "payload"
    .return ($P257)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "full_name"  :subid("60_1308206297.03251") :method :outer("11_1308206297.03251")
.annotate 'line', 162
    new $P1279, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1279, control_1278
    push_eh $P1279
    .lex "self", self
.annotate 'line', 163
    find_lex $P1281, "self"
    unless_null $P1281, vivify_169
    $P1281 = root_new ['parrot';'Hash']
  vivify_169:
    set $P259, $P1281["namespace"]
    unless_null $P259, vivify_170
    new $P259, "Undef"
  vivify_170:
    if $P259, if_1280
.annotate 'line', 167
    find_lex $P265, "self"
    $P266 = $P265."name"()
.annotate 'line', 166
    set $P258, $P266
.annotate 'line', 163
    goto if_1280_end
  if_1280:
.annotate 'line', 164
    find_lex $P1282, "self"
    unless_null $P1282, vivify_171
    $P1282 = root_new ['parrot';'Hash']
  vivify_171:
    set $P260, $P1282["namespace"]
    unless_null $P260, vivify_172
    new $P260, "Undef"
  vivify_172:
    $P261 = $P260."Str"()
    find_lex $P262, "self"
    $S263 = $P262."name"()
    concat $P264, $P261, $S263
.annotate 'line', 163
    set $P258, $P264
  if_1280_end:
.annotate 'line', 162
    .return ($P258)
  control_1278:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P267, exception, "payload"
    .return ($P267)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "add_directive"  :subid("61_1308206297.03251") :method :outer("11_1308206297.03251")
    .param pmc param_1286
.annotate 'line', 171
    new $P1285, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1285, control_1284
    push_eh $P1285
    .lex "self", self
    .lex "$line", param_1286
.annotate 'line', 172
    new $P268, "Undef"
    set $P1287, $P268
    .lex "$dlist", $P1287
    find_lex $P1288, "self"
    unless_null $P1288, vivify_173
    $P1288 = root_new ['parrot';'Hash']
  vivify_173:
    set $P269, $P1288["directives"]
    unless_null $P269, vivify_174
    new $P269, "Undef"
  vivify_174:
    store_lex "$dlist", $P269
.annotate 'line', 173
    find_lex $P271, "$dlist"
    set $S272, $P271
    find_lex $P273, "$line"
    set $S274, $P273
    index $I275, $S272, $S274
    set $N276, $I275
    islt $I277, $N276, 0.0
    if $I277, if_1289
    new $P270, 'Integer'
    set $P270, $I277
    goto if_1289_end
  if_1289:
.annotate 'line', 174
    find_lex $P278, "$dlist"
    set $S279, $P278
    new $P280, 'String'
    set $P280, $S279
    find_lex $P281, "$line"
    set $S282, $P281
    concat $P283, $P280, $S282
    concat $P284, $P283, "\n"
    find_lex $P1290, "self"
    unless_null $P1290, vivify_175
    $P1290 = root_new ['parrot';'Hash']
    store_lex "self", $P1290
  vivify_175:
    set $P1290["directives"], $P284
.annotate 'line', 173
    set $P270, $P284
  if_1289_end:
.annotate 'line', 171
    .return ($P270)
  control_1284:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P285, exception, "payload"
    .return ($P285)
.end


.namespace ["POST";"Sub"]
.include "except_types.pasm"
.sub "add_param"  :subid("62_1308206297.03251") :method :outer("11_1308206297.03251")
    .param pmc param_1294
    .param pmc param_1295 :slurpy :named
.annotate 'line', 179
    new $P1293, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1293, control_1292
    push_eh $P1293
    .lex "self", self
    .lex "$pname", param_1294
    .lex "%adverbs", param_1295
.annotate 'line', 180

    .local pmc pname
    .local pmc adverbs

    find_lex pname, '$pname'
    find_lex adverbs, '%adverbs'

    .local int optional, slurpy, call_sig
    .local string named
    optional = adverbs['optional']
    slurpy = adverbs['slurpy']
    named = adverbs['named']
    call_sig = adverbs['call_sig']

    .local int paramseq
    paramseq = isne optional, 0
    unless slurpy goto slurpy_done
    paramseq += 2
  slurpy_done:
    unless named goto named_done
    paramseq += 4
  named_done:
    unless call_sig goto call_sig_done
    paramseq += 8
  call_sig_done:

    .local pmc paramlist
    paramlist = self['paramlist']
    unless null paramlist goto have_paramlist
    paramlist = new 'ResizablePMCArray'
    self['paramlist'] = paramlist
  have_paramlist:

    .local pmc code
    code = paramlist[paramseq]
    unless null code goto have_code
    code = new 'StringBuilder'
    paramlist[paramseq] = code
  have_code:

    .local pmc paramfmt
    paramfmt = get_hll_global ['POST';'Sub'], '@paramfmt'
    $S0 = paramfmt[paramseq]
    named = self.'escape'(named)
    code.'append_format'($S0, pname, named)

    .return ()
    
.annotate 'line', 179
    .return ()
  control_1292:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P286, exception, "payload"
    .return ($P286)
.end


.namespace ["POST";"Sub"]
.sub "_block1296" :load :anon :subid("63_1308206297.03251")
.annotate 'line', 3
    .const 'Sub' $P1298 = "11_1308206297.03251" 
    $P287 = $P1298()
    .return ($P287)
.end


.namespace []
.sub "_block1308" :load :anon :subid("64_1308206297.03251")
.annotate 'line', 1
    .const 'Sub' $P1310 = "10_1308206297.03251" 
    $P298 = $P1310()
    .return ($P298)
.end

