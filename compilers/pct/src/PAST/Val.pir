
.namespace []
.sub "_block11"  :anon :subid("10_1308013492.12316")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1308013492.12316" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 13
    .const 'Sub' $P14 = "11_1308013492.12316" 
    capture_lex $P14
    $P50 = $P14()
.annotate 'line', 1
    .return ($P50)
    .const 'Sub' $P52 = "15_1308013492.12316" 
    .return ($P52)
.end


.namespace []
.sub "" :load :init :subid("post16") :outer("10_1308013492.12316")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1308013492.12316" 
    .local pmc block
    set block, $P12
    $P55 = get_root_global ["parrot"], "P6metaclass"
    $P55."new_class"("PAST::Val", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Val"]
.sub "_block13"  :subid("11_1308013492.12316") :outer("10_1308013492.12316")
.annotate 'line', 13
    .const 'Sub' $P26 = "13_1308013492.12316" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1308013492.12316" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 20
    .const 'Sub' $P26 = "13_1308013492.12316" 
    newclosure $P45, $P26
.annotate 'line', 13
    .return ($P45)
    .const 'Sub' $P47 = "14_1308013492.12316" 
    .return ($P47)
.end


.namespace ["PAST";"Val"]
.include "except_types.pasm"
.sub "value"  :subid("12_1308013492.12316") :method :outer("11_1308013492.12316")
    .param pmc param_18 :optional
    .param int has_param_18 :opt_flag
.annotate 'line', 13
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    if has_param_18, optparam_17
    new $P19, "Undef"
    set param_18, $P19
  optparam_17:
    .lex "$value", param_18
.annotate 'line', 14
    find_lex $P20, "self"
    find_lex $P21, "$value"
    find_lex $P22, "$value"
    defined $I23, $P22
    $P24 = $P20."attr"("value", $P21, $I23)
.annotate 'line', 13
    .return ($P24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["PAST";"Val"]
.include "except_types.pasm"
.sub "lvalue"  :subid("13_1308013492.12316") :method :outer("11_1308013492.12316")
    .param pmc param_29 :optional
    .param int has_param_29 :opt_flag
.annotate 'line', 20
    new $P28, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P28, control_27
    push_eh $P28
    .lex "self", self
    if has_param_29, optparam_18
    new $P30, "Undef"
    set param_29, $P30
  optparam_18:
    .lex "$value", param_29
.annotate 'line', 21
    new $P31, "Undef"
    .lex "$has_value", $P31
    find_lex $P32, "$value"
    defined $I33, $P32
    new $P34, 'Integer'
    set $P34, $I33
    store_lex "$has_value", $P34
.annotate 'line', 23
    find_lex $P38, "$has_value"
    if $P38, if_37
    set $P36, $P38
    goto if_37_end
  if_37:
    find_lex $P39, "$value"
    set $P36, $P39
  if_37_end:
    unless $P36, if_35_end
.annotate 'line', 24
    "die"("Unable to set lvalue on PAST::Val node")
  if_35_end:
.annotate 'line', 27
    find_lex $P40, "self"
    find_lex $P41, "$value"
    find_lex $P42, "$has_value"
    $P43 = $P40."attr"("lvalue", $P41, $P42)
.annotate 'line', 20
    .return ($P43)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["PAST";"Val"]
.sub "_block46" :load :anon :subid("14_1308013492.12316")
.annotate 'line', 13
    .const 'Sub' $P48 = "11_1308013492.12316" 
    $P49 = $P48()
    .return ($P49)
.end


.namespace []
.sub "_block51" :load :anon :subid("15_1308013492.12316")
.annotate 'line', 1
    .const 'Sub' $P53 = "10_1308013492.12316" 
    $P54 = $P53()
    .return ($P54)
.end

