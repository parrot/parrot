
.namespace []
.sub "_block11"  :anon :subid("10_1295186271.69345")
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
    $P1597 = $P14()
.annotate 'line', 1
    .return ($P1597)
    .const 'Sub' $P1599 = "64_1295186271.69345" 
    .return ($P1599)
.end


.namespace []
.sub "" :load :init :subid("post65") :outer("10_1295186271.69345")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1295186271.69345" 
    .local pmc block
    set block, $P12
    $P1602 = get_root_global ["parrot"], "P6metaclass"
    new $P1603, "ResizablePMCArray"
    push $P1603, "$?HLL"
    push $P1603, "$?NAMESPACE"
    $P1602."new_class"("POST::Compiler", "PCT::HLLCompiler" :named("parent"), $P1603 :named("attr"))
.end


.namespace ["POST";"Compiler"]
.sub "_block13"  :subid("11_1295186271.69345") :outer("10_1295186271.69345")
.annotate 'line', 16
    .const 'Sub' $P1549 = "62_1295186271.69345" 
    capture_lex $P1549
    .const 'Sub' $P1533 = "60_1295186271.69345" 
    capture_lex $P1533
    .const 'Sub' $P1506 = "59_1295186271.69345" 
    capture_lex $P1506
    .const 'Sub' $P1428 = "57_1295186271.69345" 
    capture_lex $P1428
    .const 'Sub' $P1392 = "56_1295186271.69345" 
    capture_lex $P1392
    .const 'Sub' $P1340 = "55_1295186271.69345" 
    capture_lex $P1340
    .const 'Sub' $P1314 = "53_1295186271.69345" 
    capture_lex $P1314
    .const 'Sub' $P1195 = "52_1295186271.69345" 
    capture_lex $P1195
    .const 'Sub' $P1127 = "48_1295186271.69345" 
    capture_lex $P1127
    .const 'Sub' $P1051 = "45_1295186271.69345" 
    capture_lex $P1051
    .const 'Sub' $P1011 = "44_1295186271.69345" 
    capture_lex $P1011
    .const 'Sub' $P1003 = "43_1295186271.69345" 
    capture_lex $P1003
    .const 'Sub' $P987 = "42_1295186271.69345" 
    capture_lex $P987
    .const 'Sub' $P942 = "40_1295186271.69345" 
    capture_lex $P942
    .const 'Sub' $P902 = "39_1295186271.69345" 
    capture_lex $P902
    .const 'Sub' $P877 = "38_1295186271.69345" 
    capture_lex $P877
    .const 'Sub' $P641 = "34_1295186271.69345" 
    capture_lex $P641
    .const 'Sub' $P595 = "32_1295186271.69345" 
    capture_lex $P595
    .const 'Sub' $P574 = "30_1295186271.69345" 
    capture_lex $P574
    .const 'Sub' $P482 = "27_1295186271.69345" 
    capture_lex $P482
    .const 'Sub' $P215 = "24_1295186271.69345" 
    capture_lex $P215
    .const 'Sub' $P209 = "23_1295186271.69345" 
    capture_lex $P209
    .const 'Sub' $P175 = "21_1295186271.69345" 
    capture_lex $P175
    .const 'Sub' $P169 = "20_1295186271.69345" 
    capture_lex $P169
    .const 'Sub' $P164 = "19_1295186271.69345" 
    capture_lex $P164
    .const 'Sub' $P151 = "18_1295186271.69345" 
    capture_lex $P151
    .const 'Sub' $P50 = "17_1295186271.69345" 
    capture_lex $P50
    .const 'Sub' $P40 = "16_1295186271.69345" 
    capture_lex $P40
    .const 'Sub' $P35 = "15_1295186271.69345" 
    capture_lex $P35
    .const 'Sub' $P29 = "14_1295186271.69345" 
    capture_lex $P29
    .const 'Sub' $P24 = "13_1295186271.69345" 
    capture_lex $P24
    .const 'Sub' $P16 = "12_1295186271.69345" 
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
    .const 'Sub' $P1590 = "63_1295186271.69345" 
    .return ($P1590)
.end


.namespace ["POST";"Compiler"]
.sub "" :load :init :subid("post66") :outer("11_1295186271.69345")
.annotate 'line', 16
    get_hll_global $P14, ["POST";"Compiler"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 20
    get_hll_global $P1593, ["POST"], "Compiler"
    $P1593."language"("POST")
.annotate 'line', 21
    get_hll_global $P1594, ["POST"], "Compiler"
    new $P1595, "ResizablePMCArray"
    push $P1595, "pir"
    push $P1595, "evalpmc"
    $P1594."stages"($P1595)
.annotate 'line', 23

        $P1596 = new ['String']
        set_global '$?HLL', $P1596
    
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("12_1295186271.69345") :method :outer("11_1295186271.69345")
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
.sub "key_pir"  :subid("13_1295186271.69345") :method :outer("11_1295186271.69345")
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
.sub "to_pir"  :subid("14_1295186271.69345") :method :outer("11_1295186271.69345")
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
.sub "pir_children"  :subid("15_1295186271.69345") :method :outer("11_1295186271.69345")
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
.sub "pir"  :subid("16_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,_)
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
.sub "pir"  :subid("17_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Op"])
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
.sub "pir"  :subid("18_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Label"])
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
.sub "pir"  :subid("19_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Sub"])
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
.sub "hll_pir"  :subid("20_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_172
    .param pmc param_173 :slurpy :named
.annotate 'line', 378
    new $P171, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P171, control_170
    push_eh $P171
    .lex "self", self
    .lex "$node", param_172
    .lex "%options", param_173
.annotate 'line', 379

    .local pmc node
    .local pmc options

    find_lex node, '$node'
    find_lex options, '%options'

    options['target'] = 'pir'
    $P0 = node.'subid'()
    options['subid'] = $P0
    .local pmc source, compiler, pir
    source = node[0]
    $S0 = node.'compiler'()
    compiler = compreg $S0
    $I0 = isa compiler, 'Sub'
    if $I0 goto compiler_sub
    $S0 = compiler.'compile'(source, options :flat :named)
    .return ($S0)
  compiler_sub:
    $S0 = compiler(source, options :flat :named)
    .return ($S0)
    
.annotate 'line', 378
    .return ()
  control_170:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("21_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_178
    .param pmc param_179
.annotate 'line', 420
    .const 'Sub' $P197 = "22_1295186271.69345" 
    capture_lex $P197
    new $P177, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P177, control_176
    push_eh $P177
    .lex "self", self
    .lex "$post", param_178
    .lex "%adverbs", param_179
.annotate 'line', 424
    $P180 = root_new ['parrot';'Hash']
    .lex "%context", $P180
    find_lex $P181, "self"
    find_lex $P182, "$post"
    find_lex $P183, "%adverbs"
    $P184 = $P181."create_context"($P182, $P183)
    store_lex "%context", $P184
.annotate 'line', 425
    new $P185, "Integer"
    assign $P185, 0
    find_lex $P186, "%context"
    unless_null $P186, vivify_68
    $P186 = root_new ['parrot';'Hash']
    store_lex "%context", $P186
  vivify_68:
    set $P186["DEBUG"], $P185
.annotate 'line', 427
    find_lex $P187, "$post"
    find_lex $P188, "%context"
    unless_null $P188, vivify_69
    $P188 = root_new ['parrot';'Hash']
    store_lex "%context", $P188
  vivify_69:
    set $P188["pir_file"], $P187
.annotate 'line', 432
    find_lex $P189, "self"
    find_lex $P190, "$post"
    $P189."enumerate_subs"($P190)
.annotate 'line', 434
    find_lex $P192, "$post"
    $P193 = $P192."list"()
    defined $I194, $P193
    unless $I194, for_undef_70
    iter $P191, $P193
    new $P204, 'ExceptionHandler'
    set_addr $P204, loop203_handler
    $P204."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P204
  loop203_test:
    unless $P191, loop203_done
    shift $P195, $P191
  loop203_redo:
    .const 'Sub' $P197 = "22_1295186271.69345" 
    capture_lex $P197
    $P197($P195)
  loop203_next:
    goto loop203_test
  loop203_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P205, exception, 'type'
    eq $P205, .CONTROL_LOOP_NEXT, loop203_next
    eq $P205, .CONTROL_LOOP_REDO, loop203_redo
  loop203_done:
    pop_eh 
  for_undef_70:
    find_lex $P206, "%context"
    unless_null $P206, vivify_71
    $P206 = root_new ['parrot';'Hash']
  vivify_71:
    set $P207, $P206["packfile"]
    unless_null $P207, vivify_72
    new $P207, "Undef"
  vivify_72:
.annotate 'line', 420
    .return ($P207)
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P208, exception, "payload"
    .return ($P208)
.end


.namespace ["POST";"Compiler"]
.sub "_block196"  :anon :subid("22_1295186271.69345") :outer("21_1295186271.69345")
    .param pmc param_198
.annotate 'line', 434
    .lex "$s", param_198
.annotate 'line', 435
    find_lex $P199, "self"
    find_lex $P200, "$s"
    find_lex $P201, "%context"
    $P202 = $P199."to_pbc"($P200, $P201)
.annotate 'line', 434
    .return ($P202)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("23_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["Undef"],_)
    .param pmc param_212
    .param pmc param_213
.annotate 'line', 444
    new $P211, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P211, control_210
    push_eh $P211
    .lex "self", self
    .lex "$what", param_212
    .lex "%context", param_213
    .return ()
  control_210:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P214, exception, "payload"
    .return ($P214)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("24_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Sub"],_)
    .param pmc param_218
    .param pmc param_219
.annotate 'line', 448
    .const 'Sub' $P384 = "26_1295186271.69345" 
    capture_lex $P384
    .const 'Sub' $P305 = "25_1295186271.69345" 
    capture_lex $P305
    new $P217, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P217, control_216
    push_eh $P217
    .lex "self", self
    .lex "$sub", param_218
    .lex "%context", param_219
.annotate 'line', 453
    $P220 = root_new ['parrot';'ResizablePMCArray']
    .lex "@n_regs_used", $P220
.annotate 'line', 457
    new $P221, "Undef"
    .lex "$bc", $P221
.annotate 'line', 463
    new $P222, "Undef"
    .lex "$sb", $P222
.annotate 'line', 465
    new $P223, "Undef"
    .lex "$subname", $P223
.annotate 'line', 470
    new $P224, "Undef"
    .lex "$start_offset", $P224
.annotate 'line', 499
    new $P225, "Undef"
    .lex "$end_offset", $P225
.annotate 'line', 506
    $P226 = root_new ['parrot';'Hash']
    .lex "%sub", $P226
.annotate 'line', 533
    new $P227, "Undef"
    .lex "$idx", $P227
.annotate 'line', 450
    find_lex $P228, "$sub"
    find_lex $P229, "%context"
    unless_null $P229, vivify_73
    $P229 = root_new ['parrot';'Hash']
    store_lex "%context", $P229
  vivify_73:
    set $P229["sub"], $P228
.annotate 'line', 453
    find_lex $P230, "%context"
    unless_null $P230, vivify_74
    $P230 = root_new ['parrot';'Hash']
  vivify_74:
    set $P231, $P230["regalloc"]
    unless_null $P231, vivify_75
    new $P231, "Undef"
  vivify_75:
    find_lex $P232, "$sub"
    $P233 = $P231."process"($P232)
    store_lex "@n_regs_used", $P233
.annotate 'line', 454
    find_lex $P235, "%context"
    unless_null $P235, vivify_76
    $P235 = root_new ['parrot';'Hash']
  vivify_76:
    set $P236, $P235["DEBUG"]
    unless_null $P236, vivify_77
    new $P236, "Undef"
  vivify_77:
    unless $P236, if_234_end
    find_lex $P237, "self"
    new $P238, "String"
    assign $P238, "n_regs_used "
    find_lex $P239, "@n_regs_used"
    $S240 = $P239."join"("-")
    concat $P241, $P238, $S240
    $P237."debug"($P241)
  if_234_end:
.annotate 'line', 455
    find_lex $P243, "%context"
    unless_null $P243, vivify_78
    $P243 = root_new ['parrot';'Hash']
  vivify_78:
    set $P244, $P243["DEBUG"]
    unless_null $P244, vivify_79
    new $P244, "Undef"
  vivify_79:
    unless $P244, if_242_end
    find_lex $P245, "self"
    find_lex $P246, "$sub"
    $P245."dumper"($P246, "sub")
  if_242_end:
.annotate 'line', 457
    find_lex $P247, "%context"
    unless_null $P247, vivify_80
    $P247 = root_new ['parrot';'Hash']
  vivify_80:
    set $P248, $P247["bytecode"]
    unless_null $P248, vivify_81
    new $P248, "Undef"
  vivify_81:
    store_lex "$bc", $P248
.annotate 'line', 460
    $P249 = "hash"()
    find_lex $P250, "%context"
    unless_null $P250, vivify_82
    $P250 = root_new ['parrot';'Hash']
    store_lex "%context", $P250
  vivify_82:
    set $P250["labels_todo"], $P249
.annotate 'line', 463
    $P251 = "new"("StringBuilder")
    store_lex "$sb", $P251
.annotate 'line', 464
    find_lex $P252, "$sb"
    find_lex $P253, "$sub"
    $P254 = $P253."name"()
    set $S255, $P254
    $P252."push"($S255)
.annotate 'line', 465
    find_lex $P256, "$sb"
    set $S257, $P256
    new $P258, 'String'
    set $P258, $S257
    store_lex "$subname", $P258
.annotate 'line', 467
    find_lex $P260, "%context"
    unless_null $P260, vivify_83
    $P260 = root_new ['parrot';'Hash']
  vivify_83:
    set $P261, $P260["DEBUG"]
    unless_null $P261, vivify_84
    new $P261, "Undef"
  vivify_84:
    unless $P261, if_259_end
    find_lex $P262, "self"
    new $P263, 'String'
    set $P263, "Emitting "
    find_lex $P264, "$subname"
    concat $P265, $P263, $P264
    $P262."debug"($P265)
  if_259_end:
.annotate 'line', 468
    find_lex $P266, "%context"
    unless_null $P266, vivify_85
    $P266 = root_new ['parrot';'Hash']
  vivify_85:
    set $P267, $P266["constants"]
    unless_null $P267, vivify_86
    new $P267, "Undef"
  vivify_86:
    find_lex $P268, "$subname"
    $P267."get_or_create_string"($P268)
.annotate 'line', 470
    find_lex $P269, "$bc"
    set $N270, $P269
    new $P271, 'Float'
    set $P271, $N270
    store_lex "$start_offset", $P271
.annotate 'line', 471
    find_lex $P273, "%context"
    unless_null $P273, vivify_87
    $P273 = root_new ['parrot';'Hash']
  vivify_87:
    set $P274, $P273["DEBUG"]
    unless_null $P274, vivify_88
    new $P274, "Undef"
  vivify_88:
    unless $P274, if_272_end
    find_lex $P275, "self"
    new $P276, 'String'
    set $P276, "From "
    find_lex $P277, "$start_offset"
    concat $P278, $P276, $P277
    $P275."debug"($P278)
  if_272_end:
.annotate 'line', 474
    find_lex $P280, "$sub"
    unless_null $P280, vivify_89
    $P280 = root_new ['parrot';'Hash']
  vivify_89:
    set $P281, $P280["params"]
    unless_null $P281, vivify_90
    new $P281, "Undef"
  vivify_90:
    if $P281, unless_279_end
    $P282 = "list"()
    find_lex $P283, "$sub"
    unless_null $P283, vivify_91
    $P283 = root_new ['parrot';'Hash']
    store_lex "$sub", $P283
  vivify_91:
    set $P283["params"], $P282
  unless_279_end:
.annotate 'line', 475
    find_lex $P285, "$sub"
    $P286 = $P285."is_method"()
    unless $P286, if_284_end
    find_lex $P287, "$sub"
    unless_null $P287, vivify_92
    $P287 = root_new ['parrot';'Hash']
  vivify_92:
    set $P288, $P287["params"]
    unless_null $P288, vivify_93
    new $P288, "Undef"
  vivify_93:
    get_hll_global $P289, ["POST"], "Value"
    $P290 = $P289."new"("self" :named("name"))
    $P288."unshift"($P290)
  if_284_end:
.annotate 'line', 477
    find_lex $P292, "$sub"
    unless_null $P292, vivify_94
    $P292 = root_new ['parrot';'Hash']
  vivify_94:
    set $P293, $P292["params"]
    unless_null $P293, vivify_95
    new $P293, "Undef"
  vivify_95:
    set $N294, $P293
    unless $N294, if_291_end
.annotate 'line', 478
    find_lex $P295, "self"
    find_lex $P296, "$sub"
    unless_null $P296, vivify_96
    $P296 = root_new ['parrot';'Hash']
  vivify_96:
    set $P297, $P296["params"]
    unless_null $P297, vivify_97
    new $P297, "Undef"
  vivify_97:
    find_lex $P298, "%context"
    $P295."build_pcc_call"("get_params_pc", $P297, $P298)
  if_291_end:
.annotate 'line', 482
    find_lex $P300, "$sub"
    $P301 = $P300."list"()
    defined $I302, $P301
    unless $I302, for_undef_98
    iter $P299, $P301
    new $P312, 'ExceptionHandler'
    set_addr $P312, loop311_handler
    $P312."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P312
  loop311_test:
    unless $P299, loop311_done
    shift $P303, $P299
  loop311_redo:
    .const 'Sub' $P305 = "25_1295186271.69345" 
    capture_lex $P305
    $P305($P303)
  loop311_next:
    goto loop311_test
  loop311_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P313, exception, 'type'
    eq $P313, .CONTROL_LOOP_NEXT, loop311_next
    eq $P313, .CONTROL_LOOP_REDO, loop311_redo
  loop311_done:
    pop_eh 
  for_undef_98:
.annotate 'line', 486
    find_lex $P315, "%context"
    unless_null $P315, vivify_99
    $P315 = root_new ['parrot';'Hash']
  vivify_99:
    set $P316, $P315["DEBUG"]
    unless_null $P316, vivify_100
    new $P316, "Undef"
  vivify_100:
    unless $P316, if_314_end
    find_lex $P317, "self"
    new $P318, 'String'
    set $P318, "Middle "
    find_lex $P319, "$bc"
    set $N320, $P319
    set $S321, $N320
    concat $P322, $P318, $S321
    $P317."debug"($P322)
  if_314_end:
.annotate 'line', 489
    find_lex $P324, "%context"
    unless_null $P324, vivify_101
    $P324 = root_new ['parrot';'Hash']
  vivify_101:
    set $P325, $P324["DEBUG"]
    unless_null $P325, vivify_102
    new $P325, "Undef"
  vivify_102:
    unless $P325, if_323_end
    find_lex $P326, "self"
    $P326."debug"("Emitting default return")
  if_323_end:
.annotate 'line', 490
    find_lex $P327, "$bc"
.annotate 'line', 491
    new $P328, "ResizablePMCArray"
    push $P328, "set_returns_pc"
    push $P328, 0
    $P327."push"($P328)
.annotate 'line', 495
    find_lex $P329, "$bc"
    new $P330, "ResizablePMCArray"
    push $P330, "returncc"
    $P329."push"($P330)
.annotate 'line', 499
    find_lex $P331, "$bc"
    set $N332, $P331
    new $P333, 'Float'
    set $P333, $N332
    store_lex "$end_offset", $P333
.annotate 'line', 500
    find_lex $P335, "%context"
    unless_null $P335, vivify_103
    $P335 = root_new ['parrot';'Hash']
  vivify_103:
    set $P336, $P335["DEBUG"]
    unless_null $P336, vivify_104
    new $P336, "Undef"
  vivify_104:
    unless $P336, if_334_end
    find_lex $P337, "self"
    new $P338, 'String'
    set $P338, "To "
    find_lex $P339, "$end_offset"
    concat $P340, $P338, $P339
    $P337."debug"($P340)
  if_334_end:
.annotate 'line', 503
    find_lex $P341, "self"
    find_lex $P342, "$sub"
    find_lex $P343, "%context"
    unless_null $P343, vivify_105
    $P343 = root_new ['parrot';'Hash']
  vivify_105:
    set $P344, $P343["labels_todo"]
    unless_null $P344, vivify_106
    new $P344, "Undef"
  vivify_106:
    find_lex $P345, "%context"
    unless_null $P345, vivify_107
    $P345 = root_new ['parrot';'Hash']
  vivify_107:
    set $P346, $P345["bytecode"]
    unless_null $P346, vivify_108
    new $P346, "Undef"
  vivify_108:
    find_lex $P347, "%context"
    $P341."fixup_labels"($P342, $P344, $P346, $P347)
.annotate 'line', 506
    find_lex $P348, "$start_offset"
    find_lex $P349, "$end_offset"
    find_lex $P350, "$subname"
.annotate 'line', 511
    find_lex $P352, "$sub"
    unless_null $P352, vivify_109
    $P352 = root_new ['parrot';'Hash']
  vivify_109:
    set $P353, $P352["subid"]
    unless_null $P353, vivify_110
    new $P353, "Undef"
  vivify_110:
    set $P351, $P353
    defined $I355, $P351
    if $I355, default_354
    find_lex $P356, "$subname"
    set $P351, $P356
  default_354:
.annotate 'line', 512
    find_lex $P358, "$sub"
    $P359 = $P358."nsentry"()
    set $P357, $P359
    defined $I361, $P357
    if $I361, default_360
    find_lex $P362, "$subname"
    set $P357, $P362
  default_360:
.annotate 'line', 515
    find_lex $P365, "$sub"
    $P366 = $P365."is_method"()
    if $P366, if_364
    new $P368, "String"
    assign $P368, ""
    set $P363, $P368
    goto if_364_end
  if_364:
    find_lex $P367, "$subname"
    set $P363, $P367
  if_364_end:
    find_lex $P369, "@n_regs_used"
.annotate 'line', 519
    find_lex $P370, "self"
    find_lex $P371, "$sub"
    find_lex $P372, "%context"
    $P373 = $P370."create_sub_pf_flags"($P371, $P372)
.annotate 'line', 520
    find_lex $P374, "self"
    find_lex $P375, "$sub"
    find_lex $P376, "%context"
    $P377 = $P374."create_sub_comp_flags"($P375, $P376)
    $P378 = "hash"($P348 :named("start_offs"), $P349 :named("end_offs"), $P350 :named("name"), $P351 :named("subid"), $P357 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P363 :named("method_name"), $P369 :named("n_regs_used"), $P373 :named("pf_flags"), $P377 :named("comp_flags"))
.annotate 'line', 506
    store_lex "%sub", $P378
.annotate 'line', 523
    find_lex $P380, "$sub"
    $P381 = $P380."namespace"()
    $P382 = "defined"($P381)
    unless $P382, if_379_end
    .const 'Sub' $P384 = "26_1295186271.69345" 
    capture_lex $P384
    $P384()
  if_379_end:
.annotate 'line', 533
    find_lex $P398, "$sub"
    $P399 = $P398."constant_index"()
    store_lex "$idx", $P399
.annotate 'line', 534
    find_lex $P401, "$idx"
    $P402 = "defined"($P401)
    if $P402, if_400
.annotate 'line', 539
    find_lex $P416, "%context"
    unless_null $P416, vivify_113
    $P416 = root_new ['parrot';'Hash']
  vivify_113:
    set $P417, $P416["constants"]
    unless_null $P417, vivify_114
    new $P417, "Undef"
  vivify_114:
    find_lex $P418, "%sub"
    $P419 = "new"("Sub", $P418)
    $P420 = $P417."push"($P419)
    store_lex "$idx", $P420
.annotate 'line', 540
    find_lex $P421, "$sub"
    find_lex $P422, "$idx"
    $P421."constant_index"($P422)
.annotate 'line', 541
    find_lex $P424, "%context"
    unless_null $P424, vivify_115
    $P424 = root_new ['parrot';'Hash']
  vivify_115:
    set $P425, $P424["DEBUG"]
    unless_null $P425, vivify_116
    new $P425, "Undef"
  vivify_116:
    unless $P425, if_423_end
    find_lex $P426, "self"
    new $P427, 'String'
    set $P427, "Allocate new constant "
    find_lex $P428, "$idx"
    concat $P429, $P427, $P428
    $P426."debug"($P429)
  if_423_end:
.annotate 'line', 538
    goto if_400_end
  if_400:
.annotate 'line', 535
    find_lex $P404, "%context"
    unless_null $P404, vivify_117
    $P404 = root_new ['parrot';'Hash']
  vivify_117:
    set $P405, $P404["DEBUG"]
    unless_null $P405, vivify_118
    new $P405, "Undef"
  vivify_118:
    unless $P405, if_403_end
    find_lex $P406, "self"
    new $P407, 'String'
    set $P407, "Reusing old constant "
    find_lex $P408, "$idx"
    concat $P409, $P407, $P408
    $P406."debug"($P409)
  if_403_end:
.annotate 'line', 536
    find_lex $P410, "%sub"
    $P411 = "new"("Sub", $P410)
    find_lex $P412, "$idx"
    set $I413, $P412
    find_lex $P414, "%context"
    unless_null $P414, vivify_119
    $P414 = root_new ['parrot';'Hash']
    store_lex "%context", $P414
  vivify_119:
    set $P415, $P414["constants"]
    unless_null $P415, vivify_120
    $P415 = root_new ['parrot';'ResizablePMCArray']
    set $P414["constants"], $P415
  vivify_120:
    set $P415[$I413], $P411
  if_400_end:
.annotate 'line', 545
    find_lex $P432, "%context"
    unless_null $P432, vivify_121
    $P432 = root_new ['parrot';'Hash']
  vivify_121:
    set $P433, $P432["got_main_sub"]
    unless_null $P433, vivify_122
    new $P433, "Undef"
  vivify_122:
    isfalse $I434, $P433
    if $I434, if_431
    new $P430, 'Integer'
    set $P430, $I434
    goto if_431_end
  if_431:
.annotate 'line', 546
    find_lex $P436, "%context"
    unless_null $P436, vivify_123
    $P436 = root_new ['parrot';'Hash']
  vivify_123:
    set $P437, $P436["DEBUG"]
    unless_null $P437, vivify_124
    new $P437, "Undef"
  vivify_124:
    unless $P437, if_435_end
    find_lex $P438, "self"
    new $P439, 'String'
    set $P439, "main_sub is "
    find_lex $P440, "%context"
    unless_null $P440, vivify_125
    $P440 = root_new ['parrot';'Hash']
  vivify_125:
    set $P441, $P440["bytecode"]
    unless_null $P441, vivify_126
    new $P441, "Undef"
  vivify_126:
    $P442 = $P441."main_sub"()
    set $S443, $P442
    concat $P444, $P439, $S443
    $P438."debug"($P444)
  if_435_end:
.annotate 'line', 547
    find_lex $P446, "$sub"
    $P447 = $P446."main"()
    if $P447, if_445
.annotate 'line', 553
    find_lex $P458, "%context"
    unless_null $P458, vivify_127
    $P458 = root_new ['parrot';'Hash']
  vivify_127:
    set $P459, $P458["bytecode"]
    unless_null $P459, vivify_128
    new $P459, "Undef"
  vivify_128:
    $N460 = $P459."main_sub"()
    iseq $I461, $N460, -1.0
    unless $I461, if_457_end
.annotate 'line', 555
    find_lex $P463, "%context"
    unless_null $P463, vivify_129
    $P463 = root_new ['parrot';'Hash']
  vivify_129:
    set $P464, $P463["DEBUG"]
    unless_null $P464, vivify_130
    new $P464, "Undef"
  vivify_130:
    unless $P464, if_462_end
    find_lex $P465, "self"
    $P465."debug"("Got first sub")
  if_462_end:
.annotate 'line', 556
    find_lex $P466, "%context"
    unless_null $P466, vivify_131
    $P466 = root_new ['parrot';'Hash']
  vivify_131:
    set $P467, $P466["bytecode"]
    unless_null $P467, vivify_132
    new $P467, "Undef"
  vivify_132:
    find_lex $P468, "$idx"
    $P467."main_sub"($P468)
  if_457_end:
.annotate 'line', 553
    goto if_445_end
  if_445:
.annotate 'line', 548
    find_lex $P449, "%context"
    unless_null $P449, vivify_133
    $P449 = root_new ['parrot';'Hash']
  vivify_133:
    set $P450, $P449["DEBUG"]
    unless_null $P450, vivify_134
    new $P450, "Undef"
  vivify_134:
    unless $P450, if_448_end
    find_lex $P451, "self"
    $P451."debug"("Got first :main")
  if_448_end:
.annotate 'line', 550
    find_lex $P452, "%context"
    unless_null $P452, vivify_135
    $P452 = root_new ['parrot';'Hash']
  vivify_135:
    set $P453, $P452["bytecode"]
    unless_null $P453, vivify_136
    new $P453, "Undef"
  vivify_136:
    find_lex $P454, "$idx"
    $P453."main_sub"($P454)
.annotate 'line', 551
    new $P455, "Integer"
    assign $P455, 1
    find_lex $P456, "%context"
    unless_null $P456, vivify_137
    $P456 = root_new ['parrot';'Hash']
    store_lex "%context", $P456
  vivify_137:
    set $P456["got_main_sub"], $P455
  if_445_end:
.annotate 'line', 559
    find_lex $P471, "%context"
    unless_null $P471, vivify_138
    $P471 = root_new ['parrot';'Hash']
  vivify_138:
    set $P472, $P471["DEBUG"]
    unless_null $P472, vivify_139
    new $P472, "Undef"
  vivify_139:
    if $P472, if_470
    set $P469, $P472
    goto if_470_end
  if_470:
    find_lex $P473, "self"
    new $P474, 'String'
    set $P474, ":main sub is "
    find_lex $P475, "%context"
    unless_null $P475, vivify_140
    $P475 = root_new ['parrot';'Hash']
  vivify_140:
    set $P476, $P475["bytecode"]
    unless_null $P476, vivify_141
    new $P476, "Undef"
  vivify_141:
    $P477 = $P476."main_sub"()
    set $S478, $P477
    concat $P479, $P474, $S478
    $P480 = $P473."debug"($P479)
    set $P469, $P480
  if_470_end:
.annotate 'line', 545
    set $P430, $P469
  if_431_end:
.annotate 'line', 448
    .return ($P430)
  control_216:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P481, exception, "payload"
    .return ($P481)
.end


.namespace ["POST";"Compiler"]
.sub "_block304"  :anon :subid("25_1295186271.69345") :outer("24_1295186271.69345")
    .param pmc param_306
.annotate 'line', 482
    .lex "$_", param_306
.annotate 'line', 483
    find_lex $P307, "self"
    find_lex $P308, "$_"
    find_lex $P309, "%context"
    $P310 = $P307."to_pbc"($P308, $P309)
.annotate 'line', 482
    .return ($P310)
.end


.namespace ["POST";"Compiler"]
.sub "_block383"  :anon :subid("26_1295186271.69345") :outer("24_1295186271.69345")
.annotate 'line', 524
    new $P385, "Undef"
    .lex "$nskey", $P385
    find_lex $P386, "$sub"
    $P387 = $P386."namespace"()
    find_lex $P388, "%context"
    $P389 = $P387."to_pmc"($P388)
    set $P390, $P389[0]
    unless_null $P390, vivify_111
    new $P390, "Undef"
  vivify_111:
    store_lex "$nskey", $P390
.annotate 'line', 525
    find_lex $P393, "$nskey"
    typeof $S394, $P393
    iseq $I395, $S394, "Key"
    if $I395, if_392
    new $P391, 'Integer'
    set $P391, $I395
    goto if_392_end
  if_392:
.annotate 'line', 526
    find_lex $P396, "$nskey"
    find_lex $P397, "%sub"
    unless_null $P397, vivify_112
    $P397 = root_new ['parrot';'Hash']
    store_lex "%sub", $P397
  vivify_112:
    set $P397["namespace_name"], $P396
.annotate 'line', 525
    set $P391, $P396
  if_392_end:
.annotate 'line', 523
    .return ($P391)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("27_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Op"],_)
    .param pmc param_485
    .param pmc param_486
.annotate 'line', 563
    .const 'Sub' $P549 = "29_1295186271.69345" 
    capture_lex $P549
    .const 'Sub' $P504 = "28_1295186271.69345" 
    capture_lex $P504
    new $P484, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P484, control_483
    push_eh $P484
    .lex "self", self
    .lex "$op", param_485
    .lex "%context", param_486
.annotate 'line', 565
    new $P487, "Undef"
    .lex "$fullname", $P487
.annotate 'line', 580
    $P488 = root_new ['parrot';'ResizablePMCArray']
    .lex "@op", $P488
.annotate 'line', 565
    find_lex $P489, "$op"
    $P490 = $P489."pirop"()
    store_lex "$fullname", $P490
.annotate 'line', 566
    find_lex $P492, "%context"
    unless_null $P492, vivify_142
    $P492 = root_new ['parrot';'Hash']
  vivify_142:
    set $P493, $P492["DEBUG"]
    unless_null $P493, vivify_143
    new $P493, "Undef"
  vivify_143:
    unless $P493, if_491_end
    find_lex $P494, "self"
    new $P495, 'String'
    set $P495, "Short name "
    find_lex $P496, "$fullname"
    concat $P497, $P495, $P496
    $P494."debug"($P497)
  if_491_end:
.annotate 'line', 568
    find_lex $P499, "$op"
    $P500 = $P499."list"()
    defined $I501, $P500
    unless $I501, for_undef_144
    iter $P498, $P500
    new $P525, 'ExceptionHandler'
    set_addr $P525, loop524_handler
    $P525."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P525
  loop524_test:
    unless $P498, loop524_done
    shift $P502, $P498
  loop524_redo:
    .const 'Sub' $P504 = "28_1295186271.69345" 
    capture_lex $P504
    $P504($P502)
  loop524_next:
    goto loop524_test
  loop524_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P526, exception, 'type'
    eq $P526, .CONTROL_LOOP_NEXT, loop524_next
    eq $P526, .CONTROL_LOOP_REDO, loop524_redo
  loop524_done:
    pop_eh 
  for_undef_144:
.annotate 'line', 573
    find_lex $P528, "%context"
    unless_null $P528, vivify_145
    $P528 = root_new ['parrot';'Hash']
  vivify_145:
    set $P529, $P528["DEBUG"]
    unless_null $P529, vivify_146
    new $P529, "Undef"
  vivify_146:
    unless $P529, if_527_end
    find_lex $P530, "self"
    new $P531, 'String'
    set $P531, "Fullname "
    find_lex $P532, "$fullname"
    concat $P533, $P531, $P532
    $P530."debug"($P533)
  if_527_end:
.annotate 'line', 576
    find_lex $P534, "%context"
    unless_null $P534, vivify_147
    $P534 = root_new ['parrot';'Hash']
  vivify_147:
    set $P535, $P534["bytecode"]
    unless_null $P535, vivify_148
    new $P535, "Undef"
  vivify_148:
    set $N536, $P535
    new $P537, 'Float'
    set $P537, $N536
    find_lex $P538, "%context"
    unless_null $P538, vivify_149
    $P538 = root_new ['parrot';'Hash']
    store_lex "%context", $P538
  vivify_149:
    set $P538["opcode_offset"], $P537
.annotate 'line', 578
    find_lex $P539, "$fullname"
    find_lex $P540, "%context"
    unless_null $P540, vivify_150
    $P540 = root_new ['parrot';'Hash']
    store_lex "%context", $P540
  vivify_150:
    set $P540["opcode_fullname"], $P539
.annotate 'line', 580
    find_lex $P541, "$fullname"
    $P542 = "list"($P541)
    store_lex "@op", $P542
.annotate 'line', 581
    find_lex $P544, "$op"
    $P545 = $P544."list"()
    defined $I546, $P545
    unless $I546, for_undef_151
    iter $P543, $P545
    new $P558, 'ExceptionHandler'
    set_addr $P558, loop557_handler
    $P558."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P558
  loop557_test:
    unless $P543, loop557_done
    shift $P547, $P543
  loop557_redo:
    .const 'Sub' $P549 = "29_1295186271.69345" 
    capture_lex $P549
    $P549($P547)
  loop557_next:
    goto loop557_test
  loop557_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P559, exception, 'type'
    eq $P559, .CONTROL_LOOP_NEXT, loop557_next
    eq $P559, .CONTROL_LOOP_REDO, loop557_redo
  loop557_done:
    pop_eh 
  for_undef_151:
.annotate 'line', 584
    find_lex $P561, "%context"
    unless_null $P561, vivify_152
    $P561 = root_new ['parrot';'Hash']
  vivify_152:
    set $P562, $P561["DEBUG"]
    unless_null $P562, vivify_153
    new $P562, "Undef"
  vivify_153:
    unless $P562, if_560_end
    find_lex $P563, "self"
    new $P564, 'String'
    set $P564, "Op size "
    find_lex $P565, "@op"
    set $N566, $P565
    set $S567, $N566
    concat $P568, $P564, $S567
    $P563."debug"($P568)
  if_560_end:
.annotate 'line', 585
    find_lex $P569, "%context"
    unless_null $P569, vivify_154
    $P569 = root_new ['parrot';'Hash']
  vivify_154:
    set $P570, $P569["bytecode"]
    unless_null $P570, vivify_155
    new $P570, "Undef"
  vivify_155:
    find_lex $P571, "@op"
    $P572 = $P570."push"($P571)
.annotate 'line', 563
    .return ($P572)
  control_483:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P573, exception, "payload"
    .return ($P573)
.end


.namespace ["POST";"Compiler"]
.sub "_block503"  :anon :subid("28_1295186271.69345") :outer("27_1295186271.69345")
    .param pmc param_506
.annotate 'line', 569
    new $P505, "Undef"
    .lex "$type", $P505
    .lex "$_", param_506
    find_lex $P509, "$_"
    $P510 = $P509."type"()
    unless $P510, unless_508
    set $P507, $P510
    goto unless_508_end
  unless_508:
    find_lex $P511, "self"
    find_lex $P512, "$_"
    $P513 = $P512."name"()
    find_lex $P514, "%context"
    $P515 = $P511."get_register"($P513, $P514)
    $P516 = $P515."type"()
    set $P507, $P516
  unless_508_end:
    store_lex "$type", $P507
.annotate 'line', 570
    find_lex $P517, "$fullname"
    set $S518, $P517
    new $P519, 'String'
    set $P519, $S518
    concat $P520, $P519, "_"
    find_lex $P521, "$type"
    set $S522, $P521
    concat $P523, $P520, $S522
    store_lex "$fullname", $P523
.annotate 'line', 568
    .return ($P523)
.end


.namespace ["POST";"Compiler"]
.sub "_block548"  :anon :subid("29_1295186271.69345") :outer("27_1295186271.69345")
    .param pmc param_550
.annotate 'line', 581
    .lex "$_", param_550
.annotate 'line', 582
    find_lex $P551, "@op"
    find_lex $P552, "self"
    find_lex $P553, "$_"
    find_lex $P554, "%context"
    $P555 = $P552."to_op"($P553, $P554)
    $P556 = $P551."push"($P555)
.annotate 'line', 581
    .return ($P556)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("30_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Node"],_)
    .param pmc param_577
    .param pmc param_578
.annotate 'line', 589
    .const 'Sub' $P585 = "31_1295186271.69345" 
    capture_lex $P585
    new $P576, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P576, control_575
    push_eh $P576
    .lex "self", self
    .lex "$node", param_577
    .lex "%context", param_578
.annotate 'line', 590
    find_lex $P580, "$node"
    $P581 = $P580."list"()
    defined $I582, $P581
    unless $I582, for_undef_156
    iter $P579, $P581
    new $P592, 'ExceptionHandler'
    set_addr $P592, loop591_handler
    $P592."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P592
  loop591_test:
    unless $P579, loop591_done
    shift $P583, $P579
  loop591_redo:
    .const 'Sub' $P585 = "31_1295186271.69345" 
    capture_lex $P585
    $P585($P583)
  loop591_next:
    goto loop591_test
  loop591_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P593, exception, 'type'
    eq $P593, .CONTROL_LOOP_NEXT, loop591_next
    eq $P593, .CONTROL_LOOP_REDO, loop591_redo
  loop591_done:
    pop_eh 
  for_undef_156:
.annotate 'line', 589
    .return ($P579)
  control_575:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P594, exception, "payload"
    .return ($P594)
.end


.namespace ["POST";"Compiler"]
.sub "_block584"  :anon :subid("31_1295186271.69345") :outer("30_1295186271.69345")
    .param pmc param_586
.annotate 'line', 590
    .lex "$_", param_586
.annotate 'line', 591
    find_lex $P587, "self"
    find_lex $P588, "$_"
    find_lex $P589, "%context"
    $P590 = $P587."to_pbc"($P588, $P589)
.annotate 'line', 590
    .return ($P590)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("32_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Label"],_)
    .param pmc param_598
    .param pmc param_599
.annotate 'line', 595
    .const 'Sub' $P631 = "33_1295186271.69345" 
    capture_lex $P631
    new $P597, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P597, control_596
    push_eh $P597
    .lex "self", self
    .lex "$l", param_598
    .lex "%context", param_599
.annotate 'line', 596
    new $P600, "Undef"
    .lex "$bc", $P600
.annotate 'line', 599
    new $P601, "Undef"
    .lex "$pos", $P601
.annotate 'line', 596
    find_lex $P602, "%context"
    unless_null $P602, vivify_157
    $P602 = root_new ['parrot';'Hash']
  vivify_157:
    set $P603, $P602["bytecode"]
    unless_null $P603, vivify_158
    new $P603, "Undef"
  vivify_158:
    store_lex "$bc", $P603
.annotate 'line', 597
    find_lex $P605, "$l"
    $P606 = $P605."declared"()
    if $P606, unless_604_end
    find_lex $P607, "self"
    $P607."panic"("Trying to emit undelcared label!")
  unless_604_end:
.annotate 'line', 599
    find_lex $P608, "$bc"
    set $N609, $P608
    new $P610, 'Float'
    set $P610, $N609
    store_lex "$pos", $P610
.annotate 'line', 600
    find_lex $P612, "%context"
    unless_null $P612, vivify_159
    $P612 = root_new ['parrot';'Hash']
  vivify_159:
    set $P613, $P612["DEBUG"]
    unless_null $P613, vivify_160
    new $P613, "Undef"
  vivify_160:
    unless $P613, if_611_end
    find_lex $P614, "self"
    new $P615, 'String'
    set $P615, "Declare label '"
    find_lex $P616, "$l"
    $P617 = $P616."name"()
    set $S618, $P617
    concat $P619, $P615, $S618
    concat $P620, $P619, "' at "
    find_lex $P621, "$pos"
    concat $P622, $P620, $P621
    $P614."debug"($P622)
  if_611_end:
.annotate 'line', 602
    find_lex $P623, "$l"
    find_lex $P624, "$pos"
    $P623."position"($P624)
.annotate 'line', 604
    find_lex $P626, "$l"
    $P627 = $P626."list"()
    defined $I628, $P627
    unless $I628, for_undef_161
    iter $P625, $P627
    new $P638, 'ExceptionHandler'
    set_addr $P638, loop637_handler
    $P638."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P638
  loop637_test:
    unless $P625, loop637_done
    shift $P629, $P625
  loop637_redo:
    .const 'Sub' $P631 = "33_1295186271.69345" 
    capture_lex $P631
    $P631($P629)
  loop637_next:
    goto loop637_test
  loop637_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P639, exception, 'type'
    eq $P639, .CONTROL_LOOP_NEXT, loop637_next
    eq $P639, .CONTROL_LOOP_REDO, loop637_redo
  loop637_done:
    pop_eh 
  for_undef_161:
.annotate 'line', 595
    .return ($P625)
  control_596:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P640, exception, "payload"
    .return ($P640)
.end


.namespace ["POST";"Compiler"]
.sub "_block630"  :anon :subid("33_1295186271.69345") :outer("32_1295186271.69345")
    .param pmc param_632
.annotate 'line', 604
    .lex "$_", param_632
.annotate 'line', 605
    find_lex $P633, "self"
    find_lex $P634, "$_"
    find_lex $P635, "%context"
    $P636 = $P633."to_pbc"($P634, $P635)
.annotate 'line', 604
    .return ($P636)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc"  :subid("34_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Call"],_)
    .param pmc param_644
    .param pmc param_645
.annotate 'line', 609
    .const 'Sub' $P710 = "35_1295186271.69345" 
    capture_lex $P710
    new $P643, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P643, control_642
    push_eh $P643
    .lex "self", self
    .lex "$call", param_644
    .lex "%context", param_645
.annotate 'line', 610
    new $P646, "Undef"
    .lex "$bc", $P646
.annotate 'line', 611
    new $P647, "Undef"
    .lex "$calltype", $P647
.annotate 'line', 612
    new $P648, "Undef"
    .lex "$is_tailcall", $P648
.annotate 'line', 610
    find_lex $P649, "%context"
    unless_null $P649, vivify_162
    $P649 = root_new ['parrot';'Hash']
  vivify_162:
    set $P650, $P649["bytecode"]
    unless_null $P650, vivify_163
    new $P650, "Undef"
  vivify_163:
    store_lex "$bc", $P650
.annotate 'line', 611
    find_lex $P651, "$call"
    $P652 = $P651."calltype"()
    store_lex "$calltype", $P652
.annotate 'line', 612
    find_lex $P653, "$calltype"
    set $S654, $P653
    iseq $I655, $S654, "tailcall"
    new $P656, 'Integer'
    set $P656, $I655
    store_lex "$is_tailcall", $P656
.annotate 'line', 614
    find_lex $P661, "$calltype"
    set $S662, $P661
    iseq $I663, $S662, "call"
    unless $I663, unless_660
    new $P659, 'Integer'
    set $P659, $I663
    goto unless_660_end
  unless_660:
    find_lex $P664, "$calltype"
    set $S665, $P664
    iseq $I666, $S665, "tailcall"
    new $P659, 'Integer'
    set $P659, $I666
  unless_660_end:
    if $P659, if_658
.annotate 'line', 692
    find_lex $P850, "$calltype"
    set $S851, $P850
    iseq $I852, $S851, "return"
    if $I852, if_849
.annotate 'line', 696
    find_lex $P862, "$calltype"
    set $S863, $P862
    iseq $I864, $S863, "results"
    if $I864, if_861
.annotate 'line', 701
    find_lex $P870, "self"
    new $P871, 'String'
    set $P871, "NYI "
    find_lex $P872, "$calltype"
    set $S873, $P872
    concat $P874, $P871, $S873
    $P875 = $P870."panic"($P874)
.annotate 'line', 700
    set $P860, $P875
.annotate 'line', 696
    goto if_861_end
  if_861:
.annotate 'line', 698
    find_lex $P865, "self"
    find_lex $P866, "$call"
    unless_null $P866, vivify_164
    $P866 = root_new ['parrot';'Hash']
  vivify_164:
    set $P867, $P866["params"]
    unless_null $P867, vivify_165
    new $P867, "Undef"
  vivify_165:
    find_lex $P868, "%context"
    $P869 = $P865."build_pcc_call"("get_results_pc", $P867, $P868)
.annotate 'line', 696
    set $P860, $P869
  if_861_end:
    set $P848, $P860
.annotate 'line', 692
    goto if_849_end
  if_849:
.annotate 'line', 693
    find_lex $P853, "self"
    find_lex $P854, "$call"
    unless_null $P854, vivify_166
    $P854 = root_new ['parrot';'Hash']
  vivify_166:
    set $P855, $P854["params"]
    unless_null $P855, vivify_167
    new $P855, "Undef"
  vivify_167:
    find_lex $P856, "%context"
    $P853."build_pcc_call"("set_returns_pc", $P855, $P856)
.annotate 'line', 694
    find_lex $P857, "$bc"
    new $P858, "ResizablePMCArray"
    push $P858, "returncc"
    $P859 = $P857."push"($P858)
.annotate 'line', 692
    set $P848, $P859
  if_849_end:
    set $P657, $P848
.annotate 'line', 614
    goto if_658_end
  if_658:
.annotate 'line', 615
    find_lex $P668, "$call"
    $P669 = $P668."invocant"()
    unless $P669, if_667_end
.annotate 'line', 616
    find_lex $P671, "$call"
    unless_null $P671, vivify_168
    $P671 = root_new ['parrot';'Hash']
  vivify_168:
    set $P672, $P671["params"]
    unless_null $P672, vivify_169
    new $P672, "Undef"
  vivify_169:
    if $P672, unless_670_end
    $P673 = "list"()
    find_lex $P674, "$call"
    unless_null $P674, vivify_170
    $P674 = root_new ['parrot';'Hash']
    store_lex "$call", $P674
  vivify_170:
    set $P674["params"], $P673
  unless_670_end:
.annotate 'line', 617
    find_lex $P675, "$call"
    unless_null $P675, vivify_171
    $P675 = root_new ['parrot';'Hash']
  vivify_171:
    set $P676, $P675["params"]
    unless_null $P676, vivify_172
    new $P676, "Undef"
  vivify_172:
    find_lex $P677, "$call"
    $P678 = $P677."invocant"()
    $P676."unshift"($P678)
  if_667_end:
.annotate 'line', 620
    find_lex $P679, "self"
    find_lex $P680, "$call"
    unless_null $P680, vivify_173
    $P680 = root_new ['parrot';'Hash']
  vivify_173:
    set $P681, $P680["params"]
    unless_null $P681, vivify_174
    new $P681, "Undef"
  vivify_174:
    find_lex $P682, "%context"
    $P679."build_pcc_call"("set_args_pc", $P681, $P682)
.annotate 'line', 622
    find_lex $P684, "$call"
    $P685 = $P684."invocant"()
    if $P685, if_683
.annotate 'line', 636
    .const 'Sub' $P710 = "35_1295186271.69345" 
    capture_lex $P710
    $P710()
    goto if_683_end
  if_683:
.annotate 'line', 623
    find_lex $P687, "$call"
    $P688 = $P687."name"()
    get_hll_global $P689, ["POST"], "Constant"
    $P690 = $P688."isa"($P689)
    if $P690, if_686
.annotate 'line', 633
    find_lex $P708, "self"
    $P708."panic"("NYI $P0.$S0()")
.annotate 'line', 632
    goto if_686_end
  if_686:
.annotate 'line', 624
    find_lex $P691, "$bc"
.annotate 'line', 626
    find_lex $P694, "$is_tailcall"
    if $P694, if_693
    new $P696, "String"
    assign $P696, "callmethodcc_p_sc"
    set $P692, $P696
    goto if_693_end
  if_693:
    new $P695, "String"
    assign $P695, "tailcallmethod_p_sc"
    set $P692, $P695
  if_693_end:
.annotate 'line', 628
    find_lex $P697, "self"
    find_lex $P698, "$call"
    $P699 = $P698."invocant"()
    find_lex $P700, "%context"
    $P701 = $P697."to_op"($P699, $P700)
.annotate 'line', 629
    find_lex $P702, "self"
    find_lex $P703, "$call"
    $P704 = $P703."name"()
    find_lex $P705, "%context"
    $P706 = $P702."to_op"($P704, $P705)
    new $P707, "ResizablePMCArray"
    push $P707, $P692
    push $P707, $P701
    push $P707, $P706
    $P691."push"($P707)
  if_686_end:
  if_683_end:
.annotate 'line', 688
    find_lex $P842, "$is_tailcall"
    unless $P842, unless_841
    set $P840, $P842
    goto unless_841_end
  unless_841:
.annotate 'line', 689
    find_lex $P843, "self"
    find_lex $P844, "$call"
    unless_null $P844, vivify_204
    $P844 = root_new ['parrot';'Hash']
  vivify_204:
    set $P845, $P844["results"]
    unless_null $P845, vivify_205
    new $P845, "Undef"
  vivify_205:
    find_lex $P846, "%context"
    $P847 = $P843."build_pcc_call"("get_results_pc", $P845, $P846)
.annotate 'line', 688
    set $P840, $P847
  unless_841_end:
.annotate 'line', 614
    set $P657, $P840
  if_658_end:
.annotate 'line', 609
    .return ($P657)
  control_642:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P876, exception, "payload"
    .return ($P876)
.end


.namespace ["POST";"Compiler"]
.sub "_block709"  :anon :subid("35_1295186271.69345") :outer("34_1295186271.69345")
.annotate 'line', 636
    .const 'Sub' $P722 = "36_1295186271.69345" 
    capture_lex $P722
.annotate 'line', 637
    new $P711, "Undef"
    .lex "$SUB", $P711
.annotate 'line', 638
    new $P712, "Undef"
    .lex "$processed", $P712
.annotate 'line', 682
    new $P713, "Undef"
    .lex "$o", $P713
.annotate 'line', 636
    find_lex $P714, "$SUB"
.annotate 'line', 638
    new $P715, "Integer"
    assign $P715, 0
    store_lex "$processed", $P715
.annotate 'line', 639
    find_lex $P717, "$call"
    $P718 = $P717."name"()
    get_hll_global $P719, ["POST"], "Constant"
    $P720 = $P718."isa"($P719)
    unless $P720, if_716_end
    .const 'Sub' $P722 = "36_1295186271.69345" 
    capture_lex $P722
    $P722()
  if_716_end:
.annotate 'line', 667
    find_lex $P791, "$processed"
    if $P791, unless_790_end
.annotate 'line', 668
    find_lex $P793, "$call"
    $P794 = $P793."name"()
    get_hll_global $P795, ["POST"], "Constant"
    $P796 = $P794."isa"($P795)
    if $P796, if_792
.annotate 'line', 677
    find_lex $P812, "%context"
    unless_null $P812, vivify_192
    $P812 = root_new ['parrot';'Hash']
  vivify_192:
    set $P813, $P812["DEBUG"]
    unless_null $P813, vivify_193
    new $P813, "Undef"
  vivify_193:
    unless $P813, if_811_end
    find_lex $P814, "self"
    new $P815, "String"
    assign $P815, "Name is "
    find_lex $P816, "$call"
    unless_null $P816, vivify_194
    $P816 = root_new ['parrot';'Hash']
  vivify_194:
    set $P817, $P816["name"]
    unless_null $P817, vivify_195
    new $P817, "Undef"
  vivify_195:
    $S818 = $P817."WHAT"()
    concat $P819, $P815, $S818
    $P814."debug"($P819)
  if_811_end:
.annotate 'line', 678
    find_lex $P820, "$call"
    unless_null $P820, vivify_196
    $P820 = root_new ['parrot';'Hash']
  vivify_196:
    set $P821, $P820["name"]
    unless_null $P821, vivify_197
    new $P821, "Undef"
  vivify_197:
    store_lex "$SUB", $P821
.annotate 'line', 676
    goto if_792_end
  if_792:
.annotate 'line', 669
    find_lex $P797, "%context"
    unless_null $P797, vivify_198
    $P797 = root_new ['parrot';'Hash']
  vivify_198:
    set $P798, $P797["sub"]
    unless_null $P798, vivify_199
    new $P798, "Undef"
  vivify_199:
    $P799 = $P798."symbol"("!SUB")
    store_lex "$SUB", $P799
.annotate 'line', 670
    find_lex $P800, "$bc"
.annotate 'line', 672
    find_lex $P801, "self"
    find_lex $P802, "$SUB"
    find_lex $P803, "%context"
    $P804 = $P801."to_op"($P802, $P803)
.annotate 'line', 673
    find_lex $P805, "self"
    find_lex $P806, "$call"
    unless_null $P806, vivify_200
    $P806 = root_new ['parrot';'Hash']
  vivify_200:
    set $P807, $P806["name"]
    unless_null $P807, vivify_201
    new $P807, "Undef"
  vivify_201:
    find_lex $P808, "%context"
    $P809 = $P805."to_op"($P807, $P808)
    new $P810, "ResizablePMCArray"
    push $P810, "find_sub_not_null_p_sc"
    push $P810, $P804
    push $P810, $P809
    $P800."push"($P810)
  if_792_end:
  unless_790_end:
.annotate 'line', 682
    find_lex $P824, "$is_tailcall"
    if $P824, if_823
    new $P826, "String"
    assign $P826, "invokecc_p"
    set $P822, $P826
    goto if_823_end
  if_823:
    new $P825, "String"
    assign $P825, "tailcall_p"
    set $P822, $P825
  if_823_end:
    store_lex "$o", $P822
.annotate 'line', 684
    find_lex $P828, "%context"
    unless_null $P828, vivify_202
    $P828 = root_new ['parrot';'Hash']
  vivify_202:
    set $P829, $P828["DEBUG"]
    unless_null $P829, vivify_203
    new $P829, "Undef"
  vivify_203:
    unless $P829, if_827_end
    find_lex $P830, "self"
    find_lex $P831, "$o"
    $P830."debug"($P831)
  if_827_end:
.annotate 'line', 685
    find_lex $P832, "$bc"
    find_lex $P833, "$o"
    find_lex $P834, "self"
    find_lex $P835, "$SUB"
    find_lex $P836, "%context"
    $P837 = $P834."to_op"($P835, $P836)
    new $P838, "ResizablePMCArray"
    push $P838, $P833
    push $P838, $P837
    $P839 = $P832."push"($P838)
.annotate 'line', 636
    .return ($P839)
.end


.namespace ["POST";"Compiler"]
.sub "_block721"  :anon :subid("36_1295186271.69345") :outer("35_1295186271.69345")
.annotate 'line', 639
    .const 'Sub' $P758 = "37_1295186271.69345" 
    capture_lex $P758
.annotate 'line', 642
    new $P723, "Undef"
    .lex "$full_name", $P723
.annotate 'line', 645
    new $P724, "Undef"
    .lex "$invocable_sub", $P724
.annotate 'line', 639
    find_lex $P725, "$full_name"
.annotate 'line', 643
    find_lex $P727, "%context"
    unless_null $P727, vivify_175
    $P727 = root_new ['parrot';'Hash']
  vivify_175:
    set $P728, $P727["sub"]
    unless_null $P728, vivify_176
    new $P728, "Undef"
  vivify_176:
    $P729 = $P728."namespace"()
    unless $P729, if_726_end
    find_lex $P730, "%context"
    unless_null $P730, vivify_177
    $P730 = root_new ['parrot';'Hash']
  vivify_177:
    set $P731, $P730["sub"]
    unless_null $P731, vivify_178
    new $P731, "Undef"
  vivify_178:
    $P732 = $P731."namespace"()
    $P733 = $P732."Str"()
    store_lex "$full_name", $P733
  if_726_end:
.annotate 'line', 644
    find_lex $P734, "$full_name"
    set $S735, $P734
    new $P736, 'String'
    set $P736, $S735
    find_lex $P737, "$call"
    unless_null $P737, vivify_179
    $P737 = root_new ['parrot';'Hash']
  vivify_179:
    set $P738, $P737["name"]
    unless_null $P738, vivify_180
    $P738 = root_new ['parrot';'Hash']
  vivify_180:
    set $P739, $P738["value"]
    unless_null $P739, vivify_181
    new $P739, "Undef"
  vivify_181:
    set $S740, $P739
    concat $P741, $P736, $S740
    store_lex "$full_name", $P741
.annotate 'line', 645
    find_lex $P742, "%context"
    unless_null $P742, vivify_182
    $P742 = root_new ['parrot';'Hash']
  vivify_182:
    set $P743, $P742["pir_file"]
    unless_null $P743, vivify_183
    new $P743, "Undef"
  vivify_183:
    find_lex $P744, "$full_name"
    $P745 = $P743."sub"($P744)
    store_lex "$invocable_sub", $P745
.annotate 'line', 646
    find_lex $P747, "%context"
    unless_null $P747, vivify_184
    $P747 = root_new ['parrot';'Hash']
  vivify_184:
    set $P748, $P747["DEBUG"]
    unless_null $P748, vivify_185
    new $P748, "Undef"
  vivify_185:
    unless $P748, if_746_end
    find_lex $P749, "self"
    new $P750, 'String'
    set $P750, "invocable_sub '"
    find_lex $P751, "$full_name"
    concat $P752, $P750, $P751
    concat $P753, $P752, "'"
    $P749."debug"($P753)
  if_746_end:
.annotate 'line', 647
    find_lex $P756, "$invocable_sub"
    if $P756, if_755
    set $P754, $P756
    goto if_755_end
  if_755:
    .const 'Sub' $P758 = "37_1295186271.69345" 
    capture_lex $P758
    $P789 = $P758()
    set $P754, $P789
  if_755_end:
.annotate 'line', 639
    .return ($P754)
.end


.namespace ["POST";"Compiler"]
.sub "_block757"  :anon :subid("37_1295186271.69345") :outer("36_1295186271.69345")
.annotate 'line', 648
    new $P759, "Undef"
    .lex "$idx", $P759
    find_lex $P760, "$invocable_sub"
    $P761 = $P760."constant_index"()
    store_lex "$idx", $P761
.annotate 'line', 649
    find_lex $P763, "$idx"
    $P764 = "defined"($P763)
    if $P764, unless_762_end
.annotate 'line', 651
    find_lex $P765, "%context"
    unless_null $P765, vivify_186
    $P765 = root_new ['parrot';'Hash']
  vivify_186:
    set $P766, $P765["constants"]
    unless_null $P766, vivify_187
    new $P766, "Undef"
  vivify_187:
    $P767 = "new"("Integer")
    $P768 = $P766."push"($P767)
    store_lex "$idx", $P768
.annotate 'line', 652
    find_lex $P769, "$invocable_sub"
    find_lex $P770, "$idx"
    $P769."constant_index"($P770)
.annotate 'line', 653
    find_lex $P772, "%context"
    unless_null $P772, vivify_188
    $P772 = root_new ['parrot';'Hash']
  vivify_188:
    set $P773, $P772["DEBUG"]
    unless_null $P773, vivify_189
    new $P773, "Undef"
  vivify_189:
    unless $P773, if_771_end
    find_lex $P774, "self"
    new $P775, 'String'
    set $P775, "Allocate constant for it "
    find_lex $P776, "$idx"
    concat $P777, $P775, $P776
    $P774."debug"($P777)
  if_771_end:
  unless_762_end:
.annotate 'line', 656
    find_lex $P778, "%context"
    unless_null $P778, vivify_190
    $P778 = root_new ['parrot';'Hash']
  vivify_190:
    set $P779, $P778["sub"]
    unless_null $P779, vivify_191
    new $P779, "Undef"
  vivify_191:
    $P780 = $P779."symbol"("!SUB")
    store_lex "$SUB", $P780
.annotate 'line', 657
    find_lex $P781, "$bc"
.annotate 'line', 659
    find_lex $P782, "self"
    find_lex $P783, "$SUB"
    find_lex $P784, "%context"
    $P785 = $P782."to_op"($P783, $P784)
    find_lex $P786, "$idx"
    new $P787, "ResizablePMCArray"
    push $P787, "set_p_pc"
    push $P787, $P785
    push $P787, $P786
.annotate 'line', 660
    $P781."push"($P787)
.annotate 'line', 663
    new $P788, "Integer"
    assign $P788, 1
    store_lex "$processed", $P788
.annotate 'line', 647
    .return ($P788)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("38_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Key"],_)
    .param pmc param_880
    .param pmc param_881
.annotate 'line', 708
    new $P879, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P879, control_878
    push_eh $P879
    .lex "self", self
    .lex "$key", param_880
    .lex "%context", param_881
.annotate 'line', 711
    new $P882, "Undef"
    .lex "$key_pmc", $P882
.annotate 'line', 717
    new $P883, "Undef"
    .lex "$constants", $P883
.annotate 'line', 718
    new $P884, "Undef"
    .lex "$idx", $P884
.annotate 'line', 710
    find_lex $P886, "%context"
    unless_null $P886, vivify_206
    $P886 = root_new ['parrot';'Hash']
  vivify_206:
    set $P887, $P886["DEBUG"]
    unless_null $P887, vivify_207
    new $P887, "Undef"
  vivify_207:
    unless $P887, if_885_end
    find_lex $P888, "self"
    $P888."debug"("Want key")
  if_885_end:
.annotate 'line', 711
    find_lex $P889, "$key"
    find_lex $P890, "%context"
    $P891 = $P889."to_pmc"($P890)
    set $P892, $P891[0]
    unless_null $P892, vivify_208
    new $P892, "Undef"
  vivify_208:
    store_lex "$key_pmc", $P892
.annotate 'line', 712
    find_lex $P894, "%context"
    unless_null $P894, vivify_209
    $P894 = root_new ['parrot';'Hash']
  vivify_209:
    set $P895, $P894["DEBUG"]
    unless_null $P895, vivify_210
    new $P895, "Undef"
  vivify_210:
    unless $P895, if_893_end
    find_lex $P896, "self"
    $P896."debug"("Got key")
  if_893_end:
.annotate 'line', 717
    find_lex $P897, "%context"
    unless_null $P897, vivify_211
    $P897 = root_new ['parrot';'Hash']
  vivify_211:
    set $P898, $P897["constants"]
    unless_null $P898, vivify_212
    new $P898, "Undef"
  vivify_212:
    store_lex "$constants", $P898
    find_lex $P899, "$idx"
.annotate 'line', 719

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
    find_lex $P900, "$idx"
.annotate 'line', 708
    .return ($P900)
  control_878:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P901, exception, "payload"
    .return ($P901)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("39_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Constant"],_)
    .param pmc param_905
    .param pmc param_906
.annotate 'line', 735
    new $P904, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P904, control_903
    push_eh $P904
    .lex "self", self
    .lex "$op", param_905
    .lex "%context", param_906
.annotate 'line', 736
    new $P907, "Undef"
    .lex "$idx", $P907
.annotate 'line', 737
    new $P908, "Undef"
    .lex "$type", $P908
.annotate 'line', 735
    find_lex $P909, "$idx"
.annotate 'line', 737
    find_lex $P910, "$op"
    $P911 = $P910."type"()
    store_lex "$type", $P911
.annotate 'line', 738
    find_lex $P915, "$type"
    set $S916, $P915
    iseq $I917, $S916, "ic"
    unless $I917, unless_914
    new $P913, 'Integer'
    set $P913, $I917
    goto unless_914_end
  unless_914:
    find_lex $P918, "$type"
    set $S919, $P918
    iseq $I920, $S919, "kic"
    new $P913, 'Integer'
    set $P913, $I920
  unless_914_end:
    if $P913, if_912
.annotate 'line', 741
    find_lex $P924, "$type"
    set $S925, $P924
    iseq $I926, $S925, "nc"
    if $I926, if_923
.annotate 'line', 745
    find_lex $P932, "self"
    $P932."panic"("NYI")
.annotate 'line', 744
    goto if_923_end
  if_923:
.annotate 'line', 742
    find_lex $P927, "%context"
    unless_null $P927, vivify_213
    $P927 = root_new ['parrot';'Hash']
  vivify_213:
    set $P928, $P927["constants"]
    unless_null $P928, vivify_214
    new $P928, "Undef"
  vivify_214:
    find_lex $P929, "$op"
    $P930 = $P929."value"()
    $P931 = $P928."get_or_create_number"($P930)
    store_lex "$idx", $P931
  if_923_end:
.annotate 'line', 741
    goto if_912_end
  if_912:
.annotate 'line', 739
    find_lex $P921, "$op"
    $P922 = $P921."value"()
    store_lex "$idx", $P922
  if_912_end:
.annotate 'line', 748
    find_lex $P934, "%context"
    unless_null $P934, vivify_215
    $P934 = root_new ['parrot';'Hash']
  vivify_215:
    set $P935, $P934["DEBUG"]
    unless_null $P935, vivify_216
    new $P935, "Undef"
  vivify_216:
    unless $P935, if_933_end
    find_lex $P936, "self"
    new $P937, 'String'
    set $P937, "Index "
    find_lex $P938, "$idx"
    concat $P939, $P937, $P938
    $P936."debug"($P939)
  if_933_end:
    find_lex $P940, "$idx"
.annotate 'line', 735
    .return ($P940)
  control_903:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P941, exception, "payload"
    .return ($P941)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("40_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"String"],_)
    .param pmc param_945
    .param pmc param_946
.annotate 'line', 752
    .const 'Sub' $P972 = "41_1295186271.69345" 
    capture_lex $P972
    new $P944, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P944, control_943
    push_eh $P944
    .lex "self", self
    .lex "$str", param_945
    .lex "%context", param_946
.annotate 'line', 753
    new $P947, "Undef"
    .lex "$idx", $P947
.annotate 'line', 754
    new $P948, "Undef"
    .lex "$type", $P948
.annotate 'line', 752
    find_lex $P949, "$idx"
.annotate 'line', 754
    find_lex $P950, "$str"
    $P951 = $P950."type"()
    store_lex "$type", $P951
.annotate 'line', 755
    find_lex $P953, "$type"
    set $S954, $P953
    isne $I955, $S954, "sc"
    unless $I955, if_952_end
.annotate 'line', 756
    find_lex $P956, "self"
    $P956."panic"("attempt to pass a non-sc value off as a string")
  if_952_end:
.annotate 'line', 758
    find_lex $P960, "$str"
    $S961 = $P960."encoding"()
    iseq $I962, $S961, "fixed_8"
    if $I962, if_959
    new $P958, 'Integer'
    set $P958, $I962
    goto if_959_end
  if_959:
    find_lex $P963, "$str"
    $S964 = $P963."charset"()
    iseq $I965, $S964, "ascii"
    new $P958, 'Integer'
    set $P958, $I965
  if_959_end:
    if $P958, if_957
.annotate 'line', 761
    .const 'Sub' $P972 = "41_1295186271.69345" 
    capture_lex $P972
    $P972()
    goto if_957_end
  if_957:
.annotate 'line', 759
    find_lex $P966, "%context"
    unless_null $P966, vivify_219
    $P966 = root_new ['parrot';'Hash']
  vivify_219:
    set $P967, $P966["constants"]
    unless_null $P967, vivify_220
    new $P967, "Undef"
  vivify_220:
    find_lex $P968, "$str"
    $P969 = $P968."value"()
    $P970 = $P967."get_or_create_string"($P969)
    store_lex "$idx", $P970
  if_957_end:
.annotate 'line', 758
    find_lex $P985, "$idx"
.annotate 'line', 752
    .return ($P985)
  control_943:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P986, exception, "payload"
    .return ($P986)
.end


.namespace ["POST";"Compiler"]
.sub "_block971"  :anon :subid("41_1295186271.69345") :outer("40_1295186271.69345")
.annotate 'line', 763
    new $P973, "Undef"
    .lex "$bb", $P973
.annotate 'line', 764
    new $P974, "Undef"
    .lex "$str_val", $P974
.annotate 'line', 763
    $P975 = "new"("ByteBuffer")
    store_lex "$bb", $P975
.annotate 'line', 764
    find_lex $P976, "$str"
    $P977 = $P976."value"()
    store_lex "$str_val", $P977
.annotate 'line', 765

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 773
    find_lex $P978, "%context"
    unless_null $P978, vivify_217
    $P978 = root_new ['parrot';'Hash']
  vivify_217:
    set $P979, $P978["constants"]
    unless_null $P979, vivify_218
    new $P979, "Undef"
  vivify_218:
    find_lex $P980, "$bb"
.annotate 'line', 774
    find_lex $P981, "$str"
    $P982 = $P981."encoding"()
    $P983 = $P980."get_string"($P982)
.annotate 'line', 773
    $P984 = $P979."get_or_create_string"($P983)
    store_lex "$idx", $P984
.annotate 'line', 761
    .return ($P984)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("42_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Value"],_)
    .param pmc param_990
    .param pmc param_991
.annotate 'line', 781
    new $P989, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P989, control_988
    push_eh $P989
    .lex "self", self
    .lex "$val", param_990
    .lex "%context", param_991
.annotate 'line', 783
    new $P992, "Undef"
    .lex "$orig", $P992
    find_lex $P993, "self"
    find_lex $P994, "$val"
    $P995 = $P994."name"()
    find_lex $P996, "%context"
    $P997 = $P993."get_register"($P995, $P996)
    store_lex "$orig", $P997
.annotate 'line', 784
    find_lex $P998, "self"
    find_lex $P999, "$orig"
    find_lex $P1000, "%context"
    $P1001 = $P998."to_op"($P999, $P1000)
.annotate 'line', 781
    .return ($P1001)
  control_988:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1002, exception, "payload"
    .return ($P1002)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("43_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Register"],_)
    .param pmc param_1006
    .param pmc param_1007
.annotate 'line', 787
    new $P1005, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1005, control_1004
    push_eh $P1005
    .lex "self", self
    .lex "$reg", param_1006
    .lex "%context", param_1007
.annotate 'line', 788
    find_lex $P1008, "$reg"
    $P1009 = $P1008."regno"()
.annotate 'line', 787
    .return ($P1009)
  control_1004:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1010, exception, "payload"
    .return ($P1010)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op"  :subid("44_1295186271.69345") :method :outer("11_1295186271.69345") :multi(_,["POST";"Label"],_)
    .param pmc param_1014
    .param pmc param_1015
.annotate 'line', 791
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$l", param_1014
    .lex "%context", param_1015
.annotate 'line', 793
    new $P1016, "Undef"
    .lex "$bc", $P1016
.annotate 'line', 794
    new $P1017, "Undef"
    .lex "$pos", $P1017
.annotate 'line', 793
    find_lex $P1018, "%context"
    unless_null $P1018, vivify_221
    $P1018 = root_new ['parrot';'Hash']
  vivify_221:
    set $P1019, $P1018["bytecode"]
    unless_null $P1019, vivify_222
    new $P1019, "Undef"
  vivify_222:
    store_lex "$bc", $P1019
.annotate 'line', 794
    find_lex $P1020, "$bc"
    set $N1021, $P1020
    new $P1022, 'Float'
    set $P1022, $N1021
    store_lex "$pos", $P1022
.annotate 'line', 798
    find_lex $P1023, "$l"
    $P1024 = $P1023."name"()
    find_lex $P1025, "%context"
    unless_null $P1025, vivify_223
    $P1025 = root_new ['parrot';'Hash']
  vivify_223:
    set $P1026, $P1025["opcode_offset"]
    unless_null $P1026, vivify_224
    new $P1026, "Undef"
  vivify_224:
    find_lex $P1027, "%context"
    unless_null $P1027, vivify_225
    $P1027 = root_new ['parrot';'Hash']
  vivify_225:
    set $P1028, $P1027["opcode_fullname"]
    unless_null $P1028, vivify_226
    new $P1028, "Undef"
  vivify_226:
    $P1029 = "hash"($P1024 :named("name"), $P1026 :named("offset"), $P1028 :named("opname"))
.annotate 'line', 797
    find_lex $P1030, "$pos"
    find_lex $P1031, "%context"
    unless_null $P1031, vivify_227
    $P1031 = root_new ['parrot';'Hash']
    store_lex "%context", $P1031
  vivify_227:
    set $P1032, $P1031["labels_todo"]
    unless_null $P1032, vivify_228
    $P1032 = root_new ['parrot';'Hash']
    set $P1031["labels_todo"], $P1032
  vivify_228:
    set $P1032[$P1030], $P1029
.annotate 'line', 803
    find_lex $P1034, "%context"
    unless_null $P1034, vivify_229
    $P1034 = root_new ['parrot';'Hash']
  vivify_229:
    set $P1035, $P1034["DEBUG"]
    unless_null $P1035, vivify_230
    new $P1035, "Undef"
  vivify_230:
    unless $P1035, if_1033_end
    find_lex $P1036, "self"
    new $P1037, 'String'
    set $P1037, "Todo label '"
    find_lex $P1038, "$l"
    $P1039 = $P1038."name"()
    set $S1040, $P1039
    concat $P1041, $P1037, $S1040
    concat $P1042, $P1041, "' at "
    find_lex $P1043, "$pos"
    concat $P1044, $P1042, $P1043
    concat $P1045, $P1044, ", "
    find_lex $P1046, "%context"
    unless_null $P1046, vivify_231
    $P1046 = root_new ['parrot';'Hash']
  vivify_231:
    set $P1047, $P1046["opcode_offset"]
    unless_null $P1047, vivify_232
    new $P1047, "Undef"
  vivify_232:
    set $S1048, $P1047
    concat $P1049, $P1045, $S1048
    $P1036."debug"($P1049)
  if_1033_end:
.annotate 'line', 791
    .return (0)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1050, exception, "payload"
    .return ($P1050)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_pcc_call"  :subid("45_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1054
    .param pmc param_1055
    .param pmc param_1056
.annotate 'line', 814
    .const 'Sub' $P1091 = "46_1295186271.69345" 
    capture_lex $P1091
    new $P1053, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1053, control_1052
    push_eh $P1053
    .lex "self", self
    .lex "$opname", param_1054
    .lex "@args", param_1055
    .lex "%context", param_1056
.annotate 'line', 815
    new $P1057, "Undef"
    .lex "$bc", $P1057
.annotate 'line', 816
    new $P1058, "Undef"
    .lex "$signature", $P1058
.annotate 'line', 817
    new $P1059, "Undef"
    .lex "$sig_idx", $P1059
.annotate 'line', 824
    $P1060 = root_new ['parrot';'ResizablePMCArray']
    .lex "@op", $P1060
.annotate 'line', 815
    find_lex $P1061, "%context"
    unless_null $P1061, vivify_233
    $P1061 = root_new ['parrot';'Hash']
  vivify_233:
    set $P1062, $P1061["bytecode"]
    unless_null $P1062, vivify_234
    new $P1062, "Undef"
  vivify_234:
    store_lex "$bc", $P1062
.annotate 'line', 816
    find_lex $P1063, "self"
    find_lex $P1064, "@args"
    find_lex $P1065, "%context"
    $P1066 = $P1063."build_args_signature"($P1064, $P1065)
    store_lex "$signature", $P1066
.annotate 'line', 817
    find_lex $P1067, "%context"
    unless_null $P1067, vivify_235
    $P1067 = root_new ['parrot';'Hash']
  vivify_235:
    set $P1068, $P1067["constants"]
    unless_null $P1068, vivify_236
    new $P1068, "Undef"
  vivify_236:
    find_lex $P1069, "$signature"
    $P1070 = $P1068."get_or_create_pmc"($P1069)
    store_lex "$sig_idx", $P1070
.annotate 'line', 819
    find_lex $P1072, "%context"
    unless_null $P1072, vivify_237
    $P1072 = root_new ['parrot';'Hash']
  vivify_237:
    set $P1073, $P1072["DEBUG"]
    unless_null $P1073, vivify_238
    new $P1073, "Undef"
  vivify_238:
    unless $P1073, if_1071_end
    find_lex $P1074, "self"
    new $P1075, 'String'
    set $P1075, "Sig: "
    find_lex $P1076, "$sig_idx"
    concat $P1077, $P1075, $P1076
    $P1074."debug"($P1077)
  if_1071_end:
.annotate 'line', 821
    find_lex $P1079, "%context"
    unless_null $P1079, vivify_239
    $P1079 = root_new ['parrot';'Hash']
  vivify_239:
    set $P1080, $P1079["DEBUG"]
    unless_null $P1080, vivify_240
    new $P1080, "Undef"
  vivify_240:
    unless $P1080, if_1078_end
    find_lex $P1081, "self"
    find_lex $P1082, "$opname"
    $P1081."debug"($P1082)
  if_1078_end:
.annotate 'line', 824
    find_lex $P1083, "$opname"
    find_lex $P1084, "$sig_idx"
    $P1085 = "list"($P1083, $P1084)
    store_lex "@op", $P1085
.annotate 'line', 826
    find_lex $P1087, "@args"
    defined $I1088, $P1087
    unless $I1088, for_undef_241
    iter $P1086, $P1087
    new $P1121, 'ExceptionHandler'
    set_addr $P1121, loop1120_handler
    $P1121."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1121
  loop1120_test:
    unless $P1086, loop1120_done
    shift $P1089, $P1086
  loop1120_redo:
    .const 'Sub' $P1091 = "46_1295186271.69345" 
    capture_lex $P1091
    $P1091($P1089)
  loop1120_next:
    goto loop1120_test
  loop1120_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1122, exception, 'type'
    eq $P1122, .CONTROL_LOOP_NEXT, loop1120_next
    eq $P1122, .CONTROL_LOOP_REDO, loop1120_redo
  loop1120_done:
    pop_eh 
  for_undef_241:
.annotate 'line', 837
    find_lex $P1123, "$bc"
    find_lex $P1124, "@op"
    $P1125 = $P1123."push"($P1124)
.annotate 'line', 814
    .return ($P1125)
  control_1052:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1126, exception, "payload"
    .return ($P1126)
.end


.namespace ["POST";"Compiler"]
.sub "_block1090"  :anon :subid("46_1295186271.69345") :outer("45_1295186271.69345")
    .param pmc param_1092
.annotate 'line', 826
    .const 'Sub' $P1098 = "47_1295186271.69345" 
    capture_lex $P1098
    .lex "$arg", param_1092
.annotate 'line', 828
    find_lex $P1094, "$arg"
    $P1095 = $P1094."modifier"()
    isa $I1096, $P1095, "Hash"
    unless $I1096, if_1093_end
    .const 'Sub' $P1098 = "47_1295186271.69345" 
    capture_lex $P1098
    $P1098()
  if_1093_end:
.annotate 'line', 834
    find_lex $P1114, "@op"
    find_lex $P1115, "self"
    find_lex $P1116, "$arg"
    find_lex $P1117, "%context"
    $P1118 = $P1115."to_op"($P1116, $P1117)
    $P1119 = $P1114."push"($P1118)
.annotate 'line', 826
    .return ($P1119)
.end


.namespace ["POST";"Compiler"]
.sub "_block1097"  :anon :subid("47_1295186271.69345") :outer("46_1295186271.69345")
.annotate 'line', 829
    new $P1099, "Undef"
    .lex "$name", $P1099
    find_lex $P1101, "$arg"
    $P1102 = $P1101."modifier"()
    set $P1103, $P1102["named"]
    unless_null $P1103, vivify_242
    new $P1103, "Undef"
  vivify_242:
    set $P1100, $P1103
    defined $I1105, $P1100
    if $I1105, default_1104
    find_lex $P1106, "$arg"
    $P1107 = $P1106."name"()
    set $P1100, $P1107
  default_1104:
    store_lex "$name", $P1100
.annotate 'line', 830
    find_lex $P1108, "@op"
.annotate 'line', 831
    find_lex $P1109, "%context"
    unless_null $P1109, vivify_243
    $P1109 = root_new ['parrot';'Hash']
  vivify_243:
    set $P1110, $P1109["constants"]
    unless_null $P1110, vivify_244
    new $P1110, "Undef"
  vivify_244:
    find_lex $P1111, "$name"
    $P1112 = $P1110."get_or_create_string"($P1111)
    $P1113 = $P1108."push"($P1112)
.annotate 'line', 828
    .return ($P1113)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_args_signature"  :subid("48_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1130
    .param pmc param_1131
.annotate 'line', 840
    .const 'Sub' $P1182 = "51_1295186271.69345" 
    capture_lex $P1182
    .const 'Sub' $P1142 = "49_1295186271.69345" 
    capture_lex $P1142
    new $P1129, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1129, control_1128
    push_eh $P1129
    .lex "self", self
    .lex "@args", param_1130
    .lex "%context", param_1131
.annotate 'line', 841
    $P1132 = root_new ['parrot';'ResizablePMCArray']
    .lex "@sig", $P1132
.annotate 'line', 854
    new $P1133, "Undef"
    .lex "$elements", $P1133
.annotate 'line', 855
    new $P1134, "Undef"
    .lex "$signature", $P1134
.annotate 'line', 863
    new $P1135, "Undef"
    .lex "$idx", $P1135
.annotate 'line', 840
    find_lex $P1136, "@sig"
.annotate 'line', 842
    find_lex $P1138, "@args"
    defined $I1139, $P1138
    unless $I1139, for_undef_245
    iter $P1137, $P1138
    new $P1170, 'ExceptionHandler'
    set_addr $P1170, loop1169_handler
    $P1170."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1170
  loop1169_test:
    unless $P1137, loop1169_done
    shift $P1140, $P1137
  loop1169_redo:
    .const 'Sub' $P1142 = "49_1295186271.69345" 
    capture_lex $P1142
    $P1142($P1140)
  loop1169_next:
    goto loop1169_test
  loop1169_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1171, exception, 'type'
    eq $P1171, .CONTROL_LOOP_NEXT, loop1169_next
    eq $P1171, .CONTROL_LOOP_REDO, loop1169_redo
  loop1169_done:
    pop_eh 
  for_undef_245:
.annotate 'line', 854
    find_lex $P1172, "@sig"
    set $N1173, $P1172
    new $P1174, 'Float'
    set $P1174, $N1173
    store_lex "$elements", $P1174
.annotate 'line', 855

        $P1175 = find_lex '$elements'
        $I99 = $P1175
        $P1175 = find_lex '$signature'
        $P1175 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1175
.annotate 'line', 863
    new $P1176, "Integer"
    assign $P1176, 0
    store_lex "$idx", $P1176
.annotate 'line', 864
    find_lex $P1178, "@sig"
    defined $I1179, $P1178
    unless $I1179, for_undef_247
    iter $P1177, $P1178
    new $P1191, 'ExceptionHandler'
    set_addr $P1191, loop1190_handler
    $P1191."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1191
  loop1190_test:
    unless $P1177, loop1190_done
    shift $P1180, $P1177
  loop1190_redo:
    .const 'Sub' $P1182 = "51_1295186271.69345" 
    capture_lex $P1182
    $P1182($P1180)
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
  for_undef_247:
    find_lex $P1193, "$signature"
.annotate 'line', 840
    .return ($P1193)
  control_1128:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1194, exception, "payload"
    .return ($P1194)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_block1141"  :anon :subid("49_1295186271.69345") :outer("48_1295186271.69345")
    .param pmc param_1143
.annotate 'line', 842
    .const 'Sub' $P1161 = "50_1295186271.69345" 
    capture_lex $P1161
    .lex "$arg", param_1143
.annotate 'line', 844
    new $P1144, "Undef"
    .lex "$s", $P1144
    find_lex $P1145, "self"
    find_lex $P1146, "$arg"
    find_lex $P1147, "%context"
    $P1148 = $P1145."build_single_arg"($P1146, $P1147)
    store_lex "$s", $P1148
.annotate 'line', 845
    find_lex $P1151, "$s"
    isa $I1152, $P1151, "Integer"
    if $I1152, if_1150
.annotate 'line', 849
    find_lex $P1157, "$s"
    defined $I1158, $P1157
    unless $I1158, for_undef_246
    iter $P1156, $P1157
    new $P1167, 'ExceptionHandler'
    set_addr $P1167, loop1166_handler
    $P1167."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1167
  loop1166_test:
    unless $P1156, loop1166_done
    shift $P1159, $P1156
  loop1166_redo:
    .const 'Sub' $P1161 = "50_1295186271.69345" 
    capture_lex $P1161
    $P1161($P1159)
  loop1166_next:
    goto loop1166_test
  loop1166_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1168, exception, 'type'
    eq $P1168, .CONTROL_LOOP_NEXT, loop1166_next
    eq $P1168, .CONTROL_LOOP_REDO, loop1166_redo
  loop1166_done:
    pop_eh 
  for_undef_246:
.annotate 'line', 848
    set $P1149, $P1156
.annotate 'line', 845
    goto if_1150_end
  if_1150:
.annotate 'line', 846
    find_lex $P1153, "@sig"
    find_lex $P1154, "$s"
    $P1155 = $P1153."push"($P1154)
.annotate 'line', 845
    set $P1149, $P1155
  if_1150_end:
.annotate 'line', 842
    .return ($P1149)
.end


.namespace ["POST";"Compiler"]
.sub "_block1160"  :anon :subid("50_1295186271.69345") :outer("49_1295186271.69345")
    .param pmc param_1162
.annotate 'line', 849
    .lex "$_", param_1162
    find_lex $P1163, "@sig"
    find_lex $P1164, "$_"
    $P1165 = $P1163."push"($P1164)
    .return ($P1165)
.end


.namespace ["POST";"Compiler"]
.sub "_block1181"  :anon :subid("51_1295186271.69345") :outer("48_1295186271.69345")
    .param pmc param_1183
.annotate 'line', 864
    .lex "$val", param_1183
.annotate 'line', 865
    find_lex $P1184, "$val"
    find_lex $P1185, "$idx"
    set $I1186, $P1185
    find_lex $P1187, "$signature"
    unless_null $P1187, vivify_248
    $P1187 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1187
  vivify_248:
    set $P1187[$I1186], $P1184
    find_lex $P1188, "$idx"
    clone $P1189, $P1188
    inc $P1188
.annotate 'line', 864
    .return ($P1189)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_single_arg"  :subid("52_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1198
    .param pmc param_1199
.annotate 'line', 872
    new $P1197, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1197, control_1196
    push_eh $P1197
    .lex "self", self
    .lex "$arg", param_1198
    .lex "%context", param_1199
.annotate 'line', 875
    new $P1200, "Undef"
    .lex "$type", $P1200
.annotate 'line', 877
    new $P1201, "Undef"
    .lex "$res", $P1201
.annotate 'line', 891
    new $P1202, "Undef"
    .lex "$mod", $P1202
.annotate 'line', 875
    find_lex $P1204, "$arg"
    $P1205 = $P1204."type"()
    set $P1203, $P1205
    defined $I1207, $P1203
    if $I1207, default_1206
    find_lex $P1208, "self"
    find_lex $P1209, "$arg"
    $P1210 = $P1209."name"()
    find_lex $P1211, "%context"
    $P1212 = $P1208."get_register"($P1210, $P1211)
    $P1213 = $P1212."type"()
    set $P1203, $P1213
  default_1206:
    store_lex "$type", $P1203
    find_lex $P1214, "$res"
.annotate 'line', 880
    find_lex $P1216, "$type"
    set $S1217, $P1216
    iseq $I1218, $S1217, "i"
    if $I1218, if_1215
.annotate 'line', 881
    find_lex $P1221, "$type"
    set $S1222, $P1221
    iseq $I1223, $S1222, "s"
    if $I1223, if_1220
.annotate 'line', 882
    find_lex $P1226, "$type"
    set $S1227, $P1226
    iseq $I1228, $S1227, "p"
    if $I1228, if_1225
.annotate 'line', 883
    find_lex $P1231, "$type"
    set $S1232, $P1231
    iseq $I1233, $S1232, "n"
    if $I1233, if_1230
.annotate 'line', 885
    find_lex $P1236, "$type"
    set $S1237, $P1236
    iseq $I1238, $S1237, "ic"
    if $I1238, if_1235
.annotate 'line', 886
    find_lex $P1242, "$type"
    set $S1243, $P1242
    iseq $I1244, $S1243, "sc"
    if $I1244, if_1241
.annotate 'line', 887
    find_lex $P1248, "$type"
    set $S1249, $P1248
    iseq $I1250, $S1249, "pc"
    if $I1250, if_1247
.annotate 'line', 888
    find_lex $P1254, "$type"
    set $S1255, $P1254
    iseq $I1256, $S1255, "nc"
    if $I1256, if_1253
.annotate 'line', 889
    find_lex $P1259, "self"
    new $P1260, 'String'
    set $P1260, "Unknown arg type '"
    find_lex $P1261, "$type"
    concat $P1262, $P1260, $P1261
    concat $P1263, $P1262, "'"
    $P1259."panic"($P1263)
    goto if_1253_end
  if_1253:
.annotate 'line', 888
    new $P1257, "Integer"
    assign $P1257, 3
    add $P1258, $P1257, 16
    store_lex "$res", $P1258
  if_1253_end:
    goto if_1247_end
  if_1247:
.annotate 'line', 887
    new $P1251, "Integer"
    assign $P1251, 2
    add $P1252, $P1251, 16
    store_lex "$res", $P1252
  if_1247_end:
    goto if_1241_end
  if_1241:
.annotate 'line', 886
    new $P1245, "Integer"
    assign $P1245, 1
    add $P1246, $P1245, 16
    store_lex "$res", $P1246
  if_1241_end:
    goto if_1235_end
  if_1235:
.annotate 'line', 885
    new $P1239, "Integer"
    assign $P1239, 0
    add $P1240, $P1239, 16
    store_lex "$res", $P1240
  if_1235_end:
    goto if_1230_end
  if_1230:
.annotate 'line', 883
    new $P1234, "Integer"
    assign $P1234, 3
    store_lex "$res", $P1234
  if_1230_end:
    goto if_1225_end
  if_1225:
.annotate 'line', 882
    new $P1229, "Integer"
    assign $P1229, 2
    store_lex "$res", $P1229
  if_1225_end:
    goto if_1220_end
  if_1220:
.annotate 'line', 881
    new $P1224, "Integer"
    assign $P1224, 1
    store_lex "$res", $P1224
  if_1220_end:
    goto if_1215_end
  if_1215:
.annotate 'line', 880
    new $P1219, "Integer"
    assign $P1219, 0
    store_lex "$res", $P1219
  if_1215_end:
.annotate 'line', 891
    find_lex $P1264, "$arg"
    $P1265 = $P1264."modifier"()
    store_lex "$mod", $P1265
.annotate 'line', 892
    find_lex $P1267, "$mod"
    unless $P1267, if_1266_end
.annotate 'line', 893
    find_lex $P1269, "$mod"
    isa $I1270, $P1269, "Hash"
    if $I1270, if_1268
.annotate 'line', 898
    find_lex $P1278, "$mod"
    set $S1279, $P1278
    iseq $I1280, $S1279, "slurpy"
    if $I1280, if_1277
.annotate 'line', 899
    find_lex $P1284, "$mod"
    set $S1285, $P1284
    iseq $I1286, $S1285, "flat"
    if $I1286, if_1283
.annotate 'line', 900
    find_lex $P1290, "$mod"
    set $S1291, $P1290
    iseq $I1292, $S1291, "optional"
    if $I1292, if_1289
.annotate 'line', 901
    find_lex $P1296, "$mod"
    set $S1297, $P1296
    iseq $I1298, $S1297, "opt_flag"
    if $I1298, if_1295
.annotate 'line', 902
    find_lex $P1302, "$mod"
    set $S1303, $P1302
    iseq $I1304, $S1303, "slurpy named"
    if $I1304, if_1301
.annotate 'line', 903
    find_lex $P1308, "self"
    new $P1309, 'String'
    set $P1309, "Unsupported modifier "
    find_lex $P1310, "$mod"
    concat $P1311, $P1309, $P1310
    $P1308."panic"($P1311)
    goto if_1301_end
  if_1301:
.annotate 'line', 902
    find_lex $P1305, "$res"
    add $P1306, $P1305, 32
    add $P1307, $P1306, 512
    store_lex "$res", $P1307
  if_1301_end:
    goto if_1295_end
  if_1295:
.annotate 'line', 901
    find_lex $P1299, "$res"
    add $P1300, $P1299, 256
    store_lex "$res", $P1300
  if_1295_end:
    goto if_1289_end
  if_1289:
.annotate 'line', 900
    find_lex $P1293, "$res"
    add $P1294, $P1293, 128
    store_lex "$res", $P1294
  if_1289_end:
    goto if_1283_end
  if_1283:
.annotate 'line', 899
    find_lex $P1287, "$res"
    add $P1288, $P1287, 32
    store_lex "$res", $P1288
  if_1283_end:
    goto if_1277_end
  if_1277:
.annotate 'line', 898
    find_lex $P1281, "$res"
    add $P1282, $P1281, 32
    store_lex "$res", $P1282
  if_1277_end:
    goto if_1268_end
  if_1268:
.annotate 'line', 896
    new $P1271, "Integer"
    assign $P1271, 1
    add $P1272, $P1271, 16
    add $P1273, $P1272, 512
    find_lex $P1274, "$res"
    add $P1275, $P1274, 512
    $P1276 = "list"($P1273, $P1275)
    store_lex "$res", $P1276
  if_1268_end:
  if_1266_end:
.annotate 'line', 892
    find_lex $P1312, "$res"
.annotate 'line', 872
    .return ($P1312)
  control_1196:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1313, exception, "payload"
    .return ($P1313)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "enumerate_subs"  :subid("53_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1317
.annotate 'line', 914
    .const 'Sub' $P1324 = "54_1295186271.69345" 
    capture_lex $P1324
    new $P1316, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1316, control_1315
    push_eh $P1316
    .lex "self", self
    .lex "$post", param_1317
.annotate 'line', 915
    find_lex $P1319, "$post"
    $P1320 = $P1319."list"()
    defined $I1321, $P1320
    unless $I1321, for_undef_249
    iter $P1318, $P1320
    new $P1337, 'ExceptionHandler'
    set_addr $P1337, loop1336_handler
    $P1337."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1337
  loop1336_test:
    unless $P1318, loop1336_done
    shift $P1322, $P1318
  loop1336_redo:
    .const 'Sub' $P1324 = "54_1295186271.69345" 
    capture_lex $P1324
    $P1324($P1322)
  loop1336_next:
    goto loop1336_test
  loop1336_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1338, exception, 'type'
    eq $P1338, .CONTROL_LOOP_NEXT, loop1336_next
    eq $P1338, .CONTROL_LOOP_REDO, loop1336_redo
  loop1336_done:
    pop_eh 
  for_undef_249:
.annotate 'line', 914
    .return ($P1318)
  control_1315:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1339, exception, "payload"
    .return ($P1339)
.end


.namespace ["POST";"Compiler"]
.sub "_block1323"  :anon :subid("54_1295186271.69345") :outer("53_1295186271.69345")
    .param pmc param_1325
.annotate 'line', 915
    .lex "$sub", param_1325
.annotate 'line', 917
    find_lex $P1328, "$sub"
    get_hll_global $P1329, ["POST"], "Sub"
    $P1330 = $P1328."isa"($P1329)
    if $P1330, if_1327
    set $P1326, $P1330
    goto if_1327_end
  if_1327:
    find_lex $P1331, "$post"
    find_lex $P1332, "$sub"
    $P1333 = $P1332."full_name"()
    find_lex $P1334, "$sub"
    $P1335 = $P1331."sub"($P1333, $P1334)
    set $P1326, $P1335
  if_1327_end:
.annotate 'line', 915
    .return ($P1326)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags"  :subid("55_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1343
    .param pmc param_1344
.annotate 'line', 922
    new $P1342, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1342, control_1341
    push_eh $P1342
    .lex "self", self
    .lex "$sub", param_1343
    .lex "%context", param_1344
.annotate 'line', 930
    new $P1345, "Undef"
    .lex "$res", $P1345
    new $P1346, "Integer"
    assign $P1346, 0
    store_lex "$res", $P1346
.annotate 'line', 931
    find_lex $P1347, "$res"
    new $P1348, "Integer"
    assign $P1348, 1
    find_lex $P1349, "$sub"
    $N1350 = $P1349."outer"()
    mul $P1351, $P1348, $N1350
    add $P1352, $P1347, $P1351
    store_lex "$res", $P1352
.annotate 'line', 932
    find_lex $P1353, "$res"
    new $P1354, "Integer"
    assign $P1354, 8
    find_lex $P1355, "$sub"
    $N1356 = $P1355."anon"()
    mul $P1357, $P1354, $N1356
    add $P1358, $P1353, $P1357
    store_lex "$res", $P1358
.annotate 'line', 933
    find_lex $P1359, "$res"
    new $P1360, "Integer"
    assign $P1360, 16
    find_lex $P1361, "$sub"
    $N1362 = $P1361."main"()
    mul $P1363, $P1360, $N1362
    add $P1364, $P1359, $P1363
    store_lex "$res", $P1364
.annotate 'line', 934
    find_lex $P1365, "$res"
    new $P1366, "Integer"
    assign $P1366, 32
    find_lex $P1367, "$sub"
    $N1368 = $P1367."load"()
    mul $P1369, $P1366, $N1368
    add $P1370, $P1365, $P1369
    store_lex "$res", $P1370
.annotate 'line', 935
    find_lex $P1371, "$res"
    new $P1372, "Integer"
    assign $P1372, 64
    find_lex $P1373, "$sub"
    $N1374 = $P1373."immediate"()
    mul $P1375, $P1372, $N1374
    add $P1376, $P1371, $P1375
    store_lex "$res", $P1376
.annotate 'line', 936
    find_lex $P1377, "$res"
    new $P1378, "Integer"
    assign $P1378, 128
    find_lex $P1379, "$sub"
    $N1380 = $P1379."postcomp"()
    mul $P1381, $P1378, $N1380
    add $P1382, $P1377, $P1381
    store_lex "$res", $P1382
.annotate 'line', 938
    find_lex $P1384, "%context"
    unless_null $P1384, vivify_250
    $P1384 = root_new ['parrot';'Hash']
  vivify_250:
    set $P1385, $P1384["DEBUG"]
    unless_null $P1385, vivify_251
    new $P1385, "Undef"
  vivify_251:
    unless $P1385, if_1383_end
    find_lex $P1386, "self"
    new $P1387, 'String'
    set $P1387, "pf_flags "
    find_lex $P1388, "$res"
    concat $P1389, $P1387, $P1388
    $P1386."debug"($P1389)
  if_1383_end:
    find_lex $P1390, "$res"
.annotate 'line', 922
    .return ($P1390)
  control_1341:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1391, exception, "payload"
    .return ($P1391)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags"  :subid("56_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1395
    .param pmc param_1396
.annotate 'line', 943
    new $P1394, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1394, control_1393
    push_eh $P1394
    .lex "self", self
    .lex "$sub", param_1395
    .lex "%context", param_1396
.annotate 'line', 948
    new $P1397, "Undef"
    .lex "$res", $P1397
    new $P1398, "Integer"
    assign $P1398, 0
    store_lex "$res", $P1398
.annotate 'line', 949
    find_lex $P1400, "$sub"
    $P1401 = $P1400."vtable"()
    unless $P1401, if_1399_end
    find_lex $P1402, "$res"
    add $P1403, $P1402, 2
    store_lex "$res", $P1403
  if_1399_end:
.annotate 'line', 950
    find_lex $P1405, "$sub"
    $P1406 = $P1405."is_method"()
    unless $P1406, if_1404_end
    find_lex $P1407, "$res"
    add $P1408, $P1407, 4
    store_lex "$res", $P1408
  if_1404_end:
.annotate 'line', 951
    find_lex $P1410, "$sub"
    $P1411 = $P1410."is_init"()
    unless $P1411, if_1409_end
    find_lex $P1412, "$res"
    add $P1413, $P1412, 1024
    store_lex "$res", $P1413
  if_1409_end:
.annotate 'line', 952
    find_lex $P1415, "$sub"
    $P1416 = $P1415."nsentry"()
    unless $P1416, if_1414_end
    find_lex $P1417, "$res"
    add $P1418, $P1417, 2048
    store_lex "$res", $P1418
  if_1414_end:
.annotate 'line', 954
    find_lex $P1420, "%context"
    unless_null $P1420, vivify_252
    $P1420 = root_new ['parrot';'Hash']
  vivify_252:
    set $P1421, $P1420["DEBUG"]
    unless_null $P1421, vivify_253
    new $P1421, "Undef"
  vivify_253:
    unless $P1421, if_1419_end
    find_lex $P1422, "self"
    new $P1423, 'String'
    set $P1423, "comp_flags "
    find_lex $P1424, "$res"
    concat $P1425, $P1423, $P1424
    $P1422."debug"($P1425)
  if_1419_end:
    find_lex $P1426, "$res"
.annotate 'line', 943
    .return ($P1426)
  control_1393:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1427, exception, "payload"
    .return ($P1427)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "fixup_labels"  :subid("57_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1431
    .param pmc param_1432
    .param pmc param_1433
    .param pmc param_1434
.annotate 'line', 959
    .const 'Sub' $P1444 = "58_1295186271.69345" 
    capture_lex $P1444
    new $P1430, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1430, control_1429
    push_eh $P1430
    .lex "self", self
    .lex "$sub", param_1431
    .lex "$labels_todo", param_1432
    .lex "$bc", param_1433
    .lex "%context", param_1434
.annotate 'line', 960
    find_lex $P1436, "%context"
    unless_null $P1436, vivify_254
    $P1436 = root_new ['parrot';'Hash']
  vivify_254:
    set $P1437, $P1436["DEBUG"]
    unless_null $P1437, vivify_255
    new $P1437, "Undef"
  vivify_255:
    unless $P1437, if_1435_end
    find_lex $P1438, "self"
    $P1438."debug"("Fixup labels")
  if_1435_end:
.annotate 'line', 961
    find_lex $P1440, "$labels_todo"
    defined $I1441, $P1440
    unless $I1441, for_undef_256
    iter $P1439, $P1440
    new $P1503, 'ExceptionHandler'
    set_addr $P1503, loop1502_handler
    $P1503."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1503
  loop1502_test:
    unless $P1439, loop1502_done
    shift $P1442, $P1439
  loop1502_redo:
    .const 'Sub' $P1444 = "58_1295186271.69345" 
    capture_lex $P1444
    $P1444($P1442)
  loop1502_next:
    goto loop1502_test
  loop1502_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1504, exception, 'type'
    eq $P1504, .CONTROL_LOOP_NEXT, loop1502_next
    eq $P1504, .CONTROL_LOOP_REDO, loop1502_redo
  loop1502_done:
    pop_eh 
  for_undef_256:
.annotate 'line', 959
    .return ($P1439)
  control_1429:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1505, exception, "payload"
    .return ($P1505)
.end


.namespace ["POST";"Compiler"]
.sub "_block1443"  :anon :subid("58_1295186271.69345") :outer("57_1295186271.69345")
    .param pmc param_1445
.annotate 'line', 961
    .lex "$kv", param_1445
.annotate 'line', 962
    new $P1446, "Undef"
    .lex "$offset", $P1446
.annotate 'line', 963
    $P1447 = root_new ['parrot';'Hash']
    .lex "%todo", $P1447
.annotate 'line', 966
    new $P1448, "Undef"
    .lex "$op", $P1448
.annotate 'line', 969
    new $P1449, "Undef"
    .lex "$delta", $P1449
.annotate 'line', 962
    find_lex $P1450, "$kv"
    $P1451 = $P1450."key"()
    store_lex "$offset", $P1451
.annotate 'line', 963
    find_lex $P1452, "$kv"
    $P1453 = $P1452."value"()
    store_lex "%todo", $P1453
.annotate 'line', 964
    find_lex $P1455, "%context"
    unless_null $P1455, vivify_257
    $P1455 = root_new ['parrot';'Hash']
  vivify_257:
    set $P1456, $P1455["DEBUG"]
    unless_null $P1456, vivify_258
    new $P1456, "Undef"
  vivify_258:
    unless $P1456, if_1454_end
    find_lex $P1457, "self"
    new $P1458, 'String'
    set $P1458, "Fixing '"
    find_lex $P1459, "%todo"
    unless_null $P1459, vivify_259
    $P1459 = root_new ['parrot';'Hash']
  vivify_259:
    set $P1460, $P1459["name"]
    unless_null $P1460, vivify_260
    new $P1460, "Undef"
  vivify_260:
    set $S1461, $P1460
    concat $P1462, $P1458, $S1461
    concat $P1463, $P1462, "' from op "
    find_lex $P1464, "%todo"
    unless_null $P1464, vivify_261
    $P1464 = root_new ['parrot';'Hash']
  vivify_261:
    set $P1465, $P1464["opname"]
    unless_null $P1465, vivify_262
    new $P1465, "Undef"
  vivify_262:
    set $S1466, $P1465
    concat $P1467, $P1463, $S1466
    concat $P1468, $P1467, " at "
    find_lex $P1469, "$offset"
    set $S1470, $P1469
    concat $P1471, $P1468, $S1470
    $P1457."debug"($P1471)
  if_1454_end:
.annotate 'line', 966
    find_lex $P1472, "%todo"
    unless_null $P1472, vivify_263
    $P1472 = root_new ['parrot';'Hash']
  vivify_263:
    set $P1473, $P1472["opname"]
    unless_null $P1473, vivify_264
    new $P1473, "Undef"
  vivify_264:
    set $S1474, $P1473
    find_lex $P1475, "$bc"
    $P1476 = $P1475."opmap"()
    set $P1477, $P1476[$S1474]
    unless_null $P1477, vivify_265
    new $P1477, "Undef"
  vivify_265:
    store_lex "$op", $P1477
.annotate 'line', 967
    find_lex $P1479, "%context"
    unless_null $P1479, vivify_266
    $P1479 = root_new ['parrot';'Hash']
  vivify_266:
    set $P1480, $P1479["DEBUG"]
    unless_null $P1480, vivify_267
    new $P1480, "Undef"
  vivify_267:
    unless $P1480, if_1478_end
    find_lex $P1481, "self"
    new $P1482, 'String'
    set $P1482, "Op length is "
    find_lex $P1483, "$op"
    $P1484 = $P1483."length"()
    set $S1485, $P1484
    concat $P1486, $P1482, $S1485
    $P1481."debug"($P1486)
  if_1478_end:
.annotate 'line', 969
    find_lex $P1487, "$sub"
    find_lex $P1488, "%todo"
    unless_null $P1488, vivify_268
    $P1488 = root_new ['parrot';'Hash']
  vivify_268:
    set $P1489, $P1488["name"]
    unless_null $P1489, vivify_269
    new $P1489, "Undef"
  vivify_269:
    $P1490 = $P1487."label"($P1489)
    $P1491 = $P1490."position"()
    find_lex $P1492, "%todo"
    unless_null $P1492, vivify_270
    $P1492 = root_new ['parrot';'Hash']
  vivify_270:
    set $P1493, $P1492["offset"]
    unless_null $P1493, vivify_271
    new $P1493, "Undef"
  vivify_271:
    sub $P1494, $P1491, $P1493
    store_lex "$delta", $P1494
.annotate 'line', 971
    find_lex $P1495, "$delta"
    find_lex $P1496, "$offset"
    find_lex $P1497, "$op"
    $N1498 = $P1497."length"()
    add $P1499, $P1496, $N1498
    set $I1500, $P1499
    find_lex $P1501, "$bc"
    unless_null $P1501, vivify_272
    $P1501 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1501
  vivify_272:
    set $P1501[$I1500], $P1495
.annotate 'line', 961
    .return ($P1495)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "get_register"  :subid("59_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1509
    .param pmc param_1510
.annotate 'line', 976
    new $P1508, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1508, control_1507
    push_eh $P1508
    .lex "self", self
    .lex "$name", param_1509
    .lex "%context", param_1510
.annotate 'line', 977
    new $P1511, "Undef"
    .lex "$reg", $P1511
    find_lex $P1512, "%context"
    unless_null $P1512, vivify_273
    $P1512 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1513, $P1512["sub"]
    unless_null $P1513, vivify_274
    new $P1513, "Undef"
  vivify_274:
    find_lex $P1514, "$name"
    $P1515 = $P1513."symbol"($P1514)
    store_lex "$reg", $P1515
.annotate 'line', 978
    find_lex $P1517, "$reg"
    isfalse $I1518, $P1517
    unless $I1518, if_1516_end
.annotate 'line', 979
    find_lex $P1519, "self"
    new $P1520, 'String'
    set $P1520, "Register '"
    find_lex $P1521, "$name"
    set $S1522, $P1521
    concat $P1523, $P1520, $S1522
    concat $P1524, $P1523, "' not predeclared in '"
    find_lex $P1525, "%context"
    unless_null $P1525, vivify_275
    $P1525 = root_new ['parrot';'Hash']
  vivify_275:
    set $P1526, $P1525["sub"]
    unless_null $P1526, vivify_276
    new $P1526, "Undef"
  vivify_276:
    $P1527 = $P1526."name"()
    set $S1528, $P1527
    concat $P1529, $P1524, $S1528
    concat $P1530, $P1529, "'"
    $P1519."panic"($P1530)
  if_1516_end:
.annotate 'line', 978
    find_lex $P1531, "$reg"
.annotate 'line', 976
    .return ($P1531)
  control_1507:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1532, exception, "payload"
    .return ($P1532)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "debug"  :subid("60_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1536 :slurpy
.annotate 'line', 984
    .const 'Sub' $P1542 = "61_1295186271.69345" 
    capture_lex $P1542
    new $P1535, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1535, control_1534
    push_eh $P1535
    .lex "self", self
    .lex "@args", param_1536
.annotate 'line', 985
    find_lex $P1538, "@args"
    defined $I1539, $P1538
    unless $I1539, for_undef_277
    iter $P1537, $P1538
    new $P1546, 'ExceptionHandler'
    set_addr $P1546, loop1545_handler
    $P1546."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1546
  loop1545_test:
    unless $P1537, loop1545_done
    shift $P1540, $P1537
  loop1545_redo:
    .const 'Sub' $P1542 = "61_1295186271.69345" 
    capture_lex $P1542
    $P1542($P1540)
  loop1545_next:
    goto loop1545_test
  loop1545_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1547, exception, 'type'
    eq $P1547, .CONTROL_LOOP_NEXT, loop1545_next
    eq $P1547, .CONTROL_LOOP_REDO, loop1545_redo
  loop1545_done:
    pop_eh 
  for_undef_277:
.annotate 'line', 984
    .return ($P1537)
  control_1534:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1548, exception, "payload"
    .return ($P1548)
.end


.namespace ["POST";"Compiler"]
.sub "_block1541"  :anon :subid("61_1295186271.69345") :outer("60_1295186271.69345")
    .param pmc param_1543
.annotate 'line', 985
    .lex "$_", param_1543
.annotate 'line', 986
    find_lex $P1544, "$_"
    say $P1544
.annotate 'line', 985
    .return ()
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_context"  :subid("62_1295186271.69345") :method :outer("11_1295186271.69345")
    .param pmc param_1552
    .param pmc param_1553
.annotate 'line', 990
    new $P1551, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1551, control_1550
    push_eh $P1551
    .lex "self", self
    .lex "$past", param_1552
    .lex "%adverbs", param_1553
.annotate 'line', 991
    $P1554 = root_new ['parrot';'Hash']
    .lex "%context", $P1554
.annotate 'line', 999
    new $P1555, "Undef"
    .lex "$pfdir", $P1555
.annotate 'line', 990
    find_lex $P1556, "%context"
.annotate 'line', 993
    find_lex $P1557, "self"
    find_lex $P1558, "%context"
    unless_null $P1558, vivify_278
    $P1558 = root_new ['parrot';'Hash']
    store_lex "%context", $P1558
  vivify_278:
    set $P1558["compiler"], $P1557
.annotate 'line', 995
    $P1559 = "new"("Packfile")
    find_lex $P1560, "%context"
    unless_null $P1560, vivify_279
    $P1560 = root_new ['parrot';'Hash']
    store_lex "%context", $P1560
  vivify_279:
    set $P1560["packfile"], $P1559
.annotate 'line', 999
    find_lex $P1561, "%context"
    unless_null $P1561, vivify_280
    $P1561 = root_new ['parrot';'Hash']
  vivify_280:
    set $P1562, $P1561["packfile"]
    unless_null $P1562, vivify_281
    new $P1562, "Undef"
  vivify_281:
    $P1563 = $P1562."get_directory"()
    store_lex "$pfdir", $P1563
.annotate 'line', 1002
    $P1564 = "new"("PackfileConstantTable")
    find_lex $P1565, "%context"
    unless_null $P1565, vivify_282
    $P1565 = root_new ['parrot';'Hash']
    store_lex "%context", $P1565
  vivify_282:
    set $P1565["constants"], $P1564
.annotate 'line', 1005
    $P1566 = "new"("FixedIntegerArray")
    find_lex $P1567, "%context"
    unless_null $P1567, vivify_283
    $P1567 = root_new ['parrot';'Hash']
    store_lex "%context", $P1567
  vivify_283:
    set $P1568, $P1567["constants"]
    unless_null $P1568, vivify_284
    $P1568 = root_new ['parrot';'ResizablePMCArray']
    set $P1567["constants"], $P1568
  vivify_284:
    set $P1568[0], $P1566
.annotate 'line', 1008
    find_lex $P1569, "%context"
    unless_null $P1569, vivify_285
    $P1569 = root_new ['parrot';'Hash']
  vivify_285:
    set $P1570, $P1569["constants"]
    unless_null $P1570, vivify_286
    new $P1570, "Undef"
  vivify_286:
    find_lex $P1571, "$pfdir"
    unless_null $P1571, vivify_287
    $P1571 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1571
  vivify_287:
    set $P1571["CONSTANTS_hello.pir"], $P1570
.annotate 'line', 1011
    $P1572 = "new"("PackfileBytecodeSegment")
    find_lex $P1573, "%context"
    unless_null $P1573, vivify_288
    $P1573 = root_new ['parrot';'Hash']
    store_lex "%context", $P1573
  vivify_288:
    set $P1573["bytecode"], $P1572
.annotate 'line', 1012
    find_lex $P1574, "%context"
    unless_null $P1574, vivify_289
    $P1574 = root_new ['parrot';'Hash']
  vivify_289:
    set $P1575, $P1574["bytecode"]
    unless_null $P1575, vivify_290
    new $P1575, "Undef"
  vivify_290:
    $P1575."main_sub"(-1)
.annotate 'line', 1014
    new $P1576, "Integer"
    assign $P1576, 0
    find_lex $P1577, "%context"
    unless_null $P1577, vivify_291
    $P1577 = root_new ['parrot';'Hash']
    store_lex "%context", $P1577
  vivify_291:
    set $P1577["got_main_sub"], $P1576
.annotate 'line', 1017
    find_lex $P1578, "%context"
    unless_null $P1578, vivify_292
    $P1578 = root_new ['parrot';'Hash']
  vivify_292:
    set $P1579, $P1578["bytecode"]
    unless_null $P1579, vivify_293
    new $P1579, "Undef"
  vivify_293:
    find_lex $P1580, "$pfdir"
    unless_null $P1580, vivify_294
    $P1580 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1580
  vivify_294:
    set $P1580["BYTECODE_hello.pir"], $P1579
.annotate 'line', 1026
    get_hll_global $P1581, ["POST"], "VanillaAllocator"
    $P1582 = $P1581."new"()
    find_lex $P1583, "%context"
    unless_null $P1583, vivify_295
    $P1583 = root_new ['parrot';'Hash']
    store_lex "%context", $P1583
  vivify_295:
    set $P1583["regalloc"], $P1582
.annotate 'line', 1028
    find_lex $P1584, "%adverbs"
    unless_null $P1584, vivify_296
    $P1584 = root_new ['parrot';'Hash']
  vivify_296:
    set $P1585, $P1584["debug"]
    unless_null $P1585, vivify_297
    new $P1585, "Undef"
  vivify_297:
    find_lex $P1586, "%context"
    unless_null $P1586, vivify_298
    $P1586 = root_new ['parrot';'Hash']
    store_lex "%context", $P1586
  vivify_298:
    set $P1586["DEBUG"], $P1585
    find_lex $P1587, "%context"
.annotate 'line', 990
    .return ($P1587)
  control_1550:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1588, exception, "payload"
    .return ($P1588)
.end


.namespace ["POST";"Compiler"]
.sub "_block1589" :load :anon :subid("63_1295186271.69345")
.annotate 'line', 16
    .const 'Sub' $P1591 = "11_1295186271.69345" 
    $P1592 = $P1591()
    .return ($P1592)
.end


.namespace []
.sub "_block1598" :load :anon :subid("64_1295186271.69345")
.annotate 'line', 1
    .const 'Sub' $P1600 = "10_1295186271.69345" 
    $P1601 = $P1600()
    .return ($P1601)
.end

