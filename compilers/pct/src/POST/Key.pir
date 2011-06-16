
.namespace []
.sub "_block1000"  :anon :subid("10_1308206294.63873")
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308206294.63873" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1308206294.63873" 
    capture_lex $P1003
    $P213 = $P1003()
.annotate 'line', 1
    .return ($P213)
    .const 'Sub' $P1060 = "21_1308206294.63873" 
    .return ($P1060)
.end


.namespace []
.sub "" :load :init :subid("post22") :outer("10_1308206294.63873")
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308206294.63873" 
    .local pmc block
    set block, $P1001
    $P1062 = get_root_global ["parrot"], "P6metaclass"
    $P1062."new_class"("POST::Key", "POST::Value" :named("parent"))
.end


.namespace ["POST";"Key"]
.sub "_block1002"  :subid("11_1308206294.63873") :outer("10_1308206294.63873")
.annotate 'line', 9
    .const 'Sub' $P1014 = "14_1308206294.63873" 
    capture_lex $P1014
    .const 'Sub' $P1004 = "12_1308206294.63873" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 27
    .const 'Sub' $P1014 = "14_1308206294.63873" 
    newclosure $P1055, $P1014
.annotate 'line', 9
    .return ($P1055)
    .const 'Sub' $P1057 = "20_1308206294.63873" 
    .return ($P1057)
.end


.namespace ["POST";"Key"]
.include "except_types.pasm"
.sub "Str"  :subid("12_1308206294.63873") :method :outer("11_1308206294.63873")
.annotate 'line', 9
    .const 'Sub' $P1008 = "13_1308206294.63873" 
    capture_lex $P1008
    new $P1006, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1006, control_1005
    push_eh $P1006
    .lex "self", self
.annotate 'line', 10
    new $P101, "String"
    assign $P101, "["
    find_lex $P102, "self"
    $P103 = $P102."list"()
    .const 'Sub' $P1008 = "13_1308206294.63873" 
    newclosure $P1013, $P1008
    $P106 = $P103."map"($P1013)
    $S107 = $P106."join"(";")
    concat $P108, $P101, $S107
    concat $P109, $P108, "]"
.annotate 'line', 9
    .return ($P109)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["POST";"Key"]
.include "except_types.pasm"
.sub "_block1007"  :anon :subid("13_1308206294.63873") :outer("12_1308206294.63873")
    .param pmc param_1011
.annotate 'line', 10
    new $P1010, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1010, control_1009
    push_eh $P1010
    .lex "$p", param_1011
    find_lex $P1012, "$p"
    unless_null $P1012, vivify_23
    $P1012 = root_new ['parrot';'Hash']
  vivify_23:
    set $P104, $P1012["value"]
    unless_null $P104, vivify_24
    new $P104, "Undef"
  vivify_24:
    .return ($P104)
  control_1009:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P105, exception, "payload"
    .return ($P105)
.end


.namespace ["POST";"Key"]
.include "except_types.pasm"
.sub "to_pmc"  :subid("14_1308206294.63873") :method :outer("11_1308206294.63873")
    .param pmc param_1017
.annotate 'line', 27
    .const 'Sub' $P1026 = "15_1308206294.63873" 
    capture_lex $P1026
    new $P1016, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P1016, control_1015
    push_eh $P1016
    .lex "self", self
    .lex "%context", param_1017
.annotate 'line', 28
    $P1019 = root_new ['parrot';'ResizablePMCArray']
    set $P1018, $P1019
    .lex "@keys", $P1018
.annotate 'line', 29
    new $P111, "Undef"
    set $P1020, $P111
    .lex "$constants", $P1020
.annotate 'line', 84
    new $P112, "Undef"
    set $P1021, $P112
    .lex "$key_pmc", $P1021
.annotate 'line', 107
    $P1023 = root_new ['parrot';'ResizablePMCArray']
    set $P1022, $P1023
    .lex "@res", $P1022
.annotate 'line', 27
    find_lex $P113, "@keys"
.annotate 'line', 29
    find_lex $P1024, "%context"
    unless_null $P1024, vivify_25
    $P1024 = root_new ['parrot';'Hash']
  vivify_25:
    set $P114, $P1024["constants"]
    unless_null $P114, vivify_26
    new $P114, "Undef"
  vivify_26:
    store_lex "$constants", $P114
.annotate 'line', 31
    find_lex $P116, "self"
    $P117 = $P116."list"()
    defined $I118, $P117
    unless $I118, for_undef_27
    iter $P115, $P117
    new $P200, 'ExceptionHandler'
    set_label $P200, loop1052_handler
    $P200."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P200
  loop1052_test:
    unless $P115, loop1052_done
    shift $P119, $P115
  loop1052_redo:
    .const 'Sub' $P1026 = "15_1308206294.63873" 
    capture_lex $P1026
    $P1026($P119)
  loop1052_next:
    goto loop1052_test
  loop1052_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P201, exception, 'type'
    eq $P201, .CONTROL_LOOP_NEXT, loop1052_next
    eq $P201, .CONTROL_LOOP_REDO, loop1052_redo
  loop1052_done:
    pop_eh 
  for_undef_27:
    find_lex $P202, "$key_pmc"
.annotate 'line', 85
    find_lex $P203, "@keys"
    set $N204, $P203
    unless $N204, if_1053_end
.annotate 'line', 86

            .local pmc keys, key_pmc
            find_lex keys, "@keys"
            find_lex key_pmc, "$key_pmc"
            key_pmc = shift keys
            store_lex "$key_pmc", key_pmc
        
.annotate 'line', 94
    new $P207, 'ExceptionHandler'
    set_label $P207, loop1054_handler
    $P207."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P207
  loop1054_test:
    find_lex $P205, "@keys"
    set $N206, $P205
    unless $N206, loop1054_done
  loop1054_redo:
.annotate 'line', 97

                .local pmc keys, key_pmc, k
                find_lex keys, "@keys"
                find_lex key_pmc, "$key_pmc"
                k = shift keys
                push key_pmc, k
            
  loop1054_next:
.annotate 'line', 94
    goto loop1054_test
  loop1054_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P208, exception, 'type'
    eq $P208, .CONTROL_LOOP_NEXT, loop1054_next
    eq $P208, .CONTROL_LOOP_REDO, loop1054_redo
  loop1054_done:
    pop_eh 
  if_1053_end:
.annotate 'line', 85
    find_lex $P209, "@res"
.annotate 'line', 108

        .local pmc key_pmc, res
        find_lex res, "@res"
        find_lex key_pmc, "$key_pmc"
        push res, key_pmc
    
    find_lex $P210, "@res"
.annotate 'line', 27
    .return ($P210)
  control_1015:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P211, exception, "payload"
    .return ($P211)
.end


.namespace ["POST";"Key"]
.sub "_block1025"  :anon :subid("15_1308206294.63873") :outer("14_1308206294.63873")
    .param pmc param_1027
.annotate 'line', 31
    .const 'Sub' $P1048 = "19_1308206294.63873" 
    capture_lex $P1048
    .const 'Sub' $P1042 = "18_1308206294.63873" 
    capture_lex $P1042
    .const 'Sub' $P1038 = "17_1308206294.63873" 
    capture_lex $P1038
    .const 'Sub' $P1034 = "16_1308206294.63873" 
    capture_lex $P1034
    .lex "$part", param_1027
.annotate 'line', 32
    new $P120, "Undef"
    set $P1028, $P120
    .lex "$type", $P1028
    find_lex $P121, "$part"
    $P122 = $P121."type"()
    store_lex "$type", $P122
.annotate 'line', 35
    find_lex $P123, "$type"
    if $P123, unless_1029_end
.annotate 'line', 36
    find_lex $P1030, "%context"
    unless_null $P1030, vivify_28
    $P1030 = root_new ['parrot';'Hash']
  vivify_28:
    set $P124, $P1030["sub"]
    unless_null $P124, vivify_29
    new $P124, "Undef"
  vivify_29:
    find_lex $P125, "$part"
    $P126 = $P125."name"()
    $P127 = $P124."symbol"($P126)
    $P128 = $P127."type"()
    store_lex "$type", $P128
  unless_1029_end:
.annotate 'line', 39
    find_lex $P129, "$type"
    if $P129, unless_1031_end
    new $P130, 'String'
    set $P130, "Can't find type for "
    find_lex $P131, "$part"
    $P132 = $P131."name"()
    set $S133, $P132
    concat $P134, $P130, $S133
    die $P134
  unless_1031_end:
.annotate 'line', 41
    find_lex $P136, "$type"
    set $S137, $P136
    iseq $I138, $S137, "sc"
    if $I138, if_1032
.annotate 'line', 47
    find_lex $P153, "$type"
    set $S154, $P153
    iseq $I155, $S154, "ic"
    if $I155, if_1036
.annotate 'line', 52
    find_lex $P167, "$type"
    set $S168, $P167
    iseq $I169, $S168, "s"
    if $I169, if_1040
.annotate 'line', 65
    find_lex $P182, "$type"
    set $S183, $P182
    iseq $I184, $S183, "i"
    if $I184, if_1046
.annotate 'line', 79
    new $P196, 'String'
    set $P196, "unknown key type: "
    find_lex $P197, "$type"
    set $S198, $P197
    concat $P199, $P196, $S198
    die $P199
.annotate 'line', 78
    goto if_1046_end
  if_1046:
.annotate 'line', 65
    .const 'Sub' $P1048 = "19_1308206294.63873" 
    capture_lex $P1048
    $P195 = $P1048()
    set $P181, $P195
  if_1046_end:
    set $P166, $P181
.annotate 'line', 52
    goto if_1040_end
  if_1040:
    .const 'Sub' $P1042 = "18_1308206294.63873" 
    capture_lex $P1042
    $P180 = $P1042()
    set $P166, $P180
  if_1040_end:
    set $P152, $P166
.annotate 'line', 47
    goto if_1036_end
  if_1036:
    .const 'Sub' $P1038 = "17_1308206294.63873" 
    capture_lex $P1038
    $P165 = $P1038()
    set $P152, $P165
  if_1036_end:
    set $P135, $P152
.annotate 'line', 41
    goto if_1032_end
  if_1032:
    .const 'Sub' $P1034 = "16_1308206294.63873" 
    capture_lex $P1034
    $P151 = $P1034()
    set $P135, $P151
  if_1032_end:
.annotate 'line', 31
    .return ($P135)
.end


.namespace ["POST";"Key"]
.sub "_block1047"  :anon :subid("19_1308206294.63873") :outer("15_1308206294.63873")
.annotate 'line', 66
    new $P185, "Undef"
    set $P1049, $P185
    .lex "$k", $P1049
.annotate 'line', 67
    new $P186, "Undef"
    set $P1050, $P186
    .lex "$regno", $P1050
.annotate 'line', 66
    new $P187, "Key"
    store_lex "$k", $P187
.annotate 'line', 67
    find_lex $P1051, "%context"
    unless_null $P1051, vivify_30
    $P1051 = root_new ['parrot';'Hash']
  vivify_30:
    set $P188, $P1051["sub"]
    unless_null $P188, vivify_31
    new $P188, "Undef"
  vivify_31:
    find_lex $P189, "$part"
    $P190 = $P189."name"()
    $P191 = $P188."symbol"($P190)
    $P192 = $P191."regno"()
    store_lex "$regno", $P192
.annotate 'line', 68
    find_lex $P193, "$k"
    find_lex $P194, "$regno"
    $P193."set_register"($P194, 1)
.annotate 'line', 71

                .local pmc keys, k
                find_lex keys, "@keys"
                find_lex k, "$k"
                push keys, k
            
.annotate 'line', 65
    .return ()
.end


.namespace ["POST";"Key"]
.sub "_block1041"  :anon :subid("18_1308206294.63873") :outer("15_1308206294.63873")
.annotate 'line', 53
    new $P170, "Undef"
    set $P1043, $P170
    .lex "$k", $P1043
.annotate 'line', 54
    new $P171, "Undef"
    set $P1044, $P171
    .lex "$regno", $P1044
.annotate 'line', 53
    new $P172, "Key"
    store_lex "$k", $P172
.annotate 'line', 54
    find_lex $P1045, "%context"
    unless_null $P1045, vivify_32
    $P1045 = root_new ['parrot';'Hash']
  vivify_32:
    set $P173, $P1045["sub"]
    unless_null $P173, vivify_33
    new $P173, "Undef"
  vivify_33:
    find_lex $P174, "$part"
    $P175 = $P174."name"()
    $P176 = $P173."symbol"($P175)
    $P177 = $P176."regno"()
    store_lex "$regno", $P177
.annotate 'line', 55
    find_lex $P178, "$k"
    find_lex $P179, "$regno"
    $P178."set_register"($P179, 4)
.annotate 'line', 58

                .local pmc keys, k
                find_lex keys, "@keys"
                find_lex k, "$k"
                push keys, k
            
.annotate 'line', 52
    .return ()
.end


.namespace ["POST";"Key"]
.sub "_block1037"  :anon :subid("17_1308206294.63873") :outer("15_1308206294.63873")
.annotate 'line', 48
    new $P156, "Undef"
    set $P1039, $P156
    .lex "$k", $P1039
    new $P157, "Key"
    store_lex "$k", $P157
.annotate 'line', 49
    find_lex $P158, "$k"
    find_lex $P159, "$part"
    $P160 = $P159."value"()
    set $N161, $P160
    $P158."set_int"($N161)
.annotate 'line', 50
    find_lex $P162, "@keys"
    find_lex $P163, "$k"
    $P164 = $P162."push"($P163)
.annotate 'line', 47
    .return ($P164)
.end


.namespace ["POST";"Key"]
.sub "_block1033"  :anon :subid("16_1308206294.63873") :outer("15_1308206294.63873")
.annotate 'line', 42
    new $P139, "Undef"
    set $P1035, $P139
    .lex "$k", $P1035
    new $P140, "Key"
    store_lex "$k", $P140
.annotate 'line', 43
    find_lex $P141, "$k"
    find_lex $P142, "$part"
    $P143 = $P142."value"()
    set $S144, $P143
    $P141."set_str"($S144)
.annotate 'line', 44
    find_lex $P145, "$constants"
    find_lex $P146, "$part"
    $P147 = $P146."value"()
    $P145."get_or_create_string"($P147)
.annotate 'line', 45
    find_lex $P148, "@keys"
    find_lex $P149, "$k"
    $P150 = $P148."push"($P149)
.annotate 'line', 41
    .return ($P150)
.end


.namespace ["POST";"Key"]
.sub "_block1056" :load :anon :subid("20_1308206294.63873")
.annotate 'line', 9
    .const 'Sub' $P1058 = "11_1308206294.63873" 
    $P212 = $P1058()
    .return ($P212)
.end


.namespace []
.sub "_block1059" :load :anon :subid("21_1308206294.63873")
.annotate 'line', 1
    .const 'Sub' $P1061 = "10_1308206294.63873" 
    $P214 = $P1061()
    .return ($P214)
.end

