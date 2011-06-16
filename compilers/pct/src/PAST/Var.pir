
.namespace []
.sub "_block1000"  :anon :subid("10_1308206311.08466")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206311.08466" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 17
    .const 'Sub' $P1003 = "11_1308206311.08466" 
    capture_lex $P1003
    $P158 = $P1003()
.annotate 'line', 1
    .return ($P158)
    .const 'Sub' $P1041 = "21_1308206311.08466" 
    .return ($P1041)
.end


.namespace []
.sub "" :load :init :subid("post22") :outer("10_1308206311.08466")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206311.08466" 
    .local pmc block
    set block, $P1001
    $P1043 = get_root_global ["parrot"], "P6metaclass"
    $P1043."new_class"("PAST::Var", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Var"]
.sub "_block1002"  :subid("11_1308206311.08466") :outer("10_1308206311.08466")
.annotate 'line', 17
    .const 'Sub' $P1032 = "19_1308206311.08466" 
    capture_lex $P1032
    .const 'Sub' $P1028 = "18_1308206311.08466" 
    capture_lex $P1028
    .const 'Sub' $P1024 = "17_1308206311.08466" 
    capture_lex $P1024
    .const 'Sub' $P1020 = "16_1308206311.08466" 
    capture_lex $P1020
    .const 'Sub' $P1016 = "15_1308206311.08466" 
    capture_lex $P1016
    .const 'Sub' $P1012 = "14_1308206311.08466" 
    capture_lex $P1012
    .const 'Sub' $P1008 = "13_1308206311.08466" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308206311.08466" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 87
    .const 'Sub' $P1032 = "19_1308206311.08466" 
    newclosure $P1036, $P1032
.annotate 'line', 17
    .return ($P1036)
    .const 'Sub' $P1038 = "20_1308206311.08466" 
    .return ($P1038)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "scope"  :subid("12_1308206311.08466") :method :outer("11_1308206311.08466")
    .param pmc param_1007 :optional
    .param int has_param_1007 :opt_flag
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
    defined $I105, $P104
    $P106 = $P102."attr"("scope", $P103, $I105)
.annotate 'line', 17
    .return ($P106)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P107, exception, "payload"
    .return ($P107)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "isdecl"  :subid("13_1308206311.08466") :method :outer("11_1308206311.08466")
    .param pmc param_1011 :optional
    .param int has_param_1011 :opt_flag
.annotate 'line', 28
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    if has_param_1011, optparam_24
    new $P108, "Undef"
    set param_1011, $P108
  optparam_24:
    .lex "$value", param_1011
.annotate 'line', 29
    find_lex $P109, "self"
    find_lex $P110, "$value"
    find_lex $P111, "$value"
    defined $I112, $P111
    $P113 = $P109."attr"("isdecl", $P110, $I112)
.annotate 'line', 28
    .return ($P113)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P114, exception, "payload"
    .return ($P114)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "namespace"  :subid("14_1308206311.08466") :method :outer("11_1308206311.08466")
    .param pmc param_1015 :optional
    .param int has_param_1015 :opt_flag
.annotate 'line', 38
    new $P1014, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1014, control_1013
    push_eh $P1014
    .lex "self", self
    if has_param_1015, optparam_25
    new $P115, "Undef"
    set param_1015, $P115
  optparam_25:
    .lex "$value", param_1015
.annotate 'line', 39
    find_lex $P116, "self"
    find_lex $P117, "$value"
    find_lex $P118, "$value"
    defined $I119, $P118
    $P120 = $P116."attr"("namespace", $P117, $I119)
.annotate 'line', 38
    .return ($P120)
  control_1013:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P121, exception, "payload"
    .return ($P121)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "slurpy"  :subid("15_1308206311.08466") :method :outer("11_1308206311.08466")
    .param pmc param_1019 :optional
    .param int has_param_1019 :opt_flag
.annotate 'line', 49
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    if has_param_1019, optparam_26
    new $P122, "Undef"
    set param_1019, $P122
  optparam_26:
    .lex "$value", param_1019
.annotate 'line', 50
    find_lex $P123, "self"
    find_lex $P124, "$value"
    find_lex $P125, "$value"
    defined $I126, $P125
    $P127 = $P123."attr"("slurpy", $P124, $I126)
.annotate 'line', 49
    .return ($P127)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P128, exception, "payload"
    .return ($P128)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "call_sig"  :subid("16_1308206311.08466") :method :outer("11_1308206311.08466")
    .param pmc param_1023 :optional
    .param int has_param_1023 :opt_flag
.annotate 'line', 60
    new $P1022, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1022, control_1021
    push_eh $P1022
    .lex "self", self
    if has_param_1023, optparam_27
    new $P129, "Undef"
    set param_1023, $P129
  optparam_27:
    .lex "$value", param_1023
.annotate 'line', 61
    find_lex $P130, "self"
    find_lex $P131, "$value"
    find_lex $P132, "$value"
    defined $I133, $P132
    $P134 = $P130."attr"("call_sig", $P131, $I133)
.annotate 'line', 60
    .return ($P134)
  control_1021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P135, exception, "payload"
    .return ($P135)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "viviself"  :subid("17_1308206311.08466") :method :outer("11_1308206311.08466")
    .param pmc param_1027 :optional
    .param int has_param_1027 :opt_flag
.annotate 'line', 70
    new $P1026, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1026, control_1025
    push_eh $P1026
    .lex "self", self
    if has_param_1027, optparam_28
    new $P136, "Undef"
    set param_1027, $P136
  optparam_28:
    .lex "$value", param_1027
.annotate 'line', 71
    find_lex $P137, "self"
    find_lex $P138, "$value"
    find_lex $P139, "$value"
    defined $I140, $P139
    $P141 = $P137."attr"("viviself", $P138, $I140)
.annotate 'line', 70
    .return ($P141)
  control_1025:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P142, exception, "payload"
    .return ($P142)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "vivibase"  :subid("18_1308206311.08466") :method :outer("11_1308206311.08466")
    .param pmc param_1031 :optional
    .param int has_param_1031 :opt_flag
.annotate 'line', 80
    new $P1030, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1030, control_1029
    push_eh $P1030
    .lex "self", self
    if has_param_1031, optparam_29
    new $P143, "Undef"
    set param_1031, $P143
  optparam_29:
    .lex "$value", param_1031
.annotate 'line', 81
    find_lex $P144, "self"
    find_lex $P145, "$value"
    find_lex $P146, "$value"
    defined $I147, $P146
    $P148 = $P144."attr"("vivibase", $P145, $I147)
.annotate 'line', 80
    .return ($P148)
  control_1029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P149, exception, "payload"
    .return ($P149)
.end


.namespace ["PAST";"Var"]
.include "except_types.pasm"
.sub "multitype"  :subid("19_1308206311.08466") :method :outer("11_1308206311.08466")
    .param pmc param_1035 :optional
    .param int has_param_1035 :opt_flag
.annotate 'line', 87
    new $P1034, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1034, control_1033
    push_eh $P1034
    .lex "self", self
    if has_param_1035, optparam_30
    new $P150, "Undef"
    set param_1035, $P150
  optparam_30:
    .lex "$value", param_1035
.annotate 'line', 88
    find_lex $P151, "self"
    find_lex $P152, "$value"
    find_lex $P153, "$value"
    defined $I154, $P153
    $P155 = $P151."attr"("multitype", $P152, $I154)
.annotate 'line', 87
    .return ($P155)
  control_1033:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P156, exception, "payload"
    .return ($P156)
.end


.namespace ["PAST";"Var"]
.sub "_block1037" :load :anon :subid("20_1308206311.08466")
.annotate 'line', 17
    .const 'Sub' $P1039 = "11_1308206311.08466" 
    $P157 = $P1039()
    .return ($P157)
.end


.namespace []
.sub "_block1040" :load :anon :subid("21_1308206311.08466")
.annotate 'line', 1
    .const 'Sub' $P1042 = "10_1308206311.08466" 
    $P159 = $P1042()
    .return ($P159)
.end

