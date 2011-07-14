
.namespace []
.sub "_block1000"  :anon :subid("10_1310682740.49267")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1310682740.49267" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1310682740.49267" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1019 = "16_1310682740.49267" 
    .return ($P1019)
.end


.namespace []
.sub "" :load :init :subid("post17") :outer("10_1310682740.49267")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1310682740.49267" 
    .local pmc block
    set block, $P1001
    $P1021 = get_root_global ["parrot"], "P6metaclass"
    $P1021."new_class"("POST::Constant", "POST::Value" :named("parent"))
.end


.namespace ["POST";"Constant"]
.sub "_block1002"  :subid("11_1310682740.49267") :outer("10_1310682740.49267")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1011 = "14_1310682740.49267" 
    capture_lex $P1011
    .const 'Sub' $P1008 = "13_1310682740.49267" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1310682740.49267" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 12
    .const 'Sub' $P1011 = "14_1310682740.49267" 
    newclosure $P1014, $P1011
.annotate 'line', 9
    .return ($P1014)
    .const 'Sub' $P1016 = "15_1310682740.49267" 
    .return ($P1016)
.end


.namespace ["POST";"Constant"]
.include "except_types.pasm"
.sub "value"  :subid("12_1310682740.49267") :method :outer("11_1310682740.49267") :multi(_,_)
    .param pmc param_1007
.annotate 'file', ''
.annotate 'line', 9
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    .lex "$param", param_1007
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("value", $P102, 1)
    .return ($P103)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Constant"]
.include "except_types.pasm"
.sub "value"  :subid("13_1310682740.49267") :method :outer("11_1310682740.49267") :multi(_)
.annotate 'file', ''
.annotate 'line', 10
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("value", $P102, 0)
    .return ($P103)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Constant"]
.include "except_types.pasm"
.sub "declared"  :subid("14_1310682740.49267") :method :outer("11_1310682740.49267")
.annotate 'file', ''
.annotate 'line', 12
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .return (1)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Constant"]
.sub "_block1015" :load :anon :subid("15_1310682740.49267")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1017 = "11_1310682740.49267" 
    $P101 = $P1017()
    .return ($P101)
.end


.namespace []
.sub "_block1018" :load :anon :subid("16_1310682740.49267")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1020 = "10_1310682740.49267" 
    $P101 = $P1020()
    .return ($P101)
.end

