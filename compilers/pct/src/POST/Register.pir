
.namespace []
.sub "_block1000"  :anon :subid("10_1310682741.80548")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1310682741.80548" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 15
    .const 'Sub' $P1003 = "11_1310682741.80548" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1023 = "17_1310682741.80548" 
    .return ($P1023)
.end


.namespace []
.sub "" :load :init :subid("post18") :outer("10_1310682741.80548")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1310682741.80548" 
    .local pmc block
    set block, $P1001
    $P1025 = get_root_global ["parrot"], "P6metaclass"
    $P1025."new_class"("POST::Register", "POST::Value" :named("parent"))
.end


.namespace ["POST";"Register"]
.sub "_block1002"  :subid("11_1310682741.80548") :outer("10_1310682741.80548")
.annotate 'file', ''
.annotate 'line', 15
    .const 'Sub' $P1015 = "15_1310682741.80548" 
    capture_lex $P1015
    .const 'Sub' $P1011 = "14_1310682741.80548" 
    capture_lex $P1011
    .const 'Sub' $P1008 = "13_1310682741.80548" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1310682741.80548" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 19
    .const 'Sub' $P1015 = "15_1310682741.80548" 
    newclosure $P1018, $P1015
.annotate 'line', 15
    .return ($P1018)
    .const 'Sub' $P1020 = "16_1310682741.80548" 
    .return ($P1020)
.end


.namespace ["POST";"Register"]
.include "except_types.pasm"
.sub "declared"  :subid("12_1310682741.80548") :method :outer("11_1310682741.80548") :multi(_,_)
    .param pmc param_1007
.annotate 'file', ''
.annotate 'line', 15
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    .lex "$param", param_1007
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("declared", $P102, 1)
    .return ($P103)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Register"]
.include "except_types.pasm"
.sub "declared"  :subid("13_1310682741.80548") :method :outer("11_1310682741.80548") :multi(_)
.annotate 'file', ''
.annotate 'line', 16
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("declared", $P102, 0)
    .return ($P103)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Register"]
.include "except_types.pasm"
.sub "regno"  :subid("14_1310682741.80548") :method :outer("11_1310682741.80548") :multi(_,_)
    .param pmc param_1014
.annotate 'file', ''
.annotate 'line', 18
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$param", param_1014
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("regno", $P102, 1)
    .return ($P103)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Register"]
.include "except_types.pasm"
.sub "regno"  :subid("15_1310682741.80548") :method :outer("11_1310682741.80548") :multi(_)
.annotate 'file', ''
.annotate 'line', 19
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("regno", $P102, 0)
    .return ($P103)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Register"]
.sub "_block1019" :load :anon :subid("16_1310682741.80548")
.annotate 'file', ''
.annotate 'line', 15
    .const 'Sub' $P1021 = "11_1310682741.80548" 
    $P101 = $P1021()
    .return ($P101)
.end


.namespace []
.sub "_block1022" :load :anon :subid("17_1310682741.80548")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1024 = "10_1310682741.80548" 
    $P101 = $P1024()
    .return ($P101)
.end

