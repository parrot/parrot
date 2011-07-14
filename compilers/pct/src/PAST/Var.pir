
.namespace []
.sub "_block1000"  :anon :subid("10_1310682757.39112")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1310682757.39112" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 17
    .const 'Sub' $P1003 = "11_1310682757.39112" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1041 = "21_1310682757.39112" 
    .return ($P1041)
.end


.namespace []
.sub "" :load :init :subid("post22") :outer("10_1310682757.39112")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1310682757.39112" 
    .local pmc block
    set block, $P1001
    $P1043 = get_root_global ["parrot"], "P6metaclass"
    $P1043."new_class"("PAST::Var", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Var"]
.sub "_block1002"  :subid("11_1310682757.39112") :outer("10_1310682757.39112")
.annotate 'file', ''
.annotate 'line', 17
    .const 'Sub' $P1032 = "19_1310682757.39112" 
    capture_lex $P1032
    .const 'Sub' $P1028 = "18_1310682757.39112" 
    capture_lex $P1028
    .const 'Sub' $P1024 = "17_1310682757.39112" 
    capture_lex $P1024
    .const 'Sub' $P1020 = "16_1310682757.39112" 
    capture_lex $P1020
    .const 'Sub' $P1016 = "15_1310682757.39112" 
    capture_lex $P1016
    .const 'Sub' $P1012 = "14_1310682757.39112" 
    capture_lex $P1012
    .const 'Sub' $P1008 = "13_1310682757.39112" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1310682757.39112" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 87
    .const 'Sub' $P1032 = "19_1310682757.39112" 
    newclosure $P1036, $P1032
.annotate 'line', 17
    .return ($P1036)
    .const 'Sub' $P1038 = "20_1310682757.39112" 
    .return ($P1038)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "scope"  :subid("12_1310682757.39112") :method :outer("11_1310682757.39112")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
.annotate 'file', ''
.annotate 'line', 17
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    if has_param_1007, optparam_23
    new $P101, "Undef"
    set param_1007, $P101
  optparam_23:
    .lex "$value", param_1007
.annotate 'line', 18
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("scope", $P103, $I101)
.annotate 'line', 17
    .return ($P105)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "isdecl"  :subid("13_1310682757.39112") :method :outer("11_1310682757.39112")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'file', ''
.annotate 'line', 28
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_24
    new $P101, "Undef"
    set param_1011, $P101
  optparam_24:
    .lex "$value", param_1011
.annotate 'line', 29
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("isdecl", $P103, $I101)
.annotate 'line', 28
    .return ($P105)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "namespace"  :subid("14_1310682757.39112") :method :outer("11_1310682757.39112")
    .param pmc param_1015 :optional
    .param int has_param_1015 :opt_flag
.annotate 'file', ''
.annotate 'line', 38
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    if has_param_1015, optparam_25
    new $P101, "Undef"
    set param_1015, $P101
  optparam_25:
    .lex "$value", param_1015
.annotate 'line', 39
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("namespace", $P103, $I101)
.annotate 'line', 38
    .return ($P105)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "slurpy"  :subid("15_1310682757.39112") :method :outer("11_1310682757.39112")
    .param pmc param_1019 :optional
    .param int has_param_1019 :opt_flag
.annotate 'file', ''
.annotate 'line', 49
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    if has_param_1019, optparam_26
    new $P101, "Undef"
    set param_1019, $P101
  optparam_26:
    .lex "$value", param_1019
.annotate 'line', 50
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("slurpy", $P103, $I101)
.annotate 'line', 49
    .return ($P105)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "call_sig"  :subid("16_1310682757.39112") :method :outer("11_1310682757.39112")
    .param pmc param_1023 :optional
    .param int has_param_1023 :opt_flag
.annotate 'file', ''
.annotate 'line', 60
    new $P1022, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1022, control_1021
    push_eh $P1022
    .lex "self", self
    if has_param_1023, optparam_27
    new $P101, "Undef"
    set param_1023, $P101
  optparam_27:
    .lex "$value", param_1023
.annotate 'line', 61
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("call_sig", $P103, $I101)
.annotate 'line', 60
    .return ($P105)
  control_1021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "viviself"  :subid("17_1310682757.39112") :method :outer("11_1310682757.39112")
    .param pmc param_1027 :optional
    .param int has_param_1027 :opt_flag
.annotate 'file', ''
.annotate 'line', 70
    new $P1026, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1026, control_1025
    push_eh $P1026
    .lex "self", self
    if has_param_1027, optparam_28
    new $P101, "Undef"
    set param_1027, $P101
  optparam_28:
    .lex "$value", param_1027
.annotate 'line', 71
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("viviself", $P103, $I101)
.annotate 'line', 70
    .return ($P105)
  control_1025:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "vivibase"  :subid("18_1310682757.39112") :method :outer("11_1310682757.39112")
    .param pmc param_1031 :optional
    .param int has_param_1031 :opt_flag
.annotate 'file', ''
.annotate 'line', 80
    new $P1030, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1030, control_1029
    push_eh $P1030
    .lex "self", self
    if has_param_1031, optparam_29
    new $P101, "Undef"
    set param_1031, $P101
  optparam_29:
    .lex "$value", param_1031
.annotate 'line', 81
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("vivibase", $P103, $I101)
.annotate 'line', 80
    .return ($P105)
  control_1029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "multitype"  :subid("19_1310682757.39112") :method :outer("11_1310682757.39112")
    .param pmc param_1035 :optional
    .param int has_param_1035 :opt_flag
.annotate 'file', ''
.annotate 'line', 87
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "self", self
    if has_param_1035, optparam_30
    new $P101, "Undef"
    set param_1035, $P101
  optparam_30:
    .lex "$value", param_1035
.annotate 'line', 88
    find_lex $P102, "self"
    find_lex $P103, "$value"
    find_lex $P104, "$value"
    defined $I101, $P104
    $P105 = $P102."attr"("multitype", $P103, $I101)
.annotate 'line', 87
    .return ($P105)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"Var"]
.sub "_block1037" :load :anon :subid("20_1310682757.39112")
.annotate 'file', ''
.annotate 'line', 17
    .const 'Sub' $P1039 = "11_1310682757.39112" 
    $P101 = $P1039()
    .return ($P101)
.end


.namespace []
.sub "_block1040" :load :anon :subid("21_1310682757.39112")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1042 = "10_1310682757.39112" 
    $P101 = $P1042()
    .return ($P101)
.end

