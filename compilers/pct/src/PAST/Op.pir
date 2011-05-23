
.namespace []
.sub "_block11"  :anon :subid("10_1306186125.96477")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1306186125.96477" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 79
    .const 'Sub' $P14 = "11_1306186125.96477" 
    capture_lex $P14
    $P58 = $P14()
.annotate 'line', 1
    .return ($P58)
    .const 'Sub' $P60 = "17_1306186125.96477" 
    .return ($P60)
.end


.namespace []
.sub "" :load :init :subid("post18") :outer("10_1306186125.96477")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1306186125.96477" 
    .local pmc block
    set block, $P12
    $P63 = get_root_global ["parrot"], "P6metaclass"
    $P63."new_class"("PAST::Op", "PAST::Node" :named("parent"))
.end


.namespace ["PAST";"Op"]
.sub "_block13"  :subid("11_1306186125.96477") :outer("10_1306186125.96477")
.annotate 'line', 79
    .const 'Sub' $P48 = "15_1306186125.96477" 
    capture_lex $P48
    .const 'Sub' $P37 = "14_1306186125.96477" 
    capture_lex $P37
    .const 'Sub' $P26 = "13_1306186125.96477" 
    capture_lex $P26
    .const 'Sub' $P15 = "12_1306186125.96477" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 138
    .const 'Sub' $P48 = "15_1306186125.96477" 
    newclosure $P53, $P48
.annotate 'line', 79
    .return ($P53)
    .const 'Sub' $P55 = "16_1306186125.96477" 
    .return ($P55)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pasttype"  :subid("12_1306186125.96477") :method :outer("11_1306186125.96477")
    .param pmc param_18 :optional
    .param int has_param_18 :opt_flag
.annotate 'line', 79
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    if has_param_18, optparam_19
    new $P19, "Undef"
    set param_18, $P19
  optparam_19:
    .lex "$value", param_18
.annotate 'line', 80
    find_lex $P20, "self"
    find_lex $P21, "$value"
    find_lex $P22, "$value"
    defined $I23, $P22
    $P24 = $P20."attr"("pasttype", $P21, $I23)
.annotate 'line', 79
    .return ($P24)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "pirop"  :subid("13_1306186125.96477") :method :outer("11_1306186125.96477")
    .param pmc param_29 :optional
    .param int has_param_29 :opt_flag
.annotate 'line', 93
    new $P28, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P28, control_27
    push_eh $P28
    .lex "self", self
    if has_param_29, optparam_20
    new $P30, "Undef"
    set param_29, $P30
  optparam_20:
    .lex "$value", param_29
.annotate 'line', 94
    find_lex $P31, "self"
    find_lex $P32, "$value"
    find_lex $P33, "$value"
    defined $I34, $P33
    $P35 = $P31."attr"("pirop", $P32, $I34)
.annotate 'line', 93
    .return ($P35)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P36, exception, "payload"
    .return ($P36)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "inline"  :subid("14_1306186125.96477") :method :outer("11_1306186125.96477")
    .param pmc param_40 :optional
    .param int has_param_40 :opt_flag
.annotate 'line', 127
    new $P39, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P39, control_38
    push_eh $P39
    .lex "self", self
    if has_param_40, optparam_21
    new $P41, "Undef"
    set param_40, $P41
  optparam_21:
    .lex "$value", param_40
.annotate 'line', 128
    find_lex $P42, "self"
    find_lex $P43, "$value"
    find_lex $P44, "$value"
    defined $I45, $P44
    $P46 = $P42."attr"("inline", $P43, $I45)
.annotate 'line', 127
    .return ($P46)
  control_38:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace ["PAST";"Op"]
.include "except_types.pasm"
.sub "opattr"  :subid("15_1306186125.96477") :method :outer("11_1306186125.96477")
    .param pmc param_51
.annotate 'line', 138
    new $P50, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P50, control_49
    push_eh $P50
    .lex "self", self
    .lex "%hash", param_51
.annotate 'line', 139

		.local pmc hash
		find_lex hash, '%hash'

		$P0 = split ' ', "pasttype pirop inline lvalue"
		$P1 = iter $P0
	  iter_loop:
		unless $P1 goto iter_end
		$S0 = shift $P1
		$P2 = hash[$S0]
		if null $P2 goto iter_loop
		$P3 = find_method self, $S0
		self.$P3($P2)
		goto iter_loop
	  iter_end:
	
.annotate 'line', 138
    .return ()
  control_49:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P52, exception, "payload"
    .return ($P52)
.end


.namespace ["PAST";"Op"]
.sub "_block54" :load :anon :subid("16_1306186125.96477")
.annotate 'line', 79
    .const 'Sub' $P56 = "11_1306186125.96477" 
    $P57 = $P56()
    .return ($P57)
.end


.namespace []
.sub "_block59" :load :anon :subid("17_1306186125.96477")
.annotate 'line', 1
    .const 'Sub' $P61 = "10_1306186125.96477" 
    $P62 = $P61()
    .return ($P62)
.end

