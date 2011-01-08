
.namespace []
.sub "_block11"  :anon :subid("10_1294463504.64876")
.annotate 'line', 0
    get_hll_global $P14, ["POST";"Call"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    get_hll_global $P14, ["POST";"Call"], "_block13" 
    capture_lex $P14
    $P95 = $P14()
.annotate 'line', 1
    .return ($P95)
    .const 'Sub' $P97 = "23_1294463504.64876" 
    .return ($P97)
.end


.namespace []
.sub "" :load :init :subid("post24") :outer("10_1294463504.64876")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1294463504.64876" 
    .local pmc block
    set block, $P12
    $P100 = get_root_global ["parrot"], "P6metaclass"
    $P100."new_class"("POST::Call", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Call"]
.sub "_block13"  :subid("11_1294463504.64876") :outer("10_1294463504.64876")
.annotate 'line', 9
    .const 'Sub' $P83 = "21_1294463504.64876" 
    capture_lex $P83
    .const 'Sub' $P75 = "20_1294463504.64876" 
    capture_lex $P75
    .const 'Sub' $P68 = "19_1294463504.64876" 
    capture_lex $P68
    .const 'Sub' $P60 = "18_1294463504.64876" 
    capture_lex $P60
    .const 'Sub' $P53 = "17_1294463504.64876" 
    capture_lex $P53
    .const 'Sub' $P45 = "16_1294463504.64876" 
    capture_lex $P45
    .const 'Sub' $P38 = "15_1294463504.64876" 
    capture_lex $P38
    .const 'Sub' $P30 = "14_1294463504.64876" 
    capture_lex $P30
    .const 'Sub' $P23 = "13_1294463504.64876" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1294463504.64876" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 25
    .const 'Sub' $P83 = "21_1294463504.64876" 
    newclosure $P90, $P83
.annotate 'line', 9
    .return ($P90)
    .const 'Sub' $P92 = "22_1294463504.64876" 
    .return ($P92)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "name" :nsentry :subid("12_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_,_)
    .param pmc param_18
.annotate 'line', 9
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
    push_eh $P17
    .lex "self", self
    .lex "$param", param_18
    find_lex $P19, "self"
    find_lex $P20, "$param"
    $P21 = $P19."attr"("name", $P20, 1)
    .return ($P21)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P22, exception, "payload"
    .return ($P22)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "name" :nsentry :subid("13_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_)
.annotate 'line', 10
    new $P25, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P25, control_24
    push_eh $P25
    .lex "self", self
    find_lex $P26, "self"
    get_hll_global $P27, "undef"
    $P28 = $P26."attr"("name", $P27, 0)
    .return ($P28)
  control_24:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P29, exception, "payload"
    .return ($P29)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "params" :nsentry :subid("14_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_,_)
    .param pmc param_33
.annotate 'line', 12
    new $P32, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P32, control_31
    push_eh $P32
    .lex "self", self
    .lex "$param", param_33
    find_lex $P34, "self"
    find_lex $P35, "$param"
    $P36 = $P34."attr"("params", $P35, 1)
    .return ($P36)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "params" :nsentry :subid("15_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_)
.annotate 'line', 13
    new $P40, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P40, control_39
    push_eh $P40
    .lex "self", self
    find_lex $P41, "self"
    get_hll_global $P42, "undef"
    $P43 = $P41."attr"("params", $P42, 0)
    .return ($P43)
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "results" :nsentry :subid("16_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_,_)
    .param pmc param_48
.annotate 'line', 15
    new $P47, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P47, control_46
    push_eh $P47
    .lex "self", self
    .lex "$param", param_48
    find_lex $P49, "self"
    find_lex $P50, "$param"
    $P51 = $P49."attr"("results", $P50, 1)
    .return ($P51)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "results" :nsentry :subid("17_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_)
.annotate 'line', 16
    new $P55, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P55, control_54
    push_eh $P55
    .lex "self", self
    find_lex $P56, "self"
    get_hll_global $P57, "undef"
    $P58 = $P56."attr"("results", $P57, 0)
    .return ($P58)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "invocant" :nsentry :subid("18_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_,_)
    .param pmc param_63
.annotate 'line', 18
    new $P62, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P62, control_61
    push_eh $P62
    .lex "self", self
    .lex "$param", param_63
    find_lex $P64, "self"
    find_lex $P65, "$param"
    $P66 = $P64."attr"("invocant", $P65, 1)
    .return ($P66)
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P67, exception, "payload"
    .return ($P67)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "invocant" :nsentry :subid("19_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_)
.annotate 'line', 19
    new $P70, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P70, control_69
    push_eh $P70
    .lex "self", self
    find_lex $P71, "self"
    get_hll_global $P72, "undef"
    $P73 = $P71."attr"("invocant", $P72, 0)
    .return ($P73)
  control_69:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "calltype" :nsentry :subid("20_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_,_)
    .param pmc param_78
.annotate 'line', 24
    new $P77, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P77, control_76
    push_eh $P77
    .lex "self", self
    .lex "$param", param_78
    find_lex $P79, "self"
    find_lex $P80, "$param"
    $P81 = $P79."attr"("calltype", $P80, 1)
    .return ($P81)
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P82, exception, "payload"
    .return ($P82)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "calltype" :nsentry :subid("21_1294463504.64876") :method :outer("11_1294463504.64876") :multi(_)
.annotate 'line', 25
    new $P85, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P85, control_84
    push_eh $P85
    .lex "self", self
    find_lex $P86, "self"
    get_hll_global $P87, "undef"
    $P88 = $P86."attr"("calltype", $P87, 0)
    .return ($P88)
  control_84:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P89, exception, "payload"
    .return ($P89)
.end


.namespace ["POST";"Call"]
.sub "_block91" :load :anon :subid("22_1294463504.64876")
.annotate 'line', 9
    .const 'Sub' $P93 = "11_1294463504.64876" 
    $P94 = $P93()
    .return ($P94)
.end


.namespace []
.sub "_block96" :load :anon :subid("23_1294463504.64876")
.annotate 'line', 1
    .const 'Sub' $P98 = "10_1294463504.64876" 
    $P99 = $P98()
    .return ($P99)
.end

