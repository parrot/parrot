
.namespace []
.sub "_block1000"  :anon :subid("10_1312323172.00108")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312323172.00108" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 5
    .const 'Sub' $P1003 = "11_1312323172.00108" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1013 = "14_1312323172.00108" 
    .return ($P1013)
.end


.namespace []
.sub "" :load :init :subid("post15") :outer("10_1312323172.00108")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312323172.00108" 
    .local pmc block
    set block, $P1001
    $P1015 = get_root_global ["parrot"], "P6metaclass"
    $P1015."new_class"("PAST::VarList", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"VarList"]
.sub "_block1002"  :subid("11_1312323172.00108") :outer("10_1312323172.00108")
.annotate 'file', ''
.annotate 'line', 5
    .const 'Sub' $P1004 = "12_1312323172.00108" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P1004 = "12_1312323172.00108" 
    newclosure $P1008, $P1004
    .return ($P1008)
    .const 'Sub' $P1010 = "13_1312323172.00108" 
    .return ($P1010)
.end


.namespace ["PAST";"VarList"]
.include "except_types.pasm"
.sub "bindvalue"  :subid("12_1312323172.00108") :method :outer("11_1312323172.00108")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'file', ''
.annotate 'line', 5
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    if has_param_1007, optparam_16
    new $P101, "Undef"
    set param_1007, $P101
  optparam_16:
    .lex "$value", param_1007
.annotate 'line', 6
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("bindvalue", $P103, $I101)
.annotate 'line', 5
    .return ($P105)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"VarList"]
.sub "_block1009" :load :anon :subid("13_1312323172.00108")
.annotate 'file', ''
.annotate 'line', 5
    .const 'Sub' $P1011 = "11_1312323172.00108" 
    $P101 = $P1011()
    .return ($P101)
.end


.namespace []
.sub "_block1012" :load :anon :subid("14_1312323172.00108")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1014 = "10_1312323172.00108" 
    $P101 = $P1014()
    .return ($P101)
.end

