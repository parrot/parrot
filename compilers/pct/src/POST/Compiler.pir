
.namespace []
.sub "_block1000"  :anon :subid("10_1308206292.0457")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206292.0457" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1308206292.0457" 
    capture_lex $P1003
    $P1800 = $P1003()
.annotate 'line', 1
    .return ($P1800)
    .const 'Sub' $P1802 = "64_1308206292.0457" 
    .return ($P1802)
.end


.namespace []
.sub "" :load :init :subid("post65") :outer("10_1308206292.0457")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206292.0457" 
    .local pmc block
    set block, $P1001
    $P1805 = get_root_global ["parrot"], "P6metaclass"
    new $P1806, "ResizablePMCArray"
    push $P1806, "$?HLL"
    push $P1806, "$?NAMESPACE"
    $P1805."new_class"("POST::Compiler", "PCT::HLLCompiler" :named("parent"), $P1806 :named("attr"))
.end


.namespace ["POST";"Compiler"]
.sub "_block1002"  :subid("11_1308206292.0457") :outer("10_1308206292.0457")
.annotate 'line', 16
    .const 'Sub' $P1750 = "62_1308206292.0457" 
    capture_lex $P1750
    .const 'Sub' $P1734 = "60_1308206292.0457" 
    capture_lex $P1734
    .const 'Sub' $P1706 = "59_1308206292.0457" 
    capture_lex $P1706
    .const 'Sub' $P1624 = "57_1308206292.0457" 
    capture_lex $P1624
    .const 'Sub' $P1587 = "56_1308206292.0457" 
    capture_lex $P1587
    .const 'Sub' $P1534 = "55_1308206292.0457" 
    capture_lex $P1534
    .const 'Sub' $P1508 = "53_1308206292.0457" 
    capture_lex $P1508
    .const 'Sub' $P1419 = "52_1308206292.0457" 
    capture_lex $P1419
    .const 'Sub' $P1392 = "48_1308206292.0457" 
    capture_lex $P1392
    .const 'Sub' $P1363 = "45_1308206292.0457" 
    capture_lex $P1363
    .const 'Sub' $P1348 = "44_1308206292.0457" 
    capture_lex $P1348
    .const 'Sub' $P1343 = "43_1308206292.0457" 
    capture_lex $P1343
    .const 'Sub' $P1337 = "42_1308206292.0457" 
    capture_lex $P1337
    .const 'Sub' $P1321 = "40_1308206292.0457" 
    capture_lex $P1321
    .const 'Sub' $P1308 = "39_1308206292.0457" 
    capture_lex $P1308
    .const 'Sub' $P1295 = "38_1308206292.0457" 
    capture_lex $P1295
    .const 'Sub' $P1231 = "34_1308206292.0457" 
    capture_lex $P1231
    .const 'Sub' $P1216 = "32_1308206292.0457" 
    capture_lex $P1216
    .const 'Sub' $P1207 = "30_1308206292.0457" 
    capture_lex $P1207
    .const 'Sub' $P1179 = "27_1308206292.0457" 
    capture_lex $P1179
    .const 'Sub' $P1091 = "24_1308206292.0457" 
    capture_lex $P1091
    .const 'Sub' $P1086 = "23_1308206292.0457" 
    capture_lex $P1086
    .const 'Sub' $P1072 = "21_1308206292.0457" 
    capture_lex $P1072
    .const 'Sub' $P1061 = "20_1308206292.0457" 
    capture_lex $P1061
    .const 'Sub' $P1057 = "19_1308206292.0457" 
    capture_lex $P1057
    .const 'Sub' $P1052 = "18_1308206292.0457" 
    capture_lex $P1052
    .const 'Sub' $P1030 = "17_1308206292.0457" 
    capture_lex $P1030
    .const 'Sub' $P1026 = "16_1308206292.0457" 
    capture_lex $P1026
    .const 'Sub' $P1022 = "15_1308206292.0457" 
    capture_lex $P1022
    .const 'Sub' $P1013 = "14_1308206292.0457" 
    capture_lex $P1013
    .const 'Sub' $P1009 = "13_1308206292.0457" 
    capture_lex $P1009
    .const 'Sub' $P1005 = "12_1308206292.0457" 
    capture_lex $P1005
.annotate 'line', 129
    get_global $P1004, "%pirop_handlers"
    unless_null $P1004, vivify_67
    $P1004 = root_new ['parrot';'Hash']
    set_global "%pirop_handlers", $P1004
  vivify_67:
.annotate 'line', 16
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 129
    new $P128, "String"
    assign $P128, "bar"
    set_global "%pirop_handlers", $P128
    new $P129, "ResizablePMCArray"
    push $P129, $P128
    push $P129, "bang"
.annotate 'line', 16
    .return ()
    .const 'Sub' $P1793 = "63_1308206292.0457" 
    .return ($P1793)
.end


.namespace ["POST";"Compiler"]
.sub "" :load :init :subid("post66") :outer("11_1308206292.0457")
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1308206292.0457" 
    .local pmc block
    set block, $P1003
.annotate 'line', 20
    get_hll_global $P1796, ["POST"], "Compiler"
    $P1796."language"("POST")
.annotate 'line', 21
    get_hll_global $P1797, ["POST"], "Compiler"
    new $P1798, "ResizablePMCArray"
    push $P1798, "pir"
    push $P1798, "evalpmc"
    $P1797."stages"($P1798)
.annotate 'line', 23

        $P1799 = new ['String']
        set_global '$?HLL', $P1799
    
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("12_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1008
.annotate 'line', 36
    new $P1007, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1007, control_1006
    push_eh $P1007
    .lex "self", self
    .lex "$str", param_1008
.annotate 'line', 37
    get_hll_global $P101, ["PAST"], "Compiler"
    find_lex $P102, "$str"
    $P103 = $P101."escape"($P102)
.annotate 'line', 36
    .return ($P103)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "key_pir"  :subid("13_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1012 :slurpy
.annotate 'line', 44
    new $P1011, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1011, control_1010
    push_eh $P1011
    .lex "self", self
    .lex "@args", param_1012
.annotate 'line', 46

    .local pmc args
    find_lex args, '@args'

    .local string out, sep
    out = '['
    sep = ''
  args_loop:
    unless args goto args_done
    $P0 = shift args
    if null $P0 goto args_loop
    $I0 = does $P0, 'array'
    if $I0 goto args_array
  args_string:
    $S0 = self.'escape'($P0)
    out = concat out, sep
    out = concat out, $S0
    sep = ';'
    goto args_loop
  args_array:
    splice args, $P0, 0, 0
    goto args_loop
  args_done:
    out = concat out, ']'
    .return (out)
    
.annotate 'line', 44
    .return ()
  control_1010:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pir"  :subid("14_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1016
    .param pmc param_1017 :slurpy :named
.annotate 'line', 74
    new $P1015, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1015, control_1014
    push_eh $P1015
    .lex "self", self
    .lex "$post", param_1016
    .lex "%adverbs", param_1017
.annotate 'line', 75
    new $P106, "Undef"
    set $P1018, $P106
    .lex "$newself", $P1018
.annotate 'line', 76
    new $P107, "Undef"
    set $P1019, $P107
    .lex "$CODE", $P1019
.annotate 'line', 77
    new $P108, "Undef"
    set $P1020, $P108
    .lex "$LINE", $P1020
.annotate 'line', 75
    get_hll_global $P109, ["POST"], "Compiler"
    $P110 = $P109."new"()
    store_lex "$newself", $P110
.annotate 'line', 76
    new $P111, "StringBuilder"
    store_lex "$CODE", $P111
.annotate 'line', 77
    new $P112, "Integer"
    assign $P112, 0
    store_lex "$LINE", $P112
.annotate 'line', 79
    find_lex $P113, "$post"
    get_hll_global $P114, ["POST"], "Sub"
    $P115 = $P113."isa"($P114)
    if $P115, unless_1021_end
.annotate 'line', 80
    get_hll_global $P116, ["POST"], "Sub"
    find_lex $P117, "$post"
    $P118 = $P116."new"($P117, "anon" :named("name"))
    store_lex "$post", $P118
  unless_1021_end:
.annotate 'line', 82
    find_lex $P119, "$newself"
    find_lex $P120, "$post"
    $P119."pir"($P120)
    find_lex $P121, "$CODE"
.annotate 'line', 74
    .return ($P121)
  control_1014:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P122, exception, "payload"
    .return ($P122)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir_children"  :subid("15_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1025
.annotate 'line', 89
    new $P1024, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1024, control_1023
    push_eh $P1024
    .lex "self", self
    .lex "$node", param_1025
.annotate 'line', 90

    .local pmc node
    find_lex node, '$node'

    .local pmc line
    line = find_caller_lex '$LINE'
    .lex '$LINE', line

    .local pmc iter
    iter = node.'iterator'()
  iter_loop:
    unless iter goto iter_end
    .local pmc cpost, pos, source
    cpost = shift iter
    pos = cpost['pos']
    if null pos goto done_subline
    source = cpost['source']
    if null source goto done_subline
    line = self.'lineof'(source, pos, 'cache'=>1)
    inc line
  done_subline:
    self.'pir'(cpost)
    goto iter_loop
  iter_end:
    
.annotate 'line', 89
    .return ()
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P123, exception, "payload"
    .return ($P123)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("16_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,_)
    .param pmc param_1029
.annotate 'line', 121
    new $P1028, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1028, control_1027
    push_eh $P1028
    .lex "self", self
    .lex "$node", param_1029
.annotate 'line', 122
    find_lex $P124, "self"
    find_lex $P125, "$node"
    $P126 = $P124."pir_children"($P125)
.annotate 'line', 121
    .return ($P126)
  control_1027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, "payload"
    .return ($P127)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("17_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Op"])
    .param pmc param_1033
.annotate 'line', 131
    new $P1032, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1032, control_1031
    push_eh $P1032
    .lex "self", self
    .lex "$node", param_1033
.annotate 'line', 133
    new $P130, "Undef"
    set $P1034, $P130
    .lex "$pirop", $P1034
.annotate 'line', 135
    new $P131, "Undef"
    set $P1035, $P131
    .lex "$result", $P1035
.annotate 'line', 139
    $P1037 = root_new ['parrot';'ResizablePMCArray']
    set $P1036, $P1037
    .lex "@arglist", $P1036
.annotate 'line', 142
    new $P132, "Undef"
    set $P1038, $P132
    .lex "$fmt", $P1038
.annotate 'line', 143
    new $P133, "Undef"
    set $P1039, $P133
    .lex "$name", $P1039
.annotate 'line', 144
    new $P134, "Undef"
    set $P1040, $P134
    .lex "$invocant", $P1040
.annotate 'line', 174
    new $P135, "Undef"
    set $P1041, $P135
    .lex "$subpir", $P1041
.annotate 'line', 175
    new $P136, "Undef"
    set $P1042, $P136
    .lex "$subline", $P1042
.annotate 'line', 176
    new $P137, "Undef"
    set $P1043, $P137
    .lex "$line", $P1043
.annotate 'line', 133
    find_lex $P138, "$node"
    $P139 = $P138."pirop"()
    store_lex "$pirop", $P139
.annotate 'line', 135
    find_lex $P140, "$node"
    $P141 = $P140."result"()
    set $S142, $P141
    new $P143, 'String'
    set $P143, $S142
    store_lex "$result", $P143
.annotate 'line', 136
    find_lex $P144, "$result"
    unless $P144, if_1044_end
    find_lex $P145, "$result"
    concat $P146, $P145, " = "
    store_lex "$result", $P146
  if_1044_end:
.annotate 'line', 139
    find_lex $P147, "$node"
    $P148 = $P147."list"()
    store_lex "@arglist", $P148
    find_lex $P149, "$fmt"
    find_lex $P150, "$name"
    find_lex $P151, "$invocant"
.annotate 'line', 146
    find_lex $P152, "$pirop"
    set $S153, $P152
    iseq $I154, $S153, "call"
    if $I154, if_1045
.annotate 'line', 150
    find_lex $P158, "$pirop"
    set $S159, $P158
    iseq $I160, $S159, "callmethod"
    if $I160, if_1046
.annotate 'line', 155
    find_lex $P166, "$pirop"
    set $S167, $P166
    iseq $I168, $S167, "return"
    if $I168, if_1047
.annotate 'line', 158
    find_lex $P170, "$pirop"
    set $S171, $P170
    iseq $I172, $S171, "yield"
    if $I172, if_1048
.annotate 'line', 161
    find_lex $P174, "$pirop"
    set $S175, $P174
    iseq $I176, $S175, "tailcall"
    if $I176, if_1049
.annotate 'line', 165
    find_lex $P180, "$pirop"
    set $S181, $P180
    iseq $I182, $S181, "inline"
    if $I182, if_1050
.annotate 'line', 170
    new $P188, "String"
    assign $P188, "    %n %,\n"
    store_lex "$fmt", $P188
.annotate 'line', 171
    find_lex $P189, "$pirop"
    store_lex "$name", $P189
.annotate 'line', 169
    goto if_1050_end
  if_1050:
.annotate 'line', 166
    find_lex $P183, "$node"
    $P184 = $P183."inline"()
    concat $P185, $P184, "\n"
    store_lex "$fmt", $P185
.annotate 'line', 167
    find_lex $P186, "$node"
    $P187 = $P186."result"()
    store_lex "$result", $P187
  if_1050_end:
.annotate 'line', 165
    goto if_1049_end
  if_1049:
.annotate 'line', 162
    find_lex $P177, "@arglist"
    $P178 = $P177."shift"()
    store_lex "$name", $P178
.annotate 'line', 163
    new $P179, "String"
    assign $P179, "    .tailcall %n(%,)\n"
    store_lex "$fmt", $P179
  if_1049_end:
.annotate 'line', 161
    goto if_1048_end
  if_1048:
.annotate 'line', 159
    new $P173, "String"
    assign $P173, "    .yield (%,)\n"
    store_lex "$fmt", $P173
  if_1048_end:
.annotate 'line', 158
    goto if_1047_end
  if_1047:
.annotate 'line', 156
    new $P169, "String"
    assign $P169, "    .return (%,)\n"
    store_lex "$fmt", $P169
  if_1047_end:
.annotate 'line', 155
    goto if_1046_end
  if_1046:
.annotate 'line', 151
    new $P161, "String"
    assign $P161, "    %r%i.%n(%,)\n"
    store_lex "$fmt", $P161
.annotate 'line', 152
    find_lex $P162, "@arglist"
    $P163 = $P162."shift"()
    store_lex "$name", $P163
.annotate 'line', 153
    find_lex $P164, "@arglist"
    $P165 = $P164."shift"()
    store_lex "$invocant", $P165
  if_1046_end:
.annotate 'line', 150
    goto if_1045_end
  if_1045:
.annotate 'line', 147
    new $P155, "String"
    assign $P155, "    %r%n(%,)\n"
    store_lex "$fmt", $P155
.annotate 'line', 148
    find_lex $P156, "@arglist"
    $P157 = $P156."shift"()
    store_lex "$name", $P157
  if_1045_end:
.annotate 'line', 174
    new $P190, "String"
    assign $P190, "$SUBPIR"
    set $S191, $P190
    find_caller_lex $P192, $S191
    store_lex "$subpir", $P192
.annotate 'line', 175
    new $P193, "String"
    assign $P193, "$SUBLINE"
    set $S194, $P193
    find_caller_lex $P195, $S194
    store_lex "$subline", $P195
.annotate 'line', 176
    new $P196, "String"
    assign $P196, "$LINE"
    set $S197, $P196
    find_caller_lex $P198, $S197
    store_lex "$line", $P198
.annotate 'line', 178
    find_lex $P199, "$subline"
    set $N200, $P199
    find_lex $P201, "$line"
    set $N202, $P201
    isne $I203, $N200, $N202
    unless $I203, if_1051_end
.annotate 'line', 179
    find_lex $P204, "$subpir"
    find_lex $P205, "$line"
    set $S206, $P205
    $P204."append_format"(".annotate 'line', %0\n", $S206)
.annotate 'line', 180
    find_lex $P207, "$subline"
    find_lex $P208, "$line"
    assign $P207, $P208
  if_1051_end:
.annotate 'line', 183
    find_lex $P209, "$subpir"
    find_lex $P210, "$fmt"
    find_lex $P211, "@arglist"
    find_lex $P212, "$result"
    find_lex $P213, "$name"
    find_lex $P214, "$invocant"
    find_lex $P215, "$result"
    $P216 = $P209."append_format"($P210, $P211 :flat, $P212 :named("r"), $P213 :named("n"), $P214 :named("i"), $P215 :named("t"))
.annotate 'line', 131
    .return ($P216)
  control_1031:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P217, exception, "payload"
    .return ($P217)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("18_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Label"])
    .param pmc param_1055
.annotate 'line', 190
    new $P1054, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1054, control_1053
    push_eh $P1054
    .lex "self", self
    .lex "$node", param_1055
.annotate 'line', 191
    new $P218, "Undef"
    set $P1056, $P218
    .lex "$subpir", $P1056
    new $P219, "String"
    assign $P219, "$SUBPIR"
    set $S220, $P219
    find_caller_lex $P221, $S220
    store_lex "$subpir", $P221
.annotate 'line', 192
    find_lex $P222, "$subpir"
    find_lex $P223, "$node"
    $P224 = $P223."result"()
    $P225 = $P222."append_format"("  %0:\n", $P224)
.annotate 'line', 190
    .return ($P225)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P226, exception, "payload"
    .return ($P226)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("19_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Sub"])
    .param pmc param_1060
.annotate 'line', 201
    new $P1059, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1059, control_1058
    push_eh $P1059
    .lex "self", self
    .lex "$node", param_1060
.annotate 'line', 202

    .local pmc node
    find_lex node, '$node'

    .local pmc subpir, subline, innerpir
    subpir = new 'StringBuilder'
    .lex '$SUBPIR', subpir
    subline = box -1
    .lex '$SUBLINE', subline
    innerpir = new 'StringBuilder'
    .lex '$CODE', innerpir

    .local string name, pirflags
    name = node.'name'()
    pirflags = node.'pirflags'()

  pirflags_subid:
    $I0 = index pirflags, ':subid('
    if $I0 >= 0 goto pirflags_subid_done
    .local string subid
    subid = node.'subid'()
    pirflags = concat pirflags, ' :subid("'
    pirflags .= subid
    pirflags .= '")'
  pirflags_subid_done:

  pirflags_method:
    $I0 = index pirflags, ':method'
    if $I0 >= 0 goto pirflags_method_done
    $S0 = node.'blocktype'()
    if $S0 != 'method' goto pirflags_method_done
    pirflags = concat pirflags, ' :method'
  pirflags_method_done:

    .local pmc outerpost, outername
    outername = new 'Undef'
    outerpost = node.'outer'()
    if null outerpost goto pirflags_done
    unless outerpost goto pirflags_done
    outername = outerpost.'subid'()
    $S0 = self.'escape'(outername)
    pirflags = concat pirflags, ' :outer('
    pirflags = concat pirflags, $S0
    pirflags = concat pirflags, ')'
  pirflags_done:

    .local pmc outerhll, hll
    outerhll = get_global '$?HLL'
    hll = node.'hll'()
    if hll goto have_hll
    hll = outerhll
  have_hll:
    set_global '$?HLL', hll

    .local pmc outerns, ns, nskey
    outerns = get_global '$?NAMESPACE'
    ns = outerns
    $P0 = node.'namespace'()
    unless $P0 goto have_ns
    ns = $P0
  have_ns:
    set_global '$?NAMESPACE', ns
    nskey = self.'key_pir'(ns)

    .local pmc multi
    multi = node.'multi'()
    unless multi goto no_multi

    .local pmc parts, m_iter
    parts  = new ['ResizableStringArray']
    m_iter = iter multi
  multi_iter:
    unless m_iter goto multi_iter_done
    $P0 = shift m_iter
    $S0 = $P0
    if $S0 == "_" goto push_part
    $S0 = self.'key_pir'($P0)
  push_part:
    push parts, $S0
    goto multi_iter

  multi_iter_done:
    pirflags = concat pirflags, ' :multi('
    $S0 = join ',', parts
    pirflags = concat pirflags, $S0
    pirflags = concat pirflags, ')'
  no_multi:

  subpir_start:
    $P0 = node['loadinit']
    if null $P0 goto loadinit_done
    self.'pir'($P0)
  loadinit_done:

    $P0 = node.'compiler'()
    unless $P0 goto subpir_post
  subpir_compiler:
    $P0 = node.'compiler_args'()
    if $P0 goto have_compiler_args
    $P0 = new 'Hash'
  have_compiler_args:
    $P0 = self.'hll_pir'(node, 'name'=>name, 'namespace'=>ns, 'pirflags'=>pirflags, $P0 :named :flat)
    subpir .= $P0
    goto subpir_done

  subpir_post:
    unless hll goto subpir_loadlibs
    $P0 = self.'escape'(hll)
    subpir.'append_format'("\n.HLL %0\n", $P0)
  subpir_loadlibs:
    $P0 = node.'loadlibs'()
    if null $P0 goto subpir_ns
    unless $P0 goto subpir_ns
    $P1 = iter $P0
  subpir_loadlibs_loop:
    unless $P1 goto subpir_ns
    $P2 = shift $P1
    $P2 = self.'escape'($P2)
    subpir.'append_format'("\n.loadlib %0\n", $P2)
    goto subpir_loadlibs_loop
  subpir_ns:
    subpir.'append_format'("\n.namespace %0\n", nskey)
  subpir_directives:
    $S0 = node['directives']
    unless $S0 goto subpir_decl
    subpir.'append_format'("%0", $S0)
  subpir_decl:
    $S0 = self.'escape'(name)
    subpir.'append_format'(".sub %0 %1\n", $S0, pirflags)
    .local pmc paramlist
    paramlist = node['paramlist']
    if null paramlist goto paramlist_done
    .local pmc it
    it = iter paramlist
  param_loop:
    unless it goto paramlist_done
    $P0 = shift it
    if null $P0 goto param_loop
    subpir .= $P0
    goto param_loop
  paramlist_done:

    self.'pir_children'(node)
    subpir.'append_format'(".end\n\n")

  subpir_done:
    .local pmc outerpir
    outerpir = find_caller_lex '$CODE'
    outerpir .= subpir
    outerpir .= innerpir

    set_global '$?NAMESPACE', outerns
    set_global '$?HLL', outerhll
    
.annotate 'line', 201
    .return ()
  control_1058:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P227, exception, "payload"
    .return ($P227)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "hll_pir"  :subid("20_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1064
    .param pmc param_1065 :slurpy :named
.annotate 'line', 358
    new $P1063, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1063, control_1062
    push_eh $P1063
    .lex "self", self
    .lex "$node", param_1064
    .lex "%options", param_1065
.annotate 'line', 362
    new $P228, "Undef"
    set $P1066, $P228
    .lex "$source", $P1066
.annotate 'line', 363
    new $P229, "Undef"
    set $P1067, $P229
    .lex "$compiler", $P1067
.annotate 'line', 359
    new $P230, "String"
    assign $P230, "pir"
    find_lex $P1068, "%options"
    unless_null $P1068, vivify_68
    $P1068 = root_new ['parrot';'Hash']
    store_lex "%options", $P1068
  vivify_68:
    set $P1068["target"], $P230
.annotate 'line', 360
    find_lex $P231, "$node"
    $P232 = $P231."subid"()
    find_lex $P1069, "%options"
    unless_null $P1069, vivify_69
    $P1069 = root_new ['parrot';'Hash']
    store_lex "%options", $P1069
  vivify_69:
    set $P1069["subid"], $P232
.annotate 'line', 362
    find_lex $P1070, "$node"
    unless_null $P1070, vivify_70
    $P1070 = root_new ['parrot';'ResizablePMCArray']
  vivify_70:
    set $P233, $P1070[0]
    unless_null $P233, vivify_71
    new $P233, "Undef"
  vivify_71:
    store_lex "$source", $P233
.annotate 'line', 363
    find_lex $P234, "$node"
    $S235 = $P234."compiler"()
    compreg $P236, $S235
    store_lex "$compiler", $P236
.annotate 'line', 364
    find_lex $P238, "$compiler"
    isa $I239, $P238, "Sub"
    if $I239, if_1071
.annotate 'line', 366
    find_lex $P244, "$compiler"
    find_lex $P245, "$source"
    find_lex $P246, "%options"
    $P247 = $P244."compile"($P245, $P246 :flat)
    set $P237, $P247
.annotate 'line', 364
    goto if_1071_end
  if_1071:
.annotate 'line', 365
    find_lex $P240, "$compiler"
    find_lex $P241, "$source"
    find_lex $P242, "%options"
    $P243 = $P240($P241, $P242 :flat)
    set $P237, $P243
  if_1071_end:
.annotate 'line', 358
    .return ($P237)
  control_1062:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P248, exception, "payload"
    .return ($P248)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("21_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1075
    .param pmc param_1076
.annotate 'line', 386
    .const 'Sub' $P1082 = "22_1308206292.0457" 
    capture_lex $P1082
    new $P1074, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1074, control_1073
    push_eh $P1074
    .lex "self", self
    .lex "$post", param_1075
    .lex "%adverbs", param_1076
.annotate 'line', 390
    $P1078 = root_new ['parrot';'Hash']
    set $P1077, $P1078
    .lex "%context", $P1077
    find_lex $P249, "self"
    find_lex $P250, "$post"
    find_lex $P251, "%adverbs"
    $P252 = $P249."create_context"($P250, $P251)
    store_lex "%context", $P252
.annotate 'line', 391
    new $P253, "Integer"
    assign $P253, 0
    find_lex $P1079, "%context"
    unless_null $P1079, vivify_72
    $P1079 = root_new ['parrot';'Hash']
    store_lex "%context", $P1079
  vivify_72:
    set $P1079["DEBUG"], $P253
.annotate 'line', 393
    find_lex $P254, "$post"
    find_lex $P1080, "%context"
    unless_null $P1080, vivify_73
    $P1080 = root_new ['parrot';'Hash']
    store_lex "%context", $P1080
  vivify_73:
    set $P1080["pir_file"], $P254
.annotate 'line', 398
    find_lex $P255, "self"
    find_lex $P256, "$post"
    $P255."enumerate_subs"($P256)
.annotate 'line', 400
    find_lex $P258, "$post"
    $P259 = $P258."list"()
    defined $I260, $P259
    unless $I260, for_undef_74
    iter $P257, $P259
    new $P266, 'ExceptionHandler'
    set_label $P266, loop1084_handler
    $P266."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P266
  loop1084_test:
    unless $P257, loop1084_done
    shift $P261, $P257
  loop1084_redo:
    .const 'Sub' $P1082 = "22_1308206292.0457" 
    capture_lex $P1082
    $P1082($P261)
  loop1084_next:
    goto loop1084_test
  loop1084_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P267, exception, 'type'
    eq $P267, .CONTROL_LOOP_NEXT, loop1084_next
    eq $P267, .CONTROL_LOOP_REDO, loop1084_redo
  loop1084_done:
    pop_eh 
  for_undef_74:
    find_lex $P1085, "%context"
    unless_null $P1085, vivify_75
    $P1085 = root_new ['parrot';'Hash']
  vivify_75:
    set $P268, $P1085["packfile"]
    unless_null $P268, vivify_76
    new $P268, "Undef"
  vivify_76:
.annotate 'line', 386
    .return ($P268)
  control_1073:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P269, exception, "payload"
    .return ($P269)
.end


.namespace ["POST";"Compiler"]
.sub "_block1081"  :anon :subid("22_1308206292.0457") :outer("21_1308206292.0457")
    .param pmc param_1083
.annotate 'line', 400
    .lex "$s", param_1083
.annotate 'line', 401
    find_lex $P262, "self"
    find_lex $P263, "$s"
    find_lex $P264, "%context"
    $P265 = $P262."to_pbc"($P263, $P264)
.annotate 'line', 400
    .return ($P265)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("23_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["Undef"],_)
    .param pmc param_1089
    .param pmc param_1090
.annotate 'line', 410
    new $P1088, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1088, control_1087
    push_eh $P1088
    .lex "self", self
    .lex "$what", param_1089
    .lex "%context", param_1090
    .return ()
  control_1087:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P270, exception, "payload"
    .return ($P270)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("24_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Sub"],_)
    .param pmc param_1094
    .param pmc param_1095
.annotate 'line', 414
    .const 'Sub' $P1149 = "26_1308206292.0457" 
    capture_lex $P1149
    .const 'Sub' $P1128 = "25_1308206292.0457" 
    capture_lex $P1128
    new $P1093, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1093, control_1092
    push_eh $P1093
    .lex "self", self
    .lex "$sub", param_1094
    .lex "%context", param_1095
.annotate 'line', 419
    $P1097 = root_new ['parrot';'ResizablePMCArray']
    set $P1096, $P1097
    .lex "@n_regs_used", $P1096
.annotate 'line', 423
    new $P271, "Undef"
    set $P1098, $P271
    .lex "$bc", $P1098
.annotate 'line', 429
    new $P272, "Undef"
    set $P1099, $P272
    .lex "$sb", $P1099
.annotate 'line', 431
    new $P273, "Undef"
    set $P1100, $P273
    .lex "$subname", $P1100
.annotate 'line', 436
    new $P274, "Undef"
    set $P1101, $P274
    .lex "$start_offset", $P1101
.annotate 'line', 465
    new $P275, "Undef"
    set $P1102, $P275
    .lex "$end_offset", $P1102
.annotate 'line', 472
    $P1104 = root_new ['parrot';'Hash']
    set $P1103, $P1104
    .lex "%sub", $P1103
.annotate 'line', 499
    new $P276, "Undef"
    set $P1105, $P276
    .lex "$idx", $P1105
.annotate 'line', 416
    find_lex $P277, "$sub"
    find_lex $P1106, "%context"
    unless_null $P1106, vivify_77
    $P1106 = root_new ['parrot';'Hash']
    store_lex "%context", $P1106
  vivify_77:
    set $P1106["sub"], $P277
.annotate 'line', 419
    find_lex $P1107, "%context"
    unless_null $P1107, vivify_78
    $P1107 = root_new ['parrot';'Hash']
  vivify_78:
    set $P278, $P1107["regalloc"]
    unless_null $P278, vivify_79
    new $P278, "Undef"
  vivify_79:
    find_lex $P279, "$sub"
    $P280 = $P278."process"($P279)
    store_lex "@n_regs_used", $P280
.annotate 'line', 420
    find_lex $P1109, "%context"
    unless_null $P1109, vivify_80
    $P1109 = root_new ['parrot';'Hash']
  vivify_80:
    set $P281, $P1109["DEBUG"]
    unless_null $P281, vivify_81
    new $P281, "Undef"
  vivify_81:
    unless $P281, if_1108_end
    find_lex $P282, "self"
    new $P283, "String"
    assign $P283, "n_regs_used "
    find_lex $P284, "@n_regs_used"
    $S285 = $P284."join"("-")
    concat $P286, $P283, $S285
    $P282."debug"($P286)
  if_1108_end:
.annotate 'line', 421
    find_lex $P1111, "%context"
    unless_null $P1111, vivify_82
    $P1111 = root_new ['parrot';'Hash']
  vivify_82:
    set $P287, $P1111["DEBUG"]
    unless_null $P287, vivify_83
    new $P287, "Undef"
  vivify_83:
    unless $P287, if_1110_end
    find_lex $P288, "self"
    find_lex $P289, "$sub"
    $P288."dumper"($P289, "sub")
  if_1110_end:
.annotate 'line', 423
    find_lex $P1112, "%context"
    unless_null $P1112, vivify_84
    $P1112 = root_new ['parrot';'Hash']
  vivify_84:
    set $P290, $P1112["bytecode"]
    unless_null $P290, vivify_85
    new $P290, "Undef"
  vivify_85:
    store_lex "$bc", $P290
.annotate 'line', 426
    $P291 = "hash"()
    find_lex $P1113, "%context"
    unless_null $P1113, vivify_86
    $P1113 = root_new ['parrot';'Hash']
    store_lex "%context", $P1113
  vivify_86:
    set $P1113["labels_todo"], $P291
.annotate 'line', 429
    $P292 = "new"("StringBuilder")
    store_lex "$sb", $P292
.annotate 'line', 430
    find_lex $P293, "$sb"
    find_lex $P294, "$sub"
    $P295 = $P294."name"()
    set $S296, $P295
    $P293."push"($S296)
.annotate 'line', 431
    find_lex $P297, "$sb"
    set $S298, $P297
    new $P299, 'String'
    set $P299, $S298
    store_lex "$subname", $P299
.annotate 'line', 433
    find_lex $P1115, "%context"
    unless_null $P1115, vivify_87
    $P1115 = root_new ['parrot';'Hash']
  vivify_87:
    set $P300, $P1115["DEBUG"]
    unless_null $P300, vivify_88
    new $P300, "Undef"
  vivify_88:
    unless $P300, if_1114_end
    find_lex $P301, "self"
    new $P302, 'String'
    set $P302, "Emitting "
    find_lex $P303, "$subname"
    concat $P304, $P302, $P303
    $P301."debug"($P304)
  if_1114_end:
.annotate 'line', 434
    find_lex $P1116, "%context"
    unless_null $P1116, vivify_89
    $P1116 = root_new ['parrot';'Hash']
  vivify_89:
    set $P305, $P1116["constants"]
    unless_null $P305, vivify_90
    new $P305, "Undef"
  vivify_90:
    find_lex $P306, "$subname"
    $P305."get_or_create_string"($P306)
.annotate 'line', 436
    find_lex $P307, "$bc"
    set $N308, $P307
    new $P309, 'Float'
    set $P309, $N308
    store_lex "$start_offset", $P309
.annotate 'line', 437
    find_lex $P1118, "%context"
    unless_null $P1118, vivify_91
    $P1118 = root_new ['parrot';'Hash']
  vivify_91:
    set $P310, $P1118["DEBUG"]
    unless_null $P310, vivify_92
    new $P310, "Undef"
  vivify_92:
    unless $P310, if_1117_end
    find_lex $P311, "self"
    new $P312, 'String'
    set $P312, "From "
    find_lex $P313, "$start_offset"
    concat $P314, $P312, $P313
    $P311."debug"($P314)
  if_1117_end:
.annotate 'line', 440
    find_lex $P1120, "$sub"
    unless_null $P1120, vivify_93
    $P1120 = root_new ['parrot';'Hash']
  vivify_93:
    set $P315, $P1120["params"]
    unless_null $P315, vivify_94
    new $P315, "Undef"
  vivify_94:
    if $P315, unless_1119_end
    $P316 = "list"()
    find_lex $P1121, "$sub"
    unless_null $P1121, vivify_95
    $P1121 = root_new ['parrot';'Hash']
    store_lex "$sub", $P1121
  vivify_95:
    set $P1121["params"], $P316
  unless_1119_end:
.annotate 'line', 441
    find_lex $P317, "$sub"
    $P318 = $P317."is_method"()
    unless $P318, if_1122_end
    find_lex $P1123, "$sub"
    unless_null $P1123, vivify_96
    $P1123 = root_new ['parrot';'Hash']
  vivify_96:
    set $P319, $P1123["params"]
    unless_null $P319, vivify_97
    new $P319, "Undef"
  vivify_97:
    get_hll_global $P320, ["POST"], "Value"
    $P321 = $P320."new"("self" :named("name"))
    $P319."unshift"($P321)
  if_1122_end:
.annotate 'line', 443
    find_lex $P1125, "$sub"
    unless_null $P1125, vivify_98
    $P1125 = root_new ['parrot';'Hash']
  vivify_98:
    set $P322, $P1125["params"]
    unless_null $P322, vivify_99
    new $P322, "Undef"
  vivify_99:
    set $N323, $P322
    unless $N323, if_1124_end
.annotate 'line', 444
    find_lex $P324, "self"
    find_lex $P1126, "$sub"
    unless_null $P1126, vivify_100
    $P1126 = root_new ['parrot';'Hash']
  vivify_100:
    set $P325, $P1126["params"]
    unless_null $P325, vivify_101
    new $P325, "Undef"
  vivify_101:
    find_lex $P326, "%context"
    $P324."build_pcc_call"("get_params_pc", $P325, $P326)
  if_1124_end:
.annotate 'line', 448
    find_lex $P328, "$sub"
    $P329 = $P328."list"()
    defined $I330, $P329
    unless $I330, for_undef_102
    iter $P327, $P329
    new $P336, 'ExceptionHandler'
    set_label $P336, loop1130_handler
    $P336."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P336
  loop1130_test:
    unless $P327, loop1130_done
    shift $P331, $P327
  loop1130_redo:
    .const 'Sub' $P1128 = "25_1308206292.0457" 
    capture_lex $P1128
    $P1128($P331)
  loop1130_next:
    goto loop1130_test
  loop1130_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P337, exception, 'type'
    eq $P337, .CONTROL_LOOP_NEXT, loop1130_next
    eq $P337, .CONTROL_LOOP_REDO, loop1130_redo
  loop1130_done:
    pop_eh 
  for_undef_102:
.annotate 'line', 452
    find_lex $P1132, "%context"
    unless_null $P1132, vivify_103
    $P1132 = root_new ['parrot';'Hash']
  vivify_103:
    set $P338, $P1132["DEBUG"]
    unless_null $P338, vivify_104
    new $P338, "Undef"
  vivify_104:
    unless $P338, if_1131_end
    find_lex $P339, "self"
    new $P340, 'String'
    set $P340, "Middle "
    find_lex $P341, "$bc"
    set $N342, $P341
    set $S343, $N342
    concat $P344, $P340, $S343
    $P339."debug"($P344)
  if_1131_end:
.annotate 'line', 455
    find_lex $P1134, "%context"
    unless_null $P1134, vivify_105
    $P1134 = root_new ['parrot';'Hash']
  vivify_105:
    set $P345, $P1134["DEBUG"]
    unless_null $P345, vivify_106
    new $P345, "Undef"
  vivify_106:
    unless $P345, if_1133_end
    find_lex $P346, "self"
    $P346."debug"("Emitting default return")
  if_1133_end:
.annotate 'line', 456
    find_lex $P347, "$bc"
.annotate 'line', 457
    new $P348, "ResizablePMCArray"
    push $P348, "set_returns_pc"
    push $P348, 0
    $P347."push"($P348)
.annotate 'line', 461
    find_lex $P349, "$bc"
    new $P350, "ResizablePMCArray"
    push $P350, "returncc"
    $P349."push"($P350)
.annotate 'line', 465
    find_lex $P351, "$bc"
    set $N352, $P351
    new $P353, 'Float'
    set $P353, $N352
    store_lex "$end_offset", $P353
.annotate 'line', 466
    find_lex $P1136, "%context"
    unless_null $P1136, vivify_107
    $P1136 = root_new ['parrot';'Hash']
  vivify_107:
    set $P354, $P1136["DEBUG"]
    unless_null $P354, vivify_108
    new $P354, "Undef"
  vivify_108:
    unless $P354, if_1135_end
    find_lex $P355, "self"
    new $P356, 'String'
    set $P356, "To "
    find_lex $P357, "$end_offset"
    concat $P358, $P356, $P357
    $P355."debug"($P358)
  if_1135_end:
.annotate 'line', 469
    find_lex $P359, "self"
    find_lex $P360, "$sub"
    find_lex $P1137, "%context"
    unless_null $P1137, vivify_109
    $P1137 = root_new ['parrot';'Hash']
  vivify_109:
    set $P361, $P1137["labels_todo"]
    unless_null $P361, vivify_110
    new $P361, "Undef"
  vivify_110:
    find_lex $P1138, "%context"
    unless_null $P1138, vivify_111
    $P1138 = root_new ['parrot';'Hash']
  vivify_111:
    set $P362, $P1138["bytecode"]
    unless_null $P362, vivify_112
    new $P362, "Undef"
  vivify_112:
    find_lex $P363, "%context"
    $P359."fixup_labels"($P360, $P361, $P362, $P363)
.annotate 'line', 472
    find_lex $P364, "$start_offset"
    find_lex $P365, "$end_offset"
    find_lex $P366, "$subname"
.annotate 'line', 477
    find_lex $P1140, "$sub"
    unless_null $P1140, vivify_113
    $P1140 = root_new ['parrot';'Hash']
  vivify_113:
    set $P367, $P1140["subid"]
    unless_null $P367, vivify_114
    new $P367, "Undef"
  vivify_114:
    set $P1139, $P367
    defined $I1142, $P1139
    if $I1142, default_1141
    find_lex $P368, "$subname"
    set $P1139, $P368
  default_1141:
.annotate 'line', 478
    find_lex $P369, "$sub"
    $P370 = $P369."nsentry"()
    set $P1143, $P370
    defined $I1145, $P1143
    if $I1145, default_1144
    find_lex $P371, "$subname"
    set $P1143, $P371
  default_1144:
.annotate 'line', 481
    find_lex $P373, "$sub"
    $P374 = $P373."is_method"()
    if $P374, if_1146
    new $P376, "String"
    assign $P376, ""
    set $P372, $P376
    goto if_1146_end
  if_1146:
    find_lex $P375, "$subname"
    set $P372, $P375
  if_1146_end:
.annotate 'line', 472
    find_lex $P377, "@n_regs_used"
.annotate 'line', 485
    find_lex $P378, "self"
    find_lex $P379, "$sub"
    find_lex $P380, "%context"
    $P381 = $P378."create_sub_pf_flags"($P379, $P380)
.annotate 'line', 486
    find_lex $P382, "self"
    find_lex $P383, "$sub"
    find_lex $P384, "%context"
    $P385 = $P382."create_sub_comp_flags"($P383, $P384)
.annotate 'line', 472
    $P386 = "hash"($P364 :named("start_offs"), $P365 :named("end_offs"), $P366 :named("name"), $P1139 :named("subid"), $P1143 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P372 :named("method_name"), $P377 :named("n_regs_used"), $P381 :named("pf_flags"), $P385 :named("comp_flags"))
    store_lex "%sub", $P386
.annotate 'line', 489
    find_lex $P387, "$sub"
    $P388 = $P387."namespace"()
    $P389 = "defined"($P388)
    unless $P389, if_1147_end
    .const 'Sub' $P1149 = "26_1308206292.0457" 
    capture_lex $P1149
    $P1149()
  if_1147_end:
.annotate 'line', 499
    find_lex $P401, "$sub"
    $P402 = $P401."constant_index"()
    store_lex "$idx", $P402
.annotate 'line', 500
    find_lex $P403, "$idx"
    $P404 = "defined"($P403)
    if $P404, if_1153
.annotate 'line', 505
    find_lex $P1158, "%context"
    unless_null $P1158, vivify_117
    $P1158 = root_new ['parrot';'Hash']
  vivify_117:
    set $P414, $P1158["constants"]
    unless_null $P414, vivify_118
    new $P414, "Undef"
  vivify_118:
    find_lex $P415, "%sub"
    $P416 = "new"("Sub", $P415)
    $P417 = $P414."push"($P416)
    store_lex "$idx", $P417
.annotate 'line', 506
    find_lex $P418, "$sub"
    find_lex $P419, "$idx"
    $P418."constant_index"($P419)
.annotate 'line', 507
    find_lex $P1160, "%context"
    unless_null $P1160, vivify_119
    $P1160 = root_new ['parrot';'Hash']
  vivify_119:
    set $P420, $P1160["DEBUG"]
    unless_null $P420, vivify_120
    new $P420, "Undef"
  vivify_120:
    unless $P420, if_1159_end
    find_lex $P421, "self"
    new $P422, 'String'
    set $P422, "Allocate new constant "
    find_lex $P423, "$idx"
    concat $P424, $P422, $P423
    $P421."debug"($P424)
  if_1159_end:
.annotate 'line', 504
    goto if_1153_end
  if_1153:
.annotate 'line', 501
    find_lex $P1155, "%context"
    unless_null $P1155, vivify_121
    $P1155 = root_new ['parrot';'Hash']
  vivify_121:
    set $P405, $P1155["DEBUG"]
    unless_null $P405, vivify_122
    new $P405, "Undef"
  vivify_122:
    unless $P405, if_1154_end
    find_lex $P406, "self"
    new $P407, 'String'
    set $P407, "Reusing old constant "
    find_lex $P408, "$idx"
    concat $P409, $P407, $P408
    $P406."debug"($P409)
  if_1154_end:
.annotate 'line', 502
    find_lex $P410, "%sub"
    $P411 = "new"("Sub", $P410)
    find_lex $P412, "$idx"
    set $I413, $P412
    find_lex $P1156, "%context"
    unless_null $P1156, vivify_123
    $P1156 = root_new ['parrot';'Hash']
    store_lex "%context", $P1156
  vivify_123:
    set $P1157, $P1156["constants"]
    unless_null $P1157, vivify_124
    $P1157 = root_new ['parrot';'ResizablePMCArray']
    set $P1156["constants"], $P1157
  vivify_124:
    set $P1157[$I413], $P411
  if_1153_end:
.annotate 'line', 511
    find_lex $P1162, "%context"
    unless_null $P1162, vivify_125
    $P1162 = root_new ['parrot';'Hash']
  vivify_125:
    set $P426, $P1162["got_main_sub"]
    unless_null $P426, vivify_126
    new $P426, "Undef"
  vivify_126:
    isfalse $I427, $P426
    if $I427, if_1161
    new $P425, 'Integer'
    set $P425, $I427
    goto if_1161_end
  if_1161:
.annotate 'line', 512
    find_lex $P1164, "%context"
    unless_null $P1164, vivify_127
    $P1164 = root_new ['parrot';'Hash']
  vivify_127:
    set $P428, $P1164["DEBUG"]
    unless_null $P428, vivify_128
    new $P428, "Undef"
  vivify_128:
    unless $P428, if_1163_end
    find_lex $P429, "self"
    new $P430, 'String'
    set $P430, "main_sub is "
    find_lex $P1165, "%context"
    unless_null $P1165, vivify_129
    $P1165 = root_new ['parrot';'Hash']
  vivify_129:
    set $P431, $P1165["bytecode"]
    unless_null $P431, vivify_130
    new $P431, "Undef"
  vivify_130:
    $P432 = $P431."main_sub"()
    set $S433, $P432
    concat $P434, $P430, $S433
    $P429."debug"($P434)
  if_1163_end:
.annotate 'line', 513
    find_lex $P435, "$sub"
    $P436 = $P435."main"()
    if $P436, if_1166
.annotate 'line', 519
    find_lex $P1172, "%context"
    unless_null $P1172, vivify_131
    $P1172 = root_new ['parrot';'Hash']
  vivify_131:
    set $P442, $P1172["bytecode"]
    unless_null $P442, vivify_132
    new $P442, "Undef"
  vivify_132:
    $N443 = $P442."main_sub"()
    iseq $I444, $N443, -1.0
    unless $I444, if_1171_end
.annotate 'line', 521
    find_lex $P1174, "%context"
    unless_null $P1174, vivify_133
    $P1174 = root_new ['parrot';'Hash']
  vivify_133:
    set $P445, $P1174["DEBUG"]
    unless_null $P445, vivify_134
    new $P445, "Undef"
  vivify_134:
    unless $P445, if_1173_end
    find_lex $P446, "self"
    $P446."debug"("Got first sub")
  if_1173_end:
.annotate 'line', 522
    find_lex $P1175, "%context"
    unless_null $P1175, vivify_135
    $P1175 = root_new ['parrot';'Hash']
  vivify_135:
    set $P447, $P1175["bytecode"]
    unless_null $P447, vivify_136
    new $P447, "Undef"
  vivify_136:
    find_lex $P448, "$idx"
    $P447."main_sub"($P448)
  if_1171_end:
.annotate 'line', 519
    goto if_1166_end
  if_1166:
.annotate 'line', 514
    find_lex $P1168, "%context"
    unless_null $P1168, vivify_137
    $P1168 = root_new ['parrot';'Hash']
  vivify_137:
    set $P437, $P1168["DEBUG"]
    unless_null $P437, vivify_138
    new $P437, "Undef"
  vivify_138:
    unless $P437, if_1167_end
    find_lex $P438, "self"
    $P438."debug"("Got first :main")
  if_1167_end:
.annotate 'line', 516
    find_lex $P1169, "%context"
    unless_null $P1169, vivify_139
    $P1169 = root_new ['parrot';'Hash']
  vivify_139:
    set $P439, $P1169["bytecode"]
    unless_null $P439, vivify_140
    new $P439, "Undef"
  vivify_140:
    find_lex $P440, "$idx"
    $P439."main_sub"($P440)
.annotate 'line', 517
    new $P441, "Integer"
    assign $P441, 1
    find_lex $P1170, "%context"
    unless_null $P1170, vivify_141
    $P1170 = root_new ['parrot';'Hash']
    store_lex "%context", $P1170
  vivify_141:
    set $P1170["got_main_sub"], $P441
  if_1166_end:
.annotate 'line', 525
    find_lex $P1177, "%context"
    unless_null $P1177, vivify_142
    $P1177 = root_new ['parrot';'Hash']
  vivify_142:
    set $P450, $P1177["DEBUG"]
    unless_null $P450, vivify_143
    new $P450, "Undef"
  vivify_143:
    if $P450, if_1176
    set $P449, $P450
    goto if_1176_end
  if_1176:
    find_lex $P451, "self"
    new $P452, 'String'
    set $P452, ":main sub is "
    find_lex $P1178, "%context"
    unless_null $P1178, vivify_144
    $P1178 = root_new ['parrot';'Hash']
  vivify_144:
    set $P453, $P1178["bytecode"]
    unless_null $P453, vivify_145
    new $P453, "Undef"
  vivify_145:
    $P454 = $P453."main_sub"()
    set $S455, $P454
    concat $P456, $P452, $S455
    $P457 = $P451."debug"($P456)
    set $P449, $P457
  if_1176_end:
.annotate 'line', 511
    set $P425, $P449
  if_1161_end:
.annotate 'line', 414
    .return ($P425)
  control_1092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P458, exception, "payload"
    .return ($P458)
.end


.namespace ["POST";"Compiler"]
.sub "_block1127"  :anon :subid("25_1308206292.0457") :outer("24_1308206292.0457")
    .param pmc param_1129
.annotate 'line', 448
    .lex "$_", param_1129
.annotate 'line', 449
    find_lex $P332, "self"
    find_lex $P333, "$_"
    find_lex $P334, "%context"
    $P335 = $P332."to_pbc"($P333, $P334)
.annotate 'line', 448
    .return ($P335)
.end


.namespace ["POST";"Compiler"]
.sub "_block1148"  :anon :subid("26_1308206292.0457") :outer("24_1308206292.0457")
.annotate 'line', 490
    new $P390, "Undef"
    set $P1150, $P390
    .lex "$nskey", $P1150
    find_lex $P391, "$sub"
    $P392 = $P391."namespace"()
    find_lex $P393, "%context"
    $P394 = $P392."to_pmc"($P393)
    set $P395, $P394[0]
    unless_null $P395, vivify_115
    new $P395, "Undef"
  vivify_115:
    store_lex "$nskey", $P395
.annotate 'line', 491
    find_lex $P397, "$nskey"
    typeof $S398, $P397
    iseq $I399, $S398, "Key"
    if $I399, if_1151
    new $P396, 'Integer'
    set $P396, $I399
    goto if_1151_end
  if_1151:
.annotate 'line', 492
    find_lex $P400, "$nskey"
    find_lex $P1152, "%sub"
    unless_null $P1152, vivify_116
    $P1152 = root_new ['parrot';'Hash']
    store_lex "%sub", $P1152
  vivify_116:
    set $P1152["namespace_name"], $P400
.annotate 'line', 491
    set $P396, $P400
  if_1151_end:
.annotate 'line', 489
    .return ($P396)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("27_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Op"],_)
    .param pmc param_1182
    .param pmc param_1183
.annotate 'line', 529
    .const 'Sub' $P1201 = "29_1308206292.0457" 
    capture_lex $P1201
    .const 'Sub' $P1190 = "28_1308206292.0457" 
    capture_lex $P1190
    new $P1181, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1181, control_1180
    push_eh $P1181
    .lex "self", self
    .lex "$op", param_1182
    .lex "%context", param_1183
.annotate 'line', 531
    new $P459, "Undef"
    set $P1184, $P459
    .lex "$fullname", $P1184
.annotate 'line', 546
    $P1186 = root_new ['parrot';'ResizablePMCArray']
    set $P1185, $P1186
    .lex "@op", $P1185
.annotate 'line', 531
    find_lex $P460, "$op"
    $P461 = $P460."pirop"()
    store_lex "$fullname", $P461
.annotate 'line', 532
    find_lex $P1188, "%context"
    unless_null $P1188, vivify_146
    $P1188 = root_new ['parrot';'Hash']
  vivify_146:
    set $P462, $P1188["DEBUG"]
    unless_null $P462, vivify_147
    new $P462, "Undef"
  vivify_147:
    unless $P462, if_1187_end
    find_lex $P463, "self"
    new $P464, 'String'
    set $P464, "Short name "
    find_lex $P465, "$fullname"
    concat $P466, $P464, $P465
    $P463."debug"($P466)
  if_1187_end:
.annotate 'line', 534
    find_lex $P468, "$op"
    $P469 = $P468."list"()
    defined $I470, $P469
    unless $I470, for_undef_148
    iter $P467, $P469
    new $P489, 'ExceptionHandler'
    set_label $P489, loop1194_handler
    $P489."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P489
  loop1194_test:
    unless $P467, loop1194_done
    shift $P471, $P467
  loop1194_redo:
    .const 'Sub' $P1190 = "28_1308206292.0457" 
    capture_lex $P1190
    $P1190($P471)
  loop1194_next:
    goto loop1194_test
  loop1194_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P490, exception, 'type'
    eq $P490, .CONTROL_LOOP_NEXT, loop1194_next
    eq $P490, .CONTROL_LOOP_REDO, loop1194_redo
  loop1194_done:
    pop_eh 
  for_undef_148:
.annotate 'line', 539
    find_lex $P1196, "%context"
    unless_null $P1196, vivify_149
    $P1196 = root_new ['parrot';'Hash']
  vivify_149:
    set $P491, $P1196["DEBUG"]
    unless_null $P491, vivify_150
    new $P491, "Undef"
  vivify_150:
    unless $P491, if_1195_end
    find_lex $P492, "self"
    new $P493, 'String'
    set $P493, "Fullname "
    find_lex $P494, "$fullname"
    concat $P495, $P493, $P494
    $P492."debug"($P495)
  if_1195_end:
.annotate 'line', 542
    find_lex $P1197, "%context"
    unless_null $P1197, vivify_151
    $P1197 = root_new ['parrot';'Hash']
  vivify_151:
    set $P496, $P1197["bytecode"]
    unless_null $P496, vivify_152
    new $P496, "Undef"
  vivify_152:
    set $N497, $P496
    new $P498, 'Float'
    set $P498, $N497
    find_lex $P1198, "%context"
    unless_null $P1198, vivify_153
    $P1198 = root_new ['parrot';'Hash']
    store_lex "%context", $P1198
  vivify_153:
    set $P1198["opcode_offset"], $P498
.annotate 'line', 544
    find_lex $P499, "$fullname"
    find_lex $P1199, "%context"
    unless_null $P1199, vivify_154
    $P1199 = root_new ['parrot';'Hash']
    store_lex "%context", $P1199
  vivify_154:
    set $P1199["opcode_fullname"], $P499
.annotate 'line', 546
    find_lex $P500, "$fullname"
    $P501 = "list"($P500)
    store_lex "@op", $P501
.annotate 'line', 547
    find_lex $P503, "$op"
    $P504 = $P503."list"()
    defined $I505, $P504
    unless $I505, for_undef_155
    iter $P502, $P504
    new $P513, 'ExceptionHandler'
    set_label $P513, loop1203_handler
    $P513."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P513
  loop1203_test:
    unless $P502, loop1203_done
    shift $P506, $P502
  loop1203_redo:
    .const 'Sub' $P1201 = "29_1308206292.0457" 
    capture_lex $P1201
    $P1201($P506)
  loop1203_next:
    goto loop1203_test
  loop1203_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P514, exception, 'type'
    eq $P514, .CONTROL_LOOP_NEXT, loop1203_next
    eq $P514, .CONTROL_LOOP_REDO, loop1203_redo
  loop1203_done:
    pop_eh 
  for_undef_155:
.annotate 'line', 550
    find_lex $P1205, "%context"
    unless_null $P1205, vivify_156
    $P1205 = root_new ['parrot';'Hash']
  vivify_156:
    set $P515, $P1205["DEBUG"]
    unless_null $P515, vivify_157
    new $P515, "Undef"
  vivify_157:
    unless $P515, if_1204_end
    find_lex $P516, "self"
    new $P517, 'String'
    set $P517, "Op size "
    find_lex $P518, "@op"
    set $N519, $P518
    set $S520, $N519
    concat $P521, $P517, $S520
    $P516."debug"($P521)
  if_1204_end:
.annotate 'line', 551
    find_lex $P1206, "%context"
    unless_null $P1206, vivify_158
    $P1206 = root_new ['parrot';'Hash']
  vivify_158:
    set $P522, $P1206["bytecode"]
    unless_null $P522, vivify_159
    new $P522, "Undef"
  vivify_159:
    find_lex $P523, "@op"
    $P524 = $P522."push"($P523)
.annotate 'line', 529
    .return ($P524)
  control_1180:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P525, exception, "payload"
    .return ($P525)
.end


.namespace ["POST";"Compiler"]
.sub "_block1189"  :anon :subid("28_1308206292.0457") :outer("27_1308206292.0457")
    .param pmc param_1192
.annotate 'line', 535
    new $P472, "Undef"
    set $P1191, $P472
    .lex "$type", $P1191
    .lex "$_", param_1192
    find_lex $P474, "$_"
    $P475 = $P474."type"()
    unless $P475, unless_1193
    set $P473, $P475
    goto unless_1193_end
  unless_1193:
    find_lex $P476, "self"
    find_lex $P477, "$_"
    $P478 = $P477."name"()
    find_lex $P479, "%context"
    $P480 = $P476."get_register"($P478, $P479)
    $P481 = $P480."type"()
    set $P473, $P481
  unless_1193_end:
    store_lex "$type", $P473
.annotate 'line', 536
    find_lex $P482, "$fullname"
    set $S483, $P482
    new $P484, 'String'
    set $P484, $S483
    concat $P485, $P484, "_"
    find_lex $P486, "$type"
    set $S487, $P486
    concat $P488, $P485, $S487
    store_lex "$fullname", $P488
.annotate 'line', 534
    .return ($P488)
.end


.namespace ["POST";"Compiler"]
.sub "_block1200"  :anon :subid("29_1308206292.0457") :outer("27_1308206292.0457")
    .param pmc param_1202
.annotate 'line', 547
    .lex "$_", param_1202
.annotate 'line', 548
    find_lex $P507, "@op"
    find_lex $P508, "self"
    find_lex $P509, "$_"
    find_lex $P510, "%context"
    $P511 = $P508."to_op"($P509, $P510)
    $P512 = $P507."push"($P511)
.annotate 'line', 547
    .return ($P512)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Node"],_)
    .param pmc param_1210
    .param pmc param_1211
.annotate 'line', 555
    .const 'Sub' $P1213 = "31_1308206292.0457" 
    capture_lex $P1213
    new $P1209, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1209, control_1208
    push_eh $P1209
    .lex "self", self
    .lex "$node", param_1210
    .lex "%context", param_1211
.annotate 'line', 556
    find_lex $P527, "$node"
    $P528 = $P527."list"()
    defined $I529, $P528
    unless $I529, for_undef_160
    iter $P526, $P528
    new $P535, 'ExceptionHandler'
    set_label $P535, loop1215_handler
    $P535."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P535
  loop1215_test:
    unless $P526, loop1215_done
    shift $P530, $P526
  loop1215_redo:
    .const 'Sub' $P1213 = "31_1308206292.0457" 
    capture_lex $P1213
    $P1213($P530)
  loop1215_next:
    goto loop1215_test
  loop1215_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P536, exception, 'type'
    eq $P536, .CONTROL_LOOP_NEXT, loop1215_next
    eq $P536, .CONTROL_LOOP_REDO, loop1215_redo
  loop1215_done:
    pop_eh 
  for_undef_160:
.annotate 'line', 555
    .return ($P526)
  control_1208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P537, exception, "payload"
    .return ($P537)
.end


.namespace ["POST";"Compiler"]
.sub "_block1212"  :anon :subid("31_1308206292.0457") :outer("30_1308206292.0457")
    .param pmc param_1214
.annotate 'line', 556
    .lex "$_", param_1214
.annotate 'line', 557
    find_lex $P531, "self"
    find_lex $P532, "$_"
    find_lex $P533, "%context"
    $P534 = $P531."to_pbc"($P532, $P533)
.annotate 'line', 556
    .return ($P534)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("32_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Label"],_)
    .param pmc param_1219
    .param pmc param_1220
.annotate 'line', 561
    .const 'Sub' $P1228 = "33_1308206292.0457" 
    capture_lex $P1228
    new $P1218, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1218, control_1217
    push_eh $P1218
    .lex "self", self
    .lex "$l", param_1219
    .lex "%context", param_1220
.annotate 'line', 562
    new $P538, "Undef"
    set $P1221, $P538
    .lex "$bc", $P1221
.annotate 'line', 565
    new $P539, "Undef"
    set $P1222, $P539
    .lex "$pos", $P1222
.annotate 'line', 562
    find_lex $P1223, "%context"
    unless_null $P1223, vivify_161
    $P1223 = root_new ['parrot';'Hash']
  vivify_161:
    set $P540, $P1223["bytecode"]
    unless_null $P540, vivify_162
    new $P540, "Undef"
  vivify_162:
    store_lex "$bc", $P540
.annotate 'line', 563
    find_lex $P541, "$l"
    $P542 = $P541."declared"()
    if $P542, unless_1224_end
    find_lex $P543, "self"
    $P543."panic"("Trying to emit undelcared label!")
  unless_1224_end:
.annotate 'line', 565
    find_lex $P544, "$bc"
    set $N545, $P544
    new $P546, 'Float'
    set $P546, $N545
    store_lex "$pos", $P546
.annotate 'line', 566
    find_lex $P1226, "%context"
    unless_null $P1226, vivify_163
    $P1226 = root_new ['parrot';'Hash']
  vivify_163:
    set $P547, $P1226["DEBUG"]
    unless_null $P547, vivify_164
    new $P547, "Undef"
  vivify_164:
    unless $P547, if_1225_end
    find_lex $P548, "self"
    new $P549, 'String'
    set $P549, "Declare label '"
    find_lex $P550, "$l"
    $P551 = $P550."name"()
    set $S552, $P551
    concat $P553, $P549, $S552
    concat $P554, $P553, "' at "
    find_lex $P555, "$pos"
    concat $P556, $P554, $P555
    $P548."debug"($P556)
  if_1225_end:
.annotate 'line', 568
    find_lex $P557, "$l"
    find_lex $P558, "$pos"
    $P557."position"($P558)
.annotate 'line', 570
    find_lex $P560, "$l"
    $P561 = $P560."list"()
    defined $I562, $P561
    unless $I562, for_undef_165
    iter $P559, $P561
    new $P568, 'ExceptionHandler'
    set_label $P568, loop1230_handler
    $P568."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P568
  loop1230_test:
    unless $P559, loop1230_done
    shift $P563, $P559
  loop1230_redo:
    .const 'Sub' $P1228 = "33_1308206292.0457" 
    capture_lex $P1228
    $P1228($P563)
  loop1230_next:
    goto loop1230_test
  loop1230_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P569, exception, 'type'
    eq $P569, .CONTROL_LOOP_NEXT, loop1230_next
    eq $P569, .CONTROL_LOOP_REDO, loop1230_redo
  loop1230_done:
    pop_eh 
  for_undef_165:
.annotate 'line', 561
    .return ($P559)
  control_1217:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P570, exception, "payload"
    .return ($P570)
.end


.namespace ["POST";"Compiler"]
.sub "_block1227"  :anon :subid("33_1308206292.0457") :outer("32_1308206292.0457")
    .param pmc param_1229
.annotate 'line', 570
    .lex "$_", param_1229
.annotate 'line', 571
    find_lex $P564, "self"
    find_lex $P565, "$_"
    find_lex $P566, "%context"
    $P567 = $P564."to_pbc"($P565, $P566)
.annotate 'line', 570
    .return ($P567)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("34_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Call"],_)
    .param pmc param_1234
    .param pmc param_1235
.annotate 'line', 575
    .const 'Sub' $P1252 = "35_1308206292.0457" 
    capture_lex $P1252
    new $P1233, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1233, control_1232
    push_eh $P1233
    .lex "self", self
    .lex "$call", param_1234
    .lex "%context", param_1235
.annotate 'line', 576
    new $P571, "Undef"
    set $P1236, $P571
    .lex "$bc", $P1236
.annotate 'line', 577
    new $P572, "Undef"
    set $P1237, $P572
    .lex "$calltype", $P1237
.annotate 'line', 578
    new $P573, "Undef"
    set $P1238, $P573
    .lex "$is_tailcall", $P1238
.annotate 'line', 576
    find_lex $P1239, "%context"
    unless_null $P1239, vivify_166
    $P1239 = root_new ['parrot';'Hash']
  vivify_166:
    set $P574, $P1239["bytecode"]
    unless_null $P574, vivify_167
    new $P574, "Undef"
  vivify_167:
    store_lex "$bc", $P574
.annotate 'line', 577
    find_lex $P575, "$call"
    $P576 = $P575."calltype"()
    store_lex "$calltype", $P576
.annotate 'line', 578
    find_lex $P577, "$calltype"
    set $S578, $P577
    iseq $I579, $S578, "tailcall"
    new $P580, 'Integer'
    set $P580, $I579
    store_lex "$is_tailcall", $P580
.annotate 'line', 580
    find_lex $P583, "$calltype"
    set $S584, $P583
    iseq $I585, $S584, "call"
    unless $I585, unless_1241
    new $P582, 'Integer'
    set $P582, $I585
    goto unless_1241_end
  unless_1241:
    find_lex $P586, "$calltype"
    set $S587, $P586
    iseq $I588, $S587, "tailcall"
    new $P582, 'Integer'
    set $P582, $I588
  unless_1241_end:
    if $P582, if_1240
.annotate 'line', 658
    find_lex $P728, "$calltype"
    set $S729, $P728
    iseq $I730, $S729, "return"
    if $I730, if_1291
.annotate 'line', 662
    find_lex $P738, "$calltype"
    set $S739, $P738
    iseq $I740, $S739, "results"
    if $I740, if_1293
.annotate 'line', 667
    find_lex $P745, "self"
    new $P746, 'String'
    set $P746, "NYI "
    find_lex $P747, "$calltype"
    set $S748, $P747
    concat $P749, $P746, $S748
    $P750 = $P745."panic"($P749)
.annotate 'line', 666
    set $P737, $P750
.annotate 'line', 662
    goto if_1293_end
  if_1293:
.annotate 'line', 664
    find_lex $P741, "self"
    find_lex $P1294, "$call"
    unless_null $P1294, vivify_168
    $P1294 = root_new ['parrot';'Hash']
  vivify_168:
    set $P742, $P1294["params"]
    unless_null $P742, vivify_169
    new $P742, "Undef"
  vivify_169:
    find_lex $P743, "%context"
    $P744 = $P741."build_pcc_call"("get_results_pc", $P742, $P743)
.annotate 'line', 662
    set $P737, $P744
  if_1293_end:
    set $P727, $P737
.annotate 'line', 658
    goto if_1291_end
  if_1291:
.annotate 'line', 659
    find_lex $P731, "self"
    find_lex $P1292, "$call"
    unless_null $P1292, vivify_170
    $P1292 = root_new ['parrot';'Hash']
  vivify_170:
    set $P732, $P1292["params"]
    unless_null $P732, vivify_171
    new $P732, "Undef"
  vivify_171:
    find_lex $P733, "%context"
    $P731."build_pcc_call"("set_returns_pc", $P732, $P733)
.annotate 'line', 660
    find_lex $P734, "$bc"
    new $P735, "ResizablePMCArray"
    push $P735, "returncc"
    $P736 = $P734."push"($P735)
.annotate 'line', 658
    set $P727, $P736
  if_1291_end:
    set $P581, $P727
.annotate 'line', 580
    goto if_1240_end
  if_1240:
.annotate 'line', 581
    find_lex $P589, "$call"
    $P590 = $P589."invocant"()
    unless $P590, if_1242_end
.annotate 'line', 582
    find_lex $P1244, "$call"
    unless_null $P1244, vivify_172
    $P1244 = root_new ['parrot';'Hash']
  vivify_172:
    set $P591, $P1244["params"]
    unless_null $P591, vivify_173
    new $P591, "Undef"
  vivify_173:
    if $P591, unless_1243_end
    $P592 = "list"()
    find_lex $P1245, "$call"
    unless_null $P1245, vivify_174
    $P1245 = root_new ['parrot';'Hash']
    store_lex "$call", $P1245
  vivify_174:
    set $P1245["params"], $P592
  unless_1243_end:
.annotate 'line', 583
    find_lex $P1246, "$call"
    unless_null $P1246, vivify_175
    $P1246 = root_new ['parrot';'Hash']
  vivify_175:
    set $P593, $P1246["params"]
    unless_null $P593, vivify_176
    new $P593, "Undef"
  vivify_176:
    find_lex $P594, "$call"
    $P595 = $P594."invocant"()
    $P593."unshift"($P595)
  if_1242_end:
.annotate 'line', 586
    find_lex $P596, "self"
    find_lex $P1247, "$call"
    unless_null $P1247, vivify_177
    $P1247 = root_new ['parrot';'Hash']
  vivify_177:
    set $P597, $P1247["params"]
    unless_null $P597, vivify_178
    new $P597, "Undef"
  vivify_178:
    find_lex $P598, "%context"
    $P596."build_pcc_call"("set_args_pc", $P597, $P598)
.annotate 'line', 588
    find_lex $P599, "$call"
    $P600 = $P599."invocant"()
    if $P600, if_1248
.annotate 'line', 602
    .const 'Sub' $P1252 = "35_1308206292.0457" 
    capture_lex $P1252
    $P1252()
    goto if_1248_end
  if_1248:
.annotate 'line', 589
    find_lex $P601, "$call"
    $P602 = $P601."name"()
    get_hll_global $P603, ["POST"], "Constant"
    $P604 = $P602."isa"($P603)
    if $P604, if_1249
.annotate 'line', 599
    find_lex $P621, "self"
    $P621."panic"("NYI $P0.$S0()")
.annotate 'line', 598
    goto if_1249_end
  if_1249:
.annotate 'line', 590
    find_lex $P605, "$bc"
.annotate 'line', 592
    find_lex $P607, "$is_tailcall"
    if $P607, if_1250
    new $P609, "String"
    assign $P609, "callmethodcc_p_sc"
    set $P606, $P609
    goto if_1250_end
  if_1250:
    new $P608, "String"
    assign $P608, "tailcallmethod_p_sc"
    set $P606, $P608
  if_1250_end:
.annotate 'line', 594
    find_lex $P610, "self"
    find_lex $P611, "$call"
    $P612 = $P611."invocant"()
    find_lex $P613, "%context"
    $P614 = $P610."to_op"($P612, $P613)
.annotate 'line', 595
    find_lex $P615, "self"
    find_lex $P616, "$call"
    $P617 = $P616."name"()
    find_lex $P618, "%context"
    $P619 = $P615."to_op"($P617, $P618)
    new $P620, "ResizablePMCArray"
    push $P620, $P606
    push $P620, $P614
    push $P620, $P619
    $P605."push"($P620)
  if_1249_end:
  if_1248_end:
.annotate 'line', 654
    find_lex $P722, "$is_tailcall"
    unless $P722, unless_1289
    set $P721, $P722
    goto unless_1289_end
  unless_1289:
.annotate 'line', 655
    find_lex $P723, "self"
    find_lex $P1290, "$call"
    unless_null $P1290, vivify_208
    $P1290 = root_new ['parrot';'Hash']
  vivify_208:
    set $P724, $P1290["results"]
    unless_null $P724, vivify_209
    new $P724, "Undef"
  vivify_209:
    find_lex $P725, "%context"
    $P726 = $P723."build_pcc_call"("get_results_pc", $P724, $P725)
.annotate 'line', 654
    set $P721, $P726
  unless_1289_end:
.annotate 'line', 580
    set $P581, $P721
  if_1240_end:
.annotate 'line', 575
    .return ($P581)
  control_1232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P751, exception, "payload"
    .return ($P751)
.end


.namespace ["POST";"Compiler"]
.sub "_block1251"  :anon :subid("35_1308206292.0457") :outer("34_1308206292.0457")
.annotate 'line', 602
    .const 'Sub' $P1258 = "36_1308206292.0457" 
    capture_lex $P1258
.annotate 'line', 603
    new $P622, "Undef"
    set $P1253, $P622
    .lex "$SUB", $P1253
.annotate 'line', 604
    new $P623, "Undef"
    set $P1254, $P623
    .lex "$processed", $P1254
.annotate 'line', 648
    new $P624, "Undef"
    set $P1255, $P624
    .lex "$o", $P1255
.annotate 'line', 602
    find_lex $P625, "$SUB"
.annotate 'line', 604
    new $P626, "Integer"
    assign $P626, 0
    store_lex "$processed", $P626
.annotate 'line', 605
    find_lex $P627, "$call"
    $P628 = $P627."name"()
    get_hll_global $P629, ["POST"], "Constant"
    $P630 = $P628."isa"($P629)
    unless $P630, if_1256_end
    .const 'Sub' $P1258 = "36_1308206292.0457" 
    capture_lex $P1258
    $P1258()
  if_1256_end:
.annotate 'line', 633
    find_lex $P682, "$processed"
    if $P682, unless_1278_end
.annotate 'line', 634
    find_lex $P683, "$call"
    $P684 = $P683."name"()
    get_hll_global $P685, ["POST"], "Constant"
    $P686 = $P684."isa"($P685)
    if $P686, if_1279
.annotate 'line', 643
    find_lex $P1283, "%context"
    unless_null $P1283, vivify_196
    $P1283 = root_new ['parrot';'Hash']
  vivify_196:
    set $P699, $P1283["DEBUG"]
    unless_null $P699, vivify_197
    new $P699, "Undef"
  vivify_197:
    unless $P699, if_1282_end
    find_lex $P700, "self"
    new $P701, "String"
    assign $P701, "Name is "
    find_lex $P1284, "$call"
    unless_null $P1284, vivify_198
    $P1284 = root_new ['parrot';'Hash']
  vivify_198:
    set $P702, $P1284["name"]
    unless_null $P702, vivify_199
    new $P702, "Undef"
  vivify_199:
    $S703 = $P702."WHAT"()
    concat $P704, $P701, $S703
    $P700."debug"($P704)
  if_1282_end:
.annotate 'line', 644
    find_lex $P1285, "$call"
    unless_null $P1285, vivify_200
    $P1285 = root_new ['parrot';'Hash']
  vivify_200:
    set $P705, $P1285["name"]
    unless_null $P705, vivify_201
    new $P705, "Undef"
  vivify_201:
    store_lex "$SUB", $P705
.annotate 'line', 642
    goto if_1279_end
  if_1279:
.annotate 'line', 635
    find_lex $P1280, "%context"
    unless_null $P1280, vivify_202
    $P1280 = root_new ['parrot';'Hash']
  vivify_202:
    set $P687, $P1280["sub"]
    unless_null $P687, vivify_203
    new $P687, "Undef"
  vivify_203:
    $P688 = $P687."symbol"("!SUB")
    store_lex "$SUB", $P688
.annotate 'line', 636
    find_lex $P689, "$bc"
.annotate 'line', 638
    find_lex $P690, "self"
    find_lex $P691, "$SUB"
    find_lex $P692, "%context"
    $P693 = $P690."to_op"($P691, $P692)
.annotate 'line', 639
    find_lex $P694, "self"
    find_lex $P1281, "$call"
    unless_null $P1281, vivify_204
    $P1281 = root_new ['parrot';'Hash']
  vivify_204:
    set $P695, $P1281["name"]
    unless_null $P695, vivify_205
    new $P695, "Undef"
  vivify_205:
    find_lex $P696, "%context"
    $P697 = $P694."to_op"($P695, $P696)
    new $P698, "ResizablePMCArray"
    push $P698, "find_sub_not_null_p_sc"
    push $P698, $P693
    push $P698, $P697
    $P689."push"($P698)
  if_1279_end:
  unless_1278_end:
.annotate 'line', 648
    find_lex $P707, "$is_tailcall"
    if $P707, if_1286
    new $P709, "String"
    assign $P709, "invokecc_p"
    set $P706, $P709
    goto if_1286_end
  if_1286:
    new $P708, "String"
    assign $P708, "tailcall_p"
    set $P706, $P708
  if_1286_end:
    store_lex "$o", $P706
.annotate 'line', 650
    find_lex $P1288, "%context"
    unless_null $P1288, vivify_206
    $P1288 = root_new ['parrot';'Hash']
  vivify_206:
    set $P710, $P1288["DEBUG"]
    unless_null $P710, vivify_207
    new $P710, "Undef"
  vivify_207:
    unless $P710, if_1287_end
    find_lex $P711, "self"
    find_lex $P712, "$o"
    $P711."debug"($P712)
  if_1287_end:
.annotate 'line', 651
    find_lex $P713, "$bc"
    find_lex $P714, "$o"
    find_lex $P715, "self"
    find_lex $P716, "$SUB"
    find_lex $P717, "%context"
    $P718 = $P715."to_op"($P716, $P717)
    new $P719, "ResizablePMCArray"
    push $P719, $P714
    push $P719, $P718
    $P720 = $P713."push"($P719)
.annotate 'line', 602
    .return ($P720)
.end


.namespace ["POST";"Compiler"]
.sub "_block1257"  :anon :subid("36_1308206292.0457") :outer("35_1308206292.0457")
.annotate 'line', 605
    .const 'Sub' $P1271 = "37_1308206292.0457" 
    capture_lex $P1271
.annotate 'line', 608
    new $P631, "Undef"
    set $P1259, $P631
    .lex "$full_name", $P1259
.annotate 'line', 611
    new $P632, "Undef"
    set $P1260, $P632
    .lex "$invocable_sub", $P1260
.annotate 'line', 605
    find_lex $P633, "$full_name"
.annotate 'line', 609
    find_lex $P1262, "%context"
    unless_null $P1262, vivify_179
    $P1262 = root_new ['parrot';'Hash']
  vivify_179:
    set $P634, $P1262["sub"]
    unless_null $P634, vivify_180
    new $P634, "Undef"
  vivify_180:
    $P635 = $P634."namespace"()
    unless $P635, if_1261_end
    find_lex $P1263, "%context"
    unless_null $P1263, vivify_181
    $P1263 = root_new ['parrot';'Hash']
  vivify_181:
    set $P636, $P1263["sub"]
    unless_null $P636, vivify_182
    new $P636, "Undef"
  vivify_182:
    $P637 = $P636."namespace"()
    $P638 = $P637."Str"()
    store_lex "$full_name", $P638
  if_1261_end:
.annotate 'line', 610
    find_lex $P639, "$full_name"
    set $S640, $P639
    new $P641, 'String'
    set $P641, $S640
    find_lex $P1264, "$call"
    unless_null $P1264, vivify_183
    $P1264 = root_new ['parrot';'Hash']
  vivify_183:
    set $P1265, $P1264["name"]
    unless_null $P1265, vivify_184
    $P1265 = root_new ['parrot';'Hash']
  vivify_184:
    set $P642, $P1265["value"]
    unless_null $P642, vivify_185
    new $P642, "Undef"
  vivify_185:
    set $S643, $P642
    concat $P644, $P641, $S643
    store_lex "$full_name", $P644
.annotate 'line', 611
    find_lex $P1266, "%context"
    unless_null $P1266, vivify_186
    $P1266 = root_new ['parrot';'Hash']
  vivify_186:
    set $P645, $P1266["pir_file"]
    unless_null $P645, vivify_187
    new $P645, "Undef"
  vivify_187:
    find_lex $P646, "$full_name"
    $P647 = $P645."sub"($P646)
    store_lex "$invocable_sub", $P647
.annotate 'line', 612
    find_lex $P1268, "%context"
    unless_null $P1268, vivify_188
    $P1268 = root_new ['parrot';'Hash']
  vivify_188:
    set $P648, $P1268["DEBUG"]
    unless_null $P648, vivify_189
    new $P648, "Undef"
  vivify_189:
    unless $P648, if_1267_end
    find_lex $P649, "self"
    new $P650, 'String'
    set $P650, "invocable_sub '"
    find_lex $P651, "$full_name"
    concat $P652, $P650, $P651
    concat $P653, $P652, "'"
    $P649."debug"($P653)
  if_1267_end:
.annotate 'line', 613
    find_lex $P655, "$invocable_sub"
    if $P655, if_1269
    set $P654, $P655
    goto if_1269_end
  if_1269:
    .const 'Sub' $P1271 = "37_1308206292.0457" 
    capture_lex $P1271
    $P681 = $P1271()
    set $P654, $P681
  if_1269_end:
.annotate 'line', 605
    .return ($P654)
.end


.namespace ["POST";"Compiler"]
.sub "_block1270"  :anon :subid("37_1308206292.0457") :outer("36_1308206292.0457")
.annotate 'line', 614
    new $P656, "Undef"
    set $P1272, $P656
    .lex "$idx", $P1272
    find_lex $P657, "$invocable_sub"
    $P658 = $P657."constant_index"()
    store_lex "$idx", $P658
.annotate 'line', 615
    find_lex $P659, "$idx"
    $P660 = "defined"($P659)
    if $P660, unless_1273_end
.annotate 'line', 617
    find_lex $P1274, "%context"
    unless_null $P1274, vivify_190
    $P1274 = root_new ['parrot';'Hash']
  vivify_190:
    set $P661, $P1274["constants"]
    unless_null $P661, vivify_191
    new $P661, "Undef"
  vivify_191:
    $P662 = "new"("Integer")
    $P663 = $P661."push"($P662)
    store_lex "$idx", $P663
.annotate 'line', 618
    find_lex $P664, "$invocable_sub"
    find_lex $P665, "$idx"
    $P664."constant_index"($P665)
.annotate 'line', 619
    find_lex $P1276, "%context"
    unless_null $P1276, vivify_192
    $P1276 = root_new ['parrot';'Hash']
  vivify_192:
    set $P666, $P1276["DEBUG"]
    unless_null $P666, vivify_193
    new $P666, "Undef"
  vivify_193:
    unless $P666, if_1275_end
    find_lex $P667, "self"
    new $P668, 'String'
    set $P668, "Allocate constant for it "
    find_lex $P669, "$idx"
    concat $P670, $P668, $P669
    $P667."debug"($P670)
  if_1275_end:
  unless_1273_end:
.annotate 'line', 622
    find_lex $P1277, "%context"
    unless_null $P1277, vivify_194
    $P1277 = root_new ['parrot';'Hash']
  vivify_194:
    set $P671, $P1277["sub"]
    unless_null $P671, vivify_195
    new $P671, "Undef"
  vivify_195:
    $P672 = $P671."symbol"("!SUB")
    store_lex "$SUB", $P672
.annotate 'line', 623
    find_lex $P673, "$bc"
.annotate 'line', 625
    find_lex $P674, "self"
    find_lex $P675, "$SUB"
    find_lex $P676, "%context"
    $P677 = $P674."to_op"($P675, $P676)
    find_lex $P678, "$idx"
    new $P679, "ResizablePMCArray"
    push $P679, "set_p_pc"
    push $P679, $P677
    push $P679, $P678
.annotate 'line', 626
    $P673."push"($P679)
.annotate 'line', 629
    new $P680, "Integer"
    assign $P680, 1
    store_lex "$processed", $P680
.annotate 'line', 613
    .return ($P680)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Key"],_)
    .param pmc param_1298
    .param pmc param_1299
.annotate 'line', 674
    new $P1297, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1297, control_1296
    push_eh $P1297
    .lex "self", self
    .lex "$key", param_1298
    .lex "%context", param_1299
.annotate 'line', 677
    new $P752, "Undef"
    set $P1300, $P752
    .lex "$key_pmc", $P1300
.annotate 'line', 683
    new $P753, "Undef"
    set $P1301, $P753
    .lex "$constants", $P1301
.annotate 'line', 684
    new $P754, "Undef"
    set $P1302, $P754
    .lex "$idx", $P1302
.annotate 'line', 676
    find_lex $P1304, "%context"
    unless_null $P1304, vivify_210
    $P1304 = root_new ['parrot';'Hash']
  vivify_210:
    set $P755, $P1304["DEBUG"]
    unless_null $P755, vivify_211
    new $P755, "Undef"
  vivify_211:
    unless $P755, if_1303_end
    find_lex $P756, "self"
    $P756."debug"("Want key")
  if_1303_end:
.annotate 'line', 677
    find_lex $P757, "$key"
    find_lex $P758, "%context"
    $P759 = $P757."to_pmc"($P758)
    set $P760, $P759[0]
    unless_null $P760, vivify_212
    new $P760, "Undef"
  vivify_212:
    store_lex "$key_pmc", $P760
.annotate 'line', 678
    find_lex $P1306, "%context"
    unless_null $P1306, vivify_213
    $P1306 = root_new ['parrot';'Hash']
  vivify_213:
    set $P761, $P1306["DEBUG"]
    unless_null $P761, vivify_214
    new $P761, "Undef"
  vivify_214:
    unless $P761, if_1305_end
    find_lex $P762, "self"
    $P762."debug"("Got key")
  if_1305_end:
.annotate 'line', 683
    find_lex $P1307, "%context"
    unless_null $P1307, vivify_215
    $P1307 = root_new ['parrot';'Hash']
  vivify_215:
    set $P763, $P1307["constants"]
    unless_null $P763, vivify_216
    new $P763, "Undef"
  vivify_216:
    store_lex "$constants", $P763
    find_lex $P764, "$idx"
.annotate 'line', 685

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
    find_lex $P765, "$idx"
.annotate 'line', 674
    .return ($P765)
  control_1296:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P766, exception, "payload"
    .return ($P766)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("39_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Constant"],_)
    .param pmc param_1311
    .param pmc param_1312
.annotate 'line', 701
    new $P1310, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1310, control_1309
    push_eh $P1310
    .lex "self", self
    .lex "$op", param_1311
    .lex "%context", param_1312
.annotate 'line', 702
    new $P767, "Undef"
    set $P1313, $P767
    .lex "$idx", $P1313
.annotate 'line', 703
    new $P768, "Undef"
    set $P1314, $P768
    .lex "$type", $P1314
.annotate 'line', 701
    find_lex $P769, "$idx"
.annotate 'line', 703
    find_lex $P770, "$op"
    $P771 = $P770."type"()
    store_lex "$type", $P771
.annotate 'line', 704
    find_lex $P773, "$type"
    set $S774, $P773
    iseq $I775, $S774, "ic"
    unless $I775, unless_1316
    new $P772, 'Integer'
    set $P772, $I775
    goto unless_1316_end
  unless_1316:
    find_lex $P776, "$type"
    set $S777, $P776
    iseq $I778, $S777, "kic"
    new $P772, 'Integer'
    set $P772, $I778
  unless_1316_end:
    if $P772, if_1315
.annotate 'line', 707
    find_lex $P781, "$type"
    set $S782, $P781
    iseq $I783, $S782, "nc"
    if $I783, if_1317
.annotate 'line', 711
    find_lex $P788, "self"
    $P788."panic"("NYI")
.annotate 'line', 710
    goto if_1317_end
  if_1317:
.annotate 'line', 708
    find_lex $P1318, "%context"
    unless_null $P1318, vivify_217
    $P1318 = root_new ['parrot';'Hash']
  vivify_217:
    set $P784, $P1318["constants"]
    unless_null $P784, vivify_218
    new $P784, "Undef"
  vivify_218:
    find_lex $P785, "$op"
    $P786 = $P785."value"()
    $P787 = $P784."get_or_create_number"($P786)
    store_lex "$idx", $P787
  if_1317_end:
.annotate 'line', 707
    goto if_1315_end
  if_1315:
.annotate 'line', 705
    find_lex $P779, "$op"
    $P780 = $P779."value"()
    store_lex "$idx", $P780
  if_1315_end:
.annotate 'line', 714
    find_lex $P1320, "%context"
    unless_null $P1320, vivify_219
    $P1320 = root_new ['parrot';'Hash']
  vivify_219:
    set $P789, $P1320["DEBUG"]
    unless_null $P789, vivify_220
    new $P789, "Undef"
  vivify_220:
    unless $P789, if_1319_end
    find_lex $P790, "self"
    new $P791, 'String'
    set $P791, "Index "
    find_lex $P792, "$idx"
    concat $P793, $P791, $P792
    $P790."debug"($P793)
  if_1319_end:
    find_lex $P794, "$idx"
.annotate 'line', 701
    .return ($P794)
  control_1309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P795, exception, "payload"
    .return ($P795)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"String"],_)
    .param pmc param_1324
    .param pmc param_1325
.annotate 'line', 718
    .const 'Sub' $P1333 = "41_1308206292.0457" 
    capture_lex $P1333
    new $P1323, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1323, control_1322
    push_eh $P1323
    .lex "self", self
    .lex "$str", param_1324
    .lex "%context", param_1325
.annotate 'line', 719
    new $P796, "Undef"
    set $P1326, $P796
    .lex "$idx", $P1326
.annotate 'line', 720
    new $P797, "Undef"
    set $P1327, $P797
    .lex "$type", $P1327
.annotate 'line', 718
    find_lex $P798, "$idx"
.annotate 'line', 720
    find_lex $P799, "$str"
    $P800 = $P799."type"()
    store_lex "$type", $P800
.annotate 'line', 721
    find_lex $P801, "$type"
    set $S802, $P801
    isne $I803, $S802, "sc"
    unless $I803, if_1328_end
.annotate 'line', 722
    find_lex $P804, "self"
    $P804."panic"("attempt to pass a non-sc value off as a string")
  if_1328_end:
.annotate 'line', 724
    find_lex $P806, "$str"
    $S807 = $P806."encoding"()
    iseq $I808, $S807, "fixed_8"
    if $I808, if_1330
    new $P805, 'Integer'
    set $P805, $I808
    goto if_1330_end
  if_1330:
    find_lex $P809, "$str"
    $S810 = $P809."charset"()
    iseq $I811, $S810, "ascii"
    new $P805, 'Integer'
    set $P805, $I811
  if_1330_end:
    if $P805, if_1329
.annotate 'line', 727
    .const 'Sub' $P1333 = "41_1308206292.0457" 
    capture_lex $P1333
    $P1333()
    goto if_1329_end
  if_1329:
.annotate 'line', 725
    find_lex $P1331, "%context"
    unless_null $P1331, vivify_223
    $P1331 = root_new ['parrot';'Hash']
  vivify_223:
    set $P812, $P1331["constants"]
    unless_null $P812, vivify_224
    new $P812, "Undef"
  vivify_224:
    find_lex $P813, "$str"
    $P814 = $P813."value"()
    $P815 = $P812."get_or_create_string"($P814)
    store_lex "$idx", $P815
  if_1329_end:
.annotate 'line', 724
    find_lex $P827, "$idx"
.annotate 'line', 718
    .return ($P827)
  control_1322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P828, exception, "payload"
    .return ($P828)
.end


.namespace ["POST";"Compiler"]
.sub "_block1332"  :anon :subid("41_1308206292.0457") :outer("40_1308206292.0457")
.annotate 'line', 729
    new $P816, "Undef"
    set $P1334, $P816
    .lex "$bb", $P1334
.annotate 'line', 730
    new $P817, "Undef"
    set $P1335, $P817
    .lex "$str_val", $P1335
.annotate 'line', 729
    $P818 = "new"("ByteBuffer")
    store_lex "$bb", $P818
.annotate 'line', 730
    find_lex $P819, "$str"
    $P820 = $P819."value"()
    store_lex "$str_val", $P820
.annotate 'line', 731

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 739
    find_lex $P1336, "%context"
    unless_null $P1336, vivify_221
    $P1336 = root_new ['parrot';'Hash']
  vivify_221:
    set $P821, $P1336["constants"]
    unless_null $P821, vivify_222
    new $P821, "Undef"
  vivify_222:
    find_lex $P822, "$bb"
.annotate 'line', 740
    find_lex $P823, "$str"
    $P824 = $P823."encoding"()
    $P825 = $P822."get_string"($P824)
.annotate 'line', 739
    $P826 = $P821."get_or_create_string"($P825)
    store_lex "$idx", $P826
.annotate 'line', 727
    .return ($P826)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("42_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Value"],_)
    .param pmc param_1340
    .param pmc param_1341
.annotate 'line', 747
    new $P1339, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1339, control_1338
    push_eh $P1339
    .lex "self", self
    .lex "$val", param_1340
    .lex "%context", param_1341
.annotate 'line', 749
    new $P829, "Undef"
    set $P1342, $P829
    .lex "$orig", $P1342
    find_lex $P830, "self"
    find_lex $P831, "$val"
    $P832 = $P831."name"()
    find_lex $P833, "%context"
    $P834 = $P830."get_register"($P832, $P833)
    store_lex "$orig", $P834
.annotate 'line', 750
    find_lex $P835, "self"
    find_lex $P836, "$orig"
    find_lex $P837, "%context"
    $P838 = $P835."to_op"($P836, $P837)
.annotate 'line', 747
    .return ($P838)
  control_1338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P839, exception, "payload"
    .return ($P839)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("43_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Register"],_)
    .param pmc param_1346
    .param pmc param_1347
.annotate 'line', 753
    new $P1345, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1345, control_1344
    push_eh $P1345
    .lex "self", self
    .lex "$reg", param_1346
    .lex "%context", param_1347
.annotate 'line', 754
    find_lex $P840, "$reg"
    $P841 = $P840."regno"()
.annotate 'line', 753
    .return ($P841)
  control_1344:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P842, exception, "payload"
    .return ($P842)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("44_1308206292.0457") :method :outer("11_1308206292.0457") :multi(_,["POST";"Label"],_)
    .param pmc param_1351
    .param pmc param_1352
.annotate 'line', 757
    new $P1350, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1350, control_1349
    push_eh $P1350
    .lex "self", self
    .lex "$l", param_1351
    .lex "%context", param_1352
.annotate 'line', 759
    new $P843, "Undef"
    set $P1353, $P843
    .lex "$bc", $P1353
.annotate 'line', 760
    new $P844, "Undef"
    set $P1354, $P844
    .lex "$pos", $P1354
.annotate 'line', 759
    find_lex $P1355, "%context"
    unless_null $P1355, vivify_225
    $P1355 = root_new ['parrot';'Hash']
  vivify_225:
    set $P845, $P1355["bytecode"]
    unless_null $P845, vivify_226
    new $P845, "Undef"
  vivify_226:
    store_lex "$bc", $P845
.annotate 'line', 760
    find_lex $P846, "$bc"
    set $N847, $P846
    new $P848, 'Float'
    set $P848, $N847
    store_lex "$pos", $P848
.annotate 'line', 764
    find_lex $P849, "$l"
    $P850 = $P849."name"()
.annotate 'line', 763
    find_lex $P1356, "%context"
    unless_null $P1356, vivify_227
    $P1356 = root_new ['parrot';'Hash']
  vivify_227:
    set $P851, $P1356["opcode_offset"]
    unless_null $P851, vivify_228
    new $P851, "Undef"
  vivify_228:
    find_lex $P1357, "%context"
    unless_null $P1357, vivify_229
    $P1357 = root_new ['parrot';'Hash']
  vivify_229:
    set $P852, $P1357["opcode_fullname"]
    unless_null $P852, vivify_230
    new $P852, "Undef"
  vivify_230:
    $P853 = "hash"($P850 :named("name"), $P851 :named("offset"), $P852 :named("opname"))
    find_lex $P854, "$pos"
    find_lex $P1358, "%context"
    unless_null $P1358, vivify_231
    $P1358 = root_new ['parrot';'Hash']
    store_lex "%context", $P1358
  vivify_231:
    set $P1359, $P1358["labels_todo"]
    unless_null $P1359, vivify_232
    $P1359 = root_new ['parrot';'Hash']
    set $P1358["labels_todo"], $P1359
  vivify_232:
    set $P1359[$P854], $P853
.annotate 'line', 769
    find_lex $P1361, "%context"
    unless_null $P1361, vivify_233
    $P1361 = root_new ['parrot';'Hash']
  vivify_233:
    set $P855, $P1361["DEBUG"]
    unless_null $P855, vivify_234
    new $P855, "Undef"
  vivify_234:
    unless $P855, if_1360_end
    find_lex $P856, "self"
    new $P857, 'String'
    set $P857, "Todo label '"
    find_lex $P858, "$l"
    $P859 = $P858."name"()
    set $S860, $P859
    concat $P861, $P857, $S860
    concat $P862, $P861, "' at "
    find_lex $P863, "$pos"
    concat $P864, $P862, $P863
    concat $P865, $P864, ", "
    find_lex $P1362, "%context"
    unless_null $P1362, vivify_235
    $P1362 = root_new ['parrot';'Hash']
  vivify_235:
    set $P866, $P1362["opcode_offset"]
    unless_null $P866, vivify_236
    new $P866, "Undef"
  vivify_236:
    set $S867, $P866
    concat $P868, $P865, $S867
    $P856."debug"($P868)
  if_1360_end:
.annotate 'line', 757
    .return (0)
  control_1349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P869, exception, "payload"
    .return ($P869)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("45_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1366
    .param pmc param_1367
    .param pmc param_1368
.annotate 'line', 780
    .const 'Sub' $P1381 = "46_1308206292.0457" 
    capture_lex $P1381
    new $P1365, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1365, control_1364
    push_eh $P1365
    .lex "self", self
    .lex "$opname", param_1366
    .lex "@args", param_1367
    .lex "%context", param_1368
.annotate 'line', 781
    new $P870, "Undef"
    set $P1369, $P870
    .lex "$bc", $P1369
.annotate 'line', 782
    new $P871, "Undef"
    set $P1370, $P871
    .lex "$signature", $P1370
.annotate 'line', 783
    new $P872, "Undef"
    set $P1371, $P872
    .lex "$sig_idx", $P1371
.annotate 'line', 790
    $P1373 = root_new ['parrot';'ResizablePMCArray']
    set $P1372, $P1373
    .lex "@op", $P1372
.annotate 'line', 781
    find_lex $P1374, "%context"
    unless_null $P1374, vivify_237
    $P1374 = root_new ['parrot';'Hash']
  vivify_237:
    set $P873, $P1374["bytecode"]
    unless_null $P873, vivify_238
    new $P873, "Undef"
  vivify_238:
    store_lex "$bc", $P873
.annotate 'line', 782
    find_lex $P874, "self"
    find_lex $P875, "@args"
    find_lex $P876, "%context"
    $P877 = $P874."build_args_signature"($P875, $P876)
    store_lex "$signature", $P877
.annotate 'line', 783
    find_lex $P1375, "%context"
    unless_null $P1375, vivify_239
    $P1375 = root_new ['parrot';'Hash']
  vivify_239:
    set $P878, $P1375["constants"]
    unless_null $P878, vivify_240
    new $P878, "Undef"
  vivify_240:
    find_lex $P879, "$signature"
    $P880 = $P878."get_or_create_pmc"($P879)
    store_lex "$sig_idx", $P880
.annotate 'line', 785
    find_lex $P1377, "%context"
    unless_null $P1377, vivify_241
    $P1377 = root_new ['parrot';'Hash']
  vivify_241:
    set $P881, $P1377["DEBUG"]
    unless_null $P881, vivify_242
    new $P881, "Undef"
  vivify_242:
    unless $P881, if_1376_end
    find_lex $P882, "self"
    new $P883, 'String'
    set $P883, "Sig: "
    find_lex $P884, "$sig_idx"
    concat $P885, $P883, $P884
    $P882."debug"($P885)
  if_1376_end:
.annotate 'line', 787
    find_lex $P1379, "%context"
    unless_null $P1379, vivify_243
    $P1379 = root_new ['parrot';'Hash']
  vivify_243:
    set $P886, $P1379["DEBUG"]
    unless_null $P886, vivify_244
    new $P886, "Undef"
  vivify_244:
    unless $P886, if_1378_end
    find_lex $P887, "self"
    find_lex $P888, "$opname"
    $P887."debug"($P888)
  if_1378_end:
.annotate 'line', 790
    find_lex $P889, "$opname"
    find_lex $P890, "$sig_idx"
    $P891 = "list"($P889, $P890)
    store_lex "@op", $P891
.annotate 'line', 792
    find_lex $P893, "@args"
    defined $I894, $P893
    unless $I894, for_undef_245
    iter $P892, $P893
    new $P916, 'ExceptionHandler'
    set_label $P916, loop1391_handler
    $P916."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P916
  loop1391_test:
    unless $P892, loop1391_done
    shift $P895, $P892
  loop1391_redo:
    .const 'Sub' $P1381 = "46_1308206292.0457" 
    capture_lex $P1381
    $P1381($P895)
  loop1391_next:
    goto loop1391_test
  loop1391_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P917, exception, 'type'
    eq $P917, .CONTROL_LOOP_NEXT, loop1391_next
    eq $P917, .CONTROL_LOOP_REDO, loop1391_redo
  loop1391_done:
    pop_eh 
  for_undef_245:
.annotate 'line', 803
    find_lex $P918, "$bc"
    find_lex $P919, "@op"
    $P920 = $P918."push"($P919)
.annotate 'line', 780
    .return ($P920)
  control_1364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P921, exception, "payload"
    .return ($P921)
.end


.namespace ["POST";"Compiler"]
.sub "_block1380"  :anon :subid("46_1308206292.0457") :outer("45_1308206292.0457")
    .param pmc param_1382
.annotate 'line', 792
    .const 'Sub' $P1385 = "47_1308206292.0457" 
    capture_lex $P1385
    .lex "$arg", param_1382
.annotate 'line', 794
    find_lex $P896, "$arg"
    $P897 = $P896."modifier"()
    isa $I898, $P897, "Hash"
    unless $I898, if_1383_end
    .const 'Sub' $P1385 = "47_1308206292.0457" 
    capture_lex $P1385
    $P1385()
  if_1383_end:
.annotate 'line', 800
    find_lex $P910, "@op"
    find_lex $P911, "self"
    find_lex $P912, "$arg"
    find_lex $P913, "%context"
    $P914 = $P911."to_op"($P912, $P913)
    $P915 = $P910."push"($P914)
.annotate 'line', 792
    .return ($P915)
.end


.namespace ["POST";"Compiler"]
.sub "_block1384"  :anon :subid("47_1308206292.0457") :outer("46_1308206292.0457")
.annotate 'line', 795
    new $P899, "Undef"
    set $P1386, $P899
    .lex "$name", $P1386
    find_lex $P900, "$arg"
    $P901 = $P900."modifier"()
    set $P902, $P901["named"]
    unless_null $P902, vivify_246
    new $P902, "Undef"
  vivify_246:
    set $P1387, $P902
    defined $I1389, $P1387
    if $I1389, default_1388
    find_lex $P903, "$arg"
    $P904 = $P903."name"()
    set $P1387, $P904
  default_1388:
    store_lex "$name", $P1387
.annotate 'line', 796
    find_lex $P905, "@op"
.annotate 'line', 797
    find_lex $P1390, "%context"
    unless_null $P1390, vivify_247
    $P1390 = root_new ['parrot';'Hash']
  vivify_247:
    set $P906, $P1390["constants"]
    unless_null $P906, vivify_248
    new $P906, "Undef"
  vivify_248:
    find_lex $P907, "$name"
    $P908 = $P906."get_or_create_string"($P907)
    $P909 = $P905."push"($P908)
.annotate 'line', 794
    .return ($P909)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("48_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1395
    .param pmc param_1396
.annotate 'line', 806
    .const 'Sub' $P1414 = "51_1308206292.0457" 
    capture_lex $P1414
    .const 'Sub' $P1403 = "49_1308206292.0457" 
    capture_lex $P1403
    new $P1394, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1394, control_1393
    push_eh $P1394
    .lex "self", self
    .lex "@args", param_1395
    .lex "%context", param_1396
.annotate 'line', 807
    $P1398 = root_new ['parrot';'ResizablePMCArray']
    set $P1397, $P1398
    .lex "@sig", $P1397
.annotate 'line', 820
    new $P922, "Undef"
    set $P1399, $P922
    .lex "$elements", $P1399
.annotate 'line', 821
    new $P923, "Undef"
    set $P1400, $P923
    .lex "$signature", $P1400
.annotate 'line', 829
    new $P924, "Undef"
    set $P1401, $P924
    .lex "$idx", $P1401
.annotate 'line', 806
    find_lex $P925, "@sig"
.annotate 'line', 808
    find_lex $P927, "@args"
    defined $I928, $P927
    unless $I928, for_undef_249
    iter $P926, $P927
    new $P950, 'ExceptionHandler'
    set_label $P950, loop1411_handler
    $P950."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P950
  loop1411_test:
    unless $P926, loop1411_done
    shift $P929, $P926
  loop1411_redo:
    .const 'Sub' $P1403 = "49_1308206292.0457" 
    capture_lex $P1403
    $P1403($P929)
  loop1411_next:
    goto loop1411_test
  loop1411_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P951, exception, 'type'
    eq $P951, .CONTROL_LOOP_NEXT, loop1411_next
    eq $P951, .CONTROL_LOOP_REDO, loop1411_redo
  loop1411_done:
    pop_eh 
  for_undef_249:
.annotate 'line', 820
    find_lex $P952, "@sig"
    set $N953, $P952
    new $P954, 'Float'
    set $P954, $N953
    store_lex "$elements", $P954
.annotate 'line', 821

        $P1412 = find_lex '$elements'
        $I99 = $P1412
        $P1412 = find_lex '$signature'
        $P1412 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1412
.annotate 'line', 829
    new $P955, "Integer"
    assign $P955, 0
    store_lex "$idx", $P955
.annotate 'line', 830
    find_lex $P957, "@sig"
    defined $I958, $P957
    unless $I958, for_undef_251
    iter $P956, $P957
    new $P964, 'ExceptionHandler'
    set_label $P964, loop1418_handler
    $P964."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P964
  loop1418_test:
    unless $P956, loop1418_done
    shift $P959, $P956
  loop1418_redo:
    .const 'Sub' $P1414 = "51_1308206292.0457" 
    capture_lex $P1414
    $P1414($P959)
  loop1418_next:
    goto loop1418_test
  loop1418_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P965, exception, 'type'
    eq $P965, .CONTROL_LOOP_NEXT, loop1418_next
    eq $P965, .CONTROL_LOOP_REDO, loop1418_redo
  loop1418_done:
    pop_eh 
  for_undef_251:
    find_lex $P966, "$signature"
.annotate 'line', 806
    .return ($P966)
  control_1393:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P967, exception, "payload"
    .return ($P967)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_block1402"  :anon :subid("49_1308206292.0457") :outer("48_1308206292.0457")
    .param pmc param_1404
.annotate 'line', 808
    .const 'Sub' $P1408 = "50_1308206292.0457" 
    capture_lex $P1408
    .lex "$arg", param_1404
.annotate 'line', 810
    new $P930, "Undef"
    set $P1405, $P930
    .lex "$s", $P1405
    find_lex $P931, "self"
    find_lex $P932, "$arg"
    find_lex $P933, "%context"
    $P934 = $P931."build_single_arg"($P932, $P933)
    store_lex "$s", $P934
.annotate 'line', 811
    find_lex $P936, "$s"
    isa $I937, $P936, "Integer"
    if $I937, if_1406
.annotate 'line', 815
    find_lex $P942, "$s"
    defined $I943, $P942
    unless $I943, for_undef_250
    iter $P941, $P942
    new $P948, 'ExceptionHandler'
    set_label $P948, loop1410_handler
    $P948."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P948
  loop1410_test:
    unless $P941, loop1410_done
    shift $P944, $P941
  loop1410_redo:
    .const 'Sub' $P1408 = "50_1308206292.0457" 
    capture_lex $P1408
    $P1408($P944)
  loop1410_next:
    goto loop1410_test
  loop1410_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P949, exception, 'type'
    eq $P949, .CONTROL_LOOP_NEXT, loop1410_next
    eq $P949, .CONTROL_LOOP_REDO, loop1410_redo
  loop1410_done:
    pop_eh 
  for_undef_250:
.annotate 'line', 814
    set $P935, $P941
.annotate 'line', 811
    goto if_1406_end
  if_1406:
.annotate 'line', 812
    find_lex $P938, "@sig"
    find_lex $P939, "$s"
    $P940 = $P938."push"($P939)
.annotate 'line', 811
    set $P935, $P940
  if_1406_end:
.annotate 'line', 808
    .return ($P935)
.end


.namespace ["POST";"Compiler"]
.sub "_block1407"  :anon :subid("50_1308206292.0457") :outer("49_1308206292.0457")
    .param pmc param_1409
.annotate 'line', 815
    .lex "$_", param_1409
    find_lex $P945, "@sig"
    find_lex $P946, "$_"
    $P947 = $P945."push"($P946)
    .return ($P947)
.end


.namespace ["POST";"Compiler"]
.sub "_block1413"  :anon :subid("51_1308206292.0457") :outer("48_1308206292.0457")
    .param pmc param_1415
.annotate 'line', 830
    .lex "$val", param_1415
.annotate 'line', 831
    find_lex $P960, "$val"
    find_lex $P961, "$idx"
    set $I962, $P961
    find_lex $P1416, "$signature"
    unless_null $P1416, vivify_252
    $P1416 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1416
  vivify_252:
    set $P1416[$I962], $P960
    find_lex $P963, "$idx"
    clone $P1417, $P963
    inc $P963
.annotate 'line', 830
    .return ($P1417)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("52_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1422
    .param pmc param_1423
.annotate 'line', 838
    new $P1421, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1421, control_1420
    push_eh $P1421
    .lex "self", self
    .lex "$arg", param_1422
    .lex "%context", param_1423
.annotate 'line', 841
    new $P968, "Undef"
    set $P1424, $P968
    .lex "$type", $P1424
.annotate 'line', 843
    new $P969, "Undef"
    set $P1425, $P969
    .lex "$res", $P1425
.annotate 'line', 857
    new $P970, "Undef"
    set $P1426, $P970
    .lex "$mod", $P1426
.annotate 'line', 841
    find_lex $P971, "$arg"
    $P972 = $P971."type"()
    set $P1427, $P972
    defined $I1429, $P1427
    if $I1429, default_1428
    find_lex $P973, "self"
    find_lex $P974, "$arg"
    $P975 = $P974."name"()
    find_lex $P976, "%context"
    $P977 = $P973."get_register"($P975, $P976)
    $P978 = $P977."type"()
    set $P1427, $P978
  default_1428:
    store_lex "$type", $P1427
    find_lex $P979, "$res"
.annotate 'line', 846
    find_lex $P980, "$type"
    set $S981, $P980
    iseq $I982, $S981, "i"
    if $I982, if_1430
.annotate 'line', 847
    find_lex $P984, "$type"
    set $S985, $P984
    iseq $I986, $S985, "s"
    if $I986, if_1431
.annotate 'line', 848
    find_lex $P988, "$type"
    set $S989, $P988
    iseq $I990, $S989, "p"
    if $I990, if_1432
.annotate 'line', 849
    find_lex $P992, "$type"
    set $S993, $P992
    iseq $I994, $S993, "n"
    if $I994, if_1433
.annotate 'line', 851
    find_lex $P996, "$type"
    set $S997, $P996
    iseq $I998, $S997, "ic"
    if $I998, if_1434
.annotate 'line', 852
    find_lex $P1436, "$type"
    set $S1437, $P1436
    iseq $I1438, $S1437, "sc"
    if $I1438, if_1435
.annotate 'line', 853
    find_lex $P1442, "$type"
    set $S1443, $P1442
    iseq $I1444, $S1443, "pc"
    if $I1444, if_1441
.annotate 'line', 854
    find_lex $P1448, "$type"
    set $S1449, $P1448
    iseq $I1450, $S1449, "nc"
    if $I1450, if_1447
.annotate 'line', 855
    find_lex $P1453, "self"
    new $P1454, 'String'
    set $P1454, "Unknown arg type '"
    find_lex $P1455, "$type"
    concat $P1456, $P1454, $P1455
    concat $P1457, $P1456, "'"
    $P1453."panic"($P1457)
    goto if_1447_end
  if_1447:
.annotate 'line', 854
    new $P1451, "Integer"
    assign $P1451, 3
    add $P1452, $P1451, 16
    store_lex "$res", $P1452
  if_1447_end:
    goto if_1441_end
  if_1441:
.annotate 'line', 853
    new $P1445, "Integer"
    assign $P1445, 2
    add $P1446, $P1445, 16
    store_lex "$res", $P1446
  if_1441_end:
    goto if_1435_end
  if_1435:
.annotate 'line', 852
    new $P1439, "Integer"
    assign $P1439, 1
    add $P1440, $P1439, 16
    store_lex "$res", $P1440
  if_1435_end:
    goto if_1434_end
  if_1434:
.annotate 'line', 851
    new $P999, "Integer"
    assign $P999, 0
    add $P1000, $P999, 16
    store_lex "$res", $P1000
  if_1434_end:
    goto if_1433_end
  if_1433:
.annotate 'line', 849
    new $P995, "Integer"
    assign $P995, 3
    store_lex "$res", $P995
  if_1433_end:
    goto if_1432_end
  if_1432:
.annotate 'line', 848
    new $P991, "Integer"
    assign $P991, 2
    store_lex "$res", $P991
  if_1432_end:
    goto if_1431_end
  if_1431:
.annotate 'line', 847
    new $P987, "Integer"
    assign $P987, 1
    store_lex "$res", $P987
  if_1431_end:
    goto if_1430_end
  if_1430:
.annotate 'line', 846
    new $P983, "Integer"
    assign $P983, 0
    store_lex "$res", $P983
  if_1430_end:
.annotate 'line', 857
    find_lex $P1458, "$arg"
    $P1459 = $P1458."modifier"()
    store_lex "$mod", $P1459
.annotate 'line', 858
    find_lex $P1461, "$mod"
    unless $P1461, if_1460_end
.annotate 'line', 859
    find_lex $P1463, "$mod"
    isa $I1464, $P1463, "Hash"
    if $I1464, if_1462
.annotate 'line', 864
    find_lex $P1472, "$mod"
    set $S1473, $P1472
    iseq $I1474, $S1473, "slurpy"
    if $I1474, if_1471
.annotate 'line', 865
    find_lex $P1478, "$mod"
    set $S1479, $P1478
    iseq $I1480, $S1479, "flat"
    if $I1480, if_1477
.annotate 'line', 866
    find_lex $P1484, "$mod"
    set $S1485, $P1484
    iseq $I1486, $S1485, "optional"
    if $I1486, if_1483
.annotate 'line', 867
    find_lex $P1490, "$mod"
    set $S1491, $P1490
    iseq $I1492, $S1491, "opt_flag"
    if $I1492, if_1489
.annotate 'line', 868
    find_lex $P1496, "$mod"
    set $S1497, $P1496
    iseq $I1498, $S1497, "slurpy named"
    if $I1498, if_1495
.annotate 'line', 869
    find_lex $P1502, "self"
    new $P1503, 'String'
    set $P1503, "Unsupported modifier "
    find_lex $P1504, "$mod"
    concat $P1505, $P1503, $P1504
    $P1502."panic"($P1505)
    goto if_1495_end
  if_1495:
.annotate 'line', 868
    find_lex $P1499, "$res"
    add $P1500, $P1499, 32
    add $P1501, $P1500, 512
    store_lex "$res", $P1501
  if_1495_end:
    goto if_1489_end
  if_1489:
.annotate 'line', 867
    find_lex $P1493, "$res"
    add $P1494, $P1493, 256
    store_lex "$res", $P1494
  if_1489_end:
    goto if_1483_end
  if_1483:
.annotate 'line', 866
    find_lex $P1487, "$res"
    add $P1488, $P1487, 128
    store_lex "$res", $P1488
  if_1483_end:
    goto if_1477_end
  if_1477:
.annotate 'line', 865
    find_lex $P1481, "$res"
    add $P1482, $P1481, 32
    store_lex "$res", $P1482
  if_1477_end:
    goto if_1471_end
  if_1471:
.annotate 'line', 864
    find_lex $P1475, "$res"
    add $P1476, $P1475, 32
    store_lex "$res", $P1476
  if_1471_end:
    goto if_1462_end
  if_1462:
.annotate 'line', 862
    new $P1465, "Integer"
    assign $P1465, 1
    add $P1466, $P1465, 16
    add $P1467, $P1466, 512
    find_lex $P1468, "$res"
    add $P1469, $P1468, 512
    $P1470 = "list"($P1467, $P1469)
    store_lex "$res", $P1470
  if_1462_end:
  if_1460_end:
.annotate 'line', 858
    find_lex $P1506, "$res"
.annotate 'line', 838
    .return ($P1506)
  control_1420:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1507, exception, "payload"
    .return ($P1507)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("53_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1511
.annotate 'line', 880
    .const 'Sub' $P1518 = "54_1308206292.0457" 
    capture_lex $P1518
    new $P1510, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1510, control_1509
    push_eh $P1510
    .lex "self", self
    .lex "$post", param_1511
.annotate 'line', 881
    find_lex $P1513, "$post"
    $P1514 = $P1513."list"()
    defined $I1515, $P1514
    unless $I1515, for_undef_253
    iter $P1512, $P1514
    new $P1531, 'ExceptionHandler'
    set_label $P1531, loop1530_handler
    $P1531."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1531
  loop1530_test:
    unless $P1512, loop1530_done
    shift $P1516, $P1512
  loop1530_redo:
    .const 'Sub' $P1518 = "54_1308206292.0457" 
    capture_lex $P1518
    $P1518($P1516)
  loop1530_next:
    goto loop1530_test
  loop1530_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1532, exception, 'type'
    eq $P1532, .CONTROL_LOOP_NEXT, loop1530_next
    eq $P1532, .CONTROL_LOOP_REDO, loop1530_redo
  loop1530_done:
    pop_eh 
  for_undef_253:
.annotate 'line', 880
    .return ($P1512)
  control_1509:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1533, exception, "payload"
    .return ($P1533)
.end


.namespace ["POST";"Compiler"]
.sub "_block1517"  :anon :subid("54_1308206292.0457") :outer("53_1308206292.0457")
    .param pmc param_1519
.annotate 'line', 881
    .lex "$sub", param_1519
.annotate 'line', 883
    find_lex $P1522, "$sub"
    get_hll_global $P1523, ["POST"], "Sub"
    $P1524 = $P1522."isa"($P1523)
    if $P1524, if_1521
    set $P1520, $P1524
    goto if_1521_end
  if_1521:
    find_lex $P1525, "$post"
    find_lex $P1526, "$sub"
    $P1527 = $P1526."full_name"()
    find_lex $P1528, "$sub"
    $P1529 = $P1525."sub"($P1527, $P1528)
    set $P1520, $P1529
  if_1521_end:
.annotate 'line', 881
    .return ($P1520)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("55_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1537
    .param pmc param_1538
.annotate 'line', 888
    new $P1536, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1536, control_1535
    push_eh $P1536
    .lex "self", self
    .lex "$sub", param_1537
    .lex "%context", param_1538
.annotate 'line', 896
    new $P1540, "Undef"
    set $P1539, $P1540
    .lex "$res", $P1539
    new $P1541, "Integer"
    assign $P1541, 0
    store_lex "$res", $P1541
.annotate 'line', 897
    find_lex $P1542, "$res"
    new $P1543, "Integer"
    assign $P1543, 1
    find_lex $P1544, "$sub"
    $N1545 = $P1544."outer"()
    mul $P1546, $P1543, $N1545
    add $P1547, $P1542, $P1546
    store_lex "$res", $P1547
.annotate 'line', 898
    find_lex $P1548, "$res"
    new $P1549, "Integer"
    assign $P1549, 8
    find_lex $P1550, "$sub"
    $N1551 = $P1550."anon"()
    mul $P1552, $P1549, $N1551
    add $P1553, $P1548, $P1552
    store_lex "$res", $P1553
.annotate 'line', 899
    find_lex $P1554, "$res"
    new $P1555, "Integer"
    assign $P1555, 16
    find_lex $P1556, "$sub"
    $N1557 = $P1556."main"()
    mul $P1558, $P1555, $N1557
    add $P1559, $P1554, $P1558
    store_lex "$res", $P1559
.annotate 'line', 900
    find_lex $P1560, "$res"
    new $P1561, "Integer"
    assign $P1561, 32
    find_lex $P1562, "$sub"
    $N1563 = $P1562."load"()
    mul $P1564, $P1561, $N1563
    add $P1565, $P1560, $P1564
    store_lex "$res", $P1565
.annotate 'line', 901
    find_lex $P1566, "$res"
    new $P1567, "Integer"
    assign $P1567, 64
    find_lex $P1568, "$sub"
    $N1569 = $P1568."immediate"()
    mul $P1570, $P1567, $N1569
    add $P1571, $P1566, $P1570
    store_lex "$res", $P1571
.annotate 'line', 902
    find_lex $P1572, "$res"
    new $P1573, "Integer"
    assign $P1573, 128
    find_lex $P1574, "$sub"
    $N1575 = $P1574."postcomp"()
    mul $P1576, $P1573, $N1575
    add $P1577, $P1572, $P1576
    store_lex "$res", $P1577
.annotate 'line', 904
    find_lex $P1579, "%context"
    unless_null $P1579, vivify_254
    $P1579 = root_new ['parrot';'Hash']
  vivify_254:
    set $P1580, $P1579["DEBUG"]
    unless_null $P1580, vivify_255
    new $P1580, "Undef"
  vivify_255:
    unless $P1580, if_1578_end
    find_lex $P1581, "self"
    new $P1582, 'String'
    set $P1582, "pf_flags "
    find_lex $P1583, "$res"
    concat $P1584, $P1582, $P1583
    $P1581."debug"($P1584)
  if_1578_end:
    find_lex $P1585, "$res"
.annotate 'line', 888
    .return ($P1585)
  control_1535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1586, exception, "payload"
    .return ($P1586)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("56_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1590
    .param pmc param_1591
.annotate 'line', 909
    new $P1589, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1589, control_1588
    push_eh $P1589
    .lex "self", self
    .lex "$sub", param_1590
    .lex "%context", param_1591
.annotate 'line', 914
    new $P1593, "Undef"
    set $P1592, $P1593
    .lex "$res", $P1592
    new $P1594, "Integer"
    assign $P1594, 0
    store_lex "$res", $P1594
.annotate 'line', 915
    find_lex $P1596, "$sub"
    $P1597 = $P1596."vtable"()
    unless $P1597, if_1595_end
    find_lex $P1598, "$res"
    add $P1599, $P1598, 2
    store_lex "$res", $P1599
  if_1595_end:
.annotate 'line', 916
    find_lex $P1601, "$sub"
    $P1602 = $P1601."is_method"()
    unless $P1602, if_1600_end
    find_lex $P1603, "$res"
    add $P1604, $P1603, 4
    store_lex "$res", $P1604
  if_1600_end:
.annotate 'line', 917
    find_lex $P1606, "$sub"
    $P1607 = $P1606."is_init"()
    unless $P1607, if_1605_end
    find_lex $P1608, "$res"
    add $P1609, $P1608, 1024
    store_lex "$res", $P1609
  if_1605_end:
.annotate 'line', 918
    find_lex $P1611, "$sub"
    $P1612 = $P1611."nsentry"()
    unless $P1612, if_1610_end
    find_lex $P1613, "$res"
    add $P1614, $P1613, 2048
    store_lex "$res", $P1614
  if_1610_end:
.annotate 'line', 920
    find_lex $P1616, "%context"
    unless_null $P1616, vivify_256
    $P1616 = root_new ['parrot';'Hash']
  vivify_256:
    set $P1617, $P1616["DEBUG"]
    unless_null $P1617, vivify_257
    new $P1617, "Undef"
  vivify_257:
    unless $P1617, if_1615_end
    find_lex $P1618, "self"
    new $P1619, 'String'
    set $P1619, "comp_flags "
    find_lex $P1620, "$res"
    concat $P1621, $P1619, $P1620
    $P1618."debug"($P1621)
  if_1615_end:
    find_lex $P1622, "$res"
.annotate 'line', 909
    .return ($P1622)
  control_1588:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1623, exception, "payload"
    .return ($P1623)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("57_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1627
    .param pmc param_1628
    .param pmc param_1629
    .param pmc param_1630
.annotate 'line', 925
    .const 'Sub' $P1640 = "58_1308206292.0457" 
    capture_lex $P1640
    new $P1626, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1626, control_1625
    push_eh $P1626
    .lex "self", self
    .lex "$sub", param_1627
    .lex "$labels_todo", param_1628
    .lex "$bc", param_1629
    .lex "%context", param_1630
.annotate 'line', 926
    find_lex $P1632, "%context"
    unless_null $P1632, vivify_258
    $P1632 = root_new ['parrot';'Hash']
  vivify_258:
    set $P1633, $P1632["DEBUG"]
    unless_null $P1633, vivify_259
    new $P1633, "Undef"
  vivify_259:
    unless $P1633, if_1631_end
    find_lex $P1634, "self"
    $P1634."debug"("Fixup labels")
  if_1631_end:
.annotate 'line', 927
    find_lex $P1636, "$labels_todo"
    defined $I1637, $P1636
    unless $I1637, for_undef_260
    iter $P1635, $P1636
    new $P1703, 'ExceptionHandler'
    set_label $P1703, loop1702_handler
    $P1703."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1703
  loop1702_test:
    unless $P1635, loop1702_done
    shift $P1638, $P1635
  loop1702_redo:
    .const 'Sub' $P1640 = "58_1308206292.0457" 
    capture_lex $P1640
    $P1640($P1638)
  loop1702_next:
    goto loop1702_test
  loop1702_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1704, exception, 'type'
    eq $P1704, .CONTROL_LOOP_NEXT, loop1702_next
    eq $P1704, .CONTROL_LOOP_REDO, loop1702_redo
  loop1702_done:
    pop_eh 
  for_undef_260:
.annotate 'line', 925
    .return ($P1635)
  control_1625:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1705, exception, "payload"
    .return ($P1705)
.end


.namespace ["POST";"Compiler"]
.sub "_block1639"  :anon :subid("58_1308206292.0457") :outer("57_1308206292.0457")
    .param pmc param_1641
.annotate 'line', 927
    .lex "$kv", param_1641
.annotate 'line', 928
    new $P1643, "Undef"
    set $P1642, $P1643
    .lex "$offset", $P1642
.annotate 'line', 929
    $P1645 = root_new ['parrot';'Hash']
    set $P1644, $P1645
    .lex "%todo", $P1644
.annotate 'line', 932
    new $P1647, "Undef"
    set $P1646, $P1647
    .lex "$op", $P1646
.annotate 'line', 935
    new $P1649, "Undef"
    set $P1648, $P1649
    .lex "$delta", $P1648
.annotate 'line', 928
    find_lex $P1650, "$kv"
    $P1651 = $P1650."key"()
    store_lex "$offset", $P1651
.annotate 'line', 929
    find_lex $P1652, "$kv"
    $P1653 = $P1652."value"()
    store_lex "%todo", $P1653
.annotate 'line', 930
    find_lex $P1655, "%context"
    unless_null $P1655, vivify_261
    $P1655 = root_new ['parrot';'Hash']
  vivify_261:
    set $P1656, $P1655["DEBUG"]
    unless_null $P1656, vivify_262
    new $P1656, "Undef"
  vivify_262:
    unless $P1656, if_1654_end
    find_lex $P1657, "self"
    new $P1658, 'String'
    set $P1658, "Fixing '"
    find_lex $P1659, "%todo"
    unless_null $P1659, vivify_263
    $P1659 = root_new ['parrot';'Hash']
  vivify_263:
    set $P1660, $P1659["name"]
    unless_null $P1660, vivify_264
    new $P1660, "Undef"
  vivify_264:
    set $S1661, $P1660
    concat $P1662, $P1658, $S1661
    concat $P1663, $P1662, "' from op "
    find_lex $P1664, "%todo"
    unless_null $P1664, vivify_265
    $P1664 = root_new ['parrot';'Hash']
  vivify_265:
    set $P1665, $P1664["opname"]
    unless_null $P1665, vivify_266
    new $P1665, "Undef"
  vivify_266:
    set $S1666, $P1665
    concat $P1667, $P1663, $S1666
    concat $P1668, $P1667, " at "
    find_lex $P1669, "$offset"
    set $S1670, $P1669
    concat $P1671, $P1668, $S1670
    $P1657."debug"($P1671)
  if_1654_end:
.annotate 'line', 932
    find_lex $P1672, "%todo"
    unless_null $P1672, vivify_267
    $P1672 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1673, $P1672["opname"]
    unless_null $P1673, vivify_268
    new $P1673, "Undef"
  vivify_268:
    set $S1674, $P1673
    find_lex $P1675, "$bc"
    $P1676 = $P1675."opmap"()
    set $P1677, $P1676[$S1674]
    unless_null $P1677, vivify_269
    new $P1677, "Undef"
  vivify_269:
    store_lex "$op", $P1677
.annotate 'line', 933
    find_lex $P1679, "%context"
    unless_null $P1679, vivify_270
    $P1679 = root_new ['parrot';'Hash']
  vivify_270:
    set $P1680, $P1679["DEBUG"]
    unless_null $P1680, vivify_271
    new $P1680, "Undef"
  vivify_271:
    unless $P1680, if_1678_end
    find_lex $P1681, "self"
    new $P1682, 'String'
    set $P1682, "Op length is "
    find_lex $P1683, "$op"
    $P1684 = $P1683."length"()
    set $S1685, $P1684
    concat $P1686, $P1682, $S1685
    $P1681."debug"($P1686)
  if_1678_end:
.annotate 'line', 935
    find_lex $P1687, "$sub"
    find_lex $P1688, "%todo"
    unless_null $P1688, vivify_272
    $P1688 = root_new ['parrot';'Hash']
  vivify_272:
    set $P1689, $P1688["name"]
    unless_null $P1689, vivify_273
    new $P1689, "Undef"
  vivify_273:
    $P1690 = $P1687."label"($P1689)
    $P1691 = $P1690."position"()
    find_lex $P1692, "%todo"
    unless_null $P1692, vivify_274
    $P1692 = root_new ['parrot';'Hash']
  vivify_274:
    set $P1693, $P1692["offset"]
    unless_null $P1693, vivify_275
    new $P1693, "Undef"
  vivify_275:
    sub $P1694, $P1691, $P1693
    store_lex "$delta", $P1694
.annotate 'line', 937
    find_lex $P1695, "$delta"
    find_lex $P1696, "$offset"
    find_lex $P1697, "$op"
    $N1698 = $P1697."length"()
    add $P1699, $P1696, $N1698
    set $I1700, $P1699
    find_lex $P1701, "$bc"
    unless_null $P1701, vivify_276
    $P1701 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1701
  vivify_276:
    set $P1701[$I1700], $P1695
.annotate 'line', 927
    .return ($P1695)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("59_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1709
    .param pmc param_1710
.annotate 'line', 942
    new $P1708, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1708, control_1707
    push_eh $P1708
    .lex "self", self
    .lex "$name", param_1709
    .lex "%context", param_1710
.annotate 'line', 943
    new $P1712, "Undef"
    set $P1711, $P1712
    .lex "$reg", $P1711
    find_lex $P1713, "%context"
    unless_null $P1713, vivify_277
    $P1713 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1714, $P1713["sub"]
    unless_null $P1714, vivify_278
    new $P1714, "Undef"
  vivify_278:
    find_lex $P1715, "$name"
    $P1716 = $P1714."symbol"($P1715)
    store_lex "$reg", $P1716
.annotate 'line', 944
    find_lex $P1718, "$reg"
    isfalse $I1719, $P1718
    unless $I1719, if_1717_end
.annotate 'line', 945
    find_lex $P1720, "self"
    new $P1721, 'String'
    set $P1721, "Register '"
    find_lex $P1722, "$name"
    set $S1723, $P1722
    concat $P1724, $P1721, $S1723
    concat $P1725, $P1724, "' not predeclared in '"
    find_lex $P1726, "%context"
    unless_null $P1726, vivify_279
    $P1726 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1727, $P1726["sub"]
    unless_null $P1727, vivify_280
    new $P1727, "Undef"
  vivify_280:
    $P1728 = $P1727."name"()
    set $S1729, $P1728
    concat $P1730, $P1725, $S1729
    concat $P1731, $P1730, "'"
    $P1720."panic"($P1731)
  if_1717_end:
.annotate 'line', 944
    find_lex $P1732, "$reg"
.annotate 'line', 942
    .return ($P1732)
  control_1707:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1733, exception, "payload"
    .return ($P1733)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "debug"  :subid("60_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1737 :slurpy
.annotate 'line', 950
    .const 'Sub' $P1743 = "61_1308206292.0457" 
    capture_lex $P1743
    new $P1736, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1736, control_1735
    push_eh $P1736
    .lex "self", self
    .lex "@args", param_1737
.annotate 'line', 951
    find_lex $P1739, "@args"
    defined $I1740, $P1739
    unless $I1740, for_undef_281
    iter $P1738, $P1739
    new $P1747, 'ExceptionHandler'
    set_label $P1747, loop1746_handler
    $P1747."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1747
  loop1746_test:
    unless $P1738, loop1746_done
    shift $P1741, $P1738
  loop1746_redo:
    .const 'Sub' $P1743 = "61_1308206292.0457" 
    capture_lex $P1743
    $P1743($P1741)
  loop1746_next:
    goto loop1746_test
  loop1746_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1748, exception, 'type'
    eq $P1748, .CONTROL_LOOP_NEXT, loop1746_next
    eq $P1748, .CONTROL_LOOP_REDO, loop1746_redo
  loop1746_done:
    pop_eh 
  for_undef_281:
.annotate 'line', 950
    .return ($P1738)
  control_1735:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1749, exception, "payload"
    .return ($P1749)
.end


.namespace ["POST";"Compiler"]
.sub "_block1742"  :anon :subid("61_1308206292.0457") :outer("60_1308206292.0457")
    .param pmc param_1744
.annotate 'line', 951
    .lex "$_", param_1744
.annotate 'line', 952
    find_lex $P1745, "$_"
    say $P1745
.annotate 'line', 951
    .return ()
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("62_1308206292.0457") :method :outer("11_1308206292.0457")
    .param pmc param_1753
    .param pmc param_1754
.annotate 'line', 956
    new $P1752, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1752, control_1751
    push_eh $P1752
    .lex "self", self
    .lex "$past", param_1753
    .lex "%adverbs", param_1754
.annotate 'line', 957
    $P1756 = root_new ['parrot';'Hash']
    set $P1755, $P1756
    .lex "%context", $P1755
.annotate 'line', 965
    new $P1758, "Undef"
    set $P1757, $P1758
    .lex "$pfdir", $P1757
.annotate 'line', 956
    find_lex $P1759, "%context"
.annotate 'line', 959
    find_lex $P1760, "self"
    find_lex $P1761, "%context"
    unless_null $P1761, vivify_282
    $P1761 = root_new ['parrot';'Hash']
    store_lex "%context", $P1761
  vivify_282:
    set $P1761["compiler"], $P1760
.annotate 'line', 961
    $P1762 = "new"("Packfile")
    find_lex $P1763, "%context"
    unless_null $P1763, vivify_283
    $P1763 = root_new ['parrot';'Hash']
    store_lex "%context", $P1763
  vivify_283:
    set $P1763["packfile"], $P1762
.annotate 'line', 965
    find_lex $P1764, "%context"
    unless_null $P1764, vivify_284
    $P1764 = root_new ['parrot';'Hash']
  vivify_284:
    set $P1765, $P1764["packfile"]
    unless_null $P1765, vivify_285
    new $P1765, "Undef"
  vivify_285:
    $P1766 = $P1765."get_directory"()
    store_lex "$pfdir", $P1766
.annotate 'line', 968
    $P1767 = "new"("PackfileConstantTable")
    find_lex $P1768, "%context"
    unless_null $P1768, vivify_286
    $P1768 = root_new ['parrot';'Hash']
    store_lex "%context", $P1768
  vivify_286:
    set $P1768["constants"], $P1767
.annotate 'line', 971
    $P1769 = "new"("FixedIntegerArray")
    find_lex $P1770, "%context"
    unless_null $P1770, vivify_287
    $P1770 = root_new ['parrot';'Hash']
    store_lex "%context", $P1770
  vivify_287:
    set $P1771, $P1770["constants"]
    unless_null $P1771, vivify_288
    $P1771 = root_new ['parrot';'ResizablePMCArray']
    set $P1770["constants"], $P1771
  vivify_288:
    set $P1771[0], $P1769
.annotate 'line', 974
    find_lex $P1772, "%context"
    unless_null $P1772, vivify_289
    $P1772 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1773, $P1772["constants"]
    unless_null $P1773, vivify_290
    new $P1773, "Undef"
  vivify_290:
    find_lex $P1774, "$pfdir"
    unless_null $P1774, vivify_291
    $P1774 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1774
  vivify_291:
    set $P1774["CONSTANTS_hello.pir"], $P1773
.annotate 'line', 977
    $P1775 = "new"("PackfileBytecodeSegment")
    find_lex $P1776, "%context"
    unless_null $P1776, vivify_292
    $P1776 = root_new ['parrot';'Hash']
    store_lex "%context", $P1776
  vivify_292:
    set $P1776["bytecode"], $P1775
.annotate 'line', 978
    find_lex $P1777, "%context"
    unless_null $P1777, vivify_293
    $P1777 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1778, $P1777["bytecode"]
    unless_null $P1778, vivify_294
    new $P1778, "Undef"
  vivify_294:
    $P1778."main_sub"(-1)
.annotate 'line', 980
    new $P1779, "Integer"
    assign $P1779, 0
    find_lex $P1780, "%context"
    unless_null $P1780, vivify_295
    $P1780 = root_new ['parrot';'Hash']
    store_lex "%context", $P1780
  vivify_295:
    set $P1780["got_main_sub"], $P1779
.annotate 'line', 983
    find_lex $P1781, "%context"
    unless_null $P1781, vivify_296
    $P1781 = root_new ['parrot';'Hash']
  vivify_296:
    set $P1782, $P1781["bytecode"]
    unless_null $P1782, vivify_297
    new $P1782, "Undef"
  vivify_297:
    find_lex $P1783, "$pfdir"
    unless_null $P1783, vivify_298
    $P1783 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1783
  vivify_298:
    set $P1783["BYTECODE_hello.pir"], $P1782
.annotate 'line', 992
    get_hll_global $P1784, ["POST"], "VanillaAllocator"
    $P1785 = $P1784."new"()
    find_lex $P1786, "%context"
    unless_null $P1786, vivify_299
    $P1786 = root_new ['parrot';'Hash']
    store_lex "%context", $P1786
  vivify_299:
    set $P1786["regalloc"], $P1785
.annotate 'line', 994
    find_lex $P1787, "%adverbs"
    unless_null $P1787, vivify_300
    $P1787 = root_new ['parrot';'Hash']
  vivify_300:
    set $P1788, $P1787["debug"]
    unless_null $P1788, vivify_301
    new $P1788, "Undef"
  vivify_301:
    find_lex $P1789, "%context"
    unless_null $P1789, vivify_302
    $P1789 = root_new ['parrot';'Hash']
    store_lex "%context", $P1789
  vivify_302:
    set $P1789["DEBUG"], $P1788
    find_lex $P1790, "%context"
.annotate 'line', 956
    .return ($P1790)
  control_1751:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1791, exception, "payload"
    .return ($P1791)
.end


.namespace ["POST";"Compiler"]
.sub "_block1792" :load :anon :subid("63_1308206292.0457")
.annotate 'line', 16
    .const 'Sub' $P1794 = "11_1308206292.0457" 
    $P1795 = $P1794()
    .return ($P1795)
.end


.namespace []
.sub "_block1801" :load :anon :subid("64_1308206292.0457")
.annotate 'line', 1
    .const 'Sub' $P1803 = "10_1308206292.0457" 
    $P1804 = $P1803()
    .return ($P1804)
.end

