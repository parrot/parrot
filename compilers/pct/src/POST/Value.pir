
.namespace []
.sub "_block11"  :anon :subid("10_1307045670.6358")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307045670.6358" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 20
    .const 'Sub' $P14 = "11_1307045670.6358" 
    capture_lex $P14
    $P84 = $P14()
.annotate 'line', 1
    .return ($P84)
    .const 'Sub' $P86 = "22_1307045670.6358" 
    .return ($P86)
.end


.namespace []
.sub "" :load :init :subid("post23") :outer("10_1307045670.6358")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307045670.6358" 
    .local pmc block
    set block, $P12
    $P89 = get_root_global ["parrot"], "P6metaclass"
    $P89."new_class"("POST::Value", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Value"]
.sub "_block13"  :subid("11_1307045670.6358") :outer("10_1307045670.6358")
.annotate 'line', 20
    .const 'Sub' $P75 = "20_1307045670.6358" 
    capture_lex $P75
    .const 'Sub' $P68 = "19_1307045670.6358" 
    capture_lex $P68
    .const 'Sub' $P60 = "18_1307045670.6358" 
    capture_lex $P60
    .const 'Sub' $P53 = "17_1307045670.6358" 
    capture_lex $P53
    .const 'Sub' $P45 = "16_1307045670.6358" 
    capture_lex $P45
    .const 'Sub' $P38 = "15_1307045670.6358" 
    capture_lex $P38
    .const 'Sub' $P30 = "14_1307045670.6358" 
    capture_lex $P30
    .const 'Sub' $P23 = "13_1307045670.6358" 
    capture_lex $P23
    .const 'Sub' $P15 = "12_1307045670.6358" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 33
    .const 'Sub' $P75 = "20_1307045670.6358" 
    newclosure $P79, $P75
.annotate 'line', 20
    .return ($P79)
    .const 'Sub' $P81 = "21_1307045670.6358" 
    .return ($P81)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "name"  :subid("12_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_,_)
    .param pmc param_18
.annotate 'line', 20
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
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


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "name"  :subid("13_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_)
.annotate 'line', 21
    new $P25, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P25, control_24
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


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "type"  :subid("14_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_,_)
    .param pmc param_33
.annotate 'line', 23
    new $P32, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P32, control_31
    push_eh $P32
    .lex "self", self
    .lex "$param", param_33
    find_lex $P34, "self"
    find_lex $P35, "$param"
    $P36 = $P34."attr"("type", $P35, 1)
    .return ($P36)
  control_31:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P37, exception, "payload"
    .return ($P37)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "type"  :subid("15_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_)
.annotate 'line', 24
    new $P40, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P40, control_39
    push_eh $P40
    .lex "self", self
    find_lex $P41, "self"
    get_hll_global $P42, "undef"
    $P43 = $P41."attr"("type", $P42, 0)
    .return ($P43)
  control_39:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P44, exception, "payload"
    .return ($P44)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "flags"  :subid("16_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_,_)
    .param pmc param_48
.annotate 'line', 26
    new $P47, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P47, control_46
    push_eh $P47
    .lex "self", self
    .lex "%flags", param_48
    find_lex $P49, "self"
    find_lex $P50, "%flags"
    $P51 = $P49."attr"("flags", $P50, 1)
    .return ($P51)
  control_46:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "flags"  :subid("17_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_)
.annotate 'line', 27
    new $P55, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P55, control_54
    push_eh $P55
    .lex "self", self
    find_lex $P56, "self"
    get_hll_global $P57, "undef"
    $P58 = $P56."attr"("flags", $P57, 0)
    .return ($P58)
  control_54:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P59, exception, "payload"
    .return ($P59)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "modifier"  :subid("18_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_,_)
    .param pmc param_63
.annotate 'line', 30
    new $P62, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P62, control_61
    push_eh $P62
    .lex "self", self
    .lex "$param", param_63
    find_lex $P64, "self"
    find_lex $P65, "$param"
    $P66 = $P64."attr"("modifier", $P65, 1)
    .return ($P66)
  control_61:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P67, exception, "payload"
    .return ($P67)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "modifier"  :subid("19_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_)
.annotate 'line', 31
    new $P70, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P70, control_69
    push_eh $P70
    .lex "self", self
    find_lex $P71, "self"
    get_hll_global $P72, "undef"
    $P73 = $P71."attr"("modifier", $P72, 0)
    .return ($P73)
  control_69:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "declared"  :subid("20_1307045670.6358") :method :outer("11_1307045670.6358") :multi(_)
.annotate 'line', 33
    new $P77, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P77, control_76
    push_eh $P77
    .lex "self", self
    .return (0)
  control_76:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P78, exception, "payload"
    .return ($P78)
.end


.namespace ["POST";"Value"]
.sub "_block80" :load :anon :subid("21_1307045670.6358")
.annotate 'line', 20
    .const 'Sub' $P82 = "11_1307045670.6358" 
    $P83 = $P82()
    .return ($P83)
.end


.namespace []
.sub "_block85" :load :anon :subid("22_1307045670.6358")
.annotate 'line', 1
    .const 'Sub' $P87 = "10_1307045670.6358" 
    $P88 = $P87()
    .return ($P88)
.end

