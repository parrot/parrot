
.namespace []
.sub "_block1000"  :anon :subid("10_1310682756.49158")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1310682756.49158" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 28
    .const 'Sub' $P1003 = "11_1310682756.49158" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1037 = "20_1310682756.49158" 
    .return ($P1037)
.end


.namespace []
.sub "" :load :init :subid("post21") :outer("10_1310682756.49158")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1310682756.49158" 
    .local pmc block
    set block, $P1001
    $P1039 = get_root_global ["parrot"], "P6metaclass"
    $P1039."new_class"("PAST::Node", "PCT::Node" :named("parent"))
.end


.namespace ["PAST";"Node"]
.sub "_block1002"  :subid("11_1310682756.49158") :outer("10_1310682756.49158")
.annotate 'file', ''
.annotate 'line', 28
    .const 'Sub' $P1028 = "18_1310682756.49158" 
    capture_lex $P1028
    .const 'Sub' $P1024 = "17_1310682756.49158" 
    capture_lex $P1024
    .const 'Sub' $P1020 = "16_1310682756.49158" 
    capture_lex $P1020
    .const 'Sub' $P1016 = "15_1310682756.49158" 
    capture_lex $P1016
    .const 'Sub' $P1012 = "14_1310682756.49158" 
    capture_lex $P1012
    .const 'Sub' $P1008 = "13_1310682756.49158" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1310682756.49158" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 79
    .const 'Sub' $P1028 = "18_1310682756.49158" 
    newclosure $P1032, $P1028
.annotate 'line', 28
    .return ($P1032)
    .const 'Sub' $P1034 = "19_1310682756.49158" 
    .return ($P1034)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "returns"  :subid("12_1310682756.49158") :method :outer("11_1310682756.49158")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'file', ''
.annotate 'line', 28
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    if has_param_1007, optparam_22
    new $P101, "Undef"
    set param_1007, $P101
  optparam_22:
    .lex "$value", param_1007
.annotate 'line', 29
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("returns", $P103, $I101)
.annotate 'line', 28
    .return ($P105)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "arity"  :subid("13_1310682756.49158") :method :outer("11_1310682756.49158")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'file', ''
.annotate 'line', 36
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_23
    new $P101, "Undef"
    set param_1011, $P101
  optparam_23:
    .lex "$value", param_1011
.annotate 'line', 37
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("arity", $P103, $I101)
.annotate 'line', 36
    .return ($P105)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "named"  :subid("14_1310682756.49158") :method :outer("11_1310682756.49158")
    .param pmc param_1015 :optional
    .param int has_param_1015 :opt_flag
.annotate 'file', ''
.annotate 'line', 44
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    if has_param_1015, optparam_24
    new $P101, "Undef"
    set param_1015, $P101
  optparam_24:
    .lex "$value", param_1015
.annotate 'line', 45
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("named", $P103, $I101)
.annotate 'line', 44
    .return ($P105)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "flat"  :subid("15_1310682756.49158") :method :outer("11_1310682756.49158")
    .param pmc param_1019 :optional
    .param int has_param_1019 :opt_flag
.annotate 'file', ''
.annotate 'line', 51
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    if has_param_1019, optparam_25
    new $P101, "Undef"
    set param_1019, $P101
  optparam_25:
    .lex "$value", param_1019
.annotate 'line', 52
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("flat", $P103, $I101)
.annotate 'line', 51
    .return ($P105)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "handlers"  :subid("16_1310682756.49158") :method :outer("11_1310682756.49158")
    .param pmc param_1023 :optional
    .param int has_param_1023 :opt_flag
.annotate 'file', ''
.annotate 'line', 60
    new $P1022, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1022, control_1021
    push_eh $P1022
    .lex "self", self
    if has_param_1023, optparam_26
    new $P101, "Undef"
    set param_1023, $P101
  optparam_26:
    .lex "$value", param_1023
.annotate 'line', 61
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("handlers", $P103, $I101)
.annotate 'line', 60
    .return ($P105)
  control_1021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "lvalue"  :subid("17_1310682756.49158") :method :outer("11_1310682756.49158")
    .param pmc param_1027 :optional
    .param int has_param_1027 :opt_flag
.annotate 'file', ''
.annotate 'line', 69
    new $P1026, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1026, control_1025
    push_eh $P1026
    .lex "self", self
    if has_param_1027, optparam_27
    new $P101, "Undef"
    set param_1027, $P101
  optparam_27:
    .lex "$value", param_1027
.annotate 'line', 70
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("lvalue", $P103, $I101)
.annotate 'line', 69
    .return ($P105)
  control_1025:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "childorder"  :subid("18_1310682756.49158") :method :outer("11_1310682756.49158")
    .param pmc param_1031 :optional
    .param int has_param_1031 :opt_flag
.annotate 'file', ''
.annotate 'line', 79
    new $P1030, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1030, control_1029
    push_eh $P1030
    .lex "self", self
    if has_param_1031, optparam_28
    new $P101, "Undef"
    set param_1031, $P101
  optparam_28:
    .lex "$value", param_1031
.annotate 'line', 80
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("childorder", $P103, $I101)
.annotate 'line', 79
    .return ($P105)
  control_1029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Node"]
.sub "_block1033" :load :anon :subid("19_1310682756.49158")
.annotate 'file', ''
.annotate 'line', 28
    .const 'Sub' $P1035 = "11_1310682756.49158" 
    $P101 = $P1035()
    .return ($P101)
.end


.namespace []
.sub "_block1036" :load :anon :subid("20_1310682756.49158")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1038 = "10_1310682756.49158" 
    $P101 = $P1038()
    .return ($P101)
.end

