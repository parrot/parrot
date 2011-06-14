
.namespace []
.sub "_block11"  :anon :subid("10_1308074683.29739")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308074683.29739" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 5
    .const 'Sub' $P14 = "11_1308074683.29739" 
    capture_lex $P14
    $P42 = $P14()
.annotate 'line', 1
    .return ($P42)
    .const 'Sub' $P44 = "15_1308074683.29739" 
    .return ($P44)
.end


.namespace []
.sub "" :load :init :subid("post16") :outer("10_1308074683.29739")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308074683.29739" 
    .local pmc block
    set block, $P12
    $P47 = get_root_global ["parrot"], "P6metaclass"
    $P47."new_class"("PAST::Control", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Control"]
.sub "_block13"  :subid("11_1308074683.29739") :outer("10_1308074683.29739")
.annotate 'line', 5
    .const 'Sub' $P26 = "13_1308074683.29739" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1308074683.29739" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P26 = "13_1308074683.29739" 
    newclosure $P37, $P26
.annotate 'line', 5
    .return ($P37)
    .const 'Sub' $P39 = "14_1308074683.29739" 
    .return ($P39)
.end


.namespace ["PAST";"Control"]
.include "except_types.pasm"
.sub "handle_types"  :subid("12_1308074683.29739") :method :outer("11_1308074683.29739")
    .param pmc param_18 :optional
    .param int has_param_18 :opt_flag
.annotate 'line', 5
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    if has_param_18, optparam_17
    new $P19, "Undef"
    set param_18, $P19
  optparam_17:
    .lex "$value", param_18
.annotate 'line', 6
    find_lex $P20, "self"
    find_lex $P21, "$value"
    find_lex $P22, "$value"
    defined $I23, $P22
    $P24 = $P20."attr"("handle_types", $P21, $I23)
.annotate 'line', 5
    .return ($P24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["PAST";"Control"]
.include "except_types.pasm"
.sub "handle_types_except"  :subid("13_1308074683.29739") :method :outer("11_1308074683.29739")
    .param pmc param_29 :optional
    .param int has_param_29 :opt_flag
.annotate 'line', 9
    new $P28, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P28, control_27
    push_eh $P28
    .lex "self", self
    if has_param_29, optparam_18
    new $P30, "Undef"
    set param_29, $P30
  optparam_18:
    .lex "$value", param_29
.annotate 'line', 10
    find_lex $P31, "self"
    find_lex $P32, "$value"
    find_lex $P33, "$value"
    defined $I34, $P33
    $P35 = $P31."attr"("handle_types_except", $P32, $I34)
.annotate 'line', 9
    .return ($P35)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["PAST";"Control"]
.sub "_block38" :load :anon :subid("14_1308074683.29739")
.annotate 'line', 5
    .const 'Sub' $P40 = "11_1308074683.29739" 
    $P41 = $P40()
    .return ($P41)
.end


.namespace []
.sub "_block43" :load :anon :subid("15_1308074683.29739")
.annotate 'line', 1
    .const 'Sub' $P45 = "10_1308074683.29739" 
    $P46 = $P45()
    .return ($P46)
.end

