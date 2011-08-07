
.namespace []
.sub "_block1000"  :anon :subid("10_1312695712.6205")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312695712.6205" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1312695712.6205" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1044 = "23_1312695712.6205" 
    .return ($P1044)
.end


.namespace []
.sub "" :load :init :subid("post24") :outer("10_1312695712.6205")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312695712.6205" 
    .local pmc block
    set block, $P1001
    $P1046 = get_root_global ["parrot"], "P6metaclass"
    $P1046."new_class"("POST::Call", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Call"]
.sub "_block1002"  :subid("11_1312695712.6205") :outer("10_1312695712.6205")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1036 = "21_1312695712.6205" 
    capture_lex $P1036
    .const 'Sub' $P1032 = "20_1312695712.6205" 
    capture_lex $P1032
    .const 'Sub' $P1029 = "19_1312695712.6205" 
    capture_lex $P1029
    .const 'Sub' $P1025 = "18_1312695712.6205" 
    capture_lex $P1025
    .const 'Sub' $P1022 = "17_1312695712.6205" 
    capture_lex $P1022
    .const 'Sub' $P1018 = "16_1312695712.6205" 
    capture_lex $P1018
    .const 'Sub' $P1015 = "15_1312695712.6205" 
    capture_lex $P1015
    .const 'Sub' $P1011 = "14_1312695712.6205" 
    capture_lex $P1011
    .const 'Sub' $P1008 = "13_1312695712.6205" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1312695712.6205" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 25
    .const 'Sub' $P1036 = "21_1312695712.6205" 
    newclosure $P1039, $P1036
.annotate 'line', 9
    .return ($P1039)
    .const 'Sub' $P1041 = "22_1312695712.6205" 
    .return ($P1041)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "name"  :subid("12_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_,_)
    .param pmc param_1007
.annotate 'file', ''
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
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "name"  :subid("13_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_)
.annotate 'file', ''
.annotate 'line', 10
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("name", $P102, 0)
    .return ($P103)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "params"  :subid("14_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_,_)
    .param pmc param_1014
.annotate 'file', ''
.annotate 'line', 12
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$param", param_1014
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("params", $P102, 1)
    .return ($P103)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "params"  :subid("15_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_)
.annotate 'file', ''
.annotate 'line', 13
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("params", $P102, 0)
    .return ($P103)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "results"  :subid("16_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_,_)
    .param pmc param_1021
.annotate 'file', ''
.annotate 'line', 15
    new $P1020, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1020, control_1019
    push_eh $P1020
    .lex "self", self
    .lex "$param", param_1021
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("results", $P102, 1)
    .return ($P103)
  control_1019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "results"  :subid("17_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_)
.annotate 'file', ''
.annotate 'line', 16
    new $P1024, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1024, control_1023
    push_eh $P1024
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("results", $P102, 0)
    .return ($P103)
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "invocant"  :subid("18_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_,_)
    .param pmc param_1028
.annotate 'file', ''
.annotate 'line', 18
    new $P1027, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1027, control_1026
    push_eh $P1027
    .lex "self", self
    .lex "$param", param_1028
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("invocant", $P102, 1)
    .return ($P103)
  control_1026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "invocant"  :subid("19_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_)
.annotate 'file', ''
.annotate 'line', 19
    new $P1031, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1031, control_1030
    push_eh $P1031
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("invocant", $P102, 0)
    .return ($P103)
  control_1030:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "calltype"  :subid("20_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_,_)
    .param pmc param_1035
.annotate 'file', ''
.annotate 'line', 24
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "self", self
    .lex "$param", param_1035
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("calltype", $P102, 1)
    .return ($P103)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.include "except_types.pasm"
.sub "calltype"  :subid("21_1312695712.6205") :method :outer("11_1312695712.6205") :multi(_)
.annotate 'file', ''
.annotate 'line', 25
    new $P1038, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1038, control_1037
    push_eh $P1038
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("calltype", $P102, 0)
    .return ($P103)
  control_1037:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Call"]
.sub "_block1040" :load :anon :subid("22_1312695712.6205")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1042 = "11_1312695712.6205" 
    $P101 = $P1042()
    .return ($P101)
.end


.namespace []
.sub "_block1043" :load :anon :subid("23_1312695712.6205")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1045 = "10_1312695712.6205" 
    $P101 = $P1045()
    .return ($P101)
.end

