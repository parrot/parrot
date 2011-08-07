
.namespace []
.sub "_block1000"  :anon :subid("10_1312695715.17565")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312695715.17565" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 6
    .const 'Sub' $P1003 = "11_1312695715.17565" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1034 = "19_1312695715.17565" 
    .return ($P1034)
.end


.namespace []
.sub "" :load :init :subid("post20") :outer("10_1312695715.17565")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312695715.17565" 
    .local pmc block
    set block, $P1001
    $P1036 = get_root_global ["parrot"], "P6metaclass"
    $P1036."new_class"("POST::Label", "POST::Node" :named("parent"))
.end


.namespace ["POST";"Label"]
.sub "_block1002"  :subid("11_1312695715.17565") :outer("10_1312695715.17565")
.annotate 'file', ''
.annotate 'line', 6
    .const 'Sub' $P1021 = "17_1312695715.17565" 
    capture_lex $P1021
    .const 'Sub' $P1018 = "16_1312695715.17565" 
    capture_lex $P1018
    .const 'Sub' $P1015 = "15_1312695715.17565" 
    capture_lex $P1015
    .const 'Sub' $P1011 = "14_1312695715.17565" 
    capture_lex $P1011
    .const 'Sub' $P1008 = "13_1312695715.17565" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1312695715.17565" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 16
    .const 'Sub' $P1021 = "17_1312695715.17565" 
    newclosure $P1029, $P1021
.annotate 'line', 6
    .return ($P1029)
    .const 'Sub' $P1031 = "18_1312695715.17565" 
    .return ($P1031)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "declared"  :subid("12_1312695715.17565") :method :outer("11_1312695715.17565") :multi(_,_)
    .param pmc param_1007
.annotate 'file', ''
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
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "declared"  :subid("13_1312695715.17565") :method :outer("11_1312695715.17565") :multi(_)
.annotate 'file', ''
.annotate 'line', 7
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("declared", $P102, 0)
    .return ($P103)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "position"  :subid("14_1312695715.17565") :method :outer("11_1312695715.17565") :multi(_,_)
    .param pmc param_1014
.annotate 'file', ''
.annotate 'line', 10
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$param", param_1014
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("position", $P102, 1)
    .return ($P103)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "position"  :subid("15_1312695715.17565") :method :outer("11_1312695715.17565") :multi(_)
.annotate 'file', ''
.annotate 'line', 11
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
    find_lex $P101, "self"
    get_hll_global $P102, "undef"
    $P103 = $P101."attr"("position", $P102, 0)
    .return ($P103)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "type"  :subid("16_1312695715.17565") :method :outer("11_1312695715.17565") :multi(_)
.annotate 'file', ''
.annotate 'line', 14
    new $P1020, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1020, control_1019
    push_eh $P1020
    .lex "self", self
    .return ("ic")
  control_1019:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Label"]
.include "except_types.pasm"
.sub "result"  :subid("17_1312695715.17565") :method :outer("11_1312695715.17565")
    .param pmc param_1024 :optional
    .param int has_param_1024 :opt_flag
.annotate 'file', ''
.annotate 'line', 16
    new $P1023, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1023, control_1022
    push_eh $P1023
    .lex "self", self
    if has_param_1024, optparam_21
    new $P101, "Undef"
    set param_1024, $P101
  optparam_21:
    .lex "$value", param_1024
.annotate 'line', 17
    find_lex $P102, "$value"
    defined $I101, $P102
    if $I101, unless_1025_end
.annotate 'line', 18
    find_lex $P1026, "self"
    unless_null $P1026, vivify_22
    $P1026 = root_new ['parrot';'Hash']
  vivify_22:
    set $P103, $P1026["value"]
    unless_null $P103, vivify_23
    new $P103, "Undef"
  vivify_23:
    store_lex "$value", $P103
.annotate 'line', 19
    find_lex $P103, "$value"
    defined $I102, $P103
    if $I102, unless_1027_end
.annotate 'line', 20
    find_lex $P104, "self"
    find_lex $P105, "self"
    $P106 = $P105."name"()
    $P107 = $P104."unique"($P106)
    store_lex "$value", $P107
  unless_1027_end:
  unless_1025_end:
.annotate 'line', 23
    find_lex $P102, "$value"
    find_lex $P1028, "self"
    unless_null $P1028, vivify_24
    $P1028 = root_new ['parrot';'Hash']
    store_lex "self", $P1028
  vivify_24:
    set $P1028["value"], $P102
.annotate 'line', 16
    find_lex $P102, "$value"
    .return ($P102)
  control_1022:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["POST";"Label"]
.sub "_block1030" :load :anon :subid("18_1312695715.17565")
.annotate 'file', ''
.annotate 'line', 6
    .const 'Sub' $P1032 = "11_1312695715.17565" 
    $P101 = $P1032()
    .return ($P101)
.end


.namespace []
.sub "_block1033" :load :anon :subid("19_1312695715.17565")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1035 = "10_1312695715.17565" 
    $P101 = $P1035()
    .return ($P101)
.end

