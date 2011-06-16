
.namespace []
.sub "_block1000"  :anon :subid("10_1308206295.997")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206295.997" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1308206295.997" 
    capture_lex $P1003
    $P118 = $P1003()
.annotate 'line', 1
    .return ($P118)
    .const 'Sub' $P1023 = "17_1308206295.997" 
    .return ($P1023)
.end


.namespace []
.sub "" :load :init :subid("post18") :outer("10_1308206295.997")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206295.997" 
    .local pmc block
    set block, $P1001
    $P1025 = get_root_global ["parrot"], "P6metaclass"
    $P1025."new_class"("POST::String", "POST::Constant" :named("parent"))
.end


.namespace ["POST";"String"]
.sub "_block1002"  :subid("11_1308206295.997") :outer("10_1308206295.997")
.annotate 'line', 9
    .const 'Sub' $P1015 = "15_1308206295.997" 
    capture_lex $P1015
    .const 'Sub' $P1011 = "14_1308206295.997" 
    capture_lex $P1011
    .const 'Sub' $P1008 = "13_1308206295.997" 
    capture_lex $P1008
    .const 'Sub' $P1004 = "12_1308206295.997" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 13
    .const 'Sub' $P1015 = "15_1308206295.997" 
    newclosure $P1018, $P1015
.annotate 'line', 9
    .return ($P1018)
    .const 'Sub' $P1020 = "16_1308206295.997" 
    .return ($P1020)
.end


.namespace ["POST";"String"]
.include "except_types.pasm"
.sub "charset"  :subid("12_1308206295.997") :method :outer("11_1308206295.997") :multi(_,_)
    .param pmc param_1007
.annotate 'line', 9
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
    .lex "$param", param_1007
    find_lex $P101, "self"
    find_lex $P102, "$param"
    $P103 = $P101."attr"("charset", $P102, 1)
    .return ($P103)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"String"]
.include "except_types.pasm"
.sub "charset"  :subid("13_1308206295.997") :method :outer("11_1308206295.997") :multi(_)
.annotate 'line', 10
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "self", self
    find_lex $P105, "self"
    get_hll_global $P106, "undef"
    $P107 = $P105."attr"("charset", $P106, 0)
    .return ($P107)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P108, exception, "payload"
    .return ($P108)
.end


.namespace ["POST";"String"]
.include "except_types.pasm"
.sub "encoding"  :subid("14_1308206295.997") :method :outer("11_1308206295.997") :multi(_,_)
    .param pmc param_1014
.annotate 'line', 12
    new $P1013, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1013, control_1012
    push_eh $P1013
    .lex "self", self
    .lex "$param", param_1014
    find_lex $P109, "self"
    find_lex $P110, "$param"
    $P111 = $P109."attr"("encoding", $P110, 1)
    .return ($P111)
  control_1012:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["POST";"String"]
.include "except_types.pasm"
.sub "encoding"  :subid("15_1308206295.997") :method :outer("11_1308206295.997") :multi(_)
.annotate 'line', 13
    new $P1017, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1017, control_1016
    push_eh $P1017
    .lex "self", self
    find_lex $P113, "self"
    get_hll_global $P114, "undef"
    $P115 = $P113."attr"("encoding", $P114, 0)
    .return ($P115)
  control_1016:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P116, exception, "payload"
    .return ($P116)
.end


.namespace ["POST";"String"]
.sub "_block1019" :load :anon :subid("16_1308206295.997")
.annotate 'line', 9
    .const 'Sub' $P1021 = "11_1308206295.997" 
    $P117 = $P1021()
    .return ($P117)
.end


.namespace []
.sub "_block1022" :load :anon :subid("17_1308206295.997")
.annotate 'line', 1
    .const 'Sub' $P1024 = "10_1308206295.997" 
    $P119 = $P1024()
    .return ($P119)
.end

