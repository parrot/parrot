# Copyright (C) 2009, Patrick R. Michaud

=head1 NAME

NQP::Compiler - NQP compiler

=head1 DESCRIPTION

=cut

.sub '' :anon :load :init
    load_bytecode 'P6Regex.pbc'
.end

### .include 'gen/nqp-grammar.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259078882.26523")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1230 = $P14()
.annotate "line", 1
    .return ($P1230)
.end


.namespace []
.sub "" :load :init :subid("post314") :outer("10_1259078882.26523")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259078882.26523" 
    .local pmc block
    set block, $P12
    $P1231 = get_root_global ["parrot"], "P6metaclass"
    $P1231."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1259078882.26523") :outer("10_1259078882.26523")
.annotate "line", 4
    get_hll_global $P1172, ["NQP";"Regex"], "_block1171" 
    capture_lex $P1172
    .const 'Sub' $P1165 = "299_1259078882.26523" 
    capture_lex $P1165
    .const 'Sub' $P1159 = "297_1259078882.26523" 
    capture_lex $P1159
    .const 'Sub' $P1152 = "295_1259078882.26523" 
    capture_lex $P1152
    .const 'Sub' $P1145 = "293_1259078882.26523" 
    capture_lex $P1145
    .const 'Sub' $P1138 = "291_1259078882.26523" 
    capture_lex $P1138
    .const 'Sub' $P1131 = "289_1259078882.26523" 
    capture_lex $P1131
    .const 'Sub' $P1125 = "287_1259078882.26523" 
    capture_lex $P1125
    .const 'Sub' $P1118 = "285_1259078882.26523" 
    capture_lex $P1118
    .const 'Sub' $P1111 = "283_1259078882.26523" 
    capture_lex $P1111
    .const 'Sub' $P1104 = "281_1259078882.26523" 
    capture_lex $P1104
    .const 'Sub' $P1097 = "279_1259078882.26523" 
    capture_lex $P1097
    .const 'Sub' $P1090 = "277_1259078882.26523" 
    capture_lex $P1090
    .const 'Sub' $P1083 = "275_1259078882.26523" 
    capture_lex $P1083
    .const 'Sub' $P1076 = "273_1259078882.26523" 
    capture_lex $P1076
    .const 'Sub' $P1069 = "271_1259078882.26523" 
    capture_lex $P1069
    .const 'Sub' $P1062 = "269_1259078882.26523" 
    capture_lex $P1062
    .const 'Sub' $P1055 = "267_1259078882.26523" 
    capture_lex $P1055
    .const 'Sub' $P1048 = "265_1259078882.26523" 
    capture_lex $P1048
    .const 'Sub' $P1041 = "263_1259078882.26523" 
    capture_lex $P1041
    .const 'Sub' $P1034 = "261_1259078882.26523" 
    capture_lex $P1034
    .const 'Sub' $P1027 = "259_1259078882.26523" 
    capture_lex $P1027
    .const 'Sub' $P1020 = "257_1259078882.26523" 
    capture_lex $P1020
    .const 'Sub' $P1013 = "255_1259078882.26523" 
    capture_lex $P1013
    .const 'Sub' $P1006 = "253_1259078882.26523" 
    capture_lex $P1006
    .const 'Sub' $P999 = "251_1259078882.26523" 
    capture_lex $P999
    .const 'Sub' $P992 = "249_1259078882.26523" 
    capture_lex $P992
    .const 'Sub' $P985 = "247_1259078882.26523" 
    capture_lex $P985
    .const 'Sub' $P978 = "245_1259078882.26523" 
    capture_lex $P978
    .const 'Sub' $P971 = "243_1259078882.26523" 
    capture_lex $P971
    .const 'Sub' $P964 = "241_1259078882.26523" 
    capture_lex $P964
    .const 'Sub' $P957 = "239_1259078882.26523" 
    capture_lex $P957
    .const 'Sub' $P950 = "237_1259078882.26523" 
    capture_lex $P950
    .const 'Sub' $P944 = "235_1259078882.26523" 
    capture_lex $P944
    .const 'Sub' $P937 = "233_1259078882.26523" 
    capture_lex $P937
    .const 'Sub' $P930 = "231_1259078882.26523" 
    capture_lex $P930
    .const 'Sub' $P923 = "229_1259078882.26523" 
    capture_lex $P923
    .const 'Sub' $P916 = "227_1259078882.26523" 
    capture_lex $P916
    .const 'Sub' $P909 = "225_1259078882.26523" 
    capture_lex $P909
    .const 'Sub' $P902 = "223_1259078882.26523" 
    capture_lex $P902
    .const 'Sub' $P895 = "221_1259078882.26523" 
    capture_lex $P895
    .const 'Sub' $P889 = "219_1259078882.26523" 
    capture_lex $P889
    .const 'Sub' $P883 = "217_1259078882.26523" 
    capture_lex $P883
    .const 'Sub' $P878 = "215_1259078882.26523" 
    capture_lex $P878
    .const 'Sub' $P872 = "213_1259078882.26523" 
    capture_lex $P872
    .const 'Sub' $P866 = "211_1259078882.26523" 
    capture_lex $P866
    .const 'Sub' $P861 = "209_1259078882.26523" 
    capture_lex $P861
    .const 'Sub' $P856 = "207_1259078882.26523" 
    capture_lex $P856
    .const 'Sub' $P849 = "205_1259078882.26523" 
    capture_lex $P849
    .const 'Sub' $P841 = "203_1259078882.26523" 
    capture_lex $P841
    .const 'Sub' $P836 = "201_1259078882.26523" 
    capture_lex $P836
    .const 'Sub' $P831 = "199_1259078882.26523" 
    capture_lex $P831
    .const 'Sub' $P823 = "197_1259078882.26523" 
    capture_lex $P823
    .const 'Sub' $P815 = "195_1259078882.26523" 
    capture_lex $P815
    .const 'Sub' $P810 = "193_1259078882.26523" 
    capture_lex $P810
    .const 'Sub' $P805 = "191_1259078882.26523" 
    capture_lex $P805
    .const 'Sub' $P799 = "189_1259078882.26523" 
    capture_lex $P799
    .const 'Sub' $P793 = "187_1259078882.26523" 
    capture_lex $P793
    .const 'Sub' $P787 = "185_1259078882.26523" 
    capture_lex $P787
    .const 'Sub' $P781 = "183_1259078882.26523" 
    capture_lex $P781
    .const 'Sub' $P776 = "181_1259078882.26523" 
    capture_lex $P776
    .const 'Sub' $P771 = "179_1259078882.26523" 
    capture_lex $P771
    .const 'Sub' $P758 = "175_1259078882.26523" 
    capture_lex $P758
    .const 'Sub' $P750 = "173_1259078882.26523" 
    capture_lex $P750
    .const 'Sub' $P744 = "171_1259078882.26523" 
    capture_lex $P744
    .const 'Sub' $P737 = "169_1259078882.26523" 
    capture_lex $P737
    .const 'Sub' $P731 = "167_1259078882.26523" 
    capture_lex $P731
    .const 'Sub' $P723 = "165_1259078882.26523" 
    capture_lex $P723
    .const 'Sub' $P715 = "163_1259078882.26523" 
    capture_lex $P715
    .const 'Sub' $P709 = "161_1259078882.26523" 
    capture_lex $P709
    .const 'Sub' $P703 = "159_1259078882.26523" 
    capture_lex $P703
    .const 'Sub' $P688 = "155_1259078882.26523" 
    capture_lex $P688
    .const 'Sub' $P656 = "153_1259078882.26523" 
    capture_lex $P656
    .const 'Sub' $P648 = "151_1259078882.26523" 
    capture_lex $P648
    .const 'Sub' $P642 = "149_1259078882.26523" 
    capture_lex $P642
    .const 'Sub' $P632 = "147_1259078882.26523" 
    capture_lex $P632
    .const 'Sub' $P617 = "145_1259078882.26523" 
    capture_lex $P617
    .const 'Sub' $P608 = "143_1259078882.26523" 
    capture_lex $P608
    .const 'Sub' $P589 = "141_1259078882.26523" 
    capture_lex $P589
    .const 'Sub' $P570 = "139_1259078882.26523" 
    capture_lex $P570
    .const 'Sub' $P563 = "137_1259078882.26523" 
    capture_lex $P563
    .const 'Sub' $P556 = "135_1259078882.26523" 
    capture_lex $P556
    .const 'Sub' $P546 = "131_1259078882.26523" 
    capture_lex $P546
    .const 'Sub' $P535 = "129_1259078882.26523" 
    capture_lex $P535
    .const 'Sub' $P528 = "127_1259078882.26523" 
    capture_lex $P528
    .const 'Sub' $P521 = "125_1259078882.26523" 
    capture_lex $P521
    .const 'Sub' $P514 = "123_1259078882.26523" 
    capture_lex $P514
    .const 'Sub' $P487 = "119_1259078882.26523" 
    capture_lex $P487
    .const 'Sub' $P478 = "117_1259078882.26523" 
    capture_lex $P478
    .const 'Sub' $P471 = "115_1259078882.26523" 
    capture_lex $P471
    .const 'Sub' $P462 = "111_1259078882.26523" 
    capture_lex $P462
    .const 'Sub' $P457 = "109_1259078882.26523" 
    capture_lex $P457
    .const 'Sub' $P445 = "107_1259078882.26523" 
    capture_lex $P445
    .const 'Sub' $P434 = "105_1259078882.26523" 
    capture_lex $P434
    .const 'Sub' $P429 = "103_1259078882.26523" 
    capture_lex $P429
    .const 'Sub' $P423 = "101_1259078882.26523" 
    capture_lex $P423
    .const 'Sub' $P417 = "99_1259078882.26523" 
    capture_lex $P417
    .const 'Sub' $P411 = "97_1259078882.26523" 
    capture_lex $P411
    .const 'Sub' $P405 = "95_1259078882.26523" 
    capture_lex $P405
    .const 'Sub' $P399 = "93_1259078882.26523" 
    capture_lex $P399
    .const 'Sub' $P393 = "91_1259078882.26523" 
    capture_lex $P393
    .const 'Sub' $P387 = "89_1259078882.26523" 
    capture_lex $P387
    .const 'Sub' $P379 = "87_1259078882.26523" 
    capture_lex $P379
    .const 'Sub' $P371 = "85_1259078882.26523" 
    capture_lex $P371
    .const 'Sub' $P359 = "81_1259078882.26523" 
    capture_lex $P359
    .const 'Sub' $P351 = "79_1259078882.26523" 
    capture_lex $P351
    .const 'Sub' $P341 = "75_1259078882.26523" 
    capture_lex $P341
    .const 'Sub' $P334 = "73_1259078882.26523" 
    capture_lex $P334
    .const 'Sub' $P322 = "69_1259078882.26523" 
    capture_lex $P322
    .const 'Sub' $P302 = "67_1259078882.26523" 
    capture_lex $P302
    .const 'Sub' $P293 = "65_1259078882.26523" 
    capture_lex $P293
    .const 'Sub' $P274 = "62_1259078882.26523" 
    capture_lex $P274
    .const 'Sub' $P254 = "60_1259078882.26523" 
    capture_lex $P254
    .const 'Sub' $P245 = "56_1259078882.26523" 
    capture_lex $P245
    .const 'Sub' $P240 = "54_1259078882.26523" 
    capture_lex $P240
    .const 'Sub' $P231 = "50_1259078882.26523" 
    capture_lex $P231
    .const 'Sub' $P226 = "48_1259078882.26523" 
    capture_lex $P226
    .const 'Sub' $P218 = "46_1259078882.26523" 
    capture_lex $P218
    .const 'Sub' $P211 = "44_1259078882.26523" 
    capture_lex $P211
    .const 'Sub' $P205 = "42_1259078882.26523" 
    capture_lex $P205
    .const 'Sub' $P197 = "40_1259078882.26523" 
    capture_lex $P197
    .const 'Sub' $P191 = "38_1259078882.26523" 
    capture_lex $P191
    .const 'Sub' $P185 = "36_1259078882.26523" 
    capture_lex $P185
    .const 'Sub' $P168 = "33_1259078882.26523" 
    capture_lex $P168
    .const 'Sub' $P155 = "31_1259078882.26523" 
    capture_lex $P155
    .const 'Sub' $P148 = "29_1259078882.26523" 
    capture_lex $P148
    .const 'Sub' $P104 = "26_1259078882.26523" 
    capture_lex $P104
    .const 'Sub' $P85 = "23_1259078882.26523" 
    capture_lex $P85
    .const 'Sub' $P75 = "21_1259078882.26523" 
    capture_lex $P75
    .const 'Sub' $P61 = "19_1259078882.26523" 
    capture_lex $P61
    .const 'Sub' $P46 = "17_1259078882.26523" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1259078882.26523" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1259078882.26523" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1259078882.26523" 
    capture_lex $P15
.annotate "line", 493
    get_hll_global $P1172, ["NQP";"Regex"], "_block1171" 
    capture_lex $P1172
    $P1213 = $P1172()
.annotate "line", 4
    .return ($P1213)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post315") :outer("11_1259078882.26523")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 386
    get_hll_global $P1214, ["NQP"], "Grammar"
    $P1214."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 387
    get_hll_global $P1215, ["NQP"], "Grammar"
    $P1215."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 388
    get_hll_global $P1216, ["NQP"], "Grammar"
    $P1216."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 389
    get_hll_global $P1217, ["NQP"], "Grammar"
    $P1217."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 390
    get_hll_global $P1218, ["NQP"], "Grammar"
    $P1218."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 391
    get_hll_global $P1219, ["NQP"], "Grammar"
    $P1219."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 392
    get_hll_global $P1220, ["NQP"], "Grammar"
    $P1220."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 393
    get_hll_global $P1221, ["NQP"], "Grammar"
    $P1221."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 394
    get_hll_global $P1222, ["NQP"], "Grammar"
    $P1222."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 395
    get_hll_global $P1223, ["NQP"], "Grammar"
    $P1223."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 396
    get_hll_global $P1224, ["NQP"], "Grammar"
    $P1224."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 397
    get_hll_global $P1225, ["NQP"], "Grammar"
    $P1225."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 398
    get_hll_global $P1226, ["NQP"], "Grammar"
    $P1226."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 399
    get_hll_global $P1227, ["NQP"], "Grammar"
    $P1227."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 400
    get_hll_global $P1228, ["NQP"], "Grammar"
    $P1228."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 385
    $P1229 = get_root_global ["parrot"], "P6metaclass"
    $P1229."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    new $P17, 'ExceptionHandler'
    set_addr $P17, control_16
    $P17."handle_types"(58)
    push_eh $P17
    .lex "self", self
.annotate "line", 5
    new $P18, "Hash"
    .lex "%*LANG", $P18
.annotate "line", 10
    new $P19, "Undef"
    .lex "$*SCOPE", $P19
.annotate "line", 4
    find_lex $P20, "%*LANG"
    unless_null $P20, vivify_316
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_317
    die "Contextual %*LANG not found"
  vivify_317:
  vivify_316:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_318
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_319
    die "Contextual %*LANG not found"
  vivify_319:
    store_lex "%*LANG", $P22
  vivify_318:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_320
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_321
    die "Contextual %*LANG not found"
  vivify_321:
    store_lex "%*LANG", $P24
  vivify_320:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_322
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_323
    die "Contextual %*LANG not found"
  vivify_323:
    store_lex "%*LANG", $P26
  vivify_322:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_324
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_325
    die "Contextual %*LANG not found"
  vivify_325:
    store_lex "%*LANG", $P28
  vivify_324:
    set $P28["MAIN-actions"], $P27
.annotate "line", 10
    new $P29, "String"
    assign $P29, ""
    store_lex "$*SCOPE", $P29
.annotate "line", 11
    find_lex $P30, "self"
    $P31 = $P30."comp_unit"()
.annotate "line", 4
    .return ($P31)
  control_16:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P32, exception, "payload"
    .return ($P32)
.end


.namespace ["NQP";"Grammar"]
.sub "identifier"  :subid("13_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx34_tgt
    .local int rx34_pos
    .local int rx34_off
    .local int rx34_eos
    .local int rx34_rep
    .local pmc rx34_cur
    (rx34_cur, rx34_pos, rx34_tgt) = self."!cursor_start"()
    rx34_cur."!cursor_debug"("START ", "identifier")
    .lex unicode:"$\x{a2}", rx34_cur
    .local pmc match
    .lex "$/", match
    length rx34_eos, rx34_tgt
    set rx34_off, 0
    lt rx34_pos, 2, rx34_start
    sub rx34_off, rx34_pos, 1
    substr rx34_tgt, rx34_tgt, rx34_off
  rx34_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan38_done
    goto rxscan38_scan
  rxscan38_loop:
    ($P10) = rx34_cur."from"()
    inc $P10
    set rx34_pos, $P10
    ge rx34_pos, rx34_eos, rxscan38_done
  rxscan38_scan:
    set_addr $I10, rxscan38_loop
    rx34_cur."!mark_push"(0, rx34_pos, $I10)
  rxscan38_done:
.annotate "line", 16
  # rx subrule "ident" subtype=capture negate=
    rx34_cur."!cursor_pos"(rx34_pos)
    $P10 = rx34_cur."ident"()
    unless $P10, rx34_fail
    rx34_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("ident")
    rx34_pos = $P10."pos"()
  # rx pass
    rx34_cur."!cursor_pass"(rx34_pos, "identifier")
    rx34_cur."!cursor_debug"("PASS  ", "identifier", " at pos=", rx34_pos)
    .return (rx34_cur)
  rx34_fail:
.annotate "line", 4
    (rx34_rep, rx34_pos, $I10, $P10) = rx34_cur."!mark_fail"(0)
    lt rx34_pos, -1, rx34_done
    eq rx34_pos, -1, rx34_fail
    jump $I10
  rx34_done:
    rx34_cur."!cursor_fail"()
    rx34_cur."!cursor_debug"("FAIL  ", "identifier")
    .return (rx34_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__identifier"  :subid("14_1259078882.26523") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx40_tgt
    .local int rx40_pos
    .local int rx40_off
    .local int rx40_eos
    .local int rx40_rep
    .local pmc rx40_cur
    (rx40_cur, rx40_pos, rx40_tgt) = self."!cursor_start"()
    rx40_cur."!cursor_debug"("START ", "name")
    rx40_cur."!cursor_caparray"("identifier")
    .lex unicode:"$\x{a2}", rx40_cur
    .local pmc match
    .lex "$/", match
    length rx40_eos, rx40_tgt
    set rx40_off, 0
    lt rx40_pos, 2, rx40_start
    sub rx40_off, rx40_pos, 1
    substr rx40_tgt, rx40_tgt, rx40_off
  rx40_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan43_done
    goto rxscan43_scan
  rxscan43_loop:
    ($P10) = rx40_cur."from"()
    inc $P10
    set rx40_pos, $P10
    ge rx40_pos, rx40_eos, rxscan43_done
  rxscan43_scan:
    set_addr $I10, rxscan43_loop
    rx40_cur."!mark_push"(0, rx40_pos, $I10)
  rxscan43_done:
.annotate "line", 18
  # rx rxquantr44 ** 1..*
    set_addr $I45, rxquantr44_done
    rx40_cur."!mark_push"(0, -1, $I45)
  rxquantr44_loop:
  # rx subrule "identifier" subtype=capture negate=
    rx40_cur."!cursor_pos"(rx40_pos)
    $P10 = rx40_cur."identifier"()
    unless $P10, rx40_fail
    rx40_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx40_pos = $P10."pos"()
    (rx40_rep) = rx40_cur."!mark_commit"($I45)
    rx40_cur."!mark_push"(rx40_rep, rx40_pos, $I45)
  # rx literal  "::"
    add $I11, rx40_pos, 2
    gt $I11, rx40_eos, rx40_fail
    sub $I11, rx40_pos, rx40_off
    substr $S10, rx40_tgt, $I11, 2
    ne $S10, "::", rx40_fail
    add rx40_pos, 2
    goto rxquantr44_loop
  rxquantr44_done:
  # rx pass
    rx40_cur."!cursor_pass"(rx40_pos, "name")
    rx40_cur."!cursor_debug"("PASS  ", "name", " at pos=", rx40_pos)
    .return (rx40_cur)
  rx40_fail:
.annotate "line", 4
    (rx40_rep, rx40_pos, $I10, $P10) = rx40_cur."!mark_fail"(0)
    lt rx40_pos, -1, rx40_done
    eq rx40_pos, -1, rx40_fail
    jump $I10
  rx40_done:
    rx40_cur."!cursor_fail"()
    rx40_cur."!cursor_debug"("FAIL  ", "name")
    .return (rx40_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__name"  :subid("16_1259078882.26523") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx47_tgt
    .local int rx47_pos
    .local int rx47_off
    .local int rx47_eos
    .local int rx47_rep
    .local pmc rx47_cur
    (rx47_cur, rx47_pos, rx47_tgt) = self."!cursor_start"()
    rx47_cur."!cursor_debug"("START ", "deflongname")
    rx47_cur."!cursor_caparray"("sym")
    .lex unicode:"$\x{a2}", rx47_cur
    .local pmc match
    .lex "$/", match
    length rx47_eos, rx47_tgt
    set rx47_off, 0
    lt rx47_pos, 2, rx47_start
    sub rx47_off, rx47_pos, 1
    substr rx47_tgt, rx47_tgt, rx47_off
  rx47_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan51_done
    goto rxscan51_scan
  rxscan51_loop:
    ($P10) = rx47_cur."from"()
    inc $P10
    set rx47_pos, $P10
    ge rx47_pos, rx47_eos, rxscan51_done
  rxscan51_scan:
    set_addr $I10, rxscan51_loop
    rx47_cur."!mark_push"(0, rx47_pos, $I10)
  rxscan51_done:
.annotate "line", 21
  # rx subrule "identifier" subtype=capture negate=
    rx47_cur."!cursor_pos"(rx47_pos)
    $P10 = rx47_cur."identifier"()
    unless $P10, rx47_fail
    rx47_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx47_pos = $P10."pos"()
.annotate "line", 22
  # rx rxquantr52 ** 0..1
    set_addr $I60, rxquantr52_done
    rx47_cur."!mark_push"(0, rx47_pos, $I60)
  rxquantr52_loop:
  alt53_0:
    set_addr $I10, alt53_1
    rx47_cur."!mark_push"(0, rx47_pos, $I10)
  # rx literal  ":sym<"
    add $I11, rx47_pos, 5
    gt $I11, rx47_eos, rx47_fail
    sub $I11, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I11, 5
    ne $S10, ":sym<", rx47_fail
    add rx47_pos, 5
  # rx subcapture "sym"
    set_addr $I10, rxcap_56_fail
    rx47_cur."!mark_push"(0, rx47_pos, $I10)
  # rx rxquantr54 ** 0..*
    set_addr $I55, rxquantr54_done
    rx47_cur."!mark_push"(0, rx47_pos, $I55)
  rxquantr54_loop:
  # rx enumcharlist negate=1 
    ge rx47_pos, rx47_eos, rx47_fail
    sub $I10, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx47_fail
    inc rx47_pos
    (rx47_rep) = rx47_cur."!mark_commit"($I55)
    rx47_cur."!mark_push"(rx47_rep, rx47_pos, $I55)
    goto rxquantr54_loop
  rxquantr54_done:
    set_addr $I10, rxcap_56_fail
    ($I12, $I11) = rx47_cur."!mark_peek"($I10)
    rx47_cur."!cursor_pos"($I11)
    ($P10) = rx47_cur."!cursor_start"()
    $P10."!cursor_pass"(rx47_pos, "")
    rx47_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_56_done
  rxcap_56_fail:
    goto rx47_fail
  rxcap_56_done:
  # rx literal  ">"
    add $I11, rx47_pos, 1
    gt $I11, rx47_eos, rx47_fail
    sub $I11, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I11, 1
    ne $S10, ">", rx47_fail
    add rx47_pos, 1
    goto alt53_end
  alt53_1:
  # rx literal  unicode:":sym\x{ab}"
    add $I11, rx47_pos, 5
    gt $I11, rx47_eos, rx47_fail
    sub $I11, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I11, 5
    ne $S10, unicode:":sym\x{ab}", rx47_fail
    add rx47_pos, 5
  # rx subcapture "sym"
    set_addr $I10, rxcap_59_fail
    rx47_cur."!mark_push"(0, rx47_pos, $I10)
  # rx rxquantr57 ** 0..*
    set_addr $I58, rxquantr57_done
    rx47_cur."!mark_push"(0, rx47_pos, $I58)
  rxquantr57_loop:
  # rx enumcharlist negate=1 
    ge rx47_pos, rx47_eos, rx47_fail
    sub $I10, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I10, 1
    index $I11, unicode:"\x{bb}", $S10
    ge $I11, 0, rx47_fail
    inc rx47_pos
    (rx47_rep) = rx47_cur."!mark_commit"($I58)
    rx47_cur."!mark_push"(rx47_rep, rx47_pos, $I58)
    goto rxquantr57_loop
  rxquantr57_done:
    set_addr $I10, rxcap_59_fail
    ($I12, $I11) = rx47_cur."!mark_peek"($I10)
    rx47_cur."!cursor_pos"($I11)
    ($P10) = rx47_cur."!cursor_start"()
    $P10."!cursor_pass"(rx47_pos, "")
    rx47_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_59_done
  rxcap_59_fail:
    goto rx47_fail
  rxcap_59_done:
  # rx literal  unicode:"\x{bb}"
    add $I11, rx47_pos, 1
    gt $I11, rx47_eos, rx47_fail
    sub $I11, rx47_pos, rx47_off
    substr $S10, rx47_tgt, $I11, 1
    ne $S10, unicode:"\x{bb}", rx47_fail
    add rx47_pos, 1
  alt53_end:
    (rx47_rep) = rx47_cur."!mark_commit"($I60)
  rxquantr52_done:
.annotate "line", 20
  # rx pass
    rx47_cur."!cursor_pass"(rx47_pos, "deflongname")
    rx47_cur."!cursor_debug"("PASS  ", "deflongname", " at pos=", rx47_pos)
    .return (rx47_cur)
  rx47_fail:
.annotate "line", 4
    (rx47_rep, rx47_pos, $I10, $P10) = rx47_cur."!mark_fail"(0)
    lt rx47_pos, -1, rx47_done
    eq rx47_pos, -1, rx47_fail
    jump $I10
  rx47_done:
    rx47_cur."!cursor_fail"()
    rx47_cur."!cursor_debug"("FAIL  ", "deflongname")
    .return (rx47_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__deflongname"  :subid("18_1259078882.26523") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx62_tgt
    .local int rx62_pos
    .local int rx62_off
    .local int rx62_eos
    .local int rx62_rep
    .local pmc rx62_cur
    (rx62_cur, rx62_pos, rx62_tgt) = self."!cursor_start"()
    rx62_cur."!cursor_debug"("START ", "ENDSTMT")
    .lex unicode:"$\x{a2}", rx62_cur
    .local pmc match
    .lex "$/", match
    length rx62_eos, rx62_tgt
    set rx62_off, 0
    lt rx62_pos, 2, rx62_start
    sub rx62_off, rx62_pos, 1
    substr rx62_tgt, rx62_tgt, rx62_off
  rx62_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan65_done
    goto rxscan65_scan
  rxscan65_loop:
    ($P10) = rx62_cur."from"()
    inc $P10
    set rx62_pos, $P10
    ge rx62_pos, rx62_eos, rxscan65_done
  rxscan65_scan:
    set_addr $I10, rxscan65_loop
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
  rxscan65_done:
.annotate "line", 29
  # rx rxquantr66 ** 0..1
    set_addr $I74, rxquantr66_done
    rx62_cur."!mark_push"(0, rx62_pos, $I74)
  rxquantr66_loop:
  alt67_0:
.annotate "line", 26
    set_addr $I10, alt67_1
    rx62_cur."!mark_push"(0, rx62_pos, $I10)
.annotate "line", 27
  # rx rxquantr68 ** 0..*
    set_addr $I69, rxquantr68_done
    rx62_cur."!mark_push"(0, rx62_pos, $I69)
  rxquantr68_loop:
  # rx enumcharlist negate=0 
    ge rx62_pos, rx62_eos, rx62_fail
    sub $I10, rx62_pos, rx62_off
    substr $S10, rx62_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx62_fail
    inc rx62_pos
    (rx62_rep) = rx62_cur."!mark_commit"($I69)
    rx62_cur."!mark_push"(rx62_rep, rx62_pos, $I69)
    goto rxquantr68_loop
  rxquantr68_done:
  # rxanchor eol
    sub $I10, rx62_pos, rx62_off
    is_cclass $I11, 4096, rx62_tgt, $I10
    if $I11, rxanchor70_done
    ne rx62_pos, rx62_eos, rx62_fail
    eq rx62_pos, 0, rxanchor70_done
    dec $I10
    is_cclass $I11, 4096, rx62_tgt, $I10
    if $I11, rx62_fail
  rxanchor70_done:
  # rx subrule "ws" subtype=method negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."ws"()
    unless $P10, rx62_fail
    rx62_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."MARKER"("endstmt")
    unless $P10, rx62_fail
    goto alt67_end
  alt67_1:
.annotate "line", 28
  # rx rxquantr71 ** 0..1
    set_addr $I72, rxquantr71_done
    rx62_cur."!mark_push"(0, rx62_pos, $I72)
  rxquantr71_loop:
  # rx subrule "unv" subtype=method negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."unv"()
    unless $P10, rx62_fail
    rx62_pos = $P10."pos"()
    (rx62_rep) = rx62_cur."!mark_commit"($I72)
  rxquantr71_done:
  # rxanchor eol
    sub $I10, rx62_pos, rx62_off
    is_cclass $I11, 4096, rx62_tgt, $I10
    if $I11, rxanchor73_done
    ne rx62_pos, rx62_eos, rx62_fail
    eq rx62_pos, 0, rxanchor73_done
    dec $I10
    is_cclass $I11, 4096, rx62_tgt, $I10
    if $I11, rx62_fail
  rxanchor73_done:
  # rx subrule "ws" subtype=method negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."ws"()
    unless $P10, rx62_fail
    rx62_pos = $P10."pos"()
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx62_cur."!cursor_pos"(rx62_pos)
    $P10 = rx62_cur."MARKER"("endstmt")
    unless $P10, rx62_fail
  alt67_end:
.annotate "line", 29
    (rx62_rep) = rx62_cur."!mark_commit"($I74)
  rxquantr66_done:
.annotate "line", 25
  # rx pass
    rx62_cur."!cursor_pass"(rx62_pos, "ENDSTMT")
    rx62_cur."!cursor_debug"("PASS  ", "ENDSTMT", " at pos=", rx62_pos)
    .return (rx62_cur)
  rx62_fail:
.annotate "line", 4
    (rx62_rep, rx62_pos, $I10, $P10) = rx62_cur."!mark_fail"(0)
    lt rx62_pos, -1, rx62_done
    eq rx62_pos, -1, rx62_fail
    jump $I10
  rx62_done:
    rx62_cur."!cursor_fail"()
    rx62_cur."!cursor_debug"("FAIL  ", "ENDSTMT")
    .return (rx62_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ENDSTMT"  :subid("20_1259078882.26523") :method
.annotate "line", 4
    new $P64, "ResizablePMCArray"
    push $P64, ""
    .return ($P64)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx76_tgt
    .local int rx76_pos
    .local int rx76_off
    .local int rx76_eos
    .local int rx76_rep
    .local pmc rx76_cur
    (rx76_cur, rx76_pos, rx76_tgt) = self."!cursor_start"()
    rx76_cur."!cursor_debug"("START ", "ws")
    .lex unicode:"$\x{a2}", rx76_cur
    .local pmc match
    .lex "$/", match
    length rx76_eos, rx76_tgt
    set rx76_off, 0
    lt rx76_pos, 2, rx76_start
    sub rx76_off, rx76_pos, 1
    substr rx76_tgt, rx76_tgt, rx76_off
  rx76_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan79_done
    goto rxscan79_scan
  rxscan79_loop:
    ($P10) = rx76_cur."from"()
    inc $P10
    set rx76_pos, $P10
    ge rx76_pos, rx76_eos, rxscan79_done
  rxscan79_scan:
    set_addr $I10, rxscan79_loop
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
  rxscan79_done:
  alt80_0:
.annotate "line", 32
    set_addr $I10, alt80_1
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
.annotate "line", 33
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."MARKED"("ws")
    unless $P10, rx76_fail
    goto alt80_end
  alt80_1:
.annotate "line", 34
  # rx subrule "ww" subtype=zerowidth negate=1
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."ww"()
    if $P10, rx76_fail
.annotate "line", 38
  # rx rxquantr81 ** 0..*
    set_addr $I84, rxquantr81_done
    rx76_cur."!mark_push"(0, rx76_pos, $I84)
  rxquantr81_loop:
  alt82_0:
.annotate "line", 35
    set_addr $I10, alt82_1
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
  # rx charclass_q s r 1..-1
    sub $I10, rx76_pos, rx76_off
    find_not_cclass $I11, 32, rx76_tgt, $I10, rx76_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx76_fail
    add rx76_pos, rx76_off, $I11
    goto alt82_end
  alt82_1:
    set_addr $I10, alt82_2
    rx76_cur."!mark_push"(0, rx76_pos, $I10)
.annotate "line", 36
  # rx literal  "#"
    add $I11, rx76_pos, 1
    gt $I11, rx76_eos, rx76_fail
    sub $I11, rx76_pos, rx76_off
    substr $S10, rx76_tgt, $I11, 1
    ne $S10, "#", rx76_fail
    add rx76_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx76_pos, rx76_off
    find_cclass $I11, 4096, rx76_tgt, $I10, rx76_eos
    add rx76_pos, rx76_off, $I11
    goto alt82_end
  alt82_2:
.annotate "line", 37
  # rxanchor bol
    eq rx76_pos, 0, rxanchor83_done
    ge rx76_pos, rx76_eos, rx76_fail
    sub $I10, rx76_pos, rx76_off
    dec $I10
    is_cclass $I11, 4096, rx76_tgt, $I10
    unless $I11, rx76_fail
  rxanchor83_done:
  # rx subrule "pod_comment" subtype=method negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."pod_comment"()
    unless $P10, rx76_fail
    rx76_pos = $P10."pos"()
  alt82_end:
.annotate "line", 38
    (rx76_rep) = rx76_cur."!mark_commit"($I84)
    rx76_cur."!mark_push"(rx76_rep, rx76_pos, $I84)
    goto rxquantr81_loop
  rxquantr81_done:
.annotate "line", 39
  # rx subrule "MARKER" subtype=zerowidth negate=
    rx76_cur."!cursor_pos"(rx76_pos)
    $P10 = rx76_cur."MARKER"("ws")
    unless $P10, rx76_fail
  alt80_end:
.annotate "line", 32
  # rx pass
    rx76_cur."!cursor_pass"(rx76_pos, "ws")
    rx76_cur."!cursor_debug"("PASS  ", "ws", " at pos=", rx76_pos)
    .return (rx76_cur)
  rx76_fail:
.annotate "line", 4
    (rx76_rep, rx76_pos, $I10, $P10) = rx76_cur."!mark_fail"(0)
    lt rx76_pos, -1, rx76_done
    eq rx76_pos, -1, rx76_fail
    jump $I10
  rx76_done:
    rx76_cur."!cursor_fail"()
    rx76_cur."!cursor_debug"("FAIL  ", "ws")
    .return (rx76_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__ws"  :subid("22_1259078882.26523") :method
.annotate "line", 4
    new $P78, "ResizablePMCArray"
    push $P78, ""
    push $P78, ""
    .return ($P78)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .const 'Sub' $P93 = "25_1259078882.26523" 
    capture_lex $P93
    .local string rx86_tgt
    .local int rx86_pos
    .local int rx86_off
    .local int rx86_eos
    .local int rx86_rep
    .local pmc rx86_cur
    (rx86_cur, rx86_pos, rx86_tgt) = self."!cursor_start"()
    rx86_cur."!cursor_debug"("START ", "unv")
    .lex unicode:"$\x{a2}", rx86_cur
    .local pmc match
    .lex "$/", match
    length rx86_eos, rx86_tgt
    set rx86_off, 0
    lt rx86_pos, 2, rx86_start
    sub rx86_off, rx86_pos, 1
    substr rx86_tgt, rx86_tgt, rx86_off
  rx86_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan89_done
    goto rxscan89_scan
  rxscan89_loop:
    ($P10) = rx86_cur."from"()
    inc $P10
    set rx86_pos, $P10
    ge rx86_pos, rx86_eos, rxscan89_done
  rxscan89_scan:
    set_addr $I10, rxscan89_loop
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
  rxscan89_done:
  alt90_0:
.annotate "line", 44
    set_addr $I10, alt90_1
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
.annotate "line", 45
  # rxanchor bol
    eq rx86_pos, 0, rxanchor91_done
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    dec $I10
    is_cclass $I11, 4096, rx86_tgt, $I10
    unless $I11, rx86_fail
  rxanchor91_done:
  # rx subrule "before" subtype=zerowidth negate=
    rx86_cur."!cursor_pos"(rx86_pos)
    .const 'Sub' $P93 = "25_1259078882.26523" 
    capture_lex $P93
    $P10 = rx86_cur."before"($P93)
    unless $P10, rx86_fail
  # rx subrule "pod_comment" subtype=method negate=
    rx86_cur."!cursor_pos"(rx86_pos)
    $P10 = rx86_cur."pod_comment"()
    unless $P10, rx86_fail
    rx86_pos = $P10."pos"()
    goto alt90_end
  alt90_1:
    set_addr $I10, alt90_2
    rx86_cur."!mark_push"(0, rx86_pos, $I10)
.annotate "line", 46
  # rx rxquantr100 ** 0..*
    set_addr $I101, rxquantr100_done
    rx86_cur."!mark_push"(0, rx86_pos, $I101)
  rxquantr100_loop:
  # rx enumcharlist negate=0 
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx86_fail
    inc rx86_pos
    (rx86_rep) = rx86_cur."!mark_commit"($I101)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I101)
    goto rxquantr100_loop
  rxquantr100_done:
  # rx literal  "#"
    add $I11, rx86_pos, 1
    gt $I11, rx86_eos, rx86_fail
    sub $I11, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I11, 1
    ne $S10, "#", rx86_fail
    add rx86_pos, 1
  # rx charclass_q N r 0..-1
    sub $I10, rx86_pos, rx86_off
    find_cclass $I11, 4096, rx86_tgt, $I10, rx86_eos
    add rx86_pos, rx86_off, $I11
    goto alt90_end
  alt90_2:
.annotate "line", 47
  # rx rxquantr102 ** 1..*
    set_addr $I103, rxquantr102_done
    rx86_cur."!mark_push"(0, -1, $I103)
  rxquantr102_loop:
  # rx enumcharlist negate=0 
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx86_fail
    inc rx86_pos
    (rx86_rep) = rx86_cur."!mark_commit"($I103)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I103)
    goto rxquantr102_loop
  rxquantr102_done:
  alt90_end:
.annotate "line", 42
  # rx pass
    rx86_cur."!cursor_pass"(rx86_pos, "unv")
    rx86_cur."!cursor_debug"("PASS  ", "unv", " at pos=", rx86_pos)
    .return (rx86_cur)
  rx86_fail:
.annotate "line", 4
    (rx86_rep, rx86_pos, $I10, $P10) = rx86_cur."!mark_fail"(0)
    lt rx86_pos, -1, rx86_done
    eq rx86_pos, -1, rx86_fail
    jump $I10
  rx86_done:
    rx86_cur."!cursor_fail"()
    rx86_cur."!cursor_debug"("FAIL  ", "unv")
    .return (rx86_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__unv"  :subid("24_1259078882.26523") :method
.annotate "line", 4
    new $P88, "ResizablePMCArray"
    push $P88, ""
    push $P88, ""
    push $P88, ""
    .return ($P88)
.end


.namespace ["NQP";"Grammar"]
.sub "_block92"  :anon :subid("25_1259078882.26523") :method :outer("23_1259078882.26523")
.annotate "line", 45
    .lex unicode:"$\x{a2}", $P94
    .local string rx95_tgt
    .local int rx95_pos
    .local int rx95_off
    .local int rx95_eos
    .local int rx95_rep
    .local pmc rx95_cur
    (rx95_cur, rx95_pos, rx95_tgt) = self."!cursor_start"()
    rx95_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx95_cur
    .local pmc match
    .lex "$/", match
    length rx95_eos, rx95_tgt
    set rx95_off, 0
    lt rx95_pos, 2, rx95_start
    sub rx95_off, rx95_pos, 1
    substr rx95_tgt, rx95_tgt, rx95_off
  rx95_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan96_done
    goto rxscan96_scan
  rxscan96_loop:
    ($P10) = rx95_cur."from"()
    inc $P10
    set rx95_pos, $P10
    ge rx95_pos, rx95_eos, rxscan96_done
  rxscan96_scan:
    set_addr $I10, rxscan96_loop
    rx95_cur."!mark_push"(0, rx95_pos, $I10)
  rxscan96_done:
  # rx rxquantr97 ** 0..*
    set_addr $I98, rxquantr97_done
    rx95_cur."!mark_push"(0, rx95_pos, $I98)
  rxquantr97_loop:
  # rx enumcharlist negate=0 
    ge rx95_pos, rx95_eos, rx95_fail
    sub $I10, rx95_pos, rx95_off
    substr $S10, rx95_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx95_fail
    inc rx95_pos
    (rx95_rep) = rx95_cur."!mark_commit"($I98)
    rx95_cur."!mark_push"(rx95_rep, rx95_pos, $I98)
    goto rxquantr97_loop
  rxquantr97_done:
  # rx literal  "="
    add $I11, rx95_pos, 1
    gt $I11, rx95_eos, rx95_fail
    sub $I11, rx95_pos, rx95_off
    substr $S10, rx95_tgt, $I11, 1
    ne $S10, "=", rx95_fail
    add rx95_pos, 1
  alt99_0:
    set_addr $I10, alt99_1
    rx95_cur."!mark_push"(0, rx95_pos, $I10)
  # rx charclass w
    ge rx95_pos, rx95_eos, rx95_fail
    sub $I10, rx95_pos, rx95_off
    is_cclass $I11, 8192, rx95_tgt, $I10
    unless $I11, rx95_fail
    inc rx95_pos
    goto alt99_end
  alt99_1:
  # rx literal  "\\"
    add $I11, rx95_pos, 1
    gt $I11, rx95_eos, rx95_fail
    sub $I11, rx95_pos, rx95_off
    substr $S10, rx95_tgt, $I11, 1
    ne $S10, "\\", rx95_fail
    add rx95_pos, 1
  alt99_end:
  # rx pass
    rx95_cur."!cursor_pass"(rx95_pos, "")
    rx95_cur."!cursor_debug"("PASS  ", "", " at pos=", rx95_pos)
    .return (rx95_cur)
  rx95_fail:
    (rx95_rep, rx95_pos, $I10, $P10) = rx95_cur."!mark_fail"(0)
    lt rx95_pos, -1, rx95_done
    eq rx95_pos, -1, rx95_fail
    jump $I10
  rx95_done:
    rx95_cur."!cursor_fail"()
    rx95_cur."!cursor_debug"("FAIL  ", "")
    .return (rx95_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .const 'Sub' $P139 = "28_1259078882.26523" 
    capture_lex $P139
    .local string rx105_tgt
    .local int rx105_pos
    .local int rx105_off
    .local int rx105_eos
    .local int rx105_rep
    .local pmc rx105_cur
    (rx105_cur, rx105_pos, rx105_tgt) = self."!cursor_start"()
    rx105_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx105_cur
    .local pmc match
    .lex "$/", match
    length rx105_eos, rx105_tgt
    set rx105_off, 0
    lt rx105_pos, 2, rx105_start
    sub rx105_off, rx105_pos, 1
    substr rx105_tgt, rx105_tgt, rx105_off
  rx105_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan108_done
    goto rxscan108_scan
  rxscan108_loop:
    ($P10) = rx105_cur."from"()
    inc $P10
    set rx105_pos, $P10
    ge rx105_pos, rx105_eos, rxscan108_done
  rxscan108_scan:
    set_addr $I10, rxscan108_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  rxscan108_done:
.annotate "line", 52
  # rxanchor bol
    eq rx105_pos, 0, rxanchor109_done
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    dec $I10
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
  rxanchor109_done:
  # rx rxquantr110 ** 0..*
    set_addr $I111, rxquantr110_done
    rx105_cur."!mark_push"(0, rx105_pos, $I111)
  rxquantr110_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I111)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I111)
    goto rxquantr110_loop
  rxquantr110_done:
  # rx literal  "="
    add $I11, rx105_pos, 1
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 1
    ne $S10, "=", rx105_fail
    add rx105_pos, 1
  alt112_0:
.annotate "line", 53
    set_addr $I10, alt112_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 54
  # rx literal  "begin"
    add $I11, rx105_pos, 5
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 5
    ne $S10, "begin", rx105_fail
    add rx105_pos, 5
  # rx rxquantr113 ** 1..*
    set_addr $I114, rxquantr113_done
    rx105_cur."!mark_push"(0, -1, $I114)
  rxquantr113_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I114)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I114)
    goto rxquantr113_loop
  rxquantr113_done:
  # rx literal  "END"
    add $I11, rx105_pos, 3
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 3
    ne $S10, "END", rx105_fail
    add rx105_pos, 3
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  alt115_0:
.annotate "line", 55
    set_addr $I10, alt115_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx rxquantf116 ** 0..*
    set_addr $I10, rxquantf116_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf116_done
  rxquantf116_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf116_loop
    rx105_cur."!mark_push"($I117, rx105_pos, $I10)
  rxquantf116_done:
  # rx charclass nl
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
    substr $S10, rx105_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx105_pos, $I11
    inc rx105_pos
  # rx literal  "=end"
    add $I11, rx105_pos, 4
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 4
    ne $S10, "=end", rx105_fail
    add rx105_pos, 4
  # rx rxquantr118 ** 1..*
    set_addr $I119, rxquantr118_done
    rx105_cur."!mark_push"(0, -1, $I119)
  rxquantr118_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I119)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I119)
    goto rxquantr118_loop
  rxquantr118_done:
  # rx literal  "END"
    add $I11, rx105_pos, 3
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 3
    ne $S10, "END", rx105_fail
    add rx105_pos, 3
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
    goto alt115_end
  alt115_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_not_cclass $I11, 65535, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
  alt115_end:
.annotate "line", 54
    goto alt112_end
  alt112_1:
    set_addr $I10, alt112_2
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 56
  # rx literal  "begin"
    add $I11, rx105_pos, 5
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 5
    ne $S10, "begin", rx105_fail
    add rx105_pos, 5
  # rx rxquantr120 ** 1..*
    set_addr $I121, rxquantr120_done
    rx105_cur."!mark_push"(0, -1, $I121)
  rxquantr120_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I121)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I121)
    goto rxquantr120_loop
  rxquantr120_done:
  # rx subrule "identifier" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."identifier"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx105_pos = $P10."pos"()
  alt122_0:
.annotate "line", 57
    set_addr $I10, alt122_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 58
  # rx rxquantf123 ** 0..*
    set_addr $I10, rxquantf123_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf123_done
  rxquantf123_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf123_loop
    rx105_cur."!mark_push"($I124, rx105_pos, $I10)
  rxquantf123_done:
  # rx charclass nl
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
    substr $S10, rx105_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx105_pos, $I11
    inc rx105_pos
  # rx literal  "=end"
    add $I11, rx105_pos, 4
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 4
    ne $S10, "=end", rx105_fail
    add rx105_pos, 4
  # rx rxquantr125 ** 1..*
    set_addr $I126, rxquantr125_done
    rx105_cur."!mark_push"(0, -1, $I126)
  rxquantr125_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I126)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I126)
    goto rxquantr125_loop
  rxquantr125_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."!BACKREF"("identifier")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
    goto alt122_end
  alt122_1:
.annotate "line", 59
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("=begin without matching =end")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt122_end:
.annotate "line", 56
    goto alt112_end
  alt112_2:
    set_addr $I10, alt112_3
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 61
  # rx literal  "begin"
    add $I11, rx105_pos, 5
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 5
    ne $S10, "begin", rx105_fail
    add rx105_pos, 5
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  # rx rxquantr128 ** 0..*
    set_addr $I129, rxquantr128_done
    rx105_cur."!mark_push"(0, rx105_pos, $I129)
  rxquantr128_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I129)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I129)
    goto rxquantr128_loop
  rxquantr128_done:
  alt130_0:
.annotate "line", 62
    set_addr $I10, alt130_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rxanchor eol
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    if $I11, rxanchor131_done
    ne rx105_pos, rx105_eos, rx105_fail
    eq rx105_pos, 0, rxanchor131_done
    dec $I10
    is_cclass $I11, 4096, rx105_tgt, $I10
    if $I11, rx105_fail
  rxanchor131_done:
    goto alt130_end
  alt130_1:
    set_addr $I10, alt130_2
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx literal  "#"
    add $I11, rx105_pos, 1
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 1
    ne $S10, "#", rx105_fail
    add rx105_pos, 1
    goto alt130_end
  alt130_2:
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt130_end:
  alt132_0:
.annotate "line", 63
    set_addr $I10, alt132_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
.annotate "line", 64
  # rx rxquantf133 ** 0..*
    set_addr $I10, rxquantf133_loop
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
    goto rxquantf133_done
  rxquantf133_loop:
  # rx charclass .
    ge rx105_pos, rx105_eos, rx105_fail
    inc rx105_pos
    set_addr $I10, rxquantf133_loop
    rx105_cur."!mark_push"($I134, rx105_pos, $I10)
  rxquantf133_done:
  # rx charclass nl
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 4096, rx105_tgt, $I10
    unless $I11, rx105_fail
    substr $S10, rx105_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx105_pos, $I11
    inc rx105_pos
  # rx rxquantr135 ** 0..*
    set_addr $I136, rxquantr135_done
    rx105_cur."!mark_push"(0, rx105_pos, $I136)
  rxquantr135_loop:
  # rx enumcharlist negate=0 
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx105_fail
    inc rx105_pos
    (rx105_rep) = rx105_cur."!mark_commit"($I136)
    rx105_cur."!mark_push"(rx105_rep, rx105_pos, $I136)
    goto rxquantr135_loop
  rxquantr135_done:
  # rx literal  "=end"
    add $I11, rx105_pos, 4
    gt $I11, rx105_eos, rx105_fail
    sub $I11, rx105_pos, rx105_off
    substr $S10, rx105_tgt, $I11, 4
    ne $S10, "=end", rx105_fail
    add rx105_pos, 4
  # rxanchor rwb
    le rx105_pos, 0, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 8192, rx105_tgt, $I10
    if $I11, rx105_fail
    dec $I10
    is_cclass $I11, 8192, rx105_tgt, $I10
    unless $I11, rx105_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
    goto alt132_end
  alt132_1:
.annotate "line", 65
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("=begin without matching =end")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt132_end:
.annotate "line", 61
    goto alt112_end
  alt112_3:
.annotate "line", 69
  # rx rxquantr137 ** 0..1
    set_addr $I146, rxquantr137_done
    rx105_cur."!mark_push"(0, rx105_pos, $I146)
  rxquantr137_loop:
.annotate "line", 68
  # rx subrule "before" subtype=zerowidth negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    .const 'Sub' $P139 = "28_1259078882.26523" 
    capture_lex $P139
    $P10 = rx105_cur."before"($P139)
    unless $P10, rx105_fail
.annotate "line", 69
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
    (rx105_rep) = rx105_cur."!mark_commit"($I146)
  rxquantr137_done:
  alt147_0:
.annotate "line", 70
    set_addr $I10, alt147_1
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx subrule "alpha" subtype=capture negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."alpha"()
    unless $P10, rx105_fail
    rx105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("alpha")
    rx105_pos = $P10."pos"()
    goto alt147_end
  alt147_1:
    set_addr $I10, alt147_2
    rx105_cur."!mark_push"(0, rx105_pos, $I10)
  # rx charclass s
    ge rx105_pos, rx105_eos, rx105_fail
    sub $I10, rx105_pos, rx105_off
    is_cclass $I11, 32, rx105_tgt, $I10
    unless $I11, rx105_fail
    inc rx105_pos
    goto alt147_end
  alt147_2:
  # rx subrule "panic" subtype=method negate=
    rx105_cur."!cursor_pos"(rx105_pos)
    $P10 = rx105_cur."panic"("Illegal pod directive")
    unless $P10, rx105_fail
    rx105_pos = $P10."pos"()
  alt147_end:
.annotate "line", 71
  # rx charclass_q N r 0..-1
    sub $I10, rx105_pos, rx105_off
    find_cclass $I11, 4096, rx105_tgt, $I10, rx105_eos
    add rx105_pos, rx105_off, $I11
  alt112_end:
.annotate "line", 51
  # rx pass
    rx105_cur."!cursor_pass"(rx105_pos, "pod_comment")
    rx105_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx105_pos)
    .return (rx105_cur)
  rx105_fail:
.annotate "line", 4
    (rx105_rep, rx105_pos, $I10, $P10) = rx105_cur."!mark_fail"(0)
    lt rx105_pos, -1, rx105_done
    eq rx105_pos, -1, rx105_fail
    jump $I10
  rx105_done:
    rx105_cur."!cursor_fail"()
    rx105_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx105_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1259078882.26523") :method
.annotate "line", 4
    new $P107, "ResizablePMCArray"
    push $P107, ""
    .return ($P107)
.end


.namespace ["NQP";"Grammar"]
.sub "_block138"  :anon :subid("28_1259078882.26523") :method :outer("26_1259078882.26523")
.annotate "line", 68
    .lex unicode:"$\x{a2}", $P140
    .local string rx141_tgt
    .local int rx141_pos
    .local int rx141_off
    .local int rx141_eos
    .local int rx141_rep
    .local pmc rx141_cur
    (rx141_cur, rx141_pos, rx141_tgt) = self."!cursor_start"()
    rx141_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx141_cur
    .local pmc match
    .lex "$/", match
    length rx141_eos, rx141_tgt
    set rx141_off, 0
    lt rx141_pos, 2, rx141_start
    sub rx141_off, rx141_pos, 1
    substr rx141_tgt, rx141_tgt, rx141_off
  rx141_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan142_done
    goto rxscan142_scan
  rxscan142_loop:
    ($P10) = rx141_cur."from"()
    inc $P10
    set rx141_pos, $P10
    ge rx141_pos, rx141_eos, rxscan142_done
  rxscan142_scan:
    set_addr $I10, rxscan142_loop
    rx141_cur."!mark_push"(0, rx141_pos, $I10)
  rxscan142_done:
  # rx rxquantf143 ** 0..*
    set_addr $I10, rxquantf143_loop
    rx141_cur."!mark_push"(0, rx141_pos, $I10)
    goto rxquantf143_done
  rxquantf143_loop:
  # rx charclass .
    ge rx141_pos, rx141_eos, rx141_fail
    inc rx141_pos
    set_addr $I10, rxquantf143_loop
    rx141_cur."!mark_push"($I144, rx141_pos, $I10)
  rxquantf143_done:
  # rxanchor bol
    eq rx141_pos, 0, rxanchor145_done
    ge rx141_pos, rx141_eos, rx141_fail
    sub $I10, rx141_pos, rx141_off
    dec $I10
    is_cclass $I11, 4096, rx141_tgt, $I10
    unless $I11, rx141_fail
  rxanchor145_done:
  # rx literal  "=cut"
    add $I11, rx141_pos, 4
    gt $I11, rx141_eos, rx141_fail
    sub $I11, rx141_pos, rx141_off
    substr $S10, rx141_tgt, $I11, 4
    ne $S10, "=cut", rx141_fail
    add rx141_pos, 4
  # rxanchor rwb
    le rx141_pos, 0, rx141_fail
    sub $I10, rx141_pos, rx141_off
    is_cclass $I11, 8192, rx141_tgt, $I10
    if $I11, rx141_fail
    dec $I10
    is_cclass $I11, 8192, rx141_tgt, $I10
    unless $I11, rx141_fail
  # rx pass
    rx141_cur."!cursor_pass"(rx141_pos, "")
    rx141_cur."!cursor_debug"("PASS  ", "", " at pos=", rx141_pos)
    .return (rx141_cur)
  rx141_fail:
    (rx141_rep, rx141_pos, $I10, $P10) = rx141_cur."!mark_fail"(0)
    lt rx141_pos, -1, rx141_done
    eq rx141_pos, -1, rx141_fail
    jump $I10
  rx141_done:
    rx141_cur."!cursor_fail"()
    rx141_cur."!cursor_debug"("FAIL  ", "")
    .return (rx141_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx149_tgt
    .local int rx149_pos
    .local int rx149_off
    .local int rx149_eos
    .local int rx149_rep
    .local pmc rx149_cur
    (rx149_cur, rx149_pos, rx149_tgt) = self."!cursor_start"()
    rx149_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx149_cur
    .local pmc match
    .lex "$/", match
    length rx149_eos, rx149_tgt
    set rx149_off, 0
    lt rx149_pos, 2, rx149_start
    sub rx149_off, rx149_pos, 1
    substr rx149_tgt, rx149_tgt, rx149_off
  rx149_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan153_done
    goto rxscan153_scan
  rxscan153_loop:
    ($P10) = rx149_cur."from"()
    inc $P10
    set rx149_pos, $P10
    ge rx149_pos, rx149_eos, rxscan153_done
  rxscan153_scan:
    set_addr $I10, rxscan153_loop
    rx149_cur."!mark_push"(0, rx149_pos, $I10)
  rxscan153_done:
.annotate "line", 79
  # rx subrule "newpad" subtype=method negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."newpad"()
    unless $P10, rx149_fail
    rx149_pos = $P10."pos"()
.annotate "line", 80
  # rx subrule "statementlist" subtype=capture negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."statementlist"()
    unless $P10, rx149_fail
    rx149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx149_pos = $P10."pos"()
  alt154_0:
.annotate "line", 81
    set_addr $I10, alt154_1
    rx149_cur."!mark_push"(0, rx149_pos, $I10)
  # rxanchor eos
    ne rx149_pos, rx149_eos, rx149_fail
    goto alt154_end
  alt154_1:
  # rx subrule "panic" subtype=method negate=
    rx149_cur."!cursor_pos"(rx149_pos)
    $P10 = rx149_cur."panic"("Confused")
    unless $P10, rx149_fail
    rx149_pos = $P10."pos"()
  alt154_end:
.annotate "line", 78
  # rx pass
    rx149_cur."!cursor_pass"(rx149_pos, "comp_unit")
    rx149_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx149_pos)
    .return (rx149_cur)
  rx149_fail:
.annotate "line", 4
    (rx149_rep, rx149_pos, $I10, $P10) = rx149_cur."!mark_fail"(0)
    lt rx149_pos, -1, rx149_done
    eq rx149_pos, -1, rx149_fail
    jump $I10
  rx149_done:
    rx149_cur."!cursor_fail"()
    rx149_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1259078882.26523") :method
.annotate "line", 4
    $P151 = self."!PREFIX__!subrule"("", "")
    new $P152, "ResizablePMCArray"
    push $P152, $P151
    .return ($P152)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx156_tgt
    .local int rx156_pos
    .local int rx156_off
    .local int rx156_eos
    .local int rx156_rep
    .local pmc rx156_cur
    (rx156_cur, rx156_pos, rx156_tgt) = self."!cursor_start"()
    rx156_cur."!cursor_debug"("START ", "statementlist")
    rx156_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx156_cur
    .local pmc match
    .lex "$/", match
    length rx156_eos, rx156_tgt
    set rx156_off, 0
    lt rx156_pos, 2, rx156_start
    sub rx156_off, rx156_pos, 1
    substr rx156_tgt, rx156_tgt, rx156_off
  rx156_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan159_done
    goto rxscan159_scan
  rxscan159_loop:
    ($P10) = rx156_cur."from"()
    inc $P10
    set rx156_pos, $P10
    ge rx156_pos, rx156_eos, rxscan159_done
  rxscan159_scan:
    set_addr $I10, rxscan159_loop
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
  rxscan159_done:
  alt160_0:
.annotate "line", 84
    set_addr $I10, alt160_1
    rx156_cur."!mark_push"(0, rx156_pos, $I10)
.annotate "line", 85
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  # rxanchor eos
    ne rx156_pos, rx156_eos, rx156_fail
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
    goto alt160_end
  alt160_1:
.annotate "line", 86
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  # rx rxquantr164 ** 0..*
    set_addr $I166, rxquantr164_done
    rx156_cur."!mark_push"(0, rx156_pos, $I166)
  rxquantr164_loop:
  # rx subrule "statement" subtype=capture negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."statement"()
    unless $P10, rx156_fail
    rx156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx156_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."eat_terminator"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
    (rx156_rep) = rx156_cur."!mark_commit"($I166)
    rx156_cur."!mark_push"(rx156_rep, rx156_pos, $I166)
    goto rxquantr164_loop
  rxquantr164_done:
  # rx subrule "ws" subtype=method negate=
    rx156_cur."!cursor_pos"(rx156_pos)
    $P10 = rx156_cur."ws"()
    unless $P10, rx156_fail
    rx156_pos = $P10."pos"()
  alt160_end:
.annotate "line", 84
  # rx pass
    rx156_cur."!cursor_pass"(rx156_pos, "statementlist")
    rx156_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx156_pos)
    .return (rx156_cur)
  rx156_fail:
.annotate "line", 4
    (rx156_rep, rx156_pos, $I10, $P10) = rx156_cur."!mark_fail"(0)
    lt rx156_pos, -1, rx156_done
    eq rx156_pos, -1, rx156_fail
    jump $I10
  rx156_done:
    rx156_cur."!cursor_fail"()
    rx156_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1259078882.26523") :method
.annotate "line", 4
    new $P158, "ResizablePMCArray"
    push $P158, ""
    push $P158, ""
    .return ($P158)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .const 'Sub' $P174 = "35_1259078882.26523" 
    capture_lex $P174
    .local string rx169_tgt
    .local int rx169_pos
    .local int rx169_off
    .local int rx169_eos
    .local int rx169_rep
    .local pmc rx169_cur
    (rx169_cur, rx169_pos, rx169_tgt) = self."!cursor_start"()
    rx169_cur."!cursor_debug"("START ", "statement")
    rx169_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx169_cur
    .local pmc match
    .lex "$/", match
    length rx169_eos, rx169_tgt
    set rx169_off, 0
    lt rx169_pos, 2, rx169_start
    sub rx169_off, rx169_pos, 1
    substr rx169_tgt, rx169_tgt, rx169_off
  rx169_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan172_done
    goto rxscan172_scan
  rxscan172_loop:
    ($P10) = rx169_cur."from"()
    inc $P10
    set rx169_pos, $P10
    ge rx169_pos, rx169_eos, rxscan172_done
  rxscan172_scan:
    set_addr $I10, rxscan172_loop
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
  rxscan172_done:
.annotate "line", 90
  # rx subrule "before" subtype=zerowidth negate=1
    rx169_cur."!cursor_pos"(rx169_pos)
    .const 'Sub' $P174 = "35_1259078882.26523" 
    capture_lex $P174
    $P10 = rx169_cur."before"($P174)
    if $P10, rx169_fail
  alt179_0:
.annotate "line", 91
    set_addr $I10, alt179_1
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
.annotate "line", 92
  # rx subrule "statement_control" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."statement_control"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx169_pos = $P10."pos"()
    goto alt179_end
  alt179_1:
.annotate "line", 93
  # rx subrule "EXPR" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."EXPR"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx169_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."ws"()
    unless $P10, rx169_fail
    rx169_pos = $P10."pos"()
.annotate "line", 97
  # rx rxquantr180 ** 0..1
    set_addr $I184, rxquantr180_done
    rx169_cur."!mark_push"(0, rx169_pos, $I184)
  rxquantr180_loop:
  alt181_0:
.annotate "line", 94
    set_addr $I10, alt181_1
    rx169_cur."!mark_push"(0, rx169_pos, $I10)
.annotate "line", 95
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."statement_mod_cond"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx169_pos = $P10."pos"()
  # rx rxquantr182 ** 0..1
    set_addr $I183, rxquantr182_done
    rx169_cur."!mark_push"(0, rx169_pos, $I183)
  rxquantr182_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."statement_mod_loop"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx169_pos = $P10."pos"()
    (rx169_rep) = rx169_cur."!mark_commit"($I183)
  rxquantr182_done:
    goto alt181_end
  alt181_1:
.annotate "line", 96
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx169_cur."!cursor_pos"(rx169_pos)
    $P10 = rx169_cur."statement_mod_loop"()
    unless $P10, rx169_fail
    rx169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx169_pos = $P10."pos"()
  alt181_end:
.annotate "line", 97
    (rx169_rep) = rx169_cur."!mark_commit"($I184)
  rxquantr180_done:
  alt179_end:
.annotate "line", 89
  # rx pass
    rx169_cur."!cursor_pass"(rx169_pos, "statement")
    rx169_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx169_pos)
    .return (rx169_cur)
  rx169_fail:
.annotate "line", 4
    (rx169_rep, rx169_pos, $I10, $P10) = rx169_cur."!mark_fail"(0)
    lt rx169_pos, -1, rx169_done
    eq rx169_pos, -1, rx169_fail
    jump $I10
  rx169_done:
    rx169_cur."!cursor_fail"()
    rx169_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1259078882.26523") :method
.annotate "line", 4
    new $P171, "ResizablePMCArray"
    push $P171, ""
    .return ($P171)
.end


.namespace ["NQP";"Grammar"]
.sub "_block173"  :anon :subid("35_1259078882.26523") :method :outer("33_1259078882.26523")
.annotate "line", 90
    .lex unicode:"$\x{a2}", $P175
    .local string rx176_tgt
    .local int rx176_pos
    .local int rx176_off
    .local int rx176_eos
    .local int rx176_rep
    .local pmc rx176_cur
    (rx176_cur, rx176_pos, rx176_tgt) = self."!cursor_start"()
    rx176_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx176_cur
    .local pmc match
    .lex "$/", match
    length rx176_eos, rx176_tgt
    set rx176_off, 0
    lt rx176_pos, 2, rx176_start
    sub rx176_off, rx176_pos, 1
    substr rx176_tgt, rx176_tgt, rx176_off
  rx176_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan177_done
    goto rxscan177_scan
  rxscan177_loop:
    ($P10) = rx176_cur."from"()
    inc $P10
    set rx176_pos, $P10
    ge rx176_pos, rx176_eos, rxscan177_done
  rxscan177_scan:
    set_addr $I10, rxscan177_loop
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
  rxscan177_done:
  alt178_0:
    set_addr $I10, alt178_1
    rx176_cur."!mark_push"(0, rx176_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx176_pos, rx176_eos, rx176_fail
    sub $I10, rx176_pos, rx176_off
    substr $S10, rx176_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx176_fail
    inc rx176_pos
    goto alt178_end
  alt178_1:
  # rxanchor eos
    ne rx176_pos, rx176_eos, rx176_fail
  alt178_end:
  # rx pass
    rx176_cur."!cursor_pass"(rx176_pos, "")
    rx176_cur."!cursor_debug"("PASS  ", "", " at pos=", rx176_pos)
    .return (rx176_cur)
  rx176_fail:
    (rx176_rep, rx176_pos, $I10, $P10) = rx176_cur."!mark_fail"(0)
    lt rx176_pos, -1, rx176_done
    eq rx176_pos, -1, rx176_fail
    jump $I10
  rx176_done:
    rx176_cur."!cursor_fail"()
    rx176_cur."!cursor_debug"("FAIL  ", "")
    .return (rx176_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx186_tgt
    .local int rx186_pos
    .local int rx186_off
    .local int rx186_eos
    .local int rx186_rep
    .local pmc rx186_cur
    (rx186_cur, rx186_pos, rx186_tgt) = self."!cursor_start"()
    rx186_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx186_cur
    .local pmc match
    .lex "$/", match
    length rx186_eos, rx186_tgt
    set rx186_off, 0
    lt rx186_pos, 2, rx186_start
    sub rx186_off, rx186_pos, 1
    substr rx186_tgt, rx186_tgt, rx186_off
  rx186_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan189_done
    goto rxscan189_scan
  rxscan189_loop:
    ($P10) = rx186_cur."from"()
    inc $P10
    set rx186_pos, $P10
    ge rx186_pos, rx186_eos, rxscan189_done
  rxscan189_scan:
    set_addr $I10, rxscan189_loop
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
  rxscan189_done:
  alt190_0:
.annotate "line", 101
    set_addr $I10, alt190_1
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
.annotate "line", 102
  # rx literal  ";"
    add $I11, rx186_pos, 1
    gt $I11, rx186_eos, rx186_fail
    sub $I11, rx186_pos, rx186_off
    substr $S10, rx186_tgt, $I11, 1
    ne $S10, ";", rx186_fail
    add rx186_pos, 1
    goto alt190_end
  alt190_1:
    set_addr $I10, alt190_2
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
.annotate "line", 103
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx186_cur."!cursor_pos"(rx186_pos)
    $P10 = rx186_cur."MARKED"("endstmt")
    unless $P10, rx186_fail
    goto alt190_end
  alt190_2:
    set_addr $I10, alt190_3
    rx186_cur."!mark_push"(0, rx186_pos, $I10)
.annotate "line", 104
  # rx subrule "terminator" subtype=zerowidth negate=
    rx186_cur."!cursor_pos"(rx186_pos)
    $P10 = rx186_cur."terminator"()
    unless $P10, rx186_fail
    goto alt190_end
  alt190_3:
.annotate "line", 105
  # rxanchor eos
    ne rx186_pos, rx186_eos, rx186_fail
  alt190_end:
.annotate "line", 101
  # rx pass
    rx186_cur."!cursor_pass"(rx186_pos, "eat_terminator")
    rx186_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx186_pos)
    .return (rx186_cur)
  rx186_fail:
.annotate "line", 4
    (rx186_rep, rx186_pos, $I10, $P10) = rx186_cur."!mark_fail"(0)
    lt rx186_pos, -1, rx186_done
    eq rx186_pos, -1, rx186_fail
    jump $I10
  rx186_done:
    rx186_cur."!cursor_fail"()
    rx186_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx186_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1259078882.26523") :method
.annotate "line", 4
    new $P188, "ResizablePMCArray"
    push $P188, ""
    push $P188, ""
    push $P188, ""
    push $P188, ";"
    .return ($P188)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx192_tgt
    .local int rx192_pos
    .local int rx192_off
    .local int rx192_eos
    .local int rx192_rep
    .local pmc rx192_cur
    (rx192_cur, rx192_pos, rx192_tgt) = self."!cursor_start"()
    rx192_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx192_cur
    .local pmc match
    .lex "$/", match
    length rx192_eos, rx192_tgt
    set rx192_off, 0
    lt rx192_pos, 2, rx192_start
    sub rx192_off, rx192_pos, 1
    substr rx192_tgt, rx192_tgt, rx192_off
  rx192_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan196_done
    goto rxscan196_scan
  rxscan196_loop:
    ($P10) = rx192_cur."from"()
    inc $P10
    set rx192_pos, $P10
    ge rx192_pos, rx192_eos, rxscan196_done
  rxscan196_scan:
    set_addr $I10, rxscan196_loop
    rx192_cur."!mark_push"(0, rx192_pos, $I10)
  rxscan196_done:
.annotate "line", 109
  # rx subrule "EXPR" subtype=capture negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."EXPR"()
    unless $P10, rx192_fail
    rx192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx192_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."ws"()
    unless $P10, rx192_fail
    rx192_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx192_cur."!cursor_pos"(rx192_pos)
    $P10 = rx192_cur."pblock"()
    unless $P10, rx192_fail
    rx192_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx192_pos = $P10."pos"()
.annotate "line", 108
  # rx pass
    rx192_cur."!cursor_pass"(rx192_pos, "xblock")
    rx192_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx192_pos)
    .return (rx192_cur)
  rx192_fail:
.annotate "line", 4
    (rx192_rep, rx192_pos, $I10, $P10) = rx192_cur."!mark_fail"(0)
    lt rx192_pos, -1, rx192_done
    eq rx192_pos, -1, rx192_fail
    jump $I10
  rx192_done:
    rx192_cur."!cursor_fail"()
    rx192_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx192_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1259078882.26523") :method
.annotate "line", 4
    $P194 = self."!PREFIX__!subrule"("EXPR", "")
    new $P195, "ResizablePMCArray"
    push $P195, $P194
    .return ($P195)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx198_tgt
    .local int rx198_pos
    .local int rx198_off
    .local int rx198_eos
    .local int rx198_rep
    .local pmc rx198_cur
    (rx198_cur, rx198_pos, rx198_tgt) = self."!cursor_start"()
    rx198_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx198_cur
    .local pmc match
    .lex "$/", match
    length rx198_eos, rx198_tgt
    set rx198_off, 0
    lt rx198_pos, 2, rx198_start
    sub rx198_off, rx198_pos, 1
    substr rx198_tgt, rx198_tgt, rx198_off
  rx198_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan203_done
    goto rxscan203_scan
  rxscan203_loop:
    ($P10) = rx198_cur."from"()
    inc $P10
    set rx198_pos, $P10
    ge rx198_pos, rx198_eos, rxscan203_done
  rxscan203_scan:
    set_addr $I10, rxscan203_loop
    rx198_cur."!mark_push"(0, rx198_pos, $I10)
  rxscan203_done:
  alt204_0:
.annotate "line", 112
    set_addr $I10, alt204_1
    rx198_cur."!mark_push"(0, rx198_pos, $I10)
.annotate "line", 113
  # rx subrule "lambda" subtype=method negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."lambda"()
    unless $P10, rx198_fail
    rx198_pos = $P10."pos"()
.annotate "line", 114
  # rx subrule "newpad" subtype=method negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."newpad"()
    unless $P10, rx198_fail
    rx198_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "signature" subtype=capture negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."signature"()
    unless $P10, rx198_fail
    rx198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx198_pos = $P10."pos"()
.annotate "line", 116
  # rx subrule "blockoid" subtype=capture negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."blockoid"()
    unless $P10, rx198_fail
    rx198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx198_pos = $P10."pos"()
.annotate "line", 113
    goto alt204_end
  alt204_1:
    set_addr $I10, alt204_2
    rx198_cur."!mark_push"(0, rx198_pos, $I10)
.annotate "line", 117
  # rx enumcharlist negate=0 zerowidth
    ge rx198_pos, rx198_eos, rx198_fail
    sub $I10, rx198_pos, rx198_off
    substr $S10, rx198_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx198_fail
.annotate "line", 118
  # rx subrule "newpad" subtype=method negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."newpad"()
    unless $P10, rx198_fail
    rx198_pos = $P10."pos"()
.annotate "line", 119
  # rx subrule "blockoid" subtype=capture negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."blockoid"()
    unless $P10, rx198_fail
    rx198_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx198_pos = $P10."pos"()
.annotate "line", 117
    goto alt204_end
  alt204_2:
.annotate "line", 120
  # rx subrule "panic" subtype=method negate=
    rx198_cur."!cursor_pos"(rx198_pos)
    $P10 = rx198_cur."panic"("Missing block")
    unless $P10, rx198_fail
    rx198_pos = $P10."pos"()
  alt204_end:
.annotate "line", 112
  # rx pass
    rx198_cur."!cursor_pass"(rx198_pos, "pblock")
    rx198_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx198_pos)
    .return (rx198_cur)
  rx198_fail:
.annotate "line", 4
    (rx198_rep, rx198_pos, $I10, $P10) = rx198_cur."!mark_fail"(0)
    lt rx198_pos, -1, rx198_done
    eq rx198_pos, -1, rx198_fail
    jump $I10
  rx198_done:
    rx198_cur."!cursor_fail"()
    rx198_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx198_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1259078882.26523") :method
.annotate "line", 4
    $P200 = self."!PREFIX__!subrule"("", "")
    $P201 = self."!PREFIX__!subrule"("", "")
    new $P202, "ResizablePMCArray"
    push $P202, $P200
    push $P202, "{"
    push $P202, $P201
    .return ($P202)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx206_tgt
    .local int rx206_pos
    .local int rx206_off
    .local int rx206_eos
    .local int rx206_rep
    .local pmc rx206_cur
    (rx206_cur, rx206_pos, rx206_tgt) = self."!cursor_start"()
    rx206_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx206_cur
    .local pmc match
    .lex "$/", match
    length rx206_eos, rx206_tgt
    set rx206_off, 0
    lt rx206_pos, 2, rx206_start
    sub rx206_off, rx206_pos, 1
    substr rx206_tgt, rx206_tgt, rx206_off
  rx206_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan209_done
    goto rxscan209_scan
  rxscan209_loop:
    ($P10) = rx206_cur."from"()
    inc $P10
    set rx206_pos, $P10
    ge rx206_pos, rx206_eos, rxscan209_done
  rxscan209_scan:
    set_addr $I10, rxscan209_loop
    rx206_cur."!mark_push"(0, rx206_pos, $I10)
  rxscan209_done:
  alt210_0:
.annotate "line", 123
    set_addr $I10, alt210_1
    rx206_cur."!mark_push"(0, rx206_pos, $I10)
  # rx literal  "->"
    add $I11, rx206_pos, 2
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I11, 2
    ne $S10, "->", rx206_fail
    add rx206_pos, 2
    goto alt210_end
  alt210_1:
  # rx literal  "<->"
    add $I11, rx206_pos, 3
    gt $I11, rx206_eos, rx206_fail
    sub $I11, rx206_pos, rx206_off
    substr $S10, rx206_tgt, $I11, 3
    ne $S10, "<->", rx206_fail
    add rx206_pos, 3
  alt210_end:
  # rx pass
    rx206_cur."!cursor_pass"(rx206_pos, "lambda")
    rx206_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx206_pos)
    .return (rx206_cur)
  rx206_fail:
.annotate "line", 4
    (rx206_rep, rx206_pos, $I10, $P10) = rx206_cur."!mark_fail"(0)
    lt rx206_pos, -1, rx206_done
    eq rx206_pos, -1, rx206_fail
    jump $I10
  rx206_done:
    rx206_cur."!cursor_fail"()
    rx206_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx206_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1259078882.26523") :method
.annotate "line", 4
    new $P208, "ResizablePMCArray"
    push $P208, "<->"
    push $P208, "->"
    .return ($P208)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx212_tgt
    .local int rx212_pos
    .local int rx212_off
    .local int rx212_eos
    .local int rx212_rep
    .local pmc rx212_cur
    (rx212_cur, rx212_pos, rx212_tgt) = self."!cursor_start"()
    rx212_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx212_cur
    .local pmc match
    .lex "$/", match
    length rx212_eos, rx212_tgt
    set rx212_off, 0
    lt rx212_pos, 2, rx212_start
    sub rx212_off, rx212_pos, 1
    substr rx212_tgt, rx212_tgt, rx212_off
  rx212_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan216_done
    goto rxscan216_scan
  rxscan216_loop:
    ($P10) = rx212_cur."from"()
    inc $P10
    set rx212_pos, $P10
    ge rx212_pos, rx212_eos, rxscan216_done
  rxscan216_scan:
    set_addr $I10, rxscan216_loop
    rx212_cur."!mark_push"(0, rx212_pos, $I10)
  rxscan216_done:
  alt217_0:
.annotate "line", 126
    set_addr $I10, alt217_1
    rx212_cur."!mark_push"(0, rx212_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx212_pos, rx212_eos, rx212_fail
    sub $I10, rx212_pos, rx212_off
    substr $S10, rx212_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx212_fail
    goto alt217_end
  alt217_1:
  # rx subrule "panic" subtype=method negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."panic"("Missing block")
    unless $P10, rx212_fail
    rx212_pos = $P10."pos"()
  alt217_end:
.annotate "line", 127
  # rx subrule "newpad" subtype=method negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."newpad"()
    unless $P10, rx212_fail
    rx212_pos = $P10."pos"()
.annotate "line", 128
  # rx subrule "blockoid" subtype=capture negate=
    rx212_cur."!cursor_pos"(rx212_pos)
    $P10 = rx212_cur."blockoid"()
    unless $P10, rx212_fail
    rx212_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx212_pos = $P10."pos"()
.annotate "line", 125
  # rx pass
    rx212_cur."!cursor_pass"(rx212_pos, "block")
    rx212_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx212_pos)
    .return (rx212_cur)
  rx212_fail:
.annotate "line", 4
    (rx212_rep, rx212_pos, $I10, $P10) = rx212_cur."!mark_fail"(0)
    lt rx212_pos, -1, rx212_done
    eq rx212_pos, -1, rx212_fail
    jump $I10
  rx212_done:
    rx212_cur."!cursor_fail"()
    rx212_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx212_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1259078882.26523") :method
.annotate "line", 4
    $P214 = self."!PREFIX__!subrule"("", "")
    new $P215, "ResizablePMCArray"
    push $P215, $P214
    push $P215, "{"
    .return ($P215)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx219_tgt
    .local int rx219_pos
    .local int rx219_off
    .local int rx219_eos
    .local int rx219_rep
    .local pmc rx219_cur
    (rx219_cur, rx219_pos, rx219_tgt) = self."!cursor_start"()
    rx219_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx219_cur
    .local pmc match
    .lex "$/", match
    length rx219_eos, rx219_tgt
    set rx219_off, 0
    lt rx219_pos, 2, rx219_start
    sub rx219_off, rx219_pos, 1
    substr rx219_tgt, rx219_tgt, rx219_off
  rx219_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan223_done
    goto rxscan223_scan
  rxscan223_loop:
    ($P10) = rx219_cur."from"()
    inc $P10
    set rx219_pos, $P10
    ge rx219_pos, rx219_eos, rxscan223_done
  rxscan223_scan:
    set_addr $I10, rxscan223_loop
    rx219_cur."!mark_push"(0, rx219_pos, $I10)
  rxscan223_done:
.annotate "line", 132
  # rx subrule "finishpad" subtype=method negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."finishpad"()
    unless $P10, rx219_fail
    rx219_pos = $P10."pos"()
.annotate "line", 133
  # rx literal  "{"
    add $I11, rx219_pos, 1
    gt $I11, rx219_eos, rx219_fail
    sub $I11, rx219_pos, rx219_off
    substr $S10, rx219_tgt, $I11, 1
    ne $S10, "{", rx219_fail
    add rx219_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."statementlist"()
    unless $P10, rx219_fail
    rx219_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx219_pos = $P10."pos"()
  alt224_0:
    set_addr $I10, alt224_1
    rx219_cur."!mark_push"(0, rx219_pos, $I10)
  # rx literal  "}"
    add $I11, rx219_pos, 1
    gt $I11, rx219_eos, rx219_fail
    sub $I11, rx219_pos, rx219_off
    substr $S10, rx219_tgt, $I11, 1
    ne $S10, "}", rx219_fail
    add rx219_pos, 1
    goto alt224_end
  alt224_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."FAILGOAL"("'}'")
    unless $P10, rx219_fail
    rx219_pos = $P10."pos"()
  alt224_end:
.annotate "line", 134
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx219_cur."!cursor_pos"(rx219_pos)
    $P10 = rx219_cur."ENDSTMT"()
    unless $P10, rx219_fail
.annotate "line", 131
  # rx pass
    rx219_cur."!cursor_pass"(rx219_pos, "blockoid")
    rx219_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx219_pos)
    .return (rx219_cur)
  rx219_fail:
.annotate "line", 4
    (rx219_rep, rx219_pos, $I10, $P10) = rx219_cur."!mark_fail"(0)
    lt rx219_pos, -1, rx219_done
    eq rx219_pos, -1, rx219_fail
    jump $I10
  rx219_done:
    rx219_cur."!cursor_fail"()
    rx219_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx219_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1259078882.26523") :method
.annotate "line", 4
    $P221 = self."!PREFIX__!subrule"("", "")
    new $P222, "ResizablePMCArray"
    push $P222, $P221
    .return ($P222)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx227_tgt
    .local int rx227_pos
    .local int rx227_off
    .local int rx227_eos
    .local int rx227_rep
    .local pmc rx227_cur
    (rx227_cur, rx227_pos, rx227_tgt) = self."!cursor_start"()
    rx227_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx227_cur
    .local pmc match
    .lex "$/", match
    length rx227_eos, rx227_tgt
    set rx227_off, 0
    lt rx227_pos, 2, rx227_start
    sub rx227_off, rx227_pos, 1
    substr rx227_tgt, rx227_tgt, rx227_off
  rx227_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan230_done
    goto rxscan230_scan
  rxscan230_loop:
    ($P10) = rx227_cur."from"()
    inc $P10
    set rx227_pos, $P10
    ge rx227_pos, rx227_eos, rxscan230_done
  rxscan230_scan:
    set_addr $I10, rxscan230_loop
    rx227_cur."!mark_push"(0, rx227_pos, $I10)
  rxscan230_done:
.annotate "line", 137
  # rx pass
    rx227_cur."!cursor_pass"(rx227_pos, "newpad")
    rx227_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx227_pos)
    .return (rx227_cur)
  rx227_fail:
.annotate "line", 4
    (rx227_rep, rx227_pos, $I10, $P10) = rx227_cur."!mark_fail"(0)
    lt rx227_pos, -1, rx227_done
    eq rx227_pos, -1, rx227_fail
    jump $I10
  rx227_done:
    rx227_cur."!cursor_fail"()
    rx227_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx227_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1259078882.26523") :method
.annotate "line", 4
    new $P229, "ResizablePMCArray"
    push $P229, ""
    .return ($P229)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx232_tgt
    .local int rx232_pos
    .local int rx232_off
    .local int rx232_eos
    .local int rx232_rep
    .local pmc rx232_cur
    (rx232_cur, rx232_pos, rx232_tgt) = self."!cursor_start"()
    rx232_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx232_cur
    .local pmc match
    .lex "$/", match
    length rx232_eos, rx232_tgt
    set rx232_off, 0
    lt rx232_pos, 2, rx232_start
    sub rx232_off, rx232_pos, 1
    substr rx232_tgt, rx232_tgt, rx232_off
  rx232_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan235_done
    goto rxscan235_scan
  rxscan235_loop:
    ($P10) = rx232_cur."from"()
    inc $P10
    set rx232_pos, $P10
    ge rx232_pos, rx232_eos, rxscan235_done
  rxscan235_scan:
    set_addr $I10, rxscan235_loop
    rx232_cur."!mark_push"(0, rx232_pos, $I10)
  rxscan235_done:
.annotate "line", 138
  # rx pass
    rx232_cur."!cursor_pass"(rx232_pos, "finishpad")
    rx232_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx232_pos)
    .return (rx232_cur)
  rx232_fail:
.annotate "line", 4
    (rx232_rep, rx232_pos, $I10, $P10) = rx232_cur."!mark_fail"(0)
    lt rx232_pos, -1, rx232_done
    eq rx232_pos, -1, rx232_fail
    jump $I10
  rx232_done:
    rx232_cur."!cursor_fail"()
    rx232_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx232_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1259078882.26523") :method
.annotate "line", 4
    new $P234, "ResizablePMCArray"
    push $P234, ""
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1259078882.26523") :method
.annotate "line", 140
    $P237 = self."!protoregex"("terminator")
    .return ($P237)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1259078882.26523") :method
.annotate "line", 140
    $P239 = self."!PREFIX__!protoregex"("terminator")
    .return ($P239)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx241_tgt
    .local int rx241_pos
    .local int rx241_off
    .local int rx241_eos
    .local int rx241_rep
    .local pmc rx241_cur
    (rx241_cur, rx241_pos, rx241_tgt) = self."!cursor_start"()
    rx241_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx241_cur
    .local pmc match
    .lex "$/", match
    length rx241_eos, rx241_tgt
    set rx241_off, 0
    lt rx241_pos, 2, rx241_start
    sub rx241_off, rx241_pos, 1
    substr rx241_tgt, rx241_tgt, rx241_off
  rx241_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan244_done
    goto rxscan244_scan
  rxscan244_loop:
    ($P10) = rx241_cur."from"()
    inc $P10
    set rx241_pos, $P10
    ge rx241_pos, rx241_eos, rxscan244_done
  rxscan244_scan:
    set_addr $I10, rxscan244_loop
    rx241_cur."!mark_push"(0, rx241_pos, $I10)
  rxscan244_done:
.annotate "line", 142
  # rx enumcharlist negate=0 zerowidth
    ge rx241_pos, rx241_eos, rx241_fail
    sub $I10, rx241_pos, rx241_off
    substr $S10, rx241_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx241_fail
  # rx pass
    rx241_cur."!cursor_pass"(rx241_pos, "terminator:sym<;>")
    rx241_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx241_pos)
    .return (rx241_cur)
  rx241_fail:
.annotate "line", 4
    (rx241_rep, rx241_pos, $I10, $P10) = rx241_cur."!mark_fail"(0)
    lt rx241_pos, -1, rx241_done
    eq rx241_pos, -1, rx241_fail
    jump $I10
  rx241_done:
    rx241_cur."!cursor_fail"()
    rx241_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx241_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1259078882.26523") :method
.annotate "line", 4
    new $P243, "ResizablePMCArray"
    push $P243, ";"
    .return ($P243)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx246_tgt
    .local int rx246_pos
    .local int rx246_off
    .local int rx246_eos
    .local int rx246_rep
    .local pmc rx246_cur
    (rx246_cur, rx246_pos, rx246_tgt) = self."!cursor_start"()
    rx246_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx246_cur
    .local pmc match
    .lex "$/", match
    length rx246_eos, rx246_tgt
    set rx246_off, 0
    lt rx246_pos, 2, rx246_start
    sub rx246_off, rx246_pos, 1
    substr rx246_tgt, rx246_tgt, rx246_off
  rx246_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan249_done
    goto rxscan249_scan
  rxscan249_loop:
    ($P10) = rx246_cur."from"()
    inc $P10
    set rx246_pos, $P10
    ge rx246_pos, rx246_eos, rxscan249_done
  rxscan249_scan:
    set_addr $I10, rxscan249_loop
    rx246_cur."!mark_push"(0, rx246_pos, $I10)
  rxscan249_done:
.annotate "line", 143
  # rx enumcharlist negate=0 zerowidth
    ge rx246_pos, rx246_eos, rx246_fail
    sub $I10, rx246_pos, rx246_off
    substr $S10, rx246_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx246_fail
  # rx pass
    rx246_cur."!cursor_pass"(rx246_pos, "terminator:sym<}>")
    rx246_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx246_pos)
    .return (rx246_cur)
  rx246_fail:
.annotate "line", 4
    (rx246_rep, rx246_pos, $I10, $P10) = rx246_cur."!mark_fail"(0)
    lt rx246_pos, -1, rx246_done
    eq rx246_pos, -1, rx246_fail
    jump $I10
  rx246_done:
    rx246_cur."!cursor_fail"()
    rx246_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx246_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1259078882.26523") :method
.annotate "line", 4
    new $P248, "ResizablePMCArray"
    push $P248, "}"
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1259078882.26523") :method
.annotate "line", 147
    $P251 = self."!protoregex"("statement_control")
    .return ($P251)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1259078882.26523") :method
.annotate "line", 147
    $P253 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P253)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx255_tgt
    .local int rx255_pos
    .local int rx255_off
    .local int rx255_eos
    .local int rx255_rep
    .local pmc rx255_cur
    (rx255_cur, rx255_pos, rx255_tgt) = self."!cursor_start"()
    rx255_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx255_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx255_cur
    .local pmc match
    .lex "$/", match
    length rx255_eos, rx255_tgt
    set rx255_off, 0
    lt rx255_pos, 2, rx255_start
    sub rx255_off, rx255_pos, 1
    substr rx255_tgt, rx255_tgt, rx255_off
  rx255_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan258_done
    goto rxscan258_scan
  rxscan258_loop:
    ($P10) = rx255_cur."from"()
    inc $P10
    set rx255_pos, $P10
    ge rx255_pos, rx255_eos, rxscan258_done
  rxscan258_scan:
    set_addr $I10, rxscan258_loop
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  rxscan258_done:
.annotate "line", 150
  # rx subcapture "sym"
    set_addr $I10, rxcap_259_fail
    rx255_cur."!mark_push"(0, rx255_pos, $I10)
  # rx literal  "if"
    add $I11, rx255_pos, 2
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 2
    ne $S10, "if", rx255_fail
    add rx255_pos, 2
    set_addr $I10, rxcap_259_fail
    ($I12, $I11) = rx255_cur."!mark_peek"($I10)
    rx255_cur."!cursor_pos"($I11)
    ($P10) = rx255_cur."!cursor_start"()
    $P10."!cursor_pass"(rx255_pos, "")
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_259_done
  rxcap_259_fail:
    goto rx255_fail
  rxcap_259_done:
  # rx charclass s
    ge rx255_pos, rx255_eos, rx255_fail
    sub $I10, rx255_pos, rx255_off
    is_cclass $I11, 32, rx255_tgt, $I10
    unless $I11, rx255_fail
    inc rx255_pos
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 151
  # rx subrule "xblock" subtype=capture negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."xblock"()
    unless $P10, rx255_fail
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx255_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 152
  # rx rxquantr262 ** 0..*
    set_addr $I266, rxquantr262_done
    rx255_cur."!mark_push"(0, rx255_pos, $I266)
  rxquantr262_loop:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx255_pos, 5
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 5
    ne $S10, "elsif", rx255_fail
    add rx255_pos, 5
  # rx charclass s
    ge rx255_pos, rx255_eos, rx255_fail
    sub $I10, rx255_pos, rx255_off
    is_cclass $I11, 32, rx255_tgt, $I10
    unless $I11, rx255_fail
    inc rx255_pos
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."xblock"()
    unless $P10, rx255_fail
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx255_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
    (rx255_rep) = rx255_cur."!mark_commit"($I266)
    rx255_cur."!mark_push"(rx255_rep, rx255_pos, $I266)
    goto rxquantr262_loop
  rxquantr262_done:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 153
  # rx rxquantr268 ** 0..1
    set_addr $I272, rxquantr268_done
    rx255_cur."!mark_push"(0, rx255_pos, $I272)
  rxquantr268_loop:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx255_pos, 4
    gt $I11, rx255_eos, rx255_fail
    sub $I11, rx255_pos, rx255_off
    substr $S10, rx255_tgt, $I11, 4
    ne $S10, "else", rx255_fail
    add rx255_pos, 4
  # rx charclass s
    ge rx255_pos, rx255_eos, rx255_fail
    sub $I10, rx255_pos, rx255_off
    is_cclass $I11, 32, rx255_tgt, $I10
    unless $I11, rx255_fail
    inc rx255_pos
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."pblock"()
    unless $P10, rx255_fail
    rx255_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx255_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
    (rx255_rep) = rx255_cur."!mark_commit"($I272)
  rxquantr268_done:
  # rx subrule "ws" subtype=method negate=
    rx255_cur."!cursor_pos"(rx255_pos)
    $P10 = rx255_cur."ws"()
    unless $P10, rx255_fail
    rx255_pos = $P10."pos"()
.annotate "line", 149
  # rx pass
    rx255_cur."!cursor_pass"(rx255_pos, "statement_control:sym<if>")
    rx255_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx255_pos)
    .return (rx255_cur)
  rx255_fail:
.annotate "line", 4
    (rx255_rep, rx255_pos, $I10, $P10) = rx255_cur."!mark_fail"(0)
    lt rx255_pos, -1, rx255_done
    eq rx255_pos, -1, rx255_fail
    jump $I10
  rx255_done:
    rx255_cur."!cursor_fail"()
    rx255_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx255_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1259078882.26523") :method
.annotate "line", 4
    new $P257, "ResizablePMCArray"
    push $P257, "if"
    .return ($P257)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .const 'Sub' $P285 = "64_1259078882.26523" 
    capture_lex $P285
    .local string rx275_tgt
    .local int rx275_pos
    .local int rx275_off
    .local int rx275_eos
    .local int rx275_rep
    .local pmc rx275_cur
    (rx275_cur, rx275_pos, rx275_tgt) = self."!cursor_start"()
    rx275_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx275_cur
    .local pmc match
    .lex "$/", match
    length rx275_eos, rx275_tgt
    set rx275_off, 0
    lt rx275_pos, 2, rx275_start
    sub rx275_off, rx275_pos, 1
    substr rx275_tgt, rx275_tgt, rx275_off
  rx275_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan278_done
    goto rxscan278_scan
  rxscan278_loop:
    ($P10) = rx275_cur."from"()
    inc $P10
    set rx275_pos, $P10
    ge rx275_pos, rx275_eos, rxscan278_done
  rxscan278_scan:
    set_addr $I10, rxscan278_loop
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  rxscan278_done:
.annotate "line", 157
  # rx subcapture "sym"
    set_addr $I10, rxcap_279_fail
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  # rx literal  "unless"
    add $I11, rx275_pos, 6
    gt $I11, rx275_eos, rx275_fail
    sub $I11, rx275_pos, rx275_off
    substr $S10, rx275_tgt, $I11, 6
    ne $S10, "unless", rx275_fail
    add rx275_pos, 6
    set_addr $I10, rxcap_279_fail
    ($I12, $I11) = rx275_cur."!mark_peek"($I10)
    rx275_cur."!cursor_pos"($I11)
    ($P10) = rx275_cur."!cursor_start"()
    $P10."!cursor_pass"(rx275_pos, "")
    rx275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_279_done
  rxcap_279_fail:
    goto rx275_fail
  rxcap_279_done:
  # rx charclass s
    ge rx275_pos, rx275_eos, rx275_fail
    sub $I10, rx275_pos, rx275_off
    is_cclass $I11, 32, rx275_tgt, $I10
    unless $I11, rx275_fail
    inc rx275_pos
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
.annotate "line", 158
  # rx subrule "xblock" subtype=capture negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."xblock"()
    unless $P10, rx275_fail
    rx275_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx275_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  alt282_0:
.annotate "line", 159
    set_addr $I10, alt282_1
    rx275_cur."!mark_push"(0, rx275_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx275_cur."!cursor_pos"(rx275_pos)
    .const 'Sub' $P285 = "64_1259078882.26523" 
    capture_lex $P285
    $P10 = rx275_cur."before"($P285)
    if $P10, rx275_fail
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
    goto alt282_end
  alt282_1:
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
  alt282_end:
  # rx subrule "ws" subtype=method negate=
    rx275_cur."!cursor_pos"(rx275_pos)
    $P10 = rx275_cur."ws"()
    unless $P10, rx275_fail
    rx275_pos = $P10."pos"()
.annotate "line", 156
  # rx pass
    rx275_cur."!cursor_pass"(rx275_pos, "statement_control:sym<unless>")
    rx275_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx275_pos)
    .return (rx275_cur)
  rx275_fail:
.annotate "line", 4
    (rx275_rep, rx275_pos, $I10, $P10) = rx275_cur."!mark_fail"(0)
    lt rx275_pos, -1, rx275_done
    eq rx275_pos, -1, rx275_fail
    jump $I10
  rx275_done:
    rx275_cur."!cursor_fail"()
    rx275_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx275_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1259078882.26523") :method
.annotate "line", 4
    new $P277, "ResizablePMCArray"
    push $P277, "unless"
    .return ($P277)
.end


.namespace ["NQP";"Grammar"]
.sub "_block284"  :anon :subid("64_1259078882.26523") :method :outer("62_1259078882.26523")
.annotate "line", 159
    .lex unicode:"$\x{a2}", $P286
    .local string rx287_tgt
    .local int rx287_pos
    .local int rx287_off
    .local int rx287_eos
    .local int rx287_rep
    .local pmc rx287_cur
    (rx287_cur, rx287_pos, rx287_tgt) = self."!cursor_start"()
    rx287_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx287_cur
    .local pmc match
    .lex "$/", match
    length rx287_eos, rx287_tgt
    set rx287_off, 0
    lt rx287_pos, 2, rx287_start
    sub rx287_off, rx287_pos, 1
    substr rx287_tgt, rx287_tgt, rx287_off
  rx287_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan288_done
    goto rxscan288_scan
  rxscan288_loop:
    ($P10) = rx287_cur."from"()
    inc $P10
    set rx287_pos, $P10
    ge rx287_pos, rx287_eos, rxscan288_done
  rxscan288_scan:
    set_addr $I10, rxscan288_loop
    rx287_cur."!mark_push"(0, rx287_pos, $I10)
  rxscan288_done:
  # rx literal  "else"
    add $I11, rx287_pos, 4
    gt $I11, rx287_eos, rx287_fail
    sub $I11, rx287_pos, rx287_off
    substr $S10, rx287_tgt, $I11, 4
    ne $S10, "else", rx287_fail
    add rx287_pos, 4
  # rx pass
    rx287_cur."!cursor_pass"(rx287_pos, "")
    rx287_cur."!cursor_debug"("PASS  ", "", " at pos=", rx287_pos)
    .return (rx287_cur)
  rx287_fail:
    (rx287_rep, rx287_pos, $I10, $P10) = rx287_cur."!mark_fail"(0)
    lt rx287_pos, -1, rx287_done
    eq rx287_pos, -1, rx287_fail
    jump $I10
  rx287_done:
    rx287_cur."!cursor_fail"()
    rx287_cur."!cursor_debug"("FAIL  ", "")
    .return (rx287_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("65_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx294_tgt
    .local int rx294_pos
    .local int rx294_off
    .local int rx294_eos
    .local int rx294_rep
    .local pmc rx294_cur
    (rx294_cur, rx294_pos, rx294_tgt) = self."!cursor_start"()
    rx294_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx294_cur
    .local pmc match
    .lex "$/", match
    length rx294_eos, rx294_tgt
    set rx294_off, 0
    lt rx294_pos, 2, rx294_start
    sub rx294_off, rx294_pos, 1
    substr rx294_tgt, rx294_tgt, rx294_off
  rx294_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan297_done
    goto rxscan297_scan
  rxscan297_loop:
    ($P10) = rx294_cur."from"()
    inc $P10
    set rx294_pos, $P10
    ge rx294_pos, rx294_eos, rxscan297_done
  rxscan297_scan:
    set_addr $I10, rxscan297_loop
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  rxscan297_done:
.annotate "line", 163
  # rx subcapture "sym"
    set_addr $I10, rxcap_299_fail
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  alt298_0:
    set_addr $I10, alt298_1
    rx294_cur."!mark_push"(0, rx294_pos, $I10)
  # rx literal  "while"
    add $I11, rx294_pos, 5
    gt $I11, rx294_eos, rx294_fail
    sub $I11, rx294_pos, rx294_off
    substr $S10, rx294_tgt, $I11, 5
    ne $S10, "while", rx294_fail
    add rx294_pos, 5
    goto alt298_end
  alt298_1:
  # rx literal  "until"
    add $I11, rx294_pos, 5
    gt $I11, rx294_eos, rx294_fail
    sub $I11, rx294_pos, rx294_off
    substr $S10, rx294_tgt, $I11, 5
    ne $S10, "until", rx294_fail
    add rx294_pos, 5
  alt298_end:
    set_addr $I10, rxcap_299_fail
    ($I12, $I11) = rx294_cur."!mark_peek"($I10)
    rx294_cur."!cursor_pos"($I11)
    ($P10) = rx294_cur."!cursor_start"()
    $P10."!cursor_pass"(rx294_pos, "")
    rx294_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_299_done
  rxcap_299_fail:
    goto rx294_fail
  rxcap_299_done:
  # rx charclass s
    ge rx294_pos, rx294_eos, rx294_fail
    sub $I10, rx294_pos, rx294_off
    is_cclass $I11, 32, rx294_tgt, $I10
    unless $I11, rx294_fail
    inc rx294_pos
  # rx subrule "ws" subtype=method negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."ws"()
    unless $P10, rx294_fail
    rx294_pos = $P10."pos"()
.annotate "line", 164
  # rx subrule "xblock" subtype=capture negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."xblock"()
    unless $P10, rx294_fail
    rx294_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx294_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx294_cur."!cursor_pos"(rx294_pos)
    $P10 = rx294_cur."ws"()
    unless $P10, rx294_fail
    rx294_pos = $P10."pos"()
.annotate "line", 162
  # rx pass
    rx294_cur."!cursor_pass"(rx294_pos, "statement_control:sym<while>")
    rx294_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx294_pos)
    .return (rx294_cur)
  rx294_fail:
.annotate "line", 4
    (rx294_rep, rx294_pos, $I10, $P10) = rx294_cur."!mark_fail"(0)
    lt rx294_pos, -1, rx294_done
    eq rx294_pos, -1, rx294_fail
    jump $I10
  rx294_done:
    rx294_cur."!cursor_fail"()
    rx294_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx294_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1259078882.26523") :method
.annotate "line", 4
    new $P296, "ResizablePMCArray"
    push $P296, "until"
    push $P296, "while"
    .return ($P296)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx303_tgt
    .local int rx303_pos
    .local int rx303_off
    .local int rx303_eos
    .local int rx303_rep
    .local pmc rx303_cur
    (rx303_cur, rx303_pos, rx303_tgt) = self."!cursor_start"()
    rx303_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx303_cur
    .local pmc match
    .lex "$/", match
    length rx303_eos, rx303_tgt
    set rx303_off, 0
    lt rx303_pos, 2, rx303_start
    sub rx303_off, rx303_pos, 1
    substr rx303_tgt, rx303_tgt, rx303_off
  rx303_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan306_done
    goto rxscan306_scan
  rxscan306_loop:
    ($P10) = rx303_cur."from"()
    inc $P10
    set rx303_pos, $P10
    ge rx303_pos, rx303_eos, rxscan306_done
  rxscan306_scan:
    set_addr $I10, rxscan306_loop
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  rxscan306_done:
.annotate "line", 168
  # rx subcapture "sym"
    set_addr $I10, rxcap_307_fail
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx303_pos, 6
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 6
    ne $S10, "repeat", rx303_fail
    add rx303_pos, 6
    set_addr $I10, rxcap_307_fail
    ($I12, $I11) = rx303_cur."!mark_peek"($I10)
    rx303_cur."!cursor_pos"($I11)
    ($P10) = rx303_cur."!cursor_start"()
    $P10."!cursor_pass"(rx303_pos, "")
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_307_done
  rxcap_307_fail:
    goto rx303_fail
  rxcap_307_done:
  # rx charclass s
    ge rx303_pos, rx303_eos, rx303_fail
    sub $I10, rx303_pos, rx303_off
    is_cclass $I11, 32, rx303_tgt, $I10
    unless $I11, rx303_fail
    inc rx303_pos
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  alt309_0:
.annotate "line", 169
    set_addr $I10, alt309_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
.annotate "line", 170
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_312_fail
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  alt311_0:
    set_addr $I10, alt311_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  # rx literal  "while"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "while", rx303_fail
    add rx303_pos, 5
    goto alt311_end
  alt311_1:
  # rx literal  "until"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "until", rx303_fail
    add rx303_pos, 5
  alt311_end:
    set_addr $I10, rxcap_312_fail
    ($I12, $I11) = rx303_cur."!mark_peek"($I10)
    rx303_cur."!cursor_pos"($I11)
    ($P10) = rx303_cur."!cursor_start"()
    $P10."!cursor_pass"(rx303_pos, "")
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_312_done
  rxcap_312_fail:
    goto rx303_fail
  rxcap_312_done:
  # rx charclass s
    ge rx303_pos, rx303_eos, rx303_fail
    sub $I10, rx303_pos, rx303_off
    is_cclass $I11, 32, rx303_tgt, $I10
    unless $I11, rx303_fail
    inc rx303_pos
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."xblock"()
    unless $P10, rx303_fail
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx303_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
    goto alt309_end
  alt309_1:
.annotate "line", 171
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."pblock"()
    unless $P10, rx303_fail
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx303_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_318_fail
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  alt317_0:
    set_addr $I10, alt317_1
    rx303_cur."!mark_push"(0, rx303_pos, $I10)
  # rx literal  "while"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "while", rx303_fail
    add rx303_pos, 5
    goto alt317_end
  alt317_1:
  # rx literal  "until"
    add $I11, rx303_pos, 5
    gt $I11, rx303_eos, rx303_fail
    sub $I11, rx303_pos, rx303_off
    substr $S10, rx303_tgt, $I11, 5
    ne $S10, "until", rx303_fail
    add rx303_pos, 5
  alt317_end:
    set_addr $I10, rxcap_318_fail
    ($I12, $I11) = rx303_cur."!mark_peek"($I10)
    rx303_cur."!cursor_pos"($I11)
    ($P10) = rx303_cur."!cursor_start"()
    $P10."!cursor_pass"(rx303_pos, "")
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_318_done
  rxcap_318_fail:
    goto rx303_fail
  rxcap_318_done:
  # rx charclass s
    ge rx303_pos, rx303_eos, rx303_fail
    sub $I10, rx303_pos, rx303_off
    is_cclass $I11, 32, rx303_tgt, $I10
    unless $I11, rx303_fail
    inc rx303_pos
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."EXPR"()
    unless $P10, rx303_fail
    rx303_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx303_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
  alt309_end:
.annotate "line", 172
  # rx subrule "ws" subtype=method negate=
    rx303_cur."!cursor_pos"(rx303_pos)
    $P10 = rx303_cur."ws"()
    unless $P10, rx303_fail
    rx303_pos = $P10."pos"()
.annotate "line", 167
  # rx pass
    rx303_cur."!cursor_pass"(rx303_pos, "statement_control:sym<repeat>")
    rx303_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx303_pos)
    .return (rx303_cur)
  rx303_fail:
.annotate "line", 4
    (rx303_rep, rx303_pos, $I10, $P10) = rx303_cur."!mark_fail"(0)
    lt rx303_pos, -1, rx303_done
    eq rx303_pos, -1, rx303_fail
    jump $I10
  rx303_done:
    rx303_cur."!cursor_fail"()
    rx303_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx303_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1259078882.26523") :method
.annotate "line", 4
    new $P305, "ResizablePMCArray"
    push $P305, "repeat"
    .return ($P305)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx323_tgt
    .local int rx323_pos
    .local int rx323_off
    .local int rx323_eos
    .local int rx323_rep
    .local pmc rx323_cur
    (rx323_cur, rx323_pos, rx323_tgt) = self."!cursor_start"()
    rx323_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx323_cur
    .local pmc match
    .lex "$/", match
    length rx323_eos, rx323_tgt
    set rx323_off, 0
    lt rx323_pos, 2, rx323_start
    sub rx323_off, rx323_pos, 1
    substr rx323_tgt, rx323_tgt, rx323_off
  rx323_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan326_done
    goto rxscan326_scan
  rxscan326_loop:
    ($P10) = rx323_cur."from"()
    inc $P10
    set rx323_pos, $P10
    ge rx323_pos, rx323_eos, rxscan326_done
  rxscan326_scan:
    set_addr $I10, rxscan326_loop
    rx323_cur."!mark_push"(0, rx323_pos, $I10)
  rxscan326_done:
.annotate "line", 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_327_fail
    rx323_cur."!mark_push"(0, rx323_pos, $I10)
  # rx literal  "for"
    add $I11, rx323_pos, 3
    gt $I11, rx323_eos, rx323_fail
    sub $I11, rx323_pos, rx323_off
    substr $S10, rx323_tgt, $I11, 3
    ne $S10, "for", rx323_fail
    add rx323_pos, 3
    set_addr $I10, rxcap_327_fail
    ($I12, $I11) = rx323_cur."!mark_peek"($I10)
    rx323_cur."!cursor_pos"($I11)
    ($P10) = rx323_cur."!cursor_start"()
    $P10."!cursor_pass"(rx323_pos, "")
    rx323_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_327_done
  rxcap_327_fail:
    goto rx323_fail
  rxcap_327_done:
  # rx charclass s
    ge rx323_pos, rx323_eos, rx323_fail
    sub $I10, rx323_pos, rx323_off
    is_cclass $I11, 32, rx323_tgt, $I10
    unless $I11, rx323_fail
    inc rx323_pos
  # rx subrule "ws" subtype=method negate=
    rx323_cur."!cursor_pos"(rx323_pos)
    $P10 = rx323_cur."ws"()
    unless $P10, rx323_fail
    rx323_pos = $P10."pos"()
.annotate "line", 177
  # rx subrule "xblock" subtype=capture negate=
    rx323_cur."!cursor_pos"(rx323_pos)
    $P10 = rx323_cur."xblock"()
    unless $P10, rx323_fail
    rx323_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx323_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx323_cur."!cursor_pos"(rx323_pos)
    $P10 = rx323_cur."ws"()
    unless $P10, rx323_fail
    rx323_pos = $P10."pos"()
.annotate "line", 175
  # rx pass
    rx323_cur."!cursor_pass"(rx323_pos, "statement_control:sym<for>")
    rx323_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx323_pos)
    .return (rx323_cur)
  rx323_fail:
.annotate "line", 4
    (rx323_rep, rx323_pos, $I10, $P10) = rx323_cur."!mark_fail"(0)
    lt rx323_pos, -1, rx323_done
    eq rx323_pos, -1, rx323_fail
    jump $I10
  rx323_done:
    rx323_cur."!cursor_fail"()
    rx323_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx323_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1259078882.26523") :method
.annotate "line", 4
    new $P325, "ResizablePMCArray"
    push $P325, "for"
    .return ($P325)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("71_1259078882.26523") :method
.annotate "line", 180
    $P331 = self."!protoregex"("statement_prefix")
    .return ($P331)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("72_1259078882.26523") :method
.annotate "line", 180
    $P333 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P333)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("73_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx335_tgt
    .local int rx335_pos
    .local int rx335_off
    .local int rx335_eos
    .local int rx335_rep
    .local pmc rx335_cur
    (rx335_cur, rx335_pos, rx335_tgt) = self."!cursor_start"()
    rx335_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx335_cur
    .local pmc match
    .lex "$/", match
    length rx335_eos, rx335_tgt
    set rx335_off, 0
    lt rx335_pos, 2, rx335_start
    sub rx335_off, rx335_pos, 1
    substr rx335_tgt, rx335_tgt, rx335_off
  rx335_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan339_done
    goto rxscan339_scan
  rxscan339_loop:
    ($P10) = rx335_cur."from"()
    inc $P10
    set rx335_pos, $P10
    ge rx335_pos, rx335_eos, rxscan339_done
  rxscan339_scan:
    set_addr $I10, rxscan339_loop
    rx335_cur."!mark_push"(0, rx335_pos, $I10)
  rxscan339_done:
.annotate "line", 181
  # rx subcapture "sym"
    set_addr $I10, rxcap_340_fail
    rx335_cur."!mark_push"(0, rx335_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx335_pos, 4
    gt $I11, rx335_eos, rx335_fail
    sub $I11, rx335_pos, rx335_off
    substr $S10, rx335_tgt, $I11, 4
    ne $S10, "INIT", rx335_fail
    add rx335_pos, 4
    set_addr $I10, rxcap_340_fail
    ($I12, $I11) = rx335_cur."!mark_peek"($I10)
    rx335_cur."!cursor_pos"($I11)
    ($P10) = rx335_cur."!cursor_start"()
    $P10."!cursor_pass"(rx335_pos, "")
    rx335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_340_done
  rxcap_340_fail:
    goto rx335_fail
  rxcap_340_done:
  # rx subrule "blorst" subtype=capture negate=
    rx335_cur."!cursor_pos"(rx335_pos)
    $P10 = rx335_cur."blorst"()
    unless $P10, rx335_fail
    rx335_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx335_pos = $P10."pos"()
  # rx pass
    rx335_cur."!cursor_pass"(rx335_pos, "statement_prefix:sym<INIT>")
    rx335_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx335_pos)
    .return (rx335_cur)
  rx335_fail:
.annotate "line", 4
    (rx335_rep, rx335_pos, $I10, $P10) = rx335_cur."!mark_fail"(0)
    lt rx335_pos, -1, rx335_done
    eq rx335_pos, -1, rx335_fail
    jump $I10
  rx335_done:
    rx335_cur."!cursor_fail"()
    rx335_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx335_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("74_1259078882.26523") :method
.annotate "line", 4
    $P337 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P338, "ResizablePMCArray"
    push $P338, $P337
    .return ($P338)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("75_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx342_tgt
    .local int rx342_pos
    .local int rx342_off
    .local int rx342_eos
    .local int rx342_rep
    .local pmc rx342_cur
    (rx342_cur, rx342_pos, rx342_tgt) = self."!cursor_start"()
    rx342_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx342_cur
    .local pmc match
    .lex "$/", match
    length rx342_eos, rx342_tgt
    set rx342_off, 0
    lt rx342_pos, 2, rx342_start
    sub rx342_off, rx342_pos, 1
    substr rx342_tgt, rx342_tgt, rx342_off
  rx342_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan345_done
    goto rxscan345_scan
  rxscan345_loop:
    ($P10) = rx342_cur."from"()
    inc $P10
    set rx342_pos, $P10
    ge rx342_pos, rx342_eos, rxscan345_done
  rxscan345_scan:
    set_addr $I10, rxscan345_loop
    rx342_cur."!mark_push"(0, rx342_pos, $I10)
  rxscan345_done:
.annotate "line", 184
  # rx charclass s
    ge rx342_pos, rx342_eos, rx342_fail
    sub $I10, rx342_pos, rx342_off
    is_cclass $I11, 32, rx342_tgt, $I10
    unless $I11, rx342_fail
    inc rx342_pos
  # rx subrule "ws" subtype=method negate=
    rx342_cur."!cursor_pos"(rx342_pos)
    $P10 = rx342_cur."ws"()
    unless $P10, rx342_fail
    rx342_pos = $P10."pos"()
  alt346_0:
    set_addr $I10, alt346_1
    rx342_cur."!mark_push"(0, rx342_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx342_pos, rx342_eos, rx342_fail
    sub $I10, rx342_pos, rx342_off
    substr $S10, rx342_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx342_fail
  # rx subrule "block" subtype=capture negate=
    rx342_cur."!cursor_pos"(rx342_pos)
    $P10 = rx342_cur."block"()
    unless $P10, rx342_fail
    rx342_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx342_pos = $P10."pos"()
    goto alt346_end
  alt346_1:
  # rx subrule "statement" subtype=capture negate=
    rx342_cur."!cursor_pos"(rx342_pos)
    $P10 = rx342_cur."statement"()
    unless $P10, rx342_fail
    rx342_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx342_pos = $P10."pos"()
  alt346_end:
.annotate "line", 183
  # rx pass
    rx342_cur."!cursor_pass"(rx342_pos, "blorst")
    rx342_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx342_pos)
    .return (rx342_cur)
  rx342_fail:
.annotate "line", 4
    (rx342_rep, rx342_pos, $I10, $P10) = rx342_cur."!mark_fail"(0)
    lt rx342_pos, -1, rx342_done
    eq rx342_pos, -1, rx342_fail
    jump $I10
  rx342_done:
    rx342_cur."!cursor_fail"()
    rx342_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx342_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("76_1259078882.26523") :method
.annotate "line", 4
    new $P344, "ResizablePMCArray"
    push $P344, ""
    .return ($P344)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("77_1259078882.26523") :method
.annotate "line", 189
    $P348 = self."!protoregex"("statement_mod_cond")
    .return ($P348)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("78_1259078882.26523") :method
.annotate "line", 189
    $P350 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P350)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("79_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx352_tgt
    .local int rx352_pos
    .local int rx352_off
    .local int rx352_eos
    .local int rx352_rep
    .local pmc rx352_cur
    (rx352_cur, rx352_pos, rx352_tgt) = self."!cursor_start"()
    rx352_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx352_cur
    .local pmc match
    .lex "$/", match
    length rx352_eos, rx352_tgt
    set rx352_off, 0
    lt rx352_pos, 2, rx352_start
    sub rx352_off, rx352_pos, 1
    substr rx352_tgt, rx352_tgt, rx352_off
  rx352_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan355_done
    goto rxscan355_scan
  rxscan355_loop:
    ($P10) = rx352_cur."from"()
    inc $P10
    set rx352_pos, $P10
    ge rx352_pos, rx352_eos, rxscan355_done
  rxscan355_scan:
    set_addr $I10, rxscan355_loop
    rx352_cur."!mark_push"(0, rx352_pos, $I10)
  rxscan355_done:
.annotate "line", 191
  # rx subcapture "sym"
    set_addr $I10, rxcap_356_fail
    rx352_cur."!mark_push"(0, rx352_pos, $I10)
  # rx literal  "if"
    add $I11, rx352_pos, 2
    gt $I11, rx352_eos, rx352_fail
    sub $I11, rx352_pos, rx352_off
    substr $S10, rx352_tgt, $I11, 2
    ne $S10, "if", rx352_fail
    add rx352_pos, 2
    set_addr $I10, rxcap_356_fail
    ($I12, $I11) = rx352_cur."!mark_peek"($I10)
    rx352_cur."!cursor_pos"($I11)
    ($P10) = rx352_cur."!cursor_start"()
    $P10."!cursor_pass"(rx352_pos, "")
    rx352_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_356_done
  rxcap_356_fail:
    goto rx352_fail
  rxcap_356_done:
  # rx subrule "ws" subtype=method negate=
    rx352_cur."!cursor_pos"(rx352_pos)
    $P10 = rx352_cur."ws"()
    unless $P10, rx352_fail
    rx352_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx352_cur."!cursor_pos"(rx352_pos)
    $P10 = rx352_cur."EXPR"()
    unless $P10, rx352_fail
    rx352_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx352_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx352_cur."!cursor_pos"(rx352_pos)
    $P10 = rx352_cur."ws"()
    unless $P10, rx352_fail
    rx352_pos = $P10."pos"()
  # rx pass
    rx352_cur."!cursor_pass"(rx352_pos, "statement_mod_cond:sym<if>")
    rx352_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx352_pos)
    .return (rx352_cur)
  rx352_fail:
.annotate "line", 4
    (rx352_rep, rx352_pos, $I10, $P10) = rx352_cur."!mark_fail"(0)
    lt rx352_pos, -1, rx352_done
    eq rx352_pos, -1, rx352_fail
    jump $I10
  rx352_done:
    rx352_cur."!cursor_fail"()
    rx352_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx352_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("80_1259078882.26523") :method
.annotate "line", 4
    new $P354, "ResizablePMCArray"
    push $P354, "if"
    .return ($P354)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("81_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx360_tgt
    .local int rx360_pos
    .local int rx360_off
    .local int rx360_eos
    .local int rx360_rep
    .local pmc rx360_cur
    (rx360_cur, rx360_pos, rx360_tgt) = self."!cursor_start"()
    rx360_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx360_cur
    .local pmc match
    .lex "$/", match
    length rx360_eos, rx360_tgt
    set rx360_off, 0
    lt rx360_pos, 2, rx360_start
    sub rx360_off, rx360_pos, 1
    substr rx360_tgt, rx360_tgt, rx360_off
  rx360_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan363_done
    goto rxscan363_scan
  rxscan363_loop:
    ($P10) = rx360_cur."from"()
    inc $P10
    set rx360_pos, $P10
    ge rx360_pos, rx360_eos, rxscan363_done
  rxscan363_scan:
    set_addr $I10, rxscan363_loop
    rx360_cur."!mark_push"(0, rx360_pos, $I10)
  rxscan363_done:
.annotate "line", 192
  # rx subcapture "sym"
    set_addr $I10, rxcap_364_fail
    rx360_cur."!mark_push"(0, rx360_pos, $I10)
  # rx literal  "unless"
    add $I11, rx360_pos, 6
    gt $I11, rx360_eos, rx360_fail
    sub $I11, rx360_pos, rx360_off
    substr $S10, rx360_tgt, $I11, 6
    ne $S10, "unless", rx360_fail
    add rx360_pos, 6
    set_addr $I10, rxcap_364_fail
    ($I12, $I11) = rx360_cur."!mark_peek"($I10)
    rx360_cur."!cursor_pos"($I11)
    ($P10) = rx360_cur."!cursor_start"()
    $P10."!cursor_pass"(rx360_pos, "")
    rx360_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_364_done
  rxcap_364_fail:
    goto rx360_fail
  rxcap_364_done:
  # rx subrule "ws" subtype=method negate=
    rx360_cur."!cursor_pos"(rx360_pos)
    $P10 = rx360_cur."ws"()
    unless $P10, rx360_fail
    rx360_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx360_cur."!cursor_pos"(rx360_pos)
    $P10 = rx360_cur."EXPR"()
    unless $P10, rx360_fail
    rx360_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx360_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx360_cur."!cursor_pos"(rx360_pos)
    $P10 = rx360_cur."ws"()
    unless $P10, rx360_fail
    rx360_pos = $P10."pos"()
  # rx pass
    rx360_cur."!cursor_pass"(rx360_pos, "statement_mod_cond:sym<unless>")
    rx360_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx360_pos)
    .return (rx360_cur)
  rx360_fail:
.annotate "line", 4
    (rx360_rep, rx360_pos, $I10, $P10) = rx360_cur."!mark_fail"(0)
    lt rx360_pos, -1, rx360_done
    eq rx360_pos, -1, rx360_fail
    jump $I10
  rx360_done:
    rx360_cur."!cursor_fail"()
    rx360_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx360_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("82_1259078882.26523") :method
.annotate "line", 4
    new $P362, "ResizablePMCArray"
    push $P362, "unless"
    .return ($P362)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("83_1259078882.26523") :method
.annotate "line", 194
    $P368 = self."!protoregex"("statement_mod_loop")
    .return ($P368)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("84_1259078882.26523") :method
.annotate "line", 194
    $P370 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P370)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("85_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx372_tgt
    .local int rx372_pos
    .local int rx372_off
    .local int rx372_eos
    .local int rx372_rep
    .local pmc rx372_cur
    (rx372_cur, rx372_pos, rx372_tgt) = self."!cursor_start"()
    rx372_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx372_cur
    .local pmc match
    .lex "$/", match
    length rx372_eos, rx372_tgt
    set rx372_off, 0
    lt rx372_pos, 2, rx372_start
    sub rx372_off, rx372_pos, 1
    substr rx372_tgt, rx372_tgt, rx372_off
  rx372_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan375_done
    goto rxscan375_scan
  rxscan375_loop:
    ($P10) = rx372_cur."from"()
    inc $P10
    set rx372_pos, $P10
    ge rx372_pos, rx372_eos, rxscan375_done
  rxscan375_scan:
    set_addr $I10, rxscan375_loop
    rx372_cur."!mark_push"(0, rx372_pos, $I10)
  rxscan375_done:
.annotate "line", 196
  # rx subcapture "sym"
    set_addr $I10, rxcap_376_fail
    rx372_cur."!mark_push"(0, rx372_pos, $I10)
  # rx literal  "while"
    add $I11, rx372_pos, 5
    gt $I11, rx372_eos, rx372_fail
    sub $I11, rx372_pos, rx372_off
    substr $S10, rx372_tgt, $I11, 5
    ne $S10, "while", rx372_fail
    add rx372_pos, 5
    set_addr $I10, rxcap_376_fail
    ($I12, $I11) = rx372_cur."!mark_peek"($I10)
    rx372_cur."!cursor_pos"($I11)
    ($P10) = rx372_cur."!cursor_start"()
    $P10."!cursor_pass"(rx372_pos, "")
    rx372_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_376_done
  rxcap_376_fail:
    goto rx372_fail
  rxcap_376_done:
  # rx subrule "ws" subtype=method negate=
    rx372_cur."!cursor_pos"(rx372_pos)
    $P10 = rx372_cur."ws"()
    unless $P10, rx372_fail
    rx372_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx372_cur."!cursor_pos"(rx372_pos)
    $P10 = rx372_cur."EXPR"()
    unless $P10, rx372_fail
    rx372_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx372_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx372_cur."!cursor_pos"(rx372_pos)
    $P10 = rx372_cur."ws"()
    unless $P10, rx372_fail
    rx372_pos = $P10."pos"()
  # rx pass
    rx372_cur."!cursor_pass"(rx372_pos, "statement_mod_loop:sym<while>")
    rx372_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx372_pos)
    .return (rx372_cur)
  rx372_fail:
.annotate "line", 4
    (rx372_rep, rx372_pos, $I10, $P10) = rx372_cur."!mark_fail"(0)
    lt rx372_pos, -1, rx372_done
    eq rx372_pos, -1, rx372_fail
    jump $I10
  rx372_done:
    rx372_cur."!cursor_fail"()
    rx372_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx372_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("86_1259078882.26523") :method
.annotate "line", 4
    new $P374, "ResizablePMCArray"
    push $P374, "while"
    .return ($P374)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("87_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx380_tgt
    .local int rx380_pos
    .local int rx380_off
    .local int rx380_eos
    .local int rx380_rep
    .local pmc rx380_cur
    (rx380_cur, rx380_pos, rx380_tgt) = self."!cursor_start"()
    rx380_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx380_cur
    .local pmc match
    .lex "$/", match
    length rx380_eos, rx380_tgt
    set rx380_off, 0
    lt rx380_pos, 2, rx380_start
    sub rx380_off, rx380_pos, 1
    substr rx380_tgt, rx380_tgt, rx380_off
  rx380_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan383_done
    goto rxscan383_scan
  rxscan383_loop:
    ($P10) = rx380_cur."from"()
    inc $P10
    set rx380_pos, $P10
    ge rx380_pos, rx380_eos, rxscan383_done
  rxscan383_scan:
    set_addr $I10, rxscan383_loop
    rx380_cur."!mark_push"(0, rx380_pos, $I10)
  rxscan383_done:
.annotate "line", 197
  # rx subcapture "sym"
    set_addr $I10, rxcap_384_fail
    rx380_cur."!mark_push"(0, rx380_pos, $I10)
  # rx literal  "until"
    add $I11, rx380_pos, 5
    gt $I11, rx380_eos, rx380_fail
    sub $I11, rx380_pos, rx380_off
    substr $S10, rx380_tgt, $I11, 5
    ne $S10, "until", rx380_fail
    add rx380_pos, 5
    set_addr $I10, rxcap_384_fail
    ($I12, $I11) = rx380_cur."!mark_peek"($I10)
    rx380_cur."!cursor_pos"($I11)
    ($P10) = rx380_cur."!cursor_start"()
    $P10."!cursor_pass"(rx380_pos, "")
    rx380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_384_done
  rxcap_384_fail:
    goto rx380_fail
  rxcap_384_done:
  # rx subrule "ws" subtype=method negate=
    rx380_cur."!cursor_pos"(rx380_pos)
    $P10 = rx380_cur."ws"()
    unless $P10, rx380_fail
    rx380_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx380_cur."!cursor_pos"(rx380_pos)
    $P10 = rx380_cur."EXPR"()
    unless $P10, rx380_fail
    rx380_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx380_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx380_cur."!cursor_pos"(rx380_pos)
    $P10 = rx380_cur."ws"()
    unless $P10, rx380_fail
    rx380_pos = $P10."pos"()
  # rx pass
    rx380_cur."!cursor_pass"(rx380_pos, "statement_mod_loop:sym<until>")
    rx380_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx380_pos)
    .return (rx380_cur)
  rx380_fail:
.annotate "line", 4
    (rx380_rep, rx380_pos, $I10, $P10) = rx380_cur."!mark_fail"(0)
    lt rx380_pos, -1, rx380_done
    eq rx380_pos, -1, rx380_fail
    jump $I10
  rx380_done:
    rx380_cur."!cursor_fail"()
    rx380_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx380_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("88_1259078882.26523") :method
.annotate "line", 4
    new $P382, "ResizablePMCArray"
    push $P382, "until"
    .return ($P382)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("89_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx388_tgt
    .local int rx388_pos
    .local int rx388_off
    .local int rx388_eos
    .local int rx388_rep
    .local pmc rx388_cur
    (rx388_cur, rx388_pos, rx388_tgt) = self."!cursor_start"()
    rx388_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx388_cur
    .local pmc match
    .lex "$/", match
    length rx388_eos, rx388_tgt
    set rx388_off, 0
    lt rx388_pos, 2, rx388_start
    sub rx388_off, rx388_pos, 1
    substr rx388_tgt, rx388_tgt, rx388_off
  rx388_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan392_done
    goto rxscan392_scan
  rxscan392_loop:
    ($P10) = rx388_cur."from"()
    inc $P10
    set rx388_pos, $P10
    ge rx388_pos, rx388_eos, rxscan392_done
  rxscan392_scan:
    set_addr $I10, rxscan392_loop
    rx388_cur."!mark_push"(0, rx388_pos, $I10)
  rxscan392_done:
.annotate "line", 201
  # rx subrule "colonpair" subtype=capture negate=
    rx388_cur."!cursor_pos"(rx388_pos)
    $P10 = rx388_cur."colonpair"()
    unless $P10, rx388_fail
    rx388_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx388_pos = $P10."pos"()
  # rx pass
    rx388_cur."!cursor_pass"(rx388_pos, "term:sym<colonpair>")
    rx388_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx388_pos)
    .return (rx388_cur)
  rx388_fail:
.annotate "line", 4
    (rx388_rep, rx388_pos, $I10, $P10) = rx388_cur."!mark_fail"(0)
    lt rx388_pos, -1, rx388_done
    eq rx388_pos, -1, rx388_fail
    jump $I10
  rx388_done:
    rx388_cur."!cursor_fail"()
    rx388_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx388_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("90_1259078882.26523") :method
.annotate "line", 4
    $P390 = self."!PREFIX__!subrule"("colonpair", "")
    new $P391, "ResizablePMCArray"
    push $P391, $P390
    .return ($P391)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("91_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx394_tgt
    .local int rx394_pos
    .local int rx394_off
    .local int rx394_eos
    .local int rx394_rep
    .local pmc rx394_cur
    (rx394_cur, rx394_pos, rx394_tgt) = self."!cursor_start"()
    rx394_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx394_cur
    .local pmc match
    .lex "$/", match
    length rx394_eos, rx394_tgt
    set rx394_off, 0
    lt rx394_pos, 2, rx394_start
    sub rx394_off, rx394_pos, 1
    substr rx394_tgt, rx394_tgt, rx394_off
  rx394_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan398_done
    goto rxscan398_scan
  rxscan398_loop:
    ($P10) = rx394_cur."from"()
    inc $P10
    set rx394_pos, $P10
    ge rx394_pos, rx394_eos, rxscan398_done
  rxscan398_scan:
    set_addr $I10, rxscan398_loop
    rx394_cur."!mark_push"(0, rx394_pos, $I10)
  rxscan398_done:
.annotate "line", 202
  # rx subrule "variable" subtype=capture negate=
    rx394_cur."!cursor_pos"(rx394_pos)
    $P10 = rx394_cur."variable"()
    unless $P10, rx394_fail
    rx394_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx394_pos = $P10."pos"()
  # rx pass
    rx394_cur."!cursor_pass"(rx394_pos, "term:sym<variable>")
    rx394_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx394_pos)
    .return (rx394_cur)
  rx394_fail:
.annotate "line", 4
    (rx394_rep, rx394_pos, $I10, $P10) = rx394_cur."!mark_fail"(0)
    lt rx394_pos, -1, rx394_done
    eq rx394_pos, -1, rx394_fail
    jump $I10
  rx394_done:
    rx394_cur."!cursor_fail"()
    rx394_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx394_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("92_1259078882.26523") :method
.annotate "line", 4
    $P396 = self."!PREFIX__!subrule"("variable", "")
    new $P397, "ResizablePMCArray"
    push $P397, $P396
    .return ($P397)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("93_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx400_tgt
    .local int rx400_pos
    .local int rx400_off
    .local int rx400_eos
    .local int rx400_rep
    .local pmc rx400_cur
    (rx400_cur, rx400_pos, rx400_tgt) = self."!cursor_start"()
    rx400_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx400_cur
    .local pmc match
    .lex "$/", match
    length rx400_eos, rx400_tgt
    set rx400_off, 0
    lt rx400_pos, 2, rx400_start
    sub rx400_off, rx400_pos, 1
    substr rx400_tgt, rx400_tgt, rx400_off
  rx400_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan404_done
    goto rxscan404_scan
  rxscan404_loop:
    ($P10) = rx400_cur."from"()
    inc $P10
    set rx400_pos, $P10
    ge rx400_pos, rx400_eos, rxscan404_done
  rxscan404_scan:
    set_addr $I10, rxscan404_loop
    rx400_cur."!mark_push"(0, rx400_pos, $I10)
  rxscan404_done:
.annotate "line", 203
  # rx subrule "package_declarator" subtype=capture negate=
    rx400_cur."!cursor_pos"(rx400_pos)
    $P10 = rx400_cur."package_declarator"()
    unless $P10, rx400_fail
    rx400_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx400_pos = $P10."pos"()
  # rx pass
    rx400_cur."!cursor_pass"(rx400_pos, "term:sym<package_declarator>")
    rx400_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx400_pos)
    .return (rx400_cur)
  rx400_fail:
.annotate "line", 4
    (rx400_rep, rx400_pos, $I10, $P10) = rx400_cur."!mark_fail"(0)
    lt rx400_pos, -1, rx400_done
    eq rx400_pos, -1, rx400_fail
    jump $I10
  rx400_done:
    rx400_cur."!cursor_fail"()
    rx400_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx400_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("94_1259078882.26523") :method
.annotate "line", 4
    $P402 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P403, "ResizablePMCArray"
    push $P403, $P402
    .return ($P403)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("95_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx406_tgt
    .local int rx406_pos
    .local int rx406_off
    .local int rx406_eos
    .local int rx406_rep
    .local pmc rx406_cur
    (rx406_cur, rx406_pos, rx406_tgt) = self."!cursor_start"()
    rx406_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx406_cur
    .local pmc match
    .lex "$/", match
    length rx406_eos, rx406_tgt
    set rx406_off, 0
    lt rx406_pos, 2, rx406_start
    sub rx406_off, rx406_pos, 1
    substr rx406_tgt, rx406_tgt, rx406_off
  rx406_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan410_done
    goto rxscan410_scan
  rxscan410_loop:
    ($P10) = rx406_cur."from"()
    inc $P10
    set rx406_pos, $P10
    ge rx406_pos, rx406_eos, rxscan410_done
  rxscan410_scan:
    set_addr $I10, rxscan410_loop
    rx406_cur."!mark_push"(0, rx406_pos, $I10)
  rxscan410_done:
.annotate "line", 204
  # rx subrule "scope_declarator" subtype=capture negate=
    rx406_cur."!cursor_pos"(rx406_pos)
    $P10 = rx406_cur."scope_declarator"()
    unless $P10, rx406_fail
    rx406_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx406_pos = $P10."pos"()
  # rx pass
    rx406_cur."!cursor_pass"(rx406_pos, "term:sym<scope_declarator>")
    rx406_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx406_pos)
    .return (rx406_cur)
  rx406_fail:
.annotate "line", 4
    (rx406_rep, rx406_pos, $I10, $P10) = rx406_cur."!mark_fail"(0)
    lt rx406_pos, -1, rx406_done
    eq rx406_pos, -1, rx406_fail
    jump $I10
  rx406_done:
    rx406_cur."!cursor_fail"()
    rx406_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx406_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("96_1259078882.26523") :method
.annotate "line", 4
    $P408 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P409, "ResizablePMCArray"
    push $P409, $P408
    .return ($P409)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("97_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx412_tgt
    .local int rx412_pos
    .local int rx412_off
    .local int rx412_eos
    .local int rx412_rep
    .local pmc rx412_cur
    (rx412_cur, rx412_pos, rx412_tgt) = self."!cursor_start"()
    rx412_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx412_cur
    .local pmc match
    .lex "$/", match
    length rx412_eos, rx412_tgt
    set rx412_off, 0
    lt rx412_pos, 2, rx412_start
    sub rx412_off, rx412_pos, 1
    substr rx412_tgt, rx412_tgt, rx412_off
  rx412_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan416_done
    goto rxscan416_scan
  rxscan416_loop:
    ($P10) = rx412_cur."from"()
    inc $P10
    set rx412_pos, $P10
    ge rx412_pos, rx412_eos, rxscan416_done
  rxscan416_scan:
    set_addr $I10, rxscan416_loop
    rx412_cur."!mark_push"(0, rx412_pos, $I10)
  rxscan416_done:
.annotate "line", 205
  # rx subrule "routine_declarator" subtype=capture negate=
    rx412_cur."!cursor_pos"(rx412_pos)
    $P10 = rx412_cur."routine_declarator"()
    unless $P10, rx412_fail
    rx412_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx412_pos = $P10."pos"()
  # rx pass
    rx412_cur."!cursor_pass"(rx412_pos, "term:sym<routine_declarator>")
    rx412_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx412_pos)
    .return (rx412_cur)
  rx412_fail:
.annotate "line", 4
    (rx412_rep, rx412_pos, $I10, $P10) = rx412_cur."!mark_fail"(0)
    lt rx412_pos, -1, rx412_done
    eq rx412_pos, -1, rx412_fail
    jump $I10
  rx412_done:
    rx412_cur."!cursor_fail"()
    rx412_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx412_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("98_1259078882.26523") :method
.annotate "line", 4
    $P414 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P415, "ResizablePMCArray"
    push $P415, $P414
    .return ($P415)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("99_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx418_tgt
    .local int rx418_pos
    .local int rx418_off
    .local int rx418_eos
    .local int rx418_rep
    .local pmc rx418_cur
    (rx418_cur, rx418_pos, rx418_tgt) = self."!cursor_start"()
    rx418_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx418_cur
    .local pmc match
    .lex "$/", match
    length rx418_eos, rx418_tgt
    set rx418_off, 0
    lt rx418_pos, 2, rx418_start
    sub rx418_off, rx418_pos, 1
    substr rx418_tgt, rx418_tgt, rx418_off
  rx418_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan422_done
    goto rxscan422_scan
  rxscan422_loop:
    ($P10) = rx418_cur."from"()
    inc $P10
    set rx418_pos, $P10
    ge rx418_pos, rx418_eos, rxscan422_done
  rxscan422_scan:
    set_addr $I10, rxscan422_loop
    rx418_cur."!mark_push"(0, rx418_pos, $I10)
  rxscan422_done:
.annotate "line", 206
  # rx subrule "regex_declarator" subtype=capture negate=
    rx418_cur."!cursor_pos"(rx418_pos)
    $P10 = rx418_cur."regex_declarator"()
    unless $P10, rx418_fail
    rx418_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx418_pos = $P10."pos"()
  # rx pass
    rx418_cur."!cursor_pass"(rx418_pos, "term:sym<regex_declarator>")
    rx418_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx418_pos)
    .return (rx418_cur)
  rx418_fail:
.annotate "line", 4
    (rx418_rep, rx418_pos, $I10, $P10) = rx418_cur."!mark_fail"(0)
    lt rx418_pos, -1, rx418_done
    eq rx418_pos, -1, rx418_fail
    jump $I10
  rx418_done:
    rx418_cur."!cursor_fail"()
    rx418_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx418_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("100_1259078882.26523") :method
.annotate "line", 4
    $P420 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P421, "ResizablePMCArray"
    push $P421, $P420
    .return ($P421)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("101_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx424_tgt
    .local int rx424_pos
    .local int rx424_off
    .local int rx424_eos
    .local int rx424_rep
    .local pmc rx424_cur
    (rx424_cur, rx424_pos, rx424_tgt) = self."!cursor_start"()
    rx424_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx424_cur
    .local pmc match
    .lex "$/", match
    length rx424_eos, rx424_tgt
    set rx424_off, 0
    lt rx424_pos, 2, rx424_start
    sub rx424_off, rx424_pos, 1
    substr rx424_tgt, rx424_tgt, rx424_off
  rx424_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan428_done
    goto rxscan428_scan
  rxscan428_loop:
    ($P10) = rx424_cur."from"()
    inc $P10
    set rx424_pos, $P10
    ge rx424_pos, rx424_eos, rxscan428_done
  rxscan428_scan:
    set_addr $I10, rxscan428_loop
    rx424_cur."!mark_push"(0, rx424_pos, $I10)
  rxscan428_done:
.annotate "line", 207
  # rx subrule "statement_prefix" subtype=capture negate=
    rx424_cur."!cursor_pos"(rx424_pos)
    $P10 = rx424_cur."statement_prefix"()
    unless $P10, rx424_fail
    rx424_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx424_pos = $P10."pos"()
  # rx pass
    rx424_cur."!cursor_pass"(rx424_pos, "term:sym<statement_prefix>")
    rx424_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx424_pos)
    .return (rx424_cur)
  rx424_fail:
.annotate "line", 4
    (rx424_rep, rx424_pos, $I10, $P10) = rx424_cur."!mark_fail"(0)
    lt rx424_pos, -1, rx424_done
    eq rx424_pos, -1, rx424_fail
    jump $I10
  rx424_done:
    rx424_cur."!cursor_fail"()
    rx424_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx424_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("102_1259078882.26523") :method
.annotate "line", 4
    $P426 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P427, "ResizablePMCArray"
    push $P427, $P426
    .return ($P427)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("103_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx430_tgt
    .local int rx430_pos
    .local int rx430_off
    .local int rx430_eos
    .local int rx430_rep
    .local pmc rx430_cur
    (rx430_cur, rx430_pos, rx430_tgt) = self."!cursor_start"()
    rx430_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx430_cur
    .local pmc match
    .lex "$/", match
    length rx430_eos, rx430_tgt
    set rx430_off, 0
    lt rx430_pos, 2, rx430_start
    sub rx430_off, rx430_pos, 1
    substr rx430_tgt, rx430_tgt, rx430_off
  rx430_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan433_done
    goto rxscan433_scan
  rxscan433_loop:
    ($P10) = rx430_cur."from"()
    inc $P10
    set rx430_pos, $P10
    ge rx430_pos, rx430_eos, rxscan433_done
  rxscan433_scan:
    set_addr $I10, rxscan433_loop
    rx430_cur."!mark_push"(0, rx430_pos, $I10)
  rxscan433_done:
.annotate "line", 208
  # rx subrule "lambda" subtype=zerowidth negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."lambda"()
    unless $P10, rx430_fail
  # rx subrule "pblock" subtype=capture negate=
    rx430_cur."!cursor_pos"(rx430_pos)
    $P10 = rx430_cur."pblock"()
    unless $P10, rx430_fail
    rx430_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx430_pos = $P10."pos"()
  # rx pass
    rx430_cur."!cursor_pass"(rx430_pos, "term:sym<lambda>")
    rx430_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx430_pos)
    .return (rx430_cur)
  rx430_fail:
.annotate "line", 4
    (rx430_rep, rx430_pos, $I10, $P10) = rx430_cur."!mark_fail"(0)
    lt rx430_pos, -1, rx430_done
    eq rx430_pos, -1, rx430_fail
    jump $I10
  rx430_done:
    rx430_cur."!cursor_fail"()
    rx430_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx430_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("104_1259078882.26523") :method
.annotate "line", 4
    new $P432, "ResizablePMCArray"
    push $P432, ""
    .return ($P432)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("105_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx435_tgt
    .local int rx435_pos
    .local int rx435_off
    .local int rx435_eos
    .local int rx435_rep
    .local pmc rx435_cur
    (rx435_cur, rx435_pos, rx435_tgt) = self."!cursor_start"()
    rx435_cur."!cursor_debug"("START ", "colonpair")
    rx435_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx435_cur
    .local pmc match
    .lex "$/", match
    length rx435_eos, rx435_tgt
    set rx435_off, 0
    lt rx435_pos, 2, rx435_start
    sub rx435_off, rx435_pos, 1
    substr rx435_tgt, rx435_tgt, rx435_off
  rx435_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan440_done
    goto rxscan440_scan
  rxscan440_loop:
    ($P10) = rx435_cur."from"()
    inc $P10
    set rx435_pos, $P10
    ge rx435_pos, rx435_eos, rxscan440_done
  rxscan440_scan:
    set_addr $I10, rxscan440_loop
    rx435_cur."!mark_push"(0, rx435_pos, $I10)
  rxscan440_done:
.annotate "line", 211
  # rx literal  ":"
    add $I11, rx435_pos, 1
    gt $I11, rx435_eos, rx435_fail
    sub $I11, rx435_pos, rx435_off
    substr $S10, rx435_tgt, $I11, 1
    ne $S10, ":", rx435_fail
    add rx435_pos, 1
  alt441_0:
.annotate "line", 212
    set_addr $I10, alt441_1
    rx435_cur."!mark_push"(0, rx435_pos, $I10)
.annotate "line", 213
  # rx subcapture "not"
    set_addr $I10, rxcap_442_fail
    rx435_cur."!mark_push"(0, rx435_pos, $I10)
  # rx literal  "!"
    add $I11, rx435_pos, 1
    gt $I11, rx435_eos, rx435_fail
    sub $I11, rx435_pos, rx435_off
    substr $S10, rx435_tgt, $I11, 1
    ne $S10, "!", rx435_fail
    add rx435_pos, 1
    set_addr $I10, rxcap_442_fail
    ($I12, $I11) = rx435_cur."!mark_peek"($I10)
    rx435_cur."!cursor_pos"($I11)
    ($P10) = rx435_cur."!cursor_start"()
    $P10."!cursor_pass"(rx435_pos, "")
    rx435_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_442_done
  rxcap_442_fail:
    goto rx435_fail
  rxcap_442_done:
  # rx subrule "identifier" subtype=capture negate=
    rx435_cur."!cursor_pos"(rx435_pos)
    $P10 = rx435_cur."identifier"()
    unless $P10, rx435_fail
    rx435_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx435_pos = $P10."pos"()
    goto alt441_end
  alt441_1:
.annotate "line", 214
  # rx subrule "identifier" subtype=capture negate=
    rx435_cur."!cursor_pos"(rx435_pos)
    $P10 = rx435_cur."identifier"()
    unless $P10, rx435_fail
    rx435_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx435_pos = $P10."pos"()
  # rx rxquantr443 ** 0..1
    set_addr $I444, rxquantr443_done
    rx435_cur."!mark_push"(0, rx435_pos, $I444)
  rxquantr443_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx435_cur."!cursor_pos"(rx435_pos)
    $P10 = rx435_cur."circumfix"()
    unless $P10, rx435_fail
    rx435_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx435_pos = $P10."pos"()
    (rx435_rep) = rx435_cur."!mark_commit"($I444)
  rxquantr443_done:
  alt441_end:
.annotate "line", 210
  # rx pass
    rx435_cur."!cursor_pass"(rx435_pos, "colonpair")
    rx435_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx435_pos)
    .return (rx435_cur)
  rx435_fail:
.annotate "line", 4
    (rx435_rep, rx435_pos, $I10, $P10) = rx435_cur."!mark_fail"(0)
    lt rx435_pos, -1, rx435_done
    eq rx435_pos, -1, rx435_fail
    jump $I10
  rx435_done:
    rx435_cur."!cursor_fail"()
    rx435_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx435_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("106_1259078882.26523") :method
.annotate "line", 4
    $P437 = self."!PREFIX__!subrule"("identifier", ":")
    $P438 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P439, "ResizablePMCArray"
    push $P439, $P437
    push $P439, $P438
    .return ($P439)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("107_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx446_tgt
    .local int rx446_pos
    .local int rx446_off
    .local int rx446_eos
    .local int rx446_rep
    .local pmc rx446_cur
    (rx446_cur, rx446_pos, rx446_tgt) = self."!cursor_start"()
    rx446_cur."!cursor_debug"("START ", "variable")
    rx446_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx446_cur
    .local pmc match
    .lex "$/", match
    length rx446_eos, rx446_tgt
    set rx446_off, 0
    lt rx446_pos, 2, rx446_start
    sub rx446_off, rx446_pos, 1
    substr rx446_tgt, rx446_tgt, rx446_off
  rx446_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan451_done
    goto rxscan451_scan
  rxscan451_loop:
    ($P10) = rx446_cur."from"()
    inc $P10
    set rx446_pos, $P10
    ge rx446_pos, rx446_eos, rxscan451_done
  rxscan451_scan:
    set_addr $I10, rxscan451_loop
    rx446_cur."!mark_push"(0, rx446_pos, $I10)
  rxscan451_done:
  alt452_0:
.annotate "line", 218
    set_addr $I10, alt452_1
    rx446_cur."!mark_push"(0, rx446_pos, $I10)
.annotate "line", 219
  # rx subrule "sigil" subtype=capture negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."sigil"()
    unless $P10, rx446_fail
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx446_pos = $P10."pos"()
  # rx rxquantr453 ** 0..1
    set_addr $I454, rxquantr453_done
    rx446_cur."!mark_push"(0, rx446_pos, $I454)
  rxquantr453_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."twigil"()
    unless $P10, rx446_fail
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx446_pos = $P10."pos"()
    (rx446_rep) = rx446_cur."!mark_commit"($I454)
  rxquantr453_done:
  # rx subrule "name" subtype=capture negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."name"()
    unless $P10, rx446_fail
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx446_pos = $P10."pos"()
    goto alt452_end
  alt452_1:
    set_addr $I10, alt452_2
    rx446_cur."!mark_push"(0, rx446_pos, $I10)
.annotate "line", 220
  # rx subrule "sigil" subtype=capture negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."sigil"()
    unless $P10, rx446_fail
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx446_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx446_pos, rx446_eos, rx446_fail
    sub $I10, rx446_pos, rx446_off
    substr $S10, rx446_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx446_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx446_cur."!cursor_pos"(rx446_pos)
    $P10 = rx446_cur."postcircumfix"()
    unless $P10, rx446_fail
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx446_pos = $P10."pos"()
    goto alt452_end
  alt452_2:
.annotate "line", 221
  # rx subcapture "sigil"
    set_addr $I10, rxcap_455_fail
    rx446_cur."!mark_push"(0, rx446_pos, $I10)
  # rx literal  "$"
    add $I11, rx446_pos, 1
    gt $I11, rx446_eos, rx446_fail
    sub $I11, rx446_pos, rx446_off
    substr $S10, rx446_tgt, $I11, 1
    ne $S10, "$", rx446_fail
    add rx446_pos, 1
    set_addr $I10, rxcap_455_fail
    ($I12, $I11) = rx446_cur."!mark_peek"($I10)
    rx446_cur."!cursor_pos"($I11)
    ($P10) = rx446_cur."!cursor_start"()
    $P10."!cursor_pass"(rx446_pos, "")
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_455_done
  rxcap_455_fail:
    goto rx446_fail
  rxcap_455_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_456_fail
    rx446_cur."!mark_push"(0, rx446_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx446_pos, rx446_eos, rx446_fail
    sub $I10, rx446_pos, rx446_off
    substr $S10, rx446_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx446_fail
    inc rx446_pos
    set_addr $I10, rxcap_456_fail
    ($I12, $I11) = rx446_cur."!mark_peek"($I10)
    rx446_cur."!cursor_pos"($I11)
    ($P10) = rx446_cur."!cursor_start"()
    $P10."!cursor_pass"(rx446_pos, "")
    rx446_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_456_done
  rxcap_456_fail:
    goto rx446_fail
  rxcap_456_done:
  alt452_end:
.annotate "line", 218
  # rx pass
    rx446_cur."!cursor_pass"(rx446_pos, "variable")
    rx446_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx446_pos)
    .return (rx446_cur)
  rx446_fail:
.annotate "line", 4
    (rx446_rep, rx446_pos, $I10, $P10) = rx446_cur."!mark_fail"(0)
    lt rx446_pos, -1, rx446_done
    eq rx446_pos, -1, rx446_fail
    jump $I10
  rx446_done:
    rx446_cur."!cursor_fail"()
    rx446_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx446_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("108_1259078882.26523") :method
.annotate "line", 4
    $P448 = self."!PREFIX__!subrule"("sigil", "")
    $P449 = self."!PREFIX__!subrule"("sigil", "")
    new $P450, "ResizablePMCArray"
    push $P450, "$!"
    push $P450, "$_"
    push $P450, "$/"
    push $P450, $P448
    push $P450, $P449
    .return ($P450)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("109_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx458_tgt
    .local int rx458_pos
    .local int rx458_off
    .local int rx458_eos
    .local int rx458_rep
    .local pmc rx458_cur
    (rx458_cur, rx458_pos, rx458_tgt) = self."!cursor_start"()
    rx458_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx458_cur
    .local pmc match
    .lex "$/", match
    length rx458_eos, rx458_tgt
    set rx458_off, 0
    lt rx458_pos, 2, rx458_start
    sub rx458_off, rx458_pos, 1
    substr rx458_tgt, rx458_tgt, rx458_off
  rx458_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan461_done
    goto rxscan461_scan
  rxscan461_loop:
    ($P10) = rx458_cur."from"()
    inc $P10
    set rx458_pos, $P10
    ge rx458_pos, rx458_eos, rxscan461_done
  rxscan461_scan:
    set_addr $I10, rxscan461_loop
    rx458_cur."!mark_push"(0, rx458_pos, $I10)
  rxscan461_done:
.annotate "line", 224
  # rx enumcharlist negate=0 
    ge rx458_pos, rx458_eos, rx458_fail
    sub $I10, rx458_pos, rx458_off
    substr $S10, rx458_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx458_fail
    inc rx458_pos
  # rx pass
    rx458_cur."!cursor_pass"(rx458_pos, "sigil")
    rx458_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx458_pos)
    .return (rx458_cur)
  rx458_fail:
.annotate "line", 4
    (rx458_rep, rx458_pos, $I10, $P10) = rx458_cur."!mark_fail"(0)
    lt rx458_pos, -1, rx458_done
    eq rx458_pos, -1, rx458_fail
    jump $I10
  rx458_done:
    rx458_cur."!cursor_fail"()
    rx458_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx458_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("110_1259078882.26523") :method
.annotate "line", 4
    new $P460, "ResizablePMCArray"
    push $P460, "&"
    push $P460, "%"
    push $P460, "@"
    push $P460, "$"
    .return ($P460)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("111_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx463_tgt
    .local int rx463_pos
    .local int rx463_off
    .local int rx463_eos
    .local int rx463_rep
    .local pmc rx463_cur
    (rx463_cur, rx463_pos, rx463_tgt) = self."!cursor_start"()
    rx463_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx463_cur
    .local pmc match
    .lex "$/", match
    length rx463_eos, rx463_tgt
    set rx463_off, 0
    lt rx463_pos, 2, rx463_start
    sub rx463_off, rx463_pos, 1
    substr rx463_tgt, rx463_tgt, rx463_off
  rx463_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan466_done
    goto rxscan466_scan
  rxscan466_loop:
    ($P10) = rx463_cur."from"()
    inc $P10
    set rx463_pos, $P10
    ge rx463_pos, rx463_eos, rxscan466_done
  rxscan466_scan:
    set_addr $I10, rxscan466_loop
    rx463_cur."!mark_push"(0, rx463_pos, $I10)
  rxscan466_done:
.annotate "line", 226
  # rx enumcharlist negate=0 
    ge rx463_pos, rx463_eos, rx463_fail
    sub $I10, rx463_pos, rx463_off
    substr $S10, rx463_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx463_fail
    inc rx463_pos
  # rx pass
    rx463_cur."!cursor_pass"(rx463_pos, "twigil")
    rx463_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx463_pos)
    .return (rx463_cur)
  rx463_fail:
.annotate "line", 4
    (rx463_rep, rx463_pos, $I10, $P10) = rx463_cur."!mark_fail"(0)
    lt rx463_pos, -1, rx463_done
    eq rx463_pos, -1, rx463_fail
    jump $I10
  rx463_done:
    rx463_cur."!cursor_fail"()
    rx463_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx463_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("112_1259078882.26523") :method
.annotate "line", 4
    new $P465, "ResizablePMCArray"
    push $P465, "?"
    push $P465, "!"
    push $P465, "*"
    .return ($P465)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("113_1259078882.26523") :method
.annotate "line", 228
    $P468 = self."!protoregex"("package_declarator")
    .return ($P468)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("114_1259078882.26523") :method
.annotate "line", 228
    $P470 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P470)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("115_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx472_tgt
    .local int rx472_pos
    .local int rx472_off
    .local int rx472_eos
    .local int rx472_rep
    .local pmc rx472_cur
    (rx472_cur, rx472_pos, rx472_tgt) = self."!cursor_start"()
    rx472_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx472_cur
    .local pmc match
    .lex "$/", match
    length rx472_eos, rx472_tgt
    set rx472_off, 0
    lt rx472_pos, 2, rx472_start
    sub rx472_off, rx472_pos, 1
    substr rx472_tgt, rx472_tgt, rx472_off
  rx472_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan476_done
    goto rxscan476_scan
  rxscan476_loop:
    ($P10) = rx472_cur."from"()
    inc $P10
    set rx472_pos, $P10
    ge rx472_pos, rx472_eos, rxscan476_done
  rxscan476_scan:
    set_addr $I10, rxscan476_loop
    rx472_cur."!mark_push"(0, rx472_pos, $I10)
  rxscan476_done:
.annotate "line", 229
  # rx subcapture "sym"
    set_addr $I10, rxcap_477_fail
    rx472_cur."!mark_push"(0, rx472_pos, $I10)
  # rx literal  "module"
    add $I11, rx472_pos, 6
    gt $I11, rx472_eos, rx472_fail
    sub $I11, rx472_pos, rx472_off
    substr $S10, rx472_tgt, $I11, 6
    ne $S10, "module", rx472_fail
    add rx472_pos, 6
    set_addr $I10, rxcap_477_fail
    ($I12, $I11) = rx472_cur."!mark_peek"($I10)
    rx472_cur."!cursor_pos"($I11)
    ($P10) = rx472_cur."!cursor_start"()
    $P10."!cursor_pass"(rx472_pos, "")
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_477_done
  rxcap_477_fail:
    goto rx472_fail
  rxcap_477_done:
  # rx subrule "package_def" subtype=capture negate=
    rx472_cur."!cursor_pos"(rx472_pos)
    $P10 = rx472_cur."package_def"()
    unless $P10, rx472_fail
    rx472_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx472_pos = $P10."pos"()
  # rx pass
    rx472_cur."!cursor_pass"(rx472_pos, "package_declarator:sym<module>")
    rx472_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx472_pos)
    .return (rx472_cur)
  rx472_fail:
.annotate "line", 4
    (rx472_rep, rx472_pos, $I10, $P10) = rx472_cur."!mark_fail"(0)
    lt rx472_pos, -1, rx472_done
    eq rx472_pos, -1, rx472_fail
    jump $I10
  rx472_done:
    rx472_cur."!cursor_fail"()
    rx472_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx472_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("116_1259078882.26523") :method
.annotate "line", 4
    $P474 = self."!PREFIX__!subrule"("package_def", "module")
    new $P475, "ResizablePMCArray"
    push $P475, $P474
    .return ($P475)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("117_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx479_tgt
    .local int rx479_pos
    .local int rx479_off
    .local int rx479_eos
    .local int rx479_rep
    .local pmc rx479_cur
    (rx479_cur, rx479_pos, rx479_tgt) = self."!cursor_start"()
    rx479_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx479_cur
    .local pmc match
    .lex "$/", match
    length rx479_eos, rx479_tgt
    set rx479_off, 0
    lt rx479_pos, 2, rx479_start
    sub rx479_off, rx479_pos, 1
    substr rx479_tgt, rx479_tgt, rx479_off
  rx479_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan484_done
    goto rxscan484_scan
  rxscan484_loop:
    ($P10) = rx479_cur."from"()
    inc $P10
    set rx479_pos, $P10
    ge rx479_pos, rx479_eos, rxscan484_done
  rxscan484_scan:
    set_addr $I10, rxscan484_loop
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
  rxscan484_done:
.annotate "line", 230
  # rx subcapture "sym"
    set_addr $I10, rxcap_486_fail
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
  alt485_0:
    set_addr $I10, alt485_1
    rx479_cur."!mark_push"(0, rx479_pos, $I10)
  # rx literal  "class"
    add $I11, rx479_pos, 5
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    substr $S10, rx479_tgt, $I11, 5
    ne $S10, "class", rx479_fail
    add rx479_pos, 5
    goto alt485_end
  alt485_1:
  # rx literal  "grammar"
    add $I11, rx479_pos, 7
    gt $I11, rx479_eos, rx479_fail
    sub $I11, rx479_pos, rx479_off
    substr $S10, rx479_tgt, $I11, 7
    ne $S10, "grammar", rx479_fail
    add rx479_pos, 7
  alt485_end:
    set_addr $I10, rxcap_486_fail
    ($I12, $I11) = rx479_cur."!mark_peek"($I10)
    rx479_cur."!cursor_pos"($I11)
    ($P10) = rx479_cur."!cursor_start"()
    $P10."!cursor_pass"(rx479_pos, "")
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_486_done
  rxcap_486_fail:
    goto rx479_fail
  rxcap_486_done:
  # rx subrule "package_def" subtype=capture negate=
    rx479_cur."!cursor_pos"(rx479_pos)
    $P10 = rx479_cur."package_def"()
    unless $P10, rx479_fail
    rx479_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx479_pos = $P10."pos"()
  # rx pass
    rx479_cur."!cursor_pass"(rx479_pos, "package_declarator:sym<class>")
    rx479_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx479_pos)
    .return (rx479_cur)
  rx479_fail:
.annotate "line", 4
    (rx479_rep, rx479_pos, $I10, $P10) = rx479_cur."!mark_fail"(0)
    lt rx479_pos, -1, rx479_done
    eq rx479_pos, -1, rx479_fail
    jump $I10
  rx479_done:
    rx479_cur."!cursor_fail"()
    rx479_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx479_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("118_1259078882.26523") :method
.annotate "line", 4
    $P481 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P482 = self."!PREFIX__!subrule"("package_def", "class")
    new $P483, "ResizablePMCArray"
    push $P483, $P481
    push $P483, $P482
    .return ($P483)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("119_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx488_tgt
    .local int rx488_pos
    .local int rx488_off
    .local int rx488_eos
    .local int rx488_rep
    .local pmc rx488_cur
    (rx488_cur, rx488_pos, rx488_tgt) = self."!cursor_start"()
    rx488_cur."!cursor_debug"("START ", "package_def")
    rx488_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx488_cur
    .local pmc match
    .lex "$/", match
    length rx488_eos, rx488_tgt
    set rx488_off, 0
    lt rx488_pos, 2, rx488_start
    sub rx488_off, rx488_pos, 1
    substr rx488_tgt, rx488_tgt, rx488_off
  rx488_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan491_done
    goto rxscan491_scan
  rxscan491_loop:
    ($P10) = rx488_cur."from"()
    inc $P10
    set rx488_pos, $P10
    ge rx488_pos, rx488_eos, rxscan491_done
  rxscan491_scan:
    set_addr $I10, rxscan491_loop
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
  rxscan491_done:
.annotate "line", 232
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
.annotate "line", 233
  # rx subrule "name" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."name"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx488_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
.annotate "line", 234
  # rx rxquantr494 ** 0..1
    set_addr $I498, rxquantr494_done
    rx488_cur."!mark_push"(0, rx488_pos, $I498)
  rxquantr494_loop:
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx488_pos, 2
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 2
    ne $S10, "is", rx488_fail
    add rx488_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."name"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx488_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
    (rx488_rep) = rx488_cur."!mark_commit"($I498)
  rxquantr494_done:
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  alt500_0:
.annotate "line", 235
    set_addr $I10, alt500_1
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
.annotate "line", 236
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx488_pos, 1
    gt $I11, rx488_eos, rx488_fail
    sub $I11, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I11, 1
    ne $S10, ";", rx488_fail
    add rx488_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."comp_unit"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx488_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
    goto alt500_end
  alt500_1:
    set_addr $I10, alt500_2
    rx488_cur."!mark_push"(0, rx488_pos, $I10)
.annotate "line", 237
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx488_pos, rx488_eos, rx488_fail
    sub $I10, rx488_pos, rx488_off
    substr $S10, rx488_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx488_fail
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."block"()
    unless $P10, rx488_fail
    rx488_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx488_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
    goto alt500_end
  alt500_2:
.annotate "line", 238
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."panic"("Malformed package declaration")
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
  alt500_end:
.annotate "line", 239
  # rx subrule "ws" subtype=method negate=
    rx488_cur."!cursor_pos"(rx488_pos)
    $P10 = rx488_cur."ws"()
    unless $P10, rx488_fail
    rx488_pos = $P10."pos"()
.annotate "line", 232
  # rx pass
    rx488_cur."!cursor_pass"(rx488_pos, "package_def")
    rx488_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx488_pos)
    .return (rx488_cur)
  rx488_fail:
.annotate "line", 4
    (rx488_rep, rx488_pos, $I10, $P10) = rx488_cur."!mark_fail"(0)
    lt rx488_pos, -1, rx488_done
    eq rx488_pos, -1, rx488_fail
    jump $I10
  rx488_done:
    rx488_cur."!cursor_fail"()
    rx488_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx488_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("120_1259078882.26523") :method
.annotate "line", 4
    new $P490, "ResizablePMCArray"
    push $P490, ""
    .return ($P490)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("121_1259078882.26523") :method
.annotate "line", 242
    $P511 = self."!protoregex"("scope_declarator")
    .return ($P511)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("122_1259078882.26523") :method
.annotate "line", 242
    $P513 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P513)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("123_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx515_tgt
    .local int rx515_pos
    .local int rx515_off
    .local int rx515_eos
    .local int rx515_rep
    .local pmc rx515_cur
    (rx515_cur, rx515_pos, rx515_tgt) = self."!cursor_start"()
    rx515_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx515_cur
    .local pmc match
    .lex "$/", match
    length rx515_eos, rx515_tgt
    set rx515_off, 0
    lt rx515_pos, 2, rx515_start
    sub rx515_off, rx515_pos, 1
    substr rx515_tgt, rx515_tgt, rx515_off
  rx515_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan519_done
    goto rxscan519_scan
  rxscan519_loop:
    ($P10) = rx515_cur."from"()
    inc $P10
    set rx515_pos, $P10
    ge rx515_pos, rx515_eos, rxscan519_done
  rxscan519_scan:
    set_addr $I10, rxscan519_loop
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  rxscan519_done:
.annotate "line", 243
  # rx subcapture "sym"
    set_addr $I10, rxcap_520_fail
    rx515_cur."!mark_push"(0, rx515_pos, $I10)
  # rx literal  "my"
    add $I11, rx515_pos, 2
    gt $I11, rx515_eos, rx515_fail
    sub $I11, rx515_pos, rx515_off
    substr $S10, rx515_tgt, $I11, 2
    ne $S10, "my", rx515_fail
    add rx515_pos, 2
    set_addr $I10, rxcap_520_fail
    ($I12, $I11) = rx515_cur."!mark_peek"($I10)
    rx515_cur."!cursor_pos"($I11)
    ($P10) = rx515_cur."!cursor_start"()
    $P10."!cursor_pass"(rx515_pos, "")
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_520_done
  rxcap_520_fail:
    goto rx515_fail
  rxcap_520_done:
  # rx subrule "scoped" subtype=capture negate=
    rx515_cur."!cursor_pos"(rx515_pos)
    $P10 = rx515_cur."scoped"("my")
    unless $P10, rx515_fail
    rx515_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx515_pos = $P10."pos"()
  # rx pass
    rx515_cur."!cursor_pass"(rx515_pos, "scope_declarator:sym<my>")
    rx515_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx515_pos)
    .return (rx515_cur)
  rx515_fail:
.annotate "line", 4
    (rx515_rep, rx515_pos, $I10, $P10) = rx515_cur."!mark_fail"(0)
    lt rx515_pos, -1, rx515_done
    eq rx515_pos, -1, rx515_fail
    jump $I10
  rx515_done:
    rx515_cur."!cursor_fail"()
    rx515_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx515_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("124_1259078882.26523") :method
.annotate "line", 4
    $P517 = self."!PREFIX__!subrule"("scoped", "my")
    new $P518, "ResizablePMCArray"
    push $P518, $P517
    .return ($P518)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("125_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx522_tgt
    .local int rx522_pos
    .local int rx522_off
    .local int rx522_eos
    .local int rx522_rep
    .local pmc rx522_cur
    (rx522_cur, rx522_pos, rx522_tgt) = self."!cursor_start"()
    rx522_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx522_cur
    .local pmc match
    .lex "$/", match
    length rx522_eos, rx522_tgt
    set rx522_off, 0
    lt rx522_pos, 2, rx522_start
    sub rx522_off, rx522_pos, 1
    substr rx522_tgt, rx522_tgt, rx522_off
  rx522_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan526_done
    goto rxscan526_scan
  rxscan526_loop:
    ($P10) = rx522_cur."from"()
    inc $P10
    set rx522_pos, $P10
    ge rx522_pos, rx522_eos, rxscan526_done
  rxscan526_scan:
    set_addr $I10, rxscan526_loop
    rx522_cur."!mark_push"(0, rx522_pos, $I10)
  rxscan526_done:
.annotate "line", 244
  # rx subcapture "sym"
    set_addr $I10, rxcap_527_fail
    rx522_cur."!mark_push"(0, rx522_pos, $I10)
  # rx literal  "our"
    add $I11, rx522_pos, 3
    gt $I11, rx522_eos, rx522_fail
    sub $I11, rx522_pos, rx522_off
    substr $S10, rx522_tgt, $I11, 3
    ne $S10, "our", rx522_fail
    add rx522_pos, 3
    set_addr $I10, rxcap_527_fail
    ($I12, $I11) = rx522_cur."!mark_peek"($I10)
    rx522_cur."!cursor_pos"($I11)
    ($P10) = rx522_cur."!cursor_start"()
    $P10."!cursor_pass"(rx522_pos, "")
    rx522_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_527_done
  rxcap_527_fail:
    goto rx522_fail
  rxcap_527_done:
  # rx subrule "scoped" subtype=capture negate=
    rx522_cur."!cursor_pos"(rx522_pos)
    $P10 = rx522_cur."scoped"("our")
    unless $P10, rx522_fail
    rx522_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx522_pos = $P10."pos"()
  # rx pass
    rx522_cur."!cursor_pass"(rx522_pos, "scope_declarator:sym<our>")
    rx522_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx522_pos)
    .return (rx522_cur)
  rx522_fail:
.annotate "line", 4
    (rx522_rep, rx522_pos, $I10, $P10) = rx522_cur."!mark_fail"(0)
    lt rx522_pos, -1, rx522_done
    eq rx522_pos, -1, rx522_fail
    jump $I10
  rx522_done:
    rx522_cur."!cursor_fail"()
    rx522_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx522_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("126_1259078882.26523") :method
.annotate "line", 4
    $P524 = self."!PREFIX__!subrule"("scoped", "our")
    new $P525, "ResizablePMCArray"
    push $P525, $P524
    .return ($P525)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("127_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx529_tgt
    .local int rx529_pos
    .local int rx529_off
    .local int rx529_eos
    .local int rx529_rep
    .local pmc rx529_cur
    (rx529_cur, rx529_pos, rx529_tgt) = self."!cursor_start"()
    rx529_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx529_cur
    .local pmc match
    .lex "$/", match
    length rx529_eos, rx529_tgt
    set rx529_off, 0
    lt rx529_pos, 2, rx529_start
    sub rx529_off, rx529_pos, 1
    substr rx529_tgt, rx529_tgt, rx529_off
  rx529_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan533_done
    goto rxscan533_scan
  rxscan533_loop:
    ($P10) = rx529_cur."from"()
    inc $P10
    set rx529_pos, $P10
    ge rx529_pos, rx529_eos, rxscan533_done
  rxscan533_scan:
    set_addr $I10, rxscan533_loop
    rx529_cur."!mark_push"(0, rx529_pos, $I10)
  rxscan533_done:
.annotate "line", 245
  # rx subcapture "sym"
    set_addr $I10, rxcap_534_fail
    rx529_cur."!mark_push"(0, rx529_pos, $I10)
  # rx literal  "has"
    add $I11, rx529_pos, 3
    gt $I11, rx529_eos, rx529_fail
    sub $I11, rx529_pos, rx529_off
    substr $S10, rx529_tgt, $I11, 3
    ne $S10, "has", rx529_fail
    add rx529_pos, 3
    set_addr $I10, rxcap_534_fail
    ($I12, $I11) = rx529_cur."!mark_peek"($I10)
    rx529_cur."!cursor_pos"($I11)
    ($P10) = rx529_cur."!cursor_start"()
    $P10."!cursor_pass"(rx529_pos, "")
    rx529_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_534_done
  rxcap_534_fail:
    goto rx529_fail
  rxcap_534_done:
  # rx subrule "scoped" subtype=capture negate=
    rx529_cur."!cursor_pos"(rx529_pos)
    $P10 = rx529_cur."scoped"("has")
    unless $P10, rx529_fail
    rx529_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx529_pos = $P10."pos"()
  # rx pass
    rx529_cur."!cursor_pass"(rx529_pos, "scope_declarator:sym<has>")
    rx529_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx529_pos)
    .return (rx529_cur)
  rx529_fail:
.annotate "line", 4
    (rx529_rep, rx529_pos, $I10, $P10) = rx529_cur."!mark_fail"(0)
    lt rx529_pos, -1, rx529_done
    eq rx529_pos, -1, rx529_fail
    jump $I10
  rx529_done:
    rx529_cur."!cursor_fail"()
    rx529_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx529_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("128_1259078882.26523") :method
.annotate "line", 4
    $P531 = self."!PREFIX__!subrule"("scoped", "has")
    new $P532, "ResizablePMCArray"
    push $P532, $P531
    .return ($P532)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("129_1259078882.26523") :method :outer("11_1259078882.26523")
    .param pmc param_536
.annotate "line", 247
    .lex "$*SCOPE", param_536
.annotate "line", 4
    .local string rx537_tgt
    .local int rx537_pos
    .local int rx537_off
    .local int rx537_eos
    .local int rx537_rep
    .local pmc rx537_cur
    (rx537_cur, rx537_pos, rx537_tgt) = self."!cursor_start"()
    rx537_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx537_cur
    .local pmc match
    .lex "$/", match
    length rx537_eos, rx537_tgt
    set rx537_off, 0
    lt rx537_pos, 2, rx537_start
    sub rx537_off, rx537_pos, 1
    substr rx537_tgt, rx537_tgt, rx537_off
  rx537_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan540_done
    goto rxscan540_scan
  rxscan540_loop:
    ($P10) = rx537_cur."from"()
    inc $P10
    set rx537_pos, $P10
    ge rx537_pos, rx537_eos, rxscan540_done
  rxscan540_scan:
    set_addr $I10, rxscan540_loop
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
  rxscan540_done:
  alt541_0:
.annotate "line", 247
    set_addr $I10, alt541_1
    rx537_cur."!mark_push"(0, rx537_pos, $I10)
.annotate "line", 248
  # rx subrule "ws" subtype=method negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."ws"()
    unless $P10, rx537_fail
    rx537_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."variable_declarator"()
    unless $P10, rx537_fail
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx537_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."ws"()
    unless $P10, rx537_fail
    rx537_pos = $P10."pos"()
    goto alt541_end
  alt541_1:
.annotate "line", 249
  # rx subrule "ws" subtype=method negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."ws"()
    unless $P10, rx537_fail
    rx537_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."routine_declarator"()
    unless $P10, rx537_fail
    rx537_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx537_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx537_cur."!cursor_pos"(rx537_pos)
    $P10 = rx537_cur."ws"()
    unless $P10, rx537_fail
    rx537_pos = $P10."pos"()
  alt541_end:
.annotate "line", 247
  # rx pass
    rx537_cur."!cursor_pass"(rx537_pos, "scoped")
    rx537_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx537_pos)
    .return (rx537_cur)
  rx537_fail:
.annotate "line", 4
    (rx537_rep, rx537_pos, $I10, $P10) = rx537_cur."!mark_fail"(0)
    lt rx537_pos, -1, rx537_done
    eq rx537_pos, -1, rx537_fail
    jump $I10
  rx537_done:
    rx537_cur."!cursor_fail"()
    rx537_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx537_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("130_1259078882.26523") :method
.annotate "line", 4
    new $P539, "ResizablePMCArray"
    push $P539, ""
    push $P539, ""
    .return ($P539)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("131_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx547_tgt
    .local int rx547_pos
    .local int rx547_off
    .local int rx547_eos
    .local int rx547_rep
    .local pmc rx547_cur
    (rx547_cur, rx547_pos, rx547_tgt) = self."!cursor_start"()
    rx547_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx547_cur
    .local pmc match
    .lex "$/", match
    length rx547_eos, rx547_tgt
    set rx547_off, 0
    lt rx547_pos, 2, rx547_start
    sub rx547_off, rx547_pos, 1
    substr rx547_tgt, rx547_tgt, rx547_off
  rx547_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan551_done
    goto rxscan551_scan
  rxscan551_loop:
    ($P10) = rx547_cur."from"()
    inc $P10
    set rx547_pos, $P10
    ge rx547_pos, rx547_eos, rxscan551_done
  rxscan551_scan:
    set_addr $I10, rxscan551_loop
    rx547_cur."!mark_push"(0, rx547_pos, $I10)
  rxscan551_done:
.annotate "line", 252
  # rx subrule "variable" subtype=capture negate=
    rx547_cur."!cursor_pos"(rx547_pos)
    $P10 = rx547_cur."variable"()
    unless $P10, rx547_fail
    rx547_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx547_pos = $P10."pos"()
  # rx pass
    rx547_cur."!cursor_pass"(rx547_pos, "variable_declarator")
    rx547_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx547_pos)
    .return (rx547_cur)
  rx547_fail:
.annotate "line", 4
    (rx547_rep, rx547_pos, $I10, $P10) = rx547_cur."!mark_fail"(0)
    lt rx547_pos, -1, rx547_done
    eq rx547_pos, -1, rx547_fail
    jump $I10
  rx547_done:
    rx547_cur."!cursor_fail"()
    rx547_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx547_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("132_1259078882.26523") :method
.annotate "line", 4
    $P549 = self."!PREFIX__!subrule"("variable", "")
    new $P550, "ResizablePMCArray"
    push $P550, $P549
    .return ($P550)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("133_1259078882.26523") :method
.annotate "line", 254
    $P553 = self."!protoregex"("routine_declarator")
    .return ($P553)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("134_1259078882.26523") :method
.annotate "line", 254
    $P555 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P555)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("135_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx557_tgt
    .local int rx557_pos
    .local int rx557_off
    .local int rx557_eos
    .local int rx557_rep
    .local pmc rx557_cur
    (rx557_cur, rx557_pos, rx557_tgt) = self."!cursor_start"()
    rx557_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx557_cur
    .local pmc match
    .lex "$/", match
    length rx557_eos, rx557_tgt
    set rx557_off, 0
    lt rx557_pos, 2, rx557_start
    sub rx557_off, rx557_pos, 1
    substr rx557_tgt, rx557_tgt, rx557_off
  rx557_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan561_done
    goto rxscan561_scan
  rxscan561_loop:
    ($P10) = rx557_cur."from"()
    inc $P10
    set rx557_pos, $P10
    ge rx557_pos, rx557_eos, rxscan561_done
  rxscan561_scan:
    set_addr $I10, rxscan561_loop
    rx557_cur."!mark_push"(0, rx557_pos, $I10)
  rxscan561_done:
.annotate "line", 255
  # rx subcapture "sym"
    set_addr $I10, rxcap_562_fail
    rx557_cur."!mark_push"(0, rx557_pos, $I10)
  # rx literal  "sub"
    add $I11, rx557_pos, 3
    gt $I11, rx557_eos, rx557_fail
    sub $I11, rx557_pos, rx557_off
    substr $S10, rx557_tgt, $I11, 3
    ne $S10, "sub", rx557_fail
    add rx557_pos, 3
    set_addr $I10, rxcap_562_fail
    ($I12, $I11) = rx557_cur."!mark_peek"($I10)
    rx557_cur."!cursor_pos"($I11)
    ($P10) = rx557_cur."!cursor_start"()
    $P10."!cursor_pass"(rx557_pos, "")
    rx557_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_562_done
  rxcap_562_fail:
    goto rx557_fail
  rxcap_562_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx557_cur."!cursor_pos"(rx557_pos)
    $P10 = rx557_cur."routine_def"()
    unless $P10, rx557_fail
    rx557_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx557_pos = $P10."pos"()
  # rx pass
    rx557_cur."!cursor_pass"(rx557_pos, "routine_declarator:sym<sub>")
    rx557_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx557_pos)
    .return (rx557_cur)
  rx557_fail:
.annotate "line", 4
    (rx557_rep, rx557_pos, $I10, $P10) = rx557_cur."!mark_fail"(0)
    lt rx557_pos, -1, rx557_done
    eq rx557_pos, -1, rx557_fail
    jump $I10
  rx557_done:
    rx557_cur."!cursor_fail"()
    rx557_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx557_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("136_1259078882.26523") :method
.annotate "line", 4
    $P559 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P560, "ResizablePMCArray"
    push $P560, $P559
    .return ($P560)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("137_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx564_tgt
    .local int rx564_pos
    .local int rx564_off
    .local int rx564_eos
    .local int rx564_rep
    .local pmc rx564_cur
    (rx564_cur, rx564_pos, rx564_tgt) = self."!cursor_start"()
    rx564_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx564_cur
    .local pmc match
    .lex "$/", match
    length rx564_eos, rx564_tgt
    set rx564_off, 0
    lt rx564_pos, 2, rx564_start
    sub rx564_off, rx564_pos, 1
    substr rx564_tgt, rx564_tgt, rx564_off
  rx564_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan568_done
    goto rxscan568_scan
  rxscan568_loop:
    ($P10) = rx564_cur."from"()
    inc $P10
    set rx564_pos, $P10
    ge rx564_pos, rx564_eos, rxscan568_done
  rxscan568_scan:
    set_addr $I10, rxscan568_loop
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
  rxscan568_done:
.annotate "line", 256
  # rx subcapture "sym"
    set_addr $I10, rxcap_569_fail
    rx564_cur."!mark_push"(0, rx564_pos, $I10)
  # rx literal  "method"
    add $I11, rx564_pos, 6
    gt $I11, rx564_eos, rx564_fail
    sub $I11, rx564_pos, rx564_off
    substr $S10, rx564_tgt, $I11, 6
    ne $S10, "method", rx564_fail
    add rx564_pos, 6
    set_addr $I10, rxcap_569_fail
    ($I12, $I11) = rx564_cur."!mark_peek"($I10)
    rx564_cur."!cursor_pos"($I11)
    ($P10) = rx564_cur."!cursor_start"()
    $P10."!cursor_pass"(rx564_pos, "")
    rx564_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_569_done
  rxcap_569_fail:
    goto rx564_fail
  rxcap_569_done:
  # rx subrule "method_def" subtype=capture negate=
    rx564_cur."!cursor_pos"(rx564_pos)
    $P10 = rx564_cur."method_def"()
    unless $P10, rx564_fail
    rx564_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx564_pos = $P10."pos"()
  # rx pass
    rx564_cur."!cursor_pass"(rx564_pos, "routine_declarator:sym<method>")
    rx564_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx564_pos)
    .return (rx564_cur)
  rx564_fail:
.annotate "line", 4
    (rx564_rep, rx564_pos, $I10, $P10) = rx564_cur."!mark_fail"(0)
    lt rx564_pos, -1, rx564_done
    eq rx564_pos, -1, rx564_fail
    jump $I10
  rx564_done:
    rx564_cur."!cursor_fail"()
    rx564_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx564_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("138_1259078882.26523") :method
.annotate "line", 4
    $P566 = self."!PREFIX__!subrule"("method_def", "method")
    new $P567, "ResizablePMCArray"
    push $P567, $P566
    .return ($P567)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("139_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx571_tgt
    .local int rx571_pos
    .local int rx571_off
    .local int rx571_eos
    .local int rx571_rep
    .local pmc rx571_cur
    (rx571_cur, rx571_pos, rx571_tgt) = self."!cursor_start"()
    rx571_cur."!cursor_debug"("START ", "routine_def")
    rx571_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx571_cur
    .local pmc match
    .lex "$/", match
    length rx571_eos, rx571_tgt
    set rx571_off, 0
    lt rx571_pos, 2, rx571_start
    sub rx571_off, rx571_pos, 1
    substr rx571_tgt, rx571_tgt, rx571_off
  rx571_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan574_done
    goto rxscan574_scan
  rxscan574_loop:
    ($P10) = rx571_cur."from"()
    inc $P10
    set rx571_pos, $P10
    ge rx571_pos, rx571_eos, rxscan574_done
  rxscan574_scan:
    set_addr $I10, rxscan574_loop
    rx571_cur."!mark_push"(0, rx571_pos, $I10)
  rxscan574_done:
.annotate "line", 258
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
.annotate "line", 259
  # rx rxquantr576 ** 0..1
    set_addr $I577, rxquantr576_done
    rx571_cur."!mark_push"(0, rx571_pos, $I577)
  rxquantr576_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."deflongname"()
    unless $P10, rx571_fail
    rx571_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx571_pos = $P10."pos"()
    (rx571_rep) = rx571_cur."!mark_commit"($I577)
  rxquantr576_done:
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
.annotate "line", 260
  # rx subrule "newpad" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."newpad"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
  alt580_0:
.annotate "line", 261
    set_addr $I10, alt580_1
    rx571_cur."!mark_push"(0, rx571_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx571_pos, 1
    gt $I11, rx571_eos, rx571_fail
    sub $I11, rx571_pos, rx571_off
    substr $S10, rx571_tgt, $I11, 1
    ne $S10, "(", rx571_fail
    add rx571_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."signature"()
    unless $P10, rx571_fail
    rx571_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx571_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx571_pos, 1
    gt $I11, rx571_eos, rx571_fail
    sub $I11, rx571_pos, rx571_off
    substr $S10, rx571_tgt, $I11, 1
    ne $S10, ")", rx571_fail
    add rx571_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
    goto alt580_end
  alt580_1:
.annotate "line", 262
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
  alt580_end:
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
.annotate "line", 263
  # rx subrule "blockoid" subtype=capture negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."blockoid"()
    unless $P10, rx571_fail
    rx571_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx571_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx571_cur."!cursor_pos"(rx571_pos)
    $P10 = rx571_cur."ws"()
    unless $P10, rx571_fail
    rx571_pos = $P10."pos"()
.annotate "line", 258
  # rx pass
    rx571_cur."!cursor_pass"(rx571_pos, "routine_def")
    rx571_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx571_pos)
    .return (rx571_cur)
  rx571_fail:
.annotate "line", 4
    (rx571_rep, rx571_pos, $I10, $P10) = rx571_cur."!mark_fail"(0)
    lt rx571_pos, -1, rx571_done
    eq rx571_pos, -1, rx571_fail
    jump $I10
  rx571_done:
    rx571_cur."!cursor_fail"()
    rx571_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx571_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("140_1259078882.26523") :method
.annotate "line", 4
    new $P573, "ResizablePMCArray"
    push $P573, ""
    .return ($P573)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("141_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx590_tgt
    .local int rx590_pos
    .local int rx590_off
    .local int rx590_eos
    .local int rx590_rep
    .local pmc rx590_cur
    (rx590_cur, rx590_pos, rx590_tgt) = self."!cursor_start"()
    rx590_cur."!cursor_debug"("START ", "method_def")
    rx590_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx590_cur
    .local pmc match
    .lex "$/", match
    length rx590_eos, rx590_tgt
    set rx590_off, 0
    lt rx590_pos, 2, rx590_start
    sub rx590_off, rx590_pos, 1
    substr rx590_tgt, rx590_tgt, rx590_off
  rx590_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan593_done
    goto rxscan593_scan
  rxscan593_loop:
    ($P10) = rx590_cur."from"()
    inc $P10
    set rx590_pos, $P10
    ge rx590_pos, rx590_eos, rxscan593_done
  rxscan593_scan:
    set_addr $I10, rxscan593_loop
    rx590_cur."!mark_push"(0, rx590_pos, $I10)
  rxscan593_done:
.annotate "line", 266
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
.annotate "line", 267
  # rx rxquantr595 ** 0..1
    set_addr $I596, rxquantr595_done
    rx590_cur."!mark_push"(0, rx590_pos, $I596)
  rxquantr595_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."deflongname"()
    unless $P10, rx590_fail
    rx590_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx590_pos = $P10."pos"()
    (rx590_rep) = rx590_cur."!mark_commit"($I596)
  rxquantr595_done:
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
.annotate "line", 268
  # rx subrule "newpad" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."newpad"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  alt599_0:
.annotate "line", 269
    set_addr $I10, alt599_1
    rx590_cur."!mark_push"(0, rx590_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx590_pos, 1
    gt $I11, rx590_eos, rx590_fail
    sub $I11, rx590_pos, rx590_off
    substr $S10, rx590_tgt, $I11, 1
    ne $S10, "(", rx590_fail
    add rx590_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."signature"()
    unless $P10, rx590_fail
    rx590_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx590_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx590_pos, 1
    gt $I11, rx590_eos, rx590_fail
    sub $I11, rx590_pos, rx590_off
    substr $S10, rx590_tgt, $I11, 1
    ne $S10, ")", rx590_fail
    add rx590_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
    goto alt599_end
  alt599_1:
.annotate "line", 270
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
  alt599_end:
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
.annotate "line", 271
  # rx subrule "blockoid" subtype=capture negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."blockoid"()
    unless $P10, rx590_fail
    rx590_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx590_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx590_cur."!cursor_pos"(rx590_pos)
    $P10 = rx590_cur."ws"()
    unless $P10, rx590_fail
    rx590_pos = $P10."pos"()
.annotate "line", 266
  # rx pass
    rx590_cur."!cursor_pass"(rx590_pos, "method_def")
    rx590_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx590_pos)
    .return (rx590_cur)
  rx590_fail:
.annotate "line", 4
    (rx590_rep, rx590_pos, $I10, $P10) = rx590_cur."!mark_fail"(0)
    lt rx590_pos, -1, rx590_done
    eq rx590_pos, -1, rx590_fail
    jump $I10
  rx590_done:
    rx590_cur."!cursor_fail"()
    rx590_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx590_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("142_1259078882.26523") :method
.annotate "line", 4
    new $P592, "ResizablePMCArray"
    push $P592, ""
    .return ($P592)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("143_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx609_tgt
    .local int rx609_pos
    .local int rx609_off
    .local int rx609_eos
    .local int rx609_rep
    .local pmc rx609_cur
    (rx609_cur, rx609_pos, rx609_tgt) = self."!cursor_start"()
    rx609_cur."!cursor_debug"("START ", "signature")
    rx609_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx609_cur
    .local pmc match
    .lex "$/", match
    length rx609_eos, rx609_tgt
    set rx609_off, 0
    lt rx609_pos, 2, rx609_start
    sub rx609_off, rx609_pos, 1
    substr rx609_tgt, rx609_tgt, rx609_off
  rx609_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan612_done
    goto rxscan612_scan
  rxscan612_loop:
    ($P10) = rx609_cur."from"()
    inc $P10
    set rx609_pos, $P10
    ge rx609_pos, rx609_eos, rxscan612_done
  rxscan612_scan:
    set_addr $I10, rxscan612_loop
    rx609_cur."!mark_push"(0, rx609_pos, $I10)
  rxscan612_done:
.annotate "line", 274
  # rx rxquantr613 ** 0..1
    set_addr $I616, rxquantr613_done
    rx609_cur."!mark_push"(0, rx609_pos, $I616)
  rxquantr613_loop:
  # rx rxquantr614 ** 1..*
    set_addr $I615, rxquantr614_done
    rx609_cur."!mark_push"(0, -1, $I615)
  rxquantr614_loop:
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."parameter"()
    unless $P10, rx609_fail
    rx609_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx609_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx609_cur."!cursor_pos"(rx609_pos)
    $P10 = rx609_cur."ws"()
    unless $P10, rx609_fail
    rx609_pos = $P10."pos"()
    (rx609_rep) = rx609_cur."!mark_commit"($I615)
    rx609_cur."!mark_push"(rx609_rep, rx609_pos, $I615)
  # rx literal  ","
    add $I11, rx609_pos, 1
    gt $I11, rx609_eos, rx609_fail
    sub $I11, rx609_pos, rx609_off
    substr $S10, rx609_tgt, $I11, 1
    ne $S10, ",", rx609_fail
    add rx609_pos, 1
    goto rxquantr614_loop
  rxquantr614_done:
    (rx609_rep) = rx609_cur."!mark_commit"($I616)
  rxquantr613_done:
  # rx pass
    rx609_cur."!cursor_pass"(rx609_pos, "signature")
    rx609_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx609_pos)
    .return (rx609_cur)
  rx609_fail:
.annotate "line", 4
    (rx609_rep, rx609_pos, $I10, $P10) = rx609_cur."!mark_fail"(0)
    lt rx609_pos, -1, rx609_done
    eq rx609_pos, -1, rx609_fail
    jump $I10
  rx609_done:
    rx609_cur."!cursor_fail"()
    rx609_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx609_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("144_1259078882.26523") :method
.annotate "line", 4
    new $P611, "ResizablePMCArray"
    push $P611, ""
    .return ($P611)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("145_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx618_tgt
    .local int rx618_pos
    .local int rx618_off
    .local int rx618_eos
    .local int rx618_rep
    .local pmc rx618_cur
    (rx618_cur, rx618_pos, rx618_tgt) = self."!cursor_start"()
    rx618_cur."!cursor_debug"("START ", "parameter")
    rx618_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx618_cur
    .local pmc match
    .lex "$/", match
    length rx618_eos, rx618_tgt
    set rx618_off, 0
    lt rx618_pos, 2, rx618_start
    sub rx618_off, rx618_pos, 1
    substr rx618_tgt, rx618_tgt, rx618_off
  rx618_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan624_done
    goto rxscan624_scan
  rxscan624_loop:
    ($P10) = rx618_cur."from"()
    inc $P10
    set rx618_pos, $P10
    ge rx618_pos, rx618_eos, rxscan624_done
  rxscan624_scan:
    set_addr $I10, rxscan624_loop
    rx618_cur."!mark_push"(0, rx618_pos, $I10)
  rxscan624_done:
  alt625_0:
.annotate "line", 277
    set_addr $I10, alt625_1
    rx618_cur."!mark_push"(0, rx618_pos, $I10)
.annotate "line", 278
  # rx subcapture "quant"
    set_addr $I10, rxcap_626_fail
    rx618_cur."!mark_push"(0, rx618_pos, $I10)
  # rx literal  "*"
    add $I11, rx618_pos, 1
    gt $I11, rx618_eos, rx618_fail
    sub $I11, rx618_pos, rx618_off
    substr $S10, rx618_tgt, $I11, 1
    ne $S10, "*", rx618_fail
    add rx618_pos, 1
    set_addr $I10, rxcap_626_fail
    ($I12, $I11) = rx618_cur."!mark_peek"($I10)
    rx618_cur."!cursor_pos"($I11)
    ($P10) = rx618_cur."!cursor_start"()
    $P10."!cursor_pass"(rx618_pos, "")
    rx618_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_626_done
  rxcap_626_fail:
    goto rx618_fail
  rxcap_626_done:
  # rx subrule "param_var" subtype=capture negate=
    rx618_cur."!cursor_pos"(rx618_pos)
    $P10 = rx618_cur."param_var"()
    unless $P10, rx618_fail
    rx618_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx618_pos = $P10."pos"()
    goto alt625_end
  alt625_1:
  alt627_0:
.annotate "line", 279
    set_addr $I10, alt627_1
    rx618_cur."!mark_push"(0, rx618_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx618_cur."!cursor_pos"(rx618_pos)
    $P10 = rx618_cur."param_var"()
    unless $P10, rx618_fail
    rx618_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx618_pos = $P10."pos"()
    goto alt627_end
  alt627_1:
  # rx subrule "named_param" subtype=capture negate=
    rx618_cur."!cursor_pos"(rx618_pos)
    $P10 = rx618_cur."named_param"()
    unless $P10, rx618_fail
    rx618_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx618_pos = $P10."pos"()
  alt627_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_629_fail
    rx618_cur."!mark_push"(0, rx618_pos, $I10)
  alt628_0:
    set_addr $I10, alt628_1
    rx618_cur."!mark_push"(0, rx618_pos, $I10)
  # rx literal  "?"
    add $I11, rx618_pos, 1
    gt $I11, rx618_eos, rx618_fail
    sub $I11, rx618_pos, rx618_off
    substr $S10, rx618_tgt, $I11, 1
    ne $S10, "?", rx618_fail
    add rx618_pos, 1
    goto alt628_end
  alt628_1:
    set_addr $I10, alt628_2
    rx618_cur."!mark_push"(0, rx618_pos, $I10)
  # rx literal  "!"
    add $I11, rx618_pos, 1
    gt $I11, rx618_eos, rx618_fail
    sub $I11, rx618_pos, rx618_off
    substr $S10, rx618_tgt, $I11, 1
    ne $S10, "!", rx618_fail
    add rx618_pos, 1
    goto alt628_end
  alt628_2:
  alt628_end:
    set_addr $I10, rxcap_629_fail
    ($I12, $I11) = rx618_cur."!mark_peek"($I10)
    rx618_cur."!cursor_pos"($I11)
    ($P10) = rx618_cur."!cursor_start"()
    $P10."!cursor_pass"(rx618_pos, "")
    rx618_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_629_done
  rxcap_629_fail:
    goto rx618_fail
  rxcap_629_done:
  alt625_end:
.annotate "line", 281
  # rx rxquantr630 ** 0..1
    set_addr $I631, rxquantr630_done
    rx618_cur."!mark_push"(0, rx618_pos, $I631)
  rxquantr630_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx618_cur."!cursor_pos"(rx618_pos)
    $P10 = rx618_cur."default_value"()
    unless $P10, rx618_fail
    rx618_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx618_pos = $P10."pos"()
    (rx618_rep) = rx618_cur."!mark_commit"($I631)
  rxquantr630_done:
.annotate "line", 276
  # rx pass
    rx618_cur."!cursor_pass"(rx618_pos, "parameter")
    rx618_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx618_pos)
    .return (rx618_cur)
  rx618_fail:
.annotate "line", 4
    (rx618_rep, rx618_pos, $I10, $P10) = rx618_cur."!mark_fail"(0)
    lt rx618_pos, -1, rx618_done
    eq rx618_pos, -1, rx618_fail
    jump $I10
  rx618_done:
    rx618_cur."!cursor_fail"()
    rx618_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx618_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("146_1259078882.26523") :method
.annotate "line", 4
    $P620 = self."!PREFIX__!subrule"("named_param", "")
    $P621 = self."!PREFIX__!subrule"("param_var", "")
    $P622 = self."!PREFIX__!subrule"("param_var", "*")
    new $P623, "ResizablePMCArray"
    push $P623, $P620
    push $P623, $P621
    push $P623, $P622
    .return ($P623)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("147_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx633_tgt
    .local int rx633_pos
    .local int rx633_off
    .local int rx633_eos
    .local int rx633_rep
    .local pmc rx633_cur
    (rx633_cur, rx633_pos, rx633_tgt) = self."!cursor_start"()
    rx633_cur."!cursor_debug"("START ", "param_var")
    rx633_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx633_cur
    .local pmc match
    .lex "$/", match
    length rx633_eos, rx633_tgt
    set rx633_off, 0
    lt rx633_pos, 2, rx633_start
    sub rx633_off, rx633_pos, 1
    substr rx633_tgt, rx633_tgt, rx633_off
  rx633_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan637_done
    goto rxscan637_scan
  rxscan637_loop:
    ($P10) = rx633_cur."from"()
    inc $P10
    set rx633_pos, $P10
    ge rx633_pos, rx633_eos, rxscan637_done
  rxscan637_scan:
    set_addr $I10, rxscan637_loop
    rx633_cur."!mark_push"(0, rx633_pos, $I10)
  rxscan637_done:
.annotate "line", 285
  # rx subrule "sigil" subtype=capture negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."sigil"()
    unless $P10, rx633_fail
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx633_pos = $P10."pos"()
  # rx rxquantr638 ** 0..1
    set_addr $I639, rxquantr638_done
    rx633_cur."!mark_push"(0, rx633_pos, $I639)
  rxquantr638_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."twigil"()
    unless $P10, rx633_fail
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx633_pos = $P10."pos"()
    (rx633_rep) = rx633_cur."!mark_commit"($I639)
  rxquantr638_done:
  alt640_0:
.annotate "line", 286
    set_addr $I10, alt640_1
    rx633_cur."!mark_push"(0, rx633_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx633_cur."!cursor_pos"(rx633_pos)
    $P10 = rx633_cur."ident"()
    unless $P10, rx633_fail
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx633_pos = $P10."pos"()
    goto alt640_end
  alt640_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_641_fail
    rx633_cur."!mark_push"(0, rx633_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx633_pos, rx633_eos, rx633_fail
    sub $I10, rx633_pos, rx633_off
    substr $S10, rx633_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx633_fail
    inc rx633_pos
    set_addr $I10, rxcap_641_fail
    ($I12, $I11) = rx633_cur."!mark_peek"($I10)
    rx633_cur."!cursor_pos"($I11)
    ($P10) = rx633_cur."!cursor_start"()
    $P10."!cursor_pass"(rx633_pos, "")
    rx633_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_641_done
  rxcap_641_fail:
    goto rx633_fail
  rxcap_641_done:
  alt640_end:
.annotate "line", 284
  # rx pass
    rx633_cur."!cursor_pass"(rx633_pos, "param_var")
    rx633_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx633_pos)
    .return (rx633_cur)
  rx633_fail:
.annotate "line", 4
    (rx633_rep, rx633_pos, $I10, $P10) = rx633_cur."!mark_fail"(0)
    lt rx633_pos, -1, rx633_done
    eq rx633_pos, -1, rx633_fail
    jump $I10
  rx633_done:
    rx633_cur."!cursor_fail"()
    rx633_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx633_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("148_1259078882.26523") :method
.annotate "line", 4
    $P635 = self."!PREFIX__!subrule"("sigil", "")
    new $P636, "ResizablePMCArray"
    push $P636, $P635
    .return ($P636)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("149_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx643_tgt
    .local int rx643_pos
    .local int rx643_off
    .local int rx643_eos
    .local int rx643_rep
    .local pmc rx643_cur
    (rx643_cur, rx643_pos, rx643_tgt) = self."!cursor_start"()
    rx643_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx643_cur
    .local pmc match
    .lex "$/", match
    length rx643_eos, rx643_tgt
    set rx643_off, 0
    lt rx643_pos, 2, rx643_start
    sub rx643_off, rx643_pos, 1
    substr rx643_tgt, rx643_tgt, rx643_off
  rx643_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan647_done
    goto rxscan647_scan
  rxscan647_loop:
    ($P10) = rx643_cur."from"()
    inc $P10
    set rx643_pos, $P10
    ge rx643_pos, rx643_eos, rxscan647_done
  rxscan647_scan:
    set_addr $I10, rxscan647_loop
    rx643_cur."!mark_push"(0, rx643_pos, $I10)
  rxscan647_done:
.annotate "line", 290
  # rx literal  ":"
    add $I11, rx643_pos, 1
    gt $I11, rx643_eos, rx643_fail
    sub $I11, rx643_pos, rx643_off
    substr $S10, rx643_tgt, $I11, 1
    ne $S10, ":", rx643_fail
    add rx643_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx643_cur."!cursor_pos"(rx643_pos)
    $P10 = rx643_cur."param_var"()
    unless $P10, rx643_fail
    rx643_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx643_pos = $P10."pos"()
.annotate "line", 289
  # rx pass
    rx643_cur."!cursor_pass"(rx643_pos, "named_param")
    rx643_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx643_pos)
    .return (rx643_cur)
  rx643_fail:
.annotate "line", 4
    (rx643_rep, rx643_pos, $I10, $P10) = rx643_cur."!mark_fail"(0)
    lt rx643_pos, -1, rx643_done
    eq rx643_pos, -1, rx643_fail
    jump $I10
  rx643_done:
    rx643_cur."!cursor_fail"()
    rx643_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx643_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("150_1259078882.26523") :method
.annotate "line", 4
    $P645 = self."!PREFIX__!subrule"("param_var", ":")
    new $P646, "ResizablePMCArray"
    push $P646, $P645
    .return ($P646)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("151_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx649_tgt
    .local int rx649_pos
    .local int rx649_off
    .local int rx649_eos
    .local int rx649_rep
    .local pmc rx649_cur
    (rx649_cur, rx649_pos, rx649_tgt) = self."!cursor_start"()
    rx649_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx649_cur
    .local pmc match
    .lex "$/", match
    length rx649_eos, rx649_tgt
    set rx649_off, 0
    lt rx649_pos, 2, rx649_start
    sub rx649_off, rx649_pos, 1
    substr rx649_tgt, rx649_tgt, rx649_off
  rx649_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan652_done
    goto rxscan652_scan
  rxscan652_loop:
    ($P10) = rx649_cur."from"()
    inc $P10
    set rx649_pos, $P10
    ge rx649_pos, rx649_eos, rxscan652_done
  rxscan652_scan:
    set_addr $I10, rxscan652_loop
    rx649_cur."!mark_push"(0, rx649_pos, $I10)
  rxscan652_done:
.annotate "line", 293
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx649_pos, 1
    gt $I11, rx649_eos, rx649_fail
    sub $I11, rx649_pos, rx649_off
    substr $S10, rx649_tgt, $I11, 1
    ne $S10, "=", rx649_fail
    add rx649_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."EXPR"("i=")
    unless $P10, rx649_fail
    rx649_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx649_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx649_cur."!cursor_pos"(rx649_pos)
    $P10 = rx649_cur."ws"()
    unless $P10, rx649_fail
    rx649_pos = $P10."pos"()
  # rx pass
    rx649_cur."!cursor_pass"(rx649_pos, "default_value")
    rx649_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx649_pos)
    .return (rx649_cur)
  rx649_fail:
.annotate "line", 4
    (rx649_rep, rx649_pos, $I10, $P10) = rx649_cur."!mark_fail"(0)
    lt rx649_pos, -1, rx649_done
    eq rx649_pos, -1, rx649_fail
    jump $I10
  rx649_done:
    rx649_cur."!cursor_fail"()
    rx649_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx649_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("152_1259078882.26523") :method
.annotate "line", 4
    new $P651, "ResizablePMCArray"
    push $P651, ""
    .return ($P651)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("153_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx657_tgt
    .local int rx657_pos
    .local int rx657_off
    .local int rx657_eos
    .local int rx657_rep
    .local pmc rx657_cur
    (rx657_cur, rx657_pos, rx657_tgt) = self."!cursor_start"()
    rx657_cur."!cursor_debug"("START ", "regex_declarator")
    rx657_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx657_cur
    .local pmc match
    .lex "$/", match
    length rx657_eos, rx657_tgt
    set rx657_off, 0
    lt rx657_pos, 2, rx657_start
    sub rx657_off, rx657_pos, 1
    substr rx657_tgt, rx657_tgt, rx657_off
  rx657_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan660_done
    goto rxscan660_scan
  rxscan660_loop:
    ($P10) = rx657_cur."from"()
    inc $P10
    set rx657_pos, $P10
    ge rx657_pos, rx657_eos, rxscan660_done
  rxscan660_scan:
    set_addr $I10, rxscan660_loop
    rx657_cur."!mark_push"(0, rx657_pos, $I10)
  rxscan660_done:
.annotate "line", 295
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  alt662_0:
.annotate "line", 296
    set_addr $I10, alt662_1
    rx657_cur."!mark_push"(0, rx657_pos, $I10)
.annotate "line", 297
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_664_fail
    rx657_cur."!mark_push"(0, rx657_pos, $I10)
  # rx literal  "proto"
    add $I11, rx657_pos, 5
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 5
    ne $S10, "proto", rx657_fail
    add rx657_pos, 5
    set_addr $I10, rxcap_664_fail
    ($I12, $I11) = rx657_cur."!mark_peek"($I10)
    rx657_cur."!cursor_pos"($I11)
    ($P10) = rx657_cur."!cursor_start"()
    $P10."!cursor_pass"(rx657_pos, "")
    rx657_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_664_done
  rxcap_664_fail:
    goto rx657_fail
  rxcap_664_done:
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  alt666_0:
    set_addr $I10, alt666_1
    rx657_cur."!mark_push"(0, rx657_pos, $I10)
  # rx literal  "regex"
    add $I11, rx657_pos, 5
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 5
    ne $S10, "regex", rx657_fail
    add rx657_pos, 5
    goto alt666_end
  alt666_1:
    set_addr $I10, alt666_2
    rx657_cur."!mark_push"(0, rx657_pos, $I10)
  # rx literal  "token"
    add $I11, rx657_pos, 5
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 5
    ne $S10, "token", rx657_fail
    add rx657_pos, 5
    goto alt666_end
  alt666_2:
  # rx literal  "rule"
    add $I11, rx657_pos, 4
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 4
    ne $S10, "rule", rx657_fail
    add rx657_pos, 4
  alt666_end:
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 298
  # rx subrule "deflongname" subtype=capture negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."deflongname"()
    unless $P10, rx657_fail
    rx657_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx657_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 299
  # rx literal  "{"
    add $I11, rx657_pos, 1
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 1
    ne $S10, "{", rx657_fail
    add rx657_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx657_pos, 5
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 5
    ne $S10, "<...>", rx657_fail
    add rx657_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx657_pos, 1
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 1
    ne $S10, "}", rx657_fail
    add rx657_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ENDSTMT"()
    unless $P10, rx657_fail
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 297
    goto alt662_end
  alt662_1:
.annotate "line", 300
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_674_fail
    rx657_cur."!mark_push"(0, rx657_pos, $I10)
  alt673_0:
    set_addr $I10, alt673_1
    rx657_cur."!mark_push"(0, rx657_pos, $I10)
  # rx literal  "regex"
    add $I11, rx657_pos, 5
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 5
    ne $S10, "regex", rx657_fail
    add rx657_pos, 5
    goto alt673_end
  alt673_1:
    set_addr $I10, alt673_2
    rx657_cur."!mark_push"(0, rx657_pos, $I10)
  # rx literal  "token"
    add $I11, rx657_pos, 5
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 5
    ne $S10, "token", rx657_fail
    add rx657_pos, 5
    goto alt673_end
  alt673_2:
  # rx literal  "rule"
    add $I11, rx657_pos, 4
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 4
    ne $S10, "rule", rx657_fail
    add rx657_pos, 4
  alt673_end:
    set_addr $I10, rxcap_674_fail
    ($I12, $I11) = rx657_cur."!mark_peek"($I10)
    rx657_cur."!cursor_pos"($I11)
    ($P10) = rx657_cur."!cursor_start"()
    $P10."!cursor_pass"(rx657_pos, "")
    rx657_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_674_done
  rxcap_674_fail:
    goto rx657_fail
  rxcap_674_done:
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 301
  # rx subrule "deflongname" subtype=capture negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."deflongname"()
    unless $P10, rx657_fail
    rx657_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx657_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 302
  # rx subrule "newpad" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."newpad"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 303
  # rx rxquantr678 ** 0..1
    set_addr $I683, rxquantr678_done
    rx657_cur."!mark_push"(0, rx657_pos, $I683)
  rxquantr678_loop:
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx657_pos, 1
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 1
    ne $S10, "(", rx657_fail
    add rx657_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."signature"()
    unless $P10, rx657_fail
    rx657_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx657_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx657_pos, 1
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 1
    ne $S10, ")", rx657_fail
    add rx657_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
    (rx657_rep) = rx657_cur."!mark_commit"($I683)
  rxquantr678_done:
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 304
  # rx reduce name="regex_declarator" key="open"
    rx657_cur."!cursor_pos"(rx657_pos)
    rx657_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 305
  # rx literal  "{"
    add $I11, rx657_pos, 1
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 1
    ne $S10, "{", rx657_fail
    add rx657_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."LANG"("Regex", "nibbler")
    unless $P10, rx657_fail
    rx657_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx657_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx657_pos, 1
    gt $I11, rx657_eos, rx657_fail
    sub $I11, rx657_pos, rx657_off
    substr $S10, rx657_tgt, $I11, 1
    ne $S10, "}", rx657_fail
    add rx657_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ENDSTMT"()
    unless $P10, rx657_fail
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
  alt662_end:
.annotate "line", 306
  # rx subrule "ws" subtype=method negate=
    rx657_cur."!cursor_pos"(rx657_pos)
    $P10 = rx657_cur."ws"()
    unless $P10, rx657_fail
    rx657_pos = $P10."pos"()
.annotate "line", 295
  # rx pass
    rx657_cur."!cursor_pass"(rx657_pos, "regex_declarator")
    rx657_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx657_pos)
    .return (rx657_cur)
  rx657_fail:
.annotate "line", 4
    (rx657_rep, rx657_pos, $I10, $P10) = rx657_cur."!mark_fail"(0)
    lt rx657_pos, -1, rx657_done
    eq rx657_pos, -1, rx657_fail
    jump $I10
  rx657_done:
    rx657_cur."!cursor_fail"()
    rx657_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx657_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("154_1259078882.26523") :method
.annotate "line", 4
    new $P659, "ResizablePMCArray"
    push $P659, ""
    .return ($P659)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("155_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx689_tgt
    .local int rx689_pos
    .local int rx689_off
    .local int rx689_eos
    .local int rx689_rep
    .local pmc rx689_cur
    (rx689_cur, rx689_pos, rx689_tgt) = self."!cursor_start"()
    rx689_cur."!cursor_debug"("START ", "dotty")
    rx689_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx689_cur
    .local pmc match
    .lex "$/", match
    length rx689_eos, rx689_tgt
    set rx689_off, 0
    lt rx689_pos, 2, rx689_start
    sub rx689_off, rx689_pos, 1
    substr rx689_tgt, rx689_tgt, rx689_off
  rx689_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan693_done
    goto rxscan693_scan
  rxscan693_loop:
    ($P10) = rx689_cur."from"()
    inc $P10
    set rx689_pos, $P10
    ge rx689_pos, rx689_eos, rxscan693_done
  rxscan693_scan:
    set_addr $I10, rxscan693_loop
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  rxscan693_done:
.annotate "line", 310
  # rx literal  "."
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, ".", rx689_fail
    add rx689_pos, 1
  alt694_0:
.annotate "line", 311
    set_addr $I10, alt694_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."identifier"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx689_pos = $P10."pos"()
    goto alt694_end
  alt694_1:
.annotate "line", 312
  # rx enumcharlist negate=0 zerowidth
    ge rx689_pos, rx689_eos, rx689_fail
    sub $I10, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx689_fail
  # rx subrule "quote" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."quote"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx689_pos = $P10."pos"()
  alt695_0:
.annotate "line", 313
    set_addr $I10, alt695_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx689_pos, rx689_eos, rx689_fail
    sub $I10, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx689_fail
    goto alt695_end
  alt695_1:
  # rx subrule "panic" subtype=method negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx689_fail
    rx689_pos = $P10."pos"()
  alt695_end:
  alt694_end:
.annotate "line", 319
  # rx rxquantr696 ** 0..1
    set_addr $I698, rxquantr696_done
    rx689_cur."!mark_push"(0, rx689_pos, $I698)
  rxquantr696_loop:
  alt697_0:
.annotate "line", 316
    set_addr $I10, alt697_1
    rx689_cur."!mark_push"(0, rx689_pos, $I10)
.annotate "line", 317
  # rx enumcharlist negate=0 zerowidth
    ge rx689_pos, rx689_eos, rx689_fail
    sub $I10, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx689_fail
  # rx subrule "args" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."args"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx689_pos = $P10."pos"()
    goto alt697_end
  alt697_1:
.annotate "line", 318
  # rx literal  ":"
    add $I11, rx689_pos, 1
    gt $I11, rx689_eos, rx689_fail
    sub $I11, rx689_pos, rx689_off
    substr $S10, rx689_tgt, $I11, 1
    ne $S10, ":", rx689_fail
    add rx689_pos, 1
  # rx charclass s
    ge rx689_pos, rx689_eos, rx689_fail
    sub $I10, rx689_pos, rx689_off
    is_cclass $I11, 32, rx689_tgt, $I10
    unless $I11, rx689_fail
    inc rx689_pos
  # rx subrule "arglist" subtype=capture negate=
    rx689_cur."!cursor_pos"(rx689_pos)
    $P10 = rx689_cur."arglist"()
    unless $P10, rx689_fail
    rx689_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx689_pos = $P10."pos"()
  alt697_end:
.annotate "line", 319
    (rx689_rep) = rx689_cur."!mark_commit"($I698)
  rxquantr696_done:
.annotate "line", 309
  # rx pass
    rx689_cur."!cursor_pass"(rx689_pos, "dotty")
    rx689_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx689_pos)
    .return (rx689_cur)
  rx689_fail:
.annotate "line", 4
    (rx689_rep, rx689_pos, $I10, $P10) = rx689_cur."!mark_fail"(0)
    lt rx689_pos, -1, rx689_done
    eq rx689_pos, -1, rx689_fail
    jump $I10
  rx689_done:
    rx689_cur."!cursor_fail"()
    rx689_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx689_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("156_1259078882.26523") :method
.annotate "line", 4
    $P691 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P692, "ResizablePMCArray"
    push $P692, "'"
    push $P692, "\""
    push $P692, $P691
    .return ($P692)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("157_1259078882.26523") :method
.annotate "line", 323
    $P700 = self."!protoregex"("term")
    .return ($P700)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("158_1259078882.26523") :method
.annotate "line", 323
    $P702 = self."!PREFIX__!protoregex"("term")
    .return ($P702)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("159_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx704_tgt
    .local int rx704_pos
    .local int rx704_off
    .local int rx704_eos
    .local int rx704_rep
    .local pmc rx704_cur
    (rx704_cur, rx704_pos, rx704_tgt) = self."!cursor_start"()
    rx704_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx704_cur
    .local pmc match
    .lex "$/", match
    length rx704_eos, rx704_tgt
    set rx704_off, 0
    lt rx704_pos, 2, rx704_start
    sub rx704_off, rx704_pos, 1
    substr rx704_tgt, rx704_tgt, rx704_off
  rx704_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan707_done
    goto rxscan707_scan
  rxscan707_loop:
    ($P10) = rx704_cur."from"()
    inc $P10
    set rx704_pos, $P10
    ge rx704_pos, rx704_eos, rxscan707_done
  rxscan707_scan:
    set_addr $I10, rxscan707_loop
    rx704_cur."!mark_push"(0, rx704_pos, $I10)
  rxscan707_done:
.annotate "line", 325
  # rx subcapture "sym"
    set_addr $I10, rxcap_708_fail
    rx704_cur."!mark_push"(0, rx704_pos, $I10)
  # rx literal  "self"
    add $I11, rx704_pos, 4
    gt $I11, rx704_eos, rx704_fail
    sub $I11, rx704_pos, rx704_off
    substr $S10, rx704_tgt, $I11, 4
    ne $S10, "self", rx704_fail
    add rx704_pos, 4
    set_addr $I10, rxcap_708_fail
    ($I12, $I11) = rx704_cur."!mark_peek"($I10)
    rx704_cur."!cursor_pos"($I11)
    ($P10) = rx704_cur."!cursor_start"()
    $P10."!cursor_pass"(rx704_pos, "")
    rx704_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_708_done
  rxcap_708_fail:
    goto rx704_fail
  rxcap_708_done:
  # rxanchor rwb
    le rx704_pos, 0, rx704_fail
    sub $I10, rx704_pos, rx704_off
    is_cclass $I11, 8192, rx704_tgt, $I10
    if $I11, rx704_fail
    dec $I10
    is_cclass $I11, 8192, rx704_tgt, $I10
    unless $I11, rx704_fail
  # rx pass
    rx704_cur."!cursor_pass"(rx704_pos, "term:sym<self>")
    rx704_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx704_pos)
    .return (rx704_cur)
  rx704_fail:
.annotate "line", 4
    (rx704_rep, rx704_pos, $I10, $P10) = rx704_cur."!mark_fail"(0)
    lt rx704_pos, -1, rx704_done
    eq rx704_pos, -1, rx704_fail
    jump $I10
  rx704_done:
    rx704_cur."!cursor_fail"()
    rx704_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx704_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("160_1259078882.26523") :method
.annotate "line", 4
    new $P706, "ResizablePMCArray"
    push $P706, "self"
    .return ($P706)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("161_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx710_tgt
    .local int rx710_pos
    .local int rx710_off
    .local int rx710_eos
    .local int rx710_rep
    .local pmc rx710_cur
    (rx710_cur, rx710_pos, rx710_tgt) = self."!cursor_start"()
    rx710_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx710_cur
    .local pmc match
    .lex "$/", match
    length rx710_eos, rx710_tgt
    set rx710_off, 0
    lt rx710_pos, 2, rx710_start
    sub rx710_off, rx710_pos, 1
    substr rx710_tgt, rx710_tgt, rx710_off
  rx710_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan714_done
    goto rxscan714_scan
  rxscan714_loop:
    ($P10) = rx710_cur."from"()
    inc $P10
    set rx710_pos, $P10
    ge rx710_pos, rx710_eos, rxscan714_done
  rxscan714_scan:
    set_addr $I10, rxscan714_loop
    rx710_cur."!mark_push"(0, rx710_pos, $I10)
  rxscan714_done:
.annotate "line", 328
  # rx subrule "identifier" subtype=capture negate=
    rx710_cur."!cursor_pos"(rx710_pos)
    $P10 = rx710_cur."identifier"()
    unless $P10, rx710_fail
    rx710_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx710_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx710_pos, rx710_eos, rx710_fail
    sub $I10, rx710_pos, rx710_off
    substr $S10, rx710_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx710_fail
  # rx subrule "args" subtype=capture negate=
    rx710_cur."!cursor_pos"(rx710_pos)
    $P10 = rx710_cur."args"()
    unless $P10, rx710_fail
    rx710_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx710_pos = $P10."pos"()
.annotate "line", 327
  # rx pass
    rx710_cur."!cursor_pass"(rx710_pos, "term:sym<identifier>")
    rx710_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx710_pos)
    .return (rx710_cur)
  rx710_fail:
.annotate "line", 4
    (rx710_rep, rx710_pos, $I10, $P10) = rx710_cur."!mark_fail"(0)
    lt rx710_pos, -1, rx710_done
    eq rx710_pos, -1, rx710_fail
    jump $I10
  rx710_done:
    rx710_cur."!cursor_fail"()
    rx710_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx710_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("162_1259078882.26523") :method
.annotate "line", 4
    $P712 = self."!PREFIX__!subrule"("identifier", "")
    new $P713, "ResizablePMCArray"
    push $P713, $P712
    .return ($P713)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("163_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx716_tgt
    .local int rx716_pos
    .local int rx716_off
    .local int rx716_eos
    .local int rx716_rep
    .local pmc rx716_cur
    (rx716_cur, rx716_pos, rx716_tgt) = self."!cursor_start"()
    rx716_cur."!cursor_debug"("START ", "term:sym<name>")
    rx716_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx716_cur
    .local pmc match
    .lex "$/", match
    length rx716_eos, rx716_tgt
    set rx716_off, 0
    lt rx716_pos, 2, rx716_start
    sub rx716_off, rx716_pos, 1
    substr rx716_tgt, rx716_tgt, rx716_off
  rx716_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan720_done
    goto rxscan720_scan
  rxscan720_loop:
    ($P10) = rx716_cur."from"()
    inc $P10
    set rx716_pos, $P10
    ge rx716_pos, rx716_eos, rxscan720_done
  rxscan720_scan:
    set_addr $I10, rxscan720_loop
    rx716_cur."!mark_push"(0, rx716_pos, $I10)
  rxscan720_done:
.annotate "line", 332
  # rx subrule "name" subtype=capture negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."name"()
    unless $P10, rx716_fail
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx716_pos = $P10."pos"()
  # rx rxquantr721 ** 0..1
    set_addr $I722, rxquantr721_done
    rx716_cur."!mark_push"(0, rx716_pos, $I722)
  rxquantr721_loop:
  # rx subrule "args" subtype=capture negate=
    rx716_cur."!cursor_pos"(rx716_pos)
    $P10 = rx716_cur."args"()
    unless $P10, rx716_fail
    rx716_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx716_pos = $P10."pos"()
    (rx716_rep) = rx716_cur."!mark_commit"($I722)
  rxquantr721_done:
.annotate "line", 331
  # rx pass
    rx716_cur."!cursor_pass"(rx716_pos, "term:sym<name>")
    rx716_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx716_pos)
    .return (rx716_cur)
  rx716_fail:
.annotate "line", 4
    (rx716_rep, rx716_pos, $I10, $P10) = rx716_cur."!mark_fail"(0)
    lt rx716_pos, -1, rx716_done
    eq rx716_pos, -1, rx716_fail
    jump $I10
  rx716_done:
    rx716_cur."!cursor_fail"()
    rx716_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx716_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("164_1259078882.26523") :method
.annotate "line", 4
    $P718 = self."!PREFIX__!subrule"("name", "")
    new $P719, "ResizablePMCArray"
    push $P719, $P718
    .return ($P719)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("165_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx724_tgt
    .local int rx724_pos
    .local int rx724_off
    .local int rx724_eos
    .local int rx724_rep
    .local pmc rx724_cur
    (rx724_cur, rx724_pos, rx724_tgt) = self."!cursor_start"()
    rx724_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx724_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx724_cur
    .local pmc match
    .lex "$/", match
    length rx724_eos, rx724_tgt
    set rx724_off, 0
    lt rx724_pos, 2, rx724_start
    sub rx724_off, rx724_pos, 1
    substr rx724_tgt, rx724_tgt, rx724_off
  rx724_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan727_done
    goto rxscan727_scan
  rxscan727_loop:
    ($P10) = rx724_cur."from"()
    inc $P10
    set rx724_pos, $P10
    ge rx724_pos, rx724_eos, rxscan727_done
  rxscan727_scan:
    set_addr $I10, rxscan727_loop
    rx724_cur."!mark_push"(0, rx724_pos, $I10)
  rxscan727_done:
.annotate "line", 336
  # rx literal  "pir::"
    add $I11, rx724_pos, 5
    gt $I11, rx724_eos, rx724_fail
    sub $I11, rx724_pos, rx724_off
    substr $S10, rx724_tgt, $I11, 5
    ne $S10, "pir::", rx724_fail
    add rx724_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_728_fail
    rx724_cur."!mark_push"(0, rx724_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx724_pos, rx724_off
    find_not_cclass $I11, 8192, rx724_tgt, $I10, rx724_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx724_fail
    add rx724_pos, rx724_off, $I11
    set_addr $I10, rxcap_728_fail
    ($I12, $I11) = rx724_cur."!mark_peek"($I10)
    rx724_cur."!cursor_pos"($I11)
    ($P10) = rx724_cur."!cursor_start"()
    $P10."!cursor_pass"(rx724_pos, "")
    rx724_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_728_done
  rxcap_728_fail:
    goto rx724_fail
  rxcap_728_done:
  # rx rxquantr729 ** 0..1
    set_addr $I730, rxquantr729_done
    rx724_cur."!mark_push"(0, rx724_pos, $I730)
  rxquantr729_loop:
  # rx subrule "args" subtype=capture negate=
    rx724_cur."!cursor_pos"(rx724_pos)
    $P10 = rx724_cur."args"()
    unless $P10, rx724_fail
    rx724_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx724_pos = $P10."pos"()
    (rx724_rep) = rx724_cur."!mark_commit"($I730)
  rxquantr729_done:
.annotate "line", 335
  # rx pass
    rx724_cur."!cursor_pass"(rx724_pos, "term:sym<pir::op>")
    rx724_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx724_pos)
    .return (rx724_cur)
  rx724_fail:
.annotate "line", 4
    (rx724_rep, rx724_pos, $I10, $P10) = rx724_cur."!mark_fail"(0)
    lt rx724_pos, -1, rx724_done
    eq rx724_pos, -1, rx724_fail
    jump $I10
  rx724_done:
    rx724_cur."!cursor_fail"()
    rx724_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx724_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("166_1259078882.26523") :method
.annotate "line", 4
    new $P726, "ResizablePMCArray"
    push $P726, "pir::"
    .return ($P726)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("167_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx732_tgt
    .local int rx732_pos
    .local int rx732_off
    .local int rx732_eos
    .local int rx732_rep
    .local pmc rx732_cur
    (rx732_cur, rx732_pos, rx732_tgt) = self."!cursor_start"()
    rx732_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx732_cur
    .local pmc match
    .lex "$/", match
    length rx732_eos, rx732_tgt
    set rx732_off, 0
    lt rx732_pos, 2, rx732_start
    sub rx732_off, rx732_pos, 1
    substr rx732_tgt, rx732_tgt, rx732_off
  rx732_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan736_done
    goto rxscan736_scan
  rxscan736_loop:
    ($P10) = rx732_cur."from"()
    inc $P10
    set rx732_pos, $P10
    ge rx732_pos, rx732_eos, rxscan736_done
  rxscan736_scan:
    set_addr $I10, rxscan736_loop
    rx732_cur."!mark_push"(0, rx732_pos, $I10)
  rxscan736_done:
.annotate "line", 340
  # rx literal  "("
    add $I11, rx732_pos, 1
    gt $I11, rx732_eos, rx732_fail
    sub $I11, rx732_pos, rx732_off
    substr $S10, rx732_tgt, $I11, 1
    ne $S10, "(", rx732_fail
    add rx732_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx732_cur."!cursor_pos"(rx732_pos)
    $P10 = rx732_cur."arglist"()
    unless $P10, rx732_fail
    rx732_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx732_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx732_pos, 1
    gt $I11, rx732_eos, rx732_fail
    sub $I11, rx732_pos, rx732_off
    substr $S10, rx732_tgt, $I11, 1
    ne $S10, ")", rx732_fail
    add rx732_pos, 1
  # rx pass
    rx732_cur."!cursor_pass"(rx732_pos, "args")
    rx732_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx732_pos)
    .return (rx732_cur)
  rx732_fail:
.annotate "line", 4
    (rx732_rep, rx732_pos, $I10, $P10) = rx732_cur."!mark_fail"(0)
    lt rx732_pos, -1, rx732_done
    eq rx732_pos, -1, rx732_fail
    jump $I10
  rx732_done:
    rx732_cur."!cursor_fail"()
    rx732_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx732_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("168_1259078882.26523") :method
.annotate "line", 4
    $P734 = self."!PREFIX__!subrule"("arglist", "(")
    new $P735, "ResizablePMCArray"
    push $P735, $P734
    .return ($P735)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("169_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx738_tgt
    .local int rx738_pos
    .local int rx738_off
    .local int rx738_eos
    .local int rx738_rep
    .local pmc rx738_cur
    (rx738_cur, rx738_pos, rx738_tgt) = self."!cursor_start"()
    rx738_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx738_cur
    .local pmc match
    .lex "$/", match
    length rx738_eos, rx738_tgt
    set rx738_off, 0
    lt rx738_pos, 2, rx738_start
    sub rx738_off, rx738_pos, 1
    substr rx738_tgt, rx738_tgt, rx738_off
  rx738_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan742_done
    goto rxscan742_scan
  rxscan742_loop:
    ($P10) = rx738_cur."from"()
    inc $P10
    set rx738_pos, $P10
    ge rx738_pos, rx738_eos, rxscan742_done
  rxscan742_scan:
    set_addr $I10, rxscan742_loop
    rx738_cur."!mark_push"(0, rx738_pos, $I10)
  rxscan742_done:
.annotate "line", 344
  # rx subrule "ws" subtype=method negate=
    rx738_cur."!cursor_pos"(rx738_pos)
    $P10 = rx738_cur."ws"()
    unless $P10, rx738_fail
    rx738_pos = $P10."pos"()
  alt743_0:
.annotate "line", 345
    set_addr $I10, alt743_1
    rx738_cur."!mark_push"(0, rx738_pos, $I10)
.annotate "line", 346
  # rx subrule "EXPR" subtype=capture negate=
    rx738_cur."!cursor_pos"(rx738_pos)
    $P10 = rx738_cur."EXPR"("f=")
    unless $P10, rx738_fail
    rx738_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx738_pos = $P10."pos"()
    goto alt743_end
  alt743_1:
  alt743_end:
.annotate "line", 343
  # rx pass
    rx738_cur."!cursor_pass"(rx738_pos, "arglist")
    rx738_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx738_pos)
    .return (rx738_cur)
  rx738_fail:
.annotate "line", 4
    (rx738_rep, rx738_pos, $I10, $P10) = rx738_cur."!mark_fail"(0)
    lt rx738_pos, -1, rx738_done
    eq rx738_pos, -1, rx738_fail
    jump $I10
  rx738_done:
    rx738_cur."!cursor_fail"()
    rx738_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx738_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("170_1259078882.26523") :method
.annotate "line", 4
    $P740 = self."!PREFIX__!subrule"("", "")
    new $P741, "ResizablePMCArray"
    push $P741, $P740
    .return ($P741)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("171_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx745_tgt
    .local int rx745_pos
    .local int rx745_off
    .local int rx745_eos
    .local int rx745_rep
    .local pmc rx745_cur
    (rx745_cur, rx745_pos, rx745_tgt) = self."!cursor_start"()
    rx745_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx745_cur
    .local pmc match
    .lex "$/", match
    length rx745_eos, rx745_tgt
    set rx745_off, 0
    lt rx745_pos, 2, rx745_start
    sub rx745_off, rx745_pos, 1
    substr rx745_tgt, rx745_tgt, rx745_off
  rx745_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan749_done
    goto rxscan749_scan
  rxscan749_loop:
    ($P10) = rx745_cur."from"()
    inc $P10
    set rx745_pos, $P10
    ge rx745_pos, rx745_eos, rxscan749_done
  rxscan749_scan:
    set_addr $I10, rxscan749_loop
    rx745_cur."!mark_push"(0, rx745_pos, $I10)
  rxscan749_done:
.annotate "line", 352
  # rx subrule "value" subtype=capture negate=
    rx745_cur."!cursor_pos"(rx745_pos)
    $P10 = rx745_cur."value"()
    unless $P10, rx745_fail
    rx745_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx745_pos = $P10."pos"()
  # rx pass
    rx745_cur."!cursor_pass"(rx745_pos, "term:sym<value>")
    rx745_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx745_pos)
    .return (rx745_cur)
  rx745_fail:
.annotate "line", 4
    (rx745_rep, rx745_pos, $I10, $P10) = rx745_cur."!mark_fail"(0)
    lt rx745_pos, -1, rx745_done
    eq rx745_pos, -1, rx745_fail
    jump $I10
  rx745_done:
    rx745_cur."!cursor_fail"()
    rx745_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx745_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("172_1259078882.26523") :method
.annotate "line", 4
    $P747 = self."!PREFIX__!subrule"("value", "")
    new $P748, "ResizablePMCArray"
    push $P748, $P747
    .return ($P748)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("173_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx751_tgt
    .local int rx751_pos
    .local int rx751_off
    .local int rx751_eos
    .local int rx751_rep
    .local pmc rx751_cur
    (rx751_cur, rx751_pos, rx751_tgt) = self."!cursor_start"()
    rx751_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx751_cur
    .local pmc match
    .lex "$/", match
    length rx751_eos, rx751_tgt
    set rx751_off, 0
    lt rx751_pos, 2, rx751_start
    sub rx751_off, rx751_pos, 1
    substr rx751_tgt, rx751_tgt, rx751_off
  rx751_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan756_done
    goto rxscan756_scan
  rxscan756_loop:
    ($P10) = rx751_cur."from"()
    inc $P10
    set rx751_pos, $P10
    ge rx751_pos, rx751_eos, rxscan756_done
  rxscan756_scan:
    set_addr $I10, rxscan756_loop
    rx751_cur."!mark_push"(0, rx751_pos, $I10)
  rxscan756_done:
  alt757_0:
.annotate "line", 354
    set_addr $I10, alt757_1
    rx751_cur."!mark_push"(0, rx751_pos, $I10)
.annotate "line", 355
  # rx subrule "quote" subtype=capture negate=
    rx751_cur."!cursor_pos"(rx751_pos)
    $P10 = rx751_cur."quote"()
    unless $P10, rx751_fail
    rx751_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx751_pos = $P10."pos"()
    goto alt757_end
  alt757_1:
.annotate "line", 356
  # rx subrule "number" subtype=capture negate=
    rx751_cur."!cursor_pos"(rx751_pos)
    $P10 = rx751_cur."number"()
    unless $P10, rx751_fail
    rx751_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx751_pos = $P10."pos"()
  alt757_end:
.annotate "line", 354
  # rx pass
    rx751_cur."!cursor_pass"(rx751_pos, "value")
    rx751_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx751_pos)
    .return (rx751_cur)
  rx751_fail:
.annotate "line", 4
    (rx751_rep, rx751_pos, $I10, $P10) = rx751_cur."!mark_fail"(0)
    lt rx751_pos, -1, rx751_done
    eq rx751_pos, -1, rx751_fail
    jump $I10
  rx751_done:
    rx751_cur."!cursor_fail"()
    rx751_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx751_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("174_1259078882.26523") :method
.annotate "line", 4
    $P753 = self."!PREFIX__!subrule"("number", "")
    $P754 = self."!PREFIX__!subrule"("quote", "")
    new $P755, "ResizablePMCArray"
    push $P755, $P753
    push $P755, $P754
    .return ($P755)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("175_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx759_tgt
    .local int rx759_pos
    .local int rx759_off
    .local int rx759_eos
    .local int rx759_rep
    .local pmc rx759_cur
    (rx759_cur, rx759_pos, rx759_tgt) = self."!cursor_start"()
    rx759_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx759_cur
    .local pmc match
    .lex "$/", match
    length rx759_eos, rx759_tgt
    set rx759_off, 0
    lt rx759_pos, 2, rx759_start
    sub rx759_off, rx759_pos, 1
    substr rx759_tgt, rx759_tgt, rx759_off
  rx759_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan762_done
    goto rxscan762_scan
  rxscan762_loop:
    ($P10) = rx759_cur."from"()
    inc $P10
    set rx759_pos, $P10
    ge rx759_pos, rx759_eos, rxscan762_done
  rxscan762_scan:
    set_addr $I10, rxscan762_loop
    rx759_cur."!mark_push"(0, rx759_pos, $I10)
  rxscan762_done:
.annotate "line", 360
  # rx subcapture "sign"
    set_addr $I10, rxcap_765_fail
    rx759_cur."!mark_push"(0, rx759_pos, $I10)
  # rx rxquantr763 ** 0..1
    set_addr $I764, rxquantr763_done
    rx759_cur."!mark_push"(0, rx759_pos, $I764)
  rxquantr763_loop:
  # rx enumcharlist negate=0 
    ge rx759_pos, rx759_eos, rx759_fail
    sub $I10, rx759_pos, rx759_off
    substr $S10, rx759_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx759_fail
    inc rx759_pos
    (rx759_rep) = rx759_cur."!mark_commit"($I764)
  rxquantr763_done:
    set_addr $I10, rxcap_765_fail
    ($I12, $I11) = rx759_cur."!mark_peek"($I10)
    rx759_cur."!cursor_pos"($I11)
    ($P10) = rx759_cur."!cursor_start"()
    $P10."!cursor_pass"(rx759_pos, "")
    rx759_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_765_done
  rxcap_765_fail:
    goto rx759_fail
  rxcap_765_done:
  alt766_0:
.annotate "line", 361
    set_addr $I10, alt766_1
    rx759_cur."!mark_push"(0, rx759_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx759_cur."!cursor_pos"(rx759_pos)
    $P10 = rx759_cur."dec_number"()
    unless $P10, rx759_fail
    rx759_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx759_pos = $P10."pos"()
    goto alt766_end
  alt766_1:
  # rx subrule "integer" subtype=capture negate=
    rx759_cur."!cursor_pos"(rx759_pos)
    $P10 = rx759_cur."integer"()
    unless $P10, rx759_fail
    rx759_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx759_pos = $P10."pos"()
  alt766_end:
.annotate "line", 359
  # rx pass
    rx759_cur."!cursor_pass"(rx759_pos, "number")
    rx759_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx759_pos)
    .return (rx759_cur)
  rx759_fail:
.annotate "line", 4
    (rx759_rep, rx759_pos, $I10, $P10) = rx759_cur."!mark_fail"(0)
    lt rx759_pos, -1, rx759_done
    eq rx759_pos, -1, rx759_fail
    jump $I10
  rx759_done:
    rx759_cur."!cursor_fail"()
    rx759_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx759_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("176_1259078882.26523") :method
.annotate "line", 4
    new $P761, "ResizablePMCArray"
    push $P761, ""
    .return ($P761)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("177_1259078882.26523") :method
.annotate "line", 364
    $P768 = self."!protoregex"("quote")
    .return ($P768)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("178_1259078882.26523") :method
.annotate "line", 364
    $P770 = self."!PREFIX__!protoregex"("quote")
    .return ($P770)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("179_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx772_tgt
    .local int rx772_pos
    .local int rx772_off
    .local int rx772_eos
    .local int rx772_rep
    .local pmc rx772_cur
    (rx772_cur, rx772_pos, rx772_tgt) = self."!cursor_start"()
    rx772_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx772_cur
    .local pmc match
    .lex "$/", match
    length rx772_eos, rx772_tgt
    set rx772_off, 0
    lt rx772_pos, 2, rx772_start
    sub rx772_off, rx772_pos, 1
    substr rx772_tgt, rx772_tgt, rx772_off
  rx772_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan775_done
    goto rxscan775_scan
  rxscan775_loop:
    ($P10) = rx772_cur."from"()
    inc $P10
    set rx772_pos, $P10
    ge rx772_pos, rx772_eos, rxscan775_done
  rxscan775_scan:
    set_addr $I10, rxscan775_loop
    rx772_cur."!mark_push"(0, rx772_pos, $I10)
  rxscan775_done:
.annotate "line", 365
  # rx enumcharlist negate=0 zerowidth
    ge rx772_pos, rx772_eos, rx772_fail
    sub $I10, rx772_pos, rx772_off
    substr $S10, rx772_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx772_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx772_cur."!cursor_pos"(rx772_pos)
    $P10 = rx772_cur."quote_EXPR"(":q")
    unless $P10, rx772_fail
    rx772_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx772_pos = $P10."pos"()
  # rx pass
    rx772_cur."!cursor_pass"(rx772_pos, "quote:sym<apos>")
    rx772_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx772_pos)
    .return (rx772_cur)
  rx772_fail:
.annotate "line", 4
    (rx772_rep, rx772_pos, $I10, $P10) = rx772_cur."!mark_fail"(0)
    lt rx772_pos, -1, rx772_done
    eq rx772_pos, -1, rx772_fail
    jump $I10
  rx772_done:
    rx772_cur."!cursor_fail"()
    rx772_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx772_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("180_1259078882.26523") :method
.annotate "line", 4
    new $P774, "ResizablePMCArray"
    push $P774, "'"
    .return ($P774)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("181_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx777_tgt
    .local int rx777_pos
    .local int rx777_off
    .local int rx777_eos
    .local int rx777_rep
    .local pmc rx777_cur
    (rx777_cur, rx777_pos, rx777_tgt) = self."!cursor_start"()
    rx777_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx777_cur
    .local pmc match
    .lex "$/", match
    length rx777_eos, rx777_tgt
    set rx777_off, 0
    lt rx777_pos, 2, rx777_start
    sub rx777_off, rx777_pos, 1
    substr rx777_tgt, rx777_tgt, rx777_off
  rx777_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan780_done
    goto rxscan780_scan
  rxscan780_loop:
    ($P10) = rx777_cur."from"()
    inc $P10
    set rx777_pos, $P10
    ge rx777_pos, rx777_eos, rxscan780_done
  rxscan780_scan:
    set_addr $I10, rxscan780_loop
    rx777_cur."!mark_push"(0, rx777_pos, $I10)
  rxscan780_done:
.annotate "line", 366
  # rx enumcharlist negate=0 zerowidth
    ge rx777_pos, rx777_eos, rx777_fail
    sub $I10, rx777_pos, rx777_off
    substr $S10, rx777_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx777_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx777_cur."!cursor_pos"(rx777_pos)
    $P10 = rx777_cur."quote_EXPR"(":qq")
    unless $P10, rx777_fail
    rx777_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx777_pos = $P10."pos"()
  # rx pass
    rx777_cur."!cursor_pass"(rx777_pos, "quote:sym<dblq>")
    rx777_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx777_pos)
    .return (rx777_cur)
  rx777_fail:
.annotate "line", 4
    (rx777_rep, rx777_pos, $I10, $P10) = rx777_cur."!mark_fail"(0)
    lt rx777_pos, -1, rx777_done
    eq rx777_pos, -1, rx777_fail
    jump $I10
  rx777_done:
    rx777_cur."!cursor_fail"()
    rx777_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx777_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("182_1259078882.26523") :method
.annotate "line", 4
    new $P779, "ResizablePMCArray"
    push $P779, "\""
    .return ($P779)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("183_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx782_tgt
    .local int rx782_pos
    .local int rx782_off
    .local int rx782_eos
    .local int rx782_rep
    .local pmc rx782_cur
    (rx782_cur, rx782_pos, rx782_tgt) = self."!cursor_start"()
    rx782_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx782_cur
    .local pmc match
    .lex "$/", match
    length rx782_eos, rx782_tgt
    set rx782_off, 0
    lt rx782_pos, 2, rx782_start
    sub rx782_off, rx782_pos, 1
    substr rx782_tgt, rx782_tgt, rx782_off
  rx782_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan786_done
    goto rxscan786_scan
  rxscan786_loop:
    ($P10) = rx782_cur."from"()
    inc $P10
    set rx782_pos, $P10
    ge rx782_pos, rx782_eos, rxscan786_done
  rxscan786_scan:
    set_addr $I10, rxscan786_loop
    rx782_cur."!mark_push"(0, rx782_pos, $I10)
  rxscan786_done:
.annotate "line", 367
  # rx literal  "q"
    add $I11, rx782_pos, 1
    gt $I11, rx782_eos, rx782_fail
    sub $I11, rx782_pos, rx782_off
    substr $S10, rx782_tgt, $I11, 1
    ne $S10, "q", rx782_fail
    add rx782_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx782_pos, rx782_eos, rx782_fail
    sub $I10, rx782_pos, rx782_off
    substr $S10, rx782_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx782_fail
  # rx subrule "ws" subtype=method negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."ws"()
    unless $P10, rx782_fail
    rx782_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx782_cur."!cursor_pos"(rx782_pos)
    $P10 = rx782_cur."quote_EXPR"(":q")
    unless $P10, rx782_fail
    rx782_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx782_pos = $P10."pos"()
  # rx pass
    rx782_cur."!cursor_pass"(rx782_pos, "quote:sym<q>")
    rx782_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx782_pos)
    .return (rx782_cur)
  rx782_fail:
.annotate "line", 4
    (rx782_rep, rx782_pos, $I10, $P10) = rx782_cur."!mark_fail"(0)
    lt rx782_pos, -1, rx782_done
    eq rx782_pos, -1, rx782_fail
    jump $I10
  rx782_done:
    rx782_cur."!cursor_fail"()
    rx782_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx782_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("184_1259078882.26523") :method
.annotate "line", 4
    $P784 = self."!PREFIX__!subrule"("", "q")
    new $P785, "ResizablePMCArray"
    push $P785, $P784
    .return ($P785)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("185_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx788_tgt
    .local int rx788_pos
    .local int rx788_off
    .local int rx788_eos
    .local int rx788_rep
    .local pmc rx788_cur
    (rx788_cur, rx788_pos, rx788_tgt) = self."!cursor_start"()
    rx788_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx788_cur
    .local pmc match
    .lex "$/", match
    length rx788_eos, rx788_tgt
    set rx788_off, 0
    lt rx788_pos, 2, rx788_start
    sub rx788_off, rx788_pos, 1
    substr rx788_tgt, rx788_tgt, rx788_off
  rx788_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan792_done
    goto rxscan792_scan
  rxscan792_loop:
    ($P10) = rx788_cur."from"()
    inc $P10
    set rx788_pos, $P10
    ge rx788_pos, rx788_eos, rxscan792_done
  rxscan792_scan:
    set_addr $I10, rxscan792_loop
    rx788_cur."!mark_push"(0, rx788_pos, $I10)
  rxscan792_done:
.annotate "line", 368
  # rx literal  "qq"
    add $I11, rx788_pos, 2
    gt $I11, rx788_eos, rx788_fail
    sub $I11, rx788_pos, rx788_off
    substr $S10, rx788_tgt, $I11, 2
    ne $S10, "qq", rx788_fail
    add rx788_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx788_pos, rx788_eos, rx788_fail
    sub $I10, rx788_pos, rx788_off
    substr $S10, rx788_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx788_fail
  # rx subrule "ws" subtype=method negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."ws"()
    unless $P10, rx788_fail
    rx788_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx788_cur."!cursor_pos"(rx788_pos)
    $P10 = rx788_cur."quote_EXPR"(":qq")
    unless $P10, rx788_fail
    rx788_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx788_pos = $P10."pos"()
  # rx pass
    rx788_cur."!cursor_pass"(rx788_pos, "quote:sym<qq>")
    rx788_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx788_pos)
    .return (rx788_cur)
  rx788_fail:
.annotate "line", 4
    (rx788_rep, rx788_pos, $I10, $P10) = rx788_cur."!mark_fail"(0)
    lt rx788_pos, -1, rx788_done
    eq rx788_pos, -1, rx788_fail
    jump $I10
  rx788_done:
    rx788_cur."!cursor_fail"()
    rx788_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx788_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("186_1259078882.26523") :method
.annotate "line", 4
    $P790 = self."!PREFIX__!subrule"("", "qq")
    new $P791, "ResizablePMCArray"
    push $P791, $P790
    .return ($P791)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("187_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx794_tgt
    .local int rx794_pos
    .local int rx794_off
    .local int rx794_eos
    .local int rx794_rep
    .local pmc rx794_cur
    (rx794_cur, rx794_pos, rx794_tgt) = self."!cursor_start"()
    rx794_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx794_cur
    .local pmc match
    .lex "$/", match
    length rx794_eos, rx794_tgt
    set rx794_off, 0
    lt rx794_pos, 2, rx794_start
    sub rx794_off, rx794_pos, 1
    substr rx794_tgt, rx794_tgt, rx794_off
  rx794_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan798_done
    goto rxscan798_scan
  rxscan798_loop:
    ($P10) = rx794_cur."from"()
    inc $P10
    set rx794_pos, $P10
    ge rx794_pos, rx794_eos, rxscan798_done
  rxscan798_scan:
    set_addr $I10, rxscan798_loop
    rx794_cur."!mark_push"(0, rx794_pos, $I10)
  rxscan798_done:
.annotate "line", 369
  # rx literal  "Q"
    add $I11, rx794_pos, 1
    gt $I11, rx794_eos, rx794_fail
    sub $I11, rx794_pos, rx794_off
    substr $S10, rx794_tgt, $I11, 1
    ne $S10, "Q", rx794_fail
    add rx794_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx794_pos, rx794_eos, rx794_fail
    sub $I10, rx794_pos, rx794_off
    substr $S10, rx794_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx794_fail
  # rx subrule "ws" subtype=method negate=
    rx794_cur."!cursor_pos"(rx794_pos)
    $P10 = rx794_cur."ws"()
    unless $P10, rx794_fail
    rx794_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx794_cur."!cursor_pos"(rx794_pos)
    $P10 = rx794_cur."quote_EXPR"()
    unless $P10, rx794_fail
    rx794_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx794_pos = $P10."pos"()
  # rx pass
    rx794_cur."!cursor_pass"(rx794_pos, "quote:sym<Q>")
    rx794_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx794_pos)
    .return (rx794_cur)
  rx794_fail:
.annotate "line", 4
    (rx794_rep, rx794_pos, $I10, $P10) = rx794_cur."!mark_fail"(0)
    lt rx794_pos, -1, rx794_done
    eq rx794_pos, -1, rx794_fail
    jump $I10
  rx794_done:
    rx794_cur."!cursor_fail"()
    rx794_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx794_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("188_1259078882.26523") :method
.annotate "line", 4
    $P796 = self."!PREFIX__!subrule"("", "Q")
    new $P797, "ResizablePMCArray"
    push $P797, $P796
    .return ($P797)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("189_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx800_tgt
    .local int rx800_pos
    .local int rx800_off
    .local int rx800_eos
    .local int rx800_rep
    .local pmc rx800_cur
    (rx800_cur, rx800_pos, rx800_tgt) = self."!cursor_start"()
    rx800_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx800_cur
    .local pmc match
    .lex "$/", match
    length rx800_eos, rx800_tgt
    set rx800_off, 0
    lt rx800_pos, 2, rx800_start
    sub rx800_off, rx800_pos, 1
    substr rx800_tgt, rx800_tgt, rx800_off
  rx800_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan804_done
    goto rxscan804_scan
  rxscan804_loop:
    ($P10) = rx800_cur."from"()
    inc $P10
    set rx800_pos, $P10
    ge rx800_pos, rx800_eos, rxscan804_done
  rxscan804_scan:
    set_addr $I10, rxscan804_loop
    rx800_cur."!mark_push"(0, rx800_pos, $I10)
  rxscan804_done:
.annotate "line", 370
  # rx literal  "Q:PIR"
    add $I11, rx800_pos, 5
    gt $I11, rx800_eos, rx800_fail
    sub $I11, rx800_pos, rx800_off
    substr $S10, rx800_tgt, $I11, 5
    ne $S10, "Q:PIR", rx800_fail
    add rx800_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx800_cur."!cursor_pos"(rx800_pos)
    $P10 = rx800_cur."ws"()
    unless $P10, rx800_fail
    rx800_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx800_cur."!cursor_pos"(rx800_pos)
    $P10 = rx800_cur."quote_EXPR"()
    unless $P10, rx800_fail
    rx800_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx800_pos = $P10."pos"()
  # rx pass
    rx800_cur."!cursor_pass"(rx800_pos, "quote:sym<Q:PIR>")
    rx800_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx800_pos)
    .return (rx800_cur)
  rx800_fail:
.annotate "line", 4
    (rx800_rep, rx800_pos, $I10, $P10) = rx800_cur."!mark_fail"(0)
    lt rx800_pos, -1, rx800_done
    eq rx800_pos, -1, rx800_fail
    jump $I10
  rx800_done:
    rx800_cur."!cursor_fail"()
    rx800_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx800_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("190_1259078882.26523") :method
.annotate "line", 4
    $P802 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P803, "ResizablePMCArray"
    push $P803, $P802
    .return ($P803)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("191_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx806_tgt
    .local int rx806_pos
    .local int rx806_off
    .local int rx806_eos
    .local int rx806_rep
    .local pmc rx806_cur
    (rx806_cur, rx806_pos, rx806_tgt) = self."!cursor_start"()
    rx806_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx806_cur
    .local pmc match
    .lex "$/", match
    length rx806_eos, rx806_tgt
    set rx806_off, 0
    lt rx806_pos, 2, rx806_start
    sub rx806_off, rx806_pos, 1
    substr rx806_tgt, rx806_tgt, rx806_off
  rx806_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan809_done
    goto rxscan809_scan
  rxscan809_loop:
    ($P10) = rx806_cur."from"()
    inc $P10
    set rx806_pos, $P10
    ge rx806_pos, rx806_eos, rxscan809_done
  rxscan809_scan:
    set_addr $I10, rxscan809_loop
    rx806_cur."!mark_push"(0, rx806_pos, $I10)
  rxscan809_done:
.annotate "line", 372
  # rx enumcharlist negate=0 zerowidth
    ge rx806_pos, rx806_eos, rx806_fail
    sub $I10, rx806_pos, rx806_off
    substr $S10, rx806_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx806_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx806_cur."!cursor_pos"(rx806_pos)
    $P10 = rx806_cur."quotemod_check"("s")
    unless $P10, rx806_fail
  # rx subrule "variable" subtype=capture negate=
    rx806_cur."!cursor_pos"(rx806_pos)
    $P10 = rx806_cur."variable"()
    unless $P10, rx806_fail
    rx806_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx806_pos = $P10."pos"()
  # rx pass
    rx806_cur."!cursor_pass"(rx806_pos, "quote_escape:sym<$>")
    rx806_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx806_pos)
    .return (rx806_cur)
  rx806_fail:
.annotate "line", 4
    (rx806_rep, rx806_pos, $I10, $P10) = rx806_cur."!mark_fail"(0)
    lt rx806_pos, -1, rx806_done
    eq rx806_pos, -1, rx806_fail
    jump $I10
  rx806_done:
    rx806_cur."!cursor_fail"()
    rx806_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx806_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("192_1259078882.26523") :method
.annotate "line", 4
    new $P808, "ResizablePMCArray"
    push $P808, "$"
    .return ($P808)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("193_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx811_tgt
    .local int rx811_pos
    .local int rx811_off
    .local int rx811_eos
    .local int rx811_rep
    .local pmc rx811_cur
    (rx811_cur, rx811_pos, rx811_tgt) = self."!cursor_start"()
    rx811_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx811_cur
    .local pmc match
    .lex "$/", match
    length rx811_eos, rx811_tgt
    set rx811_off, 0
    lt rx811_pos, 2, rx811_start
    sub rx811_off, rx811_pos, 1
    substr rx811_tgt, rx811_tgt, rx811_off
  rx811_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan814_done
    goto rxscan814_scan
  rxscan814_loop:
    ($P10) = rx811_cur."from"()
    inc $P10
    set rx811_pos, $P10
    ge rx811_pos, rx811_eos, rxscan814_done
  rxscan814_scan:
    set_addr $I10, rxscan814_loop
    rx811_cur."!mark_push"(0, rx811_pos, $I10)
  rxscan814_done:
.annotate "line", 373
  # rx enumcharlist negate=0 zerowidth
    ge rx811_pos, rx811_eos, rx811_fail
    sub $I10, rx811_pos, rx811_off
    substr $S10, rx811_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx811_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."quotemod_check"("c")
    unless $P10, rx811_fail
  # rx subrule "block" subtype=capture negate=
    rx811_cur."!cursor_pos"(rx811_pos)
    $P10 = rx811_cur."block"()
    unless $P10, rx811_fail
    rx811_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx811_pos = $P10."pos"()
  # rx pass
    rx811_cur."!cursor_pass"(rx811_pos, "quote_escape:sym<{ }>")
    rx811_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx811_pos)
    .return (rx811_cur)
  rx811_fail:
.annotate "line", 4
    (rx811_rep, rx811_pos, $I10, $P10) = rx811_cur."!mark_fail"(0)
    lt rx811_pos, -1, rx811_done
    eq rx811_pos, -1, rx811_fail
    jump $I10
  rx811_done:
    rx811_cur."!cursor_fail"()
    rx811_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx811_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("194_1259078882.26523") :method
.annotate "line", 4
    new $P813, "ResizablePMCArray"
    push $P813, "{"
    .return ($P813)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("195_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx816_tgt
    .local int rx816_pos
    .local int rx816_off
    .local int rx816_eos
    .local int rx816_rep
    .local pmc rx816_cur
    (rx816_cur, rx816_pos, rx816_tgt) = self."!cursor_start"()
    rx816_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx816_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx816_cur
    .local pmc match
    .lex "$/", match
    length rx816_eos, rx816_tgt
    set rx816_off, 0
    lt rx816_pos, 2, rx816_start
    sub rx816_off, rx816_pos, 1
    substr rx816_tgt, rx816_tgt, rx816_off
  rx816_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan820_done
    goto rxscan820_scan
  rxscan820_loop:
    ($P10) = rx816_cur."from"()
    inc $P10
    set rx816_pos, $P10
    ge rx816_pos, rx816_eos, rxscan820_done
  rxscan820_scan:
    set_addr $I10, rxscan820_loop
    rx816_cur."!mark_push"(0, rx816_pos, $I10)
  rxscan820_done:
.annotate "line", 375
  # rx literal  "("
    add $I11, rx816_pos, 1
    gt $I11, rx816_eos, rx816_fail
    sub $I11, rx816_pos, rx816_off
    substr $S10, rx816_tgt, $I11, 1
    ne $S10, "(", rx816_fail
    add rx816_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx816_cur."!cursor_pos"(rx816_pos)
    $P10 = rx816_cur."ws"()
    unless $P10, rx816_fail
    rx816_pos = $P10."pos"()
  # rx rxquantr821 ** 0..1
    set_addr $I822, rxquantr821_done
    rx816_cur."!mark_push"(0, rx816_pos, $I822)
  rxquantr821_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx816_cur."!cursor_pos"(rx816_pos)
    $P10 = rx816_cur."EXPR"()
    unless $P10, rx816_fail
    rx816_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx816_pos = $P10."pos"()
    (rx816_rep) = rx816_cur."!mark_commit"($I822)
  rxquantr821_done:
  # rx literal  ")"
    add $I11, rx816_pos, 1
    gt $I11, rx816_eos, rx816_fail
    sub $I11, rx816_pos, rx816_off
    substr $S10, rx816_tgt, $I11, 1
    ne $S10, ")", rx816_fail
    add rx816_pos, 1
  # rx pass
    rx816_cur."!cursor_pass"(rx816_pos, "circumfix:sym<( )>")
    rx816_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx816_pos)
    .return (rx816_cur)
  rx816_fail:
.annotate "line", 4
    (rx816_rep, rx816_pos, $I10, $P10) = rx816_cur."!mark_fail"(0)
    lt rx816_pos, -1, rx816_done
    eq rx816_pos, -1, rx816_fail
    jump $I10
  rx816_done:
    rx816_cur."!cursor_fail"()
    rx816_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx816_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("196_1259078882.26523") :method
.annotate "line", 4
    $P818 = self."!PREFIX__!subrule"("", "(")
    new $P819, "ResizablePMCArray"
    push $P819, $P818
    .return ($P819)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("197_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx824_tgt
    .local int rx824_pos
    .local int rx824_off
    .local int rx824_eos
    .local int rx824_rep
    .local pmc rx824_cur
    (rx824_cur, rx824_pos, rx824_tgt) = self."!cursor_start"()
    rx824_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx824_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx824_cur
    .local pmc match
    .lex "$/", match
    length rx824_eos, rx824_tgt
    set rx824_off, 0
    lt rx824_pos, 2, rx824_start
    sub rx824_off, rx824_pos, 1
    substr rx824_tgt, rx824_tgt, rx824_off
  rx824_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan828_done
    goto rxscan828_scan
  rxscan828_loop:
    ($P10) = rx824_cur."from"()
    inc $P10
    set rx824_pos, $P10
    ge rx824_pos, rx824_eos, rxscan828_done
  rxscan828_scan:
    set_addr $I10, rxscan828_loop
    rx824_cur."!mark_push"(0, rx824_pos, $I10)
  rxscan828_done:
.annotate "line", 376
  # rx literal  "["
    add $I11, rx824_pos, 1
    gt $I11, rx824_eos, rx824_fail
    sub $I11, rx824_pos, rx824_off
    substr $S10, rx824_tgt, $I11, 1
    ne $S10, "[", rx824_fail
    add rx824_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx824_cur."!cursor_pos"(rx824_pos)
    $P10 = rx824_cur."ws"()
    unless $P10, rx824_fail
    rx824_pos = $P10."pos"()
  # rx rxquantr829 ** 0..1
    set_addr $I830, rxquantr829_done
    rx824_cur."!mark_push"(0, rx824_pos, $I830)
  rxquantr829_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx824_cur."!cursor_pos"(rx824_pos)
    $P10 = rx824_cur."EXPR"()
    unless $P10, rx824_fail
    rx824_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx824_pos = $P10."pos"()
    (rx824_rep) = rx824_cur."!mark_commit"($I830)
  rxquantr829_done:
  # rx literal  "]"
    add $I11, rx824_pos, 1
    gt $I11, rx824_eos, rx824_fail
    sub $I11, rx824_pos, rx824_off
    substr $S10, rx824_tgt, $I11, 1
    ne $S10, "]", rx824_fail
    add rx824_pos, 1
  # rx pass
    rx824_cur."!cursor_pass"(rx824_pos, "circumfix:sym<[ ]>")
    rx824_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx824_pos)
    .return (rx824_cur)
  rx824_fail:
.annotate "line", 4
    (rx824_rep, rx824_pos, $I10, $P10) = rx824_cur."!mark_fail"(0)
    lt rx824_pos, -1, rx824_done
    eq rx824_pos, -1, rx824_fail
    jump $I10
  rx824_done:
    rx824_cur."!cursor_fail"()
    rx824_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx824_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("198_1259078882.26523") :method
.annotate "line", 4
    $P826 = self."!PREFIX__!subrule"("", "[")
    new $P827, "ResizablePMCArray"
    push $P827, $P826
    .return ($P827)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("199_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx832_tgt
    .local int rx832_pos
    .local int rx832_off
    .local int rx832_eos
    .local int rx832_rep
    .local pmc rx832_cur
    (rx832_cur, rx832_pos, rx832_tgt) = self."!cursor_start"()
    rx832_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx832_cur
    .local pmc match
    .lex "$/", match
    length rx832_eos, rx832_tgt
    set rx832_off, 0
    lt rx832_pos, 2, rx832_start
    sub rx832_off, rx832_pos, 1
    substr rx832_tgt, rx832_tgt, rx832_off
  rx832_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan835_done
    goto rxscan835_scan
  rxscan835_loop:
    ($P10) = rx832_cur."from"()
    inc $P10
    set rx832_pos, $P10
    ge rx832_pos, rx832_eos, rxscan835_done
  rxscan835_scan:
    set_addr $I10, rxscan835_loop
    rx832_cur."!mark_push"(0, rx832_pos, $I10)
  rxscan835_done:
.annotate "line", 377
  # rx enumcharlist negate=0 zerowidth
    ge rx832_pos, rx832_eos, rx832_fail
    sub $I10, rx832_pos, rx832_off
    substr $S10, rx832_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx832_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx832_cur."!cursor_pos"(rx832_pos)
    $P10 = rx832_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx832_fail
    rx832_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx832_pos = $P10."pos"()
  # rx pass
    rx832_cur."!cursor_pass"(rx832_pos, "circumfix:sym<ang>")
    rx832_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx832_pos)
    .return (rx832_cur)
  rx832_fail:
.annotate "line", 4
    (rx832_rep, rx832_pos, $I10, $P10) = rx832_cur."!mark_fail"(0)
    lt rx832_pos, -1, rx832_done
    eq rx832_pos, -1, rx832_fail
    jump $I10
  rx832_done:
    rx832_cur."!cursor_fail"()
    rx832_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx832_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("200_1259078882.26523") :method
.annotate "line", 4
    new $P834, "ResizablePMCArray"
    push $P834, "<"
    .return ($P834)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("201_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx837_tgt
    .local int rx837_pos
    .local int rx837_off
    .local int rx837_eos
    .local int rx837_rep
    .local pmc rx837_cur
    (rx837_cur, rx837_pos, rx837_tgt) = self."!cursor_start"()
    rx837_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx837_cur
    .local pmc match
    .lex "$/", match
    length rx837_eos, rx837_tgt
    set rx837_off, 0
    lt rx837_pos, 2, rx837_start
    sub rx837_off, rx837_pos, 1
    substr rx837_tgt, rx837_tgt, rx837_off
  rx837_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan840_done
    goto rxscan840_scan
  rxscan840_loop:
    ($P10) = rx837_cur."from"()
    inc $P10
    set rx837_pos, $P10
    ge rx837_pos, rx837_eos, rxscan840_done
  rxscan840_scan:
    set_addr $I10, rxscan840_loop
    rx837_cur."!mark_push"(0, rx837_pos, $I10)
  rxscan840_done:
.annotate "line", 378
  # rx enumcharlist negate=0 zerowidth
    ge rx837_pos, rx837_eos, rx837_fail
    sub $I10, rx837_pos, rx837_off
    substr $S10, rx837_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx837_fail
  # rx subrule "pblock" subtype=capture negate=
    rx837_cur."!cursor_pos"(rx837_pos)
    $P10 = rx837_cur."pblock"()
    unless $P10, rx837_fail
    rx837_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx837_pos = $P10."pos"()
  # rx pass
    rx837_cur."!cursor_pass"(rx837_pos, "circumfix:sym<{ }>")
    rx837_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx837_pos)
    .return (rx837_cur)
  rx837_fail:
.annotate "line", 4
    (rx837_rep, rx837_pos, $I10, $P10) = rx837_cur."!mark_fail"(0)
    lt rx837_pos, -1, rx837_done
    eq rx837_pos, -1, rx837_fail
    jump $I10
  rx837_done:
    rx837_cur."!cursor_fail"()
    rx837_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx837_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("202_1259078882.26523") :method
.annotate "line", 4
    new $P839, "ResizablePMCArray"
    push $P839, "{"
    .return ($P839)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("203_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx842_tgt
    .local int rx842_pos
    .local int rx842_off
    .local int rx842_eos
    .local int rx842_rep
    .local pmc rx842_cur
    (rx842_cur, rx842_pos, rx842_tgt) = self."!cursor_start"()
    rx842_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx842_cur
    .local pmc match
    .lex "$/", match
    length rx842_eos, rx842_tgt
    set rx842_off, 0
    lt rx842_pos, 2, rx842_start
    sub rx842_off, rx842_pos, 1
    substr rx842_tgt, rx842_tgt, rx842_off
  rx842_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan846_done
    goto rxscan846_scan
  rxscan846_loop:
    ($P10) = rx842_cur."from"()
    inc $P10
    set rx842_pos, $P10
    ge rx842_pos, rx842_eos, rxscan846_done
  rxscan846_scan:
    set_addr $I10, rxscan846_loop
    rx842_cur."!mark_push"(0, rx842_pos, $I10)
  rxscan846_done:
.annotate "line", 379
  # rx subrule "sigil" subtype=capture negate=
    rx842_cur."!cursor_pos"(rx842_pos)
    $P10 = rx842_cur."sigil"()
    unless $P10, rx842_fail
    rx842_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx842_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx842_pos, 1
    gt $I11, rx842_eos, rx842_fail
    sub $I11, rx842_pos, rx842_off
    substr $S10, rx842_tgt, $I11, 1
    ne $S10, "(", rx842_fail
    add rx842_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx842_cur."!cursor_pos"(rx842_pos)
    $P10 = rx842_cur."semilist"()
    unless $P10, rx842_fail
    rx842_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx842_pos = $P10."pos"()
  alt847_0:
    set_addr $I10, alt847_1
    rx842_cur."!mark_push"(0, rx842_pos, $I10)
  # rx literal  ")"
    add $I11, rx842_pos, 1
    gt $I11, rx842_eos, rx842_fail
    sub $I11, rx842_pos, rx842_off
    substr $S10, rx842_tgt, $I11, 1
    ne $S10, ")", rx842_fail
    add rx842_pos, 1
    goto alt847_end
  alt847_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx842_cur."!cursor_pos"(rx842_pos)
    $P10 = rx842_cur."FAILGOAL"("')'")
    unless $P10, rx842_fail
    rx842_pos = $P10."pos"()
  alt847_end:
  # rx pass
    rx842_cur."!cursor_pass"(rx842_pos, "circumfix:sym<sigil>")
    rx842_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx842_pos)
    .return (rx842_cur)
  rx842_fail:
.annotate "line", 4
    (rx842_rep, rx842_pos, $I10, $P10) = rx842_cur."!mark_fail"(0)
    lt rx842_pos, -1, rx842_done
    eq rx842_pos, -1, rx842_fail
    jump $I10
  rx842_done:
    rx842_cur."!cursor_fail"()
    rx842_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx842_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("204_1259078882.26523") :method
.annotate "line", 4
    $P844 = self."!PREFIX__!subrule"("sigil", "")
    new $P845, "ResizablePMCArray"
    push $P845, $P844
    .return ($P845)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("205_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 4
    .local string rx850_tgt
    .local int rx850_pos
    .local int rx850_off
    .local int rx850_eos
    .local int rx850_rep
    .local pmc rx850_cur
    (rx850_cur, rx850_pos, rx850_tgt) = self."!cursor_start"()
    rx850_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx850_cur
    .local pmc match
    .lex "$/", match
    length rx850_eos, rx850_tgt
    set rx850_off, 0
    lt rx850_pos, 2, rx850_start
    sub rx850_off, rx850_pos, 1
    substr rx850_tgt, rx850_tgt, rx850_off
  rx850_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan853_done
    goto rxscan853_scan
  rxscan853_loop:
    ($P10) = rx850_cur."from"()
    inc $P10
    set rx850_pos, $P10
    ge rx850_pos, rx850_eos, rxscan853_done
  rxscan853_scan:
    set_addr $I10, rxscan853_loop
    rx850_cur."!mark_push"(0, rx850_pos, $I10)
  rxscan853_done:
.annotate "line", 381
  # rx subrule "ws" subtype=method negate=
    rx850_cur."!cursor_pos"(rx850_pos)
    $P10 = rx850_cur."ws"()
    unless $P10, rx850_fail
    rx850_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx850_cur."!cursor_pos"(rx850_pos)
    $P10 = rx850_cur."statement"()
    unless $P10, rx850_fail
    rx850_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx850_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx850_cur."!cursor_pos"(rx850_pos)
    $P10 = rx850_cur."ws"()
    unless $P10, rx850_fail
    rx850_pos = $P10."pos"()
  # rx pass
    rx850_cur."!cursor_pass"(rx850_pos, "semilist")
    rx850_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx850_pos)
    .return (rx850_cur)
  rx850_fail:
.annotate "line", 4
    (rx850_rep, rx850_pos, $I10, $P10) = rx850_cur."!mark_fail"(0)
    lt rx850_pos, -1, rx850_done
    eq rx850_pos, -1, rx850_fail
    jump $I10
  rx850_done:
    rx850_cur."!cursor_fail"()
    rx850_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx850_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("206_1259078882.26523") :method
.annotate "line", 4
    new $P852, "ResizablePMCArray"
    push $P852, ""
    .return ($P852)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("207_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx857_tgt
    .local int rx857_pos
    .local int rx857_off
    .local int rx857_eos
    .local int rx857_rep
    .local pmc rx857_cur
    (rx857_cur, rx857_pos, rx857_tgt) = self."!cursor_start"()
    rx857_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx857_cur
    .local pmc match
    .lex "$/", match
    length rx857_eos, rx857_tgt
    set rx857_off, 0
    lt rx857_pos, 2, rx857_start
    sub rx857_off, rx857_pos, 1
    substr rx857_tgt, rx857_tgt, rx857_off
  rx857_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan860_done
    goto rxscan860_scan
  rxscan860_loop:
    ($P10) = rx857_cur."from"()
    inc $P10
    set rx857_pos, $P10
    ge rx857_pos, rx857_eos, rxscan860_done
  rxscan860_scan:
    set_addr $I10, rxscan860_loop
    rx857_cur."!mark_push"(0, rx857_pos, $I10)
  rxscan860_done:
.annotate "line", 404
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."infixstopper"()
    if $P10, rx857_fail
  # rx subrule "infix" subtype=capture negate=
    rx857_cur."!cursor_pos"(rx857_pos)
    $P10 = rx857_cur."infix"()
    unless $P10, rx857_fail
    rx857_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx857_pos = $P10."pos"()
  # rx pass
    rx857_cur."!cursor_pass"(rx857_pos, "infixish")
    rx857_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx857_pos)
    .return (rx857_cur)
  rx857_fail:
.annotate "line", 385
    (rx857_rep, rx857_pos, $I10, $P10) = rx857_cur."!mark_fail"(0)
    lt rx857_pos, -1, rx857_done
    eq rx857_pos, -1, rx857_fail
    jump $I10
  rx857_done:
    rx857_cur."!cursor_fail"()
    rx857_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx857_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("208_1259078882.26523") :method
.annotate "line", 385
    new $P859, "ResizablePMCArray"
    push $P859, ""
    .return ($P859)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("209_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx862_tgt
    .local int rx862_pos
    .local int rx862_off
    .local int rx862_eos
    .local int rx862_rep
    .local pmc rx862_cur
    (rx862_cur, rx862_pos, rx862_tgt) = self."!cursor_start"()
    rx862_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx862_cur
    .local pmc match
    .lex "$/", match
    length rx862_eos, rx862_tgt
    set rx862_off, 0
    lt rx862_pos, 2, rx862_start
    sub rx862_off, rx862_pos, 1
    substr rx862_tgt, rx862_tgt, rx862_off
  rx862_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan865_done
    goto rxscan865_scan
  rxscan865_loop:
    ($P10) = rx862_cur."from"()
    inc $P10
    set rx862_pos, $P10
    ge rx862_pos, rx862_eos, rxscan865_done
  rxscan865_scan:
    set_addr $I10, rxscan865_loop
    rx862_cur."!mark_push"(0, rx862_pos, $I10)
  rxscan865_done:
.annotate "line", 405
  # rx subrule "lambda" subtype=zerowidth negate=
    rx862_cur."!cursor_pos"(rx862_pos)
    $P10 = rx862_cur."lambda"()
    unless $P10, rx862_fail
  # rx pass
    rx862_cur."!cursor_pass"(rx862_pos, "infixstopper")
    rx862_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx862_pos)
    .return (rx862_cur)
  rx862_fail:
.annotate "line", 385
    (rx862_rep, rx862_pos, $I10, $P10) = rx862_cur."!mark_fail"(0)
    lt rx862_pos, -1, rx862_done
    eq rx862_pos, -1, rx862_fail
    jump $I10
  rx862_done:
    rx862_cur."!cursor_fail"()
    rx862_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx862_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("210_1259078882.26523") :method
.annotate "line", 385
    new $P864, "ResizablePMCArray"
    push $P864, ""
    .return ($P864)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("211_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx867_tgt
    .local int rx867_pos
    .local int rx867_off
    .local int rx867_eos
    .local int rx867_rep
    .local pmc rx867_cur
    (rx867_cur, rx867_pos, rx867_tgt) = self."!cursor_start"()
    rx867_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx867_cur
    .local pmc match
    .lex "$/", match
    length rx867_eos, rx867_tgt
    set rx867_off, 0
    lt rx867_pos, 2, rx867_start
    sub rx867_off, rx867_pos, 1
    substr rx867_tgt, rx867_tgt, rx867_off
  rx867_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan871_done
    goto rxscan871_scan
  rxscan871_loop:
    ($P10) = rx867_cur."from"()
    inc $P10
    set rx867_pos, $P10
    ge rx867_pos, rx867_eos, rxscan871_done
  rxscan871_scan:
    set_addr $I10, rxscan871_loop
    rx867_cur."!mark_push"(0, rx867_pos, $I10)
  rxscan871_done:
.annotate "line", 408
  # rx literal  "["
    add $I11, rx867_pos, 1
    gt $I11, rx867_eos, rx867_fail
    sub $I11, rx867_pos, rx867_off
    substr $S10, rx867_tgt, $I11, 1
    ne $S10, "[", rx867_fail
    add rx867_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx867_cur."!cursor_pos"(rx867_pos)
    $P10 = rx867_cur."ws"()
    unless $P10, rx867_fail
    rx867_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx867_cur."!cursor_pos"(rx867_pos)
    $P10 = rx867_cur."EXPR"()
    unless $P10, rx867_fail
    rx867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx867_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx867_pos, 1
    gt $I11, rx867_eos, rx867_fail
    sub $I11, rx867_pos, rx867_off
    substr $S10, rx867_tgt, $I11, 1
    ne $S10, "]", rx867_fail
    add rx867_pos, 1
.annotate "line", 409
  # rx subrule "O" subtype=capture negate=
    rx867_cur."!cursor_pos"(rx867_pos)
    $P10 = rx867_cur."O"("%methodop")
    unless $P10, rx867_fail
    rx867_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx867_pos = $P10."pos"()
.annotate "line", 407
  # rx pass
    rx867_cur."!cursor_pass"(rx867_pos, "postcircumfix:sym<[ ]>")
    rx867_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx867_pos)
    .return (rx867_cur)
  rx867_fail:
.annotate "line", 385
    (rx867_rep, rx867_pos, $I10, $P10) = rx867_cur."!mark_fail"(0)
    lt rx867_pos, -1, rx867_done
    eq rx867_pos, -1, rx867_fail
    jump $I10
  rx867_done:
    rx867_cur."!cursor_fail"()
    rx867_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx867_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("212_1259078882.26523") :method
.annotate "line", 385
    $P869 = self."!PREFIX__!subrule"("", "[")
    new $P870, "ResizablePMCArray"
    push $P870, $P869
    .return ($P870)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("213_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx873_tgt
    .local int rx873_pos
    .local int rx873_off
    .local int rx873_eos
    .local int rx873_rep
    .local pmc rx873_cur
    (rx873_cur, rx873_pos, rx873_tgt) = self."!cursor_start"()
    rx873_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx873_cur
    .local pmc match
    .lex "$/", match
    length rx873_eos, rx873_tgt
    set rx873_off, 0
    lt rx873_pos, 2, rx873_start
    sub rx873_off, rx873_pos, 1
    substr rx873_tgt, rx873_tgt, rx873_off
  rx873_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan877_done
    goto rxscan877_scan
  rxscan877_loop:
    ($P10) = rx873_cur."from"()
    inc $P10
    set rx873_pos, $P10
    ge rx873_pos, rx873_eos, rxscan877_done
  rxscan877_scan:
    set_addr $I10, rxscan877_loop
    rx873_cur."!mark_push"(0, rx873_pos, $I10)
  rxscan877_done:
.annotate "line", 413
  # rx literal  "{"
    add $I11, rx873_pos, 1
    gt $I11, rx873_eos, rx873_fail
    sub $I11, rx873_pos, rx873_off
    substr $S10, rx873_tgt, $I11, 1
    ne $S10, "{", rx873_fail
    add rx873_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."ws"()
    unless $P10, rx873_fail
    rx873_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."EXPR"()
    unless $P10, rx873_fail
    rx873_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx873_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx873_pos, 1
    gt $I11, rx873_eos, rx873_fail
    sub $I11, rx873_pos, rx873_off
    substr $S10, rx873_tgt, $I11, 1
    ne $S10, "}", rx873_fail
    add rx873_pos, 1
.annotate "line", 414
  # rx subrule "O" subtype=capture negate=
    rx873_cur."!cursor_pos"(rx873_pos)
    $P10 = rx873_cur."O"("%methodop")
    unless $P10, rx873_fail
    rx873_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx873_pos = $P10."pos"()
.annotate "line", 412
  # rx pass
    rx873_cur."!cursor_pass"(rx873_pos, "postcircumfix:sym<{ }>")
    rx873_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx873_pos)
    .return (rx873_cur)
  rx873_fail:
.annotate "line", 385
    (rx873_rep, rx873_pos, $I10, $P10) = rx873_cur."!mark_fail"(0)
    lt rx873_pos, -1, rx873_done
    eq rx873_pos, -1, rx873_fail
    jump $I10
  rx873_done:
    rx873_cur."!cursor_fail"()
    rx873_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx873_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("214_1259078882.26523") :method
.annotate "line", 385
    $P875 = self."!PREFIX__!subrule"("", "{")
    new $P876, "ResizablePMCArray"
    push $P876, $P875
    .return ($P876)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("215_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx879_tgt
    .local int rx879_pos
    .local int rx879_off
    .local int rx879_eos
    .local int rx879_rep
    .local pmc rx879_cur
    (rx879_cur, rx879_pos, rx879_tgt) = self."!cursor_start"()
    rx879_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx879_cur
    .local pmc match
    .lex "$/", match
    length rx879_eos, rx879_tgt
    set rx879_off, 0
    lt rx879_pos, 2, rx879_start
    sub rx879_off, rx879_pos, 1
    substr rx879_tgt, rx879_tgt, rx879_off
  rx879_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan882_done
    goto rxscan882_scan
  rxscan882_loop:
    ($P10) = rx879_cur."from"()
    inc $P10
    set rx879_pos, $P10
    ge rx879_pos, rx879_eos, rxscan882_done
  rxscan882_scan:
    set_addr $I10, rxscan882_loop
    rx879_cur."!mark_push"(0, rx879_pos, $I10)
  rxscan882_done:
.annotate "line", 418
  # rx enumcharlist negate=0 zerowidth
    ge rx879_pos, rx879_eos, rx879_fail
    sub $I10, rx879_pos, rx879_off
    substr $S10, rx879_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx879_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx879_cur."!cursor_pos"(rx879_pos)
    $P10 = rx879_cur."quote_EXPR"(":q")
    unless $P10, rx879_fail
    rx879_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx879_pos = $P10."pos"()
.annotate "line", 419
  # rx subrule "O" subtype=capture negate=
    rx879_cur."!cursor_pos"(rx879_pos)
    $P10 = rx879_cur."O"("%methodop")
    unless $P10, rx879_fail
    rx879_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx879_pos = $P10."pos"()
.annotate "line", 417
  # rx pass
    rx879_cur."!cursor_pass"(rx879_pos, "postcircumfix:sym<ang>")
    rx879_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx879_pos)
    .return (rx879_cur)
  rx879_fail:
.annotate "line", 385
    (rx879_rep, rx879_pos, $I10, $P10) = rx879_cur."!mark_fail"(0)
    lt rx879_pos, -1, rx879_done
    eq rx879_pos, -1, rx879_fail
    jump $I10
  rx879_done:
    rx879_cur."!cursor_fail"()
    rx879_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx879_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("216_1259078882.26523") :method
.annotate "line", 385
    new $P881, "ResizablePMCArray"
    push $P881, "<"
    .return ($P881)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("217_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx884_tgt
    .local int rx884_pos
    .local int rx884_off
    .local int rx884_eos
    .local int rx884_rep
    .local pmc rx884_cur
    (rx884_cur, rx884_pos, rx884_tgt) = self."!cursor_start"()
    rx884_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx884_cur
    .local pmc match
    .lex "$/", match
    length rx884_eos, rx884_tgt
    set rx884_off, 0
    lt rx884_pos, 2, rx884_start
    sub rx884_off, rx884_pos, 1
    substr rx884_tgt, rx884_tgt, rx884_off
  rx884_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan888_done
    goto rxscan888_scan
  rxscan888_loop:
    ($P10) = rx884_cur."from"()
    inc $P10
    set rx884_pos, $P10
    ge rx884_pos, rx884_eos, rxscan888_done
  rxscan888_scan:
    set_addr $I10, rxscan888_loop
    rx884_cur."!mark_push"(0, rx884_pos, $I10)
  rxscan888_done:
.annotate "line", 423
  # rx literal  "("
    add $I11, rx884_pos, 1
    gt $I11, rx884_eos, rx884_fail
    sub $I11, rx884_pos, rx884_off
    substr $S10, rx884_tgt, $I11, 1
    ne $S10, "(", rx884_fail
    add rx884_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx884_cur."!cursor_pos"(rx884_pos)
    $P10 = rx884_cur."ws"()
    unless $P10, rx884_fail
    rx884_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx884_cur."!cursor_pos"(rx884_pos)
    $P10 = rx884_cur."arglist"()
    unless $P10, rx884_fail
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx884_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx884_pos, 1
    gt $I11, rx884_eos, rx884_fail
    sub $I11, rx884_pos, rx884_off
    substr $S10, rx884_tgt, $I11, 1
    ne $S10, ")", rx884_fail
    add rx884_pos, 1
.annotate "line", 424
  # rx subrule "O" subtype=capture negate=
    rx884_cur."!cursor_pos"(rx884_pos)
    $P10 = rx884_cur."O"("%methodop")
    unless $P10, rx884_fail
    rx884_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx884_pos = $P10."pos"()
.annotate "line", 422
  # rx pass
    rx884_cur."!cursor_pass"(rx884_pos, "postcircumfix:sym<( )>")
    rx884_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx884_pos)
    .return (rx884_cur)
  rx884_fail:
.annotate "line", 385
    (rx884_rep, rx884_pos, $I10, $P10) = rx884_cur."!mark_fail"(0)
    lt rx884_pos, -1, rx884_done
    eq rx884_pos, -1, rx884_fail
    jump $I10
  rx884_done:
    rx884_cur."!cursor_fail"()
    rx884_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx884_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("218_1259078882.26523") :method
.annotate "line", 385
    $P886 = self."!PREFIX__!subrule"("", "(")
    new $P887, "ResizablePMCArray"
    push $P887, $P886
    .return ($P887)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("219_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx890_tgt
    .local int rx890_pos
    .local int rx890_off
    .local int rx890_eos
    .local int rx890_rep
    .local pmc rx890_cur
    (rx890_cur, rx890_pos, rx890_tgt) = self."!cursor_start"()
    rx890_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx890_cur
    .local pmc match
    .lex "$/", match
    length rx890_eos, rx890_tgt
    set rx890_off, 0
    lt rx890_pos, 2, rx890_start
    sub rx890_off, rx890_pos, 1
    substr rx890_tgt, rx890_tgt, rx890_off
  rx890_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan894_done
    goto rxscan894_scan
  rxscan894_loop:
    ($P10) = rx890_cur."from"()
    inc $P10
    set rx890_pos, $P10
    ge rx890_pos, rx890_eos, rxscan894_done
  rxscan894_scan:
    set_addr $I10, rxscan894_loop
    rx890_cur."!mark_push"(0, rx890_pos, $I10)
  rxscan894_done:
.annotate "line", 427
  # rx subrule "dotty" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."dotty"()
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx890_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx890_cur."!cursor_pos"(rx890_pos)
    $P10 = rx890_cur."O"("%methodop")
    unless $P10, rx890_fail
    rx890_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx890_pos = $P10."pos"()
  # rx pass
    rx890_cur."!cursor_pass"(rx890_pos, "postfix:sym<.>")
    rx890_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx890_pos)
    .return (rx890_cur)
  rx890_fail:
.annotate "line", 385
    (rx890_rep, rx890_pos, $I10, $P10) = rx890_cur."!mark_fail"(0)
    lt rx890_pos, -1, rx890_done
    eq rx890_pos, -1, rx890_fail
    jump $I10
  rx890_done:
    rx890_cur."!cursor_fail"()
    rx890_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx890_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("220_1259078882.26523") :method
.annotate "line", 385
    $P892 = self."!PREFIX__!subrule"("dotty", "")
    new $P893, "ResizablePMCArray"
    push $P893, $P892
    .return ($P893)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("221_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx896_tgt
    .local int rx896_pos
    .local int rx896_off
    .local int rx896_eos
    .local int rx896_rep
    .local pmc rx896_cur
    (rx896_cur, rx896_pos, rx896_tgt) = self."!cursor_start"()
    rx896_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx896_cur
    .local pmc match
    .lex "$/", match
    length rx896_eos, rx896_tgt
    set rx896_off, 0
    lt rx896_pos, 2, rx896_start
    sub rx896_off, rx896_pos, 1
    substr rx896_tgt, rx896_tgt, rx896_off
  rx896_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan900_done
    goto rxscan900_scan
  rxscan900_loop:
    ($P10) = rx896_cur."from"()
    inc $P10
    set rx896_pos, $P10
    ge rx896_pos, rx896_eos, rxscan900_done
  rxscan900_scan:
    set_addr $I10, rxscan900_loop
    rx896_cur."!mark_push"(0, rx896_pos, $I10)
  rxscan900_done:
.annotate "line", 429
  # rx subcapture "sym"
    set_addr $I10, rxcap_901_fail
    rx896_cur."!mark_push"(0, rx896_pos, $I10)
  # rx literal  "++"
    add $I11, rx896_pos, 2
    gt $I11, rx896_eos, rx896_fail
    sub $I11, rx896_pos, rx896_off
    substr $S10, rx896_tgt, $I11, 2
    ne $S10, "++", rx896_fail
    add rx896_pos, 2
    set_addr $I10, rxcap_901_fail
    ($I12, $I11) = rx896_cur."!mark_peek"($I10)
    rx896_cur."!cursor_pos"($I11)
    ($P10) = rx896_cur."!cursor_start"()
    $P10."!cursor_pass"(rx896_pos, "")
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_901_done
  rxcap_901_fail:
    goto rx896_fail
  rxcap_901_done:
  # rx subrule "O" subtype=capture negate=
    rx896_cur."!cursor_pos"(rx896_pos)
    $P10 = rx896_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx896_fail
    rx896_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx896_pos = $P10."pos"()
  # rx pass
    rx896_cur."!cursor_pass"(rx896_pos, "prefix:sym<++>")
    rx896_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx896_pos)
    .return (rx896_cur)
  rx896_fail:
.annotate "line", 385
    (rx896_rep, rx896_pos, $I10, $P10) = rx896_cur."!mark_fail"(0)
    lt rx896_pos, -1, rx896_done
    eq rx896_pos, -1, rx896_fail
    jump $I10
  rx896_done:
    rx896_cur."!cursor_fail"()
    rx896_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx896_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("222_1259078882.26523") :method
.annotate "line", 385
    $P898 = self."!PREFIX__!subrule"("O", "++")
    new $P899, "ResizablePMCArray"
    push $P899, $P898
    .return ($P899)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("223_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx903_tgt
    .local int rx903_pos
    .local int rx903_off
    .local int rx903_eos
    .local int rx903_rep
    .local pmc rx903_cur
    (rx903_cur, rx903_pos, rx903_tgt) = self."!cursor_start"()
    rx903_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx903_cur
    .local pmc match
    .lex "$/", match
    length rx903_eos, rx903_tgt
    set rx903_off, 0
    lt rx903_pos, 2, rx903_start
    sub rx903_off, rx903_pos, 1
    substr rx903_tgt, rx903_tgt, rx903_off
  rx903_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan907_done
    goto rxscan907_scan
  rxscan907_loop:
    ($P10) = rx903_cur."from"()
    inc $P10
    set rx903_pos, $P10
    ge rx903_pos, rx903_eos, rxscan907_done
  rxscan907_scan:
    set_addr $I10, rxscan907_loop
    rx903_cur."!mark_push"(0, rx903_pos, $I10)
  rxscan907_done:
.annotate "line", 430
  # rx subcapture "sym"
    set_addr $I10, rxcap_908_fail
    rx903_cur."!mark_push"(0, rx903_pos, $I10)
  # rx literal  "--"
    add $I11, rx903_pos, 2
    gt $I11, rx903_eos, rx903_fail
    sub $I11, rx903_pos, rx903_off
    substr $S10, rx903_tgt, $I11, 2
    ne $S10, "--", rx903_fail
    add rx903_pos, 2
    set_addr $I10, rxcap_908_fail
    ($I12, $I11) = rx903_cur."!mark_peek"($I10)
    rx903_cur."!cursor_pos"($I11)
    ($P10) = rx903_cur."!cursor_start"()
    $P10."!cursor_pass"(rx903_pos, "")
    rx903_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_908_done
  rxcap_908_fail:
    goto rx903_fail
  rxcap_908_done:
  # rx subrule "O" subtype=capture negate=
    rx903_cur."!cursor_pos"(rx903_pos)
    $P10 = rx903_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx903_fail
    rx903_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx903_pos = $P10."pos"()
  # rx pass
    rx903_cur."!cursor_pass"(rx903_pos, "prefix:sym<-->")
    rx903_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx903_pos)
    .return (rx903_cur)
  rx903_fail:
.annotate "line", 385
    (rx903_rep, rx903_pos, $I10, $P10) = rx903_cur."!mark_fail"(0)
    lt rx903_pos, -1, rx903_done
    eq rx903_pos, -1, rx903_fail
    jump $I10
  rx903_done:
    rx903_cur."!cursor_fail"()
    rx903_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx903_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("224_1259078882.26523") :method
.annotate "line", 385
    $P905 = self."!PREFIX__!subrule"("O", "--")
    new $P906, "ResizablePMCArray"
    push $P906, $P905
    .return ($P906)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("225_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx910_tgt
    .local int rx910_pos
    .local int rx910_off
    .local int rx910_eos
    .local int rx910_rep
    .local pmc rx910_cur
    (rx910_cur, rx910_pos, rx910_tgt) = self."!cursor_start"()
    rx910_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx910_cur
    .local pmc match
    .lex "$/", match
    length rx910_eos, rx910_tgt
    set rx910_off, 0
    lt rx910_pos, 2, rx910_start
    sub rx910_off, rx910_pos, 1
    substr rx910_tgt, rx910_tgt, rx910_off
  rx910_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan914_done
    goto rxscan914_scan
  rxscan914_loop:
    ($P10) = rx910_cur."from"()
    inc $P10
    set rx910_pos, $P10
    ge rx910_pos, rx910_eos, rxscan914_done
  rxscan914_scan:
    set_addr $I10, rxscan914_loop
    rx910_cur."!mark_push"(0, rx910_pos, $I10)
  rxscan914_done:
.annotate "line", 433
  # rx subcapture "sym"
    set_addr $I10, rxcap_915_fail
    rx910_cur."!mark_push"(0, rx910_pos, $I10)
  # rx literal  "++"
    add $I11, rx910_pos, 2
    gt $I11, rx910_eos, rx910_fail
    sub $I11, rx910_pos, rx910_off
    substr $S10, rx910_tgt, $I11, 2
    ne $S10, "++", rx910_fail
    add rx910_pos, 2
    set_addr $I10, rxcap_915_fail
    ($I12, $I11) = rx910_cur."!mark_peek"($I10)
    rx910_cur."!cursor_pos"($I11)
    ($P10) = rx910_cur."!cursor_start"()
    $P10."!cursor_pass"(rx910_pos, "")
    rx910_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_915_done
  rxcap_915_fail:
    goto rx910_fail
  rxcap_915_done:
  # rx subrule "O" subtype=capture negate=
    rx910_cur."!cursor_pos"(rx910_pos)
    $P10 = rx910_cur."O"("%autoincrement")
    unless $P10, rx910_fail
    rx910_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx910_pos = $P10."pos"()
  # rx pass
    rx910_cur."!cursor_pass"(rx910_pos, "postfix:sym<++>")
    rx910_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx910_pos)
    .return (rx910_cur)
  rx910_fail:
.annotate "line", 385
    (rx910_rep, rx910_pos, $I10, $P10) = rx910_cur."!mark_fail"(0)
    lt rx910_pos, -1, rx910_done
    eq rx910_pos, -1, rx910_fail
    jump $I10
  rx910_done:
    rx910_cur."!cursor_fail"()
    rx910_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx910_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("226_1259078882.26523") :method
.annotate "line", 385
    $P912 = self."!PREFIX__!subrule"("O", "++")
    new $P913, "ResizablePMCArray"
    push $P913, $P912
    .return ($P913)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("227_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx917_tgt
    .local int rx917_pos
    .local int rx917_off
    .local int rx917_eos
    .local int rx917_rep
    .local pmc rx917_cur
    (rx917_cur, rx917_pos, rx917_tgt) = self."!cursor_start"()
    rx917_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx917_cur
    .local pmc match
    .lex "$/", match
    length rx917_eos, rx917_tgt
    set rx917_off, 0
    lt rx917_pos, 2, rx917_start
    sub rx917_off, rx917_pos, 1
    substr rx917_tgt, rx917_tgt, rx917_off
  rx917_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan921_done
    goto rxscan921_scan
  rxscan921_loop:
    ($P10) = rx917_cur."from"()
    inc $P10
    set rx917_pos, $P10
    ge rx917_pos, rx917_eos, rxscan921_done
  rxscan921_scan:
    set_addr $I10, rxscan921_loop
    rx917_cur."!mark_push"(0, rx917_pos, $I10)
  rxscan921_done:
.annotate "line", 434
  # rx subcapture "sym"
    set_addr $I10, rxcap_922_fail
    rx917_cur."!mark_push"(0, rx917_pos, $I10)
  # rx literal  "--"
    add $I11, rx917_pos, 2
    gt $I11, rx917_eos, rx917_fail
    sub $I11, rx917_pos, rx917_off
    substr $S10, rx917_tgt, $I11, 2
    ne $S10, "--", rx917_fail
    add rx917_pos, 2
    set_addr $I10, rxcap_922_fail
    ($I12, $I11) = rx917_cur."!mark_peek"($I10)
    rx917_cur."!cursor_pos"($I11)
    ($P10) = rx917_cur."!cursor_start"()
    $P10."!cursor_pass"(rx917_pos, "")
    rx917_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_922_done
  rxcap_922_fail:
    goto rx917_fail
  rxcap_922_done:
  # rx subrule "O" subtype=capture negate=
    rx917_cur."!cursor_pos"(rx917_pos)
    $P10 = rx917_cur."O"("%autoincrement")
    unless $P10, rx917_fail
    rx917_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx917_pos = $P10."pos"()
  # rx pass
    rx917_cur."!cursor_pass"(rx917_pos, "postfix:sym<-->")
    rx917_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx917_pos)
    .return (rx917_cur)
  rx917_fail:
.annotate "line", 385
    (rx917_rep, rx917_pos, $I10, $P10) = rx917_cur."!mark_fail"(0)
    lt rx917_pos, -1, rx917_done
    eq rx917_pos, -1, rx917_fail
    jump $I10
  rx917_done:
    rx917_cur."!cursor_fail"()
    rx917_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx917_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("228_1259078882.26523") :method
.annotate "line", 385
    $P919 = self."!PREFIX__!subrule"("O", "--")
    new $P920, "ResizablePMCArray"
    push $P920, $P919
    .return ($P920)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("229_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx924_tgt
    .local int rx924_pos
    .local int rx924_off
    .local int rx924_eos
    .local int rx924_rep
    .local pmc rx924_cur
    (rx924_cur, rx924_pos, rx924_tgt) = self."!cursor_start"()
    rx924_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx924_cur
    .local pmc match
    .lex "$/", match
    length rx924_eos, rx924_tgt
    set rx924_off, 0
    lt rx924_pos, 2, rx924_start
    sub rx924_off, rx924_pos, 1
    substr rx924_tgt, rx924_tgt, rx924_off
  rx924_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan928_done
    goto rxscan928_scan
  rxscan928_loop:
    ($P10) = rx924_cur."from"()
    inc $P10
    set rx924_pos, $P10
    ge rx924_pos, rx924_eos, rxscan928_done
  rxscan928_scan:
    set_addr $I10, rxscan928_loop
    rx924_cur."!mark_push"(0, rx924_pos, $I10)
  rxscan928_done:
.annotate "line", 436
  # rx subcapture "sym"
    set_addr $I10, rxcap_929_fail
    rx924_cur."!mark_push"(0, rx924_pos, $I10)
  # rx literal  "**"
    add $I11, rx924_pos, 2
    gt $I11, rx924_eos, rx924_fail
    sub $I11, rx924_pos, rx924_off
    substr $S10, rx924_tgt, $I11, 2
    ne $S10, "**", rx924_fail
    add rx924_pos, 2
    set_addr $I10, rxcap_929_fail
    ($I12, $I11) = rx924_cur."!mark_peek"($I10)
    rx924_cur."!cursor_pos"($I11)
    ($P10) = rx924_cur."!cursor_start"()
    $P10."!cursor_pass"(rx924_pos, "")
    rx924_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_929_done
  rxcap_929_fail:
    goto rx924_fail
  rxcap_929_done:
  # rx subrule "O" subtype=capture negate=
    rx924_cur."!cursor_pos"(rx924_pos)
    $P10 = rx924_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx924_fail
    rx924_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx924_pos = $P10."pos"()
  # rx pass
    rx924_cur."!cursor_pass"(rx924_pos, "infix:sym<**>")
    rx924_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx924_pos)
    .return (rx924_cur)
  rx924_fail:
.annotate "line", 385
    (rx924_rep, rx924_pos, $I10, $P10) = rx924_cur."!mark_fail"(0)
    lt rx924_pos, -1, rx924_done
    eq rx924_pos, -1, rx924_fail
    jump $I10
  rx924_done:
    rx924_cur."!cursor_fail"()
    rx924_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx924_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("230_1259078882.26523") :method
.annotate "line", 385
    $P926 = self."!PREFIX__!subrule"("O", "**")
    new $P927, "ResizablePMCArray"
    push $P927, $P926
    .return ($P927)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("231_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx931_tgt
    .local int rx931_pos
    .local int rx931_off
    .local int rx931_eos
    .local int rx931_rep
    .local pmc rx931_cur
    (rx931_cur, rx931_pos, rx931_tgt) = self."!cursor_start"()
    rx931_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx931_cur
    .local pmc match
    .lex "$/", match
    length rx931_eos, rx931_tgt
    set rx931_off, 0
    lt rx931_pos, 2, rx931_start
    sub rx931_off, rx931_pos, 1
    substr rx931_tgt, rx931_tgt, rx931_off
  rx931_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan935_done
    goto rxscan935_scan
  rxscan935_loop:
    ($P10) = rx931_cur."from"()
    inc $P10
    set rx931_pos, $P10
    ge rx931_pos, rx931_eos, rxscan935_done
  rxscan935_scan:
    set_addr $I10, rxscan935_loop
    rx931_cur."!mark_push"(0, rx931_pos, $I10)
  rxscan935_done:
.annotate "line", 438
  # rx subcapture "sym"
    set_addr $I10, rxcap_936_fail
    rx931_cur."!mark_push"(0, rx931_pos, $I10)
  # rx literal  "+"
    add $I11, rx931_pos, 1
    gt $I11, rx931_eos, rx931_fail
    sub $I11, rx931_pos, rx931_off
    substr $S10, rx931_tgt, $I11, 1
    ne $S10, "+", rx931_fail
    add rx931_pos, 1
    set_addr $I10, rxcap_936_fail
    ($I12, $I11) = rx931_cur."!mark_peek"($I10)
    rx931_cur."!cursor_pos"($I11)
    ($P10) = rx931_cur."!cursor_start"()
    $P10."!cursor_pass"(rx931_pos, "")
    rx931_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_936_done
  rxcap_936_fail:
    goto rx931_fail
  rxcap_936_done:
  # rx subrule "O" subtype=capture negate=
    rx931_cur."!cursor_pos"(rx931_pos)
    $P10 = rx931_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx931_fail
    rx931_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx931_pos = $P10."pos"()
  # rx pass
    rx931_cur."!cursor_pass"(rx931_pos, "prefix:sym<+>")
    rx931_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx931_pos)
    .return (rx931_cur)
  rx931_fail:
.annotate "line", 385
    (rx931_rep, rx931_pos, $I10, $P10) = rx931_cur."!mark_fail"(0)
    lt rx931_pos, -1, rx931_done
    eq rx931_pos, -1, rx931_fail
    jump $I10
  rx931_done:
    rx931_cur."!cursor_fail"()
    rx931_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx931_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("232_1259078882.26523") :method
.annotate "line", 385
    $P933 = self."!PREFIX__!subrule"("O", "+")
    new $P934, "ResizablePMCArray"
    push $P934, $P933
    .return ($P934)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("233_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx938_tgt
    .local int rx938_pos
    .local int rx938_off
    .local int rx938_eos
    .local int rx938_rep
    .local pmc rx938_cur
    (rx938_cur, rx938_pos, rx938_tgt) = self."!cursor_start"()
    rx938_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx938_cur
    .local pmc match
    .lex "$/", match
    length rx938_eos, rx938_tgt
    set rx938_off, 0
    lt rx938_pos, 2, rx938_start
    sub rx938_off, rx938_pos, 1
    substr rx938_tgt, rx938_tgt, rx938_off
  rx938_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan942_done
    goto rxscan942_scan
  rxscan942_loop:
    ($P10) = rx938_cur."from"()
    inc $P10
    set rx938_pos, $P10
    ge rx938_pos, rx938_eos, rxscan942_done
  rxscan942_scan:
    set_addr $I10, rxscan942_loop
    rx938_cur."!mark_push"(0, rx938_pos, $I10)
  rxscan942_done:
.annotate "line", 439
  # rx subcapture "sym"
    set_addr $I10, rxcap_943_fail
    rx938_cur."!mark_push"(0, rx938_pos, $I10)
  # rx literal  "~"
    add $I11, rx938_pos, 1
    gt $I11, rx938_eos, rx938_fail
    sub $I11, rx938_pos, rx938_off
    substr $S10, rx938_tgt, $I11, 1
    ne $S10, "~", rx938_fail
    add rx938_pos, 1
    set_addr $I10, rxcap_943_fail
    ($I12, $I11) = rx938_cur."!mark_peek"($I10)
    rx938_cur."!cursor_pos"($I11)
    ($P10) = rx938_cur."!cursor_start"()
    $P10."!cursor_pass"(rx938_pos, "")
    rx938_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_943_done
  rxcap_943_fail:
    goto rx938_fail
  rxcap_943_done:
  # rx subrule "O" subtype=capture negate=
    rx938_cur."!cursor_pos"(rx938_pos)
    $P10 = rx938_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx938_fail
    rx938_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx938_pos = $P10."pos"()
  # rx pass
    rx938_cur."!cursor_pass"(rx938_pos, "prefix:sym<~>")
    rx938_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx938_pos)
    .return (rx938_cur)
  rx938_fail:
.annotate "line", 385
    (rx938_rep, rx938_pos, $I10, $P10) = rx938_cur."!mark_fail"(0)
    lt rx938_pos, -1, rx938_done
    eq rx938_pos, -1, rx938_fail
    jump $I10
  rx938_done:
    rx938_cur."!cursor_fail"()
    rx938_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx938_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("234_1259078882.26523") :method
.annotate "line", 385
    $P940 = self."!PREFIX__!subrule"("O", "~")
    new $P941, "ResizablePMCArray"
    push $P941, $P940
    .return ($P941)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("235_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx945_tgt
    .local int rx945_pos
    .local int rx945_off
    .local int rx945_eos
    .local int rx945_rep
    .local pmc rx945_cur
    (rx945_cur, rx945_pos, rx945_tgt) = self."!cursor_start"()
    rx945_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx945_cur
    .local pmc match
    .lex "$/", match
    length rx945_eos, rx945_tgt
    set rx945_off, 0
    lt rx945_pos, 2, rx945_start
    sub rx945_off, rx945_pos, 1
    substr rx945_tgt, rx945_tgt, rx945_off
  rx945_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan948_done
    goto rxscan948_scan
  rxscan948_loop:
    ($P10) = rx945_cur."from"()
    inc $P10
    set rx945_pos, $P10
    ge rx945_pos, rx945_eos, rxscan948_done
  rxscan948_scan:
    set_addr $I10, rxscan948_loop
    rx945_cur."!mark_push"(0, rx945_pos, $I10)
  rxscan948_done:
.annotate "line", 440
  # rx subcapture "sym"
    set_addr $I10, rxcap_949_fail
    rx945_cur."!mark_push"(0, rx945_pos, $I10)
  # rx literal  "-"
    add $I11, rx945_pos, 1
    gt $I11, rx945_eos, rx945_fail
    sub $I11, rx945_pos, rx945_off
    substr $S10, rx945_tgt, $I11, 1
    ne $S10, "-", rx945_fail
    add rx945_pos, 1
    set_addr $I10, rxcap_949_fail
    ($I12, $I11) = rx945_cur."!mark_peek"($I10)
    rx945_cur."!cursor_pos"($I11)
    ($P10) = rx945_cur."!cursor_start"()
    $P10."!cursor_pass"(rx945_pos, "")
    rx945_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_949_done
  rxcap_949_fail:
    goto rx945_fail
  rxcap_949_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx945_pos, rx945_eos, rx945_fail
    sub $I10, rx945_pos, rx945_off
    substr $S10, rx945_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx945_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx945_cur."!cursor_pos"(rx945_pos)
    $P10 = rx945_cur."number"()
    if $P10, rx945_fail
  # rx subrule "O" subtype=capture negate=
    rx945_cur."!cursor_pos"(rx945_pos)
    $P10 = rx945_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx945_fail
    rx945_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx945_pos = $P10."pos"()
  # rx pass
    rx945_cur."!cursor_pass"(rx945_pos, "prefix:sym<->")
    rx945_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx945_pos)
    .return (rx945_cur)
  rx945_fail:
.annotate "line", 385
    (rx945_rep, rx945_pos, $I10, $P10) = rx945_cur."!mark_fail"(0)
    lt rx945_pos, -1, rx945_done
    eq rx945_pos, -1, rx945_fail
    jump $I10
  rx945_done:
    rx945_cur."!cursor_fail"()
    rx945_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx945_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("236_1259078882.26523") :method
.annotate "line", 385
    new $P947, "ResizablePMCArray"
    push $P947, "-"
    .return ($P947)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("237_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx951_tgt
    .local int rx951_pos
    .local int rx951_off
    .local int rx951_eos
    .local int rx951_rep
    .local pmc rx951_cur
    (rx951_cur, rx951_pos, rx951_tgt) = self."!cursor_start"()
    rx951_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx951_cur
    .local pmc match
    .lex "$/", match
    length rx951_eos, rx951_tgt
    set rx951_off, 0
    lt rx951_pos, 2, rx951_start
    sub rx951_off, rx951_pos, 1
    substr rx951_tgt, rx951_tgt, rx951_off
  rx951_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan955_done
    goto rxscan955_scan
  rxscan955_loop:
    ($P10) = rx951_cur."from"()
    inc $P10
    set rx951_pos, $P10
    ge rx951_pos, rx951_eos, rxscan955_done
  rxscan955_scan:
    set_addr $I10, rxscan955_loop
    rx951_cur."!mark_push"(0, rx951_pos, $I10)
  rxscan955_done:
.annotate "line", 441
  # rx subcapture "sym"
    set_addr $I10, rxcap_956_fail
    rx951_cur."!mark_push"(0, rx951_pos, $I10)
  # rx literal  "?"
    add $I11, rx951_pos, 1
    gt $I11, rx951_eos, rx951_fail
    sub $I11, rx951_pos, rx951_off
    substr $S10, rx951_tgt, $I11, 1
    ne $S10, "?", rx951_fail
    add rx951_pos, 1
    set_addr $I10, rxcap_956_fail
    ($I12, $I11) = rx951_cur."!mark_peek"($I10)
    rx951_cur."!cursor_pos"($I11)
    ($P10) = rx951_cur."!cursor_start"()
    $P10."!cursor_pass"(rx951_pos, "")
    rx951_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_956_done
  rxcap_956_fail:
    goto rx951_fail
  rxcap_956_done:
  # rx subrule "O" subtype=capture negate=
    rx951_cur."!cursor_pos"(rx951_pos)
    $P10 = rx951_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx951_fail
    rx951_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx951_pos = $P10."pos"()
  # rx pass
    rx951_cur."!cursor_pass"(rx951_pos, "prefix:sym<?>")
    rx951_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx951_pos)
    .return (rx951_cur)
  rx951_fail:
.annotate "line", 385
    (rx951_rep, rx951_pos, $I10, $P10) = rx951_cur."!mark_fail"(0)
    lt rx951_pos, -1, rx951_done
    eq rx951_pos, -1, rx951_fail
    jump $I10
  rx951_done:
    rx951_cur."!cursor_fail"()
    rx951_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx951_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("238_1259078882.26523") :method
.annotate "line", 385
    $P953 = self."!PREFIX__!subrule"("O", "?")
    new $P954, "ResizablePMCArray"
    push $P954, $P953
    .return ($P954)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("239_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx958_tgt
    .local int rx958_pos
    .local int rx958_off
    .local int rx958_eos
    .local int rx958_rep
    .local pmc rx958_cur
    (rx958_cur, rx958_pos, rx958_tgt) = self."!cursor_start"()
    rx958_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx958_cur
    .local pmc match
    .lex "$/", match
    length rx958_eos, rx958_tgt
    set rx958_off, 0
    lt rx958_pos, 2, rx958_start
    sub rx958_off, rx958_pos, 1
    substr rx958_tgt, rx958_tgt, rx958_off
  rx958_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan962_done
    goto rxscan962_scan
  rxscan962_loop:
    ($P10) = rx958_cur."from"()
    inc $P10
    set rx958_pos, $P10
    ge rx958_pos, rx958_eos, rxscan962_done
  rxscan962_scan:
    set_addr $I10, rxscan962_loop
    rx958_cur."!mark_push"(0, rx958_pos, $I10)
  rxscan962_done:
.annotate "line", 442
  # rx subcapture "sym"
    set_addr $I10, rxcap_963_fail
    rx958_cur."!mark_push"(0, rx958_pos, $I10)
  # rx literal  "!"
    add $I11, rx958_pos, 1
    gt $I11, rx958_eos, rx958_fail
    sub $I11, rx958_pos, rx958_off
    substr $S10, rx958_tgt, $I11, 1
    ne $S10, "!", rx958_fail
    add rx958_pos, 1
    set_addr $I10, rxcap_963_fail
    ($I12, $I11) = rx958_cur."!mark_peek"($I10)
    rx958_cur."!cursor_pos"($I11)
    ($P10) = rx958_cur."!cursor_start"()
    $P10."!cursor_pass"(rx958_pos, "")
    rx958_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_963_done
  rxcap_963_fail:
    goto rx958_fail
  rxcap_963_done:
  # rx subrule "O" subtype=capture negate=
    rx958_cur."!cursor_pos"(rx958_pos)
    $P10 = rx958_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx958_fail
    rx958_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx958_pos = $P10."pos"()
  # rx pass
    rx958_cur."!cursor_pass"(rx958_pos, "prefix:sym<!>")
    rx958_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx958_pos)
    .return (rx958_cur)
  rx958_fail:
.annotate "line", 385
    (rx958_rep, rx958_pos, $I10, $P10) = rx958_cur."!mark_fail"(0)
    lt rx958_pos, -1, rx958_done
    eq rx958_pos, -1, rx958_fail
    jump $I10
  rx958_done:
    rx958_cur."!cursor_fail"()
    rx958_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx958_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("240_1259078882.26523") :method
.annotate "line", 385
    $P960 = self."!PREFIX__!subrule"("O", "!")
    new $P961, "ResizablePMCArray"
    push $P961, $P960
    .return ($P961)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("241_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx965_tgt
    .local int rx965_pos
    .local int rx965_off
    .local int rx965_eos
    .local int rx965_rep
    .local pmc rx965_cur
    (rx965_cur, rx965_pos, rx965_tgt) = self."!cursor_start"()
    rx965_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx965_cur
    .local pmc match
    .lex "$/", match
    length rx965_eos, rx965_tgt
    set rx965_off, 0
    lt rx965_pos, 2, rx965_start
    sub rx965_off, rx965_pos, 1
    substr rx965_tgt, rx965_tgt, rx965_off
  rx965_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan969_done
    goto rxscan969_scan
  rxscan969_loop:
    ($P10) = rx965_cur."from"()
    inc $P10
    set rx965_pos, $P10
    ge rx965_pos, rx965_eos, rxscan969_done
  rxscan969_scan:
    set_addr $I10, rxscan969_loop
    rx965_cur."!mark_push"(0, rx965_pos, $I10)
  rxscan969_done:
.annotate "line", 443
  # rx subcapture "sym"
    set_addr $I10, rxcap_970_fail
    rx965_cur."!mark_push"(0, rx965_pos, $I10)
  # rx literal  "|"
    add $I11, rx965_pos, 1
    gt $I11, rx965_eos, rx965_fail
    sub $I11, rx965_pos, rx965_off
    substr $S10, rx965_tgt, $I11, 1
    ne $S10, "|", rx965_fail
    add rx965_pos, 1
    set_addr $I10, rxcap_970_fail
    ($I12, $I11) = rx965_cur."!mark_peek"($I10)
    rx965_cur."!cursor_pos"($I11)
    ($P10) = rx965_cur."!cursor_start"()
    $P10."!cursor_pass"(rx965_pos, "")
    rx965_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_970_done
  rxcap_970_fail:
    goto rx965_fail
  rxcap_970_done:
  # rx subrule "O" subtype=capture negate=
    rx965_cur."!cursor_pos"(rx965_pos)
    $P10 = rx965_cur."O"("%symbolic_unary")
    unless $P10, rx965_fail
    rx965_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx965_pos = $P10."pos"()
  # rx pass
    rx965_cur."!cursor_pass"(rx965_pos, "prefix:sym<|>")
    rx965_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx965_pos)
    .return (rx965_cur)
  rx965_fail:
.annotate "line", 385
    (rx965_rep, rx965_pos, $I10, $P10) = rx965_cur."!mark_fail"(0)
    lt rx965_pos, -1, rx965_done
    eq rx965_pos, -1, rx965_fail
    jump $I10
  rx965_done:
    rx965_cur."!cursor_fail"()
    rx965_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx965_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("242_1259078882.26523") :method
.annotate "line", 385
    $P967 = self."!PREFIX__!subrule"("O", "|")
    new $P968, "ResizablePMCArray"
    push $P968, $P967
    .return ($P968)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("243_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx972_tgt
    .local int rx972_pos
    .local int rx972_off
    .local int rx972_eos
    .local int rx972_rep
    .local pmc rx972_cur
    (rx972_cur, rx972_pos, rx972_tgt) = self."!cursor_start"()
    rx972_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx972_cur
    .local pmc match
    .lex "$/", match
    length rx972_eos, rx972_tgt
    set rx972_off, 0
    lt rx972_pos, 2, rx972_start
    sub rx972_off, rx972_pos, 1
    substr rx972_tgt, rx972_tgt, rx972_off
  rx972_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan976_done
    goto rxscan976_scan
  rxscan976_loop:
    ($P10) = rx972_cur."from"()
    inc $P10
    set rx972_pos, $P10
    ge rx972_pos, rx972_eos, rxscan976_done
  rxscan976_scan:
    set_addr $I10, rxscan976_loop
    rx972_cur."!mark_push"(0, rx972_pos, $I10)
  rxscan976_done:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_977_fail
    rx972_cur."!mark_push"(0, rx972_pos, $I10)
  # rx literal  "*"
    add $I11, rx972_pos, 1
    gt $I11, rx972_eos, rx972_fail
    sub $I11, rx972_pos, rx972_off
    substr $S10, rx972_tgt, $I11, 1
    ne $S10, "*", rx972_fail
    add rx972_pos, 1
    set_addr $I10, rxcap_977_fail
    ($I12, $I11) = rx972_cur."!mark_peek"($I10)
    rx972_cur."!cursor_pos"($I11)
    ($P10) = rx972_cur."!cursor_start"()
    $P10."!cursor_pass"(rx972_pos, "")
    rx972_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_977_done
  rxcap_977_fail:
    goto rx972_fail
  rxcap_977_done:
  # rx subrule "O" subtype=capture negate=
    rx972_cur."!cursor_pos"(rx972_pos)
    $P10 = rx972_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx972_fail
    rx972_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx972_pos = $P10."pos"()
  # rx pass
    rx972_cur."!cursor_pass"(rx972_pos, "infix:sym<*>")
    rx972_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx972_pos)
    .return (rx972_cur)
  rx972_fail:
.annotate "line", 385
    (rx972_rep, rx972_pos, $I10, $P10) = rx972_cur."!mark_fail"(0)
    lt rx972_pos, -1, rx972_done
    eq rx972_pos, -1, rx972_fail
    jump $I10
  rx972_done:
    rx972_cur."!cursor_fail"()
    rx972_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx972_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("244_1259078882.26523") :method
.annotate "line", 385
    $P974 = self."!PREFIX__!subrule"("O", "*")
    new $P975, "ResizablePMCArray"
    push $P975, $P974
    .return ($P975)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("245_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx979_tgt
    .local int rx979_pos
    .local int rx979_off
    .local int rx979_eos
    .local int rx979_rep
    .local pmc rx979_cur
    (rx979_cur, rx979_pos, rx979_tgt) = self."!cursor_start"()
    rx979_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx979_cur
    .local pmc match
    .lex "$/", match
    length rx979_eos, rx979_tgt
    set rx979_off, 0
    lt rx979_pos, 2, rx979_start
    sub rx979_off, rx979_pos, 1
    substr rx979_tgt, rx979_tgt, rx979_off
  rx979_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan983_done
    goto rxscan983_scan
  rxscan983_loop:
    ($P10) = rx979_cur."from"()
    inc $P10
    set rx979_pos, $P10
    ge rx979_pos, rx979_eos, rxscan983_done
  rxscan983_scan:
    set_addr $I10, rxscan983_loop
    rx979_cur."!mark_push"(0, rx979_pos, $I10)
  rxscan983_done:
.annotate "line", 446
  # rx subcapture "sym"
    set_addr $I10, rxcap_984_fail
    rx979_cur."!mark_push"(0, rx979_pos, $I10)
  # rx literal  "/"
    add $I11, rx979_pos, 1
    gt $I11, rx979_eos, rx979_fail
    sub $I11, rx979_pos, rx979_off
    substr $S10, rx979_tgt, $I11, 1
    ne $S10, "/", rx979_fail
    add rx979_pos, 1
    set_addr $I10, rxcap_984_fail
    ($I12, $I11) = rx979_cur."!mark_peek"($I10)
    rx979_cur."!cursor_pos"($I11)
    ($P10) = rx979_cur."!cursor_start"()
    $P10."!cursor_pass"(rx979_pos, "")
    rx979_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_984_done
  rxcap_984_fail:
    goto rx979_fail
  rxcap_984_done:
  # rx subrule "O" subtype=capture negate=
    rx979_cur."!cursor_pos"(rx979_pos)
    $P10 = rx979_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx979_fail
    rx979_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx979_pos = $P10."pos"()
  # rx pass
    rx979_cur."!cursor_pass"(rx979_pos, "infix:sym</>")
    rx979_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx979_pos)
    .return (rx979_cur)
  rx979_fail:
.annotate "line", 385
    (rx979_rep, rx979_pos, $I10, $P10) = rx979_cur."!mark_fail"(0)
    lt rx979_pos, -1, rx979_done
    eq rx979_pos, -1, rx979_fail
    jump $I10
  rx979_done:
    rx979_cur."!cursor_fail"()
    rx979_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx979_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("246_1259078882.26523") :method
.annotate "line", 385
    $P981 = self."!PREFIX__!subrule"("O", "/")
    new $P982, "ResizablePMCArray"
    push $P982, $P981
    .return ($P982)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("247_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx986_tgt
    .local int rx986_pos
    .local int rx986_off
    .local int rx986_eos
    .local int rx986_rep
    .local pmc rx986_cur
    (rx986_cur, rx986_pos, rx986_tgt) = self."!cursor_start"()
    rx986_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx986_cur
    .local pmc match
    .lex "$/", match
    length rx986_eos, rx986_tgt
    set rx986_off, 0
    lt rx986_pos, 2, rx986_start
    sub rx986_off, rx986_pos, 1
    substr rx986_tgt, rx986_tgt, rx986_off
  rx986_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan990_done
    goto rxscan990_scan
  rxscan990_loop:
    ($P10) = rx986_cur."from"()
    inc $P10
    set rx986_pos, $P10
    ge rx986_pos, rx986_eos, rxscan990_done
  rxscan990_scan:
    set_addr $I10, rxscan990_loop
    rx986_cur."!mark_push"(0, rx986_pos, $I10)
  rxscan990_done:
.annotate "line", 447
  # rx subcapture "sym"
    set_addr $I10, rxcap_991_fail
    rx986_cur."!mark_push"(0, rx986_pos, $I10)
  # rx literal  "%"
    add $I11, rx986_pos, 1
    gt $I11, rx986_eos, rx986_fail
    sub $I11, rx986_pos, rx986_off
    substr $S10, rx986_tgt, $I11, 1
    ne $S10, "%", rx986_fail
    add rx986_pos, 1
    set_addr $I10, rxcap_991_fail
    ($I12, $I11) = rx986_cur."!mark_peek"($I10)
    rx986_cur."!cursor_pos"($I11)
    ($P10) = rx986_cur."!cursor_start"()
    $P10."!cursor_pass"(rx986_pos, "")
    rx986_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_991_done
  rxcap_991_fail:
    goto rx986_fail
  rxcap_991_done:
  # rx subrule "O" subtype=capture negate=
    rx986_cur."!cursor_pos"(rx986_pos)
    $P10 = rx986_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx986_fail
    rx986_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx986_pos = $P10."pos"()
  # rx pass
    rx986_cur."!cursor_pass"(rx986_pos, "infix:sym<%>")
    rx986_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx986_pos)
    .return (rx986_cur)
  rx986_fail:
.annotate "line", 385
    (rx986_rep, rx986_pos, $I10, $P10) = rx986_cur."!mark_fail"(0)
    lt rx986_pos, -1, rx986_done
    eq rx986_pos, -1, rx986_fail
    jump $I10
  rx986_done:
    rx986_cur."!cursor_fail"()
    rx986_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx986_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("248_1259078882.26523") :method
.annotate "line", 385
    $P988 = self."!PREFIX__!subrule"("O", "%")
    new $P989, "ResizablePMCArray"
    push $P989, $P988
    .return ($P989)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("249_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx993_tgt
    .local int rx993_pos
    .local int rx993_off
    .local int rx993_eos
    .local int rx993_rep
    .local pmc rx993_cur
    (rx993_cur, rx993_pos, rx993_tgt) = self."!cursor_start"()
    rx993_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx993_cur
    .local pmc match
    .lex "$/", match
    length rx993_eos, rx993_tgt
    set rx993_off, 0
    lt rx993_pos, 2, rx993_start
    sub rx993_off, rx993_pos, 1
    substr rx993_tgt, rx993_tgt, rx993_off
  rx993_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan997_done
    goto rxscan997_scan
  rxscan997_loop:
    ($P10) = rx993_cur."from"()
    inc $P10
    set rx993_pos, $P10
    ge rx993_pos, rx993_eos, rxscan997_done
  rxscan997_scan:
    set_addr $I10, rxscan997_loop
    rx993_cur."!mark_push"(0, rx993_pos, $I10)
  rxscan997_done:
.annotate "line", 449
  # rx subcapture "sym"
    set_addr $I10, rxcap_998_fail
    rx993_cur."!mark_push"(0, rx993_pos, $I10)
  # rx literal  "+"
    add $I11, rx993_pos, 1
    gt $I11, rx993_eos, rx993_fail
    sub $I11, rx993_pos, rx993_off
    substr $S10, rx993_tgt, $I11, 1
    ne $S10, "+", rx993_fail
    add rx993_pos, 1
    set_addr $I10, rxcap_998_fail
    ($I12, $I11) = rx993_cur."!mark_peek"($I10)
    rx993_cur."!cursor_pos"($I11)
    ($P10) = rx993_cur."!cursor_start"()
    $P10."!cursor_pass"(rx993_pos, "")
    rx993_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_998_done
  rxcap_998_fail:
    goto rx993_fail
  rxcap_998_done:
  # rx subrule "O" subtype=capture negate=
    rx993_cur."!cursor_pos"(rx993_pos)
    $P10 = rx993_cur."O"("%additive, :pirop<add>")
    unless $P10, rx993_fail
    rx993_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx993_pos = $P10."pos"()
  # rx pass
    rx993_cur."!cursor_pass"(rx993_pos, "infix:sym<+>")
    rx993_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx993_pos)
    .return (rx993_cur)
  rx993_fail:
.annotate "line", 385
    (rx993_rep, rx993_pos, $I10, $P10) = rx993_cur."!mark_fail"(0)
    lt rx993_pos, -1, rx993_done
    eq rx993_pos, -1, rx993_fail
    jump $I10
  rx993_done:
    rx993_cur."!cursor_fail"()
    rx993_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx993_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("250_1259078882.26523") :method
.annotate "line", 385
    $P995 = self."!PREFIX__!subrule"("O", "+")
    new $P996, "ResizablePMCArray"
    push $P996, $P995
    .return ($P996)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("251_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1000_tgt
    .local int rx1000_pos
    .local int rx1000_off
    .local int rx1000_eos
    .local int rx1000_rep
    .local pmc rx1000_cur
    (rx1000_cur, rx1000_pos, rx1000_tgt) = self."!cursor_start"()
    rx1000_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1000_cur
    .local pmc match
    .lex "$/", match
    length rx1000_eos, rx1000_tgt
    set rx1000_off, 0
    lt rx1000_pos, 2, rx1000_start
    sub rx1000_off, rx1000_pos, 1
    substr rx1000_tgt, rx1000_tgt, rx1000_off
  rx1000_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1004_done
    goto rxscan1004_scan
  rxscan1004_loop:
    ($P10) = rx1000_cur."from"()
    inc $P10
    set rx1000_pos, $P10
    ge rx1000_pos, rx1000_eos, rxscan1004_done
  rxscan1004_scan:
    set_addr $I10, rxscan1004_loop
    rx1000_cur."!mark_push"(0, rx1000_pos, $I10)
  rxscan1004_done:
.annotate "line", 450
  # rx subcapture "sym"
    set_addr $I10, rxcap_1005_fail
    rx1000_cur."!mark_push"(0, rx1000_pos, $I10)
  # rx literal  "-"
    add $I11, rx1000_pos, 1
    gt $I11, rx1000_eos, rx1000_fail
    sub $I11, rx1000_pos, rx1000_off
    substr $S10, rx1000_tgt, $I11, 1
    ne $S10, "-", rx1000_fail
    add rx1000_pos, 1
    set_addr $I10, rxcap_1005_fail
    ($I12, $I11) = rx1000_cur."!mark_peek"($I10)
    rx1000_cur."!cursor_pos"($I11)
    ($P10) = rx1000_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1000_pos, "")
    rx1000_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1005_done
  rxcap_1005_fail:
    goto rx1000_fail
  rxcap_1005_done:
  # rx subrule "O" subtype=capture negate=
    rx1000_cur."!cursor_pos"(rx1000_pos)
    $P10 = rx1000_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1000_fail
    rx1000_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1000_pos = $P10."pos"()
  # rx pass
    rx1000_cur."!cursor_pass"(rx1000_pos, "infix:sym<->")
    rx1000_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1000_pos)
    .return (rx1000_cur)
  rx1000_fail:
.annotate "line", 385
    (rx1000_rep, rx1000_pos, $I10, $P10) = rx1000_cur."!mark_fail"(0)
    lt rx1000_pos, -1, rx1000_done
    eq rx1000_pos, -1, rx1000_fail
    jump $I10
  rx1000_done:
    rx1000_cur."!cursor_fail"()
    rx1000_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1000_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("252_1259078882.26523") :method
.annotate "line", 385
    $P1002 = self."!PREFIX__!subrule"("O", "-")
    new $P1003, "ResizablePMCArray"
    push $P1003, $P1002
    .return ($P1003)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("253_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1007_tgt
    .local int rx1007_pos
    .local int rx1007_off
    .local int rx1007_eos
    .local int rx1007_rep
    .local pmc rx1007_cur
    (rx1007_cur, rx1007_pos, rx1007_tgt) = self."!cursor_start"()
    rx1007_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1007_cur
    .local pmc match
    .lex "$/", match
    length rx1007_eos, rx1007_tgt
    set rx1007_off, 0
    lt rx1007_pos, 2, rx1007_start
    sub rx1007_off, rx1007_pos, 1
    substr rx1007_tgt, rx1007_tgt, rx1007_off
  rx1007_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1011_done
    goto rxscan1011_scan
  rxscan1011_loop:
    ($P10) = rx1007_cur."from"()
    inc $P10
    set rx1007_pos, $P10
    ge rx1007_pos, rx1007_eos, rxscan1011_done
  rxscan1011_scan:
    set_addr $I10, rxscan1011_loop
    rx1007_cur."!mark_push"(0, rx1007_pos, $I10)
  rxscan1011_done:
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_1012_fail
    rx1007_cur."!mark_push"(0, rx1007_pos, $I10)
  # rx literal  "~"
    add $I11, rx1007_pos, 1
    gt $I11, rx1007_eos, rx1007_fail
    sub $I11, rx1007_pos, rx1007_off
    substr $S10, rx1007_tgt, $I11, 1
    ne $S10, "~", rx1007_fail
    add rx1007_pos, 1
    set_addr $I10, rxcap_1012_fail
    ($I12, $I11) = rx1007_cur."!mark_peek"($I10)
    rx1007_cur."!cursor_pos"($I11)
    ($P10) = rx1007_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1007_pos, "")
    rx1007_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1012_done
  rxcap_1012_fail:
    goto rx1007_fail
  rxcap_1012_done:
  # rx subrule "O" subtype=capture negate=
    rx1007_cur."!cursor_pos"(rx1007_pos)
    $P10 = rx1007_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1007_fail
    rx1007_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1007_pos = $P10."pos"()
  # rx pass
    rx1007_cur."!cursor_pass"(rx1007_pos, "infix:sym<~>")
    rx1007_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1007_pos)
    .return (rx1007_cur)
  rx1007_fail:
.annotate "line", 385
    (rx1007_rep, rx1007_pos, $I10, $P10) = rx1007_cur."!mark_fail"(0)
    lt rx1007_pos, -1, rx1007_done
    eq rx1007_pos, -1, rx1007_fail
    jump $I10
  rx1007_done:
    rx1007_cur."!cursor_fail"()
    rx1007_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1007_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("254_1259078882.26523") :method
.annotate "line", 385
    $P1009 = self."!PREFIX__!subrule"("O", "~")
    new $P1010, "ResizablePMCArray"
    push $P1010, $P1009
    .return ($P1010)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("255_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1014_tgt
    .local int rx1014_pos
    .local int rx1014_off
    .local int rx1014_eos
    .local int rx1014_rep
    .local pmc rx1014_cur
    (rx1014_cur, rx1014_pos, rx1014_tgt) = self."!cursor_start"()
    rx1014_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1014_cur
    .local pmc match
    .lex "$/", match
    length rx1014_eos, rx1014_tgt
    set rx1014_off, 0
    lt rx1014_pos, 2, rx1014_start
    sub rx1014_off, rx1014_pos, 1
    substr rx1014_tgt, rx1014_tgt, rx1014_off
  rx1014_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1018_done
    goto rxscan1018_scan
  rxscan1018_loop:
    ($P10) = rx1014_cur."from"()
    inc $P10
    set rx1014_pos, $P10
    ge rx1014_pos, rx1014_eos, rxscan1018_done
  rxscan1018_scan:
    set_addr $I10, rxscan1018_loop
    rx1014_cur."!mark_push"(0, rx1014_pos, $I10)
  rxscan1018_done:
.annotate "line", 454
  # rx subcapture "sym"
    set_addr $I10, rxcap_1019_fail
    rx1014_cur."!mark_push"(0, rx1014_pos, $I10)
  # rx literal  "=="
    add $I11, rx1014_pos, 2
    gt $I11, rx1014_eos, rx1014_fail
    sub $I11, rx1014_pos, rx1014_off
    substr $S10, rx1014_tgt, $I11, 2
    ne $S10, "==", rx1014_fail
    add rx1014_pos, 2
    set_addr $I10, rxcap_1019_fail
    ($I12, $I11) = rx1014_cur."!mark_peek"($I10)
    rx1014_cur."!cursor_pos"($I11)
    ($P10) = rx1014_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1014_pos, "")
    rx1014_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1019_done
  rxcap_1019_fail:
    goto rx1014_fail
  rxcap_1019_done:
  # rx subrule "O" subtype=capture negate=
    rx1014_cur."!cursor_pos"(rx1014_pos)
    $P10 = rx1014_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1014_fail
    rx1014_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1014_pos = $P10."pos"()
  # rx pass
    rx1014_cur."!cursor_pass"(rx1014_pos, "infix:sym<==>")
    rx1014_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1014_pos)
    .return (rx1014_cur)
  rx1014_fail:
.annotate "line", 385
    (rx1014_rep, rx1014_pos, $I10, $P10) = rx1014_cur."!mark_fail"(0)
    lt rx1014_pos, -1, rx1014_done
    eq rx1014_pos, -1, rx1014_fail
    jump $I10
  rx1014_done:
    rx1014_cur."!cursor_fail"()
    rx1014_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1014_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("256_1259078882.26523") :method
.annotate "line", 385
    $P1016 = self."!PREFIX__!subrule"("O", "==")
    new $P1017, "ResizablePMCArray"
    push $P1017, $P1016
    .return ($P1017)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("257_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1021_tgt
    .local int rx1021_pos
    .local int rx1021_off
    .local int rx1021_eos
    .local int rx1021_rep
    .local pmc rx1021_cur
    (rx1021_cur, rx1021_pos, rx1021_tgt) = self."!cursor_start"()
    rx1021_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1021_cur
    .local pmc match
    .lex "$/", match
    length rx1021_eos, rx1021_tgt
    set rx1021_off, 0
    lt rx1021_pos, 2, rx1021_start
    sub rx1021_off, rx1021_pos, 1
    substr rx1021_tgt, rx1021_tgt, rx1021_off
  rx1021_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1025_done
    goto rxscan1025_scan
  rxscan1025_loop:
    ($P10) = rx1021_cur."from"()
    inc $P10
    set rx1021_pos, $P10
    ge rx1021_pos, rx1021_eos, rxscan1025_done
  rxscan1025_scan:
    set_addr $I10, rxscan1025_loop
    rx1021_cur."!mark_push"(0, rx1021_pos, $I10)
  rxscan1025_done:
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_1026_fail
    rx1021_cur."!mark_push"(0, rx1021_pos, $I10)
  # rx literal  "!="
    add $I11, rx1021_pos, 2
    gt $I11, rx1021_eos, rx1021_fail
    sub $I11, rx1021_pos, rx1021_off
    substr $S10, rx1021_tgt, $I11, 2
    ne $S10, "!=", rx1021_fail
    add rx1021_pos, 2
    set_addr $I10, rxcap_1026_fail
    ($I12, $I11) = rx1021_cur."!mark_peek"($I10)
    rx1021_cur."!cursor_pos"($I11)
    ($P10) = rx1021_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1021_pos, "")
    rx1021_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1026_done
  rxcap_1026_fail:
    goto rx1021_fail
  rxcap_1026_done:
  # rx subrule "O" subtype=capture negate=
    rx1021_cur."!cursor_pos"(rx1021_pos)
    $P10 = rx1021_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1021_fail
    rx1021_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1021_pos = $P10."pos"()
  # rx pass
    rx1021_cur."!cursor_pass"(rx1021_pos, "infix:sym<!=>")
    rx1021_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1021_pos)
    .return (rx1021_cur)
  rx1021_fail:
.annotate "line", 385
    (rx1021_rep, rx1021_pos, $I10, $P10) = rx1021_cur."!mark_fail"(0)
    lt rx1021_pos, -1, rx1021_done
    eq rx1021_pos, -1, rx1021_fail
    jump $I10
  rx1021_done:
    rx1021_cur."!cursor_fail"()
    rx1021_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1021_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("258_1259078882.26523") :method
.annotate "line", 385
    $P1023 = self."!PREFIX__!subrule"("O", "!=")
    new $P1024, "ResizablePMCArray"
    push $P1024, $P1023
    .return ($P1024)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("259_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1028_tgt
    .local int rx1028_pos
    .local int rx1028_off
    .local int rx1028_eos
    .local int rx1028_rep
    .local pmc rx1028_cur
    (rx1028_cur, rx1028_pos, rx1028_tgt) = self."!cursor_start"()
    rx1028_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1028_cur
    .local pmc match
    .lex "$/", match
    length rx1028_eos, rx1028_tgt
    set rx1028_off, 0
    lt rx1028_pos, 2, rx1028_start
    sub rx1028_off, rx1028_pos, 1
    substr rx1028_tgt, rx1028_tgt, rx1028_off
  rx1028_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1032_done
    goto rxscan1032_scan
  rxscan1032_loop:
    ($P10) = rx1028_cur."from"()
    inc $P10
    set rx1028_pos, $P10
    ge rx1028_pos, rx1028_eos, rxscan1032_done
  rxscan1032_scan:
    set_addr $I10, rxscan1032_loop
    rx1028_cur."!mark_push"(0, rx1028_pos, $I10)
  rxscan1032_done:
.annotate "line", 456
  # rx subcapture "sym"
    set_addr $I10, rxcap_1033_fail
    rx1028_cur."!mark_push"(0, rx1028_pos, $I10)
  # rx literal  "<="
    add $I11, rx1028_pos, 2
    gt $I11, rx1028_eos, rx1028_fail
    sub $I11, rx1028_pos, rx1028_off
    substr $S10, rx1028_tgt, $I11, 2
    ne $S10, "<=", rx1028_fail
    add rx1028_pos, 2
    set_addr $I10, rxcap_1033_fail
    ($I12, $I11) = rx1028_cur."!mark_peek"($I10)
    rx1028_cur."!cursor_pos"($I11)
    ($P10) = rx1028_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1028_pos, "")
    rx1028_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1033_done
  rxcap_1033_fail:
    goto rx1028_fail
  rxcap_1033_done:
  # rx subrule "O" subtype=capture negate=
    rx1028_cur."!cursor_pos"(rx1028_pos)
    $P10 = rx1028_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1028_fail
    rx1028_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1028_pos = $P10."pos"()
  # rx pass
    rx1028_cur."!cursor_pass"(rx1028_pos, "infix:sym<<=>")
    rx1028_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1028_pos)
    .return (rx1028_cur)
  rx1028_fail:
.annotate "line", 385
    (rx1028_rep, rx1028_pos, $I10, $P10) = rx1028_cur."!mark_fail"(0)
    lt rx1028_pos, -1, rx1028_done
    eq rx1028_pos, -1, rx1028_fail
    jump $I10
  rx1028_done:
    rx1028_cur."!cursor_fail"()
    rx1028_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1028_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("260_1259078882.26523") :method
.annotate "line", 385
    $P1030 = self."!PREFIX__!subrule"("O", "<=")
    new $P1031, "ResizablePMCArray"
    push $P1031, $P1030
    .return ($P1031)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("261_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1035_tgt
    .local int rx1035_pos
    .local int rx1035_off
    .local int rx1035_eos
    .local int rx1035_rep
    .local pmc rx1035_cur
    (rx1035_cur, rx1035_pos, rx1035_tgt) = self."!cursor_start"()
    rx1035_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1035_cur
    .local pmc match
    .lex "$/", match
    length rx1035_eos, rx1035_tgt
    set rx1035_off, 0
    lt rx1035_pos, 2, rx1035_start
    sub rx1035_off, rx1035_pos, 1
    substr rx1035_tgt, rx1035_tgt, rx1035_off
  rx1035_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1039_done
    goto rxscan1039_scan
  rxscan1039_loop:
    ($P10) = rx1035_cur."from"()
    inc $P10
    set rx1035_pos, $P10
    ge rx1035_pos, rx1035_eos, rxscan1039_done
  rxscan1039_scan:
    set_addr $I10, rxscan1039_loop
    rx1035_cur."!mark_push"(0, rx1035_pos, $I10)
  rxscan1039_done:
.annotate "line", 457
  # rx subcapture "sym"
    set_addr $I10, rxcap_1040_fail
    rx1035_cur."!mark_push"(0, rx1035_pos, $I10)
  # rx literal  ">="
    add $I11, rx1035_pos, 2
    gt $I11, rx1035_eos, rx1035_fail
    sub $I11, rx1035_pos, rx1035_off
    substr $S10, rx1035_tgt, $I11, 2
    ne $S10, ">=", rx1035_fail
    add rx1035_pos, 2
    set_addr $I10, rxcap_1040_fail
    ($I12, $I11) = rx1035_cur."!mark_peek"($I10)
    rx1035_cur."!cursor_pos"($I11)
    ($P10) = rx1035_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1035_pos, "")
    rx1035_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1040_done
  rxcap_1040_fail:
    goto rx1035_fail
  rxcap_1040_done:
  # rx subrule "O" subtype=capture negate=
    rx1035_cur."!cursor_pos"(rx1035_pos)
    $P10 = rx1035_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1035_fail
    rx1035_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1035_pos = $P10."pos"()
  # rx pass
    rx1035_cur."!cursor_pass"(rx1035_pos, "infix:sym<>=>")
    rx1035_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1035_pos)
    .return (rx1035_cur)
  rx1035_fail:
.annotate "line", 385
    (rx1035_rep, rx1035_pos, $I10, $P10) = rx1035_cur."!mark_fail"(0)
    lt rx1035_pos, -1, rx1035_done
    eq rx1035_pos, -1, rx1035_fail
    jump $I10
  rx1035_done:
    rx1035_cur."!cursor_fail"()
    rx1035_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1035_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("262_1259078882.26523") :method
.annotate "line", 385
    $P1037 = self."!PREFIX__!subrule"("O", ">=")
    new $P1038, "ResizablePMCArray"
    push $P1038, $P1037
    .return ($P1038)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("263_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1042_tgt
    .local int rx1042_pos
    .local int rx1042_off
    .local int rx1042_eos
    .local int rx1042_rep
    .local pmc rx1042_cur
    (rx1042_cur, rx1042_pos, rx1042_tgt) = self."!cursor_start"()
    rx1042_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1042_cur
    .local pmc match
    .lex "$/", match
    length rx1042_eos, rx1042_tgt
    set rx1042_off, 0
    lt rx1042_pos, 2, rx1042_start
    sub rx1042_off, rx1042_pos, 1
    substr rx1042_tgt, rx1042_tgt, rx1042_off
  rx1042_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1046_done
    goto rxscan1046_scan
  rxscan1046_loop:
    ($P10) = rx1042_cur."from"()
    inc $P10
    set rx1042_pos, $P10
    ge rx1042_pos, rx1042_eos, rxscan1046_done
  rxscan1046_scan:
    set_addr $I10, rxscan1046_loop
    rx1042_cur."!mark_push"(0, rx1042_pos, $I10)
  rxscan1046_done:
.annotate "line", 458
  # rx subcapture "sym"
    set_addr $I10, rxcap_1047_fail
    rx1042_cur."!mark_push"(0, rx1042_pos, $I10)
  # rx literal  "<"
    add $I11, rx1042_pos, 1
    gt $I11, rx1042_eos, rx1042_fail
    sub $I11, rx1042_pos, rx1042_off
    substr $S10, rx1042_tgt, $I11, 1
    ne $S10, "<", rx1042_fail
    add rx1042_pos, 1
    set_addr $I10, rxcap_1047_fail
    ($I12, $I11) = rx1042_cur."!mark_peek"($I10)
    rx1042_cur."!cursor_pos"($I11)
    ($P10) = rx1042_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1042_pos, "")
    rx1042_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1047_done
  rxcap_1047_fail:
    goto rx1042_fail
  rxcap_1047_done:
  # rx subrule "O" subtype=capture negate=
    rx1042_cur."!cursor_pos"(rx1042_pos)
    $P10 = rx1042_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1042_fail
    rx1042_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1042_pos = $P10."pos"()
  # rx pass
    rx1042_cur."!cursor_pass"(rx1042_pos, "infix:sym<<>")
    rx1042_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1042_pos)
    .return (rx1042_cur)
  rx1042_fail:
.annotate "line", 385
    (rx1042_rep, rx1042_pos, $I10, $P10) = rx1042_cur."!mark_fail"(0)
    lt rx1042_pos, -1, rx1042_done
    eq rx1042_pos, -1, rx1042_fail
    jump $I10
  rx1042_done:
    rx1042_cur."!cursor_fail"()
    rx1042_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1042_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("264_1259078882.26523") :method
.annotate "line", 385
    $P1044 = self."!PREFIX__!subrule"("O", "<")
    new $P1045, "ResizablePMCArray"
    push $P1045, $P1044
    .return ($P1045)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("265_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1049_tgt
    .local int rx1049_pos
    .local int rx1049_off
    .local int rx1049_eos
    .local int rx1049_rep
    .local pmc rx1049_cur
    (rx1049_cur, rx1049_pos, rx1049_tgt) = self."!cursor_start"()
    rx1049_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1049_cur
    .local pmc match
    .lex "$/", match
    length rx1049_eos, rx1049_tgt
    set rx1049_off, 0
    lt rx1049_pos, 2, rx1049_start
    sub rx1049_off, rx1049_pos, 1
    substr rx1049_tgt, rx1049_tgt, rx1049_off
  rx1049_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1053_done
    goto rxscan1053_scan
  rxscan1053_loop:
    ($P10) = rx1049_cur."from"()
    inc $P10
    set rx1049_pos, $P10
    ge rx1049_pos, rx1049_eos, rxscan1053_done
  rxscan1053_scan:
    set_addr $I10, rxscan1053_loop
    rx1049_cur."!mark_push"(0, rx1049_pos, $I10)
  rxscan1053_done:
.annotate "line", 459
  # rx subcapture "sym"
    set_addr $I10, rxcap_1054_fail
    rx1049_cur."!mark_push"(0, rx1049_pos, $I10)
  # rx literal  ">"
    add $I11, rx1049_pos, 1
    gt $I11, rx1049_eos, rx1049_fail
    sub $I11, rx1049_pos, rx1049_off
    substr $S10, rx1049_tgt, $I11, 1
    ne $S10, ">", rx1049_fail
    add rx1049_pos, 1
    set_addr $I10, rxcap_1054_fail
    ($I12, $I11) = rx1049_cur."!mark_peek"($I10)
    rx1049_cur."!cursor_pos"($I11)
    ($P10) = rx1049_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1049_pos, "")
    rx1049_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1054_done
  rxcap_1054_fail:
    goto rx1049_fail
  rxcap_1054_done:
  # rx subrule "O" subtype=capture negate=
    rx1049_cur."!cursor_pos"(rx1049_pos)
    $P10 = rx1049_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1049_fail
    rx1049_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1049_pos = $P10."pos"()
  # rx pass
    rx1049_cur."!cursor_pass"(rx1049_pos, "infix:sym<>>")
    rx1049_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1049_pos)
    .return (rx1049_cur)
  rx1049_fail:
.annotate "line", 385
    (rx1049_rep, rx1049_pos, $I10, $P10) = rx1049_cur."!mark_fail"(0)
    lt rx1049_pos, -1, rx1049_done
    eq rx1049_pos, -1, rx1049_fail
    jump $I10
  rx1049_done:
    rx1049_cur."!cursor_fail"()
    rx1049_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1049_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("266_1259078882.26523") :method
.annotate "line", 385
    $P1051 = self."!PREFIX__!subrule"("O", ">")
    new $P1052, "ResizablePMCArray"
    push $P1052, $P1051
    .return ($P1052)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("267_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1056_tgt
    .local int rx1056_pos
    .local int rx1056_off
    .local int rx1056_eos
    .local int rx1056_rep
    .local pmc rx1056_cur
    (rx1056_cur, rx1056_pos, rx1056_tgt) = self."!cursor_start"()
    rx1056_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1056_cur
    .local pmc match
    .lex "$/", match
    length rx1056_eos, rx1056_tgt
    set rx1056_off, 0
    lt rx1056_pos, 2, rx1056_start
    sub rx1056_off, rx1056_pos, 1
    substr rx1056_tgt, rx1056_tgt, rx1056_off
  rx1056_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1060_done
    goto rxscan1060_scan
  rxscan1060_loop:
    ($P10) = rx1056_cur."from"()
    inc $P10
    set rx1056_pos, $P10
    ge rx1056_pos, rx1056_eos, rxscan1060_done
  rxscan1060_scan:
    set_addr $I10, rxscan1060_loop
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  rxscan1060_done:
.annotate "line", 460
  # rx subcapture "sym"
    set_addr $I10, rxcap_1061_fail
    rx1056_cur."!mark_push"(0, rx1056_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1056_pos, 2
    gt $I11, rx1056_eos, rx1056_fail
    sub $I11, rx1056_pos, rx1056_off
    substr $S10, rx1056_tgt, $I11, 2
    ne $S10, "eq", rx1056_fail
    add rx1056_pos, 2
    set_addr $I10, rxcap_1061_fail
    ($I12, $I11) = rx1056_cur."!mark_peek"($I10)
    rx1056_cur."!cursor_pos"($I11)
    ($P10) = rx1056_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1056_pos, "")
    rx1056_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1061_done
  rxcap_1061_fail:
    goto rx1056_fail
  rxcap_1061_done:
  # rx subrule "O" subtype=capture negate=
    rx1056_cur."!cursor_pos"(rx1056_pos)
    $P10 = rx1056_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1056_fail
    rx1056_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1056_pos = $P10."pos"()
  # rx pass
    rx1056_cur."!cursor_pass"(rx1056_pos, "infix:sym<eq>")
    rx1056_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1056_pos)
    .return (rx1056_cur)
  rx1056_fail:
.annotate "line", 385
    (rx1056_rep, rx1056_pos, $I10, $P10) = rx1056_cur."!mark_fail"(0)
    lt rx1056_pos, -1, rx1056_done
    eq rx1056_pos, -1, rx1056_fail
    jump $I10
  rx1056_done:
    rx1056_cur."!cursor_fail"()
    rx1056_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1056_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("268_1259078882.26523") :method
.annotate "line", 385
    $P1058 = self."!PREFIX__!subrule"("O", "eq")
    new $P1059, "ResizablePMCArray"
    push $P1059, $P1058
    .return ($P1059)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("269_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1063_tgt
    .local int rx1063_pos
    .local int rx1063_off
    .local int rx1063_eos
    .local int rx1063_rep
    .local pmc rx1063_cur
    (rx1063_cur, rx1063_pos, rx1063_tgt) = self."!cursor_start"()
    rx1063_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1063_cur
    .local pmc match
    .lex "$/", match
    length rx1063_eos, rx1063_tgt
    set rx1063_off, 0
    lt rx1063_pos, 2, rx1063_start
    sub rx1063_off, rx1063_pos, 1
    substr rx1063_tgt, rx1063_tgt, rx1063_off
  rx1063_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1067_done
    goto rxscan1067_scan
  rxscan1067_loop:
    ($P10) = rx1063_cur."from"()
    inc $P10
    set rx1063_pos, $P10
    ge rx1063_pos, rx1063_eos, rxscan1067_done
  rxscan1067_scan:
    set_addr $I10, rxscan1067_loop
    rx1063_cur."!mark_push"(0, rx1063_pos, $I10)
  rxscan1067_done:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_1068_fail
    rx1063_cur."!mark_push"(0, rx1063_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1063_pos, 2
    gt $I11, rx1063_eos, rx1063_fail
    sub $I11, rx1063_pos, rx1063_off
    substr $S10, rx1063_tgt, $I11, 2
    ne $S10, "ne", rx1063_fail
    add rx1063_pos, 2
    set_addr $I10, rxcap_1068_fail
    ($I12, $I11) = rx1063_cur."!mark_peek"($I10)
    rx1063_cur."!cursor_pos"($I11)
    ($P10) = rx1063_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1063_pos, "")
    rx1063_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1068_done
  rxcap_1068_fail:
    goto rx1063_fail
  rxcap_1068_done:
  # rx subrule "O" subtype=capture negate=
    rx1063_cur."!cursor_pos"(rx1063_pos)
    $P10 = rx1063_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1063_fail
    rx1063_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1063_pos = $P10."pos"()
  # rx pass
    rx1063_cur."!cursor_pass"(rx1063_pos, "infix:sym<ne>")
    rx1063_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1063_pos)
    .return (rx1063_cur)
  rx1063_fail:
.annotate "line", 385
    (rx1063_rep, rx1063_pos, $I10, $P10) = rx1063_cur."!mark_fail"(0)
    lt rx1063_pos, -1, rx1063_done
    eq rx1063_pos, -1, rx1063_fail
    jump $I10
  rx1063_done:
    rx1063_cur."!cursor_fail"()
    rx1063_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1063_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("270_1259078882.26523") :method
.annotate "line", 385
    $P1065 = self."!PREFIX__!subrule"("O", "ne")
    new $P1066, "ResizablePMCArray"
    push $P1066, $P1065
    .return ($P1066)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("271_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1070_tgt
    .local int rx1070_pos
    .local int rx1070_off
    .local int rx1070_eos
    .local int rx1070_rep
    .local pmc rx1070_cur
    (rx1070_cur, rx1070_pos, rx1070_tgt) = self."!cursor_start"()
    rx1070_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1070_cur
    .local pmc match
    .lex "$/", match
    length rx1070_eos, rx1070_tgt
    set rx1070_off, 0
    lt rx1070_pos, 2, rx1070_start
    sub rx1070_off, rx1070_pos, 1
    substr rx1070_tgt, rx1070_tgt, rx1070_off
  rx1070_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1074_done
    goto rxscan1074_scan
  rxscan1074_loop:
    ($P10) = rx1070_cur."from"()
    inc $P10
    set rx1070_pos, $P10
    ge rx1070_pos, rx1070_eos, rxscan1074_done
  rxscan1074_scan:
    set_addr $I10, rxscan1074_loop
    rx1070_cur."!mark_push"(0, rx1070_pos, $I10)
  rxscan1074_done:
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_1075_fail
    rx1070_cur."!mark_push"(0, rx1070_pos, $I10)
  # rx literal  "le"
    add $I11, rx1070_pos, 2
    gt $I11, rx1070_eos, rx1070_fail
    sub $I11, rx1070_pos, rx1070_off
    substr $S10, rx1070_tgt, $I11, 2
    ne $S10, "le", rx1070_fail
    add rx1070_pos, 2
    set_addr $I10, rxcap_1075_fail
    ($I12, $I11) = rx1070_cur."!mark_peek"($I10)
    rx1070_cur."!cursor_pos"($I11)
    ($P10) = rx1070_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1070_pos, "")
    rx1070_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1075_done
  rxcap_1075_fail:
    goto rx1070_fail
  rxcap_1075_done:
  # rx subrule "O" subtype=capture negate=
    rx1070_cur."!cursor_pos"(rx1070_pos)
    $P10 = rx1070_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1070_fail
    rx1070_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1070_pos = $P10."pos"()
  # rx pass
    rx1070_cur."!cursor_pass"(rx1070_pos, "infix:sym<le>")
    rx1070_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1070_pos)
    .return (rx1070_cur)
  rx1070_fail:
.annotate "line", 385
    (rx1070_rep, rx1070_pos, $I10, $P10) = rx1070_cur."!mark_fail"(0)
    lt rx1070_pos, -1, rx1070_done
    eq rx1070_pos, -1, rx1070_fail
    jump $I10
  rx1070_done:
    rx1070_cur."!cursor_fail"()
    rx1070_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1070_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("272_1259078882.26523") :method
.annotate "line", 385
    $P1072 = self."!PREFIX__!subrule"("O", "le")
    new $P1073, "ResizablePMCArray"
    push $P1073, $P1072
    .return ($P1073)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("273_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1077_tgt
    .local int rx1077_pos
    .local int rx1077_off
    .local int rx1077_eos
    .local int rx1077_rep
    .local pmc rx1077_cur
    (rx1077_cur, rx1077_pos, rx1077_tgt) = self."!cursor_start"()
    rx1077_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1077_cur
    .local pmc match
    .lex "$/", match
    length rx1077_eos, rx1077_tgt
    set rx1077_off, 0
    lt rx1077_pos, 2, rx1077_start
    sub rx1077_off, rx1077_pos, 1
    substr rx1077_tgt, rx1077_tgt, rx1077_off
  rx1077_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1081_done
    goto rxscan1081_scan
  rxscan1081_loop:
    ($P10) = rx1077_cur."from"()
    inc $P10
    set rx1077_pos, $P10
    ge rx1077_pos, rx1077_eos, rxscan1081_done
  rxscan1081_scan:
    set_addr $I10, rxscan1081_loop
    rx1077_cur."!mark_push"(0, rx1077_pos, $I10)
  rxscan1081_done:
.annotate "line", 463
  # rx subcapture "sym"
    set_addr $I10, rxcap_1082_fail
    rx1077_cur."!mark_push"(0, rx1077_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1077_pos, 2
    gt $I11, rx1077_eos, rx1077_fail
    sub $I11, rx1077_pos, rx1077_off
    substr $S10, rx1077_tgt, $I11, 2
    ne $S10, "ge", rx1077_fail
    add rx1077_pos, 2
    set_addr $I10, rxcap_1082_fail
    ($I12, $I11) = rx1077_cur."!mark_peek"($I10)
    rx1077_cur."!cursor_pos"($I11)
    ($P10) = rx1077_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1077_pos, "")
    rx1077_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1082_done
  rxcap_1082_fail:
    goto rx1077_fail
  rxcap_1082_done:
  # rx subrule "O" subtype=capture negate=
    rx1077_cur."!cursor_pos"(rx1077_pos)
    $P10 = rx1077_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1077_fail
    rx1077_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1077_pos = $P10."pos"()
  # rx pass
    rx1077_cur."!cursor_pass"(rx1077_pos, "infix:sym<ge>")
    rx1077_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1077_pos)
    .return (rx1077_cur)
  rx1077_fail:
.annotate "line", 385
    (rx1077_rep, rx1077_pos, $I10, $P10) = rx1077_cur."!mark_fail"(0)
    lt rx1077_pos, -1, rx1077_done
    eq rx1077_pos, -1, rx1077_fail
    jump $I10
  rx1077_done:
    rx1077_cur."!cursor_fail"()
    rx1077_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1077_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("274_1259078882.26523") :method
.annotate "line", 385
    $P1079 = self."!PREFIX__!subrule"("O", "ge")
    new $P1080, "ResizablePMCArray"
    push $P1080, $P1079
    .return ($P1080)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("275_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1084_tgt
    .local int rx1084_pos
    .local int rx1084_off
    .local int rx1084_eos
    .local int rx1084_rep
    .local pmc rx1084_cur
    (rx1084_cur, rx1084_pos, rx1084_tgt) = self."!cursor_start"()
    rx1084_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1084_cur
    .local pmc match
    .lex "$/", match
    length rx1084_eos, rx1084_tgt
    set rx1084_off, 0
    lt rx1084_pos, 2, rx1084_start
    sub rx1084_off, rx1084_pos, 1
    substr rx1084_tgt, rx1084_tgt, rx1084_off
  rx1084_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1088_done
    goto rxscan1088_scan
  rxscan1088_loop:
    ($P10) = rx1084_cur."from"()
    inc $P10
    set rx1084_pos, $P10
    ge rx1084_pos, rx1084_eos, rxscan1088_done
  rxscan1088_scan:
    set_addr $I10, rxscan1088_loop
    rx1084_cur."!mark_push"(0, rx1084_pos, $I10)
  rxscan1088_done:
.annotate "line", 464
  # rx subcapture "sym"
    set_addr $I10, rxcap_1089_fail
    rx1084_cur."!mark_push"(0, rx1084_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1084_pos, 2
    gt $I11, rx1084_eos, rx1084_fail
    sub $I11, rx1084_pos, rx1084_off
    substr $S10, rx1084_tgt, $I11, 2
    ne $S10, "lt", rx1084_fail
    add rx1084_pos, 2
    set_addr $I10, rxcap_1089_fail
    ($I12, $I11) = rx1084_cur."!mark_peek"($I10)
    rx1084_cur."!cursor_pos"($I11)
    ($P10) = rx1084_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1084_pos, "")
    rx1084_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1089_done
  rxcap_1089_fail:
    goto rx1084_fail
  rxcap_1089_done:
  # rx subrule "O" subtype=capture negate=
    rx1084_cur."!cursor_pos"(rx1084_pos)
    $P10 = rx1084_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1084_fail
    rx1084_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1084_pos = $P10."pos"()
  # rx pass
    rx1084_cur."!cursor_pass"(rx1084_pos, "infix:sym<lt>")
    rx1084_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1084_pos)
    .return (rx1084_cur)
  rx1084_fail:
.annotate "line", 385
    (rx1084_rep, rx1084_pos, $I10, $P10) = rx1084_cur."!mark_fail"(0)
    lt rx1084_pos, -1, rx1084_done
    eq rx1084_pos, -1, rx1084_fail
    jump $I10
  rx1084_done:
    rx1084_cur."!cursor_fail"()
    rx1084_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1084_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("276_1259078882.26523") :method
.annotate "line", 385
    $P1086 = self."!PREFIX__!subrule"("O", "lt")
    new $P1087, "ResizablePMCArray"
    push $P1087, $P1086
    .return ($P1087)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("277_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1091_tgt
    .local int rx1091_pos
    .local int rx1091_off
    .local int rx1091_eos
    .local int rx1091_rep
    .local pmc rx1091_cur
    (rx1091_cur, rx1091_pos, rx1091_tgt) = self."!cursor_start"()
    rx1091_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1091_cur
    .local pmc match
    .lex "$/", match
    length rx1091_eos, rx1091_tgt
    set rx1091_off, 0
    lt rx1091_pos, 2, rx1091_start
    sub rx1091_off, rx1091_pos, 1
    substr rx1091_tgt, rx1091_tgt, rx1091_off
  rx1091_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1095_done
    goto rxscan1095_scan
  rxscan1095_loop:
    ($P10) = rx1091_cur."from"()
    inc $P10
    set rx1091_pos, $P10
    ge rx1091_pos, rx1091_eos, rxscan1095_done
  rxscan1095_scan:
    set_addr $I10, rxscan1095_loop
    rx1091_cur."!mark_push"(0, rx1091_pos, $I10)
  rxscan1095_done:
.annotate "line", 465
  # rx subcapture "sym"
    set_addr $I10, rxcap_1096_fail
    rx1091_cur."!mark_push"(0, rx1091_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1091_pos, 2
    gt $I11, rx1091_eos, rx1091_fail
    sub $I11, rx1091_pos, rx1091_off
    substr $S10, rx1091_tgt, $I11, 2
    ne $S10, "gt", rx1091_fail
    add rx1091_pos, 2
    set_addr $I10, rxcap_1096_fail
    ($I12, $I11) = rx1091_cur."!mark_peek"($I10)
    rx1091_cur."!cursor_pos"($I11)
    ($P10) = rx1091_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1091_pos, "")
    rx1091_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1096_done
  rxcap_1096_fail:
    goto rx1091_fail
  rxcap_1096_done:
  # rx subrule "O" subtype=capture negate=
    rx1091_cur."!cursor_pos"(rx1091_pos)
    $P10 = rx1091_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1091_fail
    rx1091_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1091_pos = $P10."pos"()
  # rx pass
    rx1091_cur."!cursor_pass"(rx1091_pos, "infix:sym<gt>")
    rx1091_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1091_pos)
    .return (rx1091_cur)
  rx1091_fail:
.annotate "line", 385
    (rx1091_rep, rx1091_pos, $I10, $P10) = rx1091_cur."!mark_fail"(0)
    lt rx1091_pos, -1, rx1091_done
    eq rx1091_pos, -1, rx1091_fail
    jump $I10
  rx1091_done:
    rx1091_cur."!cursor_fail"()
    rx1091_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1091_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("278_1259078882.26523") :method
.annotate "line", 385
    $P1093 = self."!PREFIX__!subrule"("O", "gt")
    new $P1094, "ResizablePMCArray"
    push $P1094, $P1093
    .return ($P1094)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("279_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1098_tgt
    .local int rx1098_pos
    .local int rx1098_off
    .local int rx1098_eos
    .local int rx1098_rep
    .local pmc rx1098_cur
    (rx1098_cur, rx1098_pos, rx1098_tgt) = self."!cursor_start"()
    rx1098_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1098_cur
    .local pmc match
    .lex "$/", match
    length rx1098_eos, rx1098_tgt
    set rx1098_off, 0
    lt rx1098_pos, 2, rx1098_start
    sub rx1098_off, rx1098_pos, 1
    substr rx1098_tgt, rx1098_tgt, rx1098_off
  rx1098_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1102_done
    goto rxscan1102_scan
  rxscan1102_loop:
    ($P10) = rx1098_cur."from"()
    inc $P10
    set rx1098_pos, $P10
    ge rx1098_pos, rx1098_eos, rxscan1102_done
  rxscan1102_scan:
    set_addr $I10, rxscan1102_loop
    rx1098_cur."!mark_push"(0, rx1098_pos, $I10)
  rxscan1102_done:
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_1103_fail
    rx1098_cur."!mark_push"(0, rx1098_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1098_pos, 3
    gt $I11, rx1098_eos, rx1098_fail
    sub $I11, rx1098_pos, rx1098_off
    substr $S10, rx1098_tgt, $I11, 3
    ne $S10, "=:=", rx1098_fail
    add rx1098_pos, 3
    set_addr $I10, rxcap_1103_fail
    ($I12, $I11) = rx1098_cur."!mark_peek"($I10)
    rx1098_cur."!cursor_pos"($I11)
    ($P10) = rx1098_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1098_pos, "")
    rx1098_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1103_done
  rxcap_1103_fail:
    goto rx1098_fail
  rxcap_1103_done:
  # rx subrule "O" subtype=capture negate=
    rx1098_cur."!cursor_pos"(rx1098_pos)
    $P10 = rx1098_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1098_fail
    rx1098_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1098_pos = $P10."pos"()
  # rx pass
    rx1098_cur."!cursor_pass"(rx1098_pos, "infix:sym<=:=>")
    rx1098_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1098_pos)
    .return (rx1098_cur)
  rx1098_fail:
.annotate "line", 385
    (rx1098_rep, rx1098_pos, $I10, $P10) = rx1098_cur."!mark_fail"(0)
    lt rx1098_pos, -1, rx1098_done
    eq rx1098_pos, -1, rx1098_fail
    jump $I10
  rx1098_done:
    rx1098_cur."!cursor_fail"()
    rx1098_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1098_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("280_1259078882.26523") :method
.annotate "line", 385
    $P1100 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1101, "ResizablePMCArray"
    push $P1101, $P1100
    .return ($P1101)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("281_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1105_tgt
    .local int rx1105_pos
    .local int rx1105_off
    .local int rx1105_eos
    .local int rx1105_rep
    .local pmc rx1105_cur
    (rx1105_cur, rx1105_pos, rx1105_tgt) = self."!cursor_start"()
    rx1105_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1105_cur
    .local pmc match
    .lex "$/", match
    length rx1105_eos, rx1105_tgt
    set rx1105_off, 0
    lt rx1105_pos, 2, rx1105_start
    sub rx1105_off, rx1105_pos, 1
    substr rx1105_tgt, rx1105_tgt, rx1105_off
  rx1105_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1109_done
    goto rxscan1109_scan
  rxscan1109_loop:
    ($P10) = rx1105_cur."from"()
    inc $P10
    set rx1105_pos, $P10
    ge rx1105_pos, rx1105_eos, rxscan1109_done
  rxscan1109_scan:
    set_addr $I10, rxscan1109_loop
    rx1105_cur."!mark_push"(0, rx1105_pos, $I10)
  rxscan1109_done:
.annotate "line", 468
  # rx subcapture "sym"
    set_addr $I10, rxcap_1110_fail
    rx1105_cur."!mark_push"(0, rx1105_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1105_pos, 2
    gt $I11, rx1105_eos, rx1105_fail
    sub $I11, rx1105_pos, rx1105_off
    substr $S10, rx1105_tgt, $I11, 2
    ne $S10, "&&", rx1105_fail
    add rx1105_pos, 2
    set_addr $I10, rxcap_1110_fail
    ($I12, $I11) = rx1105_cur."!mark_peek"($I10)
    rx1105_cur."!cursor_pos"($I11)
    ($P10) = rx1105_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1105_pos, "")
    rx1105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1110_done
  rxcap_1110_fail:
    goto rx1105_fail
  rxcap_1110_done:
  # rx subrule "O" subtype=capture negate=
    rx1105_cur."!cursor_pos"(rx1105_pos)
    $P10 = rx1105_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1105_fail
    rx1105_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1105_pos = $P10."pos"()
  # rx pass
    rx1105_cur."!cursor_pass"(rx1105_pos, "infix:sym<&&>")
    rx1105_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1105_pos)
    .return (rx1105_cur)
  rx1105_fail:
.annotate "line", 385
    (rx1105_rep, rx1105_pos, $I10, $P10) = rx1105_cur."!mark_fail"(0)
    lt rx1105_pos, -1, rx1105_done
    eq rx1105_pos, -1, rx1105_fail
    jump $I10
  rx1105_done:
    rx1105_cur."!cursor_fail"()
    rx1105_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1105_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("282_1259078882.26523") :method
.annotate "line", 385
    $P1107 = self."!PREFIX__!subrule"("O", "&&")
    new $P1108, "ResizablePMCArray"
    push $P1108, $P1107
    .return ($P1108)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("283_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1112_tgt
    .local int rx1112_pos
    .local int rx1112_off
    .local int rx1112_eos
    .local int rx1112_rep
    .local pmc rx1112_cur
    (rx1112_cur, rx1112_pos, rx1112_tgt) = self."!cursor_start"()
    rx1112_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1112_cur
    .local pmc match
    .lex "$/", match
    length rx1112_eos, rx1112_tgt
    set rx1112_off, 0
    lt rx1112_pos, 2, rx1112_start
    sub rx1112_off, rx1112_pos, 1
    substr rx1112_tgt, rx1112_tgt, rx1112_off
  rx1112_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1116_done
    goto rxscan1116_scan
  rxscan1116_loop:
    ($P10) = rx1112_cur."from"()
    inc $P10
    set rx1112_pos, $P10
    ge rx1112_pos, rx1112_eos, rxscan1116_done
  rxscan1116_scan:
    set_addr $I10, rxscan1116_loop
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10)
  rxscan1116_done:
.annotate "line", 470
  # rx subcapture "sym"
    set_addr $I10, rxcap_1117_fail
    rx1112_cur."!mark_push"(0, rx1112_pos, $I10)
  # rx literal  "||"
    add $I11, rx1112_pos, 2
    gt $I11, rx1112_eos, rx1112_fail
    sub $I11, rx1112_pos, rx1112_off
    substr $S10, rx1112_tgt, $I11, 2
    ne $S10, "||", rx1112_fail
    add rx1112_pos, 2
    set_addr $I10, rxcap_1117_fail
    ($I12, $I11) = rx1112_cur."!mark_peek"($I10)
    rx1112_cur."!cursor_pos"($I11)
    ($P10) = rx1112_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1112_pos, "")
    rx1112_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1117_done
  rxcap_1117_fail:
    goto rx1112_fail
  rxcap_1117_done:
  # rx subrule "O" subtype=capture negate=
    rx1112_cur."!cursor_pos"(rx1112_pos)
    $P10 = rx1112_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1112_fail
    rx1112_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1112_pos = $P10."pos"()
  # rx pass
    rx1112_cur."!cursor_pass"(rx1112_pos, "infix:sym<||>")
    rx1112_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1112_pos)
    .return (rx1112_cur)
  rx1112_fail:
.annotate "line", 385
    (rx1112_rep, rx1112_pos, $I10, $P10) = rx1112_cur."!mark_fail"(0)
    lt rx1112_pos, -1, rx1112_done
    eq rx1112_pos, -1, rx1112_fail
    jump $I10
  rx1112_done:
    rx1112_cur."!cursor_fail"()
    rx1112_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1112_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("284_1259078882.26523") :method
.annotate "line", 385
    $P1114 = self."!PREFIX__!subrule"("O", "||")
    new $P1115, "ResizablePMCArray"
    push $P1115, $P1114
    .return ($P1115)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("285_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1119_tgt
    .local int rx1119_pos
    .local int rx1119_off
    .local int rx1119_eos
    .local int rx1119_rep
    .local pmc rx1119_cur
    (rx1119_cur, rx1119_pos, rx1119_tgt) = self."!cursor_start"()
    rx1119_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1119_cur
    .local pmc match
    .lex "$/", match
    length rx1119_eos, rx1119_tgt
    set rx1119_off, 0
    lt rx1119_pos, 2, rx1119_start
    sub rx1119_off, rx1119_pos, 1
    substr rx1119_tgt, rx1119_tgt, rx1119_off
  rx1119_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1123_done
    goto rxscan1123_scan
  rxscan1123_loop:
    ($P10) = rx1119_cur."from"()
    inc $P10
    set rx1119_pos, $P10
    ge rx1119_pos, rx1119_eos, rxscan1123_done
  rxscan1123_scan:
    set_addr $I10, rxscan1123_loop
    rx1119_cur."!mark_push"(0, rx1119_pos, $I10)
  rxscan1123_done:
.annotate "line", 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_1124_fail
    rx1119_cur."!mark_push"(0, rx1119_pos, $I10)
  # rx literal  "//"
    add $I11, rx1119_pos, 2
    gt $I11, rx1119_eos, rx1119_fail
    sub $I11, rx1119_pos, rx1119_off
    substr $S10, rx1119_tgt, $I11, 2
    ne $S10, "//", rx1119_fail
    add rx1119_pos, 2
    set_addr $I10, rxcap_1124_fail
    ($I12, $I11) = rx1119_cur."!mark_peek"($I10)
    rx1119_cur."!cursor_pos"($I11)
    ($P10) = rx1119_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1119_pos, "")
    rx1119_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1124_done
  rxcap_1124_fail:
    goto rx1119_fail
  rxcap_1124_done:
  # rx subrule "O" subtype=capture negate=
    rx1119_cur."!cursor_pos"(rx1119_pos)
    $P10 = rx1119_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1119_fail
    rx1119_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1119_pos = $P10."pos"()
  # rx pass
    rx1119_cur."!cursor_pass"(rx1119_pos, "infix:sym<//>")
    rx1119_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1119_pos)
    .return (rx1119_cur)
  rx1119_fail:
.annotate "line", 385
    (rx1119_rep, rx1119_pos, $I10, $P10) = rx1119_cur."!mark_fail"(0)
    lt rx1119_pos, -1, rx1119_done
    eq rx1119_pos, -1, rx1119_fail
    jump $I10
  rx1119_done:
    rx1119_cur."!cursor_fail"()
    rx1119_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1119_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("286_1259078882.26523") :method
.annotate "line", 385
    $P1121 = self."!PREFIX__!subrule"("O", "//")
    new $P1122, "ResizablePMCArray"
    push $P1122, $P1121
    .return ($P1122)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("287_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1126_tgt
    .local int rx1126_pos
    .local int rx1126_off
    .local int rx1126_eos
    .local int rx1126_rep
    .local pmc rx1126_cur
    (rx1126_cur, rx1126_pos, rx1126_tgt) = self."!cursor_start"()
    rx1126_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1126_cur
    .local pmc match
    .lex "$/", match
    length rx1126_eos, rx1126_tgt
    set rx1126_off, 0
    lt rx1126_pos, 2, rx1126_start
    sub rx1126_off, rx1126_pos, 1
    substr rx1126_tgt, rx1126_tgt, rx1126_off
  rx1126_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1130_done
    goto rxscan1130_scan
  rxscan1130_loop:
    ($P10) = rx1126_cur."from"()
    inc $P10
    set rx1126_pos, $P10
    ge rx1126_pos, rx1126_eos, rxscan1130_done
  rxscan1130_scan:
    set_addr $I10, rxscan1130_loop
    rx1126_cur."!mark_push"(0, rx1126_pos, $I10)
  rxscan1130_done:
.annotate "line", 474
  # rx literal  "??"
    add $I11, rx1126_pos, 2
    gt $I11, rx1126_eos, rx1126_fail
    sub $I11, rx1126_pos, rx1126_off
    substr $S10, rx1126_tgt, $I11, 2
    ne $S10, "??", rx1126_fail
    add rx1126_pos, 2
.annotate "line", 475
  # rx subrule "ws" subtype=method negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."ws"()
    unless $P10, rx1126_fail
    rx1126_pos = $P10."pos"()
.annotate "line", 476
  # rx subrule "EXPR" subtype=capture negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."EXPR"("i=")
    unless $P10, rx1126_fail
    rx1126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1126_pos = $P10."pos"()
.annotate "line", 477
  # rx literal  "!!"
    add $I11, rx1126_pos, 2
    gt $I11, rx1126_eos, rx1126_fail
    sub $I11, rx1126_pos, rx1126_off
    substr $S10, rx1126_tgt, $I11, 2
    ne $S10, "!!", rx1126_fail
    add rx1126_pos, 2
.annotate "line", 478
  # rx subrule "O" subtype=capture negate=
    rx1126_cur."!cursor_pos"(rx1126_pos)
    $P10 = rx1126_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1126_fail
    rx1126_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1126_pos = $P10."pos"()
.annotate "line", 473
  # rx pass
    rx1126_cur."!cursor_pass"(rx1126_pos, "infix:sym<?? !!>")
    rx1126_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1126_pos)
    .return (rx1126_cur)
  rx1126_fail:
.annotate "line", 385
    (rx1126_rep, rx1126_pos, $I10, $P10) = rx1126_cur."!mark_fail"(0)
    lt rx1126_pos, -1, rx1126_done
    eq rx1126_pos, -1, rx1126_fail
    jump $I10
  rx1126_done:
    rx1126_cur."!cursor_fail"()
    rx1126_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1126_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("288_1259078882.26523") :method
.annotate "line", 385
    $P1128 = self."!PREFIX__!subrule"("", "??")
    new $P1129, "ResizablePMCArray"
    push $P1129, $P1128
    .return ($P1129)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("289_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1132_tgt
    .local int rx1132_pos
    .local int rx1132_off
    .local int rx1132_eos
    .local int rx1132_rep
    .local pmc rx1132_cur
    (rx1132_cur, rx1132_pos, rx1132_tgt) = self."!cursor_start"()
    rx1132_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1132_cur
    .local pmc match
    .lex "$/", match
    length rx1132_eos, rx1132_tgt
    set rx1132_off, 0
    lt rx1132_pos, 2, rx1132_start
    sub rx1132_off, rx1132_pos, 1
    substr rx1132_tgt, rx1132_tgt, rx1132_off
  rx1132_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1136_done
    goto rxscan1136_scan
  rxscan1136_loop:
    ($P10) = rx1132_cur."from"()
    inc $P10
    set rx1132_pos, $P10
    ge rx1132_pos, rx1132_eos, rxscan1136_done
  rxscan1136_scan:
    set_addr $I10, rxscan1136_loop
    rx1132_cur."!mark_push"(0, rx1132_pos, $I10)
  rxscan1136_done:
.annotate "line", 482
  # rx subcapture "sym"
    set_addr $I10, rxcap_1137_fail
    rx1132_cur."!mark_push"(0, rx1132_pos, $I10)
  # rx literal  "="
    add $I11, rx1132_pos, 1
    gt $I11, rx1132_eos, rx1132_fail
    sub $I11, rx1132_pos, rx1132_off
    substr $S10, rx1132_tgt, $I11, 1
    ne $S10, "=", rx1132_fail
    add rx1132_pos, 1
    set_addr $I10, rxcap_1137_fail
    ($I12, $I11) = rx1132_cur."!mark_peek"($I10)
    rx1132_cur."!cursor_pos"($I11)
    ($P10) = rx1132_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1132_pos, "")
    rx1132_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1137_done
  rxcap_1137_fail:
    goto rx1132_fail
  rxcap_1137_done:
  # rx subrule "panic" subtype=method negate=
    rx1132_cur."!cursor_pos"(rx1132_pos)
    $P10 = rx1132_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1132_fail
    rx1132_pos = $P10."pos"()
.annotate "line", 481
  # rx pass
    rx1132_cur."!cursor_pass"(rx1132_pos, "infix:sym<=>")
    rx1132_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1132_pos)
    .return (rx1132_cur)
  rx1132_fail:
.annotate "line", 385
    (rx1132_rep, rx1132_pos, $I10, $P10) = rx1132_cur."!mark_fail"(0)
    lt rx1132_pos, -1, rx1132_done
    eq rx1132_pos, -1, rx1132_fail
    jump $I10
  rx1132_done:
    rx1132_cur."!cursor_fail"()
    rx1132_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1132_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("290_1259078882.26523") :method
.annotate "line", 385
    $P1134 = self."!PREFIX__!subrule"("", "=")
    new $P1135, "ResizablePMCArray"
    push $P1135, $P1134
    .return ($P1135)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("291_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1139_tgt
    .local int rx1139_pos
    .local int rx1139_off
    .local int rx1139_eos
    .local int rx1139_rep
    .local pmc rx1139_cur
    (rx1139_cur, rx1139_pos, rx1139_tgt) = self."!cursor_start"()
    rx1139_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1139_cur
    .local pmc match
    .lex "$/", match
    length rx1139_eos, rx1139_tgt
    set rx1139_off, 0
    lt rx1139_pos, 2, rx1139_start
    sub rx1139_off, rx1139_pos, 1
    substr rx1139_tgt, rx1139_tgt, rx1139_off
  rx1139_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1143_done
    goto rxscan1143_scan
  rxscan1143_loop:
    ($P10) = rx1139_cur."from"()
    inc $P10
    set rx1139_pos, $P10
    ge rx1139_pos, rx1139_eos, rxscan1143_done
  rxscan1143_scan:
    set_addr $I10, rxscan1143_loop
    rx1139_cur."!mark_push"(0, rx1139_pos, $I10)
  rxscan1143_done:
.annotate "line", 484
  # rx subcapture "sym"
    set_addr $I10, rxcap_1144_fail
    rx1139_cur."!mark_push"(0, rx1139_pos, $I10)
  # rx literal  ":="
    add $I11, rx1139_pos, 2
    gt $I11, rx1139_eos, rx1139_fail
    sub $I11, rx1139_pos, rx1139_off
    substr $S10, rx1139_tgt, $I11, 2
    ne $S10, ":=", rx1139_fail
    add rx1139_pos, 2
    set_addr $I10, rxcap_1144_fail
    ($I12, $I11) = rx1139_cur."!mark_peek"($I10)
    rx1139_cur."!cursor_pos"($I11)
    ($P10) = rx1139_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1139_pos, "")
    rx1139_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1144_done
  rxcap_1144_fail:
    goto rx1139_fail
  rxcap_1144_done:
  # rx subrule "O" subtype=capture negate=
    rx1139_cur."!cursor_pos"(rx1139_pos)
    $P10 = rx1139_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1139_fail
    rx1139_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1139_pos = $P10."pos"()
  # rx pass
    rx1139_cur."!cursor_pass"(rx1139_pos, "infix:sym<:=>")
    rx1139_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1139_pos)
    .return (rx1139_cur)
  rx1139_fail:
.annotate "line", 385
    (rx1139_rep, rx1139_pos, $I10, $P10) = rx1139_cur."!mark_fail"(0)
    lt rx1139_pos, -1, rx1139_done
    eq rx1139_pos, -1, rx1139_fail
    jump $I10
  rx1139_done:
    rx1139_cur."!cursor_fail"()
    rx1139_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1139_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("292_1259078882.26523") :method
.annotate "line", 385
    $P1141 = self."!PREFIX__!subrule"("O", ":=")
    new $P1142, "ResizablePMCArray"
    push $P1142, $P1141
    .return ($P1142)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("293_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1146_tgt
    .local int rx1146_pos
    .local int rx1146_off
    .local int rx1146_eos
    .local int rx1146_rep
    .local pmc rx1146_cur
    (rx1146_cur, rx1146_pos, rx1146_tgt) = self."!cursor_start"()
    rx1146_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1146_cur
    .local pmc match
    .lex "$/", match
    length rx1146_eos, rx1146_tgt
    set rx1146_off, 0
    lt rx1146_pos, 2, rx1146_start
    sub rx1146_off, rx1146_pos, 1
    substr rx1146_tgt, rx1146_tgt, rx1146_off
  rx1146_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1150_done
    goto rxscan1150_scan
  rxscan1150_loop:
    ($P10) = rx1146_cur."from"()
    inc $P10
    set rx1146_pos, $P10
    ge rx1146_pos, rx1146_eos, rxscan1150_done
  rxscan1150_scan:
    set_addr $I10, rxscan1150_loop
    rx1146_cur."!mark_push"(0, rx1146_pos, $I10)
  rxscan1150_done:
.annotate "line", 485
  # rx subcapture "sym"
    set_addr $I10, rxcap_1151_fail
    rx1146_cur."!mark_push"(0, rx1146_pos, $I10)
  # rx literal  "::="
    add $I11, rx1146_pos, 3
    gt $I11, rx1146_eos, rx1146_fail
    sub $I11, rx1146_pos, rx1146_off
    substr $S10, rx1146_tgt, $I11, 3
    ne $S10, "::=", rx1146_fail
    add rx1146_pos, 3
    set_addr $I10, rxcap_1151_fail
    ($I12, $I11) = rx1146_cur."!mark_peek"($I10)
    rx1146_cur."!cursor_pos"($I11)
    ($P10) = rx1146_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1146_pos, "")
    rx1146_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1151_done
  rxcap_1151_fail:
    goto rx1146_fail
  rxcap_1151_done:
  # rx subrule "O" subtype=capture negate=
    rx1146_cur."!cursor_pos"(rx1146_pos)
    $P10 = rx1146_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1146_fail
    rx1146_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1146_pos = $P10."pos"()
  # rx pass
    rx1146_cur."!cursor_pass"(rx1146_pos, "infix:sym<::=>")
    rx1146_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1146_pos)
    .return (rx1146_cur)
  rx1146_fail:
.annotate "line", 385
    (rx1146_rep, rx1146_pos, $I10, $P10) = rx1146_cur."!mark_fail"(0)
    lt rx1146_pos, -1, rx1146_done
    eq rx1146_pos, -1, rx1146_fail
    jump $I10
  rx1146_done:
    rx1146_cur."!cursor_fail"()
    rx1146_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1146_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("294_1259078882.26523") :method
.annotate "line", 385
    $P1148 = self."!PREFIX__!subrule"("O", "::=")
    new $P1149, "ResizablePMCArray"
    push $P1149, $P1148
    .return ($P1149)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("295_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1153_tgt
    .local int rx1153_pos
    .local int rx1153_off
    .local int rx1153_eos
    .local int rx1153_rep
    .local pmc rx1153_cur
    (rx1153_cur, rx1153_pos, rx1153_tgt) = self."!cursor_start"()
    rx1153_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1153_cur
    .local pmc match
    .lex "$/", match
    length rx1153_eos, rx1153_tgt
    set rx1153_off, 0
    lt rx1153_pos, 2, rx1153_start
    sub rx1153_off, rx1153_pos, 1
    substr rx1153_tgt, rx1153_tgt, rx1153_off
  rx1153_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1157_done
    goto rxscan1157_scan
  rxscan1157_loop:
    ($P10) = rx1153_cur."from"()
    inc $P10
    set rx1153_pos, $P10
    ge rx1153_pos, rx1153_eos, rxscan1157_done
  rxscan1157_scan:
    set_addr $I10, rxscan1157_loop
    rx1153_cur."!mark_push"(0, rx1153_pos, $I10)
  rxscan1157_done:
.annotate "line", 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1158_fail
    rx1153_cur."!mark_push"(0, rx1153_pos, $I10)
  # rx literal  ","
    add $I11, rx1153_pos, 1
    gt $I11, rx1153_eos, rx1153_fail
    sub $I11, rx1153_pos, rx1153_off
    substr $S10, rx1153_tgt, $I11, 1
    ne $S10, ",", rx1153_fail
    add rx1153_pos, 1
    set_addr $I10, rxcap_1158_fail
    ($I12, $I11) = rx1153_cur."!mark_peek"($I10)
    rx1153_cur."!cursor_pos"($I11)
    ($P10) = rx1153_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1153_pos, "")
    rx1153_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1158_done
  rxcap_1158_fail:
    goto rx1153_fail
  rxcap_1158_done:
  # rx subrule "O" subtype=capture negate=
    rx1153_cur."!cursor_pos"(rx1153_pos)
    $P10 = rx1153_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1153_fail
    rx1153_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1153_pos = $P10."pos"()
  # rx pass
    rx1153_cur."!cursor_pass"(rx1153_pos, "infix:sym<,>")
    rx1153_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1153_pos)
    .return (rx1153_cur)
  rx1153_fail:
.annotate "line", 385
    (rx1153_rep, rx1153_pos, $I10, $P10) = rx1153_cur."!mark_fail"(0)
    lt rx1153_pos, -1, rx1153_done
    eq rx1153_pos, -1, rx1153_fail
    jump $I10
  rx1153_done:
    rx1153_cur."!cursor_fail"()
    rx1153_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1153_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("296_1259078882.26523") :method
.annotate "line", 385
    $P1155 = self."!PREFIX__!subrule"("O", ",")
    new $P1156, "ResizablePMCArray"
    push $P1156, $P1155
    .return ($P1156)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("297_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1160_tgt
    .local int rx1160_pos
    .local int rx1160_off
    .local int rx1160_eos
    .local int rx1160_rep
    .local pmc rx1160_cur
    (rx1160_cur, rx1160_pos, rx1160_tgt) = self."!cursor_start"()
    rx1160_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1160_cur
    .local pmc match
    .lex "$/", match
    length rx1160_eos, rx1160_tgt
    set rx1160_off, 0
    lt rx1160_pos, 2, rx1160_start
    sub rx1160_off, rx1160_pos, 1
    substr rx1160_tgt, rx1160_tgt, rx1160_off
  rx1160_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1163_done
    goto rxscan1163_scan
  rxscan1163_loop:
    ($P10) = rx1160_cur."from"()
    inc $P10
    set rx1160_pos, $P10
    ge rx1160_pos, rx1160_eos, rxscan1163_done
  rxscan1163_scan:
    set_addr $I10, rxscan1163_loop
    rx1160_cur."!mark_push"(0, rx1160_pos, $I10)
  rxscan1163_done:
.annotate "line", 489
  # rx subcapture "sym"
    set_addr $I10, rxcap_1164_fail
    rx1160_cur."!mark_push"(0, rx1160_pos, $I10)
  # rx literal  "return"
    add $I11, rx1160_pos, 6
    gt $I11, rx1160_eos, rx1160_fail
    sub $I11, rx1160_pos, rx1160_off
    substr $S10, rx1160_tgt, $I11, 6
    ne $S10, "return", rx1160_fail
    add rx1160_pos, 6
    set_addr $I10, rxcap_1164_fail
    ($I12, $I11) = rx1160_cur."!mark_peek"($I10)
    rx1160_cur."!cursor_pos"($I11)
    ($P10) = rx1160_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1160_pos, "")
    rx1160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1164_done
  rxcap_1164_fail:
    goto rx1160_fail
  rxcap_1164_done:
  # rx charclass s
    ge rx1160_pos, rx1160_eos, rx1160_fail
    sub $I10, rx1160_pos, rx1160_off
    is_cclass $I11, 32, rx1160_tgt, $I10
    unless $I11, rx1160_fail
    inc rx1160_pos
  # rx subrule "O" subtype=capture negate=
    rx1160_cur."!cursor_pos"(rx1160_pos)
    $P10 = rx1160_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1160_fail
    rx1160_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1160_pos = $P10."pos"()
  # rx pass
    rx1160_cur."!cursor_pass"(rx1160_pos, "prefix:sym<return>")
    rx1160_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1160_pos)
    .return (rx1160_cur)
  rx1160_fail:
.annotate "line", 385
    (rx1160_rep, rx1160_pos, $I10, $P10) = rx1160_cur."!mark_fail"(0)
    lt rx1160_pos, -1, rx1160_done
    eq rx1160_pos, -1, rx1160_fail
    jump $I10
  rx1160_done:
    rx1160_cur."!cursor_fail"()
    rx1160_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1160_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("298_1259078882.26523") :method
.annotate "line", 385
    new $P1162, "ResizablePMCArray"
    push $P1162, "return"
    .return ($P1162)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("299_1259078882.26523") :method :outer("11_1259078882.26523")
.annotate "line", 385
    .local string rx1166_tgt
    .local int rx1166_pos
    .local int rx1166_off
    .local int rx1166_eos
    .local int rx1166_rep
    .local pmc rx1166_cur
    (rx1166_cur, rx1166_pos, rx1166_tgt) = self."!cursor_start"()
    rx1166_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1166_cur
    .local pmc match
    .lex "$/", match
    length rx1166_eos, rx1166_tgt
    set rx1166_off, 0
    lt rx1166_pos, 2, rx1166_start
    sub rx1166_off, rx1166_pos, 1
    substr rx1166_tgt, rx1166_tgt, rx1166_off
  rx1166_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1169_done
    goto rxscan1169_scan
  rxscan1169_loop:
    ($P10) = rx1166_cur."from"()
    inc $P10
    set rx1166_pos, $P10
    ge rx1166_pos, rx1166_eos, rxscan1169_done
  rxscan1169_scan:
    set_addr $I10, rxscan1169_loop
    rx1166_cur."!mark_push"(0, rx1166_pos, $I10)
  rxscan1169_done:
.annotate "line", 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1170_fail
    rx1166_cur."!mark_push"(0, rx1166_pos, $I10)
  # rx literal  "make"
    add $I11, rx1166_pos, 4
    gt $I11, rx1166_eos, rx1166_fail
    sub $I11, rx1166_pos, rx1166_off
    substr $S10, rx1166_tgt, $I11, 4
    ne $S10, "make", rx1166_fail
    add rx1166_pos, 4
    set_addr $I10, rxcap_1170_fail
    ($I12, $I11) = rx1166_cur."!mark_peek"($I10)
    rx1166_cur."!cursor_pos"($I11)
    ($P10) = rx1166_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1166_pos, "")
    rx1166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1170_done
  rxcap_1170_fail:
    goto rx1166_fail
  rxcap_1170_done:
  # rx charclass s
    ge rx1166_pos, rx1166_eos, rx1166_fail
    sub $I10, rx1166_pos, rx1166_off
    is_cclass $I11, 32, rx1166_tgt, $I10
    unless $I11, rx1166_fail
    inc rx1166_pos
  # rx subrule "O" subtype=capture negate=
    rx1166_cur."!cursor_pos"(rx1166_pos)
    $P10 = rx1166_cur."O"("%list_prefix")
    unless $P10, rx1166_fail
    rx1166_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1166_pos = $P10."pos"()
  # rx pass
    rx1166_cur."!cursor_pass"(rx1166_pos, "prefix:sym<make>")
    rx1166_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1166_pos)
    .return (rx1166_cur)
  rx1166_fail:
.annotate "line", 385
    (rx1166_rep, rx1166_pos, $I10, $P10) = rx1166_cur."!mark_fail"(0)
    lt rx1166_pos, -1, rx1166_done
    eq rx1166_pos, -1, rx1166_fail
    jump $I10
  rx1166_done:
    rx1166_cur."!cursor_fail"()
    rx1166_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1166_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("300_1259078882.26523") :method
.annotate "line", 385
    new $P1168, "ResizablePMCArray"
    push $P1168, "make"
    .return ($P1168)
.end


.namespace ["NQP";"Regex"]
.sub "_block1171"  :subid("301_1259078882.26523") :outer("11_1259078882.26523")
.annotate "line", 493
    .const 'Sub' $P1207 = "312_1259078882.26523" 
    capture_lex $P1207
    .const 'Sub' $P1193 = "309_1259078882.26523" 
    capture_lex $P1193
    .const 'Sub' $P1188 = "307_1259078882.26523" 
    capture_lex $P1188
    .const 'Sub' $P1183 = "305_1259078882.26523" 
    capture_lex $P1183
    .const 'Sub' $P1173 = "302_1259078882.26523" 
    capture_lex $P1173
    .const 'Sub' $P1207 = "312_1259078882.26523" 
    capture_lex $P1207
    .return ($P1207)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("302_1259078882.26523") :method :outer("301_1259078882.26523")
.annotate "line", 493
    .const 'Sub' $P1179 = "304_1259078882.26523" 
    capture_lex $P1179
    .local string rx1174_tgt
    .local int rx1174_pos
    .local int rx1174_off
    .local int rx1174_eos
    .local int rx1174_rep
    .local pmc rx1174_cur
    (rx1174_cur, rx1174_pos, rx1174_tgt) = self."!cursor_start"()
    rx1174_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1174_cur
    .local pmc match
    .lex "$/", match
    length rx1174_eos, rx1174_tgt
    set rx1174_off, 0
    lt rx1174_pos, 2, rx1174_start
    sub rx1174_off, rx1174_pos, 1
    substr rx1174_tgt, rx1174_tgt, rx1174_off
  rx1174_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1177_done
    goto rxscan1177_scan
  rxscan1177_loop:
    ($P10) = rx1174_cur."from"()
    inc $P10
    set rx1174_pos, $P10
    ge rx1174_pos, rx1174_eos, rxscan1177_done
  rxscan1177_scan:
    set_addr $I10, rxscan1177_loop
    rx1174_cur."!mark_push"(0, rx1174_pos, $I10)
  rxscan1177_done:
.annotate "line", 495
  # rx literal  ":"
    add $I11, rx1174_pos, 1
    gt $I11, rx1174_eos, rx1174_fail
    sub $I11, rx1174_pos, rx1174_off
    substr $S10, rx1174_tgt, $I11, 1
    ne $S10, ":", rx1174_fail
    add rx1174_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1174_cur."!cursor_pos"(rx1174_pos)
    .const 'Sub' $P1179 = "304_1259078882.26523" 
    capture_lex $P1179
    $P10 = rx1174_cur."before"($P1179)
    unless $P10, rx1174_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1174_cur."!cursor_pos"(rx1174_pos)
    $P10 = rx1174_cur."LANG"("MAIN", "statement")
    unless $P10, rx1174_fail
    rx1174_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1174_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1174_cur."!cursor_pos"(rx1174_pos)
    $P10 = rx1174_cur."ws"()
    unless $P10, rx1174_fail
    rx1174_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1174_pos, 1
    gt $I11, rx1174_eos, rx1174_fail
    sub $I11, rx1174_pos, rx1174_off
    substr $S10, rx1174_tgt, $I11, 1
    ne $S10, ";", rx1174_fail
    add rx1174_pos, 1
.annotate "line", 494
  # rx pass
    rx1174_cur."!cursor_pass"(rx1174_pos, "metachar:sym<:my>")
    rx1174_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1174_pos)
    .return (rx1174_cur)
  rx1174_fail:
.annotate "line", 493
    (rx1174_rep, rx1174_pos, $I10, $P10) = rx1174_cur."!mark_fail"(0)
    lt rx1174_pos, -1, rx1174_done
    eq rx1174_pos, -1, rx1174_fail
    jump $I10
  rx1174_done:
    rx1174_cur."!cursor_fail"()
    rx1174_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1174_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("303_1259078882.26523") :method
.annotate "line", 493
    new $P1176, "ResizablePMCArray"
    push $P1176, ":"
    .return ($P1176)
.end


.namespace ["NQP";"Regex"]
.sub "_block1178"  :anon :subid("304_1259078882.26523") :method :outer("302_1259078882.26523")
.annotate "line", 495
    .lex unicode:"$\x{a2}", $P1180
    .local string rx1181_tgt
    .local int rx1181_pos
    .local int rx1181_off
    .local int rx1181_eos
    .local int rx1181_rep
    .local pmc rx1181_cur
    (rx1181_cur, rx1181_pos, rx1181_tgt) = self."!cursor_start"()
    rx1181_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1181_cur
    .local pmc match
    .lex "$/", match
    length rx1181_eos, rx1181_tgt
    set rx1181_off, 0
    lt rx1181_pos, 2, rx1181_start
    sub rx1181_off, rx1181_pos, 1
    substr rx1181_tgt, rx1181_tgt, rx1181_off
  rx1181_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1182_done
    goto rxscan1182_scan
  rxscan1182_loop:
    ($P10) = rx1181_cur."from"()
    inc $P10
    set rx1181_pos, $P10
    ge rx1181_pos, rx1181_eos, rxscan1182_done
  rxscan1182_scan:
    set_addr $I10, rxscan1182_loop
    rx1181_cur."!mark_push"(0, rx1181_pos, $I10)
  rxscan1182_done:
  # rx literal  "my"
    add $I11, rx1181_pos, 2
    gt $I11, rx1181_eos, rx1181_fail
    sub $I11, rx1181_pos, rx1181_off
    substr $S10, rx1181_tgt, $I11, 2
    ne $S10, "my", rx1181_fail
    add rx1181_pos, 2
  # rx pass
    rx1181_cur."!cursor_pass"(rx1181_pos, "")
    rx1181_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1181_pos)
    .return (rx1181_cur)
  rx1181_fail:
    (rx1181_rep, rx1181_pos, $I10, $P10) = rx1181_cur."!mark_fail"(0)
    lt rx1181_pos, -1, rx1181_done
    eq rx1181_pos, -1, rx1181_fail
    jump $I10
  rx1181_done:
    rx1181_cur."!cursor_fail"()
    rx1181_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1181_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("305_1259078882.26523") :method :outer("301_1259078882.26523")
.annotate "line", 493
    .local string rx1184_tgt
    .local int rx1184_pos
    .local int rx1184_off
    .local int rx1184_eos
    .local int rx1184_rep
    .local pmc rx1184_cur
    (rx1184_cur, rx1184_pos, rx1184_tgt) = self."!cursor_start"()
    rx1184_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1184_cur
    .local pmc match
    .lex "$/", match
    length rx1184_eos, rx1184_tgt
    set rx1184_off, 0
    lt rx1184_pos, 2, rx1184_start
    sub rx1184_off, rx1184_pos, 1
    substr rx1184_tgt, rx1184_tgt, rx1184_off
  rx1184_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1187_done
    goto rxscan1187_scan
  rxscan1187_loop:
    ($P10) = rx1184_cur."from"()
    inc $P10
    set rx1184_pos, $P10
    ge rx1184_pos, rx1184_eos, rxscan1187_done
  rxscan1187_scan:
    set_addr $I10, rxscan1187_loop
    rx1184_cur."!mark_push"(0, rx1184_pos, $I10)
  rxscan1187_done:
.annotate "line", 499
  # rx enumcharlist negate=0 zerowidth
    ge rx1184_pos, rx1184_eos, rx1184_fail
    sub $I10, rx1184_pos, rx1184_off
    substr $S10, rx1184_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1184_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1184_cur."!cursor_pos"(rx1184_pos)
    $P10 = rx1184_cur."codeblock"()
    unless $P10, rx1184_fail
    rx1184_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1184_pos = $P10."pos"()
.annotate "line", 498
  # rx pass
    rx1184_cur."!cursor_pass"(rx1184_pos, "metachar:sym<{ }>")
    rx1184_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1184_pos)
    .return (rx1184_cur)
  rx1184_fail:
.annotate "line", 493
    (rx1184_rep, rx1184_pos, $I10, $P10) = rx1184_cur."!mark_fail"(0)
    lt rx1184_pos, -1, rx1184_done
    eq rx1184_pos, -1, rx1184_fail
    jump $I10
  rx1184_done:
    rx1184_cur."!cursor_fail"()
    rx1184_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1184_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("306_1259078882.26523") :method
.annotate "line", 493
    new $P1186, "ResizablePMCArray"
    push $P1186, "{"
    .return ($P1186)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("307_1259078882.26523") :method :outer("301_1259078882.26523")
.annotate "line", 493
    .local string rx1189_tgt
    .local int rx1189_pos
    .local int rx1189_off
    .local int rx1189_eos
    .local int rx1189_rep
    .local pmc rx1189_cur
    (rx1189_cur, rx1189_pos, rx1189_tgt) = self."!cursor_start"()
    rx1189_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1189_cur
    .local pmc match
    .lex "$/", match
    length rx1189_eos, rx1189_tgt
    set rx1189_off, 0
    lt rx1189_pos, 2, rx1189_start
    sub rx1189_off, rx1189_pos, 1
    substr rx1189_tgt, rx1189_tgt, rx1189_off
  rx1189_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1192_done
    goto rxscan1192_scan
  rxscan1192_loop:
    ($P10) = rx1189_cur."from"()
    inc $P10
    set rx1189_pos, $P10
    ge rx1189_pos, rx1189_eos, rxscan1192_done
  rxscan1192_scan:
    set_addr $I10, rxscan1192_loop
    rx1189_cur."!mark_push"(0, rx1189_pos, $I10)
  rxscan1192_done:
.annotate "line", 503
  # rx enumcharlist negate=0 zerowidth
    ge rx1189_pos, rx1189_eos, rx1189_fail
    sub $I10, rx1189_pos, rx1189_off
    substr $S10, rx1189_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1189_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1189_cur."!cursor_pos"(rx1189_pos)
    $P10 = rx1189_cur."codeblock"()
    unless $P10, rx1189_fail
    rx1189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1189_pos = $P10."pos"()
.annotate "line", 502
  # rx pass
    rx1189_cur."!cursor_pass"(rx1189_pos, "assertion:sym<{ }>")
    rx1189_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1189_pos)
    .return (rx1189_cur)
  rx1189_fail:
.annotate "line", 493
    (rx1189_rep, rx1189_pos, $I10, $P10) = rx1189_cur."!mark_fail"(0)
    lt rx1189_pos, -1, rx1189_done
    eq rx1189_pos, -1, rx1189_fail
    jump $I10
  rx1189_done:
    rx1189_cur."!cursor_fail"()
    rx1189_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1189_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("308_1259078882.26523") :method
.annotate "line", 493
    new $P1191, "ResizablePMCArray"
    push $P1191, "{"
    .return ($P1191)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("309_1259078882.26523") :method :outer("301_1259078882.26523")
.annotate "line", 493
    .const 'Sub' $P1202 = "311_1259078882.26523" 
    capture_lex $P1202
    .local string rx1194_tgt
    .local int rx1194_pos
    .local int rx1194_off
    .local int rx1194_eos
    .local int rx1194_rep
    .local pmc rx1194_cur
    (rx1194_cur, rx1194_pos, rx1194_tgt) = self."!cursor_start"()
    rx1194_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1194_cur."!cursor_caparray"("arglist", "nibbler", "assertion")
    .lex unicode:"$\x{a2}", rx1194_cur
    .local pmc match
    .lex "$/", match
    length rx1194_eos, rx1194_tgt
    set rx1194_off, 0
    lt rx1194_pos, 2, rx1194_start
    sub rx1194_off, rx1194_pos, 1
    substr rx1194_tgt, rx1194_tgt, rx1194_off
  rx1194_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1197_done
    goto rxscan1197_scan
  rxscan1197_loop:
    ($P10) = rx1194_cur."from"()
    inc $P10
    set rx1194_pos, $P10
    ge rx1194_pos, rx1194_eos, rxscan1197_done
  rxscan1197_scan:
    set_addr $I10, rxscan1197_loop
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
  rxscan1197_done:
.annotate "line", 507
  # rx subcapture "longname"
    set_addr $I10, rxcap_1198_fail
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1194_pos, rx1194_off
    find_not_cclass $I11, 8192, rx1194_tgt, $I10, rx1194_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1194_fail
    add rx1194_pos, rx1194_off, $I11
    set_addr $I10, rxcap_1198_fail
    ($I12, $I11) = rx1194_cur."!mark_peek"($I10)
    rx1194_cur."!cursor_pos"($I11)
    ($P10) = rx1194_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1194_pos, "")
    rx1194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1198_done
  rxcap_1198_fail:
    goto rx1194_fail
  rxcap_1198_done:
.annotate "line", 514
  # rx rxquantr1199 ** 0..1
    set_addr $I1206, rxquantr1199_done
    rx1194_cur."!mark_push"(0, rx1194_pos, $I1206)
  rxquantr1199_loop:
  alt1200_0:
.annotate "line", 508
    set_addr $I10, alt1200_1
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
.annotate "line", 509
  # rx subrule "before" subtype=zerowidth negate=
    rx1194_cur."!cursor_pos"(rx1194_pos)
    .const 'Sub' $P1202 = "311_1259078882.26523" 
    capture_lex $P1202
    $P10 = rx1194_cur."before"($P1202)
    unless $P10, rx1194_fail
    goto alt1200_end
  alt1200_1:
    set_addr $I10, alt1200_2
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
.annotate "line", 510
  # rx literal  "="
    add $I11, rx1194_pos, 1
    gt $I11, rx1194_eos, rx1194_fail
    sub $I11, rx1194_pos, rx1194_off
    substr $S10, rx1194_tgt, $I11, 1
    ne $S10, "=", rx1194_fail
    add rx1194_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1194_cur."!cursor_pos"(rx1194_pos)
    $P10 = rx1194_cur."assertion"()
    unless $P10, rx1194_fail
    rx1194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1194_pos = $P10."pos"()
    goto alt1200_end
  alt1200_2:
    set_addr $I10, alt1200_3
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
.annotate "line", 511
  # rx literal  ":"
    add $I11, rx1194_pos, 1
    gt $I11, rx1194_eos, rx1194_fail
    sub $I11, rx1194_pos, rx1194_off
    substr $S10, rx1194_tgt, $I11, 1
    ne $S10, ":", rx1194_fail
    add rx1194_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1194_cur."!cursor_pos"(rx1194_pos)
    $P10 = rx1194_cur."arglist"()
    unless $P10, rx1194_fail
    rx1194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1194_pos = $P10."pos"()
    goto alt1200_end
  alt1200_3:
    set_addr $I10, alt1200_4
    rx1194_cur."!mark_push"(0, rx1194_pos, $I10)
.annotate "line", 512
  # rx literal  "("
    add $I11, rx1194_pos, 1
    gt $I11, rx1194_eos, rx1194_fail
    sub $I11, rx1194_pos, rx1194_off
    substr $S10, rx1194_tgt, $I11, 1
    ne $S10, "(", rx1194_fail
    add rx1194_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1194_cur."!cursor_pos"(rx1194_pos)
    $P10 = rx1194_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1194_fail
    rx1194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1194_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1194_pos, 1
    gt $I11, rx1194_eos, rx1194_fail
    sub $I11, rx1194_pos, rx1194_off
    substr $S10, rx1194_tgt, $I11, 1
    ne $S10, ")", rx1194_fail
    add rx1194_pos, 1
    goto alt1200_end
  alt1200_4:
.annotate "line", 513
  # rx subrule "normspace" subtype=method negate=
    rx1194_cur."!cursor_pos"(rx1194_pos)
    $P10 = rx1194_cur."normspace"()
    unless $P10, rx1194_fail
    rx1194_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1194_cur."!cursor_pos"(rx1194_pos)
    $P10 = rx1194_cur."nibbler"()
    unless $P10, rx1194_fail
    rx1194_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1194_pos = $P10."pos"()
  alt1200_end:
.annotate "line", 514
    (rx1194_rep) = rx1194_cur."!mark_commit"($I1206)
  rxquantr1199_done:
.annotate "line", 506
  # rx pass
    rx1194_cur."!cursor_pass"(rx1194_pos, "assertion:sym<name>")
    rx1194_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1194_pos)
    .return (rx1194_cur)
  rx1194_fail:
.annotate "line", 493
    (rx1194_rep, rx1194_pos, $I10, $P10) = rx1194_cur."!mark_fail"(0)
    lt rx1194_pos, -1, rx1194_done
    eq rx1194_pos, -1, rx1194_fail
    jump $I10
  rx1194_done:
    rx1194_cur."!cursor_fail"()
    rx1194_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1194_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("310_1259078882.26523") :method
.annotate "line", 493
    new $P1196, "ResizablePMCArray"
    push $P1196, ""
    .return ($P1196)
.end


.namespace ["NQP";"Regex"]
.sub "_block1201"  :anon :subid("311_1259078882.26523") :method :outer("309_1259078882.26523")
.annotate "line", 509
    .lex unicode:"$\x{a2}", $P1203
    .local string rx1204_tgt
    .local int rx1204_pos
    .local int rx1204_off
    .local int rx1204_eos
    .local int rx1204_rep
    .local pmc rx1204_cur
    (rx1204_cur, rx1204_pos, rx1204_tgt) = self."!cursor_start"()
    rx1204_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1204_cur
    .local pmc match
    .lex "$/", match
    length rx1204_eos, rx1204_tgt
    set rx1204_off, 0
    lt rx1204_pos, 2, rx1204_start
    sub rx1204_off, rx1204_pos, 1
    substr rx1204_tgt, rx1204_tgt, rx1204_off
  rx1204_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1205_done
    goto rxscan1205_scan
  rxscan1205_loop:
    ($P10) = rx1204_cur."from"()
    inc $P10
    set rx1204_pos, $P10
    ge rx1204_pos, rx1204_eos, rxscan1205_done
  rxscan1205_scan:
    set_addr $I10, rxscan1205_loop
    rx1204_cur."!mark_push"(0, rx1204_pos, $I10)
  rxscan1205_done:
  # rx literal  ">"
    add $I11, rx1204_pos, 1
    gt $I11, rx1204_eos, rx1204_fail
    sub $I11, rx1204_pos, rx1204_off
    substr $S10, rx1204_tgt, $I11, 1
    ne $S10, ">", rx1204_fail
    add rx1204_pos, 1
  # rx pass
    rx1204_cur."!cursor_pass"(rx1204_pos, "")
    rx1204_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1204_pos)
    .return (rx1204_cur)
  rx1204_fail:
    (rx1204_rep, rx1204_pos, $I10, $P10) = rx1204_cur."!mark_fail"(0)
    lt rx1204_pos, -1, rx1204_done
    eq rx1204_pos, -1, rx1204_fail
    jump $I10
  rx1204_done:
    rx1204_cur."!cursor_fail"()
    rx1204_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1204_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("312_1259078882.26523") :method :outer("301_1259078882.26523")
.annotate "line", 493
    .local string rx1208_tgt
    .local int rx1208_pos
    .local int rx1208_off
    .local int rx1208_eos
    .local int rx1208_rep
    .local pmc rx1208_cur
    (rx1208_cur, rx1208_pos, rx1208_tgt) = self."!cursor_start"()
    rx1208_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1208_cur
    .local pmc match
    .lex "$/", match
    length rx1208_eos, rx1208_tgt
    set rx1208_off, 0
    lt rx1208_pos, 2, rx1208_start
    sub rx1208_off, rx1208_pos, 1
    substr rx1208_tgt, rx1208_tgt, rx1208_off
  rx1208_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1212_done
    goto rxscan1212_scan
  rxscan1212_loop:
    ($P10) = rx1208_cur."from"()
    inc $P10
    set rx1208_pos, $P10
    ge rx1208_pos, rx1208_eos, rxscan1212_done
  rxscan1212_scan:
    set_addr $I10, rxscan1212_loop
    rx1208_cur."!mark_push"(0, rx1208_pos, $I10)
  rxscan1212_done:
.annotate "line", 519
  # rx subrule "LANG" subtype=capture negate=
    rx1208_cur."!cursor_pos"(rx1208_pos)
    $P10 = rx1208_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1208_fail
    rx1208_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1208_pos = $P10."pos"()
.annotate "line", 518
  # rx pass
    rx1208_cur."!cursor_pass"(rx1208_pos, "codeblock")
    rx1208_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1208_pos)
    .return (rx1208_cur)
  rx1208_fail:
.annotate "line", 493
    (rx1208_rep, rx1208_pos, $I10, $P10) = rx1208_cur."!mark_fail"(0)
    lt rx1208_pos, -1, rx1208_done
    eq rx1208_pos, -1, rx1208_fail
    jump $I10
  rx1208_done:
    rx1208_cur."!cursor_fail"()
    rx1208_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1208_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("313_1259078882.26523") :method
.annotate "line", 493
    $P1210 = self."!PREFIX__!subrule"("block", "")
    new $P1211, "ResizablePMCArray"
    push $P1211, $P1210
    .return ($P1211)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259078889.1754")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P1926 = $P14()
.annotate "line", 1
    .return ($P1926)
.end


.namespace []
.sub "" :load :init :subid("post115") :outer("10_1259078889.1754")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259078889.1754" 
    .local pmc block
    set block, $P12
    $P1927 = get_root_global ["parrot"], "P6metaclass"
    $P1927."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1259078889.1754") :outer("10_1259078889.1754")
.annotate "line", 3
    .const 'Sub' $P1922 = "114_1259078889.1754" 
    capture_lex $P1922
    get_hll_global $P1858, ["NQP";"RegexActions"], "_block1857" 
    capture_lex $P1858
    .const 'Sub' $P1845 = "108_1259078889.1754" 
    capture_lex $P1845
    .const 'Sub' $P1835 = "107_1259078889.1754" 
    capture_lex $P1835
    .const 'Sub' $P1825 = "106_1259078889.1754" 
    capture_lex $P1825
    .const 'Sub' $P1815 = "105_1259078889.1754" 
    capture_lex $P1815
    .const 'Sub' $P1801 = "104_1259078889.1754" 
    capture_lex $P1801
    .const 'Sub' $P1791 = "103_1259078889.1754" 
    capture_lex $P1791
    .const 'Sub' $P1777 = "102_1259078889.1754" 
    capture_lex $P1777
    .const 'Sub' $P1767 = "101_1259078889.1754" 
    capture_lex $P1767
    .const 'Sub' $P1757 = "100_1259078889.1754" 
    capture_lex $P1757
    .const 'Sub' $P1747 = "99_1259078889.1754" 
    capture_lex $P1747
    .const 'Sub' $P1737 = "98_1259078889.1754" 
    capture_lex $P1737
    .const 'Sub' $P1727 = "97_1259078889.1754" 
    capture_lex $P1727
    .const 'Sub' $P1699 = "96_1259078889.1754" 
    capture_lex $P1699
    .const 'Sub' $P1682 = "95_1259078889.1754" 
    capture_lex $P1682
    .const 'Sub' $P1672 = "94_1259078889.1754" 
    capture_lex $P1672
    .const 'Sub' $P1660 = "93_1259078889.1754" 
    capture_lex $P1660
    .const 'Sub' $P1648 = "92_1259078889.1754" 
    capture_lex $P1648
    .const 'Sub' $P1636 = "91_1259078889.1754" 
    capture_lex $P1636
    .const 'Sub' $P1626 = "90_1259078889.1754" 
    capture_lex $P1626
    .const 'Sub' $P1597 = "89_1259078889.1754" 
    capture_lex $P1597
    .const 'Sub' $P1573 = "88_1259078889.1754" 
    capture_lex $P1573
    .const 'Sub' $P1563 = "87_1259078889.1754" 
    capture_lex $P1563
    .const 'Sub' $P1536 = "86_1259078889.1754" 
    capture_lex $P1536
    .const 'Sub' $P1518 = "85_1259078889.1754" 
    capture_lex $P1518
    .const 'Sub' $P1508 = "84_1259078889.1754" 
    capture_lex $P1508
    .const 'Sub' $P1424 = "81_1259078889.1754" 
    capture_lex $P1424
    .const 'Sub' $P1414 = "80_1259078889.1754" 
    capture_lex $P1414
    .const 'Sub' $P1385 = "79_1259078889.1754" 
    capture_lex $P1385
    .const 'Sub' $P1343 = "78_1259078889.1754" 
    capture_lex $P1343
    .const 'Sub' $P1327 = "77_1259078889.1754" 
    capture_lex $P1327
    .const 'Sub' $P1318 = "76_1259078889.1754" 
    capture_lex $P1318
    .const 'Sub' $P1286 = "75_1259078889.1754" 
    capture_lex $P1286
    .const 'Sub' $P1199 = "73_1259078889.1754" 
    capture_lex $P1199
    .const 'Sub' $P1182 = "72_1259078889.1754" 
    capture_lex $P1182
    .const 'Sub' $P1162 = "71_1259078889.1754" 
    capture_lex $P1162
    .const 'Sub' $P1078 = "70_1259078889.1754" 
    capture_lex $P1078
    .const 'Sub' $P1054 = "68_1259078889.1754" 
    capture_lex $P1054
    .const 'Sub' $P1020 = "66_1259078889.1754" 
    capture_lex $P1020
    .const 'Sub' $P974 = "64_1259078889.1754" 
    capture_lex $P974
    .const 'Sub' $P964 = "63_1259078889.1754" 
    capture_lex $P964
    .const 'Sub' $P954 = "62_1259078889.1754" 
    capture_lex $P954
    .const 'Sub' $P883 = "60_1259078889.1754" 
    capture_lex $P883
    .const 'Sub' $P866 = "59_1259078889.1754" 
    capture_lex $P866
    .const 'Sub' $P856 = "58_1259078889.1754" 
    capture_lex $P856
    .const 'Sub' $P846 = "57_1259078889.1754" 
    capture_lex $P846
    .const 'Sub' $P836 = "56_1259078889.1754" 
    capture_lex $P836
    .const 'Sub' $P812 = "55_1259078889.1754" 
    capture_lex $P812
    .const 'Sub' $P759 = "54_1259078889.1754" 
    capture_lex $P759
    .const 'Sub' $P749 = "53_1259078889.1754" 
    capture_lex $P749
    .const 'Sub' $P660 = "51_1259078889.1754" 
    capture_lex $P660
    .const 'Sub' $P634 = "50_1259078889.1754" 
    capture_lex $P634
    .const 'Sub' $P624 = "49_1259078889.1754" 
    capture_lex $P624
    .const 'Sub' $P614 = "48_1259078889.1754" 
    capture_lex $P614
    .const 'Sub' $P604 = "47_1259078889.1754" 
    capture_lex $P604
    .const 'Sub' $P594 = "46_1259078889.1754" 
    capture_lex $P594
    .const 'Sub' $P584 = "45_1259078889.1754" 
    capture_lex $P584
    .const 'Sub' $P574 = "44_1259078889.1754" 
    capture_lex $P574
    .const 'Sub' $P564 = "43_1259078889.1754" 
    capture_lex $P564
    .const 'Sub' $P554 = "42_1259078889.1754" 
    capture_lex $P554
    .const 'Sub' $P544 = "41_1259078889.1754" 
    capture_lex $P544
    .const 'Sub' $P534 = "40_1259078889.1754" 
    capture_lex $P534
    .const 'Sub' $P524 = "39_1259078889.1754" 
    capture_lex $P524
    .const 'Sub' $P514 = "38_1259078889.1754" 
    capture_lex $P514
    .const 'Sub' $P496 = "37_1259078889.1754" 
    capture_lex $P496
    .const 'Sub' $P480 = "36_1259078889.1754" 
    capture_lex $P480
    .const 'Sub' $P467 = "35_1259078889.1754" 
    capture_lex $P467
    .const 'Sub' $P441 = "34_1259078889.1754" 
    capture_lex $P441
    .const 'Sub' $P405 = "33_1259078889.1754" 
    capture_lex $P405
    .const 'Sub' $P388 = "32_1259078889.1754" 
    capture_lex $P388
    .const 'Sub' $P374 = "31_1259078889.1754" 
    capture_lex $P374
    .const 'Sub' $P319 = "29_1259078889.1754" 
    capture_lex $P319
    .const 'Sub' $P306 = "28_1259078889.1754" 
    capture_lex $P306
    .const 'Sub' $P287 = "27_1259078889.1754" 
    capture_lex $P287
    .const 'Sub' $P277 = "26_1259078889.1754" 
    capture_lex $P277
    .const 'Sub' $P267 = "25_1259078889.1754" 
    capture_lex $P267
    .const 'Sub' $P251 = "24_1259078889.1754" 
    capture_lex $P251
    .const 'Sub' $P173 = "22_1259078889.1754" 
    capture_lex $P173
    .const 'Sub' $P130 = "20_1259078889.1754" 
    capture_lex $P130
    .const 'Sub' $P111 = "19_1259078889.1754" 
    capture_lex $P111
    .const 'Sub' $P89 = "18_1259078889.1754" 
    capture_lex $P89
    .const 'Sub' $P79 = "17_1259078889.1754" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1259078889.1754" 
    capture_lex $P57
    .const 'Sub' $P26 = "13_1259078889.1754" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1259078889.1754" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_118
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_118:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1259078889.1754" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1259078889.1754" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P57 = "16_1259078889.1754" 
    capture_lex $P57
    .lex "sigiltype", $P57
.annotate "line", 3
    get_global $P75, "@BLOCK"
.annotate "line", 5
    find_lex $P76, "xblock_immediate"
    find_lex $P77, "block_immediate"
    find_lex $P78, "sigiltype"
.annotate "line", 640
    get_hll_global $P1858, ["NQP";"RegexActions"], "_block1857" 
    capture_lex $P1858
    $P1920 = $P1858()
.annotate "line", 3
    .return ($P1920)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post116") :outer("11_1259078889.1754")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P1922 = "114_1259078889.1754" 
    capture_lex $P1922
    $P1922()
    $P1925 = get_root_global ["parrot"], "P6metaclass"
    $P1925."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1921"  :anon :subid("114_1259078889.1754") :outer("11_1259078889.1754")
.annotate "line", 6
    get_global $P1923, "@BLOCK"
    unless_null $P1923, vivify_117
    new $P1923, "ResizablePMCArray"
    set_global "@BLOCK", $P1923
  vivify_117:
 $P1924 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P1924
.annotate "line", 5
    .return ($P1924)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1259078889.1754") :outer("11_1259078889.1754")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_119
    new $P20, "ResizablePMCArray"
  vivify_119:
    set $P21, $P20[1]
    unless_null $P21, vivify_120
    new $P21, "Undef"
  vivify_120:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_121
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_121:
    set $P23[1], $P22
    find_lex $P24, "$xblock"
.annotate "line", 9
    .return ($P24)
  control_17:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P25, exception, "payload"
    .return ($P25)
.end


.namespace ["NQP";"Actions"]
.sub "block_immediate"  :subid("13_1259078889.1754") :outer("11_1259078889.1754")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P35 = "14_1259078889.1754" 
    capture_lex $P35
    new $P28, 'ExceptionHandler'
    set_addr $P28, control_27
    $P28."handle_types"(58)
    push_eh $P28
    .lex "$block", param_29
.annotate "line", 15
    find_lex $P30, "$block"
    $P30."blocktype"("immediate")
.annotate "line", 16
    find_lex $P32, "$block"
    $P33 = $P32."symtable"()
    if $P33, unless_31_end
    .const 'Sub' $P35 = "14_1259078889.1754" 
    capture_lex $P35
    $P35()
  unless_31_end:
    find_lex $P55, "$block"
.annotate "line", 14
    .return ($P55)
  control_27:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P56, exception, "payload"
    .return ($P56)
.end


.namespace ["NQP";"Actions"]
.sub "_block34"  :anon :subid("14_1259078889.1754") :outer("13_1259078889.1754")
.annotate "line", 16
    .const 'Sub' $P46 = "15_1259078889.1754" 
    capture_lex $P46
.annotate "line", 17
    new $P36, "Undef"
    .lex "$stmts", $P36
    get_hll_global $P37, ["PAST"], "Stmts"
    find_lex $P38, "$block"
    $P39 = $P37."new"($P38 :named("node"))
    store_lex "$stmts", $P39
.annotate "line", 18
    find_lex $P41, "$block"
    $P42 = $P41."list"()
    defined $I43, $P42
    unless $I43, for_undef_122
    iter $P40, $P42
    new $P52, 'ExceptionHandler'
    set_addr $P52, loop51_handler
    $P52."handle_types"(65, 67, 66)
    push_eh $P52
  loop51_test:
    unless $P40, loop51_done
    shift $P44, $P40
  loop51_redo:
    .const 'Sub' $P46 = "15_1259078889.1754" 
    capture_lex $P46
    $P46($P44)
  loop51_next:
    goto loop51_test
  loop51_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P53, exception, 'type'
    eq $P53, 65, loop51_next
    eq $P53, 67, loop51_redo
  loop51_done:
    pop_eh 
  for_undef_122:
.annotate "line", 19
    find_lex $P54, "$stmts"
    store_lex "$block", $P54
.annotate "line", 16
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "_block45"  :anon :subid("15_1259078889.1754") :outer("14_1259078889.1754")
    .param pmc param_47
.annotate "line", 18
    .lex "$_", param_47
    find_lex $P48, "$stmts"
    find_lex $P49, "$_"
    $P50 = $P48."push"($P49)
    .return ($P50)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1259078889.1754") :outer("11_1259078889.1754")
    .param pmc param_60
.annotate "line", 24
    new $P59, 'ExceptionHandler'
    set_addr $P59, control_58
    $P59."handle_types"(58)
    push_eh $P59
    .lex "$sigil", param_60
.annotate "line", 25
    find_lex $P63, "$sigil"
    set $S64, $P63
    iseq $I65, $S64, "%"
    if $I65, if_62
.annotate "line", 27
    find_lex $P69, "$sigil"
    set $S70, $P69
    iseq $I71, $S70, "@"
    if $I71, if_68
    new $P73, "String"
    assign $P73, "Undef"
    set $P67, $P73
    goto if_68_end
  if_68:
    new $P72, "String"
    assign $P72, "ResizablePMCArray"
    set $P67, $P72
  if_68_end:
    set $P61, $P67
.annotate "line", 25
    goto if_62_end
  if_62:
    new $P66, "String"
    assign $P66, "Hash"
    set $P61, $P66
  if_62_end:
.annotate "line", 24
    .return ($P61)
  control_58:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P74, exception, "payload"
    .return ($P74)
.end


.namespace ["NQP";"Actions"]
.sub "TOP"  :subid("17_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_82
.annotate "line", 30
    new $P81, 'ExceptionHandler'
    set_addr $P81, control_80
    $P81."handle_types"(58)
    push_eh $P81
    .lex "self", self
    .lex "$/", param_82
    find_lex $P83, "$/"
    find_lex $P84, "$/"
    unless_null $P84, vivify_123
    new $P84, "Hash"
  vivify_123:
    set $P85, $P84["comp_unit"]
    unless_null $P85, vivify_124
    new $P85, "Undef"
  vivify_124:
    $P86 = $P85."ast"()
    $P87 = $P83."!make"($P86)
    .return ($P87)
  control_80:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P88, exception, "payload"
    .return ($P88)
.end


.namespace ["NQP";"Actions"]
.sub "deflongname"  :subid("18_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_92
.annotate "line", 32
    new $P91, 'ExceptionHandler'
    set_addr $P91, control_90
    $P91."handle_types"(58)
    push_eh $P91
    .lex "self", self
    .lex "$/", param_92
.annotate "line", 33
    find_lex $P95, "$/"
    unless_null $P95, vivify_125
    new $P95, "Hash"
  vivify_125:
    set $P96, $P95["sym"]
    unless_null $P96, vivify_126
    new $P96, "Undef"
  vivify_126:
    if $P96, if_94
    set $P93, $P96
    goto if_94_end
  if_94:
    find_lex $P97, "$/"
    find_lex $P98, "$/"
    unless_null $P98, vivify_127
    new $P98, "Hash"
  vivify_127:
    set $P99, $P98["identifier"]
    unless_null $P99, vivify_128
    new $P99, "Undef"
  vivify_128:
    set $S100, $P99
    new $P101, 'String'
    set $P101, $S100
    concat $P102, $P101, ":sym<"
    find_lex $P103, "$/"
    unless_null $P103, vivify_129
    new $P103, "Hash"
  vivify_129:
    set $P104, $P103["sym"]
    unless_null $P104, vivify_130
    new $P104, "ResizablePMCArray"
  vivify_130:
    set $P105, $P104[0]
    unless_null $P105, vivify_131
    new $P105, "Undef"
  vivify_131:
    set $S106, $P105
    concat $P107, $P102, $S106
    concat $P108, $P107, ">"
    $P109 = $P97."!make"($P108)
    set $P93, $P109
  if_94_end:
.annotate "line", 32
    .return ($P93)
  control_90:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P110, exception, "payload"
    .return ($P110)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("19_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_114
.annotate "line", 36
    new $P113, 'ExceptionHandler'
    set_addr $P113, control_112
    $P113."handle_types"(58)
    push_eh $P113
    .lex "self", self
    .lex "$/", param_114
.annotate "line", 37
    new $P115, "Undef"
    .lex "$past", $P115
.annotate "line", 38
    new $P116, "Undef"
    .lex "$BLOCK", $P116
.annotate "line", 37
    find_lex $P117, "$/"
    unless_null $P117, vivify_132
    new $P117, "Hash"
  vivify_132:
    set $P118, $P117["statementlist"]
    unless_null $P118, vivify_133
    new $P118, "Undef"
  vivify_133:
    $P119 = $P118."ast"()
    store_lex "$past", $P119
.annotate "line", 38
    get_global $P120, "@BLOCK"
    $P121 = $P120."shift"()
    store_lex "$BLOCK", $P121
.annotate "line", 39
    find_lex $P122, "$BLOCK"
    find_lex $P123, "$past"
    $P122."push"($P123)
.annotate "line", 40
    find_lex $P124, "$BLOCK"
    find_lex $P125, "$/"
    $P124."node"($P125)
.annotate "line", 41
    find_lex $P126, "$/"
    find_lex $P127, "$BLOCK"
    $P128 = $P126."!make"($P127)
.annotate "line", 36
    .return ($P128)
  control_112:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P129, exception, "payload"
    .return ($P129)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("20_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_133
.annotate "line", 44
    .const 'Sub' $P147 = "21_1259078889.1754" 
    capture_lex $P147
    new $P132, 'ExceptionHandler'
    set_addr $P132, control_131
    $P132."handle_types"(58)
    push_eh $P132
    .lex "self", self
    .lex "$/", param_133
.annotate "line", 45
    new $P134, "Undef"
    .lex "$past", $P134
    get_hll_global $P135, ["PAST"], "Stmts"
    find_lex $P136, "$/"
    $P137 = $P135."new"($P136 :named("node"))
    store_lex "$past", $P137
.annotate "line", 46
    find_lex $P139, "$/"
    unless_null $P139, vivify_134
    new $P139, "Hash"
  vivify_134:
    set $P140, $P139["statement"]
    unless_null $P140, vivify_135
    new $P140, "Undef"
  vivify_135:
    unless $P140, if_138_end
.annotate "line", 47
    find_lex $P142, "$/"
    unless_null $P142, vivify_136
    new $P142, "Hash"
  vivify_136:
    set $P143, $P142["statement"]
    unless_null $P143, vivify_137
    new $P143, "Undef"
  vivify_137:
    defined $I144, $P143
    unless $I144, for_undef_138
    iter $P141, $P143
    new $P167, 'ExceptionHandler'
    set_addr $P167, loop166_handler
    $P167."handle_types"(65, 67, 66)
    push_eh $P167
  loop166_test:
    unless $P141, loop166_done
    shift $P145, $P141
  loop166_redo:
    .const 'Sub' $P147 = "21_1259078889.1754" 
    capture_lex $P147
    $P147($P145)
  loop166_next:
    goto loop166_test
  loop166_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P168, exception, 'type'
    eq $P168, 65, loop166_next
    eq $P168, 67, loop166_redo
  loop166_done:
    pop_eh 
  for_undef_138:
  if_138_end:
.annotate "line", 55
    find_lex $P169, "$/"
    find_lex $P170, "$past"
    $P171 = $P169."!make"($P170)
.annotate "line", 44
    .return ($P171)
  control_131:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P172, exception, "payload"
    .return ($P172)
.end


.namespace ["NQP";"Actions"]
.sub "_block146"  :anon :subid("21_1259078889.1754") :outer("20_1259078889.1754")
    .param pmc param_149
.annotate "line", 48
    new $P148, "Undef"
    .lex "$ast", $P148
    .lex "$_", param_149
    find_lex $P150, "$_"
    $P151 = $P150."ast"()
    store_lex "$ast", $P151
.annotate "line", 49
    find_lex $P155, "$ast"
    get_hll_global $P156, ["PAST"], "Block"
    $P157 = $P155."isa"($P156)
    if $P157, if_154
    set $P153, $P157
    goto if_154_end
  if_154:
    find_lex $P158, "$ast"
    $P159 = $P158."blocktype"()
    isfalse $I160, $P159
    new $P153, 'Integer'
    set $P153, $I160
  if_154_end:
    unless $P153, if_152_end
.annotate "line", 50
    find_lex $P161, "$ast"
    $P162 = "block_immediate"($P161)
    store_lex "$ast", $P162
  if_152_end:
.annotate "line", 52
    find_lex $P163, "$past"
    find_lex $P164, "$ast"
    $P165 = $P163."push"($P164)
.annotate "line", 47
    .return ($P165)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("22_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_176
    .param pmc param_177 :optional
    .param int has_param_177 :opt_flag
.annotate "line", 58
    .const 'Sub' $P185 = "23_1259078889.1754" 
    capture_lex $P185
    new $P175, 'ExceptionHandler'
    set_addr $P175, control_174
    $P175."handle_types"(58)
    push_eh $P175
    .lex "self", self
    .lex "$/", param_176
    if has_param_177, optparam_139
    new $P178, "Undef"
    set param_177, $P178
  optparam_139:
    .lex "$key", param_177
.annotate "line", 59
    new $P179, "Undef"
    .lex "$past", $P179
.annotate "line", 58
    find_lex $P180, "$past"
.annotate "line", 60
    find_lex $P182, "$/"
    unless_null $P182, vivify_140
    new $P182, "Hash"
  vivify_140:
    set $P183, $P182["EXPR"]
    unless_null $P183, vivify_141
    new $P183, "Undef"
  vivify_141:
    if $P183, if_181
.annotate "line", 74
    find_lex $P241, "$/"
    unless_null $P241, vivify_142
    new $P241, "Hash"
  vivify_142:
    set $P242, $P241["statement_control"]
    unless_null $P242, vivify_143
    new $P242, "Undef"
  vivify_143:
    if $P242, if_240
.annotate "line", 75
    new $P246, "Integer"
    assign $P246, 0
    store_lex "$past", $P246
    goto if_240_end
  if_240:
.annotate "line", 74
    find_lex $P243, "$/"
    unless_null $P243, vivify_144
    new $P243, "Hash"
  vivify_144:
    set $P244, $P243["statement_control"]
    unless_null $P244, vivify_145
    new $P244, "Undef"
  vivify_145:
    $P245 = $P244."ast"()
    store_lex "$past", $P245
  if_240_end:
    goto if_181_end
  if_181:
.annotate "line", 60
    .const 'Sub' $P185 = "23_1259078889.1754" 
    capture_lex $P185
    $P185()
  if_181_end:
.annotate "line", 76
    find_lex $P247, "$/"
    find_lex $P248, "$past"
    $P249 = $P247."!make"($P248)
.annotate "line", 58
    .return ($P249)
  control_174:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P250, exception, "payload"
    .return ($P250)
.end


.namespace ["NQP";"Actions"]
.sub "_block184"  :anon :subid("23_1259078889.1754") :outer("22_1259078889.1754")
.annotate "line", 61
    new $P186, "Undef"
    .lex "$mc", $P186
.annotate "line", 62
    new $P187, "Undef"
    .lex "$ml", $P187
.annotate "line", 61
    find_lex $P188, "$/"
    unless_null $P188, vivify_146
    new $P188, "Hash"
  vivify_146:
    set $P189, $P188["statement_mod_cond"]
    unless_null $P189, vivify_147
    new $P189, "ResizablePMCArray"
  vivify_147:
    set $P190, $P189[0]
    unless_null $P190, vivify_148
    new $P190, "Undef"
  vivify_148:
    store_lex "$mc", $P190
.annotate "line", 62
    find_lex $P191, "$/"
    unless_null $P191, vivify_149
    new $P191, "Hash"
  vivify_149:
    set $P192, $P191["statement_mod_loop"]
    unless_null $P192, vivify_150
    new $P192, "ResizablePMCArray"
  vivify_150:
    set $P193, $P192[0]
    unless_null $P193, vivify_151
    new $P193, "Undef"
  vivify_151:
    store_lex "$ml", $P193
.annotate "line", 63
    find_lex $P196, "$mc"
    if $P196, if_195
.annotate "line", 68
    find_lex $P224, "$ml"
    if $P224, if_223
.annotate "line", 71
    find_lex $P237, "$/"
    unless_null $P237, vivify_152
    new $P237, "Hash"
  vivify_152:
    set $P238, $P237["EXPR"]
    unless_null $P238, vivify_153
    new $P238, "Undef"
  vivify_153:
    $P239 = $P238."ast"()
    store_lex "$past", $P239
.annotate "line", 70
    set $P222, $P239
.annotate "line", 68
    goto if_223_end
  if_223:
.annotate "line", 69
    get_hll_global $P225, ["PAST"], "Op"
    find_lex $P226, "$ml"
    unless_null $P226, vivify_154
    new $P226, "Hash"
  vivify_154:
    set $P227, $P226["cond"]
    unless_null $P227, vivify_155
    new $P227, "Undef"
  vivify_155:
    $P228 = $P227."ast"()
    find_lex $P229, "$/"
    unless_null $P229, vivify_156
    new $P229, "Hash"
  vivify_156:
    set $P230, $P229["EXPR"]
    unless_null $P230, vivify_157
    new $P230, "Undef"
  vivify_157:
    $P231 = $P230."ast"()
    find_lex $P232, "$ml"
    unless_null $P232, vivify_158
    new $P232, "Hash"
  vivify_158:
    set $P233, $P232["sym"]
    unless_null $P233, vivify_159
    new $P233, "Undef"
  vivify_159:
    set $S234, $P233
    find_lex $P235, "$/"
    $P236 = $P225."new"($P228, $P231, $S234 :named("pasttype"), $P235 :named("node"))
    store_lex "$past", $P236
.annotate "line", 68
    set $P222, $P236
  if_223_end:
    set $P194, $P222
.annotate "line", 63
    goto if_195_end
  if_195:
.annotate "line", 64
    get_hll_global $P197, ["PAST"], "Op"
    find_lex $P198, "$mc"
    unless_null $P198, vivify_160
    new $P198, "Hash"
  vivify_160:
    set $P199, $P198["cond"]
    unless_null $P199, vivify_161
    new $P199, "Undef"
  vivify_161:
    $P200 = $P199."ast"()
    find_lex $P201, "$/"
    unless_null $P201, vivify_162
    new $P201, "Hash"
  vivify_162:
    set $P202, $P201["EXPR"]
    unless_null $P202, vivify_163
    new $P202, "Undef"
  vivify_163:
    $P203 = $P202."ast"()
    find_lex $P204, "$mc"
    unless_null $P204, vivify_164
    new $P204, "Hash"
  vivify_164:
    set $P205, $P204["sym"]
    unless_null $P205, vivify_165
    new $P205, "Undef"
  vivify_165:
    set $S206, $P205
    find_lex $P207, "$/"
    $P208 = $P197."new"($P200, $P203, $S206 :named("pasttype"), $P207 :named("node"))
    store_lex "$past", $P208
.annotate "line", 65
    find_lex $P211, "$ml"
    if $P211, if_210
    set $P209, $P211
    goto if_210_end
  if_210:
.annotate "line", 66
    get_hll_global $P212, ["PAST"], "Op"
    find_lex $P213, "$ml"
    unless_null $P213, vivify_166
    new $P213, "Hash"
  vivify_166:
    set $P214, $P213["cond"]
    unless_null $P214, vivify_167
    new $P214, "Undef"
  vivify_167:
    $P215 = $P214."ast"()
    find_lex $P216, "$past"
    find_lex $P217, "$ml"
    unless_null $P217, vivify_168
    new $P217, "Hash"
  vivify_168:
    set $P218, $P217["sym"]
    unless_null $P218, vivify_169
    new $P218, "Undef"
  vivify_169:
    set $S219, $P218
    find_lex $P220, "$/"
    $P221 = $P212."new"($P215, $P216, $S219 :named("pasttype"), $P220 :named("node"))
    store_lex "$past", $P221
.annotate "line", 65
    set $P209, $P221
  if_210_end:
.annotate "line", 63
    set $P194, $P209
  if_195_end:
.annotate "line", 60
    .return ($P194)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("24_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_254
.annotate "line", 79
    new $P253, 'ExceptionHandler'
    set_addr $P253, control_252
    $P253."handle_types"(58)
    push_eh $P253
    .lex "self", self
    .lex "$/", param_254
.annotate "line", 80
    find_lex $P255, "$/"
    get_hll_global $P256, ["PAST"], "Op"
    find_lex $P257, "$/"
    unless_null $P257, vivify_170
    new $P257, "Hash"
  vivify_170:
    set $P258, $P257["EXPR"]
    unless_null $P258, vivify_171
    new $P258, "Undef"
  vivify_171:
    $P259 = $P258."ast"()
    find_lex $P260, "$/"
    unless_null $P260, vivify_172
    new $P260, "Hash"
  vivify_172:
    set $P261, $P260["pblock"]
    unless_null $P261, vivify_173
    new $P261, "Undef"
  vivify_173:
    $P262 = $P261."ast"()
    find_lex $P263, "$/"
    $P264 = $P256."new"($P259, $P262, "if" :named("pasttype"), $P263 :named("node"))
    $P265 = $P255."!make"($P264)
.annotate "line", 79
    .return ($P265)
  control_252:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P266, exception, "payload"
    .return ($P266)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("25_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_270
.annotate "line", 83
    new $P269, 'ExceptionHandler'
    set_addr $P269, control_268
    $P269."handle_types"(58)
    push_eh $P269
    .lex "self", self
    .lex "$/", param_270
.annotate "line", 84
    find_lex $P271, "$/"
    find_lex $P272, "$/"
    unless_null $P272, vivify_174
    new $P272, "Hash"
  vivify_174:
    set $P273, $P272["blockoid"]
    unless_null $P273, vivify_175
    new $P273, "Undef"
  vivify_175:
    $P274 = $P273."ast"()
    $P275 = $P271."!make"($P274)
.annotate "line", 83
    .return ($P275)
  control_268:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P276, exception, "payload"
    .return ($P276)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("26_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_280
.annotate "line", 87
    new $P279, 'ExceptionHandler'
    set_addr $P279, control_278
    $P279."handle_types"(58)
    push_eh $P279
    .lex "self", self
    .lex "$/", param_280
.annotate "line", 88
    find_lex $P281, "$/"
    find_lex $P282, "$/"
    unless_null $P282, vivify_176
    new $P282, "Hash"
  vivify_176:
    set $P283, $P282["blockoid"]
    unless_null $P283, vivify_177
    new $P283, "Undef"
  vivify_177:
    $P284 = $P283."ast"()
    $P285 = $P281."!make"($P284)
.annotate "line", 87
    .return ($P285)
  control_278:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P286, exception, "payload"
    .return ($P286)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("27_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_290
.annotate "line", 91
    new $P289, 'ExceptionHandler'
    set_addr $P289, control_288
    $P289."handle_types"(58)
    push_eh $P289
    .lex "self", self
    .lex "$/", param_290
.annotate "line", 92
    new $P291, "Undef"
    .lex "$past", $P291
.annotate "line", 93
    new $P292, "Undef"
    .lex "$BLOCK", $P292
.annotate "line", 92
    find_lex $P293, "$/"
    unless_null $P293, vivify_178
    new $P293, "Hash"
  vivify_178:
    set $P294, $P293["statementlist"]
    unless_null $P294, vivify_179
    new $P294, "Undef"
  vivify_179:
    $P295 = $P294."ast"()
    store_lex "$past", $P295
.annotate "line", 93
    get_global $P296, "@BLOCK"
    $P297 = $P296."shift"()
    store_lex "$BLOCK", $P297
.annotate "line", 94
    find_lex $P298, "$BLOCK"
    find_lex $P299, "$past"
    $P298."push"($P299)
.annotate "line", 95
    find_lex $P300, "$BLOCK"
    find_lex $P301, "$/"
    $P300."node"($P301)
.annotate "line", 96
    find_lex $P302, "$/"
    find_lex $P303, "$BLOCK"
    $P304 = $P302."!make"($P303)
.annotate "line", 91
    .return ($P304)
  control_288:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P305, exception, "payload"
    .return ($P305)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("28_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_309
.annotate "line", 99
    new $P308, 'ExceptionHandler'
    set_addr $P308, control_307
    $P308."handle_types"(58)
    push_eh $P308
    .lex "self", self
    .lex "$/", param_309
.annotate "line", 100
    get_global $P310, "@BLOCK"
    unless_null $P310, vivify_180
    new $P310, "ResizablePMCArray"
    set_global "@BLOCK", $P310
  vivify_180:
.annotate "line", 99
    get_global $P311, "@BLOCK"
.annotate "line", 101
    get_global $P312, "@BLOCK"
    get_hll_global $P313, ["PAST"], "Block"
    get_hll_global $P314, ["PAST"], "Stmts"
    $P315 = $P314."new"()
    $P316 = $P313."new"($P315)
    $P317 = $P312."unshift"($P316)
.annotate "line", 99
    .return ($P317)
  control_307:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P318, exception, "payload"
    .return ($P318)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("29_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_322
.annotate "line", 106
    .const 'Sub' $P352 = "30_1259078889.1754" 
    capture_lex $P352
    new $P321, 'ExceptionHandler'
    set_addr $P321, control_320
    $P321."handle_types"(58)
    push_eh $P321
    .lex "self", self
    .lex "$/", param_322
.annotate "line", 107
    new $P323, "Undef"
    .lex "$count", $P323
.annotate "line", 108
    new $P324, "Undef"
    .lex "$past", $P324
.annotate "line", 107
    find_lex $P325, "$/"
    unless_null $P325, vivify_181
    new $P325, "Hash"
  vivify_181:
    set $P326, $P325["xblock"]
    unless_null $P326, vivify_182
    new $P326, "Undef"
  vivify_182:
    set $N327, $P326
    new $P328, 'Float'
    set $P328, $N327
    sub $P329, $P328, 1
    store_lex "$count", $P329
.annotate "line", 108
    find_lex $P330, "$count"
    set $I331, $P330
    find_lex $P332, "$/"
    unless_null $P332, vivify_183
    new $P332, "Hash"
  vivify_183:
    set $P333, $P332["xblock"]
    unless_null $P333, vivify_184
    new $P333, "ResizablePMCArray"
  vivify_184:
    set $P334, $P333[$I331]
    unless_null $P334, vivify_185
    new $P334, "Undef"
  vivify_185:
    $P335 = $P334."ast"()
    $P336 = "xblock_immediate"($P335)
    store_lex "$past", $P336
.annotate "line", 109
    find_lex $P338, "$/"
    unless_null $P338, vivify_186
    new $P338, "Hash"
  vivify_186:
    set $P339, $P338["else"]
    unless_null $P339, vivify_187
    new $P339, "Undef"
  vivify_187:
    unless $P339, if_337_end
.annotate "line", 110
    find_lex $P340, "$past"
    find_lex $P341, "$/"
    unless_null $P341, vivify_188
    new $P341, "Hash"
  vivify_188:
    set $P342, $P341["else"]
    unless_null $P342, vivify_189
    new $P342, "ResizablePMCArray"
  vivify_189:
    set $P343, $P342[0]
    unless_null $P343, vivify_190
    new $P343, "Undef"
  vivify_190:
    $P344 = $P343."ast"()
    $P345 = "block_immediate"($P344)
    $P340."push"($P345)
  if_337_end:
.annotate "line", 113
    new $P368, 'ExceptionHandler'
    set_addr $P368, loop367_handler
    $P368."handle_types"(65, 67, 66)
    push_eh $P368
  loop367_test:
    find_lex $P346, "$count"
    set $N347, $P346
    new $P348, "Integer"
    assign $P348, 0
    set $N349, $P348
    isgt $I350, $N347, $N349
    unless $I350, loop367_done
  loop367_redo:
    .const 'Sub' $P352 = "30_1259078889.1754" 
    capture_lex $P352
    $P352()
  loop367_next:
    goto loop367_test
  loop367_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P369, exception, 'type'
    eq $P369, 65, loop367_next
    eq $P369, 67, loop367_redo
  loop367_done:
    pop_eh 
.annotate "line", 119
    find_lex $P370, "$/"
    find_lex $P371, "$past"
    $P372 = $P370."!make"($P371)
.annotate "line", 106
    .return ($P372)
  control_320:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P373, exception, "payload"
    .return ($P373)
.end


.namespace ["NQP";"Actions"]
.sub "_block351"  :anon :subid("30_1259078889.1754") :outer("29_1259078889.1754")
.annotate "line", 115
    new $P353, "Undef"
    .lex "$else", $P353
.annotate "line", 113
    find_lex $P354, "$count"
    clone $P355, $P354
    dec $P354
.annotate "line", 115
    find_lex $P356, "$past"
    store_lex "$else", $P356
.annotate "line", 116
    find_lex $P357, "$count"
    set $I358, $P357
    find_lex $P359, "$/"
    unless_null $P359, vivify_191
    new $P359, "Hash"
  vivify_191:
    set $P360, $P359["xblock"]
    unless_null $P360, vivify_192
    new $P360, "ResizablePMCArray"
  vivify_192:
    set $P361, $P360[$I358]
    unless_null $P361, vivify_193
    new $P361, "Undef"
  vivify_193:
    $P362 = $P361."ast"()
    $P363 = "xblock_immediate"($P362)
    store_lex "$past", $P363
.annotate "line", 117
    find_lex $P364, "$past"
    find_lex $P365, "$else"
    $P366 = $P364."push"($P365)
.annotate "line", 113
    .return ($P366)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("31_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_377
.annotate "line", 122
    new $P376, 'ExceptionHandler'
    set_addr $P376, control_375
    $P376."handle_types"(58)
    push_eh $P376
    .lex "self", self
    .lex "$/", param_377
.annotate "line", 123
    new $P378, "Undef"
    .lex "$past", $P378
    find_lex $P379, "$/"
    unless_null $P379, vivify_194
    new $P379, "Hash"
  vivify_194:
    set $P380, $P379["xblock"]
    unless_null $P380, vivify_195
    new $P380, "Undef"
  vivify_195:
    $P381 = $P380."ast"()
    $P382 = "xblock_immediate"($P381)
    store_lex "$past", $P382
.annotate "line", 124
    find_lex $P383, "$past"
    $P383."pasttype"("unless")
.annotate "line", 125
    find_lex $P384, "$/"
    find_lex $P385, "$past"
    $P386 = $P384."!make"($P385)
.annotate "line", 122
    .return ($P386)
  control_375:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P387, exception, "payload"
    .return ($P387)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("32_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_391
.annotate "line", 128
    new $P390, 'ExceptionHandler'
    set_addr $P390, control_389
    $P390."handle_types"(58)
    push_eh $P390
    .lex "self", self
    .lex "$/", param_391
.annotate "line", 129
    new $P392, "Undef"
    .lex "$past", $P392
    find_lex $P393, "$/"
    unless_null $P393, vivify_196
    new $P393, "Hash"
  vivify_196:
    set $P394, $P393["xblock"]
    unless_null $P394, vivify_197
    new $P394, "Undef"
  vivify_197:
    $P395 = $P394."ast"()
    $P396 = "xblock_immediate"($P395)
    store_lex "$past", $P396
.annotate "line", 130
    find_lex $P397, "$past"
    find_lex $P398, "$/"
    unless_null $P398, vivify_198
    new $P398, "Hash"
  vivify_198:
    set $P399, $P398["sym"]
    unless_null $P399, vivify_199
    new $P399, "Undef"
  vivify_199:
    set $S400, $P399
    $P397."pasttype"($S400)
.annotate "line", 131
    find_lex $P401, "$/"
    find_lex $P402, "$past"
    $P403 = $P401."!make"($P402)
.annotate "line", 128
    .return ($P403)
  control_389:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P404, exception, "payload"
    .return ($P404)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("33_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_408
.annotate "line", 134
    new $P407, 'ExceptionHandler'
    set_addr $P407, control_406
    $P407."handle_types"(58)
    push_eh $P407
    .lex "self", self
    .lex "$/", param_408
.annotate "line", 135
    new $P409, "Undef"
    .lex "$pasttype", $P409
.annotate "line", 136
    new $P410, "Undef"
    .lex "$past", $P410
.annotate "line", 135
    new $P411, "String"
    assign $P411, "repeat_"
    find_lex $P412, "$/"
    unless_null $P412, vivify_200
    new $P412, "Hash"
  vivify_200:
    set $P413, $P412["wu"]
    unless_null $P413, vivify_201
    new $P413, "Undef"
  vivify_201:
    set $S414, $P413
    concat $P415, $P411, $S414
    store_lex "$pasttype", $P415
    find_lex $P416, "$past"
.annotate "line", 137
    find_lex $P418, "$/"
    unless_null $P418, vivify_202
    new $P418, "Hash"
  vivify_202:
    set $P419, $P418["xblock"]
    unless_null $P419, vivify_203
    new $P419, "Undef"
  vivify_203:
    if $P419, if_417
.annotate "line", 142
    get_hll_global $P426, ["PAST"], "Op"
    find_lex $P427, "$/"
    unless_null $P427, vivify_204
    new $P427, "Hash"
  vivify_204:
    set $P428, $P427["EXPR"]
    unless_null $P428, vivify_205
    new $P428, "Undef"
  vivify_205:
    $P429 = $P428."ast"()
    find_lex $P430, "$/"
    unless_null $P430, vivify_206
    new $P430, "Hash"
  vivify_206:
    set $P431, $P430["pblock"]
    unless_null $P431, vivify_207
    new $P431, "Undef"
  vivify_207:
    $P432 = $P431."ast"()
    $P433 = "block_immediate"($P432)
    find_lex $P434, "$pasttype"
    find_lex $P435, "$/"
    $P436 = $P426."new"($P429, $P433, $P434 :named("pasttype"), $P435 :named("node"))
    store_lex "$past", $P436
.annotate "line", 141
    goto if_417_end
  if_417:
.annotate "line", 138
    find_lex $P420, "$/"
    unless_null $P420, vivify_208
    new $P420, "Hash"
  vivify_208:
    set $P421, $P420["xblock"]
    unless_null $P421, vivify_209
    new $P421, "Undef"
  vivify_209:
    $P422 = $P421."ast"()
    $P423 = "xblock_immediate"($P422)
    store_lex "$past", $P423
.annotate "line", 139
    find_lex $P424, "$past"
    find_lex $P425, "$pasttype"
    $P424."pasttype"($P425)
  if_417_end:
.annotate "line", 145
    find_lex $P437, "$/"
    find_lex $P438, "$past"
    $P439 = $P437."!make"($P438)
.annotate "line", 134
    .return ($P439)
  control_406:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P440, exception, "payload"
    .return ($P440)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("34_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_444
.annotate "line", 148
    new $P443, 'ExceptionHandler'
    set_addr $P443, control_442
    $P443."handle_types"(58)
    push_eh $P443
    .lex "self", self
    .lex "$/", param_444
.annotate "line", 149
    new $P445, "Undef"
    .lex "$past", $P445
.annotate "line", 151
    new $P446, "Undef"
    .lex "$block", $P446
.annotate "line", 149
    find_lex $P447, "$/"
    unless_null $P447, vivify_210
    new $P447, "Hash"
  vivify_210:
    set $P448, $P447["xblock"]
    unless_null $P448, vivify_211
    new $P448, "Undef"
  vivify_211:
    $P449 = $P448."ast"()
    store_lex "$past", $P449
.annotate "line", 150
    find_lex $P450, "$past"
    $P450."pasttype"("for")
.annotate "line", 151
    find_lex $P451, "$past"
    unless_null $P451, vivify_212
    new $P451, "ResizablePMCArray"
  vivify_212:
    set $P452, $P451[1]
    unless_null $P452, vivify_213
    new $P452, "Undef"
  vivify_213:
    store_lex "$block", $P452
.annotate "line", 152
    find_lex $P454, "$block"
    $P455 = $P454."arity"()
    if $P455, unless_453_end
.annotate "line", 153
    find_lex $P456, "$block"
    unless_null $P456, vivify_214
    new $P456, "ResizablePMCArray"
  vivify_214:
    set $P457, $P456[0]
    unless_null $P457, vivify_215
    new $P457, "Undef"
  vivify_215:
    get_hll_global $P458, ["PAST"], "Var"
    $P459 = $P458."new"("$_" :named("name"), "parameter" :named("scope"))
    $P457."push"($P459)
.annotate "line", 154
    find_lex $P460, "$block"
    $P460."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 155
    find_lex $P461, "$block"
    $P461."arity"(1)
  unless_453_end:
.annotate "line", 157
    find_lex $P462, "$block"
    $P462."blocktype"("immediate")
.annotate "line", 158
    find_lex $P463, "$/"
    find_lex $P464, "$past"
    $P465 = $P463."!make"($P464)
.annotate "line", 148
    .return ($P465)
  control_442:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P466, exception, "payload"
    .return ($P466)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("35_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_470
.annotate "line", 161
    new $P469, 'ExceptionHandler'
    set_addr $P469, control_468
    $P469."handle_types"(58)
    push_eh $P469
    .lex "self", self
    .lex "$/", param_470
.annotate "line", 162
    find_lex $P471, "$/"
    get_hll_global $P472, ["PAST"], "Op"
    find_lex $P473, "$/"
    unless_null $P473, vivify_216
    new $P473, "Hash"
  vivify_216:
    set $P474, $P473["EXPR"]
    unless_null $P474, vivify_217
    new $P474, "Undef"
  vivify_217:
    $P475 = $P474."ast"()
    find_lex $P476, "$/"
    $P477 = $P472."new"($P475, "return" :named("pasttype"), $P476 :named("node"))
    $P478 = $P471."!make"($P477)
.annotate "line", 161
    .return ($P478)
  control_468:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P479, exception, "payload"
    .return ($P479)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("36_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_483
.annotate "line", 165
    new $P482, 'ExceptionHandler'
    set_addr $P482, control_481
    $P482."handle_types"(58)
    push_eh $P482
    .lex "self", self
    .lex "$/", param_483
.annotate "line", 166
    get_global $P484, "@BLOCK"
    unless_null $P484, vivify_218
    new $P484, "ResizablePMCArray"
  vivify_218:
    set $P485, $P484[0]
    unless_null $P485, vivify_219
    new $P485, "Undef"
  vivify_219:
    $P486 = $P485."loadinit"()
    find_lex $P487, "$/"
    unless_null $P487, vivify_220
    new $P487, "Hash"
  vivify_220:
    set $P488, $P487["blorst"]
    unless_null $P488, vivify_221
    new $P488, "Undef"
  vivify_221:
    $P489 = $P488."ast"()
    $P486."push"($P489)
.annotate "line", 167
    find_lex $P490, "$/"
    get_hll_global $P491, ["PAST"], "Stmts"
    find_lex $P492, "$/"
    $P493 = $P491."new"($P492 :named("node"))
    $P494 = $P490."!make"($P493)
.annotate "line", 165
    .return ($P494)
  control_481:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P495, exception, "payload"
    .return ($P495)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("37_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_499
.annotate "line", 170
    new $P498, 'ExceptionHandler'
    set_addr $P498, control_497
    $P498."handle_types"(58)
    push_eh $P498
    .lex "self", self
    .lex "$/", param_499
.annotate "line", 171
    find_lex $P500, "$/"
.annotate "line", 172
    find_lex $P503, "$/"
    unless_null $P503, vivify_222
    new $P503, "Hash"
  vivify_222:
    set $P504, $P503["block"]
    unless_null $P504, vivify_223
    new $P504, "Undef"
  vivify_223:
    if $P504, if_502
.annotate "line", 173
    find_lex $P509, "$/"
    unless_null $P509, vivify_224
    new $P509, "Hash"
  vivify_224:
    set $P510, $P509["statement"]
    unless_null $P510, vivify_225
    new $P510, "Undef"
  vivify_225:
    $P511 = $P510."ast"()
    set $P501, $P511
.annotate "line", 172
    goto if_502_end
  if_502:
    find_lex $P505, "$/"
    unless_null $P505, vivify_226
    new $P505, "Hash"
  vivify_226:
    set $P506, $P505["block"]
    unless_null $P506, vivify_227
    new $P506, "Undef"
  vivify_227:
    $P507 = $P506."ast"()
    $P508 = "block_immediate"($P507)
    set $P501, $P508
  if_502_end:
    $P512 = $P500."!make"($P501)
.annotate "line", 170
    .return ($P512)
  control_497:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P513, exception, "payload"
    .return ($P513)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("38_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_517
.annotate "line", 178
    new $P516, 'ExceptionHandler'
    set_addr $P516, control_515
    $P516."handle_types"(58)
    push_eh $P516
    .lex "self", self
    .lex "$/", param_517
    find_lex $P518, "$/"
    find_lex $P519, "$/"
    unless_null $P519, vivify_228
    new $P519, "Hash"
  vivify_228:
    set $P520, $P519["cond"]
    unless_null $P520, vivify_229
    new $P520, "Undef"
  vivify_229:
    $P521 = $P520."ast"()
    $P522 = $P518."!make"($P521)
    .return ($P522)
  control_515:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P523, exception, "payload"
    .return ($P523)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("39_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_527
.annotate "line", 179
    new $P526, 'ExceptionHandler'
    set_addr $P526, control_525
    $P526."handle_types"(58)
    push_eh $P526
    .lex "self", self
    .lex "$/", param_527
    find_lex $P528, "$/"
    find_lex $P529, "$/"
    unless_null $P529, vivify_230
    new $P529, "Hash"
  vivify_230:
    set $P530, $P529["cond"]
    unless_null $P530, vivify_231
    new $P530, "Undef"
  vivify_231:
    $P531 = $P530."ast"()
    $P532 = $P528."!make"($P531)
    .return ($P532)
  control_525:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P533, exception, "payload"
    .return ($P533)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("40_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_537
.annotate "line", 181
    new $P536, 'ExceptionHandler'
    set_addr $P536, control_535
    $P536."handle_types"(58)
    push_eh $P536
    .lex "self", self
    .lex "$/", param_537
    find_lex $P538, "$/"
    find_lex $P539, "$/"
    unless_null $P539, vivify_232
    new $P539, "Hash"
  vivify_232:
    set $P540, $P539["cond"]
    unless_null $P540, vivify_233
    new $P540, "Undef"
  vivify_233:
    $P541 = $P540."ast"()
    $P542 = $P538."!make"($P541)
    .return ($P542)
  control_535:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P543, exception, "payload"
    .return ($P543)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("41_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_547
.annotate "line", 182
    new $P546, 'ExceptionHandler'
    set_addr $P546, control_545
    $P546."handle_types"(58)
    push_eh $P546
    .lex "self", self
    .lex "$/", param_547
    find_lex $P548, "$/"
    find_lex $P549, "$/"
    unless_null $P549, vivify_234
    new $P549, "Hash"
  vivify_234:
    set $P550, $P549["cond"]
    unless_null $P550, vivify_235
    new $P550, "Undef"
  vivify_235:
    $P551 = $P550."ast"()
    $P552 = $P548."!make"($P551)
    .return ($P552)
  control_545:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P553, exception, "payload"
    .return ($P553)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("42_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_557
.annotate "line", 186
    new $P556, 'ExceptionHandler'
    set_addr $P556, control_555
    $P556."handle_types"(58)
    push_eh $P556
    .lex "self", self
    .lex "$/", param_557
    find_lex $P558, "$/"
    find_lex $P559, "$/"
    unless_null $P559, vivify_236
    new $P559, "Hash"
  vivify_236:
    set $P560, $P559["colonpair"]
    unless_null $P560, vivify_237
    new $P560, "Undef"
  vivify_237:
    $P561 = $P560."ast"()
    $P562 = $P558."!make"($P561)
    .return ($P562)
  control_555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P563, exception, "payload"
    .return ($P563)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("43_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_567
.annotate "line", 187
    new $P566, 'ExceptionHandler'
    set_addr $P566, control_565
    $P566."handle_types"(58)
    push_eh $P566
    .lex "self", self
    .lex "$/", param_567
    find_lex $P568, "$/"
    find_lex $P569, "$/"
    unless_null $P569, vivify_238
    new $P569, "Hash"
  vivify_238:
    set $P570, $P569["variable"]
    unless_null $P570, vivify_239
    new $P570, "Undef"
  vivify_239:
    $P571 = $P570."ast"()
    $P572 = $P568."!make"($P571)
    .return ($P572)
  control_565:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P573, exception, "payload"
    .return ($P573)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("44_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_577
.annotate "line", 188
    new $P576, 'ExceptionHandler'
    set_addr $P576, control_575
    $P576."handle_types"(58)
    push_eh $P576
    .lex "self", self
    .lex "$/", param_577
    find_lex $P578, "$/"
    find_lex $P579, "$/"
    unless_null $P579, vivify_240
    new $P579, "Hash"
  vivify_240:
    set $P580, $P579["package_declarator"]
    unless_null $P580, vivify_241
    new $P580, "Undef"
  vivify_241:
    $P581 = $P580."ast"()
    $P582 = $P578."!make"($P581)
    .return ($P582)
  control_575:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P583, exception, "payload"
    .return ($P583)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("45_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_587
.annotate "line", 189
    new $P586, 'ExceptionHandler'
    set_addr $P586, control_585
    $P586."handle_types"(58)
    push_eh $P586
    .lex "self", self
    .lex "$/", param_587
    find_lex $P588, "$/"
    find_lex $P589, "$/"
    unless_null $P589, vivify_242
    new $P589, "Hash"
  vivify_242:
    set $P590, $P589["scope_declarator"]
    unless_null $P590, vivify_243
    new $P590, "Undef"
  vivify_243:
    $P591 = $P590."ast"()
    $P592 = $P588."!make"($P591)
    .return ($P592)
  control_585:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P593, exception, "payload"
    .return ($P593)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("46_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_597
.annotate "line", 190
    new $P596, 'ExceptionHandler'
    set_addr $P596, control_595
    $P596."handle_types"(58)
    push_eh $P596
    .lex "self", self
    .lex "$/", param_597
    find_lex $P598, "$/"
    find_lex $P599, "$/"
    unless_null $P599, vivify_244
    new $P599, "Hash"
  vivify_244:
    set $P600, $P599["routine_declarator"]
    unless_null $P600, vivify_245
    new $P600, "Undef"
  vivify_245:
    $P601 = $P600."ast"()
    $P602 = $P598."!make"($P601)
    .return ($P602)
  control_595:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P603, exception, "payload"
    .return ($P603)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("47_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_607
.annotate "line", 191
    new $P606, 'ExceptionHandler'
    set_addr $P606, control_605
    $P606."handle_types"(58)
    push_eh $P606
    .lex "self", self
    .lex "$/", param_607
    find_lex $P608, "$/"
    find_lex $P609, "$/"
    unless_null $P609, vivify_246
    new $P609, "Hash"
  vivify_246:
    set $P610, $P609["regex_declarator"]
    unless_null $P610, vivify_247
    new $P610, "Undef"
  vivify_247:
    $P611 = $P610."ast"()
    $P612 = $P608."!make"($P611)
    .return ($P612)
  control_605:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P613, exception, "payload"
    .return ($P613)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("48_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_617
.annotate "line", 192
    new $P616, 'ExceptionHandler'
    set_addr $P616, control_615
    $P616."handle_types"(58)
    push_eh $P616
    .lex "self", self
    .lex "$/", param_617
    find_lex $P618, "$/"
    find_lex $P619, "$/"
    unless_null $P619, vivify_248
    new $P619, "Hash"
  vivify_248:
    set $P620, $P619["statement_prefix"]
    unless_null $P620, vivify_249
    new $P620, "Undef"
  vivify_249:
    $P621 = $P620."ast"()
    $P622 = $P618."!make"($P621)
    .return ($P622)
  control_615:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P623, exception, "payload"
    .return ($P623)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("49_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_627
.annotate "line", 193
    new $P626, 'ExceptionHandler'
    set_addr $P626, control_625
    $P626."handle_types"(58)
    push_eh $P626
    .lex "self", self
    .lex "$/", param_627
    find_lex $P628, "$/"
    find_lex $P629, "$/"
    unless_null $P629, vivify_250
    new $P629, "Hash"
  vivify_250:
    set $P630, $P629["pblock"]
    unless_null $P630, vivify_251
    new $P630, "Undef"
  vivify_251:
    $P631 = $P630."ast"()
    $P632 = $P628."!make"($P631)
    .return ($P632)
  control_625:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P633, exception, "payload"
    .return ($P633)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("50_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_637
.annotate "line", 195
    new $P636, 'ExceptionHandler'
    set_addr $P636, control_635
    $P636."handle_types"(58)
    push_eh $P636
    .lex "self", self
    .lex "$/", param_637
.annotate "line", 196
    new $P638, "Undef"
    .lex "$past", $P638
.annotate "line", 197
    find_lex $P641, "$/"
    unless_null $P641, vivify_252
    new $P641, "Hash"
  vivify_252:
    set $P642, $P641["circumfix"]
    unless_null $P642, vivify_253
    new $P642, "Undef"
  vivify_253:
    if $P642, if_640
.annotate "line", 198
    get_hll_global $P647, ["PAST"], "Val"
    find_lex $P648, "$/"
    unless_null $P648, vivify_254
    new $P648, "Hash"
  vivify_254:
    set $P649, $P648["not"]
    unless_null $P649, vivify_255
    new $P649, "Undef"
  vivify_255:
    isfalse $I650, $P649
    $P651 = $P647."new"($I650 :named("value"))
    set $P639, $P651
.annotate "line", 197
    goto if_640_end
  if_640:
    find_lex $P643, "$/"
    unless_null $P643, vivify_256
    new $P643, "Hash"
  vivify_256:
    set $P644, $P643["circumfix"]
    unless_null $P644, vivify_257
    new $P644, "ResizablePMCArray"
  vivify_257:
    set $P645, $P644[0]
    unless_null $P645, vivify_258
    new $P645, "Undef"
  vivify_258:
    $P646 = $P645."ast"()
    set $P639, $P646
  if_640_end:
    store_lex "$past", $P639
.annotate "line", 199
    find_lex $P652, "$past"
    find_lex $P653, "$/"
    unless_null $P653, vivify_259
    new $P653, "Hash"
  vivify_259:
    set $P654, $P653["identifier"]
    unless_null $P654, vivify_260
    new $P654, "Undef"
  vivify_260:
    set $S655, $P654
    $P652."named"($S655)
.annotate "line", 200
    find_lex $P656, "$/"
    find_lex $P657, "$past"
    $P658 = $P656."!make"($P657)
.annotate "line", 195
    .return ($P658)
  control_635:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P659, exception, "payload"
    .return ($P659)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("51_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_663
.annotate "line", 203
    .const 'Sub' $P676 = "52_1259078889.1754" 
    capture_lex $P676
    new $P662, 'ExceptionHandler'
    set_addr $P662, control_661
    $P662."handle_types"(58)
    push_eh $P662
    .lex "self", self
    .lex "$/", param_663
.annotate "line", 204
    new $P664, "Undef"
    .lex "$past", $P664
.annotate "line", 203
    find_lex $P665, "$past"
.annotate "line", 205
    find_lex $P667, "$/"
    unless_null $P667, vivify_261
    new $P667, "Hash"
  vivify_261:
    set $P668, $P667["postcircumfix"]
    unless_null $P668, vivify_262
    new $P668, "Undef"
  vivify_262:
    if $P668, if_666
.annotate "line", 209
    .const 'Sub' $P676 = "52_1259078889.1754" 
    capture_lex $P676
    $P676()
    goto if_666_end
  if_666:
.annotate "line", 206
    find_lex $P669, "$/"
    unless_null $P669, vivify_279
    new $P669, "Hash"
  vivify_279:
    set $P670, $P669["postcircumfix"]
    unless_null $P670, vivify_280
    new $P670, "Undef"
  vivify_280:
    $P671 = $P670."ast"()
    store_lex "$past", $P671
.annotate "line", 207
    find_lex $P672, "$past"
    get_hll_global $P673, ["PAST"], "Var"
    $P674 = $P673."new"("$/" :named("name"))
    $P672."unshift"($P674)
  if_666_end:
.annotate "line", 238
    find_lex $P745, "$/"
    find_lex $P746, "$past"
    $P747 = $P745."!make"($P746)
.annotate "line", 203
    .return ($P747)
  control_661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P748, exception, "payload"
    .return ($P748)
.end


.namespace ["NQP";"Actions"]
.sub "_block675"  :anon :subid("52_1259078889.1754") :outer("51_1259078889.1754")
.annotate "line", 210
    new $P677, "ResizablePMCArray"
    .lex "@name", $P677
    get_hll_global $P678, ["NQP"], "Compiler"
    find_lex $P679, "$/"
    set $S680, $P679
    $P681 = $P678."parse_name"($S680)
    store_lex "@name", $P681
.annotate "line", 211
    get_hll_global $P682, ["PAST"], "Var"
    find_lex $P683, "@name"
    $P684 = $P683."pop"()
    set $S685, $P684
    $P686 = $P682."new"($S685 :named("name"))
    store_lex "$past", $P686
.annotate "line", 212
    find_lex $P688, "@name"
    unless $P688, if_687_end
.annotate "line", 213
    find_lex $P690, "@name"
    unless_null $P690, vivify_263
    new $P690, "ResizablePMCArray"
  vivify_263:
    set $P691, $P690[0]
    unless_null $P691, vivify_264
    new $P691, "Undef"
  vivify_264:
    set $S692, $P691
    iseq $I693, $S692, "GLOBAL"
    unless $I693, if_689_end
    find_lex $P694, "@name"
    $P694."shift"()
  if_689_end:
.annotate "line", 214
    find_lex $P695, "$past"
    find_lex $P696, "@name"
    $P695."namespace"($P696)
.annotate "line", 215
    find_lex $P697, "$past"
    $P697."scope"("package")
.annotate "line", 216
    find_lex $P698, "$past"
    find_lex $P699, "$/"
    unless_null $P699, vivify_265
    new $P699, "Hash"
  vivify_265:
    set $P700, $P699["sigil"]
    unless_null $P700, vivify_266
    new $P700, "Undef"
  vivify_266:
    $P701 = "sigiltype"($P700)
    $P698."viviself"($P701)
.annotate "line", 217
    find_lex $P702, "$past"
    $P702."lvalue"(1)
  if_687_end:
.annotate "line", 219
    find_lex $P705, "$/"
    unless_null $P705, vivify_267
    new $P705, "Hash"
  vivify_267:
    set $P706, $P705["twigil"]
    unless_null $P706, vivify_268
    new $P706, "ResizablePMCArray"
  vivify_268:
    set $P707, $P706[0]
    unless_null $P707, vivify_269
    new $P707, "Undef"
  vivify_269:
    set $S708, $P707
    iseq $I709, $S708, "*"
    if $I709, if_704
.annotate "line", 232
    find_lex $P731, "$/"
    unless_null $P731, vivify_270
    new $P731, "Hash"
  vivify_270:
    set $P732, $P731["twigil"]
    unless_null $P732, vivify_271
    new $P732, "ResizablePMCArray"
  vivify_271:
    set $P733, $P732[0]
    unless_null $P733, vivify_272
    new $P733, "Undef"
  vivify_272:
    set $S734, $P733
    iseq $I735, $S734, "!"
    if $I735, if_730
    new $P729, 'Integer'
    set $P729, $I735
    goto if_730_end
  if_730:
.annotate "line", 233
    find_lex $P736, "$past"
    get_hll_global $P737, ["PAST"], "Var"
    $P738 = $P737."new"("self" :named("name"))
    $P736."push"($P738)
.annotate "line", 234
    find_lex $P739, "$past"
    $P739."scope"("attribute")
.annotate "line", 235
    find_lex $P740, "$past"
    find_lex $P741, "$/"
    unless_null $P741, vivify_273
    new $P741, "Hash"
  vivify_273:
    set $P742, $P741["sigil"]
    unless_null $P742, vivify_274
    new $P742, "Undef"
  vivify_274:
    $P743 = "sigiltype"($P742)
    $P744 = $P740."viviself"($P743)
.annotate "line", 232
    set $P729, $P744
  if_730_end:
    set $P703, $P729
.annotate "line", 219
    goto if_704_end
  if_704:
.annotate "line", 220
    find_lex $P710, "$past"
    $P710."scope"("contextual")
.annotate "line", 221
    find_lex $P711, "$past"
.annotate "line", 222
    get_hll_global $P712, ["PAST"], "Var"
.annotate "line", 224
    find_lex $P713, "$/"
    unless_null $P713, vivify_275
    new $P713, "Hash"
  vivify_275:
    set $P714, $P713["sigil"]
    unless_null $P714, vivify_276
    new $P714, "Undef"
  vivify_276:
    set $S715, $P714
    new $P716, 'String'
    set $P716, $S715
    find_lex $P717, "$/"
    unless_null $P717, vivify_277
    new $P717, "Hash"
  vivify_277:
    set $P718, $P717["desigilname"]
    unless_null $P718, vivify_278
    new $P718, "Undef"
  vivify_278:
    concat $P719, $P716, $P718
.annotate "line", 226
    get_hll_global $P720, ["PAST"], "Op"
    new $P721, "String"
    assign $P721, "Contextual "
    find_lex $P722, "$/"
    set $S723, $P722
    concat $P724, $P721, $S723
    concat $P725, $P724, " not found"
    $P726 = $P720."new"($P725, "die" :named("pirop"))
    $P727 = $P712."new"("package" :named("scope"), "" :named("namespace"), $P719 :named("name"), $P726 :named("viviself"))
.annotate "line", 222
    $P728 = $P711."viviself"($P727)
.annotate "line", 219
    set $P703, $P728
  if_704_end:
.annotate "line", 209
    .return ($P703)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("53_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_752
.annotate "line", 241
    new $P751, 'ExceptionHandler'
    set_addr $P751, control_750
    $P751."handle_types"(58)
    push_eh $P751
    .lex "self", self
    .lex "$/", param_752
    find_lex $P753, "$/"
    find_lex $P754, "$/"
    unless_null $P754, vivify_281
    new $P754, "Hash"
  vivify_281:
    set $P755, $P754["package_def"]
    unless_null $P755, vivify_282
    new $P755, "Undef"
  vivify_282:
    $P756 = $P755."ast"()
    $P757 = $P753."!make"($P756)
    .return ($P757)
  control_750:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P758, exception, "payload"
    .return ($P758)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("54_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_762
.annotate "line", 242
    new $P761, 'ExceptionHandler'
    set_addr $P761, control_760
    $P761."handle_types"(58)
    push_eh $P761
    .lex "self", self
    .lex "$/", param_762
.annotate "line", 243
    new $P763, "Undef"
    .lex "$past", $P763
.annotate "line", 244
    new $P764, "Undef"
    .lex "$classinit", $P764
.annotate "line", 253
    new $P765, "Undef"
    .lex "$parent", $P765
.annotate "line", 243
    find_lex $P766, "$/"
    unless_null $P766, vivify_283
    new $P766, "Hash"
  vivify_283:
    set $P767, $P766["package_def"]
    unless_null $P767, vivify_284
    new $P767, "Undef"
  vivify_284:
    $P768 = $P767."ast"()
    store_lex "$past", $P768
.annotate "line", 245
    get_hll_global $P769, ["PAST"], "Op"
.annotate "line", 246
    get_hll_global $P770, ["PAST"], "Op"
    $P771 = $P770."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 249
    find_lex $P772, "$/"
    unless_null $P772, vivify_285
    new $P772, "Hash"
  vivify_285:
    set $P773, $P772["package_def"]
    unless_null $P773, vivify_286
    new $P773, "Hash"
  vivify_286:
    set $P774, $P773["name"]
    unless_null $P774, vivify_287
    new $P774, "Undef"
  vivify_287:
    set $S775, $P774
    $P776 = $P769."new"($P771, $S775, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 245
    store_lex "$classinit", $P776
.annotate "line", 253
    find_lex $P779, "$/"
    unless_null $P779, vivify_288
    new $P779, "Hash"
  vivify_288:
    set $P780, $P779["package_def"]
    unless_null $P780, vivify_289
    new $P780, "Hash"
  vivify_289:
    set $P781, $P780["parent"]
    unless_null $P781, vivify_290
    new $P781, "ResizablePMCArray"
  vivify_290:
    set $P782, $P781[0]
    unless_null $P782, vivify_291
    new $P782, "Undef"
  vivify_291:
    set $S783, $P782
    unless $S783, unless_778
    new $P777, 'String'
    set $P777, $S783
    goto unless_778_end
  unless_778:
.annotate "line", 254
    find_lex $P786, "$/"
    unless_null $P786, vivify_292
    new $P786, "Hash"
  vivify_292:
    set $P787, $P786["sym"]
    unless_null $P787, vivify_293
    new $P787, "Undef"
  vivify_293:
    set $S788, $P787
    iseq $I789, $S788, "grammar"
    if $I789, if_785
    new $P791, "String"
    assign $P791, ""
    set $P784, $P791
    goto if_785_end
  if_785:
    new $P790, "String"
    assign $P790, "Regex::Cursor"
    set $P784, $P790
  if_785_end:
    set $P777, $P784
  unless_778_end:
    store_lex "$parent", $P777
.annotate "line", 255
    find_lex $P793, "$parent"
    unless $P793, if_792_end
.annotate "line", 256
    find_lex $P794, "$classinit"
    get_hll_global $P795, ["PAST"], "Val"
    find_lex $P796, "$parent"
    $P797 = $P795."new"($P796 :named("value"), "parent" :named("named"))
    $P794."push"($P797)
  if_792_end:
.annotate "line", 258
    find_lex $P799, "$past"
    unless_null $P799, vivify_294
    new $P799, "Hash"
  vivify_294:
    set $P800, $P799["attributes"]
    unless_null $P800, vivify_295
    new $P800, "Undef"
  vivify_295:
    unless $P800, if_798_end
.annotate "line", 259
    find_lex $P801, "$classinit"
    find_lex $P802, "$past"
    unless_null $P802, vivify_296
    new $P802, "Hash"
  vivify_296:
    set $P803, $P802["attributes"]
    unless_null $P803, vivify_297
    new $P803, "Undef"
  vivify_297:
    $P801."push"($P803)
  if_798_end:
.annotate "line", 261
    get_global $P804, "@BLOCK"
    unless_null $P804, vivify_298
    new $P804, "ResizablePMCArray"
  vivify_298:
    set $P805, $P804[0]
    unless_null $P805, vivify_299
    new $P805, "Undef"
  vivify_299:
    $P806 = $P805."loadinit"()
    find_lex $P807, "$classinit"
    $P806."push"($P807)
.annotate "line", 262
    find_lex $P808, "$/"
    find_lex $P809, "$past"
    $P810 = $P808."!make"($P809)
.annotate "line", 242
    .return ($P810)
  control_760:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P811, exception, "payload"
    .return ($P811)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("55_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_815
.annotate "line", 265
    new $P814, 'ExceptionHandler'
    set_addr $P814, control_813
    $P814."handle_types"(58)
    push_eh $P814
    .lex "self", self
    .lex "$/", param_815
.annotate "line", 266
    new $P816, "Undef"
    .lex "$past", $P816
    find_lex $P819, "$/"
    unless_null $P819, vivify_300
    new $P819, "Hash"
  vivify_300:
    set $P820, $P819["block"]
    unless_null $P820, vivify_301
    new $P820, "Undef"
  vivify_301:
    if $P820, if_818
    find_lex $P824, "$/"
    unless_null $P824, vivify_302
    new $P824, "Hash"
  vivify_302:
    set $P825, $P824["comp_unit"]
    unless_null $P825, vivify_303
    new $P825, "Undef"
  vivify_303:
    $P826 = $P825."ast"()
    set $P817, $P826
    goto if_818_end
  if_818:
    find_lex $P821, "$/"
    unless_null $P821, vivify_304
    new $P821, "Hash"
  vivify_304:
    set $P822, $P821["block"]
    unless_null $P822, vivify_305
    new $P822, "Undef"
  vivify_305:
    $P823 = $P822."ast"()
    set $P817, $P823
  if_818_end:
    store_lex "$past", $P817
.annotate "line", 267
    find_lex $P827, "$past"
    find_lex $P828, "$/"
    unless_null $P828, vivify_306
    new $P828, "Hash"
  vivify_306:
    set $P829, $P828["name"]
    unless_null $P829, vivify_307
    new $P829, "Hash"
  vivify_307:
    set $P830, $P829["identifier"]
    unless_null $P830, vivify_308
    new $P830, "Undef"
  vivify_308:
    $P827."namespace"($P830)
.annotate "line", 268
    find_lex $P831, "$past"
    $P831."blocktype"("immediate")
.annotate "line", 269
    find_lex $P832, "$/"
    find_lex $P833, "$past"
    $P834 = $P832."!make"($P833)
.annotate "line", 265
    .return ($P834)
  control_813:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P835, exception, "payload"
    .return ($P835)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("56_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_839
.annotate "line", 272
    new $P838, 'ExceptionHandler'
    set_addr $P838, control_837
    $P838."handle_types"(58)
    push_eh $P838
    .lex "self", self
    .lex "$/", param_839
    find_lex $P840, "$/"
    find_lex $P841, "$/"
    unless_null $P841, vivify_309
    new $P841, "Hash"
  vivify_309:
    set $P842, $P841["scoped"]
    unless_null $P842, vivify_310
    new $P842, "Undef"
  vivify_310:
    $P843 = $P842."ast"()
    $P844 = $P840."!make"($P843)
    .return ($P844)
  control_837:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P845, exception, "payload"
    .return ($P845)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("57_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_849
.annotate "line", 273
    new $P848, 'ExceptionHandler'
    set_addr $P848, control_847
    $P848."handle_types"(58)
    push_eh $P848
    .lex "self", self
    .lex "$/", param_849
    find_lex $P850, "$/"
    find_lex $P851, "$/"
    unless_null $P851, vivify_311
    new $P851, "Hash"
  vivify_311:
    set $P852, $P851["scoped"]
    unless_null $P852, vivify_312
    new $P852, "Undef"
  vivify_312:
    $P853 = $P852."ast"()
    $P854 = $P850."!make"($P853)
    .return ($P854)
  control_847:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P855, exception, "payload"
    .return ($P855)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("58_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_859
.annotate "line", 274
    new $P858, 'ExceptionHandler'
    set_addr $P858, control_857
    $P858."handle_types"(58)
    push_eh $P858
    .lex "self", self
    .lex "$/", param_859
    find_lex $P860, "$/"
    find_lex $P861, "$/"
    unless_null $P861, vivify_313
    new $P861, "Hash"
  vivify_313:
    set $P862, $P861["scoped"]
    unless_null $P862, vivify_314
    new $P862, "Undef"
  vivify_314:
    $P863 = $P862."ast"()
    $P864 = $P860."!make"($P863)
    .return ($P864)
  control_857:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P865, exception, "payload"
    .return ($P865)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("59_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_869
.annotate "line", 276
    new $P868, 'ExceptionHandler'
    set_addr $P868, control_867
    $P868."handle_types"(58)
    push_eh $P868
    .lex "self", self
    .lex "$/", param_869
.annotate "line", 277
    find_lex $P870, "$/"
.annotate "line", 278
    find_lex $P873, "$/"
    unless_null $P873, vivify_315
    new $P873, "Hash"
  vivify_315:
    set $P874, $P873["routine_declarator"]
    unless_null $P874, vivify_316
    new $P874, "Undef"
  vivify_316:
    if $P874, if_872
.annotate "line", 279
    find_lex $P878, "$/"
    unless_null $P878, vivify_317
    new $P878, "Hash"
  vivify_317:
    set $P879, $P878["variable_declarator"]
    unless_null $P879, vivify_318
    new $P879, "Undef"
  vivify_318:
    $P880 = $P879."ast"()
    set $P871, $P880
.annotate "line", 278
    goto if_872_end
  if_872:
    find_lex $P875, "$/"
    unless_null $P875, vivify_319
    new $P875, "Hash"
  vivify_319:
    set $P876, $P875["routine_declarator"]
    unless_null $P876, vivify_320
    new $P876, "Undef"
  vivify_320:
    $P877 = $P876."ast"()
    set $P871, $P877
  if_872_end:
    $P881 = $P870."!make"($P871)
.annotate "line", 276
    .return ($P881)
  control_867:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P882, exception, "payload"
    .return ($P882)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("60_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_886
.annotate "line", 282
    .const 'Sub' $P926 = "61_1259078889.1754" 
    capture_lex $P926
    new $P885, 'ExceptionHandler'
    set_addr $P885, control_884
    $P885."handle_types"(58)
    push_eh $P885
    .lex "self", self
    .lex "$/", param_886
.annotate "line", 283
    new $P887, "Undef"
    .lex "$past", $P887
.annotate "line", 284
    new $P888, "Undef"
    .lex "$sigil", $P888
.annotate "line", 285
    new $P889, "Undef"
    .lex "$name", $P889
.annotate "line", 286
    new $P890, "Undef"
    .lex "$BLOCK", $P890
.annotate "line", 283
    find_lex $P891, "$/"
    unless_null $P891, vivify_321
    new $P891, "Hash"
  vivify_321:
    set $P892, $P891["variable"]
    unless_null $P892, vivify_322
    new $P892, "Undef"
  vivify_322:
    $P893 = $P892."ast"()
    store_lex "$past", $P893
.annotate "line", 284
    find_lex $P894, "$/"
    unless_null $P894, vivify_323
    new $P894, "Hash"
  vivify_323:
    set $P895, $P894["variable"]
    unless_null $P895, vivify_324
    new $P895, "Hash"
  vivify_324:
    set $P896, $P895["sigil"]
    unless_null $P896, vivify_325
    new $P896, "Undef"
  vivify_325:
    store_lex "$sigil", $P896
.annotate "line", 285
    find_lex $P897, "$past"
    $P898 = $P897."name"()
    store_lex "$name", $P898
.annotate "line", 286
    get_global $P899, "@BLOCK"
    unless_null $P899, vivify_326
    new $P899, "ResizablePMCArray"
  vivify_326:
    set $P900, $P899[0]
    unless_null $P900, vivify_327
    new $P900, "Undef"
  vivify_327:
    store_lex "$BLOCK", $P900
.annotate "line", 287
    find_lex $P902, "$BLOCK"
    find_lex $P903, "$name"
    $P904 = $P902."symbol"($P903)
    unless $P904, if_901_end
.annotate "line", 288
    find_lex $P905, "$/"
    $P906 = $P905."CURSOR"()
    find_lex $P907, "$name"
    $P906."panic"("Redeclaration of symbol ", $P907)
  if_901_end:
.annotate "line", 290
    find_dynamic_lex $P909, "$*SCOPE"
    unless_null $P909, vivify_328
    get_hll_global $P909, "$SCOPE"
    unless_null $P909, vivify_329
    die "Contextual $*SCOPE not found"
  vivify_329:
  vivify_328:
    set $S910, $P909
    iseq $I911, $S910, "has"
    if $I911, if_908
.annotate "line", 299
    .const 'Sub' $P926 = "61_1259078889.1754" 
    capture_lex $P926
    $P926()
    goto if_908_end
  if_908:
.annotate "line", 291
    find_lex $P912, "$BLOCK"
    find_lex $P913, "$name"
    $P912."symbol"($P913, "attribute" :named("scope"))
.annotate "line", 292
    find_lex $P915, "$BLOCK"
    unless_null $P915, vivify_334
    new $P915, "Hash"
  vivify_334:
    set $P916, $P915["attributes"]
    unless_null $P916, vivify_335
    new $P916, "Undef"
  vivify_335:
    if $P916, unless_914_end
.annotate "line", 294
    get_hll_global $P917, ["PAST"], "Op"
    $P918 = $P917."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P919, "$BLOCK"
    unless_null $P919, vivify_336
    new $P919, "Hash"
    store_lex "$BLOCK", $P919
  vivify_336:
    set $P919["attributes"], $P918
  unless_914_end:
.annotate "line", 296
    find_lex $P920, "$BLOCK"
    unless_null $P920, vivify_337
    new $P920, "Hash"
  vivify_337:
    set $P921, $P920["attributes"]
    unless_null $P921, vivify_338
    new $P921, "Undef"
  vivify_338:
    find_lex $P922, "$name"
    $P921."push"($P922)
.annotate "line", 297
    get_hll_global $P923, ["PAST"], "Stmts"
    $P924 = $P923."new"()
    store_lex "$past", $P924
  if_908_end:
.annotate "line", 307
    find_lex $P950, "$/"
    find_lex $P951, "$past"
    $P952 = $P950."!make"($P951)
.annotate "line", 282
    .return ($P952)
  control_884:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P953, exception, "payload"
    .return ($P953)
.end


.namespace ["NQP";"Actions"]
.sub "_block925"  :anon :subid("61_1259078889.1754") :outer("60_1259078889.1754")
.annotate "line", 300
    new $P927, "Undef"
    .lex "$scope", $P927
.annotate "line", 301
    new $P928, "Undef"
    .lex "$decl", $P928
.annotate "line", 300
    find_dynamic_lex $P931, "$*SCOPE"
    unless_null $P931, vivify_330
    get_hll_global $P931, "$SCOPE"
    unless_null $P931, vivify_331
    die "Contextual $*SCOPE not found"
  vivify_331:
  vivify_330:
    set $S932, $P931
    iseq $I933, $S932, "our"
    if $I933, if_930
    new $P935, "String"
    assign $P935, "lexical"
    set $P929, $P935
    goto if_930_end
  if_930:
    new $P934, "String"
    assign $P934, "package"
    set $P929, $P934
  if_930_end:
    store_lex "$scope", $P929
.annotate "line", 301
    get_hll_global $P936, ["PAST"], "Var"
    find_lex $P937, "$name"
    find_lex $P938, "$scope"
.annotate "line", 302
    find_lex $P939, "$sigil"
    $P940 = "sigiltype"($P939)
    find_lex $P941, "$/"
    $P942 = $P936."new"($P937 :named("name"), $P938 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P940 :named("viviself"), $P941 :named("node"))
.annotate "line", 301
    store_lex "$decl", $P942
.annotate "line", 304
    find_lex $P943, "$BLOCK"
    find_lex $P944, "$name"
    find_lex $P945, "$scope"
    $P943."symbol"($P944, $P945 :named("scope"))
.annotate "line", 305
    find_lex $P946, "$BLOCK"
    unless_null $P946, vivify_332
    new $P946, "ResizablePMCArray"
  vivify_332:
    set $P947, $P946[0]
    unless_null $P947, vivify_333
    new $P947, "Undef"
  vivify_333:
    find_lex $P948, "$decl"
    $P949 = $P947."push"($P948)
.annotate "line", 299
    .return ($P949)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("62_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_957
.annotate "line", 310
    new $P956, 'ExceptionHandler'
    set_addr $P956, control_955
    $P956."handle_types"(58)
    push_eh $P956
    .lex "self", self
    .lex "$/", param_957
    find_lex $P958, "$/"
    find_lex $P959, "$/"
    unless_null $P959, vivify_339
    new $P959, "Hash"
  vivify_339:
    set $P960, $P959["routine_def"]
    unless_null $P960, vivify_340
    new $P960, "Undef"
  vivify_340:
    $P961 = $P960."ast"()
    $P962 = $P958."!make"($P961)
    .return ($P962)
  control_955:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P963, exception, "payload"
    .return ($P963)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("63_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_967
.annotate "line", 311
    new $P966, 'ExceptionHandler'
    set_addr $P966, control_965
    $P966."handle_types"(58)
    push_eh $P966
    .lex "self", self
    .lex "$/", param_967
    find_lex $P968, "$/"
    find_lex $P969, "$/"
    unless_null $P969, vivify_341
    new $P969, "Hash"
  vivify_341:
    set $P970, $P969["method_def"]
    unless_null $P970, vivify_342
    new $P970, "Undef"
  vivify_342:
    $P971 = $P970."ast"()
    $P972 = $P968."!make"($P971)
    .return ($P972)
  control_965:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P973, exception, "payload"
    .return ($P973)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("64_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_977
.annotate "line", 313
    .const 'Sub' $P988 = "65_1259078889.1754" 
    capture_lex $P988
    new $P976, 'ExceptionHandler'
    set_addr $P976, control_975
    $P976."handle_types"(58)
    push_eh $P976
    .lex "self", self
    .lex "$/", param_977
.annotate "line", 314
    new $P978, "Undef"
    .lex "$past", $P978
    find_lex $P979, "$/"
    unless_null $P979, vivify_343
    new $P979, "Hash"
  vivify_343:
    set $P980, $P979["blockoid"]
    unless_null $P980, vivify_344
    new $P980, "Undef"
  vivify_344:
    $P981 = $P980."ast"()
    store_lex "$past", $P981
.annotate "line", 315
    find_lex $P982, "$past"
    $P982."blocktype"("declaration")
.annotate "line", 316
    find_lex $P983, "$past"
    $P983."control"("return_pir")
.annotate "line", 317
    find_lex $P985, "$/"
    unless_null $P985, vivify_345
    new $P985, "Hash"
  vivify_345:
    set $P986, $P985["deflongname"]
    unless_null $P986, vivify_346
    new $P986, "Undef"
  vivify_346:
    unless $P986, if_984_end
    .const 'Sub' $P988 = "65_1259078889.1754" 
    capture_lex $P988
    $P988()
  if_984_end:
.annotate "line", 327
    find_lex $P1016, "$/"
    find_lex $P1017, "$past"
    $P1018 = $P1016."!make"($P1017)
.annotate "line", 313
    .return ($P1018)
  control_975:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1019, exception, "payload"
    .return ($P1019)
.end


.namespace ["NQP";"Actions"]
.sub "_block987"  :anon :subid("65_1259078889.1754") :outer("64_1259078889.1754")
.annotate "line", 318
    new $P989, "Undef"
    .lex "$name", $P989
    find_lex $P990, "$/"
    unless_null $P990, vivify_347
    new $P990, "Hash"
  vivify_347:
    set $P991, $P990["deflongname"]
    unless_null $P991, vivify_348
    new $P991, "ResizablePMCArray"
  vivify_348:
    set $P992, $P991[0]
    unless_null $P992, vivify_349
    new $P992, "Undef"
  vivify_349:
    $P993 = $P992."ast"()
    set $S994, $P993
    new $P995, 'String'
    set $P995, $S994
    store_lex "$name", $P995
.annotate "line", 319
    find_lex $P996, "$past"
    find_lex $P997, "$name"
    $P996."name"($P997)
.annotate "line", 320
    find_dynamic_lex $P1000, "$*SCOPE"
    unless_null $P1000, vivify_350
    get_hll_global $P1000, "$SCOPE"
    unless_null $P1000, vivify_351
    die "Contextual $*SCOPE not found"
  vivify_351:
  vivify_350:
    set $S1001, $P1000
    isne $I1002, $S1001, "our"
    if $I1002, if_999
    new $P998, 'Integer'
    set $P998, $I1002
    goto if_999_end
  if_999:
.annotate "line", 321
    get_global $P1003, "@BLOCK"
    unless_null $P1003, vivify_352
    new $P1003, "ResizablePMCArray"
  vivify_352:
    set $P1004, $P1003[0]
    unless_null $P1004, vivify_353
    new $P1004, "ResizablePMCArray"
  vivify_353:
    set $P1005, $P1004[0]
    unless_null $P1005, vivify_354
    new $P1005, "Undef"
  vivify_354:
    get_hll_global $P1006, ["PAST"], "Var"
    find_lex $P1007, "$name"
    find_lex $P1008, "$past"
    $P1009 = $P1006."new"($P1007 :named("name"), 1 :named("isdecl"), $P1008 :named("viviself"), "lexical" :named("scope"))
    $P1005."push"($P1009)
.annotate "line", 323
    get_global $P1010, "@BLOCK"
    unless_null $P1010, vivify_355
    new $P1010, "ResizablePMCArray"
  vivify_355:
    set $P1011, $P1010[0]
    unless_null $P1011, vivify_356
    new $P1011, "Undef"
  vivify_356:
    find_lex $P1012, "$name"
    $P1011."symbol"($P1012, "lexical" :named("scope"))
.annotate "line", 324
    get_hll_global $P1013, ["PAST"], "Var"
    find_lex $P1014, "$name"
    $P1015 = $P1013."new"($P1014 :named("name"))
    store_lex "$past", $P1015
.annotate "line", 320
    set $P998, $P1015
  if_999_end:
.annotate "line", 317
    .return ($P998)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("66_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1023
.annotate "line", 331
    .const 'Sub' $P1039 = "67_1259078889.1754" 
    capture_lex $P1039
    new $P1022, 'ExceptionHandler'
    set_addr $P1022, control_1021
    $P1022."handle_types"(58)
    push_eh $P1022
    .lex "self", self
    .lex "$/", param_1023
.annotate "line", 332
    new $P1024, "Undef"
    .lex "$past", $P1024
    find_lex $P1025, "$/"
    unless_null $P1025, vivify_357
    new $P1025, "Hash"
  vivify_357:
    set $P1026, $P1025["blockoid"]
    unless_null $P1026, vivify_358
    new $P1026, "Undef"
  vivify_358:
    $P1027 = $P1026."ast"()
    store_lex "$past", $P1027
.annotate "line", 333
    find_lex $P1028, "$past"
    $P1028."blocktype"("method")
.annotate "line", 334
    find_lex $P1029, "$past"
    $P1029."control"("return_pir")
.annotate "line", 335
    find_lex $P1030, "$past"
    unless_null $P1030, vivify_359
    new $P1030, "ResizablePMCArray"
  vivify_359:
    set $P1031, $P1030[0]
    unless_null $P1031, vivify_360
    new $P1031, "Undef"
  vivify_360:
    get_hll_global $P1032, ["PAST"], "Op"
    $P1033 = $P1032."new"("    .lex \"self\", self" :named("inline"))
    $P1031."unshift"($P1033)
.annotate "line", 336
    find_lex $P1034, "$past"
    $P1034."symbol"("self", "lexical" :named("scope"))
.annotate "line", 337
    find_lex $P1036, "$/"
    unless_null $P1036, vivify_361
    new $P1036, "Hash"
  vivify_361:
    set $P1037, $P1036["deflongname"]
    unless_null $P1037, vivify_362
    new $P1037, "Undef"
  vivify_362:
    unless $P1037, if_1035_end
    .const 'Sub' $P1039 = "67_1259078889.1754" 
    capture_lex $P1039
    $P1039()
  if_1035_end:
.annotate "line", 341
    find_lex $P1050, "$/"
    find_lex $P1051, "$past"
    $P1052 = $P1050."!make"($P1051)
.annotate "line", 331
    .return ($P1052)
  control_1021:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1053, exception, "payload"
    .return ($P1053)
.end


.namespace ["NQP";"Actions"]
.sub "_block1038"  :anon :subid("67_1259078889.1754") :outer("66_1259078889.1754")
.annotate "line", 338
    new $P1040, "Undef"
    .lex "$name", $P1040
    find_lex $P1041, "$/"
    unless_null $P1041, vivify_363
    new $P1041, "Hash"
  vivify_363:
    set $P1042, $P1041["deflongname"]
    unless_null $P1042, vivify_364
    new $P1042, "ResizablePMCArray"
  vivify_364:
    set $P1043, $P1042[0]
    unless_null $P1043, vivify_365
    new $P1043, "Undef"
  vivify_365:
    $P1044 = $P1043."ast"()
    set $S1045, $P1044
    new $P1046, 'String'
    set $P1046, $S1045
    store_lex "$name", $P1046
.annotate "line", 339
    find_lex $P1047, "$past"
    find_lex $P1048, "$name"
    $P1049 = $P1047."name"($P1048)
.annotate "line", 337
    .return ($P1049)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("68_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1057
.annotate "line", 345
    .const 'Sub' $P1068 = "69_1259078889.1754" 
    capture_lex $P1068
    new $P1056, 'ExceptionHandler'
    set_addr $P1056, control_1055
    $P1056."handle_types"(58)
    push_eh $P1056
    .lex "self", self
    .lex "$/", param_1057
.annotate "line", 346
    new $P1058, "Undef"
    .lex "$BLOCKINIT", $P1058
    get_global $P1059, "@BLOCK"
    unless_null $P1059, vivify_366
    new $P1059, "ResizablePMCArray"
  vivify_366:
    set $P1060, $P1059[0]
    unless_null $P1060, vivify_367
    new $P1060, "ResizablePMCArray"
  vivify_367:
    set $P1061, $P1060[0]
    unless_null $P1061, vivify_368
    new $P1061, "Undef"
  vivify_368:
    store_lex "$BLOCKINIT", $P1061
.annotate "line", 347
    find_lex $P1063, "$/"
    unless_null $P1063, vivify_369
    new $P1063, "Hash"
  vivify_369:
    set $P1064, $P1063["parameter"]
    unless_null $P1064, vivify_370
    new $P1064, "Undef"
  vivify_370:
    defined $I1065, $P1064
    unless $I1065, for_undef_371
    iter $P1062, $P1064
    new $P1075, 'ExceptionHandler'
    set_addr $P1075, loop1074_handler
    $P1075."handle_types"(65, 67, 66)
    push_eh $P1075
  loop1074_test:
    unless $P1062, loop1074_done
    shift $P1066, $P1062
  loop1074_redo:
    .const 'Sub' $P1068 = "69_1259078889.1754" 
    capture_lex $P1068
    $P1068($P1066)
  loop1074_next:
    goto loop1074_test
  loop1074_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1076, exception, 'type'
    eq $P1076, 65, loop1074_next
    eq $P1076, 67, loop1074_redo
  loop1074_done:
    pop_eh 
  for_undef_371:
.annotate "line", 345
    .return ($P1062)
  control_1055:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1077, exception, "payload"
    .return ($P1077)
.end


.namespace ["NQP";"Actions"]
.sub "_block1067"  :anon :subid("69_1259078889.1754") :outer("68_1259078889.1754")
    .param pmc param_1069
.annotate "line", 347
    .lex "$_", param_1069
    find_lex $P1070, "$BLOCKINIT"
    find_lex $P1071, "$_"
    $P1072 = $P1071."ast"()
    $P1073 = $P1070."push"($P1072)
    .return ($P1073)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("70_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1081
.annotate "line", 350
    new $P1080, 'ExceptionHandler'
    set_addr $P1080, control_1079
    $P1080."handle_types"(58)
    push_eh $P1080
    .lex "self", self
    .lex "$/", param_1081
.annotate "line", 351
    new $P1082, "Undef"
    .lex "$quant", $P1082
.annotate "line", 352
    new $P1083, "Undef"
    .lex "$past", $P1083
.annotate "line", 351
    find_lex $P1084, "$/"
    unless_null $P1084, vivify_372
    new $P1084, "Hash"
  vivify_372:
    set $P1085, $P1084["quant"]
    unless_null $P1085, vivify_373
    new $P1085, "Undef"
  vivify_373:
    store_lex "$quant", $P1085
    find_lex $P1086, "$past"
.annotate "line", 353
    find_lex $P1088, "$/"
    unless_null $P1088, vivify_374
    new $P1088, "Hash"
  vivify_374:
    set $P1089, $P1088["named_param"]
    unless_null $P1089, vivify_375
    new $P1089, "Undef"
  vivify_375:
    if $P1089, if_1087
.annotate "line", 360
    find_lex $P1103, "$/"
    unless_null $P1103, vivify_376
    new $P1103, "Hash"
  vivify_376:
    set $P1104, $P1103["param_var"]
    unless_null $P1104, vivify_377
    new $P1104, "Undef"
  vivify_377:
    $P1105 = $P1104."ast"()
    store_lex "$past", $P1105
.annotate "line", 361
    find_lex $P1107, "$quant"
    set $S1108, $P1107
    iseq $I1109, $S1108, "*"
    if $I1109, if_1106
.annotate "line", 365
    find_lex $P1118, "$quant"
    set $S1119, $P1118
    iseq $I1120, $S1119, "?"
    unless $I1120, if_1117_end
.annotate "line", 366
    find_lex $P1121, "$past"
    find_lex $P1122, "$/"
    unless_null $P1122, vivify_378
    new $P1122, "Hash"
  vivify_378:
    set $P1123, $P1122["param_var"]
    unless_null $P1123, vivify_379
    new $P1123, "Hash"
  vivify_379:
    set $P1124, $P1123["sigil"]
    unless_null $P1124, vivify_380
    new $P1124, "Undef"
  vivify_380:
    $P1125 = "sigiltype"($P1124)
    $P1121."viviself"($P1125)
  if_1117_end:
.annotate "line", 365
    goto if_1106_end
  if_1106:
.annotate "line", 362
    find_lex $P1110, "$past"
    $P1110."slurpy"(1)
.annotate "line", 363
    find_lex $P1111, "$past"
    find_lex $P1112, "$/"
    unless_null $P1112, vivify_381
    new $P1112, "Hash"
  vivify_381:
    set $P1113, $P1112["param_var"]
    unless_null $P1113, vivify_382
    new $P1113, "Hash"
  vivify_382:
    set $P1114, $P1113["sigil"]
    unless_null $P1114, vivify_383
    new $P1114, "Undef"
  vivify_383:
    set $S1115, $P1114
    iseq $I1116, $S1115, "%"
    $P1111."named"($I1116)
  if_1106_end:
.annotate "line", 359
    goto if_1087_end
  if_1087:
.annotate "line", 354
    find_lex $P1090, "$/"
    unless_null $P1090, vivify_384
    new $P1090, "Hash"
  vivify_384:
    set $P1091, $P1090["named_param"]
    unless_null $P1091, vivify_385
    new $P1091, "Undef"
  vivify_385:
    $P1092 = $P1091."ast"()
    store_lex "$past", $P1092
.annotate "line", 355
    find_lex $P1094, "$quant"
    set $S1095, $P1094
    isne $I1096, $S1095, "!"
    unless $I1096, if_1093_end
.annotate "line", 356
    find_lex $P1097, "$past"
    find_lex $P1098, "$/"
    unless_null $P1098, vivify_386
    new $P1098, "Hash"
  vivify_386:
    set $P1099, $P1098["named_param"]
    unless_null $P1099, vivify_387
    new $P1099, "Hash"
  vivify_387:
    set $P1100, $P1099["param_var"]
    unless_null $P1100, vivify_388
    new $P1100, "Hash"
  vivify_388:
    set $P1101, $P1100["sigil"]
    unless_null $P1101, vivify_389
    new $P1101, "Undef"
  vivify_389:
    $P1102 = "sigiltype"($P1101)
    $P1097."viviself"($P1102)
  if_1093_end:
  if_1087_end:
.annotate "line", 369
    find_lex $P1127, "$/"
    unless_null $P1127, vivify_390
    new $P1127, "Hash"
  vivify_390:
    set $P1128, $P1127["default_value"]
    unless_null $P1128, vivify_391
    new $P1128, "Undef"
  vivify_391:
    unless $P1128, if_1126_end
.annotate "line", 370
    find_lex $P1130, "$quant"
    set $S1131, $P1130
    iseq $I1132, $S1131, "*"
    unless $I1132, if_1129_end
.annotate "line", 371
    find_lex $P1133, "$/"
    $P1134 = $P1133."CURSOR"()
    $P1134."panic"("Can't put default on slurpy parameter")
  if_1129_end:
.annotate "line", 373
    find_lex $P1136, "$quant"
    set $S1137, $P1136
    iseq $I1138, $S1137, "!"
    unless $I1138, if_1135_end
.annotate "line", 374
    find_lex $P1139, "$/"
    $P1140 = $P1139."CURSOR"()
    $P1140."panic"("Can't put default on required parameter")
  if_1135_end:
.annotate "line", 376
    find_lex $P1141, "$past"
    find_lex $P1142, "$/"
    unless_null $P1142, vivify_392
    new $P1142, "Hash"
  vivify_392:
    set $P1143, $P1142["default_value"]
    unless_null $P1143, vivify_393
    new $P1143, "ResizablePMCArray"
  vivify_393:
    set $P1144, $P1143[0]
    unless_null $P1144, vivify_394
    new $P1144, "Hash"
  vivify_394:
    set $P1145, $P1144["EXPR"]
    unless_null $P1145, vivify_395
    new $P1145, "Undef"
  vivify_395:
    $P1146 = $P1145."ast"()
    $P1141."viviself"($P1146)
  if_1126_end:
.annotate "line", 378
    find_lex $P1148, "$past"
    $P1149 = $P1148."viviself"()
    if $P1149, unless_1147_end
    get_global $P1150, "@BLOCK"
    unless_null $P1150, vivify_396
    new $P1150, "ResizablePMCArray"
  vivify_396:
    set $P1151, $P1150[0]
    unless_null $P1151, vivify_397
    new $P1151, "Undef"
  vivify_397:
    get_global $P1152, "@BLOCK"
    unless_null $P1152, vivify_398
    new $P1152, "ResizablePMCArray"
  vivify_398:
    set $P1153, $P1152[0]
    unless_null $P1153, vivify_399
    new $P1153, "Undef"
  vivify_399:
    $P1154 = $P1153."arity"()
    set $N1155, $P1154
    new $P1156, 'Float'
    set $P1156, $N1155
    add $P1157, $P1156, 1
    $P1151."arity"($P1157)
  unless_1147_end:
.annotate "line", 379
    find_lex $P1158, "$/"
    find_lex $P1159, "$past"
    $P1160 = $P1158."!make"($P1159)
.annotate "line", 350
    .return ($P1160)
  control_1079:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1161, exception, "payload"
    .return ($P1161)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("71_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1165
.annotate "line", 382
    new $P1164, 'ExceptionHandler'
    set_addr $P1164, control_1163
    $P1164."handle_types"(58)
    push_eh $P1164
    .lex "self", self
    .lex "$/", param_1165
.annotate "line", 383
    new $P1166, "Undef"
    .lex "$name", $P1166
.annotate "line", 384
    new $P1167, "Undef"
    .lex "$past", $P1167
.annotate "line", 383
    find_lex $P1168, "$/"
    set $S1169, $P1168
    new $P1170, 'String'
    set $P1170, $S1169
    store_lex "$name", $P1170
.annotate "line", 384
    get_hll_global $P1171, ["PAST"], "Var"
    find_lex $P1172, "$name"
    find_lex $P1173, "$/"
    $P1174 = $P1171."new"($P1172 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1173 :named("node"))
    store_lex "$past", $P1174
.annotate "line", 386
    get_global $P1175, "@BLOCK"
    unless_null $P1175, vivify_400
    new $P1175, "ResizablePMCArray"
  vivify_400:
    set $P1176, $P1175[0]
    unless_null $P1176, vivify_401
    new $P1176, "Undef"
  vivify_401:
    find_lex $P1177, "$name"
    $P1176."symbol"($P1177, "lexical" :named("scope"))
.annotate "line", 387
    find_lex $P1178, "$/"
    find_lex $P1179, "$past"
    $P1180 = $P1178."!make"($P1179)
.annotate "line", 382
    .return ($P1180)
  control_1163:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1181, exception, "payload"
    .return ($P1181)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("72_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1185
.annotate "line", 390
    new $P1184, 'ExceptionHandler'
    set_addr $P1184, control_1183
    $P1184."handle_types"(58)
    push_eh $P1184
    .lex "self", self
    .lex "$/", param_1185
.annotate "line", 391
    new $P1186, "Undef"
    .lex "$past", $P1186
    find_lex $P1187, "$/"
    unless_null $P1187, vivify_402
    new $P1187, "Hash"
  vivify_402:
    set $P1188, $P1187["param_var"]
    unless_null $P1188, vivify_403
    new $P1188, "Undef"
  vivify_403:
    $P1189 = $P1188."ast"()
    store_lex "$past", $P1189
.annotate "line", 392
    find_lex $P1190, "$past"
    find_lex $P1191, "$/"
    unless_null $P1191, vivify_404
    new $P1191, "Hash"
  vivify_404:
    set $P1192, $P1191["param_var"]
    unless_null $P1192, vivify_405
    new $P1192, "Hash"
  vivify_405:
    set $P1193, $P1192["name"]
    unless_null $P1193, vivify_406
    new $P1193, "Undef"
  vivify_406:
    set $S1194, $P1193
    $P1190."named"($S1194)
.annotate "line", 393
    find_lex $P1195, "$/"
    find_lex $P1196, "$past"
    $P1197 = $P1195."!make"($P1196)
.annotate "line", 390
    .return ($P1197)
  control_1183:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1198, exception, "payload"
    .return ($P1198)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("73_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1202
    .param pmc param_1203 :optional
    .param int has_param_1203 :opt_flag
.annotate "line", 396
    .const 'Sub' $P1220 = "74_1259078889.1754" 
    capture_lex $P1220
    new $P1201, 'ExceptionHandler'
    set_addr $P1201, control_1200
    $P1201."handle_types"(58)
    push_eh $P1201
    .lex "self", self
    .lex "$/", param_1202
    if has_param_1203, optparam_407
    new $P1204, "Undef"
    set param_1203, $P1204
  optparam_407:
    .lex "$key", param_1203
.annotate "line", 397
    new $P1205, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1205
.annotate "line", 400
    new $P1206, "Undef"
    .lex "$name", $P1206
.annotate "line", 401
    new $P1207, "Undef"
    .lex "$past", $P1207
.annotate "line", 397

        $P1208 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1208
.annotate "line", 400
    find_lex $P1209, "$/"
    unless_null $P1209, vivify_408
    new $P1209, "Hash"
  vivify_408:
    set $P1210, $P1209["deflongname"]
    unless_null $P1210, vivify_409
    new $P1210, "Undef"
  vivify_409:
    $P1211 = $P1210."ast"()
    set $S1212, $P1211
    new $P1213, 'String'
    set $P1213, $S1212
    store_lex "$name", $P1213
    find_lex $P1214, "$past"
.annotate "line", 402
    find_lex $P1216, "$key"
    set $S1217, $P1216
    iseq $I1218, $S1217, "open"
    if $I1218, if_1215
.annotate "line", 415
    find_lex $P1248, "$/"
    unless_null $P1248, vivify_410
    new $P1248, "Hash"
  vivify_410:
    set $P1249, $P1248["proto"]
    unless_null $P1249, vivify_411
    new $P1249, "Undef"
  vivify_411:
    if $P1249, if_1247
.annotate "line", 444
    get_hll_global $P1272, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1273, "$/"
    unless_null $P1273, vivify_412
    new $P1273, "Hash"
  vivify_412:
    set $P1274, $P1273["p6regex"]
    unless_null $P1274, vivify_413
    new $P1274, "Undef"
  vivify_413:
    $P1275 = $P1274."ast"()
    get_global $P1276, "@BLOCK"
    $P1277 = $P1276."shift"()
    $P1278 = $P1272($P1275, $P1277)
    store_lex "$past", $P1278
.annotate "line", 445
    find_lex $P1279, "$past"
    find_lex $P1280, "$name"
    $P1279."name"($P1280)
.annotate "line", 446
    find_lex $P1281, "@MODIFIERS"
    $P1281."shift"()
.annotate "line", 442
    goto if_1247_end
  if_1247:
.annotate "line", 417
    get_hll_global $P1250, ["PAST"], "Stmts"
.annotate "line", 418
    get_hll_global $P1251, ["PAST"], "Block"
    find_lex $P1252, "$name"
.annotate "line", 419
    get_hll_global $P1253, ["PAST"], "Op"
.annotate "line", 420
    get_hll_global $P1254, ["PAST"], "Var"
    $P1255 = $P1254."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1256, "$name"
    $P1257 = $P1253."new"($P1255, $P1256, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 419
    find_lex $P1258, "$/"
    $P1259 = $P1251."new"($P1257, $P1252 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1258 :named("node"))
.annotate "line", 429
    get_hll_global $P1260, ["PAST"], "Block"
    new $P1261, "String"
    assign $P1261, "!PREFIX__"
    find_lex $P1262, "$name"
    concat $P1263, $P1261, $P1262
.annotate "line", 430
    get_hll_global $P1264, ["PAST"], "Op"
.annotate "line", 431
    get_hll_global $P1265, ["PAST"], "Var"
    $P1266 = $P1265."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1267, "$name"
    $P1268 = $P1264."new"($P1266, $P1267, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 430
    find_lex $P1269, "$/"
    $P1270 = $P1260."new"($P1268, $P1263 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1269 :named("node"))
.annotate "line", 429
    $P1271 = $P1250."new"($P1259, $P1270)
.annotate "line", 417
    store_lex "$past", $P1271
  if_1247_end:
.annotate "line", 415
    goto if_1215_end
  if_1215:
.annotate "line", 402
    .const 'Sub' $P1220 = "74_1259078889.1754" 
    capture_lex $P1220
    $P1220()
  if_1215_end:
.annotate "line", 448
    find_lex $P1282, "$/"
    find_lex $P1283, "$past"
    $P1284 = $P1282."!make"($P1283)
.annotate "line", 396
    .return ($P1284)
  control_1200:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1285, exception, "payload"
    .return ($P1285)
.end


.namespace ["NQP";"Actions"]
.sub "_block1219"  :anon :subid("74_1259078889.1754") :outer("73_1259078889.1754")
.annotate "line", 403
    new $P1221, "Hash"
    .lex "%h", $P1221
.annotate "line", 402
    find_lex $P1222, "%h"
.annotate "line", 404
    find_lex $P1224, "$/"
    unless_null $P1224, vivify_414
    new $P1224, "Hash"
  vivify_414:
    set $P1225, $P1224["sym"]
    unless_null $P1225, vivify_415
    new $P1225, "Undef"
  vivify_415:
    set $S1226, $P1225
    iseq $I1227, $S1226, "token"
    unless $I1227, if_1223_end
    new $P1228, "Integer"
    assign $P1228, 1
    find_lex $P1229, "%h"
    unless_null $P1229, vivify_416
    new $P1229, "Hash"
    store_lex "%h", $P1229
  vivify_416:
    set $P1229["r"], $P1228
  if_1223_end:
.annotate "line", 405
    find_lex $P1231, "$/"
    unless_null $P1231, vivify_417
    new $P1231, "Hash"
  vivify_417:
    set $P1232, $P1231["sym"]
    unless_null $P1232, vivify_418
    new $P1232, "Undef"
  vivify_418:
    set $S1233, $P1232
    iseq $I1234, $S1233, "rule"
    unless $I1234, if_1230_end
    new $P1235, "Integer"
    assign $P1235, 1
    find_lex $P1236, "%h"
    unless_null $P1236, vivify_419
    new $P1236, "Hash"
    store_lex "%h", $P1236
  vivify_419:
    set $P1236["r"], $P1235
    new $P1237, "Integer"
    assign $P1237, 1
    find_lex $P1238, "%h"
    unless_null $P1238, vivify_420
    new $P1238, "Hash"
    store_lex "%h", $P1238
  vivify_420:
    set $P1238["s"], $P1237
  if_1230_end:
.annotate "line", 406
    find_lex $P1239, "@MODIFIERS"
    find_lex $P1240, "%h"
    $P1239."unshift"($P1240)
.annotate "line", 407

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 411
    get_global $P1241, "@BLOCK"
    unless_null $P1241, vivify_421
    new $P1241, "ResizablePMCArray"
  vivify_421:
    set $P1242, $P1241[0]
    unless_null $P1242, vivify_422
    new $P1242, "Undef"
  vivify_422:
    $P1242."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 412
    get_global $P1243, "@BLOCK"
    unless_null $P1243, vivify_423
    new $P1243, "ResizablePMCArray"
  vivify_423:
    set $P1244, $P1243[0]
    unless_null $P1244, vivify_424
    new $P1244, "Undef"
  vivify_424:
    $P1244."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 413
    new $P1245, "Exception"
    set $P1245['type'], 58
    new $P1246, "Integer"
    assign $P1246, 0
    setattribute $P1245, 'payload', $P1246
    throw $P1245
.annotate "line", 402
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("75_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1289
.annotate "line", 452
    new $P1288, 'ExceptionHandler'
    set_addr $P1288, control_1287
    $P1288."handle_types"(58)
    push_eh $P1288
    .lex "self", self
    .lex "$/", param_1289
.annotate "line", 453
    new $P1290, "Undef"
    .lex "$past", $P1290
    find_lex $P1293, "$/"
    unless_null $P1293, vivify_425
    new $P1293, "Hash"
  vivify_425:
    set $P1294, $P1293["args"]
    unless_null $P1294, vivify_426
    new $P1294, "Undef"
  vivify_426:
    if $P1294, if_1292
    get_hll_global $P1299, ["PAST"], "Op"
    find_lex $P1300, "$/"
    $P1301 = $P1299."new"($P1300 :named("node"))
    set $P1291, $P1301
    goto if_1292_end
  if_1292:
    find_lex $P1295, "$/"
    unless_null $P1295, vivify_427
    new $P1295, "Hash"
  vivify_427:
    set $P1296, $P1295["args"]
    unless_null $P1296, vivify_428
    new $P1296, "ResizablePMCArray"
  vivify_428:
    set $P1297, $P1296[0]
    unless_null $P1297, vivify_429
    new $P1297, "Undef"
  vivify_429:
    $P1298 = $P1297."ast"()
    set $P1291, $P1298
  if_1292_end:
    store_lex "$past", $P1291
.annotate "line", 454
    find_lex $P1302, "$past"
    find_lex $P1305, "$/"
    unless_null $P1305, vivify_430
    new $P1305, "Hash"
  vivify_430:
    set $P1306, $P1305["quote"]
    unless_null $P1306, vivify_431
    new $P1306, "Undef"
  vivify_431:
    if $P1306, if_1304
    find_lex $P1310, "$/"
    unless_null $P1310, vivify_432
    new $P1310, "Hash"
  vivify_432:
    set $P1311, $P1310["longname"]
    unless_null $P1311, vivify_433
    new $P1311, "Undef"
  vivify_433:
    set $S1312, $P1311
    new $P1303, 'String'
    set $P1303, $S1312
    goto if_1304_end
  if_1304:
    find_lex $P1307, "$/"
    unless_null $P1307, vivify_434
    new $P1307, "Hash"
  vivify_434:
    set $P1308, $P1307["quote"]
    unless_null $P1308, vivify_435
    new $P1308, "Undef"
  vivify_435:
    $P1309 = $P1308."ast"()
    set $P1303, $P1309
  if_1304_end:
    $P1302."name"($P1303)
.annotate "line", 455
    find_lex $P1313, "$past"
    $P1313."pasttype"("callmethod")
.annotate "line", 456
    find_lex $P1314, "$/"
    find_lex $P1315, "$past"
    $P1316 = $P1314."!make"($P1315)
.annotate "line", 452
    .return ($P1316)
  control_1287:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1317, exception, "payload"
    .return ($P1317)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("76_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1321
.annotate "line", 461
    new $P1320, 'ExceptionHandler'
    set_addr $P1320, control_1319
    $P1320."handle_types"(58)
    push_eh $P1320
    .lex "self", self
    .lex "$/", param_1321
.annotate "line", 462
    find_lex $P1322, "$/"
    get_hll_global $P1323, ["PAST"], "Var"
    $P1324 = $P1323."new"("self" :named("name"))
    $P1325 = $P1322."!make"($P1324)
.annotate "line", 461
    .return ($P1325)
  control_1319:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1326, exception, "payload"
    .return ($P1326)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("77_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1330
.annotate "line", 465
    new $P1329, 'ExceptionHandler'
    set_addr $P1329, control_1328
    $P1329."handle_types"(58)
    push_eh $P1329
    .lex "self", self
    .lex "$/", param_1330
.annotate "line", 466
    new $P1331, "Undef"
    .lex "$past", $P1331
    find_lex $P1332, "$/"
    unless_null $P1332, vivify_436
    new $P1332, "Hash"
  vivify_436:
    set $P1333, $P1332["args"]
    unless_null $P1333, vivify_437
    new $P1333, "Undef"
  vivify_437:
    $P1334 = $P1333."ast"()
    store_lex "$past", $P1334
.annotate "line", 467
    find_lex $P1335, "$past"
    find_lex $P1336, "$/"
    unless_null $P1336, vivify_438
    new $P1336, "Hash"
  vivify_438:
    set $P1337, $P1336["identifier"]
    unless_null $P1337, vivify_439
    new $P1337, "Undef"
  vivify_439:
    set $S1338, $P1337
    $P1335."name"($S1338)
.annotate "line", 468
    find_lex $P1339, "$/"
    find_lex $P1340, "$past"
    $P1341 = $P1339."!make"($P1340)
.annotate "line", 465
    .return ($P1341)
  control_1328:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1342, exception, "payload"
    .return ($P1342)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("78_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1346
.annotate "line", 471
    new $P1345, 'ExceptionHandler'
    set_addr $P1345, control_1344
    $P1345."handle_types"(58)
    push_eh $P1345
    .lex "self", self
    .lex "$/", param_1346
.annotate "line", 472
    new $P1347, "ResizablePMCArray"
    .lex "@ns", $P1347
.annotate "line", 473
    new $P1348, "Undef"
    .lex "$name", $P1348
.annotate "line", 475
    new $P1349, "Undef"
    .lex "$var", $P1349
.annotate "line", 477
    new $P1350, "Undef"
    .lex "$past", $P1350
.annotate "line", 472
    find_lex $P1351, "$/"
    unless_null $P1351, vivify_440
    new $P1351, "Hash"
  vivify_440:
    set $P1352, $P1351["name"]
    unless_null $P1352, vivify_441
    new $P1352, "Hash"
  vivify_441:
    set $P1353, $P1352["identifier"]
    unless_null $P1353, vivify_442
    new $P1353, "Undef"
  vivify_442:
    clone $P1354, $P1353
    store_lex "@ns", $P1354
.annotate "line", 473
    find_lex $P1355, "@ns"
    $P1356 = $P1355."pop"()
    store_lex "$name", $P1356
.annotate "line", 474
    find_lex $P1360, "@ns"
    if $P1360, if_1359
    set $P1358, $P1360
    goto if_1359_end
  if_1359:
    find_lex $P1361, "@ns"
    unless_null $P1361, vivify_443
    new $P1361, "ResizablePMCArray"
  vivify_443:
    set $P1362, $P1361[0]
    unless_null $P1362, vivify_444
    new $P1362, "Undef"
  vivify_444:
    set $S1363, $P1362
    iseq $I1364, $S1363, "GLOBAL"
    new $P1358, 'Integer'
    set $P1358, $I1364
  if_1359_end:
    unless $P1358, if_1357_end
    find_lex $P1365, "@ns"
    $P1365."shift"()
  if_1357_end:
.annotate "line", 476
    get_hll_global $P1366, ["PAST"], "Var"
    find_lex $P1367, "$name"
    set $S1368, $P1367
    find_lex $P1369, "@ns"
    $P1370 = $P1366."new"($S1368 :named("name"), $P1369 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1370
.annotate "line", 477
    find_lex $P1371, "$var"
    store_lex "$past", $P1371
.annotate "line", 478
    find_lex $P1373, "$/"
    unless_null $P1373, vivify_445
    new $P1373, "Hash"
  vivify_445:
    set $P1374, $P1373["args"]
    unless_null $P1374, vivify_446
    new $P1374, "Undef"
  vivify_446:
    unless $P1374, if_1372_end
.annotate "line", 479
    find_lex $P1375, "$/"
    unless_null $P1375, vivify_447
    new $P1375, "Hash"
  vivify_447:
    set $P1376, $P1375["args"]
    unless_null $P1376, vivify_448
    new $P1376, "ResizablePMCArray"
  vivify_448:
    set $P1377, $P1376[0]
    unless_null $P1377, vivify_449
    new $P1377, "Undef"
  vivify_449:
    $P1378 = $P1377."ast"()
    store_lex "$past", $P1378
.annotate "line", 480
    find_lex $P1379, "$past"
    find_lex $P1380, "$var"
    $P1379."unshift"($P1380)
  if_1372_end:
.annotate "line", 482
    find_lex $P1381, "$/"
    find_lex $P1382, "$past"
    $P1383 = $P1381."!make"($P1382)
.annotate "line", 471
    .return ($P1383)
  control_1344:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1384, exception, "payload"
    .return ($P1384)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("79_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1388
.annotate "line", 485
    new $P1387, 'ExceptionHandler'
    set_addr $P1387, control_1386
    $P1387."handle_types"(58)
    push_eh $P1387
    .lex "self", self
    .lex "$/", param_1388
.annotate "line", 486
    new $P1389, "Undef"
    .lex "$past", $P1389
.annotate "line", 487
    new $P1390, "Undef"
    .lex "$pirop", $P1390
.annotate "line", 486
    find_lex $P1393, "$/"
    unless_null $P1393, vivify_450
    new $P1393, "Hash"
  vivify_450:
    set $P1394, $P1393["args"]
    unless_null $P1394, vivify_451
    new $P1394, "Undef"
  vivify_451:
    if $P1394, if_1392
    get_hll_global $P1399, ["PAST"], "Op"
    find_lex $P1400, "$/"
    $P1401 = $P1399."new"($P1400 :named("node"))
    set $P1391, $P1401
    goto if_1392_end
  if_1392:
    find_lex $P1395, "$/"
    unless_null $P1395, vivify_452
    new $P1395, "Hash"
  vivify_452:
    set $P1396, $P1395["args"]
    unless_null $P1396, vivify_453
    new $P1396, "ResizablePMCArray"
  vivify_453:
    set $P1397, $P1396[0]
    unless_null $P1397, vivify_454
    new $P1397, "Undef"
  vivify_454:
    $P1398 = $P1397."ast"()
    set $P1391, $P1398
  if_1392_end:
    store_lex "$past", $P1391
.annotate "line", 487
    find_lex $P1402, "$/"
    unless_null $P1402, vivify_455
    new $P1402, "Hash"
  vivify_455:
    set $P1403, $P1402["op"]
    unless_null $P1403, vivify_456
    new $P1403, "Undef"
  vivify_456:
    set $S1404, $P1403
    new $P1405, 'String'
    set $P1405, $S1404
    store_lex "$pirop", $P1405
.annotate "line", 488

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1406 = box $S0
    
    store_lex "$pirop", $P1406
.annotate "line", 495
    find_lex $P1407, "$past"
    find_lex $P1408, "$pirop"
    $P1407."pirop"($P1408)
.annotate "line", 496
    find_lex $P1409, "$past"
    $P1409."pasttype"("pirop")
.annotate "line", 497
    find_lex $P1410, "$/"
    find_lex $P1411, "$past"
    $P1412 = $P1410."!make"($P1411)
.annotate "line", 485
    .return ($P1412)
  control_1386:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1413, exception, "payload"
    .return ($P1413)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("80_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1417
.annotate "line", 500
    new $P1416, 'ExceptionHandler'
    set_addr $P1416, control_1415
    $P1416."handle_types"(58)
    push_eh $P1416
    .lex "self", self
    .lex "$/", param_1417
    find_lex $P1418, "$/"
    find_lex $P1419, "$/"
    unless_null $P1419, vivify_457
    new $P1419, "Hash"
  vivify_457:
    set $P1420, $P1419["arglist"]
    unless_null $P1420, vivify_458
    new $P1420, "Undef"
  vivify_458:
    $P1421 = $P1420."ast"()
    $P1422 = $P1418."!make"($P1421)
    .return ($P1422)
  control_1415:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1423, exception, "payload"
    .return ($P1423)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("81_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1427
.annotate "line", 502
    .const 'Sub' $P1438 = "82_1259078889.1754" 
    capture_lex $P1438
    new $P1426, 'ExceptionHandler'
    set_addr $P1426, control_1425
    $P1426."handle_types"(58)
    push_eh $P1426
    .lex "self", self
    .lex "$/", param_1427
.annotate "line", 503
    new $P1428, "Undef"
    .lex "$past", $P1428
.annotate "line", 511
    new $P1429, "Undef"
    .lex "$i", $P1429
.annotate "line", 512
    new $P1430, "Undef"
    .lex "$n", $P1430
.annotate "line", 503
    get_hll_global $P1431, ["PAST"], "Op"
    find_lex $P1432, "$/"
    $P1433 = $P1431."new"("call" :named("pasttype"), $P1432 :named("node"))
    store_lex "$past", $P1433
.annotate "line", 504
    find_lex $P1435, "$/"
    unless_null $P1435, vivify_459
    new $P1435, "Hash"
  vivify_459:
    set $P1436, $P1435["EXPR"]
    unless_null $P1436, vivify_460
    new $P1436, "Undef"
  vivify_460:
    unless $P1436, if_1434_end
    .const 'Sub' $P1438 = "82_1259078889.1754" 
    capture_lex $P1438
    $P1438()
  if_1434_end:
.annotate "line", 511
    new $P1470, "Integer"
    assign $P1470, 0
    store_lex "$i", $P1470
.annotate "line", 512
    find_lex $P1471, "$past"
    $P1472 = $P1471."list"()
    set $N1473, $P1472
    new $P1474, 'Float'
    set $P1474, $N1473
    store_lex "$n", $P1474
.annotate "line", 513
    new $P1502, 'ExceptionHandler'
    set_addr $P1502, loop1501_handler
    $P1502."handle_types"(65, 67, 66)
    push_eh $P1502
  loop1501_test:
    find_lex $P1475, "$i"
    set $N1476, $P1475
    find_lex $P1477, "$n"
    set $N1478, $P1477
    islt $I1479, $N1476, $N1478
    unless $I1479, loop1501_done
  loop1501_redo:
.annotate "line", 514
    find_lex $P1481, "$i"
    set $I1482, $P1481
    find_lex $P1483, "$past"
    unless_null $P1483, vivify_464
    new $P1483, "ResizablePMCArray"
  vivify_464:
    set $P1484, $P1483[$I1482]
    unless_null $P1484, vivify_465
    new $P1484, "Undef"
  vivify_465:
    $S1485 = $P1484."name"()
    iseq $I1486, $S1485, "&prefix:<|>"
    unless $I1486, if_1480_end
.annotate "line", 515
    find_lex $P1487, "$i"
    set $I1488, $P1487
    find_lex $P1489, "$past"
    unless_null $P1489, vivify_466
    new $P1489, "ResizablePMCArray"
  vivify_466:
    set $P1490, $P1489[$I1488]
    unless_null $P1490, vivify_467
    new $P1490, "ResizablePMCArray"
  vivify_467:
    set $P1491, $P1490[0]
    unless_null $P1491, vivify_468
    new $P1491, "Undef"
  vivify_468:
    find_lex $P1492, "$i"
    set $I1493, $P1492
    find_lex $P1494, "$past"
    unless_null $P1494, vivify_469
    new $P1494, "ResizablePMCArray"
    store_lex "$past", $P1494
  vivify_469:
    set $P1494[$I1493], $P1491
.annotate "line", 516
    find_lex $P1495, "$i"
    set $I1496, $P1495
    find_lex $P1497, "$past"
    unless_null $P1497, vivify_470
    new $P1497, "ResizablePMCArray"
  vivify_470:
    set $P1498, $P1497[$I1496]
    unless_null $P1498, vivify_471
    new $P1498, "Undef"
  vivify_471:
    $P1498."flat"(1)
  if_1480_end:
.annotate "line", 514
    find_lex $P1499, "$i"
    clone $P1500, $P1499
    inc $P1499
  loop1501_next:
.annotate "line", 513
    goto loop1501_test
  loop1501_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1503, exception, 'type'
    eq $P1503, 65, loop1501_next
    eq $P1503, 67, loop1501_redo
  loop1501_done:
    pop_eh 
.annotate "line", 520
    find_lex $P1504, "$/"
    find_lex $P1505, "$past"
    $P1506 = $P1504."!make"($P1505)
.annotate "line", 502
    .return ($P1506)
  control_1425:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1507, exception, "payload"
    .return ($P1507)
.end


.namespace ["NQP";"Actions"]
.sub "_block1437"  :anon :subid("82_1259078889.1754") :outer("81_1259078889.1754")
.annotate "line", 504
    .const 'Sub' $P1459 = "83_1259078889.1754" 
    capture_lex $P1459
.annotate "line", 505
    new $P1439, "Undef"
    .lex "$expr", $P1439
    find_lex $P1440, "$/"
    unless_null $P1440, vivify_461
    new $P1440, "Hash"
  vivify_461:
    set $P1441, $P1440["EXPR"]
    unless_null $P1441, vivify_462
    new $P1441, "Undef"
  vivify_462:
    $P1442 = $P1441."ast"()
    store_lex "$expr", $P1442
.annotate "line", 506
    find_lex $P1447, "$expr"
    $S1448 = $P1447."name"()
    iseq $I1449, $S1448, "&infix:<,>"
    if $I1449, if_1446
    new $P1445, 'Integer'
    set $P1445, $I1449
    goto if_1446_end
  if_1446:
    find_lex $P1450, "$expr"
    $P1451 = $P1450."named"()
    isfalse $I1452, $P1451
    new $P1445, 'Integer'
    set $P1445, $I1452
  if_1446_end:
    if $P1445, if_1444
.annotate "line", 509
    find_lex $P1467, "$past"
    find_lex $P1468, "$expr"
    $P1469 = $P1467."push"($P1468)
    set $P1443, $P1469
.annotate "line", 506
    goto if_1444_end
  if_1444:
.annotate "line", 507
    find_lex $P1454, "$expr"
    $P1455 = $P1454."list"()
    defined $I1456, $P1455
    unless $I1456, for_undef_463
    iter $P1453, $P1455
    new $P1465, 'ExceptionHandler'
    set_addr $P1465, loop1464_handler
    $P1465."handle_types"(65, 67, 66)
    push_eh $P1465
  loop1464_test:
    unless $P1453, loop1464_done
    shift $P1457, $P1453
  loop1464_redo:
    .const 'Sub' $P1459 = "83_1259078889.1754" 
    capture_lex $P1459
    $P1459($P1457)
  loop1464_next:
    goto loop1464_test
  loop1464_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1466, exception, 'type'
    eq $P1466, 65, loop1464_next
    eq $P1466, 67, loop1464_redo
  loop1464_done:
    pop_eh 
  for_undef_463:
.annotate "line", 506
    set $P1443, $P1453
  if_1444_end:
.annotate "line", 504
    .return ($P1443)
.end


.namespace ["NQP";"Actions"]
.sub "_block1458"  :anon :subid("83_1259078889.1754") :outer("82_1259078889.1754")
    .param pmc param_1460
.annotate "line", 507
    .lex "$_", param_1460
    find_lex $P1461, "$past"
    find_lex $P1462, "$_"
    $P1463 = $P1461."push"($P1462)
    .return ($P1463)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("84_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1511
.annotate "line", 524
    new $P1510, 'ExceptionHandler'
    set_addr $P1510, control_1509
    $P1510."handle_types"(58)
    push_eh $P1510
    .lex "self", self
    .lex "$/", param_1511
    find_lex $P1512, "$/"
    find_lex $P1513, "$/"
    unless_null $P1513, vivify_472
    new $P1513, "Hash"
  vivify_472:
    set $P1514, $P1513["value"]
    unless_null $P1514, vivify_473
    new $P1514, "Undef"
  vivify_473:
    $P1515 = $P1514."ast"()
    $P1516 = $P1512."!make"($P1515)
    .return ($P1516)
  control_1509:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1517, exception, "payload"
    .return ($P1517)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("85_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1521
.annotate "line", 526
    new $P1520, 'ExceptionHandler'
    set_addr $P1520, control_1519
    $P1520."handle_types"(58)
    push_eh $P1520
    .lex "self", self
    .lex "$/", param_1521
.annotate "line", 527
    find_lex $P1522, "$/"
.annotate "line", 528
    find_lex $P1525, "$/"
    unless_null $P1525, vivify_474
    new $P1525, "Hash"
  vivify_474:
    set $P1526, $P1525["EXPR"]
    unless_null $P1526, vivify_475
    new $P1526, "Undef"
  vivify_475:
    if $P1526, if_1524
.annotate "line", 529
    get_hll_global $P1531, ["PAST"], "Op"
    find_lex $P1532, "$/"
    $P1533 = $P1531."new"("list" :named("pasttype"), $P1532 :named("node"))
    set $P1523, $P1533
.annotate "line", 528
    goto if_1524_end
  if_1524:
    find_lex $P1527, "$/"
    unless_null $P1527, vivify_476
    new $P1527, "Hash"
  vivify_476:
    set $P1528, $P1527["EXPR"]
    unless_null $P1528, vivify_477
    new $P1528, "ResizablePMCArray"
  vivify_477:
    set $P1529, $P1528[0]
    unless_null $P1529, vivify_478
    new $P1529, "Undef"
  vivify_478:
    $P1530 = $P1529."ast"()
    set $P1523, $P1530
  if_1524_end:
    $P1534 = $P1522."!make"($P1523)
.annotate "line", 526
    .return ($P1534)
  control_1519:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1535, exception, "payload"
    .return ($P1535)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("86_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1539
.annotate "line", 532
    new $P1538, 'ExceptionHandler'
    set_addr $P1538, control_1537
    $P1538."handle_types"(58)
    push_eh $P1538
    .lex "self", self
    .lex "$/", param_1539
.annotate "line", 533
    new $P1540, "Undef"
    .lex "$past", $P1540
.annotate "line", 532
    find_lex $P1541, "$past"
.annotate "line", 534
    find_lex $P1543, "$/"
    unless_null $P1543, vivify_479
    new $P1543, "Hash"
  vivify_479:
    set $P1544, $P1543["EXPR"]
    unless_null $P1544, vivify_480
    new $P1544, "Undef"
  vivify_480:
    if $P1544, if_1542
.annotate "line", 541
    get_hll_global $P1556, ["PAST"], "Op"
    $P1557 = $P1556."new"("list" :named("pasttype"))
    store_lex "$past", $P1557
.annotate "line", 540
    goto if_1542_end
  if_1542:
.annotate "line", 535
    find_lex $P1545, "$/"
    unless_null $P1545, vivify_481
    new $P1545, "Hash"
  vivify_481:
    set $P1546, $P1545["EXPR"]
    unless_null $P1546, vivify_482
    new $P1546, "ResizablePMCArray"
  vivify_482:
    set $P1547, $P1546[0]
    unless_null $P1547, vivify_483
    new $P1547, "Undef"
  vivify_483:
    $P1548 = $P1547."ast"()
    store_lex "$past", $P1548
.annotate "line", 536
    find_lex $P1550, "$past"
    $S1551 = $P1550."name"()
    isne $I1552, $S1551, "&infix:<,>"
    unless $I1552, if_1549_end
.annotate "line", 537
    get_hll_global $P1553, ["PAST"], "Op"
    find_lex $P1554, "$past"
    $P1555 = $P1553."new"($P1554, "list" :named("pasttype"))
    store_lex "$past", $P1555
  if_1549_end:
  if_1542_end:
.annotate "line", 543
    find_lex $P1558, "$past"
    $P1558."name"("&circumfix:<[ ]>")
.annotate "line", 544
    find_lex $P1559, "$/"
    find_lex $P1560, "$past"
    $P1561 = $P1559."!make"($P1560)
.annotate "line", 532
    .return ($P1561)
  control_1537:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1562, exception, "payload"
    .return ($P1562)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("87_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1566
.annotate "line", 547
    new $P1565, 'ExceptionHandler'
    set_addr $P1565, control_1564
    $P1565."handle_types"(58)
    push_eh $P1565
    .lex "self", self
    .lex "$/", param_1566
    find_lex $P1567, "$/"
    find_lex $P1568, "$/"
    unless_null $P1568, vivify_484
    new $P1568, "Hash"
  vivify_484:
    set $P1569, $P1568["quote_EXPR"]
    unless_null $P1569, vivify_485
    new $P1569, "Undef"
  vivify_485:
    $P1570 = $P1569."ast"()
    $P1571 = $P1567."!make"($P1570)
    .return ($P1571)
  control_1564:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1572, exception, "payload"
    .return ($P1572)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("88_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1576
.annotate "line", 549
    new $P1575, 'ExceptionHandler'
    set_addr $P1575, control_1574
    $P1575."handle_types"(58)
    push_eh $P1575
    .lex "self", self
    .lex "$/", param_1576
.annotate "line", 550
    find_lex $P1577, "$/"
    find_lex $P1580, "$/"
    unless_null $P1580, vivify_486
    new $P1580, "Hash"
  vivify_486:
    set $P1581, $P1580["pblock"]
    unless_null $P1581, vivify_487
    new $P1581, "Hash"
  vivify_487:
    set $P1582, $P1581["blockoid"]
    unless_null $P1582, vivify_488
    new $P1582, "Hash"
  vivify_488:
    set $P1583, $P1582["statementlist"]
    unless_null $P1583, vivify_489
    new $P1583, "Hash"
  vivify_489:
    set $P1584, $P1583["statement"]
    unless_null $P1584, vivify_490
    new $P1584, "Undef"
  vivify_490:
    set $N1585, $P1584
    new $P1586, "Integer"
    assign $P1586, 0
    set $N1587, $P1586
    isgt $I1588, $N1585, $N1587
    if $I1588, if_1579
.annotate "line", 552
    get_hll_global $P1592, ["PAST"], "Op"
    find_lex $P1593, "$/"
    $P1594 = $P1592."new"("    %r = new [\"Hash\"]" :named("inline"), $P1593 :named("node"))
    set $P1578, $P1594
.annotate "line", 550
    goto if_1579_end
  if_1579:
.annotate "line", 551
    find_lex $P1589, "$/"
    unless_null $P1589, vivify_491
    new $P1589, "Hash"
  vivify_491:
    set $P1590, $P1589["pblock"]
    unless_null $P1590, vivify_492
    new $P1590, "Undef"
  vivify_492:
    $P1591 = $P1590."ast"()
    set $P1578, $P1591
  if_1579_end:
    $P1595 = $P1577."!make"($P1578)
.annotate "line", 549
    .return ($P1595)
  control_1574:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1596, exception, "payload"
    .return ($P1596)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("89_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1600
.annotate "line", 555
    new $P1599, 'ExceptionHandler'
    set_addr $P1599, control_1598
    $P1599."handle_types"(58)
    push_eh $P1599
    .lex "self", self
    .lex "$/", param_1600
.annotate "line", 556
    new $P1601, "Undef"
    .lex "$name", $P1601
    find_lex $P1604, "$/"
    unless_null $P1604, vivify_493
    new $P1604, "Hash"
  vivify_493:
    set $P1605, $P1604["sigil"]
    unless_null $P1605, vivify_494
    new $P1605, "Undef"
  vivify_494:
    set $S1606, $P1605
    iseq $I1607, $S1606, "@"
    if $I1607, if_1603
.annotate "line", 557
    find_lex $P1611, "$/"
    unless_null $P1611, vivify_495
    new $P1611, "Hash"
  vivify_495:
    set $P1612, $P1611["sigil"]
    unless_null $P1612, vivify_496
    new $P1612, "Undef"
  vivify_496:
    set $S1613, $P1612
    iseq $I1614, $S1613, "%"
    if $I1614, if_1610
    new $P1616, "String"
    assign $P1616, "item"
    set $P1609, $P1616
    goto if_1610_end
  if_1610:
    new $P1615, "String"
    assign $P1615, "hash"
    set $P1609, $P1615
  if_1610_end:
    set $P1602, $P1609
.annotate "line", 556
    goto if_1603_end
  if_1603:
    new $P1608, "String"
    assign $P1608, "list"
    set $P1602, $P1608
  if_1603_end:
    store_lex "$name", $P1602
.annotate "line", 559
    find_lex $P1617, "$/"
    get_hll_global $P1618, ["PAST"], "Op"
    find_lex $P1619, "$name"
    find_lex $P1620, "$/"
    unless_null $P1620, vivify_497
    new $P1620, "Hash"
  vivify_497:
    set $P1621, $P1620["semilist"]
    unless_null $P1621, vivify_498
    new $P1621, "Undef"
  vivify_498:
    $P1622 = $P1621."ast"()
    $P1623 = $P1618."new"($P1622, "callmethod" :named("pasttype"), $P1619 :named("name"))
    $P1624 = $P1617."!make"($P1623)
.annotate "line", 555
    .return ($P1624)
  control_1598:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1625, exception, "payload"
    .return ($P1625)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("90_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1629
.annotate "line", 562
    new $P1628, 'ExceptionHandler'
    set_addr $P1628, control_1627
    $P1628."handle_types"(58)
    push_eh $P1628
    .lex "self", self
    .lex "$/", param_1629
    find_lex $P1630, "$/"
    find_lex $P1631, "$/"
    unless_null $P1631, vivify_499
    new $P1631, "Hash"
  vivify_499:
    set $P1632, $P1631["statement"]
    unless_null $P1632, vivify_500
    new $P1632, "Undef"
  vivify_500:
    $P1633 = $P1632."ast"()
    $P1634 = $P1630."!make"($P1633)
    .return ($P1634)
  control_1627:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1635, exception, "payload"
    .return ($P1635)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("91_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1639
.annotate "line", 564
    new $P1638, 'ExceptionHandler'
    set_addr $P1638, control_1637
    $P1638."handle_types"(58)
    push_eh $P1638
    .lex "self", self
    .lex "$/", param_1639
.annotate "line", 565
    find_lex $P1640, "$/"
    get_hll_global $P1641, ["PAST"], "Var"
    find_lex $P1642, "$/"
    unless_null $P1642, vivify_501
    new $P1642, "Hash"
  vivify_501:
    set $P1643, $P1642["EXPR"]
    unless_null $P1643, vivify_502
    new $P1643, "Undef"
  vivify_502:
    $P1644 = $P1643."ast"()
    $P1645 = $P1641."new"($P1644, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1646 = $P1640."!make"($P1645)
.annotate "line", 564
    .return ($P1646)
  control_1637:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1647, exception, "payload"
    .return ($P1647)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("92_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1651
.annotate "line", 570
    new $P1650, 'ExceptionHandler'
    set_addr $P1650, control_1649
    $P1650."handle_types"(58)
    push_eh $P1650
    .lex "self", self
    .lex "$/", param_1651
.annotate "line", 571
    find_lex $P1652, "$/"
    get_hll_global $P1653, ["PAST"], "Var"
    find_lex $P1654, "$/"
    unless_null $P1654, vivify_503
    new $P1654, "Hash"
  vivify_503:
    set $P1655, $P1654["EXPR"]
    unless_null $P1655, vivify_504
    new $P1655, "Undef"
  vivify_504:
    $P1656 = $P1655."ast"()
    $P1657 = $P1653."new"($P1656, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1658 = $P1652."!make"($P1657)
.annotate "line", 570
    .return ($P1658)
  control_1649:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1659, exception, "payload"
    .return ($P1659)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("93_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1663
.annotate "line", 576
    new $P1662, 'ExceptionHandler'
    set_addr $P1662, control_1661
    $P1662."handle_types"(58)
    push_eh $P1662
    .lex "self", self
    .lex "$/", param_1663
.annotate "line", 577
    find_lex $P1664, "$/"
    get_hll_global $P1665, ["PAST"], "Var"
    find_lex $P1666, "$/"
    unless_null $P1666, vivify_505
    new $P1666, "Hash"
  vivify_505:
    set $P1667, $P1666["quote_EXPR"]
    unless_null $P1667, vivify_506
    new $P1667, "Undef"
  vivify_506:
    $P1668 = $P1667."ast"()
    $P1669 = $P1665."new"($P1668, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1670 = $P1664."!make"($P1669)
.annotate "line", 576
    .return ($P1670)
  control_1661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1671, exception, "payload"
    .return ($P1671)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("94_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1675
.annotate "line", 582
    new $P1674, 'ExceptionHandler'
    set_addr $P1674, control_1673
    $P1674."handle_types"(58)
    push_eh $P1674
    .lex "self", self
    .lex "$/", param_1675
.annotate "line", 583
    find_lex $P1676, "$/"
    find_lex $P1677, "$/"
    unless_null $P1677, vivify_507
    new $P1677, "Hash"
  vivify_507:
    set $P1678, $P1677["arglist"]
    unless_null $P1678, vivify_508
    new $P1678, "Undef"
  vivify_508:
    $P1679 = $P1678."ast"()
    $P1680 = $P1676."!make"($P1679)
.annotate "line", 582
    .return ($P1680)
  control_1673:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1681, exception, "payload"
    .return ($P1681)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("95_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1685
.annotate "line", 586
    new $P1684, 'ExceptionHandler'
    set_addr $P1684, control_1683
    $P1684."handle_types"(58)
    push_eh $P1684
    .lex "self", self
    .lex "$/", param_1685
.annotate "line", 587
    find_lex $P1686, "$/"
    find_lex $P1689, "$/"
    unless_null $P1689, vivify_509
    new $P1689, "Hash"
  vivify_509:
    set $P1690, $P1689["quote"]
    unless_null $P1690, vivify_510
    new $P1690, "Undef"
  vivify_510:
    if $P1690, if_1688
    find_lex $P1694, "$/"
    unless_null $P1694, vivify_511
    new $P1694, "Hash"
  vivify_511:
    set $P1695, $P1694["number"]
    unless_null $P1695, vivify_512
    new $P1695, "Undef"
  vivify_512:
    $P1696 = $P1695."ast"()
    set $P1687, $P1696
    goto if_1688_end
  if_1688:
    find_lex $P1691, "$/"
    unless_null $P1691, vivify_513
    new $P1691, "Hash"
  vivify_513:
    set $P1692, $P1691["quote"]
    unless_null $P1692, vivify_514
    new $P1692, "Undef"
  vivify_514:
    $P1693 = $P1692."ast"()
    set $P1687, $P1693
  if_1688_end:
    $P1697 = $P1686."!make"($P1687)
.annotate "line", 586
    .return ($P1697)
  control_1683:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1698, exception, "payload"
    .return ($P1698)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("96_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1702
.annotate "line", 590
    new $P1701, 'ExceptionHandler'
    set_addr $P1701, control_1700
    $P1701."handle_types"(58)
    push_eh $P1701
    .lex "self", self
    .lex "$/", param_1702
.annotate "line", 591
    new $P1703, "Undef"
    .lex "$value", $P1703
    find_lex $P1706, "$/"
    unless_null $P1706, vivify_515
    new $P1706, "Hash"
  vivify_515:
    set $P1707, $P1706["dec_number"]
    unless_null $P1707, vivify_516
    new $P1707, "Undef"
  vivify_516:
    if $P1707, if_1705
    find_lex $P1711, "$/"
    unless_null $P1711, vivify_517
    new $P1711, "Hash"
  vivify_517:
    set $P1712, $P1711["integer"]
    unless_null $P1712, vivify_518
    new $P1712, "Undef"
  vivify_518:
    $P1713 = $P1712."ast"()
    set $P1704, $P1713
    goto if_1705_end
  if_1705:
    find_lex $P1708, "$/"
    unless_null $P1708, vivify_519
    new $P1708, "Hash"
  vivify_519:
    set $P1709, $P1708["dec_number"]
    unless_null $P1709, vivify_520
    new $P1709, "Undef"
  vivify_520:
    $P1710 = $P1709."ast"()
    set $P1704, $P1710
  if_1705_end:
    store_lex "$value", $P1704
.annotate "line", 592
    find_lex $P1715, "$/"
    unless_null $P1715, vivify_521
    new $P1715, "Hash"
  vivify_521:
    set $P1716, $P1715["sign"]
    unless_null $P1716, vivify_522
    new $P1716, "Undef"
  vivify_522:
    set $S1717, $P1716
    iseq $I1718, $S1717, "-"
    unless $I1718, if_1714_end
    find_lex $P1719, "$value"
    neg $P1720, $P1719
    store_lex "$value", $P1720
  if_1714_end:
.annotate "line", 593
    find_lex $P1721, "$/"
    get_hll_global $P1722, ["PAST"], "Val"
    find_lex $P1723, "$value"
    $P1724 = $P1722."new"($P1723 :named("value"))
    $P1725 = $P1721."!make"($P1724)
.annotate "line", 590
    .return ($P1725)
  control_1700:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1726, exception, "payload"
    .return ($P1726)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("97_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1730
.annotate "line", 596
    new $P1729, 'ExceptionHandler'
    set_addr $P1729, control_1728
    $P1729."handle_types"(58)
    push_eh $P1729
    .lex "self", self
    .lex "$/", param_1730
    find_lex $P1731, "$/"
    find_lex $P1732, "$/"
    unless_null $P1732, vivify_523
    new $P1732, "Hash"
  vivify_523:
    set $P1733, $P1732["quote_EXPR"]
    unless_null $P1733, vivify_524
    new $P1733, "Undef"
  vivify_524:
    $P1734 = $P1733."ast"()
    $P1735 = $P1731."!make"($P1734)
    .return ($P1735)
  control_1728:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1736, exception, "payload"
    .return ($P1736)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("98_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1740
.annotate "line", 597
    new $P1739, 'ExceptionHandler'
    set_addr $P1739, control_1738
    $P1739."handle_types"(58)
    push_eh $P1739
    .lex "self", self
    .lex "$/", param_1740
    find_lex $P1741, "$/"
    find_lex $P1742, "$/"
    unless_null $P1742, vivify_525
    new $P1742, "Hash"
  vivify_525:
    set $P1743, $P1742["quote_EXPR"]
    unless_null $P1743, vivify_526
    new $P1743, "Undef"
  vivify_526:
    $P1744 = $P1743."ast"()
    $P1745 = $P1741."!make"($P1744)
    .return ($P1745)
  control_1738:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1746, exception, "payload"
    .return ($P1746)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("99_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1750
.annotate "line", 598
    new $P1749, 'ExceptionHandler'
    set_addr $P1749, control_1748
    $P1749."handle_types"(58)
    push_eh $P1749
    .lex "self", self
    .lex "$/", param_1750
    find_lex $P1751, "$/"
    find_lex $P1752, "$/"
    unless_null $P1752, vivify_527
    new $P1752, "Hash"
  vivify_527:
    set $P1753, $P1752["quote_EXPR"]
    unless_null $P1753, vivify_528
    new $P1753, "Undef"
  vivify_528:
    $P1754 = $P1753."ast"()
    $P1755 = $P1751."!make"($P1754)
    .return ($P1755)
  control_1748:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1756, exception, "payload"
    .return ($P1756)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("100_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1760
.annotate "line", 599
    new $P1759, 'ExceptionHandler'
    set_addr $P1759, control_1758
    $P1759."handle_types"(58)
    push_eh $P1759
    .lex "self", self
    .lex "$/", param_1760
    find_lex $P1761, "$/"
    find_lex $P1762, "$/"
    unless_null $P1762, vivify_529
    new $P1762, "Hash"
  vivify_529:
    set $P1763, $P1762["quote_EXPR"]
    unless_null $P1763, vivify_530
    new $P1763, "Undef"
  vivify_530:
    $P1764 = $P1763."ast"()
    $P1765 = $P1761."!make"($P1764)
    .return ($P1765)
  control_1758:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1766, exception, "payload"
    .return ($P1766)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("101_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1770
.annotate "line", 600
    new $P1769, 'ExceptionHandler'
    set_addr $P1769, control_1768
    $P1769."handle_types"(58)
    push_eh $P1769
    .lex "self", self
    .lex "$/", param_1770
    find_lex $P1771, "$/"
    find_lex $P1772, "$/"
    unless_null $P1772, vivify_531
    new $P1772, "Hash"
  vivify_531:
    set $P1773, $P1772["quote_EXPR"]
    unless_null $P1773, vivify_532
    new $P1773, "Undef"
  vivify_532:
    $P1774 = $P1773."ast"()
    $P1775 = $P1771."!make"($P1774)
    .return ($P1775)
  control_1768:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1776, exception, "payload"
    .return ($P1776)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("102_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1780
.annotate "line", 601
    new $P1779, 'ExceptionHandler'
    set_addr $P1779, control_1778
    $P1779."handle_types"(58)
    push_eh $P1779
    .lex "self", self
    .lex "$/", param_1780
.annotate "line", 602
    find_lex $P1781, "$/"
    get_hll_global $P1782, ["PAST"], "Op"
    find_lex $P1783, "$/"
    unless_null $P1783, vivify_533
    new $P1783, "Hash"
  vivify_533:
    set $P1784, $P1783["quote_EXPR"]
    unless_null $P1784, vivify_534
    new $P1784, "Undef"
  vivify_534:
    $P1785 = $P1784."ast"()
    $P1786 = $P1785."value"()
    find_lex $P1787, "$/"
    $P1788 = $P1782."new"($P1786 :named("inline"), "inline" :named("pasttype"), $P1787 :named("node"))
    $P1789 = $P1781."!make"($P1788)
.annotate "line", 601
    .return ($P1789)
  control_1778:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1790, exception, "payload"
    .return ($P1790)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("103_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1794
.annotate "line", 607
    new $P1793, 'ExceptionHandler'
    set_addr $P1793, control_1792
    $P1793."handle_types"(58)
    push_eh $P1793
    .lex "self", self
    .lex "$/", param_1794
    find_lex $P1795, "$/"
    find_lex $P1796, "$/"
    unless_null $P1796, vivify_535
    new $P1796, "Hash"
  vivify_535:
    set $P1797, $P1796["variable"]
    unless_null $P1797, vivify_536
    new $P1797, "Undef"
  vivify_536:
    $P1798 = $P1797."ast"()
    $P1799 = $P1795."!make"($P1798)
    .return ($P1799)
  control_1792:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1800, exception, "payload"
    .return ($P1800)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("104_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1804
.annotate "line", 608
    new $P1803, 'ExceptionHandler'
    set_addr $P1803, control_1802
    $P1803."handle_types"(58)
    push_eh $P1803
    .lex "self", self
    .lex "$/", param_1804
.annotate "line", 609
    find_lex $P1805, "$/"
    get_hll_global $P1806, ["PAST"], "Op"
.annotate "line", 610
    find_lex $P1807, "$/"
    unless_null $P1807, vivify_537
    new $P1807, "Hash"
  vivify_537:
    set $P1808, $P1807["block"]
    unless_null $P1808, vivify_538
    new $P1808, "Undef"
  vivify_538:
    $P1809 = $P1808."ast"()
    $P1810 = "block_immediate"($P1809)
    find_lex $P1811, "$/"
    $P1812 = $P1806."new"($P1810, "set S*" :named("pirop"), $P1811 :named("node"))
.annotate "line", 609
    $P1813 = $P1805."!make"($P1812)
.annotate "line", 608
    .return ($P1813)
  control_1802:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1814, exception, "payload"
    .return ($P1814)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("105_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1818
.annotate "line", 616
    new $P1817, 'ExceptionHandler'
    set_addr $P1817, control_1816
    $P1817."handle_types"(58)
    push_eh $P1817
    .lex "self", self
    .lex "$/", param_1818
    find_lex $P1819, "$/"
    find_lex $P1820, "$/"
    unless_null $P1820, vivify_539
    new $P1820, "Hash"
  vivify_539:
    set $P1821, $P1820["dotty"]
    unless_null $P1821, vivify_540
    new $P1821, "Undef"
  vivify_540:
    $P1822 = $P1821."ast"()
    $P1823 = $P1819."!make"($P1822)
    .return ($P1823)
  control_1816:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1824, exception, "payload"
    .return ($P1824)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("106_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1828
.annotate "line", 618
    new $P1827, 'ExceptionHandler'
    set_addr $P1827, control_1826
    $P1827."handle_types"(58)
    push_eh $P1827
    .lex "self", self
    .lex "$/", param_1828
.annotate "line", 619
    find_lex $P1829, "$/"
    get_hll_global $P1830, ["PAST"], "Op"
.annotate "line", 620
    new $P1831, "ResizablePMCArray"
    push $P1831, "    clone %r, %0"
    push $P1831, "    inc %0"
    $P1832 = $P1830."new"("postfix:<++>" :named("name"), $P1831 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 619
    $P1833 = $P1829."!make"($P1832)
.annotate "line", 618
    .return ($P1833)
  control_1826:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1834, exception, "payload"
    .return ($P1834)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("107_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1838
.annotate "line", 624
    new $P1837, 'ExceptionHandler'
    set_addr $P1837, control_1836
    $P1837."handle_types"(58)
    push_eh $P1837
    .lex "self", self
    .lex "$/", param_1838
.annotate "line", 625
    find_lex $P1839, "$/"
    get_hll_global $P1840, ["PAST"], "Op"
.annotate "line", 626
    new $P1841, "ResizablePMCArray"
    push $P1841, "    clone %r, %0"
    push $P1841, "    dec %0"
    $P1842 = $P1840."new"("postfix:<-->" :named("name"), $P1841 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 625
    $P1843 = $P1839."!make"($P1842)
.annotate "line", 624
    .return ($P1843)
  control_1836:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1844, exception, "payload"
    .return ($P1844)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("108_1259078889.1754") :method :outer("11_1259078889.1754")
    .param pmc param_1848
.annotate "line", 630
    new $P1847, 'ExceptionHandler'
    set_addr $P1847, control_1846
    $P1847."handle_types"(58)
    push_eh $P1847
    .lex "self", self
    .lex "$/", param_1848
.annotate "line", 631
    find_lex $P1849, "$/"
    get_hll_global $P1850, ["PAST"], "Op"
.annotate "line", 632
    get_hll_global $P1851, ["PAST"], "Var"
    $P1852 = $P1851."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P1853, "$/"
    $P1854 = $P1850."new"($P1852, "callmethod" :named("pasttype"), "!make" :named("name"), $P1853 :named("node"))
.annotate "line", 631
    $P1855 = $P1849."!make"($P1854)
.annotate "line", 630
    .return ($P1855)
  control_1846:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1856, exception, "payload"
    .return ($P1856)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1857"  :subid("109_1259078889.1754") :outer("11_1259078889.1754")
.annotate "line", 640
    .const 'Sub' $P1893 = "113_1259078889.1754" 
    capture_lex $P1893
    .const 'Sub' $P1883 = "112_1259078889.1754" 
    capture_lex $P1883
    .const 'Sub' $P1873 = "111_1259078889.1754" 
    capture_lex $P1873
    .const 'Sub' $P1859 = "110_1259078889.1754" 
    capture_lex $P1859
.annotate "line", 651
    .const 'Sub' $P1893 = "113_1259078889.1754" 
    capture_lex $P1893
.annotate "line", 640
    .return ($P1893)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("110_1259078889.1754") :method :outer("109_1259078889.1754")
    .param pmc param_1862
.annotate "line", 642
    new $P1861, 'ExceptionHandler'
    set_addr $P1861, control_1860
    $P1861."handle_types"(58)
    push_eh $P1861
    .lex "self", self
    .lex "$/", param_1862
.annotate "line", 643
    new $P1863, "Undef"
    .lex "$past", $P1863
    find_lex $P1864, "$/"
    unless_null $P1864, vivify_541
    new $P1864, "Hash"
  vivify_541:
    set $P1865, $P1864["statement"]
    unless_null $P1865, vivify_542
    new $P1865, "Undef"
  vivify_542:
    $P1866 = $P1865."ast"()
    store_lex "$past", $P1866
.annotate "line", 644
    find_lex $P1867, "$/"
    get_hll_global $P1868, ["PAST"], "Regex"
    find_lex $P1869, "$past"
    $P1870 = $P1868."new"($P1869, "pastnode" :named("pasttype"))
    $P1871 = $P1867."!make"($P1870)
.annotate "line", 642
    .return ($P1871)
  control_1860:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1872, exception, "payload"
    .return ($P1872)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("111_1259078889.1754") :method :outer("109_1259078889.1754")
    .param pmc param_1876
.annotate "line", 647
    new $P1875, 'ExceptionHandler'
    set_addr $P1875, control_1874
    $P1875."handle_types"(58)
    push_eh $P1875
    .lex "self", self
    .lex "$/", param_1876
    find_lex $P1877, "$/"
    find_lex $P1878, "$/"
    unless_null $P1878, vivify_543
    new $P1878, "Hash"
  vivify_543:
    set $P1879, $P1878["codeblock"]
    unless_null $P1879, vivify_544
    new $P1879, "Undef"
  vivify_544:
    $P1880 = $P1879."ast"()
    $P1881 = $P1877."!make"($P1880)
    .return ($P1881)
  control_1874:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1882, exception, "payload"
    .return ($P1882)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("112_1259078889.1754") :method :outer("109_1259078889.1754")
    .param pmc param_1886
.annotate "line", 649
    new $P1885, 'ExceptionHandler'
    set_addr $P1885, control_1884
    $P1885."handle_types"(58)
    push_eh $P1885
    .lex "self", self
    .lex "$/", param_1886
    find_lex $P1887, "$/"
    find_lex $P1888, "$/"
    unless_null $P1888, vivify_545
    new $P1888, "Hash"
  vivify_545:
    set $P1889, $P1888["codeblock"]
    unless_null $P1889, vivify_546
    new $P1889, "Undef"
  vivify_546:
    $P1890 = $P1889."ast"()
    $P1891 = $P1887."!make"($P1890)
    .return ($P1891)
  control_1884:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1892, exception, "payload"
    .return ($P1892)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("113_1259078889.1754") :method :outer("109_1259078889.1754")
    .param pmc param_1896
.annotate "line", 651
    new $P1895, 'ExceptionHandler'
    set_addr $P1895, control_1894
    $P1895."handle_types"(58)
    push_eh $P1895
    .lex "self", self
    .lex "$/", param_1896
.annotate "line", 652
    new $P1897, "Undef"
    .lex "$block", $P1897
.annotate "line", 654
    new $P1898, "Undef"
    .lex "$past", $P1898
.annotate "line", 652
    find_lex $P1899, "$/"
    unless_null $P1899, vivify_547
    new $P1899, "Hash"
  vivify_547:
    set $P1900, $P1899["block"]
    unless_null $P1900, vivify_548
    new $P1900, "Undef"
  vivify_548:
    $P1901 = $P1900."ast"()
    store_lex "$block", $P1901
.annotate "line", 653
    find_lex $P1902, "$block"
    $P1902."blocktype"("immediate")
.annotate "line", 655
    get_hll_global $P1903, ["PAST"], "Regex"
.annotate "line", 656
    get_hll_global $P1904, ["PAST"], "Stmts"
.annotate "line", 657
    get_hll_global $P1905, ["PAST"], "Op"
.annotate "line", 658
    get_hll_global $P1906, ["PAST"], "Var"
    $P1907 = $P1906."new"("$/" :named("name"))
.annotate "line", 659
    get_hll_global $P1908, ["PAST"], "Op"
.annotate "line", 660
    get_hll_global $P1909, ["PAST"], "Var"
    $P1910 = $P1909."new"(unicode:"$\x{a2}" :named("name"))
    $P1911 = $P1908."new"($P1910, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 659
    $P1912 = $P1905."new"($P1907, $P1911, "bind" :named("pasttype"))
.annotate "line", 657
    find_lex $P1913, "$block"
    $P1914 = $P1904."new"($P1912, $P1913)
.annotate "line", 656
    $P1915 = $P1903."new"($P1914, "pastnode" :named("pasttype"))
.annotate "line", 655
    store_lex "$past", $P1915
.annotate "line", 670
    find_lex $P1916, "$/"
    find_lex $P1917, "$past"
    $P1918 = $P1916."!make"($P1917)
.annotate "line", 651
    .return ($P1918)
  control_1894:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1919, exception, "payload"
    .return ($P1919)
.end

### .include 'src/cheats/nqp-builtins.pir'
.namespace []

.sub 'print'
    .param pmc list            :slurpy
    .local pmc list_it
    list_it = iter list
  list_loop:
    unless list_it goto list_done
    $P0 = shift list_it
    print $P0
    goto list_loop
  list_done:
    .return (1)
.end

.sub 'say'
    .param pmc list            :slurpy
    .tailcall 'print'(list :flat, "\n")
.end

.sub 'ok'
    .param pmc    condition
    .param string description :optional
    .param int    has_desc    :opt_flag
    if condition goto it_was_ok
        print "not "
  it_was_ok:
    print "ok "
    $P0 = get_global "$test_counter"
    $P0 += 1
    print $P0
    unless has_desc goto no_description
        print " # "
        print description
  no_description:
    print "\n"
    .return (1)
.end

.sub 'plan'
    .param int quantity
    print "1.."
    print quantity
    print "\n"
.end

.sub '' :anon :init :load
    $P0 = box 0
    set_global '$test_counter', $P0
.end



.namespace ['NQP';'Compiler']

.sub '' :anon :load :init
    .local pmc p6meta, nqpproto
    p6meta = get_hll_global 'P6metaclass'
    nqpproto = p6meta.'new_class'('NQP::Compiler', 'parent'=>'HLL::Compiler')
    nqpproto.'language'('NQP-rx')
    $P0 = get_hll_global ['NQP'], 'Grammar'
    nqpproto.'parsegrammar'($P0)
    $P0 = get_hll_global ['NQP'], 'Actions'
    nqpproto.'parseactions'($P0)
    $P0 = split ' ', 'e=s help|h target=s dumper=s trace|t=s encoding=s output|o=s combine version|v parsetrace'
    setattribute nqpproto, '@cmdoptions', $P0
.end

.sub 'main' :main
    .param pmc args_str

    $P0 = compreg 'NQP-rx'
    $P1 = $P0.'command_line'(args_str, 'encoding'=>'utf8', 'transcode'=>'ascii iso-8859-1')
    exit 0
.end

# Local Variables:
#   mode: pir
#   fill-column: 100
# End:
# vim: expandtab shiftwidth=4 ft=pir:
