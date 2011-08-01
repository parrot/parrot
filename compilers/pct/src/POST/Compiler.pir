
.namespace []
.sub "_block1000"  :anon :subid("10_1312182902.1805")
.annotate 'file', "Compiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312182902.1805" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312182902.1805" 
    capture_lex $P1003
    $P101 = $P1003()
.annotate 'line', 1
    .return ($P101)
    .const 'Sub' $P1077 = "22_1312182902.1805" 
    .return ($P1077)
.end


.namespace []
.sub "" :load :init :subid("post23") :outer("10_1312182902.1805")
.annotate 'file', "Compiler.pm"
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312182902.1805" 
    .local pmc block
    set block, $P1001
    $P1079 = get_root_global ["parrot"], "P6metaclass"
    new $P102, "ResizablePMCArray"
    push $P102, "$?HLL"
    push $P102, "$?NAMESPACE"
    $P1079."new_class"("POST::Compiler", "PCT::HLLCompiler" :named("parent"), $P102 :named("attr"))
.end


.namespace ["POST";"Compiler"]
.sub "_block1002"  :subid("11_1312182902.1805") :outer("10_1312182902.1805")
.annotate 'file', "Compiler.pm"
.annotate 'line', 16
    .const 'Sub' $P1061 = "20_1312182902.1805" 
    capture_lex $P1061
    .const 'Sub' $P1057 = "19_1312182902.1805" 
    capture_lex $P1057
    .const 'Sub' $P1052 = "18_1312182902.1805" 
    capture_lex $P1052
    .const 'Sub' $P1030 = "17_1312182902.1805" 
    capture_lex $P1030
    .const 'Sub' $P1026 = "16_1312182902.1805" 
    capture_lex $P1026
    .const 'Sub' $P1022 = "15_1312182902.1805" 
    capture_lex $P1022
    .const 'Sub' $P1013 = "14_1312182902.1805" 
    capture_lex $P1013
    .const 'Sub' $P1009 = "13_1312182902.1805" 
    capture_lex $P1009
    .const 'Sub' $P1005 = "12_1312182902.1805" 
    capture_lex $P1005
.annotate 'line', 129
    get_global $P1004, "%pirop_handlers"
    unless_null $P1004, vivify_25
    $P1004 = root_new ['parrot';'Hash']
    set_global "%pirop_handlers", $P1004
  vivify_25:
.annotate 'line', 16
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 129
    new $P100, "String"
    assign $P100, "bar"
    set_global "%pirop_handlers", $P100
    new $P101, "ResizablePMCArray"
    push $P101, $P100
    push $P101, "bang"
.annotate 'line', 16
    .return ()
    .const 'Sub' $P1073 = "21_1312182902.1805" 
    .return ($P1073)
.end


.namespace ["POST";"Compiler"]
.sub "" :load :init :subid("post24") :outer("11_1312182902.1805")
.annotate 'file', "Compiler.pm"
.annotate 'line', 16
    .const 'Sub' $P1003 = "11_1312182902.1805" 
    .local pmc block
    set block, $P1003
.annotate 'line', 20
    get_hll_global $P101, ["POST"], "Compiler"
    $P101."language"("POST")
.annotate 'line', 21
    get_hll_global $P101, ["POST"], "Compiler"
    new $P102, "ResizablePMCArray"
    push $P102, "pir"
    push $P102, "evalpmc"
    $P101."stages"($P102)
.annotate 'line', 23

        $P1075 = new ['String']
        set_global '$?HLL', $P1075
    
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "escape"  :subid("12_1312182902.1805") :method :outer("11_1312182902.1805")
    .param pmc param_1008
.annotate 'file', "Compiler.pm"
.annotate 'line', 36
    new $P1007, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1007, control_1006
    push_eh $P1007
    .lex "self", self
    .lex "$str", param_1008
.annotate 'line', 37
    get_hll_global $P100, ["PAST"], "Compiler"
    find_lex $P101, "$str"
    $P102 = $P100."escape"($P101)
.annotate 'line', 36
    .return ($P102)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "key_pir"  :subid("13_1312182902.1805") :method :outer("11_1312182902.1805")
    .param pmc param_1012 :slurpy
.annotate 'file', "Compiler.pm"
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
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pir"  :subid("14_1312182902.1805") :method :outer("11_1312182902.1805")
    .param pmc param_1016
    .param pmc param_1017 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 74
    new $P1015, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1015, control_1014
    push_eh $P1015
    .lex "self", self
    .lex "$post", param_1016
    .lex "%adverbs", param_1017
.annotate 'line', 75
    new $P100, "Undef"
    set $P1018, $P100
    .lex "$newself", $P1018
.annotate 'line', 76
    new $P101, "Undef"
    set $P1019, $P101
    .lex "$CODE", $P1019
.annotate 'line', 77
    new $P102, "Undef"
    set $P1020, $P102
    .lex "$LINE", $P1020
.annotate 'line', 75
    get_hll_global $P103, ["POST"], "Compiler"
    $P104 = $P103."new"()
    store_lex "$newself", $P104
.annotate 'line', 76
    new $P103, "StringBuilder"
    store_lex "$CODE", $P103
.annotate 'line', 77
    new $P103, "Integer"
    assign $P103, 0
    store_lex "$LINE", $P103
.annotate 'line', 79
    find_lex $P103, "$post"
    get_hll_global $P104, ["POST"], "Sub"
    $P105 = $P103."isa"($P104)
    if $P105, unless_1021_end
.annotate 'line', 80
    get_hll_global $P106, ["POST"], "Sub"
    find_lex $P107, "$post"
    $P108 = $P106."new"($P107, "anon" :named("name"))
    store_lex "$post", $P108
  unless_1021_end:
.annotate 'line', 82
    find_lex $P103, "$newself"
    find_lex $P104, "$post"
    $P103."pir"($P104)
.annotate 'line', 74
    find_lex $P103, "$CODE"
    .return ($P103)
  control_1014:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir_children"  :subid("15_1312182902.1805") :method :outer("11_1312182902.1805")
    .param pmc param_1025
.annotate 'file', "Compiler.pm"
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
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("16_1312182902.1805") :method :outer("11_1312182902.1805") :multi(_,_)
    .param pmc param_1029
.annotate 'file', "Compiler.pm"
.annotate 'line', 121
    new $P1028, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1028, control_1027
    push_eh $P1028
    .lex "self", self
    .lex "$node", param_1029
.annotate 'line', 122
    find_lex $P100, "self"
    find_lex $P101, "$node"
    $P102 = $P100."pir_children"($P101)
.annotate 'line', 121
    .return ($P102)
  control_1027:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("17_1312182902.1805") :method :outer("11_1312182902.1805") :multi(_,["POST";"Op"])
    .param pmc param_1033
.annotate 'file', "Compiler.pm"
.annotate 'line', 131
    new $P1032, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1032, control_1031
    push_eh $P1032
    .lex "self", self
    .lex "$node", param_1033
.annotate 'line', 133
    new $P100, "Undef"
    set $P1034, $P100
    .lex "$pirop", $P1034
.annotate 'line', 135
    new $P101, "Undef"
    set $P1035, $P101
    .lex "$result", $P1035
.annotate 'line', 139
    $P1037 = root_new ['parrot';'ResizablePMCArray']
    set $P1036, $P1037
    .lex "@arglist", $P1036
.annotate 'line', 142
    new $P102, "Undef"
    set $P1038, $P102
    .lex "$fmt", $P1038
.annotate 'line', 143
    new $P103, "Undef"
    set $P1039, $P103
    .lex "$name", $P1039
.annotate 'line', 144
    new $P104, "Undef"
    set $P1040, $P104
    .lex "$invocant", $P1040
.annotate 'line', 174
    new $P105, "Undef"
    set $P1041, $P105
    .lex "$subpir", $P1041
.annotate 'line', 175
    new $P106, "Undef"
    set $P1042, $P106
    .lex "$subline", $P1042
.annotate 'line', 176
    new $P107, "Undef"
    set $P1043, $P107
    .lex "$line", $P1043
.annotate 'line', 133
    find_lex $P108, "$node"
    $P109 = $P108."pirop"()
    store_lex "$pirop", $P109
.annotate 'line', 135
    find_lex $P108, "$node"
    $P109 = $P108."result"()
    set $S100, $P109
    new $P110, 'String'
    set $P110, $S100
    store_lex "$result", $P110
.annotate 'line', 136
    find_lex $P108, "$result"
    unless $P108, if_1044_end
    find_lex $P109, "$result"
    concat $P110, $P109, " = "
    store_lex "$result", $P110
  if_1044_end:
.annotate 'line', 139
    find_lex $P108, "$node"
    $P109 = $P108."list"()
    store_lex "@arglist", $P109
.annotate 'line', 131
    find_lex $P108, "$fmt"
    find_lex $P108, "$name"
    find_lex $P108, "$invocant"
.annotate 'line', 146
    find_lex $P108, "$pirop"
    set $S100, $P108
    iseq $I100, $S100, "call"
    if $I100, if_1045
.annotate 'line', 150
    find_lex $P109, "$pirop"
    set $S101, $P109
    iseq $I101, $S101, "callmethod"
    if $I101, if_1046
.annotate 'line', 155
    find_lex $P110, "$pirop"
    set $S102, $P110
    iseq $I102, $S102, "return"
    if $I102, if_1047
.annotate 'line', 158
    find_lex $P111, "$pirop"
    set $S103, $P111
    iseq $I103, $S103, "yield"
    if $I103, if_1048
.annotate 'line', 161
    find_lex $P112, "$pirop"
    set $S104, $P112
    iseq $I104, $S104, "tailcall"
    if $I104, if_1049
.annotate 'line', 165
    find_lex $P113, "$pirop"
    set $S105, $P113
    iseq $I105, $S105, "inline"
    if $I105, if_1050
.annotate 'line', 170
    new $P114, "String"
    assign $P114, "    %n %,\n"
    store_lex "$fmt", $P114
.annotate 'line', 171
    find_lex $P114, "$pirop"
    store_lex "$name", $P114
.annotate 'line', 169
    goto if_1050_end
  if_1050:
.annotate 'line', 166
    find_lex $P114, "$node"
    $P115 = $P114."inline"()
    concat $P116, $P115, "\n"
    store_lex "$fmt", $P116
.annotate 'line', 167
    find_lex $P114, "$node"
    $P115 = $P114."result"()
    store_lex "$result", $P115
  if_1050_end:
.annotate 'line', 165
    goto if_1049_end
  if_1049:
.annotate 'line', 162
    find_lex $P113, "@arglist"
    $P114 = $P113."shift"()
    store_lex "$name", $P114
.annotate 'line', 163
    new $P113, "String"
    assign $P113, "    .tailcall %n(%,)\n"
    store_lex "$fmt", $P113
  if_1049_end:
.annotate 'line', 161
    goto if_1048_end
  if_1048:
.annotate 'line', 159
    new $P112, "String"
    assign $P112, "    .yield (%,)\n"
    store_lex "$fmt", $P112
  if_1048_end:
.annotate 'line', 158
    goto if_1047_end
  if_1047:
.annotate 'line', 156
    new $P111, "String"
    assign $P111, "    .return (%,)\n"
    store_lex "$fmt", $P111
  if_1047_end:
.annotate 'line', 155
    goto if_1046_end
  if_1046:
.annotate 'line', 151
    new $P110, "String"
    assign $P110, "    %r%i.%n(%,)\n"
    store_lex "$fmt", $P110
.annotate 'line', 152
    find_lex $P110, "@arglist"
    $P111 = $P110."shift"()
    store_lex "$name", $P111
.annotate 'line', 153
    find_lex $P110, "@arglist"
    $P111 = $P110."shift"()
    store_lex "$invocant", $P111
  if_1046_end:
.annotate 'line', 150
    goto if_1045_end
  if_1045:
.annotate 'line', 147
    new $P109, "String"
    assign $P109, "    %r%n(%,)\n"
    store_lex "$fmt", $P109
.annotate 'line', 148
    find_lex $P109, "@arglist"
    $P110 = $P109."shift"()
    store_lex "$name", $P110
  if_1045_end:
.annotate 'line', 174
    new $P108, "String"
    assign $P108, "$SUBPIR"
    set $S100, $P108
    find_caller_lex $P109, $S100
    store_lex "$subpir", $P109
.annotate 'line', 175
    new $P108, "String"
    assign $P108, "$SUBLINE"
    set $S100, $P108
    find_caller_lex $P109, $S100
    store_lex "$subline", $P109
.annotate 'line', 176
    new $P108, "String"
    assign $P108, "$LINE"
    set $S100, $P108
    find_caller_lex $P109, $S100
    store_lex "$line", $P109
.annotate 'line', 178
    find_lex $P108, "$subline"
    set $N100, $P108
    find_lex $P109, "$line"
    set $N101, $P109
    isne $I100, $N100, $N101
    unless $I100, if_1051_end
.annotate 'line', 179
    find_lex $P110, "$subpir"
    find_lex $P111, "$line"
    set $S100, $P111
    $P110."append_format"(".annotate 'line', %0\n", $S100)
.annotate 'line', 180
    find_lex $P110, "$subline"
    find_lex $P111, "$line"
    assign $P110, $P111
  if_1051_end:
.annotate 'line', 183
    find_lex $P108, "$subpir"
    find_lex $P109, "$fmt"
    find_lex $P110, "@arglist"
    find_lex $P111, "$result"
    find_lex $P112, "$name"
    find_lex $P113, "$invocant"
    find_lex $P114, "$result"
    $P115 = $P108."append_format"($P109, $P110 :flat, $P111 :named("r"), $P112 :named("n"), $P113 :named("i"), $P114 :named("t"))
.annotate 'line', 131
    .return ($P115)
  control_1031:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("18_1312182902.1805") :method :outer("11_1312182902.1805") :multi(_,["POST";"Label"])
    .param pmc param_1055
.annotate 'file', "Compiler.pm"
.annotate 'line', 190
    new $P1054, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1054, control_1053
    push_eh $P1054
    .lex "self", self
    .lex "$node", param_1055
.annotate 'line', 191
    new $P100, "Undef"
    set $P1056, $P100
    .lex "$subpir", $P1056
    new $P101, "String"
    assign $P101, "$SUBPIR"
    set $S100, $P101
    find_caller_lex $P102, $S100
    store_lex "$subpir", $P102
.annotate 'line', 192
    find_lex $P101, "$subpir"
    find_lex $P102, "$node"
    $P103 = $P102."result"()
    $P104 = $P101."append_format"("  %0:\n", $P103)
.annotate 'line', 190
    .return ($P104)
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pir"  :subid("19_1312182902.1805") :method :outer("11_1312182902.1805") :multi(_,["POST";"Sub"])
    .param pmc param_1060
.annotate 'file', "Compiler.pm"
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
    getattribute $P100, exception, "payload"
    .return ($P100)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "hll_pir"  :subid("20_1312182902.1805") :method :outer("11_1312182902.1805")
    .param pmc param_1064
    .param pmc param_1065 :slurpy :named
.annotate 'file', "Compiler.pm"
.annotate 'line', 366
    new $P1063, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1063, control_1062
    push_eh $P1063
    .lex "self", self
    .lex "$node", param_1064
    .lex "%options", param_1065
.annotate 'line', 370
    new $P100, "Undef"
    set $P1066, $P100
    .lex "$source", $P1066
.annotate 'line', 371
    new $P101, "Undef"
    set $P1067, $P101
    .lex "$compiler", $P1067
.annotate 'line', 367
    new $P102, "String"
    assign $P102, "pir"
    find_lex $P1068, "%options"
    unless_null $P1068, vivify_26
    $P1068 = root_new ['parrot';'Hash']
    store_lex "%options", $P1068
  vivify_26:
    set $P1068["target"], $P102
.annotate 'line', 368
    find_lex $P102, "$node"
    $P103 = $P102."subid"()
    find_lex $P1069, "%options"
    unless_null $P1069, vivify_27
    $P1069 = root_new ['parrot';'Hash']
    store_lex "%options", $P1069
  vivify_27:
    set $P1069["subid"], $P103
.annotate 'line', 370
    find_lex $P1070, "$node"
    unless_null $P1070, vivify_28
    $P1070 = root_new ['parrot';'ResizablePMCArray']
  vivify_28:
    set $P102, $P1070[0]
    unless_null $P102, vivify_29
    new $P102, "Undef"
  vivify_29:
    store_lex "$source", $P102
.annotate 'line', 371
    find_lex $P102, "$node"
    $S100 = $P102."compiler"()
    compreg $P103, $S100
    store_lex "$compiler", $P103
.annotate 'line', 372
    find_lex $P103, "$compiler"
    isa $I100, $P103, "Sub"
    if $I100, if_1071
.annotate 'line', 374
    find_lex $P108, "$compiler"
    find_lex $P109, "$source"
    find_lex $P110, "%options"
    $P111 = $P108."compile"($P109, $P110 :flat)
    set $P102, $P111
.annotate 'line', 372
    goto if_1071_end
  if_1071:
.annotate 'line', 373
    find_lex $P104, "$compiler"
    find_lex $P105, "$source"
    find_lex $P106, "%options"
    $P107 = $P104($P105, $P106 :flat)
    set $P102, $P107
  if_1071_end:
.annotate 'line', 366
    .return ($P102)
  control_1062:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"Compiler"]
.sub "_block1072" :load :anon :subid("21_1312182902.1805")
.annotate 'file', "Compiler.pm"
.annotate 'line', 16
    .const 'Sub' $P1074 = "11_1312182902.1805" 
    $P100 = $P1074()
    .return ($P100)
.end


.namespace []
.sub "_block1076" :load :anon :subid("22_1312182902.1805")
.annotate 'file', "Compiler.pm"
.annotate 'line', 1
    .const 'Sub' $P1078 = "10_1312182902.1805" 
    $P100 = $P1078()
    .return ($P100)
.end

