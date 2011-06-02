
.namespace []
.sub "_block11"  :anon :subid("10_1307045667.9461")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307045667.9461" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 10
    .const 'Sub' $P14 = "11_1307045667.9461" 
    capture_lex $P14
    $P44 = $P14()
.annotate 'line', 1
    .return ($P44)
    .const 'Sub' $P46 = "14_1307045667.9461" 
    .return ($P46)
.end


.namespace []
.sub "" :load :init :subid("post15") :outer("10_1307045667.9461")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307045667.9461" 
    .local pmc block
    set block, $P12
    $P49 = get_root_global ["parrot"], "P6metaclass"
    $P49."new_class"("POST::File", "POST::Node" :named("parent"))
.end


.namespace ["POST";"File"]
.sub "_block13"  :subid("11_1307045667.9461") :outer("10_1307045667.9461")
.annotate 'line', 10
    .const 'Sub' $P15 = "12_1307045667.9461" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
    .const 'Sub' $P15 = "12_1307045667.9461" 
    newclosure $P39, $P15
    .return ($P39)
    .const 'Sub' $P41 = "13_1307045667.9461" 
    .return ($P41)
.end


.namespace ["POST";"File"]
.include "except_types.pasm"
.sub "sub"  :subid("12_1307045667.9461") :method :outer("11_1307045667.9461")
    .param pmc param_18
    .param pmc param_19 :optional
    .param int has_param_19 :opt_flag
.annotate 'line', 10
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
    .lex "$name", param_18
    if has_param_19, optparam_16
    new $P20, "Undef"
    set param_19, $P20
  optparam_16:
    .lex "$value", param_19
.annotate 'line', 11
    $P21 = root_new ['parrot';'Hash']
    .lex "%subs", $P21
    find_lex $P22, "self"
    unless_null $P22, vivify_17
    $P22 = root_new ['parrot';'Hash']
  vivify_17:
    set $P23, $P22["subs"]
    unless_null $P23, vivify_18
    new $P23, "Undef"
  vivify_18:
    store_lex "%subs", $P23
.annotate 'line', 12
    find_lex $P25, "%subs"
    if $P25, unless_24_end
.annotate 'line', 13
    $P26 = "hash"()
    find_lex $P27, "self"
    unless_null $P27, vivify_19
    $P27 = root_new ['parrot';'Hash']
    store_lex "self", $P27
  vivify_19:
    set $P27["subs"], $P26
.annotate 'line', 14
    find_lex $P28, "self"
    unless_null $P28, vivify_20
    $P28 = root_new ['parrot';'Hash']
  vivify_20:
    set $P29, $P28["subs"]
    unless_null $P29, vivify_21
    new $P29, "Undef"
  vivify_21:
    store_lex "%subs", $P29
  unless_24_end:
.annotate 'line', 17
    find_lex $P31, "$value"
    unless $P31, if_30_end
.annotate 'line', 18
    find_lex $P32, "$value"
    find_lex $P33, "$name"
    find_lex $P34, "%subs"
    unless_null $P34, vivify_22
    $P34 = root_new ['parrot';'Hash']
    store_lex "%subs", $P34
  vivify_22:
    set $P34[$P33], $P32
  if_30_end:
.annotate 'line', 17
    find_lex $P35, "$name"
    find_lex $P36, "%subs"
    unless_null $P36, vivify_23
    $P36 = root_new ['parrot';'Hash']
  vivify_23:
    set $P37, $P36[$P35]
    unless_null $P37, vivify_24
    new $P37, "Undef"
  vivify_24:
.annotate 'line', 10
    .return ($P37)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P38, exception, "payload"
    .return ($P38)
.end


.namespace ["POST";"File"]
.sub "_block40" :load :anon :subid("13_1307045667.9461")
.annotate 'line', 10
    .const 'Sub' $P42 = "11_1307045667.9461" 
    $P43 = $P42()
    .return ($P43)
.end


.namespace []
.sub "_block45" :load :anon :subid("14_1307045667.9461")
.annotate 'line', 1
    .const 'Sub' $P47 = "10_1307045667.9461" 
    $P48 = $P47()
    .return ($P48)
.end

