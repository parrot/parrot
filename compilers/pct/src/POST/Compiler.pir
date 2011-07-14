
.namespace []
.sub "_block1000"  :anon :subid("10_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1310682738.42772" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1310682738.42772" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1548 = "64_1310682738.42772" 
    .return ($P1548)
.end


.namespace []
.sub "" :load :init :subid("post65") :outer("10_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1310682738.42772" 
    .local pmc block
    set block, $P1001
    $P1550 = get_root_global ["parrot"], "P6metaclass"
    new $P103, "ResizablePMCArray"
    push $P103, "$?HLL"
    push $P103, "$?NAMESPACE"
    $P1550."new_class"("POST::Compiler", "PCT::HLLCompiler" :named("parent"), $P103 :named("attr"))
.end


.namespace ["POST";"Compiler"]
.sub "_block1002"  :subid("11_1310682738.42772") :outer("10_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1519 = "62_1310682738.42772" 
    capture_lex $P1519
    .const 'Sub' $P1511 = "60_1310682738.42772" 
    capture_lex $P1511
    .const 'Sub' $P1502 = "59_1310682738.42772" 
    capture_lex $P1502
    .const 'Sub' $P1474 = "57_1310682738.42772" 
    capture_lex $P1474
    .const 'Sub' $P1462 = "56_1310682738.42772" 
    capture_lex $P1462
    .const 'Sub' $P1454 = "55_1310682738.42772" 
    capture_lex $P1454
    .const 'Sub' $P1445 = "53_1310682738.42772" 
    capture_lex $P1445
    .const 'Sub' $P1419 = "52_1310682738.42772" 
    capture_lex $P1419
    .const 'Sub' $P1392 = "48_1310682738.42772" 
    capture_lex $P1392
    .const 'Sub' $P1363 = "45_1310682738.42772" 
    capture_lex $P1363
    .const 'Sub' $P1348 = "44_1310682738.42772" 
    capture_lex $P1348
    .const 'Sub' $P1343 = "43_1310682738.42772" 
    capture_lex $P1343
    .const 'Sub' $P1337 = "42_1310682738.42772" 
    capture_lex $P1337
    .const 'Sub' $P1321 = "40_1310682738.42772" 
    capture_lex $P1321
    .const 'Sub' $P1308 = "39_1310682738.42772" 
    capture_lex $P1308
    .const 'Sub' $P1295 = "38_1310682738.42772" 
    capture_lex $P1295
    .const 'Sub' $P1231 = "34_1310682738.42772" 
    capture_lex $P1231
    .const 'Sub' $P1216 = "32_1310682738.42772" 
    capture_lex $P1216
    .const 'Sub' $P1207 = "30_1310682738.42772" 
    capture_lex $P1207
    .const 'Sub' $P1179 = "27_1310682738.42772" 
    capture_lex $P1179
    .const 'Sub' $P1091 = "24_1310682738.42772" 
    capture_lex $P1091
    .const 'Sub' $P1086 = "23_1310682738.42772" 
    capture_lex $P1086
    .const 'Sub' $P1072 = "21_1310682738.42772" 
    capture_lex $P1072
    .const 'Sub' $P1061 = "20_1310682738.42772" 
    capture_lex $P1061
    .const 'Sub' $P1057 = "19_1310682738.42772" 
    capture_lex $P1057
    .const 'Sub' $P1052 = "18_1310682738.42772" 
    capture_lex $P1052
    .const 'Sub' $P1030 = "17_1310682738.42772" 
    capture_lex $P1030
    .const 'Sub' $P1026 = "16_1310682738.42772" 
    capture_lex $P1026
    .const 'Sub' $P1022 = "15_1310682738.42772" 
    capture_lex $P1022
    .const 'Sub' $P1013 = "14_1310682738.42772" 
    capture_lex $P1013
    .const 'Sub' $P1009 = "13_1310682738.42772" 
    capture_lex $P1009
    .const 'Sub' $P1005 = "12_1310682738.42772" 
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
    new $P101, "String"
    assign $P101, "bar"
    set_global "%pirop_handlers", $P101
    new $P102, "ResizablePMCArray"
    push $P102, $P101
    push $P102, "bang"
.annotate 'line', 16
    .return ()
    .const 'Sub' $P1544 = "63_1310682738.42772" 
    .return ($P1544)
.end


.namespace ["POST";"Compiler"]
.sub "" :load :init :subid("post66") :outer("11_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1310682738.42772" 
    .local pmc block
    set block, $P1003
.annotate 'line', 20
    get_hll_global $P102, ["POST"], "Compiler"
    $P102."language"("POST")
.annotate 'line', 21
    get_hll_global $P102, ["POST"], "Compiler"
    new $P103, "ResizablePMCArray"
    push $P103, "pir"
    push $P103, "evalpmc"
    $P102."stages"($P103)
.annotate 'line', 23

        $P1546 = new ['String']
        set_global '$?HLL', $P1546
    
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("12_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1008
.annotate 'file', ''
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
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "key_pir"  :subid("13_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1012 :slurpy
.annotate 'file', ''
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
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pir"  :subid("14_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1016
    .param pmc param_1017 :slurpy :named
.annotate 'file', ''
.annotate 'line', 74
    new $P1015, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1015, control_1014
    push_eh $P1015
    .lex "self", self
    .lex "$post", param_1016
    .lex "%adverbs", param_1017
.annotate 'line', 75
    new $P101, "Undef"
    set $P1018, $P101
    .lex "$newself", $P1018
.annotate 'line', 76
    new $P102, "Undef"
    set $P1019, $P102
    .lex "$CODE", $P1019
.annotate 'line', 77
    new $P103, "Undef"
    set $P1020, $P103
    .lex "$LINE", $P1020
.annotate 'line', 75
    get_hll_global $P104, ["POST"], "Compiler"
    $P105 = $P104."new"()
    store_lex "$newself", $P105
.annotate 'line', 76
    new $P104, "StringBuilder"
    store_lex "$CODE", $P104
.annotate 'line', 77
    new $P104, "Integer"
    assign $P104, 0
    store_lex "$LINE", $P104
.annotate 'line', 79
    find_lex $P104, "$post"
    get_hll_global $P105, ["POST"], "Sub"
    $P106 = $P104."isa"($P105)
    if $P106, unless_1021_end
.annotate 'line', 80
    get_hll_global $P107, ["POST"], "Sub"
    find_lex $P108, "$post"
    $P109 = $P107."new"($P108, "anon" :named("name"))
    store_lex "$post", $P109
  unless_1021_end:
.annotate 'line', 82
    find_lex $P104, "$newself"
    find_lex $P105, "$post"
    $P104."pir"($P105)
.annotate 'line', 74
    find_lex $P104, "$CODE"
    .return ($P104)
  control_1014:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir_children"  :subid("15_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1025
.annotate 'file', ''
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
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("16_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,_)
    .param pmc param_1029
.annotate 'file', ''
.annotate 'line', 121
    new $P1028, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1028, control_1027
    push_eh $P1028
    .lex "self", self
    .lex "$node", param_1029
.annotate 'line', 122
    find_lex $P101, "self"
    find_lex $P102, "$node"
    $P103 = $P101."pir_children"($P102)
.annotate 'line', 121
    .return ($P103)
  control_1027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("17_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Op"])
    .param pmc param_1033
.annotate 'file', ''
.annotate 'line', 131
    new $P1032, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1032, control_1031
    push_eh $P1032
    .lex "self", self
    .lex "$node", param_1033
.annotate 'line', 133
    new $P101, "Undef"
    set $P1034, $P101
    .lex "$pirop", $P1034
.annotate 'line', 135
    new $P102, "Undef"
    set $P1035, $P102
    .lex "$result", $P1035
.annotate 'line', 139
    $P1037 = root_new ['parrot';'ResizablePMCArray']
    set $P1036, $P1037
    .lex "@arglist", $P1036
.annotate 'line', 142
    new $P103, "Undef"
    set $P1038, $P103
    .lex "$fmt", $P1038
.annotate 'line', 143
    new $P104, "Undef"
    set $P1039, $P104
    .lex "$name", $P1039
.annotate 'line', 144
    new $P105, "Undef"
    set $P1040, $P105
    .lex "$invocant", $P1040
.annotate 'line', 174
    new $P106, "Undef"
    set $P1041, $P106
    .lex "$subpir", $P1041
.annotate 'line', 175
    new $P107, "Undef"
    set $P1042, $P107
    .lex "$subline", $P1042
.annotate 'line', 176
    new $P108, "Undef"
    set $P1043, $P108
    .lex "$line", $P1043
.annotate 'line', 133
    find_lex $P109, "$node"
    $P110 = $P109."pirop"()
    store_lex "$pirop", $P110
.annotate 'line', 135
    find_lex $P109, "$node"
    $P110 = $P109."result"()
    set $S101, $P110
    new $P111, 'String'
    set $P111, $S101
    store_lex "$result", $P111
.annotate 'line', 136
    find_lex $P109, "$result"
    unless $P109, if_1044_end
    find_lex $P110, "$result"
    concat $P111, $P110, " = "
    store_lex "$result", $P111
  if_1044_end:
.annotate 'line', 139
    find_lex $P109, "$node"
    $P110 = $P109."list"()
    store_lex "@arglist", $P110
.annotate 'line', 131
    find_lex $P109, "$fmt"
    find_lex $P109, "$name"
    find_lex $P109, "$invocant"
.annotate 'line', 146
    find_lex $P109, "$pirop"
    set $S101, $P109
    iseq $I101, $S101, "call"
    if $I101, if_1045
.annotate 'line', 150
    find_lex $P110, "$pirop"
    set $S102, $P110
    iseq $I102, $S102, "callmethod"
    if $I102, if_1046
.annotate 'line', 155
    find_lex $P111, "$pirop"
    set $S103, $P111
    iseq $I103, $S103, "return"
    if $I103, if_1047
.annotate 'line', 158
    find_lex $P112, "$pirop"
    set $S104, $P112
    iseq $I104, $S104, "yield"
    if $I104, if_1048
.annotate 'line', 161
    find_lex $P113, "$pirop"
    set $S105, $P113
    iseq $I105, $S105, "tailcall"
    if $I105, if_1049
.annotate 'line', 165
    find_lex $P114, "$pirop"
    set $S106, $P114
    iseq $I106, $S106, "inline"
    if $I106, if_1050
.annotate 'line', 170
    new $P115, "String"
    assign $P115, "    %n %,\n"
    store_lex "$fmt", $P115
.annotate 'line', 171
    find_lex $P115, "$pirop"
    store_lex "$name", $P115
.annotate 'line', 169
    goto if_1050_end
  if_1050:
.annotate 'line', 166
    find_lex $P115, "$node"
    $P116 = $P115."inline"()
    concat $P117, $P116, "\n"
    store_lex "$fmt", $P117
.annotate 'line', 167
    find_lex $P115, "$node"
    $P116 = $P115."result"()
    store_lex "$result", $P116
  if_1050_end:
.annotate 'line', 165
    goto if_1049_end
  if_1049:
.annotate 'line', 162
    find_lex $P114, "@arglist"
    $P115 = $P114."shift"()
    store_lex "$name", $P115
.annotate 'line', 163
    new $P114, "String"
    assign $P114, "    .tailcall %n(%,)\n"
    store_lex "$fmt", $P114
  if_1049_end:
.annotate 'line', 161
    goto if_1048_end
  if_1048:
.annotate 'line', 159
    new $P113, "String"
    assign $P113, "    .yield (%,)\n"
    store_lex "$fmt", $P113
  if_1048_end:
.annotate 'line', 158
    goto if_1047_end
  if_1047:
.annotate 'line', 156
    new $P112, "String"
    assign $P112, "    .return (%,)\n"
    store_lex "$fmt", $P112
  if_1047_end:
.annotate 'line', 155
    goto if_1046_end
  if_1046:
.annotate 'line', 151
    new $P111, "String"
    assign $P111, "    %r%i.%n(%,)\n"
    store_lex "$fmt", $P111
.annotate 'line', 152
    find_lex $P111, "@arglist"
    $P112 = $P111."shift"()
    store_lex "$name", $P112
.annotate 'line', 153
    find_lex $P111, "@arglist"
    $P112 = $P111."shift"()
    store_lex "$invocant", $P112
  if_1046_end:
.annotate 'line', 150
    goto if_1045_end
  if_1045:
.annotate 'line', 147
    new $P110, "String"
    assign $P110, "    %r%n(%,)\n"
    store_lex "$fmt", $P110
.annotate 'line', 148
    find_lex $P110, "@arglist"
    $P111 = $P110."shift"()
    store_lex "$name", $P111
  if_1045_end:
.annotate 'line', 174
    new $P109, "String"
    assign $P109, "$SUBPIR"
    set $S101, $P109
    find_caller_lex $P110, $S101
    store_lex "$subpir", $P110
.annotate 'line', 175
    new $P109, "String"
    assign $P109, "$SUBLINE"
    set $S101, $P109
    find_caller_lex $P110, $S101
    store_lex "$subline", $P110
.annotate 'line', 176
    new $P109, "String"
    assign $P109, "$LINE"
    set $S101, $P109
    find_caller_lex $P110, $S101
    store_lex "$line", $P110
.annotate 'line', 178
    find_lex $P109, "$subline"
    set $N101, $P109
    find_lex $P110, "$line"
    set $N102, $P110
    isne $I101, $N101, $N102
    unless $I101, if_1051_end
.annotate 'line', 179
    find_lex $P111, "$subpir"
    find_lex $P112, "$line"
    set $S101, $P112
    $P111."append_format"(".annotate 'line', %0\n", $S101)
.annotate 'line', 180
    find_lex $P111, "$subline"
    find_lex $P112, "$line"
    assign $P111, $P112
  if_1051_end:
.annotate 'line', 183
    find_lex $P109, "$subpir"
    find_lex $P110, "$fmt"
    find_lex $P111, "@arglist"
    find_lex $P112, "$result"
    find_lex $P113, "$name"
    find_lex $P114, "$invocant"
    find_lex $P115, "$result"
    $P116 = $P109."append_format"($P110, $P111 :flat, $P112 :named("r"), $P113 :named("n"), $P114 :named("i"), $P115 :named("t"))
.annotate 'line', 131
    .return ($P116)
  control_1031:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, "payload"
    .return ($P109)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("18_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Label"])
    .param pmc param_1055
.annotate 'file', ''
.annotate 'line', 190
    new $P1054, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1054, control_1053
    push_eh $P1054
    .lex "self", self
    .lex "$node", param_1055
.annotate 'line', 191
    new $P101, "Undef"
    set $P1056, $P101
    .lex "$subpir", $P1056
    new $P102, "String"
    assign $P102, "$SUBPIR"
    set $S101, $P102
    find_caller_lex $P103, $S101
    store_lex "$subpir", $P103
.annotate 'line', 192
    find_lex $P102, "$subpir"
    find_lex $P103, "$node"
    $P104 = $P103."result"()
    $P105 = $P102."append_format"("  %0:\n", $P104)
.annotate 'line', 190
    .return ($P105)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("19_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Sub"])
    .param pmc param_1060
.annotate 'file', ''
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

    ## Add a file annotation
    .local pmc files
    files = find_caller_lex '$?FILES'
    if null files goto no_files
    unless files goto no_files
    subpir.'append_format'(".annotate 'file', ''\n", files)
  no_files:

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
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "hll_pir"  :subid("20_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1064
    .param pmc param_1065 :slurpy :named
.annotate 'file', ''
.annotate 'line', 366
    new $P1063, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1063, control_1062
    push_eh $P1063
    .lex "self", self
    .lex "$node", param_1064
    .lex "%options", param_1065
.annotate 'line', 370
    new $P101, "Undef"
    set $P1066, $P101
    .lex "$source", $P1066
.annotate 'line', 371
    new $P102, "Undef"
    set $P1067, $P102
    .lex "$compiler", $P1067
.annotate 'line', 367
    new $P103, "String"
    assign $P103, "pir"
    find_lex $P1068, "%options"
    unless_null $P1068, vivify_68
    $P1068 = root_new ['parrot';'Hash']
    store_lex "%options", $P1068
  vivify_68:
    set $P1068["target"], $P103
.annotate 'line', 368
    find_lex $P103, "$node"
    $P104 = $P103."subid"()
    find_lex $P1069, "%options"
    unless_null $P1069, vivify_69
    $P1069 = root_new ['parrot';'Hash']
    store_lex "%options", $P1069
  vivify_69:
    set $P1069["subid"], $P104
.annotate 'line', 370
    find_lex $P1070, "$node"
    unless_null $P1070, vivify_70
    $P1070 = root_new ['parrot';'ResizablePMCArray']
  vivify_70:
    set $P103, $P1070[0]
    unless_null $P103, vivify_71
    new $P103, "Undef"
  vivify_71:
    store_lex "$source", $P103
.annotate 'line', 371
    find_lex $P103, "$node"
    $S101 = $P103."compiler"()
    compreg $P104, $S101
    store_lex "$compiler", $P104
.annotate 'line', 372
    find_lex $P104, "$compiler"
    isa $I101, $P104, "Sub"
    if $I101, if_1071
.annotate 'line', 374
    find_lex $P109, "$compiler"
    find_lex $P110, "$source"
    find_lex $P111, "%options"
    $P112 = $P109."compile"($P110, $P111 :flat)
    set $P103, $P112
.annotate 'line', 372
    goto if_1071_end
  if_1071:
.annotate 'line', 373
    find_lex $P105, "$compiler"
    find_lex $P106, "$source"
    find_lex $P107, "%options"
    $P108 = $P105($P106, $P107 :flat)
    set $P103, $P108
  if_1071_end:
.annotate 'line', 366
    .return ($P103)
  control_1062:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("21_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1075
    .param pmc param_1076
.annotate 'file', ''
.annotate 'line', 394
    .const 'Sub' $P1082 = "22_1310682738.42772" 
    capture_lex $P1082
    new $P1074, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1074, control_1073
    push_eh $P1074
    .lex "self", self
    .lex "$post", param_1075
    .lex "%adverbs", param_1076
.annotate 'line', 398
    $P1078 = root_new ['parrot';'Hash']
    set $P1077, $P1078
    .lex "%context", $P1077
    find_lex $P101, "self"
    find_lex $P102, "$post"
    find_lex $P103, "%adverbs"
    $P104 = $P101."create_context"($P102, $P103)
    store_lex "%context", $P104
.annotate 'line', 399
    new $P101, "Integer"
    assign $P101, 0
    find_lex $P1079, "%context"
    unless_null $P1079, vivify_72
    $P1079 = root_new ['parrot';'Hash']
    store_lex "%context", $P1079
  vivify_72:
    set $P1079["DEBUG"], $P101
.annotate 'line', 401
    find_lex $P101, "$post"
    find_lex $P1080, "%context"
    unless_null $P1080, vivify_73
    $P1080 = root_new ['parrot';'Hash']
    store_lex "%context", $P1080
  vivify_73:
    set $P1080["pir_file"], $P101
.annotate 'line', 406
    find_lex $P101, "self"
    find_lex $P102, "$post"
    $P101."enumerate_subs"($P102)
.annotate 'line', 408
    find_lex $P102, "$post"
    $P103 = $P102."list"()
    defined $I101, $P103
    unless $I101, for_undef_74
    iter $P101, $P103
    new $P105, 'ExceptionHandler'
    set_label $P105, loop1084_handler
    $P105."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P105
  loop1084_test:
    unless $P101, loop1084_done
    shift $P104, $P101
  loop1084_redo:
    .const 'Sub' $P1082 = "22_1310682738.42772" 
    capture_lex $P1082
    $P1082($P104)
  loop1084_next:
    goto loop1084_test
  loop1084_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, 'type'
    eq $P106, .CONTROL_LOOP_NEXT, loop1084_next
    eq $P106, .CONTROL_LOOP_REDO, loop1084_redo
  loop1084_done:
    pop_eh 
  for_undef_74:
.annotate 'line', 394
    find_lex $P1085, "%context"
    unless_null $P1085, vivify_75
    $P1085 = root_new ['parrot';'Hash']
  vivify_75:
    set $P101, $P1085["packfile"]
    unless_null $P101, vivify_76
    new $P101, "Undef"
  vivify_76:
    .return ($P101)
  control_1073:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"Compiler"]
.sub "_block1081"  :anon :subid("22_1310682738.42772") :outer("21_1310682738.42772")
    .param pmc param_1083
.annotate 'file', ''
.annotate 'line', 408
    .lex "$s", param_1083
.annotate 'line', 409
    find_lex $P105, "self"
    find_lex $P106, "$s"
    find_lex $P107, "%context"
    $P108 = $P105."to_pbc"($P106, $P107)
.annotate 'line', 408
    .return ($P108)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("23_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["Undef"],_)
    .param pmc param_1089
    .param pmc param_1090
.annotate 'file', ''
.annotate 'line', 418
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
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("24_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Sub"],_)
    .param pmc param_1094
    .param pmc param_1095
.annotate 'file', ''
.annotate 'line', 422
    .const 'Sub' $P1149 = "26_1310682738.42772" 
    capture_lex $P1149
    .const 'Sub' $P1128 = "25_1310682738.42772" 
    capture_lex $P1128
    new $P1093, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1093, control_1092
    push_eh $P1093
    .lex "self", self
    .lex "$sub", param_1094
    .lex "%context", param_1095
.annotate 'line', 427
    $P1097 = root_new ['parrot';'ResizablePMCArray']
    set $P1096, $P1097
    .lex "@n_regs_used", $P1096
.annotate 'line', 431
    new $P101, "Undef"
    set $P1098, $P101
    .lex "$bc", $P1098
.annotate 'line', 437
    new $P102, "Undef"
    set $P1099, $P102
    .lex "$sb", $P1099
.annotate 'line', 439
    new $P103, "Undef"
    set $P1100, $P103
    .lex "$subname", $P1100
.annotate 'line', 444
    new $P104, "Undef"
    set $P1101, $P104
    .lex "$start_offset", $P1101
.annotate 'line', 473
    new $P105, "Undef"
    set $P1102, $P105
    .lex "$end_offset", $P1102
.annotate 'line', 480
    $P1104 = root_new ['parrot';'Hash']
    set $P1103, $P1104
    .lex "%sub", $P1103
.annotate 'line', 507
    new $P106, "Undef"
    set $P1105, $P106
    .lex "$idx", $P1105
.annotate 'line', 424
    find_lex $P107, "$sub"
    find_lex $P1106, "%context"
    unless_null $P1106, vivify_77
    $P1106 = root_new ['parrot';'Hash']
    store_lex "%context", $P1106
  vivify_77:
    set $P1106["sub"], $P107
.annotate 'line', 427
    find_lex $P1107, "%context"
    unless_null $P1107, vivify_78
    $P1107 = root_new ['parrot';'Hash']
  vivify_78:
    set $P107, $P1107["regalloc"]
    unless_null $P107, vivify_79
    new $P107, "Undef"
  vivify_79:
    find_lex $P108, "$sub"
    $P109 = $P107."process"($P108)
    store_lex "@n_regs_used", $P109
.annotate 'line', 428
    find_lex $P1109, "%context"
    unless_null $P1109, vivify_80
    $P1109 = root_new ['parrot';'Hash']
  vivify_80:
    set $P107, $P1109["DEBUG"]
    unless_null $P107, vivify_81
    new $P107, "Undef"
  vivify_81:
    unless $P107, if_1108_end
    find_lex $P108, "self"
    new $P109, "String"
    assign $P109, "n_regs_used "
    find_lex $P110, "@n_regs_used"
    $S101 = $P110."join"("-")
    concat $P111, $P109, $S101
    $P108."debug"($P111)
  if_1108_end:
.annotate 'line', 429
    find_lex $P1111, "%context"
    unless_null $P1111, vivify_82
    $P1111 = root_new ['parrot';'Hash']
  vivify_82:
    set $P107, $P1111["DEBUG"]
    unless_null $P107, vivify_83
    new $P107, "Undef"
  vivify_83:
    unless $P107, if_1110_end
    find_lex $P108, "self"
    find_lex $P109, "$sub"
    $P108."dumper"($P109, "sub")
  if_1110_end:
.annotate 'line', 431
    find_lex $P1112, "%context"
    unless_null $P1112, vivify_84
    $P1112 = root_new ['parrot';'Hash']
  vivify_84:
    set $P107, $P1112["bytecode"]
    unless_null $P107, vivify_85
    new $P107, "Undef"
  vivify_85:
    store_lex "$bc", $P107
.annotate 'line', 434
    $P107 = "hash"()
    find_lex $P1113, "%context"
    unless_null $P1113, vivify_86
    $P1113 = root_new ['parrot';'Hash']
    store_lex "%context", $P1113
  vivify_86:
    set $P1113["labels_todo"], $P107
.annotate 'line', 437
    $P107 = "new"("StringBuilder")
    store_lex "$sb", $P107
.annotate 'line', 438
    find_lex $P107, "$sb"
    find_lex $P108, "$sub"
    $P109 = $P108."name"()
    set $S101, $P109
    $P107."push"($S101)
.annotate 'line', 439
    find_lex $P107, "$sb"
    set $S101, $P107
    new $P108, 'String'
    set $P108, $S101
    store_lex "$subname", $P108
.annotate 'line', 441
    find_lex $P1115, "%context"
    unless_null $P1115, vivify_87
    $P1115 = root_new ['parrot';'Hash']
  vivify_87:
    set $P107, $P1115["DEBUG"]
    unless_null $P107, vivify_88
    new $P107, "Undef"
  vivify_88:
    unless $P107, if_1114_end
    find_lex $P108, "self"
    new $P109, 'String'
    set $P109, "Emitting "
    find_lex $P110, "$subname"
    concat $P111, $P109, $P110
    $P108."debug"($P111)
  if_1114_end:
.annotate 'line', 442
    find_lex $P1116, "%context"
    unless_null $P1116, vivify_89
    $P1116 = root_new ['parrot';'Hash']
  vivify_89:
    set $P107, $P1116["constants"]
    unless_null $P107, vivify_90
    new $P107, "Undef"
  vivify_90:
    find_lex $P108, "$subname"
    $P107."get_or_create_string"($P108)
.annotate 'line', 444
    find_lex $P107, "$bc"
    set $N101, $P107
    new $P108, 'Float'
    set $P108, $N101
    store_lex "$start_offset", $P108
.annotate 'line', 445
    find_lex $P1118, "%context"
    unless_null $P1118, vivify_91
    $P1118 = root_new ['parrot';'Hash']
  vivify_91:
    set $P107, $P1118["DEBUG"]
    unless_null $P107, vivify_92
    new $P107, "Undef"
  vivify_92:
    unless $P107, if_1117_end
    find_lex $P108, "self"
    new $P109, 'String'
    set $P109, "From "
    find_lex $P110, "$start_offset"
    concat $P111, $P109, $P110
    $P108."debug"($P111)
  if_1117_end:
.annotate 'line', 448
    find_lex $P1120, "$sub"
    unless_null $P1120, vivify_93
    $P1120 = root_new ['parrot';'Hash']
  vivify_93:
    set $P107, $P1120["params"]
    unless_null $P107, vivify_94
    new $P107, "Undef"
  vivify_94:
    if $P107, unless_1119_end
    $P108 = "list"()
    find_lex $P1121, "$sub"
    unless_null $P1121, vivify_95
    $P1121 = root_new ['parrot';'Hash']
    store_lex "$sub", $P1121
  vivify_95:
    set $P1121["params"], $P108
  unless_1119_end:
.annotate 'line', 449
    find_lex $P107, "$sub"
    $P108 = $P107."is_method"()
    unless $P108, if_1122_end
    find_lex $P1123, "$sub"
    unless_null $P1123, vivify_96
    $P1123 = root_new ['parrot';'Hash']
  vivify_96:
    set $P109, $P1123["params"]
    unless_null $P109, vivify_97
    new $P109, "Undef"
  vivify_97:
    get_hll_global $P110, ["POST"], "Value"
    $P111 = $P110."new"("self" :named("name"))
    $P109."unshift"($P111)
  if_1122_end:
.annotate 'line', 451
    find_lex $P1125, "$sub"
    unless_null $P1125, vivify_98
    $P1125 = root_new ['parrot';'Hash']
  vivify_98:
    set $P107, $P1125["params"]
    unless_null $P107, vivify_99
    new $P107, "Undef"
  vivify_99:
    set $N101, $P107
    unless $N101, if_1124_end
.annotate 'line', 452
    find_lex $P108, "self"
    find_lex $P1126, "$sub"
    unless_null $P1126, vivify_100
    $P1126 = root_new ['parrot';'Hash']
  vivify_100:
    set $P109, $P1126["params"]
    unless_null $P109, vivify_101
    new $P109, "Undef"
  vivify_101:
    find_lex $P110, "%context"
    $P108."build_pcc_call"("get_params_pc", $P109, $P110)
  if_1124_end:
.annotate 'line', 456
    find_lex $P108, "$sub"
    $P109 = $P108."list"()
    defined $I101, $P109
    unless $I101, for_undef_102
    iter $P107, $P109
    new $P111, 'ExceptionHandler'
    set_label $P111, loop1130_handler
    $P111."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P111
  loop1130_test:
    unless $P107, loop1130_done
    shift $P110, $P107
  loop1130_redo:
    .const 'Sub' $P1128 = "25_1310682738.42772" 
    capture_lex $P1128
    $P1128($P110)
  loop1130_next:
    goto loop1130_test
  loop1130_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, 'type'
    eq $P112, .CONTROL_LOOP_NEXT, loop1130_next
    eq $P112, .CONTROL_LOOP_REDO, loop1130_redo
  loop1130_done:
    pop_eh 
  for_undef_102:
.annotate 'line', 460
    find_lex $P1132, "%context"
    unless_null $P1132, vivify_103
    $P1132 = root_new ['parrot';'Hash']
  vivify_103:
    set $P107, $P1132["DEBUG"]
    unless_null $P107, vivify_104
    new $P107, "Undef"
  vivify_104:
    unless $P107, if_1131_end
    find_lex $P108, "self"
    new $P109, 'String'
    set $P109, "Middle "
    find_lex $P110, "$bc"
    set $N101, $P110
    set $S101, $N101
    concat $P110, $P109, $S101
    $P108."debug"($P110)
  if_1131_end:
.annotate 'line', 463
    find_lex $P1134, "%context"
    unless_null $P1134, vivify_105
    $P1134 = root_new ['parrot';'Hash']
  vivify_105:
    set $P107, $P1134["DEBUG"]
    unless_null $P107, vivify_106
    new $P107, "Undef"
  vivify_106:
    unless $P107, if_1133_end
    find_lex $P108, "self"
    $P108."debug"("Emitting default return")
  if_1133_end:
.annotate 'line', 464
    find_lex $P107, "$bc"
.annotate 'line', 465
    new $P108, "ResizablePMCArray"
    push $P108, "set_returns_pc"
    push $P108, 0
    $P107."push"($P108)
.annotate 'line', 469
    find_lex $P107, "$bc"
    new $P108, "ResizablePMCArray"
    push $P108, "returncc"
    $P107."push"($P108)
.annotate 'line', 473
    find_lex $P107, "$bc"
    set $N101, $P107
    new $P108, 'Float'
    set $P108, $N101
    store_lex "$end_offset", $P108
.annotate 'line', 474
    find_lex $P1136, "%context"
    unless_null $P1136, vivify_107
    $P1136 = root_new ['parrot';'Hash']
  vivify_107:
    set $P107, $P1136["DEBUG"]
    unless_null $P107, vivify_108
    new $P107, "Undef"
  vivify_108:
    unless $P107, if_1135_end
    find_lex $P108, "self"
    new $P109, 'String'
    set $P109, "To "
    find_lex $P110, "$end_offset"
    concat $P111, $P109, $P110
    $P108."debug"($P111)
  if_1135_end:
.annotate 'line', 477
    find_lex $P107, "self"
    find_lex $P108, "$sub"
    find_lex $P1137, "%context"
    unless_null $P1137, vivify_109
    $P1137 = root_new ['parrot';'Hash']
  vivify_109:
    set $P109, $P1137["labels_todo"]
    unless_null $P109, vivify_110
    new $P109, "Undef"
  vivify_110:
    find_lex $P1138, "%context"
    unless_null $P1138, vivify_111
    $P1138 = root_new ['parrot';'Hash']
  vivify_111:
    set $P110, $P1138["bytecode"]
    unless_null $P110, vivify_112
    new $P110, "Undef"
  vivify_112:
    find_lex $P111, "%context"
    $P107."fixup_labels"($P108, $P109, $P110, $P111)
.annotate 'line', 480
    find_lex $P107, "$start_offset"
    find_lex $P108, "$end_offset"
    find_lex $P109, "$subname"
.annotate 'line', 485
    find_lex $P1140, "$sub"
    unless_null $P1140, vivify_113
    $P1140 = root_new ['parrot';'Hash']
  vivify_113:
    set $P110, $P1140["subid"]
    unless_null $P110, vivify_114
    new $P110, "Undef"
  vivify_114:
    set $P1139, $P110
    defined $I1142, $P1139
    if $I1142, default_1141
    find_lex $P111, "$subname"
    set $P1139, $P111
  default_1141:
.annotate 'line', 486
    find_lex $P112, "$sub"
    $P113 = $P112."nsentry"()
    set $P1143, $P113
    defined $I1145, $P1143
    if $I1145, default_1144
    find_lex $P114, "$subname"
    set $P1143, $P114
  default_1144:
.annotate 'line', 489
    find_lex $P116, "$sub"
    $P117 = $P116."is_method"()
    if $P117, if_1146
    new $P119, "String"
    assign $P119, ""
    set $P115, $P119
    goto if_1146_end
  if_1146:
    find_lex $P118, "$subname"
    set $P115, $P118
  if_1146_end:
.annotate 'line', 480
    find_lex $P120, "@n_regs_used"
.annotate 'line', 493
    find_lex $P121, "self"
    find_lex $P122, "$sub"
    find_lex $P123, "%context"
    $P124 = $P121."create_sub_pf_flags"($P122, $P123)
.annotate 'line', 494
    find_lex $P125, "self"
    find_lex $P126, "$sub"
    find_lex $P127, "%context"
    $P128 = $P125."create_sub_comp_flags"($P126, $P127)
.annotate 'line', 480
    $P129 = "hash"($P107 :named("start_offs"), $P108 :named("end_offs"), $P109 :named("name"), $P1139 :named("subid"), $P1143 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P115 :named("method_name"), $P120 :named("n_regs_used"), $P124 :named("pf_flags"), $P128 :named("comp_flags"))
    store_lex "%sub", $P129
.annotate 'line', 497
    find_lex $P107, "$sub"
    $P108 = $P107."namespace"()
    $P109 = "defined"($P108)
    unless $P109, if_1147_end
    .const 'Sub' $P1149 = "26_1310682738.42772" 
    capture_lex $P1149
    $P1149()
  if_1147_end:
.annotate 'line', 507
    find_lex $P107, "$sub"
    $P108 = $P107."constant_index"()
    store_lex "$idx", $P108
.annotate 'line', 508
    find_lex $P107, "$idx"
    $P108 = "defined"($P107)
    if $P108, if_1153
.annotate 'line', 513
    find_lex $P1158, "%context"
    unless_null $P1158, vivify_117
    $P1158 = root_new ['parrot';'Hash']
  vivify_117:
    set $P109, $P1158["constants"]
    unless_null $P109, vivify_118
    new $P109, "Undef"
  vivify_118:
    find_lex $P110, "%sub"
    $P111 = "new"("Sub", $P110)
    $P112 = $P109."push"($P111)
    store_lex "$idx", $P112
.annotate 'line', 514
    find_lex $P109, "$sub"
    find_lex $P110, "$idx"
    $P109."constant_index"($P110)
.annotate 'line', 515
    find_lex $P1160, "%context"
    unless_null $P1160, vivify_119
    $P1160 = root_new ['parrot';'Hash']
  vivify_119:
    set $P109, $P1160["DEBUG"]
    unless_null $P109, vivify_120
    new $P109, "Undef"
  vivify_120:
    unless $P109, if_1159_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Allocate new constant "
    find_lex $P112, "$idx"
    concat $P113, $P111, $P112
    $P110."debug"($P113)
  if_1159_end:
.annotate 'line', 512
    goto if_1153_end
  if_1153:
.annotate 'line', 509
    find_lex $P1155, "%context"
    unless_null $P1155, vivify_121
    $P1155 = root_new ['parrot';'Hash']
  vivify_121:
    set $P109, $P1155["DEBUG"]
    unless_null $P109, vivify_122
    new $P109, "Undef"
  vivify_122:
    unless $P109, if_1154_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "Reusing old constant "
    find_lex $P112, "$idx"
    concat $P113, $P111, $P112
    $P110."debug"($P113)
  if_1154_end:
.annotate 'line', 510
    find_lex $P109, "%sub"
    $P110 = "new"("Sub", $P109)
    find_lex $P111, "$idx"
    set $I101, $P111
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
    set $P1157[$I101], $P110
  if_1153_end:
.annotate 'line', 519
    find_lex $P1162, "%context"
    unless_null $P1162, vivify_125
    $P1162 = root_new ['parrot';'Hash']
  vivify_125:
    set $P108, $P1162["got_main_sub"]
    unless_null $P108, vivify_126
    new $P108, "Undef"
  vivify_126:
    isfalse $I101, $P108
    if $I101, if_1161
    new $P107, 'Integer'
    set $P107, $I101
    goto if_1161_end
  if_1161:
.annotate 'line', 520
    find_lex $P1164, "%context"
    unless_null $P1164, vivify_127
    $P1164 = root_new ['parrot';'Hash']
  vivify_127:
    set $P109, $P1164["DEBUG"]
    unless_null $P109, vivify_128
    new $P109, "Undef"
  vivify_128:
    unless $P109, if_1163_end
    find_lex $P110, "self"
    new $P111, 'String'
    set $P111, "main_sub is "
    find_lex $P1165, "%context"
    unless_null $P1165, vivify_129
    $P1165 = root_new ['parrot';'Hash']
  vivify_129:
    set $P112, $P1165["bytecode"]
    unless_null $P112, vivify_130
    new $P112, "Undef"
  vivify_130:
    $P113 = $P112."main_sub"()
    set $S101, $P113
    concat $P112, $P111, $S101
    $P110."debug"($P112)
  if_1163_end:
.annotate 'line', 521
    find_lex $P109, "$sub"
    $P110 = $P109."main"()
    if $P110, if_1166
.annotate 'line', 527
    find_lex $P1172, "%context"
    unless_null $P1172, vivify_131
    $P1172 = root_new ['parrot';'Hash']
  vivify_131:
    set $P111, $P1172["bytecode"]
    unless_null $P111, vivify_132
    new $P111, "Undef"
  vivify_132:
    $N101 = $P111."main_sub"()
    iseq $I102, $N101, -1.0
    unless $I102, if_1171_end
.annotate 'line', 529
    find_lex $P1174, "%context"
    unless_null $P1174, vivify_133
    $P1174 = root_new ['parrot';'Hash']
  vivify_133:
    set $P112, $P1174["DEBUG"]
    unless_null $P112, vivify_134
    new $P112, "Undef"
  vivify_134:
    unless $P112, if_1173_end
    find_lex $P113, "self"
    $P113."debug"("Got first sub")
  if_1173_end:
.annotate 'line', 530
    find_lex $P1175, "%context"
    unless_null $P1175, vivify_135
    $P1175 = root_new ['parrot';'Hash']
  vivify_135:
    set $P112, $P1175["bytecode"]
    unless_null $P112, vivify_136
    new $P112, "Undef"
  vivify_136:
    find_lex $P113, "$idx"
    $P112."main_sub"($P113)
  if_1171_end:
.annotate 'line', 527
    goto if_1166_end
  if_1166:
.annotate 'line', 522
    find_lex $P1168, "%context"
    unless_null $P1168, vivify_137
    $P1168 = root_new ['parrot';'Hash']
  vivify_137:
    set $P111, $P1168["DEBUG"]
    unless_null $P111, vivify_138
    new $P111, "Undef"
  vivify_138:
    unless $P111, if_1167_end
    find_lex $P112, "self"
    $P112."debug"("Got first :main")
  if_1167_end:
.annotate 'line', 524
    find_lex $P1169, "%context"
    unless_null $P1169, vivify_139
    $P1169 = root_new ['parrot';'Hash']
  vivify_139:
    set $P111, $P1169["bytecode"]
    unless_null $P111, vivify_140
    new $P111, "Undef"
  vivify_140:
    find_lex $P112, "$idx"
    $P111."main_sub"($P112)
.annotate 'line', 525
    new $P111, "Integer"
    assign $P111, 1
    find_lex $P1170, "%context"
    unless_null $P1170, vivify_141
    $P1170 = root_new ['parrot';'Hash']
    store_lex "%context", $P1170
  vivify_141:
    set $P1170["got_main_sub"], $P111
  if_1166_end:
.annotate 'line', 533
    find_lex $P1177, "%context"
    unless_null $P1177, vivify_142
    $P1177 = root_new ['parrot';'Hash']
  vivify_142:
    set $P110, $P1177["DEBUG"]
    unless_null $P110, vivify_143
    new $P110, "Undef"
  vivify_143:
    if $P110, if_1176
    set $P109, $P110
    goto if_1176_end
  if_1176:
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, ":main sub is "
    find_lex $P1178, "%context"
    unless_null $P1178, vivify_144
    $P1178 = root_new ['parrot';'Hash']
  vivify_144:
    set $P113, $P1178["bytecode"]
    unless_null $P113, vivify_145
    new $P113, "Undef"
  vivify_145:
    $P114 = $P113."main_sub"()
    set $S101, $P114
    concat $P113, $P112, $S101
    $P115 = $P111."debug"($P113)
    set $P109, $P115
  if_1176_end:
.annotate 'line', 519
    set $P107, $P109
  if_1161_end:
.annotate 'line', 422
    .return ($P107)
  control_1092:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"Compiler"]
.sub "_block1127"  :anon :subid("25_1310682738.42772") :outer("24_1310682738.42772")
    .param pmc param_1129
.annotate 'file', ''
.annotate 'line', 456
    .lex "$_", param_1129
.annotate 'line', 457
    find_lex $P111, "self"
    find_lex $P112, "$_"
    find_lex $P113, "%context"
    $P114 = $P111."to_pbc"($P112, $P113)
.annotate 'line', 456
    .return ($P114)
.end


.namespace ["POST";"Compiler"]
.sub "_block1148"  :anon :subid("26_1310682738.42772") :outer("24_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 498
    new $P110, "Undef"
    set $P1150, $P110
    .lex "$nskey", $P1150
    find_lex $P111, "$sub"
    $P112 = $P111."namespace"()
    find_lex $P113, "%context"
    $P114 = $P112."to_pmc"($P113)
    set $P115, $P114[0]
    unless_null $P115, vivify_115
    new $P115, "Undef"
  vivify_115:
    store_lex "$nskey", $P115
.annotate 'line', 499
    find_lex $P112, "$nskey"
    typeof $S101, $P112
    iseq $I101, $S101, "Key"
    if $I101, if_1151
    new $P111, 'Integer'
    set $P111, $I101
    goto if_1151_end
  if_1151:
.annotate 'line', 500
    find_lex $P113, "$nskey"
    find_lex $P1152, "%sub"
    unless_null $P1152, vivify_116
    $P1152 = root_new ['parrot';'Hash']
    store_lex "%sub", $P1152
  vivify_116:
    set $P1152["namespace_name"], $P113
.annotate 'line', 499
    set $P111, $P113
  if_1151_end:
.annotate 'line', 497
    .return ($P111)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("27_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Op"],_)
    .param pmc param_1182
    .param pmc param_1183
.annotate 'file', ''
.annotate 'line', 537
    .const 'Sub' $P1201 = "29_1310682738.42772" 
    capture_lex $P1201
    .const 'Sub' $P1190 = "28_1310682738.42772" 
    capture_lex $P1190
    new $P1181, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1181, control_1180
    push_eh $P1181
    .lex "self", self
    .lex "$op", param_1182
    .lex "%context", param_1183
.annotate 'line', 539
    new $P101, "Undef"
    set $P1184, $P101
    .lex "$fullname", $P1184
.annotate 'line', 554
    $P1186 = root_new ['parrot';'ResizablePMCArray']
    set $P1185, $P1186
    .lex "@op", $P1185
.annotate 'line', 539
    find_lex $P102, "$op"
    $P103 = $P102."pirop"()
    store_lex "$fullname", $P103
.annotate 'line', 540
    find_lex $P1188, "%context"
    unless_null $P1188, vivify_146
    $P1188 = root_new ['parrot';'Hash']
  vivify_146:
    set $P102, $P1188["DEBUG"]
    unless_null $P102, vivify_147
    new $P102, "Undef"
  vivify_147:
    unless $P102, if_1187_end
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "Short name "
    find_lex $P105, "$fullname"
    concat $P106, $P104, $P105
    $P103."debug"($P106)
  if_1187_end:
.annotate 'line', 542
    find_lex $P103, "$op"
    $P104 = $P103."list"()
    defined $I101, $P104
    unless $I101, for_undef_148
    iter $P102, $P104
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1194_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1194_test:
    unless $P102, loop1194_done
    shift $P105, $P102
  loop1194_redo:
    .const 'Sub' $P1190 = "28_1310682738.42772" 
    capture_lex $P1190
    $P1190($P105)
  loop1194_next:
    goto loop1194_test
  loop1194_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1194_next
    eq $P108, .CONTROL_LOOP_REDO, loop1194_redo
  loop1194_done:
    pop_eh 
  for_undef_148:
.annotate 'line', 547
    find_lex $P1196, "%context"
    unless_null $P1196, vivify_149
    $P1196 = root_new ['parrot';'Hash']
  vivify_149:
    set $P102, $P1196["DEBUG"]
    unless_null $P102, vivify_150
    new $P102, "Undef"
  vivify_150:
    unless $P102, if_1195_end
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "Fullname "
    find_lex $P105, "$fullname"
    concat $P106, $P104, $P105
    $P103."debug"($P106)
  if_1195_end:
.annotate 'line', 550
    find_lex $P1197, "%context"
    unless_null $P1197, vivify_151
    $P1197 = root_new ['parrot';'Hash']
  vivify_151:
    set $P102, $P1197["bytecode"]
    unless_null $P102, vivify_152
    new $P102, "Undef"
  vivify_152:
    set $N101, $P102
    new $P103, 'Float'
    set $P103, $N101
    find_lex $P1198, "%context"
    unless_null $P1198, vivify_153
    $P1198 = root_new ['parrot';'Hash']
    store_lex "%context", $P1198
  vivify_153:
    set $P1198["opcode_offset"], $P103
.annotate 'line', 552
    find_lex $P102, "$fullname"
    find_lex $P1199, "%context"
    unless_null $P1199, vivify_154
    $P1199 = root_new ['parrot';'Hash']
    store_lex "%context", $P1199
  vivify_154:
    set $P1199["opcode_fullname"], $P102
.annotate 'line', 554
    find_lex $P102, "$fullname"
    $P103 = "list"($P102)
    store_lex "@op", $P103
.annotate 'line', 555
    find_lex $P103, "$op"
    $P104 = $P103."list"()
    defined $I101, $P104
    unless $I101, for_undef_155
    iter $P102, $P104
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1203_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1203_test:
    unless $P102, loop1203_done
    shift $P105, $P102
  loop1203_redo:
    .const 'Sub' $P1201 = "29_1310682738.42772" 
    capture_lex $P1201
    $P1201($P105)
  loop1203_next:
    goto loop1203_test
  loop1203_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop1203_next
    eq $P107, .CONTROL_LOOP_REDO, loop1203_redo
  loop1203_done:
    pop_eh 
  for_undef_155:
.annotate 'line', 558
    find_lex $P1205, "%context"
    unless_null $P1205, vivify_156
    $P1205 = root_new ['parrot';'Hash']
  vivify_156:
    set $P102, $P1205["DEBUG"]
    unless_null $P102, vivify_157
    new $P102, "Undef"
  vivify_157:
    unless $P102, if_1204_end
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "Op size "
    find_lex $P105, "@op"
    set $N101, $P105
    set $S101, $N101
    concat $P105, $P104, $S101
    $P103."debug"($P105)
  if_1204_end:
.annotate 'line', 559
    find_lex $P1206, "%context"
    unless_null $P1206, vivify_158
    $P1206 = root_new ['parrot';'Hash']
  vivify_158:
    set $P102, $P1206["bytecode"]
    unless_null $P102, vivify_159
    new $P102, "Undef"
  vivify_159:
    find_lex $P103, "@op"
    $P104 = $P102."push"($P103)
.annotate 'line', 537
    .return ($P104)
  control_1180:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"Compiler"]
.sub "_block1189"  :anon :subid("28_1310682738.42772") :outer("27_1310682738.42772")
    .param pmc param_1192
.annotate 'file', ''
.annotate 'line', 543
    new $P106, "Undef"
    set $P1191, $P106
    .lex "$type", $P1191
    .lex "$_", param_1192
    find_lex $P108, "$_"
    $P109 = $P108."type"()
    unless $P109, unless_1193
    set $P107, $P109
    goto unless_1193_end
  unless_1193:
    find_lex $P110, "self"
    find_lex $P111, "$_"
    $P112 = $P111."name"()
    find_lex $P113, "%context"
    $P114 = $P110."get_register"($P112, $P113)
    $P115 = $P114."type"()
    set $P107, $P115
  unless_1193_end:
    store_lex "$type", $P107
.annotate 'line', 544
    find_lex $P107, "$fullname"
    set $S101, $P107
    new $P108, 'String'
    set $P108, $S101
    concat $P109, $P108, "_"
    find_lex $P110, "$type"
    set $S102, $P110
    concat $P111, $P109, $S102
    store_lex "$fullname", $P111
.annotate 'line', 542
    .return ($P111)
.end


.namespace ["POST";"Compiler"]
.sub "_block1200"  :anon :subid("29_1310682738.42772") :outer("27_1310682738.42772")
    .param pmc param_1202
.annotate 'file', ''
.annotate 'line', 555
    .lex "$_", param_1202
.annotate 'line', 556
    find_lex $P106, "@op"
    find_lex $P107, "self"
    find_lex $P108, "$_"
    find_lex $P109, "%context"
    $P110 = $P107."to_op"($P108, $P109)
    $P111 = $P106."push"($P110)
.annotate 'line', 555
    .return ($P111)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Node"],_)
    .param pmc param_1210
    .param pmc param_1211
.annotate 'file', ''
.annotate 'line', 563
    .const 'Sub' $P1213 = "31_1310682738.42772" 
    capture_lex $P1213
    new $P1209, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1209, control_1208
    push_eh $P1209
    .lex "self", self
    .lex "$node", param_1210
    .lex "%context", param_1211
.annotate 'line', 564
    find_lex $P102, "$node"
    $P103 = $P102."list"()
    defined $I101, $P103
    unless $I101, for_undef_160
    iter $P101, $P103
    new $P105, 'ExceptionHandler'
    set_label $P105, loop1215_handler
    $P105."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P105
  loop1215_test:
    unless $P101, loop1215_done
    shift $P104, $P101
  loop1215_redo:
    .const 'Sub' $P1213 = "31_1310682738.42772" 
    capture_lex $P1213
    $P1213($P104)
  loop1215_next:
    goto loop1215_test
  loop1215_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, 'type'
    eq $P106, .CONTROL_LOOP_NEXT, loop1215_next
    eq $P106, .CONTROL_LOOP_REDO, loop1215_redo
  loop1215_done:
    pop_eh 
  for_undef_160:
.annotate 'line', 563
    .return ($P101)
  control_1208:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"Compiler"]
.sub "_block1212"  :anon :subid("31_1310682738.42772") :outer("30_1310682738.42772")
    .param pmc param_1214
.annotate 'file', ''
.annotate 'line', 564
    .lex "$_", param_1214
.annotate 'line', 565
    find_lex $P105, "self"
    find_lex $P106, "$_"
    find_lex $P107, "%context"
    $P108 = $P105."to_pbc"($P106, $P107)
.annotate 'line', 564
    .return ($P108)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("32_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Label"],_)
    .param pmc param_1219
    .param pmc param_1220
.annotate 'file', ''
.annotate 'line', 569
    .const 'Sub' $P1228 = "33_1310682738.42772" 
    capture_lex $P1228
    new $P1218, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1218, control_1217
    push_eh $P1218
    .lex "self", self
    .lex "$l", param_1219
    .lex "%context", param_1220
.annotate 'line', 570
    new $P101, "Undef"
    set $P1221, $P101
    .lex "$bc", $P1221
.annotate 'line', 573
    new $P102, "Undef"
    set $P1222, $P102
    .lex "$pos", $P1222
.annotate 'line', 570
    find_lex $P1223, "%context"
    unless_null $P1223, vivify_161
    $P1223 = root_new ['parrot';'Hash']
  vivify_161:
    set $P103, $P1223["bytecode"]
    unless_null $P103, vivify_162
    new $P103, "Undef"
  vivify_162:
    store_lex "$bc", $P103
.annotate 'line', 571
    find_lex $P103, "$l"
    $P104 = $P103."declared"()
    if $P104, unless_1224_end
    find_lex $P105, "self"
    $P105."panic"("Trying to emit undelcared label!")
  unless_1224_end:
.annotate 'line', 573
    find_lex $P103, "$bc"
    set $N101, $P103
    new $P104, 'Float'
    set $P104, $N101
    store_lex "$pos", $P104
.annotate 'line', 574
    find_lex $P1226, "%context"
    unless_null $P1226, vivify_163
    $P1226 = root_new ['parrot';'Hash']
  vivify_163:
    set $P103, $P1226["DEBUG"]
    unless_null $P103, vivify_164
    new $P103, "Undef"
  vivify_164:
    unless $P103, if_1225_end
    find_lex $P104, "self"
    new $P105, 'String'
    set $P105, "Declare label '"
    find_lex $P106, "$l"
    $P107 = $P106."name"()
    set $S101, $P107
    concat $P106, $P105, $S101
    concat $P108, $P106, "' at "
    find_lex $P109, "$pos"
    concat $P110, $P108, $P109
    $P104."debug"($P110)
  if_1225_end:
.annotate 'line', 576
    find_lex $P103, "$l"
    find_lex $P104, "$pos"
    $P103."position"($P104)
.annotate 'line', 578
    find_lex $P104, "$l"
    $P105 = $P104."list"()
    defined $I101, $P105
    unless $I101, for_undef_165
    iter $P103, $P105
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1230_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1230_test:
    unless $P103, loop1230_done
    shift $P106, $P103
  loop1230_redo:
    .const 'Sub' $P1228 = "33_1310682738.42772" 
    capture_lex $P1228
    $P1228($P106)
  loop1230_next:
    goto loop1230_test
  loop1230_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1230_next
    eq $P108, .CONTROL_LOOP_REDO, loop1230_redo
  loop1230_done:
    pop_eh 
  for_undef_165:
.annotate 'line', 569
    .return ($P103)
  control_1217:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Compiler"]
.sub "_block1227"  :anon :subid("33_1310682738.42772") :outer("32_1310682738.42772")
    .param pmc param_1229
.annotate 'file', ''
.annotate 'line', 578
    .lex "$_", param_1229
.annotate 'line', 579
    find_lex $P107, "self"
    find_lex $P108, "$_"
    find_lex $P109, "%context"
    $P110 = $P107."to_pbc"($P108, $P109)
.annotate 'line', 578
    .return ($P110)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("34_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Call"],_)
    .param pmc param_1234
    .param pmc param_1235
.annotate 'file', ''
.annotate 'line', 583
    .const 'Sub' $P1252 = "35_1310682738.42772" 
    capture_lex $P1252
    new $P1233, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1233, control_1232
    push_eh $P1233
    .lex "self", self
    .lex "$call", param_1234
    .lex "%context", param_1235
.annotate 'line', 584
    new $P101, "Undef"
    set $P1236, $P101
    .lex "$bc", $P1236
.annotate 'line', 585
    new $P102, "Undef"
    set $P1237, $P102
    .lex "$calltype", $P1237
.annotate 'line', 586
    new $P103, "Undef"
    set $P1238, $P103
    .lex "$is_tailcall", $P1238
.annotate 'line', 584
    find_lex $P1239, "%context"
    unless_null $P1239, vivify_166
    $P1239 = root_new ['parrot';'Hash']
  vivify_166:
    set $P104, $P1239["bytecode"]
    unless_null $P104, vivify_167
    new $P104, "Undef"
  vivify_167:
    store_lex "$bc", $P104
.annotate 'line', 585
    find_lex $P104, "$call"
    $P105 = $P104."calltype"()
    store_lex "$calltype", $P105
.annotate 'line', 586
    find_lex $P104, "$calltype"
    set $S101, $P104
    iseq $I101, $S101, "tailcall"
    new $P105, 'Integer'
    set $P105, $I101
    store_lex "$is_tailcall", $P105
.annotate 'line', 588
    find_lex $P106, "$calltype"
    set $S101, $P106
    iseq $I101, $S101, "call"
    unless $I101, unless_1241
    new $P105, 'Integer'
    set $P105, $I101
    goto unless_1241_end
  unless_1241:
    find_lex $P107, "$calltype"
    set $S102, $P107
    iseq $I102, $S102, "tailcall"
    new $P105, 'Integer'
    set $P105, $I102
  unless_1241_end:
    if $P105, if_1240
.annotate 'line', 666
    find_lex $P110, "$calltype"
    set $S103, $P110
    iseq $I103, $S103, "return"
    if $I103, if_1291
.annotate 'line', 670
    find_lex $P112, "$calltype"
    set $S104, $P112
    iseq $I104, $S104, "results"
    if $I104, if_1293
.annotate 'line', 675
    find_lex $P114, "self"
    new $P115, 'String'
    set $P115, "NYI "
    find_lex $P116, "$calltype"
    set $S105, $P116
    concat $P118, $P115, $S105
    $P119 = $P114."panic"($P118)
.annotate 'line', 674
    set $P111, $P119
.annotate 'line', 670
    goto if_1293_end
  if_1293:
.annotate 'line', 672
    find_lex $P114, "self"
    find_lex $P1294, "$call"
    unless_null $P1294, vivify_168
    $P1294 = root_new ['parrot';'Hash']
  vivify_168:
    set $P115, $P1294["params"]
    unless_null $P115, vivify_169
    new $P115, "Undef"
  vivify_169:
    find_lex $P116, "%context"
    $P117 = $P114."build_pcc_call"("get_results_pc", $P115, $P116)
.annotate 'line', 670
    set $P111, $P117
  if_1293_end:
    set $P109, $P111
.annotate 'line', 666
    goto if_1291_end
  if_1291:
.annotate 'line', 667
    find_lex $P111, "self"
    find_lex $P1292, "$call"
    unless_null $P1292, vivify_170
    $P1292 = root_new ['parrot';'Hash']
  vivify_170:
    set $P112, $P1292["params"]
    unless_null $P112, vivify_171
    new $P112, "Undef"
  vivify_171:
    find_lex $P113, "%context"
    $P111."build_pcc_call"("set_returns_pc", $P112, $P113)
.annotate 'line', 668
    find_lex $P111, "$bc"
    new $P112, "ResizablePMCArray"
    push $P112, "returncc"
    $P113 = $P111."push"($P112)
.annotate 'line', 666
    set $P109, $P113
  if_1291_end:
    set $P104, $P109
.annotate 'line', 588
    goto if_1240_end
  if_1240:
.annotate 'line', 589
    find_lex $P108, "$call"
    $P109 = $P108."invocant"()
    unless $P109, if_1242_end
.annotate 'line', 590
    find_lex $P1244, "$call"
    unless_null $P1244, vivify_172
    $P1244 = root_new ['parrot';'Hash']
  vivify_172:
    set $P110, $P1244["params"]
    unless_null $P110, vivify_173
    new $P110, "Undef"
  vivify_173:
    if $P110, unless_1243_end
    $P111 = "list"()
    find_lex $P1245, "$call"
    unless_null $P1245, vivify_174
    $P1245 = root_new ['parrot';'Hash']
    store_lex "$call", $P1245
  vivify_174:
    set $P1245["params"], $P111
  unless_1243_end:
.annotate 'line', 591
    find_lex $P1246, "$call"
    unless_null $P1246, vivify_175
    $P1246 = root_new ['parrot';'Hash']
  vivify_175:
    set $P110, $P1246["params"]
    unless_null $P110, vivify_176
    new $P110, "Undef"
  vivify_176:
    find_lex $P111, "$call"
    $P112 = $P111."invocant"()
    $P110."unshift"($P112)
  if_1242_end:
.annotate 'line', 594
    find_lex $P108, "self"
    find_lex $P1247, "$call"
    unless_null $P1247, vivify_177
    $P1247 = root_new ['parrot';'Hash']
  vivify_177:
    set $P109, $P1247["params"]
    unless_null $P109, vivify_178
    new $P109, "Undef"
  vivify_178:
    find_lex $P110, "%context"
    $P108."build_pcc_call"("set_args_pc", $P109, $P110)
.annotate 'line', 596
    find_lex $P108, "$call"
    $P109 = $P108."invocant"()
    if $P109, if_1248
.annotate 'line', 610
    .const 'Sub' $P1252 = "35_1310682738.42772" 
    capture_lex $P1252
    $P1252()
    goto if_1248_end
  if_1248:
.annotate 'line', 597
    find_lex $P110, "$call"
    $P111 = $P110."name"()
    get_hll_global $P112, ["POST"], "Constant"
    $P113 = $P111."isa"($P112)
    if $P113, if_1249
.annotate 'line', 607
    find_lex $P114, "self"
    $P114."panic"("NYI $P0.$S0()")
.annotate 'line', 606
    goto if_1249_end
  if_1249:
.annotate 'line', 598
    find_lex $P114, "$bc"
.annotate 'line', 600
    find_lex $P116, "$is_tailcall"
    if $P116, if_1250
    new $P118, "String"
    assign $P118, "callmethodcc_p_sc"
    set $P115, $P118
    goto if_1250_end
  if_1250:
    new $P117, "String"
    assign $P117, "tailcallmethod_p_sc"
    set $P115, $P117
  if_1250_end:
.annotate 'line', 602
    find_lex $P119, "self"
    find_lex $P120, "$call"
    $P121 = $P120."invocant"()
    find_lex $P122, "%context"
    $P123 = $P119."to_op"($P121, $P122)
.annotate 'line', 603
    find_lex $P124, "self"
    find_lex $P125, "$call"
    $P126 = $P125."name"()
    find_lex $P127, "%context"
    $P128 = $P124."to_op"($P126, $P127)
    new $P129, "ResizablePMCArray"
    push $P129, $P115
    push $P129, $P123
    push $P129, $P128
    $P114."push"($P129)
  if_1249_end:
  if_1248_end:
.annotate 'line', 662
    find_lex $P109, "$is_tailcall"
    unless $P109, unless_1289
    set $P108, $P109
    goto unless_1289_end
  unless_1289:
.annotate 'line', 663
    find_lex $P110, "self"
    find_lex $P1290, "$call"
    unless_null $P1290, vivify_208
    $P1290 = root_new ['parrot';'Hash']
  vivify_208:
    set $P111, $P1290["results"]
    unless_null $P111, vivify_209
    new $P111, "Undef"
  vivify_209:
    find_lex $P112, "%context"
    $P113 = $P110."build_pcc_call"("get_results_pc", $P111, $P112)
.annotate 'line', 662
    set $P108, $P113
  unless_1289_end:
.annotate 'line', 588
    set $P104, $P108
  if_1240_end:
.annotate 'line', 583
    .return ($P104)
  control_1232:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"Compiler"]
.sub "_block1251"  :anon :subid("35_1310682738.42772") :outer("34_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 610
    .const 'Sub' $P1258 = "36_1310682738.42772" 
    capture_lex $P1258
.annotate 'line', 611
    new $P110, "Undef"
    set $P1253, $P110
    .lex "$SUB", $P1253
.annotate 'line', 612
    new $P111, "Undef"
    set $P1254, $P111
    .lex "$processed", $P1254
.annotate 'line', 656
    new $P112, "Undef"
    set $P1255, $P112
    .lex "$o", $P1255
.annotate 'line', 610
    find_lex $P113, "$SUB"
.annotate 'line', 612
    new $P113, "Integer"
    assign $P113, 0
    store_lex "$processed", $P113
.annotate 'line', 613
    find_lex $P113, "$call"
    $P114 = $P113."name"()
    get_hll_global $P115, ["POST"], "Constant"
    $P116 = $P114."isa"($P115)
    unless $P116, if_1256_end
    .const 'Sub' $P1258 = "36_1310682738.42772" 
    capture_lex $P1258
    $P1258()
  if_1256_end:
.annotate 'line', 641
    find_lex $P113, "$processed"
    if $P113, unless_1278_end
.annotate 'line', 642
    find_lex $P114, "$call"
    $P115 = $P114."name"()
    get_hll_global $P116, ["POST"], "Constant"
    $P117 = $P115."isa"($P116)
    if $P117, if_1279
.annotate 'line', 651
    find_lex $P1283, "%context"
    unless_null $P1283, vivify_196
    $P1283 = root_new ['parrot';'Hash']
  vivify_196:
    set $P118, $P1283["DEBUG"]
    unless_null $P118, vivify_197
    new $P118, "Undef"
  vivify_197:
    unless $P118, if_1282_end
    find_lex $P119, "self"
    new $P120, "String"
    assign $P120, "Name is "
    find_lex $P1284, "$call"
    unless_null $P1284, vivify_198
    $P1284 = root_new ['parrot';'Hash']
  vivify_198:
    set $P121, $P1284["name"]
    unless_null $P121, vivify_199
    new $P121, "Undef"
  vivify_199:
    $S103 = $P121."WHAT"()
    concat $P122, $P120, $S103
    $P119."debug"($P122)
  if_1282_end:
.annotate 'line', 652
    find_lex $P1285, "$call"
    unless_null $P1285, vivify_200
    $P1285 = root_new ['parrot';'Hash']
  vivify_200:
    set $P118, $P1285["name"]
    unless_null $P118, vivify_201
    new $P118, "Undef"
  vivify_201:
    store_lex "$SUB", $P118
.annotate 'line', 650
    goto if_1279_end
  if_1279:
.annotate 'line', 643
    find_lex $P1280, "%context"
    unless_null $P1280, vivify_202
    $P1280 = root_new ['parrot';'Hash']
  vivify_202:
    set $P118, $P1280["sub"]
    unless_null $P118, vivify_203
    new $P118, "Undef"
  vivify_203:
    $P119 = $P118."symbol"("!SUB")
    store_lex "$SUB", $P119
.annotate 'line', 644
    find_lex $P118, "$bc"
.annotate 'line', 646
    find_lex $P119, "self"
    find_lex $P120, "$SUB"
    find_lex $P121, "%context"
    $P122 = $P119."to_op"($P120, $P121)
.annotate 'line', 647
    find_lex $P123, "self"
    find_lex $P1281, "$call"
    unless_null $P1281, vivify_204
    $P1281 = root_new ['parrot';'Hash']
  vivify_204:
    set $P124, $P1281["name"]
    unless_null $P124, vivify_205
    new $P124, "Undef"
  vivify_205:
    find_lex $P125, "%context"
    $P126 = $P123."to_op"($P124, $P125)
    new $P127, "ResizablePMCArray"
    push $P127, "find_sub_not_null_p_sc"
    push $P127, $P122
    push $P127, $P126
    $P118."push"($P127)
  if_1279_end:
  unless_1278_end:
.annotate 'line', 656
    find_lex $P114, "$is_tailcall"
    if $P114, if_1286
    new $P116, "String"
    assign $P116, "invokecc_p"
    set $P113, $P116
    goto if_1286_end
  if_1286:
    new $P115, "String"
    assign $P115, "tailcall_p"
    set $P113, $P115
  if_1286_end:
    store_lex "$o", $P113
.annotate 'line', 658
    find_lex $P1288, "%context"
    unless_null $P1288, vivify_206
    $P1288 = root_new ['parrot';'Hash']
  vivify_206:
    set $P113, $P1288["DEBUG"]
    unless_null $P113, vivify_207
    new $P113, "Undef"
  vivify_207:
    unless $P113, if_1287_end
    find_lex $P114, "self"
    find_lex $P115, "$o"
    $P114."debug"($P115)
  if_1287_end:
.annotate 'line', 659
    find_lex $P113, "$bc"
    find_lex $P114, "$o"
    find_lex $P115, "self"
    find_lex $P116, "$SUB"
    find_lex $P117, "%context"
    $P118 = $P115."to_op"($P116, $P117)
    new $P119, "ResizablePMCArray"
    push $P119, $P114
    push $P119, $P118
    $P120 = $P113."push"($P119)
.annotate 'line', 610
    .return ($P120)
.end


.namespace ["POST";"Compiler"]
.sub "_block1257"  :anon :subid("36_1310682738.42772") :outer("35_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 613
    .const 'Sub' $P1271 = "37_1310682738.42772" 
    capture_lex $P1271
.annotate 'line', 616
    new $P117, "Undef"
    set $P1259, $P117
    .lex "$full_name", $P1259
.annotate 'line', 619
    new $P118, "Undef"
    set $P1260, $P118
    .lex "$invocable_sub", $P1260
.annotate 'line', 613
    find_lex $P119, "$full_name"
.annotate 'line', 617
    find_lex $P1262, "%context"
    unless_null $P1262, vivify_179
    $P1262 = root_new ['parrot';'Hash']
  vivify_179:
    set $P119, $P1262["sub"]
    unless_null $P119, vivify_180
    new $P119, "Undef"
  vivify_180:
    $P120 = $P119."namespace"()
    unless $P120, if_1261_end
    find_lex $P1263, "%context"
    unless_null $P1263, vivify_181
    $P1263 = root_new ['parrot';'Hash']
  vivify_181:
    set $P121, $P1263["sub"]
    unless_null $P121, vivify_182
    new $P121, "Undef"
  vivify_182:
    $P122 = $P121."namespace"()
    $P123 = $P122."Str"()
    store_lex "$full_name", $P123
  if_1261_end:
.annotate 'line', 618
    find_lex $P119, "$full_name"
    set $S103, $P119
    new $P120, 'String'
    set $P120, $S103
    find_lex $P1264, "$call"
    unless_null $P1264, vivify_183
    $P1264 = root_new ['parrot';'Hash']
  vivify_183:
    set $P1265, $P1264["name"]
    unless_null $P1265, vivify_184
    $P1265 = root_new ['parrot';'Hash']
  vivify_184:
    set $P121, $P1265["value"]
    unless_null $P121, vivify_185
    new $P121, "Undef"
  vivify_185:
    set $S104, $P121
    concat $P122, $P120, $S104
    store_lex "$full_name", $P122
.annotate 'line', 619
    find_lex $P1266, "%context"
    unless_null $P1266, vivify_186
    $P1266 = root_new ['parrot';'Hash']
  vivify_186:
    set $P119, $P1266["pir_file"]
    unless_null $P119, vivify_187
    new $P119, "Undef"
  vivify_187:
    find_lex $P120, "$full_name"
    $P121 = $P119."sub"($P120)
    store_lex "$invocable_sub", $P121
.annotate 'line', 620
    find_lex $P1268, "%context"
    unless_null $P1268, vivify_188
    $P1268 = root_new ['parrot';'Hash']
  vivify_188:
    set $P119, $P1268["DEBUG"]
    unless_null $P119, vivify_189
    new $P119, "Undef"
  vivify_189:
    unless $P119, if_1267_end
    find_lex $P120, "self"
    new $P121, 'String'
    set $P121, "invocable_sub '"
    find_lex $P122, "$full_name"
    concat $P123, $P121, $P122
    concat $P124, $P123, "'"
    $P120."debug"($P124)
  if_1267_end:
.annotate 'line', 621
    find_lex $P120, "$invocable_sub"
    if $P120, if_1269
    set $P119, $P120
    goto if_1269_end
  if_1269:
    .const 'Sub' $P1271 = "37_1310682738.42772" 
    capture_lex $P1271
    $P123 = $P1271()
    set $P119, $P123
  if_1269_end:
.annotate 'line', 613
    .return ($P119)
.end


.namespace ["POST";"Compiler"]
.sub "_block1270"  :anon :subid("37_1310682738.42772") :outer("36_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 622
    new $P121, "Undef"
    set $P1272, $P121
    .lex "$idx", $P1272
    find_lex $P122, "$invocable_sub"
    $P123 = $P122."constant_index"()
    store_lex "$idx", $P123
.annotate 'line', 623
    find_lex $P122, "$idx"
    $P123 = "defined"($P122)
    if $P123, unless_1273_end
.annotate 'line', 625
    find_lex $P1274, "%context"
    unless_null $P1274, vivify_190
    $P1274 = root_new ['parrot';'Hash']
  vivify_190:
    set $P124, $P1274["constants"]
    unless_null $P124, vivify_191
    new $P124, "Undef"
  vivify_191:
    $P125 = "new"("Integer")
    $P126 = $P124."push"($P125)
    store_lex "$idx", $P126
.annotate 'line', 626
    find_lex $P124, "$invocable_sub"
    find_lex $P125, "$idx"
    $P124."constant_index"($P125)
.annotate 'line', 627
    find_lex $P1276, "%context"
    unless_null $P1276, vivify_192
    $P1276 = root_new ['parrot';'Hash']
  vivify_192:
    set $P124, $P1276["DEBUG"]
    unless_null $P124, vivify_193
    new $P124, "Undef"
  vivify_193:
    unless $P124, if_1275_end
    find_lex $P125, "self"
    new $P126, 'String'
    set $P126, "Allocate constant for it "
    find_lex $P127, "$idx"
    concat $P128, $P126, $P127
    $P125."debug"($P128)
  if_1275_end:
  unless_1273_end:
.annotate 'line', 630
    find_lex $P1277, "%context"
    unless_null $P1277, vivify_194
    $P1277 = root_new ['parrot';'Hash']
  vivify_194:
    set $P122, $P1277["sub"]
    unless_null $P122, vivify_195
    new $P122, "Undef"
  vivify_195:
    $P123 = $P122."symbol"("!SUB")
    store_lex "$SUB", $P123
.annotate 'line', 631
    find_lex $P122, "$bc"
.annotate 'line', 633
    find_lex $P123, "self"
    find_lex $P124, "$SUB"
    find_lex $P125, "%context"
    $P126 = $P123."to_op"($P124, $P125)
    find_lex $P127, "$idx"
    new $P128, "ResizablePMCArray"
    push $P128, "set_p_pc"
    push $P128, $P126
    push $P128, $P127
.annotate 'line', 634
    $P122."push"($P128)
.annotate 'line', 637
    new $P122, "Integer"
    assign $P122, 1
    store_lex "$processed", $P122
.annotate 'line', 621
    .return ($P122)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Key"],_)
    .param pmc param_1298
    .param pmc param_1299
.annotate 'file', ''
.annotate 'line', 682
    new $P1297, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1297, control_1296
    push_eh $P1297
    .lex "self", self
    .lex "$key", param_1298
    .lex "%context", param_1299
.annotate 'line', 685
    new $P101, "Undef"
    set $P1300, $P101
    .lex "$key_pmc", $P1300
.annotate 'line', 691
    new $P102, "Undef"
    set $P1301, $P102
    .lex "$constants", $P1301
.annotate 'line', 692
    new $P103, "Undef"
    set $P1302, $P103
    .lex "$idx", $P1302
.annotate 'line', 684
    find_lex $P1304, "%context"
    unless_null $P1304, vivify_210
    $P1304 = root_new ['parrot';'Hash']
  vivify_210:
    set $P104, $P1304["DEBUG"]
    unless_null $P104, vivify_211
    new $P104, "Undef"
  vivify_211:
    unless $P104, if_1303_end
    find_lex $P105, "self"
    $P105."debug"("Want key")
  if_1303_end:
.annotate 'line', 685
    find_lex $P104, "$key"
    find_lex $P105, "%context"
    $P106 = $P104."to_pmc"($P105)
    set $P107, $P106[0]
    unless_null $P107, vivify_212
    new $P107, "Undef"
  vivify_212:
    store_lex "$key_pmc", $P107
.annotate 'line', 686
    find_lex $P1306, "%context"
    unless_null $P1306, vivify_213
    $P1306 = root_new ['parrot';'Hash']
  vivify_213:
    set $P104, $P1306["DEBUG"]
    unless_null $P104, vivify_214
    new $P104, "Undef"
  vivify_214:
    unless $P104, if_1305_end
    find_lex $P105, "self"
    $P105."debug"("Got key")
  if_1305_end:
.annotate 'line', 691
    find_lex $P1307, "%context"
    unless_null $P1307, vivify_215
    $P1307 = root_new ['parrot';'Hash']
  vivify_215:
    set $P104, $P1307["constants"]
    unless_null $P104, vivify_216
    new $P104, "Undef"
  vivify_216:
    store_lex "$constants", $P104
.annotate 'line', 682
    find_lex $P104, "$idx"
.annotate 'line', 693

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
.annotate 'line', 682
    find_lex $P104, "$idx"
    .return ($P104)
  control_1296:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("39_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Constant"],_)
    .param pmc param_1311
    .param pmc param_1312
.annotate 'file', ''
.annotate 'line', 709
    new $P1310, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1310, control_1309
    push_eh $P1310
    .lex "self", self
    .lex "$op", param_1311
    .lex "%context", param_1312
.annotate 'line', 710
    new $P101, "Undef"
    set $P1313, $P101
    .lex "$idx", $P1313
.annotate 'line', 711
    new $P102, "Undef"
    set $P1314, $P102
    .lex "$type", $P1314
.annotate 'line', 709
    find_lex $P103, "$idx"
.annotate 'line', 711
    find_lex $P103, "$op"
    $P104 = $P103."type"()
    store_lex "$type", $P104
.annotate 'line', 712
    find_lex $P104, "$type"
    set $S101, $P104
    iseq $I101, $S101, "ic"
    unless $I101, unless_1316
    new $P103, 'Integer'
    set $P103, $I101
    goto unless_1316_end
  unless_1316:
    find_lex $P105, "$type"
    set $S102, $P105
    iseq $I102, $S102, "kic"
    new $P103, 'Integer'
    set $P103, $I102
  unless_1316_end:
    if $P103, if_1315
.annotate 'line', 715
    find_lex $P106, "$type"
    set $S103, $P106
    iseq $I103, $S103, "nc"
    if $I103, if_1317
.annotate 'line', 719
    find_lex $P107, "self"
    $P107."panic"("NYI")
.annotate 'line', 718
    goto if_1317_end
  if_1317:
.annotate 'line', 716
    find_lex $P1318, "%context"
    unless_null $P1318, vivify_217
    $P1318 = root_new ['parrot';'Hash']
  vivify_217:
    set $P107, $P1318["constants"]
    unless_null $P107, vivify_218
    new $P107, "Undef"
  vivify_218:
    find_lex $P108, "$op"
    $P109 = $P108."value"()
    $P110 = $P107."get_or_create_number"($P109)
    store_lex "$idx", $P110
  if_1317_end:
.annotate 'line', 715
    goto if_1315_end
  if_1315:
.annotate 'line', 713
    find_lex $P106, "$op"
    $P107 = $P106."value"()
    store_lex "$idx", $P107
  if_1315_end:
.annotate 'line', 722
    find_lex $P1320, "%context"
    unless_null $P1320, vivify_219
    $P1320 = root_new ['parrot';'Hash']
  vivify_219:
    set $P103, $P1320["DEBUG"]
    unless_null $P103, vivify_220
    new $P103, "Undef"
  vivify_220:
    unless $P103, if_1319_end
    find_lex $P104, "self"
    new $P105, 'String'
    set $P105, "Index "
    find_lex $P106, "$idx"
    concat $P107, $P105, $P106
    $P104."debug"($P107)
  if_1319_end:
.annotate 'line', 709
    find_lex $P103, "$idx"
    .return ($P103)
  control_1309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"String"],_)
    .param pmc param_1324
    .param pmc param_1325
.annotate 'file', ''
.annotate 'line', 726
    .const 'Sub' $P1333 = "41_1310682738.42772" 
    capture_lex $P1333
    new $P1323, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1323, control_1322
    push_eh $P1323
    .lex "self", self
    .lex "$str", param_1324
    .lex "%context", param_1325
.annotate 'line', 727
    new $P101, "Undef"
    set $P1326, $P101
    .lex "$idx", $P1326
.annotate 'line', 728
    new $P102, "Undef"
    set $P1327, $P102
    .lex "$type", $P1327
.annotate 'line', 726
    find_lex $P103, "$idx"
.annotate 'line', 728
    find_lex $P103, "$str"
    $P104 = $P103."type"()
    store_lex "$type", $P104
.annotate 'line', 729
    find_lex $P103, "$type"
    set $S101, $P103
    isne $I101, $S101, "sc"
    unless $I101, if_1328_end
.annotate 'line', 730
    find_lex $P104, "self"
    $P104."panic"("attempt to pass a non-sc value off as a string")
  if_1328_end:
.annotate 'line', 732
    find_lex $P104, "$str"
    $S101 = $P104."encoding"()
    iseq $I101, $S101, "fixed_8"
    if $I101, if_1330
    new $P103, 'Integer'
    set $P103, $I101
    goto if_1330_end
  if_1330:
    find_lex $P105, "$str"
    $S102 = $P105."charset"()
    iseq $I102, $S102, "ascii"
    new $P103, 'Integer'
    set $P103, $I102
  if_1330_end:
    if $P103, if_1329
.annotate 'line', 735
    .const 'Sub' $P1333 = "41_1310682738.42772" 
    capture_lex $P1333
    $P1333()
    goto if_1329_end
  if_1329:
.annotate 'line', 733
    find_lex $P1331, "%context"
    unless_null $P1331, vivify_223
    $P1331 = root_new ['parrot';'Hash']
  vivify_223:
    set $P106, $P1331["constants"]
    unless_null $P106, vivify_224
    new $P106, "Undef"
  vivify_224:
    find_lex $P107, "$str"
    $P108 = $P107."value"()
    $P109 = $P106."get_or_create_string"($P108)
    store_lex "$idx", $P109
  if_1329_end:
.annotate 'line', 726
    find_lex $P103, "$idx"
    .return ($P103)
  control_1322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Compiler"]
.sub "_block1332"  :anon :subid("41_1310682738.42772") :outer("40_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 737
    new $P106, "Undef"
    set $P1334, $P106
    .lex "$bb", $P1334
.annotate 'line', 738
    new $P107, "Undef"
    set $P1335, $P107
    .lex "$str_val", $P1335
.annotate 'line', 737
    $P108 = "new"("ByteBuffer")
    store_lex "$bb", $P108
.annotate 'line', 738
    find_lex $P108, "$str"
    $P109 = $P108."value"()
    store_lex "$str_val", $P109
.annotate 'line', 739

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 747
    find_lex $P1336, "%context"
    unless_null $P1336, vivify_221
    $P1336 = root_new ['parrot';'Hash']
  vivify_221:
    set $P108, $P1336["constants"]
    unless_null $P108, vivify_222
    new $P108, "Undef"
  vivify_222:
    find_lex $P109, "$bb"
.annotate 'line', 748
    find_lex $P110, "$str"
    $P111 = $P110."encoding"()
    $P112 = $P109."get_string"($P111)
.annotate 'line', 747
    $P113 = $P108."get_or_create_string"($P112)
    store_lex "$idx", $P113
.annotate 'line', 735
    .return ($P113)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("42_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Value"],_)
    .param pmc param_1340
    .param pmc param_1341
.annotate 'file', ''
.annotate 'line', 755
    new $P1339, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1339, control_1338
    push_eh $P1339
    .lex "self", self
    .lex "$val", param_1340
    .lex "%context", param_1341
.annotate 'line', 757
    new $P101, "Undef"
    set $P1342, $P101
    .lex "$orig", $P1342
    find_lex $P102, "self"
    find_lex $P103, "$val"
    $P104 = $P103."name"()
    find_lex $P105, "%context"
    $P106 = $P102."get_register"($P104, $P105)
    store_lex "$orig", $P106
.annotate 'line', 758
    find_lex $P102, "self"
    find_lex $P103, "$orig"
    find_lex $P104, "%context"
    $P105 = $P102."to_op"($P103, $P104)
.annotate 'line', 755
    .return ($P105)
  control_1338:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("43_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Register"],_)
    .param pmc param_1346
    .param pmc param_1347
.annotate 'file', ''
.annotate 'line', 761
    new $P1345, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1345, control_1344
    push_eh $P1345
    .lex "self", self
    .lex "$reg", param_1346
    .lex "%context", param_1347
.annotate 'line', 762
    find_lex $P101, "$reg"
    $P102 = $P101."regno"()
.annotate 'line', 761
    .return ($P102)
  control_1344:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("44_1310682738.42772") :method :outer("11_1310682738.42772") :multi(_,["POST";"Label"],_)
    .param pmc param_1351
    .param pmc param_1352
.annotate 'file', ''
.annotate 'line', 765
    new $P1350, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1350, control_1349
    push_eh $P1350
    .lex "self", self
    .lex "$l", param_1351
    .lex "%context", param_1352
.annotate 'line', 767
    new $P101, "Undef"
    set $P1353, $P101
    .lex "$bc", $P1353
.annotate 'line', 768
    new $P102, "Undef"
    set $P1354, $P102
    .lex "$pos", $P1354
.annotate 'line', 767
    find_lex $P1355, "%context"
    unless_null $P1355, vivify_225
    $P1355 = root_new ['parrot';'Hash']
  vivify_225:
    set $P103, $P1355["bytecode"]
    unless_null $P103, vivify_226
    new $P103, "Undef"
  vivify_226:
    store_lex "$bc", $P103
.annotate 'line', 768
    find_lex $P103, "$bc"
    set $N101, $P103
    new $P104, 'Float'
    set $P104, $N101
    store_lex "$pos", $P104
.annotate 'line', 772
    find_lex $P103, "$l"
    $P104 = $P103."name"()
.annotate 'line', 771
    find_lex $P1356, "%context"
    unless_null $P1356, vivify_227
    $P1356 = root_new ['parrot';'Hash']
  vivify_227:
    set $P105, $P1356["opcode_offset"]
    unless_null $P105, vivify_228
    new $P105, "Undef"
  vivify_228:
    find_lex $P1357, "%context"
    unless_null $P1357, vivify_229
    $P1357 = root_new ['parrot';'Hash']
  vivify_229:
    set $P106, $P1357["opcode_fullname"]
    unless_null $P106, vivify_230
    new $P106, "Undef"
  vivify_230:
    $P107 = "hash"($P104 :named("name"), $P105 :named("offset"), $P106 :named("opname"))
    find_lex $P108, "$pos"
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
    set $P1359[$P108], $P107
.annotate 'line', 777
    find_lex $P1361, "%context"
    unless_null $P1361, vivify_233
    $P1361 = root_new ['parrot';'Hash']
  vivify_233:
    set $P103, $P1361["DEBUG"]
    unless_null $P103, vivify_234
    new $P103, "Undef"
  vivify_234:
    unless $P103, if_1360_end
    find_lex $P104, "self"
    new $P105, 'String'
    set $P105, "Todo label '"
    find_lex $P106, "$l"
    $P107 = $P106."name"()
    set $S101, $P107
    concat $P106, $P105, $S101
    concat $P108, $P106, "' at "
    find_lex $P109, "$pos"
    concat $P110, $P108, $P109
    concat $P111, $P110, ", "
    find_lex $P1362, "%context"
    unless_null $P1362, vivify_235
    $P1362 = root_new ['parrot';'Hash']
  vivify_235:
    set $P112, $P1362["opcode_offset"]
    unless_null $P112, vivify_236
    new $P112, "Undef"
  vivify_236:
    set $S102, $P112
    concat $P113, $P111, $S102
    $P104."debug"($P113)
  if_1360_end:
.annotate 'line', 765
    .return (0)
  control_1349:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("45_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1366
    .param pmc param_1367
    .param pmc param_1368
.annotate 'file', ''
.annotate 'line', 788
    .const 'Sub' $P1381 = "46_1310682738.42772" 
    capture_lex $P1381
    new $P1365, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1365, control_1364
    push_eh $P1365
    .lex "self", self
    .lex "$opname", param_1366
    .lex "@args", param_1367
    .lex "%context", param_1368
.annotate 'line', 789
    new $P101, "Undef"
    set $P1369, $P101
    .lex "$bc", $P1369
.annotate 'line', 790
    new $P102, "Undef"
    set $P1370, $P102
    .lex "$signature", $P1370
.annotate 'line', 791
    new $P103, "Undef"
    set $P1371, $P103
    .lex "$sig_idx", $P1371
.annotate 'line', 798
    $P1373 = root_new ['parrot';'ResizablePMCArray']
    set $P1372, $P1373
    .lex "@op", $P1372
.annotate 'line', 789
    find_lex $P1374, "%context"
    unless_null $P1374, vivify_237
    $P1374 = root_new ['parrot';'Hash']
  vivify_237:
    set $P104, $P1374["bytecode"]
    unless_null $P104, vivify_238
    new $P104, "Undef"
  vivify_238:
    store_lex "$bc", $P104
.annotate 'line', 790
    find_lex $P104, "self"
    find_lex $P105, "@args"
    find_lex $P106, "%context"
    $P107 = $P104."build_args_signature"($P105, $P106)
    store_lex "$signature", $P107
.annotate 'line', 791
    find_lex $P1375, "%context"
    unless_null $P1375, vivify_239
    $P1375 = root_new ['parrot';'Hash']
  vivify_239:
    set $P104, $P1375["constants"]
    unless_null $P104, vivify_240
    new $P104, "Undef"
  vivify_240:
    find_lex $P105, "$signature"
    $P106 = $P104."get_or_create_pmc"($P105)
    store_lex "$sig_idx", $P106
.annotate 'line', 793
    find_lex $P1377, "%context"
    unless_null $P1377, vivify_241
    $P1377 = root_new ['parrot';'Hash']
  vivify_241:
    set $P104, $P1377["DEBUG"]
    unless_null $P104, vivify_242
    new $P104, "Undef"
  vivify_242:
    unless $P104, if_1376_end
    find_lex $P105, "self"
    new $P106, 'String'
    set $P106, "Sig: "
    find_lex $P107, "$sig_idx"
    concat $P108, $P106, $P107
    $P105."debug"($P108)
  if_1376_end:
.annotate 'line', 795
    find_lex $P1379, "%context"
    unless_null $P1379, vivify_243
    $P1379 = root_new ['parrot';'Hash']
  vivify_243:
    set $P104, $P1379["DEBUG"]
    unless_null $P104, vivify_244
    new $P104, "Undef"
  vivify_244:
    unless $P104, if_1378_end
    find_lex $P105, "self"
    find_lex $P106, "$opname"
    $P105."debug"($P106)
  if_1378_end:
.annotate 'line', 798
    find_lex $P104, "$opname"
    find_lex $P105, "$sig_idx"
    $P106 = "list"($P104, $P105)
    store_lex "@op", $P106
.annotate 'line', 800
    find_lex $P105, "@args"
    defined $I101, $P105
    unless $I101, for_undef_245
    iter $P104, $P105
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1391_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1391_test:
    unless $P104, loop1391_done
    shift $P106, $P104
  loop1391_redo:
    .const 'Sub' $P1381 = "46_1310682738.42772" 
    capture_lex $P1381
    $P1381($P106)
  loop1391_next:
    goto loop1391_test
  loop1391_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1391_next
    eq $P108, .CONTROL_LOOP_REDO, loop1391_redo
  loop1391_done:
    pop_eh 
  for_undef_245:
.annotate 'line', 811
    find_lex $P104, "$bc"
    find_lex $P105, "@op"
    $P106 = $P104."push"($P105)
.annotate 'line', 788
    .return ($P106)
  control_1364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Compiler"]
.sub "_block1380"  :anon :subid("46_1310682738.42772") :outer("45_1310682738.42772")
    .param pmc param_1382
.annotate 'file', ''
.annotate 'line', 800
    .const 'Sub' $P1385 = "47_1310682738.42772" 
    capture_lex $P1385
    .lex "$arg", param_1382
.annotate 'line', 802
    find_lex $P107, "$arg"
    $P108 = $P107."modifier"()
    isa $I102, $P108, "Hash"
    unless $I102, if_1383_end
    .const 'Sub' $P1385 = "47_1310682738.42772" 
    capture_lex $P1385
    $P1385()
  if_1383_end:
.annotate 'line', 808
    find_lex $P107, "@op"
    find_lex $P108, "self"
    find_lex $P109, "$arg"
    find_lex $P110, "%context"
    $P111 = $P108."to_op"($P109, $P110)
    $P112 = $P107."push"($P111)
.annotate 'line', 800
    .return ($P112)
.end


.namespace ["POST";"Compiler"]
.sub "_block1384"  :anon :subid("47_1310682738.42772") :outer("46_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 803
    new $P109, "Undef"
    set $P1386, $P109
    .lex "$name", $P1386
    find_lex $P110, "$arg"
    $P111 = $P110."modifier"()
    set $P112, $P111["named"]
    unless_null $P112, vivify_246
    new $P112, "Undef"
  vivify_246:
    set $P1387, $P112
    defined $I1389, $P1387
    if $I1389, default_1388
    find_lex $P113, "$arg"
    $P114 = $P113."name"()
    set $P1387, $P114
  default_1388:
    store_lex "$name", $P1387
.annotate 'line', 804
    find_lex $P110, "@op"
.annotate 'line', 805
    find_lex $P1390, "%context"
    unless_null $P1390, vivify_247
    $P1390 = root_new ['parrot';'Hash']
  vivify_247:
    set $P111, $P1390["constants"]
    unless_null $P111, vivify_248
    new $P111, "Undef"
  vivify_248:
    find_lex $P112, "$name"
    $P113 = $P111."get_or_create_string"($P112)
    $P114 = $P110."push"($P113)
.annotate 'line', 802
    .return ($P114)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("48_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1395
    .param pmc param_1396
.annotate 'file', ''
.annotate 'line', 814
    .const 'Sub' $P1414 = "51_1310682738.42772" 
    capture_lex $P1414
    .const 'Sub' $P1403 = "49_1310682738.42772" 
    capture_lex $P1403
    new $P1394, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1394, control_1393
    push_eh $P1394
    .lex "self", self
    .lex "@args", param_1395
    .lex "%context", param_1396
.annotate 'line', 815
    $P1398 = root_new ['parrot';'ResizablePMCArray']
    set $P1397, $P1398
    .lex "@sig", $P1397
.annotate 'line', 828
    new $P101, "Undef"
    set $P1399, $P101
    .lex "$elements", $P1399
.annotate 'line', 829
    new $P102, "Undef"
    set $P1400, $P102
    .lex "$signature", $P1400
.annotate 'line', 837
    new $P103, "Undef"
    set $P1401, $P103
    .lex "$idx", $P1401
.annotate 'line', 814
    find_lex $P104, "@sig"
.annotate 'line', 816
    find_lex $P105, "@args"
    defined $I101, $P105
    unless $I101, for_undef_249
    iter $P104, $P105
    new $P109, 'ExceptionHandler'
    set_label $P109, loop1411_handler
    $P109."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P109
  loop1411_test:
    unless $P104, loop1411_done
    shift $P106, $P104
  loop1411_redo:
    .const 'Sub' $P1403 = "49_1310682738.42772" 
    capture_lex $P1403
    $P1403($P106)
  loop1411_next:
    goto loop1411_test
  loop1411_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, .CONTROL_LOOP_NEXT, loop1411_next
    eq $P110, .CONTROL_LOOP_REDO, loop1411_redo
  loop1411_done:
    pop_eh 
  for_undef_249:
.annotate 'line', 828
    find_lex $P104, "@sig"
    set $N101, $P104
    new $P105, 'Float'
    set $P105, $N101
    store_lex "$elements", $P105
.annotate 'line', 829

        $P1412 = find_lex '$elements'
        $I99 = $P1412
        $P1412 = find_lex '$signature'
        $P1412 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1412
.annotate 'line', 837
    new $P104, "Integer"
    assign $P104, 0
    store_lex "$idx", $P104
.annotate 'line', 838
    find_lex $P105, "@sig"
    defined $I101, $P105
    unless $I101, for_undef_251
    iter $P104, $P105
    new $P107, 'ExceptionHandler'
    set_label $P107, loop1418_handler
    $P107."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P107
  loop1418_test:
    unless $P104, loop1418_done
    shift $P106, $P104
  loop1418_redo:
    .const 'Sub' $P1414 = "51_1310682738.42772" 
    capture_lex $P1414
    $P1414($P106)
  loop1418_next:
    goto loop1418_test
  loop1418_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, 'type'
    eq $P108, .CONTROL_LOOP_NEXT, loop1418_next
    eq $P108, .CONTROL_LOOP_REDO, loop1418_redo
  loop1418_done:
    pop_eh 
  for_undef_251:
.annotate 'line', 814
    find_lex $P104, "$signature"
    .return ($P104)
  control_1393:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_block1402"  :anon :subid("49_1310682738.42772") :outer("48_1310682738.42772")
    .param pmc param_1404
.annotate 'file', ''
.annotate 'line', 816
    .const 'Sub' $P1408 = "50_1310682738.42772" 
    capture_lex $P1408
    .lex "$arg", param_1404
.annotate 'line', 818
    new $P107, "Undef"
    set $P1405, $P107
    .lex "$s", $P1405
    find_lex $P108, "self"
    find_lex $P109, "$arg"
    find_lex $P110, "%context"
    $P111 = $P108."build_single_arg"($P109, $P110)
    store_lex "$s", $P111
.annotate 'line', 819
    find_lex $P109, "$s"
    isa $I102, $P109, "Integer"
    if $I102, if_1406
.annotate 'line', 823
    find_lex $P111, "$s"
    defined $I103, $P111
    unless $I103, for_undef_250
    iter $P110, $P111
    new $P114, 'ExceptionHandler'
    set_label $P114, loop1410_handler
    $P114."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P114
  loop1410_test:
    unless $P110, loop1410_done
    shift $P113, $P110
  loop1410_redo:
    .const 'Sub' $P1408 = "50_1310682738.42772" 
    capture_lex $P1408
    $P1408($P113)
  loop1410_next:
    goto loop1410_test
  loop1410_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P115, exception, 'type'
    eq $P115, .CONTROL_LOOP_NEXT, loop1410_next
    eq $P115, .CONTROL_LOOP_REDO, loop1410_redo
  loop1410_done:
    pop_eh 
  for_undef_250:
.annotate 'line', 822
    set $P108, $P110
.annotate 'line', 819
    goto if_1406_end
  if_1406:
.annotate 'line', 820
    find_lex $P110, "@sig"
    find_lex $P111, "$s"
    $P112 = $P110."push"($P111)
.annotate 'line', 819
    set $P108, $P112
  if_1406_end:
.annotate 'line', 816
    .return ($P108)
.end


.namespace ["POST";"Compiler"]
.sub "_block1407"  :anon :subid("50_1310682738.42772") :outer("49_1310682738.42772")
    .param pmc param_1409
.annotate 'file', ''
.annotate 'line', 823
    .lex "$_", param_1409
    find_lex $P114, "@sig"
    find_lex $P115, "$_"
    $P116 = $P114."push"($P115)
    .return ($P116)
.end


.namespace ["POST";"Compiler"]
.sub "_block1413"  :anon :subid("51_1310682738.42772") :outer("48_1310682738.42772")
    .param pmc param_1415
.annotate 'file', ''
.annotate 'line', 838
    .lex "$val", param_1415
.annotate 'line', 839
    find_lex $P107, "$val"
    find_lex $P108, "$idx"
    set $I102, $P108
    find_lex $P1416, "$signature"
    unless_null $P1416, vivify_252
    $P1416 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1416
  vivify_252:
    set $P1416[$I102], $P107
.annotate 'line', 838
    find_lex $P107, "$idx"
    clone $P1417, $P107
    inc $P107
    .return ($P1417)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("52_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1422
    .param pmc param_1423
.annotate 'file', ''
.annotate 'line', 846
    new $P1421, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1421, control_1420
    push_eh $P1421
    .lex "self", self
    .lex "$arg", param_1422
    .lex "%context", param_1423
.annotate 'line', 849
    new $P101, "Undef"
    set $P1424, $P101
    .lex "$type", $P1424
.annotate 'line', 851
    new $P102, "Undef"
    set $P1425, $P102
    .lex "$res", $P1425
.annotate 'line', 865
    new $P103, "Undef"
    set $P1426, $P103
    .lex "$mod", $P1426
.annotate 'line', 849
    find_lex $P104, "$arg"
    $P105 = $P104."type"()
    set $P1427, $P105
    defined $I1429, $P1427
    if $I1429, default_1428
    find_lex $P106, "self"
    find_lex $P107, "$arg"
    $P108 = $P107."name"()
    find_lex $P109, "%context"
    $P110 = $P106."get_register"($P108, $P109)
    $P111 = $P110."type"()
    set $P1427, $P111
  default_1428:
    store_lex "$type", $P1427
.annotate 'line', 846
    find_lex $P104, "$res"
.annotate 'line', 854
    find_lex $P104, "$type"
    set $S101, $P104
    iseq $I101, $S101, "i"
    if $I101, if_1430
.annotate 'line', 855
    find_lex $P105, "$type"
    set $S102, $P105
    iseq $I102, $S102, "s"
    if $I102, if_1431
.annotate 'line', 856
    find_lex $P106, "$type"
    set $S103, $P106
    iseq $I103, $S103, "p"
    if $I103, if_1432
.annotate 'line', 857
    find_lex $P107, "$type"
    set $S104, $P107
    iseq $I104, $S104, "n"
    if $I104, if_1433
.annotate 'line', 859
    find_lex $P108, "$type"
    set $S105, $P108
    iseq $I105, $S105, "ic"
    if $I105, if_1434
.annotate 'line', 860
    find_lex $P109, "$type"
    set $S106, $P109
    iseq $I106, $S106, "sc"
    if $I106, if_1435
.annotate 'line', 861
    find_lex $P110, "$type"
    set $S107, $P110
    iseq $I107, $S107, "pc"
    if $I107, if_1436
.annotate 'line', 862
    find_lex $P111, "$type"
    set $S108, $P111
    iseq $I108, $S108, "nc"
    if $I108, if_1437
.annotate 'line', 863
    find_lex $P112, "self"
    new $P113, 'String'
    set $P113, "Unknown arg type '"
    find_lex $P114, "$type"
    concat $P115, $P113, $P114
    concat $P116, $P115, "'"
    $P112."panic"($P116)
    goto if_1437_end
  if_1437:
.annotate 'line', 862
    new $P112, "Integer"
    assign $P112, 3
    add $P113, $P112, 16
    store_lex "$res", $P113
  if_1437_end:
    goto if_1436_end
  if_1436:
.annotate 'line', 861
    new $P111, "Integer"
    assign $P111, 2
    add $P112, $P111, 16
    store_lex "$res", $P112
  if_1436_end:
    goto if_1435_end
  if_1435:
.annotate 'line', 860
    new $P110, "Integer"
    assign $P110, 1
    add $P111, $P110, 16
    store_lex "$res", $P111
  if_1435_end:
    goto if_1434_end
  if_1434:
.annotate 'line', 859
    new $P109, "Integer"
    assign $P109, 0
    add $P110, $P109, 16
    store_lex "$res", $P110
  if_1434_end:
    goto if_1433_end
  if_1433:
.annotate 'line', 857
    new $P108, "Integer"
    assign $P108, 3
    store_lex "$res", $P108
  if_1433_end:
    goto if_1432_end
  if_1432:
.annotate 'line', 856
    new $P107, "Integer"
    assign $P107, 2
    store_lex "$res", $P107
  if_1432_end:
    goto if_1431_end
  if_1431:
.annotate 'line', 855
    new $P106, "Integer"
    assign $P106, 1
    store_lex "$res", $P106
  if_1431_end:
    goto if_1430_end
  if_1430:
.annotate 'line', 854
    new $P105, "Integer"
    assign $P105, 0
    store_lex "$res", $P105
  if_1430_end:
.annotate 'line', 865
    find_lex $P104, "$arg"
    $P105 = $P104."modifier"()
    store_lex "$mod", $P105
.annotate 'line', 866
    find_lex $P104, "$mod"
    unless $P104, if_1438_end
.annotate 'line', 867
    find_lex $P105, "$mod"
    isa $I101, $P105, "Hash"
    if $I101, if_1439
.annotate 'line', 872
    find_lex $P106, "$mod"
    set $S101, $P106
    iseq $I102, $S101, "slurpy"
    if $I102, if_1440
.annotate 'line', 873
    find_lex $P107, "$mod"
    set $S102, $P107
    iseq $I103, $S102, "flat"
    if $I103, if_1441
.annotate 'line', 874
    find_lex $P108, "$mod"
    set $S103, $P108
    iseq $I104, $S103, "optional"
    if $I104, if_1442
.annotate 'line', 875
    find_lex $P109, "$mod"
    set $S104, $P109
    iseq $I105, $S104, "opt_flag"
    if $I105, if_1443
.annotate 'line', 876
    find_lex $P110, "$mod"
    set $S105, $P110
    iseq $I106, $S105, "slurpy named"
    if $I106, if_1444
.annotate 'line', 877
    find_lex $P111, "self"
    new $P112, 'String'
    set $P112, "Unsupported modifier "
    find_lex $P113, "$mod"
    concat $P114, $P112, $P113
    $P111."panic"($P114)
    goto if_1444_end
  if_1444:
.annotate 'line', 876
    find_lex $P111, "$res"
    add $P112, $P111, 32
    add $P113, $P112, 512
    store_lex "$res", $P113
  if_1444_end:
    goto if_1443_end
  if_1443:
.annotate 'line', 875
    find_lex $P110, "$res"
    add $P111, $P110, 256
    store_lex "$res", $P111
  if_1443_end:
    goto if_1442_end
  if_1442:
.annotate 'line', 874
    find_lex $P109, "$res"
    add $P110, $P109, 128
    store_lex "$res", $P110
  if_1442_end:
    goto if_1441_end
  if_1441:
.annotate 'line', 873
    find_lex $P108, "$res"
    add $P109, $P108, 32
    store_lex "$res", $P109
  if_1441_end:
    goto if_1440_end
  if_1440:
.annotate 'line', 872
    find_lex $P107, "$res"
    add $P108, $P107, 32
    store_lex "$res", $P108
  if_1440_end:
    goto if_1439_end
  if_1439:
.annotate 'line', 870
    new $P106, "Integer"
    assign $P106, 1
    add $P107, $P106, 16
    add $P108, $P107, 512
    find_lex $P109, "$res"
    add $P110, $P109, 512
    $P111 = "list"($P108, $P110)
    store_lex "$res", $P111
  if_1439_end:
  if_1438_end:
.annotate 'line', 846
    find_lex $P104, "$res"
    .return ($P104)
  control_1420:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("53_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1448
.annotate 'file', ''
.annotate 'line', 888
    .const 'Sub' $P1450 = "54_1310682738.42772" 
    capture_lex $P1450
    new $P1447, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1447, control_1446
    push_eh $P1447
    .lex "self", self
    .lex "$post", param_1448
.annotate 'line', 889
    find_lex $P102, "$post"
    $P103 = $P102."list"()
    defined $I101, $P103
    unless $I101, for_undef_253
    iter $P101, $P103
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1453_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1453_test:
    unless $P101, loop1453_done
    shift $P104, $P101
  loop1453_redo:
    .const 'Sub' $P1450 = "54_1310682738.42772" 
    capture_lex $P1450
    $P1450($P104)
  loop1453_next:
    goto loop1453_test
  loop1453_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop1453_next
    eq $P107, .CONTROL_LOOP_REDO, loop1453_redo
  loop1453_done:
    pop_eh 
  for_undef_253:
.annotate 'line', 888
    .return ($P101)
  control_1446:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"Compiler"]
.sub "_block1449"  :anon :subid("54_1310682738.42772") :outer("53_1310682738.42772")
    .param pmc param_1451
.annotate 'file', ''
.annotate 'line', 889
    .lex "$sub", param_1451
.annotate 'line', 891
    find_lex $P106, "$sub"
    get_hll_global $P107, ["POST"], "Sub"
    $P108 = $P106."isa"($P107)
    if $P108, if_1452
    set $P105, $P108
    goto if_1452_end
  if_1452:
    find_lex $P109, "$post"
    find_lex $P110, "$sub"
    $P111 = $P110."full_name"()
    find_lex $P112, "$sub"
    $P113 = $P109."sub"($P111, $P112)
    set $P105, $P113
  if_1452_end:
.annotate 'line', 889
    .return ($P105)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("55_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1457
    .param pmc param_1458
.annotate 'file', ''
.annotate 'line', 896
    new $P1456, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1456, control_1455
    push_eh $P1456
    .lex "self", self
    .lex "$sub", param_1457
    .lex "%context", param_1458
.annotate 'line', 904
    new $P101, "Undef"
    set $P1459, $P101
    .lex "$res", $P1459
    new $P102, "Integer"
    assign $P102, 0
    store_lex "$res", $P102
.annotate 'line', 905
    find_lex $P102, "$res"
    new $P103, "Integer"
    assign $P103, 1
    find_lex $P104, "$sub"
    $N101 = $P104."outer"()
    mul $P105, $P103, $N101
    add $P106, $P102, $P105
    store_lex "$res", $P106
.annotate 'line', 906
    find_lex $P102, "$res"
    new $P103, "Integer"
    assign $P103, 8
    find_lex $P104, "$sub"
    $N101 = $P104."anon"()
    mul $P105, $P103, $N101
    add $P106, $P102, $P105
    store_lex "$res", $P106
.annotate 'line', 907
    find_lex $P102, "$res"
    new $P103, "Integer"
    assign $P103, 16
    find_lex $P104, "$sub"
    $N101 = $P104."main"()
    mul $P105, $P103, $N101
    add $P106, $P102, $P105
    store_lex "$res", $P106
.annotate 'line', 908
    find_lex $P102, "$res"
    new $P103, "Integer"
    assign $P103, 32
    find_lex $P104, "$sub"
    $N101 = $P104."load"()
    mul $P105, $P103, $N101
    add $P106, $P102, $P105
    store_lex "$res", $P106
.annotate 'line', 909
    find_lex $P102, "$res"
    new $P103, "Integer"
    assign $P103, 64
    find_lex $P104, "$sub"
    $N101 = $P104."immediate"()
    mul $P105, $P103, $N101
    add $P106, $P102, $P105
    store_lex "$res", $P106
.annotate 'line', 910
    find_lex $P102, "$res"
    new $P103, "Integer"
    assign $P103, 128
    find_lex $P104, "$sub"
    $N101 = $P104."postcomp"()
    mul $P105, $P103, $N101
    add $P106, $P102, $P105
    store_lex "$res", $P106
.annotate 'line', 912
    find_lex $P1461, "%context"
    unless_null $P1461, vivify_254
    $P1461 = root_new ['parrot';'Hash']
  vivify_254:
    set $P102, $P1461["DEBUG"]
    unless_null $P102, vivify_255
    new $P102, "Undef"
  vivify_255:
    unless $P102, if_1460_end
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "pf_flags "
    find_lex $P105, "$res"
    concat $P106, $P104, $P105
    $P103."debug"($P106)
  if_1460_end:
.annotate 'line', 896
    find_lex $P102, "$res"
    .return ($P102)
  control_1455:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("56_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1465
    .param pmc param_1466
.annotate 'file', ''
.annotate 'line', 917
    new $P1464, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1464, control_1463
    push_eh $P1464
    .lex "self", self
    .lex "$sub", param_1465
    .lex "%context", param_1466
.annotate 'line', 922
    new $P101, "Undef"
    set $P1467, $P101
    .lex "$res", $P1467
    new $P102, "Integer"
    assign $P102, 0
    store_lex "$res", $P102
.annotate 'line', 923
    find_lex $P102, "$sub"
    $P103 = $P102."vtable"()
    unless $P103, if_1468_end
    find_lex $P104, "$res"
    add $P105, $P104, 2
    store_lex "$res", $P105
  if_1468_end:
.annotate 'line', 924
    find_lex $P102, "$sub"
    $P103 = $P102."is_method"()
    unless $P103, if_1469_end
    find_lex $P104, "$res"
    add $P105, $P104, 4
    store_lex "$res", $P105
  if_1469_end:
.annotate 'line', 925
    find_lex $P102, "$sub"
    $P103 = $P102."is_init"()
    unless $P103, if_1470_end
    find_lex $P104, "$res"
    add $P105, $P104, 1024
    store_lex "$res", $P105
  if_1470_end:
.annotate 'line', 926
    find_lex $P102, "$sub"
    $P103 = $P102."nsentry"()
    unless $P103, if_1471_end
    find_lex $P104, "$res"
    add $P105, $P104, 2048
    store_lex "$res", $P105
  if_1471_end:
.annotate 'line', 928
    find_lex $P1473, "%context"
    unless_null $P1473, vivify_256
    $P1473 = root_new ['parrot';'Hash']
  vivify_256:
    set $P102, $P1473["DEBUG"]
    unless_null $P102, vivify_257
    new $P102, "Undef"
  vivify_257:
    unless $P102, if_1472_end
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "comp_flags "
    find_lex $P105, "$res"
    concat $P106, $P104, $P105
    $P103."debug"($P106)
  if_1472_end:
.annotate 'line', 917
    find_lex $P102, "$res"
    .return ($P102)
  control_1463:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("57_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1477
    .param pmc param_1478
    .param pmc param_1479
    .param pmc param_1480
.annotate 'file', ''
.annotate 'line', 933
    .const 'Sub' $P1484 = "58_1310682738.42772" 
    capture_lex $P1484
    new $P1476, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1476, control_1475
    push_eh $P1476
    .lex "self", self
    .lex "$sub", param_1477
    .lex "$labels_todo", param_1478
    .lex "$bc", param_1479
    .lex "%context", param_1480
.annotate 'line', 934
    find_lex $P1482, "%context"
    unless_null $P1482, vivify_258
    $P1482 = root_new ['parrot';'Hash']
  vivify_258:
    set $P101, $P1482["DEBUG"]
    unless_null $P101, vivify_259
    new $P101, "Undef"
  vivify_259:
    unless $P101, if_1481_end
    find_lex $P102, "self"
    $P102."debug"("Fixup labels")
  if_1481_end:
.annotate 'line', 935
    find_lex $P102, "$labels_todo"
    defined $I101, $P102
    unless $I101, for_undef_260
    iter $P101, $P102
    new $P108, 'ExceptionHandler'
    set_label $P108, loop1501_handler
    $P108."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P108
  loop1501_test:
    unless $P101, loop1501_done
    shift $P103, $P101
  loop1501_redo:
    .const 'Sub' $P1484 = "58_1310682738.42772" 
    capture_lex $P1484
    $P1484($P103)
  loop1501_next:
    goto loop1501_test
  loop1501_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P109, exception, 'type'
    eq $P109, .CONTROL_LOOP_NEXT, loop1501_next
    eq $P109, .CONTROL_LOOP_REDO, loop1501_redo
  loop1501_done:
    pop_eh 
  for_undef_260:
.annotate 'line', 933
    .return ($P101)
  control_1475:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"Compiler"]
.sub "_block1483"  :anon :subid("58_1310682738.42772") :outer("57_1310682738.42772")
    .param pmc param_1485
.annotate 'file', ''
.annotate 'line', 935
    .lex "$kv", param_1485
.annotate 'line', 936
    new $P104, "Undef"
    set $P1486, $P104
    .lex "$offset", $P1486
.annotate 'line', 937
    $P1488 = root_new ['parrot';'Hash']
    set $P1487, $P1488
    .lex "%todo", $P1487
.annotate 'line', 940
    new $P105, "Undef"
    set $P1489, $P105
    .lex "$op", $P1489
.annotate 'line', 943
    new $P106, "Undef"
    set $P1490, $P106
    .lex "$delta", $P1490
.annotate 'line', 936
    find_lex $P107, "$kv"
    $P108 = $P107."key"()
    store_lex "$offset", $P108
.annotate 'line', 937
    find_lex $P107, "$kv"
    $P108 = $P107."value"()
    store_lex "%todo", $P108
.annotate 'line', 938
    find_lex $P1492, "%context"
    unless_null $P1492, vivify_261
    $P1492 = root_new ['parrot';'Hash']
  vivify_261:
    set $P107, $P1492["DEBUG"]
    unless_null $P107, vivify_262
    new $P107, "Undef"
  vivify_262:
    unless $P107, if_1491_end
    find_lex $P108, "self"
    new $P109, 'String'
    set $P109, "Fixing '"
    find_lex $P1493, "%todo"
    unless_null $P1493, vivify_263
    $P1493 = root_new ['parrot';'Hash']
  vivify_263:
    set $P110, $P1493["name"]
    unless_null $P110, vivify_264
    new $P110, "Undef"
  vivify_264:
    set $S101, $P110
    concat $P111, $P109, $S101
    concat $P112, $P111, "' from op "
    find_lex $P1494, "%todo"
    unless_null $P1494, vivify_265
    $P1494 = root_new ['parrot';'Hash']
  vivify_265:
    set $P113, $P1494["opname"]
    unless_null $P113, vivify_266
    new $P113, "Undef"
  vivify_266:
    set $S102, $P113
    concat $P114, $P112, $S102
    concat $P115, $P114, " at "
    find_lex $P116, "$offset"
    set $S103, $P116
    concat $P117, $P115, $S103
    $P108."debug"($P117)
  if_1491_end:
.annotate 'line', 940
    find_lex $P1495, "%todo"
    unless_null $P1495, vivify_267
    $P1495 = root_new ['parrot';'Hash']
  vivify_267:
    set $P107, $P1495["opname"]
    unless_null $P107, vivify_268
    new $P107, "Undef"
  vivify_268:
    set $S101, $P107
    find_lex $P108, "$bc"
    $P109 = $P108."opmap"()
    set $P110, $P109[$S101]
    unless_null $P110, vivify_269
    new $P110, "Undef"
  vivify_269:
    store_lex "$op", $P110
.annotate 'line', 941
    find_lex $P1497, "%context"
    unless_null $P1497, vivify_270
    $P1497 = root_new ['parrot';'Hash']
  vivify_270:
    set $P107, $P1497["DEBUG"]
    unless_null $P107, vivify_271
    new $P107, "Undef"
  vivify_271:
    unless $P107, if_1496_end
    find_lex $P108, "self"
    new $P109, 'String'
    set $P109, "Op length is "
    find_lex $P110, "$op"
    $P111 = $P110."length"()
    set $S101, $P111
    concat $P110, $P109, $S101
    $P108."debug"($P110)
  if_1496_end:
.annotate 'line', 943
    find_lex $P107, "$sub"
    find_lex $P1498, "%todo"
    unless_null $P1498, vivify_272
    $P1498 = root_new ['parrot';'Hash']
  vivify_272:
    set $P108, $P1498["name"]
    unless_null $P108, vivify_273
    new $P108, "Undef"
  vivify_273:
    $P109 = $P107."label"($P108)
    $P110 = $P109."position"()
    find_lex $P1499, "%todo"
    unless_null $P1499, vivify_274
    $P1499 = root_new ['parrot';'Hash']
  vivify_274:
    set $P111, $P1499["offset"]
    unless_null $P111, vivify_275
    new $P111, "Undef"
  vivify_275:
    sub $P112, $P110, $P111
    store_lex "$delta", $P112
.annotate 'line', 945
    find_lex $P107, "$delta"
    find_lex $P108, "$offset"
    find_lex $P109, "$op"
    $N101 = $P109."length"()
    add $P110, $P108, $N101
    set $I102, $P110
    find_lex $P1500, "$bc"
    unless_null $P1500, vivify_276
    $P1500 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1500
  vivify_276:
    set $P1500[$I102], $P107
.annotate 'line', 935
    .return ($P107)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("59_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1505
    .param pmc param_1506
.annotate 'file', ''
.annotate 'line', 950
    new $P1504, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1504, control_1503
    push_eh $P1504
    .lex "self", self
    .lex "$name", param_1505
    .lex "%context", param_1506
.annotate 'line', 951
    new $P101, "Undef"
    set $P1507, $P101
    .lex "$reg", $P1507
    find_lex $P1508, "%context"
    unless_null $P1508, vivify_277
    $P1508 = root_new ['parrot';'Hash']
  vivify_277:
    set $P102, $P1508["sub"]
    unless_null $P102, vivify_278
    new $P102, "Undef"
  vivify_278:
    find_lex $P103, "$name"
    $P104 = $P102."symbol"($P103)
    store_lex "$reg", $P104
.annotate 'line', 952
    find_lex $P102, "$reg"
    isfalse $I101, $P102
    unless $I101, if_1509_end
.annotate 'line', 953
    find_lex $P103, "self"
    new $P104, 'String'
    set $P104, "Register '"
    find_lex $P105, "$name"
    set $S101, $P105
    concat $P106, $P104, $S101
    concat $P107, $P106, "' not predeclared in '"
    find_lex $P1510, "%context"
    unless_null $P1510, vivify_279
    $P1510 = root_new ['parrot';'Hash']
  vivify_279:
    set $P108, $P1510["sub"]
    unless_null $P108, vivify_280
    new $P108, "Undef"
  vivify_280:
    $P109 = $P108."name"()
    set $S102, $P109
    concat $P108, $P107, $S102
    concat $P110, $P108, "'"
    $P103."panic"($P110)
  if_1509_end:
.annotate 'line', 950
    find_lex $P102, "$reg"
    .return ($P102)
  control_1503:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "debug"  :subid("60_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1514 :slurpy
.annotate 'file', ''
.annotate 'line', 958
    .const 'Sub' $P1516 = "61_1310682738.42772" 
    capture_lex $P1516
    new $P1513, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1513, control_1512
    push_eh $P1513
    .lex "self", self
    .lex "@args", param_1514
.annotate 'line', 959
    find_lex $P102, "@args"
    defined $I101, $P102
    unless $I101, for_undef_281
    iter $P101, $P102
    new $P104, 'ExceptionHandler'
    set_label $P104, loop1518_handler
    $P104."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P104
  loop1518_test:
    unless $P101, loop1518_done
    shift $P103, $P101
  loop1518_redo:
    .const 'Sub' $P1516 = "61_1310682738.42772" 
    capture_lex $P1516
    $P1516($P103)
  loop1518_next:
    goto loop1518_test
  loop1518_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, 'type'
    eq $P105, .CONTROL_LOOP_NEXT, loop1518_next
    eq $P105, .CONTROL_LOOP_REDO, loop1518_redo
  loop1518_done:
    pop_eh 
  for_undef_281:
.annotate 'line', 958
    .return ($P101)
  control_1512:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"Compiler"]
.sub "_block1515"  :anon :subid("61_1310682738.42772") :outer("60_1310682738.42772")
    .param pmc param_1517
.annotate 'file', ''
.annotate 'line', 959
    .lex "$_", param_1517
.annotate 'line', 960
    find_lex $P104, "$_"
    say $P104
.annotate 'line', 959
    .return ()
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("62_1310682738.42772") :method :outer("11_1310682738.42772")
    .param pmc param_1522
    .param pmc param_1523
.annotate 'file', ''
.annotate 'line', 964
    new $P1521, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1521, control_1520
    push_eh $P1521
    .lex "self", self
    .lex "$past", param_1522
    .lex "%adverbs", param_1523
.annotate 'line', 965
    $P1525 = root_new ['parrot';'Hash']
    set $P1524, $P1525
    .lex "%context", $P1524
.annotate 'line', 973
    new $P101, "Undef"
    set $P1526, $P101
    .lex "$pfdir", $P1526
.annotate 'line', 964
    find_lex $P102, "%context"
.annotate 'line', 967
    find_lex $P102, "self"
    find_lex $P1527, "%context"
    unless_null $P1527, vivify_282
    $P1527 = root_new ['parrot';'Hash']
    store_lex "%context", $P1527
  vivify_282:
    set $P1527["compiler"], $P102
.annotate 'line', 969
    new $P102, "Packfile"
    find_lex $P1528, "%context"
    unless_null $P1528, vivify_283
    $P1528 = root_new ['parrot';'Hash']
    store_lex "%context", $P1528
  vivify_283:
    set $P1528["packfile"], $P102
.annotate 'line', 973
    find_lex $P1529, "%context"
    unless_null $P1529, vivify_284
    $P1529 = root_new ['parrot';'Hash']
  vivify_284:
    set $P102, $P1529["packfile"]
    unless_null $P102, vivify_285
    new $P102, "Undef"
  vivify_285:
    $P103 = $P102."get_directory"()
    store_lex "$pfdir", $P103
.annotate 'line', 976
    new $P102, "PackfileConstantTable"
    find_lex $P1530, "%context"
    unless_null $P1530, vivify_286
    $P1530 = root_new ['parrot';'Hash']
    store_lex "%context", $P1530
  vivify_286:
    set $P1530["constants"], $P102
.annotate 'line', 979
    new $P102, "FixedIntegerArray"
    find_lex $P1531, "%context"
    unless_null $P1531, vivify_287
    $P1531 = root_new ['parrot';'Hash']
    store_lex "%context", $P1531
  vivify_287:
    set $P1532, $P1531["constants"]
    unless_null $P1532, vivify_288
    $P1532 = root_new ['parrot';'ResizablePMCArray']
    set $P1531["constants"], $P1532
  vivify_288:
    set $P1532[0], $P102
.annotate 'line', 982
    find_lex $P1533, "%context"
    unless_null $P1533, vivify_289
    $P1533 = root_new ['parrot';'Hash']
  vivify_289:
    set $P102, $P1533["constants"]
    unless_null $P102, vivify_290
    new $P102, "Undef"
  vivify_290:
    find_lex $P1534, "$pfdir"
    unless_null $P1534, vivify_291
    $P1534 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1534
  vivify_291:
    set $P1534["CONSTANTS_hello.pir"], $P102
.annotate 'line', 985
    new $P102, "PackfileBytecodeSegment"
    find_lex $P1535, "%context"
    unless_null $P1535, vivify_292
    $P1535 = root_new ['parrot';'Hash']
    store_lex "%context", $P1535
  vivify_292:
    set $P1535["bytecode"], $P102
.annotate 'line', 986
    find_lex $P1536, "%context"
    unless_null $P1536, vivify_293
    $P1536 = root_new ['parrot';'Hash']
  vivify_293:
    set $P102, $P1536["bytecode"]
    unless_null $P102, vivify_294
    new $P102, "Undef"
  vivify_294:
    $P102."main_sub"(-1)
.annotate 'line', 988
    new $P102, "Integer"
    assign $P102, 0
    find_lex $P1537, "%context"
    unless_null $P1537, vivify_295
    $P1537 = root_new ['parrot';'Hash']
    store_lex "%context", $P1537
  vivify_295:
    set $P1537["got_main_sub"], $P102
.annotate 'line', 991
    find_lex $P1538, "%context"
    unless_null $P1538, vivify_296
    $P1538 = root_new ['parrot';'Hash']
  vivify_296:
    set $P102, $P1538["bytecode"]
    unless_null $P102, vivify_297
    new $P102, "Undef"
  vivify_297:
    find_lex $P1539, "$pfdir"
    unless_null $P1539, vivify_298
    $P1539 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1539
  vivify_298:
    set $P1539["BYTECODE_hello.pir"], $P102
.annotate 'line', 1000
    get_hll_global $P102, ["POST"], "VanillaAllocator"
    $P103 = $P102."new"()
    find_lex $P1540, "%context"
    unless_null $P1540, vivify_299
    $P1540 = root_new ['parrot';'Hash']
    store_lex "%context", $P1540
  vivify_299:
    set $P1540["regalloc"], $P103
.annotate 'line', 1002
    find_lex $P1541, "%adverbs"
    unless_null $P1541, vivify_300
    $P1541 = root_new ['parrot';'Hash']
  vivify_300:
    set $P102, $P1541["debug"]
    unless_null $P102, vivify_301
    new $P102, "Undef"
  vivify_301:
    find_lex $P1542, "%context"
    unless_null $P1542, vivify_302
    $P1542 = root_new ['parrot';'Hash']
    store_lex "%context", $P1542
  vivify_302:
    set $P1542["DEBUG"], $P102
.annotate 'line', 964
    find_lex $P102, "%context"
    .return ($P102)
  control_1520:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"Compiler"]
.sub "_block1543" :load :anon :subid("63_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 16
    .const 'Sub' $P1545 = "11_1310682738.42772" 
    $P101 = $P1545()
    .return ($P101)
.end


.namespace []
.sub "_block1547" :load :anon :subid("64_1310682738.42772")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1549 = "10_1310682738.42772" 
    $P101 = $P1549()
    .return ($P101)
.end

