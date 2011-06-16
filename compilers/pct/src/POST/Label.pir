
.namespace []
.sub "_block1000"  :anon :subid("10_1308206295.40495")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206295.40495" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 6
    .const 'Sub' $P1003 = "11_1308206295.40495" 
    capture_lex $P1003
    $P132 = $P1003()
.annotate 'line', 1
    .return ($P132)
    .const 'Sub' $P1034 = "19_1308206295.40495" 
    .return ($P1034)
.end


.namespace []
.sub "" :load :init :subid("post20") :outer("10_1308206295.40495")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206295.40495" 
    .local pmc block
    set block, $P1001
    $P1036 = get_root_global ["parrot"], "P6metaclass"
    $P1036."new_class"("POST::Label", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Label"]
.sub "_block1002"  :subid("11_1308206295.40495") :outer("10_1308206295.40495")
.annotate 'line', 6
    .const 'Sub' $P1021 = "17_1308206295.40495" 
    capture_lex $P1021
    .const 'Sub' $P1018 = "16_1308206295.40495" 
    capture_lex $P1018
    .const 'Sub' $P1015 = "15_1308206295.40495" 
    capture_lex $P1015
    .const 'Sub' $P1011 = "14_1308206295.40495" 
    capture_lex $P1011
    .const 'Sub' $P1008 = "13_1308206295.40495" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308206295.40495" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1021 = "17_1308206295.40495" 
    newclosure $P1029, $P1021
.annotate 'line', 6
    .return ($P1029)
    .const 'Sub' $P1031 = "18_1308206295.40495" 
    .return ($P1031)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "declared"  :subid("12_1308206295.40495") :method :outer("11_1308206295.40495") :multi(_,_)
    .param pmc param_1007
.annotate 'line', 6
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    .lex "$param", param_1007
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("declared", $P102, 1)
    .return ($P103)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "declared"  :subid("13_1308206295.40495") :method :outer("11_1308206295.40495") :multi(_)
.annotate 'line', 7
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    find_lex $P105, "self"
    get_hll_global $P106, "undef"
    $P107 = $P105."attr"("declared", $P106, 0)
    .return ($P107)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "position"  :subid("14_1308206295.40495") :method :outer("11_1308206295.40495") :multi(_,_)
    .param pmc param_1014
.annotate 'line', 10
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$param", param_1014
    find_lex $P109, "self"
    find_lex $P110, "$param"
    $P111 = $P109."attr"("position", $P110, 1)
    .return ($P111)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "position"  :subid("15_1308206295.40495") :method :outer("11_1308206295.40495") :multi(_)
.annotate 'line', 11
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
    find_lex $P113, "self"
    get_hll_global $P114, "undef"
    $P115 = $P113."attr"("position", $P114, 0)
    .return ($P115)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "type"  :subid("16_1308206295.40495") :method :outer("11_1308206295.40495") :multi(_)
.annotate 'line', 14
    new $P1020, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1020, control_1019
    push_eh $P1020
    .lex "self", self
    .return ("ic")
  control_1019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P117, exception, "payload"
    .return ($P117)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "result"  :subid("17_1308206295.40495") :method :outer("11_1308206295.40495")
    .param pmc param_1024 :optional
    .param int has_param_1024 :opt_flag
.annotate 'line', 16
    new $P1023, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1023, control_1022
    push_eh $P1023
    .lex "self", self
    if has_param_1024, optparam_21
    new $P118, "Undef"
    set param_1024, $P118
  optparam_21:
    .lex "$value", param_1024
.annotate 'line', 17
    find_lex $P119, "$value"
    defined $I120, $P119
    if $I120, unless_1025_end
.annotate 'line', 18
    find_lex $P1026, "self"
    unless_null $P1026, vivify_22
    $P1026 = root_new ['parrot';'Hash']
  vivify_22:
    set $P121, $P1026["value"]
    unless_null $P121, vivify_23
    new $P121, "Undef"
  vivify_23:
    store_lex "$value", $P121
.annotate 'line', 19
    find_lex $P122, "$value"
    defined $I123, $P122
    if $I123, unless_1027_end
.annotate 'line', 20
    find_lex $P124, "self"
    find_lex $P125, "self"
    $P126 = $P125."name"()
    $P127 = $P124."unique"($P126)
    store_lex "$value", $P127
  unless_1027_end:
  unless_1025_end:
.annotate 'line', 23
    find_lex $P128, "$value"
    find_lex $P1028, "self"
    unless_null $P1028, vivify_24
    $P1028 = root_new ['parrot';'Hash']
    store_lex "self", $P1028
  vivify_24:
    set $P1028["value"], $P128
    find_lex $P129, "$value"
.annotate 'line', 16
    .return ($P129)
  control_1022:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, "payload"
    .return ($P130)
.end


.namespace ["POST";"Label"]
.sub "_block1030" :load :anon :subid("18_1308206295.40495")
.annotate 'line', 6
    .const 'Sub' $P1032 = "11_1308206295.40495" 
    $P131 = $P1032()
    .return ($P131)
.end


.namespace []
.sub "_block1033" :load :anon :subid("19_1308206295.40495")
.annotate 'line', 1
    .const 'Sub' $P1035 = "10_1308206295.40495" 
    $P133 = $P1035()
    .return ($P133)
.end

