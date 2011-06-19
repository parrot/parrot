
.namespace []
.sub "_block1000"  :anon :subid("10_1308507558.77948")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308507558.77948" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 13
    .const 'Sub' $P1003 = "11_1308507558.77948" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1020 = "15_1308507558.77948" 
    .return ($P1020)
.end


.namespace []
.sub "" :load :init :subid("post16") :outer("10_1308507558.77948")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308507558.77948" 
    .local pmc block
    set block, $P1001
    $P1022 = get_root_global ["parrot"], "P6metaclass"
    $P1022."new_class"("PAST::Val", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Val"]
.sub "_block1002"  :subid("11_1308507558.77948") :outer("10_1308507558.77948")
.annotate 'file', ''
.annotate 'line', 13
    .const 'Sub' $P1008 = "13_1308507558.77948" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308507558.77948" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 20
    .const 'Sub' $P1008 = "13_1308507558.77948" 
    newclosure $P1015, $P1008
.annotate 'line', 13
    .return ($P1015)
    .const 'Sub' $P1017 = "14_1308507558.77948" 
    .return ($P1017)
.end


.namespace ["PAST";"Val"]
.include "except_types.pasm"
.sub "value"  :subid("12_1308507558.77948") :method :outer("11_1308507558.77948")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'file', ''
.annotate 'line', 13
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    if has_param_1007, optparam_17
    new $P101, "Undef"
    set param_1007, $P101
  optparam_17:
    .lex "$value", param_1007
.annotate 'line', 14
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("value", $P103, $I101)
.annotate 'line', 13
    .return ($P105)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Val"]
.include "except_types.pasm"
.sub "lvalue"  :subid("13_1308507558.77948") :method :outer("11_1308507558.77948")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'file', ''
.annotate 'line', 20
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_18
    new $P101, "Undef"
    set param_1011, $P101
  optparam_18:
    .lex "$value", param_1011
.annotate 'line', 21
    new $P102, "Undef"
    set $P1012, $P102
    .lex "$has_value", $P1012
    find_lex $P103, "$value"
    defined $I101, $P103
    new $P104, 'Integer'
    set $P104, $I101
    store_lex "$has_value", $P104
.annotate 'line', 23
    find_lex $P104, "$has_value"
    if $P104, if_1014
    set $P103, $P104
    goto if_1014_end
  if_1014:
    find_lex $P105, "$value"
    set $P103, $P105
  if_1014_end:
    unless $P103, if_1013_end
.annotate 'line', 24
    "die"("Unable to set lvalue on PAST::Val node")
  if_1013_end:
.annotate 'line', 27
    find_lex $P103, "self"
    find_lex $P104, "$value"
    find_lex $P105, "$has_value"
    $P106 = $P103."attr"("lvalue", $P104, $P105)
.annotate 'line', 20
    .return ($P106)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"Val"]
.sub "_block1016" :load :anon :subid("14_1308507558.77948")
.annotate 'file', ''
.annotate 'line', 13
    .const 'Sub' $P1018 = "11_1308507558.77948" 
    $P101 = $P1018()
    .return ($P101)
.end


.namespace []
.sub "_block1019" :load :anon :subid("15_1308507558.77948")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1021 = "10_1308507558.77948" 
    $P101 = $P1021()
    .return ($P101)
.end

