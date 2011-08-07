
.namespace []
.sub "_block1000"  :anon :subid("10_1312695755.05986")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312695755.05986" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 5
    .const 'Sub' $P1003 = "11_1312695755.05986" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1017 = "15_1312695755.05986" 
    .return ($P1017)
.end


.namespace []
.sub "" :load :init :subid("post16") :outer("10_1312695755.05986")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312695755.05986" 
    .local pmc block
    set block, $P1001
    $P1019 = get_root_global ["parrot"], "P6metaclass"
    $P1019."new_class"("PAST::Control", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Control"]
.sub "_block1002"  :subid("11_1312695755.05986") :outer("10_1312695755.05986")
.annotate 'file', ''
.annotate 'line', 5
    .const 'Sub' $P1008 = "13_1312695755.05986" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1312695755.05986" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1008 = "13_1312695755.05986" 
    newclosure $P1012, $P1008
.annotate 'line', 5
    .return ($P1012)
    .const 'Sub' $P1014 = "14_1312695755.05986" 
    .return ($P1014)
.end


.namespace ["PAST";"Control"]
.include "except_types.pasm"
.sub "handle_types"  :subid("12_1312695755.05986") :method :outer("11_1312695755.05986")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'file', ''
.annotate 'line', 5
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    if has_param_1007, optparam_17
    new $P101, "Undef"
    set param_1007, $P101
  optparam_17:
    .lex "$value", param_1007
.annotate 'line', 6
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("handle_types", $P103, $I101)
.annotate 'line', 5
    .return ($P105)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Control"]
.include "except_types.pasm"
.sub "handle_types_except"  :subid("13_1312695755.05986") :method :outer("11_1312695755.05986")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'file', ''
.annotate 'line', 9
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_18
    new $P101, "Undef"
    set param_1011, $P101
  optparam_18:
    .lex "$value", param_1011
.annotate 'line', 10
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("handle_types_except", $P103, $I101)
.annotate 'line', 9
    .return ($P105)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Control"]
.sub "_block1013" :load :anon :subid("14_1312695755.05986")
.annotate 'file', ''
.annotate 'line', 5
    .const 'Sub' $P1015 = "11_1312695755.05986" 
    $P101 = $P1015()
    .return ($P101)
.end


.namespace []
.sub "_block1016" :load :anon :subid("15_1312695755.05986")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1018 = "10_1312695755.05986" 
    $P101 = $P1018()
    .return ($P101)
.end

