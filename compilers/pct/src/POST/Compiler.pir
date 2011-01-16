
.namespace []
.sub "_block11"  :anon :subid("10_1295186544.79502")
.annotate 'line', 0
    get_hll_global $P14, ["POST";"Compiler"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    get_hll_global $P14, ["POST";"Compiler"], "_block13" 
    capture_lex $P14
    $P1621 = $P14()
.annotate 'line', 1
    .return ($P1621)
    .const 'Sub' $P1623 = "64_1295186544.79502" 
    .return ($P1623)
.end


.namespace []
.sub "" :load :init :subid("post65") :outer("10_1295186544.79502")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1295186544.79502" 
    .local pmc block
    set block, $P12
    $P1626 = get_root_global ["parrot"], "P6metaclass"
    new $P1627, "ResizablePMCArray"
    push $P1627, "$?HLL"
    push $P1627, "$?NAMESPACE"
    $P1626."new_class"("POST::Compiler", "PCT::HLLCompiler" :named("parent"), $P1627 :named("attr"))
.end


.namespace ["POST";"Compiler"]
.sub "_block13"  :subid("11_1295186544.79502") :outer("10_1295186544.79502")
.annotate 'line', 16
    .const 'Sub' $P1573 = "62_1295186544.79502" 
    capture_lex $P1573
    .const 'Sub' $P1557 = "60_1295186544.79502" 
    capture_lex $P1557
    .const 'Sub' $P1530 = "59_1295186544.79502" 
    capture_lex $P1530
    .const 'Sub' $P1452 = "57_1295186544.79502" 
    capture_lex $P1452
    .const 'Sub' $P1416 = "56_1295186544.79502" 
    capture_lex $P1416
    .const 'Sub' $P1364 = "55_1295186544.79502" 
    capture_lex $P1364
    .const 'Sub' $P1338 = "53_1295186544.79502" 
    capture_lex $P1338
    .const 'Sub' $P1219 = "52_1295186544.79502" 
    capture_lex $P1219
    .const 'Sub' $P1151 = "48_1295186544.79502" 
    capture_lex $P1151
    .const 'Sub' $P1075 = "45_1295186544.79502" 
    capture_lex $P1075
    .const 'Sub' $P1035 = "44_1295186544.79502" 
    capture_lex $P1035
    .const 'Sub' $P1027 = "43_1295186544.79502" 
    capture_lex $P1027
    .const 'Sub' $P1011 = "42_1295186544.79502" 
    capture_lex $P1011
    .const 'Sub' $P966 = "40_1295186544.79502" 
    capture_lex $P966
    .const 'Sub' $P926 = "39_1295186544.79502" 
    capture_lex $P926
    .const 'Sub' $P901 = "38_1295186544.79502" 
    capture_lex $P901
    .const 'Sub' $P665 = "34_1295186544.79502" 
    capture_lex $P665
    .const 'Sub' $P619 = "32_1295186544.79502" 
    capture_lex $P619
    .const 'Sub' $P598 = "30_1295186544.79502" 
    capture_lex $P598
    .const 'Sub' $P506 = "27_1295186544.79502" 
    capture_lex $P506
    .const 'Sub' $P239 = "24_1295186544.79502" 
    capture_lex $P239
    .const 'Sub' $P233 = "23_1295186544.79502" 
    capture_lex $P233
    .const 'Sub' $P199 = "21_1295186544.79502" 
    capture_lex $P199
    .const 'Sub' $P169 = "20_1295186544.79502" 
    capture_lex $P169
    .const 'Sub' $P164 = "19_1295186544.79502" 
    capture_lex $P164
    .const 'Sub' $P151 = "18_1295186544.79502" 
    capture_lex $P151
    .const 'Sub' $P50 = "17_1295186544.79502" 
    capture_lex $P50
    .const 'Sub' $P40 = "16_1295186544.79502" 
    capture_lex $P40
    .const 'Sub' $P35 = "15_1295186544.79502" 
    capture_lex $P35
    .const 'Sub' $P29 = "14_1295186544.79502" 
    capture_lex $P29
    .const 'Sub' $P24 = "13_1295186544.79502" 
    capture_lex $P24
    .const 'Sub' $P16 = "12_1295186544.79502" 
    capture_lex $P16
.annotate 'line', 149
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
.annotate 'line', 149
    new $P48, "String"
    assign $P48, "bar"
    set_global "%pirop_handlers", $P48
    new $P49, "ResizablePMCArray"
    push $P49, $P48
    push $P49, "bang"
.annotate 'line', 16
    .return ()
    .const 'Sub' $P1614 = "63_1295186544.79502" 
    .return ($P1614)
.end


.namespace ["POST";"Compiler"]
.sub "" :load :init :subid("post66") :outer("11_1295186544.79502")
.annotate 'line', 16
    get_hll_global $P14, ["POST";"Compiler"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 20
    get_hll_global $P1617, ["POST"], "Compiler"
    $P1617."language"("POST")
.annotate 'line', 21
    get_hll_global $P1618, ["POST"], "Compiler"
    new $P1619, "ResizablePMCArray"
    push $P1619, "pir"
    push $P1619, "evalpmc"
    $P1618."stages"($P1619)
.annotate 'line', 23

        $P1620 = new ['String']
        set_global '$?HLL', $P1620
    
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("12_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_19
.annotate 'line', 36
    new $P18, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P18, control_17
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
.sub "key_pir"  :subid("13_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_27 :slurpy
.annotate 'line', 44
    new $P26, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P26, control_25
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
.sub "to_pir"  :subid("14_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_32
    .param pmc param_33 :slurpy :named
.annotate 'line', 74
    new $P31, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P31, control_30
    push_eh $P31
    .lex "self", self
    .lex "$post", param_32
    .lex "%adverbs", param_33
.annotate 'line', 75

    .local pmc post
    .local pmc adverbs

    find_lex post, '$post'
    find_lex adverbs, '%adverbs'

    .local pmc newself
    newself = new ['POST';'Compiler']

    .local pmc innerpir, line
    innerpir = new 'StringBuilder'
    .lex '$CODE', innerpir
    line = box 0
    .lex '$LINE', line

    ##  if the root node isn't a Sub, wrap it
    $I0 = isa post, ['POST';'Sub']
    if $I0 goto have_sub
    $P0 = get_hll_global ['POST'], 'Sub'
    post = $P0.'new'(post, 'name'=>'anon')
  have_sub:

    ##  now generate the pir
    newself.'pir'(post)

    ##  and return whatever code was generated
    .return (innerpir)
    
.annotate 'line', 74
    .return ()
  control_30:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir_children"  :subid("15_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_38
.annotate 'line', 109
    new $P37, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P37, control_36
    push_eh $P37
    .lex "self", self
    .lex "$node", param_38
.annotate 'line', 110

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
    
.annotate 'line', 109
    .return ()
  control_36:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P39, exception, "payload"
    .return ($P39)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("16_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,_)
    .param pmc param_43
.annotate 'line', 141
    new $P42, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P42, control_41
    push_eh $P42
    .lex "self", self
    .lex "$node", param_43
.annotate 'line', 142
    find_lex $P44, "self"
    find_lex $P45, "$node"
    $P46 = $P44."pir_children"($P45)
.annotate 'line', 141
    .return ($P46)
  control_41:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("17_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Op"])
    .param pmc param_53
.annotate 'line', 151
    new $P52, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P52, control_51
    push_eh $P52
    .lex "self", self
    .lex "$node", param_53
.annotate 'line', 153
    new $P54, "Undef"
    .lex "$pirop", $P54
.annotate 'line', 155
    new $P55, "Undef"
    .lex "$result", $P55
.annotate 'line', 159
    $P56 = root_new ['parrot';'ResizablePMCArray']
    .lex "@arglist", $P56
.annotate 'line', 162
    new $P57, "Undef"
    .lex "$fmt", $P57
.annotate 'line', 163
    new $P58, "Undef"
    .lex "$name", $P58
.annotate 'line', 164
    new $P59, "Undef"
    .lex "$invocant", $P59
.annotate 'line', 194
    new $P60, "Undef"
    .lex "$subpir", $P60
.annotate 'line', 195
    new $P61, "Undef"
    .lex "$subline", $P61
.annotate 'line', 196
    new $P62, "Undef"
    .lex "$line", $P62
.annotate 'line', 153
    find_lex $P63, "$node"
    $P64 = $P63."pirop"()
    store_lex "$pirop", $P64
.annotate 'line', 155
    find_lex $P65, "$node"
    $P66 = $P65."result"()
    set $S67, $P66
    new $P68, 'String'
    set $P68, $S67
    store_lex "$result", $P68
.annotate 'line', 156
    find_lex $P70, "$result"
    unless $P70, if_69_end
    find_lex $P71, "$result"
    concat $P72, $P71, " = "
    store_lex "$result", $P72
  if_69_end:
.annotate 'line', 159
    find_lex $P73, "$node"
    $P74 = $P73."list"()
    store_lex "@arglist", $P74
    find_lex $P75, "$fmt"
    find_lex $P76, "$name"
    find_lex $P77, "$invocant"
.annotate 'line', 166
    find_lex $P79, "$pirop"
    set $S80, $P79
    iseq $I81, $S80, "call"
    if $I81, if_78
.annotate 'line', 170
    find_lex $P86, "$pirop"
    set $S87, $P86
    iseq $I88, $S87, "callmethod"
    if $I88, if_85
.annotate 'line', 175
    find_lex $P95, "$pirop"
    set $S96, $P95
    iseq $I97, $S96, "return"
    if $I97, if_94
.annotate 'line', 178
    find_lex $P100, "$pirop"
    set $S101, $P100
    iseq $I102, $S101, "yield"
    if $I102, if_99
.annotate 'line', 181
    find_lex $P105, "$pirop"
    set $S106, $P105
    iseq $I107, $S106, "tailcall"
    if $I107, if_104
.annotate 'line', 185
    find_lex $P112, "$pirop"
    set $S113, $P112
    iseq $I114, $S113, "inline"
    if $I114, if_111
.annotate 'line', 190
    new $P120, "String"
    assign $P120, "    %n %,\n"
    store_lex "$fmt", $P120
.annotate 'line', 191
    find_lex $P121, "$pirop"
    store_lex "$name", $P121
.annotate 'line', 189
    goto if_111_end
  if_111:
.annotate 'line', 186
    find_lex $P115, "$node"
    $P116 = $P115."inline"()
    concat $P117, $P116, "\n"
    store_lex "$fmt", $P117
.annotate 'line', 187
    find_lex $P118, "$node"
    $P119 = $P118."result"()
    store_lex "$result", $P119
  if_111_end:
.annotate 'line', 185
    goto if_104_end
  if_104:
.annotate 'line', 182
    find_lex $P108, "@arglist"
    $P109 = $P108."shift"()
    store_lex "$name", $P109
.annotate 'line', 183
    new $P110, "String"
    assign $P110, "    .tailcall %n(%,)\n"
    store_lex "$fmt", $P110
  if_104_end:
.annotate 'line', 181
    goto if_99_end
  if_99:
.annotate 'line', 179
    new $P103, "String"
    assign $P103, "    .yield (%,)\n"
    store_lex "$fmt", $P103
  if_99_end:
.annotate 'line', 178
    goto if_94_end
  if_94:
.annotate 'line', 176
    new $P98, "String"
    assign $P98, "    .return (%,)\n"
    store_lex "$fmt", $P98
  if_94_end:
.annotate 'line', 175
    goto if_85_end
  if_85:
.annotate 'line', 171
    new $P89, "String"
    assign $P89, "    %r%i.%n(%,)\n"
    store_lex "$fmt", $P89
.annotate 'line', 172
    find_lex $P90, "@arglist"
    $P91 = $P90."shift"()
    store_lex "$name", $P91
.annotate 'line', 173
    find_lex $P92, "@arglist"
    $P93 = $P92."shift"()
    store_lex "$invocant", $P93
  if_85_end:
.annotate 'line', 170
    goto if_78_end
  if_78:
.annotate 'line', 167
    new $P82, "String"
    assign $P82, "    %r%n(%,)\n"
    store_lex "$fmt", $P82
.annotate 'line', 168
    find_lex $P83, "@arglist"
    $P84 = $P83."shift"()
    store_lex "$name", $P84
  if_78_end:
.annotate 'line', 194
    new $P122, "String"
    assign $P122, "$SUBPIR"
    set $S123, $P122
    find_caller_lex $P124, $S123
    store_lex "$subpir", $P124
.annotate 'line', 195
    new $P125, "String"
    assign $P125, "$SUBLINE"
    set $S126, $P125
    find_caller_lex $P127, $S126
    store_lex "$subline", $P127
.annotate 'line', 196
    new $P128, "String"
    assign $P128, "$LINE"
    set $S129, $P128
    find_caller_lex $P130, $S129
    store_lex "$line", $P130
.annotate 'line', 198
    find_lex $P132, "$subline"
    set $N133, $P132
    find_lex $P134, "$line"
    set $N135, $P134
    isne $I136, $N133, $N135
    unless $I136, if_131_end
.annotate 'line', 199
    find_lex $P137, "$subpir"
    find_lex $P138, "$line"
    set $S139, $P138
    $P137."append_format"(".annotate 'line', %0\n", $S139)
.annotate 'line', 200
    find_lex $P140, "$subline"
    find_lex $P141, "$line"
    assign $P140, $P141
  if_131_end:
.annotate 'line', 203
    find_lex $P142, "$subpir"
    find_lex $P143, "$fmt"
    find_lex $P144, "@arglist"
    find_lex $P145, "$result"
    find_lex $P146, "$name"
    find_lex $P147, "$invocant"
    find_lex $P148, "$result"
    $P149 = $P142."append_format"($P143, $P144 :flat, $P145 :named("r"), $P146 :named("n"), $P147 :named("i"), $P148 :named("t"))
.annotate 'line', 151
    .return ($P149)
  control_51:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, "payload"
    .return ($P150)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("18_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Label"])
    .param pmc param_154
.annotate 'line', 210
    new $P153, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P153, control_152
    push_eh $P153
    .lex "self", self
    .lex "$node", param_154
.annotate 'line', 211
    new $P155, "Undef"
    .lex "$subpir", $P155
    new $P156, "String"
    assign $P156, "$SUBPIR"
    set $S157, $P156
    find_caller_lex $P158, $S157
    store_lex "$subpir", $P158
.annotate 'line', 212
    find_lex $P159, "$subpir"
    find_lex $P160, "$node"
    $P161 = $P160."result"()
    $P162 = $P159."append_format"("  %0:\n", $P161)
.annotate 'line', 210
    .return ($P162)
  control_152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P163, exception, "payload"
    .return ($P163)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("19_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Sub"])
    .param pmc param_167
.annotate 'line', 221
    new $P166, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P166, control_165
    push_eh $P166
    .lex "self", self
    .lex "$node", param_167
.annotate 'line', 222

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
    
.annotate 'line', 221
    .return ()
  control_165:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, "payload"
    .return ($P168)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "hll_pir"  :subid("20_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_172
    .param pmc param_173 :slurpy :named
.annotate 'line', 378
    new $P171, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P171, control_170
    push_eh $P171
    .lex "self", self
    .lex "$node", param_172
    .lex "%options", param_173
.annotate 'line', 382
    new $P174, "Undef"
    .lex "$source", $P174
.annotate 'line', 383
    new $P175, "Undef"
    .lex "$compiler", $P175
.annotate 'line', 379
    new $P176, "String"
    assign $P176, "pir"
    find_lex $P177, "%options"
    unless_null $P177, vivify_68
    $P177 = root_new ['parrot';'Hash']
    store_lex "%options", $P177
  vivify_68:
    set $P177["target"], $P176
.annotate 'line', 380
    find_lex $P178, "$node"
    $P179 = $P178."subid"()
    find_lex $P180, "%options"
    unless_null $P180, vivify_69
    $P180 = root_new ['parrot';'Hash']
    store_lex "%options", $P180
  vivify_69:
    set $P180["subid"], $P179
.annotate 'line', 382
    find_lex $P181, "$node"
    unless_null $P181, vivify_70
    $P181 = root_new ['parrot';'ResizablePMCArray']
  vivify_70:
    set $P182, $P181[0]
    unless_null $P182, vivify_71
    new $P182, "Undef"
  vivify_71:
    store_lex "$source", $P182
.annotate 'line', 383
    find_lex $P183, "$node"
    $S184 = $P183."compiler"()
    compreg $P185, $S184
    store_lex "$compiler", $P185
.annotate 'line', 384
    find_lex $P188, "$compiler"
    isa $I189, $P188, "Sub"
    if $I189, if_187
.annotate 'line', 386
    find_lex $P194, "$compiler"
    find_lex $P195, "$source"
    find_lex $P196, "%options"
    $P197 = $P194."compile"($P195, $P196 :flat)
    set $P186, $P197
.annotate 'line', 384
    goto if_187_end
  if_187:
.annotate 'line', 385
    find_lex $P190, "$compiler"
    find_lex $P191, "$source"
    find_lex $P192, "%options"
    $P193 = $P190($P191, $P192 :flat)
    set $P186, $P193
  if_187_end:
.annotate 'line', 378
    .return ($P186)
  control_170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P198, exception, "payload"
    .return ($P198)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("21_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_202
    .param pmc param_203
.annotate 'line', 406
    .const 'Sub' $P221 = "22_1295186544.79502" 
    capture_lex $P221
    new $P201, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P201, control_200
    push_eh $P201
    .lex "self", self
    .lex "$post", param_202
    .lex "%adverbs", param_203
.annotate 'line', 410
    $P204 = root_new ['parrot';'Hash']
    .lex "%context", $P204
    find_lex $P205, "self"
    find_lex $P206, "$post"
    find_lex $P207, "%adverbs"
    $P208 = $P205."create_context"($P206, $P207)
    store_lex "%context", $P208
.annotate 'line', 411
    new $P209, "Integer"
    assign $P209, 0
    find_lex $P210, "%context"
    unless_null $P210, vivify_72
    $P210 = root_new ['parrot';'Hash']
    store_lex "%context", $P210
  vivify_72:
    set $P210["DEBUG"], $P209
.annotate 'line', 413
    find_lex $P211, "$post"
    find_lex $P212, "%context"
    unless_null $P212, vivify_73
    $P212 = root_new ['parrot';'Hash']
    store_lex "%context", $P212
  vivify_73:
    set $P212["pir_file"], $P211
.annotate 'line', 418
    find_lex $P213, "self"
    find_lex $P214, "$post"
    $P213."enumerate_subs"($P214)
.annotate 'line', 420
    find_lex $P216, "$post"
    $P217 = $P216."list"()
    defined $I218, $P217
    unless $I218, for_undef_74
    iter $P215, $P217
    new $P228, 'ExceptionHandler'
    set_addr $P228, loop227_handler
    $P228."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P228
  loop227_test:
    unless $P215, loop227_done
    shift $P219, $P215
  loop227_redo:
    .const 'Sub' $P221 = "22_1295186544.79502" 
    capture_lex $P221
    $P221($P219)
  loop227_next:
    goto loop227_test
  loop227_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P229, exception, 'type'
    eq $P229, .CONTROL_LOOP_NEXT, loop227_next
    eq $P229, .CONTROL_LOOP_REDO, loop227_redo
  loop227_done:
    pop_eh 
  for_undef_74:
    find_lex $P230, "%context"
    unless_null $P230, vivify_75
    $P230 = root_new ['parrot';'Hash']
  vivify_75:
    set $P231, $P230["packfile"]
    unless_null $P231, vivify_76
    new $P231, "Undef"
  vivify_76:
.annotate 'line', 406
    .return ($P231)
  control_200:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P232, exception, "payload"
    .return ($P232)
.end


.namespace ["POST";"Compiler"]
.sub "_block220"  :anon :subid("22_1295186544.79502") :outer("21_1295186544.79502")
    .param pmc param_222
.annotate 'line', 420
    .lex "$s", param_222
.annotate 'line', 421
    find_lex $P223, "self"
    find_lex $P224, "$s"
    find_lex $P225, "%context"
    $P226 = $P223."to_pbc"($P224, $P225)
.annotate 'line', 420
    .return ($P226)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("23_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["Undef"],_)
    .param pmc param_236
    .param pmc param_237
.annotate 'line', 430
    new $P235, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P235, control_234
    push_eh $P235
    .lex "self", self
    .lex "$what", param_236
    .lex "%context", param_237
    .return ()
  control_234:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P238, exception, "payload"
    .return ($P238)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("24_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Sub"],_)
    .param pmc param_242
    .param pmc param_243
.annotate 'line', 434
    .const 'Sub' $P408 = "26_1295186544.79502" 
    capture_lex $P408
    .const 'Sub' $P329 = "25_1295186544.79502" 
    capture_lex $P329
    new $P241, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P241, control_240
    push_eh $P241
    .lex "self", self
    .lex "$sub", param_242
    .lex "%context", param_243
.annotate 'line', 439
    $P244 = root_new ['parrot';'ResizablePMCArray']
    .lex "@n_regs_used", $P244
.annotate 'line', 443
    new $P245, "Undef"
    .lex "$bc", $P245
.annotate 'line', 449
    new $P246, "Undef"
    .lex "$sb", $P246
.annotate 'line', 451
    new $P247, "Undef"
    .lex "$subname", $P247
.annotate 'line', 456
    new $P248, "Undef"
    .lex "$start_offset", $P248
.annotate 'line', 485
    new $P249, "Undef"
    .lex "$end_offset", $P249
.annotate 'line', 492
    $P250 = root_new ['parrot';'Hash']
    .lex "%sub", $P250
.annotate 'line', 519
    new $P251, "Undef"
    .lex "$idx", $P251
.annotate 'line', 436
    find_lex $P252, "$sub"
    find_lex $P253, "%context"
    unless_null $P253, vivify_77
    $P253 = root_new ['parrot';'Hash']
    store_lex "%context", $P253
  vivify_77:
    set $P253["sub"], $P252
.annotate 'line', 439
    find_lex $P254, "%context"
    unless_null $P254, vivify_78
    $P254 = root_new ['parrot';'Hash']
  vivify_78:
    set $P255, $P254["regalloc"]
    unless_null $P255, vivify_79
    new $P255, "Undef"
  vivify_79:
    find_lex $P256, "$sub"
    $P257 = $P255."process"($P256)
    store_lex "@n_regs_used", $P257
.annotate 'line', 440
    find_lex $P259, "%context"
    unless_null $P259, vivify_80
    $P259 = root_new ['parrot';'Hash']
  vivify_80:
    set $P260, $P259["DEBUG"]
    unless_null $P260, vivify_81
    new $P260, "Undef"
  vivify_81:
    unless $P260, if_258_end
    find_lex $P261, "self"
    new $P262, "String"
    assign $P262, "n_regs_used "
    find_lex $P263, "@n_regs_used"
    $S264 = $P263."join"("-")
    concat $P265, $P262, $S264
    $P261."debug"($P265)
  if_258_end:
.annotate 'line', 441
    find_lex $P267, "%context"
    unless_null $P267, vivify_82
    $P267 = root_new ['parrot';'Hash']
  vivify_82:
    set $P268, $P267["DEBUG"]
    unless_null $P268, vivify_83
    new $P268, "Undef"
  vivify_83:
    unless $P268, if_266_end
    find_lex $P269, "self"
    find_lex $P270, "$sub"
    $P269."dumper"($P270, "sub")
  if_266_end:
.annotate 'line', 443
    find_lex $P271, "%context"
    unless_null $P271, vivify_84
    $P271 = root_new ['parrot';'Hash']
  vivify_84:
    set $P272, $P271["bytecode"]
    unless_null $P272, vivify_85
    new $P272, "Undef"
  vivify_85:
    store_lex "$bc", $P272
.annotate 'line', 446
    $P273 = "hash"()
    find_lex $P274, "%context"
    unless_null $P274, vivify_86
    $P274 = root_new ['parrot';'Hash']
    store_lex "%context", $P274
  vivify_86:
    set $P274["labels_todo"], $P273
.annotate 'line', 449
    $P275 = "new"("StringBuilder")
    store_lex "$sb", $P275
.annotate 'line', 450
    find_lex $P276, "$sb"
    find_lex $P277, "$sub"
    $P278 = $P277."name"()
    set $S279, $P278
    $P276."push"($S279)
.annotate 'line', 451
    find_lex $P280, "$sb"
    set $S281, $P280
    new $P282, 'String'
    set $P282, $S281
    store_lex "$subname", $P282
.annotate 'line', 453
    find_lex $P284, "%context"
    unless_null $P284, vivify_87
    $P284 = root_new ['parrot';'Hash']
  vivify_87:
    set $P285, $P284["DEBUG"]
    unless_null $P285, vivify_88
    new $P285, "Undef"
  vivify_88:
    unless $P285, if_283_end
    find_lex $P286, "self"
    new $P287, 'String'
    set $P287, "Emitting "
    find_lex $P288, "$subname"
    concat $P289, $P287, $P288
    $P286."debug"($P289)
  if_283_end:
.annotate 'line', 454
    find_lex $P290, "%context"
    unless_null $P290, vivify_89
    $P290 = root_new ['parrot';'Hash']
  vivify_89:
    set $P291, $P290["constants"]
    unless_null $P291, vivify_90
    new $P291, "Undef"
  vivify_90:
    find_lex $P292, "$subname"
    $P291."get_or_create_string"($P292)
.annotate 'line', 456
    find_lex $P293, "$bc"
    set $N294, $P293
    new $P295, 'Float'
    set $P295, $N294
    store_lex "$start_offset", $P295
.annotate 'line', 457
    find_lex $P297, "%context"
    unless_null $P297, vivify_91
    $P297 = root_new ['parrot';'Hash']
  vivify_91:
    set $P298, $P297["DEBUG"]
    unless_null $P298, vivify_92
    new $P298, "Undef"
  vivify_92:
    unless $P298, if_296_end
    find_lex $P299, "self"
    new $P300, 'String'
    set $P300, "From "
    find_lex $P301, "$start_offset"
    concat $P302, $P300, $P301
    $P299."debug"($P302)
  if_296_end:
.annotate 'line', 460
    find_lex $P304, "$sub"
    unless_null $P304, vivify_93
    $P304 = root_new ['parrot';'Hash']
  vivify_93:
    set $P305, $P304["params"]
    unless_null $P305, vivify_94
    new $P305, "Undef"
  vivify_94:
    if $P305, unless_303_end
    $P306 = "list"()
    find_lex $P307, "$sub"
    unless_null $P307, vivify_95
    $P307 = root_new ['parrot';'Hash']
    store_lex "$sub", $P307
  vivify_95:
    set $P307["params"], $P306
  unless_303_end:
.annotate 'line', 461
    find_lex $P309, "$sub"
    $P310 = $P309."is_method"()
    unless $P310, if_308_end
    find_lex $P311, "$sub"
    unless_null $P311, vivify_96
    $P311 = root_new ['parrot';'Hash']
  vivify_96:
    set $P312, $P311["params"]
    unless_null $P312, vivify_97
    new $P312, "Undef"
  vivify_97:
    get_hll_global $P313, ["POST"], "Value"
    $P314 = $P313."new"("self" :named("name"))
    $P312."unshift"($P314)
  if_308_end:
.annotate 'line', 463
    find_lex $P316, "$sub"
    unless_null $P316, vivify_98
    $P316 = root_new ['parrot';'Hash']
  vivify_98:
    set $P317, $P316["params"]
    unless_null $P317, vivify_99
    new $P317, "Undef"
  vivify_99:
    set $N318, $P317
    unless $N318, if_315_end
.annotate 'line', 464
    find_lex $P319, "self"
    find_lex $P320, "$sub"
    unless_null $P320, vivify_100
    $P320 = root_new ['parrot';'Hash']
  vivify_100:
    set $P321, $P320["params"]
    unless_null $P321, vivify_101
    new $P321, "Undef"
  vivify_101:
    find_lex $P322, "%context"
    $P319."build_pcc_call"("get_params_pc", $P321, $P322)
  if_315_end:
.annotate 'line', 468
    find_lex $P324, "$sub"
    $P325 = $P324."list"()
    defined $I326, $P325
    unless $I326, for_undef_102
    iter $P323, $P325
    new $P336, 'ExceptionHandler'
    set_addr $P336, loop335_handler
    $P336."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P336
  loop335_test:
    unless $P323, loop335_done
    shift $P327, $P323
  loop335_redo:
    .const 'Sub' $P329 = "25_1295186544.79502" 
    capture_lex $P329
    $P329($P327)
  loop335_next:
    goto loop335_test
  loop335_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P337, exception, 'type'
    eq $P337, .CONTROL_LOOP_NEXT, loop335_next
    eq $P337, .CONTROL_LOOP_REDO, loop335_redo
  loop335_done:
    pop_eh 
  for_undef_102:
.annotate 'line', 472
    find_lex $P339, "%context"
    unless_null $P339, vivify_103
    $P339 = root_new ['parrot';'Hash']
  vivify_103:
    set $P340, $P339["DEBUG"]
    unless_null $P340, vivify_104
    new $P340, "Undef"
  vivify_104:
    unless $P340, if_338_end
    find_lex $P341, "self"
    new $P342, 'String'
    set $P342, "Middle "
    find_lex $P343, "$bc"
    set $N344, $P343
    set $S345, $N344
    concat $P346, $P342, $S345
    $P341."debug"($P346)
  if_338_end:
.annotate 'line', 475
    find_lex $P348, "%context"
    unless_null $P348, vivify_105
    $P348 = root_new ['parrot';'Hash']
  vivify_105:
    set $P349, $P348["DEBUG"]
    unless_null $P349, vivify_106
    new $P349, "Undef"
  vivify_106:
    unless $P349, if_347_end
    find_lex $P350, "self"
    $P350."debug"("Emitting default return")
  if_347_end:
.annotate 'line', 476
    find_lex $P351, "$bc"
.annotate 'line', 477
    new $P352, "ResizablePMCArray"
    push $P352, "set_returns_pc"
    push $P352, 0
    $P351."push"($P352)
.annotate 'line', 481
    find_lex $P353, "$bc"
    new $P354, "ResizablePMCArray"
    push $P354, "returncc"
    $P353."push"($P354)
.annotate 'line', 485
    find_lex $P355, "$bc"
    set $N356, $P355
    new $P357, 'Float'
    set $P357, $N356
    store_lex "$end_offset", $P357
.annotate 'line', 486
    find_lex $P359, "%context"
    unless_null $P359, vivify_107
    $P359 = root_new ['parrot';'Hash']
  vivify_107:
    set $P360, $P359["DEBUG"]
    unless_null $P360, vivify_108
    new $P360, "Undef"
  vivify_108:
    unless $P360, if_358_end
    find_lex $P361, "self"
    new $P362, 'String'
    set $P362, "To "
    find_lex $P363, "$end_offset"
    concat $P364, $P362, $P363
    $P361."debug"($P364)
  if_358_end:
.annotate 'line', 489
    find_lex $P365, "self"
    find_lex $P366, "$sub"
    find_lex $P367, "%context"
    unless_null $P367, vivify_109
    $P367 = root_new ['parrot';'Hash']
  vivify_109:
    set $P368, $P367["labels_todo"]
    unless_null $P368, vivify_110
    new $P368, "Undef"
  vivify_110:
    find_lex $P369, "%context"
    unless_null $P369, vivify_111
    $P369 = root_new ['parrot';'Hash']
  vivify_111:
    set $P370, $P369["bytecode"]
    unless_null $P370, vivify_112
    new $P370, "Undef"
  vivify_112:
    find_lex $P371, "%context"
    $P365."fixup_labels"($P366, $P368, $P370, $P371)
.annotate 'line', 492
    find_lex $P372, "$start_offset"
    find_lex $P373, "$end_offset"
    find_lex $P374, "$subname"
.annotate 'line', 497
    find_lex $P376, "$sub"
    unless_null $P376, vivify_113
    $P376 = root_new ['parrot';'Hash']
  vivify_113:
    set $P377, $P376["subid"]
    unless_null $P377, vivify_114
    new $P377, "Undef"
  vivify_114:
    set $P375, $P377
    defined $I379, $P375
    if $I379, default_378
    find_lex $P380, "$subname"
    set $P375, $P380
  default_378:
.annotate 'line', 498
    find_lex $P382, "$sub"
    $P383 = $P382."nsentry"()
    set $P381, $P383
    defined $I385, $P381
    if $I385, default_384
    find_lex $P386, "$subname"
    set $P381, $P386
  default_384:
.annotate 'line', 501
    find_lex $P389, "$sub"
    $P390 = $P389."is_method"()
    if $P390, if_388
    new $P392, "String"
    assign $P392, ""
    set $P387, $P392
    goto if_388_end
  if_388:
    find_lex $P391, "$subname"
    set $P387, $P391
  if_388_end:
    find_lex $P393, "@n_regs_used"
.annotate 'line', 505
    find_lex $P394, "self"
    find_lex $P395, "$sub"
    find_lex $P396, "%context"
    $P397 = $P394."create_sub_pf_flags"($P395, $P396)
.annotate 'line', 506
    find_lex $P398, "self"
    find_lex $P399, "$sub"
    find_lex $P400, "%context"
    $P401 = $P398."create_sub_comp_flags"($P399, $P400)
    $P402 = "hash"($P372 :named("start_offs"), $P373 :named("end_offs"), $P374 :named("name"), $P375 :named("subid"), $P381 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P387 :named("method_name"), $P393 :named("n_regs_used"), $P397 :named("pf_flags"), $P401 :named("comp_flags"))
.annotate 'line', 492
    store_lex "%sub", $P402
.annotate 'line', 509
    find_lex $P404, "$sub"
    $P405 = $P404."namespace"()
    $P406 = "defined"($P405)
    unless $P406, if_403_end
    .const 'Sub' $P408 = "26_1295186544.79502" 
    capture_lex $P408
    $P408()
  if_403_end:
.annotate 'line', 519
    find_lex $P422, "$sub"
    $P423 = $P422."constant_index"()
    store_lex "$idx", $P423
.annotate 'line', 520
    find_lex $P425, "$idx"
    $P426 = "defined"($P425)
    if $P426, if_424
.annotate 'line', 525
    find_lex $P440, "%context"
    unless_null $P440, vivify_117
    $P440 = root_new ['parrot';'Hash']
  vivify_117:
    set $P441, $P440["constants"]
    unless_null $P441, vivify_118
    new $P441, "Undef"
  vivify_118:
    find_lex $P442, "%sub"
    $P443 = "new"("Sub", $P442)
    $P444 = $P441."push"($P443)
    store_lex "$idx", $P444
.annotate 'line', 526
    find_lex $P445, "$sub"
    find_lex $P446, "$idx"
    $P445."constant_index"($P446)
.annotate 'line', 527
    find_lex $P448, "%context"
    unless_null $P448, vivify_119
    $P448 = root_new ['parrot';'Hash']
  vivify_119:
    set $P449, $P448["DEBUG"]
    unless_null $P449, vivify_120
    new $P449, "Undef"
  vivify_120:
    unless $P449, if_447_end
    find_lex $P450, "self"
    new $P451, 'String'
    set $P451, "Allocate new constant "
    find_lex $P452, "$idx"
    concat $P453, $P451, $P452
    $P450."debug"($P453)
  if_447_end:
.annotate 'line', 524
    goto if_424_end
  if_424:
.annotate 'line', 521
    find_lex $P428, "%context"
    unless_null $P428, vivify_121
    $P428 = root_new ['parrot';'Hash']
  vivify_121:
    set $P429, $P428["DEBUG"]
    unless_null $P429, vivify_122
    new $P429, "Undef"
  vivify_122:
    unless $P429, if_427_end
    find_lex $P430, "self"
    new $P431, 'String'
    set $P431, "Reusing old constant "
    find_lex $P432, "$idx"
    concat $P433, $P431, $P432
    $P430."debug"($P433)
  if_427_end:
.annotate 'line', 522
    find_lex $P434, "%sub"
    $P435 = "new"("Sub", $P434)
    find_lex $P436, "$idx"
    set $I437, $P436
    find_lex $P438, "%context"
    unless_null $P438, vivify_123
    $P438 = root_new ['parrot';'Hash']
    store_lex "%context", $P438
  vivify_123:
    set $P439, $P438["constants"]
    unless_null $P439, vivify_124
    $P439 = root_new ['parrot';'ResizablePMCArray']
    set $P438["constants"], $P439
  vivify_124:
    set $P439[$I437], $P435
  if_424_end:
.annotate 'line', 531
    find_lex $P456, "%context"
    unless_null $P456, vivify_125
    $P456 = root_new ['parrot';'Hash']
  vivify_125:
    set $P457, $P456["got_main_sub"]
    unless_null $P457, vivify_126
    new $P457, "Undef"
  vivify_126:
    isfalse $I458, $P457
    if $I458, if_455
    new $P454, 'Integer'
    set $P454, $I458
    goto if_455_end
  if_455:
.annotate 'line', 532
    find_lex $P460, "%context"
    unless_null $P460, vivify_127
    $P460 = root_new ['parrot';'Hash']
  vivify_127:
    set $P461, $P460["DEBUG"]
    unless_null $P461, vivify_128
    new $P461, "Undef"
  vivify_128:
    unless $P461, if_459_end
    find_lex $P462, "self"
    new $P463, 'String'
    set $P463, "main_sub is "
    find_lex $P464, "%context"
    unless_null $P464, vivify_129
    $P464 = root_new ['parrot';'Hash']
  vivify_129:
    set $P465, $P464["bytecode"]
    unless_null $P465, vivify_130
    new $P465, "Undef"
  vivify_130:
    $P466 = $P465."main_sub"()
    set $S467, $P466
    concat $P468, $P463, $S467
    $P462."debug"($P468)
  if_459_end:
.annotate 'line', 533
    find_lex $P470, "$sub"
    $P471 = $P470."main"()
    if $P471, if_469
.annotate 'line', 539
    find_lex $P482, "%context"
    unless_null $P482, vivify_131
    $P482 = root_new ['parrot';'Hash']
  vivify_131:
    set $P483, $P482["bytecode"]
    unless_null $P483, vivify_132
    new $P483, "Undef"
  vivify_132:
    $N484 = $P483."main_sub"()
    iseq $I485, $N484, -1.0
    unless $I485, if_481_end
.annotate 'line', 541
    find_lex $P487, "%context"
    unless_null $P487, vivify_133
    $P487 = root_new ['parrot';'Hash']
  vivify_133:
    set $P488, $P487["DEBUG"]
    unless_null $P488, vivify_134
    new $P488, "Undef"
  vivify_134:
    unless $P488, if_486_end
    find_lex $P489, "self"
    $P489."debug"("Got first sub")
  if_486_end:
.annotate 'line', 542
    find_lex $P490, "%context"
    unless_null $P490, vivify_135
    $P490 = root_new ['parrot';'Hash']
  vivify_135:
    set $P491, $P490["bytecode"]
    unless_null $P491, vivify_136
    new $P491, "Undef"
  vivify_136:
    find_lex $P492, "$idx"
    $P491."main_sub"($P492)
  if_481_end:
.annotate 'line', 539
    goto if_469_end
  if_469:
.annotate 'line', 534
    find_lex $P473, "%context"
    unless_null $P473, vivify_137
    $P473 = root_new ['parrot';'Hash']
  vivify_137:
    set $P474, $P473["DEBUG"]
    unless_null $P474, vivify_138
    new $P474, "Undef"
  vivify_138:
    unless $P474, if_472_end
    find_lex $P475, "self"
    $P475."debug"("Got first :main")
  if_472_end:
.annotate 'line', 536
    find_lex $P476, "%context"
    unless_null $P476, vivify_139
    $P476 = root_new ['parrot';'Hash']
  vivify_139:
    set $P477, $P476["bytecode"]
    unless_null $P477, vivify_140
    new $P477, "Undef"
  vivify_140:
    find_lex $P478, "$idx"
    $P477."main_sub"($P478)
.annotate 'line', 537
    new $P479, "Integer"
    assign $P479, 1
    find_lex $P480, "%context"
    unless_null $P480, vivify_141
    $P480 = root_new ['parrot';'Hash']
    store_lex "%context", $P480
  vivify_141:
    set $P480["got_main_sub"], $P479
  if_469_end:
.annotate 'line', 545
    find_lex $P495, "%context"
    unless_null $P495, vivify_142
    $P495 = root_new ['parrot';'Hash']
  vivify_142:
    set $P496, $P495["DEBUG"]
    unless_null $P496, vivify_143
    new $P496, "Undef"
  vivify_143:
    if $P496, if_494
    set $P493, $P496
    goto if_494_end
  if_494:
    find_lex $P497, "self"
    new $P498, 'String'
    set $P498, ":main sub is "
    find_lex $P499, "%context"
    unless_null $P499, vivify_144
    $P499 = root_new ['parrot';'Hash']
  vivify_144:
    set $P500, $P499["bytecode"]
    unless_null $P500, vivify_145
    new $P500, "Undef"
  vivify_145:
    $P501 = $P500."main_sub"()
    set $S502, $P501
    concat $P503, $P498, $S502
    $P504 = $P497."debug"($P503)
    set $P493, $P504
  if_494_end:
.annotate 'line', 531
    set $P454, $P493
  if_455_end:
.annotate 'line', 434
    .return ($P454)
  control_240:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P505, exception, "payload"
    .return ($P505)
.end


.namespace ["POST";"Compiler"]
.sub "_block328"  :anon :subid("25_1295186544.79502") :outer("24_1295186544.79502")
    .param pmc param_330
.annotate 'line', 468
    .lex "$_", param_330
.annotate 'line', 469
    find_lex $P331, "self"
    find_lex $P332, "$_"
    find_lex $P333, "%context"
    $P334 = $P331."to_pbc"($P332, $P333)
.annotate 'line', 468
    .return ($P334)
.end


.namespace ["POST";"Compiler"]
.sub "_block407"  :anon :subid("26_1295186544.79502") :outer("24_1295186544.79502")
.annotate 'line', 510
    new $P409, "Undef"
    .lex "$nskey", $P409
    find_lex $P410, "$sub"
    $P411 = $P410."namespace"()
    find_lex $P412, "%context"
    $P413 = $P411."to_pmc"($P412)
    set $P414, $P413[0]
    unless_null $P414, vivify_115
    new $P414, "Undef"
  vivify_115:
    store_lex "$nskey", $P414
.annotate 'line', 511
    find_lex $P417, "$nskey"
    typeof $S418, $P417
    iseq $I419, $S418, "Key"
    if $I419, if_416
    new $P415, 'Integer'
    set $P415, $I419
    goto if_416_end
  if_416:
.annotate 'line', 512
    find_lex $P420, "$nskey"
    find_lex $P421, "%sub"
    unless_null $P421, vivify_116
    $P421 = root_new ['parrot';'Hash']
    store_lex "%sub", $P421
  vivify_116:
    set $P421["namespace_name"], $P420
.annotate 'line', 511
    set $P415, $P420
  if_416_end:
.annotate 'line', 509
    .return ($P415)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("27_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Op"],_)
    .param pmc param_509
    .param pmc param_510
.annotate 'line', 549
    .const 'Sub' $P573 = "29_1295186544.79502" 
    capture_lex $P573
    .const 'Sub' $P528 = "28_1295186544.79502" 
    capture_lex $P528
    new $P508, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P508, control_507
    push_eh $P508
    .lex "self", self
    .lex "$op", param_509
    .lex "%context", param_510
.annotate 'line', 551
    new $P511, "Undef"
    .lex "$fullname", $P511
.annotate 'line', 566
    $P512 = root_new ['parrot';'ResizablePMCArray']
    .lex "@op", $P512
.annotate 'line', 551
    find_lex $P513, "$op"
    $P514 = $P513."pirop"()
    store_lex "$fullname", $P514
.annotate 'line', 552
    find_lex $P516, "%context"
    unless_null $P516, vivify_146
    $P516 = root_new ['parrot';'Hash']
  vivify_146:
    set $P517, $P516["DEBUG"]
    unless_null $P517, vivify_147
    new $P517, "Undef"
  vivify_147:
    unless $P517, if_515_end
    find_lex $P518, "self"
    new $P519, 'String'
    set $P519, "Short name "
    find_lex $P520, "$fullname"
    concat $P521, $P519, $P520
    $P518."debug"($P521)
  if_515_end:
.annotate 'line', 554
    find_lex $P523, "$op"
    $P524 = $P523."list"()
    defined $I525, $P524
    unless $I525, for_undef_148
    iter $P522, $P524
    new $P549, 'ExceptionHandler'
    set_addr $P549, loop548_handler
    $P549."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P549
  loop548_test:
    unless $P522, loop548_done
    shift $P526, $P522
  loop548_redo:
    .const 'Sub' $P528 = "28_1295186544.79502" 
    capture_lex $P528
    $P528($P526)
  loop548_next:
    goto loop548_test
  loop548_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P550, exception, 'type'
    eq $P550, .CONTROL_LOOP_NEXT, loop548_next
    eq $P550, .CONTROL_LOOP_REDO, loop548_redo
  loop548_done:
    pop_eh 
  for_undef_148:
.annotate 'line', 559
    find_lex $P552, "%context"
    unless_null $P552, vivify_149
    $P552 = root_new ['parrot';'Hash']
  vivify_149:
    set $P553, $P552["DEBUG"]
    unless_null $P553, vivify_150
    new $P553, "Undef"
  vivify_150:
    unless $P553, if_551_end
    find_lex $P554, "self"
    new $P555, 'String'
    set $P555, "Fullname "
    find_lex $P556, "$fullname"
    concat $P557, $P555, $P556
    $P554."debug"($P557)
  if_551_end:
.annotate 'line', 562
    find_lex $P558, "%context"
    unless_null $P558, vivify_151
    $P558 = root_new ['parrot';'Hash']
  vivify_151:
    set $P559, $P558["bytecode"]
    unless_null $P559, vivify_152
    new $P559, "Undef"
  vivify_152:
    set $N560, $P559
    new $P561, 'Float'
    set $P561, $N560
    find_lex $P562, "%context"
    unless_null $P562, vivify_153
    $P562 = root_new ['parrot';'Hash']
    store_lex "%context", $P562
  vivify_153:
    set $P562["opcode_offset"], $P561
.annotate 'line', 564
    find_lex $P563, "$fullname"
    find_lex $P564, "%context"
    unless_null $P564, vivify_154
    $P564 = root_new ['parrot';'Hash']
    store_lex "%context", $P564
  vivify_154:
    set $P564["opcode_fullname"], $P563
.annotate 'line', 566
    find_lex $P565, "$fullname"
    $P566 = "list"($P565)
    store_lex "@op", $P566
.annotate 'line', 567
    find_lex $P568, "$op"
    $P569 = $P568."list"()
    defined $I570, $P569
    unless $I570, for_undef_155
    iter $P567, $P569
    new $P582, 'ExceptionHandler'
    set_addr $P582, loop581_handler
    $P582."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P582
  loop581_test:
    unless $P567, loop581_done
    shift $P571, $P567
  loop581_redo:
    .const 'Sub' $P573 = "29_1295186544.79502" 
    capture_lex $P573
    $P573($P571)
  loop581_next:
    goto loop581_test
  loop581_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P583, exception, 'type'
    eq $P583, .CONTROL_LOOP_NEXT, loop581_next
    eq $P583, .CONTROL_LOOP_REDO, loop581_redo
  loop581_done:
    pop_eh 
  for_undef_155:
.annotate 'line', 570
    find_lex $P585, "%context"
    unless_null $P585, vivify_156
    $P585 = root_new ['parrot';'Hash']
  vivify_156:
    set $P586, $P585["DEBUG"]
    unless_null $P586, vivify_157
    new $P586, "Undef"
  vivify_157:
    unless $P586, if_584_end
    find_lex $P587, "self"
    new $P588, 'String'
    set $P588, "Op size "
    find_lex $P589, "@op"
    set $N590, $P589
    set $S591, $N590
    concat $P592, $P588, $S591
    $P587."debug"($P592)
  if_584_end:
.annotate 'line', 571
    find_lex $P593, "%context"
    unless_null $P593, vivify_158
    $P593 = root_new ['parrot';'Hash']
  vivify_158:
    set $P594, $P593["bytecode"]
    unless_null $P594, vivify_159
    new $P594, "Undef"
  vivify_159:
    find_lex $P595, "@op"
    $P596 = $P594."push"($P595)
.annotate 'line', 549
    .return ($P596)
  control_507:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P597, exception, "payload"
    .return ($P597)
.end


.namespace ["POST";"Compiler"]
.sub "_block527"  :anon :subid("28_1295186544.79502") :outer("27_1295186544.79502")
    .param pmc param_530
.annotate 'line', 555
    new $P529, "Undef"
    .lex "$type", $P529
    .lex "$_", param_530
    find_lex $P533, "$_"
    $P534 = $P533."type"()
    unless $P534, unless_532
    set $P531, $P534
    goto unless_532_end
  unless_532:
    find_lex $P535, "self"
    find_lex $P536, "$_"
    $P537 = $P536."name"()
    find_lex $P538, "%context"
    $P539 = $P535."get_register"($P537, $P538)
    $P540 = $P539."type"()
    set $P531, $P540
  unless_532_end:
    store_lex "$type", $P531
.annotate 'line', 556
    find_lex $P541, "$fullname"
    set $S542, $P541
    new $P543, 'String'
    set $P543, $S542
    concat $P544, $P543, "_"
    find_lex $P545, "$type"
    set $S546, $P545
    concat $P547, $P544, $S546
    store_lex "$fullname", $P547
.annotate 'line', 554
    .return ($P547)
.end


.namespace ["POST";"Compiler"]
.sub "_block572"  :anon :subid("29_1295186544.79502") :outer("27_1295186544.79502")
    .param pmc param_574
.annotate 'line', 567
    .lex "$_", param_574
.annotate 'line', 568
    find_lex $P575, "@op"
    find_lex $P576, "self"
    find_lex $P577, "$_"
    find_lex $P578, "%context"
    $P579 = $P576."to_op"($P577, $P578)
    $P580 = $P575."push"($P579)
.annotate 'line', 567
    .return ($P580)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Node"],_)
    .param pmc param_601
    .param pmc param_602
.annotate 'line', 575
    .const 'Sub' $P609 = "31_1295186544.79502" 
    capture_lex $P609
    new $P600, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P600, control_599
    push_eh $P600
    .lex "self", self
    .lex "$node", param_601
    .lex "%context", param_602
.annotate 'line', 576
    find_lex $P604, "$node"
    $P605 = $P604."list"()
    defined $I606, $P605
    unless $I606, for_undef_160
    iter $P603, $P605
    new $P616, 'ExceptionHandler'
    set_addr $P616, loop615_handler
    $P616."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P616
  loop615_test:
    unless $P603, loop615_done
    shift $P607, $P603
  loop615_redo:
    .const 'Sub' $P609 = "31_1295186544.79502" 
    capture_lex $P609
    $P609($P607)
  loop615_next:
    goto loop615_test
  loop615_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P617, exception, 'type'
    eq $P617, .CONTROL_LOOP_NEXT, loop615_next
    eq $P617, .CONTROL_LOOP_REDO, loop615_redo
  loop615_done:
    pop_eh 
  for_undef_160:
.annotate 'line', 575
    .return ($P603)
  control_599:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P618, exception, "payload"
    .return ($P618)
.end


.namespace ["POST";"Compiler"]
.sub "_block608"  :anon :subid("31_1295186544.79502") :outer("30_1295186544.79502")
    .param pmc param_610
.annotate 'line', 576
    .lex "$_", param_610
.annotate 'line', 577
    find_lex $P611, "self"
    find_lex $P612, "$_"
    find_lex $P613, "%context"
    $P614 = $P611."to_pbc"($P612, $P613)
.annotate 'line', 576
    .return ($P614)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("32_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Label"],_)
    .param pmc param_622
    .param pmc param_623
.annotate 'line', 581
    .const 'Sub' $P655 = "33_1295186544.79502" 
    capture_lex $P655
    new $P621, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P621, control_620
    push_eh $P621
    .lex "self", self
    .lex "$l", param_622
    .lex "%context", param_623
.annotate 'line', 582
    new $P624, "Undef"
    .lex "$bc", $P624
.annotate 'line', 585
    new $P625, "Undef"
    .lex "$pos", $P625
.annotate 'line', 582
    find_lex $P626, "%context"
    unless_null $P626, vivify_161
    $P626 = root_new ['parrot';'Hash']
  vivify_161:
    set $P627, $P626["bytecode"]
    unless_null $P627, vivify_162
    new $P627, "Undef"
  vivify_162:
    store_lex "$bc", $P627
.annotate 'line', 583
    find_lex $P629, "$l"
    $P630 = $P629."declared"()
    if $P630, unless_628_end
    find_lex $P631, "self"
    $P631."panic"("Trying to emit undelcared label!")
  unless_628_end:
.annotate 'line', 585
    find_lex $P632, "$bc"
    set $N633, $P632
    new $P634, 'Float'
    set $P634, $N633
    store_lex "$pos", $P634
.annotate 'line', 586
    find_lex $P636, "%context"
    unless_null $P636, vivify_163
    $P636 = root_new ['parrot';'Hash']
  vivify_163:
    set $P637, $P636["DEBUG"]
    unless_null $P637, vivify_164
    new $P637, "Undef"
  vivify_164:
    unless $P637, if_635_end
    find_lex $P638, "self"
    new $P639, 'String'
    set $P639, "Declare label '"
    find_lex $P640, "$l"
    $P641 = $P640."name"()
    set $S642, $P641
    concat $P643, $P639, $S642
    concat $P644, $P643, "' at "
    find_lex $P645, "$pos"
    concat $P646, $P644, $P645
    $P638."debug"($P646)
  if_635_end:
.annotate 'line', 588
    find_lex $P647, "$l"
    find_lex $P648, "$pos"
    $P647."position"($P648)
.annotate 'line', 590
    find_lex $P650, "$l"
    $P651 = $P650."list"()
    defined $I652, $P651
    unless $I652, for_undef_165
    iter $P649, $P651
    new $P662, 'ExceptionHandler'
    set_addr $P662, loop661_handler
    $P662."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P662
  loop661_test:
    unless $P649, loop661_done
    shift $P653, $P649
  loop661_redo:
    .const 'Sub' $P655 = "33_1295186544.79502" 
    capture_lex $P655
    $P655($P653)
  loop661_next:
    goto loop661_test
  loop661_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P663, exception, 'type'
    eq $P663, .CONTROL_LOOP_NEXT, loop661_next
    eq $P663, .CONTROL_LOOP_REDO, loop661_redo
  loop661_done:
    pop_eh 
  for_undef_165:
.annotate 'line', 581
    .return ($P649)
  control_620:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P664, exception, "payload"
    .return ($P664)
.end


.namespace ["POST";"Compiler"]
.sub "_block654"  :anon :subid("33_1295186544.79502") :outer("32_1295186544.79502")
    .param pmc param_656
.annotate 'line', 590
    .lex "$_", param_656
.annotate 'line', 591
    find_lex $P657, "self"
    find_lex $P658, "$_"
    find_lex $P659, "%context"
    $P660 = $P657."to_pbc"($P658, $P659)
.annotate 'line', 590
    .return ($P660)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("34_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Call"],_)
    .param pmc param_668
    .param pmc param_669
.annotate 'line', 595
    .const 'Sub' $P734 = "35_1295186544.79502" 
    capture_lex $P734
    new $P667, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P667, control_666
    push_eh $P667
    .lex "self", self
    .lex "$call", param_668
    .lex "%context", param_669
.annotate 'line', 596
    new $P670, "Undef"
    .lex "$bc", $P670
.annotate 'line', 597
    new $P671, "Undef"
    .lex "$calltype", $P671
.annotate 'line', 598
    new $P672, "Undef"
    .lex "$is_tailcall", $P672
.annotate 'line', 596
    find_lex $P673, "%context"
    unless_null $P673, vivify_166
    $P673 = root_new ['parrot';'Hash']
  vivify_166:
    set $P674, $P673["bytecode"]
    unless_null $P674, vivify_167
    new $P674, "Undef"
  vivify_167:
    store_lex "$bc", $P674
.annotate 'line', 597
    find_lex $P675, "$call"
    $P676 = $P675."calltype"()
    store_lex "$calltype", $P676
.annotate 'line', 598
    find_lex $P677, "$calltype"
    set $S678, $P677
    iseq $I679, $S678, "tailcall"
    new $P680, 'Integer'
    set $P680, $I679
    store_lex "$is_tailcall", $P680
.annotate 'line', 600
    find_lex $P685, "$calltype"
    set $S686, $P685
    iseq $I687, $S686, "call"
    unless $I687, unless_684
    new $P683, 'Integer'
    set $P683, $I687
    goto unless_684_end
  unless_684:
    find_lex $P688, "$calltype"
    set $S689, $P688
    iseq $I690, $S689, "tailcall"
    new $P683, 'Integer'
    set $P683, $I690
  unless_684_end:
    if $P683, if_682
.annotate 'line', 678
    find_lex $P874, "$calltype"
    set $S875, $P874
    iseq $I876, $S875, "return"
    if $I876, if_873
.annotate 'line', 682
    find_lex $P886, "$calltype"
    set $S887, $P886
    iseq $I888, $S887, "results"
    if $I888, if_885
.annotate 'line', 687
    find_lex $P894, "self"
    new $P895, 'String'
    set $P895, "NYI "
    find_lex $P896, "$calltype"
    set $S897, $P896
    concat $P898, $P895, $S897
    $P899 = $P894."panic"($P898)
.annotate 'line', 686
    set $P884, $P899
.annotate 'line', 682
    goto if_885_end
  if_885:
.annotate 'line', 684
    find_lex $P889, "self"
    find_lex $P890, "$call"
    unless_null $P890, vivify_168
    $P890 = root_new ['parrot';'Hash']
  vivify_168:
    set $P891, $P890["params"]
    unless_null $P891, vivify_169
    new $P891, "Undef"
  vivify_169:
    find_lex $P892, "%context"
    $P893 = $P889."build_pcc_call"("get_results_pc", $P891, $P892)
.annotate 'line', 682
    set $P884, $P893
  if_885_end:
    set $P872, $P884
.annotate 'line', 678
    goto if_873_end
  if_873:
.annotate 'line', 679
    find_lex $P877, "self"
    find_lex $P878, "$call"
    unless_null $P878, vivify_170
    $P878 = root_new ['parrot';'Hash']
  vivify_170:
    set $P879, $P878["params"]
    unless_null $P879, vivify_171
    new $P879, "Undef"
  vivify_171:
    find_lex $P880, "%context"
    $P877."build_pcc_call"("set_returns_pc", $P879, $P880)
.annotate 'line', 680
    find_lex $P881, "$bc"
    new $P882, "ResizablePMCArray"
    push $P882, "returncc"
    $P883 = $P881."push"($P882)
.annotate 'line', 678
    set $P872, $P883
  if_873_end:
    set $P681, $P872
.annotate 'line', 600
    goto if_682_end
  if_682:
.annotate 'line', 601
    find_lex $P692, "$call"
    $P693 = $P692."invocant"()
    unless $P693, if_691_end
.annotate 'line', 602
    find_lex $P695, "$call"
    unless_null $P695, vivify_172
    $P695 = root_new ['parrot';'Hash']
  vivify_172:
    set $P696, $P695["params"]
    unless_null $P696, vivify_173
    new $P696, "Undef"
  vivify_173:
    if $P696, unless_694_end
    $P697 = "list"()
    find_lex $P698, "$call"
    unless_null $P698, vivify_174
    $P698 = root_new ['parrot';'Hash']
    store_lex "$call", $P698
  vivify_174:
    set $P698["params"], $P697
  unless_694_end:
.annotate 'line', 603
    find_lex $P699, "$call"
    unless_null $P699, vivify_175
    $P699 = root_new ['parrot';'Hash']
  vivify_175:
    set $P700, $P699["params"]
    unless_null $P700, vivify_176
    new $P700, "Undef"
  vivify_176:
    find_lex $P701, "$call"
    $P702 = $P701."invocant"()
    $P700."unshift"($P702)
  if_691_end:
.annotate 'line', 606
    find_lex $P703, "self"
    find_lex $P704, "$call"
    unless_null $P704, vivify_177
    $P704 = root_new ['parrot';'Hash']
  vivify_177:
    set $P705, $P704["params"]
    unless_null $P705, vivify_178
    new $P705, "Undef"
  vivify_178:
    find_lex $P706, "%context"
    $P703."build_pcc_call"("set_args_pc", $P705, $P706)
.annotate 'line', 608
    find_lex $P708, "$call"
    $P709 = $P708."invocant"()
    if $P709, if_707
.annotate 'line', 622
    .const 'Sub' $P734 = "35_1295186544.79502" 
    capture_lex $P734
    $P734()
    goto if_707_end
  if_707:
.annotate 'line', 609
    find_lex $P711, "$call"
    $P712 = $P711."name"()
    get_hll_global $P713, ["POST"], "Constant"
    $P714 = $P712."isa"($P713)
    if $P714, if_710
.annotate 'line', 619
    find_lex $P732, "self"
    $P732."panic"("NYI $P0.$S0()")
.annotate 'line', 618
    goto if_710_end
  if_710:
.annotate 'line', 610
    find_lex $P715, "$bc"
.annotate 'line', 612
    find_lex $P718, "$is_tailcall"
    if $P718, if_717
    new $P720, "String"
    assign $P720, "callmethodcc_p_sc"
    set $P716, $P720
    goto if_717_end
  if_717:
    new $P719, "String"
    assign $P719, "tailcallmethod_p_sc"
    set $P716, $P719
  if_717_end:
.annotate 'line', 614
    find_lex $P721, "self"
    find_lex $P722, "$call"
    $P723 = $P722."invocant"()
    find_lex $P724, "%context"
    $P725 = $P721."to_op"($P723, $P724)
.annotate 'line', 615
    find_lex $P726, "self"
    find_lex $P727, "$call"
    $P728 = $P727."name"()
    find_lex $P729, "%context"
    $P730 = $P726."to_op"($P728, $P729)
    new $P731, "ResizablePMCArray"
    push $P731, $P716
    push $P731, $P725
    push $P731, $P730
    $P715."push"($P731)
  if_710_end:
  if_707_end:
.annotate 'line', 674
    find_lex $P866, "$is_tailcall"
    unless $P866, unless_865
    set $P864, $P866
    goto unless_865_end
  unless_865:
.annotate 'line', 675
    find_lex $P867, "self"
    find_lex $P868, "$call"
    unless_null $P868, vivify_208
    $P868 = root_new ['parrot';'Hash']
  vivify_208:
    set $P869, $P868["results"]
    unless_null $P869, vivify_209
    new $P869, "Undef"
  vivify_209:
    find_lex $P870, "%context"
    $P871 = $P867."build_pcc_call"("get_results_pc", $P869, $P870)
.annotate 'line', 674
    set $P864, $P871
  unless_865_end:
.annotate 'line', 600
    set $P681, $P864
  if_682_end:
.annotate 'line', 595
    .return ($P681)
  control_666:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P900, exception, "payload"
    .return ($P900)
.end


.namespace ["POST";"Compiler"]
.sub "_block733"  :anon :subid("35_1295186544.79502") :outer("34_1295186544.79502")
.annotate 'line', 622
    .const 'Sub' $P746 = "36_1295186544.79502" 
    capture_lex $P746
.annotate 'line', 623
    new $P735, "Undef"
    .lex "$SUB", $P735
.annotate 'line', 624
    new $P736, "Undef"
    .lex "$processed", $P736
.annotate 'line', 668
    new $P737, "Undef"
    .lex "$o", $P737
.annotate 'line', 622
    find_lex $P738, "$SUB"
.annotate 'line', 624
    new $P739, "Integer"
    assign $P739, 0
    store_lex "$processed", $P739
.annotate 'line', 625
    find_lex $P741, "$call"
    $P742 = $P741."name"()
    get_hll_global $P743, ["POST"], "Constant"
    $P744 = $P742."isa"($P743)
    unless $P744, if_740_end
    .const 'Sub' $P746 = "36_1295186544.79502" 
    capture_lex $P746
    $P746()
  if_740_end:
.annotate 'line', 653
    find_lex $P815, "$processed"
    if $P815, unless_814_end
.annotate 'line', 654
    find_lex $P817, "$call"
    $P818 = $P817."name"()
    get_hll_global $P819, ["POST"], "Constant"
    $P820 = $P818."isa"($P819)
    if $P820, if_816
.annotate 'line', 663
    find_lex $P836, "%context"
    unless_null $P836, vivify_196
    $P836 = root_new ['parrot';'Hash']
  vivify_196:
    set $P837, $P836["DEBUG"]
    unless_null $P837, vivify_197
    new $P837, "Undef"
  vivify_197:
    unless $P837, if_835_end
    find_lex $P838, "self"
    new $P839, "String"
    assign $P839, "Name is "
    find_lex $P840, "$call"
    unless_null $P840, vivify_198
    $P840 = root_new ['parrot';'Hash']
  vivify_198:
    set $P841, $P840["name"]
    unless_null $P841, vivify_199
    new $P841, "Undef"
  vivify_199:
    $S842 = $P841."WHAT"()
    concat $P843, $P839, $S842
    $P838."debug"($P843)
  if_835_end:
.annotate 'line', 664
    find_lex $P844, "$call"
    unless_null $P844, vivify_200
    $P844 = root_new ['parrot';'Hash']
  vivify_200:
    set $P845, $P844["name"]
    unless_null $P845, vivify_201
    new $P845, "Undef"
  vivify_201:
    store_lex "$SUB", $P845
.annotate 'line', 662
    goto if_816_end
  if_816:
.annotate 'line', 655
    find_lex $P821, "%context"
    unless_null $P821, vivify_202
    $P821 = root_new ['parrot';'Hash']
  vivify_202:
    set $P822, $P821["sub"]
    unless_null $P822, vivify_203
    new $P822, "Undef"
  vivify_203:
    $P823 = $P822."symbol"("!SUB")
    store_lex "$SUB", $P823
.annotate 'line', 656
    find_lex $P824, "$bc"
.annotate 'line', 658
    find_lex $P825, "self"
    find_lex $P826, "$SUB"
    find_lex $P827, "%context"
    $P828 = $P825."to_op"($P826, $P827)
.annotate 'line', 659
    find_lex $P829, "self"
    find_lex $P830, "$call"
    unless_null $P830, vivify_204
    $P830 = root_new ['parrot';'Hash']
  vivify_204:
    set $P831, $P830["name"]
    unless_null $P831, vivify_205
    new $P831, "Undef"
  vivify_205:
    find_lex $P832, "%context"
    $P833 = $P829."to_op"($P831, $P832)
    new $P834, "ResizablePMCArray"
    push $P834, "find_sub_not_null_p_sc"
    push $P834, $P828
    push $P834, $P833
    $P824."push"($P834)
  if_816_end:
  unless_814_end:
.annotate 'line', 668
    find_lex $P848, "$is_tailcall"
    if $P848, if_847
    new $P850, "String"
    assign $P850, "invokecc_p"
    set $P846, $P850
    goto if_847_end
  if_847:
    new $P849, "String"
    assign $P849, "tailcall_p"
    set $P846, $P849
  if_847_end:
    store_lex "$o", $P846
.annotate 'line', 670
    find_lex $P852, "%context"
    unless_null $P852, vivify_206
    $P852 = root_new ['parrot';'Hash']
  vivify_206:
    set $P853, $P852["DEBUG"]
    unless_null $P853, vivify_207
    new $P853, "Undef"
  vivify_207:
    unless $P853, if_851_end
    find_lex $P854, "self"
    find_lex $P855, "$o"
    $P854."debug"($P855)
  if_851_end:
.annotate 'line', 671
    find_lex $P856, "$bc"
    find_lex $P857, "$o"
    find_lex $P858, "self"
    find_lex $P859, "$SUB"
    find_lex $P860, "%context"
    $P861 = $P858."to_op"($P859, $P860)
    new $P862, "ResizablePMCArray"
    push $P862, $P857
    push $P862, $P861
    $P863 = $P856."push"($P862)
.annotate 'line', 622
    .return ($P863)
.end


.namespace ["POST";"Compiler"]
.sub "_block745"  :anon :subid("36_1295186544.79502") :outer("35_1295186544.79502")
.annotate 'line', 625
    .const 'Sub' $P782 = "37_1295186544.79502" 
    capture_lex $P782
.annotate 'line', 628
    new $P747, "Undef"
    .lex "$full_name", $P747
.annotate 'line', 631
    new $P748, "Undef"
    .lex "$invocable_sub", $P748
.annotate 'line', 625
    find_lex $P749, "$full_name"
.annotate 'line', 629
    find_lex $P751, "%context"
    unless_null $P751, vivify_179
    $P751 = root_new ['parrot';'Hash']
  vivify_179:
    set $P752, $P751["sub"]
    unless_null $P752, vivify_180
    new $P752, "Undef"
  vivify_180:
    $P753 = $P752."namespace"()
    unless $P753, if_750_end
    find_lex $P754, "%context"
    unless_null $P754, vivify_181
    $P754 = root_new ['parrot';'Hash']
  vivify_181:
    set $P755, $P754["sub"]
    unless_null $P755, vivify_182
    new $P755, "Undef"
  vivify_182:
    $P756 = $P755."namespace"()
    $P757 = $P756."Str"()
    store_lex "$full_name", $P757
  if_750_end:
.annotate 'line', 630
    find_lex $P758, "$full_name"
    set $S759, $P758
    new $P760, 'String'
    set $P760, $S759
    find_lex $P761, "$call"
    unless_null $P761, vivify_183
    $P761 = root_new ['parrot';'Hash']
  vivify_183:
    set $P762, $P761["name"]
    unless_null $P762, vivify_184
    $P762 = root_new ['parrot';'Hash']
  vivify_184:
    set $P763, $P762["value"]
    unless_null $P763, vivify_185
    new $P763, "Undef"
  vivify_185:
    set $S764, $P763
    concat $P765, $P760, $S764
    store_lex "$full_name", $P765
.annotate 'line', 631
    find_lex $P766, "%context"
    unless_null $P766, vivify_186
    $P766 = root_new ['parrot';'Hash']
  vivify_186:
    set $P767, $P766["pir_file"]
    unless_null $P767, vivify_187
    new $P767, "Undef"
  vivify_187:
    find_lex $P768, "$full_name"
    $P769 = $P767."sub"($P768)
    store_lex "$invocable_sub", $P769
.annotate 'line', 632
    find_lex $P771, "%context"
    unless_null $P771, vivify_188
    $P771 = root_new ['parrot';'Hash']
  vivify_188:
    set $P772, $P771["DEBUG"]
    unless_null $P772, vivify_189
    new $P772, "Undef"
  vivify_189:
    unless $P772, if_770_end
    find_lex $P773, "self"
    new $P774, 'String'
    set $P774, "invocable_sub '"
    find_lex $P775, "$full_name"
    concat $P776, $P774, $P775
    concat $P777, $P776, "'"
    $P773."debug"($P777)
  if_770_end:
.annotate 'line', 633
    find_lex $P780, "$invocable_sub"
    if $P780, if_779
    set $P778, $P780
    goto if_779_end
  if_779:
    .const 'Sub' $P782 = "37_1295186544.79502" 
    capture_lex $P782
    $P813 = $P782()
    set $P778, $P813
  if_779_end:
.annotate 'line', 625
    .return ($P778)
.end


.namespace ["POST";"Compiler"]
.sub "_block781"  :anon :subid("37_1295186544.79502") :outer("36_1295186544.79502")
.annotate 'line', 634
    new $P783, "Undef"
    .lex "$idx", $P783
    find_lex $P784, "$invocable_sub"
    $P785 = $P784."constant_index"()
    store_lex "$idx", $P785
.annotate 'line', 635
    find_lex $P787, "$idx"
    $P788 = "defined"($P787)
    if $P788, unless_786_end
.annotate 'line', 637
    find_lex $P789, "%context"
    unless_null $P789, vivify_190
    $P789 = root_new ['parrot';'Hash']
  vivify_190:
    set $P790, $P789["constants"]
    unless_null $P790, vivify_191
    new $P790, "Undef"
  vivify_191:
    $P791 = "new"("Integer")
    $P792 = $P790."push"($P791)
    store_lex "$idx", $P792
.annotate 'line', 638
    find_lex $P793, "$invocable_sub"
    find_lex $P794, "$idx"
    $P793."constant_index"($P794)
.annotate 'line', 639
    find_lex $P796, "%context"
    unless_null $P796, vivify_192
    $P796 = root_new ['parrot';'Hash']
  vivify_192:
    set $P797, $P796["DEBUG"]
    unless_null $P797, vivify_193
    new $P797, "Undef"
  vivify_193:
    unless $P797, if_795_end
    find_lex $P798, "self"
    new $P799, 'String'
    set $P799, "Allocate constant for it "
    find_lex $P800, "$idx"
    concat $P801, $P799, $P800
    $P798."debug"($P801)
  if_795_end:
  unless_786_end:
.annotate 'line', 642
    find_lex $P802, "%context"
    unless_null $P802, vivify_194
    $P802 = root_new ['parrot';'Hash']
  vivify_194:
    set $P803, $P802["sub"]
    unless_null $P803, vivify_195
    new $P803, "Undef"
  vivify_195:
    $P804 = $P803."symbol"("!SUB")
    store_lex "$SUB", $P804
.annotate 'line', 643
    find_lex $P805, "$bc"
.annotate 'line', 645
    find_lex $P806, "self"
    find_lex $P807, "$SUB"
    find_lex $P808, "%context"
    $P809 = $P806."to_op"($P807, $P808)
    find_lex $P810, "$idx"
    new $P811, "ResizablePMCArray"
    push $P811, "set_p_pc"
    push $P811, $P809
    push $P811, $P810
.annotate 'line', 646
    $P805."push"($P811)
.annotate 'line', 649
    new $P812, "Integer"
    assign $P812, 1
    store_lex "$processed", $P812
.annotate 'line', 633
    .return ($P812)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Key"],_)
    .param pmc param_904
    .param pmc param_905
.annotate 'line', 694
    new $P903, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P903, control_902
    push_eh $P903
    .lex "self", self
    .lex "$key", param_904
    .lex "%context", param_905
.annotate 'line', 697
    new $P906, "Undef"
    .lex "$key_pmc", $P906
.annotate 'line', 703
    new $P907, "Undef"
    .lex "$constants", $P907
.annotate 'line', 704
    new $P908, "Undef"
    .lex "$idx", $P908
.annotate 'line', 696
    find_lex $P910, "%context"
    unless_null $P910, vivify_210
    $P910 = root_new ['parrot';'Hash']
  vivify_210:
    set $P911, $P910["DEBUG"]
    unless_null $P911, vivify_211
    new $P911, "Undef"
  vivify_211:
    unless $P911, if_909_end
    find_lex $P912, "self"
    $P912."debug"("Want key")
  if_909_end:
.annotate 'line', 697
    find_lex $P913, "$key"
    find_lex $P914, "%context"
    $P915 = $P913."to_pmc"($P914)
    set $P916, $P915[0]
    unless_null $P916, vivify_212
    new $P916, "Undef"
  vivify_212:
    store_lex "$key_pmc", $P916
.annotate 'line', 698
    find_lex $P918, "%context"
    unless_null $P918, vivify_213
    $P918 = root_new ['parrot';'Hash']
  vivify_213:
    set $P919, $P918["DEBUG"]
    unless_null $P919, vivify_214
    new $P919, "Undef"
  vivify_214:
    unless $P919, if_917_end
    find_lex $P920, "self"
    $P920."debug"("Got key")
  if_917_end:
.annotate 'line', 703
    find_lex $P921, "%context"
    unless_null $P921, vivify_215
    $P921 = root_new ['parrot';'Hash']
  vivify_215:
    set $P922, $P921["constants"]
    unless_null $P922, vivify_216
    new $P922, "Undef"
  vivify_216:
    store_lex "$constants", $P922
    find_lex $P923, "$idx"
.annotate 'line', 705

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
    find_lex $P924, "$idx"
.annotate 'line', 694
    .return ($P924)
  control_902:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P925, exception, "payload"
    .return ($P925)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("39_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Constant"],_)
    .param pmc param_929
    .param pmc param_930
.annotate 'line', 721
    new $P928, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P928, control_927
    push_eh $P928
    .lex "self", self
    .lex "$op", param_929
    .lex "%context", param_930
.annotate 'line', 722
    new $P931, "Undef"
    .lex "$idx", $P931
.annotate 'line', 723
    new $P932, "Undef"
    .lex "$type", $P932
.annotate 'line', 721
    find_lex $P933, "$idx"
.annotate 'line', 723
    find_lex $P934, "$op"
    $P935 = $P934."type"()
    store_lex "$type", $P935
.annotate 'line', 724
    find_lex $P939, "$type"
    set $S940, $P939
    iseq $I941, $S940, "ic"
    unless $I941, unless_938
    new $P937, 'Integer'
    set $P937, $I941
    goto unless_938_end
  unless_938:
    find_lex $P942, "$type"
    set $S943, $P942
    iseq $I944, $S943, "kic"
    new $P937, 'Integer'
    set $P937, $I944
  unless_938_end:
    if $P937, if_936
.annotate 'line', 727
    find_lex $P948, "$type"
    set $S949, $P948
    iseq $I950, $S949, "nc"
    if $I950, if_947
.annotate 'line', 731
    find_lex $P956, "self"
    $P956."panic"("NYI")
.annotate 'line', 730
    goto if_947_end
  if_947:
.annotate 'line', 728
    find_lex $P951, "%context"
    unless_null $P951, vivify_217
    $P951 = root_new ['parrot';'Hash']
  vivify_217:
    set $P952, $P951["constants"]
    unless_null $P952, vivify_218
    new $P952, "Undef"
  vivify_218:
    find_lex $P953, "$op"
    $P954 = $P953."value"()
    $P955 = $P952."get_or_create_number"($P954)
    store_lex "$idx", $P955
  if_947_end:
.annotate 'line', 727
    goto if_936_end
  if_936:
.annotate 'line', 725
    find_lex $P945, "$op"
    $P946 = $P945."value"()
    store_lex "$idx", $P946
  if_936_end:
.annotate 'line', 734
    find_lex $P958, "%context"
    unless_null $P958, vivify_219
    $P958 = root_new ['parrot';'Hash']
  vivify_219:
    set $P959, $P958["DEBUG"]
    unless_null $P959, vivify_220
    new $P959, "Undef"
  vivify_220:
    unless $P959, if_957_end
    find_lex $P960, "self"
    new $P961, 'String'
    set $P961, "Index "
    find_lex $P962, "$idx"
    concat $P963, $P961, $P962
    $P960."debug"($P963)
  if_957_end:
    find_lex $P964, "$idx"
.annotate 'line', 721
    .return ($P964)
  control_927:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P965, exception, "payload"
    .return ($P965)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"String"],_)
    .param pmc param_969
    .param pmc param_970
.annotate 'line', 738
    .const 'Sub' $P996 = "41_1295186544.79502" 
    capture_lex $P996
    new $P968, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P968, control_967
    push_eh $P968
    .lex "self", self
    .lex "$str", param_969
    .lex "%context", param_970
.annotate 'line', 739
    new $P971, "Undef"
    .lex "$idx", $P971
.annotate 'line', 740
    new $P972, "Undef"
    .lex "$type", $P972
.annotate 'line', 738
    find_lex $P973, "$idx"
.annotate 'line', 740
    find_lex $P974, "$str"
    $P975 = $P974."type"()
    store_lex "$type", $P975
.annotate 'line', 741
    find_lex $P977, "$type"
    set $S978, $P977
    isne $I979, $S978, "sc"
    unless $I979, if_976_end
.annotate 'line', 742
    find_lex $P980, "self"
    $P980."panic"("attempt to pass a non-sc value off as a string")
  if_976_end:
.annotate 'line', 744
    find_lex $P984, "$str"
    $S985 = $P984."encoding"()
    iseq $I986, $S985, "fixed_8"
    if $I986, if_983
    new $P982, 'Integer'
    set $P982, $I986
    goto if_983_end
  if_983:
    find_lex $P987, "$str"
    $S988 = $P987."charset"()
    iseq $I989, $S988, "ascii"
    new $P982, 'Integer'
    set $P982, $I989
  if_983_end:
    if $P982, if_981
.annotate 'line', 747
    .const 'Sub' $P996 = "41_1295186544.79502" 
    capture_lex $P996
    $P996()
    goto if_981_end
  if_981:
.annotate 'line', 745
    find_lex $P990, "%context"
    unless_null $P990, vivify_223
    $P990 = root_new ['parrot';'Hash']
  vivify_223:
    set $P991, $P990["constants"]
    unless_null $P991, vivify_224
    new $P991, "Undef"
  vivify_224:
    find_lex $P992, "$str"
    $P993 = $P992."value"()
    $P994 = $P991."get_or_create_string"($P993)
    store_lex "$idx", $P994
  if_981_end:
.annotate 'line', 744
    find_lex $P1009, "$idx"
.annotate 'line', 738
    .return ($P1009)
  control_967:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1010, exception, "payload"
    .return ($P1010)
.end


.namespace ["POST";"Compiler"]
.sub "_block995"  :anon :subid("41_1295186544.79502") :outer("40_1295186544.79502")
.annotate 'line', 749
    new $P997, "Undef"
    .lex "$bb", $P997
.annotate 'line', 750
    new $P998, "Undef"
    .lex "$str_val", $P998
.annotate 'line', 749
    $P999 = "new"("ByteBuffer")
    store_lex "$bb", $P999
.annotate 'line', 750
    find_lex $P1000, "$str"
    $P1001 = $P1000."value"()
    store_lex "$str_val", $P1001
.annotate 'line', 751

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 759
    find_lex $P1002, "%context"
    unless_null $P1002, vivify_221
    $P1002 = root_new ['parrot';'Hash']
  vivify_221:
    set $P1003, $P1002["constants"]
    unless_null $P1003, vivify_222
    new $P1003, "Undef"
  vivify_222:
    find_lex $P1004, "$bb"
.annotate 'line', 760
    find_lex $P1005, "$str"
    $P1006 = $P1005."encoding"()
    $P1007 = $P1004."get_string"($P1006)
.annotate 'line', 759
    $P1008 = $P1003."get_or_create_string"($P1007)
    store_lex "$idx", $P1008
.annotate 'line', 747
    .return ($P1008)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("42_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Value"],_)
    .param pmc param_1014
    .param pmc param_1015
.annotate 'line', 767
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$val", param_1014
    .lex "%context", param_1015
.annotate 'line', 769
    new $P1016, "Undef"
    .lex "$orig", $P1016
    find_lex $P1017, "self"
    find_lex $P1018, "$val"
    $P1019 = $P1018."name"()
    find_lex $P1020, "%context"
    $P1021 = $P1017."get_register"($P1019, $P1020)
    store_lex "$orig", $P1021
.annotate 'line', 770
    find_lex $P1022, "self"
    find_lex $P1023, "$orig"
    find_lex $P1024, "%context"
    $P1025 = $P1022."to_op"($P1023, $P1024)
.annotate 'line', 767
    .return ($P1025)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1026, exception, "payload"
    .return ($P1026)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("43_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Register"],_)
    .param pmc param_1030
    .param pmc param_1031
.annotate 'line', 773
    new $P1029, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1029, control_1028
    push_eh $P1029
    .lex "self", self
    .lex "$reg", param_1030
    .lex "%context", param_1031
.annotate 'line', 774
    find_lex $P1032, "$reg"
    $P1033 = $P1032."regno"()
.annotate 'line', 773
    .return ($P1033)
  control_1028:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1034, exception, "payload"
    .return ($P1034)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("44_1295186544.79502") :method :outer("11_1295186544.79502") :multi(_,["POST";"Label"],_)
    .param pmc param_1038
    .param pmc param_1039
.annotate 'line', 777
    new $P1037, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1037, control_1036
    push_eh $P1037
    .lex "self", self
    .lex "$l", param_1038
    .lex "%context", param_1039
.annotate 'line', 779
    new $P1040, "Undef"
    .lex "$bc", $P1040
.annotate 'line', 780
    new $P1041, "Undef"
    .lex "$pos", $P1041
.annotate 'line', 779
    find_lex $P1042, "%context"
    unless_null $P1042, vivify_225
    $P1042 = root_new ['parrot';'Hash']
  vivify_225:
    set $P1043, $P1042["bytecode"]
    unless_null $P1043, vivify_226
    new $P1043, "Undef"
  vivify_226:
    store_lex "$bc", $P1043
.annotate 'line', 780
    find_lex $P1044, "$bc"
    set $N1045, $P1044
    new $P1046, 'Float'
    set $P1046, $N1045
    store_lex "$pos", $P1046
.annotate 'line', 784
    find_lex $P1047, "$l"
    $P1048 = $P1047."name"()
    find_lex $P1049, "%context"
    unless_null $P1049, vivify_227
    $P1049 = root_new ['parrot';'Hash']
  vivify_227:
    set $P1050, $P1049["opcode_offset"]
    unless_null $P1050, vivify_228
    new $P1050, "Undef"
  vivify_228:
    find_lex $P1051, "%context"
    unless_null $P1051, vivify_229
    $P1051 = root_new ['parrot';'Hash']
  vivify_229:
    set $P1052, $P1051["opcode_fullname"]
    unless_null $P1052, vivify_230
    new $P1052, "Undef"
  vivify_230:
    $P1053 = "hash"($P1048 :named("name"), $P1050 :named("offset"), $P1052 :named("opname"))
.annotate 'line', 783
    find_lex $P1054, "$pos"
    find_lex $P1055, "%context"
    unless_null $P1055, vivify_231
    $P1055 = root_new ['parrot';'Hash']
    store_lex "%context", $P1055
  vivify_231:
    set $P1056, $P1055["labels_todo"]
    unless_null $P1056, vivify_232
    $P1056 = root_new ['parrot';'Hash']
    set $P1055["labels_todo"], $P1056
  vivify_232:
    set $P1056[$P1054], $P1053
.annotate 'line', 789
    find_lex $P1058, "%context"
    unless_null $P1058, vivify_233
    $P1058 = root_new ['parrot';'Hash']
  vivify_233:
    set $P1059, $P1058["DEBUG"]
    unless_null $P1059, vivify_234
    new $P1059, "Undef"
  vivify_234:
    unless $P1059, if_1057_end
    find_lex $P1060, "self"
    new $P1061, 'String'
    set $P1061, "Todo label '"
    find_lex $P1062, "$l"
    $P1063 = $P1062."name"()
    set $S1064, $P1063
    concat $P1065, $P1061, $S1064
    concat $P1066, $P1065, "' at "
    find_lex $P1067, "$pos"
    concat $P1068, $P1066, $P1067
    concat $P1069, $P1068, ", "
    find_lex $P1070, "%context"
    unless_null $P1070, vivify_235
    $P1070 = root_new ['parrot';'Hash']
  vivify_235:
    set $P1071, $P1070["opcode_offset"]
    unless_null $P1071, vivify_236
    new $P1071, "Undef"
  vivify_236:
    set $S1072, $P1071
    concat $P1073, $P1069, $S1072
    $P1060."debug"($P1073)
  if_1057_end:
.annotate 'line', 777
    .return (0)
  control_1036:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1074, exception, "payload"
    .return ($P1074)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("45_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1078
    .param pmc param_1079
    .param pmc param_1080
.annotate 'line', 800
    .const 'Sub' $P1115 = "46_1295186544.79502" 
    capture_lex $P1115
    new $P1077, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1077, control_1076
    push_eh $P1077
    .lex "self", self
    .lex "$opname", param_1078
    .lex "@args", param_1079
    .lex "%context", param_1080
.annotate 'line', 801
    new $P1081, "Undef"
    .lex "$bc", $P1081
.annotate 'line', 802
    new $P1082, "Undef"
    .lex "$signature", $P1082
.annotate 'line', 803
    new $P1083, "Undef"
    .lex "$sig_idx", $P1083
.annotate 'line', 810
    $P1084 = root_new ['parrot';'ResizablePMCArray']
    .lex "@op", $P1084
.annotate 'line', 801
    find_lex $P1085, "%context"
    unless_null $P1085, vivify_237
    $P1085 = root_new ['parrot';'Hash']
  vivify_237:
    set $P1086, $P1085["bytecode"]
    unless_null $P1086, vivify_238
    new $P1086, "Undef"
  vivify_238:
    store_lex "$bc", $P1086
.annotate 'line', 802
    find_lex $P1087, "self"
    find_lex $P1088, "@args"
    find_lex $P1089, "%context"
    $P1090 = $P1087."build_args_signature"($P1088, $P1089)
    store_lex "$signature", $P1090
.annotate 'line', 803
    find_lex $P1091, "%context"
    unless_null $P1091, vivify_239
    $P1091 = root_new ['parrot';'Hash']
  vivify_239:
    set $P1092, $P1091["constants"]
    unless_null $P1092, vivify_240
    new $P1092, "Undef"
  vivify_240:
    find_lex $P1093, "$signature"
    $P1094 = $P1092."get_or_create_pmc"($P1093)
    store_lex "$sig_idx", $P1094
.annotate 'line', 805
    find_lex $P1096, "%context"
    unless_null $P1096, vivify_241
    $P1096 = root_new ['parrot';'Hash']
  vivify_241:
    set $P1097, $P1096["DEBUG"]
    unless_null $P1097, vivify_242
    new $P1097, "Undef"
  vivify_242:
    unless $P1097, if_1095_end
    find_lex $P1098, "self"
    new $P1099, 'String'
    set $P1099, "Sig: "
    find_lex $P1100, "$sig_idx"
    concat $P1101, $P1099, $P1100
    $P1098."debug"($P1101)
  if_1095_end:
.annotate 'line', 807
    find_lex $P1103, "%context"
    unless_null $P1103, vivify_243
    $P1103 = root_new ['parrot';'Hash']
  vivify_243:
    set $P1104, $P1103["DEBUG"]
    unless_null $P1104, vivify_244
    new $P1104, "Undef"
  vivify_244:
    unless $P1104, if_1102_end
    find_lex $P1105, "self"
    find_lex $P1106, "$opname"
    $P1105."debug"($P1106)
  if_1102_end:
.annotate 'line', 810
    find_lex $P1107, "$opname"
    find_lex $P1108, "$sig_idx"
    $P1109 = "list"($P1107, $P1108)
    store_lex "@op", $P1109
.annotate 'line', 812
    find_lex $P1111, "@args"
    defined $I1112, $P1111
    unless $I1112, for_undef_245
    iter $P1110, $P1111
    new $P1145, 'ExceptionHandler'
    set_addr $P1145, loop1144_handler
    $P1145."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1145
  loop1144_test:
    unless $P1110, loop1144_done
    shift $P1113, $P1110
  loop1144_redo:
    .const 'Sub' $P1115 = "46_1295186544.79502" 
    capture_lex $P1115
    $P1115($P1113)
  loop1144_next:
    goto loop1144_test
  loop1144_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1146, exception, 'type'
    eq $P1146, .CONTROL_LOOP_NEXT, loop1144_next
    eq $P1146, .CONTROL_LOOP_REDO, loop1144_redo
  loop1144_done:
    pop_eh 
  for_undef_245:
.annotate 'line', 823
    find_lex $P1147, "$bc"
    find_lex $P1148, "@op"
    $P1149 = $P1147."push"($P1148)
.annotate 'line', 800
    .return ($P1149)
  control_1076:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1150, exception, "payload"
    .return ($P1150)
.end


.namespace ["POST";"Compiler"]
.sub "_block1114"  :anon :subid("46_1295186544.79502") :outer("45_1295186544.79502")
    .param pmc param_1116
.annotate 'line', 812
    .const 'Sub' $P1122 = "47_1295186544.79502" 
    capture_lex $P1122
    .lex "$arg", param_1116
.annotate 'line', 814
    find_lex $P1118, "$arg"
    $P1119 = $P1118."modifier"()
    isa $I1120, $P1119, "Hash"
    unless $I1120, if_1117_end
    .const 'Sub' $P1122 = "47_1295186544.79502" 
    capture_lex $P1122
    $P1122()
  if_1117_end:
.annotate 'line', 820
    find_lex $P1138, "@op"
    find_lex $P1139, "self"
    find_lex $P1140, "$arg"
    find_lex $P1141, "%context"
    $P1142 = $P1139."to_op"($P1140, $P1141)
    $P1143 = $P1138."push"($P1142)
.annotate 'line', 812
    .return ($P1143)
.end


.namespace ["POST";"Compiler"]
.sub "_block1121"  :anon :subid("47_1295186544.79502") :outer("46_1295186544.79502")
.annotate 'line', 815
    new $P1123, "Undef"
    .lex "$name", $P1123
    find_lex $P1125, "$arg"
    $P1126 = $P1125."modifier"()
    set $P1127, $P1126["named"]
    unless_null $P1127, vivify_246
    new $P1127, "Undef"
  vivify_246:
    set $P1124, $P1127
    defined $I1129, $P1124
    if $I1129, default_1128
    find_lex $P1130, "$arg"
    $P1131 = $P1130."name"()
    set $P1124, $P1131
  default_1128:
    store_lex "$name", $P1124
.annotate 'line', 816
    find_lex $P1132, "@op"
.annotate 'line', 817
    find_lex $P1133, "%context"
    unless_null $P1133, vivify_247
    $P1133 = root_new ['parrot';'Hash']
  vivify_247:
    set $P1134, $P1133["constants"]
    unless_null $P1134, vivify_248
    new $P1134, "Undef"
  vivify_248:
    find_lex $P1135, "$name"
    $P1136 = $P1134."get_or_create_string"($P1135)
    $P1137 = $P1132."push"($P1136)
.annotate 'line', 814
    .return ($P1137)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("48_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1154
    .param pmc param_1155
.annotate 'line', 826
    .const 'Sub' $P1206 = "51_1295186544.79502" 
    capture_lex $P1206
    .const 'Sub' $P1166 = "49_1295186544.79502" 
    capture_lex $P1166
    new $P1153, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1153, control_1152
    push_eh $P1153
    .lex "self", self
    .lex "@args", param_1154
    .lex "%context", param_1155
.annotate 'line', 827
    $P1156 = root_new ['parrot';'ResizablePMCArray']
    .lex "@sig", $P1156
.annotate 'line', 840
    new $P1157, "Undef"
    .lex "$elements", $P1157
.annotate 'line', 841
    new $P1158, "Undef"
    .lex "$signature", $P1158
.annotate 'line', 849
    new $P1159, "Undef"
    .lex "$idx", $P1159
.annotate 'line', 826
    find_lex $P1160, "@sig"
.annotate 'line', 828
    find_lex $P1162, "@args"
    defined $I1163, $P1162
    unless $I1163, for_undef_249
    iter $P1161, $P1162
    new $P1194, 'ExceptionHandler'
    set_addr $P1194, loop1193_handler
    $P1194."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1194
  loop1193_test:
    unless $P1161, loop1193_done
    shift $P1164, $P1161
  loop1193_redo:
    .const 'Sub' $P1166 = "49_1295186544.79502" 
    capture_lex $P1166
    $P1166($P1164)
  loop1193_next:
    goto loop1193_test
  loop1193_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1195, exception, 'type'
    eq $P1195, .CONTROL_LOOP_NEXT, loop1193_next
    eq $P1195, .CONTROL_LOOP_REDO, loop1193_redo
  loop1193_done:
    pop_eh 
  for_undef_249:
.annotate 'line', 840
    find_lex $P1196, "@sig"
    set $N1197, $P1196
    new $P1198, 'Float'
    set $P1198, $N1197
    store_lex "$elements", $P1198
.annotate 'line', 841

        $P1199 = find_lex '$elements'
        $I99 = $P1199
        $P1199 = find_lex '$signature'
        $P1199 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1199
.annotate 'line', 849
    new $P1200, "Integer"
    assign $P1200, 0
    store_lex "$idx", $P1200
.annotate 'line', 850
    find_lex $P1202, "@sig"
    defined $I1203, $P1202
    unless $I1203, for_undef_251
    iter $P1201, $P1202
    new $P1215, 'ExceptionHandler'
    set_addr $P1215, loop1214_handler
    $P1215."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1215
  loop1214_test:
    unless $P1201, loop1214_done
    shift $P1204, $P1201
  loop1214_redo:
    .const 'Sub' $P1206 = "51_1295186544.79502" 
    capture_lex $P1206
    $P1206($P1204)
  loop1214_next:
    goto loop1214_test
  loop1214_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1216, exception, 'type'
    eq $P1216, .CONTROL_LOOP_NEXT, loop1214_next
    eq $P1216, .CONTROL_LOOP_REDO, loop1214_redo
  loop1214_done:
    pop_eh 
  for_undef_251:
    find_lex $P1217, "$signature"
.annotate 'line', 826
    .return ($P1217)
  control_1152:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1218, exception, "payload"
    .return ($P1218)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_block1165"  :anon :subid("49_1295186544.79502") :outer("48_1295186544.79502")
    .param pmc param_1167
.annotate 'line', 828
    .const 'Sub' $P1185 = "50_1295186544.79502" 
    capture_lex $P1185
    .lex "$arg", param_1167
.annotate 'line', 830
    new $P1168, "Undef"
    .lex "$s", $P1168
    find_lex $P1169, "self"
    find_lex $P1170, "$arg"
    find_lex $P1171, "%context"
    $P1172 = $P1169."build_single_arg"($P1170, $P1171)
    store_lex "$s", $P1172
.annotate 'line', 831
    find_lex $P1175, "$s"
    isa $I1176, $P1175, "Integer"
    if $I1176, if_1174
.annotate 'line', 835
    find_lex $P1181, "$s"
    defined $I1182, $P1181
    unless $I1182, for_undef_250
    iter $P1180, $P1181
    new $P1191, 'ExceptionHandler'
    set_addr $P1191, loop1190_handler
    $P1191."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1191
  loop1190_test:
    unless $P1180, loop1190_done
    shift $P1183, $P1180
  loop1190_redo:
    .const 'Sub' $P1185 = "50_1295186544.79502" 
    capture_lex $P1185
    $P1185($P1183)
  loop1190_next:
    goto loop1190_test
  loop1190_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1192, exception, 'type'
    eq $P1192, .CONTROL_LOOP_NEXT, loop1190_next
    eq $P1192, .CONTROL_LOOP_REDO, loop1190_redo
  loop1190_done:
    pop_eh 
  for_undef_250:
.annotate 'line', 834
    set $P1173, $P1180
.annotate 'line', 831
    goto if_1174_end
  if_1174:
.annotate 'line', 832
    find_lex $P1177, "@sig"
    find_lex $P1178, "$s"
    $P1179 = $P1177."push"($P1178)
.annotate 'line', 831
    set $P1173, $P1179
  if_1174_end:
.annotate 'line', 828
    .return ($P1173)
.end


.namespace ["POST";"Compiler"]
.sub "_block1184"  :anon :subid("50_1295186544.79502") :outer("49_1295186544.79502")
    .param pmc param_1186
.annotate 'line', 835
    .lex "$_", param_1186
    find_lex $P1187, "@sig"
    find_lex $P1188, "$_"
    $P1189 = $P1187."push"($P1188)
    .return ($P1189)
.end


.namespace ["POST";"Compiler"]
.sub "_block1205"  :anon :subid("51_1295186544.79502") :outer("48_1295186544.79502")
    .param pmc param_1207
.annotate 'line', 850
    .lex "$val", param_1207
.annotate 'line', 851
    find_lex $P1208, "$val"
    find_lex $P1209, "$idx"
    set $I1210, $P1209
    find_lex $P1211, "$signature"
    unless_null $P1211, vivify_252
    $P1211 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1211
  vivify_252:
    set $P1211[$I1210], $P1208
    find_lex $P1212, "$idx"
    clone $P1213, $P1212
    inc $P1212
.annotate 'line', 850
    .return ($P1213)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("52_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1222
    .param pmc param_1223
.annotate 'line', 858
    new $P1221, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1221, control_1220
    push_eh $P1221
    .lex "self", self
    .lex "$arg", param_1222
    .lex "%context", param_1223
.annotate 'line', 861
    new $P1224, "Undef"
    .lex "$type", $P1224
.annotate 'line', 863
    new $P1225, "Undef"
    .lex "$res", $P1225
.annotate 'line', 877
    new $P1226, "Undef"
    .lex "$mod", $P1226
.annotate 'line', 861
    find_lex $P1228, "$arg"
    $P1229 = $P1228."type"()
    set $P1227, $P1229
    defined $I1231, $P1227
    if $I1231, default_1230
    find_lex $P1232, "self"
    find_lex $P1233, "$arg"
    $P1234 = $P1233."name"()
    find_lex $P1235, "%context"
    $P1236 = $P1232."get_register"($P1234, $P1235)
    $P1237 = $P1236."type"()
    set $P1227, $P1237
  default_1230:
    store_lex "$type", $P1227
    find_lex $P1238, "$res"
.annotate 'line', 866
    find_lex $P1240, "$type"
    set $S1241, $P1240
    iseq $I1242, $S1241, "i"
    if $I1242, if_1239
.annotate 'line', 867
    find_lex $P1245, "$type"
    set $S1246, $P1245
    iseq $I1247, $S1246, "s"
    if $I1247, if_1244
.annotate 'line', 868
    find_lex $P1250, "$type"
    set $S1251, $P1250
    iseq $I1252, $S1251, "p"
    if $I1252, if_1249
.annotate 'line', 869
    find_lex $P1255, "$type"
    set $S1256, $P1255
    iseq $I1257, $S1256, "n"
    if $I1257, if_1254
.annotate 'line', 871
    find_lex $P1260, "$type"
    set $S1261, $P1260
    iseq $I1262, $S1261, "ic"
    if $I1262, if_1259
.annotate 'line', 872
    find_lex $P1266, "$type"
    set $S1267, $P1266
    iseq $I1268, $S1267, "sc"
    if $I1268, if_1265
.annotate 'line', 873
    find_lex $P1272, "$type"
    set $S1273, $P1272
    iseq $I1274, $S1273, "pc"
    if $I1274, if_1271
.annotate 'line', 874
    find_lex $P1278, "$type"
    set $S1279, $P1278
    iseq $I1280, $S1279, "nc"
    if $I1280, if_1277
.annotate 'line', 875
    find_lex $P1283, "self"
    new $P1284, 'String'
    set $P1284, "Unknown arg type '"
    find_lex $P1285, "$type"
    concat $P1286, $P1284, $P1285
    concat $P1287, $P1286, "'"
    $P1283."panic"($P1287)
    goto if_1277_end
  if_1277:
.annotate 'line', 874
    new $P1281, "Integer"
    assign $P1281, 3
    add $P1282, $P1281, 16
    store_lex "$res", $P1282
  if_1277_end:
    goto if_1271_end
  if_1271:
.annotate 'line', 873
    new $P1275, "Integer"
    assign $P1275, 2
    add $P1276, $P1275, 16
    store_lex "$res", $P1276
  if_1271_end:
    goto if_1265_end
  if_1265:
.annotate 'line', 872
    new $P1269, "Integer"
    assign $P1269, 1
    add $P1270, $P1269, 16
    store_lex "$res", $P1270
  if_1265_end:
    goto if_1259_end
  if_1259:
.annotate 'line', 871
    new $P1263, "Integer"
    assign $P1263, 0
    add $P1264, $P1263, 16
    store_lex "$res", $P1264
  if_1259_end:
    goto if_1254_end
  if_1254:
.annotate 'line', 869
    new $P1258, "Integer"
    assign $P1258, 3
    store_lex "$res", $P1258
  if_1254_end:
    goto if_1249_end
  if_1249:
.annotate 'line', 868
    new $P1253, "Integer"
    assign $P1253, 2
    store_lex "$res", $P1253
  if_1249_end:
    goto if_1244_end
  if_1244:
.annotate 'line', 867
    new $P1248, "Integer"
    assign $P1248, 1
    store_lex "$res", $P1248
  if_1244_end:
    goto if_1239_end
  if_1239:
.annotate 'line', 866
    new $P1243, "Integer"
    assign $P1243, 0
    store_lex "$res", $P1243
  if_1239_end:
.annotate 'line', 877
    find_lex $P1288, "$arg"
    $P1289 = $P1288."modifier"()
    store_lex "$mod", $P1289
.annotate 'line', 878
    find_lex $P1291, "$mod"
    unless $P1291, if_1290_end
.annotate 'line', 879
    find_lex $P1293, "$mod"
    isa $I1294, $P1293, "Hash"
    if $I1294, if_1292
.annotate 'line', 884
    find_lex $P1302, "$mod"
    set $S1303, $P1302
    iseq $I1304, $S1303, "slurpy"
    if $I1304, if_1301
.annotate 'line', 885
    find_lex $P1308, "$mod"
    set $S1309, $P1308
    iseq $I1310, $S1309, "flat"
    if $I1310, if_1307
.annotate 'line', 886
    find_lex $P1314, "$mod"
    set $S1315, $P1314
    iseq $I1316, $S1315, "optional"
    if $I1316, if_1313
.annotate 'line', 887
    find_lex $P1320, "$mod"
    set $S1321, $P1320
    iseq $I1322, $S1321, "opt_flag"
    if $I1322, if_1319
.annotate 'line', 888
    find_lex $P1326, "$mod"
    set $S1327, $P1326
    iseq $I1328, $S1327, "slurpy named"
    if $I1328, if_1325
.annotate 'line', 889
    find_lex $P1332, "self"
    new $P1333, 'String'
    set $P1333, "Unsupported modifier "
    find_lex $P1334, "$mod"
    concat $P1335, $P1333, $P1334
    $P1332."panic"($P1335)
    goto if_1325_end
  if_1325:
.annotate 'line', 888
    find_lex $P1329, "$res"
    add $P1330, $P1329, 32
    add $P1331, $P1330, 512
    store_lex "$res", $P1331
  if_1325_end:
    goto if_1319_end
  if_1319:
.annotate 'line', 887
    find_lex $P1323, "$res"
    add $P1324, $P1323, 256
    store_lex "$res", $P1324
  if_1319_end:
    goto if_1313_end
  if_1313:
.annotate 'line', 886
    find_lex $P1317, "$res"
    add $P1318, $P1317, 128
    store_lex "$res", $P1318
  if_1313_end:
    goto if_1307_end
  if_1307:
.annotate 'line', 885
    find_lex $P1311, "$res"
    add $P1312, $P1311, 32
    store_lex "$res", $P1312
  if_1307_end:
    goto if_1301_end
  if_1301:
.annotate 'line', 884
    find_lex $P1305, "$res"
    add $P1306, $P1305, 32
    store_lex "$res", $P1306
  if_1301_end:
    goto if_1292_end
  if_1292:
.annotate 'line', 882
    new $P1295, "Integer"
    assign $P1295, 1
    add $P1296, $P1295, 16
    add $P1297, $P1296, 512
    find_lex $P1298, "$res"
    add $P1299, $P1298, 512
    $P1300 = "list"($P1297, $P1299)
    store_lex "$res", $P1300
  if_1292_end:
  if_1290_end:
.annotate 'line', 878
    find_lex $P1336, "$res"
.annotate 'line', 858
    .return ($P1336)
  control_1220:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1337, exception, "payload"
    .return ($P1337)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("53_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1341
.annotate 'line', 900
    .const 'Sub' $P1348 = "54_1295186544.79502" 
    capture_lex $P1348
    new $P1340, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1340, control_1339
    push_eh $P1340
    .lex "self", self
    .lex "$post", param_1341
.annotate 'line', 901
    find_lex $P1343, "$post"
    $P1344 = $P1343."list"()
    defined $I1345, $P1344
    unless $I1345, for_undef_253
    iter $P1342, $P1344
    new $P1361, 'ExceptionHandler'
    set_addr $P1361, loop1360_handler
    $P1361."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1361
  loop1360_test:
    unless $P1342, loop1360_done
    shift $P1346, $P1342
  loop1360_redo:
    .const 'Sub' $P1348 = "54_1295186544.79502" 
    capture_lex $P1348
    $P1348($P1346)
  loop1360_next:
    goto loop1360_test
  loop1360_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1362, exception, 'type'
    eq $P1362, .CONTROL_LOOP_NEXT, loop1360_next
    eq $P1362, .CONTROL_LOOP_REDO, loop1360_redo
  loop1360_done:
    pop_eh 
  for_undef_253:
.annotate 'line', 900
    .return ($P1342)
  control_1339:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1363, exception, "payload"
    .return ($P1363)
.end


.namespace ["POST";"Compiler"]
.sub "_block1347"  :anon :subid("54_1295186544.79502") :outer("53_1295186544.79502")
    .param pmc param_1349
.annotate 'line', 901
    .lex "$sub", param_1349
.annotate 'line', 903
    find_lex $P1352, "$sub"
    get_hll_global $P1353, ["POST"], "Sub"
    $P1354 = $P1352."isa"($P1353)
    if $P1354, if_1351
    set $P1350, $P1354
    goto if_1351_end
  if_1351:
    find_lex $P1355, "$post"
    find_lex $P1356, "$sub"
    $P1357 = $P1356."full_name"()
    find_lex $P1358, "$sub"
    $P1359 = $P1355."sub"($P1357, $P1358)
    set $P1350, $P1359
  if_1351_end:
.annotate 'line', 901
    .return ($P1350)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("55_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1367
    .param pmc param_1368
.annotate 'line', 908
    new $P1366, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1366, control_1365
    push_eh $P1366
    .lex "self", self
    .lex "$sub", param_1367
    .lex "%context", param_1368
.annotate 'line', 916
    new $P1369, "Undef"
    .lex "$res", $P1369
    new $P1370, "Integer"
    assign $P1370, 0
    store_lex "$res", $P1370
.annotate 'line', 917
    find_lex $P1371, "$res"
    new $P1372, "Integer"
    assign $P1372, 1
    find_lex $P1373, "$sub"
    $N1374 = $P1373."outer"()
    mul $P1375, $P1372, $N1374
    add $P1376, $P1371, $P1375
    store_lex "$res", $P1376
.annotate 'line', 918
    find_lex $P1377, "$res"
    new $P1378, "Integer"
    assign $P1378, 8
    find_lex $P1379, "$sub"
    $N1380 = $P1379."anon"()
    mul $P1381, $P1378, $N1380
    add $P1382, $P1377, $P1381
    store_lex "$res", $P1382
.annotate 'line', 919
    find_lex $P1383, "$res"
    new $P1384, "Integer"
    assign $P1384, 16
    find_lex $P1385, "$sub"
    $N1386 = $P1385."main"()
    mul $P1387, $P1384, $N1386
    add $P1388, $P1383, $P1387
    store_lex "$res", $P1388
.annotate 'line', 920
    find_lex $P1389, "$res"
    new $P1390, "Integer"
    assign $P1390, 32
    find_lex $P1391, "$sub"
    $N1392 = $P1391."load"()
    mul $P1393, $P1390, $N1392
    add $P1394, $P1389, $P1393
    store_lex "$res", $P1394
.annotate 'line', 921
    find_lex $P1395, "$res"
    new $P1396, "Integer"
    assign $P1396, 64
    find_lex $P1397, "$sub"
    $N1398 = $P1397."immediate"()
    mul $P1399, $P1396, $N1398
    add $P1400, $P1395, $P1399
    store_lex "$res", $P1400
.annotate 'line', 922
    find_lex $P1401, "$res"
    new $P1402, "Integer"
    assign $P1402, 128
    find_lex $P1403, "$sub"
    $N1404 = $P1403."postcomp"()
    mul $P1405, $P1402, $N1404
    add $P1406, $P1401, $P1405
    store_lex "$res", $P1406
.annotate 'line', 924
    find_lex $P1408, "%context"
    unless_null $P1408, vivify_254
    $P1408 = root_new ['parrot';'Hash']
  vivify_254:
    set $P1409, $P1408["DEBUG"]
    unless_null $P1409, vivify_255
    new $P1409, "Undef"
  vivify_255:
    unless $P1409, if_1407_end
    find_lex $P1410, "self"
    new $P1411, 'String'
    set $P1411, "pf_flags "
    find_lex $P1412, "$res"
    concat $P1413, $P1411, $P1412
    $P1410."debug"($P1413)
  if_1407_end:
    find_lex $P1414, "$res"
.annotate 'line', 908
    .return ($P1414)
  control_1365:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1415, exception, "payload"
    .return ($P1415)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("56_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1419
    .param pmc param_1420
.annotate 'line', 929
    new $P1418, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1418, control_1417
    push_eh $P1418
    .lex "self", self
    .lex "$sub", param_1419
    .lex "%context", param_1420
.annotate 'line', 934
    new $P1421, "Undef"
    .lex "$res", $P1421
    new $P1422, "Integer"
    assign $P1422, 0
    store_lex "$res", $P1422
.annotate 'line', 935
    find_lex $P1424, "$sub"
    $P1425 = $P1424."vtable"()
    unless $P1425, if_1423_end
    find_lex $P1426, "$res"
    add $P1427, $P1426, 2
    store_lex "$res", $P1427
  if_1423_end:
.annotate 'line', 936
    find_lex $P1429, "$sub"
    $P1430 = $P1429."is_method"()
    unless $P1430, if_1428_end
    find_lex $P1431, "$res"
    add $P1432, $P1431, 4
    store_lex "$res", $P1432
  if_1428_end:
.annotate 'line', 937
    find_lex $P1434, "$sub"
    $P1435 = $P1434."is_init"()
    unless $P1435, if_1433_end
    find_lex $P1436, "$res"
    add $P1437, $P1436, 1024
    store_lex "$res", $P1437
  if_1433_end:
.annotate 'line', 938
    find_lex $P1439, "$sub"
    $P1440 = $P1439."nsentry"()
    unless $P1440, if_1438_end
    find_lex $P1441, "$res"
    add $P1442, $P1441, 2048
    store_lex "$res", $P1442
  if_1438_end:
.annotate 'line', 940
    find_lex $P1444, "%context"
    unless_null $P1444, vivify_256
    $P1444 = root_new ['parrot';'Hash']
  vivify_256:
    set $P1445, $P1444["DEBUG"]
    unless_null $P1445, vivify_257
    new $P1445, "Undef"
  vivify_257:
    unless $P1445, if_1443_end
    find_lex $P1446, "self"
    new $P1447, 'String'
    set $P1447, "comp_flags "
    find_lex $P1448, "$res"
    concat $P1449, $P1447, $P1448
    $P1446."debug"($P1449)
  if_1443_end:
    find_lex $P1450, "$res"
.annotate 'line', 929
    .return ($P1450)
  control_1417:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1451, exception, "payload"
    .return ($P1451)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("57_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1455
    .param pmc param_1456
    .param pmc param_1457
    .param pmc param_1458
.annotate 'line', 945
    .const 'Sub' $P1468 = "58_1295186544.79502" 
    capture_lex $P1468
    new $P1454, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1454, control_1453
    push_eh $P1454
    .lex "self", self
    .lex "$sub", param_1455
    .lex "$labels_todo", param_1456
    .lex "$bc", param_1457
    .lex "%context", param_1458
.annotate 'line', 946
    find_lex $P1460, "%context"
    unless_null $P1460, vivify_258
    $P1460 = root_new ['parrot';'Hash']
  vivify_258:
    set $P1461, $P1460["DEBUG"]
    unless_null $P1461, vivify_259
    new $P1461, "Undef"
  vivify_259:
    unless $P1461, if_1459_end
    find_lex $P1462, "self"
    $P1462."debug"("Fixup labels")
  if_1459_end:
.annotate 'line', 947
    find_lex $P1464, "$labels_todo"
    defined $I1465, $P1464
    unless $I1465, for_undef_260
    iter $P1463, $P1464
    new $P1527, 'ExceptionHandler'
    set_addr $P1527, loop1526_handler
    $P1527."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1527
  loop1526_test:
    unless $P1463, loop1526_done
    shift $P1466, $P1463
  loop1526_redo:
    .const 'Sub' $P1468 = "58_1295186544.79502" 
    capture_lex $P1468
    $P1468($P1466)
  loop1526_next:
    goto loop1526_test
  loop1526_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1528, exception, 'type'
    eq $P1528, .CONTROL_LOOP_NEXT, loop1526_next
    eq $P1528, .CONTROL_LOOP_REDO, loop1526_redo
  loop1526_done:
    pop_eh 
  for_undef_260:
.annotate 'line', 945
    .return ($P1463)
  control_1453:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1529, exception, "payload"
    .return ($P1529)
.end


.namespace ["POST";"Compiler"]
.sub "_block1467"  :anon :subid("58_1295186544.79502") :outer("57_1295186544.79502")
    .param pmc param_1469
.annotate 'line', 947
    .lex "$kv", param_1469
.annotate 'line', 948
    new $P1470, "Undef"
    .lex "$offset", $P1470
.annotate 'line', 949
    $P1471 = root_new ['parrot';'Hash']
    .lex "%todo", $P1471
.annotate 'line', 952
    new $P1472, "Undef"
    .lex "$op", $P1472
.annotate 'line', 955
    new $P1473, "Undef"
    .lex "$delta", $P1473
.annotate 'line', 948
    find_lex $P1474, "$kv"
    $P1475 = $P1474."key"()
    store_lex "$offset", $P1475
.annotate 'line', 949
    find_lex $P1476, "$kv"
    $P1477 = $P1476."value"()
    store_lex "%todo", $P1477
.annotate 'line', 950
    find_lex $P1479, "%context"
    unless_null $P1479, vivify_261
    $P1479 = root_new ['parrot';'Hash']
  vivify_261:
    set $P1480, $P1479["DEBUG"]
    unless_null $P1480, vivify_262
    new $P1480, "Undef"
  vivify_262:
    unless $P1480, if_1478_end
    find_lex $P1481, "self"
    new $P1482, 'String'
    set $P1482, "Fixing '"
    find_lex $P1483, "%todo"
    unless_null $P1483, vivify_263
    $P1483 = root_new ['parrot';'Hash']
  vivify_263:
    set $P1484, $P1483["name"]
    unless_null $P1484, vivify_264
    new $P1484, "Undef"
  vivify_264:
    set $S1485, $P1484
    concat $P1486, $P1482, $S1485
    concat $P1487, $P1486, "' from op "
    find_lex $P1488, "%todo"
    unless_null $P1488, vivify_265
    $P1488 = root_new ['parrot';'Hash']
  vivify_265:
    set $P1489, $P1488["opname"]
    unless_null $P1489, vivify_266
    new $P1489, "Undef"
  vivify_266:
    set $S1490, $P1489
    concat $P1491, $P1487, $S1490
    concat $P1492, $P1491, " at "
    find_lex $P1493, "$offset"
    set $S1494, $P1493
    concat $P1495, $P1492, $S1494
    $P1481."debug"($P1495)
  if_1478_end:
.annotate 'line', 952
    find_lex $P1496, "%todo"
    unless_null $P1496, vivify_267
    $P1496 = root_new ['parrot';'Hash']
  vivify_267:
    set $P1497, $P1496["opname"]
    unless_null $P1497, vivify_268
    new $P1497, "Undef"
  vivify_268:
    set $S1498, $P1497
    find_lex $P1499, "$bc"
    $P1500 = $P1499."opmap"()
    set $P1501, $P1500[$S1498]
    unless_null $P1501, vivify_269
    new $P1501, "Undef"
  vivify_269:
    store_lex "$op", $P1501
.annotate 'line', 953
    find_lex $P1503, "%context"
    unless_null $P1503, vivify_270
    $P1503 = root_new ['parrot';'Hash']
  vivify_270:
    set $P1504, $P1503["DEBUG"]
    unless_null $P1504, vivify_271
    new $P1504, "Undef"
  vivify_271:
    unless $P1504, if_1502_end
    find_lex $P1505, "self"
    new $P1506, 'String'
    set $P1506, "Op length is "
    find_lex $P1507, "$op"
    $P1508 = $P1507."length"()
    set $S1509, $P1508
    concat $P1510, $P1506, $S1509
    $P1505."debug"($P1510)
  if_1502_end:
.annotate 'line', 955
    find_lex $P1511, "$sub"
    find_lex $P1512, "%todo"
    unless_null $P1512, vivify_272
    $P1512 = root_new ['parrot';'Hash']
  vivify_272:
    set $P1513, $P1512["name"]
    unless_null $P1513, vivify_273
    new $P1513, "Undef"
  vivify_273:
    $P1514 = $P1511."label"($P1513)
    $P1515 = $P1514."position"()
    find_lex $P1516, "%todo"
    unless_null $P1516, vivify_274
    $P1516 = root_new ['parrot';'Hash']
  vivify_274:
    set $P1517, $P1516["offset"]
    unless_null $P1517, vivify_275
    new $P1517, "Undef"
  vivify_275:
    sub $P1518, $P1515, $P1517
    store_lex "$delta", $P1518
.annotate 'line', 957
    find_lex $P1519, "$delta"
    find_lex $P1520, "$offset"
    find_lex $P1521, "$op"
    $N1522 = $P1521."length"()
    add $P1523, $P1520, $N1522
    set $I1524, $P1523
    find_lex $P1525, "$bc"
    unless_null $P1525, vivify_276
    $P1525 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1525
  vivify_276:
    set $P1525[$I1524], $P1519
.annotate 'line', 947
    .return ($P1519)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("59_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1533
    .param pmc param_1534
.annotate 'line', 962
    new $P1532, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1532, control_1531
    push_eh $P1532
    .lex "self", self
    .lex "$name", param_1533
    .lex "%context", param_1534
.annotate 'line', 963
    new $P1535, "Undef"
    .lex "$reg", $P1535
    find_lex $P1536, "%context"
    unless_null $P1536, vivify_277
    $P1536 = root_new ['parrot';'Hash']
  vivify_277:
    set $P1537, $P1536["sub"]
    unless_null $P1537, vivify_278
    new $P1537, "Undef"
  vivify_278:
    find_lex $P1538, "$name"
    $P1539 = $P1537."symbol"($P1538)
    store_lex "$reg", $P1539
.annotate 'line', 964
    find_lex $P1541, "$reg"
    isfalse $I1542, $P1541
    unless $I1542, if_1540_end
.annotate 'line', 965
    find_lex $P1543, "self"
    new $P1544, 'String'
    set $P1544, "Register '"
    find_lex $P1545, "$name"
    set $S1546, $P1545
    concat $P1547, $P1544, $S1546
    concat $P1548, $P1547, "' not predeclared in '"
    find_lex $P1549, "%context"
    unless_null $P1549, vivify_279
    $P1549 = root_new ['parrot';'Hash']
  vivify_279:
    set $P1550, $P1549["sub"]
    unless_null $P1550, vivify_280
    new $P1550, "Undef"
  vivify_280:
    $P1551 = $P1550."name"()
    set $S1552, $P1551
    concat $P1553, $P1548, $S1552
    concat $P1554, $P1553, "'"
    $P1543."panic"($P1554)
  if_1540_end:
.annotate 'line', 964
    find_lex $P1555, "$reg"
.annotate 'line', 962
    .return ($P1555)
  control_1531:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1556, exception, "payload"
    .return ($P1556)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "debug"  :subid("60_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1560 :slurpy
.annotate 'line', 970
    .const 'Sub' $P1566 = "61_1295186544.79502" 
    capture_lex $P1566
    new $P1559, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1559, control_1558
    push_eh $P1559
    .lex "self", self
    .lex "@args", param_1560
.annotate 'line', 971
    find_lex $P1562, "@args"
    defined $I1563, $P1562
    unless $I1563, for_undef_281
    iter $P1561, $P1562
    new $P1570, 'ExceptionHandler'
    set_addr $P1570, loop1569_handler
    $P1570."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1570
  loop1569_test:
    unless $P1561, loop1569_done
    shift $P1564, $P1561
  loop1569_redo:
    .const 'Sub' $P1566 = "61_1295186544.79502" 
    capture_lex $P1566
    $P1566($P1564)
  loop1569_next:
    goto loop1569_test
  loop1569_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1571, exception, 'type'
    eq $P1571, .CONTROL_LOOP_NEXT, loop1569_next
    eq $P1571, .CONTROL_LOOP_REDO, loop1569_redo
  loop1569_done:
    pop_eh 
  for_undef_281:
.annotate 'line', 970
    .return ($P1561)
  control_1558:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1572, exception, "payload"
    .return ($P1572)
.end


.namespace ["POST";"Compiler"]
.sub "_block1565"  :anon :subid("61_1295186544.79502") :outer("60_1295186544.79502")
    .param pmc param_1567
.annotate 'line', 971
    .lex "$_", param_1567
.annotate 'line', 972
    find_lex $P1568, "$_"
    say $P1568
.annotate 'line', 971
    .return ()
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("62_1295186544.79502") :method :outer("11_1295186544.79502")
    .param pmc param_1576
    .param pmc param_1577
.annotate 'line', 976
    new $P1575, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1575, control_1574
    push_eh $P1575
    .lex "self", self
    .lex "$past", param_1576
    .lex "%adverbs", param_1577
.annotate 'line', 977
    $P1578 = root_new ['parrot';'Hash']
    .lex "%context", $P1578
.annotate 'line', 985
    new $P1579, "Undef"
    .lex "$pfdir", $P1579
.annotate 'line', 976
    find_lex $P1580, "%context"
.annotate 'line', 979
    find_lex $P1581, "self"
    find_lex $P1582, "%context"
    unless_null $P1582, vivify_282
    $P1582 = root_new ['parrot';'Hash']
    store_lex "%context", $P1582
  vivify_282:
    set $P1582["compiler"], $P1581
.annotate 'line', 981
    $P1583 = "new"("Packfile")
    find_lex $P1584, "%context"
    unless_null $P1584, vivify_283
    $P1584 = root_new ['parrot';'Hash']
    store_lex "%context", $P1584
  vivify_283:
    set $P1584["packfile"], $P1583
.annotate 'line', 985
    find_lex $P1585, "%context"
    unless_null $P1585, vivify_284
    $P1585 = root_new ['parrot';'Hash']
  vivify_284:
    set $P1586, $P1585["packfile"]
    unless_null $P1586, vivify_285
    new $P1586, "Undef"
  vivify_285:
    $P1587 = $P1586."get_directory"()
    store_lex "$pfdir", $P1587
.annotate 'line', 988
    $P1588 = "new"("PackfileConstantTable")
    find_lex $P1589, "%context"
    unless_null $P1589, vivify_286
    $P1589 = root_new ['parrot';'Hash']
    store_lex "%context", $P1589
  vivify_286:
    set $P1589["constants"], $P1588
.annotate 'line', 991
    $P1590 = "new"("FixedIntegerArray")
    find_lex $P1591, "%context"
    unless_null $P1591, vivify_287
    $P1591 = root_new ['parrot';'Hash']
    store_lex "%context", $P1591
  vivify_287:
    set $P1592, $P1591["constants"]
    unless_null $P1592, vivify_288
    $P1592 = root_new ['parrot';'ResizablePMCArray']
    set $P1591["constants"], $P1592
  vivify_288:
    set $P1592[0], $P1590
.annotate 'line', 994
    find_lex $P1593, "%context"
    unless_null $P1593, vivify_289
    $P1593 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1594, $P1593["constants"]
    unless_null $P1594, vivify_290
    new $P1594, "Undef"
  vivify_290:
    find_lex $P1595, "$pfdir"
    unless_null $P1595, vivify_291
    $P1595 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1595
  vivify_291:
    set $P1595["CONSTANTS_hello.pir"], $P1594
.annotate 'line', 997
    $P1596 = "new"("PackfileBytecodeSegment")
    find_lex $P1597, "%context"
    unless_null $P1597, vivify_292
    $P1597 = root_new ['parrot';'Hash']
    store_lex "%context", $P1597
  vivify_292:
    set $P1597["bytecode"], $P1596
.annotate 'line', 998
    find_lex $P1598, "%context"
    unless_null $P1598, vivify_293
    $P1598 = root_new ['parrot';'Hash']
  vivify_293:
    set $P1599, $P1598["bytecode"]
    unless_null $P1599, vivify_294
    new $P1599, "Undef"
  vivify_294:
    $P1599."main_sub"(-1)
.annotate 'line', 1000
    new $P1600, "Integer"
    assign $P1600, 0
    find_lex $P1601, "%context"
    unless_null $P1601, vivify_295
    $P1601 = root_new ['parrot';'Hash']
    store_lex "%context", $P1601
  vivify_295:
    set $P1601["got_main_sub"], $P1600
.annotate 'line', 1003
    find_lex $P1602, "%context"
    unless_null $P1602, vivify_296
    $P1602 = root_new ['parrot';'Hash']
  vivify_296:
    set $P1603, $P1602["bytecode"]
    unless_null $P1603, vivify_297
    new $P1603, "Undef"
  vivify_297:
    find_lex $P1604, "$pfdir"
    unless_null $P1604, vivify_298
    $P1604 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1604
  vivify_298:
    set $P1604["BYTECODE_hello.pir"], $P1603
.annotate 'line', 1012
    get_hll_global $P1605, ["POST"], "VanillaAllocator"
    $P1606 = $P1605."new"()
    find_lex $P1607, "%context"
    unless_null $P1607, vivify_299
    $P1607 = root_new ['parrot';'Hash']
    store_lex "%context", $P1607
  vivify_299:
    set $P1607["regalloc"], $P1606
.annotate 'line', 1014
    find_lex $P1608, "%adverbs"
    unless_null $P1608, vivify_300
    $P1608 = root_new ['parrot';'Hash']
  vivify_300:
    set $P1609, $P1608["debug"]
    unless_null $P1609, vivify_301
    new $P1609, "Undef"
  vivify_301:
    find_lex $P1610, "%context"
    unless_null $P1610, vivify_302
    $P1610 = root_new ['parrot';'Hash']
    store_lex "%context", $P1610
  vivify_302:
    set $P1610["DEBUG"], $P1609
    find_lex $P1611, "%context"
.annotate 'line', 976
    .return ($P1611)
  control_1574:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1612, exception, "payload"
    .return ($P1612)
.end


.namespace ["POST";"Compiler"]
.sub "_block1613" :load :anon :subid("63_1295186544.79502")
.annotate 'line', 16
    .const 'Sub' $P1615 = "11_1295186544.79502" 
    $P1616 = $P1615()
    .return ($P1616)
.end


.namespace []
.sub "_block1622" :load :anon :subid("64_1295186544.79502")
.annotate 'line', 1
    .const 'Sub' $P1624 = "10_1295186544.79502" 
    $P1625 = $P1624()
    .return ($P1625)
.end

