
.namespace []
.sub "_block1000"  :anon :subid("10_1312496524.56246")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1312496524.56246" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 14
    .const 'Sub' $P1003 = "11_1312496524.56246" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1056 = "20_1312496524.56246" 
    .return ($P1056)
.end


.namespace []
.sub "" :load :init :subid("post21") :outer("10_1312496524.56246")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1312496524.56246" 
    .local pmc block
    set block, $P1001
    $P1058 = get_root_global ["parrot"], "P6metaclass"
    new $P103, "ResizablePMCArray"
    push $P103, "$!file"
    $P1058."new_class"("PAST::NewCompiler", "PAST::Compiler" :named("parent"), $P103 :named("attr"))
.end


.namespace ["PAST";"NewCompiler"]
.sub "_block1002"  :subid("11_1312496524.56246") :outer("10_1312496524.56246")
.annotate 'file', ''
.annotate 'line', 14
    .const 'Sub' $P1041 = "18_1312496524.56246" 
    capture_lex $P1041
    .const 'Sub' $P1033 = "17_1312496524.56246" 
    capture_lex $P1033
    .const 'Sub' $P1027 = "16_1312496524.56246" 
    capture_lex $P1027
    .const 'Sub' $P1021 = "15_1312496524.56246" 
    capture_lex $P1021
    .const 'Sub' $P1016 = "14_1312496524.56246" 
    capture_lex $P1016
    .const 'Sub' $P1010 = "13_1312496524.56246" 
    capture_lex $P1010
    .const 'Sub' $P1004 = "12_1312496524.56246" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 68
    .const 'Sub' $P1041 = "18_1312496524.56246" 
    newclosure $P1051, $P1041
.annotate 'line', 14
    .return ($P1051)
    .const 'Sub' $P1053 = "19_1312496524.56246" 
    .return ($P1053)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "super"  :subid("12_1312496524.56246") :method :outer("11_1312496524.56246")
    .param pmc param_1007
    .param pmc param_1008 :slurpy
    .param pmc param_1009 :slurpy :named
.annotate 'file', ''
.annotate 'line', 19
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    .lex "$method", param_1007
    .lex "@args", param_1008
    .lex "%opts", param_1009
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
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "to_post"  :subid("13_1312496524.56246") :method :outer("11_1312496524.56246")
    .param pmc param_1013
    .param pmc param_1014 :slurpy :named
.annotate 'file', ''
.annotate 'line', 27
    new $P1012, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1012, control_1011
    push_eh $P1012
    .lex "self", self
    .lex "$past", param_1013
    .lex "%options", param_1014
.annotate 'line', 28
    find_lex $P101, "self"
    getattribute $P102, $P101, "$!file"
    unless_null $P102, vivify_22
    new $P102, "Undef"
  vivify_22:
    if $P102, unless_1015_end
    get_hll_global $P103, ["POST"], "File"
    $P104 = $P103."new"()
    find_lex $P105, "self"
    setattribute $P105, "$!file", $P104
  unless_1015_end:
.annotate 'line', 29
    find_lex $P101, "self"
    getattribute $P102, $P101, "$!file"
    unless_null $P102, vivify_23
    new $P102, "Undef"
  vivify_23:
    find_lex $P103, "self"
    find_lex $P104, "$past"
    find_lex $P105, "%options"
    $P106 = $P103."super"("to_post", $P104, $P105 :flat)
    $P102."push"($P106)
.annotate 'line', 27
    find_lex $P101, "self"
    getattribute $P102, $P101, "$!file"
    unless_null $P102, vivify_24
    new $P102, "Undef"
  vivify_24:
    .return ($P102)
  control_1011:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("14_1312496524.56246") :method :outer("11_1312496524.56246") :multi(_,_)
    .param pmc param_1019
    .param pmc param_1020 :slurpy :named
.annotate 'file', ''
.annotate 'line', 36
    new $P1018, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1018, control_1017
    push_eh $P1018
    .lex "self", self
    .lex "$node", param_1019
    .lex "%options", param_1020
.annotate 'line', 37
    find_lex $P101, "self"
    find_lex $P102, "$node"
    find_lex $P103, "%options"
    $P104 = $P101."super"("as_post", $P102, $P103 :flat)
.annotate 'line', 36
    .return ($P104)
  control_1017:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("15_1312496524.56246") :method :outer("11_1312496524.56246") :multi(_,["Integer"])
    .param pmc param_1024
    .param pmc param_1025 :slurpy :named
.annotate 'file', ''
.annotate 'line', 46
    new $P1023, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1023, control_1022
    push_eh $P1023
    .lex "self", self
    .lex "$node", param_1024
    .lex "%options", param_1025
.annotate 'line', 47
    find_lex $P101, "self"
    get_hll_global $P102, ["POST"], "Constant"
    find_lex $P103, "$node"
    $P104 = $P102."new"("ic" :named("type"), $P103 :named("value"))
    find_lex $P1026, "%options"
    unless_null $P1026, vivify_25
    $P1026 = root_new ['parrot';'Hash']
  vivify_25:
    set $P105, $P1026["rtype"]
    unless_null $P105, vivify_26
    new $P105, "Undef"
  vivify_26:
    $P106 = $P101."coerce"($P104, $P105)
.annotate 'line', 46
    .return ($P106)
  control_1022:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("16_1312496524.56246") :method :outer("11_1312496524.56246") :multi(_,["Float"])
    .param pmc param_1030
    .param pmc param_1031 :slurpy :named
.annotate 'file', ''
.annotate 'line', 51
    new $P1029, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1029, control_1028
    push_eh $P1029
    .lex "self", self
    .lex "$node", param_1030
    .lex "%options", param_1031
.annotate 'line', 52
    find_lex $P101, "self"
    get_hll_global $P102, ["POST"], "Constant"
    find_lex $P103, "$node"
    $P104 = $P102."new"("nc" :named("type"), $P103 :named("value"))
    find_lex $P1032, "%options"
    unless_null $P1032, vivify_27
    $P1032 = root_new ['parrot';'Hash']
  vivify_27:
    set $P105, $P1032["rtype"]
    unless_null $P105, vivify_28
    new $P105, "Undef"
  vivify_28:
    $P106 = $P101."coerce"($P104, $P105)
.annotate 'line', 51
    .return ($P106)
  control_1028:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("17_1312496524.56246") :method :outer("11_1312496524.56246") :multi(_,["String"])
    .param pmc param_1036
    .param pmc param_1037 :slurpy :named
.annotate 'file', ''
.annotate 'line', 56
    new $P1035, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1035, control_1034
    push_eh $P1035
    .lex "self", self
    .lex "$node", param_1036
    .lex "%options", param_1037
.annotate 'line', 57
    new $P101, "Undef"
    set $P1038, $P101
    .lex "$escaped", $P1038
.annotate 'line', 58
    new $P102, "Undef"
    set $P1039, $P102
    .lex "$encoding", $P1039
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
    find_lex $P1040, "%options"
    unless_null $P1040, vivify_29
    $P1040 = root_new ['parrot';'Hash']
  vivify_29:
    set $P108, $P1040["rtype"]
    unless_null $P108, vivify_30
    new $P108, "Undef"
  vivify_30:
    $P109 = $P103."coerce"($P107, $P108)
.annotate 'line', 56
    .return ($P109)
  control_1034:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"NewCompiler"]
.include "except_types.pasm"
.sub "as_post"  :subid("18_1312496524.56246") :method :outer("11_1312496524.56246") :multi(_,["PAST";"Block"])
    .param pmc param_1044
    .param pmc param_1045 :slurpy :named
.annotate 'file', ''
.annotate 'line', 68
    new $P1043, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1043, control_1042
    push_eh $P1043
    .lex "self", self
    .lex "$node", param_1044
    .lex "%options", param_1045
.annotate 'line', 69
    new $P101, "Undef"
    set $P1046, $P101
    .lex "$post", $P1046
.annotate 'line', 70
    new $P102, "Undef"
    set $P1047, $P102
    .lex "$flags", $P1047
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
    unless $I102, if_1048_end
    find_lex $P104, "$post"
    $P104."main"(1)
  if_1048_end:
.annotate 'line', 72
    find_lex $P103, "$flags"
    set $S101, $P103
    index $I101, $S101, ":init"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1049_end
    find_lex $P104, "$post"
    $P104."init"(1)
  if_1049_end:
.annotate 'line', 73
    find_lex $P103, "$flags"
    set $S101, $P103
    index $I101, $S101, ":load"
    set $N101, $I101
    isge $I102, $N101, 0.0
    unless $I102, if_1050_end
    find_lex $P104, "$post"
    $P104."load"(1)
  if_1050_end:
.annotate 'line', 74
    find_lex $P103, "self"
    getattribute $P104, $P103, "$!file"
    unless_null $P104, vivify_31
    new $P104, "Undef"
  vivify_31:
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
  control_1042:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P103, exception, "payload"
    .return ($P103)
.end


.namespace ["PAST";"NewCompiler"]
.sub "_block1052" :load :anon :subid("19_1312496524.56246")
.annotate 'file', ''
.annotate 'line', 14
    .const 'Sub' $P1054 = "11_1312496524.56246" 
    $P101 = $P1054()
    .return ($P101)
.end


.namespace []
.sub "_block1055" :load :anon :subid("20_1312496524.56246")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1057 = "10_1312496524.56246" 
    $P101 = $P1057()
    .return ($P101)
.end

