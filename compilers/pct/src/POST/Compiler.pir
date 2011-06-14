
.namespace []
.sub "_block11"  :anon :subid("10_1308074667.1448")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308074667.1448" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P14 = "11_1308074667.1448" 
    capture_lex $P14
    $P1638 = $P14()
.annotate 'line', 1
    .return ($P1638)
    .const 'Sub' $P1640 = "64_1308074667.1448" 
    .return ($P1640)
.end


.namespace []
.sub "" :load :init :subid("post65") :outer("10_1308074667.1448")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308074667.1448" 
    .local pmc block
    set block, $P12
    $P1643 = get_root_global ["parrot"], "P6metaclass"
    new $P1644, "ResizablePMCArray"
    push $P1644, "$?HLL"
    push $P1644, "$?NAMESPACE"
    $P1643."new_class"("POST::Compiler", "PCT::HLLCompiler" :named("parent"), $P1644 :named("attr"))
.end


.namespace ["POST";"Compiler"]
.sub "_block13"  :subid("11_1308074667.1448") :outer("10_1308074667.1448")
.annotate 'line', 16
    .const 'Sub' $P1590 = "62_1308074667.1448" 
    capture_lex $P1590
    .const 'Sub' $P1574 = "60_1308074667.1448" 
    capture_lex $P1574
    .const 'Sub' $P1547 = "59_1308074667.1448" 
    capture_lex $P1547
    .const 'Sub' $P1469 = "57_1308074667.1448" 
    capture_lex $P1469
    .const 'Sub' $P1433 = "56_1308074667.1448" 
    capture_lex $P1433
    .const 'Sub' $P1381 = "55_1308074667.1448" 
    capture_lex $P1381
    .const 'Sub' $P1355 = "53_1308074667.1448" 
    capture_lex $P1355
    .const 'Sub' $P1236 = "52_1308074667.1448" 
    capture_lex $P1236
    .const 'Sub' $P1168 = "48_1308074667.1448" 
    capture_lex $P1168
    .const 'Sub' $P1092 = "45_1308074667.1448" 
    capture_lex $P1092
    .const 'Sub' $P1052 = "44_1308074667.1448" 
    capture_lex $P1052
    .const 'Sub' $P1044 = "43_1308074667.1448" 
    capture_lex $P1044
    .const 'Sub' $P1028 = "42_1308074667.1448" 
    capture_lex $P1028
    .const 'Sub' $P983 = "40_1308074667.1448" 
    capture_lex $P983
    .const 'Sub' $P943 = "39_1308074667.1448" 
    capture_lex $P943
    .const 'Sub' $P918 = "38_1308074667.1448" 
    capture_lex $P918
    .const 'Sub' $P682 = "34_1308074667.1448" 
    capture_lex $P682
    .const 'Sub' $P636 = "32_1308074667.1448" 
    capture_lex $P636
    .const 'Sub' $P615 = "30_1308074667.1448" 
    capture_lex $P615
    .const 'Sub' $P523 = "27_1308074667.1448" 
    capture_lex $P523
    .const 'Sub' $P256 = "24_1308074667.1448" 
    capture_lex $P256
    .const 'Sub' $P250 = "23_1308074667.1448" 
    capture_lex $P250
    .const 'Sub' $P216 = "21_1308074667.1448" 
    capture_lex $P216
    .const 'Sub' $P186 = "20_1308074667.1448" 
    capture_lex $P186
    .const 'Sub' $P181 = "19_1308074667.1448" 
    capture_lex $P181
    .const 'Sub' $P168 = "18_1308074667.1448" 
    capture_lex $P168
    .const 'Sub' $P67 = "17_1308074667.1448" 
    capture_lex $P67
    .const 'Sub' $P57 = "16_1308074667.1448" 
    capture_lex $P57
    .const 'Sub' $P52 = "15_1308074667.1448" 
    capture_lex $P52
    .const 'Sub' $P29 = "14_1308074667.1448" 
    capture_lex $P29
    .const 'Sub' $P24 = "13_1308074667.1448" 
    capture_lex $P24
    .const 'Sub' $P16 = "12_1308074667.1448" 
    capture_lex $P16
.annotate 'line', 129
    get_global $P15, "%pirop_handlers"
    unless_null $P15, vivify_67
    $P15 = root_new ['parrot';'Hash']
    set_global "%pirop_handlers", $P15
  vivify_67:
.annotate 'line', 16
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 129
    new $P65, "String"
    assign $P65, "bar"
    set_global "%pirop_handlers", $P65
    new $P66, "ResizablePMCArray"
    push $P66, $P65
    push $P66, "bang"
.annotate 'line', 16
    .return ()
    .const 'Sub' $P1631 = "63_1308074667.1448" 
    .return ($P1631)
.end


.namespace ["POST";"Compiler"]
.sub "" :load :init :subid("post66") :outer("11_1308074667.1448")
.annotate 'line', 16
    .const 'Sub' $P14 = "11_1308074667.1448" 
    .local pmc block
    set block, $P14
.annotate 'line', 20
    get_hll_global $P1634, ["POST"], "Compiler"
    $P1634."language"("POST")
.annotate 'line', 21
    get_hll_global $P1635, ["POST"], "Compiler"
    new $P1636, "ResizablePMCArray"
    push $P1636, "pir"
    push $P1636, "evalpmc"
    $P1635."stages"($P1636)
.annotate 'line', 23

        $P1637 = new ['String']
        set_global '$?HLL', $P1637
    
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("12_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_19
.annotate 'line', 36
    new $P18, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P18, control_17
    push_eh $P18
    .lex "self", self
    .lex "$str", param_19
.annotate 'line', 37
    get_hll_global $P20, ["PAST"], "Compiler"
    find_lex $P21, "$str"
    $P22 = $P20."escape"($P21)
.annotate 'line', 36
    .return ($P22)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P23, exception, "payload"
    .return ($P23)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "key_pir"  :subid("13_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_27 :slurpy
.annotate 'line', 44
    new $P26, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P26, control_25
    push_eh $P26
    .lex "self", self
    .lex "@args", param_27
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
  control_25:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P28, exception, "payload"
    .return ($P28)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pir"  :subid("14_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_32
    .param pmc param_33 :slurpy :named
.annotate 'line', 74
    new $P31, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P31, control_30
    push_eh $P31
    .lex "self", self
    .lex "$post", param_32
    .lex "%adverbs", param_33
.annotate 'line', 75
    new $P34, "Undef"
    .lex "$newself", $P34
.annotate 'line', 76
    new $P35, "Undef"
    .lex "$CODE", $P35
.annotate 'line', 77
    new $P36, "Undef"
    .lex "$LINE", $P36
.annotate 'line', 75
    get_hll_global $P37, ["POST"], "Compiler"
    $P38 = $P37."new"()
    store_lex "$newself", $P38
.annotate 'line', 76
    new $P39, "StringBuilder"
    store_lex "$CODE", $P39
.annotate 'line', 77
    new $P40, "Integer"
    assign $P40, 0
    store_lex "$LINE", $P40
.annotate 'line', 79
    find_lex $P42, "$post"
    get_hll_global $P43, ["POST"], "Sub"
    $P44 = $P42."isa"($P43)
    if $P44, unless_41_end
.annotate 'line', 80
    get_hll_global $P45, ["POST"], "Sub"
    find_lex $P46, "$post"
    $P47 = $P45."new"($P46, "anon" :named("name"))
    store_lex "$post", $P47
  unless_41_end:
.annotate 'line', 82
    find_lex $P48, "$newself"
    find_lex $P49, "$post"
    $P48."pir"($P49)
    find_lex $P50, "$CODE"
.annotate 'line', 74
    .return ($P50)
  control_30:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P51, exception, "payload"
    .return ($P51)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir_children"  :subid("15_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_55
.annotate 'line', 89
    new $P54, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P54, control_53
    push_eh $P54
    .lex "self", self
    .lex "$node", param_55
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
  control_53:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("16_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,_)
    .param pmc param_60
.annotate 'line', 121
    new $P59, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P59, control_58
    push_eh $P59
    .lex "self", self
    .lex "$node", param_60
.annotate 'line', 122
    find_lex $P61, "self"
    find_lex $P62, "$node"
    $P63 = $P61."pir_children"($P62)
.annotate 'line', 121
    .return ($P63)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P64, exception, "payload"
    .return ($P64)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("17_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Op"])
    .param pmc param_70
.annotate 'line', 131
    new $P69, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P69, control_68
    push_eh $P69
    .lex "self", self
    .lex "$node", param_70
.annotate 'line', 133
    new $P71, "Undef"
    .lex "$pirop", $P71
.annotate 'line', 135
    new $P72, "Undef"
    .lex "$result", $P72
.annotate 'line', 139
    $P73 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P73
.annotate 'line', 142
    new $P74, "Undef"
    .lex "$fmt", $P74
.annotate 'line', 143
    new $P75, "Undef"
    .lex "$name", $P75
.annotate 'line', 144
    new $P76, "Undef"
    .lex "$invocant", $P76
.annotate 'line', 174
    new $P77, "Undef"
    .lex "$subpir", $P77
.annotate 'line', 175
    new $P78, "Undef"
    .lex "$subline", $P78
.annotate 'line', 176
    new $P79, "Undef"
    .lex "$line", $P79
.annotate 'line', 133
    find_lex $P80, "$node"
    $P81 = $P80."pirop"()
    store_lex "$pirop", $P81
.annotate 'line', 135
    find_lex $P82, "$node"
    $P83 = $P82."result"()
    set $S84, $P83
    new $P85, 'String'
    set $P85, $S84
    store_lex "$result", $P85
.annotate 'line', 136
    find_lex $P87, "$result"
    unless $P87, if_86_end
    find_lex $P88, "$result"
    concat $P89, $P88, " = "
    store_lex "$result", $P89
  if_86_end:
.annotate 'line', 139
    find_lex $P90, "$node"
    $P91 = $P90."list"()
    store_lex "@arglist", $P91
    find_lex $P92, "$fmt"
    find_lex $P93, "$name"
    find_lex $P94, "$invocant"
.annotate 'line', 146
    find_lex $P96, "$pirop"
    set $S97, $P96
    iseq $I98, $S97, "call"
    if $I98, if_95
.annotate 'line', 150
    find_lex $P103, "$pirop"
    set $S104, $P103
    iseq $I105, $S104, "callmethod"
    if $I105, if_102
.annotate 'line', 155
    find_lex $P112, "$pirop"
    set $S113, $P112
    iseq $I114, $S113, "return"
    if $I114, if_111
.annotate 'line', 158
    find_lex $P117, "$pirop"
    set $S118, $P117
    iseq $I119, $S118, "yield"
    if $I119, if_116
.annotate 'line', 161
    find_lex $P122, "$pirop"
    set $S123, $P122
    iseq $I124, $S123, "tailcall"
    if $I124, if_121
.annotate 'line', 165
    find_lex $P129, "$pirop"
    set $S130, $P129
    iseq $I131, $S130, "inline"
    if $I131, if_128
.annotate 'line', 170
    new $P137, "String"
    assign $P137, "    %n %,\n"
    store_lex "$fmt", $P137
.annotate 'line', 171
    find_lex $P138, "$pirop"
    store_lex "$name", $P138
.annotate 'line', 169
    goto if_128_end
  if_128:
.annotate 'line', 166
    find_lex $P132, "$node"
    $P133 = $P132."inline"()
    concat $P134, $P133, "\n"
    store_lex "$fmt", $P134
.annotate 'line', 167
    find_lex $P135, "$node"
    $P136 = $P135."result"()
    store_lex "$result", $P136
  if_128_end:
.annotate 'line', 165
    goto if_121_end
  if_121:
.annotate 'line', 162
    find_lex $P125, "@arglist"
    $P126 = $P125."shift"()
    store_lex "$name", $P126
.annotate 'line', 163
    new $P127, "String"
    assign $P127, "    .tailcall %n(%,)\n"
    store_lex "$fmt", $P127
  if_121_end:
.annotate 'line', 161
    goto if_116_end
  if_116:
.annotate 'line', 159
    new $P120, "String"
    assign $P120, "    .yield (%,)\n"
    store_lex "$fmt", $P120
  if_116_end:
.annotate 'line', 158
    goto if_111_end
  if_111:
.annotate 'line', 156
    new $P115, "String"
    assign $P115, "    .return (%,)\n"
    store_lex "$fmt", $P115
  if_111_end:
.annotate 'line', 155
    goto if_102_end
  if_102:
.annotate 'line', 151
    new $P106, "String"
    assign $P106, "    %r%i.%n(%,)\n"
    store_lex "$fmt", $P106
.annotate 'line', 152
    find_lex $P107, "@arglist"
    $P108 = $P107."shift"()
    store_lex "$name", $P108
.annotate 'line', 153
    find_lex $P109, "@arglist"
    $P110 = $P109."shift"()
    store_lex "$invocant", $P110
  if_102_end:
.annotate 'line', 150
    goto if_95_end
  if_95:
.annotate 'line', 147
    new $P99, "String"
    assign $P99, "    %r%n(%,)\n"
    store_lex "$fmt", $P99
.annotate 'line', 148
    find_lex $P100, "@arglist"
    $P101 = $P100."shift"()
    store_lex "$name", $P101
  if_95_end:
.annotate 'line', 174
    new $P139, "String"
    assign $P139, "$SUBPIR"
    set $S140, $P139
    find_caller_lex $P141, $S140
    store_lex "$subpir", $P141
.annotate 'line', 175
    new $P142, "String"
    assign $P142, "$SUBLINE"
    set $S143, $P142
    find_caller_lex $P144, $S143
    store_lex "$subline", $P144
.annotate 'line', 176
    new $P145, "String"
    assign $P145, "$LINE"
    set $S146, $P145
    find_caller_lex $P147, $S146
    store_lex "$line", $P147
.annotate 'line', 178
    find_lex $P149, "$subline"
    set $N150, $P149
    find_lex $P151, "$line"
    set $N152, $P151
    isne $I153, $N150, $N152
    unless $I153, if_148_end
.annotate 'line', 179
    find_lex $P154, "$subpir"
    find_lex $P155, "$line"
    set $S156, $P155
    $P154."append_format"(".annotate 'line', %0\n", $S156)
.annotate 'line', 180
    find_lex $P157, "$subline"
    find_lex $P158, "$line"
    assign $P157, $P158
  if_148_end:
.annotate 'line', 183
    find_lex $P159, "$subpir"
    find_lex $P160, "$fmt"
    find_lex $P161, "@arglist"
    find_lex $P162, "$result"
    find_lex $P163, "$name"
    find_lex $P164, "$invocant"
    find_lex $P165, "$result"
    $P166 = $P159."append_format"($P160, $P161 :flat, $P162 :named("r"), $P163 :named("n"), $P164 :named("i"), $P165 :named("t"))
.annotate 'line', 131
    .return ($P166)
  control_68:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P167, exception, "payload"
    .return ($P167)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("18_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Label"])
    .param pmc param_171
.annotate 'line', 190
    new $P170, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P170, control_169
    push_eh $P170
    .lex "self", self
    .lex "$node", param_171
.annotate 'line', 191
    new $P172, "Undef"
    .lex "$subpir", $P172
    new $P173, "String"
    assign $P173, "$SUBPIR"
    set $S174, $P173
    find_caller_lex $P175, $S174
    store_lex "$subpir", $P175
.annotate 'line', 192
    find_lex $P176, "$subpir"
    find_lex $P177, "$node"
    $P178 = $P177."result"()
    $P179 = $P176."append_format"("  %0:\n", $P178)
.annotate 'line', 190
    .return ($P179)
  control_169:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("19_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Sub"])
    .param pmc param_184
.annotate 'line', 201
    new $P183, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P183, control_182
    push_eh $P183
    .lex "self", self
    .lex "$node", param_184
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
  control_182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P185, exception, "payload"
    .return ($P185)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "hll_pir"  :subid("20_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_189
    .param pmc param_190 :slurpy :named
.annotate 'line', 358
    new $P188, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P188, control_187
    push_eh $P188
    .lex "self", self
    .lex "$node", param_189
    .lex "%options", param_190
.annotate 'line', 362
    new $P191, "Undef"
    .lex "$source", $P191
.annotate 'line', 363
    new $P192, "Undef"
    .lex "$compiler", $P192
.annotate 'line', 359
    new $P193, "String"
    assign $P193, "pir"
    find_lex $P194, "%options"
    unless_null $P194, vivify_68
    $P194 = root_new ['parrot';'Hash']
    store_lex "%options", $P194
  vivify_68:
    set $P194["target"], $P193
.annotate 'line', 360
    find_lex $P195, "$node"
    $P196 = $P195."subid"()
    find_lex $P197, "%options"
    unless_null $P197, vivify_69
    $P197 = root_new ['parrot';'Hash']
    store_lex "%options", $P197
  vivify_69:
    set $P197["subid"], $P196
.annotate 'line', 362
    find_lex $P198, "$node"
    unless_null $P198, vivify_70
    $P198 = root_new ['parrot';'ResizablePMCArray']
  vivify_70:
    set $P199, $P198[0]
    unless_null $P199, vivify_71
    new $P199, "Undef"
  vivify_71:
    store_lex "$source", $P199
.annotate 'line', 363
    find_lex $P200, "$node"
    $S201 = $P200."compiler"()
    compreg $P202, $S201
    store_lex "$compiler", $P202
.annotate 'line', 364
    find_lex $P205, "$compiler"
    isa $I206, $P205, "Sub"
    if $I206, if_204
.annotate 'line', 366
    find_lex $P211, "$compiler"
    find_lex $P212, "$source"
    find_lex $P213, "%options"
    $P214 = $P211."compile"($P212, $P213 :flat)
    set $P203, $P214
.annotate 'line', 364
    goto if_204_end
  if_204:
.annotate 'line', 365
    find_lex $P207, "$compiler"
    find_lex $P208, "$source"
    find_lex $P209, "%options"
    $P210 = $P207($P208, $P209 :flat)
    set $P203, $P210
  if_204_end:
.annotate 'line', 358
    .return ($P203)
  control_187:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P215, exception, "payload"
    .return ($P215)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("21_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_219
    .param pmc param_220
.annotate 'line', 386
    .const 'Sub' $P238 = "22_1308074667.1448" 
    capture_lex $P238
    new $P218, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P218, control_217
    push_eh $P218
    .lex "self", self
    .lex "$post", param_219
    .lex "%adverbs", param_220
.annotate 'line', 390
    $P221 = root_new ['parrot';'Hash']
    .lex "%context", $P221
    find_lex $P222, "self"
    find_lex $P223, "$post"
    find_lex $P224, "%adverbs"
    $P225 = $P222."create_context"($P223, $P224)
    store_lex "%context", $P225
.annotate 'line', 391
    new $P226, "Integer"
    assign $P226, 0
    find_lex $P227, "%context"
    unless_null $P227, vivify_72
    $P227 = root_new ['parrot';'Hash']
    store_lex "%context", $P227
  vivify_72:
    set $P227["DEBUG"], $P226
.annotate 'line', 393
    find_lex $P228, "$post"
    find_lex $P229, "%context"
    unless_null $P229, vivify_73
    $P229 = root_new ['parrot';'Hash']
    store_lex "%context", $P229
  vivify_73:
    set $P229["pir_file"], $P228
.annotate 'line', 398
    find_lex $P230, "self"
    find_lex $P231, "$post"
    $P230."enumerate_subs"($P231)
.annotate 'line', 400
    find_lex $P233, "$post"
    $P234 = $P233."list"()
    defined $I235, $P234
    unless $I235, for_undef_74
    iter $P232, $P234
    new $P245, 'ExceptionHandler'
    set_label $P245, loop244_handler
    $P245."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P245
  loop244_test:
    unless $P232, loop244_done
    shift $P236, $P232
  loop244_redo:
    .const 'Sub' $P238 = "22_1308074667.1448" 
    capture_lex $P238
    $P238($P236)
  loop244_next:
    goto loop244_test
  loop244_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P246, exception, 'type'
    eq $P246, .CONTROL_LOOP_NEXT, loop244_next
    eq $P246, .CONTROL_LOOP_REDO, loop244_redo
  loop244_done:
    pop_eh 
  for_undef_74:
    find_lex $P247, "%context"
    unless_null $P247, vivify_75
    $P247 = root_new ['parrot';'Hash']
  vivify_75:
    set $P248, $P247["packfile"]
    unless_null $P248, vivify_76
    new $P248, "Undef"
  vivify_76:
.annotate 'line', 386
    .return ($P248)
  control_217:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P249, exception, "payload"
    .return ($P249)
.end


.namespace ["POST";"Compiler"]
.sub "_block237"  :anon :subid("22_1308074667.1448") :outer("21_1308074667.1448")
    .param pmc param_239
.annotate 'line', 400
    .lex "$s", param_239
.annotate 'line', 401
    find_lex $P240, "self"
    find_lex $P241, "$s"
    find_lex $P242, "%context"
    $P243 = $P240."to_pbc"($P241, $P242)
.annotate 'line', 400
    .return ($P243)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("23_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["Undef"],_)
    .param pmc param_253
    .param pmc param_254
.annotate 'line', 410
    new $P252, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P252, control_251
    push_eh $P252
    .lex "self", self
    .lex "$what", param_253
    .lex "%context", param_254
    .return ()
  control_251:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P255, exception, "payload"
    .return ($P255)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("24_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Sub"],_)
    .param pmc param_259
    .param pmc param_260
.annotate 'line', 414
    .const 'Sub' $P425 = "26_1308074667.1448" 
    capture_lex $P425
    .const 'Sub' $P346 = "25_1308074667.1448" 
    capture_lex $P346
    new $P258, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P258, control_257
    push_eh $P258
    .lex "self", self
    .lex "$sub", param_259
    .lex "%context", param_260
.annotate 'line', 419
    $P261 = root_new ['parrot';'ResizablePMCArray']
    .lex "@n_regs_used", $P261
.annotate 'line', 423
    new $P262, "Undef"
    .lex "$bc", $P262
.annotate 'line', 429
    new $P263, "Undef"
    .lex "$sb", $P263
.annotate 'line', 431
    new $P264, "Undef"
    .lex "$subname", $P264
.annotate 'line', 436
    new $P265, "Undef"
    .lex "$start_offset", $P265
.annotate 'line', 465
    new $P266, "Undef"
    .lex "$end_offset", $P266
.annotate 'line', 472
    $P267 = root_new ['parrot';'Hash']
    .lex "%sub", $P267
.annotate 'line', 499
    new $P268, "Undef"
    .lex "$idx", $P268
.annotate 'line', 416
    find_lex $P269, "$sub"
    find_lex $P270, "%context"
    unless_null $P270, vivify_77
    $P270 = root_new ['parrot';'Hash']
    store_lex "%context", $P270
  vivify_77:
    set $P270["sub"], $P269
.annotate 'line', 419
    find_lex $P271, "%context"
    unless_null $P271, vivify_78
    $P271 = root_new ['parrot';'Hash']
  vivify_78:
    set $P272, $P271["regalloc"]
    unless_null $P272, vivify_79
    new $P272, "Undef"
  vivify_79:
    find_lex $P273, "$sub"
    $P274 = $P272."process"($P273)
    store_lex "@n_regs_used", $P274
.annotate 'line', 420
    find_lex $P276, "%context"
    unless_null $P276, vivify_80
    $P276 = root_new ['parrot';'Hash']
  vivify_80:
    set $P277, $P276["DEBUG"]
    unless_null $P277, vivify_81
    new $P277, "Undef"
  vivify_81:
    unless $P277, if_275_end
    find_lex $P278, "self"
    new $P279, "String"
    assign $P279, "n_regs_used "
    find_lex $P280, "@n_regs_used"
    $S281 = $P280."join"("-")
    concat $P282, $P279, $S281
    $P278."debug"($P282)
  if_275_end:
.annotate 'line', 421
    find_lex $P284, "%context"
    unless_null $P284, vivify_82
    $P284 = root_new ['parrot';'Hash']
  vivify_82:
    set $P285, $P284["DEBUG"]
    unless_null $P285, vivify_83
    new $P285, "Undef"
  vivify_83:
    unless $P285, if_283_end
    find_lex $P286, "self"
    find_lex $P287, "$sub"
    $P286."dumper"($P287, "sub")
  if_283_end:
.annotate 'line', 423
    find_lex $P288, "%context"
    unless_null $P288, vivify_84
    $P288 = root_new ['parrot';'Hash']
  vivify_84:
    set $P289, $P288["bytecode"]
    unless_null $P289, vivify_85
    new $P289, "Undef"
  vivify_85:
    store_lex "$bc", $P289
.annotate 'line', 426
    $P290 = "hash"()
    find_lex $P291, "%context"
    unless_null $P291, vivify_86
    $P291 = root_new ['parrot';'Hash']
    store_lex "%context", $P291
  vivify_86:
    set $P291["labels_todo"], $P290
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
    find_lex $P301, "%context"
    unless_null $P301, vivify_87
    $P301 = root_new ['parrot';'Hash']
  vivify_87:
    set $P302, $P301["DEBUG"]
    unless_null $P302, vivify_88
    new $P302, "Undef"
  vivify_88:
    unless $P302, if_300_end
    find_lex $P303, "self"
    new $P304, 'String'
    set $P304, "Emitting "
    find_lex $P305, "$subname"
    concat $P306, $P304, $P305
    $P303."debug"($P306)
  if_300_end:
.annotate 'line', 434
    find_lex $P307, "%context"
    unless_null $P307, vivify_89
    $P307 = root_new ['parrot';'Hash']
  vivify_89:
    set $P308, $P307["constants"]
    unless_null $P308, vivify_90
    new $P308, "Undef"
  vivify_90:
    find_lex $P309, "$subname"
    $P308."get_or_create_string"($P309)
.annotate 'line', 436
    find_lex $P310, "$bc"
    set $N311, $P310
    new $P312, 'Float'
    set $P312, $N311
    store_lex "$start_offset", $P312
.annotate 'line', 437
    find_lex $P314, "%context"
    unless_null $P314, vivify_91
    $P314 = root_new ['parrot';'Hash']
  vivify_91:
    set $P315, $P314["DEBUG"]
    unless_null $P315, vivify_92
    new $P315, "Undef"
  vivify_92:
    unless $P315, if_313_end
    find_lex $P316, "self"
    new $P317, 'String'
    set $P317, "From "
    find_lex $P318, "$start_offset"
    concat $P319, $P317, $P318
    $P316."debug"($P319)
  if_313_end:
.annotate 'line', 440
    find_lex $P321, "$sub"
    unless_null $P321, vivify_93
    $P321 = root_new ['parrot';'Hash']
  vivify_93:
    set $P322, $P321["params"]
    unless_null $P322, vivify_94
    new $P322, "Undef"
  vivify_94:
    if $P322, unless_320_end
    $P323 = "list"()
    find_lex $P324, "$sub"
    unless_null $P324, vivify_95
    $P324 = root_new ['parrot';'Hash']
    store_lex "$sub", $P324
  vivify_95:
    set $P324["params"], $P323
  unless_320_end:
.annotate 'line', 441
    find_lex $P326, "$sub"
    $P327 = $P326."is_method"()
    unless $P327, if_325_end
    find_lex $P328, "$sub"
    unless_null $P328, vivify_96
    $P328 = root_new ['parrot';'Hash']
  vivify_96:
    set $P329, $P328["params"]
    unless_null $P329, vivify_97
    new $P329, "Undef"
  vivify_97:
    get_hll_global $P330, ["POST"], "Value"
    $P331 = $P330."new"("self" :named("name"))
    $P329."unshift"($P331)
  if_325_end:
.annotate 'line', 443
    find_lex $P333, "$sub"
    unless_null $P333, vivify_98
    $P333 = root_new ['parrot';'Hash']
  vivify_98:
    set $P334, $P333["params"]
    unless_null $P334, vivify_99
    new $P334, "Undef"
  vivify_99:
    set $N335, $P334
    unless $N335, if_332_end
.annotate 'line', 444
    find_lex $P336, "self"
    find_lex $P337, "$sub"
    unless_null $P337, vivify_100
    $P337 = root_new ['parrot';'Hash']
  vivify_100:
    set $P338, $P337["params"]
    unless_null $P338, vivify_101
    new $P338, "Undef"
  vivify_101:
    find_lex $P339, "%context"
    $P336."build_pcc_call"("get_params_pc", $P338, $P339)
  if_332_end:
.annotate 'line', 448
    find_lex $P341, "$sub"
    $P342 = $P341."list"()
    defined $I343, $P342
    unless $I343, for_undef_102
    iter $P340, $P342
    new $P353, 'ExceptionHandler'
    set_label $P353, loop352_handler
    $P353."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P353
  loop352_test:
    unless $P340, loop352_done
    shift $P344, $P340
  loop352_redo:
    .const 'Sub' $P346 = "25_1308074667.1448" 
    capture_lex $P346
    $P346($P344)
  loop352_next:
    goto loop352_test
  loop352_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P354, exception, 'type'
    eq $P354, .CONTROL_LOOP_NEXT, loop352_next
    eq $P354, .CONTROL_LOOP_REDO, loop352_redo
  loop352_done:
    pop_eh 
  for_undef_102:
.annotate 'line', 452
    find_lex $P356, "%context"
    unless_null $P356, vivify_103
    $P356 = root_new ['parrot';'Hash']
  vivify_103:
    set $P357, $P356["DEBUG"]
    unless_null $P357, vivify_104
    new $P357, "Undef"
  vivify_104:
    unless $P357, if_355_end
    find_lex $P358, "self"
    new $P359, 'String'
    set $P359, "Middle "
    find_lex $P360, "$bc"
    set $N361, $P360
    set $S362, $N361
    concat $P363, $P359, $S362
    $P358."debug"($P363)
  if_355_end:
.annotate 'line', 455
    find_lex $P365, "%context"
    unless_null $P365, vivify_105
    $P365 = root_new ['parrot';'Hash']
  vivify_105:
    set $P366, $P365["DEBUG"]
    unless_null $P366, vivify_106
    new $P366, "Undef"
  vivify_106:
    unless $P366, if_364_end
    find_lex $P367, "self"
    $P367."debug"("Emitting default return")
  if_364_end:
.annotate 'line', 456
    find_lex $P368, "$bc"
.annotate 'line', 457
    new $P369, "ResizablePMCArray"
    push $P369, "set_returns_pc"
    push $P369, 0
    $P368."push"($P369)
.annotate 'line', 461
    find_lex $P370, "$bc"
    new $P371, "ResizablePMCArray"
    push $P371, "returncc"
    $P370."push"($P371)
.annotate 'line', 465
    find_lex $P372, "$bc"
    set $N373, $P372
    new $P374, 'Float'
    set $P374, $N373
    store_lex "$end_offset", $P374
.annotate 'line', 466
    find_lex $P376, "%context"
    unless_null $P376, vivify_107
    $P376 = root_new ['parrot';'Hash']
  vivify_107:
    set $P377, $P376["DEBUG"]
    unless_null $P377, vivify_108
    new $P377, "Undef"
  vivify_108:
    unless $P377, if_375_end
    find_lex $P378, "self"
    new $P379, 'String'
    set $P379, "To "
    find_lex $P380, "$end_offset"
    concat $P381, $P379, $P380
    $P378."debug"($P381)
  if_375_end:
.annotate 'line', 469
    find_lex $P382, "self"
    find_lex $P383, "$sub"
    find_lex $P384, "%context"
    unless_null $P384, vivify_109
    $P384 = root_new ['parrot';'Hash']
  vivify_109:
    set $P385, $P384["labels_todo"]
    unless_null $P385, vivify_110
    new $P385, "Undef"
  vivify_110:
    find_lex $P386, "%context"
    unless_null $P386, vivify_111
    $P386 = root_new ['parrot';'Hash']
  vivify_111:
    set $P387, $P386["bytecode"]
    unless_null $P387, vivify_112
    new $P387, "Undef"
  vivify_112:
    find_lex $P388, "%context"
    $P382."fixup_labels"($P383, $P385, $P387, $P388)
.annotate 'line', 472
    find_lex $P389, "$start_offset"
    find_lex $P390, "$end_offset"
    find_lex $P391, "$subname"
.annotate 'line', 477
    find_lex $P393, "$sub"
    unless_null $P393, vivify_113
    $P393 = root_new ['parrot';'Hash']
  vivify_113:
    set $P394, $P393["subid"]
    unless_null $P394, vivify_114
    new $P394, "Undef"
  vivify_114:
    set $P392, $P394
    defined $I396, $P392
    if $I396, default_395
    find_lex $P397, "$subname"
    set $P392, $P397
  default_395:
.annotate 'line', 478
    find_lex $P399, "$sub"
    $P400 = $P399."nsentry"()
    set $P398, $P400
    defined $I402, $P398
    if $I402, default_401
    find_lex $P403, "$subname"
    set $P398, $P403
  default_401:
.annotate 'line', 481
    find_lex $P406, "$sub"
    $P407 = $P406."is_method"()
    if $P407, if_405
    new $P409, "String"
    assign $P409, ""
    set $P404, $P409
    goto if_405_end
  if_405:
    find_lex $P408, "$subname"
    set $P404, $P408
  if_405_end:
.annotate 'line', 472
    find_lex $P410, "@n_regs_used"
.annotate 'line', 485
    find_lex $P411, "self"
    find_lex $P412, "$sub"
    find_lex $P413, "%context"
    $P414 = $P411."create_sub_pf_flags"($P412, $P413)
.annotate 'line', 486
    find_lex $P415, "self"
    find_lex $P416, "$sub"
    find_lex $P417, "%context"
    $P418 = $P415."create_sub_comp_flags"($P416, $P417)
.annotate 'line', 472
    $P419 = "hash"($P389 :named("start_offs"), $P390 :named("end_offs"), $P391 :named("name"), $P392 :named("subid"), $P398 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P404 :named("method_name"), $P410 :named("n_regs_used"), $P414 :named("pf_flags"), $P418 :named("comp_flags"))
    store_lex "%sub", $P419
.annotate 'line', 489
    find_lex $P421, "$sub"
    $P422 = $P421."namespace"()
    $P423 = "defined"($P422)
    unless $P423, if_420_end
    .const 'Sub' $P425 = "26_1308074667.1448" 
    capture_lex $P425
    $P425()
  if_420_end:
.annotate 'line', 499
    find_lex $P439, "$sub"
    $P440 = $P439."constant_index"()
    store_lex "$idx", $P440
.annotate 'line', 500
    find_lex $P442, "$idx"
    $P443 = "defined"($P442)
    if $P443, if_441
.annotate 'line', 505
    find_lex $P457, "%context"
    unless_null $P457, vivify_117
    $P457 = root_new ['parrot';'Hash']
  vivify_117:
    set $P458, $P457["constants"]
    unless_null $P458, vivify_118
    new $P458, "Undef"
  vivify_118:
    find_lex $P459, "%sub"
    $P460 = "new"("Sub", $P459)
    $P461 = $P458."push"($P460)
    store_lex "$idx", $P461
.annotate 'line', 506
    find_lex $P462, "$sub"
    find_lex $P463, "$idx"
    $P462."constant_index"($P463)
.annotate 'line', 507
    find_lex $P465, "%context"
    unless_null $P465, vivify_119
    $P465 = root_new ['parrot';'Hash']
  vivify_119:
    set $P466, $P465["DEBUG"]
    unless_null $P466, vivify_120
    new $P466, "Undef"
  vivify_120:
    unless $P466, if_464_end
    find_lex $P467, "self"
    new $P468, 'String'
    set $P468, "Allocate new constant "
    find_lex $P469, "$idx"
    concat $P470, $P468, $P469
    $P467."debug"($P470)
  if_464_end:
.annotate 'line', 504
    goto if_441_end
  if_441:
.annotate 'line', 501
    find_lex $P445, "%context"
    unless_null $P445, vivify_121
    $P445 = root_new ['parrot';'Hash']
  vivify_121:
    set $P446, $P445["DEBUG"]
    unless_null $P446, vivify_122
    new $P446, "Undef"
  vivify_122:
    unless $P446, if_444_end
    find_lex $P447, "self"
    new $P448, 'String'
    set $P448, "Reusing old constant "
    find_lex $P449, "$idx"
    concat $P450, $P448, $P449
    $P447."debug"($P450)
  if_444_end:
.annotate 'line', 502
    find_lex $P451, "%sub"
    $P452 = "new"("Sub", $P451)
    find_lex $P453, "$idx"
    set $I454, $P453
    find_lex $P455, "%context"
    unless_null $P455, vivify_123
    $P455 = root_new ['parrot';'Hash']
    store_lex "%context", $P455
  vivify_123:
    set $P456, $P455["constants"]
    unless_null $P456, vivify_124
    $P456 = root_new ['parrot';'ResizablePMCArray']
    set $P455["constants"], $P456
  vivify_124:
    set $P456[$I454], $P452
  if_441_end:
.annotate 'line', 511
    find_lex $P473, "%context"
    unless_null $P473, vivify_125
    $P473 = root_new ['parrot';'Hash']
  vivify_125:
    set $P474, $P473["got_main_sub"]
    unless_null $P474, vivify_126
    new $P474, "Undef"
  vivify_126:
    isfalse $I475, $P474
    if $I475, if_472
    new $P471, 'Integer'
    set $P471, $I475
    goto if_472_end
  if_472:
.annotate 'line', 512
    find_lex $P477, "%context"
    unless_null $P477, vivify_127
    $P477 = root_new ['parrot';'Hash']
  vivify_127:
    set $P478, $P477["DEBUG"]
    unless_null $P478, vivify_128
    new $P478, "Undef"
  vivify_128:
    unless $P478, if_476_end
    find_lex $P479, "self"
    new $P480, 'String'
    set $P480, "main_sub is "
    find_lex $P481, "%context"
    unless_null $P481, vivify_129
    $P481 = root_new ['parrot';'Hash']
  vivify_129:
    set $P482, $P481["bytecode"]
    unless_null $P482, vivify_130
    new $P482, "Undef"
  vivify_130:
    $P483 = $P482."main_sub"()
    set $S484, $P483
    concat $P485, $P480, $S484
    $P479."debug"($P485)
  if_476_end:
.annotate 'line', 513
    find_lex $P487, "$sub"
    $P488 = $P487."main"()
    if $P488, if_486
.annotate 'line', 519
    find_lex $P499, "%context"
    unless_null $P499, vivify_131
    $P499 = root_new ['parrot';'Hash']
  vivify_131:
    set $P500, $P499["bytecode"]
    unless_null $P500, vivify_132
    new $P500, "Undef"
  vivify_132:
    $N501 = $P500."main_sub"()
    iseq $I502, $N501, -1.0
    unless $I502, if_498_end
.annotate 'line', 521
    find_lex $P504, "%context"
    unless_null $P504, vivify_133
    $P504 = root_new ['parrot';'Hash']
  vivify_133:
    set $P505, $P504["DEBUG"]
    unless_null $P505, vivify_134
    new $P505, "Undef"
  vivify_134:
    unless $P505, if_503_end
    find_lex $P506, "self"
    $P506."debug"("Got first sub")
  if_503_end:
.annotate 'line', 522
    find_lex $P507, "%context"
    unless_null $P507, vivify_135
    $P507 = root_new ['parrot';'Hash']
  vivify_135:
    set $P508, $P507["bytecode"]
    unless_null $P508, vivify_136
    new $P508, "Undef"
  vivify_136:
    find_lex $P509, "$idx"
    $P508."main_sub"($P509)
  if_498_end:
.annotate 'line', 519
    goto if_486_end
  if_486:
.annotate 'line', 514
    find_lex $P490, "%context"
    unless_null $P490, vivify_137
    $P490 = root_new ['parrot';'Hash']
  vivify_137:
    set $P491, $P490["DEBUG"]
    unless_null $P491, vivify_138
    new $P491, "Undef"
  vivify_138:
    unless $P491, if_489_end
    find_lex $P492, "self"
    $P492."debug"("Got first :main")
  if_489_end:
.annotate 'line', 516
    find_lex $P493, "%context"
    unless_null $P493, vivify_139
    $P493 = root_new ['parrot';'Hash']
  vivify_139:
    set $P494, $P493["bytecode"]
    unless_null $P494, vivify_140
    new $P494, "Undef"
  vivify_140:
    find_lex $P495, "$idx"
    $P494."main_sub"($P495)
.annotate 'line', 517
    new $P496, "Integer"
    assign $P496, 1
    find_lex $P497, "%context"
    unless_null $P497, vivify_141
    $P497 = root_new ['parrot';'Hash']
    store_lex "%context", $P497
  vivify_141:
    set $P497["got_main_sub"], $P496
  if_486_end:
.annotate 'line', 525
    find_lex $P512, "%context"
    unless_null $P512, vivify_142
    $P512 = root_new ['parrot';'Hash']
  vivify_142:
    set $P513, $P512["DEBUG"]
    unless_null $P513, vivify_143
    new $P513, "Undef"
  vivify_143:
    if $P513, if_511
    set $P510, $P513
    goto if_511_end
  if_511:
    find_lex $P514, "self"
    new $P515, 'String'
    set $P515, ":main sub is "
    find_lex $P516, "%context"
    unless_null $P516, vivify_144
    $P516 = root_new ['parrot';'Hash']
  vivify_144:
    set $P517, $P516["bytecode"]
    unless_null $P517, vivify_145
    new $P517, "Undef"
  vivify_145:
    $P518 = $P517."main_sub"()
    set $S519, $P518
    concat $P520, $P515, $S519
    $P521 = $P514."debug"($P520)
    set $P510, $P521
  if_511_end:
.annotate 'line', 511
    set $P471, $P510
  if_472_end:
.annotate 'line', 414
    .return ($P471)
  control_257:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P522, exception, "payload"
    .return ($P522)
.end


.namespace ["POST";"Compiler"]
.sub "_block345"  :anon :subid("25_1308074667.1448") :outer("24_1308074667.1448")
    .param pmc param_347
.annotate 'line', 448
    .lex "$_", param_347
.annotate 'line', 449
    find_lex $P348, "self"
    find_lex $P349, "$_"
    find_lex $P350, "%context"
    $P351 = $P348."to_pbc"($P349, $P350)
.annotate 'line', 448
    .return ($P351)
.end


.namespace ["POST";"Compiler"]
.sub "_block424"  :anon :subid("26_1308074667.1448") :outer("24_1308074667.1448")
.annotate 'line', 490
    new $P426, "Undef"
    .lex "$nskey", $P426
    find_lex $P427, "$sub"
    $P428 = $P427."namespace"()
    find_lex $P429, "%context"
    $P430 = $P428."to_pmc"($P429)
    set $P431, $P430[0]
    unless_null $P431, vivify_115
    new $P431, "Undef"
  vivify_115:
    store_lex "$nskey", $P431
.annotate 'line', 491
    find_lex $P434, "$nskey"
    typeof $S435, $P434
    iseq $I436, $S435, "Key"
    if $I436, if_433
    new $P432, 'Integer'
    set $P432, $I436
    goto if_433_end
  if_433:
.annotate 'line', 492
    find_lex $P437, "$nskey"
    find_lex $P438, "%sub"
    unless_null $P438, vivify_116
    $P438 = root_new ['parrot';'Hash']
    store_lex "%sub", $P438
  vivify_116:
    set $P438["namespace_name"], $P437
.annotate 'line', 491
    set $P432, $P437
  if_433_end:
.annotate 'line', 489
    .return ($P432)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("27_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Op"],_)
    .param pmc param_526
    .param pmc param_527
.annotate 'line', 529
    .const 'Sub' $P590 = "29_1308074667.1448" 
    capture_lex $P590
    .const 'Sub' $P545 = "28_1308074667.1448" 
    capture_lex $P545
    new $P525, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P525, control_524
    push_eh $P525
    .lex "self", self
    .lex "$op", param_526
    .lex "%context", param_527
.annotate 'line', 531
    new $P528, "Undef"
    .lex "$fullname", $P528
.annotate 'line', 546
    $P529 = root_new ['parrot';'ResizablePMCArray']
    .lex "@op", $P529
.annotate 'line', 531
    find_lex $P530, "$op"
    $P531 = $P530."pirop"()
    store_lex "$fullname", $P531
.annotate 'line', 532
    find_lex $P533, "%context"
    unless_null $P533, vivify_146
    $P533 = root_new ['parrot';'Hash']
  vivify_146:
    set $P534, $P533["DEBUG"]
    unless_null $P534, vivify_147
    new $P534, "Undef"
  vivify_147:
    unless $P534, if_532_end
    find_lex $P535, "self"
    new $P536, 'String'
    set $P536, "Short name "
    find_lex $P537, "$fullname"
    concat $P538, $P536, $P537
    $P535."debug"($P538)
  if_532_end:
.annotate 'line', 534
    find_lex $P540, "$op"
    $P541 = $P540."list"()
    defined $I542, $P541
    unless $I542, for_undef_148
    iter $P539, $P541
    new $P566, 'ExceptionHandler'
    set_label $P566, loop565_handler
    $P566."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P566
  loop565_test:
    unless $P539, loop565_done
    shift $P543, $P539
  loop565_redo:
    .const 'Sub' $P545 = "28_1308074667.1448" 
    capture_lex $P545
    $P545($P543)
  loop565_next:
    goto loop565_test
  loop565_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P567, exception, 'type'
    eq $P567, .CONTROL_LOOP_NEXT, loop565_next
    eq $P567, .CONTROL_LOOP_REDO, loop565_redo
  loop565_done:
    pop_eh 
  for_undef_148:
.annotate 'line', 539
    find_lex $P569, "%context"
    unless_null $P569, vivify_149
    $P569 = root_new ['parrot';'Hash']
  vivify_149:
    set $P570, $P569["DEBUG"]
    unless_null $P570, vivify_150
    new $P570, "Undef"
  vivify_150:
    unless $P570, if_568_end
    find_lex $P571, "self"
    new $P572, 'String'
    set $P572, "Fullname "
    find_lex $P573, "$fullname"
    concat $P574, $P572, $P573
    $P571."debug"($P574)
  if_568_end:
.annotate 'line', 542
    find_lex $P575, "%context"
    unless_null $P575, vivify_151
    $P575 = root_new ['parrot';'Hash']
  vivify_151:
    set $P576, $P575["bytecode"]
    unless_null $P576, vivify_152
    new $P576, "Undef"
  vivify_152:
    set $N577, $P576
    new $P578, 'Float'
    set $P578, $N577
    find_lex $P579, "%context"
    unless_null $P579, vivify_153
    $P579 = root_new ['parrot';'Hash']
    store_lex "%context", $P579
  vivify_153:
    set $P579["opcode_offset"], $P578
.annotate 'line', 544
    find_lex $P580, "$fullname"
    find_lex $P581, "%context"
    unless_null $P581, vivify_154
    $P581 = root_new ['parrot';'Hash']
    store_lex "%context", $P581
  vivify_154:
    set $P581["opcode_fullname"], $P580
.annotate 'line', 546
    find_lex $P582, "$fullname"
    $P583 = "list"($P582)
    store_lex "@op", $P583
.annotate 'line', 547
    find_lex $P585, "$op"
    $P586 = $P585."list"()
    defined $I587, $P586
    unless $I587, for_undef_155
    iter $P584, $P586
    new $P599, 'ExceptionHandler'
    set_label $P599, loop598_handler
    $P599."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P599
  loop598_test:
    unless $P584, loop598_done
    shift $P588, $P584
  loop598_redo:
    .const 'Sub' $P590 = "29_1308074667.1448" 
    capture_lex $P590
    $P590($P588)
  loop598_next:
    goto loop598_test
  loop598_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P600, exception, 'type'
    eq $P600, .CONTROL_LOOP_NEXT, loop598_next
    eq $P600, .CONTROL_LOOP_REDO, loop598_redo
  loop598_done:
    pop_eh 
  for_undef_155:
.annotate 'line', 550
    find_lex $P602, "%context"
    unless_null $P602, vivify_156
    $P602 = root_new ['parrot';'Hash']
  vivify_156:
    set $P603, $P602["DEBUG"]
    unless_null $P603, vivify_157
    new $P603, "Undef"
  vivify_157:
    unless $P603, if_601_end
    find_lex $P604, "self"
    new $P605, 'String'
    set $P605, "Op size "
    find_lex $P606, "@op"
    set $N607, $P606
    set $S608, $N607
    concat $P609, $P605, $S608
    $P604."debug"($P609)
  if_601_end:
.annotate 'line', 551
    find_lex $P610, "%context"
    unless_null $P610, vivify_158
    $P610 = root_new ['parrot';'Hash']
  vivify_158:
    set $P611, $P610["bytecode"]
    unless_null $P611, vivify_159
    new $P611, "Undef"
  vivify_159:
    find_lex $P612, "@op"
    $P613 = $P611."push"($P612)
.annotate 'line', 529
    .return ($P613)
  control_524:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P614, exception, "payload"
    .return ($P614)
.end


.namespace ["POST";"Compiler"]
.sub "_block544"  :anon :subid("28_1308074667.1448") :outer("27_1308074667.1448")
    .param pmc param_547
.annotate 'line', 535
    new $P546, "Undef"
    .lex "$type", $P546
    .lex "$_", param_547
    find_lex $P550, "$_"
    $P551 = $P550."type"()
    unless $P551, unless_549
    set $P548, $P551
    goto unless_549_end
  unless_549:
    find_lex $P552, "self"
    find_lex $P553, "$_"
    $P554 = $P553."name"()
    find_lex $P555, "%context"
    $P556 = $P552."get_register"($P554, $P555)
    $P557 = $P556."type"()
    set $P548, $P557
  unless_549_end:
    store_lex "$type", $P548
.annotate 'line', 536
    find_lex $P558, "$fullname"
    set $S559, $P558
    new $P560, 'String'
    set $P560, $S559
    concat $P561, $P560, "_"
    find_lex $P562, "$type"
    set $S563, $P562
    concat $P564, $P561, $S563
    store_lex "$fullname", $P564
.annotate 'line', 534
    .return ($P564)
.end


.namespace ["POST";"Compiler"]
.sub "_block589"  :anon :subid("29_1308074667.1448") :outer("27_1308074667.1448")
    .param pmc param_591
.annotate 'line', 547
    .lex "$_", param_591
.annotate 'line', 548
    find_lex $P592, "@op"
    find_lex $P593, "self"
    find_lex $P594, "$_"
    find_lex $P595, "%context"
    $P596 = $P593."to_op"($P594, $P595)
    $P597 = $P592."push"($P596)
.annotate 'line', 547
    .return ($P597)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Node"],_)
    .param pmc param_618
    .param pmc param_619
.annotate 'line', 555
    .const 'Sub' $P626 = "31_1308074667.1448" 
    capture_lex $P626
    new $P617, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P617, control_616
    push_eh $P617
    .lex "self", self
    .lex "$node", param_618
    .lex "%context", param_619
.annotate 'line', 556
    find_lex $P621, "$node"
    $P622 = $P621."list"()
    defined $I623, $P622
    unless $I623, for_undef_160
    iter $P620, $P622
    new $P633, 'ExceptionHandler'
    set_label $P633, loop632_handler
    $P633."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P633
  loop632_test:
    unless $P620, loop632_done
    shift $P624, $P620
  loop632_redo:
    .const 'Sub' $P626 = "31_1308074667.1448" 
    capture_lex $P626
    $P626($P624)
  loop632_next:
    goto loop632_test
  loop632_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P634, exception, 'type'
    eq $P634, .CONTROL_LOOP_NEXT, loop632_next
    eq $P634, .CONTROL_LOOP_REDO, loop632_redo
  loop632_done:
    pop_eh 
  for_undef_160:
.annotate 'line', 555
    .return ($P620)
  control_616:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P635, exception, "payload"
    .return ($P635)
.end


.namespace ["POST";"Compiler"]
.sub "_block625"  :anon :subid("31_1308074667.1448") :outer("30_1308074667.1448")
    .param pmc param_627
.annotate 'line', 556
    .lex "$_", param_627
.annotate 'line', 557
    find_lex $P628, "self"
    find_lex $P629, "$_"
    find_lex $P630, "%context"
    $P631 = $P628."to_pbc"($P629, $P630)
.annotate 'line', 556
    .return ($P631)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("32_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Label"],_)
    .param pmc param_639
    .param pmc param_640
.annotate 'line', 561
    .const 'Sub' $P672 = "33_1308074667.1448" 
    capture_lex $P672
    new $P638, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P638, control_637
    push_eh $P638
    .lex "self", self
    .lex "$l", param_639
    .lex "%context", param_640
.annotate 'line', 562
    new $P641, "Undef"
    .lex "$bc", $P641
.annotate 'line', 565
    new $P642, "Undef"
    .lex "$pos", $P642
.annotate 'line', 562
    find_lex $P643, "%context"
    unless_null $P643, vivify_161
    $P643 = root_new ['parrot';'Hash']
  vivify_161:
    set $P644, $P643["bytecode"]
    unless_null $P644, vivify_162
    new $P644, "Undef"
  vivify_162:
    store_lex "$bc", $P644
.annotate 'line', 563
    find_lex $P646, "$l"
    $P647 = $P646."declared"()
    if $P647, unless_645_end
    find_lex $P648, "self"
    $P648."panic"("Trying to emit undelcared label!")
  unless_645_end:
.annotate 'line', 565
    find_lex $P649, "$bc"
    set $N650, $P649
    new $P651, 'Float'
    set $P651, $N650
    store_lex "$pos", $P651
.annotate 'line', 566
    find_lex $P653, "%context"
    unless_null $P653, vivify_163
    $P653 = root_new ['parrot';'Hash']
  vivify_163:
    set $P654, $P653["DEBUG"]
    unless_null $P654, vivify_164
    new $P654, "Undef"
  vivify_164:
    unless $P654, if_652_end
    find_lex $P655, "self"
    new $P656, 'String'
    set $P656, "Declare label '"
    find_lex $P657, "$l"
    $P658 = $P657."name"()
    set $S659, $P658
    concat $P660, $P656, $S659
    concat $P661, $P660, "' at "
    find_lex $P662, "$pos"
    concat $P663, $P661, $P662
    $P655."debug"($P663)
  if_652_end:
.annotate 'line', 568
    find_lex $P664, "$l"
    find_lex $P665, "$pos"
    $P664."position"($P665)
.annotate 'line', 570
    find_lex $P667, "$l"
    $P668 = $P667."list"()
    defined $I669, $P668
    unless $I669, for_undef_165
    iter $P666, $P668
    new $P679, 'ExceptionHandler'
    set_label $P679, loop678_handler
    $P679."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P679
  loop678_test:
    unless $P666, loop678_done
    shift $P670, $P666
  loop678_redo:
    .const 'Sub' $P672 = "33_1308074667.1448" 
    capture_lex $P672
    $P672($P670)
  loop678_next:
    goto loop678_test
  loop678_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P680, exception, 'type'
    eq $P680, .CONTROL_LOOP_NEXT, loop678_next
    eq $P680, .CONTROL_LOOP_REDO, loop678_redo
  loop678_done:
    pop_eh 
  for_undef_165:
.annotate 'line', 561
    .return ($P666)
  control_637:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P681, exception, "payload"
    .return ($P681)
.end


.namespace ["POST";"Compiler"]
.sub "_block671"  :anon :subid("33_1308074667.1448") :outer("32_1308074667.1448")
    .param pmc param_673
.annotate 'line', 570
    .lex "$_", param_673
.annotate 'line', 571
    find_lex $P674, "self"
    find_lex $P675, "$_"
    find_lex $P676, "%context"
    $P677 = $P674."to_pbc"($P675, $P676)
.annotate 'line', 570
    .return ($P677)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("34_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Call"],_)
    .param pmc param_685
    .param pmc param_686
.annotate 'line', 575
    .const 'Sub' $P751 = "35_1308074667.1448" 
    capture_lex $P751
    new $P684, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P684, control_683
    push_eh $P684
    .lex "self", self
    .lex "$call", param_685
    .lex "%context", param_686
.annotate 'line', 576
    new $P687, "Undef"
    .lex "$bc", $P687
.annotate 'line', 577
    new $P688, "Undef"
    .lex "$calltype", $P688
.annotate 'line', 578
    new $P689, "Undef"
    .lex "$is_tailcall", $P689
.annotate 'line', 576
    find_lex $P690, "%context"
    unless_null $P690, vivify_166
    $P690 = root_new ['parrot';'Hash']
  vivify_166:
    set $P691, $P690["bytecode"]
    unless_null $P691, vivify_167
    new $P691, "Undef"
  vivify_167:
    store_lex "$bc", $P691
.annotate 'line', 577
    find_lex $P692, "$call"
    $P693 = $P692."calltype"()
    store_lex "$calltype", $P693
.annotate 'line', 578
    find_lex $P694, "$calltype"
    set $S695, $P694
    iseq $I696, $S695, "tailcall"
    new $P697, 'Integer'
    set $P697, $I696
    store_lex "$is_tailcall", $P697
.annotate 'line', 580
    find_lex $P702, "$calltype"
    set $S703, $P702
    iseq $I704, $S703, "call"
    unless $I704, unless_701
    new $P700, 'Integer'
    set $P700, $I704
    goto unless_701_end
  unless_701:
    find_lex $P705, "$calltype"
    set $S706, $P705
    iseq $I707, $S706, "tailcall"
    new $P700, 'Integer'
    set $P700, $I707
  unless_701_end:
    if $P700, if_699
.annotate 'line', 658
    find_lex $P891, "$calltype"
    set $S892, $P891
    iseq $I893, $S892, "return"
    if $I893, if_890
.annotate 'line', 662
    find_lex $P903, "$calltype"
    set $S904, $P903
    iseq $I905, $S904, "results"
    if $I905, if_902
.annotate 'line', 667
    find_lex $P911, "self"
    new $P912, 'String'
    set $P912, "NYI "
    find_lex $P913, "$calltype"
    set $S914, $P913
    concat $P915, $P912, $S914
    $P916 = $P911."panic"($P915)
.annotate 'line', 666
    set $P901, $P916
.annotate 'line', 662
    goto if_902_end
  if_902:
.annotate 'line', 664
    find_lex $P906, "self"
    find_lex $P907, "$call"
    unless_null $P907, vivify_168
    $P907 = root_new ['parrot';'Hash']
  vivify_168:
    set $P908, $P907["params"]
    unless_null $P908, vivify_169
    new $P908, "Undef"
  vivify_169:
    find_lex $P909, "%context"
    $P910 = $P906."build_pcc_call"("get_results_pc", $P908, $P909)
.annotate 'line', 662
    set $P901, $P910
  if_902_end:
    set $P889, $P901
.annotate 'line', 658
    goto if_890_end
  if_890:
.annotate 'line', 659
    find_lex $P894, "self"
    find_lex $P895, "$call"
    unless_null $P895, vivify_170
    $P895 = root_new ['parrot';'Hash']
  vivify_170:
    set $P896, $P895["params"]
    unless_null $P896, vivify_171
    new $P896, "Undef"
  vivify_171:
    find_lex $P897, "%context"
    $P894."build_pcc_call"("set_returns_pc", $P896, $P897)
.annotate 'line', 660
    find_lex $P898, "$bc"
    new $P899, "ResizablePMCArray"
    push $P899, "returncc"
    $P900 = $P898."push"($P899)
.annotate 'line', 658
    set $P889, $P900
  if_890_end:
    set $P698, $P889
.annotate 'line', 580
    goto if_699_end
  if_699:
.annotate 'line', 581
    find_lex $P709, "$call"
    $P710 = $P709."invocant"()
    unless $P710, if_708_end
.annotate 'line', 582
    find_lex $P712, "$call"
    unless_null $P712, vivify_172
    $P712 = root_new ['parrot';'Hash']
  vivify_172:
    set $P713, $P712["params"]
    unless_null $P713, vivify_173
    new $P713, "Undef"
  vivify_173:
    if $P713, unless_711_end
    $P714 = "list"()
    find_lex $P715, "$call"
    unless_null $P715, vivify_174
    $P715 = root_new ['parrot';'Hash']
    store_lex "$call", $P715
  vivify_174:
    set $P715["params"], $P714
  unless_711_end:
.annotate 'line', 583
    find_lex $P716, "$call"
    unless_null $P716, vivify_175
    $P716 = root_new ['parrot';'Hash']
  vivify_175:
    set $P717, $P716["params"]
    unless_null $P717, vivify_176
    new $P717, "Undef"
  vivify_176:
    find_lex $P718, "$call"
    $P719 = $P718."invocant"()
    $P717."unshift"($P719)
  if_708_end:
.annotate 'line', 586
    find_lex $P720, "self"
    find_lex $P721, "$call"
    unless_null $P721, vivify_177
    $P721 = root_new ['parrot';'Hash']
  vivify_177:
    set $P722, $P721["params"]
    unless_null $P722, vivify_178
    new $P722, "Undef"
  vivify_178:
    find_lex $P723, "%context"
    $P720."build_pcc_call"("set_args_pc", $P722, $P723)
.annotate 'line', 588
    find_lex $P725, "$call"
    $P726 = $P725."invocant"()
    if $P726, if_724
.annotate 'line', 602
    .const 'Sub' $P751 = "35_1308074667.1448" 
    capture_lex $P751
    $P751()
    goto if_724_end
  if_724:
.annotate 'line', 589
    find_lex $P728, "$call"
    $P729 = $P728."name"()
    get_hll_global $P730, ["POST"], "Constant"
    $P731 = $P729."isa"($P730)
    if $P731, if_727
.annotate 'line', 599
    find_lex $P749, "self"
    $P749."panic"("NYI $P0.$S0()")
.annotate 'line', 598
    goto if_727_end
  if_727:
.annotate 'line', 590
    find_lex $P732, "$bc"
.annotate 'line', 592
    find_lex $P735, "$is_tailcall"
    if $P735, if_734
    new $P737, "String"
    assign $P737, "callmethodcc_p_sc"
    set $P733, $P737
    goto if_734_end
  if_734:
    new $P736, "String"
    assign $P736, "tailcallmethod_p_sc"
    set $P733, $P736
  if_734_end:
.annotate 'line', 594
    find_lex $P738, "self"
    find_lex $P739, "$call"
    $P740 = $P739."invocant"()
    find_lex $P741, "%context"
    $P742 = $P738."to_op"($P740, $P741)
.annotate 'line', 595
    find_lex $P743, "self"
    find_lex $P744, "$call"
    $P745 = $P744."name"()
    find_lex $P746, "%context"
    $P747 = $P743."to_op"($P745, $P746)
    new $P748, "ResizablePMCArray"
    push $P748, $P733
    push $P748, $P742
    push $P748, $P747
    $P732."push"($P748)
  if_727_end:
  if_724_end:
.annotate 'line', 654
    find_lex $P883, "$is_tailcall"
    unless $P883, unless_882
    set $P881, $P883
    goto unless_882_end
  unless_882:
.annotate 'line', 655
    find_lex $P884, "self"
    find_lex $P885, "$call"
    unless_null $P885, vivify_208
    $P885 = root_new ['parrot';'Hash']
  vivify_208:
    set $P886, $P885["results"]
    unless_null $P886, vivify_209
    new $P886, "Undef"
  vivify_209:
    find_lex $P887, "%context"
    $P888 = $P884."build_pcc_call"("get_results_pc", $P886, $P887)
.annotate 'line', 654
    set $P881, $P888
  unless_882_end:
.annotate 'line', 580
    set $P698, $P881
  if_699_end:
.annotate 'line', 575
    .return ($P698)
  control_683:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P917, exception, "payload"
    .return ($P917)
.end


.namespace ["POST";"Compiler"]
.sub "_block750"  :anon :subid("35_1308074667.1448") :outer("34_1308074667.1448")
.annotate 'line', 602
    .const 'Sub' $P763 = "36_1308074667.1448" 
    capture_lex $P763
.annotate 'line', 603
    new $P752, "Undef"
    .lex "$SUB", $P752
.annotate 'line', 604
    new $P753, "Undef"
    .lex "$processed", $P753
.annotate 'line', 648
    new $P754, "Undef"
    .lex "$o", $P754
.annotate 'line', 602
    find_lex $P755, "$SUB"
.annotate 'line', 604
    new $P756, "Integer"
    assign $P756, 0
    store_lex "$processed", $P756
.annotate 'line', 605
    find_lex $P758, "$call"
    $P759 = $P758."name"()
    get_hll_global $P760, ["POST"], "Constant"
    $P761 = $P759."isa"($P760)
    unless $P761, if_757_end
    .const 'Sub' $P763 = "36_1308074667.1448" 
    capture_lex $P763
    $P763()
  if_757_end:
.annotate 'line', 633
    find_lex $P832, "$processed"
    if $P832, unless_831_end
.annotate 'line', 634
    find_lex $P834, "$call"
    $P835 = $P834."name"()
    get_hll_global $P836, ["POST"], "Constant"
    $P837 = $P835."isa"($P836)
    if $P837, if_833
.annotate 'line', 643
    find_lex $P853, "%context"
    unless_null $P853, vivify_196
    $P853 = root_new ['parrot';'Hash']
  vivify_196:
    set $P854, $P853["DEBUG"]
    unless_null $P854, vivify_197
    new $P854, "Undef"
  vivify_197:
    unless $P854, if_852_end
    find_lex $P855, "self"
    new $P856, "String"
    assign $P856, "Name is "
    find_lex $P857, "$call"
    unless_null $P857, vivify_198
    $P857 = root_new ['parrot';'Hash']
  vivify_198:
    set $P858, $P857["name"]
    unless_null $P858, vivify_199
    new $P858, "Undef"
  vivify_199:
    $S859 = $P858."WHAT"()
    concat $P860, $P856, $S859
    $P855."debug"($P860)
  if_852_end:
.annotate 'line', 644
    find_lex $P861, "$call"
    unless_null $P861, vivify_200
    $P861 = root_new ['parrot';'Hash']
  vivify_200:
    set $P862, $P861["name"]
    unless_null $P862, vivify_201
    new $P862, "Undef"
  vivify_201:
    store_lex "$SUB", $P862
.annotate 'line', 642
    goto if_833_end
  if_833:
.annotate 'line', 635
    find_lex $P838, "%context"
    unless_null $P838, vivify_202
    $P838 = root_new ['parrot';'Hash']
  vivify_202:
    set $P839, $P838["sub"]
    unless_null $P839, vivify_203
    new $P839, "Undef"
  vivify_203:
    $P840 = $P839."symbol"("!SUB")
    store_lex "$SUB", $P840
.annotate 'line', 636
    find_lex $P841, "$bc"
.annotate 'line', 638
    find_lex $P842, "self"
    find_lex $P843, "$SUB"
    find_lex $P844, "%context"
    $P845 = $P842."to_op"($P843, $P844)
.annotate 'line', 639
    find_lex $P846, "self"
    find_lex $P847, "$call"
    unless_null $P847, vivify_204
    $P847 = root_new ['parrot';'Hash']
  vivify_204:
    set $P848, $P847["name"]
    unless_null $P848, vivify_205
    new $P848, "Undef"
  vivify_205:
    find_lex $P849, "%context"
    $P850 = $P846."to_op"($P848, $P849)
    new $P851, "ResizablePMCArray"
    push $P851, "find_sub_not_null_p_sc"
    push $P851, $P845
    push $P851, $P850
    $P841."push"($P851)
  if_833_end:
  unless_831_end:
.annotate 'line', 648
    find_lex $P865, "$is_tailcall"
    if $P865, if_864
    new $P867, "String"
    assign $P867, "invokecc_p"
    set $P863, $P867
    goto if_864_end
  if_864:
    new $P866, "String"
    assign $P866, "tailcall_p"
    set $P863, $P866
  if_864_end:
    store_lex "$o", $P863
.annotate 'line', 650
    find_lex $P869, "%context"
    unless_null $P869, vivify_206
    $P869 = root_new ['parrot';'Hash']
  vivify_206:
    set $P870, $P869["DEBUG"]
    unless_null $P870, vivify_207
    new $P870, "Undef"
  vivify_207:
    unless $P870, if_868_end
    find_lex $P871, "self"
    find_lex $P872, "$o"
    $P871."debug"($P872)
  if_868_end:
.annotate 'line', 651
    find_lex $P873, "$bc"
    find_lex $P874, "$o"
    find_lex $P875, "self"
    find_lex $P876, "$SUB"
    find_lex $P877, "%context"
    $P878 = $P875."to_op"($P876, $P877)
    new $P879, "ResizablePMCArray"
    push $P879, $P874
    push $P879, $P878
    $P880 = $P873."push"($P879)
.annotate 'line', 602
    .return ($P880)
.end


.namespace ["POST";"Compiler"]
.sub "_block762"  :anon :subid("36_1308074667.1448") :outer("35_1308074667.1448")
.annotate 'line', 605
    .const 'Sub' $P799 = "37_1308074667.1448" 
    capture_lex $P799
.annotate 'line', 608
    new $P764, "Undef"
    .lex "$full_name", $P764
.annotate 'line', 611
    new $P765, "Undef"
    .lex "$invocable_sub", $P765
.annotate 'line', 605
    find_lex $P766, "$full_name"
.annotate 'line', 609
    find_lex $P768, "%context"
    unless_null $P768, vivify_179
    $P768 = root_new ['parrot';'Hash']
  vivify_179:
    set $P769, $P768["sub"]
    unless_null $P769, vivify_180
    new $P769, "Undef"
  vivify_180:
    $P770 = $P769."namespace"()
    unless $P770, if_767_end
    find_lex $P771, "%context"
    unless_null $P771, vivify_181
    $P771 = root_new ['parrot';'Hash']
  vivify_181:
    set $P772, $P771["sub"]
    unless_null $P772, vivify_182
    new $P772, "Undef"
  vivify_182:
    $P773 = $P772."namespace"()
    $P774 = $P773."Str"()
    store_lex "$full_name", $P774
  if_767_end:
.annotate 'line', 610
    find_lex $P775, "$full_name"
    set $S776, $P775
    new $P777, 'String'
    set $P777, $S776
    find_lex $P778, "$call"
    unless_null $P778, vivify_183
    $P778 = root_new ['parrot';'Hash']
  vivify_183:
    set $P779, $P778["name"]
    unless_null $P779, vivify_184
    $P779 = root_new ['parrot';'Hash']
  vivify_184:
    set $P780, $P779["value"]
    unless_null $P780, vivify_185
    new $P780, "Undef"
  vivify_185:
    set $S781, $P780
    concat $P782, $P777, $S781
    store_lex "$full_name", $P782
.annotate 'line', 611
    find_lex $P783, "%context"
    unless_null $P783, vivify_186
    $P783 = root_new ['parrot';'Hash']
  vivify_186:
    set $P784, $P783["pir_file"]
    unless_null $P784, vivify_187
    new $P784, "Undef"
  vivify_187:
    find_lex $P785, "$full_name"
    $P786 = $P784."sub"($P785)
    store_lex "$invocable_sub", $P786
.annotate 'line', 612
    find_lex $P788, "%context"
    unless_null $P788, vivify_188
    $P788 = root_new ['parrot';'Hash']
  vivify_188:
    set $P789, $P788["DEBUG"]
    unless_null $P789, vivify_189
    new $P789, "Undef"
  vivify_189:
    unless $P789, if_787_end
    find_lex $P790, "self"
    new $P791, 'String'
    set $P791, "invocable_sub '"
    find_lex $P792, "$full_name"
    concat $P793, $P791, $P792
    concat $P794, $P793, "'"
    $P790."debug"($P794)
  if_787_end:
.annotate 'line', 613
    find_lex $P797, "$invocable_sub"
    if $P797, if_796
    set $P795, $P797
    goto if_796_end
  if_796:
    .const 'Sub' $P799 = "37_1308074667.1448" 
    capture_lex $P799
    $P830 = $P799()
    set $P795, $P830
  if_796_end:
.annotate 'line', 605
    .return ($P795)
.end


.namespace ["POST";"Compiler"]
.sub "_block798"  :anon :subid("37_1308074667.1448") :outer("36_1308074667.1448")
.annotate 'line', 614
    new $P800, "Undef"
    .lex "$idx", $P800
    find_lex $P801, "$invocable_sub"
    $P802 = $P801."constant_index"()
    store_lex "$idx", $P802
.annotate 'line', 615
    find_lex $P804, "$idx"
    $P805 = "defined"($P804)
    if $P805, unless_803_end
.annotate 'line', 617
    find_lex $P806, "%context"
    unless_null $P806, vivify_190
    $P806 = root_new ['parrot';'Hash']
  vivify_190:
    set $P807, $P806["constants"]
    unless_null $P807, vivify_191
    new $P807, "Undef"
  vivify_191:
    $P808 = "new"("Integer")
    $P809 = $P807."push"($P808)
    store_lex "$idx", $P809
.annotate 'line', 618
    find_lex $P810, "$invocable_sub"
    find_lex $P811, "$idx"
    $P810."constant_index"($P811)
.annotate 'line', 619
    find_lex $P813, "%context"
    unless_null $P813, vivify_192
    $P813 = root_new ['parrot';'Hash']
  vivify_192:
    set $P814, $P813["DEBUG"]
    unless_null $P814, vivify_193
    new $P814, "Undef"
  vivify_193:
    unless $P814, if_812_end
    find_lex $P815, "self"
    new $P816, 'String'
    set $P816, "Allocate constant for it "
    find_lex $P817, "$idx"
    concat $P818, $P816, $P817
    $P815."debug"($P818)
  if_812_end:
  unless_803_end:
.annotate 'line', 622
    find_lex $P819, "%context"
    unless_null $P819, vivify_194
    $P819 = root_new ['parrot';'Hash']
  vivify_194:
    set $P820, $P819["sub"]
    unless_null $P820, vivify_195
    new $P820, "Undef"
  vivify_195:
    $P821 = $P820."symbol"("!SUB")
    store_lex "$SUB", $P821
.annotate 'line', 623
    find_lex $P822, "$bc"
.annotate 'line', 625
    find_lex $P823, "self"
    find_lex $P824, "$SUB"
    find_lex $P825, "%context"
    $P826 = $P823."to_op"($P824, $P825)
    find_lex $P827, "$idx"
    new $P828, "ResizablePMCArray"
    push $P828, "set_p_pc"
    push $P828, $P826
    push $P828, $P827
.annotate 'line', 626
    $P822."push"($P828)
.annotate 'line', 629
    new $P829, "Integer"
    assign $P829, 1
    store_lex "$processed", $P829
.annotate 'line', 613
    .return ($P829)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Key"],_)
    .param pmc param_921
    .param pmc param_922
.annotate 'line', 674
    new $P920, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P920, control_919
    push_eh $P920
    .lex "self", self
    .lex "$key", param_921
    .lex "%context", param_922
.annotate 'line', 677
    new $P923, "Undef"
    .lex "$key_pmc", $P923
.annotate 'line', 683
    new $P924, "Undef"
    .lex "$constants", $P924
.annotate 'line', 684
    new $P925, "Undef"
    .lex "$idx", $P925
.annotate 'line', 676
    find_lex $P927, "%context"
    unless_null $P927, vivify_210
    $P927 = root_new ['parrot';'Hash']
  vivify_210:
    set $P928, $P927["DEBUG"]
    unless_null $P928, vivify_211
    new $P928, "Undef"
  vivify_211:
    unless $P928, if_926_end
    find_lex $P929, "self"
    $P929."debug"("Want key")
  if_926_end:
.annotate 'line', 677
    find_lex $P930, "$key"
    find_lex $P931, "%context"
    $P932 = $P930."to_pmc"($P931)
    set $P933, $P932[0]
    unless_null $P933, vivify_212
    new $P933, "Undef"
  vivify_212:
    store_lex "$key_pmc", $P933
.annotate 'line', 678
    find_lex $P935, "%context"
    unless_null $P935, vivify_213
    $P935 = root_new ['parrot';'Hash']
  vivify_213:
    set $P936, $P935["DEBUG"]
    unless_null $P936, vivify_214
    new $P936, "Undef"
  vivify_214:
    unless $P936, if_934_end
    find_lex $P937, "self"
    $P937."debug"("Got key")
  if_934_end:
.annotate 'line', 683
    find_lex $P938, "%context"
    unless_null $P938, vivify_215
    $P938 = root_new ['parrot';'Hash']
  vivify_215:
    set $P939, $P938["constants"]
    unless_null $P939, vivify_216
    new $P939, "Undef"
  vivify_216:
    store_lex "$constants", $P939
    find_lex $P940, "$idx"
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
    
    find_lex $P941, "$idx"
.annotate 'line', 674
    .return ($P941)
  control_919:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P942, exception, "payload"
    .return ($P942)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("39_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Constant"],_)
    .param pmc param_946
    .param pmc param_947
.annotate 'line', 701
    new $P945, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P945, control_944
    push_eh $P945
    .lex "self", self
    .lex "$op", param_946
    .lex "%context", param_947
.annotate 'line', 702
    new $P948, "Undef"
    .lex "$idx", $P948
.annotate 'line', 703
    new $P949, "Undef"
    .lex "$type", $P949
.annotate 'line', 701
    find_lex $P950, "$idx"
.annotate 'line', 703
    find_lex $P951, "$op"
    $P952 = $P951."type"()
    store_lex "$type", $P952
.annotate 'line', 704
    find_lex $P956, "$type"
    set $S957, $P956
    iseq $I958, $S957, "ic"
    unless $I958, unless_955
    new $P954, 'Integer'
    set $P954, $I958
    goto unless_955_end
  unless_955:
    find_lex $P959, "$type"
    set $S960, $P959
    iseq $I961, $S960, "kic"
    new $P954, 'Integer'
    set $P954, $I961
  unless_955_end:
    if $P954, if_953
.annotate 'line', 707
    find_lex $P965, "$type"
    set $S966, $P965
    iseq $I967, $S966, "nc"
    if $I967, if_964
.annotate 'line', 711
    find_lex $P973, "self"
    $P973."panic"("NYI")
.annotate 'line', 710
    goto if_964_end
  if_964:
.annotate 'line', 708
    find_lex $P968, "%context"
    unless_null $P968, vivify_217
    $P968 = root_new ['parrot';'Hash']
  vivify_217:
    set $P969, $P968["constants"]
    unless_null $P969, vivify_218
    new $P969, "Undef"
  vivify_218:
    find_lex $P970, "$op"
    $P971 = $P970."value"()
    $P972 = $P969."get_or_create_number"($P971)
    store_lex "$idx", $P972
  if_964_end:
.annotate 'line', 707
    goto if_953_end
  if_953:
.annotate 'line', 705
    find_lex $P962, "$op"
    $P963 = $P962."value"()
    store_lex "$idx", $P963
  if_953_end:
.annotate 'line', 714
    find_lex $P975, "%context"
    unless_null $P975, vivify_219
    $P975 = root_new ['parrot';'Hash']
  vivify_219:
    set $P976, $P975["DEBUG"]
    unless_null $P976, vivify_220
    new $P976, "Undef"
  vivify_220:
    unless $P976, if_974_end
    find_lex $P977, "self"
    new $P978, 'String'
    set $P978, "Index "
    find_lex $P979, "$idx"
    concat $P980, $P978, $P979
    $P977."debug"($P980)
  if_974_end:
    find_lex $P981, "$idx"
.annotate 'line', 701
    .return ($P981)
  control_944:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P982, exception, "payload"
    .return ($P982)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"String"],_)
    .param pmc param_986
    .param pmc param_987
.annotate 'line', 718
    .const 'Sub' $P1013 = "41_1308074667.1448" 
    capture_lex $P1013
    new $P985, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P985, control_984
    push_eh $P985
    .lex "self", self
    .lex "$str", param_986
    .lex "%context", param_987
.annotate 'line', 719
    new $P988, "Undef"
    .lex "$idx", $P988
.annotate 'line', 720
    new $P989, "Undef"
    .lex "$type", $P989
.annotate 'line', 718
    find_lex $P990, "$idx"
.annotate 'line', 720
    find_lex $P991, "$str"
    $P992 = $P991."type"()
    store_lex "$type", $P992
.annotate 'line', 721
    find_lex $P994, "$type"
    set $S995, $P994
    isne $I996, $S995, "sc"
    unless $I996, if_993_end
.annotate 'line', 722
    find_lex $P997, "self"
    $P997."panic"("attempt to pass a non-sc value off as a string")
  if_993_end:
.annotate 'line', 724
    find_lex $P1001, "$str"
    $S1002 = $P1001."encoding"()
    iseq $I1003, $S1002, "fixed_8"
    if $I1003, if_1000
    new $P999, 'Integer'
    set $P999, $I1003
    goto if_1000_end
  if_1000:
    find_lex $P1004, "$str"
    $S1005 = $P1004."charset"()
    iseq $I1006, $S1005, "ascii"
    new $P999, 'Integer'
    set $P999, $I1006
  if_1000_end:
    if $P999, if_998
.annotate 'line', 727
    .const 'Sub' $P1013 = "41_1308074667.1448" 
    capture_lex $P1013
    $P1013()
    goto if_998_end
  if_998:
.annotate 'line', 725
    find_lex $P1007, "%context"
    unless_null $P1007, vivify_223
    $P1007 = root_new ['parrot';'Hash']
  vivify_223:
    set $P1008, $P1007["constants"]
    unless_null $P1008, vivify_224
    new $P1008, "Undef"
  vivify_224:
    find_lex $P1009, "$str"
    $P1010 = $P1009."value"()
    $P1011 = $P1008."get_or_create_string"($P1010)
    store_lex "$idx", $P1011
  if_998_end:
.annotate 'line', 724
    find_lex $P1026, "$idx"
.annotate 'line', 718
    .return ($P1026)
  control_984:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1027, exception, "payload"
    .return ($P1027)
.end


.namespace ["POST";"Compiler"]
.sub "_block1012"  :anon :subid("41_1308074667.1448") :outer("40_1308074667.1448")
.annotate 'line', 729
    new $P1014, "Undef"
    .lex "$bb", $P1014
.annotate 'line', 730
    new $P1015, "Undef"
    .lex "$str_val", $P1015
.annotate 'line', 729
    $P1016 = "new"("ByteBuffer")
    store_lex "$bb", $P1016
.annotate 'line', 730
    find_lex $P1017, "$str"
    $P1018 = $P1017."value"()
    store_lex "$str_val", $P1018
.annotate 'line', 731

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 739
    find_lex $P1019, "%context"
    unless_null $P1019, vivify_221
    $P1019 = root_new ['parrot';'Hash']
  vivify_221:
    set $P1020, $P1019["constants"]
    unless_null $P1020, vivify_222
    new $P1020, "Undef"
  vivify_222:
    find_lex $P1021, "$bb"
.annotate 'line', 740
    find_lex $P1022, "$str"
    $P1023 = $P1022."encoding"()
    $P1024 = $P1021."get_string"($P1023)
.annotate 'line', 739
    $P1025 = $P1020."get_or_create_string"($P1024)
    store_lex "$idx", $P1025
.annotate 'line', 727
    .return ($P1025)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("42_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Value"],_)
    .param pmc param_1031
    .param pmc param_1032
.annotate 'line', 747
    new $P1030, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1030, control_1029
    push_eh $P1030
    .lex "self", self
    .lex "$val", param_1031
    .lex "%context", param_1032
.annotate 'line', 749
    new $P1033, "Undef"
    .lex "$orig", $P1033
    find_lex $P1034, "self"
    find_lex $P1035, "$val"
    $P1036 = $P1035."name"()
    find_lex $P1037, "%context"
    $P1038 = $P1034."get_register"($P1036, $P1037)
    store_lex "$orig", $P1038
.annotate 'line', 750
    find_lex $P1039, "self"
    find_lex $P1040, "$orig"
    find_lex $P1041, "%context"
    $P1042 = $P1039."to_op"($P1040, $P1041)
.annotate 'line', 747
    .return ($P1042)
  control_1029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1043, exception, "payload"
    .return ($P1043)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("43_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Register"],_)
    .param pmc param_1047
    .param pmc param_1048
.annotate 'line', 753
    new $P1046, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1046, control_1045
    push_eh $P1046
    .lex "self", self
    .lex "$reg", param_1047
    .lex "%context", param_1048
.annotate 'line', 754
    find_lex $P1049, "$reg"
    $P1050 = $P1049."regno"()
.annotate 'line', 753
    .return ($P1050)
  control_1045:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1051, exception, "payload"
    .return ($P1051)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("44_1308074667.1448") :method :outer("11_1308074667.1448") :multi(_,["POST";"Label"],_)
    .param pmc param_1055
    .param pmc param_1056
.annotate 'line', 757
    new $P1054, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1054, control_1053
    push_eh $P1054
    .lex "self", self
    .lex "$l", param_1055
    .lex "%context", param_1056
.annotate 'line', 759
    new $P1057, "Undef"
    .lex "$bc", $P1057
.annotate 'line', 760
    new $P1058, "Undef"
    .lex "$pos", $P1058
.annotate 'line', 759
    find_lex $P1059, "%context"
    unless_null $P1059, vivify_225
    $P1059 = root_new ['parrot';'Hash']
  vivify_225:
    set $P1060, $P1059["bytecode"]
    unless_null $P1060, vivify_226
    new $P1060, "Undef"
  vivify_226:
    store_lex "$bc", $P1060
.annotate 'line', 760
    find_lex $P1061, "$bc"
    set $N1062, $P1061
    new $P1063, 'Float'
    set $P1063, $N1062
    store_lex "$pos", $P1063
.annotate 'line', 764
    find_lex $P1064, "$l"
    $P1065 = $P1064."name"()
.annotate 'line', 763
    find_lex $P1066, "%context"
    unless_null $P1066, vivify_227
    $P1066 = root_new ['parrot';'Hash']
  vivify_227:
    set $P1067, $P1066["opcode_offset"]
    unless_null $P1067, vivify_228
    new $P1067, "Undef"
  vivify_228:
    find_lex $P1068, "%context"
    unless_null $P1068, vivify_229
    $P1068 = root_new ['parrot';'Hash']
  vivify_229:
    set $P1069, $P1068["opcode_fullname"]
    unless_null $P1069, vivify_230
    new $P1069, "Undef"
  vivify_230:
    $P1070 = "hash"($P1065 :named("name"), $P1067 :named("offset"), $P1069 :named("opname"))
    find_lex $P1071, "$pos"
    find_lex $P1072, "%context"
    unless_null $P1072, vivify_231
    $P1072 = root_new ['parrot';'Hash']
    store_lex "%context", $P1072
  vivify_231:
    set $P1073, $P1072["labels_todo"]
    unless_null $P1073, vivify_232
    $P1073 = root_new ['parrot';'Hash']
    set $P1072["labels_todo"], $P1073
  vivify_232:
    set $P1073[$P1071], $P1070
.annotate 'line', 769
    find_lex $P1075, "%context"
    unless_null $P1075, vivify_233
    $P1075 = root_new ['parrot';'Hash']
  vivify_233:
    set $P1076, $P1075["DEBUG"]
    unless_null $P1076, vivify_234
    new $P1076, "Undef"
  vivify_234:
    unless $P1076, if_1074_end
    find_lex $P1077, "self"
    new $P1078, 'String'
    set $P1078, "Todo label '"
    find_lex $P1079, "$l"
    $P1080 = $P1079."name"()
    set $S1081, $P1080
    concat $P1082, $P1078, $S1081
    concat $P1083, $P1082, "' at "
    find_lex $P1084, "$pos"
    concat $P1085, $P1083, $P1084
    concat $P1086, $P1085, ", "
    find_lex $P1087, "%context"
    unless_null $P1087, vivify_235
    $P1087 = root_new ['parrot';'Hash']
  vivify_235:
    set $P1088, $P1087["opcode_offset"]
    unless_null $P1088, vivify_236
    new $P1088, "Undef"
  vivify_236:
    set $S1089, $P1088
    concat $P1090, $P1086, $S1089
    $P1077."debug"($P1090)
  if_1074_end:
.annotate 'line', 757
    .return (0)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1091, exception, "payload"
    .return ($P1091)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("45_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1095
    .param pmc param_1096
    .param pmc param_1097
.annotate 'line', 780
    .const 'Sub' $P1132 = "46_1308074667.1448" 
    capture_lex $P1132
    new $P1094, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1094, control_1093
    push_eh $P1094
    .lex "self", self
    .lex "$opname", param_1095
    .lex "@args", param_1096
    .lex "%context", param_1097
.annotate 'line', 781
    new $P1098, "Undef"
    .lex "$bc", $P1098
.annotate 'line', 782
    new $P1099, "Undef"
    .lex "$signature", $P1099
.annotate 'line', 783
    new $P1100, "Undef"
    .lex "$sig_idx", $P1100
.annotate 'line', 790
    $P1101 = root_new ['parrot';'ResizablePMCArray']
    .lex "@op", $P1101
.annotate 'line', 781
    find_lex $P1102, "%context"
    unless_null $P1102, vivify_237
    $P1102 = root_new ['parrot';'Hash']
  vivify_237:
    set $P1103, $P1102["bytecode"]
    unless_null $P1103, vivify_238
    new $P1103, "Undef"
  vivify_238:
    store_lex "$bc", $P1103
.annotate 'line', 782
    find_lex $P1104, "self"
    find_lex $P1105, "@args"
    find_lex $P1106, "%context"
    $P1107 = $P1104."build_args_signature"($P1105, $P1106)
    store_lex "$signature", $P1107
.annotate 'line', 783
    find_lex $P1108, "%context"
    unless_null $P1108, vivify_239
    $P1108 = root_new ['parrot';'Hash']
  vivify_239:
    set $P1109, $P1108["constants"]
    unless_null $P1109, vivify_240
    new $P1109, "Undef"
  vivify_240:
    find_lex $P1110, "$signature"
    $P1111 = $P1109."get_or_create_pmc"($P1110)
    store_lex "$sig_idx", $P1111
.annotate 'line', 785
    find_lex $P1113, "%context"
    unless_null $P1113, vivify_241
    $P1113 = root_new ['parrot';'Hash']
  vivify_241:
    set $P1114, $P1113["DEBUG"]
    unless_null $P1114, vivify_242
    new $P1114, "Undef"
  vivify_242:
    unless $P1114, if_1112_end
    find_lex $P1115, "self"
    new $P1116, 'String'
    set $P1116, "Sig: "
    find_lex $P1117, "$sig_idx"
    concat $P1118, $P1116, $P1117
    $P1115."debug"($P1118)
  if_1112_end:
.annotate 'line', 787
    find_lex $P1120, "%context"
    unless_null $P1120, vivify_243
    $P1120 = root_new ['parrot';'Hash']
  vivify_243:
    set $P1121, $P1120["DEBUG"]
    unless_null $P1121, vivify_244
    new $P1121, "Undef"
  vivify_244:
    unless $P1121, if_1119_end
    find_lex $P1122, "self"
    find_lex $P1123, "$opname"
    $P1122."debug"($P1123)
  if_1119_end:
.annotate 'line', 790
    find_lex $P1124, "$opname"
    find_lex $P1125, "$sig_idx"
    $P1126 = "list"($P1124, $P1125)
    store_lex "@op", $P1126
.annotate 'line', 792
    find_lex $P1128, "@args"
    defined $I1129, $P1128
    unless $I1129, for_undef_245
    iter $P1127, $P1128
    new $P1162, 'ExceptionHandler'
    set_label $P1162, loop1161_handler
    $P1162."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1162
  loop1161_test:
    unless $P1127, loop1161_done
    shift $P1130, $P1127
  loop1161_redo:
    .const 'Sub' $P1132 = "46_1308074667.1448" 
    capture_lex $P1132
    $P1132($P1130)
  loop1161_next:
    goto loop1161_test
  loop1161_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1163, exception, 'type'
    eq $P1163, .CONTROL_LOOP_NEXT, loop1161_next
    eq $P1163, .CONTROL_LOOP_REDO, loop1161_redo
  loop1161_done:
    pop_eh 
  for_undef_245:
.annotate 'line', 803
    find_lex $P1164, "$bc"
    find_lex $P1165, "@op"
    $P1166 = $P1164."push"($P1165)
.annotate 'line', 780
    .return ($P1166)
  control_1093:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1167, exception, "payload"
    .return ($P1167)
.end


.namespace ["POST";"Compiler"]
.sub "_block1131"  :anon :subid("46_1308074667.1448") :outer("45_1308074667.1448")
    .param pmc param_1133
.annotate 'line', 792
    .const 'Sub' $P1139 = "47_1308074667.1448" 
    capture_lex $P1139
    .lex "$arg", param_1133
.annotate 'line', 794
    find_lex $P1135, "$arg"
    $P1136 = $P1135."modifier"()
    isa $I1137, $P1136, "Hash"
    unless $I1137, if_1134_end
    .const 'Sub' $P1139 = "47_1308074667.1448" 
    capture_lex $P1139
    $P1139()
  if_1134_end:
.annotate 'line', 800
    find_lex $P1155, "@op"
    find_lex $P1156, "self"
    find_lex $P1157, "$arg"
    find_lex $P1158, "%context"
    $P1159 = $P1156."to_op"($P1157, $P1158)
    $P1160 = $P1155."push"($P1159)
.annotate 'line', 792
    .return ($P1160)
.end


.namespace ["POST";"Compiler"]
.sub "_block1138"  :anon :subid("47_1308074667.1448") :outer("46_1308074667.1448")
.annotate 'line', 795
    new $P1140, "Undef"
    .lex "$name", $P1140
    find_lex $P1142, "$arg"
    $P1143 = $P1142."modifier"()
    set $P1144, $P1143["named"]
    unless_null $P1144, vivify_246
    new $P1144, "Undef"
  vivify_246:
    set $P1141, $P1144
    defined $I1146, $P1141
    if $I1146, default_1145
    find_lex $P1147, "$arg"
    $P1148 = $P1147."name"()
    set $P1141, $P1148
  default_1145:
    store_lex "$name", $P1141
.annotate 'line', 796
    find_lex $P1149, "@op"
.annotate 'line', 797
    find_lex $P1150, "%context"
    unless_null $P1150, vivify_247
    $P1150 = root_new ['parrot';'Hash']
  vivify_247:
    set $P1151, $P1150["constants"]
    unless_null $P1151, vivify_248
    new $P1151, "Undef"
  vivify_248:
    find_lex $P1152, "$name"
    $P1153 = $P1151."get_or_create_string"($P1152)
    $P1154 = $P1149."push"($P1153)
.annotate 'line', 794
    .return ($P1154)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("48_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1171
    .param pmc param_1172
.annotate 'line', 806
    .const 'Sub' $P1223 = "51_1308074667.1448" 
    capture_lex $P1223
    .const 'Sub' $P1183 = "49_1308074667.1448" 
    capture_lex $P1183
    new $P1170, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1170, control_1169
    push_eh $P1170
    .lex "self", self
    .lex "@args", param_1171
    .lex "%context", param_1172
.annotate 'line', 807
    $P1173 = root_new ['parrot';'ResizablePMCArray']
    .lex "@sig", $P1173
.annotate 'line', 820
    new $P1174, "Undef"
    .lex "$elements", $P1174
.annotate 'line', 821
    new $P1175, "Undef"
    .lex "$signature", $P1175
.annotate 'line', 829
    new $P1176, "Undef"
    .lex "$idx", $P1176
.annotate 'line', 806
    find_lex $P1177, "@sig"
.annotate 'line', 808
    find_lex $P1179, "@args"
    defined $I1180, $P1179
    unless $I1180, for_undef_249
    iter $P1178, $P1179
    new $P1211, 'ExceptionHandler'
    set_label $P1211, loop1210_handler
    $P1211."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1211
  loop1210_test:
    unless $P1178, loop1210_done
    shift $P1181, $P1178
  loop1210_redo:
    .const 'Sub' $P1183 = "49_1308074667.1448" 
    capture_lex $P1183
    $P1183($P1181)
  loop1210_next:
    goto loop1210_test
  loop1210_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1212, exception, 'type'
    eq $P1212, .CONTROL_LOOP_NEXT, loop1210_next
    eq $P1212, .CONTROL_LOOP_REDO, loop1210_redo
  loop1210_done:
    pop_eh 
  for_undef_249:
.annotate 'line', 820
    find_lex $P1213, "@sig"
    set $N1214, $P1213
    new $P1215, 'Float'
    set $P1215, $N1214
    store_lex "$elements", $P1215
.annotate 'line', 821

        $P1216 = find_lex '$elements'
        $I99 = $P1216
        $P1216 = find_lex '$signature'
        $P1216 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1216
.annotate 'line', 829
    new $P1217, "Integer"
    assign $P1217, 0
    store_lex "$idx", $P1217
.annotate 'line', 830
    find_lex $P1219, "@sig"
    defined $I1220, $P1219
    unless $I1220, for_undef_251
    iter $P1218, $P1219
    new $P1232, 'ExceptionHandler'
    set_label $P1232, loop1231_handler
    $P1232."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1232
  loop1231_test:
    unless $P1218, loop1231_done
    shift $P1221, $P1218
  loop1231_redo:
    .const 'Sub' $P1223 = "51_1308074667.1448" 
    capture_lex $P1223
    $P1223($P1221)
  loop1231_next:
    goto loop1231_test
  loop1231_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1233, exception, 'type'
    eq $P1233, .CONTROL_LOOP_NEXT, loop1231_next
    eq $P1233, .CONTROL_LOOP_REDO, loop1231_redo
  loop1231_done:
    pop_eh 
  for_undef_251:
    find_lex $P1234, "$signature"
.annotate 'line', 806
    .return ($P1234)
  control_1169:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1235, exception, "payload"
    .return ($P1235)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_block1182"  :anon :subid("49_1308074667.1448") :outer("48_1308074667.1448")
    .param pmc param_1184
.annotate 'line', 808
    .const 'Sub' $P1202 = "50_1308074667.1448" 
    capture_lex $P1202
    .lex "$arg", param_1184
.annotate 'line', 810
    new $P1185, "Undef"
    .lex "$s", $P1185
    find_lex $P1186, "self"
    find_lex $P1187, "$arg"
    find_lex $P1188, "%context"
    $P1189 = $P1186."build_single_arg"($P1187, $P1188)
    store_lex "$s", $P1189
.annotate 'line', 811
    find_lex $P1192, "$s"
    isa $I1193, $P1192, "Integer"
    if $I1193, if_1191
.annotate 'line', 815
    find_lex $P1198, "$s"
    defined $I1199, $P1198
    unless $I1199, for_undef_250
    iter $P1197, $P1198
    new $P1208, 'ExceptionHandler'
    set_label $P1208, loop1207_handler
    $P1208."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1208
  loop1207_test:
    unless $P1197, loop1207_done
    shift $P1200, $P1197
  loop1207_redo:
    .const 'Sub' $P1202 = "50_1308074667.1448" 
    capture_lex $P1202
    $P1202($P1200)
  loop1207_next:
    goto loop1207_test
  loop1207_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1209, exception, 'type'
    eq $P1209, .CONTROL_LOOP_NEXT, loop1207_next
    eq $P1209, .CONTROL_LOOP_REDO, loop1207_redo
  loop1207_done:
    pop_eh 
  for_undef_250:
.annotate 'line', 814
    set $P1190, $P1197
.annotate 'line', 811
    goto if_1191_end
  if_1191:
.annotate 'line', 812
    find_lex $P1194, "@sig"
    find_lex $P1195, "$s"
    $P1196 = $P1194."push"($P1195)
.annotate 'line', 811
    set $P1190, $P1196
  if_1191_end:
.annotate 'line', 808
    .return ($P1190)
.end


.namespace ["POST";"Compiler"]
.sub "_block1201"  :anon :subid("50_1308074667.1448") :outer("49_1308074667.1448")
    .param pmc param_1203
.annotate 'line', 815
    .lex "$_", param_1203
    find_lex $P1204, "@sig"
    find_lex $P1205, "$_"
    $P1206 = $P1204."push"($P1205)
    .return ($P1206)
.end


.namespace ["POST";"Compiler"]
.sub "_block1222"  :anon :subid("51_1308074667.1448") :outer("48_1308074667.1448")
    .param pmc param_1224
.annotate 'line', 830
    .lex "$val", param_1224
.annotate 'line', 831
    find_lex $P1225, "$val"
    find_lex $P1226, "$idx"
    set $I1227, $P1226
    find_lex $P1228, "$signature"
    unless_null $P1228, vivify_252
    $P1228 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1228
  vivify_252:
    set $P1228[$I1227], $P1225
    find_lex $P1229, "$idx"
    clone $P1230, $P1229
    inc $P1229
.annotate 'line', 830
    .return ($P1230)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("52_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1239
    .param pmc param_1240
.annotate 'line', 838
    new $P1238, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1238, control_1237
    push_eh $P1238
    .lex "self", self
    .lex "$arg", param_1239
    .lex "%context", param_1240
.annotate 'line', 841
    new $P1241, "Undef"
    .lex "$type", $P1241
.annotate 'line', 843
    new $P1242, "Undef"
    .lex "$res", $P1242
.annotate 'line', 857
    new $P1243, "Undef"
    .lex "$mod", $P1243
.annotate 'line', 841
    find_lex $P1245, "$arg"
    $P1246 = $P1245."type"()
    set $P1244, $P1246
    defined $I1248, $P1244
    if $I1248, default_1247
    find_lex $P1249, "self"
    find_lex $P1250, "$arg"
    $P1251 = $P1250."name"()
    find_lex $P1252, "%context"
    $P1253 = $P1249."get_register"($P1251, $P1252)
    $P1254 = $P1253."type"()
    set $P1244, $P1254
  default_1247:
    store_lex "$type", $P1244
    find_lex $P1255, "$res"
.annotate 'line', 846
    find_lex $P1257, "$type"
    set $S1258, $P1257
    iseq $I1259, $S1258, "i"
    if $I1259, if_1256
.annotate 'line', 847
    find_lex $P1262, "$type"
    set $S1263, $P1262
    iseq $I1264, $S1263, "s"
    if $I1264, if_1261
.annotate 'line', 848
    find_lex $P1267, "$type"
    set $S1268, $P1267
    iseq $I1269, $S1268, "p"
    if $I1269, if_1266
.annotate 'line', 849
    find_lex $P1272, "$type"
    set $S1273, $P1272
    iseq $I1274, $S1273, "n"
    if $I1274, if_1271
.annotate 'line', 851
    find_lex $P1277, "$type"
    set $S1278, $P1277
    iseq $I1279, $S1278, "ic"
    if $I1279, if_1276
.annotate 'line', 852
    find_lex $P1283, "$type"
    set $S1284, $P1283
    iseq $I1285, $S1284, "sc"
    if $I1285, if_1282
.annotate 'line', 853
    find_lex $P1289, "$type"
    set $S1290, $P1289
    iseq $I1291, $S1290, "pc"
    if $I1291, if_1288
.annotate 'line', 854
    find_lex $P1295, "$type"
    set $S1296, $P1295
    iseq $I1297, $S1296, "nc"
    if $I1297, if_1294
.annotate 'line', 855
    find_lex $P1300, "self"
    new $P1301, 'String'
    set $P1301, "Unknown arg type '"
    find_lex $P1302, "$type"
    concat $P1303, $P1301, $P1302
    concat $P1304, $P1303, "'"
    $P1300."panic"($P1304)
    goto if_1294_end
  if_1294:
.annotate 'line', 854
    new $P1298, "Integer"
    assign $P1298, 3
    add $P1299, $P1298, 16
    store_lex "$res", $P1299
  if_1294_end:
    goto if_1288_end
  if_1288:
.annotate 'line', 853
    new $P1292, "Integer"
    assign $P1292, 2
    add $P1293, $P1292, 16
    store_lex "$res", $P1293
  if_1288_end:
    goto if_1282_end
  if_1282:
.annotate 'line', 852
    new $P1286, "Integer"
    assign $P1286, 1
    add $P1287, $P1286, 16
    store_lex "$res", $P1287
  if_1282_end:
    goto if_1276_end
  if_1276:
.annotate 'line', 851
    new $P1280, "Integer"
    assign $P1280, 0
    add $P1281, $P1280, 16
    store_lex "$res", $P1281
  if_1276_end:
    goto if_1271_end
  if_1271:
.annotate 'line', 849
    new $P1275, "Integer"
    assign $P1275, 3
    store_lex "$res", $P1275
  if_1271_end:
    goto if_1266_end
  if_1266:
.annotate 'line', 848
    new $P1270, "Integer"
    assign $P1270, 2
    store_lex "$res", $P1270
  if_1266_end:
    goto if_1261_end
  if_1261:
.annotate 'line', 847
    new $P1265, "Integer"
    assign $P1265, 1
    store_lex "$res", $P1265
  if_1261_end:
    goto if_1256_end
  if_1256:
.annotate 'line', 846
    new $P1260, "Integer"
    assign $P1260, 0
    store_lex "$res", $P1260
  if_1256_end:
.annotate 'line', 857
    find_lex $P1305, "$arg"
    $P1306 = $P1305."modifier"()
    store_lex "$mod", $P1306
.annotate 'line', 858
    find_lex $P1308, "$mod"
    unless $P1308, if_1307_end
.annotate 'line', 859
    find_lex $P1310, "$mod"
    isa $I1311, $P1310, "Hash"
    if $I1311, if_1309
.annotate 'line', 864
    find_lex $P1319, "$mod"
    set $S1320, $P1319
    iseq $I1321, $S1320, "slurpy"
    if $I1321, if_1318
.annotate 'line', 865
    find_lex $P1325, "$mod"
    set $S1326, $P1325
    iseq $I1327, $S1326, "flat"
    if $I1327, if_1324
.annotate 'line', 866
    find_lex $P1331, "$mod"
    set $S1332, $P1331
    iseq $I1333, $S1332, "optional"
    if $I1333, if_1330
.annotate 'line', 867
    find_lex $P1337, "$mod"
    set $S1338, $P1337
    iseq $I1339, $S1338, "opt_flag"
    if $I1339, if_1336
.annotate 'line', 868
    find_lex $P1343, "$mod"
    set $S1344, $P1343
    iseq $I1345, $S1344, "slurpy named"
    if $I1345, if_1342
.annotate 'line', 869
    find_lex $P1349, "self"
    new $P1350, 'String'
    set $P1350, "Unsupported modifier "
    find_lex $P1351, "$mod"
    concat $P1352, $P1350, $P1351
    $P1349."panic"($P1352)
    goto if_1342_end
  if_1342:
.annotate 'line', 868
    find_lex $P1346, "$res"
    add $P1347, $P1346, 32
    add $P1348, $P1347, 512
    store_lex "$res", $P1348
  if_1342_end:
    goto if_1336_end
  if_1336:
.annotate 'line', 867
    find_lex $P1340, "$res"
    add $P1341, $P1340, 256
    store_lex "$res", $P1341
  if_1336_end:
    goto if_1330_end
  if_1330:
.annotate 'line', 866
    find_lex $P1334, "$res"
    add $P1335, $P1334, 128
    store_lex "$res", $P1335
  if_1330_end:
    goto if_1324_end
  if_1324:
.annotate 'line', 865
    find_lex $P1328, "$res"
    add $P1329, $P1328, 32
    store_lex "$res", $P1329
  if_1324_end:
    goto if_1318_end
  if_1318:
.annotate 'line', 864
    find_lex $P1322, "$res"
    add $P1323, $P1322, 32
    store_lex "$res", $P1323
  if_1318_end:
    goto if_1309_end
  if_1309:
.annotate 'line', 862
    new $P1312, "Integer"
    assign $P1312, 1
    add $P1313, $P1312, 16
    add $P1314, $P1313, 512
    find_lex $P1315, "$res"
    add $P1316, $P1315, 512
    $P1317 = "list"($P1314, $P1316)
    store_lex "$res", $P1317
  if_1309_end:
  if_1307_end:
.annotate 'line', 858
    find_lex $P1353, "$res"
.annotate 'line', 838
    .return ($P1353)
  control_1237:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1354, exception, "payload"
    .return ($P1354)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("53_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1358
.annotate 'line', 880
    .const 'Sub' $P1365 = "54_1308074667.1448" 
    capture_lex $P1365
    new $P1357, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1357, control_1356
    push_eh $P1357
    .lex "self", self
    .lex "$post", param_1358
.annotate 'line', 881
    find_lex $P1360, "$post"
    $P1361 = $P1360."list"()
    defined $I1362, $P1361
    unless $I1362, for_undef_253
    iter $P1359, $P1361
    new $P1378, 'ExceptionHandler'
    set_label $P1378, loop1377_handler
    $P1378."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1378
  loop1377_test:
    unless $P1359, loop1377_done
    shift $P1363, $P1359
  loop1377_redo:
    .const 'Sub' $P1365 = "54_1308074667.1448" 
    capture_lex $P1365
    $P1365($P1363)
  loop1377_next:
    goto loop1377_test
  loop1377_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1379, exception, 'type'
    eq $P1379, .CONTROL_LOOP_NEXT, loop1377_next
    eq $P1379, .CONTROL_LOOP_REDO, loop1377_redo
  loop1377_done:
    pop_eh 
  for_undef_253:
.annotate 'line', 880
    .return ($P1359)
  control_1356:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1380, exception, "payload"
    .return ($P1380)
.end


.namespace ["POST";"Compiler"]
.sub "_block1364"  :anon :subid("54_1308074667.1448") :outer("53_1308074667.1448")
    .param pmc param_1366
.annotate 'line', 881
    .lex "$sub", param_1366
.annotate 'line', 883
    find_lex $P1369, "$sub"
    get_hll_global $P1370, ["POST"], "Sub"
    $P1371 = $P1369."isa"($P1370)
    if $P1371, if_1368
    set $P1367, $P1371
    goto if_1368_end
  if_1368:
    find_lex $P1372, "$post"
    find_lex $P1373, "$sub"
    $P1374 = $P1373."full_name"()
    find_lex $P1375, "$sub"
    $P1376 = $P1372."sub"($P1374, $P1375)
    set $P1367, $P1376
  if_1368_end:
.annotate 'line', 881
    .return ($P1367)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("55_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1384
    .param pmc param_1385
.annotate 'line', 888
    new $P1383, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1383, control_1382
    push_eh $P1383
    .lex "self", self
    .lex "$sub", param_1384
    .lex "%context", param_1385
.annotate 'line', 896
    new $P1386, "Undef"
    .lex "$res", $P1386
    new $P1387, "Integer"
    assign $P1387, 0
    store_lex "$res", $P1387
.annotate 'line', 897
    find_lex $P1388, "$res"
    new $P1389, "Integer"
    assign $P1389, 1
    find_lex $P1390, "$sub"
    $N1391 = $P1390."outer"()
    mul $P1392, $P1389, $N1391
    add $P1393, $P1388, $P1392
    store_lex "$res", $P1393
.annotate 'line', 898
    find_lex $P1394, "$res"
    new $P1395, "Integer"
    assign $P1395, 8
    find_lex $P1396, "$sub"
    $N1397 = $P1396."anon"()
    mul $P1398, $P1395, $N1397
    add $P1399, $P1394, $P1398
    store_lex "$res", $P1399
.annotate 'line', 899
    find_lex $P1400, "$res"
    new $P1401, "Integer"
    assign $P1401, 16
    find_lex $P1402, "$sub"
    $N1403 = $P1402."main"()
    mul $P1404, $P1401, $N1403
    add $P1405, $P1400, $P1404
    store_lex "$res", $P1405
.annotate 'line', 900
    find_lex $P1406, "$res"
    new $P1407, "Integer"
    assign $P1407, 32
    find_lex $P1408, "$sub"
    $N1409 = $P1408."load"()
    mul $P1410, $P1407, $N1409
    add $P1411, $P1406, $P1410
    store_lex "$res", $P1411
.annotate 'line', 901
    find_lex $P1412, "$res"
    new $P1413, "Integer"
    assign $P1413, 64
    find_lex $P1414, "$sub"
    $N1415 = $P1414."immediate"()
    mul $P1416, $P1413, $N1415
    add $P1417, $P1412, $P1416
    store_lex "$res", $P1417
.annotate 'line', 902
    find_lex $P1418, "$res"
    new $P1419, "Integer"
    assign $P1419, 128
    find_lex $P1420, "$sub"
    $N1421 = $P1420."postcomp"()
    mul $P1422, $P1419, $N1421
    add $P1423, $P1418, $P1422
    store_lex "$res", $P1423
.annotate 'line', 904
    find_lex $P1425, "%context"
    unless_null $P1425, vivify_254
    $P1425 = root_new ['parrot';'Hash']
  vivify_254:
    set $P1426, $P1425["DEBUG"]
    unless_null $P1426, vivify_255
    new $P1426, "Undef"
  vivify_255:
    unless $P1426, if_1424_end
    find_lex $P1427, "self"
    new $P1428, 'String'
    set $P1428, "pf_flags "
    find_lex $P1429, "$res"
    concat $P1430, $P1428, $P1429
    $P1427."debug"($P1430)
  if_1424_end:
    find_lex $P1431, "$res"
.annotate 'line', 888
    .return ($P1431)
  control_1382:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1432, exception, "payload"
    .return ($P1432)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("56_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1436
    .param pmc param_1437
.annotate 'line', 909
    new $P1435, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1435, control_1434
    push_eh $P1435
    .lex "self", self
    .lex "$sub", param_1436
    .lex "%context", param_1437
.annotate 'line', 914
    new $P1438, "Undef"
    .lex "$res", $P1438
    new $P1439, "Integer"
    assign $P1439, 0
    store_lex "$res", $P1439
.annotate 'line', 915
    find_lex $P1441, "$sub"
    $P1442 = $P1441."vtable"()
    unless $P1442, if_1440_end
    find_lex $P1443, "$res"
    add $P1444, $P1443, 2
    store_lex "$res", $P1444
  if_1440_end:
.annotate 'line', 916
    find_lex $P1446, "$sub"
    $P1447 = $P1446."is_method"()
    unless $P1447, if_1445_end
    find_lex $P1448, "$res"
    add $P1449, $P1448, 4
    store_lex "$res", $P1449
  if_1445_end:
.annotate 'line', 917
    find_lex $P1451, "$sub"
    $P1452 = $P1451."is_init"()
    unless $P1452, if_1450_end
    find_lex $P1453, "$res"
    add $P1454, $P1453, 1024
    store_lex "$res", $P1454
  if_1450_end:
.annotate 'line', 918
    find_lex $P1456, "$sub"
    $P1457 = $P1456."nsentry"()
    unless $P1457, if_1455_end
    find_lex $P1458, "$res"
    add $P1459, $P1458, 2048
    store_lex "$res", $P1459
  if_1455_end:
.annotate 'line', 920
    find_lex $P1461, "%context"
    unless_null $P1461, vivify_256
    $P1461 = root_new ['parrot';'Hash']
  vivify_256:
    set $P1462, $P1461["DEBUG"]
    unless_null $P1462, vivify_257
    new $P1462, "Undef"
  vivify_257:
    unless $P1462, if_1460_end
    find_lex $P1463, "self"
    new $P1464, 'String'
    set $P1464, "comp_flags "
    find_lex $P1465, "$res"
    concat $P1466, $P1464, $P1465
    $P1463."debug"($P1466)
  if_1460_end:
    find_lex $P1467, "$res"
.annotate 'line', 909
    .return ($P1467)
  control_1434:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1468, exception, "payload"
    .return ($P1468)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("57_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1472
    .param pmc param_1473
    .param pmc param_1474
    .param pmc param_1475
.annotate 'line', 925
    .const 'Sub' $P1485 = "58_1308074667.1448" 
    capture_lex $P1485
    new $P1471, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1471, control_1470
    push_eh $P1471
    .lex "self", self
    .lex "$sub", param_1472
    .lex "$labels_todo", param_1473
    .lex "$bc", param_1474
    .lex "%context", param_1475
.annotate 'line', 926
    find_lex $P1477, "%context"
    unless_null $P1477, vivify_258
    $P1477 = root_new ['parrot';'Hash']
  vivify_258:
    set $P1478, $P1477["DEBUG"]
    unless_null $P1478, vivify_259
    new $P1478, "Undef"
  vivify_259:
    unless $P1478, if_1476_end
    find_lex $P1479, "self"
    $P1479."debug"("Fixup labels")
  if_1476_end:
.annotate 'line', 927
    find_lex $P1481, "$labels_todo"
    defined $I1482, $P1481
    unless $I1482, for_undef_260
    iter $P1480, $P1481
    new $P1544, 'ExceptionHandler'
    set_label $P1544, loop1543_handler
    $P1544."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1544
  loop1543_test:
    unless $P1480, loop1543_done
    shift $P1483, $P1480
  loop1543_redo:
    .const 'Sub' $P1485 = "58_1308074667.1448" 
    capture_lex $P1485
    $P1485($P1483)
  loop1543_next:
    goto loop1543_test
  loop1543_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1545, exception, 'type'
    eq $P1545, .CONTROL_LOOP_NEXT, loop1543_next
    eq $P1545, .CONTROL_LOOP_REDO, loop1543_redo
  loop1543_done:
    pop_eh 
  for_undef_260:
.annotate 'line', 925
    .return ($P1480)
  control_1470:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1546, exception, "payload"
    .return ($P1546)
.end


.namespace ["POST";"Compiler"]
.sub "_block1484"  :anon :subid("58_1308074667.1448") :outer("57_1308074667.1448")
    .param pmc param_1486
.annotate 'line', 927
    .lex "$kv", param_1486
.annotate 'line', 928
    new $P1487, "Undef"
    .lex "$offset", $P1487
.annotate 'line', 929
    $P1488 = root_new ['parrot';'Hash']
    .lex "%todo", $P1488
.annotate 'line', 932
    new $P1489, "Undef"
    .lex "$op", $P1489
.annotate 'line', 935
    new $P1490, "Undef"
    .lex "$delta", $P1490
.annotate 'line', 928
    find_lex $P1491, "$kv"
    $P1492 = $P1491."key"()
    store_lex "$offset", $P1492
.annotate 'line', 929
    find_lex $P1493, "$kv"
    $P1494 = $P1493."value"()
    store_lex "%todo", $P1494
.annotate 'line', 930
    find_lex $P1496, "%context"
    unless_null $P1496, vivify_261
    $P1496 = root_new ['parrot';'Hash']
  vivify_261:
    set $P1497, $P1496["DEBUG"]
    unless_null $P1497, vivify_262
    new $P1497, "Undef"
  vivify_262:
    unless $P1497, if_1495_end
    find_lex $P1498, "self"
    new $P1499, 'String'
    set $P1499, "Fixing '"
    find_lex $P1500, "%todo"
    unless_null $P1500, vivify_263
    $P1500 = root_new ['parrot';'Hash']
  vivify_263:
    set $P1501, $P1500["name"]
    unless_null $P1501, vivify_264
    new $P1501, "Undef"
  vivify_264:
    set $S1502, $P1501
    concat $P1503, $P1499, $S1502
    concat $P1504, $P1503, "' from op "
    find_lex $P1505, "%todo"
    unless_null $P1505, vivify_265
    $P1505 = root_new ['parrot';'Hash']
  vivify_265:
    set $P1506, $P1505["opname"]
    unless_null $P1506, vivify_266
    new $P1506, "Undef"
  vivify_266:
    set $S1507, $P1506
    concat $P1508, $P1504, $S1507
    concat $P1509, $P1508, " at "
    find_lex $P1510, "$offset"
    set $S1511, $P1510
    concat $P1512, $P1509, $S1511
    $P1498."debug"($P1512)
  if_1495_end:
.annotate 'line', 932
    find_lex $P1513, "%todo"
    unless_null $P1513, vivify_267
    $P1513 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1514, $P1513["opname"]
    unless_null $P1514, vivify_268
    new $P1514, "Undef"
  vivify_268:
    set $S1515, $P1514
    find_lex $P1516, "$bc"
    $P1517 = $P1516."opmap"()
    set $P1518, $P1517[$S1515]
    unless_null $P1518, vivify_269
    new $P1518, "Undef"
  vivify_269:
    store_lex "$op", $P1518
.annotate 'line', 933
    find_lex $P1520, "%context"
    unless_null $P1520, vivify_270
    $P1520 = root_new ['parrot';'Hash']
  vivify_270:
    set $P1521, $P1520["DEBUG"]
    unless_null $P1521, vivify_271
    new $P1521, "Undef"
  vivify_271:
    unless $P1521, if_1519_end
    find_lex $P1522, "self"
    new $P1523, 'String'
    set $P1523, "Op length is "
    find_lex $P1524, "$op"
    $P1525 = $P1524."length"()
    set $S1526, $P1525
    concat $P1527, $P1523, $S1526
    $P1522."debug"($P1527)
  if_1519_end:
.annotate 'line', 935
    find_lex $P1528, "$sub"
    find_lex $P1529, "%todo"
    unless_null $P1529, vivify_272
    $P1529 = root_new ['parrot';'Hash']
  vivify_272:
    set $P1530, $P1529["name"]
    unless_null $P1530, vivify_273
    new $P1530, "Undef"
  vivify_273:
    $P1531 = $P1528."label"($P1530)
    $P1532 = $P1531."position"()
    find_lex $P1533, "%todo"
    unless_null $P1533, vivify_274
    $P1533 = root_new ['parrot';'Hash']
  vivify_274:
    set $P1534, $P1533["offset"]
    unless_null $P1534, vivify_275
    new $P1534, "Undef"
  vivify_275:
    sub $P1535, $P1532, $P1534
    store_lex "$delta", $P1535
.annotate 'line', 937
    find_lex $P1536, "$delta"
    find_lex $P1537, "$offset"
    find_lex $P1538, "$op"
    $N1539 = $P1538."length"()
    add $P1540, $P1537, $N1539
    set $I1541, $P1540
    find_lex $P1542, "$bc"
    unless_null $P1542, vivify_276
    $P1542 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1542
  vivify_276:
    set $P1542[$I1541], $P1536
.annotate 'line', 927
    .return ($P1536)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("59_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1550
    .param pmc param_1551
.annotate 'line', 942
    new $P1549, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1549, control_1548
    push_eh $P1549
    .lex "self", self
    .lex "$name", param_1550
    .lex "%context", param_1551
.annotate 'line', 943
    new $P1552, "Undef"
    .lex "$reg", $P1552
    find_lex $P1553, "%context"
    unless_null $P1553, vivify_277
    $P1553 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1554, $P1553["sub"]
    unless_null $P1554, vivify_278
    new $P1554, "Undef"
  vivify_278:
    find_lex $P1555, "$name"
    $P1556 = $P1554."symbol"($P1555)
    store_lex "$reg", $P1556
.annotate 'line', 944
    find_lex $P1558, "$reg"
    isfalse $I1559, $P1558
    unless $I1559, if_1557_end
.annotate 'line', 945
    find_lex $P1560, "self"
    new $P1561, 'String'
    set $P1561, "Register '"
    find_lex $P1562, "$name"
    set $S1563, $P1562
    concat $P1564, $P1561, $S1563
    concat $P1565, $P1564, "' not predeclared in '"
    find_lex $P1566, "%context"
    unless_null $P1566, vivify_279
    $P1566 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1567, $P1566["sub"]
    unless_null $P1567, vivify_280
    new $P1567, "Undef"
  vivify_280:
    $P1568 = $P1567."name"()
    set $S1569, $P1568
    concat $P1570, $P1565, $S1569
    concat $P1571, $P1570, "'"
    $P1560."panic"($P1571)
  if_1557_end:
.annotate 'line', 944
    find_lex $P1572, "$reg"
.annotate 'line', 942
    .return ($P1572)
  control_1548:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1573, exception, "payload"
    .return ($P1573)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "debug"  :subid("60_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1577 :slurpy
.annotate 'line', 950
    .const 'Sub' $P1583 = "61_1308074667.1448" 
    capture_lex $P1583
    new $P1576, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1576, control_1575
    push_eh $P1576
    .lex "self", self
    .lex "@args", param_1577
.annotate 'line', 951
    find_lex $P1579, "@args"
    defined $I1580, $P1579
    unless $I1580, for_undef_281
    iter $P1578, $P1579
    new $P1587, 'ExceptionHandler'
    set_label $P1587, loop1586_handler
    $P1587."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1587
  loop1586_test:
    unless $P1578, loop1586_done
    shift $P1581, $P1578
  loop1586_redo:
    .const 'Sub' $P1583 = "61_1308074667.1448" 
    capture_lex $P1583
    $P1583($P1581)
  loop1586_next:
    goto loop1586_test
  loop1586_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1588, exception, 'type'
    eq $P1588, .CONTROL_LOOP_NEXT, loop1586_next
    eq $P1588, .CONTROL_LOOP_REDO, loop1586_redo
  loop1586_done:
    pop_eh 
  for_undef_281:
.annotate 'line', 950
    .return ($P1578)
  control_1575:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1589, exception, "payload"
    .return ($P1589)
.end


.namespace ["POST";"Compiler"]
.sub "_block1582"  :anon :subid("61_1308074667.1448") :outer("60_1308074667.1448")
    .param pmc param_1584
.annotate 'line', 951
    .lex "$_", param_1584
.annotate 'line', 952
    find_lex $P1585, "$_"
    say $P1585
.annotate 'line', 951
    .return ()
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("62_1308074667.1448") :method :outer("11_1308074667.1448")
    .param pmc param_1593
    .param pmc param_1594
.annotate 'line', 956
    new $P1592, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1592, control_1591
    push_eh $P1592
    .lex "self", self
    .lex "$past", param_1593
    .lex "%adverbs", param_1594
.annotate 'line', 957
    $P1595 = root_new ['parrot';'Hash']
    .lex "%context", $P1595
.annotate 'line', 965
    new $P1596, "Undef"
    .lex "$pfdir", $P1596
.annotate 'line', 956
    find_lex $P1597, "%context"
.annotate 'line', 959
    find_lex $P1598, "self"
    find_lex $P1599, "%context"
    unless_null $P1599, vivify_282
    $P1599 = root_new ['parrot';'Hash']
    store_lex "%context", $P1599
  vivify_282:
    set $P1599["compiler"], $P1598
.annotate 'line', 961
    $P1600 = "new"("Packfile")
    find_lex $P1601, "%context"
    unless_null $P1601, vivify_283
    $P1601 = root_new ['parrot';'Hash']
    store_lex "%context", $P1601
  vivify_283:
    set $P1601["packfile"], $P1600
.annotate 'line', 965
    find_lex $P1602, "%context"
    unless_null $P1602, vivify_284
    $P1602 = root_new ['parrot';'Hash']
  vivify_284:
    set $P1603, $P1602["packfile"]
    unless_null $P1603, vivify_285
    new $P1603, "Undef"
  vivify_285:
    $P1604 = $P1603."get_directory"()
    store_lex "$pfdir", $P1604
.annotate 'line', 968
    $P1605 = "new"("PackfileConstantTable")
    find_lex $P1606, "%context"
    unless_null $P1606, vivify_286
    $P1606 = root_new ['parrot';'Hash']
    store_lex "%context", $P1606
  vivify_286:
    set $P1606["constants"], $P1605
.annotate 'line', 971
    $P1607 = "new"("FixedIntegerArray")
    find_lex $P1608, "%context"
    unless_null $P1608, vivify_287
    $P1608 = root_new ['parrot';'Hash']
    store_lex "%context", $P1608
  vivify_287:
    set $P1609, $P1608["constants"]
    unless_null $P1609, vivify_288
    $P1609 = root_new ['parrot';'ResizablePMCArray']
    set $P1608["constants"], $P1609
  vivify_288:
    set $P1609[0], $P1607
.annotate 'line', 974
    find_lex $P1610, "%context"
    unless_null $P1610, vivify_289
    $P1610 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1611, $P1610["constants"]
    unless_null $P1611, vivify_290
    new $P1611, "Undef"
  vivify_290:
    find_lex $P1612, "$pfdir"
    unless_null $P1612, vivify_291
    $P1612 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1612
  vivify_291:
    set $P1612["CONSTANTS_hello.pir"], $P1611
.annotate 'line', 977
    $P1613 = "new"("PackfileBytecodeSegment")
    find_lex $P1614, "%context"
    unless_null $P1614, vivify_292
    $P1614 = root_new ['parrot';'Hash']
    store_lex "%context", $P1614
  vivify_292:
    set $P1614["bytecode"], $P1613
.annotate 'line', 978
    find_lex $P1615, "%context"
    unless_null $P1615, vivify_293
    $P1615 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1616, $P1615["bytecode"]
    unless_null $P1616, vivify_294
    new $P1616, "Undef"
  vivify_294:
    $P1616."main_sub"(-1)
.annotate 'line', 980
    new $P1617, "Integer"
    assign $P1617, 0
    find_lex $P1618, "%context"
    unless_null $P1618, vivify_295
    $P1618 = root_new ['parrot';'Hash']
    store_lex "%context", $P1618
  vivify_295:
    set $P1618["got_main_sub"], $P1617
.annotate 'line', 983
    find_lex $P1619, "%context"
    unless_null $P1619, vivify_296
    $P1619 = root_new ['parrot';'Hash']
  vivify_296:
    set $P1620, $P1619["bytecode"]
    unless_null $P1620, vivify_297
    new $P1620, "Undef"
  vivify_297:
    find_lex $P1621, "$pfdir"
    unless_null $P1621, vivify_298
    $P1621 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1621
  vivify_298:
    set $P1621["BYTECODE_hello.pir"], $P1620
.annotate 'line', 992
    get_hll_global $P1622, ["POST"], "VanillaAllocator"
    $P1623 = $P1622."new"()
    find_lex $P1624, "%context"
    unless_null $P1624, vivify_299
    $P1624 = root_new ['parrot';'Hash']
    store_lex "%context", $P1624
  vivify_299:
    set $P1624["regalloc"], $P1623
.annotate 'line', 994
    find_lex $P1625, "%adverbs"
    unless_null $P1625, vivify_300
    $P1625 = root_new ['parrot';'Hash']
  vivify_300:
    set $P1626, $P1625["debug"]
    unless_null $P1626, vivify_301
    new $P1626, "Undef"
  vivify_301:
    find_lex $P1627, "%context"
    unless_null $P1627, vivify_302
    $P1627 = root_new ['parrot';'Hash']
    store_lex "%context", $P1627
  vivify_302:
    set $P1627["DEBUG"], $P1626
    find_lex $P1628, "%context"
.annotate 'line', 956
    .return ($P1628)
  control_1591:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1629, exception, "payload"
    .return ($P1629)
.end


.namespace ["POST";"Compiler"]
.sub "_block1630" :load :anon :subid("63_1308074667.1448")
.annotate 'line', 16
    .const 'Sub' $P1632 = "11_1308074667.1448" 
    $P1633 = $P1632()
    .return ($P1633)
.end


.namespace []
.sub "_block1639" :load :anon :subid("64_1308074667.1448")
.annotate 'line', 1
    .const 'Sub' $P1641 = "10_1308074667.1448" 
    $P1642 = $P1641()
    .return ($P1642)
.end

