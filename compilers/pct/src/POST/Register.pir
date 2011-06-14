
.namespace []
.sub "_block11"  :anon :subid("10_1308013478.97794")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308013478.97794" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 15
    .const 'Sub' $P14 = "11_1308013478.97794" 
    capture_lex $P14
    $P50 = $P14()
.annotate 'line', 1
    .return ($P50)
    .const 'Sub' $P52 = "17_1308013478.97794" 
    .return ($P52)
.end


.namespace []
.sub "" :load :init :subid("post18") :outer("10_1308013478.97794")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308013478.97794" 
    .local pmc block
    set block, $P12
    $P55 = get_root_global ["parrot"], "P6metaclass"
    $P55."new_class"("POST::Register", "POST::Value" :named("parent"))
.end


.namespace ["POST";"Register"]
.sub "_block13"  :subid("11_1308013478.97794") :outer("10_1308013478.97794")
.annotate 'line', 15
    .const 'Sub' $P38 = "15_1308013478.97794" 
    capture_lex $P38
    .const 'Sub' $P30 = "14_1308013478.97794" 
    capture_lex $P30
    .const 'Sub' $P23 = "13_1308013478.97794" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1308013478.97794" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 19
    .const 'Sub' $P38 = "15_1308013478.97794" 
    newclosure $P45, $P38
.annotate 'line', 15
    .return ($P45)
    .const 'Sub' $P47 = "16_1308013478.97794" 
    .return ($P47)
.end


.namespace ["POST";"Register"]
.include "except_types.pasm"
.sub "declared"  :subid("12_1308013478.97794") :method :outer("11_1308013478.97794") :multi(_,_)
    .param pmc param_18
.annotate 'line', 15
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


.namespace ["POST";"Register"]
.include "except_types.pasm"
.sub "declared"  :subid("13_1308013478.97794") :method :outer("11_1308013478.97794") :multi(_)
.annotate 'line', 16
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


.namespace ["POST";"Register"]
.include "except_types.pasm"
.sub "regno"  :subid("14_1308013478.97794") :method :outer("11_1308013478.97794") :multi(_,_)
    .param pmc param_33
.annotate 'line', 18
    new $P32, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P32, control_31
    push_eh $P32
    .lex "self", self
    .lex "$param", param_33
    find_lex $P34, "self"
    find_lex $P35, "$param"
    $P36 = $P34."attr"("regno", $P35, 1)
    .return ($P36)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["POST";"Register"]
.include "except_types.pasm"
.sub "regno"  :subid("15_1308013478.97794") :method :outer("11_1308013478.97794") :multi(_)
.annotate 'line', 19
    new $P40, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P40, control_39
    push_eh $P40
    .lex "self", self
    find_lex $P41, "self"
    get_hll_global $P42, "undef"
    $P43 = $P41."attr"("regno", $P42, 0)
    .return ($P43)
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["POST";"Register"]
.sub "_block46" :load :anon :subid("16_1308013478.97794")
.annotate 'line', 15
    .const 'Sub' $P48 = "11_1308013478.97794" 
    $P49 = $P48()
    .return ($P49)
.end


.namespace []
.sub "_block51" :load :anon :subid("17_1308013478.97794")
.annotate 'line', 1
    .const 'Sub' $P53 = "10_1308013478.97794" 
    $P54 = $P53()
    .return ($P54)
.end

