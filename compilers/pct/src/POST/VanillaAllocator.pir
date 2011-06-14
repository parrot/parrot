
.namespace []
.sub "_block11"  :anon :subid("10_1308013477.20894")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308013477.20894" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P14 = "11_1308013477.20894" 
    capture_lex $P14
    $P63 = $P14()
.annotate 'line', 1
    .return ($P63)
    .const 'Sub' $P65 = "15_1308013477.20894" 
    .return ($P65)
.end


.namespace []
.sub "" :load :init :subid("post16") :outer("10_1308013477.20894")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308013477.20894" 
    .local pmc block
    set block, $P12
    $P68 = get_root_global ["parrot"], "P6metaclass"
    $P68."new_class"("POST::VanillaAllocator")
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block13"  :subid("11_1308013477.20894") :outer("10_1308013477.20894")
.annotate 'line', 9
    .const 'Sub' $P17 = "12_1308013477.20894" 
    capture_lex $P17
    get_global $P15, "%type2idx"
    unless_null $P15, vivify_18
    $P15 = root_new ['parrot';'Hash']
    set_global "%type2idx", $P15
  vivify_18:
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P16, "%type2idx"
.annotate 'line', 23
    .const 'Sub' $P17 = "12_1308013477.20894" 
    newclosure $P57, $P17
.annotate 'line', 9
    .return ($P57)
    .const 'Sub' $P59 = "14_1308013477.20894" 
    .return ($P59)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "" :load :init :subid("post17") :outer("11_1308013477.20894")
.annotate 'line', 9
    .const 'Sub' $P14 = "11_1308013477.20894" 
    .local pmc block
    set block, $P14
.annotate 'line', 12
    $P62 = "hash"(0 :named("i"), 1 :named("n"), 2 :named("s"), 3 :named("p"))
    set_global "%type2idx", $P62
.end


.namespace ["POST";"VanillaAllocator"]
.include "except_types.pasm"
.sub "process"  :subid("12_1308013477.20894") :method :outer("11_1308013477.20894")
    .param pmc param_20
.annotate 'line', 23
    .const 'Sub' $P29 = "13_1308013477.20894" 
    capture_lex $P29
    new $P19, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P19, control_18
    push_eh $P19
    .lex "self", self
    .lex "$sub", param_20
.annotate 'line', 24
    $P21 = root_new ['parrot';'ResizablePMCArray']
    .lex "@n_regs_used", $P21
    new $P22, "ResizablePMCArray"
    push $P22, 0
    push $P22, 0
    push $P22, 0
    push $P22, 0
    store_lex "@n_regs_used", $P22
.annotate 'line', 25
    find_lex $P24, "$sub"
    $P25 = $P24."symtable"()
    defined $I26, $P25
    unless $I26, for_undef_19
    iter $P23, $P25
    new $P53, 'ExceptionHandler'
    set_label $P53, loop52_handler
    $P53."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P53
  loop52_test:
    unless $P23, loop52_done
    shift $P27, $P23
  loop52_redo:
    .const 'Sub' $P29 = "13_1308013477.20894" 
    capture_lex $P29
    $P29($P27)
  loop52_next:
    goto loop52_test
  loop52_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P54, exception, 'type'
    eq $P54, .CONTROL_LOOP_NEXT, loop52_next
    eq $P54, .CONTROL_LOOP_REDO, loop52_redo
  loop52_done:
    pop_eh 
  for_undef_19:
    find_lex $P55, "@n_regs_used"
.annotate 'line', 23
    .return ($P55)
  control_18:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block28"  :anon :subid("13_1308013477.20894") :outer("12_1308013477.20894")
    .param pmc param_31
.annotate 'line', 27
    new $P30, "Undef"
    .lex "$idx", $P30
    .lex "$_", param_31
    find_lex $P32, "$_"
    $P33 = $P32."value"()
    $P34 = $P33."type"()
    get_global $P35, "%type2idx"
    unless_null $P35, vivify_20
    $P35 = root_new ['parrot';'Hash']
  vivify_20:
    set $P36, $P35[$P34]
    unless_null $P36, vivify_21
    new $P36, "Undef"
  vivify_21:
    store_lex "$idx", $P36
.annotate 'line', 28
    find_lex $P38, "$idx"
    defined $I39, $P38
    if $I39, unless_37_end
    die "Unknown type"
  unless_37_end:
.annotate 'line', 29
    find_lex $P40, "$_"
    $P41 = $P40."value"()
    find_lex $P42, "$idx"
    set $I43, $P42
    find_lex $P44, "@n_regs_used"
    unless_null $P44, vivify_22
    $P44 = root_new ['parrot';'ResizablePMCArray']
  vivify_22:
    set $P45, $P44[$I43]
    unless_null $P45, vivify_23
    new $P45, "Undef"
  vivify_23:
    set $N46, $P45
    $P41."regno"($N46)
    find_lex $P47, "$idx"
    set $I48, $P47
    find_lex $P49, "@n_regs_used"
    unless_null $P49, vivify_24
    $P49 = root_new ['parrot';'ResizablePMCArray']
  vivify_24:
    set $P50, $P49[$I48]
    unless_null $P50, vivify_25
    new $P50, "Undef"
  vivify_25:
    clone $P51, $P50
    inc $P50
.annotate 'line', 25
    .return ($P51)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block58" :load :anon :subid("14_1308013477.20894")
.annotate 'line', 9
    .const 'Sub' $P60 = "11_1308013477.20894" 
    $P61 = $P60()
    .return ($P61)
.end


.namespace []
.sub "_block64" :load :anon :subid("15_1308013477.20894")
.annotate 'line', 1
    .const 'Sub' $P66 = "10_1308013477.20894" 
    $P67 = $P66()
    .return ($P67)
.end

