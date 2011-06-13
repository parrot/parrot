
.namespace []
.sub "_block11"  :anon :subid("10_1307980061.85134")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307980061.85134" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 6
    .const 'Sub' $P14 = "11_1307980061.85134" 
    capture_lex $P14
    $P75 = $P14()
.annotate 'line', 1
    .return ($P75)
    .const 'Sub' $P77 = "19_1307980061.85134" 
    .return ($P77)
.end


.namespace []
.sub "" :load :init :subid("post20") :outer("10_1307980061.85134")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307980061.85134" 
    .local pmc block
    set block, $P12
    $P80 = get_root_global ["parrot"], "P6metaclass"
    $P80."new_class"("POST::Label", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Label"]
.sub "_block13"  :subid("11_1307980061.85134") :outer("10_1307980061.85134")
.annotate 'line', 6
    .const 'Sub' $P49 = "17_1307980061.85134" 
    capture_lex $P49
    .const 'Sub' $P45 = "16_1307980061.85134" 
    capture_lex $P45
    .const 'Sub' $P38 = "15_1307980061.85134" 
    capture_lex $P38
    .const 'Sub' $P30 = "14_1307980061.85134" 
    capture_lex $P30
    .const 'Sub' $P23 = "13_1307980061.85134" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1307980061.85134" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P49 = "17_1307980061.85134" 
    newclosure $P70, $P49
.annotate 'line', 6
    .return ($P70)
    .const 'Sub' $P72 = "18_1307980061.85134" 
    .return ($P72)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "declared"  :subid("12_1307980061.85134") :method :outer("11_1307980061.85134") :multi(_,_)
    .param pmc param_18
.annotate 'line', 6
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    .lex "$param", param_18
    find_lex $P19, "self"
    find_lex $P20, "$param"
    $P21 = $P19."attr"("declared", $P20, 1)
    .return ($P21)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "declared"  :subid("13_1307980061.85134") :method :outer("11_1307980061.85134") :multi(_)
.annotate 'line', 7
    new $P25, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P25, control_24
    push_eh $P25
    .lex "self", self
    find_lex $P26, "self"
    get_hll_global $P27, "undef"
    $P28 = $P26."attr"("declared", $P27, 0)
    .return ($P28)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "position"  :subid("14_1307980061.85134") :method :outer("11_1307980061.85134") :multi(_,_)
    .param pmc param_33
.annotate 'line', 10
    new $P32, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P32, control_31
    push_eh $P32
    .lex "self", self
    .lex "$param", param_33
    find_lex $P34, "self"
    find_lex $P35, "$param"
    $P36 = $P34."attr"("position", $P35, 1)
    .return ($P36)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "position"  :subid("15_1307980061.85134") :method :outer("11_1307980061.85134") :multi(_)
.annotate 'line', 11
    new $P40, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P40, control_39
    push_eh $P40
    .lex "self", self
    find_lex $P41, "self"
    get_hll_global $P42, "undef"
    $P43 = $P41."attr"("position", $P42, 0)
    .return ($P43)
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "type"  :subid("16_1307980061.85134") :method :outer("11_1307980061.85134") :multi(_)
.annotate 'line', 14
    new $P47, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P47, control_46
    push_eh $P47
    .lex "self", self
    .return ("ic")
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P48, exception, "payload"
    .return ($P48)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "result"  :subid("17_1307980061.85134") :method :outer("11_1307980061.85134")
    .param pmc param_52 :optional
    .param int has_param_52 :opt_flag
.annotate 'line', 16
    new $P51, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P51, control_50
    push_eh $P51
    .lex "self", self
    if has_param_52, optparam_21
    new $P53, "Undef"
    set param_52, $P53
  optparam_21:
    .lex "$value", param_52
.annotate 'line', 17
    find_lex $P55, "$value"
    defined $I56, $P55
    if $I56, unless_54_end
.annotate 'line', 18
    find_lex $P57, "self"
    unless_null $P57, vivify_22
    $P57 = root_new ['parrot';'Hash']
  vivify_22:
    set $P58, $P57["value"]
    unless_null $P58, vivify_23
    new $P58, "Undef"
  vivify_23:
    store_lex "$value", $P58
.annotate 'line', 19
    find_lex $P60, "$value"
    defined $I61, $P60
    if $I61, unless_59_end
.annotate 'line', 20
    find_lex $P62, "self"
    find_lex $P63, "self"
    $P64 = $P63."name"()
    $P65 = $P62."unique"($P64)
    store_lex "$value", $P65
  unless_59_end:
  unless_54_end:
.annotate 'line', 23
    find_lex $P66, "$value"
    find_lex $P67, "self"
    unless_null $P67, vivify_24
    $P67 = root_new ['parrot';'Hash']
    store_lex "self", $P67
  vivify_24:
    set $P67["value"], $P66
    find_lex $P68, "$value"
.annotate 'line', 16
    .return ($P68)
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P69, exception, "payload"
    .return ($P69)
.end


.namespace ["POST";"Label"]
.sub "_block71" :load :anon :subid("18_1307980061.85134")
.annotate 'line', 6
    .const 'Sub' $P73 = "11_1307980061.85134" 
    $P74 = $P73()
    .return ($P74)
.end


.namespace []
.sub "_block76" :load :anon :subid("19_1307980061.85134")
.annotate 'line', 1
    .const 'Sub' $P78 = "10_1307980061.85134" 
    $P79 = $P78()
    .return ($P79)
.end

