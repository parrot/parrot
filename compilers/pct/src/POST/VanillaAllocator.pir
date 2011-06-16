
.namespace []
.sub "_block1000"  :anon :subid("10_1308206293.59381")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206293.59381" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1308206293.59381" 
    capture_lex $P1003
    $P130 = $P1003()
.annotate 'line', 1
    .return ($P130)
    .const 'Sub' $P1026 = "15_1308206293.59381" 
    .return ($P1026)
.end


.namespace []
.sub "" :load :init :subid("post16") :outer("10_1308206293.59381")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206293.59381" 
    .local pmc block
    set block, $P1001
    $P1028 = get_root_global ["parrot"], "P6metaclass"
    $P1028."new_class"("POST::VanillaAllocator")
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block1002"  :subid("11_1308206293.59381") :outer("10_1308206293.59381")
.annotate 'line', 9
    .const 'Sub' $P1005 = "12_1308206293.59381" 
    capture_lex $P1005
    get_global $P1004, "%type2idx"
    unless_null $P1004, vivify_18
    $P1004 = root_new ['parrot';'Hash']
    set_global "%type2idx", $P1004
  vivify_18:
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P101, "%type2idx"
.annotate 'line', 23
    .const 'Sub' $P1005 = "12_1308206293.59381" 
    newclosure $P1021, $P1005
.annotate 'line', 9
    .return ($P1021)
    .const 'Sub' $P1023 = "14_1308206293.59381" 
    .return ($P1023)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "" :load :init :subid("post17") :outer("11_1308206293.59381")
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1308206293.59381" 
    .local pmc block
    set block, $P1003
.annotate 'line', 12
    $P129 = "hash"(0 :named("i"), 1 :named("n"), 2 :named("s"), 3 :named("p"))
    set_global "%type2idx", $P129
.end


.namespace ["POST";"VanillaAllocator"]
.include "except_types.pasm"
.sub "process"  :subid("12_1308206293.59381") :method :outer("11_1308206293.59381")
    .param pmc param_1008
.annotate 'line', 23
    .const 'Sub' $P1012 = "13_1308206293.59381" 
    capture_lex $P1012
    new $P1007, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1007, control_1006
    push_eh $P1007
    .lex "self", self
    .lex "$sub", param_1008
.annotate 'line', 24
    $P1010 = root_new ['parrot';'ResizablePMCArray']
    set $P1009, $P1010
    .lex "@n_regs_used", $P1009
    new $P102, "ResizablePMCArray"
    push $P102, 0
    push $P102, 0
    push $P102, 0
    push $P102, 0
    store_lex "@n_regs_used", $P102
.annotate 'line', 25
    find_lex $P104, "$sub"
    $P105 = $P104."symtable"()
    defined $I106, $P105
    unless $I106, for_undef_19
    iter $P103, $P105
    new $P124, 'ExceptionHandler'
    set_label $P124, loop1020_handler
    $P124."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P124
  loop1020_test:
    unless $P103, loop1020_done
    shift $P107, $P103
  loop1020_redo:
    .const 'Sub' $P1012 = "13_1308206293.59381" 
    capture_lex $P1012
    $P1012($P107)
  loop1020_next:
    goto loop1020_test
  loop1020_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P125, exception, 'type'
    eq $P125, .CONTROL_LOOP_NEXT, loop1020_next
    eq $P125, .CONTROL_LOOP_REDO, loop1020_redo
  loop1020_done:
    pop_eh 
  for_undef_19:
    find_lex $P126, "@n_regs_used"
.annotate 'line', 23
    .return ($P126)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P127, exception, "payload"
    .return ($P127)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block1011"  :anon :subid("13_1308206293.59381") :outer("12_1308206293.59381")
    .param pmc param_1014
.annotate 'line', 27
    new $P108, "Undef"
    set $P1013, $P108
    .lex "$idx", $P1013
    .lex "$_", param_1014
    find_lex $P109, "$_"
    $P110 = $P109."value"()
    $P111 = $P110."type"()
    get_global $P1015, "%type2idx"
    unless_null $P1015, vivify_20
    $P1015 = root_new ['parrot';'Hash']
  vivify_20:
    set $P112, $P1015[$P111]
    unless_null $P112, vivify_21
    new $P112, "Undef"
  vivify_21:
    store_lex "$idx", $P112
.annotate 'line', 28
    find_lex $P113, "$idx"
    defined $I114, $P113
    if $I114, unless_1016_end
    die "Unknown type"
  unless_1016_end:
.annotate 'line', 29
    find_lex $P115, "$_"
    $P116 = $P115."value"()
    find_lex $P117, "$idx"
    set $I118, $P117
    find_lex $P1017, "@n_regs_used"
    unless_null $P1017, vivify_22
    $P1017 = root_new ['parrot';'ResizablePMCArray']
  vivify_22:
    set $P119, $P1017[$I118]
    unless_null $P119, vivify_23
    new $P119, "Undef"
  vivify_23:
    set $N120, $P119
    $P116."regno"($N120)
    find_lex $P121, "$idx"
    set $I122, $P121
    find_lex $P1018, "@n_regs_used"
    unless_null $P1018, vivify_24
    $P1018 = root_new ['parrot';'ResizablePMCArray']
  vivify_24:
    set $P123, $P1018[$I122]
    unless_null $P123, vivify_25
    new $P123, "Undef"
  vivify_25:
    clone $P1019, $P123
    inc $P123
.annotate 'line', 25
    .return ($P1019)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block1022" :load :anon :subid("14_1308206293.59381")
.annotate 'line', 9
    .const 'Sub' $P1024 = "11_1308206293.59381" 
    $P128 = $P1024()
    .return ($P128)
.end


.namespace []
.sub "_block1025" :load :anon :subid("15_1308206293.59381")
.annotate 'line', 1
    .const 'Sub' $P1027 = "10_1308206293.59381" 
    $P131 = $P1027()
    .return ($P131)
.end

