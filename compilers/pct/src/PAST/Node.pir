
.namespace []
.sub "_block11"  :anon :subid("10_1307980074.3033")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307980074.3033" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 28
    .const 'Sub' $P14 = "11_1307980074.3033" 
    capture_lex $P14
    $P97 = $P14()
.annotate 'line', 1
    .return ($P97)
    .const 'Sub' $P99 = "20_1307980074.3033" 
    .return ($P99)
.end


.namespace []
.sub "" :load :init :subid("post21") :outer("10_1307980074.3033")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307980074.3033" 
    .local pmc block
    set block, $P12
    $P102 = get_root_global ["parrot"], "P6metaclass"
    $P102."new_class"("PAST::Node", "PCT::Node" :named("parent"))
.end


.namespace ["PAST";"Node"]
.sub "_block13"  :subid("11_1307980074.3033") :outer("10_1307980074.3033")
.annotate 'line', 28
    .const 'Sub' $P81 = "18_1307980074.3033" 
    capture_lex $P81
    .const 'Sub' $P70 = "17_1307980074.3033" 
    capture_lex $P70
    .const 'Sub' $P59 = "16_1307980074.3033" 
    capture_lex $P59
    .const 'Sub' $P48 = "15_1307980074.3033" 
    capture_lex $P48
    .const 'Sub' $P37 = "14_1307980074.3033" 
    capture_lex $P37
    .const 'Sub' $P26 = "13_1307980074.3033" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1307980074.3033" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 79
    .const 'Sub' $P81 = "18_1307980074.3033" 
    newclosure $P92, $P81
.annotate 'line', 28
    .return ($P92)
    .const 'Sub' $P94 = "19_1307980074.3033" 
    .return ($P94)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "returns"  :subid("12_1307980074.3033") :method :outer("11_1307980074.3033")
    .param pmc param_18 :optional
    .param int has_param_18 :opt_flag
.annotate 'line', 28
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    if has_param_18, optparam_22
    new $P19, "Undef"
    set param_18, $P19
  optparam_22:
    .lex "$value", param_18
.annotate 'line', 29
    find_lex $P20, "self"
    find_lex $P21, "$value"
    find_lex $P22, "$value"
    defined $I23, $P22
    $P24 = $P20."attr"("returns", $P21, $I23)
.annotate 'line', 28
    .return ($P24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "arity"  :subid("13_1307980074.3033") :method :outer("11_1307980074.3033")
    .param pmc param_29 :optional
    .param int has_param_29 :opt_flag
.annotate 'line', 36
    new $P28, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P28, control_27
    push_eh $P28
    .lex "self", self
    if has_param_29, optparam_23
    new $P30, "Undef"
    set param_29, $P30
  optparam_23:
    .lex "$value", param_29
.annotate 'line', 37
    find_lex $P31, "self"
    find_lex $P32, "$value"
    find_lex $P33, "$value"
    defined $I34, $P33
    $P35 = $P31."attr"("arity", $P32, $I34)
.annotate 'line', 36
    .return ($P35)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "named"  :subid("14_1307980074.3033") :method :outer("11_1307980074.3033")
    .param pmc param_40 :optional
    .param int has_param_40 :opt_flag
.annotate 'line', 44
    new $P39, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P39, control_38
    push_eh $P39
    .lex "self", self
    if has_param_40, optparam_24
    new $P41, "Undef"
    set param_40, $P41
  optparam_24:
    .lex "$value", param_40
.annotate 'line', 45
    find_lex $P42, "self"
    find_lex $P43, "$value"
    find_lex $P44, "$value"
    defined $I45, $P44
    $P46 = $P42."attr"("named", $P43, $I45)
.annotate 'line', 44
    .return ($P46)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "flat"  :subid("15_1307980074.3033") :method :outer("11_1307980074.3033")
    .param pmc param_51 :optional
    .param int has_param_51 :opt_flag
.annotate 'line', 51
    new $P50, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P50, control_49
    push_eh $P50
    .lex "self", self
    if has_param_51, optparam_25
    new $P52, "Undef"
    set param_51, $P52
  optparam_25:
    .lex "$value", param_51
.annotate 'line', 52
    find_lex $P53, "self"
    find_lex $P54, "$value"
    find_lex $P55, "$value"
    defined $I56, $P55
    $P57 = $P53."attr"("flat", $P54, $I56)
.annotate 'line', 51
    .return ($P57)
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P58, exception, "payload"
    .return ($P58)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "handlers"  :subid("16_1307980074.3033") :method :outer("11_1307980074.3033")
    .param pmc param_62 :optional
    .param int has_param_62 :opt_flag
.annotate 'line', 60
    new $P61, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P61, control_60
    push_eh $P61
    .lex "self", self
    if has_param_62, optparam_26
    new $P63, "Undef"
    set param_62, $P63
  optparam_26:
    .lex "$value", param_62
.annotate 'line', 61
    find_lex $P64, "self"
    find_lex $P65, "$value"
    find_lex $P66, "$value"
    defined $I67, $P66
    $P68 = $P64."attr"("handlers", $P65, $I67)
.annotate 'line', 60
    .return ($P68)
  control_60:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, "payload"
    .return ($P69)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "lvalue"  :subid("17_1307980074.3033") :method :outer("11_1307980074.3033")
    .param pmc param_73 :optional
    .param int has_param_73 :opt_flag
.annotate 'line', 69
    new $P72, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P72, control_71
    push_eh $P72
    .lex "self", self
    if has_param_73, optparam_27
    new $P74, "Undef"
    set param_73, $P74
  optparam_27:
    .lex "$value", param_73
.annotate 'line', 70
    find_lex $P75, "self"
    find_lex $P76, "$value"
    find_lex $P77, "$value"
    defined $I78, $P77
    $P79 = $P75."attr"("lvalue", $P76, $I78)
.annotate 'line', 69
    .return ($P79)
  control_71:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P80, exception, "payload"
    .return ($P80)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "childorder"  :subid("18_1307980074.3033") :method :outer("11_1307980074.3033")
    .param pmc param_84 :optional
    .param int has_param_84 :opt_flag
.annotate 'line', 79
    new $P83, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P83, control_82
    push_eh $P83
    .lex "self", self
    if has_param_84, optparam_28
    new $P85, "Undef"
    set param_84, $P85
  optparam_28:
    .lex "$value", param_84
.annotate 'line', 80
    find_lex $P86, "self"
    find_lex $P87, "$value"
    find_lex $P88, "$value"
    defined $I89, $P88
    $P90 = $P86."attr"("childorder", $P87, $I89)
.annotate 'line', 79
    .return ($P90)
  control_82:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P91, exception, "payload"
    .return ($P91)
.end


.namespace ["PAST";"Node"]
.sub "_block93" :load :anon :subid("19_1307980074.3033")
.annotate 'line', 28
    .const 'Sub' $P95 = "11_1307980074.3033" 
    $P96 = $P95()
    .return ($P96)
.end


.namespace []
.sub "_block98" :load :anon :subid("20_1307980074.3033")
.annotate 'line', 1
    .const 'Sub' $P100 = "10_1307980074.3033" 
    $P101 = $P100()
    .return ($P101)
.end

