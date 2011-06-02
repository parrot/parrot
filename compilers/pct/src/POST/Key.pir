
.namespace []
.sub "_block11"  :anon :subid("10_1307045668.37489")
.annotate 'line', 0
    .const 'Sub' $P14 = "11_1307045668.37489" 
    capture_lex $P14
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P14 = "11_1307045668.37489" 
    capture_lex $P14
    $P171 = $P14()
.annotate 'line', 1
    .return ($P171)
    .const 'Sub' $P173 = "21_1307045668.37489" 
    .return ($P173)
.end


.namespace []
.sub "" :load :init :subid("post22") :outer("10_1307045668.37489")
.annotate 'line', 0
    .const 'Sub' $P12 = "10_1307045668.37489" 
    .local pmc block
    set block, $P12
    $P176 = get_root_global ["parrot"], "P6metaclass"
    $P176."new_class"("POST::Key", "POST::Value" :named("parent"))
.end


.namespace ["POST";"Key"]
.sub "_block13"  :subid("11_1307045668.37489") :outer("10_1307045668.37489")
.annotate 'line', 9
    .const 'Sub' $P35 = "14_1307045668.37489" 
    capture_lex $P35
    .const 'Sub' $P15 = "12_1307045668.37489" 
    capture_lex $P15
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 27
    .const 'Sub' $P35 = "14_1307045668.37489" 
    newclosure $P166, $P35
.annotate 'line', 9
    .return ($P166)
    .const 'Sub' $P168 = "20_1307045668.37489" 
    .return ($P168)
.end


.namespace ["POST";"Key"]
.include "except_types.pasm"
.sub "Str"  :subid("12_1307045668.37489") :method :outer("11_1307045668.37489")
.annotate 'line', 9
    .const 'Sub' $P22 = "13_1307045668.37489" 
    capture_lex $P22
    new $P17, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P17, control_16
    push_eh $P17
    .lex "self", self
.annotate 'line', 10
    new $P18, "String"
    assign $P18, "["
    find_lex $P19, "self"
    $P20 = $P19."list"()
    .const 'Sub' $P22 = "13_1307045668.37489" 
    newclosure $P29, $P22
    $P30 = $P20."map"($P29)
    $S31 = $P30."join"(";")
    concat $P32, $P18, $S31
    concat $P33, $P32, "]"
.annotate 'line', 9
    .return ($P33)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P34, exception, "payload"
    .return ($P34)
.end


.namespace ["POST";"Key"]
.include "except_types.pasm"
.sub "_block21"  :anon :subid("13_1307045668.37489") :outer("12_1307045668.37489")
    .param pmc param_25
.annotate 'line', 10
    new $P24, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P24, control_23
    push_eh $P24
    .lex "$p", param_25
    find_lex $P26, "$p"
    unless_null $P26, vivify_23
    $P26 = root_new ['parrot';'Hash']
  vivify_23:
    set $P27, $P26["value"]
    unless_null $P27, vivify_24
    new $P27, "Undef"
  vivify_24:
    .return ($P27)
  control_23:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P28, exception, "payload"
    .return ($P28)
.end


.namespace ["POST";"Key"]
.include "except_types.pasm"
.sub "to_pmc"  :subid("14_1307045668.37489") :method :outer("11_1307045668.37489")
    .param pmc param_38
.annotate 'line', 27
    .const 'Sub' $P52 = "15_1307045668.37489" 
    capture_lex $P52
    new $P37, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P37, control_36
    push_eh $P37
    .lex "self", self
    .lex "%context", param_38
.annotate 'line', 28
    $P39 = root_new ['parrot';'ResizablePMCArray']
    .lex "@keys", $P39
.annotate 'line', 29
    new $P40, "Undef"
    .lex "$constants", $P40
.annotate 'line', 84
    new $P41, "Undef"
    .lex "$key_pmc", $P41
.annotate 'line', 107
    $P42 = root_new ['parrot';'ResizablePMCArray']
    .lex "@res", $P42
.annotate 'line', 27
    find_lex $P43, "@keys"
.annotate 'line', 29
    find_lex $P44, "%context"
    unless_null $P44, vivify_25
    $P44 = root_new ['parrot';'Hash']
  vivify_25:
    set $P45, $P44["constants"]
    unless_null $P45, vivify_26
    new $P45, "Undef"
  vivify_26:
    store_lex "$constants", $P45
.annotate 'line', 31
    find_lex $P47, "self"
    $P48 = $P47."list"()
    defined $I49, $P48
    unless $I49, for_undef_27
    iter $P46, $P48
    new $P152, 'ExceptionHandler'
    set_label $P152, loop151_handler
    $P152."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P152
  loop151_test:
    unless $P46, loop151_done
    shift $P50, $P46
  loop151_redo:
    .const 'Sub' $P52 = "15_1307045668.37489" 
    capture_lex $P52
    $P52($P50)
  loop151_next:
    goto loop151_test
  loop151_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P153, exception, 'type'
    eq $P153, .CONTROL_LOOP_NEXT, loop151_next
    eq $P153, .CONTROL_LOOP_REDO, loop151_redo
  loop151_done:
    pop_eh 
  for_undef_27:
    find_lex $P154, "$key_pmc"
.annotate 'line', 85
    find_lex $P156, "@keys"
    set $N157, $P156
    unless $N157, if_155_end
.annotate 'line', 86

            .local pmc keys, key_pmc
            find_lex keys, "@keys"
            find_lex key_pmc, "$key_pmc"
            key_pmc = shift keys
            store_lex "$key_pmc", key_pmc
        
.annotate 'line', 94
    new $P161, 'ExceptionHandler'
    set_label $P161, loop160_handler
    $P161."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P161
  loop160_test:
    find_lex $P158, "@keys"
    set $N159, $P158
    unless $N159, loop160_done
  loop160_redo:
.annotate 'line', 97

                .local pmc keys, key_pmc, k
                find_lex keys, "@keys"
                find_lex key_pmc, "$key_pmc"
                k = shift keys
                push key_pmc, k
            
  loop160_next:
.annotate 'line', 94
    goto loop160_test
  loop160_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, 'type'
    eq $P162, .CONTROL_LOOP_NEXT, loop160_next
    eq $P162, .CONTROL_LOOP_REDO, loop160_redo
  loop160_done:
    pop_eh 
  if_155_end:
.annotate 'line', 85
    find_lex $P163, "@res"
.annotate 'line', 108

        .local pmc key_pmc, res
        find_lex res, "@res"
        find_lex key_pmc, "$key_pmc"
        push res, key_pmc
    
    find_lex $P164, "@res"
.annotate 'line', 27
    .return ($P164)
  control_36:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P165, exception, "payload"
    .return ($P165)
.end


.namespace ["POST";"Key"]
.sub "_block51"  :anon :subid("15_1307045668.37489") :outer("14_1307045668.37489")
    .param pmc param_53
.annotate 'line', 31
    .const 'Sub' $P134 = "19_1307045668.37489" 
    capture_lex $P134
    .const 'Sub' $P115 = "18_1307045668.37489" 
    capture_lex $P115
    .const 'Sub' $P98 = "17_1307045668.37489" 
    capture_lex $P98
    .const 'Sub' $P78 = "16_1307045668.37489" 
    capture_lex $P78
    .lex "$part", param_53
.annotate 'line', 32
    new $P54, "Undef"
    .lex "$type", $P54
    find_lex $P55, "$part"
    $P56 = $P55."type"()
    store_lex "$type", $P56
.annotate 'line', 35
    find_lex $P58, "$type"
    if $P58, unless_57_end
.annotate 'line', 36
    find_lex $P59, "%context"
    unless_null $P59, vivify_28
    $P59 = root_new ['parrot';'Hash']
  vivify_28:
    set $P60, $P59["sub"]
    unless_null $P60, vivify_29
    new $P60, "Undef"
  vivify_29:
    find_lex $P61, "$part"
    $P62 = $P61."name"()
    $P63 = $P60."symbol"($P62)
    $P64 = $P63."type"()
    store_lex "$type", $P64
  unless_57_end:
.annotate 'line', 39
    find_lex $P66, "$type"
    if $P66, unless_65_end
    new $P67, 'String'
    set $P67, "Can't find type for "
    find_lex $P68, "$part"
    $P69 = $P68."name"()
    set $S70, $P69
    concat $P71, $P67, $S70
    die $P71
  unless_65_end:
.annotate 'line', 41
    find_lex $P74, "$type"
    set $S75, $P74
    iseq $I76, $S75, "sc"
    if $I76, if_73
.annotate 'line', 47
    find_lex $P94, "$type"
    set $S95, $P94
    iseq $I96, $S95, "ic"
    if $I96, if_93
.annotate 'line', 52
    find_lex $P111, "$type"
    set $S112, $P111
    iseq $I113, $S112, "s"
    if $I113, if_110
.annotate 'line', 65
    find_lex $P130, "$type"
    set $S131, $P130
    iseq $I132, $S131, "i"
    if $I132, if_129
.annotate 'line', 79
    new $P147, 'String'
    set $P147, "unknown key type: "
    find_lex $P148, "$type"
    set $S149, $P148
    concat $P150, $P147, $S149
    die $P150
.annotate 'line', 78
    goto if_129_end
  if_129:
.annotate 'line', 65
    .const 'Sub' $P134 = "19_1307045668.37489" 
    capture_lex $P134
    $P146 = $P134()
    set $P128, $P146
  if_129_end:
    set $P109, $P128
.annotate 'line', 52
    goto if_110_end
  if_110:
    .const 'Sub' $P115 = "18_1307045668.37489" 
    capture_lex $P115
    $P127 = $P115()
    set $P109, $P127
  if_110_end:
    set $P92, $P109
.annotate 'line', 47
    goto if_93_end
  if_93:
    .const 'Sub' $P98 = "17_1307045668.37489" 
    capture_lex $P98
    $P108 = $P98()
    set $P92, $P108
  if_93_end:
    set $P72, $P92
.annotate 'line', 41
    goto if_73_end
  if_73:
    .const 'Sub' $P78 = "16_1307045668.37489" 
    capture_lex $P78
    $P91 = $P78()
    set $P72, $P91
  if_73_end:
.annotate 'line', 31
    .return ($P72)
.end


.namespace ["POST";"Key"]
.sub "_block133"  :anon :subid("19_1307045668.37489") :outer("15_1307045668.37489")
.annotate 'line', 66
    new $P135, "Undef"
    .lex "$k", $P135
.annotate 'line', 67
    new $P136, "Undef"
    .lex "$regno", $P136
.annotate 'line', 66
    new $P137, "Key"
    store_lex "$k", $P137
.annotate 'line', 67
    find_lex $P138, "%context"
    unless_null $P138, vivify_30
    $P138 = root_new ['parrot';'Hash']
  vivify_30:
    set $P139, $P138["sub"]
    unless_null $P139, vivify_31
    new $P139, "Undef"
  vivify_31:
    find_lex $P140, "$part"
    $P141 = $P140."name"()
    $P142 = $P139."symbol"($P141)
    $P143 = $P142."regno"()
    store_lex "$regno", $P143
.annotate 'line', 68
    find_lex $P144, "$k"
    find_lex $P145, "$regno"
    $P144."set_register"($P145, 1)
.annotate 'line', 71

                .local pmc keys, k
                find_lex keys, "@keys"
                find_lex k, "$k"
                push keys, k
            
.annotate 'line', 65
    .return ()
.end


.namespace ["POST";"Key"]
.sub "_block114"  :anon :subid("18_1307045668.37489") :outer("15_1307045668.37489")
.annotate 'line', 53
    new $P116, "Undef"
    .lex "$k", $P116
.annotate 'line', 54
    new $P117, "Undef"
    .lex "$regno", $P117
.annotate 'line', 53
    new $P118, "Key"
    store_lex "$k", $P118
.annotate 'line', 54
    find_lex $P119, "%context"
    unless_null $P119, vivify_32
    $P119 = root_new ['parrot';'Hash']
  vivify_32:
    set $P120, $P119["sub"]
    unless_null $P120, vivify_33
    new $P120, "Undef"
  vivify_33:
    find_lex $P121, "$part"
    $P122 = $P121."name"()
    $P123 = $P120."symbol"($P122)
    $P124 = $P123."regno"()
    store_lex "$regno", $P124
.annotate 'line', 55
    find_lex $P125, "$k"
    find_lex $P126, "$regno"
    $P125."set_register"($P126, 4)
.annotate 'line', 58

                .local pmc keys, k
                find_lex keys, "@keys"
                find_lex k, "$k"
                push keys, k
            
.annotate 'line', 52
    .return ()
.end


.namespace ["POST";"Key"]
.sub "_block97"  :anon :subid("17_1307045668.37489") :outer("15_1307045668.37489")
.annotate 'line', 48
    new $P99, "Undef"
    .lex "$k", $P99
    new $P100, "Key"
    store_lex "$k", $P100
.annotate 'line', 49
    find_lex $P101, "$k"
    find_lex $P102, "$part"
    $P103 = $P102."value"()
    set $N104, $P103
    $P101."set_int"($N104)
.annotate 'line', 50
    find_lex $P105, "@keys"
    find_lex $P106, "$k"
    $P107 = $P105."push"($P106)
.annotate 'line', 47
    .return ($P107)
.end


.namespace ["POST";"Key"]
.sub "_block77"  :anon :subid("16_1307045668.37489") :outer("15_1307045668.37489")
.annotate 'line', 42
    new $P79, "Undef"
    .lex "$k", $P79
    new $P80, "Key"
    store_lex "$k", $P80
.annotate 'line', 43
    find_lex $P81, "$k"
    find_lex $P82, "$part"
    $P83 = $P82."value"()
    set $S84, $P83
    $P81."set_str"($S84)
.annotate 'line', 44
    find_lex $P85, "$constants"
    find_lex $P86, "$part"
    $P87 = $P86."value"()
    $P85."get_or_create_string"($P87)
.annotate 'line', 45
    find_lex $P88, "@keys"
    find_lex $P89, "$k"
    $P90 = $P88."push"($P89)
.annotate 'line', 41
    .return ($P90)
.end


.namespace ["POST";"Key"]
.sub "_block167" :load :anon :subid("20_1307045668.37489")
.annotate 'line', 9
    .const 'Sub' $P169 = "11_1307045668.37489" 
    $P170 = $P169()
    .return ($P170)
.end


.namespace []
.sub "_block172" :load :anon :subid("21_1307045668.37489")
.annotate 'line', 1
    .const 'Sub' $P174 = "10_1307045668.37489" 
    $P175 = $P174()
    .return ($P175)
.end

