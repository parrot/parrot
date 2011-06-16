
.namespace []
.sub "_block1000"  :anon :subid("10_1308206310.82638")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206310.82638" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 13
    .const 'Sub' $P1003 = "11_1308206310.82638" 
    capture_lex $P1003
    $P122 = $P1003()
.annotate 'line', 1
    .return ($P122)
    .const 'Sub' $P1020 = "15_1308206310.82638" 
    .return ($P1020)
.end


.namespace []
.sub "" :load :init :subid("post16") :outer("10_1308206310.82638")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206310.82638" 
    .local pmc block
    set block, $P1001
    $P1022 = get_root_global ["parrot"], "P6metaclass"
    $P1022."new_class"("PAST::Val", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Val"]
.sub "_block1002"  :subid("11_1308206310.82638") :outer("10_1308206310.82638")
.annotate 'line', 13
    .const 'Sub' $P1008 = "13_1308206310.82638" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308206310.82638" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 20
    .const 'Sub' $P1008 = "13_1308206310.82638" 
    newclosure $P1015, $P1008
.annotate 'line', 13
    .return ($P1015)
    .const 'Sub' $P1017 = "14_1308206310.82638" 
    .return ($P1017)
.end


.namespace ["PAST";"Val"]
.include "except_types.pasm"
.sub "value"  :subid("12_1308206310.82638") :method :outer("11_1308206310.82638")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
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
    defined $I105, $P104
    $P106 = $P102."attr"("value", $P103, $I105)
.annotate 'line', 13
    .return ($P106)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Val"]
.include "except_types.pasm"
.sub "lvalue"  :subid("13_1308206310.82638") :method :outer("11_1308206310.82638")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'line', 20
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_18
    new $P108, "Undef"
    set param_1011, $P108
  optparam_18:
    .lex "$value", param_1011
.annotate 'line', 21
    new $P109, "Undef"
    set $P1012, $P109
    .lex "$has_value", $P1012
    find_lex $P110, "$value"
    defined $I111, $P110
    new $P112, 'Integer'
    set $P112, $I111
    store_lex "$has_value", $P112
.annotate 'line', 23
    find_lex $P114, "$has_value"
    if $P114, if_1014
    set $P113, $P114
    goto if_1014_end
  if_1014:
    find_lex $P115, "$value"
    set $P113, $P115
  if_1014_end:
    unless $P113, if_1013_end
.annotate 'line', 24
    "die"("Unable to set lvalue on PAST::Val node")
  if_1013_end:
.annotate 'line', 27
    find_lex $P116, "self"
    find_lex $P117, "$value"
    find_lex $P118, "$has_value"
    $P119 = $P116."attr"("lvalue", $P117, $P118)
.annotate 'line', 20
    .return ($P119)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["PAST";"Val"]
.sub "_block1016" :load :anon :subid("14_1308206310.82638")
.annotate 'line', 13
    .const 'Sub' $P1018 = "11_1308206310.82638" 
    $P121 = $P1018()
    .return ($P121)
.end


.namespace []
.sub "_block1019" :load :anon :subid("15_1308206310.82638")
.annotate 'line', 1
    .const 'Sub' $P1021 = "10_1308206310.82638" 
    $P123 = $P1021()
    .return ($P123)
.end

