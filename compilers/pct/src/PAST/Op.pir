
.namespace []
.sub "_block11"  :anon :subid("10_1308013491.84981")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308013491.84981" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 79
    .const 'Sub' $P14 = "11_1308013491.84981" 
    capture_lex $P14
    $P80 = $P14()
.annotate 'line', 1
    .return ($P80)
    .const 'Sub' $P82 = "18_1308013491.84981" 
    .return ($P82)
.end


.namespace []
.sub "" :load :init :subid("post19") :outer("10_1308013491.84981")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308013491.84981" 
    .local pmc block
    set block, $P12
    $P85 = get_root_global ["parrot"], "P6metaclass"
    $P85."new_class"("PAST::Op", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Op"]
.sub "_block13"  :subid("11_1308013491.84981") :outer("10_1308013491.84981")
.annotate 'line', 79
    .const 'Sub' $P48 = "15_1308013491.84981" 
    capture_lex $P48
    .const 'Sub' $P37 = "14_1308013491.84981" 
    capture_lex $P37
    .const 'Sub' $P26 = "13_1308013491.84981" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1308013491.84981" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 138
    .const 'Sub' $P48 = "15_1308013491.84981" 
    newclosure $P75, $P48
.annotate 'line', 79
    .return ($P75)
    .const 'Sub' $P77 = "17_1308013491.84981" 
    .return ($P77)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pasttype"  :subid("12_1308013491.84981") :method :outer("11_1308013491.84981")
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
.sub "pirop"  :subid("13_1308013491.84981") :method :outer("11_1308013491.84981")
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
.sub "inline"  :subid("14_1308013491.84981") :method :outer("11_1308013491.84981")
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
.sub "opattr"  :subid("15_1308013491.84981") :method :outer("11_1308013491.84981")
    .param pmc param_51
.annotate 'line', 138
    .const 'Sub' $P57 = "16_1308013491.84981" 
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
    new $P72, 'ExceptionHandler'
    set_label $P72, loop71_handler
    $P72."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P72
  loop71_test:
    unless $P52, loop71_done
    shift $P55, $P52
  loop71_redo:
    .const 'Sub' $P57 = "16_1308013491.84981" 
    capture_lex $P57
    $P57($P55)
  loop71_next:
    goto loop71_test
  loop71_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, 'type'
    eq $P73, .CONTROL_LOOP_NEXT, loop71_next
    eq $P73, .CONTROL_LOOP_REDO, loop71_redo
  loop71_done:
    pop_eh 
  for_undef_23:
.annotate 'line', 138
    .return ($P52)
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "_block56"  :anon :subid("16_1308013491.84981") :outer("15_1308013491.84981")
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
    die 0, .CONTROL_LOOP_NEXT
  unless_63_end:
.annotate 'line', 142
    find_lex $P66, "self"
    find_lex $P67, "$arg"
    find_lex $P68, "$_"
    set $S69, $P68
    $P70 = $P66.$S69($P67)
.annotate 'line', 139
    .return ($P70)
.end


.namespace ["PAST";"Op"]
.sub "_block76" :load :anon :subid("17_1308013491.84981")
.annotate 'line', 79
    .const 'Sub' $P78 = "11_1308013491.84981" 
    $P79 = $P78()
    .return ($P79)
.end


.namespace []
.sub "_block81" :load :anon :subid("18_1308013491.84981")
.annotate 'line', 1
    .const 'Sub' $P83 = "10_1308013491.84981" 
    $P84 = $P83()
    .return ($P84)
.end

