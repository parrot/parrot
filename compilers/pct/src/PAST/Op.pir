
.namespace []
.sub "_block1000"  :anon :subid("10_1308206310.46934")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206310.46934" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 79
    .const 'Sub' $P1003 = "11_1308206310.46934" 
    capture_lex $P1003
    $P140 = $P1003()
.annotate 'line', 1
    .return ($P140)
    .const 'Sub' $P1032 = "18_1308206310.46934" 
    .return ($P1032)
.end


.namespace []
.sub "" :load :init :subid("post19") :outer("10_1308206310.46934")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206310.46934" 
    .local pmc block
    set block, $P1001
    $P1034 = get_root_global ["parrot"], "P6metaclass"
    $P1034."new_class"("PAST::Op", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Op"]
.sub "_block1002"  :subid("11_1308206310.46934") :outer("10_1308206310.46934")
.annotate 'line', 79
    .const 'Sub' $P1016 = "15_1308206310.46934" 
    capture_lex $P1016
    .const 'Sub' $P1012 = "14_1308206310.46934" 
    capture_lex $P1012
    .const 'Sub' $P1008 = "13_1308206310.46934" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308206310.46934" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 138
    .const 'Sub' $P1016 = "15_1308206310.46934" 
    newclosure $P1027, $P1016
.annotate 'line', 79
    .return ($P1027)
    .const 'Sub' $P1029 = "17_1308206310.46934" 
    .return ($P1029)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pasttype"  :subid("12_1308206310.46934") :method :outer("11_1308206310.46934")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'line', 79
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    if has_param_1007, optparam_20
    new $P101, "Undef"
    set param_1007, $P101
  optparam_20:
    .lex "$value", param_1007
.annotate 'line', 80
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I105, $P104
    $P106 = $P102."attr"("pasttype", $P103, $I105)
.annotate 'line', 79
    .return ($P106)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pirop"  :subid("13_1308206310.46934") :method :outer("11_1308206310.46934")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'line', 93
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_21
    new $P108, "Undef"
    set param_1011, $P108
  optparam_21:
    .lex "$value", param_1011
.annotate 'line', 94
    find_lex $P109, "self"
    find_lex $P110, "$value"
    find_lex $P111, "$value"
    defined $I112, $P111
    $P113 = $P109."attr"("pirop", $P110, $I112)
.annotate 'line', 93
    .return ($P113)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "inline"  :subid("14_1308206310.46934") :method :outer("11_1308206310.46934")
    .param pmc param_1015 :optional
    .param int has_param_1015 :opt_flag
.annotate 'line', 127
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    if has_param_1015, optparam_22
    new $P115, "Undef"
    set param_1015, $P115
  optparam_22:
    .lex "$value", param_1015
.annotate 'line', 128
    find_lex $P116, "self"
    find_lex $P117, "$value"
    find_lex $P118, "$value"
    defined $I119, $P118
    $P120 = $P116."attr"("inline", $P117, $I119)
.annotate 'line', 127
    .return ($P120)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "opattr"  :subid("15_1308206310.46934") :method :outer("11_1308206310.46934")
    .param pmc param_1019
.annotate 'line', 138
    .const 'Sub' $P1021 = "16_1308206310.46934" 
    capture_lex $P1021
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    .lex "%hash", param_1019
.annotate 'line', 139
    new $P123, "ResizablePMCArray"
    push $P123, "pasttype"
    push $P123, "pirop"
    push $P123, "inline"
    push $P123, "lvalue"
    defined $I124, $P123
    unless $I124, for_undef_23
    iter $P122, $P123
    new $P136, 'ExceptionHandler'
    set_label $P136, loop1026_handler
    $P136."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P136
  loop1026_test:
    unless $P122, loop1026_done
    shift $P125, $P122
  loop1026_redo:
    .const 'Sub' $P1021 = "16_1308206310.46934" 
    capture_lex $P1021
    $P1021($P125)
  loop1026_next:
    goto loop1026_test
  loop1026_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P137, exception, 'type'
    eq $P137, .CONTROL_LOOP_NEXT, loop1026_next
    eq $P137, .CONTROL_LOOP_REDO, loop1026_redo
  loop1026_done:
    pop_eh 
  for_undef_23:
.annotate 'line', 138
    .return ($P122)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P138, exception, "payload"
    .return ($P138)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "_block1020"  :anon :subid("16_1308206310.46934") :outer("15_1308206310.46934")
    .param pmc param_1023
.annotate 'line', 140
    new $P126, "Undef"
    set $P1022, $P126
    .lex "$arg", $P1022
    .lex "$_", param_1023
    find_lex $P127, "$_"
    find_lex $P1024, "%hash"
    unless_null $P1024, vivify_24
    $P1024 = root_new ['parrot';'Hash']
  vivify_24:
    set $P128, $P1024[$P127]
    unless_null $P128, vivify_25
    new $P128, "Undef"
  vivify_25:
    store_lex "$arg", $P128
.annotate 'line', 141
    find_lex $P129, "$arg"
    defined $I130, $P129
    if $I130, unless_1025_end
    die 0, .CONTROL_LOOP_NEXT
  unless_1025_end:
.annotate 'line', 142
    find_lex $P131, "self"
    find_lex $P132, "$arg"
    find_lex $P133, "$_"
    set $S134, $P133
    $P135 = $P131.$S134($P132)
.annotate 'line', 139
    .return ($P135)
.end


.namespace ["PAST";"Op"]
.sub "_block1028" :load :anon :subid("17_1308206310.46934")
.annotate 'line', 79
    .const 'Sub' $P1030 = "11_1308206310.46934" 
    $P139 = $P1030()
    .return ($P139)
.end


.namespace []
.sub "_block1031" :load :anon :subid("18_1308206310.46934")
.annotate 'line', 1
    .const 'Sub' $P1033 = "10_1308206310.46934" 
    $P141 = $P1033()
    .return ($P141)
.end

