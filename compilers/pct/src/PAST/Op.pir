
.namespace []
.sub "_block11"  :anon :subid("10_1307980074.55314")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307980074.55314" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 79
    .const 'Sub' $P14 = "11_1307980074.55314" 
    capture_lex $P14
    $P81 = $P14()
.annotate 'line', 1
    .return ($P81)
    .const 'Sub' $P83 = "18_1307980074.55314" 
    .return ($P83)
.end


.namespace []
.sub "" :load :init :subid("post19") :outer("10_1307980074.55314")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307980074.55314" 
    .local pmc block
    set block, $P12
    $P86 = get_root_global ["parrot"], "P6metaclass"
    $P86."new_class"("PAST::Op", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Op"]
.sub "_block13"  :subid("11_1307980074.55314") :outer("10_1307980074.55314")
.annotate 'line', 79
    .const 'Sub' $P48 = "15_1307980074.55314" 
    capture_lex $P48
    .const 'Sub' $P37 = "14_1307980074.55314" 
    capture_lex $P37
    .const 'Sub' $P26 = "13_1307980074.55314" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1307980074.55314" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 138
    .const 'Sub' $P48 = "15_1307980074.55314" 
    newclosure $P76, $P48
.annotate 'line', 79
    .return ($P76)
    .const 'Sub' $P78 = "17_1307980074.55314" 
    .return ($P78)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pasttype"  :subid("12_1307980074.55314") :method :outer("11_1307980074.55314")
    .param pmc param_18 :optional
    .param int has_param_18 :opt_flag
.annotate 'line', 79
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    if has_param_18, optparam_20
    new $P19, "Undef"
    set param_18, $P19
  optparam_20:
    .lex "$value", param_18
.annotate 'line', 80
    find_lex $P20, "self"
    find_lex $P21, "$value"
    find_lex $P22, "$value"
    defined $I23, $P22
    $P24 = $P20."attr"("pasttype", $P21, $I23)
.annotate 'line', 79
    .return ($P24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pirop"  :subid("13_1307980074.55314") :method :outer("11_1307980074.55314")
    .param pmc param_29 :optional
    .param int has_param_29 :opt_flag
.annotate 'line', 93
    new $P28, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P28, control_27
    push_eh $P28
    .lex "self", self
    if has_param_29, optparam_21
    new $P30, "Undef"
    set param_29, $P30
  optparam_21:
    .lex "$value", param_29
.annotate 'line', 94
    find_lex $P31, "self"
    find_lex $P32, "$value"
    find_lex $P33, "$value"
    defined $I34, $P33
    $P35 = $P31."attr"("pirop", $P32, $I34)
.annotate 'line', 93
    .return ($P35)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "inline"  :subid("14_1307980074.55314") :method :outer("11_1307980074.55314")
    .param pmc param_40 :optional
    .param int has_param_40 :opt_flag
.annotate 'line', 127
    new $P39, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P39, control_38
    push_eh $P39
    .lex "self", self
    if has_param_40, optparam_22
    new $P41, "Undef"
    set param_40, $P41
  optparam_22:
    .lex "$value", param_40
.annotate 'line', 128
    find_lex $P42, "self"
    find_lex $P43, "$value"
    find_lex $P44, "$value"
    defined $I45, $P44
    $P46 = $P42."attr"("inline", $P43, $I45)
.annotate 'line', 127
    .return ($P46)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "opattr"  :subid("15_1307980074.55314") :method :outer("11_1307980074.55314")
    .param pmc param_51
.annotate 'line', 138
    .const 'Sub' $P57 = "16_1307980074.55314" 
    capture_lex $P57
    new $P50, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P50, control_49
    push_eh $P50
    .lex "self", self
    .lex "%hash", param_51
.annotate 'line', 139
    new $P53, "ResizablePMCArray"
    push $P53, "pasttype"
    push $P53, "pirop"
    push $P53, "inline"
    push $P53, "lvalue"
    defined $I54, $P53
    unless $I54, for_undef_23
    iter $P52, $P53
    new $P73, 'ExceptionHandler'
    set_label $P73, loop72_handler
    $P73."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P73
  loop72_test:
    unless $P52, loop72_done
    shift $P55, $P52
  loop72_redo:
    .const 'Sub' $P57 = "16_1307980074.55314" 
    capture_lex $P57
    $P57($P55)
  loop72_next:
    goto loop72_test
  loop72_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, 'type'
    eq $P74, .CONTROL_LOOP_NEXT, loop72_next
    eq $P74, .CONTROL_LOOP_REDO, loop72_redo
  loop72_done:
    pop_eh 
  for_undef_23:
.annotate 'line', 138
    .return ($P52)
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P75, exception, "payload"
    .return ($P75)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "_block56"  :anon :subid("16_1307980074.55314") :outer("15_1307980074.55314")
    .param pmc param_59
.annotate 'line', 140
    new $P58, "Undef"
    .lex "$arg", $P58
    .lex "$_", param_59
    find_lex $P60, "$_"
    find_lex $P61, "%hash"
    unless_null $P61, vivify_24
    $P61 = root_new ['parrot';'Hash']
  vivify_24:
    set $P62, $P61[$P60]
    unless_null $P62, vivify_25
    new $P62, "Undef"
  vivify_25:
    store_lex "$arg", $P62
.annotate 'line', 141
    find_lex $P64, "$arg"
    defined $I65, $P64
    if $I65, unless_63_end
    set $I66, .CONTROL_LOOP_NEXT
    die 0, $I66
  unless_63_end:
.annotate 'line', 142
    find_lex $P67, "self"
    find_lex $P68, "$arg"
    find_lex $P69, "$_"
    set $S70, $P69
    $P71 = $P67.$S70($P68)
.annotate 'line', 139
    .return ($P71)
.end


.namespace ["PAST";"Op"]
.sub "_block77" :load :anon :subid("17_1307980074.55314")
.annotate 'line', 79
    .const 'Sub' $P79 = "11_1307980074.55314" 
    $P80 = $P79()
    .return ($P80)
.end


.namespace []
.sub "_block82" :load :anon :subid("18_1307980074.55314")
.annotate 'line', 1
    .const 'Sub' $P84 = "10_1307980074.55314" 
    $P85 = $P84()
    .return ($P85)
.end

