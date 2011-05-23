
.namespace []
.sub "_block11"  :anon :subid("10_1305940113.98211")
.annotate 'line', 0
    .const 'Sub' $P512 = "48_1305940113.98211" 
    capture_lex $P512
    .const 'Sub' $P499 = "47_1305940113.98211" 
    capture_lex $P499
    .const 'Sub' $P471 = "45_1305940113.98211" 
    capture_lex $P471
    .const 'Sub' $P397 = "41_1305940113.98211" 
    capture_lex $P397
    .const 'Sub' $P308 = "39_1305940113.98211" 
    capture_lex $P308
    .const 'Sub' $P273 = "37_1305940113.98211" 
    capture_lex $P273
    .const 'Sub' $P267 = "36_1305940113.98211" 
    capture_lex $P267
    .const 'Sub' $P188 = "27_1305940113.98211" 
    capture_lex $P188
    .const 'Sub' $P181 = "26_1305940113.98211" 
    capture_lex $P181
    .const 'Sub' $P172 = "25_1305940113.98211" 
    capture_lex $P172
    .const 'Sub' $P163 = "24_1305940113.98211" 
    capture_lex $P163
    .const 'Sub' $P154 = "23_1305940113.98211" 
    capture_lex $P154
    .const 'Sub' $P58 = "13_1305940113.98211" 
    capture_lex $P58
    .const 'Sub' $P49 = "12_1305940113.98211" 
    capture_lex $P49
    .const 'Sub' $P13 = "11_1305940113.98211" 
    capture_lex $P13
.annotate 'line', 279
    .const 'Sub' $P13 = "11_1305940113.98211" 
    newclosure $P48, $P13
    .lex "open", $P48
.annotate 'line', 291
    .const 'Sub' $P49 = "12_1305940113.98211" 
    newclosure $P56, $P49
    .lex "close", $P56
.annotate 'line', 1
    $P0 = find_dynamic_lex "$*CTXSAVE"
    if null $P0 goto ctxsave_done
    $I0 = can $P0, "ctxsave"
    unless $I0 goto ctxsave_done
    $P0."ctxsave"()
  ctxsave_done:
.annotate 'line', 18
    .const 'Sub' $P58 = "13_1305940113.98211" 
    capture_lex $P58
    $P58()
.annotate 'line', 98
    .const 'Sub' $P188 = "27_1305940113.98211" 
    capture_lex $P188
    $P188()
.annotate 'line', 257
    find_lex $P497, "open"
    find_lex $P498, "close"
.annotate 'line', 311
    .const 'Sub' $P512 = "48_1305940113.98211" 
    newclosure $P526, $P512
.annotate 'line', 1
    .return ($P526)
    .const 'Sub' $P528 = "49_1305940113.98211" 
    .return ($P528)
.end


.namespace []
.include "except_types.pasm"
.sub "open"  :subid("11_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_16
    .param pmc param_17 :optional :named("r")
    .param int has_param_17 :opt_flag
    .param pmc param_19 :optional :named("w")
    .param int has_param_19 :opt_flag
    .param pmc param_21 :optional :named("a")
    .param int has_param_21 :opt_flag
    .param pmc param_23 :optional :named("bin")
    .param int has_param_23 :opt_flag
.annotate 'line', 279
    new $P15, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P15, control_14
    push_eh $P15
    .lex "$filename", param_16
    if has_param_17, optparam_50
    new $P18, "Undef"
    set param_17, $P18
  optparam_50:
    .lex "$r", param_17
    if has_param_19, optparam_51
    new $P20, "Undef"
    set param_19, $P20
  optparam_51:
    .lex "$w", param_19
    if has_param_21, optparam_52
    new $P22, "Undef"
    set param_21, $P22
  optparam_52:
    .lex "$a", param_21
    if has_param_23, optparam_53
    new $P24, "Undef"
    set param_23, $P24
  optparam_53:
    .lex "$bin", param_23
.annotate 'line', 280
    new $P25, "Undef"
    .lex "$mode", $P25
.annotate 'line', 281
    new $P26, "Undef"
    .lex "$handle", $P26
.annotate 'line', 280
    find_lex $P29, "$w"
    if $P29, if_28
    find_lex $P33, "$a"
    if $P33, if_32
    new $P35, "String"
    assign $P35, "r"
    set $P31, $P35
    goto if_32_end
  if_32:
    new $P34, "String"
    assign $P34, "wa"
    set $P31, $P34
  if_32_end:
    set $P27, $P31
    goto if_28_end
  if_28:
    new $P30, "String"
    assign $P30, "w"
    set $P27, $P30
  if_28_end:
    store_lex "$mode", $P27
.annotate 'line', 281
    new $P36, "FileHandle"
    store_lex "$handle", $P36
.annotate 'line', 282
    find_lex $P37, "$handle"
    find_lex $P38, "$filename"
    find_lex $P39, "$mode"
    $P37."open"($P38, $P39)
.annotate 'line', 283
    find_lex $P40, "$handle"
    find_lex $P43, "$bin"
    if $P43, if_42
    new $P45, "String"
    assign $P45, "utf8"
    set $P41, $P45
    goto if_42_end
  if_42:
    new $P44, "String"
    assign $P44, "binary"
    set $P41, $P44
  if_42_end:
    $P40."encoding"($P41)
    find_lex $P46, "$handle"
.annotate 'line', 279
    .return ($P46)
  control_14:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P47, exception, "payload"
    .return ($P47)
.end


.namespace []
.include "except_types.pasm"
.sub "close"  :subid("12_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_52
.annotate 'line', 291
    new $P51, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P51, control_50
    push_eh $P51
    .lex "$handle", param_52
.annotate 'line', 292
    find_lex $P53, "$handle"
    $P54 = $P53."close"()
.annotate 'line', 291
    .return ($P54)
  control_50:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P55, exception, "payload"
    .return ($P55)
.end


.namespace ["ResizablePMCArray"]
.sub "_block57"  :subid("13_1305940113.98211") :outer("10_1305940113.98211")
.annotate 'line', 18
    .const 'Sub' $P133 = "21_1305940113.98211" 
    capture_lex $P133
    .const 'Sub' $P107 = "19_1305940113.98211" 
    capture_lex $P107
    .const 'Sub' $P84 = "17_1305940113.98211" 
    capture_lex $P84
    .const 'Sub' $P74 = "16_1305940113.98211" 
    capture_lex $P74
    .const 'Sub' $P66 = "15_1305940113.98211" 
    capture_lex $P66
    .const 'Sub' $P59 = "14_1305940113.98211" 
    capture_lex $P59
.annotate 'line', 71
    .const 'Sub' $P133 = "21_1305940113.98211" 
    newclosure $P153, $P133
.annotate 'line', 18
    .return ($P153)
.end


.namespace ["ResizablePMCArray"]
.include "except_types.pasm"
.sub "delete"  :subid("14_1305940113.98211") :method :outer("13_1305940113.98211")
    .param pmc param_62
.annotate 'line', 24
    new $P61, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P61, control_60
    push_eh $P61
    .lex "self", self
    .lex "$pos", param_62
.annotate 'line', 25
    find_lex $P64, "$pos"
    find_lex $P63, "self"
    delete $P63[$P64]
.annotate 'line', 24
    .return ()
  control_60:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P65, exception, "payload"
    .return ($P65)
.end


.namespace ["ResizablePMCArray"]
.include "except_types.pasm"
.sub "exists"  :subid("15_1305940113.98211") :method :outer("13_1305940113.98211")
    .param pmc param_69
.annotate 'line', 32
    new $P68, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P68, control_67
    push_eh $P68
    .lex "self", self
    .lex "$pos", param_69
.annotate 'line', 33
    find_lex $P71, "$pos"
    find_lex $P70, "self"
    exists $I72, $P70[$P71]
.annotate 'line', 32
    .return ($I72)
  control_67:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P73, exception, "payload"
    .return ($P73)
.end


.namespace ["ResizablePMCArray"]
.include "except_types.pasm"
.sub "join"  :subid("16_1305940113.98211") :method :outer("13_1305940113.98211")
    .param pmc param_77 :optional
    .param int has_param_77 :opt_flag
.annotate 'line', 40
    new $P76, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P76, control_75
    push_eh $P76
    .lex "self", self
    if has_param_77, optparam_54
    new $P78, "String"
    assign $P78, ""
    set param_77, $P78
  optparam_54:
    .lex "$separator", param_77
.annotate 'line', 41
    find_lex $P79, "$separator"
    set $S80, $P79
    find_lex $P81, "self"
    join $S82, $S80, $P81
.annotate 'line', 40
    .return ($S82)
  control_75:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P83, exception, "payload"
    .return ($P83)
.end


.namespace ["ResizablePMCArray"]
.include "except_types.pasm"
.sub "map"  :subid("17_1305940113.98211") :method :outer("13_1305940113.98211")
    .param pmc param_87
.annotate 'line', 51
    .const 'Sub' $P95 = "18_1305940113.98211" 
    capture_lex $P95
    new $P86, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P86, control_85
    push_eh $P86
    .lex "self", self
    .lex "&code", param_87
.annotate 'line', 52
    $P88 = root_new ['parrot';'ResizablePMCArray']
    .lex "@mapped", $P88
.annotate 'line', 51
    find_lex $P89, "@mapped"
.annotate 'line', 53
    find_lex $P91, "self"
    defined $I92, $P91
    unless $I92, for_undef_55
    iter $P90, $P91
    new $P103, 'ExceptionHandler'
    set_label $P103, loop102_handler
    $P103."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P103
  loop102_test:
    unless $P90, loop102_done
    shift $P93, $P90
  loop102_redo:
    .const 'Sub' $P95 = "18_1305940113.98211" 
    capture_lex $P95
    $P95($P93)
  loop102_next:
    goto loop102_test
  loop102_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P104, exception, 'type'
    eq $P104, .CONTROL_LOOP_NEXT, loop102_next
    eq $P104, .CONTROL_LOOP_REDO, loop102_redo
  loop102_done:
    pop_eh 
  for_undef_55:
    find_lex $P105, "@mapped"
.annotate 'line', 51
    .return ($P105)
  control_85:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P106, exception, "payload"
    .return ($P106)
.end


.namespace ["ResizablePMCArray"]
.sub "_block94"  :anon :subid("18_1305940113.98211") :outer("17_1305940113.98211")
    .param pmc param_96
.annotate 'line', 53
    .lex "$_", param_96
    find_lex $P97, "@mapped"
    find_lex $P98, "&code"
    find_lex $P99, "$_"
    $P100 = $P98($P99)
    $P101 = $P97."push"($P100)
    .return ($P101)
.end


.namespace ["ResizablePMCArray"]
.include "except_types.pasm"
.sub "grep"  :subid("19_1305940113.98211") :method :outer("13_1305940113.98211")
    .param pmc param_110
.annotate 'line', 61
    .const 'Sub' $P118 = "20_1305940113.98211" 
    capture_lex $P118
    new $P109, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P109, control_108
    push_eh $P109
    .lex "self", self
    .lex "&code", param_110
.annotate 'line', 62
    $P111 = root_new ['parrot';'ResizablePMCArray']
    .lex "@grepped", $P111
.annotate 'line', 61
    find_lex $P112, "@grepped"
.annotate 'line', 63
    find_lex $P114, "self"
    defined $I115, $P114
    unless $I115, for_undef_56
    iter $P113, $P114
    new $P129, 'ExceptionHandler'
    set_label $P129, loop128_handler
    $P129."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P129
  loop128_test:
    unless $P113, loop128_done
    shift $P116, $P113
  loop128_redo:
    .const 'Sub' $P118 = "20_1305940113.98211" 
    capture_lex $P118
    $P118($P116)
  loop128_next:
    goto loop128_test
  loop128_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P130, exception, 'type'
    eq $P130, .CONTROL_LOOP_NEXT, loop128_next
    eq $P130, .CONTROL_LOOP_REDO, loop128_redo
  loop128_done:
    pop_eh 
  for_undef_56:
    find_lex $P131, "@grepped"
.annotate 'line', 61
    .return ($P131)
  control_108:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P132, exception, "payload"
    .return ($P132)
.end


.namespace ["ResizablePMCArray"]
.sub "_block117"  :anon :subid("20_1305940113.98211") :outer("19_1305940113.98211")
    .param pmc param_119
.annotate 'line', 63
    .lex "$_", param_119
    find_lex $P122, "&code"
    find_lex $P123, "$_"
    $P124 = $P122($P123)
    if $P124, if_121
    set $P120, $P124
    goto if_121_end
  if_121:
    find_lex $P125, "@grepped"
    find_lex $P126, "$_"
    $P127 = $P125."push"($P126)
    set $P120, $P127
  if_121_end:
    .return ($P120)
.end


.namespace ["ResizablePMCArray"]
.include "except_types.pasm"
.sub "reverse"  :subid("21_1305940113.98211") :method :outer("13_1305940113.98211")
.annotate 'line', 71
    .const 'Sub' $P143 = "22_1305940113.98211" 
    capture_lex $P143
    new $P135, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P135, control_134
    push_eh $P135
    .lex "self", self
.annotate 'line', 72
    $P136 = root_new ['parrot';'ResizablePMCArray']
    .lex "@reversed", $P136
.annotate 'line', 71
    find_lex $P137, "@reversed"
.annotate 'line', 73
    find_lex $P139, "self"
    defined $I140, $P139
    unless $I140, for_undef_57
    iter $P138, $P139
    new $P149, 'ExceptionHandler'
    set_label $P149, loop148_handler
    $P149."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P149
  loop148_test:
    unless $P138, loop148_done
    shift $P141, $P138
  loop148_redo:
    .const 'Sub' $P143 = "22_1305940113.98211" 
    capture_lex $P143
    $P143($P141)
  loop148_next:
    goto loop148_test
  loop148_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P150, exception, 'type'
    eq $P150, .CONTROL_LOOP_NEXT, loop148_next
    eq $P150, .CONTROL_LOOP_REDO, loop148_redo
  loop148_done:
    pop_eh 
  for_undef_57:
    find_lex $P151, "@reversed"
.annotate 'line', 71
    .return ($P151)
  control_134:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P152, exception, "payload"
    .return ($P152)
.end


.namespace ["ResizablePMCArray"]
.sub "_block142"  :anon :subid("22_1305940113.98211") :outer("21_1305940113.98211")
    .param pmc param_144
.annotate 'line', 73
    .lex "$_", param_144
    find_lex $P145, "@reversed"
    find_lex $P146, "$_"
    $P147 = $P145."unshift"($P146)
    .return ($P147)
.end


.namespace []
.include "except_types.pasm"
.sub "join"  :subid("23_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_157
    .param pmc param_158 :slurpy
.annotate 'line', 79
    new $P156, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P156, control_155
    push_eh $P156
    .lex "$separator", param_157
    .lex "@values", param_158
    find_lex $P159, "@values"
    find_lex $P160, "$separator"
    $P161 = $P159."join"($P160)
    .return ($P161)
  control_155:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P162, exception, "payload"
    .return ($P162)
.end


.namespace []
.include "except_types.pasm"
.sub "map"  :subid("24_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_166
    .param pmc param_167 :slurpy
.annotate 'line', 80
    new $P165, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P165, control_164
    push_eh $P165
    .lex "&code", param_166
    .lex "@values", param_167
    find_lex $P168, "@values"
    find_lex $P169, "&code"
    $P170 = $P168."map"($P169)
    .return ($P170)
  control_164:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P171, exception, "payload"
    .return ($P171)
.end


.namespace []
.include "except_types.pasm"
.sub "grep"  :subid("25_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_175
    .param pmc param_176 :slurpy
.annotate 'line', 81
    new $P174, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P174, control_173
    push_eh $P174
    .lex "&code", param_175
    .lex "@values", param_176
    find_lex $P177, "@values"
    find_lex $P178, "&code"
    $P179 = $P177."grep"($P178)
    .return ($P179)
  control_173:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P180, exception, "payload"
    .return ($P180)
.end


.namespace []
.include "except_types.pasm"
.sub "list"  :subid("26_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_184 :slurpy
.annotate 'line', 82
    new $P183, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P183, control_182
    push_eh $P183
    .lex "@values", param_184
    find_lex $P185, "@values"
    .return ($P185)
  control_182:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P186, exception, "payload"
    .return ($P186)
.end


.namespace ["Hash"]
.sub "_block187"  :subid("27_1305940113.98211") :outer("10_1305940113.98211")
.annotate 'line', 98
    .const 'Sub' $P245 = "34_1305940113.98211" 
    capture_lex $P245
    .const 'Sub' $P221 = "32_1305940113.98211" 
    capture_lex $P221
    .const 'Sub' $P200 = "30_1305940113.98211" 
    capture_lex $P200
    .const 'Sub' $P194 = "29_1305940113.98211" 
    capture_lex $P194
    .const 'Sub' $P189 = "28_1305940113.98211" 
    capture_lex $P189
.annotate 'line', 151
    .const 'Sub' $P245 = "34_1305940113.98211" 
    newclosure $P266, $P245
.annotate 'line', 98
    .return ($P266)
.end


.namespace ["Hash"]
.include "except_types.pasm"
.sub "delete"  :subid("28_1305940113.98211") :method :outer("27_1305940113.98211")
    .param pmc param_192
.annotate 'line', 104
    new $P191, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P191, control_190
    push_eh $P191
    .lex "self", self
    .lex "$key", param_192
.annotate 'line', 105

            $P1 = find_lex '$key'
            delete self[$P1]
        
.annotate 'line', 104
    .return ()
  control_190:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P193, exception, "payload"
    .return ($P193)
.end


.namespace ["Hash"]
.include "except_types.pasm"
.sub "exists"  :subid("29_1305940113.98211") :method :outer("27_1305940113.98211")
    .param pmc param_197
.annotate 'line', 116
    new $P196, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P196, control_195
    push_eh $P196
    .lex "self", self
    .lex "$key", param_197
.annotate 'line', 117

            $P1 = find_lex '$key'
            $I0 = exists self[$P1]
            $P198  = box $I0
        
.annotate 'line', 116
    .return ($P198)
  control_195:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P199, exception, "payload"
    .return ($P199)
.end


.namespace ["Hash"]
.include "except_types.pasm"
.sub "keys"  :subid("30_1305940113.98211") :method :outer("27_1305940113.98211")
.annotate 'line', 129
    .const 'Sub' $P210 = "31_1305940113.98211" 
    capture_lex $P210
    new $P202, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P202, control_201
    push_eh $P202
    .lex "self", self
.annotate 'line', 130
    $P203 = root_new ['parrot';'ResizablePMCArray']
    .lex "@keys", $P203
.annotate 'line', 129
    find_lex $P204, "@keys"
.annotate 'line', 131
    find_lex $P206, "self"
    defined $I207, $P206
    unless $I207, for_undef_58
    iter $P205, $P206
    new $P217, 'ExceptionHandler'
    set_label $P217, loop216_handler
    $P217."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P217
  loop216_test:
    unless $P205, loop216_done
    shift $P208, $P205
  loop216_redo:
    .const 'Sub' $P210 = "31_1305940113.98211" 
    capture_lex $P210
    $P210($P208)
  loop216_next:
    goto loop216_test
  loop216_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P218, exception, 'type'
    eq $P218, .CONTROL_LOOP_NEXT, loop216_next
    eq $P218, .CONTROL_LOOP_REDO, loop216_redo
  loop216_done:
    pop_eh 
  for_undef_58:
    find_lex $P219, "@keys"
.annotate 'line', 129
    .return ($P219)
  control_201:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P220, exception, "payload"
    .return ($P220)
.end


.namespace ["Hash"]
.sub "_block209"  :anon :subid("31_1305940113.98211") :outer("30_1305940113.98211")
    .param pmc param_211
.annotate 'line', 131
    .lex "$_", param_211
    find_lex $P212, "@keys"
    find_lex $P213, "$_"
    $P214 = $P213."key"()
    $P215 = $P212."push"($P214)
    .return ($P215)
.end


.namespace ["Hash"]
.include "except_types.pasm"
.sub "kv"  :subid("32_1305940113.98211") :method :outer("27_1305940113.98211")
.annotate 'line', 140
    .const 'Sub' $P231 = "33_1305940113.98211" 
    capture_lex $P231
    new $P223, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P223, control_222
    push_eh $P223
    .lex "self", self
.annotate 'line', 141
    $P224 = root_new ['parrot';'ResizablePMCArray']
    .lex "@kv", $P224
.annotate 'line', 140
    find_lex $P225, "@kv"
.annotate 'line', 142
    find_lex $P227, "self"
    defined $I228, $P227
    unless $I228, for_undef_59
    iter $P226, $P227
    new $P241, 'ExceptionHandler'
    set_label $P241, loop240_handler
    $P241."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P241
  loop240_test:
    unless $P226, loop240_done
    shift $P229, $P226
  loop240_redo:
    .const 'Sub' $P231 = "33_1305940113.98211" 
    capture_lex $P231
    $P231($P229)
  loop240_next:
    goto loop240_test
  loop240_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P242, exception, 'type'
    eq $P242, .CONTROL_LOOP_NEXT, loop240_next
    eq $P242, .CONTROL_LOOP_REDO, loop240_redo
  loop240_done:
    pop_eh 
  for_undef_59:
    find_lex $P243, "@kv"
.annotate 'line', 140
    .return ($P243)
  control_222:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P244, exception, "payload"
    .return ($P244)
.end


.namespace ["Hash"]
.sub "_block230"  :anon :subid("33_1305940113.98211") :outer("32_1305940113.98211")
    .param pmc param_232
.annotate 'line', 142
    .lex "$_", param_232
    find_lex $P233, "@kv"
    find_lex $P234, "$_"
    $P235 = $P234."key"()
    $P233."push"($P235)
    find_lex $P236, "@kv"
    find_lex $P237, "$_"
    $P238 = $P237."value"()
    $P239 = $P236."push"($P238)
    .return ($P239)
.end


.namespace ["Hash"]
.include "except_types.pasm"
.sub "values"  :subid("34_1305940113.98211") :method :outer("27_1305940113.98211")
.annotate 'line', 151
    .const 'Sub' $P255 = "35_1305940113.98211" 
    capture_lex $P255
    new $P247, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P247, control_246
    push_eh $P247
    .lex "self", self
.annotate 'line', 152
    $P248 = root_new ['parrot';'ResizablePMCArray']
    .lex "@values", $P248
.annotate 'line', 151
    find_lex $P249, "@values"
.annotate 'line', 153
    find_lex $P251, "self"
    defined $I252, $P251
    unless $I252, for_undef_60
    iter $P250, $P251
    new $P262, 'ExceptionHandler'
    set_label $P262, loop261_handler
    $P262."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P262
  loop261_test:
    unless $P250, loop261_done
    shift $P253, $P250
  loop261_redo:
    .const 'Sub' $P255 = "35_1305940113.98211" 
    capture_lex $P255
    $P255($P253)
  loop261_next:
    goto loop261_test
  loop261_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P263, exception, 'type'
    eq $P263, .CONTROL_LOOP_NEXT, loop261_next
    eq $P263, .CONTROL_LOOP_REDO, loop261_redo
  loop261_done:
    pop_eh 
  for_undef_60:
    find_lex $P264, "@values"
.annotate 'line', 151
    .return ($P264)
  control_246:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P265, exception, "payload"
    .return ($P265)
.end


.namespace ["Hash"]
.sub "_block254"  :anon :subid("35_1305940113.98211") :outer("34_1305940113.98211")
    .param pmc param_256
.annotate 'line', 153
    .lex "$_", param_256
    find_lex $P257, "@values"
    find_lex $P258, "$_"
    $P259 = $P258."value"()
    $P260 = $P257."push"($P259)
    .return ($P260)
.end


.namespace []
.include "except_types.pasm"
.sub "hash"  :subid("36_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_270 :slurpy :named
.annotate 'line', 164
    new $P269, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P269, control_268
    push_eh $P269
    .lex "%h", param_270
    find_lex $P271, "%h"
    .return ($P271)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P272, exception, "payload"
    .return ($P272)
.end


.namespace []
.include "except_types.pasm"
.sub "match"  :subid("37_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_276
    .param pmc param_277
    .param pmc param_278 :optional :named("global")
    .param int has_param_278 :opt_flag
.annotate 'line', 182
    .const 'Sub' $P288 = "38_1305940113.98211" 
    capture_lex $P288
    new $P275, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P275, control_274
    push_eh $P275
    .lex "$text", param_276
    .lex "$regex", param_277
    if has_param_278, optparam_61
    new $P279, "Undef"
    set param_278, $P279
  optparam_61:
    .lex "$global", param_278
.annotate 'line', 183
    new $P280, "Undef"
    .lex "$match", $P280
    find_lex $P281, "$regex"
    find_lex $P282, "$text"
    $P283 = $P281."ACCEPTS"($P282)
    store_lex "$match", $P283
.annotate 'line', 184
    find_lex $P286, "$global"
    if $P286, if_285
.annotate 'line', 192
    find_lex $P306, "$match"
    set $P284, $P306
.annotate 'line', 184
    goto if_285_end
  if_285:
    .const 'Sub' $P288 = "38_1305940113.98211" 
    capture_lex $P288
    $P305 = $P288()
    set $P284, $P305
  if_285_end:
.annotate 'line', 182
    .return ($P284)
  control_274:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P307, exception, "payload"
    .return ($P307)
.end


.namespace []
.include "except_types.pasm"
.sub "_block287"  :anon :subid("38_1305940113.98211") :outer("37_1305940113.98211")
.annotate 'line', 185
    $P289 = root_new ['parrot';'ResizablePMCArray']
    .lex "@matches", $P289
.annotate 'line', 184
    find_lex $P290, "@matches"
.annotate 'line', 186
    new $P302, 'ExceptionHandler'
    set_label $P302, loop301_handler
    $P302."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P302
  loop301_test:
    find_lex $P291, "$match"
    unless $P291, loop301_done
  loop301_redo:
.annotate 'line', 187
    find_lex $P292, "@matches"
    find_lex $P293, "$match"
    $P292."push"($P293)
.annotate 'line', 188
    find_lex $P294, "$match"
    $P295 = $P294."CURSOR"()
    find_lex $P296, "$text"
    find_lex $P297, "$regex"
    find_lex $P298, "$match"
    $P299 = $P298."to"()
    $P300 = $P295."parse"($P296, $P297 :named("rule"), $P299 :named("c"))
    store_lex "$match", $P300
  loop301_next:
.annotate 'line', 186
    goto loop301_test
  loop301_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P303, exception, 'type'
    eq $P303, .CONTROL_LOOP_NEXT, loop301_next
    eq $P303, .CONTROL_LOOP_REDO, loop301_redo
  loop301_done:
    pop_eh 
    find_lex $P304, "@matches"
.annotate 'line', 184
    .return ($P304)
.end


.namespace []
.include "except_types.pasm"
.sub "subst"  :subid("39_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_311
    .param pmc param_312
    .param pmc param_313
    .param pmc param_314 :optional :named("global")
    .param int has_param_314 :opt_flag
.annotate 'line', 204
    .const 'Sub' $P341 = "40_1305940113.98211" 
    capture_lex $P341
    new $P310, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P310, control_309
    push_eh $P310
    .lex "$text", param_311
    .lex "$regex", param_312
    .lex "$repl", param_313
    if has_param_314, optparam_62
    new $P315, "Undef"
    set param_314, $P315
  optparam_62:
    .lex "$global", param_314
.annotate 'line', 205
    $P316 = root_new ['parrot';'ResizablePMCArray']
    .lex "@matches", $P316
.annotate 'line', 207
    new $P317, "Undef"
    .lex "$is_code", $P317
.annotate 'line', 208
    new $P318, "Undef"
    .lex "$offset", $P318
.annotate 'line', 209
    new $P319, "Undef"
    .lex "$result", $P319
.annotate 'line', 220
    new $P320, "Undef"
    .lex "$chars", $P320
.annotate 'line', 205
    find_lex $P323, "$global"
    if $P323, if_322
.annotate 'line', 206
    find_lex $P327, "$regex"
    find_lex $P328, "$text"
    $P329 = $P327."ACCEPTS"($P328)
    new $P330, "ResizablePMCArray"
    push $P330, $P329
.annotate 'line', 205
    set $P321, $P330
    goto if_322_end
  if_322:
    find_lex $P324, "$text"
    find_lex $P325, "$regex"
    $P326 = "match"($P324, $P325, 1 :named("global"))
    set $P321, $P326
  if_322_end:
    store_lex "@matches", $P321
.annotate 'line', 207
    find_lex $P331, "$repl"
    isa $I332, $P331, "Sub"
    new $P333, 'Integer'
    set $P333, $I332
    store_lex "$is_code", $P333
.annotate 'line', 208
    new $P334, "Integer"
    assign $P334, 0
    store_lex "$offset", $P334
.annotate 'line', 209
    new $P335, "StringBuilder"
    store_lex "$result", $P335
.annotate 'line', 211
    find_lex $P337, "@matches"
    defined $I338, $P337
    unless $I338, for_undef_63
    iter $P336, $P337
    new $P374, 'ExceptionHandler'
    set_label $P374, loop373_handler
    $P374."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P374
  loop373_test:
    unless $P336, loop373_done
    shift $P339, $P336
  loop373_redo:
    .const 'Sub' $P341 = "40_1305940113.98211" 
    capture_lex $P341
    $P341($P339)
  loop373_next:
    goto loop373_test
  loop373_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, 'type'
    eq $P375, .CONTROL_LOOP_NEXT, loop373_next
    eq $P375, .CONTROL_LOOP_REDO, loop373_redo
  loop373_done:
    pop_eh 
  for_undef_63:
.annotate 'line', 220
    find_lex $P376, "$text"
    set $S377, $P376
    length $I378, $S377
    new $P379, 'Integer'
    set $P379, $I378
    store_lex "$chars", $P379
.annotate 'line', 222
    find_lex $P381, "$chars"
    set $N382, $P381
    find_lex $P383, "$offset"
    set $N384, $P383
    isgt $I385, $N382, $N384
    unless $I385, if_380_end
.annotate 'line', 221
    find_lex $P386, "$result"
    find_lex $P387, "$text"
    set $S388, $P387
    find_lex $P389, "$offset"
    set $I390, $P389
    find_lex $P391, "$chars"
    set $I392, $P391
    substr $S393, $S388, $I390, $I392
    push $P386, $S393
  if_380_end:
.annotate 'line', 224
    find_lex $P394, "$result"
    set $S395, $P394
.annotate 'line', 204
    .return ($S395)
  control_309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P396, exception, "payload"
    .return ($P396)
.end


.namespace []
.sub "_block340"  :anon :subid("40_1305940113.98211") :outer("39_1305940113.98211")
    .param pmc param_342
.annotate 'line', 211
    .lex "$match", param_342
.annotate 'line', 212
    find_lex $P345, "$match"
    if $P345, if_344
    set $P343, $P345
    goto if_344_end
  if_344:
.annotate 'line', 214
    find_lex $P347, "$match"
    $N348 = $P347."from"()
    find_lex $P349, "$offset"
    set $N350, $P349
    isgt $I351, $N348, $N350
    unless $I351, if_346_end
.annotate 'line', 213
    find_lex $P352, "$result"
    find_lex $P353, "$text"
    set $S354, $P353
    find_lex $P355, "$offset"
    set $I356, $P355
    find_lex $P357, "$match"
    $P358 = $P357."from"()
    find_lex $P359, "$offset"
    sub $P360, $P358, $P359
    set $I361, $P360
    substr $S362, $S354, $I356, $I361
    push $P352, $S362
  if_346_end:
.annotate 'line', 215
    find_lex $P363, "$result"
    find_lex $P366, "$is_code"
    if $P366, if_365
    find_lex $P370, "$repl"
    set $P364, $P370
    goto if_365_end
  if_365:
    find_lex $P367, "$repl"
    find_lex $P368, "$match"
    $P369 = $P367($P368)
    set $P364, $P369
  if_365_end:
    push $P363, $P364
.annotate 'line', 216
    find_lex $P371, "$match"
    $P372 = $P371."to"()
    store_lex "$offset", $P372
.annotate 'line', 212
    set $P343, $P372
  if_344_end:
.annotate 'line', 211
    .return ($P343)
.end


.namespace []
.include "except_types.pasm"
.sub "split"  :subid("41_1305940113.98211") :outer("10_1305940113.98211") :multi(["Regex";"Regex"],_)
    .param pmc param_400
    .param pmc param_401
.annotate 'line', 231
    .const 'Sub' $P410 = "42_1305940113.98211" 
    capture_lex $P410
    new $P399, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P399, control_398
    push_eh $P399
    .lex "$regex", param_400
    .lex "$text", param_401
.annotate 'line', 232
    new $P402, "Undef"
    .lex "$pos", $P402
.annotate 'line', 233
    $P403 = root_new ['parrot';'ResizablePMCArray']
    .lex "@result", $P403
.annotate 'line', 234
    new $P404, "Undef"
    .lex "$looking", $P404
.annotate 'line', 232
    new $P405, "Integer"
    assign $P405, 0
    store_lex "$pos", $P405
    find_lex $P406, "@result"
.annotate 'line', 234
    new $P407, "Integer"
    assign $P407, 1
    store_lex "$looking", $P407
.annotate 'line', 235
    new $P466, 'ExceptionHandler'
    set_label $P466, loop465_handler
    $P466."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P466
  loop465_test:
    find_lex $P408, "$looking"
    unless $P408, loop465_done
  loop465_redo:
    .const 'Sub' $P410 = "42_1305940113.98211" 
    capture_lex $P410
    $P410()
  loop465_next:
    goto loop465_test
  loop465_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P467, exception, 'type'
    eq $P467, .CONTROL_LOOP_NEXT, loop465_next
    eq $P467, .CONTROL_LOOP_REDO, loop465_redo
  loop465_done:
    pop_eh 
.annotate 'line', 253
    new $P468, "Exception"
    set $P468['type'], .CONTROL_RETURN
    find_lex $P469, "@result"
    setattribute $P468, 'payload', $P469
    throw $P468
.annotate 'line', 231
    .return ()
  control_398:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P470, exception, "payload"
    .return ($P470)
.end


.namespace []
.sub "_block409"  :anon :subid("42_1305940113.98211") :outer("41_1305940113.98211")
.annotate 'line', 235
    .const 'Sub' $P445 = "44_1305940113.98211" 
    capture_lex $P445
    .const 'Sub' $P422 = "43_1305940113.98211" 
    capture_lex $P422
.annotate 'line', 236
    new $P411, "Undef"
    .lex "$match", $P411
.annotate 'line', 237
    get_hll_global $P412, ["Regex"], "Cursor"
    find_lex $P413, "$text"
    find_lex $P414, "$regex"
    find_lex $P415, "$pos"
    $P416 = $P412."parse"($P413, $P414 :named("rule"), $P415 :named("c"))
    store_lex "$match", $P416
.annotate 'line', 239
    find_lex $P419, "$match"
    istrue $I420, $P419
    if $I420, if_418
.annotate 'line', 245
    .const 'Sub' $P445 = "44_1305940113.98211" 
    capture_lex $P445
    $P464 = $P445()
    set $P417, $P464
.annotate 'line', 239
    goto if_418_end
  if_418:
    .const 'Sub' $P422 = "43_1305940113.98211" 
    capture_lex $P422
    $P443 = $P422()
    set $P417, $P443
  if_418_end:
.annotate 'line', 235
    .return ($P417)
.end


.namespace []
.sub "_block444"  :anon :subid("44_1305940113.98211") :outer("42_1305940113.98211")
.annotate 'line', 246
    new $P446, "Undef"
    .lex "$len", $P446
    find_lex $P447, "$text"
    set $S448, $P447
    length $I449, $S448
    new $P450, 'Integer'
    set $P450, $I449
    store_lex "$len", $P450
.annotate 'line', 247
    find_lex $P452, "$pos"
    set $N453, $P452
    find_lex $P454, "$len"
    set $N455, $P454
    islt $I456, $N453, $N455
    unless $I456, if_451_end
.annotate 'line', 248
    find_lex $P457, "@result"
    find_lex $P458, "$text"
    set $S459, $P458
    find_lex $P460, "$pos"
    set $I461, $P460
    substr $S462, $S459, $I461
    $P457."push"($S462)
  if_451_end:
.annotate 'line', 250
    new $P463, "Integer"
    assign $P463, 0
    store_lex "$looking", $P463
.annotate 'line', 245
    .return ($P463)
.end


.namespace []
.sub "_block421"  :anon :subid("43_1305940113.98211") :outer("42_1305940113.98211")
.annotate 'line', 240
    new $P423, "Undef"
    .lex "$from", $P423
.annotate 'line', 241
    new $P424, "Undef"
    .lex "$to", $P424
.annotate 'line', 242
    new $P425, "Undef"
    .lex "$prefix", $P425
.annotate 'line', 240
    find_lex $P426, "$match"
    $P427 = $P426."from"()
    store_lex "$from", $P427
.annotate 'line', 241
    find_lex $P428, "$match"
    $P429 = $P428."to"()
    store_lex "$to", $P429
.annotate 'line', 242
    find_lex $P430, "$text"
    find_lex $P431, "$pos"
    set $I432, $P431
    find_lex $P433, "$from"
    find_lex $P434, "$pos"
    sub $P435, $P433, $P434
    set $I436, $P435
    substr $S437, $P430, $I432, $I436
    new $P438, 'String'
    set $P438, $S437
    store_lex "$prefix", $P438
.annotate 'line', 243
    find_lex $P439, "@result"
    find_lex $P440, "$prefix"
    $P439."push"($P440)
.annotate 'line', 244
    find_lex $P441, "$match"
    $P442 = $P441."to"()
    store_lex "$pos", $P442
.annotate 'line', 239
    .return ($P442)
.end


.namespace []
.include "except_types.pasm"
.sub "split"  :subid("45_1305940113.98211") :outer("10_1305940113.98211") :multi(_,_)
    .param pmc param_474
    .param pmc param_475
.annotate 'line', 257
    .const 'Sub' $P487 = "46_1305940113.98211" 
    capture_lex $P487
    new $P473, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P473, control_472
    push_eh $P473
    .lex "$string", param_474
    .lex "$text", param_475
.annotate 'line', 259
    $P476 = root_new ['parrot';'ResizablePMCArray']
    .lex "@res", $P476
.annotate 'line', 257
    find_lex $P477, "@res"
.annotate 'line', 260
    find_lex $P479, "$string"
    set $S480, $P479
    find_lex $P481, "$text"
    set $S482, $P481
    split $P483, $S480, $S482
    defined $I484, $P483
    unless $I484, for_undef_64
    iter $P478, $P483
    new $P493, 'ExceptionHandler'
    set_label $P493, loop492_handler
    $P493."handle_types"(.CONTROL_LOOP_NEXT, .CONTROL_LOOP_REDO, .CONTROL_LOOP_LAST)
    push_eh $P493
  loop492_test:
    unless $P478, loop492_done
    shift $P485, $P478
  loop492_redo:
    .const 'Sub' $P487 = "46_1305940113.98211" 
    capture_lex $P487
    $P487($P485)
  loop492_next:
    goto loop492_test
  loop492_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P494, exception, 'type'
    eq $P494, .CONTROL_LOOP_NEXT, loop492_next
    eq $P494, .CONTROL_LOOP_REDO, loop492_redo
  loop492_done:
    pop_eh 
  for_undef_64:
    find_lex $P495, "@res"
.annotate 'line', 257
    .return ($P495)
  control_472:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P496, exception, "payload"
    .return ($P496)
.end


.namespace []
.sub "_block486"  :anon :subid("46_1305940113.98211") :outer("45_1305940113.98211")
    .param pmc param_488
.annotate 'line', 260
    .lex "$_", param_488
    find_lex $P489, "@res"
    find_lex $P490, "$_"
    $P491 = $P489."push"($P490)
    .return ($P491)
.end


.namespace []
.include "except_types.pasm"
.sub "slurp"  :subid("47_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_502
.annotate 'line', 299
    new $P501, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P501, control_500
    push_eh $P501
    .lex "$filename", param_502
.annotate 'line', 300
    new $P503, "Undef"
    .lex "$handle", $P503
.annotate 'line', 301
    new $P504, "Undef"
    .lex "$contents", $P504
.annotate 'line', 300
    find_lex $P505, "$filename"
    $P506 = "open"($P505, 1 :named("r"))
    store_lex "$handle", $P506
.annotate 'line', 301
    find_lex $P507, "$handle"
    $P508 = $P507."readall"()
    store_lex "$contents", $P508
.annotate 'line', 302
    find_lex $P509, "$handle"
    $P509."close"()
    find_lex $P510, "$contents"
.annotate 'line', 299
    .return ($P510)
  control_500:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P511, exception, "payload"
    .return ($P511)
.end


.namespace []
.include "except_types.pasm"
.sub "spew"  :subid("48_1305940113.98211") :outer("10_1305940113.98211")
    .param pmc param_515
    .param pmc param_516
.annotate 'line', 311
    new $P514, ['ExceptionHandler'], .CONTROL_RETURN
    set_label $P514, control_513
    push_eh $P514
    .lex "$filename", param_515
    .lex "$contents", param_516
.annotate 'line', 312
    new $P517, "Undef"
    .lex "$handle", $P517
    new $P518, "FileHandle"
    store_lex "$handle", $P518
.annotate 'line', 313
    find_lex $P519, "$handle"
    find_lex $P520, "$filename"
    $P519."open"($P520, "w")
.annotate 'line', 314
    find_lex $P521, "$handle"
    find_lex $P522, "$contents"
    $P521."print"($P522)
.annotate 'line', 315
    find_lex $P523, "$handle"
    $P524 = $P523."close"()
.annotate 'line', 311
    .return ($P524)
  control_513:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P525, exception, "payload"
    .return ($P525)
.end


.namespace []
.sub "_block527" :load :anon :subid("49_1305940113.98211")
.annotate 'line', 1
    .const 'Sub' $P529 = "10_1305940113.98211" 
    $P530 = $P529()
    .return ($P530)
.end

