
.namespace []
.sub "_block11"  :anon :subid("10_1294647508.67123")
.annotate 'line', 0
    get_hll_global $P14, ["POST";"Node"], "_block13" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 20
    get_hll_global $P14, ["POST";"Node"], "_block13" 
    capture_lex $P14
    $P77 = $P14()
.annotate 'line', 1
    .return ($P77)
    .const 'Sub' $P79 = "17_1294647508.67123" 
    .return ($P79)
.end


.namespace []
.sub "" :load :init :subid("post18") :outer("10_1294647508.67123")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1294647508.67123" 
    .local pmc block
    set block, $P12
    $P82 = get_root_global ["parrot"], "P6metaclass"
    $P82."new_class"("POST::Node", "PCT::Node" :named("parent"))
.end


.namespace ["POST";"Node"]
.sub "_block13"  :subid("11_1294647508.67123") :outer("10_1294647508.67123")
.annotate 'line', 20
    .const 'Sub' $P64 = "15_1294647508.67123" 
    capture_lex $P64
    .const 'Sub' $P47 = "14_1294647508.67123" 
    capture_lex $P47
    .const 'Sub' $P41 = "13_1294647508.67123" 
    capture_lex $P41
    .const 'Sub' $P15 = "12_1294647508.67123" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 64
    .const 'Sub' $P64 = "15_1294647508.67123" 
    newclosure $P72, $P64
.annotate 'line', 20
    .return ($P72)
    .const 'Sub' $P74 = "16_1294647508.67123" 
    .return ($P74)
.end


.namespace ["POST";"Node"]
.include "except_types.pasm"
.sub "result"  :subid("12_1294647508.67123") :method :outer("11_1294647508.67123")
    .param pmc param_18 :optional
    .param int has_param_18 :opt_flag
.annotate 'line', 20
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P17, control_16
    push_eh $P17
    .lex "self", self
    if has_param_18, optparam_19
    new $P19, "Undef"
    set param_18, $P19
  optparam_19:
    .lex "$result", param_18
.annotate 'line', 21
    find_lex $P21, "$result"
    defined $I22, $P21
    if $I22, if_20
.annotate 'line', 25
    find_lex $P25, "self"
    unless_null $P25, vivify_20
    $P25 = root_new ['parrot';'Hash']
  vivify_20:
    set $P26, $P25["result"]
    unless_null $P26, vivify_21
    new $P26, "Undef"
  vivify_21:
    store_lex "$result", $P26
.annotate 'line', 26
    find_lex $P28, "$result"
    defined $I29, $P28
    new $P30, 'Integer'
    set $P30, $I29
    isfalse $I31, $P30
    if $I31, if_27
.annotate 'line', 29
    find_lex $P34, "$result"
    get_hll_global $P35, ["POST"], "Node"
    isa $I36, $P34, $P35
    unless $I36, if_33_end
.annotate 'line', 30
    find_lex $P37, "$result"
    $P38 = $P37."result"()
    store_lex "$result", $P38
  if_33_end:
.annotate 'line', 29
    goto if_27_end
  if_27:
.annotate 'line', 27
    new $P32, "String"
    assign $P32, ""
    store_lex "$result", $P32
  if_27_end:
.annotate 'line', 24
    goto if_20_end
  if_20:
.annotate 'line', 22
    find_lex $P23, "$result"
    find_lex $P24, "self"
    unless_null $P24, vivify_22
    $P24 = root_new ['parrot';'Hash']
    store_lex "self", $P24
  vivify_22:
    set $P24["result"], $P23
  if_20_end:
.annotate 'line', 21
    find_lex $P39, "$result"
.annotate 'line', 20
    .return ($P39)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P40, exception, "payload"
    .return ($P40)
.end


.namespace ["POST";"Node"]
.include "except_types.pasm"
.sub "get_string" :vtable('get_string') :subid("13_1294647508.67123") :method :outer("11_1294647508.67123")
.annotate 'line', 39
    new $P43, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P43, control_42
    push_eh $P43
    .lex "self", self
.annotate 'line', 40
    find_lex $P44, "self"
    $P45 = $P44."result"()
.annotate 'line', 39
    .return ($P45)
  control_42:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P46, exception, "payload"
    .return ($P46)
.end


.namespace ["POST";"Node"]
.include "except_types.pasm"
.sub "push_pirop"  :subid("14_1294647508.67123") :method :outer("11_1294647508.67123")
    .param pmc param_50
    .param pmc param_51 :slurpy
    .param pmc param_52 :slurpy :named
.annotate 'line', 50
    new $P49, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P49, control_48
    push_eh $P49
    .lex "self", self
    .lex "$pirop", param_50
    .lex "@arglist", param_51
    .lex "%adverbs", param_52
.annotate 'line', 52
    new $P53, "Undef"
    .lex "$op", $P53
.annotate 'line', 51
    find_lex $P54, "$pirop"
    find_lex $P55, "%adverbs"
    unless_null $P55, vivify_23
    $P55 = root_new ['parrot';'Hash']
    store_lex "%adverbs", $P55
  vivify_23:
    set $P55["pirop"], $P54
.annotate 'line', 52
    get_hll_global $P56, ["POST"], "Op"
    find_lex $P57, "@arglist"
    find_lex $P58, "%adverbs"
    $P59 = $P56."new"($P57 :flat, $P58 :flat)
    store_lex "$op", $P59
.annotate 'line', 53
    find_lex $P60, "self"
    find_lex $P61, "$op"
    $P60."push"($P61)
    find_lex $P62, "$op"
.annotate 'line', 50
    .return ($P62)
  control_48:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P63, exception, "payload"
    .return ($P63)
.end


.namespace ["POST";"Node"]
.include "except_types.pasm"
.sub "escape"  :subid("15_1294647508.67123") :method :outer("11_1294647508.67123")
    .param pmc param_67
.annotate 'line', 64
    new $P66, ['ExceptionHandler'], .CONTROL_RETURN
    set_addr $P66, control_65
    push_eh $P66
    .lex "self", self
    .lex "$str", param_67
.annotate 'line', 65
    get_hll_global $P68, ["PAST"], "Compiler"
    find_lex $P69, "$str"
    $P70 = $P68."escape"($P69)
.annotate 'line', 64
    .return ($P70)
  control_65:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P71, exception, "payload"
    .return ($P71)
.end


.namespace ["POST";"Node"]
.sub "_block73" :load :anon :subid("16_1294647508.67123")
.annotate 'line', 20
    .const 'Sub' $P75 = "11_1294647508.67123" 
    $P76 = $P75()
    .return ($P76)
.end


.namespace []
.sub "_block78" :load :anon :subid("17_1294647508.67123")
.annotate 'line', 1
    .const 'Sub' $P80 = "10_1294647508.67123" 
    $P81 = $P80()
    .return ($P81)
.end

