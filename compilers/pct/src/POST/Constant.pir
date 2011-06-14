
.namespace []
.sub "_block11"  :anon :subid("10_1308074669.02976")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308074669.02976" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P14 = "11_1308074669.02976" 
    capture_lex $P14
    $P39 = $P14()
.annotate 'line', 1
    .return ($P39)
    .const 'Sub' $P41 = "16_1308074669.02976" 
    .return ($P41)
.end


.namespace []
.sub "" :load :init :subid("post17") :outer("10_1308074669.02976")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308074669.02976" 
    .local pmc block
    set block, $P12
    $P44 = get_root_global ["parrot"], "P6metaclass"
    $P44."new_class"("POST::Constant", "POST::Value" :named("parent"))
.end


.namespace ["POST";"Constant"]
.sub "_block13"  :subid("11_1308074669.02976") :outer("10_1308074669.02976")
.annotate 'line', 9
    .const 'Sub' $P30 = "14_1308074669.02976" 
    capture_lex $P30
    .const 'Sub' $P23 = "13_1308074669.02976" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1308074669.02976" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 12
    .const 'Sub' $P30 = "14_1308074669.02976" 
    newclosure $P34, $P30
.annotate 'line', 9
    .return ($P34)
    .const 'Sub' $P36 = "15_1308074669.02976" 
    .return ($P36)
.end


.namespace ["POST";"Constant"]
.include "except_types.pasm"
.sub "value"  :subid("12_1308074669.02976") :method :outer("11_1308074669.02976") :multi(_,_)
    .param pmc param_18
.annotate 'line', 9
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    .lex "$param", param_18
    find_lex $P19, "self"
    find_lex $P20, "$param"
    $P21 = $P19."attr"("value", $P20, 1)
    .return ($P21)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["POST";"Constant"]
.include "except_types.pasm"
.sub "value"  :subid("13_1308074669.02976") :method :outer("11_1308074669.02976") :multi(_)
.annotate 'line', 10
    new $P25, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P25, control_24
    push_eh $P25
    .lex "self", self
    find_lex $P26, "self"
    get_hll_global $P27, "undef"
    $P28 = $P26."attr"("value", $P27, 0)
    .return ($P28)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["POST";"Constant"]
.include "except_types.pasm"
.sub "declared"  :subid("14_1308074669.02976") :method :outer("11_1308074669.02976")
.annotate 'line', 12
    new $P32, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P32, control_31
    push_eh $P32
    .lex "self", self
    .return (1)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P33, exception, "payload"
    .return ($P33)
.end


.namespace ["POST";"Constant"]
.sub "_block35" :load :anon :subid("15_1308074669.02976")
.annotate 'line', 9
    .const 'Sub' $P37 = "11_1308074669.02976" 
    $P38 = $P37()
    .return ($P38)
.end


.namespace []
.sub "_block40" :load :anon :subid("16_1308074669.02976")
.annotate 'line', 1
    .const 'Sub' $P42 = "10_1308074669.02976" 
    $P43 = $P42()
    .return ($P43)
.end

