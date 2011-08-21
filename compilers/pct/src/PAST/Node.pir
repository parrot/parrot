
.namespace []
.sub "_block1000"  :anon :subid("10_1313886061.53029")
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1313886061.53029" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 28
    .const 'Sub' $P1003 = "11_1313886061.53029" 
    capture_lex $P1003
    $P101 = $P1003()
.annotate 'line', 1
    .return ($P101)
    .const 'Sub' $P1041 = "21_1313886061.53029" 
    .return ($P1041)
.end


.namespace []
.sub "" :load :init :subid("post22") :outer("10_1313886061.53029")
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1313886061.53029" 
    .local pmc block
    set block, $P1001
    $P1043 = get_root_global ["parrot"], "P6metaclass"
    $P1043."new_class"("PAST::Node", "PCT::Node" :named("parent"))
.end


.namespace ["PAST";"Node"]
.sub "_block1002"  :subid("11_1313886061.53029") :outer("10_1313886061.53029")
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 28
    .const 'Sub' $P1032 = "19_1313886061.53029" 
    capture_lex $P1032
    .const 'Sub' $P1028 = "18_1313886061.53029" 
    capture_lex $P1028
    .const 'Sub' $P1024 = "17_1313886061.53029" 
    capture_lex $P1024
    .const 'Sub' $P1020 = "16_1313886061.53029" 
    capture_lex $P1020
    .const 'Sub' $P1016 = "15_1313886061.53029" 
    capture_lex $P1016
    .const 'Sub' $P1012 = "14_1313886061.53029" 
    capture_lex $P1012
    .const 'Sub' $P1008 = "13_1313886061.53029" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1313886061.53029" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 89
    .const 'Sub' $P1032 = "19_1313886061.53029" 
    newclosure $P1036, $P1032
.annotate 'line', 28
    .return ($P1036)
    .const 'Sub' $P1038 = "20_1313886061.53029" 
    .return ($P1038)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "returns"  :subid("12_1313886061.53029") :method :outer("11_1313886061.53029")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 28
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    if has_param_1007, optparam_23
    new $P100, "Undef"
    set param_1007, $P100
  optparam_23:
    .lex "$value", param_1007
.annotate 'line', 29
    find_lex $P101, "self"
    find_lex $P102, "$value"
    find_lex $P103, "$value"
    defined $I100, $P103
    $P104 = $P101."attr"("returns", $P102, $I100)
.annotate 'line', 28
    .return ($P104)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "arity"  :subid("13_1313886061.53029") :method :outer("11_1313886061.53029")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 36
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_24
    new $P100, "Undef"
    set param_1011, $P100
  optparam_24:
    .lex "$value", param_1011
.annotate 'line', 37
    find_lex $P101, "self"
    find_lex $P102, "$value"
    find_lex $P103, "$value"
    defined $I100, $P103
    $P104 = $P101."attr"("arity", $P102, $I100)
.annotate 'line', 36
    .return ($P104)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "named"  :subid("14_1313886061.53029") :method :outer("11_1313886061.53029")
    .param pmc param_1015 :optional
    .param int has_param_1015 :opt_flag
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 44
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    if has_param_1015, optparam_25
    new $P100, "Undef"
    set param_1015, $P100
  optparam_25:
    .lex "$value", param_1015
.annotate 'line', 45
    find_lex $P101, "self"
    find_lex $P102, "$value"
    find_lex $P103, "$value"
    defined $I100, $P103
    $P104 = $P101."attr"("named", $P102, $I100)
.annotate 'line', 44
    .return ($P104)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "flat"  :subid("15_1313886061.53029") :method :outer("11_1313886061.53029")
    .param pmc param_1019 :optional
    .param int has_param_1019 :opt_flag
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 51
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    if has_param_1019, optparam_26
    new $P100, "Undef"
    set param_1019, $P100
  optparam_26:
    .lex "$value", param_1019
.annotate 'line', 52
    find_lex $P101, "self"
    find_lex $P102, "$value"
    find_lex $P103, "$value"
    defined $I100, $P103
    $P104 = $P101."attr"("flat", $P102, $I100)
.annotate 'line', 51
    .return ($P104)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "handlers"  :subid("16_1313886061.53029") :method :outer("11_1313886061.53029")
    .param pmc param_1023 :optional
    .param int has_param_1023 :opt_flag
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 60
    new $P1022, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1022, control_1021
    push_eh $P1022
    .lex "self", self
    if has_param_1023, optparam_27
    new $P100, "Undef"
    set param_1023, $P100
  optparam_27:
    .lex "$value", param_1023
.annotate 'line', 61
    find_lex $P101, "self"
    find_lex $P102, "$value"
    find_lex $P103, "$value"
    defined $I100, $P103
    $P104 = $P101."attr"("handlers", $P102, $I100)
.annotate 'line', 60
    .return ($P104)
  control_1021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "lvalue"  :subid("17_1313886061.53029") :method :outer("11_1313886061.53029")
    .param pmc param_1027 :optional
    .param int has_param_1027 :opt_flag
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 69
    new $P1026, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1026, control_1025
    push_eh $P1026
    .lex "self", self
    if has_param_1027, optparam_28
    new $P100, "Undef"
    set param_1027, $P100
  optparam_28:
    .lex "$value", param_1027
.annotate 'line', 70
    find_lex $P101, "self"
    find_lex $P102, "$value"
    find_lex $P103, "$value"
    defined $I100, $P103
    $P104 = $P101."attr"("lvalue", $P102, $I100)
.annotate 'line', 69
    .return ($P104)
  control_1025:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "signature"  :subid("18_1313886061.53029") :method :outer("11_1313886061.53029")
    .param pmc param_1031 :optional
    .param int has_param_1031 :opt_flag
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 78
    new $P1030, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1030, control_1029
    push_eh $P1030
    .lex "self", self
    if has_param_1031, optparam_29
    new $P100, "Undef"
    set param_1031, $P100
  optparam_29:
    .lex "$value", param_1031
.annotate 'line', 79
    find_lex $P101, "self"
    find_lex $P102, "$value"
    find_lex $P103, "$value"
    defined $I100, $P103
    $P104 = $P101."attr"("signature", $P102, $I100)
.annotate 'line', 78
    .return ($P104)
  control_1029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"Node"]
.include "except_types.pasm"
.sub "childorder"  :subid("19_1313886061.53029") :method :outer("11_1313886061.53029")
    .param pmc param_1035 :optional
    .param int has_param_1035 :opt_flag
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 89
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "self", self
    if has_param_1035, optparam_30
    new $P100, "Undef"
    set param_1035, $P100
  optparam_30:
    .lex "$value", param_1035
.annotate 'line', 90
    find_lex $P101, "self"
    find_lex $P102, "$value"
    find_lex $P103, "$value"
    defined $I100, $P103
    $P104 = $P101."attr"("childorder", $P102, $I100)
.annotate 'line', 89
    .return ($P104)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"Node"]
.sub "_block1037" :load :anon :subid("20_1313886061.53029")
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 28
    .const 'Sub' $P1039 = "11_1313886061.53029" 
    $P100 = $P1039()
    .return ($P100)
.end


.namespace []
.sub "_block1040" :load :anon :subid("21_1313886061.53029")
.annotate 'file', "PAST/Node.pm"
.annotate 'line', 1
    .const 'Sub' $P1042 = "10_1313886061.53029" 
    $P100 = $P1042()
    .return ($P100)
.end

