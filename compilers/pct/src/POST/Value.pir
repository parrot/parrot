
.namespace []
.sub "_block1000"  :anon :subid("10_1308206297.60187")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206297.60187" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 20
    .const 'Sub' $P1003 = "11_1308206297.60187" 
    capture_lex $P1003
    $P135 = $P1003()
.annotate 'line', 1
    .return ($P135)
    .const 'Sub' $P1040 = "22_1308206297.60187" 
    .return ($P1040)
.end


.namespace []
.sub "" :load :init :subid("post23") :outer("10_1308206297.60187")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206297.60187" 
    .local pmc block
    set block, $P1001
    $P1042 = get_root_global ["parrot"], "P6metaclass"
    $P1042."new_class"("POST::Value", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Value"]
.sub "_block1002"  :subid("11_1308206297.60187") :outer("10_1308206297.60187")
.annotate 'line', 20
    .const 'Sub' $P1032 = "20_1308206297.60187" 
    capture_lex $P1032
    .const 'Sub' $P1029 = "19_1308206297.60187" 
    capture_lex $P1029
    .const 'Sub' $P1025 = "18_1308206297.60187" 
    capture_lex $P1025
    .const 'Sub' $P1022 = "17_1308206297.60187" 
    capture_lex $P1022
    .const 'Sub' $P1018 = "16_1308206297.60187" 
    capture_lex $P1018
    .const 'Sub' $P1015 = "15_1308206297.60187" 
    capture_lex $P1015
    .const 'Sub' $P1011 = "14_1308206297.60187" 
    capture_lex $P1011
    .const 'Sub' $P1008 = "13_1308206297.60187" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308206297.60187" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 33
    .const 'Sub' $P1032 = "20_1308206297.60187" 
    newclosure $P1035, $P1032
.annotate 'line', 20
    .return ($P1035)
    .const 'Sub' $P1037 = "21_1308206297.60187" 
    .return ($P1037)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "name"  :subid("12_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_,_)
    .param pmc param_1007
.annotate 'line', 20
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    .lex "$param", param_1007
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("name", $P102, 1)
    .return ($P103)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "name"  :subid("13_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_)
.annotate 'line', 21
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    find_lex $P105, "self"
    get_hll_global $P106, "undef"
    $P107 = $P105."attr"("name", $P106, 0)
    .return ($P107)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "type"  :subid("14_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_,_)
    .param pmc param_1014
.annotate 'line', 23
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$param", param_1014
    find_lex $P109, "self"
    find_lex $P110, "$param"
    $P111 = $P109."attr"("type", $P110, 1)
    .return ($P111)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "type"  :subid("15_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_)
.annotate 'line', 24
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
    find_lex $P113, "self"
    get_hll_global $P114, "undef"
    $P115 = $P113."attr"("type", $P114, 0)
    .return ($P115)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "flags"  :subid("16_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_,_)
    .param pmc param_1021
.annotate 'line', 26
    new $P1020, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1020, control_1019
    push_eh $P1020
    .lex "self", self
    .lex "%flags", param_1021
    find_lex $P117, "self"
    find_lex $P118, "%flags"
    $P119 = $P117."attr"("flags", $P118, 1)
    .return ($P119)
  control_1019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "flags"  :subid("17_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_)
.annotate 'line', 27
    new $P1024, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1024, control_1023
    push_eh $P1024
    .lex "self", self
    find_lex $P121, "self"
    get_hll_global $P122, "undef"
    $P123 = $P121."attr"("flags", $P122, 0)
    .return ($P123)
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "modifier"  :subid("18_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_,_)
    .param pmc param_1028
.annotate 'line', 30
    new $P1027, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1027, control_1026
    push_eh $P1027
    .lex "self", self
    .lex "$param", param_1028
    find_lex $P125, "self"
    find_lex $P126, "$param"
    $P127 = $P125."attr"("modifier", $P126, 1)
    .return ($P127)
  control_1026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "modifier"  :subid("19_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_)
.annotate 'line', 31
    new $P1031, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1031, control_1030
    push_eh $P1031
    .lex "self", self
    find_lex $P129, "self"
    get_hll_global $P130, "undef"
    $P131 = $P129."attr"("modifier", $P130, 0)
    .return ($P131)
  control_1030:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["POST";"Value"]
.include "except_types.pasm"
.sub "declared"  :subid("20_1308206297.60187") :method :outer("11_1308206297.60187") :multi(_)
.annotate 'line', 33
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "self", self
    .return (0)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P133, exception, "payload"
    .return ($P133)
.end


.namespace ["POST";"Value"]
.sub "_block1036" :load :anon :subid("21_1308206297.60187")
.annotate 'line', 20
    .const 'Sub' $P1038 = "11_1308206297.60187" 
    $P134 = $P1038()
    .return ($P134)
.end


.namespace []
.sub "_block1039" :load :anon :subid("22_1308206297.60187")
.annotate 'line', 1
    .const 'Sub' $P1041 = "10_1308206297.60187" 
    $P136 = $P1041()
    .return ($P136)
.end

