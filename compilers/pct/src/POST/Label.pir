
.namespace []
.sub "_block11"  :anon :subid("10_1294463505.89021")
.annotate 'line', 0
    get_hll_global $P14, ["POST";"Label"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 6
    get_hll_global $P14, ["POST";"Label"], "_block13" 
    capture_lex $P14
    $P54 = $P14()
.annotate 'line', 1
    .return ($P54)
    .const 'Sub' $P56 = "18_1294463505.89021" 
    .return ($P56)
.end


.namespace ["POST";"Label"]
.sub "_block13"  :subid("11_1294463505.89021") :outer("10_1294463505.89021")
.annotate 'line', 6
    .const 'Sub' $P45 = "16_1294463505.89021" 
    capture_lex $P45
    .const 'Sub' $P38 = "15_1294463505.89021" 
    capture_lex $P38
    .const 'Sub' $P30 = "14_1294463505.89021" 
    capture_lex $P30
    .const 'Sub' $P23 = "13_1294463505.89021" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1294463505.89021" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 14
    .const 'Sub' $P45 = "16_1294463505.89021" 
    newclosure $P49, $P45
.annotate 'line', 6
    .return ($P49)
    .const 'Sub' $P51 = "17_1294463505.89021" 
    .return ($P51)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "declared" :nsentry :subid("12_1294463505.89021") :method :outer("11_1294463505.89021") :multi(_,_)
    .param pmc param_18
.annotate 'line', 6
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
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
.sub "declared" :nsentry :subid("13_1294463505.89021") :method :outer("11_1294463505.89021") :multi(_)
.annotate 'line', 7
    new $P25, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P25, control_24
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
.sub "position" :nsentry :subid("14_1294463505.89021") :method :outer("11_1294463505.89021") :multi(_,_)
    .param pmc param_33
.annotate 'line', 10
    new $P32, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P32, control_31
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
.sub "position" :nsentry :subid("15_1294463505.89021") :method :outer("11_1294463505.89021") :multi(_)
.annotate 'line', 11
    new $P40, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P40, control_39
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
.sub "type" :nsentry :subid("16_1294463505.89021") :method :outer("11_1294463505.89021") :multi(_)
.annotate 'line', 14
    new $P47, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P47, control_46
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
.sub "_block50" :load :anon :subid("17_1294463505.89021")
.annotate 'line', 6
    .const 'Sub' $P52 = "11_1294463505.89021" 
    $P53 = $P52()
    .return ($P53)
.end


.namespace []
.sub "_block55" :load :anon :subid("18_1294463505.89021")
.annotate 'line', 1
    .const 'Sub' $P57 = "10_1294463505.89021" 
    $P58 = $P57()
    .return ($P58)
.end

