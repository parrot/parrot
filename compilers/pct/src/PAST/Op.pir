
.namespace []
.sub "_block1000"  :anon :subid("10_1310682756.75991")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1310682756.75991" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 79
    .const 'Sub' $P1003 = "11_1310682756.75991" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1032 = "18_1310682756.75991" 
    .return ($P1032)
.end


.namespace []
.sub "" :load :init :subid("post19") :outer("10_1310682756.75991")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1310682756.75991" 
    .local pmc block
    set block, $P1001
    $P1034 = get_root_global ["parrot"], "P6metaclass"
    $P1034."new_class"("PAST::Op", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Op"]
.sub "_block1002"  :subid("11_1310682756.75991") :outer("10_1310682756.75991")
.annotate 'file', ''
.annotate 'line', 79
    .const 'Sub' $P1016 = "15_1310682756.75991" 
    capture_lex $P1016
    .const 'Sub' $P1012 = "14_1310682756.75991" 
    capture_lex $P1012
    .const 'Sub' $P1008 = "13_1310682756.75991" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1310682756.75991" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 138
    .const 'Sub' $P1016 = "15_1310682756.75991" 
    newclosure $P1027, $P1016
.annotate 'line', 79
    .return ($P1027)
    .const 'Sub' $P1029 = "17_1310682756.75991" 
    .return ($P1029)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pasttype"  :subid("12_1310682756.75991") :method :outer("11_1310682756.75991")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'file', ''
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
    defined $I101, $P104
    $P105 = $P102."attr"("pasttype", $P103, $I101)
.annotate 'line', 79
    .return ($P105)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pirop"  :subid("13_1310682756.75991") :method :outer("11_1310682756.75991")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'file', ''
.annotate 'line', 93
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_21
    new $P101, "Undef"
    set param_1011, $P101
  optparam_21:
    .lex "$value", param_1011
.annotate 'line', 94
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("pirop", $P103, $I101)
.annotate 'line', 93
    .return ($P105)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "inline"  :subid("14_1310682756.75991") :method :outer("11_1310682756.75991")
    .param pmc param_1015 :optional
    .param int has_param_1015 :opt_flag
.annotate 'file', ''
.annotate 'line', 127
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    if has_param_1015, optparam_22
    new $P101, "Undef"
    set param_1015, $P101
  optparam_22:
    .lex "$value", param_1015
.annotate 'line', 128
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("inline", $P103, $I101)
.annotate 'line', 127
    .return ($P105)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "opattr"  :subid("15_1310682756.75991") :method :outer("11_1310682756.75991")
    .param pmc param_1019
.annotate 'file', ''
.annotate 'line', 138
    .const 'Sub' $P1021 = "16_1310682756.75991" 
    capture_lex $P1021
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    .lex "%hash", param_1019
.annotate 'line', 139
    new $P102, "ResizablePMCArray"
    push $P102, "pasttype"
    push $P102, "pirop"
    push $P102, "inline"
    push $P102, "lvalue"
    defined $I101, $P102
    unless $I101, for_undef_23
    iter $P101, $P102
    new $P105, 'ExceptionHandler'
    set_label $P105, loop1026_handler
    $P105."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P105
  loop1026_test:
    unless $P101, loop1026_done
    shift $P103, $P101
  loop1026_redo:
    .const 'Sub' $P1021 = "16_1310682756.75991" 
    capture_lex $P1021
    $P1021($P103)
  loop1026_next:
    goto loop1026_test
  loop1026_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, 'type'
    eq $P106, .CONTROL_LOOP_NEXT, loop1026_next
    eq $P106, .CONTROL_LOOP_REDO, loop1026_redo
  loop1026_done:
    pop_eh 
  for_undef_23:
.annotate 'line', 138
    .return ($P101)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "_block1020"  :anon :subid("16_1310682756.75991") :outer("15_1310682756.75991")
    .param pmc param_1023
.annotate 'file', ''
.annotate 'line', 140
    new $P104, "Undef"
    set $P1022, $P104
    .lex "$arg", $P1022
    .lex "$_", param_1023
    find_lex $P105, "$_"
    find_lex $P1024, "%hash"
    unless_null $P1024, vivify_24
    $P1024 = root_new ['parrot';'Hash']
  vivify_24:
    set $P106, $P1024[$P105]
    unless_null $P106, vivify_25
    new $P106, "Undef"
  vivify_25:
    store_lex "$arg", $P106
.annotate 'line', 141
    find_lex $P105, "$arg"
    defined $I102, $P105
    if $I102, unless_1025_end
    die 0, .CONTROL_LOOP_NEXT
  unless_1025_end:
.annotate 'line', 142
    find_lex $P105, "self"
    find_lex $P106, "$arg"
    find_lex $P107, "$_"
    set $S101, $P107
    $P108 = $P105.$S101($P106)
.annotate 'line', 139
    .return ($P108)
.end


.namespace ["PAST";"Op"]
.sub "_block1028" :load :anon :subid("17_1310682756.75991")
.annotate 'file', ''
.annotate 'line', 79
    .const 'Sub' $P1030 = "11_1310682756.75991" 
    $P101 = $P1030()
    .return ($P101)
.end


.namespace []
.sub "_block1031" :load :anon :subid("18_1310682756.75991")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1033 = "10_1310682756.75991" 
    $P101 = $P1033()
    .return ($P101)
.end

