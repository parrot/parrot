
.namespace []
.sub "_block1000"  :anon :subid("10_1308206293.88332")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206293.88332" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1308206293.88332" 
    capture_lex $P1003
    $P142 = $P1003()
.annotate 'line', 1
    .return ($P142)
    .const 'Sub' $P1044 = "23_1308206293.88332" 
    .return ($P1044)
.end


.namespace []
.sub "" :load :init :subid("post24") :outer("10_1308206293.88332")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206293.88332" 
    .local pmc block
    set block, $P1001
    $P1046 = get_root_global ["parrot"], "P6metaclass"
    $P1046."new_class"("POST::Call", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Call"]
.sub "_block1002"  :subid("11_1308206293.88332") :outer("10_1308206293.88332")
.annotate 'line', 9
    .const 'Sub' $P1036 = "21_1308206293.88332" 
    capture_lex $P1036
    .const 'Sub' $P1032 = "20_1308206293.88332" 
    capture_lex $P1032
    .const 'Sub' $P1029 = "19_1308206293.88332" 
    capture_lex $P1029
    .const 'Sub' $P1025 = "18_1308206293.88332" 
    capture_lex $P1025
    .const 'Sub' $P1022 = "17_1308206293.88332" 
    capture_lex $P1022
    .const 'Sub' $P1018 = "16_1308206293.88332" 
    capture_lex $P1018
    .const 'Sub' $P1015 = "15_1308206293.88332" 
    capture_lex $P1015
    .const 'Sub' $P1011 = "14_1308206293.88332" 
    capture_lex $P1011
    .const 'Sub' $P1008 = "13_1308206293.88332" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308206293.88332" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 25
    .const 'Sub' $P1036 = "21_1308206293.88332" 
    newclosure $P1039, $P1036
.annotate 'line', 9
    .return ($P1039)
    .const 'Sub' $P1041 = "22_1308206293.88332" 
    .return ($P1041)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "name"  :subid("12_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_,_)
    .param pmc param_1007
.annotate 'line', 9
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


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "name"  :subid("13_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_)
.annotate 'line', 10
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


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "params"  :subid("14_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_,_)
    .param pmc param_1014
.annotate 'line', 12
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$param", param_1014
    find_lex $P109, "self"
    find_lex $P110, "$param"
    $P111 = $P109."attr"("params", $P110, 1)
    .return ($P111)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "params"  :subid("15_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_)
.annotate 'line', 13
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
    find_lex $P113, "self"
    get_hll_global $P114, "undef"
    $P115 = $P113."attr"("params", $P114, 0)
    .return ($P115)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "results"  :subid("16_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_,_)
    .param pmc param_1021
.annotate 'line', 15
    new $P1020, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1020, control_1019
    push_eh $P1020
    .lex "self", self
    .lex "$param", param_1021
    find_lex $P117, "self"
    find_lex $P118, "$param"
    $P119 = $P117."attr"("results", $P118, 1)
    .return ($P119)
  control_1019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P120, exception, "payload"
    .return ($P120)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "results"  :subid("17_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_)
.annotate 'line', 16
    new $P1024, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1024, control_1023
    push_eh $P1024
    .lex "self", self
    find_lex $P121, "self"
    get_hll_global $P122, "undef"
    $P123 = $P121."attr"("results", $P122, 0)
    .return ($P123)
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P124, exception, "payload"
    .return ($P124)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "invocant"  :subid("18_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_,_)
    .param pmc param_1028
.annotate 'line', 18
    new $P1027, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1027, control_1026
    push_eh $P1027
    .lex "self", self
    .lex "$param", param_1028
    find_lex $P125, "self"
    find_lex $P126, "$param"
    $P127 = $P125."attr"("invocant", $P126, 1)
    .return ($P127)
  control_1026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "invocant"  :subid("19_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_)
.annotate 'line', 19
    new $P1031, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1031, control_1030
    push_eh $P1031
    .lex "self", self
    find_lex $P129, "self"
    get_hll_global $P130, "undef"
    $P131 = $P129."attr"("invocant", $P130, 0)
    .return ($P131)
  control_1030:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "calltype"  :subid("20_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_,_)
    .param pmc param_1035
.annotate 'line', 24
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "self", self
    .lex "$param", param_1035
    find_lex $P133, "self"
    find_lex $P134, "$param"
    $P135 = $P133."attr"("calltype", $P134, 1)
    .return ($P135)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P136, exception, "payload"
    .return ($P136)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "calltype"  :subid("21_1308206293.88332") :method :outer("11_1308206293.88332") :multi(_)
.annotate 'line', 25
    new $P1038, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1038, control_1037
    push_eh $P1038
    .lex "self", self
    find_lex $P137, "self"
    get_hll_global $P138, "undef"
    $P139 = $P137."attr"("calltype", $P138, 0)
    .return ($P139)
  control_1037:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P140, exception, "payload"
    .return ($P140)
.end


.namespace ["POST";"Call"]
.sub "_block1040" :load :anon :subid("22_1308206293.88332")
.annotate 'line', 9
    .const 'Sub' $P1042 = "11_1308206293.88332" 
    $P141 = $P1042()
    .return ($P141)
.end


.namespace []
.sub "_block1043" :load :anon :subid("23_1308206293.88332")
.annotate 'line', 1
    .const 'Sub' $P1045 = "10_1308206293.88332" 
    $P143 = $P1045()
    .return ($P143)
.end

