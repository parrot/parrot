
.namespace []
.sub "_block1000"  :anon :subid("10_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1003 = "11_1308507540.74291" 
    capture_lex $P1003
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 9
    .const 'Sub' $P1003 = "11_1308507540.74291" 
    capture_lex $P1003
    $P102 = $P1003()
.annotate 'line', 1
    .return ($P102)
    .const 'Sub' $P1060 = "21_1308507540.74291" 
    .return ($P1060)
.end


.namespace []
.sub "" :load :init :subid("post22") :outer("10_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 0
    .const 'Sub' $P1001 = "10_1308507540.74291" 
    .local pmc block
    set block, $P1001
    $P1062 = get_root_global ["parrot"], "P6metaclass"
    $P1062."new_class"("POST::Key", "POST::Value" :named("parent"))
.end


.namespace ["POST";"Key"]
.sub "_block1002"  :subid("11_1308507540.74291") :outer("10_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1014 = "14_1308507540.74291" 
    capture_lex $P1014
    .const 'Sub' $P1004 = "12_1308507540.74291" 
    capture_lex $P1004
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 27
    .const 'Sub' $P1014 = "14_1308507540.74291" 
    newclosure $P1055, $P1014
.annotate 'line', 9
    .return ($P1055)
    .const 'Sub' $P1057 = "20_1308507540.74291" 
    .return ($P1057)
.end


.namespace ["POST";"Key"]
.include "except_types.pasm"
.sub "Str"  :subid("12_1308507540.74291") :method :outer("11_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1008 = "13_1308507540.74291" 
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
    .const 'Sub' $P1008 = "13_1308507540.74291" 
    newclosure $P1013, $P1008
    $P106 = $P103."map"($P1013)
    $S101 = $P106."join"(";")
    concat $P107, $P101, $S101
    concat $P108, $P107, "]"
.annotate 'line', 9
    .return ($P108)
  control_1005:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P101, exception, "payload"
    .return ($P101)
.end


.namespace ["POST";"Key"]
.include "except_types.pasm"
.sub "_block1007"  :anon :subid("13_1308507540.74291") :outer("12_1308507540.74291")
    .param pmc param_1011
.annotate 'file', ''
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
.sub "to_pmc"  :subid("14_1308507540.74291") :method :outer("11_1308507540.74291")
    .param pmc param_1017
.annotate 'file', ''
.annotate 'line', 27
    .const 'Sub' $P1026 = "15_1308507540.74291" 
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
    new $P101, "Undef"
    set $P1020, $P101
    .lex "$constants", $P1020
.annotate 'line', 84
    new $P102, "Undef"
    set $P1021, $P102
    .lex "$key_pmc", $P1021
.annotate 'line', 107
    $P1023 = root_new ['parrot';'ResizablePMCArray']
    set $P1022, $P1023
    .lex "@res", $P1022
.annotate 'line', 27
    find_lex $P103, "@keys"
.annotate 'line', 29
    find_lex $P1024, "%context"
    unless_null $P1024, vivify_25
    $P1024 = root_new ['parrot';'Hash']
  vivify_25:
    set $P103, $P1024["constants"]
    unless_null $P103, vivify_26
    new $P103, "Undef"
  vivify_26:
    store_lex "$constants", $P103
.annotate 'line', 31
    find_lex $P104, "self"
    $P105 = $P104."list"()
    defined $I101, $P105
    unless $I101, for_undef_27
    iter $P103, $P105
    new $P109, 'ExceptionHandler'
    set_label $P109, loop1052_handler
    $P109."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P109
  loop1052_test:
    unless $P103, loop1052_done
    shift $P106, $P103
  loop1052_redo:
    .const 'Sub' $P1026 = "15_1308507540.74291" 
    capture_lex $P1026
    $P1026($P106)
  loop1052_next:
    goto loop1052_test
  loop1052_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, 'type'
    eq $P110, .CONTROL_LOOP_NEXT, loop1052_next
    eq $P110, .CONTROL_LOOP_REDO, loop1052_redo
  loop1052_done:
    pop_eh 
  for_undef_27:
.annotate 'line', 27
    find_lex $P103, "$key_pmc"
.annotate 'line', 85
    find_lex $P103, "@keys"
    set $N101, $P103
    unless $N101, if_1053_end
.annotate 'line', 86

            .local pmc keys, key_pmc
            find_lex keys, "@keys"
            find_lex key_pmc, "$key_pmc"
            key_pmc = shift keys
            store_lex "$key_pmc", key_pmc
        
.annotate 'line', 94
    new $P105, 'ExceptionHandler'
    set_label $P105, loop1054_handler
    $P105."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P105
  loop1054_test:
    find_lex $P104, "@keys"
    set $N102, $P104
    unless $N102, loop1054_done
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
    getattribute $P106, exception, 'type'
    eq $P106, .CONTROL_LOOP_NEXT, loop1054_next
    eq $P106, .CONTROL_LOOP_REDO, loop1054_redo
  loop1054_done:
    pop_eh 
  if_1053_end:
.annotate 'line', 27
    find_lex $P103, "@res"
.annotate 'line', 108

        .local pmc key_pmc, res
        find_lex res, "@res"
        find_lex key_pmc, "$key_pmc"
        push res, key_pmc
    
.annotate 'line', 27
    find_lex $P103, "@res"
    .return ($P103)
  control_1015:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, "payload"
    .return ($P104)
.end


.namespace ["POST";"Key"]
.sub "_block1025"  :anon :subid("15_1308507540.74291") :outer("14_1308507540.74291")
    .param pmc param_1027
.annotate 'file', ''
.annotate 'line', 31
    .const 'Sub' $P1048 = "19_1308507540.74291" 
    capture_lex $P1048
    .const 'Sub' $P1042 = "18_1308507540.74291" 
    capture_lex $P1042
    .const 'Sub' $P1038 = "17_1308507540.74291" 
    capture_lex $P1038
    .const 'Sub' $P1034 = "16_1308507540.74291" 
    capture_lex $P1034
    .lex "$part", param_1027
.annotate 'line', 32
    new $P107, "Undef"
    set $P1028, $P107
    .lex "$type", $P1028
    find_lex $P108, "$part"
    $P109 = $P108."type"()
    store_lex "$type", $P109
.annotate 'line', 35
    find_lex $P108, "$type"
    if $P108, unless_1029_end
.annotate 'line', 36
    find_lex $P1030, "%context"
    unless_null $P1030, vivify_28
    $P1030 = root_new ['parrot';'Hash']
  vivify_28:
    set $P109, $P1030["sub"]
    unless_null $P109, vivify_29
    new $P109, "Undef"
  vivify_29:
    find_lex $P110, "$part"
    $P111 = $P110."name"()
    $P112 = $P109."symbol"($P111)
    $P113 = $P112."type"()
    store_lex "$type", $P113
  unless_1029_end:
.annotate 'line', 39
    find_lex $P108, "$type"
    if $P108, unless_1031_end
    new $P109, 'String'
    set $P109, "Can't find type for "
    find_lex $P110, "$part"
    $P111 = $P110."name"()
    set $S101, $P111
    concat $P110, $P109, $S101
    die $P110
  unless_1031_end:
.annotate 'line', 41
    find_lex $P109, "$type"
    set $S101, $P109
    iseq $I102, $S101, "sc"
    if $I102, if_1032
.annotate 'line', 47
    find_lex $P114, "$type"
    set $S102, $P114
    iseq $I103, $S102, "ic"
    if $I103, if_1036
.annotate 'line', 52
    find_lex $P119, "$type"
    set $S103, $P119
    iseq $I104, $S103, "s"
    if $I104, if_1040
.annotate 'line', 65
    find_lex $P124, "$type"
    set $S104, $P124
    iseq $I105, $S104, "i"
    if $I105, if_1046
.annotate 'line', 79
    new $P128, 'String'
    set $P128, "unknown key type: "
    find_lex $P129, "$type"
    set $S105, $P129
    concat $P130, $P128, $S105
    die $P130
.annotate 'line', 78
    goto if_1046_end
  if_1046:
.annotate 'line', 65
    .const 'Sub' $P1048 = "19_1308507540.74291" 
    capture_lex $P1048
    $P127 = $P1048()
    set $P123, $P127
  if_1046_end:
    set $P117, $P123
.annotate 'line', 52
    goto if_1040_end
  if_1040:
    .const 'Sub' $P1042 = "18_1308507540.74291" 
    capture_lex $P1042
    $P122 = $P1042()
    set $P117, $P122
  if_1040_end:
    set $P112, $P117
.annotate 'line', 47
    goto if_1036_end
  if_1036:
    .const 'Sub' $P1038 = "17_1308507540.74291" 
    capture_lex $P1038
    $P116 = $P1038()
    set $P112, $P116
  if_1036_end:
    set $P108, $P112
.annotate 'line', 41
    goto if_1032_end
  if_1032:
    .const 'Sub' $P1034 = "16_1308507540.74291" 
    capture_lex $P1034
    $P111 = $P1034()
    set $P108, $P111
  if_1032_end:
.annotate 'line', 31
    .return ($P108)
.end


.namespace ["POST";"Key"]
.sub "_block1047"  :anon :subid("19_1308507540.74291") :outer("15_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 66
    new $P125, "Undef"
    set $P1049, $P125
    .lex "$k", $P1049
.annotate 'line', 67
    new $P126, "Undef"
    set $P1050, $P126
    .lex "$regno", $P1050
.annotate 'line', 66
    new $P127, "Key"
    store_lex "$k", $P127
.annotate 'line', 67
    find_lex $P1051, "%context"
    unless_null $P1051, vivify_30
    $P1051 = root_new ['parrot';'Hash']
  vivify_30:
    set $P127, $P1051["sub"]
    unless_null $P127, vivify_31
    new $P127, "Undef"
  vivify_31:
    find_lex $P128, "$part"
    $P129 = $P128."name"()
    $P130 = $P127."symbol"($P129)
    $P131 = $P130."regno"()
    store_lex "$regno", $P131
.annotate 'line', 68
    find_lex $P127, "$k"
    find_lex $P128, "$regno"
    $P127."set_register"($P128, 1)
.annotate 'line', 71

                .local pmc keys, k
                find_lex keys, "@keys"
                find_lex k, "$k"
                push keys, k
            
.annotate 'line', 65
    .return ()
.end


.namespace ["POST";"Key"]
.sub "_block1041"  :anon :subid("18_1308507540.74291") :outer("15_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 53
    new $P120, "Undef"
    set $P1043, $P120
    .lex "$k", $P1043
.annotate 'line', 54
    new $P121, "Undef"
    set $P1044, $P121
    .lex "$regno", $P1044
.annotate 'line', 53
    new $P122, "Key"
    store_lex "$k", $P122
.annotate 'line', 54
    find_lex $P1045, "%context"
    unless_null $P1045, vivify_32
    $P1045 = root_new ['parrot';'Hash']
  vivify_32:
    set $P122, $P1045["sub"]
    unless_null $P122, vivify_33
    new $P122, "Undef"
  vivify_33:
    find_lex $P123, "$part"
    $P124 = $P123."name"()
    $P125 = $P122."symbol"($P124)
    $P126 = $P125."regno"()
    store_lex "$regno", $P126
.annotate 'line', 55
    find_lex $P122, "$k"
    find_lex $P123, "$regno"
    $P122."set_register"($P123, 4)
.annotate 'line', 58

                .local pmc keys, k
                find_lex keys, "@keys"
                find_lex k, "$k"
                push keys, k
            
.annotate 'line', 52
    .return ()
.end


.namespace ["POST";"Key"]
.sub "_block1037"  :anon :subid("17_1308507540.74291") :outer("15_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 48
    new $P115, "Undef"
    set $P1039, $P115
    .lex "$k", $P1039
    new $P116, "Key"
    store_lex "$k", $P116
.annotate 'line', 49
    find_lex $P116, "$k"
    find_lex $P117, "$part"
    $P118 = $P117."value"()
    set $N101, $P118
    $P116."set_int"($N101)
.annotate 'line', 50
    find_lex $P116, "@keys"
    find_lex $P117, "$k"
    $P118 = $P116."push"($P117)
.annotate 'line', 47
    .return ($P118)
.end


.namespace ["POST";"Key"]
.sub "_block1033"  :anon :subid("16_1308507540.74291") :outer("15_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 42
    new $P110, "Undef"
    set $P1035, $P110
    .lex "$k", $P1035
    new $P111, "Key"
    store_lex "$k", $P111
.annotate 'line', 43
    find_lex $P111, "$k"
    find_lex $P112, "$part"
    $P113 = $P112."value"()
    set $S102, $P113
    $P111."set_str"($S102)
.annotate 'line', 44
    find_lex $P111, "$constants"
    find_lex $P112, "$part"
    $P113 = $P112."value"()
    $P111."get_or_create_string"($P113)
.annotate 'line', 45
    find_lex $P111, "@keys"
    find_lex $P112, "$k"
    $P113 = $P111."push"($P112)
.annotate 'line', 41
    .return ($P113)
.end


.namespace ["POST";"Key"]
.sub "_block1056" :load :anon :subid("20_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 9
    .const 'Sub' $P1058 = "11_1308507540.74291" 
    $P101 = $P1058()
    .return ($P101)
.end


.namespace []
.sub "_block1059" :load :anon :subid("21_1308507540.74291")
.annotate 'file', ''
.annotate 'line', 1
    .const 'Sub' $P1061 = "10_1308507540.74291" 
    $P101 = $P1061()
    .return ($P101)
.end

