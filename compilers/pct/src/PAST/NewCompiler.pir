
.namespace []
.sub "_block1000"  :anon :subid("10_1313083702.99732")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1313083702.99732" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 14
    .const 'Sub' $P1003 = "11_1313083702.99732" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1075 = "21_1313083702.99732" 
    .return ($P1075)
.end


.namespace []
.sub "" :load :init :subid("post22") :outer("10_1313083702.99732")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1313083702.99732" 
    .local pmc block
    set block, $P1001
    $P1077 = get_root_global ["parrot"], "P6metaclass"
    new $P103, "ResizablePMCArray"
    push $P103, "$!file"
    $P1077."new_class"("PAST::NewCompiler", "PAST::Compiler" :named("parent"), $P103 :named("attr"))
.end


.namespace ["PAST";"NewCompiler"]
.sub "_block1002"  :subid("11_1313083702.99732") :outer("10_1313083702.99732")
.annotate 'file', ''
.annotate 'line', 14
    .const 'Sub' $P1055 = "19_1313083702.99732" 
    capture_lex $P1055
    .const 'Sub' $P1045 = "18_1313083702.99732" 
    capture_lex $P1045
    .const 'Sub' $P1037 = "17_1313083702.99732" 
    capture_lex $P1037
    .const 'Sub' $P1031 = "16_1313083702.99732" 
    capture_lex $P1031
    .const 'Sub' $P1025 = "15_1313083702.99732" 
    capture_lex $P1025
    .const 'Sub' $P1020 = "14_1313083702.99732" 
    capture_lex $P1020
    .const 'Sub' $P1011 = "13_1313083702.99732" 
    capture_lex $P1011
    .const 'Sub' $P1005 = "12_1313083702.99732" 
    capture_lex $P1005
.annotate 'line', 88
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
.annotate 'line', 95
    .const 'Sub' $P1055 = "19_1313083702.99732" 
    newclosure $P1067, $P1055
.annotate 'line', 14
    .return ($P1067)
    .const 'Sub' $P1069 = "20_1313083702.99732" 
    .return ($P1069)
.end


.namespace ["PAST";"NewCompiler"]
.sub "" :load :init :subid("post23") :outer("11_1313083702.99732")
.annotate 'file', ''
.annotate 'line', 14
    .const 'Sub' $P1003 = "11_1313083702.99732" 
    .local pmc block
    set block, $P1003
.annotate 'line', 90
    new $P102, "String"
    assign $P102, "sc"
    get_global $P1071, "%valtypes"
    unless_null $P1071, vivify_24
    $P1071 = root_new ['parrot';'Hash']
    set_global "%valtypes", $P1071
  vivify_24:
    set $P1071["String"], $P102
.annotate 'line', 91
    new $P102, "String"
    assign $P102, "ic"
    get_global $P1072, "%valtypes"
    unless_null $P1072, vivify_25
    $P1072 = root_new ['parrot';'Hash']
    set_global "%valtypes", $P1072
  vivify_25:
    set $P1072["Integer"], $P102
.annotate 'line', 92
    new $P102, "String"
    assign $P102, "nc"
    get_global $P1073, "%valtypes"
    unless_null $P1073, vivify_26
    $P1073 = root_new ['parrot';'Hash']
    set_global "%valtypes", $P1073
  vivify_26:
    set $P1073["Float"], $P102
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "super"  :subid("12_1313083702.99732") :method :outer("11_1313083702.99732")
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
.sub "to_post"  :subid("13_1313083702.99732") :method :outer("11_1313083702.99732")
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
.annotate 'line', 29
    new $P101, "Undef"
    set $P1016, $P101
    .lex "$anon", $P1016
.annotate 'line', 28
    find_lex $P102, "self"
    getattribute $P103, $P102, "$!file"
    unless_null $P103, vivify_28
    new $P103, "Undef"
  vivify_28:
    if $P103, unless_1017_end
    get_hll_global $P104, ["POST"], "File"
    $P105 = $P104."new"()
    find_lex $P106, "self"
    setattribute $P106, "$!file", $P105
  unless_1017_end:
.annotate 'line', 29
    find_lex $P102, "self"
    find_lex $P103, "$past"
    find_lex $P104, "%options"
    $P105 = $P102."super"("to_post", $P103, $P104 :flat)
    store_lex "$anon", $P105
.annotate 'line', 30
    get_hll_global $P103, ["POST"], "Ops"
    find_lex $P104, "$anon"
    $P105 = $P103."ACCEPTS"($P104)
    if $P105, if_1019
    set $P102, $P105
    goto if_1019_end
  if_1019:
    find_lex $P106, "$anon"
    elements $I101, $P106
    set $N101, $I101
    iseq $I102, $N101, 0.0
    new $P102, 'Integer'
    set $P102, $I102
  if_1019_end:
    if $P102, unless_1018_end
.annotate 'line', 32
    find_lex $P107, "self"
    getattribute $P108, $P107, "$!file"
    unless_null $P108, vivify_29
    new $P108, "Undef"
  vivify_29:
    get_hll_global $P109, ["POST"], "Sub"
    find_lex $P110, "$anon"
    $P111 = $P109."new"($P110, "anon" :named("name"))
    $P108."push"($P111)
  unless_1018_end:
.annotate 'line', 27
    find_lex $P102, "self"
    getattribute $P103, $P102, "$!file"
    unless_null $P103, vivify_30
    new $P103, "Undef"
  vivify_30:
    .return ($P103)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P102, exception, "payload"
    .return ($P102)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("14_1313083702.99732") :method :outer("11_1313083702.99732") :multi(_,_)
    .param pmc param_1023
    .param pmc param_1024 :slurpy :named
.annotate 'file', ''
.annotate 'line', 40
    new $P1022, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1022, control_1021
    push_eh $P1022
    .lex "self", self
    .lex "$node", param_1023
    .lex "%options", param_1024
.annotate 'line', 41
    find_lex $P101, "self"
    find_lex $P102, "$node"
    find_lex $P103, "%options"
    $P104 = $P101."super"("as_post", $P102, $P103 :flat)
.annotate 'line', 40
    .return ($P104)
  control_1021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("15_1313083702.99732") :method :outer("11_1313083702.99732") :multi(_,["Integer"])
    .param pmc param_1028
    .param pmc param_1029 :slurpy :named
.annotate 'file', ''
.annotate 'line', 50
    new $P1027, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1027, control_1026
    push_eh $P1027
    .lex "self", self
    .lex "$node", param_1028
    .lex "%options", param_1029
.annotate 'line', 51
    find_lex $P101, "self"
    get_hll_global $P102, ["POST"], "Constant"
    find_lex $P103, "$node"
    $P104 = $P102."new"("ic" :named("type"), $P103 :named("value"))
    find_lex $P1030, "%options"
    unless_null $P1030, vivify_31
    $P1030 = root_new ['parrot';'Hash']
  vivify_31:
    set $P105, $P1030["rtype"]
    unless_null $P105, vivify_32
    new $P105, "Undef"
  vivify_32:
    $P106 = $P101."coerce"($P104, $P105)
.annotate 'line', 50
    .return ($P106)
  control_1026:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("16_1313083702.99732") :method :outer("11_1313083702.99732") :multi(_,["Float"])
    .param pmc param_1034
    .param pmc param_1035 :slurpy :named
.annotate 'file', ''
.annotate 'line', 55
    new $P1033, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1033, control_1032
    push_eh $P1033
    .lex "self", self
    .lex "$node", param_1034
    .lex "%options", param_1035
.annotate 'line', 56
    find_lex $P101, "self"
    get_hll_global $P102, ["POST"], "Constant"
    find_lex $P103, "$node"
    $P104 = $P102."new"("nc" :named("type"), $P103 :named("value"))
    find_lex $P1036, "%options"
    unless_null $P1036, vivify_33
    $P1036 = root_new ['parrot';'Hash']
  vivify_33:
    set $P105, $P1036["rtype"]
    unless_null $P105, vivify_34
    new $P105, "Undef"
  vivify_34:
    $P106 = $P101."coerce"($P104, $P105)
.annotate 'line', 55
    .return ($P106)
  control_1032:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("17_1313083702.99732") :method :outer("11_1313083702.99732") :multi(_,["String"])
    .param pmc param_1040
    .param pmc param_1041 :slurpy :named
.annotate 'file', ''
.annotate 'line', 60
    new $P1039, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1039, control_1038
    push_eh $P1039
    .lex "self", self
    .lex "$node", param_1040
    .lex "%options", param_1041
.annotate 'line', 61
    new $P101, "Undef"
    set $P1042, $P101
    .lex "$escaped", $P1042
.annotate 'line', 62
    new $P102, "Undef"
    set $P1043, $P102
    .lex "$encoding", $P1043
.annotate 'line', 61
    find_lex $P103, "$node"
    set $S101, $P103
    escape $S102, $S101
    new $P104, 'String'
    set $P104, $S102
    store_lex "$escaped", $P104
.annotate 'line', 62
    find_lex $P103, "$node"
    set $S101, $P103
    encoding $I101, $S101
    encodingname $S102, $I101
    new $P104, 'String'
    set $P104, $S102
    store_lex "$encoding", $P104
.annotate 'line', 63
    find_lex $P103, "self"
    get_hll_global $P104, ["POST"], "String"
    find_lex $P105, "$escaped"
    find_lex $P106, "$encoding"
    $P107 = $P104."new"("sc" :named("type"), $P105 :named("value"), $P106 :named("encoding"), "ascii" :named("charset"))
    find_lex $P1044, "%options"
    unless_null $P1044, vivify_35
    $P1044 = root_new ['parrot';'Hash']
  vivify_35:
    set $P108, $P1044["rtype"]
    unless_null $P108, vivify_36
    new $P108, "Undef"
  vivify_36:
    $P109 = $P103."coerce"($P107, $P108)
.annotate 'line', 60
    .return ($P109)
  control_1038:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("18_1313083702.99732") :method :outer("11_1313083702.99732") :multi(_,["PAST";"Block"])
    .param pmc param_1048
    .param pmc param_1049 :slurpy :named
.annotate 'file', ''
.annotate 'line', 72
    new $P1047, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1047, control_1046
    push_eh $P1047
    .lex "self", self
    .lex "$node", param_1048
    .lex "%options", param_1049
.annotate 'line', 73
    new $P101, "Undef"
    set $P1050, $P101
    .lex "$post", $P1050
.annotate 'line', 74
    new $P102, "Undef"
    set $P1051, $P102
    .lex "$flags", $P1051
.annotate 'line', 73
    find_lex $P103, "self"
    find_lex $P104, "$node"
    find_lex $P105, "%options"
    $P106 = $P103."super"("as_post", $P104, $P105 :flat)
    store_lex "$post", $P106
.annotate 'line', 74
    find_lex $P103, "$node"
    $P104 = $P103."pirflags"()
    store_lex "$flags", $P104
.annotate 'line', 75
    find_lex $P103, "$flags"
    set $S101, $P103
    index $I101, $S101, ":main"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1052_end
    find_lex $P104, "$post"
    $P104."main"(1)
  if_1052_end:
.annotate 'line', 76
    find_lex $P103, "$flags"
    set $S101, $P103
    index $I101, $S101, ":init"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1053_end
    find_lex $P104, "$post"
    $P104."init"(1)
  if_1053_end:
.annotate 'line', 77
    find_lex $P103, "$flags"
    set $S101, $P103
    index $I101, $S101, ":load"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1054_end
    find_lex $P104, "$post"
    $P104."load"(1)
  if_1054_end:
.annotate 'line', 78
    find_lex $P103, "self"
    getattribute $P104, $P103, "$!file"
    unless_null $P104, vivify_37
    new $P104, "Undef"
  vivify_37:
    find_lex $P105, "$post"
    $P104."push"($P105)
.annotate 'line', 80
    new $P103, "Exception"
    set $P103['type'], .CONTROL_RETURN
    get_hll_global $P104, ["POST"], "Ops"
    $P105 = $P104."new"()
    setattribute $P103, 'payload', $P105
    throw $P103
.annotate 'line', 72
    .return ()
  control_1046:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("19_1313083702.99732") :method :outer("11_1313083702.99732") :multi(_,["PAST";"Val"])
    .param pmc param_1058
    .param pmc param_1059 :slurpy :named
.annotate 'file', ''
.annotate 'line', 95
    new $P1057, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1057, control_1056
    push_eh $P1057
    .lex "self", self
    .lex "$node", param_1058
    .lex "%options", param_1059
.annotate 'line', 96
    new $P101, "Undef"
    set $P1060, $P101
    .lex "$returns", $P1060
.annotate 'line', 97
    new $P102, "Undef"
    set $P1061, $P102
    .lex "$type", $P1061
.annotate 'line', 106
    new $P103, "Undef"
    set $P1062, $P103
    .lex "$const", $P1062
.annotate 'line', 96
    find_lex $P104, "$node"
    $P105 = $P104."returns"()
    store_lex "$returns", $P105
.annotate 'line', 97
    find_lex $P104, "$returns"
    get_global $P1063, "%valtypes"
    unless_null $P1063, vivify_38
    $P1063 = root_new ['parrot';'Hash']
  vivify_38:
    set $P105, $P1063[$P104]
    unless_null $P105, vivify_39
    new $P105, "Undef"
  vivify_39:
    store_lex "$type", $P105
.annotate 'line', 100
    find_lex $P104, "$type"
    if $P104, unless_1064_end
    new $P105, "Exception"
    set $P105['type'], .CONTROL_RETURN
    find_lex $P106, "self"
    find_lex $P107, "$node"
    find_lex $P108, "%options"
    $P109 = $P106."super"("as_post", $P107, $P108 :flat)
    setattribute $P105, 'payload', $P109
    throw $P105
  unless_1064_end:
.annotate 'line', 103
    find_lex $P104, "$type"
    set $S101, $P104
    iseq $I101, $S101, "sc"
    unless $I101, if_1065_end
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
  if_1065_end:
.annotate 'line', 106
    get_hll_global $P104, ["POST"], "Constant"
    find_lex $P105, "$type"
    find_lex $P106, "$node"
    $P107 = $P106."value"()
    $P108 = $P104."new"($P105 :named("type"), $P107 :named("value"))
    store_lex "$const", $P108
.annotate 'line', 107
    new $P104, "Exception"
    set $P104['type'], .CONTROL_RETURN
    find_lex $P105, "self"
    find_lex $P106, "$const"
    find_lex $P1066, "%options"
    unless_null $P1066, vivify_40
    $P1066 = root_new ['parrot';'Hash']
  vivify_40:
    set $P107, $P1066["rtype"]
    unless_null $P107, vivify_41
    new $P107, "Undef"
  vivify_41:
    $P108 = $P105."coerce"($P106, $P107)
    setattribute $P104, 'payload', $P108
    throw $P104
.annotate 'line', 95
    .return ()
  control_1056:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["PAST";"NewCompiler"]
.sub "_block1068" :load :anon :subid("20_1313083702.99732")
.annotate 'file', ''
.annotate 'line', 14
    .const 'Sub' $P1070 = "11_1313083702.99732" 
    $P101 = $P1070()
    .return ($P101)
.end


.namespace []
.sub "_block1074" :load :anon :subid("21_1313083702.99732")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1076 = "10_1313083702.99732" 
    $P101 = $P1076()
    .return ($P101)
.end

