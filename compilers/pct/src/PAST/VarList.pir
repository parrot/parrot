
.namespace []
.sub "_block11"  :anon :subid("10_1307980075.20332")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307980075.20332" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 5
    .const 'Sub' $P14 = "11_1307980075.20332" 
    capture_lex $P14
    $P31 = $P14()
.annotate 'line', 1
    .return ($P31)
    .const 'Sub' $P33 = "14_1307980075.20332" 
    .return ($P33)
.end


.namespace []
.sub "" :load :init :subid("post15") :outer("10_1307980075.20332")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307980075.20332" 
    .local pmc block
    set block, $P12
    $P36 = get_root_global ["parrot"], "P6metaclass"
    $P36."new_class"("PAST::VarList", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"VarList"]
.sub "_block13"  :subid("11_1307980075.20332") :outer("10_1307980075.20332")
.annotate 'line', 5
    .const 'Sub' $P15 = "12_1307980075.20332" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P15 = "12_1307980075.20332" 
    newclosure $P26, $P15
    .return ($P26)
    .const 'Sub' $P28 = "13_1307980075.20332" 
    .return ($P28)
.end


.namespace ["PAST";"VarList"]
.include "except_types.pasm"
.sub "bindvalue"  :subid("12_1307980075.20332") :method :outer("11_1307980075.20332")
    .param pmc param_18 :optional
    .param int has_param_18 :opt_flag
.annotate 'line', 5
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    if has_param_18, optparam_16
    new $P19, "Undef"
    set param_18, $P19
  optparam_16:
    .lex "$value", param_18
.annotate 'line', 6
    find_lex $P20, "self"
    find_lex $P21, "$value"
    find_lex $P22, "$value"
    defined $I23, $P22
    $P24 = $P20."attr"("bindvalue", $P21, $I23)
.annotate 'line', 5
    .return ($P24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["PAST";"VarList"]
.sub "_block27" :load :anon :subid("13_1307980075.20332")
.annotate 'line', 5
    .const 'Sub' $P29 = "11_1307980075.20332" 
    $P30 = $P29()
    .return ($P30)
.end


.namespace []
.sub "_block32" :load :anon :subid("14_1307980075.20332")
.annotate 'line', 1
    .const 'Sub' $P34 = "10_1307980075.20332" 
    $P35 = $P34()
    .return ($P35)
.end

