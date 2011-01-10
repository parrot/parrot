
.namespace []
.sub "_block11"  :anon :subid("10_1294661331.09424")
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
.annotate 'line', 32
    get_hll_global $P14, ["POST";"Compiler"], "_block13" 
    capture_lex $P14
    $P1495 = $P14()
.annotate 'line', 1
    .return ($P1495)
    .const 'Sub' $P1497 = "64_1294661331.09424" 
    .return ($P1497)
.end


.namespace ["POST";"Compiler"]
.sub "_block13"  :subid("11_1294661331.09424") :outer("10_1294661331.09424")
.annotate 'line', 32
    .const 'Sub' $P1451 = "62_1294661331.09424" 
    capture_lex $P1451
    .const 'Sub' $P1435 = "60_1294661331.09424" 
    capture_lex $P1435
    .const 'Sub' $P1408 = "59_1294661331.09424" 
    capture_lex $P1408
    .const 'Sub' $P1330 = "57_1294661331.09424" 
    capture_lex $P1330
    .const 'Sub' $P1294 = "56_1294661331.09424" 
    capture_lex $P1294
    .const 'Sub' $P1242 = "55_1294661331.09424" 
    capture_lex $P1242
    .const 'Sub' $P1216 = "53_1294661331.09424" 
    capture_lex $P1216
    .const 'Sub' $P1097 = "52_1294661331.09424" 
    capture_lex $P1097
    .const 'Sub' $P1029 = "48_1294661331.09424" 
    capture_lex $P1029
    .const 'Sub' $P953 = "45_1294661331.09424" 
    capture_lex $P953
    .const 'Sub' $P913 = "44_1294661331.09424" 
    capture_lex $P913
    .const 'Sub' $P905 = "43_1294661331.09424" 
    capture_lex $P905
    .const 'Sub' $P889 = "42_1294661331.09424" 
    capture_lex $P889
    .const 'Sub' $P844 = "40_1294661331.09424" 
    capture_lex $P844
    .const 'Sub' $P804 = "39_1294661331.09424" 
    capture_lex $P804
    .const 'Sub' $P779 = "38_1294661331.09424" 
    capture_lex $P779
    .const 'Sub' $P543 = "34_1294661331.09424" 
    capture_lex $P543
    .const 'Sub' $P497 = "32_1294661331.09424" 
    capture_lex $P497
    .const 'Sub' $P476 = "30_1294661331.09424" 
    capture_lex $P476
    .const 'Sub' $P384 = "27_1294661331.09424" 
    capture_lex $P384
    .const 'Sub' $P117 = "24_1294661331.09424" 
    capture_lex $P117
    .const 'Sub' $P111 = "23_1294661331.09424" 
    capture_lex $P111
    .const 'Sub' $P77 = "21_1294661331.09424" 
    capture_lex $P77
    .const 'Sub' $P71 = "20_1294661331.09424" 
    capture_lex $P71
    .const 'Sub' $P66 = "19_1294661331.09424" 
    capture_lex $P66
    .const 'Sub' $P53 = "18_1294661331.09424" 
    capture_lex $P53
    .const 'Sub' $P47 = "17_1294661331.09424" 
    capture_lex $P47
    .const 'Sub' $P39 = "16_1294661331.09424" 
    capture_lex $P39
    .const 'Sub' $P34 = "15_1294661331.09424" 
    capture_lex $P34
    .const 'Sub' $P28 = "14_1294661331.09424" 
    capture_lex $P28
    .const 'Sub' $P23 = "13_1294661331.09424" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1294661331.09424" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .return ()
    .const 'Sub' $P1492 = "63_1294661331.09424" 
    .return ($P1492)
.end


.namespace ["POST";"Compiler"]
.sub "" :load :init :subid("post65") :outer("11_1294661331.09424")
.annotate 'line', 32
    get_hll_global $P14, ["POST";"Compiler"], "_block13" 
    .local pmc block
    set block, $P14
.annotate 'line', 1049
    load_bytecode "nqp-setting.pbc"
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "escape" :nsentry :subid("12_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_18
.annotate 'line', 32
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
    push_eh $P17
    .lex "self", self
    .lex "$str", param_18
.annotate 'line', 33
    get_hll_global $P19, ["PAST"], "Compiler"
    find_lex $P20, "$str"
    $P21 = $P19."escape"($P20)
.annotate 'line', 32
    .return ($P21)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "key_pir" :nsentry :subid("13_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_26 :slurpy
.annotate 'line', 40
    new $P25, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P25, control_24
    push_eh $P25
    .lex "self", self
    .lex "@args", param_26
.annotate 'line', 42

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
    
.annotate 'line', 40
    .return ()
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P27, exception, "payload"
    .return ($P27)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pir" :nsentry :subid("14_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_31
    .param pmc param_32 :slurpy :named
.annotate 'line', 70
    new $P30, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P30, control_29
    push_eh $P30
    .lex "self", self
    .lex "$post", param_31
    .lex "%adverbs", param_32
.annotate 'line', 71

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
    
.annotate 'line', 70
    .return ()
  control_29:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_pir_children" :nsentry :subid("15_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_37
.annotate 'line', 105
    new $P36, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P36, control_35
    push_eh $P36
    .lex "self", self
    .lex "$node", param_37
.annotate 'line', 106

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
    
.annotate 'line', 105
    .return ()
  control_35:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P38, exception, "payload"
    .return ($P38)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_pir" :nsentry :subid("16_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,_)
    .param pmc param_42
.annotate 'line', 137
    new $P41, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P41, control_40
    push_eh $P41
    .lex "self", self
    .lex "$node", param_42
.annotate 'line', 138
    find_lex $P43, "self"
    find_lex $P44, "$node"
    $P45 = $P43."pir_children"($P44)
.annotate 'line', 137
    .return ($P45)
  control_40:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P46, exception, "payload"
    .return ($P46)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "__pir" :nsentry :subid("17_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Op"])
    .param pmc param_50
.annotate 'line', 145
    new $P49, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P49, control_48
    push_eh $P49
    .lex "self", self
    .lex "$node", param_50
.annotate 'line', 146

    .local pmc node
    find_lex node, '$node'

    ##  determine the type of operation
    .local string pirop
    pirop = node.'pirop'()

    ##  determine if we're storing result
    .local string result
    result = node.'result'()
    unless result goto have_result
    result = concat result, ' = '
  have_result:

    ##  get list of arguments to operation
    .local pmc arglist
    arglist = node.'list'()

    ##  get format and arguments based on pirop
    .local string fmt, name, invocant
    if pirop == 'call' goto pirop_call
    if pirop == 'callmethod' goto pirop_callmethod
    if pirop == 'return' goto pirop_return
    if pirop == 'yield' goto pirop_yield
    if pirop == 'tailcall' goto pirop_tailcall
    if pirop == 'inline' goto pirop_inline

  pirop_opcode:
    fmt = "     \n"
    name = pirop
    goto pirop_emit

  pirop_call:
    fmt = "    $P51()\n"
    name = shift arglist
    goto pirop_emit

  pirop_callmethod:
    fmt = "    $P51.()\n"
    name = shift arglist
    invocant = shift arglist
    goto pirop_emit

  pirop_return:
    fmt = "    .return ()\n"
    goto pirop_emit

  pirop_yield:
    fmt = "    .yield ()\n"
    goto pirop_emit

  pirop_tailcall:
    name = shift arglist
    fmt = "    .tailcall ()\n"
    goto pirop_emit

  pirop_inline:
    fmt = node.'inline'()
    fmt = concat fmt, "\n"
    result = node.'result'()
    goto pirop_emit

  pirop_emit:
    .local pmc subpir, subline, line
    subpir  = find_caller_lex '$SUBPIR'
    subline = find_caller_lex '$SUBLINE'
    line    = find_caller_lex '$LINE'
    if subline == line goto done_line
    subpir.'append_format'(".annotate 'line', \n", line)
    assign subline, line
  done_line:
    subpir.'append_format'(fmt, arglist :flat, 'r'=>result, 'n'=>name, 'i'=>invocant, 't'=>result)
    
.annotate 'line', 145
    .return ($P51)
  control_48:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_pir" :nsentry :subid("18_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Label"])
    .param pmc param_56
.annotate 'line', 226
    new $P55, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P55, control_54
    push_eh $P55
    .lex "self", self
    .lex "$node", param_56
.annotate 'line', 227
    new $P57, "Undef"
    .lex "$subpir", $P57
    new $P58, "String"
    assign $P58, "$SUBPIR"
    set $S59, $P58
    find_caller_lex $P60, $S59
    store_lex "$subpir", $P60
.annotate 'line', 228
    find_lex $P61, "$subpir"
    find_lex $P62, "$node"
    $P63 = $P62."result"()
    $P64 = $P61."append_format"("  %0:\n", $P63)
.annotate 'line', 226
    .return ($P64)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P65, exception, "payload"
    .return ($P65)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_pir" :nsentry :subid("19_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Sub"])
    .param pmc param_69
.annotate 'line', 237
    new $P68, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P68, control_67
    push_eh $P68
    .lex "self", self
    .lex "$node", param_69
.annotate 'line', 238

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
    outerhll = get_global '$HLL'
    hll = node.'hll'()
    if hll goto have_hll
    hll = outerhll
  have_hll:
    set_global '$HLL', hll

    .local pmc outerns, ns, nskey
    outerns = get_global '$NAMESPACE'
    ns = outerns
    $P0 = node.'namespace'()
    unless $P0 goto have_ns
    ns = $P0
  have_ns:
    set_global '$NAMESPACE', ns
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
    subpir.'append_format'("\n.HLL \n", $P0)
  subpir_loadlibs:
    $P0 = node.'loadlibs'()
    if null $P0 goto subpir_ns
    unless $P0 goto subpir_ns
    $P1 = iter $P0
  subpir_loadlibs_loop:
    unless $P1 goto subpir_ns
    $P2 = shift $P1
    $P2 = self.'escape'($P2)
    subpir.'append_format'("\n.loadlib \n", $P2)
    goto subpir_loadlibs_loop
  subpir_ns:
    subpir.'append_format'("\n.namespace \n", nskey)
  subpir_directives:
    $S0 = node['directives']
    unless $S0 goto subpir_decl
    subpir.'append_format'("", $S0)
  subpir_decl:
    $S0 = self.'escape'(name)
    subpir.'append_format'(".sub  \n", $S0, pirflags)
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

    set_global '$NAMESPACE', outerns
    set_global '$HLL', outerhll
    
.annotate 'line', 237
    .return ()
  control_67:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P70, exception, "payload"
    .return ($P70)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "hll_pir" :nsentry :subid("20_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_74
    .param pmc param_75 :slurpy :named
.annotate 'line', 394
    new $P73, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P73, control_72
    push_eh $P73
    .lex "self", self
    .lex "$node", param_74
    .lex "%options", param_75
.annotate 'line', 395

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
    
.annotate 'line', 394
    .return ()
  control_72:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P76, exception, "payload"
    .return ($P76)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "pbc"  :subid("21_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_80
    .param pmc param_81
.annotate 'line', 436
    .const 'Sub' $P99 = "22_1294661331.09424" 
    capture_lex $P99
    new $P79, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P79, control_78
    push_eh $P79
    .lex "self", self
    .lex "$post", param_80
    .lex "%adverbs", param_81
.annotate 'line', 440
    $P82 = root_new ['parrot';'Hash']
    .lex "%context", $P82
    find_lex $P83, "self"
    find_lex $P84, "$post"
    find_lex $P85, "%adverbs"
    $P86 = $P83."create_context"($P84, $P85)
    store_lex "%context", $P86
.annotate 'line', 441
    new $P87, "Integer"
    assign $P87, 0
    find_lex $P88, "%context"
    unless_null $P88, vivify_66
    $P88 = root_new ['parrot';'Hash']
    store_lex "%context", $P88
  vivify_66:
    set $P88["DEBUG"], $P87
.annotate 'line', 443
    find_lex $P89, "$post"
    find_lex $P90, "%context"
    unless_null $P90, vivify_67
    $P90 = root_new ['parrot';'Hash']
    store_lex "%context", $P90
  vivify_67:
    set $P90["pir_file"], $P89
.annotate 'line', 448
    find_lex $P91, "self"
    find_lex $P92, "$post"
    $P91."enumerate_subs"($P92)
.annotate 'line', 450
    find_lex $P94, "$post"
    $P95 = $P94."list"()
    defined $I96, $P95
    unless $I96, for_undef_68
    iter $P93, $P95
    new $P106, 'ExceptionHandler'
    set_addr $P106, loop105_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop105_test:
    unless $P93, loop105_done
    shift $P97, $P93
  loop105_redo:
    .const 'Sub' $P99 = "22_1294661331.09424" 
    capture_lex $P99
    $P99($P97)
  loop105_next:
    goto loop105_test
  loop105_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop105_next
    eq $P107, .CONTROL_LOOP_REDO, loop105_redo
  loop105_done:
    pop_eh 
  for_undef_68:
    find_lex $P108, "%context"
    unless_null $P108, vivify_69
    $P108 = root_new ['parrot';'Hash']
  vivify_69:
    set $P109, $P108["packfile"]
    unless_null $P109, vivify_70
    new $P109, "Undef"
  vivify_70:
.annotate 'line', 436
    .return ($P109)
  control_78:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"Compiler"]
.sub "_block98"  :anon :subid("22_1294661331.09424") :outer("21_1294661331.09424")
    .param pmc param_100
.annotate 'line', 450
    .lex "$s", param_100
.annotate 'line', 451
    find_lex $P101, "self"
    find_lex $P102, "$s"
    find_lex $P103, "%context"
    $P104 = $P101."to_pbc"($P102, $P103)
.annotate 'line', 450
    .return ($P104)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc" :nsentry :subid("23_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["Undef"],_)
    .param pmc param_114
    .param pmc param_115
.annotate 'line', 460
    new $P113, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P113, control_112
    push_eh $P113
    .lex "self", self
    .lex "$what", param_114
    .lex "%context", param_115
    .return ()
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc" :nsentry :subid("24_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Sub"],_)
    .param pmc param_120
    .param pmc param_121
.annotate 'line', 464
    .const 'Sub' $P286 = "26_1294661331.09424" 
    capture_lex $P286
    .const 'Sub' $P207 = "25_1294661331.09424" 
    capture_lex $P207
    new $P119, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P119, control_118
    push_eh $P119
    .lex "self", self
    .lex "$sub", param_120
    .lex "%context", param_121
.annotate 'line', 469
    $P122 = root_new ['parrot';'ResizablePMCArray']
    .lex "@n_regs_used", $P122
.annotate 'line', 473
    new $P123, "Undef"
    .lex "$bc", $P123
.annotate 'line', 479
    new $P124, "Undef"
    .lex "$sb", $P124
.annotate 'line', 481
    new $P125, "Undef"
    .lex "$subname", $P125
.annotate 'line', 486
    new $P126, "Undef"
    .lex "$start_offset", $P126
.annotate 'line', 515
    new $P127, "Undef"
    .lex "$end_offset", $P127
.annotate 'line', 522
    $P128 = root_new ['parrot';'Hash']
    .lex "%sub", $P128
.annotate 'line', 549
    new $P129, "Undef"
    .lex "$idx", $P129
.annotate 'line', 466
    find_lex $P130, "$sub"
    find_lex $P131, "%context"
    unless_null $P131, vivify_71
    $P131 = root_new ['parrot';'Hash']
    store_lex "%context", $P131
  vivify_71:
    set $P131["sub"], $P130
.annotate 'line', 469
    find_lex $P132, "%context"
    unless_null $P132, vivify_72
    $P132 = root_new ['parrot';'Hash']
  vivify_72:
    set $P133, $P132["regalloc"]
    unless_null $P133, vivify_73
    new $P133, "Undef"
  vivify_73:
    find_lex $P134, "$sub"
    $P135 = $P133."process"($P134)
    store_lex "@n_regs_used", $P135
.annotate 'line', 470
    find_lex $P137, "%context"
    unless_null $P137, vivify_74
    $P137 = root_new ['parrot';'Hash']
  vivify_74:
    set $P138, $P137["DEBUG"]
    unless_null $P138, vivify_75
    new $P138, "Undef"
  vivify_75:
    unless $P138, if_136_end
    find_lex $P139, "self"
    new $P140, "String"
    assign $P140, "n_regs_used "
    find_lex $P141, "@n_regs_used"
    $S142 = $P141."join"("-")
    concat $P143, $P140, $S142
    $P139."debug"($P143)
  if_136_end:
.annotate 'line', 471
    find_lex $P145, "%context"
    unless_null $P145, vivify_76
    $P145 = root_new ['parrot';'Hash']
  vivify_76:
    set $P146, $P145["DEBUG"]
    unless_null $P146, vivify_77
    new $P146, "Undef"
  vivify_77:
    unless $P146, if_144_end
    find_lex $P147, "self"
    find_lex $P148, "$sub"
    $P147."dumper"($P148, "sub")
  if_144_end:
.annotate 'line', 473
    find_lex $P149, "%context"
    unless_null $P149, vivify_78
    $P149 = root_new ['parrot';'Hash']
  vivify_78:
    set $P150, $P149["bytecode"]
    unless_null $P150, vivify_79
    new $P150, "Undef"
  vivify_79:
    store_lex "$bc", $P150
.annotate 'line', 476
    $P151 = "hash"()
    find_lex $P152, "%context"
    unless_null $P152, vivify_80
    $P152 = root_new ['parrot';'Hash']
    store_lex "%context", $P152
  vivify_80:
    set $P152["labels_todo"], $P151
.annotate 'line', 479
    $P153 = "new"("StringBuilder")
    store_lex "$sb", $P153
.annotate 'line', 480
    find_lex $P154, "$sb"
    find_lex $P155, "$sub"
    $P156 = $P155."name"()
    set $S157, $P156
    $P154."push"($S157)
.annotate 'line', 481
    find_lex $P158, "$sb"
    set $S159, $P158
    new $P160, 'String'
    set $P160, $S159
    store_lex "$subname", $P160
.annotate 'line', 483
    find_lex $P162, "%context"
    unless_null $P162, vivify_81
    $P162 = root_new ['parrot';'Hash']
  vivify_81:
    set $P163, $P162["DEBUG"]
    unless_null $P163, vivify_82
    new $P163, "Undef"
  vivify_82:
    unless $P163, if_161_end
    find_lex $P164, "self"
    new $P165, 'String'
    set $P165, "Emitting "
    find_lex $P166, "$subname"
    concat $P167, $P165, $P166
    $P164."debug"($P167)
  if_161_end:
.annotate 'line', 484
    find_lex $P168, "%context"
    unless_null $P168, vivify_83
    $P168 = root_new ['parrot';'Hash']
  vivify_83:
    set $P169, $P168["constants"]
    unless_null $P169, vivify_84
    new $P169, "Undef"
  vivify_84:
    find_lex $P170, "$subname"
    $P169."get_or_create_string"($P170)
.annotate 'line', 486
    find_lex $P171, "$bc"
    set $N172, $P171
    new $P173, 'Float'
    set $P173, $N172
    store_lex "$start_offset", $P173
.annotate 'line', 487
    find_lex $P175, "%context"
    unless_null $P175, vivify_85
    $P175 = root_new ['parrot';'Hash']
  vivify_85:
    set $P176, $P175["DEBUG"]
    unless_null $P176, vivify_86
    new $P176, "Undef"
  vivify_86:
    unless $P176, if_174_end
    find_lex $P177, "self"
    new $P178, 'String'
    set $P178, "From "
    find_lex $P179, "$start_offset"
    concat $P180, $P178, $P179
    $P177."debug"($P180)
  if_174_end:
.annotate 'line', 490
    find_lex $P182, "$sub"
    unless_null $P182, vivify_87
    $P182 = root_new ['parrot';'Hash']
  vivify_87:
    set $P183, $P182["params"]
    unless_null $P183, vivify_88
    new $P183, "Undef"
  vivify_88:
    if $P183, unless_181_end
    $P184 = "list"()
    find_lex $P185, "$sub"
    unless_null $P185, vivify_89
    $P185 = root_new ['parrot';'Hash']
    store_lex "$sub", $P185
  vivify_89:
    set $P185["params"], $P184
  unless_181_end:
.annotate 'line', 491
    find_lex $P187, "$sub"
    $P188 = $P187."is_method"()
    unless $P188, if_186_end
    find_lex $P189, "$sub"
    unless_null $P189, vivify_90
    $P189 = root_new ['parrot';'Hash']
  vivify_90:
    set $P190, $P189["params"]
    unless_null $P190, vivify_91
    new $P190, "Undef"
  vivify_91:
    get_hll_global $P191, ["POST"], "Value"
    $P192 = $P191."new"("self" :named("name"))
    $P190."unshift"($P192)
  if_186_end:
.annotate 'line', 493
    find_lex $P194, "$sub"
    unless_null $P194, vivify_92
    $P194 = root_new ['parrot';'Hash']
  vivify_92:
    set $P195, $P194["params"]
    unless_null $P195, vivify_93
    new $P195, "Undef"
  vivify_93:
    set $N196, $P195
    unless $N196, if_193_end
.annotate 'line', 494
    find_lex $P197, "self"
    find_lex $P198, "$sub"
    unless_null $P198, vivify_94
    $P198 = root_new ['parrot';'Hash']
  vivify_94:
    set $P199, $P198["params"]
    unless_null $P199, vivify_95
    new $P199, "Undef"
  vivify_95:
    find_lex $P200, "%context"
    $P197."build_pcc_call"("get_params_pc", $P199, $P200)
  if_193_end:
.annotate 'line', 498
    find_lex $P202, "$sub"
    $P203 = $P202."list"()
    defined $I204, $P203
    unless $I204, for_undef_96
    iter $P201, $P203
    new $P214, 'ExceptionHandler'
    set_addr $P214, loop213_handler
    $P214."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P214
  loop213_test:
    unless $P201, loop213_done
    shift $P205, $P201
  loop213_redo:
    .const 'Sub' $P207 = "25_1294661331.09424" 
    capture_lex $P207
    $P207($P205)
  loop213_next:
    goto loop213_test
  loop213_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P215, exception, 'type'
    eq $P215, .CONTROL_LOOP_NEXT, loop213_next
    eq $P215, .CONTROL_LOOP_REDO, loop213_redo
  loop213_done:
    pop_eh 
  for_undef_96:
.annotate 'line', 502
    find_lex $P217, "%context"
    unless_null $P217, vivify_97
    $P217 = root_new ['parrot';'Hash']
  vivify_97:
    set $P218, $P217["DEBUG"]
    unless_null $P218, vivify_98
    new $P218, "Undef"
  vivify_98:
    unless $P218, if_216_end
    find_lex $P219, "self"
    new $P220, 'String'
    set $P220, "Middle "
    find_lex $P221, "$bc"
    set $N222, $P221
    set $S223, $N222
    concat $P224, $P220, $S223
    $P219."debug"($P224)
  if_216_end:
.annotate 'line', 505
    find_lex $P226, "%context"
    unless_null $P226, vivify_99
    $P226 = root_new ['parrot';'Hash']
  vivify_99:
    set $P227, $P226["DEBUG"]
    unless_null $P227, vivify_100
    new $P227, "Undef"
  vivify_100:
    unless $P227, if_225_end
    find_lex $P228, "self"
    $P228."debug"("Emitting default return")
  if_225_end:
.annotate 'line', 506
    find_lex $P229, "$bc"
.annotate 'line', 507
    new $P230, "ResizablePMCArray"
    push $P230, "set_returns_pc"
    push $P230, 0
    $P229."push"($P230)
.annotate 'line', 511
    find_lex $P231, "$bc"
    new $P232, "ResizablePMCArray"
    push $P232, "returncc"
    $P231."push"($P232)
.annotate 'line', 515
    find_lex $P233, "$bc"
    set $N234, $P233
    new $P235, 'Float'
    set $P235, $N234
    store_lex "$end_offset", $P235
.annotate 'line', 516
    find_lex $P237, "%context"
    unless_null $P237, vivify_101
    $P237 = root_new ['parrot';'Hash']
  vivify_101:
    set $P238, $P237["DEBUG"]
    unless_null $P238, vivify_102
    new $P238, "Undef"
  vivify_102:
    unless $P238, if_236_end
    find_lex $P239, "self"
    new $P240, 'String'
    set $P240, "To "
    find_lex $P241, "$end_offset"
    concat $P242, $P240, $P241
    $P239."debug"($P242)
  if_236_end:
.annotate 'line', 519
    find_lex $P243, "self"
    find_lex $P244, "$sub"
    find_lex $P245, "%context"
    unless_null $P245, vivify_103
    $P245 = root_new ['parrot';'Hash']
  vivify_103:
    set $P246, $P245["labels_todo"]
    unless_null $P246, vivify_104
    new $P246, "Undef"
  vivify_104:
    find_lex $P247, "%context"
    unless_null $P247, vivify_105
    $P247 = root_new ['parrot';'Hash']
  vivify_105:
    set $P248, $P247["bytecode"]
    unless_null $P248, vivify_106
    new $P248, "Undef"
  vivify_106:
    find_lex $P249, "%context"
    $P243."fixup_labels"($P244, $P246, $P248, $P249)
.annotate 'line', 522
    find_lex $P250, "$start_offset"
    find_lex $P251, "$end_offset"
    find_lex $P252, "$subname"
.annotate 'line', 527
    find_lex $P254, "$sub"
    unless_null $P254, vivify_107
    $P254 = root_new ['parrot';'Hash']
  vivify_107:
    set $P255, $P254["subid"]
    unless_null $P255, vivify_108
    new $P255, "Undef"
  vivify_108:
    set $P253, $P255
    defined $I257, $P253
    if $I257, default_256
    find_lex $P258, "$subname"
    set $P253, $P258
  default_256:
.annotate 'line', 528
    find_lex $P260, "$sub"
    $P261 = $P260."nsentry"()
    set $P259, $P261
    defined $I263, $P259
    if $I263, default_262
    find_lex $P264, "$subname"
    set $P259, $P264
  default_262:
.annotate 'line', 531
    find_lex $P267, "$sub"
    $P268 = $P267."is_method"()
    if $P268, if_266
    new $P270, "String"
    assign $P270, ""
    set $P265, $P270
    goto if_266_end
  if_266:
    find_lex $P269, "$subname"
    set $P265, $P269
  if_266_end:
    find_lex $P271, "@n_regs_used"
.annotate 'line', 535
    find_lex $P272, "self"
    find_lex $P273, "$sub"
    find_lex $P274, "%context"
    $P275 = $P272."create_sub_pf_flags"($P273, $P274)
.annotate 'line', 536
    find_lex $P276, "self"
    find_lex $P277, "$sub"
    find_lex $P278, "%context"
    $P279 = $P276."create_sub_comp_flags"($P277, $P278)
    $P280 = "hash"($P250 :named("start_offs"), $P251 :named("end_offs"), $P252 :named("name"), $P253 :named("subid"), $P259 :named("ns_entry_name"), -1 :named("vtable_index"), "0" :named("HLL_id"), $P265 :named("method_name"), $P271 :named("n_regs_used"), $P275 :named("pf_flags"), $P279 :named("comp_flags"))
.annotate 'line', 522
    store_lex "%sub", $P280
.annotate 'line', 539
    find_lex $P282, "$sub"
    $P283 = $P282."namespace"()
    $P284 = "defined"($P283)
    unless $P284, if_281_end
    .const 'Sub' $P286 = "26_1294661331.09424" 
    capture_lex $P286
    $P286()
  if_281_end:
.annotate 'line', 549
    find_lex $P300, "$sub"
    $P301 = $P300."constant_index"()
    store_lex "$idx", $P301
.annotate 'line', 550
    find_lex $P303, "$idx"
    $P304 = "defined"($P303)
    if $P304, if_302
.annotate 'line', 555
    find_lex $P318, "%context"
    unless_null $P318, vivify_111
    $P318 = root_new ['parrot';'Hash']
  vivify_111:
    set $P319, $P318["constants"]
    unless_null $P319, vivify_112
    new $P319, "Undef"
  vivify_112:
    find_lex $P320, "%sub"
    $P321 = "new"("Sub", $P320)
    $P322 = $P319."push"($P321)
    store_lex "$idx", $P322
.annotate 'line', 556
    find_lex $P323, "$sub"
    find_lex $P324, "$idx"
    $P323."constant_index"($P324)
.annotate 'line', 557
    find_lex $P326, "%context"
    unless_null $P326, vivify_113
    $P326 = root_new ['parrot';'Hash']
  vivify_113:
    set $P327, $P326["DEBUG"]
    unless_null $P327, vivify_114
    new $P327, "Undef"
  vivify_114:
    unless $P327, if_325_end
    find_lex $P328, "self"
    new $P329, 'String'
    set $P329, "Allocate new constant "
    find_lex $P330, "$idx"
    concat $P331, $P329, $P330
    $P328."debug"($P331)
  if_325_end:
.annotate 'line', 554
    goto if_302_end
  if_302:
.annotate 'line', 551
    find_lex $P306, "%context"
    unless_null $P306, vivify_115
    $P306 = root_new ['parrot';'Hash']
  vivify_115:
    set $P307, $P306["DEBUG"]
    unless_null $P307, vivify_116
    new $P307, "Undef"
  vivify_116:
    unless $P307, if_305_end
    find_lex $P308, "self"
    new $P309, 'String'
    set $P309, "Reusing old constant "
    find_lex $P310, "$idx"
    concat $P311, $P309, $P310
    $P308."debug"($P311)
  if_305_end:
.annotate 'line', 552
    find_lex $P312, "%sub"
    $P313 = "new"("Sub", $P312)
    find_lex $P314, "$idx"
    set $I315, $P314
    find_lex $P316, "%context"
    unless_null $P316, vivify_117
    $P316 = root_new ['parrot';'Hash']
    store_lex "%context", $P316
  vivify_117:
    set $P317, $P316["constants"]
    unless_null $P317, vivify_118
    $P317 = root_new ['parrot';'ResizablePMCArray']
    set $P316["constants"], $P317
  vivify_118:
    set $P317[$I315], $P313
  if_302_end:
.annotate 'line', 561
    find_lex $P334, "%context"
    unless_null $P334, vivify_119
    $P334 = root_new ['parrot';'Hash']
  vivify_119:
    set $P335, $P334["got_main_sub"]
    unless_null $P335, vivify_120
    new $P335, "Undef"
  vivify_120:
    isfalse $I336, $P335
    if $I336, if_333
    new $P332, 'Integer'
    set $P332, $I336
    goto if_333_end
  if_333:
.annotate 'line', 562
    find_lex $P338, "%context"
    unless_null $P338, vivify_121
    $P338 = root_new ['parrot';'Hash']
  vivify_121:
    set $P339, $P338["DEBUG"]
    unless_null $P339, vivify_122
    new $P339, "Undef"
  vivify_122:
    unless $P339, if_337_end
    find_lex $P340, "self"
    new $P341, 'String'
    set $P341, "main_sub is "
    find_lex $P342, "%context"
    unless_null $P342, vivify_123
    $P342 = root_new ['parrot';'Hash']
  vivify_123:
    set $P343, $P342["bytecode"]
    unless_null $P343, vivify_124
    new $P343, "Undef"
  vivify_124:
    $P344 = $P343."main_sub"()
    set $S345, $P344
    concat $P346, $P341, $S345
    $P340."debug"($P346)
  if_337_end:
.annotate 'line', 563
    find_lex $P348, "$sub"
    $P349 = $P348."main"()
    if $P349, if_347
.annotate 'line', 569
    find_lex $P360, "%context"
    unless_null $P360, vivify_125
    $P360 = root_new ['parrot';'Hash']
  vivify_125:
    set $P361, $P360["bytecode"]
    unless_null $P361, vivify_126
    new $P361, "Undef"
  vivify_126:
    $N362 = $P361."main_sub"()
    iseq $I363, $N362, -1.0
    unless $I363, if_359_end
.annotate 'line', 571
    find_lex $P365, "%context"
    unless_null $P365, vivify_127
    $P365 = root_new ['parrot';'Hash']
  vivify_127:
    set $P366, $P365["DEBUG"]
    unless_null $P366, vivify_128
    new $P366, "Undef"
  vivify_128:
    unless $P366, if_364_end
    find_lex $P367, "self"
    $P367."debug"("Got first sub")
  if_364_end:
.annotate 'line', 572
    find_lex $P368, "%context"
    unless_null $P368, vivify_129
    $P368 = root_new ['parrot';'Hash']
  vivify_129:
    set $P369, $P368["bytecode"]
    unless_null $P369, vivify_130
    new $P369, "Undef"
  vivify_130:
    find_lex $P370, "$idx"
    $P369."main_sub"($P370)
  if_359_end:
.annotate 'line', 569
    goto if_347_end
  if_347:
.annotate 'line', 564
    find_lex $P351, "%context"
    unless_null $P351, vivify_131
    $P351 = root_new ['parrot';'Hash']
  vivify_131:
    set $P352, $P351["DEBUG"]
    unless_null $P352, vivify_132
    new $P352, "Undef"
  vivify_132:
    unless $P352, if_350_end
    find_lex $P353, "self"
    $P353."debug"("Got first :main")
  if_350_end:
.annotate 'line', 566
    find_lex $P354, "%context"
    unless_null $P354, vivify_133
    $P354 = root_new ['parrot';'Hash']
  vivify_133:
    set $P355, $P354["bytecode"]
    unless_null $P355, vivify_134
    new $P355, "Undef"
  vivify_134:
    find_lex $P356, "$idx"
    $P355."main_sub"($P356)
.annotate 'line', 567
    new $P357, "Integer"
    assign $P357, 1
    find_lex $P358, "%context"
    unless_null $P358, vivify_135
    $P358 = root_new ['parrot';'Hash']
    store_lex "%context", $P358
  vivify_135:
    set $P358["got_main_sub"], $P357
  if_347_end:
.annotate 'line', 575
    find_lex $P373, "%context"
    unless_null $P373, vivify_136
    $P373 = root_new ['parrot';'Hash']
  vivify_136:
    set $P374, $P373["DEBUG"]
    unless_null $P374, vivify_137
    new $P374, "Undef"
  vivify_137:
    if $P374, if_372
    set $P371, $P374
    goto if_372_end
  if_372:
    find_lex $P375, "self"
    new $P376, 'String'
    set $P376, ":main sub is "
    find_lex $P377, "%context"
    unless_null $P377, vivify_138
    $P377 = root_new ['parrot';'Hash']
  vivify_138:
    set $P378, $P377["bytecode"]
    unless_null $P378, vivify_139
    new $P378, "Undef"
  vivify_139:
    $P379 = $P378."main_sub"()
    set $S380, $P379
    concat $P381, $P376, $S380
    $P382 = $P375."debug"($P381)
    set $P371, $P382
  if_372_end:
.annotate 'line', 561
    set $P332, $P371
  if_333_end:
.annotate 'line', 464
    .return ($P332)
  control_118:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P383, exception, "payload"
    .return ($P383)
.end


.namespace ["POST";"Compiler"]
.sub "_block206"  :anon :subid("25_1294661331.09424") :outer("24_1294661331.09424")
    .param pmc param_208
.annotate 'line', 498
    .lex "$_", param_208
.annotate 'line', 499
    find_lex $P209, "self"
    find_lex $P210, "$_"
    find_lex $P211, "%context"
    $P212 = $P209."to_pbc"($P210, $P211)
.annotate 'line', 498
    .return ($P212)
.end


.namespace ["POST";"Compiler"]
.sub "_block285"  :anon :subid("26_1294661331.09424") :outer("24_1294661331.09424")
.annotate 'line', 540
    new $P287, "Undef"
    .lex "$nskey", $P287
    find_lex $P288, "$sub"
    $P289 = $P288."namespace"()
    find_lex $P290, "%context"
    $P291 = $P289."to_pmc"($P290)
    set $P292, $P291[0]
    unless_null $P292, vivify_109
    new $P292, "Undef"
  vivify_109:
    store_lex "$nskey", $P292
.annotate 'line', 541
    find_lex $P295, "$nskey"
    typeof $S296, $P295
    iseq $I297, $S296, "Key"
    if $I297, if_294
    new $P293, 'Integer'
    set $P293, $I297
    goto if_294_end
  if_294:
.annotate 'line', 542
    find_lex $P298, "$nskey"
    find_lex $P299, "%sub"
    unless_null $P299, vivify_110
    $P299 = root_new ['parrot';'Hash']
    store_lex "%sub", $P299
  vivify_110:
    set $P299["namespace_name"], $P298
.annotate 'line', 541
    set $P293, $P298
  if_294_end:
.annotate 'line', 539
    .return ($P293)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc" :nsentry :subid("27_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Op"],_)
    .param pmc param_387
    .param pmc param_388
.annotate 'line', 579
    .const 'Sub' $P451 = "29_1294661331.09424" 
    capture_lex $P451
    .const 'Sub' $P406 = "28_1294661331.09424" 
    capture_lex $P406
    new $P386, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P386, control_385
    push_eh $P386
    .lex "self", self
    .lex "$op", param_387
    .lex "%context", param_388
.annotate 'line', 581
    new $P389, "Undef"
    .lex "$fullname", $P389
.annotate 'line', 596
    $P390 = root_new ['parrot';'ResizablePMCArray']
    .lex "@op", $P390
.annotate 'line', 581
    find_lex $P391, "$op"
    $P392 = $P391."pirop"()
    store_lex "$fullname", $P392
.annotate 'line', 582
    find_lex $P394, "%context"
    unless_null $P394, vivify_140
    $P394 = root_new ['parrot';'Hash']
  vivify_140:
    set $P395, $P394["DEBUG"]
    unless_null $P395, vivify_141
    new $P395, "Undef"
  vivify_141:
    unless $P395, if_393_end
    find_lex $P396, "self"
    new $P397, 'String'
    set $P397, "Short name "
    find_lex $P398, "$fullname"
    concat $P399, $P397, $P398
    $P396."debug"($P399)
  if_393_end:
.annotate 'line', 584
    find_lex $P401, "$op"
    $P402 = $P401."list"()
    defined $I403, $P402
    unless $I403, for_undef_142
    iter $P400, $P402
    new $P427, 'ExceptionHandler'
    set_addr $P427, loop426_handler
    $P427."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P427
  loop426_test:
    unless $P400, loop426_done
    shift $P404, $P400
  loop426_redo:
    .const 'Sub' $P406 = "28_1294661331.09424" 
    capture_lex $P406
    $P406($P404)
  loop426_next:
    goto loop426_test
  loop426_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P428, exception, 'type'
    eq $P428, .CONTROL_LOOP_NEXT, loop426_next
    eq $P428, .CONTROL_LOOP_REDO, loop426_redo
  loop426_done:
    pop_eh 
  for_undef_142:
.annotate 'line', 589
    find_lex $P430, "%context"
    unless_null $P430, vivify_143
    $P430 = root_new ['parrot';'Hash']
  vivify_143:
    set $P431, $P430["DEBUG"]
    unless_null $P431, vivify_144
    new $P431, "Undef"
  vivify_144:
    unless $P431, if_429_end
    find_lex $P432, "self"
    new $P433, 'String'
    set $P433, "Fullname "
    find_lex $P434, "$fullname"
    concat $P435, $P433, $P434
    $P432."debug"($P435)
  if_429_end:
.annotate 'line', 592
    find_lex $P436, "%context"
    unless_null $P436, vivify_145
    $P436 = root_new ['parrot';'Hash']
  vivify_145:
    set $P437, $P436["bytecode"]
    unless_null $P437, vivify_146
    new $P437, "Undef"
  vivify_146:
    set $N438, $P437
    new $P439, 'Float'
    set $P439, $N438
    find_lex $P440, "%context"
    unless_null $P440, vivify_147
    $P440 = root_new ['parrot';'Hash']
    store_lex "%context", $P440
  vivify_147:
    set $P440["opcode_offset"], $P439
.annotate 'line', 594
    find_lex $P441, "$fullname"
    find_lex $P442, "%context"
    unless_null $P442, vivify_148
    $P442 = root_new ['parrot';'Hash']
    store_lex "%context", $P442
  vivify_148:
    set $P442["opcode_fullname"], $P441
.annotate 'line', 596
    find_lex $P443, "$fullname"
    $P444 = "list"($P443)
    store_lex "@op", $P444
.annotate 'line', 597
    find_lex $P446, "$op"
    $P447 = $P446."list"()
    defined $I448, $P447
    unless $I448, for_undef_149
    iter $P445, $P447
    new $P460, 'ExceptionHandler'
    set_addr $P460, loop459_handler
    $P460."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P460
  loop459_test:
    unless $P445, loop459_done
    shift $P449, $P445
  loop459_redo:
    .const 'Sub' $P451 = "29_1294661331.09424" 
    capture_lex $P451
    $P451($P449)
  loop459_next:
    goto loop459_test
  loop459_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P461, exception, 'type'
    eq $P461, .CONTROL_LOOP_NEXT, loop459_next
    eq $P461, .CONTROL_LOOP_REDO, loop459_redo
  loop459_done:
    pop_eh 
  for_undef_149:
.annotate 'line', 600
    find_lex $P463, "%context"
    unless_null $P463, vivify_150
    $P463 = root_new ['parrot';'Hash']
  vivify_150:
    set $P464, $P463["DEBUG"]
    unless_null $P464, vivify_151
    new $P464, "Undef"
  vivify_151:
    unless $P464, if_462_end
    find_lex $P465, "self"
    new $P466, 'String'
    set $P466, "Op size "
    find_lex $P467, "@op"
    set $N468, $P467
    set $S469, $N468
    concat $P470, $P466, $S469
    $P465."debug"($P470)
  if_462_end:
.annotate 'line', 601
    find_lex $P471, "%context"
    unless_null $P471, vivify_152
    $P471 = root_new ['parrot';'Hash']
  vivify_152:
    set $P472, $P471["bytecode"]
    unless_null $P472, vivify_153
    new $P472, "Undef"
  vivify_153:
    find_lex $P473, "@op"
    $P474 = $P472."push"($P473)
.annotate 'line', 579
    .return ($P474)
  control_385:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P475, exception, "payload"
    .return ($P475)
.end


.namespace ["POST";"Compiler"]
.sub "_block405"  :anon :subid("28_1294661331.09424") :outer("27_1294661331.09424")
    .param pmc param_408
.annotate 'line', 585
    new $P407, "Undef"
    .lex "$type", $P407
    .lex "$_", param_408
    find_lex $P411, "$_"
    $P412 = $P411."type"()
    unless $P412, unless_410
    set $P409, $P412
    goto unless_410_end
  unless_410:
    find_lex $P413, "self"
    find_lex $P414, "$_"
    $P415 = $P414."name"()
    find_lex $P416, "%context"
    $P417 = $P413."get_register"($P415, $P416)
    $P418 = $P417."type"()
    set $P409, $P418
  unless_410_end:
    store_lex "$type", $P409
.annotate 'line', 586
    find_lex $P419, "$fullname"
    set $S420, $P419
    new $P421, 'String'
    set $P421, $S420
    concat $P422, $P421, "_"
    find_lex $P423, "$type"
    set $S424, $P423
    concat $P425, $P422, $S424
    store_lex "$fullname", $P425
.annotate 'line', 584
    .return ($P425)
.end


.namespace ["POST";"Compiler"]
.sub "_block450"  :anon :subid("29_1294661331.09424") :outer("27_1294661331.09424")
    .param pmc param_452
.annotate 'line', 597
    .lex "$_", param_452
.annotate 'line', 598
    find_lex $P453, "@op"
    find_lex $P454, "self"
    find_lex $P455, "$_"
    find_lex $P456, "%context"
    $P457 = $P454."to_op"($P455, $P456)
    $P458 = $P453."push"($P457)
.annotate 'line', 597
    .return ($P458)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc" :nsentry :subid("30_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Node"],_)
    .param pmc param_479
    .param pmc param_480
.annotate 'line', 605
    .const 'Sub' $P487 = "31_1294661331.09424" 
    capture_lex $P487
    new $P478, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P478, control_477
    push_eh $P478
    .lex "self", self
    .lex "$node", param_479
    .lex "%context", param_480
.annotate 'line', 606
    find_lex $P482, "$node"
    $P483 = $P482."list"()
    defined $I484, $P483
    unless $I484, for_undef_154
    iter $P481, $P483
    new $P494, 'ExceptionHandler'
    set_addr $P494, loop493_handler
    $P494."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P494
  loop493_test:
    unless $P481, loop493_done
    shift $P485, $P481
  loop493_redo:
    .const 'Sub' $P487 = "31_1294661331.09424" 
    capture_lex $P487
    $P487($P485)
  loop493_next:
    goto loop493_test
  loop493_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P495, exception, 'type'
    eq $P495, .CONTROL_LOOP_NEXT, loop493_next
    eq $P495, .CONTROL_LOOP_REDO, loop493_redo
  loop493_done:
    pop_eh 
  for_undef_154:
.annotate 'line', 605
    .return ($P481)
  control_477:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P496, exception, "payload"
    .return ($P496)
.end


.namespace ["POST";"Compiler"]
.sub "_block486"  :anon :subid("31_1294661331.09424") :outer("30_1294661331.09424")
    .param pmc param_488
.annotate 'line', 606
    .lex "$_", param_488
.annotate 'line', 607
    find_lex $P489, "self"
    find_lex $P490, "$_"
    find_lex $P491, "%context"
    $P492 = $P489."to_pbc"($P490, $P491)
.annotate 'line', 606
    .return ($P492)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc" :nsentry :subid("32_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Label"],_)
    .param pmc param_500
    .param pmc param_501
.annotate 'line', 611
    .const 'Sub' $P533 = "33_1294661331.09424" 
    capture_lex $P533
    new $P499, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P499, control_498
    push_eh $P499
    .lex "self", self
    .lex "$l", param_500
    .lex "%context", param_501
.annotate 'line', 612
    new $P502, "Undef"
    .lex "$bc", $P502
.annotate 'line', 615
    new $P503, "Undef"
    .lex "$pos", $P503
.annotate 'line', 612
    find_lex $P504, "%context"
    unless_null $P504, vivify_155
    $P504 = root_new ['parrot';'Hash']
  vivify_155:
    set $P505, $P504["bytecode"]
    unless_null $P505, vivify_156
    new $P505, "Undef"
  vivify_156:
    store_lex "$bc", $P505
.annotate 'line', 613
    find_lex $P507, "$l"
    $P508 = $P507."declared"()
    if $P508, unless_506_end
    find_lex $P509, "self"
    $P509."panic"("Trying to emit undelcared label!")
  unless_506_end:
.annotate 'line', 615
    find_lex $P510, "$bc"
    set $N511, $P510
    new $P512, 'Float'
    set $P512, $N511
    store_lex "$pos", $P512
.annotate 'line', 616
    find_lex $P514, "%context"
    unless_null $P514, vivify_157
    $P514 = root_new ['parrot';'Hash']
  vivify_157:
    set $P515, $P514["DEBUG"]
    unless_null $P515, vivify_158
    new $P515, "Undef"
  vivify_158:
    unless $P515, if_513_end
    find_lex $P516, "self"
    new $P517, 'String'
    set $P517, "Declare label '"
    find_lex $P518, "$l"
    $P519 = $P518."name"()
    set $S520, $P519
    concat $P521, $P517, $S520
    concat $P522, $P521, "' at "
    find_lex $P523, "$pos"
    concat $P524, $P522, $P523
    $P516."debug"($P524)
  if_513_end:
.annotate 'line', 618
    find_lex $P525, "$l"
    find_lex $P526, "$pos"
    $P525."position"($P526)
.annotate 'line', 620
    find_lex $P528, "$l"
    $P529 = $P528."list"()
    defined $I530, $P529
    unless $I530, for_undef_159
    iter $P527, $P529
    new $P540, 'ExceptionHandler'
    set_addr $P540, loop539_handler
    $P540."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P540
  loop539_test:
    unless $P527, loop539_done
    shift $P531, $P527
  loop539_redo:
    .const 'Sub' $P533 = "33_1294661331.09424" 
    capture_lex $P533
    $P533($P531)
  loop539_next:
    goto loop539_test
  loop539_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P541, exception, 'type'
    eq $P541, .CONTROL_LOOP_NEXT, loop539_next
    eq $P541, .CONTROL_LOOP_REDO, loop539_redo
  loop539_done:
    pop_eh 
  for_undef_159:
.annotate 'line', 611
    .return ($P527)
  control_498:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P542, exception, "payload"
    .return ($P542)
.end


.namespace ["POST";"Compiler"]
.sub "_block532"  :anon :subid("33_1294661331.09424") :outer("32_1294661331.09424")
    .param pmc param_534
.annotate 'line', 620
    .lex "$_", param_534
.annotate 'line', 621
    find_lex $P535, "self"
    find_lex $P536, "$_"
    find_lex $P537, "%context"
    $P538 = $P535."to_pbc"($P536, $P537)
.annotate 'line', 620
    .return ($P538)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_pbc" :nsentry :subid("34_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Call"],_)
    .param pmc param_546
    .param pmc param_547
.annotate 'line', 625
    .const 'Sub' $P612 = "35_1294661331.09424" 
    capture_lex $P612
    new $P545, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P545, control_544
    push_eh $P545
    .lex "self", self
    .lex "$call", param_546
    .lex "%context", param_547
.annotate 'line', 626
    new $P548, "Undef"
    .lex "$bc", $P548
.annotate 'line', 627
    new $P549, "Undef"
    .lex "$calltype", $P549
.annotate 'line', 628
    new $P550, "Undef"
    .lex "$is_tailcall", $P550
.annotate 'line', 626
    find_lex $P551, "%context"
    unless_null $P551, vivify_160
    $P551 = root_new ['parrot';'Hash']
  vivify_160:
    set $P552, $P551["bytecode"]
    unless_null $P552, vivify_161
    new $P552, "Undef"
  vivify_161:
    store_lex "$bc", $P552
.annotate 'line', 627
    find_lex $P553, "$call"
    $P554 = $P553."calltype"()
    store_lex "$calltype", $P554
.annotate 'line', 628
    find_lex $P555, "$calltype"
    set $S556, $P555
    iseq $I557, $S556, "tailcall"
    new $P558, 'Integer'
    set $P558, $I557
    store_lex "$is_tailcall", $P558
.annotate 'line', 630
    find_lex $P563, "$calltype"
    set $S564, $P563
    iseq $I565, $S564, "call"
    unless $I565, unless_562
    new $P561, 'Integer'
    set $P561, $I565
    goto unless_562_end
  unless_562:
    find_lex $P566, "$calltype"
    set $S567, $P566
    iseq $I568, $S567, "tailcall"
    new $P561, 'Integer'
    set $P561, $I568
  unless_562_end:
    if $P561, if_560
.annotate 'line', 708
    find_lex $P752, "$calltype"
    set $S753, $P752
    iseq $I754, $S753, "return"
    if $I754, if_751
.annotate 'line', 712
    find_lex $P764, "$calltype"
    set $S765, $P764
    iseq $I766, $S765, "results"
    if $I766, if_763
.annotate 'line', 717
    find_lex $P772, "self"
    new $P773, 'String'
    set $P773, "NYI "
    find_lex $P774, "$calltype"
    set $S775, $P774
    concat $P776, $P773, $S775
    $P777 = $P772."panic"($P776)
.annotate 'line', 716
    set $P762, $P777
.annotate 'line', 712
    goto if_763_end
  if_763:
.annotate 'line', 714
    find_lex $P767, "self"
    find_lex $P768, "$call"
    unless_null $P768, vivify_162
    $P768 = root_new ['parrot';'Hash']
  vivify_162:
    set $P769, $P768["params"]
    unless_null $P769, vivify_163
    new $P769, "Undef"
  vivify_163:
    find_lex $P770, "%context"
    $P771 = $P767."build_pcc_call"("get_results_pc", $P769, $P770)
.annotate 'line', 712
    set $P762, $P771
  if_763_end:
    set $P750, $P762
.annotate 'line', 708
    goto if_751_end
  if_751:
.annotate 'line', 709
    find_lex $P755, "self"
    find_lex $P756, "$call"
    unless_null $P756, vivify_164
    $P756 = root_new ['parrot';'Hash']
  vivify_164:
    set $P757, $P756["params"]
    unless_null $P757, vivify_165
    new $P757, "Undef"
  vivify_165:
    find_lex $P758, "%context"
    $P755."build_pcc_call"("set_returns_pc", $P757, $P758)
.annotate 'line', 710
    find_lex $P759, "$bc"
    new $P760, "ResizablePMCArray"
    push $P760, "returncc"
    $P761 = $P759."push"($P760)
.annotate 'line', 708
    set $P750, $P761
  if_751_end:
    set $P559, $P750
.annotate 'line', 630
    goto if_560_end
  if_560:
.annotate 'line', 631
    find_lex $P570, "$call"
    $P571 = $P570."invocant"()
    unless $P571, if_569_end
.annotate 'line', 632
    find_lex $P573, "$call"
    unless_null $P573, vivify_166
    $P573 = root_new ['parrot';'Hash']
  vivify_166:
    set $P574, $P573["params"]
    unless_null $P574, vivify_167
    new $P574, "Undef"
  vivify_167:
    if $P574, unless_572_end
    $P575 = "list"()
    find_lex $P576, "$call"
    unless_null $P576, vivify_168
    $P576 = root_new ['parrot';'Hash']
    store_lex "$call", $P576
  vivify_168:
    set $P576["params"], $P575
  unless_572_end:
.annotate 'line', 633
    find_lex $P577, "$call"
    unless_null $P577, vivify_169
    $P577 = root_new ['parrot';'Hash']
  vivify_169:
    set $P578, $P577["params"]
    unless_null $P578, vivify_170
    new $P578, "Undef"
  vivify_170:
    find_lex $P579, "$call"
    $P580 = $P579."invocant"()
    $P578."unshift"($P580)
  if_569_end:
.annotate 'line', 636
    find_lex $P581, "self"
    find_lex $P582, "$call"
    unless_null $P582, vivify_171
    $P582 = root_new ['parrot';'Hash']
  vivify_171:
    set $P583, $P582["params"]
    unless_null $P583, vivify_172
    new $P583, "Undef"
  vivify_172:
    find_lex $P584, "%context"
    $P581."build_pcc_call"("set_args_pc", $P583, $P584)
.annotate 'line', 638
    find_lex $P586, "$call"
    $P587 = $P586."invocant"()
    if $P587, if_585
.annotate 'line', 652
    .const 'Sub' $P612 = "35_1294661331.09424" 
    capture_lex $P612
    $P612()
    goto if_585_end
  if_585:
.annotate 'line', 639
    find_lex $P589, "$call"
    $P590 = $P589."name"()
    get_hll_global $P591, ["POST"], "Constant"
    $P592 = $P590."isa"($P591)
    if $P592, if_588
.annotate 'line', 649
    find_lex $P610, "self"
    $P610."panic"("NYI $P0.$S0()")
.annotate 'line', 648
    goto if_588_end
  if_588:
.annotate 'line', 640
    find_lex $P593, "$bc"
.annotate 'line', 642
    find_lex $P596, "$is_tailcall"
    if $P596, if_595
    new $P598, "String"
    assign $P598, "callmethodcc_p_sc"
    set $P594, $P598
    goto if_595_end
  if_595:
    new $P597, "String"
    assign $P597, "tailcallmethod_p_sc"
    set $P594, $P597
  if_595_end:
.annotate 'line', 644
    find_lex $P599, "self"
    find_lex $P600, "$call"
    $P601 = $P600."invocant"()
    find_lex $P602, "%context"
    $P603 = $P599."to_op"($P601, $P602)
.annotate 'line', 645
    find_lex $P604, "self"
    find_lex $P605, "$call"
    $P606 = $P605."name"()
    find_lex $P607, "%context"
    $P608 = $P604."to_op"($P606, $P607)
    new $P609, "ResizablePMCArray"
    push $P609, $P594
    push $P609, $P603
    push $P609, $P608
    $P593."push"($P609)
  if_588_end:
  if_585_end:
.annotate 'line', 704
    find_lex $P744, "$is_tailcall"
    unless $P744, unless_743
    set $P742, $P744
    goto unless_743_end
  unless_743:
.annotate 'line', 705
    find_lex $P745, "self"
    find_lex $P746, "$call"
    unless_null $P746, vivify_202
    $P746 = root_new ['parrot';'Hash']
  vivify_202:
    set $P747, $P746["results"]
    unless_null $P747, vivify_203
    new $P747, "Undef"
  vivify_203:
    find_lex $P748, "%context"
    $P749 = $P745."build_pcc_call"("get_results_pc", $P747, $P748)
.annotate 'line', 704
    set $P742, $P749
  unless_743_end:
.annotate 'line', 630
    set $P559, $P742
  if_560_end:
.annotate 'line', 625
    .return ($P559)
  control_544:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P778, exception, "payload"
    .return ($P778)
.end


.namespace ["POST";"Compiler"]
.sub "_block611"  :anon :subid("35_1294661331.09424") :outer("34_1294661331.09424")
.annotate 'line', 652
    .const 'Sub' $P624 = "36_1294661331.09424" 
    capture_lex $P624
.annotate 'line', 653
    new $P613, "Undef"
    .lex "$SUB", $P613
.annotate 'line', 654
    new $P614, "Undef"
    .lex "$processed", $P614
.annotate 'line', 698
    new $P615, "Undef"
    .lex "$o", $P615
.annotate 'line', 652
    find_lex $P616, "$SUB"
.annotate 'line', 654
    new $P617, "Integer"
    assign $P617, 0
    store_lex "$processed", $P617
.annotate 'line', 655
    find_lex $P619, "$call"
    $P620 = $P619."name"()
    get_hll_global $P621, ["POST"], "Constant"
    $P622 = $P620."isa"($P621)
    unless $P622, if_618_end
    .const 'Sub' $P624 = "36_1294661331.09424" 
    capture_lex $P624
    $P624()
  if_618_end:
.annotate 'line', 683
    find_lex $P693, "$processed"
    if $P693, unless_692_end
.annotate 'line', 684
    find_lex $P695, "$call"
    $P696 = $P695."name"()
    get_hll_global $P697, ["POST"], "Constant"
    $P698 = $P696."isa"($P697)
    if $P698, if_694
.annotate 'line', 693
    find_lex $P714, "%context"
    unless_null $P714, vivify_190
    $P714 = root_new ['parrot';'Hash']
  vivify_190:
    set $P715, $P714["DEBUG"]
    unless_null $P715, vivify_191
    new $P715, "Undef"
  vivify_191:
    unless $P715, if_713_end
    find_lex $P716, "self"
    new $P717, "String"
    assign $P717, "Name is "
    find_lex $P718, "$call"
    unless_null $P718, vivify_192
    $P718 = root_new ['parrot';'Hash']
  vivify_192:
    set $P719, $P718["name"]
    unless_null $P719, vivify_193
    new $P719, "Undef"
  vivify_193:
    $S720 = $P719."WHAT"()
    concat $P721, $P717, $S720
    $P716."debug"($P721)
  if_713_end:
.annotate 'line', 694
    find_lex $P722, "$call"
    unless_null $P722, vivify_194
    $P722 = root_new ['parrot';'Hash']
  vivify_194:
    set $P723, $P722["name"]
    unless_null $P723, vivify_195
    new $P723, "Undef"
  vivify_195:
    store_lex "$SUB", $P723
.annotate 'line', 692
    goto if_694_end
  if_694:
.annotate 'line', 685
    find_lex $P699, "%context"
    unless_null $P699, vivify_196
    $P699 = root_new ['parrot';'Hash']
  vivify_196:
    set $P700, $P699["sub"]
    unless_null $P700, vivify_197
    new $P700, "Undef"
  vivify_197:
    $P701 = $P700."symbol"("!SUB")
    store_lex "$SUB", $P701
.annotate 'line', 686
    find_lex $P702, "$bc"
.annotate 'line', 688
    find_lex $P703, "self"
    find_lex $P704, "$SUB"
    find_lex $P705, "%context"
    $P706 = $P703."to_op"($P704, $P705)
.annotate 'line', 689
    find_lex $P707, "self"
    find_lex $P708, "$call"
    unless_null $P708, vivify_198
    $P708 = root_new ['parrot';'Hash']
  vivify_198:
    set $P709, $P708["name"]
    unless_null $P709, vivify_199
    new $P709, "Undef"
  vivify_199:
    find_lex $P710, "%context"
    $P711 = $P707."to_op"($P709, $P710)
    new $P712, "ResizablePMCArray"
    push $P712, "find_sub_not_null_p_sc"
    push $P712, $P706
    push $P712, $P711
    $P702."push"($P712)
  if_694_end:
  unless_692_end:
.annotate 'line', 698
    find_lex $P726, "$is_tailcall"
    if $P726, if_725
    new $P728, "String"
    assign $P728, "invokecc_p"
    set $P724, $P728
    goto if_725_end
  if_725:
    new $P727, "String"
    assign $P727, "tailcall_p"
    set $P724, $P727
  if_725_end:
    store_lex "$o", $P724
.annotate 'line', 700
    find_lex $P730, "%context"
    unless_null $P730, vivify_200
    $P730 = root_new ['parrot';'Hash']
  vivify_200:
    set $P731, $P730["DEBUG"]
    unless_null $P731, vivify_201
    new $P731, "Undef"
  vivify_201:
    unless $P731, if_729_end
    find_lex $P732, "self"
    find_lex $P733, "$o"
    $P732."debug"($P733)
  if_729_end:
.annotate 'line', 701
    find_lex $P734, "$bc"
    find_lex $P735, "$o"
    find_lex $P736, "self"
    find_lex $P737, "$SUB"
    find_lex $P738, "%context"
    $P739 = $P736."to_op"($P737, $P738)
    new $P740, "ResizablePMCArray"
    push $P740, $P735
    push $P740, $P739
    $P741 = $P734."push"($P740)
.annotate 'line', 652
    .return ($P741)
.end


.namespace ["POST";"Compiler"]
.sub "_block623"  :anon :subid("36_1294661331.09424") :outer("35_1294661331.09424")
.annotate 'line', 655
    .const 'Sub' $P660 = "37_1294661331.09424" 
    capture_lex $P660
.annotate 'line', 658
    new $P625, "Undef"
    .lex "$full_name", $P625
.annotate 'line', 661
    new $P626, "Undef"
    .lex "$invocable_sub", $P626
.annotate 'line', 655
    find_lex $P627, "$full_name"
.annotate 'line', 659
    find_lex $P629, "%context"
    unless_null $P629, vivify_173
    $P629 = root_new ['parrot';'Hash']
  vivify_173:
    set $P630, $P629["sub"]
    unless_null $P630, vivify_174
    new $P630, "Undef"
  vivify_174:
    $P631 = $P630."namespace"()
    unless $P631, if_628_end
    find_lex $P632, "%context"
    unless_null $P632, vivify_175
    $P632 = root_new ['parrot';'Hash']
  vivify_175:
    set $P633, $P632["sub"]
    unless_null $P633, vivify_176
    new $P633, "Undef"
  vivify_176:
    $P634 = $P633."namespace"()
    $P635 = $P634."Str"()
    store_lex "$full_name", $P635
  if_628_end:
.annotate 'line', 660
    find_lex $P636, "$full_name"
    set $S637, $P636
    new $P638, 'String'
    set $P638, $S637
    find_lex $P639, "$call"
    unless_null $P639, vivify_177
    $P639 = root_new ['parrot';'Hash']
  vivify_177:
    set $P640, $P639["name"]
    unless_null $P640, vivify_178
    $P640 = root_new ['parrot';'Hash']
  vivify_178:
    set $P641, $P640["value"]
    unless_null $P641, vivify_179
    new $P641, "Undef"
  vivify_179:
    set $S642, $P641
    concat $P643, $P638, $S642
    store_lex "$full_name", $P643
.annotate 'line', 661
    find_lex $P644, "%context"
    unless_null $P644, vivify_180
    $P644 = root_new ['parrot';'Hash']
  vivify_180:
    set $P645, $P644["pir_file"]
    unless_null $P645, vivify_181
    new $P645, "Undef"
  vivify_181:
    find_lex $P646, "$full_name"
    $P647 = $P645."sub"($P646)
    store_lex "$invocable_sub", $P647
.annotate 'line', 662
    find_lex $P649, "%context"
    unless_null $P649, vivify_182
    $P649 = root_new ['parrot';'Hash']
  vivify_182:
    set $P650, $P649["DEBUG"]
    unless_null $P650, vivify_183
    new $P650, "Undef"
  vivify_183:
    unless $P650, if_648_end
    find_lex $P651, "self"
    new $P652, 'String'
    set $P652, "invocable_sub '"
    find_lex $P653, "$full_name"
    concat $P654, $P652, $P653
    concat $P655, $P654, "'"
    $P651."debug"($P655)
  if_648_end:
.annotate 'line', 663
    find_lex $P658, "$invocable_sub"
    if $P658, if_657
    set $P656, $P658
    goto if_657_end
  if_657:
    .const 'Sub' $P660 = "37_1294661331.09424" 
    capture_lex $P660
    $P691 = $P660()
    set $P656, $P691
  if_657_end:
.annotate 'line', 655
    .return ($P656)
.end


.namespace ["POST";"Compiler"]
.sub "_block659"  :anon :subid("37_1294661331.09424") :outer("36_1294661331.09424")
.annotate 'line', 664
    new $P661, "Undef"
    .lex "$idx", $P661
    find_lex $P662, "$invocable_sub"
    $P663 = $P662."constant_index"()
    store_lex "$idx", $P663
.annotate 'line', 665
    find_lex $P665, "$idx"
    $P666 = "defined"($P665)
    if $P666, unless_664_end
.annotate 'line', 667
    find_lex $P667, "%context"
    unless_null $P667, vivify_184
    $P667 = root_new ['parrot';'Hash']
  vivify_184:
    set $P668, $P667["constants"]
    unless_null $P668, vivify_185
    new $P668, "Undef"
  vivify_185:
    $P669 = "new"("Integer")
    $P670 = $P668."push"($P669)
    store_lex "$idx", $P670
.annotate 'line', 668
    find_lex $P671, "$invocable_sub"
    find_lex $P672, "$idx"
    $P671."constant_index"($P672)
.annotate 'line', 669
    find_lex $P674, "%context"
    unless_null $P674, vivify_186
    $P674 = root_new ['parrot';'Hash']
  vivify_186:
    set $P675, $P674["DEBUG"]
    unless_null $P675, vivify_187
    new $P675, "Undef"
  vivify_187:
    unless $P675, if_673_end
    find_lex $P676, "self"
    new $P677, 'String'
    set $P677, "Allocate constant for it "
    find_lex $P678, "$idx"
    concat $P679, $P677, $P678
    $P676."debug"($P679)
  if_673_end:
  unless_664_end:
.annotate 'line', 672
    find_lex $P680, "%context"
    unless_null $P680, vivify_188
    $P680 = root_new ['parrot';'Hash']
  vivify_188:
    set $P681, $P680["sub"]
    unless_null $P681, vivify_189
    new $P681, "Undef"
  vivify_189:
    $P682 = $P681."symbol"("!SUB")
    store_lex "$SUB", $P682
.annotate 'line', 673
    find_lex $P683, "$bc"
.annotate 'line', 675
    find_lex $P684, "self"
    find_lex $P685, "$SUB"
    find_lex $P686, "%context"
    $P687 = $P684."to_op"($P685, $P686)
    find_lex $P688, "$idx"
    new $P689, "ResizablePMCArray"
    push $P689, "set_p_pc"
    push $P689, $P687
    push $P689, $P688
.annotate 'line', 676
    $P683."push"($P689)
.annotate 'line', 679
    new $P690, "Integer"
    assign $P690, 1
    store_lex "$processed", $P690
.annotate 'line', 663
    .return ($P690)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op" :nsentry :subid("38_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Key"],_)
    .param pmc param_782
    .param pmc param_783
.annotate 'line', 724
    new $P781, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P781, control_780
    push_eh $P781
    .lex "self", self
    .lex "$key", param_782
    .lex "%context", param_783
.annotate 'line', 727
    new $P784, "Undef"
    .lex "$key_pmc", $P784
.annotate 'line', 733
    new $P785, "Undef"
    .lex "$constants", $P785
.annotate 'line', 734
    new $P786, "Undef"
    .lex "$idx", $P786
.annotate 'line', 726
    find_lex $P788, "%context"
    unless_null $P788, vivify_204
    $P788 = root_new ['parrot';'Hash']
  vivify_204:
    set $P789, $P788["DEBUG"]
    unless_null $P789, vivify_205
    new $P789, "Undef"
  vivify_205:
    unless $P789, if_787_end
    find_lex $P790, "self"
    $P790."debug"("Want key")
  if_787_end:
.annotate 'line', 727
    find_lex $P791, "$key"
    find_lex $P792, "%context"
    $P793 = $P791."to_pmc"($P792)
    set $P794, $P793[0]
    unless_null $P794, vivify_206
    new $P794, "Undef"
  vivify_206:
    store_lex "$key_pmc", $P794
.annotate 'line', 728
    find_lex $P796, "%context"
    unless_null $P796, vivify_207
    $P796 = root_new ['parrot';'Hash']
  vivify_207:
    set $P797, $P796["DEBUG"]
    unless_null $P797, vivify_208
    new $P797, "Undef"
  vivify_208:
    unless $P797, if_795_end
    find_lex $P798, "self"
    $P798."debug"("Got key")
  if_795_end:
.annotate 'line', 733
    find_lex $P799, "%context"
    unless_null $P799, vivify_209
    $P799 = root_new ['parrot';'Hash']
  vivify_209:
    set $P800, $P799["constants"]
    unless_null $P800, vivify_210
    new $P800, "Undef"
  vivify_210:
    store_lex "$constants", $P800
    find_lex $P801, "$idx"
.annotate 'line', 735

        .local pmc key_pmc, constants, idx
        .local int i0
        find_lex constants, "$constants"
        find_lex key_pmc, "$key_pmc"
        i0 = constants.'pmc_count'()
        push constants, key_pmc

        find_lex idx, "$idx"
        idx = i0
        store_lex "$idx", idx
    
    find_lex $P802, "$idx"
.annotate 'line', 724
    .return ($P802)
  control_780:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P803, exception, "payload"
    .return ($P803)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op" :nsentry :subid("39_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Constant"],_)
    .param pmc param_807
    .param pmc param_808
.annotate 'line', 751
    new $P806, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P806, control_805
    push_eh $P806
    .lex "self", self
    .lex "$op", param_807
    .lex "%context", param_808
.annotate 'line', 752
    new $P809, "Undef"
    .lex "$idx", $P809
.annotate 'line', 753
    new $P810, "Undef"
    .lex "$type", $P810
.annotate 'line', 751
    find_lex $P811, "$idx"
.annotate 'line', 753
    find_lex $P812, "$op"
    $P813 = $P812."type"()
    store_lex "$type", $P813
.annotate 'line', 754
    find_lex $P817, "$type"
    set $S818, $P817
    iseq $I819, $S818, "ic"
    unless $I819, unless_816
    new $P815, 'Integer'
    set $P815, $I819
    goto unless_816_end
  unless_816:
    find_lex $P820, "$type"
    set $S821, $P820
    iseq $I822, $S821, "kic"
    new $P815, 'Integer'
    set $P815, $I822
  unless_816_end:
    if $P815, if_814
.annotate 'line', 757
    find_lex $P826, "$type"
    set $S827, $P826
    iseq $I828, $S827, "nc"
    if $I828, if_825
.annotate 'line', 761
    find_lex $P834, "self"
    $P834."panic"("NYI")
.annotate 'line', 760
    goto if_825_end
  if_825:
.annotate 'line', 758
    find_lex $P829, "%context"
    unless_null $P829, vivify_211
    $P829 = root_new ['parrot';'Hash']
  vivify_211:
    set $P830, $P829["constants"]
    unless_null $P830, vivify_212
    new $P830, "Undef"
  vivify_212:
    find_lex $P831, "$op"
    $P832 = $P831."value"()
    $P833 = $P830."get_or_create_number"($P832)
    store_lex "$idx", $P833
  if_825_end:
.annotate 'line', 757
    goto if_814_end
  if_814:
.annotate 'line', 755
    find_lex $P823, "$op"
    $P824 = $P823."value"()
    store_lex "$idx", $P824
  if_814_end:
.annotate 'line', 764
    find_lex $P836, "%context"
    unless_null $P836, vivify_213
    $P836 = root_new ['parrot';'Hash']
  vivify_213:
    set $P837, $P836["DEBUG"]
    unless_null $P837, vivify_214
    new $P837, "Undef"
  vivify_214:
    unless $P837, if_835_end
    find_lex $P838, "self"
    new $P839, 'String'
    set $P839, "Index "
    find_lex $P840, "$idx"
    concat $P841, $P839, $P840
    $P838."debug"($P841)
  if_835_end:
    find_lex $P842, "$idx"
.annotate 'line', 751
    .return ($P842)
  control_805:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P843, exception, "payload"
    .return ($P843)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op" :nsentry :subid("40_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"String"],_)
    .param pmc param_847
    .param pmc param_848
.annotate 'line', 768
    .const 'Sub' $P874 = "41_1294661331.09424" 
    capture_lex $P874
    new $P846, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P846, control_845
    push_eh $P846
    .lex "self", self
    .lex "$str", param_847
    .lex "%context", param_848
.annotate 'line', 769
    new $P849, "Undef"
    .lex "$idx", $P849
.annotate 'line', 770
    new $P850, "Undef"
    .lex "$type", $P850
.annotate 'line', 768
    find_lex $P851, "$idx"
.annotate 'line', 770
    find_lex $P852, "$str"
    $P853 = $P852."type"()
    store_lex "$type", $P853
.annotate 'line', 771
    find_lex $P855, "$type"
    set $S856, $P855
    isne $I857, $S856, "sc"
    unless $I857, if_854_end
.annotate 'line', 772
    find_lex $P858, "self"
    $P858."panic"("attempt to pass a non-sc value off as a string")
  if_854_end:
.annotate 'line', 774
    find_lex $P862, "$str"
    $S863 = $P862."encoding"()
    iseq $I864, $S863, "fixed_8"
    if $I864, if_861
    new $P860, 'Integer'
    set $P860, $I864
    goto if_861_end
  if_861:
    find_lex $P865, "$str"
    $S866 = $P865."charset"()
    iseq $I867, $S866, "ascii"
    new $P860, 'Integer'
    set $P860, $I867
  if_861_end:
    if $P860, if_859
.annotate 'line', 777
    .const 'Sub' $P874 = "41_1294661331.09424" 
    capture_lex $P874
    $P874()
    goto if_859_end
  if_859:
.annotate 'line', 775
    find_lex $P868, "%context"
    unless_null $P868, vivify_217
    $P868 = root_new ['parrot';'Hash']
  vivify_217:
    set $P869, $P868["constants"]
    unless_null $P869, vivify_218
    new $P869, "Undef"
  vivify_218:
    find_lex $P870, "$str"
    $P871 = $P870."value"()
    $P872 = $P869."get_or_create_string"($P871)
    store_lex "$idx", $P872
  if_859_end:
.annotate 'line', 774
    find_lex $P887, "$idx"
.annotate 'line', 768
    .return ($P887)
  control_845:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P888, exception, "payload"
    .return ($P888)
.end


.namespace ["POST";"Compiler"]
.sub "_block873"  :anon :subid("41_1294661331.09424") :outer("40_1294661331.09424")
.annotate 'line', 779
    new $P875, "Undef"
    .lex "$bb", $P875
.annotate 'line', 780
    new $P876, "Undef"
    .lex "$str_val", $P876
.annotate 'line', 779
    $P877 = "new"("ByteBuffer")
    store_lex "$bb", $P877
.annotate 'line', 780
    find_lex $P878, "$str"
    $P879 = $P878."value"()
    store_lex "$str_val", $P879
.annotate 'line', 781

            .local pmc str_val, bb
            .local string s
            str_val = find_lex '$str_val'
            bb      = find_lex '$bb'
            s = str_val
            bb = s
        
.annotate 'line', 789
    find_lex $P880, "%context"
    unless_null $P880, vivify_215
    $P880 = root_new ['parrot';'Hash']
  vivify_215:
    set $P881, $P880["constants"]
    unless_null $P881, vivify_216
    new $P881, "Undef"
  vivify_216:
    find_lex $P882, "$bb"
.annotate 'line', 790
    find_lex $P883, "$str"
    $P884 = $P883."encoding"()
    $P885 = $P882."get_string"($P884)
.annotate 'line', 789
    $P886 = $P881."get_or_create_string"($P885)
    store_lex "$idx", $P886
.annotate 'line', 777
    .return ($P886)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op" :nsentry :subid("42_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Value"],_)
    .param pmc param_892
    .param pmc param_893
.annotate 'line', 797
    new $P891, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P891, control_890
    push_eh $P891
    .lex "self", self
    .lex "$val", param_892
    .lex "%context", param_893
.annotate 'line', 799
    new $P894, "Undef"
    .lex "$orig", $P894
    find_lex $P895, "self"
    find_lex $P896, "$val"
    $P897 = $P896."name"()
    find_lex $P898, "%context"
    $P899 = $P895."get_register"($P897, $P898)
    store_lex "$orig", $P899
.annotate 'line', 800
    find_lex $P900, "self"
    find_lex $P901, "$orig"
    find_lex $P902, "%context"
    $P903 = $P900."to_op"($P901, $P902)
.annotate 'line', 797
    .return ($P903)
  control_890:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P904, exception, "payload"
    .return ($P904)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op" :nsentry :subid("43_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Register"],_)
    .param pmc param_908
    .param pmc param_909
.annotate 'line', 803
    new $P907, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P907, control_906
    push_eh $P907
    .lex "self", self
    .lex "$reg", param_908
    .lex "%context", param_909
.annotate 'line', 804
    find_lex $P910, "$reg"
    $P911 = $P910."regno"()
.annotate 'line', 803
    .return ($P911)
  control_906:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P912, exception, "payload"
    .return ($P912)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "to_op" :nsentry :subid("44_1294661331.09424") :method :outer("11_1294661331.09424") :multi(_,["POST";"Label"],_)
    .param pmc param_916
    .param pmc param_917
.annotate 'line', 807
    new $P915, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P915, control_914
    push_eh $P915
    .lex "self", self
    .lex "$l", param_916
    .lex "%context", param_917
.annotate 'line', 809
    new $P918, "Undef"
    .lex "$bc", $P918
.annotate 'line', 810
    new $P919, "Undef"
    .lex "$pos", $P919
.annotate 'line', 809
    find_lex $P920, "%context"
    unless_null $P920, vivify_219
    $P920 = root_new ['parrot';'Hash']
  vivify_219:
    set $P921, $P920["bytecode"]
    unless_null $P921, vivify_220
    new $P921, "Undef"
  vivify_220:
    store_lex "$bc", $P921
.annotate 'line', 810
    find_lex $P922, "$bc"
    set $N923, $P922
    new $P924, 'Float'
    set $P924, $N923
    store_lex "$pos", $P924
.annotate 'line', 814
    find_lex $P925, "$l"
    $P926 = $P925."name"()
    find_lex $P927, "%context"
    unless_null $P927, vivify_221
    $P927 = root_new ['parrot';'Hash']
  vivify_221:
    set $P928, $P927["opcode_offset"]
    unless_null $P928, vivify_222
    new $P928, "Undef"
  vivify_222:
    find_lex $P929, "%context"
    unless_null $P929, vivify_223
    $P929 = root_new ['parrot';'Hash']
  vivify_223:
    set $P930, $P929["opcode_fullname"]
    unless_null $P930, vivify_224
    new $P930, "Undef"
  vivify_224:
    $P931 = "hash"($P926 :named("name"), $P928 :named("offset"), $P930 :named("opname"))
.annotate 'line', 813
    find_lex $P932, "$pos"
    find_lex $P933, "%context"
    unless_null $P933, vivify_225
    $P933 = root_new ['parrot';'Hash']
    store_lex "%context", $P933
  vivify_225:
    set $P934, $P933["labels_todo"]
    unless_null $P934, vivify_226
    $P934 = root_new ['parrot';'Hash']
    set $P933["labels_todo"], $P934
  vivify_226:
    set $P934[$P932], $P931
.annotate 'line', 819
    find_lex $P936, "%context"
    unless_null $P936, vivify_227
    $P936 = root_new ['parrot';'Hash']
  vivify_227:
    set $P937, $P936["DEBUG"]
    unless_null $P937, vivify_228
    new $P937, "Undef"
  vivify_228:
    unless $P937, if_935_end
    find_lex $P938, "self"
    new $P939, 'String'
    set $P939, "Todo label '"
    find_lex $P940, "$l"
    $P941 = $P940."name"()
    set $S942, $P941
    concat $P943, $P939, $S942
    concat $P944, $P943, "' at "
    find_lex $P945, "$pos"
    concat $P946, $P944, $P945
    concat $P947, $P946, ", "
    find_lex $P948, "%context"
    unless_null $P948, vivify_229
    $P948 = root_new ['parrot';'Hash']
  vivify_229:
    set $P949, $P948["opcode_offset"]
    unless_null $P949, vivify_230
    new $P949, "Undef"
  vivify_230:
    set $S950, $P949
    concat $P951, $P947, $S950
    $P938."debug"($P951)
  if_935_end:
.annotate 'line', 807
    .return (0)
  control_914:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P952, exception, "payload"
    .return ($P952)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_pcc_call" :nsentry :subid("45_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_956
    .param pmc param_957
    .param pmc param_958
.annotate 'line', 830
    .const 'Sub' $P993 = "46_1294661331.09424" 
    capture_lex $P993
    new $P955, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P955, control_954
    push_eh $P955
    .lex "self", self
    .lex "$opname", param_956
    .lex "@args", param_957
    .lex "%context", param_958
.annotate 'line', 831
    new $P959, "Undef"
    .lex "$bc", $P959
.annotate 'line', 832
    new $P960, "Undef"
    .lex "$signature", $P960
.annotate 'line', 833
    new $P961, "Undef"
    .lex "$sig_idx", $P961
.annotate 'line', 840
    $P962 = root_new ['parrot';'ResizablePMCArray']
    .lex "@op", $P962
.annotate 'line', 831
    find_lex $P963, "%context"
    unless_null $P963, vivify_231
    $P963 = root_new ['parrot';'Hash']
  vivify_231:
    set $P964, $P963["bytecode"]
    unless_null $P964, vivify_232
    new $P964, "Undef"
  vivify_232:
    store_lex "$bc", $P964
.annotate 'line', 832
    find_lex $P965, "self"
    find_lex $P966, "@args"
    find_lex $P967, "%context"
    $P968 = $P965."build_args_signature"($P966, $P967)
    store_lex "$signature", $P968
.annotate 'line', 833
    find_lex $P969, "%context"
    unless_null $P969, vivify_233
    $P969 = root_new ['parrot';'Hash']
  vivify_233:
    set $P970, $P969["constants"]
    unless_null $P970, vivify_234
    new $P970, "Undef"
  vivify_234:
    find_lex $P971, "$signature"
    $P972 = $P970."get_or_create_pmc"($P971)
    store_lex "$sig_idx", $P972
.annotate 'line', 835
    find_lex $P974, "%context"
    unless_null $P974, vivify_235
    $P974 = root_new ['parrot';'Hash']
  vivify_235:
    set $P975, $P974["DEBUG"]
    unless_null $P975, vivify_236
    new $P975, "Undef"
  vivify_236:
    unless $P975, if_973_end
    find_lex $P976, "self"
    new $P977, 'String'
    set $P977, "Sig: "
    find_lex $P978, "$sig_idx"
    concat $P979, $P977, $P978
    $P976."debug"($P979)
  if_973_end:
.annotate 'line', 837
    find_lex $P981, "%context"
    unless_null $P981, vivify_237
    $P981 = root_new ['parrot';'Hash']
  vivify_237:
    set $P982, $P981["DEBUG"]
    unless_null $P982, vivify_238
    new $P982, "Undef"
  vivify_238:
    unless $P982, if_980_end
    find_lex $P983, "self"
    find_lex $P984, "$opname"
    $P983."debug"($P984)
  if_980_end:
.annotate 'line', 840
    find_lex $P985, "$opname"
    find_lex $P986, "$sig_idx"
    $P987 = "list"($P985, $P986)
    store_lex "@op", $P987
.annotate 'line', 842
    find_lex $P989, "@args"
    defined $I990, $P989
    unless $I990, for_undef_239
    iter $P988, $P989
    new $P1023, 'ExceptionHandler'
    set_addr $P1023, loop1022_handler
    $P1023."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1023
  loop1022_test:
    unless $P988, loop1022_done
    shift $P991, $P988
  loop1022_redo:
    .const 'Sub' $P993 = "46_1294661331.09424" 
    capture_lex $P993
    $P993($P991)
  loop1022_next:
    goto loop1022_test
  loop1022_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1024, exception, 'type'
    eq $P1024, .CONTROL_LOOP_NEXT, loop1022_next
    eq $P1024, .CONTROL_LOOP_REDO, loop1022_redo
  loop1022_done:
    pop_eh 
  for_undef_239:
.annotate 'line', 853
    find_lex $P1025, "$bc"
    find_lex $P1026, "@op"
    $P1027 = $P1025."push"($P1026)
.annotate 'line', 830
    .return ($P1027)
  control_954:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1028, exception, "payload"
    .return ($P1028)
.end


.namespace ["POST";"Compiler"]
.sub "_block992"  :anon :subid("46_1294661331.09424") :outer("45_1294661331.09424")
    .param pmc param_994
.annotate 'line', 842
    .const 'Sub' $P1000 = "47_1294661331.09424" 
    capture_lex $P1000
    .lex "$arg", param_994
.annotate 'line', 844
    find_lex $P996, "$arg"
    $P997 = $P996."modifier"()
    isa $I998, $P997, "Hash"
    unless $I998, if_995_end
    .const 'Sub' $P1000 = "47_1294661331.09424" 
    capture_lex $P1000
    $P1000()
  if_995_end:
.annotate 'line', 850
    find_lex $P1016, "@op"
    find_lex $P1017, "self"
    find_lex $P1018, "$arg"
    find_lex $P1019, "%context"
    $P1020 = $P1017."to_op"($P1018, $P1019)
    $P1021 = $P1016."push"($P1020)
.annotate 'line', 842
    .return ($P1021)
.end


.namespace ["POST";"Compiler"]
.sub "_block999"  :anon :subid("47_1294661331.09424") :outer("46_1294661331.09424")
.annotate 'line', 845
    new $P1001, "Undef"
    .lex "$name", $P1001
    find_lex $P1003, "$arg"
    $P1004 = $P1003."modifier"()
    set $P1005, $P1004["named"]
    unless_null $P1005, vivify_240
    new $P1005, "Undef"
  vivify_240:
    set $P1002, $P1005
    defined $I1007, $P1002
    if $I1007, default_1006
    find_lex $P1008, "$arg"
    $P1009 = $P1008."name"()
    set $P1002, $P1009
  default_1006:
    store_lex "$name", $P1002
.annotate 'line', 846
    find_lex $P1010, "@op"
.annotate 'line', 847
    find_lex $P1011, "%context"
    unless_null $P1011, vivify_241
    $P1011 = root_new ['parrot';'Hash']
  vivify_241:
    set $P1012, $P1011["constants"]
    unless_null $P1012, vivify_242
    new $P1012, "Undef"
  vivify_242:
    find_lex $P1013, "$name"
    $P1014 = $P1012."get_or_create_string"($P1013)
    $P1015 = $P1010."push"($P1014)
.annotate 'line', 844
    .return ($P1015)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_args_signature" :nsentry :subid("48_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1032
    .param pmc param_1033
.annotate 'line', 856
    .const 'Sub' $P1084 = "51_1294661331.09424" 
    capture_lex $P1084
    .const 'Sub' $P1044 = "49_1294661331.09424" 
    capture_lex $P1044
    new $P1031, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1031, control_1030
    push_eh $P1031
    .lex "self", self
    .lex "@args", param_1032
    .lex "%context", param_1033
.annotate 'line', 857
    $P1034 = root_new ['parrot';'ResizablePMCArray']
    .lex "@sig", $P1034
.annotate 'line', 870
    new $P1035, "Undef"
    .lex "$elements", $P1035
.annotate 'line', 871
    new $P1036, "Undef"
    .lex "$signature", $P1036
.annotate 'line', 879
    new $P1037, "Undef"
    .lex "$idx", $P1037
.annotate 'line', 856
    find_lex $P1038, "@sig"
.annotate 'line', 858
    find_lex $P1040, "@args"
    defined $I1041, $P1040
    unless $I1041, for_undef_243
    iter $P1039, $P1040
    new $P1072, 'ExceptionHandler'
    set_addr $P1072, loop1071_handler
    $P1072."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1072
  loop1071_test:
    unless $P1039, loop1071_done
    shift $P1042, $P1039
  loop1071_redo:
    .const 'Sub' $P1044 = "49_1294661331.09424" 
    capture_lex $P1044
    $P1044($P1042)
  loop1071_next:
    goto loop1071_test
  loop1071_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1073, exception, 'type'
    eq $P1073, .CONTROL_LOOP_NEXT, loop1071_next
    eq $P1073, .CONTROL_LOOP_REDO, loop1071_redo
  loop1071_done:
    pop_eh 
  for_undef_243:
.annotate 'line', 870
    find_lex $P1074, "@sig"
    set $N1075, $P1074
    new $P1076, 'Float'
    set $P1076, $N1075
    store_lex "$elements", $P1076
.annotate 'line', 871

        $P1077 = find_lex '$elements'
        $I99 = $P1077
        $P1077 = find_lex '$signature'
        $P1077 = new ['FixedIntegerArray'], $I99
    
    store_lex "$signature", $P1077
.annotate 'line', 879
    new $P1078, "Integer"
    assign $P1078, 0
    store_lex "$idx", $P1078
.annotate 'line', 880
    find_lex $P1080, "@sig"
    defined $I1081, $P1080
    unless $I1081, for_undef_245
    iter $P1079, $P1080
    new $P1093, 'ExceptionHandler'
    set_addr $P1093, loop1092_handler
    $P1093."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1093
  loop1092_test:
    unless $P1079, loop1092_done
    shift $P1082, $P1079
  loop1092_redo:
    .const 'Sub' $P1084 = "51_1294661331.09424" 
    capture_lex $P1084
    $P1084($P1082)
  loop1092_next:
    goto loop1092_test
  loop1092_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1094, exception, 'type'
    eq $P1094, .CONTROL_LOOP_NEXT, loop1092_next
    eq $P1094, .CONTROL_LOOP_REDO, loop1092_redo
  loop1092_done:
    pop_eh 
  for_undef_245:
    find_lex $P1095, "$signature"
.annotate 'line', 856
    .return ($P1095)
  control_1030:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1096, exception, "payload"
    .return ($P1096)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "_block1043"  :anon :subid("49_1294661331.09424") :outer("48_1294661331.09424")
    .param pmc param_1045
.annotate 'line', 858
    .const 'Sub' $P1063 = "50_1294661331.09424" 
    capture_lex $P1063
    .lex "$arg", param_1045
.annotate 'line', 860
    new $P1046, "Undef"
    .lex "$s", $P1046
    find_lex $P1047, "self"
    find_lex $P1048, "$arg"
    find_lex $P1049, "%context"
    $P1050 = $P1047."build_single_arg"($P1048, $P1049)
    store_lex "$s", $P1050
.annotate 'line', 861
    find_lex $P1053, "$s"
    isa $I1054, $P1053, "Integer"
    if $I1054, if_1052
.annotate 'line', 865
    find_lex $P1059, "$s"
    defined $I1060, $P1059
    unless $I1060, for_undef_244
    iter $P1058, $P1059
    new $P1069, 'ExceptionHandler'
    set_addr $P1069, loop1068_handler
    $P1069."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1069
  loop1068_test:
    unless $P1058, loop1068_done
    shift $P1061, $P1058
  loop1068_redo:
    .const 'Sub' $P1063 = "50_1294661331.09424" 
    capture_lex $P1063
    $P1063($P1061)
  loop1068_next:
    goto loop1068_test
  loop1068_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1070, exception, 'type'
    eq $P1070, .CONTROL_LOOP_NEXT, loop1068_next
    eq $P1070, .CONTROL_LOOP_REDO, loop1068_redo
  loop1068_done:
    pop_eh 
  for_undef_244:
.annotate 'line', 864
    set $P1051, $P1058
.annotate 'line', 861
    goto if_1052_end
  if_1052:
.annotate 'line', 862
    find_lex $P1055, "@sig"
    find_lex $P1056, "$s"
    $P1057 = $P1055."push"($P1056)
.annotate 'line', 861
    set $P1051, $P1057
  if_1052_end:
.annotate 'line', 858
    .return ($P1051)
.end


.namespace ["POST";"Compiler"]
.sub "_block1062"  :anon :subid("50_1294661331.09424") :outer("49_1294661331.09424")
    .param pmc param_1064
.annotate 'line', 865
    .lex "$_", param_1064
    find_lex $P1065, "@sig"
    find_lex $P1066, "$_"
    $P1067 = $P1065."push"($P1066)
    .return ($P1067)
.end


.namespace ["POST";"Compiler"]
.sub "_block1083"  :anon :subid("51_1294661331.09424") :outer("48_1294661331.09424")
    .param pmc param_1085
.annotate 'line', 880
    .lex "$val", param_1085
.annotate 'line', 881
    find_lex $P1086, "$val"
    find_lex $P1087, "$idx"
    set $I1088, $P1087
    find_lex $P1089, "$signature"
    unless_null $P1089, vivify_246
    $P1089 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$signature", $P1089
  vivify_246:
    set $P1089[$I1088], $P1086
    find_lex $P1090, "$idx"
    clone $P1091, $P1090
    inc $P1090
.annotate 'line', 880
    .return ($P1091)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "build_single_arg" :nsentry :subid("52_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1100
    .param pmc param_1101
.annotate 'line', 888
    new $P1099, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1099, control_1098
    push_eh $P1099
    .lex "self", self
    .lex "$arg", param_1100
    .lex "%context", param_1101
.annotate 'line', 891
    new $P1102, "Undef"
    .lex "$type", $P1102
.annotate 'line', 893
    new $P1103, "Undef"
    .lex "$res", $P1103
.annotate 'line', 907
    new $P1104, "Undef"
    .lex "$mod", $P1104
.annotate 'line', 891
    find_lex $P1106, "$arg"
    $P1107 = $P1106."type"()
    set $P1105, $P1107
    defined $I1109, $P1105
    if $I1109, default_1108
    find_lex $P1110, "self"
    find_lex $P1111, "$arg"
    $P1112 = $P1111."name"()
    find_lex $P1113, "%context"
    $P1114 = $P1110."get_register"($P1112, $P1113)
    $P1115 = $P1114."type"()
    set $P1105, $P1115
  default_1108:
    store_lex "$type", $P1105
    find_lex $P1116, "$res"
.annotate 'line', 896
    find_lex $P1118, "$type"
    set $S1119, $P1118
    iseq $I1120, $S1119, "i"
    if $I1120, if_1117
.annotate 'line', 897
    find_lex $P1123, "$type"
    set $S1124, $P1123
    iseq $I1125, $S1124, "s"
    if $I1125, if_1122
.annotate 'line', 898
    find_lex $P1128, "$type"
    set $S1129, $P1128
    iseq $I1130, $S1129, "p"
    if $I1130, if_1127
.annotate 'line', 899
    find_lex $P1133, "$type"
    set $S1134, $P1133
    iseq $I1135, $S1134, "n"
    if $I1135, if_1132
.annotate 'line', 901
    find_lex $P1138, "$type"
    set $S1139, $P1138
    iseq $I1140, $S1139, "ic"
    if $I1140, if_1137
.annotate 'line', 902
    find_lex $P1144, "$type"
    set $S1145, $P1144
    iseq $I1146, $S1145, "sc"
    if $I1146, if_1143
.annotate 'line', 903
    find_lex $P1150, "$type"
    set $S1151, $P1150
    iseq $I1152, $S1151, "pc"
    if $I1152, if_1149
.annotate 'line', 904
    find_lex $P1156, "$type"
    set $S1157, $P1156
    iseq $I1158, $S1157, "nc"
    if $I1158, if_1155
.annotate 'line', 905
    find_lex $P1161, "self"
    new $P1162, 'String'
    set $P1162, "Unknown arg type '"
    find_lex $P1163, "$type"
    concat $P1164, $P1162, $P1163
    concat $P1165, $P1164, "'"
    $P1161."panic"($P1165)
    goto if_1155_end
  if_1155:
.annotate 'line', 904
    new $P1159, "Integer"
    assign $P1159, 3
    add $P1160, $P1159, 16
    store_lex "$res", $P1160
  if_1155_end:
    goto if_1149_end
  if_1149:
.annotate 'line', 903
    new $P1153, "Integer"
    assign $P1153, 2
    add $P1154, $P1153, 16
    store_lex "$res", $P1154
  if_1149_end:
    goto if_1143_end
  if_1143:
.annotate 'line', 902
    new $P1147, "Integer"
    assign $P1147, 1
    add $P1148, $P1147, 16
    store_lex "$res", $P1148
  if_1143_end:
    goto if_1137_end
  if_1137:
.annotate 'line', 901
    new $P1141, "Integer"
    assign $P1141, 0
    add $P1142, $P1141, 16
    store_lex "$res", $P1142
  if_1137_end:
    goto if_1132_end
  if_1132:
.annotate 'line', 899
    new $P1136, "Integer"
    assign $P1136, 3
    store_lex "$res", $P1136
  if_1132_end:
    goto if_1127_end
  if_1127:
.annotate 'line', 898
    new $P1131, "Integer"
    assign $P1131, 2
    store_lex "$res", $P1131
  if_1127_end:
    goto if_1122_end
  if_1122:
.annotate 'line', 897
    new $P1126, "Integer"
    assign $P1126, 1
    store_lex "$res", $P1126
  if_1122_end:
    goto if_1117_end
  if_1117:
.annotate 'line', 896
    new $P1121, "Integer"
    assign $P1121, 0
    store_lex "$res", $P1121
  if_1117_end:
.annotate 'line', 907
    find_lex $P1166, "$arg"
    $P1167 = $P1166."modifier"()
    store_lex "$mod", $P1167
.annotate 'line', 908
    find_lex $P1169, "$mod"
    unless $P1169, if_1168_end
.annotate 'line', 909
    find_lex $P1171, "$mod"
    isa $I1172, $P1171, "Hash"
    if $I1172, if_1170
.annotate 'line', 914
    find_lex $P1180, "$mod"
    set $S1181, $P1180
    iseq $I1182, $S1181, "slurpy"
    if $I1182, if_1179
.annotate 'line', 915
    find_lex $P1186, "$mod"
    set $S1187, $P1186
    iseq $I1188, $S1187, "flat"
    if $I1188, if_1185
.annotate 'line', 916
    find_lex $P1192, "$mod"
    set $S1193, $P1192
    iseq $I1194, $S1193, "optional"
    if $I1194, if_1191
.annotate 'line', 917
    find_lex $P1198, "$mod"
    set $S1199, $P1198
    iseq $I1200, $S1199, "opt_flag"
    if $I1200, if_1197
.annotate 'line', 918
    find_lex $P1204, "$mod"
    set $S1205, $P1204
    iseq $I1206, $S1205, "slurpy named"
    if $I1206, if_1203
.annotate 'line', 919
    find_lex $P1210, "self"
    new $P1211, 'String'
    set $P1211, "Unsupported modifier "
    find_lex $P1212, "$mod"
    concat $P1213, $P1211, $P1212
    $P1210."panic"($P1213)
    goto if_1203_end
  if_1203:
.annotate 'line', 918
    find_lex $P1207, "$res"
    add $P1208, $P1207, 32
    add $P1209, $P1208, 512
    store_lex "$res", $P1209
  if_1203_end:
    goto if_1197_end
  if_1197:
.annotate 'line', 917
    find_lex $P1201, "$res"
    add $P1202, $P1201, 256
    store_lex "$res", $P1202
  if_1197_end:
    goto if_1191_end
  if_1191:
.annotate 'line', 916
    find_lex $P1195, "$res"
    add $P1196, $P1195, 128
    store_lex "$res", $P1196
  if_1191_end:
    goto if_1185_end
  if_1185:
.annotate 'line', 915
    find_lex $P1189, "$res"
    add $P1190, $P1189, 32
    store_lex "$res", $P1190
  if_1185_end:
    goto if_1179_end
  if_1179:
.annotate 'line', 914
    find_lex $P1183, "$res"
    add $P1184, $P1183, 32
    store_lex "$res", $P1184
  if_1179_end:
    goto if_1170_end
  if_1170:
.annotate 'line', 912
    new $P1173, "Integer"
    assign $P1173, 1
    add $P1174, $P1173, 16
    add $P1175, $P1174, 512
    find_lex $P1176, "$res"
    add $P1177, $P1176, 512
    $P1178 = "list"($P1175, $P1177)
    store_lex "$res", $P1178
  if_1170_end:
  if_1168_end:
.annotate 'line', 908
    find_lex $P1214, "$res"
.annotate 'line', 888
    .return ($P1214)
  control_1098:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1215, exception, "payload"
    .return ($P1215)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "enumerate_subs" :nsentry :subid("53_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1219
.annotate 'line', 930
    .const 'Sub' $P1226 = "54_1294661331.09424" 
    capture_lex $P1226
    new $P1218, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1218, control_1217
    push_eh $P1218
    .lex "self", self
    .lex "$post", param_1219
.annotate 'line', 931
    find_lex $P1221, "$post"
    $P1222 = $P1221."list"()
    defined $I1223, $P1222
    unless $I1223, for_undef_247
    iter $P1220, $P1222
    new $P1239, 'ExceptionHandler'
    set_addr $P1239, loop1238_handler
    $P1239."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1239
  loop1238_test:
    unless $P1220, loop1238_done
    shift $P1224, $P1220
  loop1238_redo:
    .const 'Sub' $P1226 = "54_1294661331.09424" 
    capture_lex $P1226
    $P1226($P1224)
  loop1238_next:
    goto loop1238_test
  loop1238_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1240, exception, 'type'
    eq $P1240, .CONTROL_LOOP_NEXT, loop1238_next
    eq $P1240, .CONTROL_LOOP_REDO, loop1238_redo
  loop1238_done:
    pop_eh 
  for_undef_247:
.annotate 'line', 930
    .return ($P1220)
  control_1217:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1241, exception, "payload"
    .return ($P1241)
.end


.namespace ["POST";"Compiler"]
.sub "_block1225"  :anon :subid("54_1294661331.09424") :outer("53_1294661331.09424")
    .param pmc param_1227
.annotate 'line', 931
    .lex "$sub", param_1227
.annotate 'line', 933
    find_lex $P1230, "$sub"
    get_hll_global $P1231, ["POST"], "Sub"
    $P1232 = $P1230."isa"($P1231)
    if $P1232, if_1229
    set $P1228, $P1232
    goto if_1229_end
  if_1229:
    find_lex $P1233, "$post"
    find_lex $P1234, "$sub"
    $P1235 = $P1234."full_name"()
    find_lex $P1236, "$sub"
    $P1237 = $P1233."sub"($P1235, $P1236)
    set $P1228, $P1237
  if_1229_end:
.annotate 'line', 931
    .return ($P1228)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_pf_flags" :nsentry :subid("55_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1245
    .param pmc param_1246
.annotate 'line', 938
    new $P1244, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1244, control_1243
    push_eh $P1244
    .lex "self", self
    .lex "$sub", param_1245
    .lex "%context", param_1246
.annotate 'line', 946
    new $P1247, "Undef"
    .lex "$res", $P1247
    new $P1248, "Integer"
    assign $P1248, 0
    store_lex "$res", $P1248
.annotate 'line', 947
    find_lex $P1249, "$res"
    new $P1250, "Integer"
    assign $P1250, 1
    find_lex $P1251, "$sub"
    $N1252 = $P1251."outer"()
    mul $P1253, $P1250, $N1252
    add $P1254, $P1249, $P1253
    store_lex "$res", $P1254
.annotate 'line', 948
    find_lex $P1255, "$res"
    new $P1256, "Integer"
    assign $P1256, 8
    find_lex $P1257, "$sub"
    $N1258 = $P1257."anon"()
    mul $P1259, $P1256, $N1258
    add $P1260, $P1255, $P1259
    store_lex "$res", $P1260
.annotate 'line', 949
    find_lex $P1261, "$res"
    new $P1262, "Integer"
    assign $P1262, 16
    find_lex $P1263, "$sub"
    $N1264 = $P1263."main"()
    mul $P1265, $P1262, $N1264
    add $P1266, $P1261, $P1265
    store_lex "$res", $P1266
.annotate 'line', 950
    find_lex $P1267, "$res"
    new $P1268, "Integer"
    assign $P1268, 32
    find_lex $P1269, "$sub"
    $N1270 = $P1269."load"()
    mul $P1271, $P1268, $N1270
    add $P1272, $P1267, $P1271
    store_lex "$res", $P1272
.annotate 'line', 951
    find_lex $P1273, "$res"
    new $P1274, "Integer"
    assign $P1274, 64
    find_lex $P1275, "$sub"
    $N1276 = $P1275."immediate"()
    mul $P1277, $P1274, $N1276
    add $P1278, $P1273, $P1277
    store_lex "$res", $P1278
.annotate 'line', 952
    find_lex $P1279, "$res"
    new $P1280, "Integer"
    assign $P1280, 128
    find_lex $P1281, "$sub"
    $N1282 = $P1281."postcomp"()
    mul $P1283, $P1280, $N1282
    add $P1284, $P1279, $P1283
    store_lex "$res", $P1284
.annotate 'line', 954
    find_lex $P1286, "%context"
    unless_null $P1286, vivify_248
    $P1286 = root_new ['parrot';'Hash']
  vivify_248:
    set $P1287, $P1286["DEBUG"]
    unless_null $P1287, vivify_249
    new $P1287, "Undef"
  vivify_249:
    unless $P1287, if_1285_end
    find_lex $P1288, "self"
    new $P1289, 'String'
    set $P1289, "pf_flags "
    find_lex $P1290, "$res"
    concat $P1291, $P1289, $P1290
    $P1288."debug"($P1291)
  if_1285_end:
    find_lex $P1292, "$res"
.annotate 'line', 938
    .return ($P1292)
  control_1243:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1293, exception, "payload"
    .return ($P1293)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_sub_comp_flags" :nsentry :subid("56_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1297
    .param pmc param_1298
.annotate 'line', 959
    new $P1296, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1296, control_1295
    push_eh $P1296
    .lex "self", self
    .lex "$sub", param_1297
    .lex "%context", param_1298
.annotate 'line', 964
    new $P1299, "Undef"
    .lex "$res", $P1299
    new $P1300, "Integer"
    assign $P1300, 0
    store_lex "$res", $P1300
.annotate 'line', 965
    find_lex $P1302, "$sub"
    $P1303 = $P1302."vtable"()
    unless $P1303, if_1301_end
    find_lex $P1304, "$res"
    add $P1305, $P1304, 2
    store_lex "$res", $P1305
  if_1301_end:
.annotate 'line', 966
    find_lex $P1307, "$sub"
    $P1308 = $P1307."is_method"()
    unless $P1308, if_1306_end
    find_lex $P1309, "$res"
    add $P1310, $P1309, 4
    store_lex "$res", $P1310
  if_1306_end:
.annotate 'line', 967
    find_lex $P1312, "$sub"
    $P1313 = $P1312."is_init"()
    unless $P1313, if_1311_end
    find_lex $P1314, "$res"
    add $P1315, $P1314, 1024
    store_lex "$res", $P1315
  if_1311_end:
.annotate 'line', 968
    find_lex $P1317, "$sub"
    $P1318 = $P1317."nsentry"()
    unless $P1318, if_1316_end
    find_lex $P1319, "$res"
    add $P1320, $P1319, 2048
    store_lex "$res", $P1320
  if_1316_end:
.annotate 'line', 970
    find_lex $P1322, "%context"
    unless_null $P1322, vivify_250
    $P1322 = root_new ['parrot';'Hash']
  vivify_250:
    set $P1323, $P1322["DEBUG"]
    unless_null $P1323, vivify_251
    new $P1323, "Undef"
  vivify_251:
    unless $P1323, if_1321_end
    find_lex $P1324, "self"
    new $P1325, 'String'
    set $P1325, "comp_flags "
    find_lex $P1326, "$res"
    concat $P1327, $P1325, $P1326
    $P1324."debug"($P1327)
  if_1321_end:
    find_lex $P1328, "$res"
.annotate 'line', 959
    .return ($P1328)
  control_1295:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1329, exception, "payload"
    .return ($P1329)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "fixup_labels" :nsentry :subid("57_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1333
    .param pmc param_1334
    .param pmc param_1335
    .param pmc param_1336
.annotate 'line', 975
    .const 'Sub' $P1346 = "58_1294661331.09424" 
    capture_lex $P1346
    new $P1332, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1332, control_1331
    push_eh $P1332
    .lex "self", self
    .lex "$sub", param_1333
    .lex "$labels_todo", param_1334
    .lex "$bc", param_1335
    .lex "%context", param_1336
.annotate 'line', 976
    find_lex $P1338, "%context"
    unless_null $P1338, vivify_252
    $P1338 = root_new ['parrot';'Hash']
  vivify_252:
    set $P1339, $P1338["DEBUG"]
    unless_null $P1339, vivify_253
    new $P1339, "Undef"
  vivify_253:
    unless $P1339, if_1337_end
    find_lex $P1340, "self"
    $P1340."debug"("Fixup labels")
  if_1337_end:
.annotate 'line', 977
    find_lex $P1342, "$labels_todo"
    defined $I1343, $P1342
    unless $I1343, for_undef_254
    iter $P1341, $P1342
    new $P1405, 'ExceptionHandler'
    set_addr $P1405, loop1404_handler
    $P1405."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1405
  loop1404_test:
    unless $P1341, loop1404_done
    shift $P1344, $P1341
  loop1404_redo:
    .const 'Sub' $P1346 = "58_1294661331.09424" 
    capture_lex $P1346
    $P1346($P1344)
  loop1404_next:
    goto loop1404_test
  loop1404_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1406, exception, 'type'
    eq $P1406, .CONTROL_LOOP_NEXT, loop1404_next
    eq $P1406, .CONTROL_LOOP_REDO, loop1404_redo
  loop1404_done:
    pop_eh 
  for_undef_254:
.annotate 'line', 975
    .return ($P1341)
  control_1331:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1407, exception, "payload"
    .return ($P1407)
.end


.namespace ["POST";"Compiler"]
.sub "_block1345"  :anon :subid("58_1294661331.09424") :outer("57_1294661331.09424")
    .param pmc param_1347
.annotate 'line', 977
    .lex "$kv", param_1347
.annotate 'line', 978
    new $P1348, "Undef"
    .lex "$offset", $P1348
.annotate 'line', 979
    $P1349 = root_new ['parrot';'Hash']
    .lex "%todo", $P1349
.annotate 'line', 982
    new $P1350, "Undef"
    .lex "$op", $P1350
.annotate 'line', 985
    new $P1351, "Undef"
    .lex "$delta", $P1351
.annotate 'line', 978
    find_lex $P1352, "$kv"
    $P1353 = $P1352."key"()
    store_lex "$offset", $P1353
.annotate 'line', 979
    find_lex $P1354, "$kv"
    $P1355 = $P1354."value"()
    store_lex "%todo", $P1355
.annotate 'line', 980
    find_lex $P1357, "%context"
    unless_null $P1357, vivify_255
    $P1357 = root_new ['parrot';'Hash']
  vivify_255:
    set $P1358, $P1357["DEBUG"]
    unless_null $P1358, vivify_256
    new $P1358, "Undef"
  vivify_256:
    unless $P1358, if_1356_end
    find_lex $P1359, "self"
    new $P1360, 'String'
    set $P1360, "Fixing '"
    find_lex $P1361, "%todo"
    unless_null $P1361, vivify_257
    $P1361 = root_new ['parrot';'Hash']
  vivify_257:
    set $P1362, $P1361["name"]
    unless_null $P1362, vivify_258
    new $P1362, "Undef"
  vivify_258:
    set $S1363, $P1362
    concat $P1364, $P1360, $S1363
    concat $P1365, $P1364, "' from op "
    find_lex $P1366, "%todo"
    unless_null $P1366, vivify_259
    $P1366 = root_new ['parrot';'Hash']
  vivify_259:
    set $P1367, $P1366["opname"]
    unless_null $P1367, vivify_260
    new $P1367, "Undef"
  vivify_260:
    set $S1368, $P1367
    concat $P1369, $P1365, $S1368
    concat $P1370, $P1369, " at "
    find_lex $P1371, "$offset"
    set $S1372, $P1371
    concat $P1373, $P1370, $S1372
    $P1359."debug"($P1373)
  if_1356_end:
.annotate 'line', 982
    find_lex $P1374, "%todo"
    unless_null $P1374, vivify_261
    $P1374 = root_new ['parrot';'Hash']
  vivify_261:
    set $P1375, $P1374["opname"]
    unless_null $P1375, vivify_262
    new $P1375, "Undef"
  vivify_262:
    set $S1376, $P1375
    find_lex $P1377, "$bc"
    $P1378 = $P1377."opmap"()
    set $P1379, $P1378[$S1376]
    unless_null $P1379, vivify_263
    new $P1379, "Undef"
  vivify_263:
    store_lex "$op", $P1379
.annotate 'line', 983
    find_lex $P1381, "%context"
    unless_null $P1381, vivify_264
    $P1381 = root_new ['parrot';'Hash']
  vivify_264:
    set $P1382, $P1381["DEBUG"]
    unless_null $P1382, vivify_265
    new $P1382, "Undef"
  vivify_265:
    unless $P1382, if_1380_end
    find_lex $P1383, "self"
    new $P1384, 'String'
    set $P1384, "Op length is "
    find_lex $P1385, "$op"
    $P1386 = $P1385."length"()
    set $S1387, $P1386
    concat $P1388, $P1384, $S1387
    $P1383."debug"($P1388)
  if_1380_end:
.annotate 'line', 985
    find_lex $P1389, "$sub"
    find_lex $P1390, "%todo"
    unless_null $P1390, vivify_266
    $P1390 = root_new ['parrot';'Hash']
  vivify_266:
    set $P1391, $P1390["name"]
    unless_null $P1391, vivify_267
    new $P1391, "Undef"
  vivify_267:
    $P1392 = $P1389."label"($P1391)
    $P1393 = $P1392."position"()
    find_lex $P1394, "%todo"
    unless_null $P1394, vivify_268
    $P1394 = root_new ['parrot';'Hash']
  vivify_268:
    set $P1395, $P1394["offset"]
    unless_null $P1395, vivify_269
    new $P1395, "Undef"
  vivify_269:
    sub $P1396, $P1393, $P1395
    store_lex "$delta", $P1396
.annotate 'line', 987
    find_lex $P1397, "$delta"
    find_lex $P1398, "$offset"
    find_lex $P1399, "$op"
    $N1400 = $P1399."length"()
    add $P1401, $P1398, $N1400
    set $I1402, $P1401
    find_lex $P1403, "$bc"
    unless_null $P1403, vivify_270
    $P1403 = root_new ['parrot';'ResizablePMCArray']
    store_lex "$bc", $P1403
  vivify_270:
    set $P1403[$I1402], $P1397
.annotate 'line', 977
    .return ($P1397)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "get_register" :nsentry :subid("59_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1411
    .param pmc param_1412
.annotate 'line', 992
    new $P1410, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1410, control_1409
    push_eh $P1410
    .lex "self", self
    .lex "$name", param_1411
    .lex "%context", param_1412
.annotate 'line', 993
    new $P1413, "Undef"
    .lex "$reg", $P1413
    find_lex $P1414, "%context"
    unless_null $P1414, vivify_271
    $P1414 = root_new ['parrot';'Hash']
  vivify_271:
    set $P1415, $P1414["sub"]
    unless_null $P1415, vivify_272
    new $P1415, "Undef"
  vivify_272:
    find_lex $P1416, "$name"
    $P1417 = $P1415."symbol"($P1416)
    store_lex "$reg", $P1417
.annotate 'line', 994
    find_lex $P1419, "$reg"
    isfalse $I1420, $P1419
    unless $I1420, if_1418_end
.annotate 'line', 995
    find_lex $P1421, "self"
    new $P1422, 'String'
    set $P1422, "Register '"
    find_lex $P1423, "$name"
    set $S1424, $P1423
    concat $P1425, $P1422, $S1424
    concat $P1426, $P1425, "' not predeclared in '"
    find_lex $P1427, "%context"
    unless_null $P1427, vivify_273
    $P1427 = root_new ['parrot';'Hash']
  vivify_273:
    set $P1428, $P1427["sub"]
    unless_null $P1428, vivify_274
    new $P1428, "Undef"
  vivify_274:
    $P1429 = $P1428."name"()
    set $S1430, $P1429
    concat $P1431, $P1426, $S1430
    concat $P1432, $P1431, "'"
    $P1421."panic"($P1432)
  if_1418_end:
.annotate 'line', 994
    find_lex $P1433, "$reg"
.annotate 'line', 992
    .return ($P1433)
  control_1409:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1434, exception, "payload"
    .return ($P1434)
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "debug"  :subid("60_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1438 :slurpy
.annotate 'line', 1000
    .const 'Sub' $P1444 = "61_1294661331.09424" 
    capture_lex $P1444
    new $P1437, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1437, control_1436
    push_eh $P1437
    .lex "self", self
    .lex "@args", param_1438
.annotate 'line', 1001
    find_lex $P1440, "@args"
    defined $I1441, $P1440
    unless $I1441, for_undef_275
    iter $P1439, $P1440
    new $P1448, 'ExceptionHandler'
    set_addr $P1448, loop1447_handler
    $P1448."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P1448
  loop1447_test:
    unless $P1439, loop1447_done
    shift $P1442, $P1439
  loop1447_redo:
    .const 'Sub' $P1444 = "61_1294661331.09424" 
    capture_lex $P1444
    $P1444($P1442)
  loop1447_next:
    goto loop1447_test
  loop1447_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1449, exception, 'type'
    eq $P1449, .CONTROL_LOOP_NEXT, loop1447_next
    eq $P1449, .CONTROL_LOOP_REDO, loop1447_redo
  loop1447_done:
    pop_eh 
  for_undef_275:
.annotate 'line', 1000
    .return ($P1439)
  control_1436:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1450, exception, "payload"
    .return ($P1450)
.end


.namespace ["POST";"Compiler"]
.sub "_block1443"  :anon :subid("61_1294661331.09424") :outer("60_1294661331.09424")
    .param pmc param_1445
.annotate 'line', 1001
    .lex "$_", param_1445
.annotate 'line', 1002
    find_lex $P1446, "$_"
    say $P1446
.annotate 'line', 1001
    .return ()
.end


.namespace ["POST";"Compiler"]
.include "except_types.pasm"
.sub "create_context" :nsentry :subid("62_1294661331.09424") :method :outer("11_1294661331.09424")
    .param pmc param_1454
    .param pmc param_1455
.annotate 'line', 1006
    new $P1453, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P1453, control_1452
    push_eh $P1453
    .lex "self", self
    .lex "$past", param_1454
    .lex "%adverbs", param_1455
.annotate 'line', 1007
    $P1456 = root_new ['parrot';'Hash']
    .lex "%context", $P1456
.annotate 'line', 1015
    new $P1457, "Undef"
    .lex "$pfdir", $P1457
.annotate 'line', 1006
    find_lex $P1458, "%context"
.annotate 'line', 1009
    find_lex $P1459, "self"
    find_lex $P1460, "%context"
    unless_null $P1460, vivify_276
    $P1460 = root_new ['parrot';'Hash']
    store_lex "%context", $P1460
  vivify_276:
    set $P1460["compiler"], $P1459
.annotate 'line', 1011
    $P1461 = "new"("Packfile")
    find_lex $P1462, "%context"
    unless_null $P1462, vivify_277
    $P1462 = root_new ['parrot';'Hash']
    store_lex "%context", $P1462
  vivify_277:
    set $P1462["packfile"], $P1461
.annotate 'line', 1015
    find_lex $P1463, "%context"
    unless_null $P1463, vivify_278
    $P1463 = root_new ['parrot';'Hash']
  vivify_278:
    set $P1464, $P1463["packfile"]
    unless_null $P1464, vivify_279
    new $P1464, "Undef"
  vivify_279:
    $P1465 = $P1464."get_directory"()
    store_lex "$pfdir", $P1465
.annotate 'line', 1018
    $P1466 = "new"("PackfileConstantTable")
    find_lex $P1467, "%context"
    unless_null $P1467, vivify_280
    $P1467 = root_new ['parrot';'Hash']
    store_lex "%context", $P1467
  vivify_280:
    set $P1467["constants"], $P1466
.annotate 'line', 1021
    $P1468 = "new"("FixedIntegerArray")
    find_lex $P1469, "%context"
    unless_null $P1469, vivify_281
    $P1469 = root_new ['parrot';'Hash']
    store_lex "%context", $P1469
  vivify_281:
    set $P1470, $P1469["constants"]
    unless_null $P1470, vivify_282
    $P1470 = root_new ['parrot';'ResizablePMCArray']
    set $P1469["constants"], $P1470
  vivify_282:
    set $P1470[0], $P1468
.annotate 'line', 1024
    find_lex $P1471, "%context"
    unless_null $P1471, vivify_283
    $P1471 = root_new ['parrot';'Hash']
  vivify_283:
    set $P1472, $P1471["constants"]
    unless_null $P1472, vivify_284
    new $P1472, "Undef"
  vivify_284:
    find_lex $P1473, "$pfdir"
    unless_null $P1473, vivify_285
    $P1473 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1473
  vivify_285:
    set $P1473["CONSTANTS_hello.pir"], $P1472
.annotate 'line', 1027
    $P1474 = "new"("PackfileBytecodeSegment")
    find_lex $P1475, "%context"
    unless_null $P1475, vivify_286
    $P1475 = root_new ['parrot';'Hash']
    store_lex "%context", $P1475
  vivify_286:
    set $P1475["bytecode"], $P1474
.annotate 'line', 1028
    find_lex $P1476, "%context"
    unless_null $P1476, vivify_287
    $P1476 = root_new ['parrot';'Hash']
  vivify_287:
    set $P1477, $P1476["bytecode"]
    unless_null $P1477, vivify_288
    new $P1477, "Undef"
  vivify_288:
    $P1477."main_sub"(-1)
.annotate 'line', 1030
    new $P1478, "Integer"
    assign $P1478, 0
    find_lex $P1479, "%context"
    unless_null $P1479, vivify_289
    $P1479 = root_new ['parrot';'Hash']
    store_lex "%context", $P1479
  vivify_289:
    set $P1479["got_main_sub"], $P1478
.annotate 'line', 1033
    find_lex $P1480, "%context"
    unless_null $P1480, vivify_290
    $P1480 = root_new ['parrot';'Hash']
  vivify_290:
    set $P1481, $P1480["bytecode"]
    unless_null $P1481, vivify_291
    new $P1481, "Undef"
  vivify_291:
    find_lex $P1482, "$pfdir"
    unless_null $P1482, vivify_292
    $P1482 = root_new ['parrot';'Hash']
    store_lex "$pfdir", $P1482
  vivify_292:
    set $P1482["BYTECODE_hello.pir"], $P1481
.annotate 'line', 1042
    get_hll_global $P1483, ["POST"], "VanillaAllocator"
    $P1484 = $P1483."new"()
    find_lex $P1485, "%context"
    unless_null $P1485, vivify_293
    $P1485 = root_new ['parrot';'Hash']
    store_lex "%context", $P1485
  vivify_293:
    set $P1485["regalloc"], $P1484
.annotate 'line', 1044
    find_lex $P1486, "%adverbs"
    unless_null $P1486, vivify_294
    $P1486 = root_new ['parrot';'Hash']
  vivify_294:
    set $P1487, $P1486["debug"]
    unless_null $P1487, vivify_295
    new $P1487, "Undef"
  vivify_295:
    find_lex $P1488, "%context"
    unless_null $P1488, vivify_296
    $P1488 = root_new ['parrot';'Hash']
    store_lex "%context", $P1488
  vivify_296:
    set $P1488["DEBUG"], $P1487
    find_lex $P1489, "%context"
.annotate 'line', 1006
    .return ($P1489)
  control_1452:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1490, exception, "payload"
    .return ($P1490)
.end


.namespace ["POST";"Compiler"]
.sub "_block1491" :load :anon :subid("63_1294661331.09424")
.annotate 'line', 32
    .const 'Sub' $P1493 = "11_1294661331.09424" 
    $P1494 = $P1493()
    .return ($P1494)
.end


.namespace []
.sub "_block1496" :load :anon :subid("64_1294661331.09424")
.annotate 'line', 1
    .const 'Sub' $P1498 = "10_1294661331.09424" 
    $P1499 = $P1498()
    .return ($P1499)
.end

