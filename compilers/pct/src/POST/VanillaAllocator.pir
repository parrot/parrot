
.namespace []
.sub "_block1000"  :anon :subid("10_1312695711.89022")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312695711.89022" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1312695711.89022" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1026 = "15_1312695711.89022" 
    .return ($P1026)
.end


.namespace []
.sub "" :load :init :subid("post16") :outer("10_1312695711.89022")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312695711.89022" 
    .local pmc block
    set block, $P1001
    $P1028 = get_root_global ["parrot"], "P6metaclass"
    $P1028."new_class"("POST::VanillaAllocator")
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block1002"  :subid("11_1312695711.89022") :outer("10_1312695711.89022")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1005 = "12_1312695711.89022" 
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
    .const 'Sub' $P1005 = "12_1312695711.89022" 
    newclosure $P1021, $P1005
.annotate 'line', 9
    .return ($P1021)
    .const 'Sub' $P1023 = "14_1312695711.89022" 
    .return ($P1023)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "" :load :init :subid("post17") :outer("11_1312695711.89022")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1312695711.89022" 
    .local pmc block
    set block, $P1003
.annotate 'line', 12
    $P102 = "hash"(0 :named("i"), 1 :named("n"), 2 :named("s"), 3 :named("p"))
    set_global "%type2idx", $P102
.end


.namespace ["POST";"VanillaAllocator"]
.include "except_types.pasm"
.sub "process"  :subid("12_1312695711.89022") :method :outer("11_1312695711.89022")
    .param pmc param_1008
.annotate 'file', ''
.annotate 'line', 23
    .const 'Sub' $P1012 = "13_1312695711.89022" 
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
    new $P101, "ResizablePMCArray"
    push $P101, 0
    push $P101, 0
    push $P101, 0
    push $P101, 0
    store_lex "@n_regs_used", $P101
.annotate 'line', 25
    find_lex $P102, "$sub"
    $P103 = $P102."symtable"()
    defined $I101, $P103
    unless $I101, for_undef_19
    iter $P101, $P103
    new $P106, 'ExceptionHandler'
    set_label $P106, loop1020_handler
    $P106."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P106
  loop1020_test:
    unless $P101, loop1020_done
    shift $P104, $P101
  loop1020_redo:
    .const 'Sub' $P1012 = "13_1312695711.89022" 
    capture_lex $P1012
    $P1012($P104)
  loop1020_next:
    goto loop1020_test
  loop1020_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, 'type'
    eq $P107, .CONTROL_LOOP_NEXT, loop1020_next
    eq $P107, .CONTROL_LOOP_REDO, loop1020_redo
  loop1020_done:
    pop_eh 
  for_undef_19:
.annotate 'line', 23
    find_lex $P101, "@n_regs_used"
    .return ($P101)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block1011"  :anon :subid("13_1312695711.89022") :outer("12_1312695711.89022")
    .param pmc param_1014
.annotate 'file', ''
.annotate 'line', 27
    new $P105, "Undef"
    set $P1013, $P105
    .lex "$idx", $P1013
    .lex "$_", param_1014
    find_lex $P106, "$_"
    $P107 = $P106."value"()
    $P108 = $P107."type"()
    get_global $P1015, "%type2idx"
    unless_null $P1015, vivify_20
    $P1015 = root_new ['parrot';'Hash']
  vivify_20:
    set $P109, $P1015[$P108]
    unless_null $P109, vivify_21
    new $P109, "Undef"
  vivify_21:
    store_lex "$idx", $P109
.annotate 'line', 28
    find_lex $P106, "$idx"
    defined $I102, $P106
    if $I102, unless_1016_end
    die "Unknown type"
  unless_1016_end:
.annotate 'line', 29
    find_lex $P106, "$_"
    $P107 = $P106."value"()
    find_lex $P108, "$idx"
    set $I102, $P108
    find_lex $P1017, "@n_regs_used"
    unless_null $P1017, vivify_22
    $P1017 = root_new ['parrot';'ResizablePMCArray']
  vivify_22:
    set $P109, $P1017[$I102]
    unless_null $P109, vivify_23
    new $P109, "Undef"
  vivify_23:
    set $N101, $P109
    $P107."regno"($N101)
.annotate 'line', 25
    find_lex $P106, "$idx"
    set $I102, $P106
    find_lex $P1018, "@n_regs_used"
    unless_null $P1018, vivify_24
    $P1018 = root_new ['parrot';'ResizablePMCArray']
  vivify_24:
    set $P107, $P1018[$I102]
    unless_null $P107, vivify_25
    new $P107, "Undef"
  vivify_25:
    clone $P1019, $P107
    inc $P107
    .return ($P1019)
.end


.namespace ["POST";"VanillaAllocator"]
.sub "_block1022" :load :anon :subid("14_1312695711.89022")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1024 = "11_1312695711.89022" 
    $P101 = $P1024()
    .return ($P101)
.end


.namespace []
.sub "_block1025" :load :anon :subid("15_1312695711.89022")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1027 = "10_1312695711.89022" 
    $P101 = $P1027()
    .return ($P101)
.end

