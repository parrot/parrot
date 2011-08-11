
.namespace []
.sub "_block1000"  :anon :subid("10_1313083121.99053")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1313083121.99053" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 14
    .const 'Sub' $P1003 = "11_1313083121.99053" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1072 = "21_1313083121.99053" 
    .return ($P1072)
.end


.namespace []
.sub "" :load :init :subid("post22") :outer("10_1313083121.99053")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1313083121.99053" 
    .local pmc block
    set block, $P1001
    $P1074 = get_root_global ["parrot"], "P6metaclass"
    new $P103, "ResizablePMCArray"
    push $P103, "$!file"
    $P1074."new_class"("PAST::NewCompiler", "PAST::Compiler" :named("parent"), $P103 :named("attr"))
.end


.namespace ["PAST";"NewCompiler"]
.sub "_block1002"  :subid("11_1313083121.99053") :outer("10_1313083121.99053")
.annotate 'file', ''
.annotate 'line', 14
    .const 'Sub' $P1052 = "19_1313083121.99053" 
    capture_lex $P1052
    .const 'Sub' $P1042 = "18_1313083121.99053" 
    capture_lex $P1042
    .const 'Sub' $P1034 = "17_1313083121.99053" 
    capture_lex $P1034
    .const 'Sub' $P1028 = "16_1313083121.99053" 
    capture_lex $P1028
    .const 'Sub' $P1022 = "15_1313083121.99053" 
    capture_lex $P1022
    .const 'Sub' $P1017 = "14_1313083121.99053" 
    capture_lex $P1017
    .const 'Sub' $P1011 = "13_1313083121.99053" 
    capture_lex $P1011
    .const 'Sub' $P1005 = "12_1313083121.99053" 
    capture_lex $P1005
.annotate 'line', 84
    get_global $P1004, "%valtypes"
    unless_null $P1004, vivify_27
    $P1004 = root_new ['parrot';'Hash']
    set_global "%valtypes", $P1004
  vivify_27:
.annotate 'line', 14
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    get_global $P101, "%valtypes"
.annotate 'line', 91
    .const 'Sub' $P1052 = "19_1313083121.99053" 
    newclosure $P1064, $P1052
.annotate 'line', 14
    .return ($P1064)
    .const 'Sub' $P1066 = "20_1313083121.99053" 
    .return ($P1066)
.end


.namespace ["PAST";"NewCompiler"]
.sub "" :load :init :subid("post23") :outer("11_1313083121.99053")
.annotate 'file', ''
.annotate 'line', 14
    .const 'Sub' $P1003 = "11_1313083121.99053" 
    .local pmc block
    set block, $P1003
.annotate 'line', 86
    new $P102, "String"
    assign $P102, "sc"
    get_global $P1068, "%valtypes"
    unless_null $P1068, vivify_24
    $P1068 = root_new ['parrot';'Hash']
    set_global "%valtypes", $P1068
  vivify_24:
    set $P1068["String"], $P102
.annotate 'line', 87
    new $P102, "String"
    assign $P102, "ic"
    get_global $P1069, "%valtypes"
    unless_null $P1069, vivify_25
    $P1069 = root_new ['parrot';'Hash']
    set_global "%valtypes", $P1069
  vivify_25:
    set $P1069["Integer"], $P102
.annotate 'line', 88
    new $P102, "String"
    assign $P102, "nc"
    get_global $P1070, "%valtypes"
    unless_null $P1070, vivify_26
    $P1070 = root_new ['parrot';'Hash']
    set_global "%valtypes", $P1070
  vivify_26:
    set $P1070["Float"], $P102
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "super"  :subid("12_1313083121.99053") :method :outer("11_1313083121.99053")
    .param pmc param_1008
    .param pmc param_1009 :slurpy
    .param pmc param_1010 :slurpy :named
.annotate 'file', ''
.annotate 'line', 19
    new $P1007, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1007, control_1006
    push_eh $P1007
    .lex "self", self
    .lex "$method", param_1008
    .lex "@args", param_1009
    .lex "%opts", param_1010
.annotate 'line', 20
    get_hll_global $P101, ["PAST"], "Compiler"
    find_lex $P102, "$method"
    set $S101, $P102
    find_method $P103, $P101, $S101
    find_lex $P104, "self"
    find_lex $P105, "@args"
    find_lex $P106, "%opts"
    $P107 = $P103($P104, $P105 :flat, $P106 :flat)
.annotate 'line', 19
    .return ($P107)
  control_1006:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("13_1313083121.99053") :method :outer("11_1313083121.99053")
    .param pmc param_1014
    .param pmc param_1015 :slurpy :named
.annotate 'file', ''
.annotate 'line', 27
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$past", param_1014
    .lex "%options", param_1015
.annotate 'line', 28
    find_lex $P101, "self"
    getattribute $P102, $P101, "$!file"
    unless_null $P102, vivify_28
    new $P102, "Undef"
  vivify_28:
    if $P102, unless_1016_end
    get_hll_global $P103, ["POST"], "File"
    $P104 = $P103."new"()
    find_lex $P105, "self"
    setattribute $P105, "$!file", $P104
  unless_1016_end:
.annotate 'line', 29
    find_lex $P101, "self"
    getattribute $P102, $P101, "$!file"
    unless_null $P102, vivify_29
    new $P102, "Undef"
  vivify_29:
    find_lex $P103, "self"
    find_lex $P104, "$past"
    find_lex $P105, "%options"
    $P106 = $P103."super"("to_post", $P104, $P105 :flat)
    $P102."push"($P106)
.annotate 'line', 27
    find_lex $P101, "self"
    getattribute $P102, $P101, "$!file"
    unless_null $P102, vivify_30
    new $P102, "Undef"
  vivify_30:
    .return ($P102)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("14_1313083121.99053") :method :outer("11_1313083121.99053") :multi(_,_)
    .param pmc param_1020
    .param pmc param_1021 :slurpy :named
.annotate 'file', ''
.annotate 'line', 36
    new $P1019, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1019, control_1018
    push_eh $P1019
    .lex "self", self
    .lex "$node", param_1020
    .lex "%options", param_1021
.annotate 'line', 37
    find_lex $P101, "self"
    find_lex $P102, "$node"
    find_lex $P103, "%options"
    $P104 = $P101."super"("as_post", $P102, $P103 :flat)
.annotate 'line', 36
    .return ($P104)
  control_1018:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("15_1313083121.99053") :method :outer("11_1313083121.99053") :multi(_,["Integer"])
    .param pmc param_1025
    .param pmc param_1026 :slurpy :named
.annotate 'file', ''
.annotate 'line', 46
    new $P1024, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1024, control_1023
    push_eh $P1024
    .lex "self", self
    .lex "$node", param_1025
    .lex "%options", param_1026
.annotate 'line', 47
    find_lex $P101, "self"
    get_hll_global $P102, ["POST"], "Constant"
    find_lex $P103, "$node"
    $P104 = $P102."new"("ic" :named("type"), $P103 :named("value"))
    find_lex $P1027, "%options"
    unless_null $P1027, vivify_31
    $P1027 = root_new ['parrot';'Hash']
  vivify_31:
    set $P105, $P1027["rtype"]
    unless_null $P105, vivify_32
    new $P105, "Undef"
  vivify_32:
    $P106 = $P101."coerce"($P104, $P105)
.annotate 'line', 46
    .return ($P106)
  control_1023:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("16_1313083121.99053") :method :outer("11_1313083121.99053") :multi(_,["Float"])
    .param pmc param_1031
    .param pmc param_1032 :slurpy :named
.annotate 'file', ''
.annotate 'line', 51
    new $P1030, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1030, control_1029
    push_eh $P1030
    .lex "self", self
    .lex "$node", param_1031
    .lex "%options", param_1032
.annotate 'line', 52
    find_lex $P101, "self"
    get_hll_global $P102, ["POST"], "Constant"
    find_lex $P103, "$node"
    $P104 = $P102."new"("nc" :named("type"), $P103 :named("value"))
    find_lex $P1033, "%options"
    unless_null $P1033, vivify_33
    $P1033 = root_new ['parrot';'Hash']
  vivify_33:
    set $P105, $P1033["rtype"]
    unless_null $P105, vivify_34
    new $P105, "Undef"
  vivify_34:
    $P106 = $P101."coerce"($P104, $P105)
.annotate 'line', 51
    .return ($P106)
  control_1029:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("17_1313083121.99053") :method :outer("11_1313083121.99053") :multi(_,["String"])
    .param pmc param_1037
    .param pmc param_1038 :slurpy :named
.annotate 'file', ''
.annotate 'line', 56
    new $P1036, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1036, control_1035
    push_eh $P1036
    .lex "self", self
    .lex "$node", param_1037
    .lex "%options", param_1038
.annotate 'line', 57
    new $P101, "Undef"
    set $P1039, $P101
    .lex "$escaped", $P1039
.annotate 'line', 58
    new $P102, "Undef"
    set $P1040, $P102
    .lex "$encoding", $P1040
.annotate 'line', 57
    find_lex $P103, "$node"
    set $S101, $P103
    escape $S102, $S101
    new $P104, 'String'
    set $P104, $S102
    store_lex "$escaped", $P104
.annotate 'line', 58
    find_lex $P103, "$node"
    set $S101, $P103
    encoding $I101, $S101
    encodingname $S102, $I101
    new $P104, 'String'
    set $P104, $S102
    store_lex "$encoding", $P104
.annotate 'line', 59
    find_lex $P103, "self"
    get_hll_global $P104, ["POST"], "String"
    find_lex $P105, "$escaped"
    find_lex $P106, "$encoding"
    $P107 = $P104."new"("sc" :named("type"), $P105 :named("value"), $P106 :named("encoding"), "ascii" :named("charset"))
    find_lex $P1041, "%options"
    unless_null $P1041, vivify_35
    $P1041 = root_new ['parrot';'Hash']
  vivify_35:
    set $P108, $P1041["rtype"]
    unless_null $P108, vivify_36
    new $P108, "Undef"
  vivify_36:
    $P109 = $P103."coerce"($P107, $P108)
.annotate 'line', 56
    .return ($P109)
  control_1035:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("18_1313083121.99053") :method :outer("11_1313083121.99053") :multi(_,["PAST";"Block"])
    .param pmc param_1045
    .param pmc param_1046 :slurpy :named
.annotate 'file', ''
.annotate 'line', 68
    new $P1044, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1044, control_1043
    push_eh $P1044
    .lex "self", self
    .lex "$node", param_1045
    .lex "%options", param_1046
.annotate 'line', 69
    new $P101, "Undef"
    set $P1047, $P101
    .lex "$post", $P1047
.annotate 'line', 70
    new $P102, "Undef"
    set $P1048, $P102
    .lex "$flags", $P1048
.annotate 'line', 69
    find_lex $P103, "self"
    find_lex $P104, "$node"
    find_lex $P105, "%options"
    $P106 = $P103."super"("as_post", $P104, $P105 :flat)
    store_lex "$post", $P106
.annotate 'line', 70
    find_lex $P103, "$node"
    $P104 = $P103."pirflags"()
    store_lex "$flags", $P104
.annotate 'line', 71
    find_lex $P103, "$flags"
    set $S101, $P103
    index $I101, $S101, ":main"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1049_end
    find_lex $P104, "$post"
    $P104."main"(1)
  if_1049_end:
.annotate 'line', 72
    find_lex $P103, "$flags"
    set $S101, $P103
    index $I101, $S101, ":init"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1050_end
    find_lex $P104, "$post"
    $P104."init"(1)
  if_1050_end:
.annotate 'line', 73
    find_lex $P103, "$flags"
    set $S101, $P103
    index $I101, $S101, ":load"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1051_end
    find_lex $P104, "$post"
    $P104."load"(1)
  if_1051_end:
.annotate 'line', 74
    find_lex $P103, "self"
    getattribute $P104, $P103, "$!file"
    unless_null $P104, vivify_37
    new $P104, "Undef"
  vivify_37:
    find_lex $P105, "$post"
    $P104."push"($P105)
.annotate 'line', 76
    new $P103, "Exception"
    set $P103['type'], .CONTROL_RETURN
    get_hll_global $P104, ["POST"], "Ops"
    $P105 = $P104."new"()
    setattribute $P103, 'payload', $P105
    throw $P103
.annotate 'line', 68
    .return ()
  control_1043:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("19_1313083121.99053") :method :outer("11_1313083121.99053") :multi(_,["PAST";"Val"])
    .param pmc param_1055
    .param pmc param_1056 :slurpy :named
.annotate 'file', ''
.annotate 'line', 91
    new $P1054, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1054, control_1053
    push_eh $P1054
    .lex "self", self
    .lex "$node", param_1055
    .lex "%options", param_1056
.annotate 'line', 92
    new $P101, "Undef"
    set $P1057, $P101
    .lex "$returns", $P1057
.annotate 'line', 93
    new $P102, "Undef"
    set $P1058, $P102
    .lex "$type", $P1058
.annotate 'line', 102
    new $P103, "Undef"
    set $P1059, $P103
    .lex "$const", $P1059
.annotate 'line', 92
    find_lex $P104, "$node"
    $P105 = $P104."returns"()
    store_lex "$returns", $P105
.annotate 'line', 93
    find_lex $P104, "$returns"
    get_global $P1060, "%valtypes"
    unless_null $P1060, vivify_38
    $P1060 = root_new ['parrot';'Hash']
  vivify_38:
    set $P105, $P1060[$P104]
    unless_null $P105, vivify_39
    new $P105, "Undef"
  vivify_39:
    store_lex "$type", $P105
.annotate 'line', 96
    find_lex $P104, "$type"
    if $P104, unless_1061_end
    new $P105, "Exception"
    set $P105['type'], .CONTROL_RETURN
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."super"("as_post", $P107, $P108 :flat)
    setattribute $P105, 'payload', $P109
    throw $P105
  unless_1061_end:
.annotate 'line', 99
    find_lex $P104, "$type"
    set $S101, $P104
    iseq $I101, $S101, "sc"
    unless $I101, if_1062_end
    new $P105, "Exception"
    set $P105['type'], .CONTROL_RETURN
    find_lex $P106, "self"
    find_lex $P107, "$node"
    $P108 = $P107."value"()
    set $S102, $P108
    find_lex $P109, "%options"
    $P110 = $P106."as_post"($S102, $P109 :flat)
    setattribute $P105, 'payload', $P110
    throw $P105
  if_1062_end:
.annotate 'line', 102
    get_hll_global $P104, ["POST"], "Constant"
    find_lex $P105, "$type"
    find_lex $P106, "$node"
    $P107 = $P106."value"()
    $P108 = $P104."new"($P105 :named("type"), $P107 :named("value"))
    store_lex "$const", $P108
.annotate 'line', 103
    new $P104, "Exception"
    set $P104['type'], .CONTROL_RETURN
    find_lex $P105, "self"
    find_lex $P106, "$const"
    find_lex $P1063, "%options"
    unless_null $P1063, vivify_40
    $P1063 = root_new ['parrot';'Hash']
  vivify_40:
    set $P107, $P1063["rtype"]
    unless_null $P107, vivify_41
    new $P107, "Undef"
  vivify_41:
    $P108 = $P105."coerce"($P106, $P107)
    setattribute $P104, 'payload', $P108
    throw $P104
.annotate 'line', 91
    .return ()
  control_1053:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"NewCompiler"]
.sub "_block1065" :load :anon :subid("20_1313083121.99053")
.annotate 'file', ''
.annotate 'line', 14
    .const 'Sub' $P1067 = "11_1313083121.99053" 
    $P101 = $P1067()
    .return ($P101)
.end


.namespace []
.sub "_block1071" :load :anon :subid("21_1313083121.99053")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1073 = "10_1313083121.99053" 
    $P101 = $P1073()
    .return ($P101)
.end

