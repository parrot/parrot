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
.sub "_block11"  :anon :subid("10_1259103982.97329")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    capture_lex $P14
    $P1231 = $P14()
.annotate "line", 1
    .return ($P1231)
.end


.namespace []
.sub "" :load :init :subid("post316") :outer("10_1259103982.97329")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259103982.97329" 
    .local pmc block
    set block, $P12
    $P1232 = get_root_global ["parrot"], "P6metaclass"
    $P1232."new_class"("NQP::Grammar", "HLL::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "_block13"  :subid("11_1259103982.97329") :outer("10_1259103982.97329")
.annotate "line", 4
    get_hll_global $P1175, ["NQP";"Regex"], "_block1174" 
    capture_lex $P1175
    .const 'Sub' $P1168 = "301_1259103982.97329" 
    capture_lex $P1168
    .const 'Sub' $P1162 = "299_1259103982.97329" 
    capture_lex $P1162
    .const 'Sub' $P1155 = "297_1259103982.97329" 
    capture_lex $P1155
    .const 'Sub' $P1148 = "295_1259103982.97329" 
    capture_lex $P1148
    .const 'Sub' $P1141 = "293_1259103982.97329" 
    capture_lex $P1141
    .const 'Sub' $P1134 = "291_1259103982.97329" 
    capture_lex $P1134
    .const 'Sub' $P1128 = "289_1259103982.97329" 
    capture_lex $P1128
    .const 'Sub' $P1121 = "287_1259103982.97329" 
    capture_lex $P1121
    .const 'Sub' $P1114 = "285_1259103982.97329" 
    capture_lex $P1114
    .const 'Sub' $P1107 = "283_1259103982.97329" 
    capture_lex $P1107
    .const 'Sub' $P1100 = "281_1259103982.97329" 
    capture_lex $P1100
    .const 'Sub' $P1093 = "279_1259103982.97329" 
    capture_lex $P1093
    .const 'Sub' $P1086 = "277_1259103982.97329" 
    capture_lex $P1086
    .const 'Sub' $P1079 = "275_1259103982.97329" 
    capture_lex $P1079
    .const 'Sub' $P1072 = "273_1259103982.97329" 
    capture_lex $P1072
    .const 'Sub' $P1065 = "271_1259103982.97329" 
    capture_lex $P1065
    .const 'Sub' $P1058 = "269_1259103982.97329" 
    capture_lex $P1058
    .const 'Sub' $P1051 = "267_1259103982.97329" 
    capture_lex $P1051
    .const 'Sub' $P1044 = "265_1259103982.97329" 
    capture_lex $P1044
    .const 'Sub' $P1037 = "263_1259103982.97329" 
    capture_lex $P1037
    .const 'Sub' $P1030 = "261_1259103982.97329" 
    capture_lex $P1030
    .const 'Sub' $P1023 = "259_1259103982.97329" 
    capture_lex $P1023
    .const 'Sub' $P1016 = "257_1259103982.97329" 
    capture_lex $P1016
    .const 'Sub' $P1009 = "255_1259103982.97329" 
    capture_lex $P1009
    .const 'Sub' $P1002 = "253_1259103982.97329" 
    capture_lex $P1002
    .const 'Sub' $P995 = "251_1259103982.97329" 
    capture_lex $P995
    .const 'Sub' $P988 = "249_1259103982.97329" 
    capture_lex $P988
    .const 'Sub' $P981 = "247_1259103982.97329" 
    capture_lex $P981
    .const 'Sub' $P974 = "245_1259103982.97329" 
    capture_lex $P974
    .const 'Sub' $P967 = "243_1259103982.97329" 
    capture_lex $P967
    .const 'Sub' $P960 = "241_1259103982.97329" 
    capture_lex $P960
    .const 'Sub' $P953 = "239_1259103982.97329" 
    capture_lex $P953
    .const 'Sub' $P947 = "237_1259103982.97329" 
    capture_lex $P947
    .const 'Sub' $P940 = "235_1259103982.97329" 
    capture_lex $P940
    .const 'Sub' $P933 = "233_1259103982.97329" 
    capture_lex $P933
    .const 'Sub' $P926 = "231_1259103982.97329" 
    capture_lex $P926
    .const 'Sub' $P919 = "229_1259103982.97329" 
    capture_lex $P919
    .const 'Sub' $P912 = "227_1259103982.97329" 
    capture_lex $P912
    .const 'Sub' $P905 = "225_1259103982.97329" 
    capture_lex $P905
    .const 'Sub' $P898 = "223_1259103982.97329" 
    capture_lex $P898
    .const 'Sub' $P892 = "221_1259103982.97329" 
    capture_lex $P892
    .const 'Sub' $P886 = "219_1259103982.97329" 
    capture_lex $P886
    .const 'Sub' $P881 = "217_1259103982.97329" 
    capture_lex $P881
    .const 'Sub' $P875 = "215_1259103982.97329" 
    capture_lex $P875
    .const 'Sub' $P869 = "213_1259103982.97329" 
    capture_lex $P869
    .const 'Sub' $P864 = "211_1259103982.97329" 
    capture_lex $P864
    .const 'Sub' $P859 = "209_1259103982.97329" 
    capture_lex $P859
    .const 'Sub' $P852 = "207_1259103982.97329" 
    capture_lex $P852
    .const 'Sub' $P844 = "205_1259103982.97329" 
    capture_lex $P844
    .const 'Sub' $P839 = "203_1259103982.97329" 
    capture_lex $P839
    .const 'Sub' $P834 = "201_1259103982.97329" 
    capture_lex $P834
    .const 'Sub' $P826 = "199_1259103982.97329" 
    capture_lex $P826
    .const 'Sub' $P818 = "197_1259103982.97329" 
    capture_lex $P818
    .const 'Sub' $P813 = "195_1259103982.97329" 
    capture_lex $P813
    .const 'Sub' $P808 = "193_1259103982.97329" 
    capture_lex $P808
    .const 'Sub' $P802 = "191_1259103982.97329" 
    capture_lex $P802
    .const 'Sub' $P796 = "189_1259103982.97329" 
    capture_lex $P796
    .const 'Sub' $P790 = "187_1259103982.97329" 
    capture_lex $P790
    .const 'Sub' $P784 = "185_1259103982.97329" 
    capture_lex $P784
    .const 'Sub' $P779 = "183_1259103982.97329" 
    capture_lex $P779
    .const 'Sub' $P774 = "181_1259103982.97329" 
    capture_lex $P774
    .const 'Sub' $P761 = "177_1259103982.97329" 
    capture_lex $P761
    .const 'Sub' $P753 = "175_1259103982.97329" 
    capture_lex $P753
    .const 'Sub' $P747 = "173_1259103982.97329" 
    capture_lex $P747
    .const 'Sub' $P740 = "171_1259103982.97329" 
    capture_lex $P740
    .const 'Sub' $P734 = "169_1259103982.97329" 
    capture_lex $P734
    .const 'Sub' $P726 = "167_1259103982.97329" 
    capture_lex $P726
    .const 'Sub' $P718 = "165_1259103982.97329" 
    capture_lex $P718
    .const 'Sub' $P712 = "163_1259103982.97329" 
    capture_lex $P712
    .const 'Sub' $P706 = "161_1259103982.97329" 
    capture_lex $P706
    .const 'Sub' $P691 = "157_1259103982.97329" 
    capture_lex $P691
    .const 'Sub' $P659 = "155_1259103982.97329" 
    capture_lex $P659
    .const 'Sub' $P651 = "153_1259103982.97329" 
    capture_lex $P651
    .const 'Sub' $P645 = "151_1259103982.97329" 
    capture_lex $P645
    .const 'Sub' $P635 = "149_1259103982.97329" 
    capture_lex $P635
    .const 'Sub' $P620 = "147_1259103982.97329" 
    capture_lex $P620
    .const 'Sub' $P611 = "145_1259103982.97329" 
    capture_lex $P611
    .const 'Sub' $P592 = "143_1259103982.97329" 
    capture_lex $P592
    .const 'Sub' $P573 = "141_1259103982.97329" 
    capture_lex $P573
    .const 'Sub' $P566 = "139_1259103982.97329" 
    capture_lex $P566
    .const 'Sub' $P559 = "137_1259103982.97329" 
    capture_lex $P559
    .const 'Sub' $P549 = "133_1259103982.97329" 
    capture_lex $P549
    .const 'Sub' $P538 = "131_1259103982.97329" 
    capture_lex $P538
    .const 'Sub' $P531 = "129_1259103982.97329" 
    capture_lex $P531
    .const 'Sub' $P524 = "127_1259103982.97329" 
    capture_lex $P524
    .const 'Sub' $P517 = "125_1259103982.97329" 
    capture_lex $P517
    .const 'Sub' $P490 = "121_1259103982.97329" 
    capture_lex $P490
    .const 'Sub' $P481 = "119_1259103982.97329" 
    capture_lex $P481
    .const 'Sub' $P474 = "117_1259103982.97329" 
    capture_lex $P474
    .const 'Sub' $P465 = "113_1259103982.97329" 
    capture_lex $P465
    .const 'Sub' $P460 = "111_1259103982.97329" 
    capture_lex $P460
    .const 'Sub' $P448 = "109_1259103982.97329" 
    capture_lex $P448
    .const 'Sub' $P437 = "107_1259103982.97329" 
    capture_lex $P437
    .const 'Sub' $P432 = "105_1259103982.97329" 
    capture_lex $P432
    .const 'Sub' $P426 = "103_1259103982.97329" 
    capture_lex $P426
    .const 'Sub' $P420 = "101_1259103982.97329" 
    capture_lex $P420
    .const 'Sub' $P414 = "99_1259103982.97329" 
    capture_lex $P414
    .const 'Sub' $P408 = "97_1259103982.97329" 
    capture_lex $P408
    .const 'Sub' $P402 = "95_1259103982.97329" 
    capture_lex $P402
    .const 'Sub' $P396 = "93_1259103982.97329" 
    capture_lex $P396
    .const 'Sub' $P390 = "91_1259103982.97329" 
    capture_lex $P390
    .const 'Sub' $P382 = "89_1259103982.97329" 
    capture_lex $P382
    .const 'Sub' $P374 = "87_1259103982.97329" 
    capture_lex $P374
    .const 'Sub' $P362 = "83_1259103982.97329" 
    capture_lex $P362
    .const 'Sub' $P354 = "81_1259103982.97329" 
    capture_lex $P354
    .const 'Sub' $P344 = "77_1259103982.97329" 
    capture_lex $P344
    .const 'Sub' $P337 = "75_1259103982.97329" 
    capture_lex $P337
    .const 'Sub' $P330 = "73_1259103982.97329" 
    capture_lex $P330
    .const 'Sub' $P318 = "69_1259103982.97329" 
    capture_lex $P318
    .const 'Sub' $P298 = "67_1259103982.97329" 
    capture_lex $P298
    .const 'Sub' $P289 = "65_1259103982.97329" 
    capture_lex $P289
    .const 'Sub' $P271 = "62_1259103982.97329" 
    capture_lex $P271
    .const 'Sub' $P251 = "60_1259103982.97329" 
    capture_lex $P251
    .const 'Sub' $P242 = "56_1259103982.97329" 
    capture_lex $P242
    .const 'Sub' $P237 = "54_1259103982.97329" 
    capture_lex $P237
    .const 'Sub' $P228 = "50_1259103982.97329" 
    capture_lex $P228
    .const 'Sub' $P223 = "48_1259103982.97329" 
    capture_lex $P223
    .const 'Sub' $P215 = "46_1259103982.97329" 
    capture_lex $P215
    .const 'Sub' $P208 = "44_1259103982.97329" 
    capture_lex $P208
    .const 'Sub' $P202 = "42_1259103982.97329" 
    capture_lex $P202
    .const 'Sub' $P194 = "40_1259103982.97329" 
    capture_lex $P194
    .const 'Sub' $P188 = "38_1259103982.97329" 
    capture_lex $P188
    .const 'Sub' $P182 = "36_1259103982.97329" 
    capture_lex $P182
    .const 'Sub' $P166 = "33_1259103982.97329" 
    capture_lex $P166
    .const 'Sub' $P153 = "31_1259103982.97329" 
    capture_lex $P153
    .const 'Sub' $P146 = "29_1259103982.97329" 
    capture_lex $P146
    .const 'Sub' $P103 = "26_1259103982.97329" 
    capture_lex $P103
    .const 'Sub' $P85 = "23_1259103982.97329" 
    capture_lex $P85
    .const 'Sub' $P75 = "21_1259103982.97329" 
    capture_lex $P75
    .const 'Sub' $P61 = "19_1259103982.97329" 
    capture_lex $P61
    .const 'Sub' $P46 = "17_1259103982.97329" 
    capture_lex $P46
    .const 'Sub' $P39 = "15_1259103982.97329" 
    capture_lex $P39
    .const 'Sub' $P33 = "13_1259103982.97329" 
    capture_lex $P33
    .const 'Sub' $P15 = "12_1259103982.97329" 
    capture_lex $P15
.annotate "line", 498
    get_hll_global $P1175, ["NQP";"Regex"], "_block1174" 
    capture_lex $P1175
    $P1214 = $P1175()
.annotate "line", 4
    .return ($P1214)
.end


.namespace ["NQP";"Grammar"]
.sub "" :load :init :subid("post317") :outer("11_1259103982.97329")
.annotate "line", 4
    get_hll_global $P14, ["NQP";"Grammar"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 391
    get_hll_global $P1215, ["NQP"], "Grammar"
    $P1215."O"(":prec<y=>, :assoc<unary>", "%methodop")
.annotate "line", 392
    get_hll_global $P1216, ["NQP"], "Grammar"
    $P1216."O"(":prec<x=>, :assoc<unary>", "%autoincrement")
.annotate "line", 393
    get_hll_global $P1217, ["NQP"], "Grammar"
    $P1217."O"(":prec<w=>, :assoc<left>", "%exponentiation")
.annotate "line", 394
    get_hll_global $P1218, ["NQP"], "Grammar"
    $P1218."O"(":prec<v=>, :assoc<unary>", "%symbolic_unary")
.annotate "line", 395
    get_hll_global $P1219, ["NQP"], "Grammar"
    $P1219."O"(":prec<u=>, :assoc<left>", "%multiplicative")
.annotate "line", 396
    get_hll_global $P1220, ["NQP"], "Grammar"
    $P1220."O"(":prec<t=>, :assoc<left>", "%additive")
.annotate "line", 397
    get_hll_global $P1221, ["NQP"], "Grammar"
    $P1221."O"(":prec<r=>, :assoc<left>", "%concatenation")
.annotate "line", 398
    get_hll_global $P1222, ["NQP"], "Grammar"
    $P1222."O"(":prec<m=>, :assoc<left>", "%relational")
.annotate "line", 399
    get_hll_global $P1223, ["NQP"], "Grammar"
    $P1223."O"(":prec<l=>, :assoc<left>", "%tight_and")
.annotate "line", 400
    get_hll_global $P1224, ["NQP"], "Grammar"
    $P1224."O"(":prec<k=>, :assoc<left>", "%tight_or")
.annotate "line", 401
    get_hll_global $P1225, ["NQP"], "Grammar"
    $P1225."O"(":prec<j=>, :assoc<right>", "%conditional")
.annotate "line", 402
    get_hll_global $P1226, ["NQP"], "Grammar"
    $P1226."O"(":prec<i=>, :assoc<right>", "%assignment")
.annotate "line", 403
    get_hll_global $P1227, ["NQP"], "Grammar"
    $P1227."O"(":prec<g=>, :assoc<list>, :nextterm<nulltermish>", "%comma")
.annotate "line", 404
    get_hll_global $P1228, ["NQP"], "Grammar"
    $P1228."O"(":prec<f=>, :assoc<list>", "%list_infix")
.annotate "line", 405
    get_hll_global $P1229, ["NQP"], "Grammar"
    $P1229."O"(":prec<e=>, :assoc<unary>", "%list_prefix")
.annotate "line", 390
    $P1230 = get_root_global ["parrot"], "P6metaclass"
    $P1230."new_class"("NQP::Regex", "Regex::P6Regex::Grammar" :named("parent"))
.end


.namespace ["NQP";"Grammar"]
.sub "TOP"  :subid("12_1259103982.97329") :method :outer("11_1259103982.97329")
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
    unless_null $P20, vivify_318
    get_hll_global $P20, "%LANG"
    unless_null $P20, vivify_319
    die "Contextual %*LANG not found"
  vivify_319:
  vivify_318:
.annotate "line", 6
    get_hll_global $P21, ["NQP"], "Regex"
    find_lex $P22, "%*LANG"
    unless_null $P22, vivify_320
    get_hll_global $P22, "%LANG"
    unless_null $P22, vivify_321
    die "Contextual %*LANG not found"
  vivify_321:
    store_lex "%*LANG", $P22
  vivify_320:
    set $P22["Regex"], $P21
.annotate "line", 7
    get_hll_global $P23, ["NQP"], "RegexActions"
    find_lex $P24, "%*LANG"
    unless_null $P24, vivify_322
    get_hll_global $P24, "%LANG"
    unless_null $P24, vivify_323
    die "Contextual %*LANG not found"
  vivify_323:
    store_lex "%*LANG", $P24
  vivify_322:
    set $P24["Regex-actions"], $P23
.annotate "line", 8
    get_hll_global $P25, ["NQP"], "Grammar"
    find_lex $P26, "%*LANG"
    unless_null $P26, vivify_324
    get_hll_global $P26, "%LANG"
    unless_null $P26, vivify_325
    die "Contextual %*LANG not found"
  vivify_325:
    store_lex "%*LANG", $P26
  vivify_324:
    set $P26["MAIN"], $P25
.annotate "line", 9
    get_hll_global $P27, ["NQP"], "Actions"
    find_lex $P28, "%*LANG"
    unless_null $P28, vivify_326
    get_hll_global $P28, "%LANG"
    unless_null $P28, vivify_327
    die "Contextual %*LANG not found"
  vivify_327:
    store_lex "%*LANG", $P28
  vivify_326:
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
.sub "identifier"  :subid("13_1259103982.97329") :method :outer("11_1259103982.97329")
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
.sub "!PREFIX__identifier"  :subid("14_1259103982.97329") :method
.annotate "line", 4
    $P36 = self."!PREFIX__!subrule"("ident", "")
    new $P37, "ResizablePMCArray"
    push $P37, $P36
    .return ($P37)
.end


.namespace ["NQP";"Grammar"]
.sub "name"  :subid("15_1259103982.97329") :method :outer("11_1259103982.97329")
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
.sub "!PREFIX__name"  :subid("16_1259103982.97329") :method
.annotate "line", 4
    new $P42, "ResizablePMCArray"
    push $P42, ""
    .return ($P42)
.end


.namespace ["NQP";"Grammar"]
.sub "deflongname"  :subid("17_1259103982.97329") :method :outer("11_1259103982.97329")
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
.sub "!PREFIX__deflongname"  :subid("18_1259103982.97329") :method
.annotate "line", 4
    $P49 = self."!PREFIX__!subrule"("identifier", "")
    new $P50, "ResizablePMCArray"
    push $P50, $P49
    .return ($P50)
.end


.namespace ["NQP";"Grammar"]
.sub "ENDSTMT"  :subid("19_1259103982.97329") :method :outer("11_1259103982.97329")
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
.sub "!PREFIX__ENDSTMT"  :subid("20_1259103982.97329") :method
.annotate "line", 4
    new $P64, "ResizablePMCArray"
    push $P64, ""
    .return ($P64)
.end


.namespace ["NQP";"Grammar"]
.sub "ws"  :subid("21_1259103982.97329") :method :outer("11_1259103982.97329")
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
.sub "!PREFIX__ws"  :subid("22_1259103982.97329") :method
.annotate "line", 4
    new $P78, "ResizablePMCArray"
    push $P78, ""
    push $P78, ""
    .return ($P78)
.end


.namespace ["NQP";"Grammar"]
.sub "unv"  :subid("23_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .const 'Sub' $P93 = "25_1259103982.97329" 
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
    .const 'Sub' $P93 = "25_1259103982.97329" 
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
  # rx rxquantr99 ** 0..*
    set_addr $I100, rxquantr99_done
    rx86_cur."!mark_push"(0, rx86_pos, $I100)
  rxquantr99_loop:
  # rx enumcharlist negate=0 
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx86_fail
    inc rx86_pos
    (rx86_rep) = rx86_cur."!mark_commit"($I100)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I100)
    goto rxquantr99_loop
  rxquantr99_done:
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
  # rx rxquantr101 ** 1..*
    set_addr $I102, rxquantr101_done
    rx86_cur."!mark_push"(0, -1, $I102)
  rxquantr101_loop:
  # rx enumcharlist negate=0 
    ge rx86_pos, rx86_eos, rx86_fail
    sub $I10, rx86_pos, rx86_off
    substr $S10, rx86_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx86_fail
    inc rx86_pos
    (rx86_rep) = rx86_cur."!mark_commit"($I102)
    rx86_cur."!mark_push"(rx86_rep, rx86_pos, $I102)
    goto rxquantr101_loop
  rxquantr101_done:
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
.sub "!PREFIX__unv"  :subid("24_1259103982.97329") :method
.annotate "line", 4
    new $P88, "ResizablePMCArray"
    push $P88, ""
    push $P88, ""
    push $P88, ""
    .return ($P88)
.end


.namespace ["NQP";"Grammar"]
.sub "_block92"  :anon :subid("25_1259103982.97329") :method :outer("23_1259103982.97329")
.annotate "line", 45
    .local string rx94_tgt
    .local int rx94_pos
    .local int rx94_off
    .local int rx94_eos
    .local int rx94_rep
    .local pmc rx94_cur
    (rx94_cur, rx94_pos, rx94_tgt) = self."!cursor_start"()
    rx94_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx94_cur
    .local pmc match
    .lex "$/", match
    length rx94_eos, rx94_tgt
    set rx94_off, 0
    lt rx94_pos, 2, rx94_start
    sub rx94_off, rx94_pos, 1
    substr rx94_tgt, rx94_tgt, rx94_off
  rx94_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan95_done
    goto rxscan95_scan
  rxscan95_loop:
    ($P10) = rx94_cur."from"()
    inc $P10
    set rx94_pos, $P10
    ge rx94_pos, rx94_eos, rxscan95_done
  rxscan95_scan:
    set_addr $I10, rxscan95_loop
    rx94_cur."!mark_push"(0, rx94_pos, $I10)
  rxscan95_done:
  # rx rxquantr96 ** 0..*
    set_addr $I97, rxquantr96_done
    rx94_cur."!mark_push"(0, rx94_pos, $I97)
  rxquantr96_loop:
  # rx enumcharlist negate=0 
    ge rx94_pos, rx94_eos, rx94_fail
    sub $I10, rx94_pos, rx94_off
    substr $S10, rx94_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx94_fail
    inc rx94_pos
    (rx94_rep) = rx94_cur."!mark_commit"($I97)
    rx94_cur."!mark_push"(rx94_rep, rx94_pos, $I97)
    goto rxquantr96_loop
  rxquantr96_done:
  # rx literal  "="
    add $I11, rx94_pos, 1
    gt $I11, rx94_eos, rx94_fail
    sub $I11, rx94_pos, rx94_off
    substr $S10, rx94_tgt, $I11, 1
    ne $S10, "=", rx94_fail
    add rx94_pos, 1
  alt98_0:
    set_addr $I10, alt98_1
    rx94_cur."!mark_push"(0, rx94_pos, $I10)
  # rx charclass w
    ge rx94_pos, rx94_eos, rx94_fail
    sub $I10, rx94_pos, rx94_off
    is_cclass $I11, 8192, rx94_tgt, $I10
    unless $I11, rx94_fail
    inc rx94_pos
    goto alt98_end
  alt98_1:
  # rx literal  "\\"
    add $I11, rx94_pos, 1
    gt $I11, rx94_eos, rx94_fail
    sub $I11, rx94_pos, rx94_off
    substr $S10, rx94_tgt, $I11, 1
    ne $S10, "\\", rx94_fail
    add rx94_pos, 1
  alt98_end:
  # rx pass
    rx94_cur."!cursor_pass"(rx94_pos, "")
    rx94_cur."!cursor_debug"("PASS  ", "", " at pos=", rx94_pos)
    .return (rx94_cur)
  rx94_fail:
    (rx94_rep, rx94_pos, $I10, $P10) = rx94_cur."!mark_fail"(0)
    lt rx94_pos, -1, rx94_done
    eq rx94_pos, -1, rx94_fail
    jump $I10
  rx94_done:
    rx94_cur."!cursor_fail"()
    rx94_cur."!cursor_debug"("FAIL  ", "")
    .return (rx94_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "pod_comment"  :subid("26_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .const 'Sub' $P138 = "28_1259103982.97329" 
    capture_lex $P138
    .local string rx104_tgt
    .local int rx104_pos
    .local int rx104_off
    .local int rx104_eos
    .local int rx104_rep
    .local pmc rx104_cur
    (rx104_cur, rx104_pos, rx104_tgt) = self."!cursor_start"()
    rx104_cur."!cursor_debug"("START ", "pod_comment")
    .lex unicode:"$\x{a2}", rx104_cur
    .local pmc match
    .lex "$/", match
    length rx104_eos, rx104_tgt
    set rx104_off, 0
    lt rx104_pos, 2, rx104_start
    sub rx104_off, rx104_pos, 1
    substr rx104_tgt, rx104_tgt, rx104_off
  rx104_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan107_done
    goto rxscan107_scan
  rxscan107_loop:
    ($P10) = rx104_cur."from"()
    inc $P10
    set rx104_pos, $P10
    ge rx104_pos, rx104_eos, rxscan107_done
  rxscan107_scan:
    set_addr $I10, rxscan107_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  rxscan107_done:
.annotate "line", 52
  # rxanchor bol
    eq rx104_pos, 0, rxanchor108_done
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    dec $I10
    is_cclass $I11, 4096, rx104_tgt, $I10
    unless $I11, rx104_fail
  rxanchor108_done:
  # rx rxquantr109 ** 0..*
    set_addr $I110, rxquantr109_done
    rx104_cur."!mark_push"(0, rx104_pos, $I110)
  rxquantr109_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I110)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I110)
    goto rxquantr109_loop
  rxquantr109_done:
  # rx literal  "="
    add $I11, rx104_pos, 1
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 1
    ne $S10, "=", rx104_fail
    add rx104_pos, 1
  alt111_0:
.annotate "line", 53
    set_addr $I10, alt111_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 54
  # rx literal  "begin"
    add $I11, rx104_pos, 5
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 5
    ne $S10, "begin", rx104_fail
    add rx104_pos, 5
  # rx rxquantr112 ** 1..*
    set_addr $I113, rxquantr112_done
    rx104_cur."!mark_push"(0, -1, $I113)
  rxquantr112_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I113)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I113)
    goto rxquantr112_loop
  rxquantr112_done:
  # rx literal  "END"
    add $I11, rx104_pos, 3
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 3
    ne $S10, "END", rx104_fail
    add rx104_pos, 3
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  alt114_0:
.annotate "line", 55
    set_addr $I10, alt114_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rx rxquantf115 ** 0..*
    set_addr $I10, rxquantf115_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
    goto rxquantf115_done
  rxquantf115_loop:
  # rx charclass .
    ge rx104_pos, rx104_eos, rx104_fail
    inc rx104_pos
    set_addr $I10, rxquantf115_loop
    rx104_cur."!mark_push"($I116, rx104_pos, $I10)
  rxquantf115_done:
  # rx charclass nl
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 4096, rx104_tgt, $I10
    unless $I11, rx104_fail
    substr $S10, rx104_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx104_pos, $I11
    inc rx104_pos
  # rx literal  "=end"
    add $I11, rx104_pos, 4
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 4
    ne $S10, "=end", rx104_fail
    add rx104_pos, 4
  # rx rxquantr117 ** 1..*
    set_addr $I118, rxquantr117_done
    rx104_cur."!mark_push"(0, -1, $I118)
  rxquantr117_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I118)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I118)
    goto rxquantr117_loop
  rxquantr117_done:
  # rx literal  "END"
    add $I11, rx104_pos, 3
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 3
    ne $S10, "END", rx104_fail
    add rx104_pos, 3
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_cclass $I11, 4096, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
    goto alt114_end
  alt114_1:
  # rx charclass_q . r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_not_cclass $I11, 65535, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
  alt114_end:
.annotate "line", 54
    goto alt111_end
  alt111_1:
    set_addr $I10, alt111_2
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 56
  # rx literal  "begin"
    add $I11, rx104_pos, 5
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 5
    ne $S10, "begin", rx104_fail
    add rx104_pos, 5
  # rx rxquantr119 ** 1..*
    set_addr $I120, rxquantr119_done
    rx104_cur."!mark_push"(0, -1, $I120)
  rxquantr119_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I120)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I120)
    goto rxquantr119_loop
  rxquantr119_done:
  # rx subrule "identifier" subtype=capture negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."identifier"()
    unless $P10, rx104_fail
    rx104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx104_pos = $P10."pos"()
  alt121_0:
.annotate "line", 57
    set_addr $I10, alt121_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 58
  # rx rxquantf122 ** 0..*
    set_addr $I10, rxquantf122_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
    goto rxquantf122_done
  rxquantf122_loop:
  # rx charclass .
    ge rx104_pos, rx104_eos, rx104_fail
    inc rx104_pos
    set_addr $I10, rxquantf122_loop
    rx104_cur."!mark_push"($I123, rx104_pos, $I10)
  rxquantf122_done:
  # rx charclass nl
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 4096, rx104_tgt, $I10
    unless $I11, rx104_fail
    substr $S10, rx104_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx104_pos, $I11
    inc rx104_pos
  # rx literal  "=end"
    add $I11, rx104_pos, 4
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 4
    ne $S10, "=end", rx104_fail
    add rx104_pos, 4
  # rx rxquantr124 ** 1..*
    set_addr $I125, rxquantr124_done
    rx104_cur."!mark_push"(0, -1, $I125)
  rxquantr124_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I125)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I125)
    goto rxquantr124_loop
  rxquantr124_done:
  # rx subrule "!BACKREF" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."!BACKREF"("identifier")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_cclass $I11, 4096, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
    goto alt121_end
  alt121_1:
.annotate "line", 59
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("=begin without matching =end")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  alt121_end:
.annotate "line", 56
    goto alt111_end
  alt111_2:
    set_addr $I10, alt111_3
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 61
  # rx literal  "begin"
    add $I11, rx104_pos, 5
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 5
    ne $S10, "begin", rx104_fail
    add rx104_pos, 5
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  # rx rxquantr127 ** 0..*
    set_addr $I128, rxquantr127_done
    rx104_cur."!mark_push"(0, rx104_pos, $I128)
  rxquantr127_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I128)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I128)
    goto rxquantr127_loop
  rxquantr127_done:
  alt129_0:
.annotate "line", 62
    set_addr $I10, alt129_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rxanchor eol
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 4096, rx104_tgt, $I10
    if $I11, rxanchor130_done
    ne rx104_pos, rx104_eos, rx104_fail
    eq rx104_pos, 0, rxanchor130_done
    dec $I10
    is_cclass $I11, 4096, rx104_tgt, $I10
    if $I11, rx104_fail
  rxanchor130_done:
    goto alt129_end
  alt129_1:
    set_addr $I10, alt129_2
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rx literal  "#"
    add $I11, rx104_pos, 1
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 1
    ne $S10, "#", rx104_fail
    add rx104_pos, 1
    goto alt129_end
  alt129_2:
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("Unrecognized token after =begin")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  alt129_end:
  alt131_0:
.annotate "line", 63
    set_addr $I10, alt131_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
.annotate "line", 64
  # rx rxquantf132 ** 0..*
    set_addr $I10, rxquantf132_loop
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
    goto rxquantf132_done
  rxquantf132_loop:
  # rx charclass .
    ge rx104_pos, rx104_eos, rx104_fail
    inc rx104_pos
    set_addr $I10, rxquantf132_loop
    rx104_cur."!mark_push"($I133, rx104_pos, $I10)
  rxquantf132_done:
  # rx charclass nl
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 4096, rx104_tgt, $I10
    unless $I11, rx104_fail
    substr $S10, rx104_tgt, $I10, 2
    iseq $I11, $S10, "\r\n"
    add rx104_pos, $I11
    inc rx104_pos
  # rx rxquantr134 ** 0..*
    set_addr $I135, rxquantr134_done
    rx104_cur."!mark_push"(0, rx104_pos, $I135)
  rxquantr134_loop:
  # rx enumcharlist negate=0 
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I10, 1
    index $I11, unicode:"\t \x{a0}\u1680\u180e\u2000\u2001\u2002\u2003\u2004\u2005\u2006\u2007\u2008\u2009\u200a\u202f\u205f\u3000", $S10
    lt $I11, 0, rx104_fail
    inc rx104_pos
    (rx104_rep) = rx104_cur."!mark_commit"($I135)
    rx104_cur."!mark_push"(rx104_rep, rx104_pos, $I135)
    goto rxquantr134_loop
  rxquantr134_done:
  # rx literal  "=end"
    add $I11, rx104_pos, 4
    gt $I11, rx104_eos, rx104_fail
    sub $I11, rx104_pos, rx104_off
    substr $S10, rx104_tgt, $I11, 4
    ne $S10, "=end", rx104_fail
    add rx104_pos, 4
  # rxanchor rwb
    le rx104_pos, 0, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 8192, rx104_tgt, $I10
    if $I11, rx104_fail
    dec $I10
    is_cclass $I11, 8192, rx104_tgt, $I10
    unless $I11, rx104_fail
  # rx charclass_q N r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_cclass $I11, 4096, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
    goto alt131_end
  alt131_1:
.annotate "line", 65
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("=begin without matching =end")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  alt131_end:
.annotate "line", 61
    goto alt111_end
  alt111_3:
.annotate "line", 69
  # rx rxquantr136 ** 0..1
    set_addr $I144, rxquantr136_done
    rx104_cur."!mark_push"(0, rx104_pos, $I144)
  rxquantr136_loop:
.annotate "line", 68
  # rx subrule "before" subtype=zerowidth negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    .const 'Sub' $P138 = "28_1259103982.97329" 
    capture_lex $P138
    $P10 = rx104_cur."before"($P138)
    unless $P10, rx104_fail
.annotate "line", 69
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("Obsolete pod format, please use =begin/=end instead")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
    (rx104_rep) = rx104_cur."!mark_commit"($I144)
  rxquantr136_done:
  alt145_0:
.annotate "line", 70
    set_addr $I10, alt145_1
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rx subrule "alpha" subtype=capture negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."alpha"()
    unless $P10, rx104_fail
    rx104_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("alpha")
    rx104_pos = $P10."pos"()
    goto alt145_end
  alt145_1:
    set_addr $I10, alt145_2
    rx104_cur."!mark_push"(0, rx104_pos, $I10)
  # rx charclass s
    ge rx104_pos, rx104_eos, rx104_fail
    sub $I10, rx104_pos, rx104_off
    is_cclass $I11, 32, rx104_tgt, $I10
    unless $I11, rx104_fail
    inc rx104_pos
    goto alt145_end
  alt145_2:
  # rx subrule "panic" subtype=method negate=
    rx104_cur."!cursor_pos"(rx104_pos)
    $P10 = rx104_cur."panic"("Illegal pod directive")
    unless $P10, rx104_fail
    rx104_pos = $P10."pos"()
  alt145_end:
.annotate "line", 71
  # rx charclass_q N r 0..-1
    sub $I10, rx104_pos, rx104_off
    find_cclass $I11, 4096, rx104_tgt, $I10, rx104_eos
    add rx104_pos, rx104_off, $I11
  alt111_end:
.annotate "line", 51
  # rx pass
    rx104_cur."!cursor_pass"(rx104_pos, "pod_comment")
    rx104_cur."!cursor_debug"("PASS  ", "pod_comment", " at pos=", rx104_pos)
    .return (rx104_cur)
  rx104_fail:
.annotate "line", 4
    (rx104_rep, rx104_pos, $I10, $P10) = rx104_cur."!mark_fail"(0)
    lt rx104_pos, -1, rx104_done
    eq rx104_pos, -1, rx104_fail
    jump $I10
  rx104_done:
    rx104_cur."!cursor_fail"()
    rx104_cur."!cursor_debug"("FAIL  ", "pod_comment")
    .return (rx104_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pod_comment"  :subid("27_1259103982.97329") :method
.annotate "line", 4
    new $P106, "ResizablePMCArray"
    push $P106, ""
    .return ($P106)
.end


.namespace ["NQP";"Grammar"]
.sub "_block137"  :anon :subid("28_1259103982.97329") :method :outer("26_1259103982.97329")
.annotate "line", 68
    .local string rx139_tgt
    .local int rx139_pos
    .local int rx139_off
    .local int rx139_eos
    .local int rx139_rep
    .local pmc rx139_cur
    (rx139_cur, rx139_pos, rx139_tgt) = self."!cursor_start"()
    rx139_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx139_cur
    .local pmc match
    .lex "$/", match
    length rx139_eos, rx139_tgt
    set rx139_off, 0
    lt rx139_pos, 2, rx139_start
    sub rx139_off, rx139_pos, 1
    substr rx139_tgt, rx139_tgt, rx139_off
  rx139_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan140_done
    goto rxscan140_scan
  rxscan140_loop:
    ($P10) = rx139_cur."from"()
    inc $P10
    set rx139_pos, $P10
    ge rx139_pos, rx139_eos, rxscan140_done
  rxscan140_scan:
    set_addr $I10, rxscan140_loop
    rx139_cur."!mark_push"(0, rx139_pos, $I10)
  rxscan140_done:
  # rx rxquantf141 ** 0..*
    set_addr $I10, rxquantf141_loop
    rx139_cur."!mark_push"(0, rx139_pos, $I10)
    goto rxquantf141_done
  rxquantf141_loop:
  # rx charclass .
    ge rx139_pos, rx139_eos, rx139_fail
    inc rx139_pos
    set_addr $I10, rxquantf141_loop
    rx139_cur."!mark_push"($I142, rx139_pos, $I10)
  rxquantf141_done:
  # rxanchor bol
    eq rx139_pos, 0, rxanchor143_done
    ge rx139_pos, rx139_eos, rx139_fail
    sub $I10, rx139_pos, rx139_off
    dec $I10
    is_cclass $I11, 4096, rx139_tgt, $I10
    unless $I11, rx139_fail
  rxanchor143_done:
  # rx literal  "=cut"
    add $I11, rx139_pos, 4
    gt $I11, rx139_eos, rx139_fail
    sub $I11, rx139_pos, rx139_off
    substr $S10, rx139_tgt, $I11, 4
    ne $S10, "=cut", rx139_fail
    add rx139_pos, 4
  # rxanchor rwb
    le rx139_pos, 0, rx139_fail
    sub $I10, rx139_pos, rx139_off
    is_cclass $I11, 8192, rx139_tgt, $I10
    if $I11, rx139_fail
    dec $I10
    is_cclass $I11, 8192, rx139_tgt, $I10
    unless $I11, rx139_fail
  # rx pass
    rx139_cur."!cursor_pass"(rx139_pos, "")
    rx139_cur."!cursor_debug"("PASS  ", "", " at pos=", rx139_pos)
    .return (rx139_cur)
  rx139_fail:
    (rx139_rep, rx139_pos, $I10, $P10) = rx139_cur."!mark_fail"(0)
    lt rx139_pos, -1, rx139_done
    eq rx139_pos, -1, rx139_fail
    jump $I10
  rx139_done:
    rx139_cur."!cursor_fail"()
    rx139_cur."!cursor_debug"("FAIL  ", "")
    .return (rx139_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "comp_unit"  :subid("29_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx147_tgt
    .local int rx147_pos
    .local int rx147_off
    .local int rx147_eos
    .local int rx147_rep
    .local pmc rx147_cur
    (rx147_cur, rx147_pos, rx147_tgt) = self."!cursor_start"()
    rx147_cur."!cursor_debug"("START ", "comp_unit")
    .lex unicode:"$\x{a2}", rx147_cur
    .local pmc match
    .lex "$/", match
    length rx147_eos, rx147_tgt
    set rx147_off, 0
    lt rx147_pos, 2, rx147_start
    sub rx147_off, rx147_pos, 1
    substr rx147_tgt, rx147_tgt, rx147_off
  rx147_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan151_done
    goto rxscan151_scan
  rxscan151_loop:
    ($P10) = rx147_cur."from"()
    inc $P10
    set rx147_pos, $P10
    ge rx147_pos, rx147_eos, rxscan151_done
  rxscan151_scan:
    set_addr $I10, rxscan151_loop
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
  rxscan151_done:
.annotate "line", 79
  # rx subrule "newpad" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."newpad"()
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
.annotate "line", 80
  # rx subrule "statementlist" subtype=capture negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."statementlist"()
    unless $P10, rx147_fail
    rx147_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx147_pos = $P10."pos"()
  alt152_0:
.annotate "line", 81
    set_addr $I10, alt152_1
    rx147_cur."!mark_push"(0, rx147_pos, $I10)
  # rxanchor eos
    ne rx147_pos, rx147_eos, rx147_fail
    goto alt152_end
  alt152_1:
  # rx subrule "panic" subtype=method negate=
    rx147_cur."!cursor_pos"(rx147_pos)
    $P10 = rx147_cur."panic"("Confused")
    unless $P10, rx147_fail
    rx147_pos = $P10."pos"()
  alt152_end:
.annotate "line", 78
  # rx pass
    rx147_cur."!cursor_pass"(rx147_pos, "comp_unit")
    rx147_cur."!cursor_debug"("PASS  ", "comp_unit", " at pos=", rx147_pos)
    .return (rx147_cur)
  rx147_fail:
.annotate "line", 4
    (rx147_rep, rx147_pos, $I10, $P10) = rx147_cur."!mark_fail"(0)
    lt rx147_pos, -1, rx147_done
    eq rx147_pos, -1, rx147_fail
    jump $I10
  rx147_done:
    rx147_cur."!cursor_fail"()
    rx147_cur."!cursor_debug"("FAIL  ", "comp_unit")
    .return (rx147_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__comp_unit"  :subid("30_1259103982.97329") :method
.annotate "line", 4
    $P149 = self."!PREFIX__!subrule"("", "")
    new $P150, "ResizablePMCArray"
    push $P150, $P149
    .return ($P150)
.end


.namespace ["NQP";"Grammar"]
.sub "statementlist"  :subid("31_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx154_tgt
    .local int rx154_pos
    .local int rx154_off
    .local int rx154_eos
    .local int rx154_rep
    .local pmc rx154_cur
    (rx154_cur, rx154_pos, rx154_tgt) = self."!cursor_start"()
    rx154_cur."!cursor_debug"("START ", "statementlist")
    rx154_cur."!cursor_caparray"("statement")
    .lex unicode:"$\x{a2}", rx154_cur
    .local pmc match
    .lex "$/", match
    length rx154_eos, rx154_tgt
    set rx154_off, 0
    lt rx154_pos, 2, rx154_start
    sub rx154_off, rx154_pos, 1
    substr rx154_tgt, rx154_tgt, rx154_off
  rx154_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan157_done
    goto rxscan157_scan
  rxscan157_loop:
    ($P10) = rx154_cur."from"()
    inc $P10
    set rx154_pos, $P10
    ge rx154_pos, rx154_eos, rxscan157_done
  rxscan157_scan:
    set_addr $I10, rxscan157_loop
    rx154_cur."!mark_push"(0, rx154_pos, $I10)
  rxscan157_done:
  alt158_0:
.annotate "line", 84
    set_addr $I10, alt158_1
    rx154_cur."!mark_push"(0, rx154_pos, $I10)
.annotate "line", 85
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  # rxanchor eos
    ne rx154_pos, rx154_eos, rx154_fail
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
    goto alt158_end
  alt158_1:
.annotate "line", 86
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  # rx rxquantr162 ** 0..*
    set_addr $I164, rxquantr162_done
    rx154_cur."!mark_push"(0, rx154_pos, $I164)
  rxquantr162_loop:
  # rx subrule "statement" subtype=capture negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."statement"()
    unless $P10, rx154_fail
    rx154_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx154_pos = $P10."pos"()
  # rx subrule "eat_terminator" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."eat_terminator"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
    (rx154_rep) = rx154_cur."!mark_commit"($I164)
    rx154_cur."!mark_push"(rx154_rep, rx154_pos, $I164)
    goto rxquantr162_loop
  rxquantr162_done:
  # rx subrule "ws" subtype=method negate=
    rx154_cur."!cursor_pos"(rx154_pos)
    $P10 = rx154_cur."ws"()
    unless $P10, rx154_fail
    rx154_pos = $P10."pos"()
  alt158_end:
.annotate "line", 84
  # rx pass
    rx154_cur."!cursor_pass"(rx154_pos, "statementlist")
    rx154_cur."!cursor_debug"("PASS  ", "statementlist", " at pos=", rx154_pos)
    .return (rx154_cur)
  rx154_fail:
.annotate "line", 4
    (rx154_rep, rx154_pos, $I10, $P10) = rx154_cur."!mark_fail"(0)
    lt rx154_pos, -1, rx154_done
    eq rx154_pos, -1, rx154_fail
    jump $I10
  rx154_done:
    rx154_cur."!cursor_fail"()
    rx154_cur."!cursor_debug"("FAIL  ", "statementlist")
    .return (rx154_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statementlist"  :subid("32_1259103982.97329") :method
.annotate "line", 4
    new $P156, "ResizablePMCArray"
    push $P156, ""
    push $P156, ""
    .return ($P156)
.end


.namespace ["NQP";"Grammar"]
.sub "statement"  :subid("33_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .const 'Sub' $P172 = "35_1259103982.97329" 
    capture_lex $P172
    .local string rx167_tgt
    .local int rx167_pos
    .local int rx167_off
    .local int rx167_eos
    .local int rx167_rep
    .local pmc rx167_cur
    (rx167_cur, rx167_pos, rx167_tgt) = self."!cursor_start"()
    rx167_cur."!cursor_debug"("START ", "statement")
    rx167_cur."!cursor_caparray"("statement_mod_loop", "statement_mod_cond")
    .lex unicode:"$\x{a2}", rx167_cur
    .local pmc match
    .lex "$/", match
    length rx167_eos, rx167_tgt
    set rx167_off, 0
    lt rx167_pos, 2, rx167_start
    sub rx167_off, rx167_pos, 1
    substr rx167_tgt, rx167_tgt, rx167_off
  rx167_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan170_done
    goto rxscan170_scan
  rxscan170_loop:
    ($P10) = rx167_cur."from"()
    inc $P10
    set rx167_pos, $P10
    ge rx167_pos, rx167_eos, rxscan170_done
  rxscan170_scan:
    set_addr $I10, rxscan170_loop
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
  rxscan170_done:
.annotate "line", 90
  # rx subrule "before" subtype=zerowidth negate=1
    rx167_cur."!cursor_pos"(rx167_pos)
    .const 'Sub' $P172 = "35_1259103982.97329" 
    capture_lex $P172
    $P10 = rx167_cur."before"($P172)
    if $P10, rx167_fail
  alt176_0:
.annotate "line", 91
    set_addr $I10, alt176_1
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
.annotate "line", 92
  # rx subrule "statement_control" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."statement_control"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_control")
    rx167_pos = $P10."pos"()
    goto alt176_end
  alt176_1:
.annotate "line", 93
  # rx subrule "EXPR" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."EXPR"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx167_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."ws"()
    unless $P10, rx167_fail
    rx167_pos = $P10."pos"()
.annotate "line", 97
  # rx rxquantr177 ** 0..1
    set_addr $I181, rxquantr177_done
    rx167_cur."!mark_push"(0, rx167_pos, $I181)
  rxquantr177_loop:
  alt178_0:
.annotate "line", 94
    set_addr $I10, alt178_1
    rx167_cur."!mark_push"(0, rx167_pos, $I10)
.annotate "line", 95
  # rx subrule "statement_mod_cond" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."statement_mod_cond"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_cond")
    rx167_pos = $P10."pos"()
  # rx rxquantr179 ** 0..1
    set_addr $I180, rxquantr179_done
    rx167_cur."!mark_push"(0, rx167_pos, $I180)
  rxquantr179_loop:
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."statement_mod_loop"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx167_pos = $P10."pos"()
    (rx167_rep) = rx167_cur."!mark_commit"($I180)
  rxquantr179_done:
    goto alt178_end
  alt178_1:
.annotate "line", 96
  # rx subrule "statement_mod_loop" subtype=capture negate=
    rx167_cur."!cursor_pos"(rx167_pos)
    $P10 = rx167_cur."statement_mod_loop"()
    unless $P10, rx167_fail
    rx167_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_mod_loop")
    rx167_pos = $P10."pos"()
  alt178_end:
.annotate "line", 97
    (rx167_rep) = rx167_cur."!mark_commit"($I181)
  rxquantr177_done:
  alt176_end:
.annotate "line", 89
  # rx pass
    rx167_cur."!cursor_pass"(rx167_pos, "statement")
    rx167_cur."!cursor_debug"("PASS  ", "statement", " at pos=", rx167_pos)
    .return (rx167_cur)
  rx167_fail:
.annotate "line", 4
    (rx167_rep, rx167_pos, $I10, $P10) = rx167_cur."!mark_fail"(0)
    lt rx167_pos, -1, rx167_done
    eq rx167_pos, -1, rx167_fail
    jump $I10
  rx167_done:
    rx167_cur."!cursor_fail"()
    rx167_cur."!cursor_debug"("FAIL  ", "statement")
    .return (rx167_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement"  :subid("34_1259103982.97329") :method
.annotate "line", 4
    new $P169, "ResizablePMCArray"
    push $P169, ""
    .return ($P169)
.end


.namespace ["NQP";"Grammar"]
.sub "_block171"  :anon :subid("35_1259103982.97329") :method :outer("33_1259103982.97329")
.annotate "line", 90
    .local string rx173_tgt
    .local int rx173_pos
    .local int rx173_off
    .local int rx173_eos
    .local int rx173_rep
    .local pmc rx173_cur
    (rx173_cur, rx173_pos, rx173_tgt) = self."!cursor_start"()
    rx173_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx173_cur
    .local pmc match
    .lex "$/", match
    length rx173_eos, rx173_tgt
    set rx173_off, 0
    lt rx173_pos, 2, rx173_start
    sub rx173_off, rx173_pos, 1
    substr rx173_tgt, rx173_tgt, rx173_off
  rx173_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan174_done
    goto rxscan174_scan
  rxscan174_loop:
    ($P10) = rx173_cur."from"()
    inc $P10
    set rx173_pos, $P10
    ge rx173_pos, rx173_eos, rxscan174_done
  rxscan174_scan:
    set_addr $I10, rxscan174_loop
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
  rxscan174_done:
  alt175_0:
    set_addr $I10, alt175_1
    rx173_cur."!mark_push"(0, rx173_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx173_pos, rx173_eos, rx173_fail
    sub $I10, rx173_pos, rx173_off
    substr $S10, rx173_tgt, $I10, 1
    index $I11, "])}", $S10
    lt $I11, 0, rx173_fail
    inc rx173_pos
    goto alt175_end
  alt175_1:
  # rxanchor eos
    ne rx173_pos, rx173_eos, rx173_fail
  alt175_end:
  # rx pass
    rx173_cur."!cursor_pass"(rx173_pos, "")
    rx173_cur."!cursor_debug"("PASS  ", "", " at pos=", rx173_pos)
    .return (rx173_cur)
  rx173_fail:
    (rx173_rep, rx173_pos, $I10, $P10) = rx173_cur."!mark_fail"(0)
    lt rx173_pos, -1, rx173_done
    eq rx173_pos, -1, rx173_fail
    jump $I10
  rx173_done:
    rx173_cur."!cursor_fail"()
    rx173_cur."!cursor_debug"("FAIL  ", "")
    .return (rx173_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "eat_terminator"  :subid("36_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx183_tgt
    .local int rx183_pos
    .local int rx183_off
    .local int rx183_eos
    .local int rx183_rep
    .local pmc rx183_cur
    (rx183_cur, rx183_pos, rx183_tgt) = self."!cursor_start"()
    rx183_cur."!cursor_debug"("START ", "eat_terminator")
    .lex unicode:"$\x{a2}", rx183_cur
    .local pmc match
    .lex "$/", match
    length rx183_eos, rx183_tgt
    set rx183_off, 0
    lt rx183_pos, 2, rx183_start
    sub rx183_off, rx183_pos, 1
    substr rx183_tgt, rx183_tgt, rx183_off
  rx183_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan186_done
    goto rxscan186_scan
  rxscan186_loop:
    ($P10) = rx183_cur."from"()
    inc $P10
    set rx183_pos, $P10
    ge rx183_pos, rx183_eos, rxscan186_done
  rxscan186_scan:
    set_addr $I10, rxscan186_loop
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
  rxscan186_done:
  alt187_0:
.annotate "line", 101
    set_addr $I10, alt187_1
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate "line", 102
  # rx literal  ";"
    add $I11, rx183_pos, 1
    gt $I11, rx183_eos, rx183_fail
    sub $I11, rx183_pos, rx183_off
    substr $S10, rx183_tgt, $I11, 1
    ne $S10, ";", rx183_fail
    add rx183_pos, 1
    goto alt187_end
  alt187_1:
    set_addr $I10, alt187_2
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate "line", 103
  # rx subrule "MARKED" subtype=zerowidth negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."MARKED"("endstmt")
    unless $P10, rx183_fail
    goto alt187_end
  alt187_2:
    set_addr $I10, alt187_3
    rx183_cur."!mark_push"(0, rx183_pos, $I10)
.annotate "line", 104
  # rx subrule "terminator" subtype=zerowidth negate=
    rx183_cur."!cursor_pos"(rx183_pos)
    $P10 = rx183_cur."terminator"()
    unless $P10, rx183_fail
    goto alt187_end
  alt187_3:
.annotate "line", 105
  # rxanchor eos
    ne rx183_pos, rx183_eos, rx183_fail
  alt187_end:
.annotate "line", 101
  # rx pass
    rx183_cur."!cursor_pass"(rx183_pos, "eat_terminator")
    rx183_cur."!cursor_debug"("PASS  ", "eat_terminator", " at pos=", rx183_pos)
    .return (rx183_cur)
  rx183_fail:
.annotate "line", 4
    (rx183_rep, rx183_pos, $I10, $P10) = rx183_cur."!mark_fail"(0)
    lt rx183_pos, -1, rx183_done
    eq rx183_pos, -1, rx183_fail
    jump $I10
  rx183_done:
    rx183_cur."!cursor_fail"()
    rx183_cur."!cursor_debug"("FAIL  ", "eat_terminator")
    .return (rx183_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__eat_terminator"  :subid("37_1259103982.97329") :method
.annotate "line", 4
    new $P185, "ResizablePMCArray"
    push $P185, ""
    push $P185, ""
    push $P185, ""
    push $P185, ";"
    .return ($P185)
.end


.namespace ["NQP";"Grammar"]
.sub "xblock"  :subid("38_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx189_tgt
    .local int rx189_pos
    .local int rx189_off
    .local int rx189_eos
    .local int rx189_rep
    .local pmc rx189_cur
    (rx189_cur, rx189_pos, rx189_tgt) = self."!cursor_start"()
    rx189_cur."!cursor_debug"("START ", "xblock")
    .lex unicode:"$\x{a2}", rx189_cur
    .local pmc match
    .lex "$/", match
    length rx189_eos, rx189_tgt
    set rx189_off, 0
    lt rx189_pos, 2, rx189_start
    sub rx189_off, rx189_pos, 1
    substr rx189_tgt, rx189_tgt, rx189_off
  rx189_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan193_done
    goto rxscan193_scan
  rxscan193_loop:
    ($P10) = rx189_cur."from"()
    inc $P10
    set rx189_pos, $P10
    ge rx189_pos, rx189_eos, rxscan193_done
  rxscan193_scan:
    set_addr $I10, rxscan193_loop
    rx189_cur."!mark_push"(0, rx189_pos, $I10)
  rxscan193_done:
.annotate "line", 109
  # rx subrule "EXPR" subtype=capture negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."EXPR"()
    unless $P10, rx189_fail
    rx189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx189_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."ws"()
    unless $P10, rx189_fail
    rx189_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx189_cur."!cursor_pos"(rx189_pos)
    $P10 = rx189_cur."pblock"()
    unless $P10, rx189_fail
    rx189_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx189_pos = $P10."pos"()
.annotate "line", 108
  # rx pass
    rx189_cur."!cursor_pass"(rx189_pos, "xblock")
    rx189_cur."!cursor_debug"("PASS  ", "xblock", " at pos=", rx189_pos)
    .return (rx189_cur)
  rx189_fail:
.annotate "line", 4
    (rx189_rep, rx189_pos, $I10, $P10) = rx189_cur."!mark_fail"(0)
    lt rx189_pos, -1, rx189_done
    eq rx189_pos, -1, rx189_fail
    jump $I10
  rx189_done:
    rx189_cur."!cursor_fail"()
    rx189_cur."!cursor_debug"("FAIL  ", "xblock")
    .return (rx189_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__xblock"  :subid("39_1259103982.97329") :method
.annotate "line", 4
    $P191 = self."!PREFIX__!subrule"("EXPR", "")
    new $P192, "ResizablePMCArray"
    push $P192, $P191
    .return ($P192)
.end


.namespace ["NQP";"Grammar"]
.sub "pblock"  :subid("40_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx195_tgt
    .local int rx195_pos
    .local int rx195_off
    .local int rx195_eos
    .local int rx195_rep
    .local pmc rx195_cur
    (rx195_cur, rx195_pos, rx195_tgt) = self."!cursor_start"()
    rx195_cur."!cursor_debug"("START ", "pblock")
    .lex unicode:"$\x{a2}", rx195_cur
    .local pmc match
    .lex "$/", match
    length rx195_eos, rx195_tgt
    set rx195_off, 0
    lt rx195_pos, 2, rx195_start
    sub rx195_off, rx195_pos, 1
    substr rx195_tgt, rx195_tgt, rx195_off
  rx195_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan200_done
    goto rxscan200_scan
  rxscan200_loop:
    ($P10) = rx195_cur."from"()
    inc $P10
    set rx195_pos, $P10
    ge rx195_pos, rx195_eos, rxscan200_done
  rxscan200_scan:
    set_addr $I10, rxscan200_loop
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
  rxscan200_done:
  alt201_0:
.annotate "line", 112
    set_addr $I10, alt201_1
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
.annotate "line", 113
  # rx subrule "lambda" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."lambda"()
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
.annotate "line", 114
  # rx subrule "newpad" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."newpad"()
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
.annotate "line", 115
  # rx subrule "signature" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."signature"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx195_pos = $P10."pos"()
.annotate "line", 116
  # rx subrule "blockoid" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."blockoid"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx195_pos = $P10."pos"()
.annotate "line", 113
    goto alt201_end
  alt201_1:
    set_addr $I10, alt201_2
    rx195_cur."!mark_push"(0, rx195_pos, $I10)
.annotate "line", 117
  # rx enumcharlist negate=0 zerowidth
    ge rx195_pos, rx195_eos, rx195_fail
    sub $I10, rx195_pos, rx195_off
    substr $S10, rx195_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx195_fail
.annotate "line", 118
  # rx subrule "newpad" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."newpad"()
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
.annotate "line", 119
  # rx subrule "blockoid" subtype=capture negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."blockoid"()
    unless $P10, rx195_fail
    rx195_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx195_pos = $P10."pos"()
.annotate "line", 117
    goto alt201_end
  alt201_2:
.annotate "line", 120
  # rx subrule "panic" subtype=method negate=
    rx195_cur."!cursor_pos"(rx195_pos)
    $P10 = rx195_cur."panic"("Missing block")
    unless $P10, rx195_fail
    rx195_pos = $P10."pos"()
  alt201_end:
.annotate "line", 112
  # rx pass
    rx195_cur."!cursor_pass"(rx195_pos, "pblock")
    rx195_cur."!cursor_debug"("PASS  ", "pblock", " at pos=", rx195_pos)
    .return (rx195_cur)
  rx195_fail:
.annotate "line", 4
    (rx195_rep, rx195_pos, $I10, $P10) = rx195_cur."!mark_fail"(0)
    lt rx195_pos, -1, rx195_done
    eq rx195_pos, -1, rx195_fail
    jump $I10
  rx195_done:
    rx195_cur."!cursor_fail"()
    rx195_cur."!cursor_debug"("FAIL  ", "pblock")
    .return (rx195_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__pblock"  :subid("41_1259103982.97329") :method
.annotate "line", 4
    $P197 = self."!PREFIX__!subrule"("", "")
    $P198 = self."!PREFIX__!subrule"("", "")
    new $P199, "ResizablePMCArray"
    push $P199, $P197
    push $P199, "{"
    push $P199, $P198
    .return ($P199)
.end


.namespace ["NQP";"Grammar"]
.sub "lambda"  :subid("42_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx203_tgt
    .local int rx203_pos
    .local int rx203_off
    .local int rx203_eos
    .local int rx203_rep
    .local pmc rx203_cur
    (rx203_cur, rx203_pos, rx203_tgt) = self."!cursor_start"()
    rx203_cur."!cursor_debug"("START ", "lambda")
    .lex unicode:"$\x{a2}", rx203_cur
    .local pmc match
    .lex "$/", match
    length rx203_eos, rx203_tgt
    set rx203_off, 0
    lt rx203_pos, 2, rx203_start
    sub rx203_off, rx203_pos, 1
    substr rx203_tgt, rx203_tgt, rx203_off
  rx203_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan206_done
    goto rxscan206_scan
  rxscan206_loop:
    ($P10) = rx203_cur."from"()
    inc $P10
    set rx203_pos, $P10
    ge rx203_pos, rx203_eos, rxscan206_done
  rxscan206_scan:
    set_addr $I10, rxscan206_loop
    rx203_cur."!mark_push"(0, rx203_pos, $I10)
  rxscan206_done:
  alt207_0:
.annotate "line", 123
    set_addr $I10, alt207_1
    rx203_cur."!mark_push"(0, rx203_pos, $I10)
  # rx literal  "->"
    add $I11, rx203_pos, 2
    gt $I11, rx203_eos, rx203_fail
    sub $I11, rx203_pos, rx203_off
    substr $S10, rx203_tgt, $I11, 2
    ne $S10, "->", rx203_fail
    add rx203_pos, 2
    goto alt207_end
  alt207_1:
  # rx literal  "<->"
    add $I11, rx203_pos, 3
    gt $I11, rx203_eos, rx203_fail
    sub $I11, rx203_pos, rx203_off
    substr $S10, rx203_tgt, $I11, 3
    ne $S10, "<->", rx203_fail
    add rx203_pos, 3
  alt207_end:
  # rx pass
    rx203_cur."!cursor_pass"(rx203_pos, "lambda")
    rx203_cur."!cursor_debug"("PASS  ", "lambda", " at pos=", rx203_pos)
    .return (rx203_cur)
  rx203_fail:
.annotate "line", 4
    (rx203_rep, rx203_pos, $I10, $P10) = rx203_cur."!mark_fail"(0)
    lt rx203_pos, -1, rx203_done
    eq rx203_pos, -1, rx203_fail
    jump $I10
  rx203_done:
    rx203_cur."!cursor_fail"()
    rx203_cur."!cursor_debug"("FAIL  ", "lambda")
    .return (rx203_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__lambda"  :subid("43_1259103982.97329") :method
.annotate "line", 4
    new $P205, "ResizablePMCArray"
    push $P205, "<->"
    push $P205, "->"
    .return ($P205)
.end


.namespace ["NQP";"Grammar"]
.sub "block"  :subid("44_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx209_tgt
    .local int rx209_pos
    .local int rx209_off
    .local int rx209_eos
    .local int rx209_rep
    .local pmc rx209_cur
    (rx209_cur, rx209_pos, rx209_tgt) = self."!cursor_start"()
    rx209_cur."!cursor_debug"("START ", "block")
    .lex unicode:"$\x{a2}", rx209_cur
    .local pmc match
    .lex "$/", match
    length rx209_eos, rx209_tgt
    set rx209_off, 0
    lt rx209_pos, 2, rx209_start
    sub rx209_off, rx209_pos, 1
    substr rx209_tgt, rx209_tgt, rx209_off
  rx209_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan213_done
    goto rxscan213_scan
  rxscan213_loop:
    ($P10) = rx209_cur."from"()
    inc $P10
    set rx209_pos, $P10
    ge rx209_pos, rx209_eos, rxscan213_done
  rxscan213_scan:
    set_addr $I10, rxscan213_loop
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  rxscan213_done:
  alt214_0:
.annotate "line", 126
    set_addr $I10, alt214_1
    rx209_cur."!mark_push"(0, rx209_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx209_pos, rx209_eos, rx209_fail
    sub $I10, rx209_pos, rx209_off
    substr $S10, rx209_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx209_fail
    goto alt214_end
  alt214_1:
  # rx subrule "panic" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."panic"("Missing block")
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
  alt214_end:
.annotate "line", 127
  # rx subrule "newpad" subtype=method negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."newpad"()
    unless $P10, rx209_fail
    rx209_pos = $P10."pos"()
.annotate "line", 128
  # rx subrule "blockoid" subtype=capture negate=
    rx209_cur."!cursor_pos"(rx209_pos)
    $P10 = rx209_cur."blockoid"()
    unless $P10, rx209_fail
    rx209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx209_pos = $P10."pos"()
.annotate "line", 125
  # rx pass
    rx209_cur."!cursor_pass"(rx209_pos, "block")
    rx209_cur."!cursor_debug"("PASS  ", "block", " at pos=", rx209_pos)
    .return (rx209_cur)
  rx209_fail:
.annotate "line", 4
    (rx209_rep, rx209_pos, $I10, $P10) = rx209_cur."!mark_fail"(0)
    lt rx209_pos, -1, rx209_done
    eq rx209_pos, -1, rx209_fail
    jump $I10
  rx209_done:
    rx209_cur."!cursor_fail"()
    rx209_cur."!cursor_debug"("FAIL  ", "block")
    .return (rx209_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__block"  :subid("45_1259103982.97329") :method
.annotate "line", 4
    $P211 = self."!PREFIX__!subrule"("", "")
    new $P212, "ResizablePMCArray"
    push $P212, $P211
    push $P212, "{"
    .return ($P212)
.end


.namespace ["NQP";"Grammar"]
.sub "blockoid"  :subid("46_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx216_tgt
    .local int rx216_pos
    .local int rx216_off
    .local int rx216_eos
    .local int rx216_rep
    .local pmc rx216_cur
    (rx216_cur, rx216_pos, rx216_tgt) = self."!cursor_start"()
    rx216_cur."!cursor_debug"("START ", "blockoid")
    .lex unicode:"$\x{a2}", rx216_cur
    .local pmc match
    .lex "$/", match
    length rx216_eos, rx216_tgt
    set rx216_off, 0
    lt rx216_pos, 2, rx216_start
    sub rx216_off, rx216_pos, 1
    substr rx216_tgt, rx216_tgt, rx216_off
  rx216_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan220_done
    goto rxscan220_scan
  rxscan220_loop:
    ($P10) = rx216_cur."from"()
    inc $P10
    set rx216_pos, $P10
    ge rx216_pos, rx216_eos, rxscan220_done
  rxscan220_scan:
    set_addr $I10, rxscan220_loop
    rx216_cur."!mark_push"(0, rx216_pos, $I10)
  rxscan220_done:
.annotate "line", 132
  # rx subrule "finishpad" subtype=method negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."finishpad"()
    unless $P10, rx216_fail
    rx216_pos = $P10."pos"()
.annotate "line", 133
  # rx literal  "{"
    add $I11, rx216_pos, 1
    gt $I11, rx216_eos, rx216_fail
    sub $I11, rx216_pos, rx216_off
    substr $S10, rx216_tgt, $I11, 1
    ne $S10, "{", rx216_fail
    add rx216_pos, 1
  # rx subrule "statementlist" subtype=capture negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."statementlist"()
    unless $P10, rx216_fail
    rx216_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statementlist")
    rx216_pos = $P10."pos"()
  alt221_0:
    set_addr $I10, alt221_1
    rx216_cur."!mark_push"(0, rx216_pos, $I10)
  # rx literal  "}"
    add $I11, rx216_pos, 1
    gt $I11, rx216_eos, rx216_fail
    sub $I11, rx216_pos, rx216_off
    substr $S10, rx216_tgt, $I11, 1
    ne $S10, "}", rx216_fail
    add rx216_pos, 1
    goto alt221_end
  alt221_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."FAILGOAL"("'}'")
    unless $P10, rx216_fail
    rx216_pos = $P10."pos"()
  alt221_end:
.annotate "line", 134
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx216_cur."!cursor_pos"(rx216_pos)
    $P10 = rx216_cur."ENDSTMT"()
    unless $P10, rx216_fail
.annotate "line", 131
  # rx pass
    rx216_cur."!cursor_pass"(rx216_pos, "blockoid")
    rx216_cur."!cursor_debug"("PASS  ", "blockoid", " at pos=", rx216_pos)
    .return (rx216_cur)
  rx216_fail:
.annotate "line", 4
    (rx216_rep, rx216_pos, $I10, $P10) = rx216_cur."!mark_fail"(0)
    lt rx216_pos, -1, rx216_done
    eq rx216_pos, -1, rx216_fail
    jump $I10
  rx216_done:
    rx216_cur."!cursor_fail"()
    rx216_cur."!cursor_debug"("FAIL  ", "blockoid")
    .return (rx216_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blockoid"  :subid("47_1259103982.97329") :method
.annotate "line", 4
    $P218 = self."!PREFIX__!subrule"("", "")
    new $P219, "ResizablePMCArray"
    push $P219, $P218
    .return ($P219)
.end


.namespace ["NQP";"Grammar"]
.sub "newpad"  :subid("48_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx224_tgt
    .local int rx224_pos
    .local int rx224_off
    .local int rx224_eos
    .local int rx224_rep
    .local pmc rx224_cur
    (rx224_cur, rx224_pos, rx224_tgt) = self."!cursor_start"()
    rx224_cur."!cursor_debug"("START ", "newpad")
    .lex unicode:"$\x{a2}", rx224_cur
    .local pmc match
    .lex "$/", match
    length rx224_eos, rx224_tgt
    set rx224_off, 0
    lt rx224_pos, 2, rx224_start
    sub rx224_off, rx224_pos, 1
    substr rx224_tgt, rx224_tgt, rx224_off
  rx224_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan227_done
    goto rxscan227_scan
  rxscan227_loop:
    ($P10) = rx224_cur."from"()
    inc $P10
    set rx224_pos, $P10
    ge rx224_pos, rx224_eos, rxscan227_done
  rxscan227_scan:
    set_addr $I10, rxscan227_loop
    rx224_cur."!mark_push"(0, rx224_pos, $I10)
  rxscan227_done:
.annotate "line", 137
  # rx pass
    rx224_cur."!cursor_pass"(rx224_pos, "newpad")
    rx224_cur."!cursor_debug"("PASS  ", "newpad", " at pos=", rx224_pos)
    .return (rx224_cur)
  rx224_fail:
.annotate "line", 4
    (rx224_rep, rx224_pos, $I10, $P10) = rx224_cur."!mark_fail"(0)
    lt rx224_pos, -1, rx224_done
    eq rx224_pos, -1, rx224_fail
    jump $I10
  rx224_done:
    rx224_cur."!cursor_fail"()
    rx224_cur."!cursor_debug"("FAIL  ", "newpad")
    .return (rx224_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__newpad"  :subid("49_1259103982.97329") :method
.annotate "line", 4
    new $P226, "ResizablePMCArray"
    push $P226, ""
    .return ($P226)
.end


.namespace ["NQP";"Grammar"]
.sub "finishpad"  :subid("50_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx229_tgt
    .local int rx229_pos
    .local int rx229_off
    .local int rx229_eos
    .local int rx229_rep
    .local pmc rx229_cur
    (rx229_cur, rx229_pos, rx229_tgt) = self."!cursor_start"()
    rx229_cur."!cursor_debug"("START ", "finishpad")
    .lex unicode:"$\x{a2}", rx229_cur
    .local pmc match
    .lex "$/", match
    length rx229_eos, rx229_tgt
    set rx229_off, 0
    lt rx229_pos, 2, rx229_start
    sub rx229_off, rx229_pos, 1
    substr rx229_tgt, rx229_tgt, rx229_off
  rx229_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan232_done
    goto rxscan232_scan
  rxscan232_loop:
    ($P10) = rx229_cur."from"()
    inc $P10
    set rx229_pos, $P10
    ge rx229_pos, rx229_eos, rxscan232_done
  rxscan232_scan:
    set_addr $I10, rxscan232_loop
    rx229_cur."!mark_push"(0, rx229_pos, $I10)
  rxscan232_done:
.annotate "line", 138
  # rx pass
    rx229_cur."!cursor_pass"(rx229_pos, "finishpad")
    rx229_cur."!cursor_debug"("PASS  ", "finishpad", " at pos=", rx229_pos)
    .return (rx229_cur)
  rx229_fail:
.annotate "line", 4
    (rx229_rep, rx229_pos, $I10, $P10) = rx229_cur."!mark_fail"(0)
    lt rx229_pos, -1, rx229_done
    eq rx229_pos, -1, rx229_fail
    jump $I10
  rx229_done:
    rx229_cur."!cursor_fail"()
    rx229_cur."!cursor_debug"("FAIL  ", "finishpad")
    .return (rx229_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__finishpad"  :subid("51_1259103982.97329") :method
.annotate "line", 4
    new $P231, "ResizablePMCArray"
    push $P231, ""
    .return ($P231)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator"  :subid("52_1259103982.97329") :method
.annotate "line", 140
    $P234 = self."!protoregex"("terminator")
    .return ($P234)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator"  :subid("53_1259103982.97329") :method
.annotate "line", 140
    $P236 = self."!PREFIX__!protoregex"("terminator")
    .return ($P236)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<;>"  :subid("54_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx238_tgt
    .local int rx238_pos
    .local int rx238_off
    .local int rx238_eos
    .local int rx238_rep
    .local pmc rx238_cur
    (rx238_cur, rx238_pos, rx238_tgt) = self."!cursor_start"()
    rx238_cur."!cursor_debug"("START ", "terminator:sym<;>")
    .lex unicode:"$\x{a2}", rx238_cur
    .local pmc match
    .lex "$/", match
    length rx238_eos, rx238_tgt
    set rx238_off, 0
    lt rx238_pos, 2, rx238_start
    sub rx238_off, rx238_pos, 1
    substr rx238_tgt, rx238_tgt, rx238_off
  rx238_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan241_done
    goto rxscan241_scan
  rxscan241_loop:
    ($P10) = rx238_cur."from"()
    inc $P10
    set rx238_pos, $P10
    ge rx238_pos, rx238_eos, rxscan241_done
  rxscan241_scan:
    set_addr $I10, rxscan241_loop
    rx238_cur."!mark_push"(0, rx238_pos, $I10)
  rxscan241_done:
.annotate "line", 142
  # rx enumcharlist negate=0 zerowidth
    ge rx238_pos, rx238_eos, rx238_fail
    sub $I10, rx238_pos, rx238_off
    substr $S10, rx238_tgt, $I10, 1
    index $I11, ";", $S10
    lt $I11, 0, rx238_fail
  # rx pass
    rx238_cur."!cursor_pass"(rx238_pos, "terminator:sym<;>")
    rx238_cur."!cursor_debug"("PASS  ", "terminator:sym<;>", " at pos=", rx238_pos)
    .return (rx238_cur)
  rx238_fail:
.annotate "line", 4
    (rx238_rep, rx238_pos, $I10, $P10) = rx238_cur."!mark_fail"(0)
    lt rx238_pos, -1, rx238_done
    eq rx238_pos, -1, rx238_fail
    jump $I10
  rx238_done:
    rx238_cur."!cursor_fail"()
    rx238_cur."!cursor_debug"("FAIL  ", "terminator:sym<;>")
    .return (rx238_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<;>"  :subid("55_1259103982.97329") :method
.annotate "line", 4
    new $P240, "ResizablePMCArray"
    push $P240, ";"
    .return ($P240)
.end


.namespace ["NQP";"Grammar"]
.sub "terminator:sym<}>"  :subid("56_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx243_tgt
    .local int rx243_pos
    .local int rx243_off
    .local int rx243_eos
    .local int rx243_rep
    .local pmc rx243_cur
    (rx243_cur, rx243_pos, rx243_tgt) = self."!cursor_start"()
    rx243_cur."!cursor_debug"("START ", "terminator:sym<}>")
    .lex unicode:"$\x{a2}", rx243_cur
    .local pmc match
    .lex "$/", match
    length rx243_eos, rx243_tgt
    set rx243_off, 0
    lt rx243_pos, 2, rx243_start
    sub rx243_off, rx243_pos, 1
    substr rx243_tgt, rx243_tgt, rx243_off
  rx243_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan246_done
    goto rxscan246_scan
  rxscan246_loop:
    ($P10) = rx243_cur."from"()
    inc $P10
    set rx243_pos, $P10
    ge rx243_pos, rx243_eos, rxscan246_done
  rxscan246_scan:
    set_addr $I10, rxscan246_loop
    rx243_cur."!mark_push"(0, rx243_pos, $I10)
  rxscan246_done:
.annotate "line", 143
  # rx enumcharlist negate=0 zerowidth
    ge rx243_pos, rx243_eos, rx243_fail
    sub $I10, rx243_pos, rx243_off
    substr $S10, rx243_tgt, $I10, 1
    index $I11, "}", $S10
    lt $I11, 0, rx243_fail
  # rx pass
    rx243_cur."!cursor_pass"(rx243_pos, "terminator:sym<}>")
    rx243_cur."!cursor_debug"("PASS  ", "terminator:sym<}>", " at pos=", rx243_pos)
    .return (rx243_cur)
  rx243_fail:
.annotate "line", 4
    (rx243_rep, rx243_pos, $I10, $P10) = rx243_cur."!mark_fail"(0)
    lt rx243_pos, -1, rx243_done
    eq rx243_pos, -1, rx243_fail
    jump $I10
  rx243_done:
    rx243_cur."!cursor_fail"()
    rx243_cur."!cursor_debug"("FAIL  ", "terminator:sym<}>")
    .return (rx243_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__terminator:sym<}>"  :subid("57_1259103982.97329") :method
.annotate "line", 4
    new $P245, "ResizablePMCArray"
    push $P245, "}"
    .return ($P245)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control"  :subid("58_1259103982.97329") :method
.annotate "line", 147
    $P248 = self."!protoregex"("statement_control")
    .return ($P248)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control"  :subid("59_1259103982.97329") :method
.annotate "line", 147
    $P250 = self."!PREFIX__!protoregex"("statement_control")
    .return ($P250)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<if>"  :subid("60_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx252_tgt
    .local int rx252_pos
    .local int rx252_off
    .local int rx252_eos
    .local int rx252_rep
    .local pmc rx252_cur
    (rx252_cur, rx252_pos, rx252_tgt) = self."!cursor_start"()
    rx252_cur."!cursor_debug"("START ", "statement_control:sym<if>")
    rx252_cur."!cursor_caparray"("else", "xblock")
    .lex unicode:"$\x{a2}", rx252_cur
    .local pmc match
    .lex "$/", match
    length rx252_eos, rx252_tgt
    set rx252_off, 0
    lt rx252_pos, 2, rx252_start
    sub rx252_off, rx252_pos, 1
    substr rx252_tgt, rx252_tgt, rx252_off
  rx252_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan255_done
    goto rxscan255_scan
  rxscan255_loop:
    ($P10) = rx252_cur."from"()
    inc $P10
    set rx252_pos, $P10
    ge rx252_pos, rx252_eos, rxscan255_done
  rxscan255_scan:
    set_addr $I10, rxscan255_loop
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  rxscan255_done:
.annotate "line", 150
  # rx subcapture "sym"
    set_addr $I10, rxcap_256_fail
    rx252_cur."!mark_push"(0, rx252_pos, $I10)
  # rx literal  "if"
    add $I11, rx252_pos, 2
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 2
    ne $S10, "if", rx252_fail
    add rx252_pos, 2
    set_addr $I10, rxcap_256_fail
    ($I12, $I11) = rx252_cur."!mark_peek"($I10)
    rx252_cur."!cursor_pos"($I11)
    ($P10) = rx252_cur."!cursor_start"()
    $P10."!cursor_pass"(rx252_pos, "")
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_256_done
  rxcap_256_fail:
    goto rx252_fail
  rxcap_256_done:
  # rx charclass s
    ge rx252_pos, rx252_eos, rx252_fail
    sub $I10, rx252_pos, rx252_off
    is_cclass $I11, 32, rx252_tgt, $I10
    unless $I11, rx252_fail
    inc rx252_pos
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 151
  # rx subrule "xblock" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."xblock"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 152
  # rx rxquantr259 ** 0..*
    set_addr $I263, rxquantr259_done
    rx252_cur."!mark_push"(0, rx252_pos, $I263)
  rxquantr259_loop:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx literal  "elsif"
    add $I11, rx252_pos, 5
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 5
    ne $S10, "elsif", rx252_fail
    add rx252_pos, 5
  # rx charclass s
    ge rx252_pos, rx252_eos, rx252_fail
    sub $I10, rx252_pos, rx252_off
    is_cclass $I11, 32, rx252_tgt, $I10
    unless $I11, rx252_fail
    inc rx252_pos
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."xblock"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
    (rx252_rep) = rx252_cur."!mark_commit"($I263)
    rx252_cur."!mark_push"(rx252_rep, rx252_pos, $I263)
    goto rxquantr259_loop
  rxquantr259_done:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 153
  # rx rxquantr265 ** 0..1
    set_addr $I269, rxquantr265_done
    rx252_cur."!mark_push"(0, rx252_pos, $I269)
  rxquantr265_loop:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx literal  "else"
    add $I11, rx252_pos, 4
    gt $I11, rx252_eos, rx252_fail
    sub $I11, rx252_pos, rx252_off
    substr $S10, rx252_tgt, $I11, 4
    ne $S10, "else", rx252_fail
    add rx252_pos, 4
  # rx charclass s
    ge rx252_pos, rx252_eos, rx252_fail
    sub $I10, rx252_pos, rx252_off
    is_cclass $I11, 32, rx252_tgt, $I10
    unless $I11, rx252_fail
    inc rx252_pos
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."pblock"()
    unless $P10, rx252_fail
    rx252_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("else")
    rx252_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
    (rx252_rep) = rx252_cur."!mark_commit"($I269)
  rxquantr265_done:
  # rx subrule "ws" subtype=method negate=
    rx252_cur."!cursor_pos"(rx252_pos)
    $P10 = rx252_cur."ws"()
    unless $P10, rx252_fail
    rx252_pos = $P10."pos"()
.annotate "line", 149
  # rx pass
    rx252_cur."!cursor_pass"(rx252_pos, "statement_control:sym<if>")
    rx252_cur."!cursor_debug"("PASS  ", "statement_control:sym<if>", " at pos=", rx252_pos)
    .return (rx252_cur)
  rx252_fail:
.annotate "line", 4
    (rx252_rep, rx252_pos, $I10, $P10) = rx252_cur."!mark_fail"(0)
    lt rx252_pos, -1, rx252_done
    eq rx252_pos, -1, rx252_fail
    jump $I10
  rx252_done:
    rx252_cur."!cursor_fail"()
    rx252_cur."!cursor_debug"("FAIL  ", "statement_control:sym<if>")
    .return (rx252_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<if>"  :subid("61_1259103982.97329") :method
.annotate "line", 4
    new $P254, "ResizablePMCArray"
    push $P254, "if"
    .return ($P254)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<unless>"  :subid("62_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .const 'Sub' $P282 = "64_1259103982.97329" 
    capture_lex $P282
    .local string rx272_tgt
    .local int rx272_pos
    .local int rx272_off
    .local int rx272_eos
    .local int rx272_rep
    .local pmc rx272_cur
    (rx272_cur, rx272_pos, rx272_tgt) = self."!cursor_start"()
    rx272_cur."!cursor_debug"("START ", "statement_control:sym<unless>")
    .lex unicode:"$\x{a2}", rx272_cur
    .local pmc match
    .lex "$/", match
    length rx272_eos, rx272_tgt
    set rx272_off, 0
    lt rx272_pos, 2, rx272_start
    sub rx272_off, rx272_pos, 1
    substr rx272_tgt, rx272_tgt, rx272_off
  rx272_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan275_done
    goto rxscan275_scan
  rxscan275_loop:
    ($P10) = rx272_cur."from"()
    inc $P10
    set rx272_pos, $P10
    ge rx272_pos, rx272_eos, rxscan275_done
  rxscan275_scan:
    set_addr $I10, rxscan275_loop
    rx272_cur."!mark_push"(0, rx272_pos, $I10)
  rxscan275_done:
.annotate "line", 157
  # rx subcapture "sym"
    set_addr $I10, rxcap_276_fail
    rx272_cur."!mark_push"(0, rx272_pos, $I10)
  # rx literal  "unless"
    add $I11, rx272_pos, 6
    gt $I11, rx272_eos, rx272_fail
    sub $I11, rx272_pos, rx272_off
    substr $S10, rx272_tgt, $I11, 6
    ne $S10, "unless", rx272_fail
    add rx272_pos, 6
    set_addr $I10, rxcap_276_fail
    ($I12, $I11) = rx272_cur."!mark_peek"($I10)
    rx272_cur."!cursor_pos"($I11)
    ($P10) = rx272_cur."!cursor_start"()
    $P10."!cursor_pass"(rx272_pos, "")
    rx272_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_276_done
  rxcap_276_fail:
    goto rx272_fail
  rxcap_276_done:
  # rx charclass s
    ge rx272_pos, rx272_eos, rx272_fail
    sub $I10, rx272_pos, rx272_off
    is_cclass $I11, 32, rx272_tgt, $I10
    unless $I11, rx272_fail
    inc rx272_pos
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
.annotate "line", 158
  # rx subrule "xblock" subtype=capture negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."xblock"()
    unless $P10, rx272_fail
    rx272_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx272_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  alt279_0:
.annotate "line", 159
    set_addr $I10, alt279_1
    rx272_cur."!mark_push"(0, rx272_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  # rx subrule "before" subtype=zerowidth negate=1
    rx272_cur."!cursor_pos"(rx272_pos)
    .const 'Sub' $P282 = "64_1259103982.97329" 
    capture_lex $P282
    $P10 = rx272_cur."before"($P282)
    if $P10, rx272_fail
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
    goto alt279_end
  alt279_1:
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."panic"("unless does not take \"else\", please rewrite using \"if\"")
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
  alt279_end:
  # rx subrule "ws" subtype=method negate=
    rx272_cur."!cursor_pos"(rx272_pos)
    $P10 = rx272_cur."ws"()
    unless $P10, rx272_fail
    rx272_pos = $P10."pos"()
.annotate "line", 156
  # rx pass
    rx272_cur."!cursor_pass"(rx272_pos, "statement_control:sym<unless>")
    rx272_cur."!cursor_debug"("PASS  ", "statement_control:sym<unless>", " at pos=", rx272_pos)
    .return (rx272_cur)
  rx272_fail:
.annotate "line", 4
    (rx272_rep, rx272_pos, $I10, $P10) = rx272_cur."!mark_fail"(0)
    lt rx272_pos, -1, rx272_done
    eq rx272_pos, -1, rx272_fail
    jump $I10
  rx272_done:
    rx272_cur."!cursor_fail"()
    rx272_cur."!cursor_debug"("FAIL  ", "statement_control:sym<unless>")
    .return (rx272_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<unless>"  :subid("63_1259103982.97329") :method
.annotate "line", 4
    new $P274, "ResizablePMCArray"
    push $P274, "unless"
    .return ($P274)
.end


.namespace ["NQP";"Grammar"]
.sub "_block281"  :anon :subid("64_1259103982.97329") :method :outer("62_1259103982.97329")
.annotate "line", 159
    .local string rx283_tgt
    .local int rx283_pos
    .local int rx283_off
    .local int rx283_eos
    .local int rx283_rep
    .local pmc rx283_cur
    (rx283_cur, rx283_pos, rx283_tgt) = self."!cursor_start"()
    rx283_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx283_cur
    .local pmc match
    .lex "$/", match
    length rx283_eos, rx283_tgt
    set rx283_off, 0
    lt rx283_pos, 2, rx283_start
    sub rx283_off, rx283_pos, 1
    substr rx283_tgt, rx283_tgt, rx283_off
  rx283_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan284_done
    goto rxscan284_scan
  rxscan284_loop:
    ($P10) = rx283_cur."from"()
    inc $P10
    set rx283_pos, $P10
    ge rx283_pos, rx283_eos, rxscan284_done
  rxscan284_scan:
    set_addr $I10, rxscan284_loop
    rx283_cur."!mark_push"(0, rx283_pos, $I10)
  rxscan284_done:
  # rx literal  "else"
    add $I11, rx283_pos, 4
    gt $I11, rx283_eos, rx283_fail
    sub $I11, rx283_pos, rx283_off
    substr $S10, rx283_tgt, $I11, 4
    ne $S10, "else", rx283_fail
    add rx283_pos, 4
  # rx pass
    rx283_cur."!cursor_pass"(rx283_pos, "")
    rx283_cur."!cursor_debug"("PASS  ", "", " at pos=", rx283_pos)
    .return (rx283_cur)
  rx283_fail:
    (rx283_rep, rx283_pos, $I10, $P10) = rx283_cur."!mark_fail"(0)
    lt rx283_pos, -1, rx283_done
    eq rx283_pos, -1, rx283_fail
    jump $I10
  rx283_done:
    rx283_cur."!cursor_fail"()
    rx283_cur."!cursor_debug"("FAIL  ", "")
    .return (rx283_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<while>"  :subid("65_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx290_tgt
    .local int rx290_pos
    .local int rx290_off
    .local int rx290_eos
    .local int rx290_rep
    .local pmc rx290_cur
    (rx290_cur, rx290_pos, rx290_tgt) = self."!cursor_start"()
    rx290_cur."!cursor_debug"("START ", "statement_control:sym<while>")
    .lex unicode:"$\x{a2}", rx290_cur
    .local pmc match
    .lex "$/", match
    length rx290_eos, rx290_tgt
    set rx290_off, 0
    lt rx290_pos, 2, rx290_start
    sub rx290_off, rx290_pos, 1
    substr rx290_tgt, rx290_tgt, rx290_off
  rx290_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan293_done
    goto rxscan293_scan
  rxscan293_loop:
    ($P10) = rx290_cur."from"()
    inc $P10
    set rx290_pos, $P10
    ge rx290_pos, rx290_eos, rxscan293_done
  rxscan293_scan:
    set_addr $I10, rxscan293_loop
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  rxscan293_done:
.annotate "line", 163
  # rx subcapture "sym"
    set_addr $I10, rxcap_295_fail
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  alt294_0:
    set_addr $I10, alt294_1
    rx290_cur."!mark_push"(0, rx290_pos, $I10)
  # rx literal  "while"
    add $I11, rx290_pos, 5
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 5
    ne $S10, "while", rx290_fail
    add rx290_pos, 5
    goto alt294_end
  alt294_1:
  # rx literal  "until"
    add $I11, rx290_pos, 5
    gt $I11, rx290_eos, rx290_fail
    sub $I11, rx290_pos, rx290_off
    substr $S10, rx290_tgt, $I11, 5
    ne $S10, "until", rx290_fail
    add rx290_pos, 5
  alt294_end:
    set_addr $I10, rxcap_295_fail
    ($I12, $I11) = rx290_cur."!mark_peek"($I10)
    rx290_cur."!cursor_pos"($I11)
    ($P10) = rx290_cur."!cursor_start"()
    $P10."!cursor_pass"(rx290_pos, "")
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_295_done
  rxcap_295_fail:
    goto rx290_fail
  rxcap_295_done:
  # rx charclass s
    ge rx290_pos, rx290_eos, rx290_fail
    sub $I10, rx290_pos, rx290_off
    is_cclass $I11, 32, rx290_tgt, $I10
    unless $I11, rx290_fail
    inc rx290_pos
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
.annotate "line", 164
  # rx subrule "xblock" subtype=capture negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."xblock"()
    unless $P10, rx290_fail
    rx290_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx290_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx290_cur."!cursor_pos"(rx290_pos)
    $P10 = rx290_cur."ws"()
    unless $P10, rx290_fail
    rx290_pos = $P10."pos"()
.annotate "line", 162
  # rx pass
    rx290_cur."!cursor_pass"(rx290_pos, "statement_control:sym<while>")
    rx290_cur."!cursor_debug"("PASS  ", "statement_control:sym<while>", " at pos=", rx290_pos)
    .return (rx290_cur)
  rx290_fail:
.annotate "line", 4
    (rx290_rep, rx290_pos, $I10, $P10) = rx290_cur."!mark_fail"(0)
    lt rx290_pos, -1, rx290_done
    eq rx290_pos, -1, rx290_fail
    jump $I10
  rx290_done:
    rx290_cur."!cursor_fail"()
    rx290_cur."!cursor_debug"("FAIL  ", "statement_control:sym<while>")
    .return (rx290_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<while>"  :subid("66_1259103982.97329") :method
.annotate "line", 4
    new $P292, "ResizablePMCArray"
    push $P292, "until"
    push $P292, "while"
    .return ($P292)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<repeat>"  :subid("67_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx299_tgt
    .local int rx299_pos
    .local int rx299_off
    .local int rx299_eos
    .local int rx299_rep
    .local pmc rx299_cur
    (rx299_cur, rx299_pos, rx299_tgt) = self."!cursor_start"()
    rx299_cur."!cursor_debug"("START ", "statement_control:sym<repeat>")
    .lex unicode:"$\x{a2}", rx299_cur
    .local pmc match
    .lex "$/", match
    length rx299_eos, rx299_tgt
    set rx299_off, 0
    lt rx299_pos, 2, rx299_start
    sub rx299_off, rx299_pos, 1
    substr rx299_tgt, rx299_tgt, rx299_off
  rx299_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan302_done
    goto rxscan302_scan
  rxscan302_loop:
    ($P10) = rx299_cur."from"()
    inc $P10
    set rx299_pos, $P10
    ge rx299_pos, rx299_eos, rxscan302_done
  rxscan302_scan:
    set_addr $I10, rxscan302_loop
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  rxscan302_done:
.annotate "line", 168
  # rx subcapture "sym"
    set_addr $I10, rxcap_303_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx literal  "repeat"
    add $I11, rx299_pos, 6
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 6
    ne $S10, "repeat", rx299_fail
    add rx299_pos, 6
    set_addr $I10, rxcap_303_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_303_done
  rxcap_303_fail:
    goto rx299_fail
  rxcap_303_done:
  # rx charclass s
    ge rx299_pos, rx299_eos, rx299_fail
    sub $I10, rx299_pos, rx299_off
    is_cclass $I11, 32, rx299_tgt, $I10
    unless $I11, rx299_fail
    inc rx299_pos
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  alt305_0:
.annotate "line", 169
    set_addr $I10, alt305_1
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
.annotate "line", 170
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_308_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  alt307_0:
    set_addr $I10, alt307_1
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx literal  "while"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "while", rx299_fail
    add rx299_pos, 5
    goto alt307_end
  alt307_1:
  # rx literal  "until"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "until", rx299_fail
    add rx299_pos, 5
  alt307_end:
    set_addr $I10, rxcap_308_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_308_done
  rxcap_308_fail:
    goto rx299_fail
  rxcap_308_done:
  # rx charclass s
    ge rx299_pos, rx299_eos, rx299_fail
    sub $I10, rx299_pos, rx299_off
    is_cclass $I11, 32, rx299_tgt, $I10
    unless $I11, rx299_fail
    inc rx299_pos
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  # rx subrule "xblock" subtype=capture negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."xblock"()
    unless $P10, rx299_fail
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx299_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
    goto alt305_end
  alt305_1:
.annotate "line", 171
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  # rx subrule "pblock" subtype=capture negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."pblock"()
    unless $P10, rx299_fail
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx299_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  # rx subcapture "wu"
    set_addr $I10, rxcap_314_fail
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  alt313_0:
    set_addr $I10, alt313_1
    rx299_cur."!mark_push"(0, rx299_pos, $I10)
  # rx literal  "while"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "while", rx299_fail
    add rx299_pos, 5
    goto alt313_end
  alt313_1:
  # rx literal  "until"
    add $I11, rx299_pos, 5
    gt $I11, rx299_eos, rx299_fail
    sub $I11, rx299_pos, rx299_off
    substr $S10, rx299_tgt, $I11, 5
    ne $S10, "until", rx299_fail
    add rx299_pos, 5
  alt313_end:
    set_addr $I10, rxcap_314_fail
    ($I12, $I11) = rx299_cur."!mark_peek"($I10)
    rx299_cur."!cursor_pos"($I11)
    ($P10) = rx299_cur."!cursor_start"()
    $P10."!cursor_pass"(rx299_pos, "")
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("wu")
    goto rxcap_314_done
  rxcap_314_fail:
    goto rx299_fail
  rxcap_314_done:
  # rx charclass s
    ge rx299_pos, rx299_eos, rx299_fail
    sub $I10, rx299_pos, rx299_off
    is_cclass $I11, 32, rx299_tgt, $I10
    unless $I11, rx299_fail
    inc rx299_pos
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."EXPR"()
    unless $P10, rx299_fail
    rx299_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx299_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
  alt305_end:
.annotate "line", 172
  # rx subrule "ws" subtype=method negate=
    rx299_cur."!cursor_pos"(rx299_pos)
    $P10 = rx299_cur."ws"()
    unless $P10, rx299_fail
    rx299_pos = $P10."pos"()
.annotate "line", 167
  # rx pass
    rx299_cur."!cursor_pass"(rx299_pos, "statement_control:sym<repeat>")
    rx299_cur."!cursor_debug"("PASS  ", "statement_control:sym<repeat>", " at pos=", rx299_pos)
    .return (rx299_cur)
  rx299_fail:
.annotate "line", 4
    (rx299_rep, rx299_pos, $I10, $P10) = rx299_cur."!mark_fail"(0)
    lt rx299_pos, -1, rx299_done
    eq rx299_pos, -1, rx299_fail
    jump $I10
  rx299_done:
    rx299_cur."!cursor_fail"()
    rx299_cur."!cursor_debug"("FAIL  ", "statement_control:sym<repeat>")
    .return (rx299_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<repeat>"  :subid("68_1259103982.97329") :method
.annotate "line", 4
    new $P301, "ResizablePMCArray"
    push $P301, "repeat"
    .return ($P301)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_control:sym<for>"  :subid("69_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx319_tgt
    .local int rx319_pos
    .local int rx319_off
    .local int rx319_eos
    .local int rx319_rep
    .local pmc rx319_cur
    (rx319_cur, rx319_pos, rx319_tgt) = self."!cursor_start"()
    rx319_cur."!cursor_debug"("START ", "statement_control:sym<for>")
    .lex unicode:"$\x{a2}", rx319_cur
    .local pmc match
    .lex "$/", match
    length rx319_eos, rx319_tgt
    set rx319_off, 0
    lt rx319_pos, 2, rx319_start
    sub rx319_off, rx319_pos, 1
    substr rx319_tgt, rx319_tgt, rx319_off
  rx319_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan322_done
    goto rxscan322_scan
  rxscan322_loop:
    ($P10) = rx319_cur."from"()
    inc $P10
    set rx319_pos, $P10
    ge rx319_pos, rx319_eos, rxscan322_done
  rxscan322_scan:
    set_addr $I10, rxscan322_loop
    rx319_cur."!mark_push"(0, rx319_pos, $I10)
  rxscan322_done:
.annotate "line", 176
  # rx subcapture "sym"
    set_addr $I10, rxcap_323_fail
    rx319_cur."!mark_push"(0, rx319_pos, $I10)
  # rx literal  "for"
    add $I11, rx319_pos, 3
    gt $I11, rx319_eos, rx319_fail
    sub $I11, rx319_pos, rx319_off
    substr $S10, rx319_tgt, $I11, 3
    ne $S10, "for", rx319_fail
    add rx319_pos, 3
    set_addr $I10, rxcap_323_fail
    ($I12, $I11) = rx319_cur."!mark_peek"($I10)
    rx319_cur."!cursor_pos"($I11)
    ($P10) = rx319_cur."!cursor_start"()
    $P10."!cursor_pass"(rx319_pos, "")
    rx319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_323_done
  rxcap_323_fail:
    goto rx319_fail
  rxcap_323_done:
  # rx charclass s
    ge rx319_pos, rx319_eos, rx319_fail
    sub $I10, rx319_pos, rx319_off
    is_cclass $I11, 32, rx319_tgt, $I10
    unless $I11, rx319_fail
    inc rx319_pos
  # rx subrule "ws" subtype=method negate=
    rx319_cur."!cursor_pos"(rx319_pos)
    $P10 = rx319_cur."ws"()
    unless $P10, rx319_fail
    rx319_pos = $P10."pos"()
.annotate "line", 177
  # rx subrule "xblock" subtype=capture negate=
    rx319_cur."!cursor_pos"(rx319_pos)
    $P10 = rx319_cur."xblock"()
    unless $P10, rx319_fail
    rx319_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("xblock")
    rx319_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx319_cur."!cursor_pos"(rx319_pos)
    $P10 = rx319_cur."ws"()
    unless $P10, rx319_fail
    rx319_pos = $P10."pos"()
.annotate "line", 175
  # rx pass
    rx319_cur."!cursor_pass"(rx319_pos, "statement_control:sym<for>")
    rx319_cur."!cursor_debug"("PASS  ", "statement_control:sym<for>", " at pos=", rx319_pos)
    .return (rx319_cur)
  rx319_fail:
.annotate "line", 4
    (rx319_rep, rx319_pos, $I10, $P10) = rx319_cur."!mark_fail"(0)
    lt rx319_pos, -1, rx319_done
    eq rx319_pos, -1, rx319_fail
    jump $I10
  rx319_done:
    rx319_cur."!cursor_fail"()
    rx319_cur."!cursor_debug"("FAIL  ", "statement_control:sym<for>")
    .return (rx319_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_control:sym<for>"  :subid("70_1259103982.97329") :method
.annotate "line", 4
    new $P321, "ResizablePMCArray"
    push $P321, "for"
    .return ($P321)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix"  :subid("71_1259103982.97329") :method
.annotate "line", 180
    $P327 = self."!protoregex"("statement_prefix")
    .return ($P327)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix"  :subid("72_1259103982.97329") :method
.annotate "line", 180
    $P329 = self."!PREFIX__!protoregex"("statement_prefix")
    .return ($P329)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<INIT>"  :subid("73_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx331_tgt
    .local int rx331_pos
    .local int rx331_off
    .local int rx331_eos
    .local int rx331_rep
    .local pmc rx331_cur
    (rx331_cur, rx331_pos, rx331_tgt) = self."!cursor_start"()
    rx331_cur."!cursor_debug"("START ", "statement_prefix:sym<INIT>")
    .lex unicode:"$\x{a2}", rx331_cur
    .local pmc match
    .lex "$/", match
    length rx331_eos, rx331_tgt
    set rx331_off, 0
    lt rx331_pos, 2, rx331_start
    sub rx331_off, rx331_pos, 1
    substr rx331_tgt, rx331_tgt, rx331_off
  rx331_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan335_done
    goto rxscan335_scan
  rxscan335_loop:
    ($P10) = rx331_cur."from"()
    inc $P10
    set rx331_pos, $P10
    ge rx331_pos, rx331_eos, rxscan335_done
  rxscan335_scan:
    set_addr $I10, rxscan335_loop
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  rxscan335_done:
.annotate "line", 181
  # rx subcapture "sym"
    set_addr $I10, rxcap_336_fail
    rx331_cur."!mark_push"(0, rx331_pos, $I10)
  # rx literal  "INIT"
    add $I11, rx331_pos, 4
    gt $I11, rx331_eos, rx331_fail
    sub $I11, rx331_pos, rx331_off
    substr $S10, rx331_tgt, $I11, 4
    ne $S10, "INIT", rx331_fail
    add rx331_pos, 4
    set_addr $I10, rxcap_336_fail
    ($I12, $I11) = rx331_cur."!mark_peek"($I10)
    rx331_cur."!cursor_pos"($I11)
    ($P10) = rx331_cur."!cursor_start"()
    $P10."!cursor_pass"(rx331_pos, "")
    rx331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_336_done
  rxcap_336_fail:
    goto rx331_fail
  rxcap_336_done:
  # rx subrule "blorst" subtype=capture negate=
    rx331_cur."!cursor_pos"(rx331_pos)
    $P10 = rx331_cur."blorst"()
    unless $P10, rx331_fail
    rx331_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx331_pos = $P10."pos"()
  # rx pass
    rx331_cur."!cursor_pass"(rx331_pos, "statement_prefix:sym<INIT>")
    rx331_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<INIT>", " at pos=", rx331_pos)
    .return (rx331_cur)
  rx331_fail:
.annotate "line", 4
    (rx331_rep, rx331_pos, $I10, $P10) = rx331_cur."!mark_fail"(0)
    lt rx331_pos, -1, rx331_done
    eq rx331_pos, -1, rx331_fail
    jump $I10
  rx331_done:
    rx331_cur."!cursor_fail"()
    rx331_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<INIT>")
    .return (rx331_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<INIT>"  :subid("74_1259103982.97329") :method
.annotate "line", 4
    $P333 = self."!PREFIX__!subrule"("blorst", "INIT")
    new $P334, "ResizablePMCArray"
    push $P334, $P333
    .return ($P334)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_prefix:sym<try>"  :subid("75_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx338_tgt
    .local int rx338_pos
    .local int rx338_off
    .local int rx338_eos
    .local int rx338_rep
    .local pmc rx338_cur
    (rx338_cur, rx338_pos, rx338_tgt) = self."!cursor_start"()
    rx338_cur."!cursor_debug"("START ", "statement_prefix:sym<try>")
    .lex unicode:"$\x{a2}", rx338_cur
    .local pmc match
    .lex "$/", match
    length rx338_eos, rx338_tgt
    set rx338_off, 0
    lt rx338_pos, 2, rx338_start
    sub rx338_off, rx338_pos, 1
    substr rx338_tgt, rx338_tgt, rx338_off
  rx338_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan342_done
    goto rxscan342_scan
  rxscan342_loop:
    ($P10) = rx338_cur."from"()
    inc $P10
    set rx338_pos, $P10
    ge rx338_pos, rx338_eos, rxscan342_done
  rxscan342_scan:
    set_addr $I10, rxscan342_loop
    rx338_cur."!mark_push"(0, rx338_pos, $I10)
  rxscan342_done:
.annotate "line", 184
  # rx subcapture "sym"
    set_addr $I10, rxcap_343_fail
    rx338_cur."!mark_push"(0, rx338_pos, $I10)
  # rx literal  "try"
    add $I11, rx338_pos, 3
    gt $I11, rx338_eos, rx338_fail
    sub $I11, rx338_pos, rx338_off
    substr $S10, rx338_tgt, $I11, 3
    ne $S10, "try", rx338_fail
    add rx338_pos, 3
    set_addr $I10, rxcap_343_fail
    ($I12, $I11) = rx338_cur."!mark_peek"($I10)
    rx338_cur."!cursor_pos"($I11)
    ($P10) = rx338_cur."!cursor_start"()
    $P10."!cursor_pass"(rx338_pos, "")
    rx338_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_343_done
  rxcap_343_fail:
    goto rx338_fail
  rxcap_343_done:
.annotate "line", 185
  # rx subrule "blorst" subtype=capture negate=
    rx338_cur."!cursor_pos"(rx338_pos)
    $P10 = rx338_cur."blorst"()
    unless $P10, rx338_fail
    rx338_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blorst")
    rx338_pos = $P10."pos"()
.annotate "line", 183
  # rx pass
    rx338_cur."!cursor_pass"(rx338_pos, "statement_prefix:sym<try>")
    rx338_cur."!cursor_debug"("PASS  ", "statement_prefix:sym<try>", " at pos=", rx338_pos)
    .return (rx338_cur)
  rx338_fail:
.annotate "line", 4
    (rx338_rep, rx338_pos, $I10, $P10) = rx338_cur."!mark_fail"(0)
    lt rx338_pos, -1, rx338_done
    eq rx338_pos, -1, rx338_fail
    jump $I10
  rx338_done:
    rx338_cur."!cursor_fail"()
    rx338_cur."!cursor_debug"("FAIL  ", "statement_prefix:sym<try>")
    .return (rx338_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_prefix:sym<try>"  :subid("76_1259103982.97329") :method
.annotate "line", 4
    $P340 = self."!PREFIX__!subrule"("blorst", "try")
    new $P341, "ResizablePMCArray"
    push $P341, $P340
    .return ($P341)
.end


.namespace ["NQP";"Grammar"]
.sub "blorst"  :subid("77_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx345_tgt
    .local int rx345_pos
    .local int rx345_off
    .local int rx345_eos
    .local int rx345_rep
    .local pmc rx345_cur
    (rx345_cur, rx345_pos, rx345_tgt) = self."!cursor_start"()
    rx345_cur."!cursor_debug"("START ", "blorst")
    .lex unicode:"$\x{a2}", rx345_cur
    .local pmc match
    .lex "$/", match
    length rx345_eos, rx345_tgt
    set rx345_off, 0
    lt rx345_pos, 2, rx345_start
    sub rx345_off, rx345_pos, 1
    substr rx345_tgt, rx345_tgt, rx345_off
  rx345_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan348_done
    goto rxscan348_scan
  rxscan348_loop:
    ($P10) = rx345_cur."from"()
    inc $P10
    set rx345_pos, $P10
    ge rx345_pos, rx345_eos, rxscan348_done
  rxscan348_scan:
    set_addr $I10, rxscan348_loop
    rx345_cur."!mark_push"(0, rx345_pos, $I10)
  rxscan348_done:
.annotate "line", 189
  # rx charclass s
    ge rx345_pos, rx345_eos, rx345_fail
    sub $I10, rx345_pos, rx345_off
    is_cclass $I11, 32, rx345_tgt, $I10
    unless $I11, rx345_fail
    inc rx345_pos
  # rx subrule "ws" subtype=method negate=
    rx345_cur."!cursor_pos"(rx345_pos)
    $P10 = rx345_cur."ws"()
    unless $P10, rx345_fail
    rx345_pos = $P10."pos"()
  alt349_0:
    set_addr $I10, alt349_1
    rx345_cur."!mark_push"(0, rx345_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx345_pos, rx345_eos, rx345_fail
    sub $I10, rx345_pos, rx345_off
    substr $S10, rx345_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx345_fail
  # rx subrule "block" subtype=capture negate=
    rx345_cur."!cursor_pos"(rx345_pos)
    $P10 = rx345_cur."block"()
    unless $P10, rx345_fail
    rx345_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx345_pos = $P10."pos"()
    goto alt349_end
  alt349_1:
  # rx subrule "statement" subtype=capture negate=
    rx345_cur."!cursor_pos"(rx345_pos)
    $P10 = rx345_cur."statement"()
    unless $P10, rx345_fail
    rx345_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx345_pos = $P10."pos"()
  alt349_end:
.annotate "line", 188
  # rx pass
    rx345_cur."!cursor_pass"(rx345_pos, "blorst")
    rx345_cur."!cursor_debug"("PASS  ", "blorst", " at pos=", rx345_pos)
    .return (rx345_cur)
  rx345_fail:
.annotate "line", 4
    (rx345_rep, rx345_pos, $I10, $P10) = rx345_cur."!mark_fail"(0)
    lt rx345_pos, -1, rx345_done
    eq rx345_pos, -1, rx345_fail
    jump $I10
  rx345_done:
    rx345_cur."!cursor_fail"()
    rx345_cur."!cursor_debug"("FAIL  ", "blorst")
    .return (rx345_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__blorst"  :subid("78_1259103982.97329") :method
.annotate "line", 4
    new $P347, "ResizablePMCArray"
    push $P347, ""
    .return ($P347)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond"  :subid("79_1259103982.97329") :method
.annotate "line", 194
    $P351 = self."!protoregex"("statement_mod_cond")
    .return ($P351)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond"  :subid("80_1259103982.97329") :method
.annotate "line", 194
    $P353 = self."!PREFIX__!protoregex"("statement_mod_cond")
    .return ($P353)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<if>"  :subid("81_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx355_tgt
    .local int rx355_pos
    .local int rx355_off
    .local int rx355_eos
    .local int rx355_rep
    .local pmc rx355_cur
    (rx355_cur, rx355_pos, rx355_tgt) = self."!cursor_start"()
    rx355_cur."!cursor_debug"("START ", "statement_mod_cond:sym<if>")
    .lex unicode:"$\x{a2}", rx355_cur
    .local pmc match
    .lex "$/", match
    length rx355_eos, rx355_tgt
    set rx355_off, 0
    lt rx355_pos, 2, rx355_start
    sub rx355_off, rx355_pos, 1
    substr rx355_tgt, rx355_tgt, rx355_off
  rx355_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan358_done
    goto rxscan358_scan
  rxscan358_loop:
    ($P10) = rx355_cur."from"()
    inc $P10
    set rx355_pos, $P10
    ge rx355_pos, rx355_eos, rxscan358_done
  rxscan358_scan:
    set_addr $I10, rxscan358_loop
    rx355_cur."!mark_push"(0, rx355_pos, $I10)
  rxscan358_done:
.annotate "line", 196
  # rx subcapture "sym"
    set_addr $I10, rxcap_359_fail
    rx355_cur."!mark_push"(0, rx355_pos, $I10)
  # rx literal  "if"
    add $I11, rx355_pos, 2
    gt $I11, rx355_eos, rx355_fail
    sub $I11, rx355_pos, rx355_off
    substr $S10, rx355_tgt, $I11, 2
    ne $S10, "if", rx355_fail
    add rx355_pos, 2
    set_addr $I10, rxcap_359_fail
    ($I12, $I11) = rx355_cur."!mark_peek"($I10)
    rx355_cur."!cursor_pos"($I11)
    ($P10) = rx355_cur."!cursor_start"()
    $P10."!cursor_pass"(rx355_pos, "")
    rx355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_359_done
  rxcap_359_fail:
    goto rx355_fail
  rxcap_359_done:
  # rx subrule "ws" subtype=method negate=
    rx355_cur."!cursor_pos"(rx355_pos)
    $P10 = rx355_cur."ws"()
    unless $P10, rx355_fail
    rx355_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx355_cur."!cursor_pos"(rx355_pos)
    $P10 = rx355_cur."EXPR"()
    unless $P10, rx355_fail
    rx355_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx355_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx355_cur."!cursor_pos"(rx355_pos)
    $P10 = rx355_cur."ws"()
    unless $P10, rx355_fail
    rx355_pos = $P10."pos"()
  # rx pass
    rx355_cur."!cursor_pass"(rx355_pos, "statement_mod_cond:sym<if>")
    rx355_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<if>", " at pos=", rx355_pos)
    .return (rx355_cur)
  rx355_fail:
.annotate "line", 4
    (rx355_rep, rx355_pos, $I10, $P10) = rx355_cur."!mark_fail"(0)
    lt rx355_pos, -1, rx355_done
    eq rx355_pos, -1, rx355_fail
    jump $I10
  rx355_done:
    rx355_cur."!cursor_fail"()
    rx355_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<if>")
    .return (rx355_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<if>"  :subid("82_1259103982.97329") :method
.annotate "line", 4
    new $P357, "ResizablePMCArray"
    push $P357, "if"
    .return ($P357)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_cond:sym<unless>"  :subid("83_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx363_tgt
    .local int rx363_pos
    .local int rx363_off
    .local int rx363_eos
    .local int rx363_rep
    .local pmc rx363_cur
    (rx363_cur, rx363_pos, rx363_tgt) = self."!cursor_start"()
    rx363_cur."!cursor_debug"("START ", "statement_mod_cond:sym<unless>")
    .lex unicode:"$\x{a2}", rx363_cur
    .local pmc match
    .lex "$/", match
    length rx363_eos, rx363_tgt
    set rx363_off, 0
    lt rx363_pos, 2, rx363_start
    sub rx363_off, rx363_pos, 1
    substr rx363_tgt, rx363_tgt, rx363_off
  rx363_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan366_done
    goto rxscan366_scan
  rxscan366_loop:
    ($P10) = rx363_cur."from"()
    inc $P10
    set rx363_pos, $P10
    ge rx363_pos, rx363_eos, rxscan366_done
  rxscan366_scan:
    set_addr $I10, rxscan366_loop
    rx363_cur."!mark_push"(0, rx363_pos, $I10)
  rxscan366_done:
.annotate "line", 197
  # rx subcapture "sym"
    set_addr $I10, rxcap_367_fail
    rx363_cur."!mark_push"(0, rx363_pos, $I10)
  # rx literal  "unless"
    add $I11, rx363_pos, 6
    gt $I11, rx363_eos, rx363_fail
    sub $I11, rx363_pos, rx363_off
    substr $S10, rx363_tgt, $I11, 6
    ne $S10, "unless", rx363_fail
    add rx363_pos, 6
    set_addr $I10, rxcap_367_fail
    ($I12, $I11) = rx363_cur."!mark_peek"($I10)
    rx363_cur."!cursor_pos"($I11)
    ($P10) = rx363_cur."!cursor_start"()
    $P10."!cursor_pass"(rx363_pos, "")
    rx363_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_367_done
  rxcap_367_fail:
    goto rx363_fail
  rxcap_367_done:
  # rx subrule "ws" subtype=method negate=
    rx363_cur."!cursor_pos"(rx363_pos)
    $P10 = rx363_cur."ws"()
    unless $P10, rx363_fail
    rx363_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx363_cur."!cursor_pos"(rx363_pos)
    $P10 = rx363_cur."EXPR"()
    unless $P10, rx363_fail
    rx363_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx363_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx363_cur."!cursor_pos"(rx363_pos)
    $P10 = rx363_cur."ws"()
    unless $P10, rx363_fail
    rx363_pos = $P10."pos"()
  # rx pass
    rx363_cur."!cursor_pass"(rx363_pos, "statement_mod_cond:sym<unless>")
    rx363_cur."!cursor_debug"("PASS  ", "statement_mod_cond:sym<unless>", " at pos=", rx363_pos)
    .return (rx363_cur)
  rx363_fail:
.annotate "line", 4
    (rx363_rep, rx363_pos, $I10, $P10) = rx363_cur."!mark_fail"(0)
    lt rx363_pos, -1, rx363_done
    eq rx363_pos, -1, rx363_fail
    jump $I10
  rx363_done:
    rx363_cur."!cursor_fail"()
    rx363_cur."!cursor_debug"("FAIL  ", "statement_mod_cond:sym<unless>")
    .return (rx363_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_cond:sym<unless>"  :subid("84_1259103982.97329") :method
.annotate "line", 4
    new $P365, "ResizablePMCArray"
    push $P365, "unless"
    .return ($P365)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop"  :subid("85_1259103982.97329") :method
.annotate "line", 199
    $P371 = self."!protoregex"("statement_mod_loop")
    .return ($P371)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop"  :subid("86_1259103982.97329") :method
.annotate "line", 199
    $P373 = self."!PREFIX__!protoregex"("statement_mod_loop")
    .return ($P373)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<while>"  :subid("87_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx375_tgt
    .local int rx375_pos
    .local int rx375_off
    .local int rx375_eos
    .local int rx375_rep
    .local pmc rx375_cur
    (rx375_cur, rx375_pos, rx375_tgt) = self."!cursor_start"()
    rx375_cur."!cursor_debug"("START ", "statement_mod_loop:sym<while>")
    .lex unicode:"$\x{a2}", rx375_cur
    .local pmc match
    .lex "$/", match
    length rx375_eos, rx375_tgt
    set rx375_off, 0
    lt rx375_pos, 2, rx375_start
    sub rx375_off, rx375_pos, 1
    substr rx375_tgt, rx375_tgt, rx375_off
  rx375_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan378_done
    goto rxscan378_scan
  rxscan378_loop:
    ($P10) = rx375_cur."from"()
    inc $P10
    set rx375_pos, $P10
    ge rx375_pos, rx375_eos, rxscan378_done
  rxscan378_scan:
    set_addr $I10, rxscan378_loop
    rx375_cur."!mark_push"(0, rx375_pos, $I10)
  rxscan378_done:
.annotate "line", 201
  # rx subcapture "sym"
    set_addr $I10, rxcap_379_fail
    rx375_cur."!mark_push"(0, rx375_pos, $I10)
  # rx literal  "while"
    add $I11, rx375_pos, 5
    gt $I11, rx375_eos, rx375_fail
    sub $I11, rx375_pos, rx375_off
    substr $S10, rx375_tgt, $I11, 5
    ne $S10, "while", rx375_fail
    add rx375_pos, 5
    set_addr $I10, rxcap_379_fail
    ($I12, $I11) = rx375_cur."!mark_peek"($I10)
    rx375_cur."!cursor_pos"($I11)
    ($P10) = rx375_cur."!cursor_start"()
    $P10."!cursor_pass"(rx375_pos, "")
    rx375_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_379_done
  rxcap_379_fail:
    goto rx375_fail
  rxcap_379_done:
  # rx subrule "ws" subtype=method negate=
    rx375_cur."!cursor_pos"(rx375_pos)
    $P10 = rx375_cur."ws"()
    unless $P10, rx375_fail
    rx375_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx375_cur."!cursor_pos"(rx375_pos)
    $P10 = rx375_cur."EXPR"()
    unless $P10, rx375_fail
    rx375_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx375_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx375_cur."!cursor_pos"(rx375_pos)
    $P10 = rx375_cur."ws"()
    unless $P10, rx375_fail
    rx375_pos = $P10."pos"()
  # rx pass
    rx375_cur."!cursor_pass"(rx375_pos, "statement_mod_loop:sym<while>")
    rx375_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<while>", " at pos=", rx375_pos)
    .return (rx375_cur)
  rx375_fail:
.annotate "line", 4
    (rx375_rep, rx375_pos, $I10, $P10) = rx375_cur."!mark_fail"(0)
    lt rx375_pos, -1, rx375_done
    eq rx375_pos, -1, rx375_fail
    jump $I10
  rx375_done:
    rx375_cur."!cursor_fail"()
    rx375_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<while>")
    .return (rx375_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<while>"  :subid("88_1259103982.97329") :method
.annotate "line", 4
    new $P377, "ResizablePMCArray"
    push $P377, "while"
    .return ($P377)
.end


.namespace ["NQP";"Grammar"]
.sub "statement_mod_loop:sym<until>"  :subid("89_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx383_tgt
    .local int rx383_pos
    .local int rx383_off
    .local int rx383_eos
    .local int rx383_rep
    .local pmc rx383_cur
    (rx383_cur, rx383_pos, rx383_tgt) = self."!cursor_start"()
    rx383_cur."!cursor_debug"("START ", "statement_mod_loop:sym<until>")
    .lex unicode:"$\x{a2}", rx383_cur
    .local pmc match
    .lex "$/", match
    length rx383_eos, rx383_tgt
    set rx383_off, 0
    lt rx383_pos, 2, rx383_start
    sub rx383_off, rx383_pos, 1
    substr rx383_tgt, rx383_tgt, rx383_off
  rx383_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan386_done
    goto rxscan386_scan
  rxscan386_loop:
    ($P10) = rx383_cur."from"()
    inc $P10
    set rx383_pos, $P10
    ge rx383_pos, rx383_eos, rxscan386_done
  rxscan386_scan:
    set_addr $I10, rxscan386_loop
    rx383_cur."!mark_push"(0, rx383_pos, $I10)
  rxscan386_done:
.annotate "line", 202
  # rx subcapture "sym"
    set_addr $I10, rxcap_387_fail
    rx383_cur."!mark_push"(0, rx383_pos, $I10)
  # rx literal  "until"
    add $I11, rx383_pos, 5
    gt $I11, rx383_eos, rx383_fail
    sub $I11, rx383_pos, rx383_off
    substr $S10, rx383_tgt, $I11, 5
    ne $S10, "until", rx383_fail
    add rx383_pos, 5
    set_addr $I10, rxcap_387_fail
    ($I12, $I11) = rx383_cur."!mark_peek"($I10)
    rx383_cur."!cursor_pos"($I11)
    ($P10) = rx383_cur."!cursor_start"()
    $P10."!cursor_pass"(rx383_pos, "")
    rx383_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_387_done
  rxcap_387_fail:
    goto rx383_fail
  rxcap_387_done:
  # rx subrule "ws" subtype=method negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."ws"()
    unless $P10, rx383_fail
    rx383_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."EXPR"()
    unless $P10, rx383_fail
    rx383_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("cond")
    rx383_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx383_cur."!cursor_pos"(rx383_pos)
    $P10 = rx383_cur."ws"()
    unless $P10, rx383_fail
    rx383_pos = $P10."pos"()
  # rx pass
    rx383_cur."!cursor_pass"(rx383_pos, "statement_mod_loop:sym<until>")
    rx383_cur."!cursor_debug"("PASS  ", "statement_mod_loop:sym<until>", " at pos=", rx383_pos)
    .return (rx383_cur)
  rx383_fail:
.annotate "line", 4
    (rx383_rep, rx383_pos, $I10, $P10) = rx383_cur."!mark_fail"(0)
    lt rx383_pos, -1, rx383_done
    eq rx383_pos, -1, rx383_fail
    jump $I10
  rx383_done:
    rx383_cur."!cursor_fail"()
    rx383_cur."!cursor_debug"("FAIL  ", "statement_mod_loop:sym<until>")
    .return (rx383_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__statement_mod_loop:sym<until>"  :subid("90_1259103982.97329") :method
.annotate "line", 4
    new $P385, "ResizablePMCArray"
    push $P385, "until"
    .return ($P385)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<colonpair>"  :subid("91_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx391_tgt
    .local int rx391_pos
    .local int rx391_off
    .local int rx391_eos
    .local int rx391_rep
    .local pmc rx391_cur
    (rx391_cur, rx391_pos, rx391_tgt) = self."!cursor_start"()
    rx391_cur."!cursor_debug"("START ", "term:sym<colonpair>")
    .lex unicode:"$\x{a2}", rx391_cur
    .local pmc match
    .lex "$/", match
    length rx391_eos, rx391_tgt
    set rx391_off, 0
    lt rx391_pos, 2, rx391_start
    sub rx391_off, rx391_pos, 1
    substr rx391_tgt, rx391_tgt, rx391_off
  rx391_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan395_done
    goto rxscan395_scan
  rxscan395_loop:
    ($P10) = rx391_cur."from"()
    inc $P10
    set rx391_pos, $P10
    ge rx391_pos, rx391_eos, rxscan395_done
  rxscan395_scan:
    set_addr $I10, rxscan395_loop
    rx391_cur."!mark_push"(0, rx391_pos, $I10)
  rxscan395_done:
.annotate "line", 206
  # rx subrule "colonpair" subtype=capture negate=
    rx391_cur."!cursor_pos"(rx391_pos)
    $P10 = rx391_cur."colonpair"()
    unless $P10, rx391_fail
    rx391_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("colonpair")
    rx391_pos = $P10."pos"()
  # rx pass
    rx391_cur."!cursor_pass"(rx391_pos, "term:sym<colonpair>")
    rx391_cur."!cursor_debug"("PASS  ", "term:sym<colonpair>", " at pos=", rx391_pos)
    .return (rx391_cur)
  rx391_fail:
.annotate "line", 4
    (rx391_rep, rx391_pos, $I10, $P10) = rx391_cur."!mark_fail"(0)
    lt rx391_pos, -1, rx391_done
    eq rx391_pos, -1, rx391_fail
    jump $I10
  rx391_done:
    rx391_cur."!cursor_fail"()
    rx391_cur."!cursor_debug"("FAIL  ", "term:sym<colonpair>")
    .return (rx391_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<colonpair>"  :subid("92_1259103982.97329") :method
.annotate "line", 4
    $P393 = self."!PREFIX__!subrule"("colonpair", "")
    new $P394, "ResizablePMCArray"
    push $P394, $P393
    .return ($P394)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<variable>"  :subid("93_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx397_tgt
    .local int rx397_pos
    .local int rx397_off
    .local int rx397_eos
    .local int rx397_rep
    .local pmc rx397_cur
    (rx397_cur, rx397_pos, rx397_tgt) = self."!cursor_start"()
    rx397_cur."!cursor_debug"("START ", "term:sym<variable>")
    .lex unicode:"$\x{a2}", rx397_cur
    .local pmc match
    .lex "$/", match
    length rx397_eos, rx397_tgt
    set rx397_off, 0
    lt rx397_pos, 2, rx397_start
    sub rx397_off, rx397_pos, 1
    substr rx397_tgt, rx397_tgt, rx397_off
  rx397_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan401_done
    goto rxscan401_scan
  rxscan401_loop:
    ($P10) = rx397_cur."from"()
    inc $P10
    set rx397_pos, $P10
    ge rx397_pos, rx397_eos, rxscan401_done
  rxscan401_scan:
    set_addr $I10, rxscan401_loop
    rx397_cur."!mark_push"(0, rx397_pos, $I10)
  rxscan401_done:
.annotate "line", 207
  # rx subrule "variable" subtype=capture negate=
    rx397_cur."!cursor_pos"(rx397_pos)
    $P10 = rx397_cur."variable"()
    unless $P10, rx397_fail
    rx397_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx397_pos = $P10."pos"()
  # rx pass
    rx397_cur."!cursor_pass"(rx397_pos, "term:sym<variable>")
    rx397_cur."!cursor_debug"("PASS  ", "term:sym<variable>", " at pos=", rx397_pos)
    .return (rx397_cur)
  rx397_fail:
.annotate "line", 4
    (rx397_rep, rx397_pos, $I10, $P10) = rx397_cur."!mark_fail"(0)
    lt rx397_pos, -1, rx397_done
    eq rx397_pos, -1, rx397_fail
    jump $I10
  rx397_done:
    rx397_cur."!cursor_fail"()
    rx397_cur."!cursor_debug"("FAIL  ", "term:sym<variable>")
    .return (rx397_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<variable>"  :subid("94_1259103982.97329") :method
.annotate "line", 4
    $P399 = self."!PREFIX__!subrule"("variable", "")
    new $P400, "ResizablePMCArray"
    push $P400, $P399
    .return ($P400)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<package_declarator>"  :subid("95_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx403_tgt
    .local int rx403_pos
    .local int rx403_off
    .local int rx403_eos
    .local int rx403_rep
    .local pmc rx403_cur
    (rx403_cur, rx403_pos, rx403_tgt) = self."!cursor_start"()
    rx403_cur."!cursor_debug"("START ", "term:sym<package_declarator>")
    .lex unicode:"$\x{a2}", rx403_cur
    .local pmc match
    .lex "$/", match
    length rx403_eos, rx403_tgt
    set rx403_off, 0
    lt rx403_pos, 2, rx403_start
    sub rx403_off, rx403_pos, 1
    substr rx403_tgt, rx403_tgt, rx403_off
  rx403_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan407_done
    goto rxscan407_scan
  rxscan407_loop:
    ($P10) = rx403_cur."from"()
    inc $P10
    set rx403_pos, $P10
    ge rx403_pos, rx403_eos, rxscan407_done
  rxscan407_scan:
    set_addr $I10, rxscan407_loop
    rx403_cur."!mark_push"(0, rx403_pos, $I10)
  rxscan407_done:
.annotate "line", 208
  # rx subrule "package_declarator" subtype=capture negate=
    rx403_cur."!cursor_pos"(rx403_pos)
    $P10 = rx403_cur."package_declarator"()
    unless $P10, rx403_fail
    rx403_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_declarator")
    rx403_pos = $P10."pos"()
  # rx pass
    rx403_cur."!cursor_pass"(rx403_pos, "term:sym<package_declarator>")
    rx403_cur."!cursor_debug"("PASS  ", "term:sym<package_declarator>", " at pos=", rx403_pos)
    .return (rx403_cur)
  rx403_fail:
.annotate "line", 4
    (rx403_rep, rx403_pos, $I10, $P10) = rx403_cur."!mark_fail"(0)
    lt rx403_pos, -1, rx403_done
    eq rx403_pos, -1, rx403_fail
    jump $I10
  rx403_done:
    rx403_cur."!cursor_fail"()
    rx403_cur."!cursor_debug"("FAIL  ", "term:sym<package_declarator>")
    .return (rx403_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<package_declarator>"  :subid("96_1259103982.97329") :method
.annotate "line", 4
    $P405 = self."!PREFIX__!subrule"("package_declarator", "")
    new $P406, "ResizablePMCArray"
    push $P406, $P405
    .return ($P406)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<scope_declarator>"  :subid("97_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx409_tgt
    .local int rx409_pos
    .local int rx409_off
    .local int rx409_eos
    .local int rx409_rep
    .local pmc rx409_cur
    (rx409_cur, rx409_pos, rx409_tgt) = self."!cursor_start"()
    rx409_cur."!cursor_debug"("START ", "term:sym<scope_declarator>")
    .lex unicode:"$\x{a2}", rx409_cur
    .local pmc match
    .lex "$/", match
    length rx409_eos, rx409_tgt
    set rx409_off, 0
    lt rx409_pos, 2, rx409_start
    sub rx409_off, rx409_pos, 1
    substr rx409_tgt, rx409_tgt, rx409_off
  rx409_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan413_done
    goto rxscan413_scan
  rxscan413_loop:
    ($P10) = rx409_cur."from"()
    inc $P10
    set rx409_pos, $P10
    ge rx409_pos, rx409_eos, rxscan413_done
  rxscan413_scan:
    set_addr $I10, rxscan413_loop
    rx409_cur."!mark_push"(0, rx409_pos, $I10)
  rxscan413_done:
.annotate "line", 209
  # rx subrule "scope_declarator" subtype=capture negate=
    rx409_cur."!cursor_pos"(rx409_pos)
    $P10 = rx409_cur."scope_declarator"()
    unless $P10, rx409_fail
    rx409_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scope_declarator")
    rx409_pos = $P10."pos"()
  # rx pass
    rx409_cur."!cursor_pass"(rx409_pos, "term:sym<scope_declarator>")
    rx409_cur."!cursor_debug"("PASS  ", "term:sym<scope_declarator>", " at pos=", rx409_pos)
    .return (rx409_cur)
  rx409_fail:
.annotate "line", 4
    (rx409_rep, rx409_pos, $I10, $P10) = rx409_cur."!mark_fail"(0)
    lt rx409_pos, -1, rx409_done
    eq rx409_pos, -1, rx409_fail
    jump $I10
  rx409_done:
    rx409_cur."!cursor_fail"()
    rx409_cur."!cursor_debug"("FAIL  ", "term:sym<scope_declarator>")
    .return (rx409_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<scope_declarator>"  :subid("98_1259103982.97329") :method
.annotate "line", 4
    $P411 = self."!PREFIX__!subrule"("scope_declarator", "")
    new $P412, "ResizablePMCArray"
    push $P412, $P411
    .return ($P412)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<routine_declarator>"  :subid("99_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx415_tgt
    .local int rx415_pos
    .local int rx415_off
    .local int rx415_eos
    .local int rx415_rep
    .local pmc rx415_cur
    (rx415_cur, rx415_pos, rx415_tgt) = self."!cursor_start"()
    rx415_cur."!cursor_debug"("START ", "term:sym<routine_declarator>")
    .lex unicode:"$\x{a2}", rx415_cur
    .local pmc match
    .lex "$/", match
    length rx415_eos, rx415_tgt
    set rx415_off, 0
    lt rx415_pos, 2, rx415_start
    sub rx415_off, rx415_pos, 1
    substr rx415_tgt, rx415_tgt, rx415_off
  rx415_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan419_done
    goto rxscan419_scan
  rxscan419_loop:
    ($P10) = rx415_cur."from"()
    inc $P10
    set rx415_pos, $P10
    ge rx415_pos, rx415_eos, rxscan419_done
  rxscan419_scan:
    set_addr $I10, rxscan419_loop
    rx415_cur."!mark_push"(0, rx415_pos, $I10)
  rxscan419_done:
.annotate "line", 210
  # rx subrule "routine_declarator" subtype=capture negate=
    rx415_cur."!cursor_pos"(rx415_pos)
    $P10 = rx415_cur."routine_declarator"()
    unless $P10, rx415_fail
    rx415_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx415_pos = $P10."pos"()
  # rx pass
    rx415_cur."!cursor_pass"(rx415_pos, "term:sym<routine_declarator>")
    rx415_cur."!cursor_debug"("PASS  ", "term:sym<routine_declarator>", " at pos=", rx415_pos)
    .return (rx415_cur)
  rx415_fail:
.annotate "line", 4
    (rx415_rep, rx415_pos, $I10, $P10) = rx415_cur."!mark_fail"(0)
    lt rx415_pos, -1, rx415_done
    eq rx415_pos, -1, rx415_fail
    jump $I10
  rx415_done:
    rx415_cur."!cursor_fail"()
    rx415_cur."!cursor_debug"("FAIL  ", "term:sym<routine_declarator>")
    .return (rx415_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<routine_declarator>"  :subid("100_1259103982.97329") :method
.annotate "line", 4
    $P417 = self."!PREFIX__!subrule"("routine_declarator", "")
    new $P418, "ResizablePMCArray"
    push $P418, $P417
    .return ($P418)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<regex_declarator>"  :subid("101_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx421_tgt
    .local int rx421_pos
    .local int rx421_off
    .local int rx421_eos
    .local int rx421_rep
    .local pmc rx421_cur
    (rx421_cur, rx421_pos, rx421_tgt) = self."!cursor_start"()
    rx421_cur."!cursor_debug"("START ", "term:sym<regex_declarator>")
    .lex unicode:"$\x{a2}", rx421_cur
    .local pmc match
    .lex "$/", match
    length rx421_eos, rx421_tgt
    set rx421_off, 0
    lt rx421_pos, 2, rx421_start
    sub rx421_off, rx421_pos, 1
    substr rx421_tgt, rx421_tgt, rx421_off
  rx421_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan425_done
    goto rxscan425_scan
  rxscan425_loop:
    ($P10) = rx421_cur."from"()
    inc $P10
    set rx421_pos, $P10
    ge rx421_pos, rx421_eos, rxscan425_done
  rxscan425_scan:
    set_addr $I10, rxscan425_loop
    rx421_cur."!mark_push"(0, rx421_pos, $I10)
  rxscan425_done:
.annotate "line", 211
  # rx subrule "regex_declarator" subtype=capture negate=
    rx421_cur."!cursor_pos"(rx421_pos)
    $P10 = rx421_cur."regex_declarator"()
    unless $P10, rx421_fail
    rx421_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("regex_declarator")
    rx421_pos = $P10."pos"()
  # rx pass
    rx421_cur."!cursor_pass"(rx421_pos, "term:sym<regex_declarator>")
    rx421_cur."!cursor_debug"("PASS  ", "term:sym<regex_declarator>", " at pos=", rx421_pos)
    .return (rx421_cur)
  rx421_fail:
.annotate "line", 4
    (rx421_rep, rx421_pos, $I10, $P10) = rx421_cur."!mark_fail"(0)
    lt rx421_pos, -1, rx421_done
    eq rx421_pos, -1, rx421_fail
    jump $I10
  rx421_done:
    rx421_cur."!cursor_fail"()
    rx421_cur."!cursor_debug"("FAIL  ", "term:sym<regex_declarator>")
    .return (rx421_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<regex_declarator>"  :subid("102_1259103982.97329") :method
.annotate "line", 4
    $P423 = self."!PREFIX__!subrule"("regex_declarator", "")
    new $P424, "ResizablePMCArray"
    push $P424, $P423
    .return ($P424)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<statement_prefix>"  :subid("103_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx427_tgt
    .local int rx427_pos
    .local int rx427_off
    .local int rx427_eos
    .local int rx427_rep
    .local pmc rx427_cur
    (rx427_cur, rx427_pos, rx427_tgt) = self."!cursor_start"()
    rx427_cur."!cursor_debug"("START ", "term:sym<statement_prefix>")
    .lex unicode:"$\x{a2}", rx427_cur
    .local pmc match
    .lex "$/", match
    length rx427_eos, rx427_tgt
    set rx427_off, 0
    lt rx427_pos, 2, rx427_start
    sub rx427_off, rx427_pos, 1
    substr rx427_tgt, rx427_tgt, rx427_off
  rx427_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan431_done
    goto rxscan431_scan
  rxscan431_loop:
    ($P10) = rx427_cur."from"()
    inc $P10
    set rx427_pos, $P10
    ge rx427_pos, rx427_eos, rxscan431_done
  rxscan431_scan:
    set_addr $I10, rxscan431_loop
    rx427_cur."!mark_push"(0, rx427_pos, $I10)
  rxscan431_done:
.annotate "line", 212
  # rx subrule "statement_prefix" subtype=capture negate=
    rx427_cur."!cursor_pos"(rx427_pos)
    $P10 = rx427_cur."statement_prefix"()
    unless $P10, rx427_fail
    rx427_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement_prefix")
    rx427_pos = $P10."pos"()
  # rx pass
    rx427_cur."!cursor_pass"(rx427_pos, "term:sym<statement_prefix>")
    rx427_cur."!cursor_debug"("PASS  ", "term:sym<statement_prefix>", " at pos=", rx427_pos)
    .return (rx427_cur)
  rx427_fail:
.annotate "line", 4
    (rx427_rep, rx427_pos, $I10, $P10) = rx427_cur."!mark_fail"(0)
    lt rx427_pos, -1, rx427_done
    eq rx427_pos, -1, rx427_fail
    jump $I10
  rx427_done:
    rx427_cur."!cursor_fail"()
    rx427_cur."!cursor_debug"("FAIL  ", "term:sym<statement_prefix>")
    .return (rx427_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<statement_prefix>"  :subid("104_1259103982.97329") :method
.annotate "line", 4
    $P429 = self."!PREFIX__!subrule"("statement_prefix", "")
    new $P430, "ResizablePMCArray"
    push $P430, $P429
    .return ($P430)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<lambda>"  :subid("105_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx433_tgt
    .local int rx433_pos
    .local int rx433_off
    .local int rx433_eos
    .local int rx433_rep
    .local pmc rx433_cur
    (rx433_cur, rx433_pos, rx433_tgt) = self."!cursor_start"()
    rx433_cur."!cursor_debug"("START ", "term:sym<lambda>")
    .lex unicode:"$\x{a2}", rx433_cur
    .local pmc match
    .lex "$/", match
    length rx433_eos, rx433_tgt
    set rx433_off, 0
    lt rx433_pos, 2, rx433_start
    sub rx433_off, rx433_pos, 1
    substr rx433_tgt, rx433_tgt, rx433_off
  rx433_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan436_done
    goto rxscan436_scan
  rxscan436_loop:
    ($P10) = rx433_cur."from"()
    inc $P10
    set rx433_pos, $P10
    ge rx433_pos, rx433_eos, rxscan436_done
  rxscan436_scan:
    set_addr $I10, rxscan436_loop
    rx433_cur."!mark_push"(0, rx433_pos, $I10)
  rxscan436_done:
.annotate "line", 213
  # rx subrule "lambda" subtype=zerowidth negate=
    rx433_cur."!cursor_pos"(rx433_pos)
    $P10 = rx433_cur."lambda"()
    unless $P10, rx433_fail
  # rx subrule "pblock" subtype=capture negate=
    rx433_cur."!cursor_pos"(rx433_pos)
    $P10 = rx433_cur."pblock"()
    unless $P10, rx433_fail
    rx433_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx433_pos = $P10."pos"()
  # rx pass
    rx433_cur."!cursor_pass"(rx433_pos, "term:sym<lambda>")
    rx433_cur."!cursor_debug"("PASS  ", "term:sym<lambda>", " at pos=", rx433_pos)
    .return (rx433_cur)
  rx433_fail:
.annotate "line", 4
    (rx433_rep, rx433_pos, $I10, $P10) = rx433_cur."!mark_fail"(0)
    lt rx433_pos, -1, rx433_done
    eq rx433_pos, -1, rx433_fail
    jump $I10
  rx433_done:
    rx433_cur."!cursor_fail"()
    rx433_cur."!cursor_debug"("FAIL  ", "term:sym<lambda>")
    .return (rx433_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<lambda>"  :subid("106_1259103982.97329") :method
.annotate "line", 4
    new $P435, "ResizablePMCArray"
    push $P435, ""
    .return ($P435)
.end


.namespace ["NQP";"Grammar"]
.sub "colonpair"  :subid("107_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx438_tgt
    .local int rx438_pos
    .local int rx438_off
    .local int rx438_eos
    .local int rx438_rep
    .local pmc rx438_cur
    (rx438_cur, rx438_pos, rx438_tgt) = self."!cursor_start"()
    rx438_cur."!cursor_debug"("START ", "colonpair")
    rx438_cur."!cursor_caparray"("circumfix")
    .lex unicode:"$\x{a2}", rx438_cur
    .local pmc match
    .lex "$/", match
    length rx438_eos, rx438_tgt
    set rx438_off, 0
    lt rx438_pos, 2, rx438_start
    sub rx438_off, rx438_pos, 1
    substr rx438_tgt, rx438_tgt, rx438_off
  rx438_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan443_done
    goto rxscan443_scan
  rxscan443_loop:
    ($P10) = rx438_cur."from"()
    inc $P10
    set rx438_pos, $P10
    ge rx438_pos, rx438_eos, rxscan443_done
  rxscan443_scan:
    set_addr $I10, rxscan443_loop
    rx438_cur."!mark_push"(0, rx438_pos, $I10)
  rxscan443_done:
.annotate "line", 216
  # rx literal  ":"
    add $I11, rx438_pos, 1
    gt $I11, rx438_eos, rx438_fail
    sub $I11, rx438_pos, rx438_off
    substr $S10, rx438_tgt, $I11, 1
    ne $S10, ":", rx438_fail
    add rx438_pos, 1
  alt444_0:
.annotate "line", 217
    set_addr $I10, alt444_1
    rx438_cur."!mark_push"(0, rx438_pos, $I10)
.annotate "line", 218
  # rx subcapture "not"
    set_addr $I10, rxcap_445_fail
    rx438_cur."!mark_push"(0, rx438_pos, $I10)
  # rx literal  "!"
    add $I11, rx438_pos, 1
    gt $I11, rx438_eos, rx438_fail
    sub $I11, rx438_pos, rx438_off
    substr $S10, rx438_tgt, $I11, 1
    ne $S10, "!", rx438_fail
    add rx438_pos, 1
    set_addr $I10, rxcap_445_fail
    ($I12, $I11) = rx438_cur."!mark_peek"($I10)
    rx438_cur."!cursor_pos"($I11)
    ($P10) = rx438_cur."!cursor_start"()
    $P10."!cursor_pass"(rx438_pos, "")
    rx438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("not")
    goto rxcap_445_done
  rxcap_445_fail:
    goto rx438_fail
  rxcap_445_done:
  # rx subrule "identifier" subtype=capture negate=
    rx438_cur."!cursor_pos"(rx438_pos)
    $P10 = rx438_cur."identifier"()
    unless $P10, rx438_fail
    rx438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx438_pos = $P10."pos"()
    goto alt444_end
  alt444_1:
.annotate "line", 219
  # rx subrule "identifier" subtype=capture negate=
    rx438_cur."!cursor_pos"(rx438_pos)
    $P10 = rx438_cur."identifier"()
    unless $P10, rx438_fail
    rx438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx438_pos = $P10."pos"()
  # rx rxquantr446 ** 0..1
    set_addr $I447, rxquantr446_done
    rx438_cur."!mark_push"(0, rx438_pos, $I447)
  rxquantr446_loop:
  # rx subrule "circumfix" subtype=capture negate=
    rx438_cur."!cursor_pos"(rx438_pos)
    $P10 = rx438_cur."circumfix"()
    unless $P10, rx438_fail
    rx438_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("circumfix")
    rx438_pos = $P10."pos"()
    (rx438_rep) = rx438_cur."!mark_commit"($I447)
  rxquantr446_done:
  alt444_end:
.annotate "line", 215
  # rx pass
    rx438_cur."!cursor_pass"(rx438_pos, "colonpair")
    rx438_cur."!cursor_debug"("PASS  ", "colonpair", " at pos=", rx438_pos)
    .return (rx438_cur)
  rx438_fail:
.annotate "line", 4
    (rx438_rep, rx438_pos, $I10, $P10) = rx438_cur."!mark_fail"(0)
    lt rx438_pos, -1, rx438_done
    eq rx438_pos, -1, rx438_fail
    jump $I10
  rx438_done:
    rx438_cur."!cursor_fail"()
    rx438_cur."!cursor_debug"("FAIL  ", "colonpair")
    .return (rx438_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__colonpair"  :subid("108_1259103982.97329") :method
.annotate "line", 4
    $P440 = self."!PREFIX__!subrule"("identifier", ":")
    $P441 = self."!PREFIX__!subrule"("identifier", ":!")
    new $P442, "ResizablePMCArray"
    push $P442, $P440
    push $P442, $P441
    .return ($P442)
.end


.namespace ["NQP";"Grammar"]
.sub "variable"  :subid("109_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx449_tgt
    .local int rx449_pos
    .local int rx449_off
    .local int rx449_eos
    .local int rx449_rep
    .local pmc rx449_cur
    (rx449_cur, rx449_pos, rx449_tgt) = self."!cursor_start"()
    rx449_cur."!cursor_debug"("START ", "variable")
    rx449_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx449_cur
    .local pmc match
    .lex "$/", match
    length rx449_eos, rx449_tgt
    set rx449_off, 0
    lt rx449_pos, 2, rx449_start
    sub rx449_off, rx449_pos, 1
    substr rx449_tgt, rx449_tgt, rx449_off
  rx449_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan454_done
    goto rxscan454_scan
  rxscan454_loop:
    ($P10) = rx449_cur."from"()
    inc $P10
    set rx449_pos, $P10
    ge rx449_pos, rx449_eos, rxscan454_done
  rxscan454_scan:
    set_addr $I10, rxscan454_loop
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
  rxscan454_done:
  alt455_0:
.annotate "line", 223
    set_addr $I10, alt455_1
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
.annotate "line", 224
  # rx subrule "sigil" subtype=capture negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."sigil"()
    unless $P10, rx449_fail
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx449_pos = $P10."pos"()
  # rx rxquantr456 ** 0..1
    set_addr $I457, rxquantr456_done
    rx449_cur."!mark_push"(0, rx449_pos, $I457)
  rxquantr456_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."twigil"()
    unless $P10, rx449_fail
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx449_pos = $P10."pos"()
    (rx449_rep) = rx449_cur."!mark_commit"($I457)
  rxquantr456_done:
  # rx subrule "name" subtype=capture negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."name"()
    unless $P10, rx449_fail
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    rx449_pos = $P10."pos"()
    goto alt455_end
  alt455_1:
    set_addr $I10, alt455_2
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
.annotate "line", 225
  # rx subrule "sigil" subtype=capture negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."sigil"()
    unless $P10, rx449_fail
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx449_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx449_pos, rx449_eos, rx449_fail
    sub $I10, rx449_pos, rx449_off
    substr $S10, rx449_tgt, $I10, 1
    index $I11, "<[", $S10
    lt $I11, 0, rx449_fail
  # rx subrule "postcircumfix" subtype=capture negate=
    rx449_cur."!cursor_pos"(rx449_pos)
    $P10 = rx449_cur."postcircumfix"()
    unless $P10, rx449_fail
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("postcircumfix")
    rx449_pos = $P10."pos"()
    goto alt455_end
  alt455_2:
.annotate "line", 226
  # rx subcapture "sigil"
    set_addr $I10, rxcap_458_fail
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
  # rx literal  "$"
    add $I11, rx449_pos, 1
    gt $I11, rx449_eos, rx449_fail
    sub $I11, rx449_pos, rx449_off
    substr $S10, rx449_tgt, $I11, 1
    ne $S10, "$", rx449_fail
    add rx449_pos, 1
    set_addr $I10, rxcap_458_fail
    ($I12, $I11) = rx449_cur."!mark_peek"($I10)
    rx449_cur."!cursor_pos"($I11)
    ($P10) = rx449_cur."!cursor_start"()
    $P10."!cursor_pass"(rx449_pos, "")
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    goto rxcap_458_done
  rxcap_458_fail:
    goto rx449_fail
  rxcap_458_done:
  # rx subcapture "desigilname"
    set_addr $I10, rxcap_459_fail
    rx449_cur."!mark_push"(0, rx449_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx449_pos, rx449_eos, rx449_fail
    sub $I10, rx449_pos, rx449_off
    substr $S10, rx449_tgt, $I10, 1
    index $I11, "/_!", $S10
    lt $I11, 0, rx449_fail
    inc rx449_pos
    set_addr $I10, rxcap_459_fail
    ($I12, $I11) = rx449_cur."!mark_peek"($I10)
    rx449_cur."!cursor_pos"($I11)
    ($P10) = rx449_cur."!cursor_start"()
    $P10."!cursor_pass"(rx449_pos, "")
    rx449_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("desigilname")
    goto rxcap_459_done
  rxcap_459_fail:
    goto rx449_fail
  rxcap_459_done:
  alt455_end:
.annotate "line", 223
  # rx pass
    rx449_cur."!cursor_pass"(rx449_pos, "variable")
    rx449_cur."!cursor_debug"("PASS  ", "variable", " at pos=", rx449_pos)
    .return (rx449_cur)
  rx449_fail:
.annotate "line", 4
    (rx449_rep, rx449_pos, $I10, $P10) = rx449_cur."!mark_fail"(0)
    lt rx449_pos, -1, rx449_done
    eq rx449_pos, -1, rx449_fail
    jump $I10
  rx449_done:
    rx449_cur."!cursor_fail"()
    rx449_cur."!cursor_debug"("FAIL  ", "variable")
    .return (rx449_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable"  :subid("110_1259103982.97329") :method
.annotate "line", 4
    $P451 = self."!PREFIX__!subrule"("sigil", "")
    $P452 = self."!PREFIX__!subrule"("sigil", "")
    new $P453, "ResizablePMCArray"
    push $P453, "$!"
    push $P453, "$_"
    push $P453, "$/"
    push $P453, $P451
    push $P453, $P452
    .return ($P453)
.end


.namespace ["NQP";"Grammar"]
.sub "sigil"  :subid("111_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx461_tgt
    .local int rx461_pos
    .local int rx461_off
    .local int rx461_eos
    .local int rx461_rep
    .local pmc rx461_cur
    (rx461_cur, rx461_pos, rx461_tgt) = self."!cursor_start"()
    rx461_cur."!cursor_debug"("START ", "sigil")
    .lex unicode:"$\x{a2}", rx461_cur
    .local pmc match
    .lex "$/", match
    length rx461_eos, rx461_tgt
    set rx461_off, 0
    lt rx461_pos, 2, rx461_start
    sub rx461_off, rx461_pos, 1
    substr rx461_tgt, rx461_tgt, rx461_off
  rx461_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan464_done
    goto rxscan464_scan
  rxscan464_loop:
    ($P10) = rx461_cur."from"()
    inc $P10
    set rx461_pos, $P10
    ge rx461_pos, rx461_eos, rxscan464_done
  rxscan464_scan:
    set_addr $I10, rxscan464_loop
    rx461_cur."!mark_push"(0, rx461_pos, $I10)
  rxscan464_done:
.annotate "line", 229
  # rx enumcharlist negate=0 
    ge rx461_pos, rx461_eos, rx461_fail
    sub $I10, rx461_pos, rx461_off
    substr $S10, rx461_tgt, $I10, 1
    index $I11, "$@%&", $S10
    lt $I11, 0, rx461_fail
    inc rx461_pos
  # rx pass
    rx461_cur."!cursor_pass"(rx461_pos, "sigil")
    rx461_cur."!cursor_debug"("PASS  ", "sigil", " at pos=", rx461_pos)
    .return (rx461_cur)
  rx461_fail:
.annotate "line", 4
    (rx461_rep, rx461_pos, $I10, $P10) = rx461_cur."!mark_fail"(0)
    lt rx461_pos, -1, rx461_done
    eq rx461_pos, -1, rx461_fail
    jump $I10
  rx461_done:
    rx461_cur."!cursor_fail"()
    rx461_cur."!cursor_debug"("FAIL  ", "sigil")
    .return (rx461_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__sigil"  :subid("112_1259103982.97329") :method
.annotate "line", 4
    new $P463, "ResizablePMCArray"
    push $P463, "&"
    push $P463, "%"
    push $P463, "@"
    push $P463, "$"
    .return ($P463)
.end


.namespace ["NQP";"Grammar"]
.sub "twigil"  :subid("113_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx466_tgt
    .local int rx466_pos
    .local int rx466_off
    .local int rx466_eos
    .local int rx466_rep
    .local pmc rx466_cur
    (rx466_cur, rx466_pos, rx466_tgt) = self."!cursor_start"()
    rx466_cur."!cursor_debug"("START ", "twigil")
    .lex unicode:"$\x{a2}", rx466_cur
    .local pmc match
    .lex "$/", match
    length rx466_eos, rx466_tgt
    set rx466_off, 0
    lt rx466_pos, 2, rx466_start
    sub rx466_off, rx466_pos, 1
    substr rx466_tgt, rx466_tgt, rx466_off
  rx466_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan469_done
    goto rxscan469_scan
  rxscan469_loop:
    ($P10) = rx466_cur."from"()
    inc $P10
    set rx466_pos, $P10
    ge rx466_pos, rx466_eos, rxscan469_done
  rxscan469_scan:
    set_addr $I10, rxscan469_loop
    rx466_cur."!mark_push"(0, rx466_pos, $I10)
  rxscan469_done:
.annotate "line", 231
  # rx enumcharlist negate=0 
    ge rx466_pos, rx466_eos, rx466_fail
    sub $I10, rx466_pos, rx466_off
    substr $S10, rx466_tgt, $I10, 1
    index $I11, "*!?", $S10
    lt $I11, 0, rx466_fail
    inc rx466_pos
  # rx pass
    rx466_cur."!cursor_pass"(rx466_pos, "twigil")
    rx466_cur."!cursor_debug"("PASS  ", "twigil", " at pos=", rx466_pos)
    .return (rx466_cur)
  rx466_fail:
.annotate "line", 4
    (rx466_rep, rx466_pos, $I10, $P10) = rx466_cur."!mark_fail"(0)
    lt rx466_pos, -1, rx466_done
    eq rx466_pos, -1, rx466_fail
    jump $I10
  rx466_done:
    rx466_cur."!cursor_fail"()
    rx466_cur."!cursor_debug"("FAIL  ", "twigil")
    .return (rx466_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__twigil"  :subid("114_1259103982.97329") :method
.annotate "line", 4
    new $P468, "ResizablePMCArray"
    push $P468, "?"
    push $P468, "!"
    push $P468, "*"
    .return ($P468)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator"  :subid("115_1259103982.97329") :method
.annotate "line", 233
    $P471 = self."!protoregex"("package_declarator")
    .return ($P471)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator"  :subid("116_1259103982.97329") :method
.annotate "line", 233
    $P473 = self."!PREFIX__!protoregex"("package_declarator")
    .return ($P473)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<module>"  :subid("117_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx475_tgt
    .local int rx475_pos
    .local int rx475_off
    .local int rx475_eos
    .local int rx475_rep
    .local pmc rx475_cur
    (rx475_cur, rx475_pos, rx475_tgt) = self."!cursor_start"()
    rx475_cur."!cursor_debug"("START ", "package_declarator:sym<module>")
    .lex unicode:"$\x{a2}", rx475_cur
    .local pmc match
    .lex "$/", match
    length rx475_eos, rx475_tgt
    set rx475_off, 0
    lt rx475_pos, 2, rx475_start
    sub rx475_off, rx475_pos, 1
    substr rx475_tgt, rx475_tgt, rx475_off
  rx475_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan479_done
    goto rxscan479_scan
  rxscan479_loop:
    ($P10) = rx475_cur."from"()
    inc $P10
    set rx475_pos, $P10
    ge rx475_pos, rx475_eos, rxscan479_done
  rxscan479_scan:
    set_addr $I10, rxscan479_loop
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  rxscan479_done:
.annotate "line", 234
  # rx subcapture "sym"
    set_addr $I10, rxcap_480_fail
    rx475_cur."!mark_push"(0, rx475_pos, $I10)
  # rx literal  "module"
    add $I11, rx475_pos, 6
    gt $I11, rx475_eos, rx475_fail
    sub $I11, rx475_pos, rx475_off
    substr $S10, rx475_tgt, $I11, 6
    ne $S10, "module", rx475_fail
    add rx475_pos, 6
    set_addr $I10, rxcap_480_fail
    ($I12, $I11) = rx475_cur."!mark_peek"($I10)
    rx475_cur."!cursor_pos"($I11)
    ($P10) = rx475_cur."!cursor_start"()
    $P10."!cursor_pass"(rx475_pos, "")
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_480_done
  rxcap_480_fail:
    goto rx475_fail
  rxcap_480_done:
  # rx subrule "package_def" subtype=capture negate=
    rx475_cur."!cursor_pos"(rx475_pos)
    $P10 = rx475_cur."package_def"()
    unless $P10, rx475_fail
    rx475_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx475_pos = $P10."pos"()
  # rx pass
    rx475_cur."!cursor_pass"(rx475_pos, "package_declarator:sym<module>")
    rx475_cur."!cursor_debug"("PASS  ", "package_declarator:sym<module>", " at pos=", rx475_pos)
    .return (rx475_cur)
  rx475_fail:
.annotate "line", 4
    (rx475_rep, rx475_pos, $I10, $P10) = rx475_cur."!mark_fail"(0)
    lt rx475_pos, -1, rx475_done
    eq rx475_pos, -1, rx475_fail
    jump $I10
  rx475_done:
    rx475_cur."!cursor_fail"()
    rx475_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<module>")
    .return (rx475_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<module>"  :subid("118_1259103982.97329") :method
.annotate "line", 4
    $P477 = self."!PREFIX__!subrule"("package_def", "module")
    new $P478, "ResizablePMCArray"
    push $P478, $P477
    .return ($P478)
.end


.namespace ["NQP";"Grammar"]
.sub "package_declarator:sym<class>"  :subid("119_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx482_tgt
    .local int rx482_pos
    .local int rx482_off
    .local int rx482_eos
    .local int rx482_rep
    .local pmc rx482_cur
    (rx482_cur, rx482_pos, rx482_tgt) = self."!cursor_start"()
    rx482_cur."!cursor_debug"("START ", "package_declarator:sym<class>")
    .lex unicode:"$\x{a2}", rx482_cur
    .local pmc match
    .lex "$/", match
    length rx482_eos, rx482_tgt
    set rx482_off, 0
    lt rx482_pos, 2, rx482_start
    sub rx482_off, rx482_pos, 1
    substr rx482_tgt, rx482_tgt, rx482_off
  rx482_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan487_done
    goto rxscan487_scan
  rxscan487_loop:
    ($P10) = rx482_cur."from"()
    inc $P10
    set rx482_pos, $P10
    ge rx482_pos, rx482_eos, rxscan487_done
  rxscan487_scan:
    set_addr $I10, rxscan487_loop
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  rxscan487_done:
.annotate "line", 235
  # rx subcapture "sym"
    set_addr $I10, rxcap_489_fail
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  alt488_0:
    set_addr $I10, alt488_1
    rx482_cur."!mark_push"(0, rx482_pos, $I10)
  # rx literal  "class"
    add $I11, rx482_pos, 5
    gt $I11, rx482_eos, rx482_fail
    sub $I11, rx482_pos, rx482_off
    substr $S10, rx482_tgt, $I11, 5
    ne $S10, "class", rx482_fail
    add rx482_pos, 5
    goto alt488_end
  alt488_1:
  # rx literal  "grammar"
    add $I11, rx482_pos, 7
    gt $I11, rx482_eos, rx482_fail
    sub $I11, rx482_pos, rx482_off
    substr $S10, rx482_tgt, $I11, 7
    ne $S10, "grammar", rx482_fail
    add rx482_pos, 7
  alt488_end:
    set_addr $I10, rxcap_489_fail
    ($I12, $I11) = rx482_cur."!mark_peek"($I10)
    rx482_cur."!cursor_pos"($I11)
    ($P10) = rx482_cur."!cursor_start"()
    $P10."!cursor_pass"(rx482_pos, "")
    rx482_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_489_done
  rxcap_489_fail:
    goto rx482_fail
  rxcap_489_done:
  # rx subrule "package_def" subtype=capture negate=
    rx482_cur."!cursor_pos"(rx482_pos)
    $P10 = rx482_cur."package_def"()
    unless $P10, rx482_fail
    rx482_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("package_def")
    rx482_pos = $P10."pos"()
  # rx pass
    rx482_cur."!cursor_pass"(rx482_pos, "package_declarator:sym<class>")
    rx482_cur."!cursor_debug"("PASS  ", "package_declarator:sym<class>", " at pos=", rx482_pos)
    .return (rx482_cur)
  rx482_fail:
.annotate "line", 4
    (rx482_rep, rx482_pos, $I10, $P10) = rx482_cur."!mark_fail"(0)
    lt rx482_pos, -1, rx482_done
    eq rx482_pos, -1, rx482_fail
    jump $I10
  rx482_done:
    rx482_cur."!cursor_fail"()
    rx482_cur."!cursor_debug"("FAIL  ", "package_declarator:sym<class>")
    .return (rx482_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_declarator:sym<class>"  :subid("120_1259103982.97329") :method
.annotate "line", 4
    $P484 = self."!PREFIX__!subrule"("package_def", "grammar")
    $P485 = self."!PREFIX__!subrule"("package_def", "class")
    new $P486, "ResizablePMCArray"
    push $P486, $P484
    push $P486, $P485
    .return ($P486)
.end


.namespace ["NQP";"Grammar"]
.sub "package_def"  :subid("121_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx491_tgt
    .local int rx491_pos
    .local int rx491_off
    .local int rx491_eos
    .local int rx491_rep
    .local pmc rx491_cur
    (rx491_cur, rx491_pos, rx491_tgt) = self."!cursor_start"()
    rx491_cur."!cursor_debug"("START ", "package_def")
    rx491_cur."!cursor_caparray"("parent")
    .lex unicode:"$\x{a2}", rx491_cur
    .local pmc match
    .lex "$/", match
    length rx491_eos, rx491_tgt
    set rx491_off, 0
    lt rx491_pos, 2, rx491_start
    sub rx491_off, rx491_pos, 1
    substr rx491_tgt, rx491_tgt, rx491_off
  rx491_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan494_done
    goto rxscan494_scan
  rxscan494_loop:
    ($P10) = rx491_cur."from"()
    inc $P10
    set rx491_pos, $P10
    ge rx491_pos, rx491_eos, rxscan494_done
  rxscan494_scan:
    set_addr $I10, rxscan494_loop
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
  rxscan494_done:
.annotate "line", 237
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
.annotate "line", 238
  # rx subrule "name" subtype=capture negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."name"()
    unless $P10, rx491_fail
    rx491_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx491_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
.annotate "line", 239
  # rx rxquantr497 ** 0..1
    set_addr $I501, rxquantr497_done
    rx491_cur."!mark_push"(0, rx491_pos, $I501)
  rxquantr497_loop:
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  # rx literal  "is"
    add $I11, rx491_pos, 2
    gt $I11, rx491_eos, rx491_fail
    sub $I11, rx491_pos, rx491_off
    substr $S10, rx491_tgt, $I11, 2
    ne $S10, "is", rx491_fail
    add rx491_pos, 2
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  # rx subrule "name" subtype=capture negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."name"()
    unless $P10, rx491_fail
    rx491_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parent")
    rx491_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
    (rx491_rep) = rx491_cur."!mark_commit"($I501)
  rxquantr497_done:
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  alt503_0:
.annotate "line", 240
    set_addr $I10, alt503_1
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
.annotate "line", 241
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx491_pos, 1
    gt $I11, rx491_eos, rx491_fail
    sub $I11, rx491_pos, rx491_off
    substr $S10, rx491_tgt, $I11, 1
    ne $S10, ";", rx491_fail
    add rx491_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  # rx subrule "comp_unit" subtype=capture negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."comp_unit"()
    unless $P10, rx491_fail
    rx491_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("comp_unit")
    rx491_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
    goto alt503_end
  alt503_1:
    set_addr $I10, alt503_2
    rx491_cur."!mark_push"(0, rx491_pos, $I10)
.annotate "line", 242
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx491_pos, rx491_eos, rx491_fail
    sub $I10, rx491_pos, rx491_off
    substr $S10, rx491_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx491_fail
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  # rx subrule "block" subtype=capture negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."block"()
    unless $P10, rx491_fail
    rx491_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx491_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
    goto alt503_end
  alt503_2:
.annotate "line", 243
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."panic"("Malformed package declaration")
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
  alt503_end:
.annotate "line", 244
  # rx subrule "ws" subtype=method negate=
    rx491_cur."!cursor_pos"(rx491_pos)
    $P10 = rx491_cur."ws"()
    unless $P10, rx491_fail
    rx491_pos = $P10."pos"()
.annotate "line", 237
  # rx pass
    rx491_cur."!cursor_pass"(rx491_pos, "package_def")
    rx491_cur."!cursor_debug"("PASS  ", "package_def", " at pos=", rx491_pos)
    .return (rx491_cur)
  rx491_fail:
.annotate "line", 4
    (rx491_rep, rx491_pos, $I10, $P10) = rx491_cur."!mark_fail"(0)
    lt rx491_pos, -1, rx491_done
    eq rx491_pos, -1, rx491_fail
    jump $I10
  rx491_done:
    rx491_cur."!cursor_fail"()
    rx491_cur."!cursor_debug"("FAIL  ", "package_def")
    .return (rx491_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__package_def"  :subid("122_1259103982.97329") :method
.annotate "line", 4
    new $P493, "ResizablePMCArray"
    push $P493, ""
    .return ($P493)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator"  :subid("123_1259103982.97329") :method
.annotate "line", 247
    $P514 = self."!protoregex"("scope_declarator")
    .return ($P514)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator"  :subid("124_1259103982.97329") :method
.annotate "line", 247
    $P516 = self."!PREFIX__!protoregex"("scope_declarator")
    .return ($P516)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<my>"  :subid("125_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx518_tgt
    .local int rx518_pos
    .local int rx518_off
    .local int rx518_eos
    .local int rx518_rep
    .local pmc rx518_cur
    (rx518_cur, rx518_pos, rx518_tgt) = self."!cursor_start"()
    rx518_cur."!cursor_debug"("START ", "scope_declarator:sym<my>")
    .lex unicode:"$\x{a2}", rx518_cur
    .local pmc match
    .lex "$/", match
    length rx518_eos, rx518_tgt
    set rx518_off, 0
    lt rx518_pos, 2, rx518_start
    sub rx518_off, rx518_pos, 1
    substr rx518_tgt, rx518_tgt, rx518_off
  rx518_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan522_done
    goto rxscan522_scan
  rxscan522_loop:
    ($P10) = rx518_cur."from"()
    inc $P10
    set rx518_pos, $P10
    ge rx518_pos, rx518_eos, rxscan522_done
  rxscan522_scan:
    set_addr $I10, rxscan522_loop
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  rxscan522_done:
.annotate "line", 248
  # rx subcapture "sym"
    set_addr $I10, rxcap_523_fail
    rx518_cur."!mark_push"(0, rx518_pos, $I10)
  # rx literal  "my"
    add $I11, rx518_pos, 2
    gt $I11, rx518_eos, rx518_fail
    sub $I11, rx518_pos, rx518_off
    substr $S10, rx518_tgt, $I11, 2
    ne $S10, "my", rx518_fail
    add rx518_pos, 2
    set_addr $I10, rxcap_523_fail
    ($I12, $I11) = rx518_cur."!mark_peek"($I10)
    rx518_cur."!cursor_pos"($I11)
    ($P10) = rx518_cur."!cursor_start"()
    $P10."!cursor_pass"(rx518_pos, "")
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_523_done
  rxcap_523_fail:
    goto rx518_fail
  rxcap_523_done:
  # rx subrule "scoped" subtype=capture negate=
    rx518_cur."!cursor_pos"(rx518_pos)
    $P10 = rx518_cur."scoped"("my")
    unless $P10, rx518_fail
    rx518_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx518_pos = $P10."pos"()
  # rx pass
    rx518_cur."!cursor_pass"(rx518_pos, "scope_declarator:sym<my>")
    rx518_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<my>", " at pos=", rx518_pos)
    .return (rx518_cur)
  rx518_fail:
.annotate "line", 4
    (rx518_rep, rx518_pos, $I10, $P10) = rx518_cur."!mark_fail"(0)
    lt rx518_pos, -1, rx518_done
    eq rx518_pos, -1, rx518_fail
    jump $I10
  rx518_done:
    rx518_cur."!cursor_fail"()
    rx518_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<my>")
    .return (rx518_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<my>"  :subid("126_1259103982.97329") :method
.annotate "line", 4
    $P520 = self."!PREFIX__!subrule"("scoped", "my")
    new $P521, "ResizablePMCArray"
    push $P521, $P520
    .return ($P521)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<our>"  :subid("127_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx525_tgt
    .local int rx525_pos
    .local int rx525_off
    .local int rx525_eos
    .local int rx525_rep
    .local pmc rx525_cur
    (rx525_cur, rx525_pos, rx525_tgt) = self."!cursor_start"()
    rx525_cur."!cursor_debug"("START ", "scope_declarator:sym<our>")
    .lex unicode:"$\x{a2}", rx525_cur
    .local pmc match
    .lex "$/", match
    length rx525_eos, rx525_tgt
    set rx525_off, 0
    lt rx525_pos, 2, rx525_start
    sub rx525_off, rx525_pos, 1
    substr rx525_tgt, rx525_tgt, rx525_off
  rx525_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan529_done
    goto rxscan529_scan
  rxscan529_loop:
    ($P10) = rx525_cur."from"()
    inc $P10
    set rx525_pos, $P10
    ge rx525_pos, rx525_eos, rxscan529_done
  rxscan529_scan:
    set_addr $I10, rxscan529_loop
    rx525_cur."!mark_push"(0, rx525_pos, $I10)
  rxscan529_done:
.annotate "line", 249
  # rx subcapture "sym"
    set_addr $I10, rxcap_530_fail
    rx525_cur."!mark_push"(0, rx525_pos, $I10)
  # rx literal  "our"
    add $I11, rx525_pos, 3
    gt $I11, rx525_eos, rx525_fail
    sub $I11, rx525_pos, rx525_off
    substr $S10, rx525_tgt, $I11, 3
    ne $S10, "our", rx525_fail
    add rx525_pos, 3
    set_addr $I10, rxcap_530_fail
    ($I12, $I11) = rx525_cur."!mark_peek"($I10)
    rx525_cur."!cursor_pos"($I11)
    ($P10) = rx525_cur."!cursor_start"()
    $P10."!cursor_pass"(rx525_pos, "")
    rx525_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_530_done
  rxcap_530_fail:
    goto rx525_fail
  rxcap_530_done:
  # rx subrule "scoped" subtype=capture negate=
    rx525_cur."!cursor_pos"(rx525_pos)
    $P10 = rx525_cur."scoped"("our")
    unless $P10, rx525_fail
    rx525_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx525_pos = $P10."pos"()
  # rx pass
    rx525_cur."!cursor_pass"(rx525_pos, "scope_declarator:sym<our>")
    rx525_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<our>", " at pos=", rx525_pos)
    .return (rx525_cur)
  rx525_fail:
.annotate "line", 4
    (rx525_rep, rx525_pos, $I10, $P10) = rx525_cur."!mark_fail"(0)
    lt rx525_pos, -1, rx525_done
    eq rx525_pos, -1, rx525_fail
    jump $I10
  rx525_done:
    rx525_cur."!cursor_fail"()
    rx525_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<our>")
    .return (rx525_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<our>"  :subid("128_1259103982.97329") :method
.annotate "line", 4
    $P527 = self."!PREFIX__!subrule"("scoped", "our")
    new $P528, "ResizablePMCArray"
    push $P528, $P527
    .return ($P528)
.end


.namespace ["NQP";"Grammar"]
.sub "scope_declarator:sym<has>"  :subid("129_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx532_tgt
    .local int rx532_pos
    .local int rx532_off
    .local int rx532_eos
    .local int rx532_rep
    .local pmc rx532_cur
    (rx532_cur, rx532_pos, rx532_tgt) = self."!cursor_start"()
    rx532_cur."!cursor_debug"("START ", "scope_declarator:sym<has>")
    .lex unicode:"$\x{a2}", rx532_cur
    .local pmc match
    .lex "$/", match
    length rx532_eos, rx532_tgt
    set rx532_off, 0
    lt rx532_pos, 2, rx532_start
    sub rx532_off, rx532_pos, 1
    substr rx532_tgt, rx532_tgt, rx532_off
  rx532_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan536_done
    goto rxscan536_scan
  rxscan536_loop:
    ($P10) = rx532_cur."from"()
    inc $P10
    set rx532_pos, $P10
    ge rx532_pos, rx532_eos, rxscan536_done
  rxscan536_scan:
    set_addr $I10, rxscan536_loop
    rx532_cur."!mark_push"(0, rx532_pos, $I10)
  rxscan536_done:
.annotate "line", 250
  # rx subcapture "sym"
    set_addr $I10, rxcap_537_fail
    rx532_cur."!mark_push"(0, rx532_pos, $I10)
  # rx literal  "has"
    add $I11, rx532_pos, 3
    gt $I11, rx532_eos, rx532_fail
    sub $I11, rx532_pos, rx532_off
    substr $S10, rx532_tgt, $I11, 3
    ne $S10, "has", rx532_fail
    add rx532_pos, 3
    set_addr $I10, rxcap_537_fail
    ($I12, $I11) = rx532_cur."!mark_peek"($I10)
    rx532_cur."!cursor_pos"($I11)
    ($P10) = rx532_cur."!cursor_start"()
    $P10."!cursor_pass"(rx532_pos, "")
    rx532_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_537_done
  rxcap_537_fail:
    goto rx532_fail
  rxcap_537_done:
  # rx subrule "scoped" subtype=capture negate=
    rx532_cur."!cursor_pos"(rx532_pos)
    $P10 = rx532_cur."scoped"("has")
    unless $P10, rx532_fail
    rx532_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("scoped")
    rx532_pos = $P10."pos"()
  # rx pass
    rx532_cur."!cursor_pass"(rx532_pos, "scope_declarator:sym<has>")
    rx532_cur."!cursor_debug"("PASS  ", "scope_declarator:sym<has>", " at pos=", rx532_pos)
    .return (rx532_cur)
  rx532_fail:
.annotate "line", 4
    (rx532_rep, rx532_pos, $I10, $P10) = rx532_cur."!mark_fail"(0)
    lt rx532_pos, -1, rx532_done
    eq rx532_pos, -1, rx532_fail
    jump $I10
  rx532_done:
    rx532_cur."!cursor_fail"()
    rx532_cur."!cursor_debug"("FAIL  ", "scope_declarator:sym<has>")
    .return (rx532_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scope_declarator:sym<has>"  :subid("130_1259103982.97329") :method
.annotate "line", 4
    $P534 = self."!PREFIX__!subrule"("scoped", "has")
    new $P535, "ResizablePMCArray"
    push $P535, $P534
    .return ($P535)
.end


.namespace ["NQP";"Grammar"]
.sub "scoped"  :subid("131_1259103982.97329") :method :outer("11_1259103982.97329")
    .param pmc param_539
.annotate "line", 252
    .lex "$*SCOPE", param_539
.annotate "line", 4
    .local string rx540_tgt
    .local int rx540_pos
    .local int rx540_off
    .local int rx540_eos
    .local int rx540_rep
    .local pmc rx540_cur
    (rx540_cur, rx540_pos, rx540_tgt) = self."!cursor_start"()
    rx540_cur."!cursor_debug"("START ", "scoped")
    .lex unicode:"$\x{a2}", rx540_cur
    .local pmc match
    .lex "$/", match
    length rx540_eos, rx540_tgt
    set rx540_off, 0
    lt rx540_pos, 2, rx540_start
    sub rx540_off, rx540_pos, 1
    substr rx540_tgt, rx540_tgt, rx540_off
  rx540_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan543_done
    goto rxscan543_scan
  rxscan543_loop:
    ($P10) = rx540_cur."from"()
    inc $P10
    set rx540_pos, $P10
    ge rx540_pos, rx540_eos, rxscan543_done
  rxscan543_scan:
    set_addr $I10, rxscan543_loop
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
  rxscan543_done:
  alt544_0:
.annotate "line", 252
    set_addr $I10, alt544_1
    rx540_cur."!mark_push"(0, rx540_pos, $I10)
.annotate "line", 253
  # rx subrule "ws" subtype=method negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."ws"()
    unless $P10, rx540_fail
    rx540_pos = $P10."pos"()
  # rx subrule "variable_declarator" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."variable_declarator"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable_declarator")
    rx540_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."ws"()
    unless $P10, rx540_fail
    rx540_pos = $P10."pos"()
    goto alt544_end
  alt544_1:
.annotate "line", 254
  # rx subrule "ws" subtype=method negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."ws"()
    unless $P10, rx540_fail
    rx540_pos = $P10."pos"()
  # rx subrule "routine_declarator" subtype=capture negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."routine_declarator"()
    unless $P10, rx540_fail
    rx540_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_declarator")
    rx540_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx540_cur."!cursor_pos"(rx540_pos)
    $P10 = rx540_cur."ws"()
    unless $P10, rx540_fail
    rx540_pos = $P10."pos"()
  alt544_end:
.annotate "line", 252
  # rx pass
    rx540_cur."!cursor_pass"(rx540_pos, "scoped")
    rx540_cur."!cursor_debug"("PASS  ", "scoped", " at pos=", rx540_pos)
    .return (rx540_cur)
  rx540_fail:
.annotate "line", 4
    (rx540_rep, rx540_pos, $I10, $P10) = rx540_cur."!mark_fail"(0)
    lt rx540_pos, -1, rx540_done
    eq rx540_pos, -1, rx540_fail
    jump $I10
  rx540_done:
    rx540_cur."!cursor_fail"()
    rx540_cur."!cursor_debug"("FAIL  ", "scoped")
    .return (rx540_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__scoped"  :subid("132_1259103982.97329") :method
.annotate "line", 4
    new $P542, "ResizablePMCArray"
    push $P542, ""
    push $P542, ""
    .return ($P542)
.end


.namespace ["NQP";"Grammar"]
.sub "variable_declarator"  :subid("133_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx550_tgt
    .local int rx550_pos
    .local int rx550_off
    .local int rx550_eos
    .local int rx550_rep
    .local pmc rx550_cur
    (rx550_cur, rx550_pos, rx550_tgt) = self."!cursor_start"()
    rx550_cur."!cursor_debug"("START ", "variable_declarator")
    .lex unicode:"$\x{a2}", rx550_cur
    .local pmc match
    .lex "$/", match
    length rx550_eos, rx550_tgt
    set rx550_off, 0
    lt rx550_pos, 2, rx550_start
    sub rx550_off, rx550_pos, 1
    substr rx550_tgt, rx550_tgt, rx550_off
  rx550_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan554_done
    goto rxscan554_scan
  rxscan554_loop:
    ($P10) = rx550_cur."from"()
    inc $P10
    set rx550_pos, $P10
    ge rx550_pos, rx550_eos, rxscan554_done
  rxscan554_scan:
    set_addr $I10, rxscan554_loop
    rx550_cur."!mark_push"(0, rx550_pos, $I10)
  rxscan554_done:
.annotate "line", 257
  # rx subrule "variable" subtype=capture negate=
    rx550_cur."!cursor_pos"(rx550_pos)
    $P10 = rx550_cur."variable"()
    unless $P10, rx550_fail
    rx550_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx550_pos = $P10."pos"()
  # rx pass
    rx550_cur."!cursor_pass"(rx550_pos, "variable_declarator")
    rx550_cur."!cursor_debug"("PASS  ", "variable_declarator", " at pos=", rx550_pos)
    .return (rx550_cur)
  rx550_fail:
.annotate "line", 4
    (rx550_rep, rx550_pos, $I10, $P10) = rx550_cur."!mark_fail"(0)
    lt rx550_pos, -1, rx550_done
    eq rx550_pos, -1, rx550_fail
    jump $I10
  rx550_done:
    rx550_cur."!cursor_fail"()
    rx550_cur."!cursor_debug"("FAIL  ", "variable_declarator")
    .return (rx550_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__variable_declarator"  :subid("134_1259103982.97329") :method
.annotate "line", 4
    $P552 = self."!PREFIX__!subrule"("variable", "")
    new $P553, "ResizablePMCArray"
    push $P553, $P552
    .return ($P553)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator"  :subid("135_1259103982.97329") :method
.annotate "line", 259
    $P556 = self."!protoregex"("routine_declarator")
    .return ($P556)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator"  :subid("136_1259103982.97329") :method
.annotate "line", 259
    $P558 = self."!PREFIX__!protoregex"("routine_declarator")
    .return ($P558)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<sub>"  :subid("137_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx560_tgt
    .local int rx560_pos
    .local int rx560_off
    .local int rx560_eos
    .local int rx560_rep
    .local pmc rx560_cur
    (rx560_cur, rx560_pos, rx560_tgt) = self."!cursor_start"()
    rx560_cur."!cursor_debug"("START ", "routine_declarator:sym<sub>")
    .lex unicode:"$\x{a2}", rx560_cur
    .local pmc match
    .lex "$/", match
    length rx560_eos, rx560_tgt
    set rx560_off, 0
    lt rx560_pos, 2, rx560_start
    sub rx560_off, rx560_pos, 1
    substr rx560_tgt, rx560_tgt, rx560_off
  rx560_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan564_done
    goto rxscan564_scan
  rxscan564_loop:
    ($P10) = rx560_cur."from"()
    inc $P10
    set rx560_pos, $P10
    ge rx560_pos, rx560_eos, rxscan564_done
  rxscan564_scan:
    set_addr $I10, rxscan564_loop
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
  rxscan564_done:
.annotate "line", 260
  # rx subcapture "sym"
    set_addr $I10, rxcap_565_fail
    rx560_cur."!mark_push"(0, rx560_pos, $I10)
  # rx literal  "sub"
    add $I11, rx560_pos, 3
    gt $I11, rx560_eos, rx560_fail
    sub $I11, rx560_pos, rx560_off
    substr $S10, rx560_tgt, $I11, 3
    ne $S10, "sub", rx560_fail
    add rx560_pos, 3
    set_addr $I10, rxcap_565_fail
    ($I12, $I11) = rx560_cur."!mark_peek"($I10)
    rx560_cur."!cursor_pos"($I11)
    ($P10) = rx560_cur."!cursor_start"()
    $P10."!cursor_pass"(rx560_pos, "")
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_565_done
  rxcap_565_fail:
    goto rx560_fail
  rxcap_565_done:
  # rx subrule "routine_def" subtype=capture negate=
    rx560_cur."!cursor_pos"(rx560_pos)
    $P10 = rx560_cur."routine_def"()
    unless $P10, rx560_fail
    rx560_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("routine_def")
    rx560_pos = $P10."pos"()
  # rx pass
    rx560_cur."!cursor_pass"(rx560_pos, "routine_declarator:sym<sub>")
    rx560_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<sub>", " at pos=", rx560_pos)
    .return (rx560_cur)
  rx560_fail:
.annotate "line", 4
    (rx560_rep, rx560_pos, $I10, $P10) = rx560_cur."!mark_fail"(0)
    lt rx560_pos, -1, rx560_done
    eq rx560_pos, -1, rx560_fail
    jump $I10
  rx560_done:
    rx560_cur."!cursor_fail"()
    rx560_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<sub>")
    .return (rx560_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<sub>"  :subid("138_1259103982.97329") :method
.annotate "line", 4
    $P562 = self."!PREFIX__!subrule"("routine_def", "sub")
    new $P563, "ResizablePMCArray"
    push $P563, $P562
    .return ($P563)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_declarator:sym<method>"  :subid("139_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx567_tgt
    .local int rx567_pos
    .local int rx567_off
    .local int rx567_eos
    .local int rx567_rep
    .local pmc rx567_cur
    (rx567_cur, rx567_pos, rx567_tgt) = self."!cursor_start"()
    rx567_cur."!cursor_debug"("START ", "routine_declarator:sym<method>")
    .lex unicode:"$\x{a2}", rx567_cur
    .local pmc match
    .lex "$/", match
    length rx567_eos, rx567_tgt
    set rx567_off, 0
    lt rx567_pos, 2, rx567_start
    sub rx567_off, rx567_pos, 1
    substr rx567_tgt, rx567_tgt, rx567_off
  rx567_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan571_done
    goto rxscan571_scan
  rxscan571_loop:
    ($P10) = rx567_cur."from"()
    inc $P10
    set rx567_pos, $P10
    ge rx567_pos, rx567_eos, rxscan571_done
  rxscan571_scan:
    set_addr $I10, rxscan571_loop
    rx567_cur."!mark_push"(0, rx567_pos, $I10)
  rxscan571_done:
.annotate "line", 261
  # rx subcapture "sym"
    set_addr $I10, rxcap_572_fail
    rx567_cur."!mark_push"(0, rx567_pos, $I10)
  # rx literal  "method"
    add $I11, rx567_pos, 6
    gt $I11, rx567_eos, rx567_fail
    sub $I11, rx567_pos, rx567_off
    substr $S10, rx567_tgt, $I11, 6
    ne $S10, "method", rx567_fail
    add rx567_pos, 6
    set_addr $I10, rxcap_572_fail
    ($I12, $I11) = rx567_cur."!mark_peek"($I10)
    rx567_cur."!cursor_pos"($I11)
    ($P10) = rx567_cur."!cursor_start"()
    $P10."!cursor_pass"(rx567_pos, "")
    rx567_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_572_done
  rxcap_572_fail:
    goto rx567_fail
  rxcap_572_done:
  # rx subrule "method_def" subtype=capture negate=
    rx567_cur."!cursor_pos"(rx567_pos)
    $P10 = rx567_cur."method_def"()
    unless $P10, rx567_fail
    rx567_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("method_def")
    rx567_pos = $P10."pos"()
  # rx pass
    rx567_cur."!cursor_pass"(rx567_pos, "routine_declarator:sym<method>")
    rx567_cur."!cursor_debug"("PASS  ", "routine_declarator:sym<method>", " at pos=", rx567_pos)
    .return (rx567_cur)
  rx567_fail:
.annotate "line", 4
    (rx567_rep, rx567_pos, $I10, $P10) = rx567_cur."!mark_fail"(0)
    lt rx567_pos, -1, rx567_done
    eq rx567_pos, -1, rx567_fail
    jump $I10
  rx567_done:
    rx567_cur."!cursor_fail"()
    rx567_cur."!cursor_debug"("FAIL  ", "routine_declarator:sym<method>")
    .return (rx567_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_declarator:sym<method>"  :subid("140_1259103982.97329") :method
.annotate "line", 4
    $P569 = self."!PREFIX__!subrule"("method_def", "method")
    new $P570, "ResizablePMCArray"
    push $P570, $P569
    .return ($P570)
.end


.namespace ["NQP";"Grammar"]
.sub "routine_def"  :subid("141_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx574_tgt
    .local int rx574_pos
    .local int rx574_off
    .local int rx574_eos
    .local int rx574_rep
    .local pmc rx574_cur
    (rx574_cur, rx574_pos, rx574_tgt) = self."!cursor_start"()
    rx574_cur."!cursor_debug"("START ", "routine_def")
    rx574_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx574_cur
    .local pmc match
    .lex "$/", match
    length rx574_eos, rx574_tgt
    set rx574_off, 0
    lt rx574_pos, 2, rx574_start
    sub rx574_off, rx574_pos, 1
    substr rx574_tgt, rx574_tgt, rx574_off
  rx574_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan577_done
    goto rxscan577_scan
  rxscan577_loop:
    ($P10) = rx574_cur."from"()
    inc $P10
    set rx574_pos, $P10
    ge rx574_pos, rx574_eos, rxscan577_done
  rxscan577_scan:
    set_addr $I10, rxscan577_loop
    rx574_cur."!mark_push"(0, rx574_pos, $I10)
  rxscan577_done:
.annotate "line", 263
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
.annotate "line", 264
  # rx rxquantr579 ** 0..1
    set_addr $I580, rxquantr579_done
    rx574_cur."!mark_push"(0, rx574_pos, $I580)
  rxquantr579_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."deflongname"()
    unless $P10, rx574_fail
    rx574_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx574_pos = $P10."pos"()
    (rx574_rep) = rx574_cur."!mark_commit"($I580)
  rxquantr579_done:
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
.annotate "line", 265
  # rx subrule "newpad" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."newpad"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
  alt583_0:
.annotate "line", 266
    set_addr $I10, alt583_1
    rx574_cur."!mark_push"(0, rx574_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx574_pos, 1
    gt $I11, rx574_eos, rx574_fail
    sub $I11, rx574_pos, rx574_off
    substr $S10, rx574_tgt, $I11, 1
    ne $S10, "(", rx574_fail
    add rx574_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."signature"()
    unless $P10, rx574_fail
    rx574_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx574_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx574_pos, 1
    gt $I11, rx574_eos, rx574_fail
    sub $I11, rx574_pos, rx574_off
    substr $S10, rx574_tgt, $I11, 1
    ne $S10, ")", rx574_fail
    add rx574_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
    goto alt583_end
  alt583_1:
.annotate "line", 267
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
  alt583_end:
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
.annotate "line", 268
  # rx subrule "blockoid" subtype=capture negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."blockoid"()
    unless $P10, rx574_fail
    rx574_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx574_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx574_cur."!cursor_pos"(rx574_pos)
    $P10 = rx574_cur."ws"()
    unless $P10, rx574_fail
    rx574_pos = $P10."pos"()
.annotate "line", 263
  # rx pass
    rx574_cur."!cursor_pass"(rx574_pos, "routine_def")
    rx574_cur."!cursor_debug"("PASS  ", "routine_def", " at pos=", rx574_pos)
    .return (rx574_cur)
  rx574_fail:
.annotate "line", 4
    (rx574_rep, rx574_pos, $I10, $P10) = rx574_cur."!mark_fail"(0)
    lt rx574_pos, -1, rx574_done
    eq rx574_pos, -1, rx574_fail
    jump $I10
  rx574_done:
    rx574_cur."!cursor_fail"()
    rx574_cur."!cursor_debug"("FAIL  ", "routine_def")
    .return (rx574_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__routine_def"  :subid("142_1259103982.97329") :method
.annotate "line", 4
    new $P576, "ResizablePMCArray"
    push $P576, ""
    .return ($P576)
.end


.namespace ["NQP";"Grammar"]
.sub "method_def"  :subid("143_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx593_tgt
    .local int rx593_pos
    .local int rx593_off
    .local int rx593_eos
    .local int rx593_rep
    .local pmc rx593_cur
    (rx593_cur, rx593_pos, rx593_tgt) = self."!cursor_start"()
    rx593_cur."!cursor_debug"("START ", "method_def")
    rx593_cur."!cursor_caparray"("deflongname")
    .lex unicode:"$\x{a2}", rx593_cur
    .local pmc match
    .lex "$/", match
    length rx593_eos, rx593_tgt
    set rx593_off, 0
    lt rx593_pos, 2, rx593_start
    sub rx593_off, rx593_pos, 1
    substr rx593_tgt, rx593_tgt, rx593_off
  rx593_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan596_done
    goto rxscan596_scan
  rxscan596_loop:
    ($P10) = rx593_cur."from"()
    inc $P10
    set rx593_pos, $P10
    ge rx593_pos, rx593_eos, rxscan596_done
  rxscan596_scan:
    set_addr $I10, rxscan596_loop
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  rxscan596_done:
.annotate "line", 271
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 272
  # rx rxquantr598 ** 0..1
    set_addr $I599, rxquantr598_done
    rx593_cur."!mark_push"(0, rx593_pos, $I599)
  rxquantr598_loop:
  # rx subrule "deflongname" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."deflongname"()
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx593_pos = $P10."pos"()
    (rx593_rep) = rx593_cur."!mark_commit"($I599)
  rxquantr598_done:
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 273
  # rx subrule "newpad" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."newpad"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  alt602_0:
.annotate "line", 274
    set_addr $I10, alt602_1
    rx593_cur."!mark_push"(0, rx593_pos, $I10)
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx593_pos, 1
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 1
    ne $S10, "(", rx593_fail
    add rx593_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."signature"()
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx593_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx593_pos, 1
    gt $I11, rx593_eos, rx593_fail
    sub $I11, rx593_pos, rx593_off
    substr $S10, rx593_tgt, $I11, 1
    ne $S10, ")", rx593_fail
    add rx593_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
    goto alt602_end
  alt602_1:
.annotate "line", 275
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx subrule "panic" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."panic"("Routine declaration requires a signature")
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
  alt602_end:
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 276
  # rx subrule "blockoid" subtype=capture negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."blockoid"()
    unless $P10, rx593_fail
    rx593_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("blockoid")
    rx593_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx593_cur."!cursor_pos"(rx593_pos)
    $P10 = rx593_cur."ws"()
    unless $P10, rx593_fail
    rx593_pos = $P10."pos"()
.annotate "line", 271
  # rx pass
    rx593_cur."!cursor_pass"(rx593_pos, "method_def")
    rx593_cur."!cursor_debug"("PASS  ", "method_def", " at pos=", rx593_pos)
    .return (rx593_cur)
  rx593_fail:
.annotate "line", 4
    (rx593_rep, rx593_pos, $I10, $P10) = rx593_cur."!mark_fail"(0)
    lt rx593_pos, -1, rx593_done
    eq rx593_pos, -1, rx593_fail
    jump $I10
  rx593_done:
    rx593_cur."!cursor_fail"()
    rx593_cur."!cursor_debug"("FAIL  ", "method_def")
    .return (rx593_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__method_def"  :subid("144_1259103982.97329") :method
.annotate "line", 4
    new $P595, "ResizablePMCArray"
    push $P595, ""
    .return ($P595)
.end


.namespace ["NQP";"Grammar"]
.sub "signature"  :subid("145_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx612_tgt
    .local int rx612_pos
    .local int rx612_off
    .local int rx612_eos
    .local int rx612_rep
    .local pmc rx612_cur
    (rx612_cur, rx612_pos, rx612_tgt) = self."!cursor_start"()
    rx612_cur."!cursor_debug"("START ", "signature")
    rx612_cur."!cursor_caparray"("parameter")
    .lex unicode:"$\x{a2}", rx612_cur
    .local pmc match
    .lex "$/", match
    length rx612_eos, rx612_tgt
    set rx612_off, 0
    lt rx612_pos, 2, rx612_start
    sub rx612_off, rx612_pos, 1
    substr rx612_tgt, rx612_tgt, rx612_off
  rx612_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan615_done
    goto rxscan615_scan
  rxscan615_loop:
    ($P10) = rx612_cur."from"()
    inc $P10
    set rx612_pos, $P10
    ge rx612_pos, rx612_eos, rxscan615_done
  rxscan615_scan:
    set_addr $I10, rxscan615_loop
    rx612_cur."!mark_push"(0, rx612_pos, $I10)
  rxscan615_done:
.annotate "line", 279
  # rx rxquantr616 ** 0..1
    set_addr $I619, rxquantr616_done
    rx612_cur."!mark_push"(0, rx612_pos, $I619)
  rxquantr616_loop:
  # rx rxquantr617 ** 1..*
    set_addr $I618, rxquantr617_done
    rx612_cur."!mark_push"(0, -1, $I618)
  rxquantr617_loop:
  # rx subrule "ws" subtype=method negate=
    rx612_cur."!cursor_pos"(rx612_pos)
    $P10 = rx612_cur."ws"()
    unless $P10, rx612_fail
    rx612_pos = $P10."pos"()
  # rx subrule "parameter" subtype=capture negate=
    rx612_cur."!cursor_pos"(rx612_pos)
    $P10 = rx612_cur."parameter"()
    unless $P10, rx612_fail
    rx612_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("parameter")
    rx612_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx612_cur."!cursor_pos"(rx612_pos)
    $P10 = rx612_cur."ws"()
    unless $P10, rx612_fail
    rx612_pos = $P10."pos"()
    (rx612_rep) = rx612_cur."!mark_commit"($I618)
    rx612_cur."!mark_push"(rx612_rep, rx612_pos, $I618)
  # rx literal  ","
    add $I11, rx612_pos, 1
    gt $I11, rx612_eos, rx612_fail
    sub $I11, rx612_pos, rx612_off
    substr $S10, rx612_tgt, $I11, 1
    ne $S10, ",", rx612_fail
    add rx612_pos, 1
    goto rxquantr617_loop
  rxquantr617_done:
    (rx612_rep) = rx612_cur."!mark_commit"($I619)
  rxquantr616_done:
  # rx pass
    rx612_cur."!cursor_pass"(rx612_pos, "signature")
    rx612_cur."!cursor_debug"("PASS  ", "signature", " at pos=", rx612_pos)
    .return (rx612_cur)
  rx612_fail:
.annotate "line", 4
    (rx612_rep, rx612_pos, $I10, $P10) = rx612_cur."!mark_fail"(0)
    lt rx612_pos, -1, rx612_done
    eq rx612_pos, -1, rx612_fail
    jump $I10
  rx612_done:
    rx612_cur."!cursor_fail"()
    rx612_cur."!cursor_debug"("FAIL  ", "signature")
    .return (rx612_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__signature"  :subid("146_1259103982.97329") :method
.annotate "line", 4
    new $P614, "ResizablePMCArray"
    push $P614, ""
    .return ($P614)
.end


.namespace ["NQP";"Grammar"]
.sub "parameter"  :subid("147_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx621_tgt
    .local int rx621_pos
    .local int rx621_off
    .local int rx621_eos
    .local int rx621_rep
    .local pmc rx621_cur
    (rx621_cur, rx621_pos, rx621_tgt) = self."!cursor_start"()
    rx621_cur."!cursor_debug"("START ", "parameter")
    rx621_cur."!cursor_caparray"("default_value")
    .lex unicode:"$\x{a2}", rx621_cur
    .local pmc match
    .lex "$/", match
    length rx621_eos, rx621_tgt
    set rx621_off, 0
    lt rx621_pos, 2, rx621_start
    sub rx621_off, rx621_pos, 1
    substr rx621_tgt, rx621_tgt, rx621_off
  rx621_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan627_done
    goto rxscan627_scan
  rxscan627_loop:
    ($P10) = rx621_cur."from"()
    inc $P10
    set rx621_pos, $P10
    ge rx621_pos, rx621_eos, rxscan627_done
  rxscan627_scan:
    set_addr $I10, rxscan627_loop
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
  rxscan627_done:
  alt628_0:
.annotate "line", 282
    set_addr $I10, alt628_1
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
.annotate "line", 283
  # rx subcapture "quant"
    set_addr $I10, rxcap_629_fail
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
  # rx literal  "*"
    add $I11, rx621_pos, 1
    gt $I11, rx621_eos, rx621_fail
    sub $I11, rx621_pos, rx621_off
    substr $S10, rx621_tgt, $I11, 1
    ne $S10, "*", rx621_fail
    add rx621_pos, 1
    set_addr $I10, rxcap_629_fail
    ($I12, $I11) = rx621_cur."!mark_peek"($I10)
    rx621_cur."!cursor_pos"($I11)
    ($P10) = rx621_cur."!cursor_start"()
    $P10."!cursor_pass"(rx621_pos, "")
    rx621_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_629_done
  rxcap_629_fail:
    goto rx621_fail
  rxcap_629_done:
  # rx subrule "param_var" subtype=capture negate=
    rx621_cur."!cursor_pos"(rx621_pos)
    $P10 = rx621_cur."param_var"()
    unless $P10, rx621_fail
    rx621_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx621_pos = $P10."pos"()
    goto alt628_end
  alt628_1:
  alt630_0:
.annotate "line", 284
    set_addr $I10, alt630_1
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
  # rx subrule "param_var" subtype=capture negate=
    rx621_cur."!cursor_pos"(rx621_pos)
    $P10 = rx621_cur."param_var"()
    unless $P10, rx621_fail
    rx621_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx621_pos = $P10."pos"()
    goto alt630_end
  alt630_1:
  # rx subrule "named_param" subtype=capture negate=
    rx621_cur."!cursor_pos"(rx621_pos)
    $P10 = rx621_cur."named_param"()
    unless $P10, rx621_fail
    rx621_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("named_param")
    rx621_pos = $P10."pos"()
  alt630_end:
  # rx subcapture "quant"
    set_addr $I10, rxcap_632_fail
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
  alt631_0:
    set_addr $I10, alt631_1
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
  # rx literal  "?"
    add $I11, rx621_pos, 1
    gt $I11, rx621_eos, rx621_fail
    sub $I11, rx621_pos, rx621_off
    substr $S10, rx621_tgt, $I11, 1
    ne $S10, "?", rx621_fail
    add rx621_pos, 1
    goto alt631_end
  alt631_1:
    set_addr $I10, alt631_2
    rx621_cur."!mark_push"(0, rx621_pos, $I10)
  # rx literal  "!"
    add $I11, rx621_pos, 1
    gt $I11, rx621_eos, rx621_fail
    sub $I11, rx621_pos, rx621_off
    substr $S10, rx621_tgt, $I11, 1
    ne $S10, "!", rx621_fail
    add rx621_pos, 1
    goto alt631_end
  alt631_2:
  alt631_end:
    set_addr $I10, rxcap_632_fail
    ($I12, $I11) = rx621_cur."!mark_peek"($I10)
    rx621_cur."!cursor_pos"($I11)
    ($P10) = rx621_cur."!cursor_start"()
    $P10."!cursor_pass"(rx621_pos, "")
    rx621_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quant")
    goto rxcap_632_done
  rxcap_632_fail:
    goto rx621_fail
  rxcap_632_done:
  alt628_end:
.annotate "line", 286
  # rx rxquantr633 ** 0..1
    set_addr $I634, rxquantr633_done
    rx621_cur."!mark_push"(0, rx621_pos, $I634)
  rxquantr633_loop:
  # rx subrule "default_value" subtype=capture negate=
    rx621_cur."!cursor_pos"(rx621_pos)
    $P10 = rx621_cur."default_value"()
    unless $P10, rx621_fail
    rx621_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("default_value")
    rx621_pos = $P10."pos"()
    (rx621_rep) = rx621_cur."!mark_commit"($I634)
  rxquantr633_done:
.annotate "line", 281
  # rx pass
    rx621_cur."!cursor_pass"(rx621_pos, "parameter")
    rx621_cur."!cursor_debug"("PASS  ", "parameter", " at pos=", rx621_pos)
    .return (rx621_cur)
  rx621_fail:
.annotate "line", 4
    (rx621_rep, rx621_pos, $I10, $P10) = rx621_cur."!mark_fail"(0)
    lt rx621_pos, -1, rx621_done
    eq rx621_pos, -1, rx621_fail
    jump $I10
  rx621_done:
    rx621_cur."!cursor_fail"()
    rx621_cur."!cursor_debug"("FAIL  ", "parameter")
    .return (rx621_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__parameter"  :subid("148_1259103982.97329") :method
.annotate "line", 4
    $P623 = self."!PREFIX__!subrule"("named_param", "")
    $P624 = self."!PREFIX__!subrule"("param_var", "")
    $P625 = self."!PREFIX__!subrule"("param_var", "*")
    new $P626, "ResizablePMCArray"
    push $P626, $P623
    push $P626, $P624
    push $P626, $P625
    .return ($P626)
.end


.namespace ["NQP";"Grammar"]
.sub "param_var"  :subid("149_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx636_tgt
    .local int rx636_pos
    .local int rx636_off
    .local int rx636_eos
    .local int rx636_rep
    .local pmc rx636_cur
    (rx636_cur, rx636_pos, rx636_tgt) = self."!cursor_start"()
    rx636_cur."!cursor_debug"("START ", "param_var")
    rx636_cur."!cursor_caparray"("twigil")
    .lex unicode:"$\x{a2}", rx636_cur
    .local pmc match
    .lex "$/", match
    length rx636_eos, rx636_tgt
    set rx636_off, 0
    lt rx636_pos, 2, rx636_start
    sub rx636_off, rx636_pos, 1
    substr rx636_tgt, rx636_tgt, rx636_off
  rx636_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan640_done
    goto rxscan640_scan
  rxscan640_loop:
    ($P10) = rx636_cur."from"()
    inc $P10
    set rx636_pos, $P10
    ge rx636_pos, rx636_eos, rxscan640_done
  rxscan640_scan:
    set_addr $I10, rxscan640_loop
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  rxscan640_done:
.annotate "line", 290
  # rx subrule "sigil" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."sigil"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx636_pos = $P10."pos"()
  # rx rxquantr641 ** 0..1
    set_addr $I642, rxquantr641_done
    rx636_cur."!mark_push"(0, rx636_pos, $I642)
  rxquantr641_loop:
  # rx subrule "twigil" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."twigil"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("twigil")
    rx636_pos = $P10."pos"()
    (rx636_rep) = rx636_cur."!mark_commit"($I642)
  rxquantr641_done:
  alt643_0:
.annotate "line", 291
    set_addr $I10, alt643_1
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx subrule "ident" subtype=capture negate=
    rx636_cur."!cursor_pos"(rx636_pos)
    $P10 = rx636_cur."ident"()
    unless $P10, rx636_fail
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx636_pos = $P10."pos"()
    goto alt643_end
  alt643_1:
  # rx subcapture "name"
    set_addr $I10, rxcap_644_fail
    rx636_cur."!mark_push"(0, rx636_pos, $I10)
  # rx enumcharlist negate=0 
    ge rx636_pos, rx636_eos, rx636_fail
    sub $I10, rx636_pos, rx636_off
    substr $S10, rx636_tgt, $I10, 1
    index $I11, "/!", $S10
    lt $I11, 0, rx636_fail
    inc rx636_pos
    set_addr $I10, rxcap_644_fail
    ($I12, $I11) = rx636_cur."!mark_peek"($I10)
    rx636_cur."!cursor_pos"($I11)
    ($P10) = rx636_cur."!cursor_start"()
    $P10."!cursor_pass"(rx636_pos, "")
    rx636_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    goto rxcap_644_done
  rxcap_644_fail:
    goto rx636_fail
  rxcap_644_done:
  alt643_end:
.annotate "line", 289
  # rx pass
    rx636_cur."!cursor_pass"(rx636_pos, "param_var")
    rx636_cur."!cursor_debug"("PASS  ", "param_var", " at pos=", rx636_pos)
    .return (rx636_cur)
  rx636_fail:
.annotate "line", 4
    (rx636_rep, rx636_pos, $I10, $P10) = rx636_cur."!mark_fail"(0)
    lt rx636_pos, -1, rx636_done
    eq rx636_pos, -1, rx636_fail
    jump $I10
  rx636_done:
    rx636_cur."!cursor_fail"()
    rx636_cur."!cursor_debug"("FAIL  ", "param_var")
    .return (rx636_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__param_var"  :subid("150_1259103982.97329") :method
.annotate "line", 4
    $P638 = self."!PREFIX__!subrule"("sigil", "")
    new $P639, "ResizablePMCArray"
    push $P639, $P638
    .return ($P639)
.end


.namespace ["NQP";"Grammar"]
.sub "named_param"  :subid("151_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx646_tgt
    .local int rx646_pos
    .local int rx646_off
    .local int rx646_eos
    .local int rx646_rep
    .local pmc rx646_cur
    (rx646_cur, rx646_pos, rx646_tgt) = self."!cursor_start"()
    rx646_cur."!cursor_debug"("START ", "named_param")
    .lex unicode:"$\x{a2}", rx646_cur
    .local pmc match
    .lex "$/", match
    length rx646_eos, rx646_tgt
    set rx646_off, 0
    lt rx646_pos, 2, rx646_start
    sub rx646_off, rx646_pos, 1
    substr rx646_tgt, rx646_tgt, rx646_off
  rx646_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan650_done
    goto rxscan650_scan
  rxscan650_loop:
    ($P10) = rx646_cur."from"()
    inc $P10
    set rx646_pos, $P10
    ge rx646_pos, rx646_eos, rxscan650_done
  rxscan650_scan:
    set_addr $I10, rxscan650_loop
    rx646_cur."!mark_push"(0, rx646_pos, $I10)
  rxscan650_done:
.annotate "line", 295
  # rx literal  ":"
    add $I11, rx646_pos, 1
    gt $I11, rx646_eos, rx646_fail
    sub $I11, rx646_pos, rx646_off
    substr $S10, rx646_tgt, $I11, 1
    ne $S10, ":", rx646_fail
    add rx646_pos, 1
  # rx subrule "param_var" subtype=capture negate=
    rx646_cur."!cursor_pos"(rx646_pos)
    $P10 = rx646_cur."param_var"()
    unless $P10, rx646_fail
    rx646_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("param_var")
    rx646_pos = $P10."pos"()
.annotate "line", 294
  # rx pass
    rx646_cur."!cursor_pass"(rx646_pos, "named_param")
    rx646_cur."!cursor_debug"("PASS  ", "named_param", " at pos=", rx646_pos)
    .return (rx646_cur)
  rx646_fail:
.annotate "line", 4
    (rx646_rep, rx646_pos, $I10, $P10) = rx646_cur."!mark_fail"(0)
    lt rx646_pos, -1, rx646_done
    eq rx646_pos, -1, rx646_fail
    jump $I10
  rx646_done:
    rx646_cur."!cursor_fail"()
    rx646_cur."!cursor_debug"("FAIL  ", "named_param")
    .return (rx646_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__named_param"  :subid("152_1259103982.97329") :method
.annotate "line", 4
    $P648 = self."!PREFIX__!subrule"("param_var", ":")
    new $P649, "ResizablePMCArray"
    push $P649, $P648
    .return ($P649)
.end


.namespace ["NQP";"Grammar"]
.sub "default_value"  :subid("153_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx652_tgt
    .local int rx652_pos
    .local int rx652_off
    .local int rx652_eos
    .local int rx652_rep
    .local pmc rx652_cur
    (rx652_cur, rx652_pos, rx652_tgt) = self."!cursor_start"()
    rx652_cur."!cursor_debug"("START ", "default_value")
    .lex unicode:"$\x{a2}", rx652_cur
    .local pmc match
    .lex "$/", match
    length rx652_eos, rx652_tgt
    set rx652_off, 0
    lt rx652_pos, 2, rx652_start
    sub rx652_off, rx652_pos, 1
    substr rx652_tgt, rx652_tgt, rx652_off
  rx652_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan655_done
    goto rxscan655_scan
  rxscan655_loop:
    ($P10) = rx652_cur."from"()
    inc $P10
    set rx652_pos, $P10
    ge rx652_pos, rx652_eos, rxscan655_done
  rxscan655_scan:
    set_addr $I10, rxscan655_loop
    rx652_cur."!mark_push"(0, rx652_pos, $I10)
  rxscan655_done:
.annotate "line", 298
  # rx subrule "ws" subtype=method negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."ws"()
    unless $P10, rx652_fail
    rx652_pos = $P10."pos"()
  # rx literal  "="
    add $I11, rx652_pos, 1
    gt $I11, rx652_eos, rx652_fail
    sub $I11, rx652_pos, rx652_off
    substr $S10, rx652_tgt, $I11, 1
    ne $S10, "=", rx652_fail
    add rx652_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."ws"()
    unless $P10, rx652_fail
    rx652_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."EXPR"("i=")
    unless $P10, rx652_fail
    rx652_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx652_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx652_cur."!cursor_pos"(rx652_pos)
    $P10 = rx652_cur."ws"()
    unless $P10, rx652_fail
    rx652_pos = $P10."pos"()
  # rx pass
    rx652_cur."!cursor_pass"(rx652_pos, "default_value")
    rx652_cur."!cursor_debug"("PASS  ", "default_value", " at pos=", rx652_pos)
    .return (rx652_cur)
  rx652_fail:
.annotate "line", 4
    (rx652_rep, rx652_pos, $I10, $P10) = rx652_cur."!mark_fail"(0)
    lt rx652_pos, -1, rx652_done
    eq rx652_pos, -1, rx652_fail
    jump $I10
  rx652_done:
    rx652_cur."!cursor_fail"()
    rx652_cur."!cursor_debug"("FAIL  ", "default_value")
    .return (rx652_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__default_value"  :subid("154_1259103982.97329") :method
.annotate "line", 4
    new $P654, "ResizablePMCArray"
    push $P654, ""
    .return ($P654)
.end


.namespace ["NQP";"Grammar"]
.sub "regex_declarator"  :subid("155_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx660_tgt
    .local int rx660_pos
    .local int rx660_off
    .local int rx660_eos
    .local int rx660_rep
    .local pmc rx660_cur
    (rx660_cur, rx660_pos, rx660_tgt) = self."!cursor_start"()
    rx660_cur."!cursor_debug"("START ", "regex_declarator")
    rx660_cur."!cursor_caparray"("signature")
    .lex unicode:"$\x{a2}", rx660_cur
    .local pmc match
    .lex "$/", match
    length rx660_eos, rx660_tgt
    set rx660_off, 0
    lt rx660_pos, 2, rx660_start
    sub rx660_off, rx660_pos, 1
    substr rx660_tgt, rx660_tgt, rx660_off
  rx660_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan663_done
    goto rxscan663_scan
  rxscan663_loop:
    ($P10) = rx660_cur."from"()
    inc $P10
    set rx660_pos, $P10
    ge rx660_pos, rx660_eos, rxscan663_done
  rxscan663_scan:
    set_addr $I10, rxscan663_loop
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  rxscan663_done:
.annotate "line", 300
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  alt665_0:
.annotate "line", 301
    set_addr $I10, alt665_1
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
.annotate "line", 302
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subcapture "proto"
    set_addr $I10, rxcap_667_fail
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  # rx literal  "proto"
    add $I11, rx660_pos, 5
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 5
    ne $S10, "proto", rx660_fail
    add rx660_pos, 5
    set_addr $I10, rxcap_667_fail
    ($I12, $I11) = rx660_cur."!mark_peek"($I10)
    rx660_cur."!cursor_pos"($I11)
    ($P10) = rx660_cur."!cursor_start"()
    $P10."!cursor_pass"(rx660_pos, "")
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("proto")
    goto rxcap_667_done
  rxcap_667_fail:
    goto rx660_fail
  rxcap_667_done:
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  alt669_0:
    set_addr $I10, alt669_1
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  # rx literal  "regex"
    add $I11, rx660_pos, 5
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 5
    ne $S10, "regex", rx660_fail
    add rx660_pos, 5
    goto alt669_end
  alt669_1:
    set_addr $I10, alt669_2
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  # rx literal  "token"
    add $I11, rx660_pos, 5
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 5
    ne $S10, "token", rx660_fail
    add rx660_pos, 5
    goto alt669_end
  alt669_2:
  # rx literal  "rule"
    add $I11, rx660_pos, 4
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 4
    ne $S10, "rule", rx660_fail
    add rx660_pos, 4
  alt669_end:
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 303
  # rx subrule "deflongname" subtype=capture negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."deflongname"()
    unless $P10, rx660_fail
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 304
  # rx literal  "{"
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, "{", rx660_fail
    add rx660_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx literal  "<...>"
    add $I11, rx660_pos, 5
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 5
    ne $S10, "<...>", rx660_fail
    add rx660_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, "}", rx660_fail
    add rx660_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ENDSTMT"()
    unless $P10, rx660_fail
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 302
    goto alt665_end
  alt665_1:
.annotate "line", 305
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subcapture "sym"
    set_addr $I10, rxcap_677_fail
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  alt676_0:
    set_addr $I10, alt676_1
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  # rx literal  "regex"
    add $I11, rx660_pos, 5
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 5
    ne $S10, "regex", rx660_fail
    add rx660_pos, 5
    goto alt676_end
  alt676_1:
    set_addr $I10, alt676_2
    rx660_cur."!mark_push"(0, rx660_pos, $I10)
  # rx literal  "token"
    add $I11, rx660_pos, 5
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 5
    ne $S10, "token", rx660_fail
    add rx660_pos, 5
    goto alt676_end
  alt676_2:
  # rx literal  "rule"
    add $I11, rx660_pos, 4
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 4
    ne $S10, "rule", rx660_fail
    add rx660_pos, 4
  alt676_end:
    set_addr $I10, rxcap_677_fail
    ($I12, $I11) = rx660_cur."!mark_peek"($I10)
    rx660_cur."!cursor_pos"($I11)
    ($P10) = rx660_cur."!cursor_start"()
    $P10."!cursor_pass"(rx660_pos, "")
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_677_done
  rxcap_677_fail:
    goto rx660_fail
  rxcap_677_done:
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 306
  # rx subrule "deflongname" subtype=capture negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."deflongname"()
    unless $P10, rx660_fail
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("deflongname")
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 307
  # rx subrule "newpad" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."newpad"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 308
  # rx rxquantr681 ** 0..1
    set_addr $I686, rxquantr681_done
    rx660_cur."!mark_push"(0, rx660_pos, $I686)
  rxquantr681_loop:
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, "(", rx660_fail
    add rx660_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx subrule "signature" subtype=capture negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."signature"()
    unless $P10, rx660_fail
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("signature")
    rx660_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, ")", rx660_fail
    add rx660_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
    (rx660_rep) = rx660_cur."!mark_commit"($I686)
  rxquantr681_done:
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 309
  # rx reduce name="regex_declarator" key="open"
    rx660_cur."!cursor_pos"(rx660_pos)
    rx660_cur."!reduce"("regex_declarator", "open")
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 310
  # rx literal  "{"
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, "{", rx660_fail
    add rx660_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."LANG"("Regex", "nibbler")
    unless $P10, rx660_fail
    rx660_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("p6regex")
    rx660_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx660_pos, 1
    gt $I11, rx660_eos, rx660_fail
    sub $I11, rx660_pos, rx660_off
    substr $S10, rx660_tgt, $I11, 1
    ne $S10, "}", rx660_fail
    add rx660_pos, 1
  # rx subrule "ENDSTMT" subtype=zerowidth negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ENDSTMT"()
    unless $P10, rx660_fail
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
  alt665_end:
.annotate "line", 311
  # rx subrule "ws" subtype=method negate=
    rx660_cur."!cursor_pos"(rx660_pos)
    $P10 = rx660_cur."ws"()
    unless $P10, rx660_fail
    rx660_pos = $P10."pos"()
.annotate "line", 300
  # rx pass
    rx660_cur."!cursor_pass"(rx660_pos, "regex_declarator")
    rx660_cur."!cursor_debug"("PASS  ", "regex_declarator", " at pos=", rx660_pos)
    .return (rx660_cur)
  rx660_fail:
.annotate "line", 4
    (rx660_rep, rx660_pos, $I10, $P10) = rx660_cur."!mark_fail"(0)
    lt rx660_pos, -1, rx660_done
    eq rx660_pos, -1, rx660_fail
    jump $I10
  rx660_done:
    rx660_cur."!cursor_fail"()
    rx660_cur."!cursor_debug"("FAIL  ", "regex_declarator")
    .return (rx660_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__regex_declarator"  :subid("156_1259103982.97329") :method
.annotate "line", 4
    new $P662, "ResizablePMCArray"
    push $P662, ""
    .return ($P662)
.end


.namespace ["NQP";"Grammar"]
.sub "dotty"  :subid("157_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx692_tgt
    .local int rx692_pos
    .local int rx692_off
    .local int rx692_eos
    .local int rx692_rep
    .local pmc rx692_cur
    (rx692_cur, rx692_pos, rx692_tgt) = self."!cursor_start"()
    rx692_cur."!cursor_debug"("START ", "dotty")
    rx692_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx692_cur
    .local pmc match
    .lex "$/", match
    length rx692_eos, rx692_tgt
    set rx692_off, 0
    lt rx692_pos, 2, rx692_start
    sub rx692_off, rx692_pos, 1
    substr rx692_tgt, rx692_tgt, rx692_off
  rx692_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan696_done
    goto rxscan696_scan
  rxscan696_loop:
    ($P10) = rx692_cur."from"()
    inc $P10
    set rx692_pos, $P10
    ge rx692_pos, rx692_eos, rxscan696_done
  rxscan696_scan:
    set_addr $I10, rxscan696_loop
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  rxscan696_done:
.annotate "line", 315
  # rx literal  "."
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, ".", rx692_fail
    add rx692_pos, 1
  alt697_0:
.annotate "line", 316
    set_addr $I10, alt697_1
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx subrule "identifier" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."identifier"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname=identifier")
    rx692_pos = $P10."pos"()
    goto alt697_end
  alt697_1:
.annotate "line", 317
  # rx enumcharlist negate=0 zerowidth
    ge rx692_pos, rx692_eos, rx692_fail
    sub $I10, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I10, 1
    index $I11, "'\"", $S10
    lt $I11, 0, rx692_fail
  # rx subrule "quote" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."quote"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx692_pos = $P10."pos"()
  alt698_0:
.annotate "line", 318
    set_addr $I10, alt698_1
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
  # rx enumcharlist negate=0 zerowidth
    ge rx692_pos, rx692_eos, rx692_fail
    sub $I10, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx692_fail
    goto alt698_end
  alt698_1:
  # rx subrule "panic" subtype=method negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."panic"("Quoted method name requires parenthesized arguments")
    unless $P10, rx692_fail
    rx692_pos = $P10."pos"()
  alt698_end:
  alt697_end:
.annotate "line", 324
  # rx rxquantr699 ** 0..1
    set_addr $I701, rxquantr699_done
    rx692_cur."!mark_push"(0, rx692_pos, $I701)
  rxquantr699_loop:
  alt700_0:
.annotate "line", 321
    set_addr $I10, alt700_1
    rx692_cur."!mark_push"(0, rx692_pos, $I10)
.annotate "line", 322
  # rx enumcharlist negate=0 zerowidth
    ge rx692_pos, rx692_eos, rx692_fail
    sub $I10, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx692_fail
  # rx subrule "args" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."args"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx692_pos = $P10."pos"()
    goto alt700_end
  alt700_1:
.annotate "line", 323
  # rx literal  ":"
    add $I11, rx692_pos, 1
    gt $I11, rx692_eos, rx692_fail
    sub $I11, rx692_pos, rx692_off
    substr $S10, rx692_tgt, $I11, 1
    ne $S10, ":", rx692_fail
    add rx692_pos, 1
  # rx charclass s
    ge rx692_pos, rx692_eos, rx692_fail
    sub $I10, rx692_pos, rx692_off
    is_cclass $I11, 32, rx692_tgt, $I10
    unless $I11, rx692_fail
    inc rx692_pos
  # rx subrule "arglist" subtype=capture negate=
    rx692_cur."!cursor_pos"(rx692_pos)
    $P10 = rx692_cur."arglist"()
    unless $P10, rx692_fail
    rx692_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx692_pos = $P10."pos"()
  alt700_end:
.annotate "line", 324
    (rx692_rep) = rx692_cur."!mark_commit"($I701)
  rxquantr699_done:
.annotate "line", 314
  # rx pass
    rx692_cur."!cursor_pass"(rx692_pos, "dotty")
    rx692_cur."!cursor_debug"("PASS  ", "dotty", " at pos=", rx692_pos)
    .return (rx692_cur)
  rx692_fail:
.annotate "line", 4
    (rx692_rep, rx692_pos, $I10, $P10) = rx692_cur."!mark_fail"(0)
    lt rx692_pos, -1, rx692_done
    eq rx692_pos, -1, rx692_fail
    jump $I10
  rx692_done:
    rx692_cur."!cursor_fail"()
    rx692_cur."!cursor_debug"("FAIL  ", "dotty")
    .return (rx692_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__dotty"  :subid("158_1259103982.97329") :method
.annotate "line", 4
    $P694 = self."!PREFIX__!subrule"("longname=identifier", ".")
    new $P695, "ResizablePMCArray"
    push $P695, "'"
    push $P695, "\""
    push $P695, $P694
    .return ($P695)
.end


.namespace ["NQP";"Grammar"]
.sub "term"  :subid("159_1259103982.97329") :method
.annotate "line", 328
    $P703 = self."!protoregex"("term")
    .return ($P703)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term"  :subid("160_1259103982.97329") :method
.annotate "line", 328
    $P705 = self."!PREFIX__!protoregex"("term")
    .return ($P705)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<self>"  :subid("161_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx707_tgt
    .local int rx707_pos
    .local int rx707_off
    .local int rx707_eos
    .local int rx707_rep
    .local pmc rx707_cur
    (rx707_cur, rx707_pos, rx707_tgt) = self."!cursor_start"()
    rx707_cur."!cursor_debug"("START ", "term:sym<self>")
    .lex unicode:"$\x{a2}", rx707_cur
    .local pmc match
    .lex "$/", match
    length rx707_eos, rx707_tgt
    set rx707_off, 0
    lt rx707_pos, 2, rx707_start
    sub rx707_off, rx707_pos, 1
    substr rx707_tgt, rx707_tgt, rx707_off
  rx707_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan710_done
    goto rxscan710_scan
  rxscan710_loop:
    ($P10) = rx707_cur."from"()
    inc $P10
    set rx707_pos, $P10
    ge rx707_pos, rx707_eos, rxscan710_done
  rxscan710_scan:
    set_addr $I10, rxscan710_loop
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  rxscan710_done:
.annotate "line", 330
  # rx subcapture "sym"
    set_addr $I10, rxcap_711_fail
    rx707_cur."!mark_push"(0, rx707_pos, $I10)
  # rx literal  "self"
    add $I11, rx707_pos, 4
    gt $I11, rx707_eos, rx707_fail
    sub $I11, rx707_pos, rx707_off
    substr $S10, rx707_tgt, $I11, 4
    ne $S10, "self", rx707_fail
    add rx707_pos, 4
    set_addr $I10, rxcap_711_fail
    ($I12, $I11) = rx707_cur."!mark_peek"($I10)
    rx707_cur."!cursor_pos"($I11)
    ($P10) = rx707_cur."!cursor_start"()
    $P10."!cursor_pass"(rx707_pos, "")
    rx707_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_711_done
  rxcap_711_fail:
    goto rx707_fail
  rxcap_711_done:
  # rxanchor rwb
    le rx707_pos, 0, rx707_fail
    sub $I10, rx707_pos, rx707_off
    is_cclass $I11, 8192, rx707_tgt, $I10
    if $I11, rx707_fail
    dec $I10
    is_cclass $I11, 8192, rx707_tgt, $I10
    unless $I11, rx707_fail
  # rx pass
    rx707_cur."!cursor_pass"(rx707_pos, "term:sym<self>")
    rx707_cur."!cursor_debug"("PASS  ", "term:sym<self>", " at pos=", rx707_pos)
    .return (rx707_cur)
  rx707_fail:
.annotate "line", 4
    (rx707_rep, rx707_pos, $I10, $P10) = rx707_cur."!mark_fail"(0)
    lt rx707_pos, -1, rx707_done
    eq rx707_pos, -1, rx707_fail
    jump $I10
  rx707_done:
    rx707_cur."!cursor_fail"()
    rx707_cur."!cursor_debug"("FAIL  ", "term:sym<self>")
    .return (rx707_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<self>"  :subid("162_1259103982.97329") :method
.annotate "line", 4
    new $P709, "ResizablePMCArray"
    push $P709, "self"
    .return ($P709)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<identifier>"  :subid("163_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx713_tgt
    .local int rx713_pos
    .local int rx713_off
    .local int rx713_eos
    .local int rx713_rep
    .local pmc rx713_cur
    (rx713_cur, rx713_pos, rx713_tgt) = self."!cursor_start"()
    rx713_cur."!cursor_debug"("START ", "term:sym<identifier>")
    .lex unicode:"$\x{a2}", rx713_cur
    .local pmc match
    .lex "$/", match
    length rx713_eos, rx713_tgt
    set rx713_off, 0
    lt rx713_pos, 2, rx713_start
    sub rx713_off, rx713_pos, 1
    substr rx713_tgt, rx713_tgt, rx713_off
  rx713_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan717_done
    goto rxscan717_scan
  rxscan717_loop:
    ($P10) = rx713_cur."from"()
    inc $P10
    set rx713_pos, $P10
    ge rx713_pos, rx713_eos, rxscan717_done
  rxscan717_scan:
    set_addr $I10, rxscan717_loop
    rx713_cur."!mark_push"(0, rx713_pos, $I10)
  rxscan717_done:
.annotate "line", 333
  # rx subrule "identifier" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."identifier"()
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("identifier")
    rx713_pos = $P10."pos"()
  # rx enumcharlist negate=0 zerowidth
    ge rx713_pos, rx713_eos, rx713_fail
    sub $I10, rx713_pos, rx713_off
    substr $S10, rx713_tgt, $I10, 1
    index $I11, "(", $S10
    lt $I11, 0, rx713_fail
  # rx subrule "args" subtype=capture negate=
    rx713_cur."!cursor_pos"(rx713_pos)
    $P10 = rx713_cur."args"()
    unless $P10, rx713_fail
    rx713_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx713_pos = $P10."pos"()
.annotate "line", 332
  # rx pass
    rx713_cur."!cursor_pass"(rx713_pos, "term:sym<identifier>")
    rx713_cur."!cursor_debug"("PASS  ", "term:sym<identifier>", " at pos=", rx713_pos)
    .return (rx713_cur)
  rx713_fail:
.annotate "line", 4
    (rx713_rep, rx713_pos, $I10, $P10) = rx713_cur."!mark_fail"(0)
    lt rx713_pos, -1, rx713_done
    eq rx713_pos, -1, rx713_fail
    jump $I10
  rx713_done:
    rx713_cur."!cursor_fail"()
    rx713_cur."!cursor_debug"("FAIL  ", "term:sym<identifier>")
    .return (rx713_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<identifier>"  :subid("164_1259103982.97329") :method
.annotate "line", 4
    $P715 = self."!PREFIX__!subrule"("identifier", "")
    new $P716, "ResizablePMCArray"
    push $P716, $P715
    .return ($P716)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<name>"  :subid("165_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx719_tgt
    .local int rx719_pos
    .local int rx719_off
    .local int rx719_eos
    .local int rx719_rep
    .local pmc rx719_cur
    (rx719_cur, rx719_pos, rx719_tgt) = self."!cursor_start"()
    rx719_cur."!cursor_debug"("START ", "term:sym<name>")
    rx719_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx719_cur
    .local pmc match
    .lex "$/", match
    length rx719_eos, rx719_tgt
    set rx719_off, 0
    lt rx719_pos, 2, rx719_start
    sub rx719_off, rx719_pos, 1
    substr rx719_tgt, rx719_tgt, rx719_off
  rx719_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan723_done
    goto rxscan723_scan
  rxscan723_loop:
    ($P10) = rx719_cur."from"()
    inc $P10
    set rx719_pos, $P10
    ge rx719_pos, rx719_eos, rxscan723_done
  rxscan723_scan:
    set_addr $I10, rxscan723_loop
    rx719_cur."!mark_push"(0, rx719_pos, $I10)
  rxscan723_done:
.annotate "line", 337
  # rx subrule "name" subtype=capture negate=
    rx719_cur."!cursor_pos"(rx719_pos)
    $P10 = rx719_cur."name"()
    unless $P10, rx719_fail
    rx719_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("name")
    rx719_pos = $P10."pos"()
  # rx rxquantr724 ** 0..1
    set_addr $I725, rxquantr724_done
    rx719_cur."!mark_push"(0, rx719_pos, $I725)
  rxquantr724_loop:
  # rx subrule "args" subtype=capture negate=
    rx719_cur."!cursor_pos"(rx719_pos)
    $P10 = rx719_cur."args"()
    unless $P10, rx719_fail
    rx719_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx719_pos = $P10."pos"()
    (rx719_rep) = rx719_cur."!mark_commit"($I725)
  rxquantr724_done:
.annotate "line", 336
  # rx pass
    rx719_cur."!cursor_pass"(rx719_pos, "term:sym<name>")
    rx719_cur."!cursor_debug"("PASS  ", "term:sym<name>", " at pos=", rx719_pos)
    .return (rx719_cur)
  rx719_fail:
.annotate "line", 4
    (rx719_rep, rx719_pos, $I10, $P10) = rx719_cur."!mark_fail"(0)
    lt rx719_pos, -1, rx719_done
    eq rx719_pos, -1, rx719_fail
    jump $I10
  rx719_done:
    rx719_cur."!cursor_fail"()
    rx719_cur."!cursor_debug"("FAIL  ", "term:sym<name>")
    .return (rx719_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<name>"  :subid("166_1259103982.97329") :method
.annotate "line", 4
    $P721 = self."!PREFIX__!subrule"("name", "")
    new $P722, "ResizablePMCArray"
    push $P722, $P721
    .return ($P722)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<pir::op>"  :subid("167_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx727_tgt
    .local int rx727_pos
    .local int rx727_off
    .local int rx727_eos
    .local int rx727_rep
    .local pmc rx727_cur
    (rx727_cur, rx727_pos, rx727_tgt) = self."!cursor_start"()
    rx727_cur."!cursor_debug"("START ", "term:sym<pir::op>")
    rx727_cur."!cursor_caparray"("args")
    .lex unicode:"$\x{a2}", rx727_cur
    .local pmc match
    .lex "$/", match
    length rx727_eos, rx727_tgt
    set rx727_off, 0
    lt rx727_pos, 2, rx727_start
    sub rx727_off, rx727_pos, 1
    substr rx727_tgt, rx727_tgt, rx727_off
  rx727_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan730_done
    goto rxscan730_scan
  rxscan730_loop:
    ($P10) = rx727_cur."from"()
    inc $P10
    set rx727_pos, $P10
    ge rx727_pos, rx727_eos, rxscan730_done
  rxscan730_scan:
    set_addr $I10, rxscan730_loop
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  rxscan730_done:
.annotate "line", 341
  # rx literal  "pir::"
    add $I11, rx727_pos, 5
    gt $I11, rx727_eos, rx727_fail
    sub $I11, rx727_pos, rx727_off
    substr $S10, rx727_tgt, $I11, 5
    ne $S10, "pir::", rx727_fail
    add rx727_pos, 5
  # rx subcapture "op"
    set_addr $I10, rxcap_731_fail
    rx727_cur."!mark_push"(0, rx727_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx727_pos, rx727_off
    find_not_cclass $I11, 8192, rx727_tgt, $I10, rx727_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx727_fail
    add rx727_pos, rx727_off, $I11
    set_addr $I10, rxcap_731_fail
    ($I12, $I11) = rx727_cur."!mark_peek"($I10)
    rx727_cur."!cursor_pos"($I11)
    ($P10) = rx727_cur."!cursor_start"()
    $P10."!cursor_pass"(rx727_pos, "")
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("op")
    goto rxcap_731_done
  rxcap_731_fail:
    goto rx727_fail
  rxcap_731_done:
  # rx rxquantr732 ** 0..1
    set_addr $I733, rxquantr732_done
    rx727_cur."!mark_push"(0, rx727_pos, $I733)
  rxquantr732_loop:
  # rx subrule "args" subtype=capture negate=
    rx727_cur."!cursor_pos"(rx727_pos)
    $P10 = rx727_cur."args"()
    unless $P10, rx727_fail
    rx727_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("args")
    rx727_pos = $P10."pos"()
    (rx727_rep) = rx727_cur."!mark_commit"($I733)
  rxquantr732_done:
.annotate "line", 340
  # rx pass
    rx727_cur."!cursor_pass"(rx727_pos, "term:sym<pir::op>")
    rx727_cur."!cursor_debug"("PASS  ", "term:sym<pir::op>", " at pos=", rx727_pos)
    .return (rx727_cur)
  rx727_fail:
.annotate "line", 4
    (rx727_rep, rx727_pos, $I10, $P10) = rx727_cur."!mark_fail"(0)
    lt rx727_pos, -1, rx727_done
    eq rx727_pos, -1, rx727_fail
    jump $I10
  rx727_done:
    rx727_cur."!cursor_fail"()
    rx727_cur."!cursor_debug"("FAIL  ", "term:sym<pir::op>")
    .return (rx727_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<pir::op>"  :subid("168_1259103982.97329") :method
.annotate "line", 4
    new $P729, "ResizablePMCArray"
    push $P729, "pir::"
    .return ($P729)
.end


.namespace ["NQP";"Grammar"]
.sub "args"  :subid("169_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx735_tgt
    .local int rx735_pos
    .local int rx735_off
    .local int rx735_eos
    .local int rx735_rep
    .local pmc rx735_cur
    (rx735_cur, rx735_pos, rx735_tgt) = self."!cursor_start"()
    rx735_cur."!cursor_debug"("START ", "args")
    .lex unicode:"$\x{a2}", rx735_cur
    .local pmc match
    .lex "$/", match
    length rx735_eos, rx735_tgt
    set rx735_off, 0
    lt rx735_pos, 2, rx735_start
    sub rx735_off, rx735_pos, 1
    substr rx735_tgt, rx735_tgt, rx735_off
  rx735_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan739_done
    goto rxscan739_scan
  rxscan739_loop:
    ($P10) = rx735_cur."from"()
    inc $P10
    set rx735_pos, $P10
    ge rx735_pos, rx735_eos, rxscan739_done
  rxscan739_scan:
    set_addr $I10, rxscan739_loop
    rx735_cur."!mark_push"(0, rx735_pos, $I10)
  rxscan739_done:
.annotate "line", 345
  # rx literal  "("
    add $I11, rx735_pos, 1
    gt $I11, rx735_eos, rx735_fail
    sub $I11, rx735_pos, rx735_off
    substr $S10, rx735_tgt, $I11, 1
    ne $S10, "(", rx735_fail
    add rx735_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx735_cur."!cursor_pos"(rx735_pos)
    $P10 = rx735_cur."arglist"()
    unless $P10, rx735_fail
    rx735_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx735_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx735_pos, 1
    gt $I11, rx735_eos, rx735_fail
    sub $I11, rx735_pos, rx735_off
    substr $S10, rx735_tgt, $I11, 1
    ne $S10, ")", rx735_fail
    add rx735_pos, 1
  # rx pass
    rx735_cur."!cursor_pass"(rx735_pos, "args")
    rx735_cur."!cursor_debug"("PASS  ", "args", " at pos=", rx735_pos)
    .return (rx735_cur)
  rx735_fail:
.annotate "line", 4
    (rx735_rep, rx735_pos, $I10, $P10) = rx735_cur."!mark_fail"(0)
    lt rx735_pos, -1, rx735_done
    eq rx735_pos, -1, rx735_fail
    jump $I10
  rx735_done:
    rx735_cur."!cursor_fail"()
    rx735_cur."!cursor_debug"("FAIL  ", "args")
    .return (rx735_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__args"  :subid("170_1259103982.97329") :method
.annotate "line", 4
    $P737 = self."!PREFIX__!subrule"("arglist", "(")
    new $P738, "ResizablePMCArray"
    push $P738, $P737
    .return ($P738)
.end


.namespace ["NQP";"Grammar"]
.sub "arglist"  :subid("171_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx741_tgt
    .local int rx741_pos
    .local int rx741_off
    .local int rx741_eos
    .local int rx741_rep
    .local pmc rx741_cur
    (rx741_cur, rx741_pos, rx741_tgt) = self."!cursor_start"()
    rx741_cur."!cursor_debug"("START ", "arglist")
    .lex unicode:"$\x{a2}", rx741_cur
    .local pmc match
    .lex "$/", match
    length rx741_eos, rx741_tgt
    set rx741_off, 0
    lt rx741_pos, 2, rx741_start
    sub rx741_off, rx741_pos, 1
    substr rx741_tgt, rx741_tgt, rx741_off
  rx741_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan745_done
    goto rxscan745_scan
  rxscan745_loop:
    ($P10) = rx741_cur."from"()
    inc $P10
    set rx741_pos, $P10
    ge rx741_pos, rx741_eos, rxscan745_done
  rxscan745_scan:
    set_addr $I10, rxscan745_loop
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
  rxscan745_done:
.annotate "line", 349
  # rx subrule "ws" subtype=method negate=
    rx741_cur."!cursor_pos"(rx741_pos)
    $P10 = rx741_cur."ws"()
    unless $P10, rx741_fail
    rx741_pos = $P10."pos"()
  alt746_0:
.annotate "line", 350
    set_addr $I10, alt746_1
    rx741_cur."!mark_push"(0, rx741_pos, $I10)
.annotate "line", 351
  # rx subrule "EXPR" subtype=capture negate=
    rx741_cur."!cursor_pos"(rx741_pos)
    $P10 = rx741_cur."EXPR"("f=")
    unless $P10, rx741_fail
    rx741_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx741_pos = $P10."pos"()
    goto alt746_end
  alt746_1:
  alt746_end:
.annotate "line", 348
  # rx pass
    rx741_cur."!cursor_pass"(rx741_pos, "arglist")
    rx741_cur."!cursor_debug"("PASS  ", "arglist", " at pos=", rx741_pos)
    .return (rx741_cur)
  rx741_fail:
.annotate "line", 4
    (rx741_rep, rx741_pos, $I10, $P10) = rx741_cur."!mark_fail"(0)
    lt rx741_pos, -1, rx741_done
    eq rx741_pos, -1, rx741_fail
    jump $I10
  rx741_done:
    rx741_cur."!cursor_fail"()
    rx741_cur."!cursor_debug"("FAIL  ", "arglist")
    .return (rx741_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__arglist"  :subid("172_1259103982.97329") :method
.annotate "line", 4
    $P743 = self."!PREFIX__!subrule"("", "")
    new $P744, "ResizablePMCArray"
    push $P744, $P743
    .return ($P744)
.end


.namespace ["NQP";"Grammar"]
.sub "term:sym<value>"  :subid("173_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx748_tgt
    .local int rx748_pos
    .local int rx748_off
    .local int rx748_eos
    .local int rx748_rep
    .local pmc rx748_cur
    (rx748_cur, rx748_pos, rx748_tgt) = self."!cursor_start"()
    rx748_cur."!cursor_debug"("START ", "term:sym<value>")
    .lex unicode:"$\x{a2}", rx748_cur
    .local pmc match
    .lex "$/", match
    length rx748_eos, rx748_tgt
    set rx748_off, 0
    lt rx748_pos, 2, rx748_start
    sub rx748_off, rx748_pos, 1
    substr rx748_tgt, rx748_tgt, rx748_off
  rx748_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan752_done
    goto rxscan752_scan
  rxscan752_loop:
    ($P10) = rx748_cur."from"()
    inc $P10
    set rx748_pos, $P10
    ge rx748_pos, rx748_eos, rxscan752_done
  rxscan752_scan:
    set_addr $I10, rxscan752_loop
    rx748_cur."!mark_push"(0, rx748_pos, $I10)
  rxscan752_done:
.annotate "line", 357
  # rx subrule "value" subtype=capture negate=
    rx748_cur."!cursor_pos"(rx748_pos)
    $P10 = rx748_cur."value"()
    unless $P10, rx748_fail
    rx748_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("value")
    rx748_pos = $P10."pos"()
  # rx pass
    rx748_cur."!cursor_pass"(rx748_pos, "term:sym<value>")
    rx748_cur."!cursor_debug"("PASS  ", "term:sym<value>", " at pos=", rx748_pos)
    .return (rx748_cur)
  rx748_fail:
.annotate "line", 4
    (rx748_rep, rx748_pos, $I10, $P10) = rx748_cur."!mark_fail"(0)
    lt rx748_pos, -1, rx748_done
    eq rx748_pos, -1, rx748_fail
    jump $I10
  rx748_done:
    rx748_cur."!cursor_fail"()
    rx748_cur."!cursor_debug"("FAIL  ", "term:sym<value>")
    .return (rx748_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__term:sym<value>"  :subid("174_1259103982.97329") :method
.annotate "line", 4
    $P750 = self."!PREFIX__!subrule"("value", "")
    new $P751, "ResizablePMCArray"
    push $P751, $P750
    .return ($P751)
.end


.namespace ["NQP";"Grammar"]
.sub "value"  :subid("175_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx754_tgt
    .local int rx754_pos
    .local int rx754_off
    .local int rx754_eos
    .local int rx754_rep
    .local pmc rx754_cur
    (rx754_cur, rx754_pos, rx754_tgt) = self."!cursor_start"()
    rx754_cur."!cursor_debug"("START ", "value")
    .lex unicode:"$\x{a2}", rx754_cur
    .local pmc match
    .lex "$/", match
    length rx754_eos, rx754_tgt
    set rx754_off, 0
    lt rx754_pos, 2, rx754_start
    sub rx754_off, rx754_pos, 1
    substr rx754_tgt, rx754_tgt, rx754_off
  rx754_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan759_done
    goto rxscan759_scan
  rxscan759_loop:
    ($P10) = rx754_cur."from"()
    inc $P10
    set rx754_pos, $P10
    ge rx754_pos, rx754_eos, rxscan759_done
  rxscan759_scan:
    set_addr $I10, rxscan759_loop
    rx754_cur."!mark_push"(0, rx754_pos, $I10)
  rxscan759_done:
  alt760_0:
.annotate "line", 359
    set_addr $I10, alt760_1
    rx754_cur."!mark_push"(0, rx754_pos, $I10)
.annotate "line", 360
  # rx subrule "quote" subtype=capture negate=
    rx754_cur."!cursor_pos"(rx754_pos)
    $P10 = rx754_cur."quote"()
    unless $P10, rx754_fail
    rx754_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote")
    rx754_pos = $P10."pos"()
    goto alt760_end
  alt760_1:
.annotate "line", 361
  # rx subrule "number" subtype=capture negate=
    rx754_cur."!cursor_pos"(rx754_pos)
    $P10 = rx754_cur."number"()
    unless $P10, rx754_fail
    rx754_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("number")
    rx754_pos = $P10."pos"()
  alt760_end:
.annotate "line", 359
  # rx pass
    rx754_cur."!cursor_pass"(rx754_pos, "value")
    rx754_cur."!cursor_debug"("PASS  ", "value", " at pos=", rx754_pos)
    .return (rx754_cur)
  rx754_fail:
.annotate "line", 4
    (rx754_rep, rx754_pos, $I10, $P10) = rx754_cur."!mark_fail"(0)
    lt rx754_pos, -1, rx754_done
    eq rx754_pos, -1, rx754_fail
    jump $I10
  rx754_done:
    rx754_cur."!cursor_fail"()
    rx754_cur."!cursor_debug"("FAIL  ", "value")
    .return (rx754_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__value"  :subid("176_1259103982.97329") :method
.annotate "line", 4
    $P756 = self."!PREFIX__!subrule"("number", "")
    $P757 = self."!PREFIX__!subrule"("quote", "")
    new $P758, "ResizablePMCArray"
    push $P758, $P756
    push $P758, $P757
    .return ($P758)
.end


.namespace ["NQP";"Grammar"]
.sub "number"  :subid("177_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx762_tgt
    .local int rx762_pos
    .local int rx762_off
    .local int rx762_eos
    .local int rx762_rep
    .local pmc rx762_cur
    (rx762_cur, rx762_pos, rx762_tgt) = self."!cursor_start"()
    rx762_cur."!cursor_debug"("START ", "number")
    .lex unicode:"$\x{a2}", rx762_cur
    .local pmc match
    .lex "$/", match
    length rx762_eos, rx762_tgt
    set rx762_off, 0
    lt rx762_pos, 2, rx762_start
    sub rx762_off, rx762_pos, 1
    substr rx762_tgt, rx762_tgt, rx762_off
  rx762_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan765_done
    goto rxscan765_scan
  rxscan765_loop:
    ($P10) = rx762_cur."from"()
    inc $P10
    set rx762_pos, $P10
    ge rx762_pos, rx762_eos, rxscan765_done
  rxscan765_scan:
    set_addr $I10, rxscan765_loop
    rx762_cur."!mark_push"(0, rx762_pos, $I10)
  rxscan765_done:
.annotate "line", 365
  # rx subcapture "sign"
    set_addr $I10, rxcap_768_fail
    rx762_cur."!mark_push"(0, rx762_pos, $I10)
  # rx rxquantr766 ** 0..1
    set_addr $I767, rxquantr766_done
    rx762_cur."!mark_push"(0, rx762_pos, $I767)
  rxquantr766_loop:
  # rx enumcharlist negate=0 
    ge rx762_pos, rx762_eos, rx762_fail
    sub $I10, rx762_pos, rx762_off
    substr $S10, rx762_tgt, $I10, 1
    index $I11, "+-", $S10
    lt $I11, 0, rx762_fail
    inc rx762_pos
    (rx762_rep) = rx762_cur."!mark_commit"($I767)
  rxquantr766_done:
    set_addr $I10, rxcap_768_fail
    ($I12, $I11) = rx762_cur."!mark_peek"($I10)
    rx762_cur."!cursor_pos"($I11)
    ($P10) = rx762_cur."!cursor_start"()
    $P10."!cursor_pass"(rx762_pos, "")
    rx762_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sign")
    goto rxcap_768_done
  rxcap_768_fail:
    goto rx762_fail
  rxcap_768_done:
  alt769_0:
.annotate "line", 366
    set_addr $I10, alt769_1
    rx762_cur."!mark_push"(0, rx762_pos, $I10)
  # rx subrule "dec_number" subtype=capture negate=
    rx762_cur."!cursor_pos"(rx762_pos)
    $P10 = rx762_cur."dec_number"()
    unless $P10, rx762_fail
    rx762_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dec_number")
    rx762_pos = $P10."pos"()
    goto alt769_end
  alt769_1:
  # rx subrule "integer" subtype=capture negate=
    rx762_cur."!cursor_pos"(rx762_pos)
    $P10 = rx762_cur."integer"()
    unless $P10, rx762_fail
    rx762_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("integer")
    rx762_pos = $P10."pos"()
  alt769_end:
.annotate "line", 364
  # rx pass
    rx762_cur."!cursor_pass"(rx762_pos, "number")
    rx762_cur."!cursor_debug"("PASS  ", "number", " at pos=", rx762_pos)
    .return (rx762_cur)
  rx762_fail:
.annotate "line", 4
    (rx762_rep, rx762_pos, $I10, $P10) = rx762_cur."!mark_fail"(0)
    lt rx762_pos, -1, rx762_done
    eq rx762_pos, -1, rx762_fail
    jump $I10
  rx762_done:
    rx762_cur."!cursor_fail"()
    rx762_cur."!cursor_debug"("FAIL  ", "number")
    .return (rx762_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__number"  :subid("178_1259103982.97329") :method
.annotate "line", 4
    new $P764, "ResizablePMCArray"
    push $P764, ""
    .return ($P764)
.end


.namespace ["NQP";"Grammar"]
.sub "quote"  :subid("179_1259103982.97329") :method
.annotate "line", 369
    $P771 = self."!protoregex"("quote")
    .return ($P771)
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote"  :subid("180_1259103982.97329") :method
.annotate "line", 369
    $P773 = self."!PREFIX__!protoregex"("quote")
    .return ($P773)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<apos>"  :subid("181_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx775_tgt
    .local int rx775_pos
    .local int rx775_off
    .local int rx775_eos
    .local int rx775_rep
    .local pmc rx775_cur
    (rx775_cur, rx775_pos, rx775_tgt) = self."!cursor_start"()
    rx775_cur."!cursor_debug"("START ", "quote:sym<apos>")
    .lex unicode:"$\x{a2}", rx775_cur
    .local pmc match
    .lex "$/", match
    length rx775_eos, rx775_tgt
    set rx775_off, 0
    lt rx775_pos, 2, rx775_start
    sub rx775_off, rx775_pos, 1
    substr rx775_tgt, rx775_tgt, rx775_off
  rx775_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan778_done
    goto rxscan778_scan
  rxscan778_loop:
    ($P10) = rx775_cur."from"()
    inc $P10
    set rx775_pos, $P10
    ge rx775_pos, rx775_eos, rxscan778_done
  rxscan778_scan:
    set_addr $I10, rxscan778_loop
    rx775_cur."!mark_push"(0, rx775_pos, $I10)
  rxscan778_done:
.annotate "line", 370
  # rx enumcharlist negate=0 zerowidth
    ge rx775_pos, rx775_eos, rx775_fail
    sub $I10, rx775_pos, rx775_off
    substr $S10, rx775_tgt, $I10, 1
    index $I11, "'", $S10
    lt $I11, 0, rx775_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx775_cur."!cursor_pos"(rx775_pos)
    $P10 = rx775_cur."quote_EXPR"(":q")
    unless $P10, rx775_fail
    rx775_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx775_pos = $P10."pos"()
  # rx pass
    rx775_cur."!cursor_pass"(rx775_pos, "quote:sym<apos>")
    rx775_cur."!cursor_debug"("PASS  ", "quote:sym<apos>", " at pos=", rx775_pos)
    .return (rx775_cur)
  rx775_fail:
.annotate "line", 4
    (rx775_rep, rx775_pos, $I10, $P10) = rx775_cur."!mark_fail"(0)
    lt rx775_pos, -1, rx775_done
    eq rx775_pos, -1, rx775_fail
    jump $I10
  rx775_done:
    rx775_cur."!cursor_fail"()
    rx775_cur."!cursor_debug"("FAIL  ", "quote:sym<apos>")
    .return (rx775_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<apos>"  :subid("182_1259103982.97329") :method
.annotate "line", 4
    new $P777, "ResizablePMCArray"
    push $P777, "'"
    .return ($P777)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<dblq>"  :subid("183_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx780_tgt
    .local int rx780_pos
    .local int rx780_off
    .local int rx780_eos
    .local int rx780_rep
    .local pmc rx780_cur
    (rx780_cur, rx780_pos, rx780_tgt) = self."!cursor_start"()
    rx780_cur."!cursor_debug"("START ", "quote:sym<dblq>")
    .lex unicode:"$\x{a2}", rx780_cur
    .local pmc match
    .lex "$/", match
    length rx780_eos, rx780_tgt
    set rx780_off, 0
    lt rx780_pos, 2, rx780_start
    sub rx780_off, rx780_pos, 1
    substr rx780_tgt, rx780_tgt, rx780_off
  rx780_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan783_done
    goto rxscan783_scan
  rxscan783_loop:
    ($P10) = rx780_cur."from"()
    inc $P10
    set rx780_pos, $P10
    ge rx780_pos, rx780_eos, rxscan783_done
  rxscan783_scan:
    set_addr $I10, rxscan783_loop
    rx780_cur."!mark_push"(0, rx780_pos, $I10)
  rxscan783_done:
.annotate "line", 371
  # rx enumcharlist negate=0 zerowidth
    ge rx780_pos, rx780_eos, rx780_fail
    sub $I10, rx780_pos, rx780_off
    substr $S10, rx780_tgt, $I10, 1
    index $I11, "\"", $S10
    lt $I11, 0, rx780_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx780_cur."!cursor_pos"(rx780_pos)
    $P10 = rx780_cur."quote_EXPR"(":qq")
    unless $P10, rx780_fail
    rx780_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx780_pos = $P10."pos"()
  # rx pass
    rx780_cur."!cursor_pass"(rx780_pos, "quote:sym<dblq>")
    rx780_cur."!cursor_debug"("PASS  ", "quote:sym<dblq>", " at pos=", rx780_pos)
    .return (rx780_cur)
  rx780_fail:
.annotate "line", 4
    (rx780_rep, rx780_pos, $I10, $P10) = rx780_cur."!mark_fail"(0)
    lt rx780_pos, -1, rx780_done
    eq rx780_pos, -1, rx780_fail
    jump $I10
  rx780_done:
    rx780_cur."!cursor_fail"()
    rx780_cur."!cursor_debug"("FAIL  ", "quote:sym<dblq>")
    .return (rx780_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<dblq>"  :subid("184_1259103982.97329") :method
.annotate "line", 4
    new $P782, "ResizablePMCArray"
    push $P782, "\""
    .return ($P782)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<q>"  :subid("185_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx785_tgt
    .local int rx785_pos
    .local int rx785_off
    .local int rx785_eos
    .local int rx785_rep
    .local pmc rx785_cur
    (rx785_cur, rx785_pos, rx785_tgt) = self."!cursor_start"()
    rx785_cur."!cursor_debug"("START ", "quote:sym<q>")
    .lex unicode:"$\x{a2}", rx785_cur
    .local pmc match
    .lex "$/", match
    length rx785_eos, rx785_tgt
    set rx785_off, 0
    lt rx785_pos, 2, rx785_start
    sub rx785_off, rx785_pos, 1
    substr rx785_tgt, rx785_tgt, rx785_off
  rx785_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan789_done
    goto rxscan789_scan
  rxscan789_loop:
    ($P10) = rx785_cur."from"()
    inc $P10
    set rx785_pos, $P10
    ge rx785_pos, rx785_eos, rxscan789_done
  rxscan789_scan:
    set_addr $I10, rxscan789_loop
    rx785_cur."!mark_push"(0, rx785_pos, $I10)
  rxscan789_done:
.annotate "line", 372
  # rx literal  "q"
    add $I11, rx785_pos, 1
    gt $I11, rx785_eos, rx785_fail
    sub $I11, rx785_pos, rx785_off
    substr $S10, rx785_tgt, $I11, 1
    ne $S10, "q", rx785_fail
    add rx785_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx785_pos, rx785_eos, rx785_fail
    sub $I10, rx785_pos, rx785_off
    substr $S10, rx785_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx785_fail
  # rx subrule "ws" subtype=method negate=
    rx785_cur."!cursor_pos"(rx785_pos)
    $P10 = rx785_cur."ws"()
    unless $P10, rx785_fail
    rx785_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx785_cur."!cursor_pos"(rx785_pos)
    $P10 = rx785_cur."quote_EXPR"(":q")
    unless $P10, rx785_fail
    rx785_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx785_pos = $P10."pos"()
  # rx pass
    rx785_cur."!cursor_pass"(rx785_pos, "quote:sym<q>")
    rx785_cur."!cursor_debug"("PASS  ", "quote:sym<q>", " at pos=", rx785_pos)
    .return (rx785_cur)
  rx785_fail:
.annotate "line", 4
    (rx785_rep, rx785_pos, $I10, $P10) = rx785_cur."!mark_fail"(0)
    lt rx785_pos, -1, rx785_done
    eq rx785_pos, -1, rx785_fail
    jump $I10
  rx785_done:
    rx785_cur."!cursor_fail"()
    rx785_cur."!cursor_debug"("FAIL  ", "quote:sym<q>")
    .return (rx785_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<q>"  :subid("186_1259103982.97329") :method
.annotate "line", 4
    $P787 = self."!PREFIX__!subrule"("", "q")
    new $P788, "ResizablePMCArray"
    push $P788, $P787
    .return ($P788)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<qq>"  :subid("187_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx791_tgt
    .local int rx791_pos
    .local int rx791_off
    .local int rx791_eos
    .local int rx791_rep
    .local pmc rx791_cur
    (rx791_cur, rx791_pos, rx791_tgt) = self."!cursor_start"()
    rx791_cur."!cursor_debug"("START ", "quote:sym<qq>")
    .lex unicode:"$\x{a2}", rx791_cur
    .local pmc match
    .lex "$/", match
    length rx791_eos, rx791_tgt
    set rx791_off, 0
    lt rx791_pos, 2, rx791_start
    sub rx791_off, rx791_pos, 1
    substr rx791_tgt, rx791_tgt, rx791_off
  rx791_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan795_done
    goto rxscan795_scan
  rxscan795_loop:
    ($P10) = rx791_cur."from"()
    inc $P10
    set rx791_pos, $P10
    ge rx791_pos, rx791_eos, rxscan795_done
  rxscan795_scan:
    set_addr $I10, rxscan795_loop
    rx791_cur."!mark_push"(0, rx791_pos, $I10)
  rxscan795_done:
.annotate "line", 373
  # rx literal  "qq"
    add $I11, rx791_pos, 2
    gt $I11, rx791_eos, rx791_fail
    sub $I11, rx791_pos, rx791_off
    substr $S10, rx791_tgt, $I11, 2
    ne $S10, "qq", rx791_fail
    add rx791_pos, 2
  # rx enumcharlist negate=1 zerowidth
    ge rx791_pos, rx791_eos, rx791_fail
    sub $I10, rx791_pos, rx791_off
    substr $S10, rx791_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx791_fail
  # rx subrule "ws" subtype=method negate=
    rx791_cur."!cursor_pos"(rx791_pos)
    $P10 = rx791_cur."ws"()
    unless $P10, rx791_fail
    rx791_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx791_cur."!cursor_pos"(rx791_pos)
    $P10 = rx791_cur."quote_EXPR"(":qq")
    unless $P10, rx791_fail
    rx791_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx791_pos = $P10."pos"()
  # rx pass
    rx791_cur."!cursor_pass"(rx791_pos, "quote:sym<qq>")
    rx791_cur."!cursor_debug"("PASS  ", "quote:sym<qq>", " at pos=", rx791_pos)
    .return (rx791_cur)
  rx791_fail:
.annotate "line", 4
    (rx791_rep, rx791_pos, $I10, $P10) = rx791_cur."!mark_fail"(0)
    lt rx791_pos, -1, rx791_done
    eq rx791_pos, -1, rx791_fail
    jump $I10
  rx791_done:
    rx791_cur."!cursor_fail"()
    rx791_cur."!cursor_debug"("FAIL  ", "quote:sym<qq>")
    .return (rx791_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<qq>"  :subid("188_1259103982.97329") :method
.annotate "line", 4
    $P793 = self."!PREFIX__!subrule"("", "qq")
    new $P794, "ResizablePMCArray"
    push $P794, $P793
    .return ($P794)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q>"  :subid("189_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx797_tgt
    .local int rx797_pos
    .local int rx797_off
    .local int rx797_eos
    .local int rx797_rep
    .local pmc rx797_cur
    (rx797_cur, rx797_pos, rx797_tgt) = self."!cursor_start"()
    rx797_cur."!cursor_debug"("START ", "quote:sym<Q>")
    .lex unicode:"$\x{a2}", rx797_cur
    .local pmc match
    .lex "$/", match
    length rx797_eos, rx797_tgt
    set rx797_off, 0
    lt rx797_pos, 2, rx797_start
    sub rx797_off, rx797_pos, 1
    substr rx797_tgt, rx797_tgt, rx797_off
  rx797_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan801_done
    goto rxscan801_scan
  rxscan801_loop:
    ($P10) = rx797_cur."from"()
    inc $P10
    set rx797_pos, $P10
    ge rx797_pos, rx797_eos, rxscan801_done
  rxscan801_scan:
    set_addr $I10, rxscan801_loop
    rx797_cur."!mark_push"(0, rx797_pos, $I10)
  rxscan801_done:
.annotate "line", 374
  # rx literal  "Q"
    add $I11, rx797_pos, 1
    gt $I11, rx797_eos, rx797_fail
    sub $I11, rx797_pos, rx797_off
    substr $S10, rx797_tgt, $I11, 1
    ne $S10, "Q", rx797_fail
    add rx797_pos, 1
  # rx enumcharlist negate=1 zerowidth
    ge rx797_pos, rx797_eos, rx797_fail
    sub $I10, rx797_pos, rx797_off
    substr $S10, rx797_tgt, $I10, 1
    index $I11, "(", $S10
    ge $I11, 0, rx797_fail
  # rx subrule "ws" subtype=method negate=
    rx797_cur."!cursor_pos"(rx797_pos)
    $P10 = rx797_cur."ws"()
    unless $P10, rx797_fail
    rx797_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx797_cur."!cursor_pos"(rx797_pos)
    $P10 = rx797_cur."quote_EXPR"()
    unless $P10, rx797_fail
    rx797_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx797_pos = $P10."pos"()
  # rx pass
    rx797_cur."!cursor_pass"(rx797_pos, "quote:sym<Q>")
    rx797_cur."!cursor_debug"("PASS  ", "quote:sym<Q>", " at pos=", rx797_pos)
    .return (rx797_cur)
  rx797_fail:
.annotate "line", 4
    (rx797_rep, rx797_pos, $I10, $P10) = rx797_cur."!mark_fail"(0)
    lt rx797_pos, -1, rx797_done
    eq rx797_pos, -1, rx797_fail
    jump $I10
  rx797_done:
    rx797_cur."!cursor_fail"()
    rx797_cur."!cursor_debug"("FAIL  ", "quote:sym<Q>")
    .return (rx797_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q>"  :subid("190_1259103982.97329") :method
.annotate "line", 4
    $P799 = self."!PREFIX__!subrule"("", "Q")
    new $P800, "ResizablePMCArray"
    push $P800, $P799
    .return ($P800)
.end


.namespace ["NQP";"Grammar"]
.sub "quote:sym<Q:PIR>"  :subid("191_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx803_tgt
    .local int rx803_pos
    .local int rx803_off
    .local int rx803_eos
    .local int rx803_rep
    .local pmc rx803_cur
    (rx803_cur, rx803_pos, rx803_tgt) = self."!cursor_start"()
    rx803_cur."!cursor_debug"("START ", "quote:sym<Q:PIR>")
    .lex unicode:"$\x{a2}", rx803_cur
    .local pmc match
    .lex "$/", match
    length rx803_eos, rx803_tgt
    set rx803_off, 0
    lt rx803_pos, 2, rx803_start
    sub rx803_off, rx803_pos, 1
    substr rx803_tgt, rx803_tgt, rx803_off
  rx803_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan807_done
    goto rxscan807_scan
  rxscan807_loop:
    ($P10) = rx803_cur."from"()
    inc $P10
    set rx803_pos, $P10
    ge rx803_pos, rx803_eos, rxscan807_done
  rxscan807_scan:
    set_addr $I10, rxscan807_loop
    rx803_cur."!mark_push"(0, rx803_pos, $I10)
  rxscan807_done:
.annotate "line", 375
  # rx literal  "Q:PIR"
    add $I11, rx803_pos, 5
    gt $I11, rx803_eos, rx803_fail
    sub $I11, rx803_pos, rx803_off
    substr $S10, rx803_tgt, $I11, 5
    ne $S10, "Q:PIR", rx803_fail
    add rx803_pos, 5
  # rx subrule "ws" subtype=method negate=
    rx803_cur."!cursor_pos"(rx803_pos)
    $P10 = rx803_cur."ws"()
    unless $P10, rx803_fail
    rx803_pos = $P10."pos"()
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx803_cur."!cursor_pos"(rx803_pos)
    $P10 = rx803_cur."quote_EXPR"()
    unless $P10, rx803_fail
    rx803_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx803_pos = $P10."pos"()
  # rx pass
    rx803_cur."!cursor_pass"(rx803_pos, "quote:sym<Q:PIR>")
    rx803_cur."!cursor_debug"("PASS  ", "quote:sym<Q:PIR>", " at pos=", rx803_pos)
    .return (rx803_cur)
  rx803_fail:
.annotate "line", 4
    (rx803_rep, rx803_pos, $I10, $P10) = rx803_cur."!mark_fail"(0)
    lt rx803_pos, -1, rx803_done
    eq rx803_pos, -1, rx803_fail
    jump $I10
  rx803_done:
    rx803_cur."!cursor_fail"()
    rx803_cur."!cursor_debug"("FAIL  ", "quote:sym<Q:PIR>")
    .return (rx803_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote:sym<Q:PIR>"  :subid("192_1259103982.97329") :method
.annotate "line", 4
    $P805 = self."!PREFIX__!subrule"("", "Q:PIR")
    new $P806, "ResizablePMCArray"
    push $P806, $P805
    .return ($P806)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<$>"  :subid("193_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx809_tgt
    .local int rx809_pos
    .local int rx809_off
    .local int rx809_eos
    .local int rx809_rep
    .local pmc rx809_cur
    (rx809_cur, rx809_pos, rx809_tgt) = self."!cursor_start"()
    rx809_cur."!cursor_debug"("START ", "quote_escape:sym<$>")
    .lex unicode:"$\x{a2}", rx809_cur
    .local pmc match
    .lex "$/", match
    length rx809_eos, rx809_tgt
    set rx809_off, 0
    lt rx809_pos, 2, rx809_start
    sub rx809_off, rx809_pos, 1
    substr rx809_tgt, rx809_tgt, rx809_off
  rx809_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan812_done
    goto rxscan812_scan
  rxscan812_loop:
    ($P10) = rx809_cur."from"()
    inc $P10
    set rx809_pos, $P10
    ge rx809_pos, rx809_eos, rxscan812_done
  rxscan812_scan:
    set_addr $I10, rxscan812_loop
    rx809_cur."!mark_push"(0, rx809_pos, $I10)
  rxscan812_done:
.annotate "line", 377
  # rx enumcharlist negate=0 zerowidth
    ge rx809_pos, rx809_eos, rx809_fail
    sub $I10, rx809_pos, rx809_off
    substr $S10, rx809_tgt, $I10, 1
    index $I11, "$", $S10
    lt $I11, 0, rx809_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx809_cur."!cursor_pos"(rx809_pos)
    $P10 = rx809_cur."quotemod_check"("s")
    unless $P10, rx809_fail
  # rx subrule "variable" subtype=capture negate=
    rx809_cur."!cursor_pos"(rx809_pos)
    $P10 = rx809_cur."variable"()
    unless $P10, rx809_fail
    rx809_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("variable")
    rx809_pos = $P10."pos"()
  # rx pass
    rx809_cur."!cursor_pass"(rx809_pos, "quote_escape:sym<$>")
    rx809_cur."!cursor_debug"("PASS  ", "quote_escape:sym<$>", " at pos=", rx809_pos)
    .return (rx809_cur)
  rx809_fail:
.annotate "line", 4
    (rx809_rep, rx809_pos, $I10, $P10) = rx809_cur."!mark_fail"(0)
    lt rx809_pos, -1, rx809_done
    eq rx809_pos, -1, rx809_fail
    jump $I10
  rx809_done:
    rx809_cur."!cursor_fail"()
    rx809_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<$>")
    .return (rx809_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<$>"  :subid("194_1259103982.97329") :method
.annotate "line", 4
    new $P811, "ResizablePMCArray"
    push $P811, "$"
    .return ($P811)
.end


.namespace ["NQP";"Grammar"]
.sub "quote_escape:sym<{ }>"  :subid("195_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx814_tgt
    .local int rx814_pos
    .local int rx814_off
    .local int rx814_eos
    .local int rx814_rep
    .local pmc rx814_cur
    (rx814_cur, rx814_pos, rx814_tgt) = self."!cursor_start"()
    rx814_cur."!cursor_debug"("START ", "quote_escape:sym<{ }>")
    .lex unicode:"$\x{a2}", rx814_cur
    .local pmc match
    .lex "$/", match
    length rx814_eos, rx814_tgt
    set rx814_off, 0
    lt rx814_pos, 2, rx814_start
    sub rx814_off, rx814_pos, 1
    substr rx814_tgt, rx814_tgt, rx814_off
  rx814_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan817_done
    goto rxscan817_scan
  rxscan817_loop:
    ($P10) = rx814_cur."from"()
    inc $P10
    set rx814_pos, $P10
    ge rx814_pos, rx814_eos, rxscan817_done
  rxscan817_scan:
    set_addr $I10, rxscan817_loop
    rx814_cur."!mark_push"(0, rx814_pos, $I10)
  rxscan817_done:
.annotate "line", 378
  # rx enumcharlist negate=0 zerowidth
    ge rx814_pos, rx814_eos, rx814_fail
    sub $I10, rx814_pos, rx814_off
    substr $S10, rx814_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx814_fail
  # rx subrule "quotemod_check" subtype=zerowidth negate=
    rx814_cur."!cursor_pos"(rx814_pos)
    $P10 = rx814_cur."quotemod_check"("c")
    unless $P10, rx814_fail
  # rx subrule "block" subtype=capture negate=
    rx814_cur."!cursor_pos"(rx814_pos)
    $P10 = rx814_cur."block"()
    unless $P10, rx814_fail
    rx814_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx814_pos = $P10."pos"()
  # rx pass
    rx814_cur."!cursor_pass"(rx814_pos, "quote_escape:sym<{ }>")
    rx814_cur."!cursor_debug"("PASS  ", "quote_escape:sym<{ }>", " at pos=", rx814_pos)
    .return (rx814_cur)
  rx814_fail:
.annotate "line", 4
    (rx814_rep, rx814_pos, $I10, $P10) = rx814_cur."!mark_fail"(0)
    lt rx814_pos, -1, rx814_done
    eq rx814_pos, -1, rx814_fail
    jump $I10
  rx814_done:
    rx814_cur."!cursor_fail"()
    rx814_cur."!cursor_debug"("FAIL  ", "quote_escape:sym<{ }>")
    .return (rx814_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__quote_escape:sym<{ }>"  :subid("196_1259103982.97329") :method
.annotate "line", 4
    new $P816, "ResizablePMCArray"
    push $P816, "{"
    .return ($P816)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<( )>"  :subid("197_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx819_tgt
    .local int rx819_pos
    .local int rx819_off
    .local int rx819_eos
    .local int rx819_rep
    .local pmc rx819_cur
    (rx819_cur, rx819_pos, rx819_tgt) = self."!cursor_start"()
    rx819_cur."!cursor_debug"("START ", "circumfix:sym<( )>")
    rx819_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx819_cur
    .local pmc match
    .lex "$/", match
    length rx819_eos, rx819_tgt
    set rx819_off, 0
    lt rx819_pos, 2, rx819_start
    sub rx819_off, rx819_pos, 1
    substr rx819_tgt, rx819_tgt, rx819_off
  rx819_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan823_done
    goto rxscan823_scan
  rxscan823_loop:
    ($P10) = rx819_cur."from"()
    inc $P10
    set rx819_pos, $P10
    ge rx819_pos, rx819_eos, rxscan823_done
  rxscan823_scan:
    set_addr $I10, rxscan823_loop
    rx819_cur."!mark_push"(0, rx819_pos, $I10)
  rxscan823_done:
.annotate "line", 380
  # rx literal  "("
    add $I11, rx819_pos, 1
    gt $I11, rx819_eos, rx819_fail
    sub $I11, rx819_pos, rx819_off
    substr $S10, rx819_tgt, $I11, 1
    ne $S10, "(", rx819_fail
    add rx819_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx819_cur."!cursor_pos"(rx819_pos)
    $P10 = rx819_cur."ws"()
    unless $P10, rx819_fail
    rx819_pos = $P10."pos"()
  # rx rxquantr824 ** 0..1
    set_addr $I825, rxquantr824_done
    rx819_cur."!mark_push"(0, rx819_pos, $I825)
  rxquantr824_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx819_cur."!cursor_pos"(rx819_pos)
    $P10 = rx819_cur."EXPR"()
    unless $P10, rx819_fail
    rx819_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx819_pos = $P10."pos"()
    (rx819_rep) = rx819_cur."!mark_commit"($I825)
  rxquantr824_done:
  # rx literal  ")"
    add $I11, rx819_pos, 1
    gt $I11, rx819_eos, rx819_fail
    sub $I11, rx819_pos, rx819_off
    substr $S10, rx819_tgt, $I11, 1
    ne $S10, ")", rx819_fail
    add rx819_pos, 1
  # rx pass
    rx819_cur."!cursor_pass"(rx819_pos, "circumfix:sym<( )>")
    rx819_cur."!cursor_debug"("PASS  ", "circumfix:sym<( )>", " at pos=", rx819_pos)
    .return (rx819_cur)
  rx819_fail:
.annotate "line", 4
    (rx819_rep, rx819_pos, $I10, $P10) = rx819_cur."!mark_fail"(0)
    lt rx819_pos, -1, rx819_done
    eq rx819_pos, -1, rx819_fail
    jump $I10
  rx819_done:
    rx819_cur."!cursor_fail"()
    rx819_cur."!cursor_debug"("FAIL  ", "circumfix:sym<( )>")
    .return (rx819_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<( )>"  :subid("198_1259103982.97329") :method
.annotate "line", 4
    $P821 = self."!PREFIX__!subrule"("", "(")
    new $P822, "ResizablePMCArray"
    push $P822, $P821
    .return ($P822)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<[ ]>"  :subid("199_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx827_tgt
    .local int rx827_pos
    .local int rx827_off
    .local int rx827_eos
    .local int rx827_rep
    .local pmc rx827_cur
    (rx827_cur, rx827_pos, rx827_tgt) = self."!cursor_start"()
    rx827_cur."!cursor_debug"("START ", "circumfix:sym<[ ]>")
    rx827_cur."!cursor_caparray"("EXPR")
    .lex unicode:"$\x{a2}", rx827_cur
    .local pmc match
    .lex "$/", match
    length rx827_eos, rx827_tgt
    set rx827_off, 0
    lt rx827_pos, 2, rx827_start
    sub rx827_off, rx827_pos, 1
    substr rx827_tgt, rx827_tgt, rx827_off
  rx827_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan831_done
    goto rxscan831_scan
  rxscan831_loop:
    ($P10) = rx827_cur."from"()
    inc $P10
    set rx827_pos, $P10
    ge rx827_pos, rx827_eos, rxscan831_done
  rxscan831_scan:
    set_addr $I10, rxscan831_loop
    rx827_cur."!mark_push"(0, rx827_pos, $I10)
  rxscan831_done:
.annotate "line", 381
  # rx literal  "["
    add $I11, rx827_pos, 1
    gt $I11, rx827_eos, rx827_fail
    sub $I11, rx827_pos, rx827_off
    substr $S10, rx827_tgt, $I11, 1
    ne $S10, "[", rx827_fail
    add rx827_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx827_cur."!cursor_pos"(rx827_pos)
    $P10 = rx827_cur."ws"()
    unless $P10, rx827_fail
    rx827_pos = $P10."pos"()
  # rx rxquantr832 ** 0..1
    set_addr $I833, rxquantr832_done
    rx827_cur."!mark_push"(0, rx827_pos, $I833)
  rxquantr832_loop:
  # rx subrule "EXPR" subtype=capture negate=
    rx827_cur."!cursor_pos"(rx827_pos)
    $P10 = rx827_cur."EXPR"()
    unless $P10, rx827_fail
    rx827_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx827_pos = $P10."pos"()
    (rx827_rep) = rx827_cur."!mark_commit"($I833)
  rxquantr832_done:
  # rx literal  "]"
    add $I11, rx827_pos, 1
    gt $I11, rx827_eos, rx827_fail
    sub $I11, rx827_pos, rx827_off
    substr $S10, rx827_tgt, $I11, 1
    ne $S10, "]", rx827_fail
    add rx827_pos, 1
  # rx pass
    rx827_cur."!cursor_pass"(rx827_pos, "circumfix:sym<[ ]>")
    rx827_cur."!cursor_debug"("PASS  ", "circumfix:sym<[ ]>", " at pos=", rx827_pos)
    .return (rx827_cur)
  rx827_fail:
.annotate "line", 4
    (rx827_rep, rx827_pos, $I10, $P10) = rx827_cur."!mark_fail"(0)
    lt rx827_pos, -1, rx827_done
    eq rx827_pos, -1, rx827_fail
    jump $I10
  rx827_done:
    rx827_cur."!cursor_fail"()
    rx827_cur."!cursor_debug"("FAIL  ", "circumfix:sym<[ ]>")
    .return (rx827_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<[ ]>"  :subid("200_1259103982.97329") :method
.annotate "line", 4
    $P829 = self."!PREFIX__!subrule"("", "[")
    new $P830, "ResizablePMCArray"
    push $P830, $P829
    .return ($P830)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<ang>"  :subid("201_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx835_tgt
    .local int rx835_pos
    .local int rx835_off
    .local int rx835_eos
    .local int rx835_rep
    .local pmc rx835_cur
    (rx835_cur, rx835_pos, rx835_tgt) = self."!cursor_start"()
    rx835_cur."!cursor_debug"("START ", "circumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx835_cur
    .local pmc match
    .lex "$/", match
    length rx835_eos, rx835_tgt
    set rx835_off, 0
    lt rx835_pos, 2, rx835_start
    sub rx835_off, rx835_pos, 1
    substr rx835_tgt, rx835_tgt, rx835_off
  rx835_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan838_done
    goto rxscan838_scan
  rxscan838_loop:
    ($P10) = rx835_cur."from"()
    inc $P10
    set rx835_pos, $P10
    ge rx835_pos, rx835_eos, rxscan838_done
  rxscan838_scan:
    set_addr $I10, rxscan838_loop
    rx835_cur."!mark_push"(0, rx835_pos, $I10)
  rxscan838_done:
.annotate "line", 382
  # rx enumcharlist negate=0 zerowidth
    ge rx835_pos, rx835_eos, rx835_fail
    sub $I10, rx835_pos, rx835_off
    substr $S10, rx835_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx835_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx835_cur."!cursor_pos"(rx835_pos)
    $P10 = rx835_cur."quote_EXPR"(":q", ":w")
    unless $P10, rx835_fail
    rx835_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx835_pos = $P10."pos"()
  # rx pass
    rx835_cur."!cursor_pass"(rx835_pos, "circumfix:sym<ang>")
    rx835_cur."!cursor_debug"("PASS  ", "circumfix:sym<ang>", " at pos=", rx835_pos)
    .return (rx835_cur)
  rx835_fail:
.annotate "line", 4
    (rx835_rep, rx835_pos, $I10, $P10) = rx835_cur."!mark_fail"(0)
    lt rx835_pos, -1, rx835_done
    eq rx835_pos, -1, rx835_fail
    jump $I10
  rx835_done:
    rx835_cur."!cursor_fail"()
    rx835_cur."!cursor_debug"("FAIL  ", "circumfix:sym<ang>")
    .return (rx835_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<ang>"  :subid("202_1259103982.97329") :method
.annotate "line", 4
    new $P837, "ResizablePMCArray"
    push $P837, "<"
    .return ($P837)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<{ }>"  :subid("203_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx840_tgt
    .local int rx840_pos
    .local int rx840_off
    .local int rx840_eos
    .local int rx840_rep
    .local pmc rx840_cur
    (rx840_cur, rx840_pos, rx840_tgt) = self."!cursor_start"()
    rx840_cur."!cursor_debug"("START ", "circumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx840_cur
    .local pmc match
    .lex "$/", match
    length rx840_eos, rx840_tgt
    set rx840_off, 0
    lt rx840_pos, 2, rx840_start
    sub rx840_off, rx840_pos, 1
    substr rx840_tgt, rx840_tgt, rx840_off
  rx840_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan843_done
    goto rxscan843_scan
  rxscan843_loop:
    ($P10) = rx840_cur."from"()
    inc $P10
    set rx840_pos, $P10
    ge rx840_pos, rx840_eos, rxscan843_done
  rxscan843_scan:
    set_addr $I10, rxscan843_loop
    rx840_cur."!mark_push"(0, rx840_pos, $I10)
  rxscan843_done:
.annotate "line", 383
  # rx enumcharlist negate=0 zerowidth
    ge rx840_pos, rx840_eos, rx840_fail
    sub $I10, rx840_pos, rx840_off
    substr $S10, rx840_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx840_fail
  # rx subrule "pblock" subtype=capture negate=
    rx840_cur."!cursor_pos"(rx840_pos)
    $P10 = rx840_cur."pblock"()
    unless $P10, rx840_fail
    rx840_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("pblock")
    rx840_pos = $P10."pos"()
  # rx pass
    rx840_cur."!cursor_pass"(rx840_pos, "circumfix:sym<{ }>")
    rx840_cur."!cursor_debug"("PASS  ", "circumfix:sym<{ }>", " at pos=", rx840_pos)
    .return (rx840_cur)
  rx840_fail:
.annotate "line", 4
    (rx840_rep, rx840_pos, $I10, $P10) = rx840_cur."!mark_fail"(0)
    lt rx840_pos, -1, rx840_done
    eq rx840_pos, -1, rx840_fail
    jump $I10
  rx840_done:
    rx840_cur."!cursor_fail"()
    rx840_cur."!cursor_debug"("FAIL  ", "circumfix:sym<{ }>")
    .return (rx840_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<{ }>"  :subid("204_1259103982.97329") :method
.annotate "line", 4
    new $P842, "ResizablePMCArray"
    push $P842, "{"
    .return ($P842)
.end


.namespace ["NQP";"Grammar"]
.sub "circumfix:sym<sigil>"  :subid("205_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx845_tgt
    .local int rx845_pos
    .local int rx845_off
    .local int rx845_eos
    .local int rx845_rep
    .local pmc rx845_cur
    (rx845_cur, rx845_pos, rx845_tgt) = self."!cursor_start"()
    rx845_cur."!cursor_debug"("START ", "circumfix:sym<sigil>")
    .lex unicode:"$\x{a2}", rx845_cur
    .local pmc match
    .lex "$/", match
    length rx845_eos, rx845_tgt
    set rx845_off, 0
    lt rx845_pos, 2, rx845_start
    sub rx845_off, rx845_pos, 1
    substr rx845_tgt, rx845_tgt, rx845_off
  rx845_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan849_done
    goto rxscan849_scan
  rxscan849_loop:
    ($P10) = rx845_cur."from"()
    inc $P10
    set rx845_pos, $P10
    ge rx845_pos, rx845_eos, rxscan849_done
  rxscan849_scan:
    set_addr $I10, rxscan849_loop
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  rxscan849_done:
.annotate "line", 384
  # rx subrule "sigil" subtype=capture negate=
    rx845_cur."!cursor_pos"(rx845_pos)
    $P10 = rx845_cur."sigil"()
    unless $P10, rx845_fail
    rx845_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sigil")
    rx845_pos = $P10."pos"()
  # rx literal  "("
    add $I11, rx845_pos, 1
    gt $I11, rx845_eos, rx845_fail
    sub $I11, rx845_pos, rx845_off
    substr $S10, rx845_tgt, $I11, 1
    ne $S10, "(", rx845_fail
    add rx845_pos, 1
  # rx subrule "semilist" subtype=capture negate=
    rx845_cur."!cursor_pos"(rx845_pos)
    $P10 = rx845_cur."semilist"()
    unless $P10, rx845_fail
    rx845_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("semilist")
    rx845_pos = $P10."pos"()
  alt850_0:
    set_addr $I10, alt850_1
    rx845_cur."!mark_push"(0, rx845_pos, $I10)
  # rx literal  ")"
    add $I11, rx845_pos, 1
    gt $I11, rx845_eos, rx845_fail
    sub $I11, rx845_pos, rx845_off
    substr $S10, rx845_tgt, $I11, 1
    ne $S10, ")", rx845_fail
    add rx845_pos, 1
    goto alt850_end
  alt850_1:
  # rx subrule "FAILGOAL" subtype=method negate=
    rx845_cur."!cursor_pos"(rx845_pos)
    $P10 = rx845_cur."FAILGOAL"("')'")
    unless $P10, rx845_fail
    rx845_pos = $P10."pos"()
  alt850_end:
  # rx pass
    rx845_cur."!cursor_pass"(rx845_pos, "circumfix:sym<sigil>")
    rx845_cur."!cursor_debug"("PASS  ", "circumfix:sym<sigil>", " at pos=", rx845_pos)
    .return (rx845_cur)
  rx845_fail:
.annotate "line", 4
    (rx845_rep, rx845_pos, $I10, $P10) = rx845_cur."!mark_fail"(0)
    lt rx845_pos, -1, rx845_done
    eq rx845_pos, -1, rx845_fail
    jump $I10
  rx845_done:
    rx845_cur."!cursor_fail"()
    rx845_cur."!cursor_debug"("FAIL  ", "circumfix:sym<sigil>")
    .return (rx845_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__circumfix:sym<sigil>"  :subid("206_1259103982.97329") :method
.annotate "line", 4
    $P847 = self."!PREFIX__!subrule"("sigil", "")
    new $P848, "ResizablePMCArray"
    push $P848, $P847
    .return ($P848)
.end


.namespace ["NQP";"Grammar"]
.sub "semilist"  :subid("207_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 4
    .local string rx853_tgt
    .local int rx853_pos
    .local int rx853_off
    .local int rx853_eos
    .local int rx853_rep
    .local pmc rx853_cur
    (rx853_cur, rx853_pos, rx853_tgt) = self."!cursor_start"()
    rx853_cur."!cursor_debug"("START ", "semilist")
    .lex unicode:"$\x{a2}", rx853_cur
    .local pmc match
    .lex "$/", match
    length rx853_eos, rx853_tgt
    set rx853_off, 0
    lt rx853_pos, 2, rx853_start
    sub rx853_off, rx853_pos, 1
    substr rx853_tgt, rx853_tgt, rx853_off
  rx853_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan856_done
    goto rxscan856_scan
  rxscan856_loop:
    ($P10) = rx853_cur."from"()
    inc $P10
    set rx853_pos, $P10
    ge rx853_pos, rx853_eos, rxscan856_done
  rxscan856_scan:
    set_addr $I10, rxscan856_loop
    rx853_cur."!mark_push"(0, rx853_pos, $I10)
  rxscan856_done:
.annotate "line", 386
  # rx subrule "ws" subtype=method negate=
    rx853_cur."!cursor_pos"(rx853_pos)
    $P10 = rx853_cur."ws"()
    unless $P10, rx853_fail
    rx853_pos = $P10."pos"()
  # rx subrule "statement" subtype=capture negate=
    rx853_cur."!cursor_pos"(rx853_pos)
    $P10 = rx853_cur."statement"()
    unless $P10, rx853_fail
    rx853_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx853_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx853_cur."!cursor_pos"(rx853_pos)
    $P10 = rx853_cur."ws"()
    unless $P10, rx853_fail
    rx853_pos = $P10."pos"()
  # rx pass
    rx853_cur."!cursor_pass"(rx853_pos, "semilist")
    rx853_cur."!cursor_debug"("PASS  ", "semilist", " at pos=", rx853_pos)
    .return (rx853_cur)
  rx853_fail:
.annotate "line", 4
    (rx853_rep, rx853_pos, $I10, $P10) = rx853_cur."!mark_fail"(0)
    lt rx853_pos, -1, rx853_done
    eq rx853_pos, -1, rx853_fail
    jump $I10
  rx853_done:
    rx853_cur."!cursor_fail"()
    rx853_cur."!cursor_debug"("FAIL  ", "semilist")
    .return (rx853_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__semilist"  :subid("208_1259103982.97329") :method
.annotate "line", 4
    new $P855, "ResizablePMCArray"
    push $P855, ""
    .return ($P855)
.end


.namespace ["NQP";"Grammar"]
.sub "infixish"  :subid("209_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx860_tgt
    .local int rx860_pos
    .local int rx860_off
    .local int rx860_eos
    .local int rx860_rep
    .local pmc rx860_cur
    (rx860_cur, rx860_pos, rx860_tgt) = self."!cursor_start"()
    rx860_cur."!cursor_debug"("START ", "infixish")
    .lex unicode:"$\x{a2}", rx860_cur
    .local pmc match
    .lex "$/", match
    length rx860_eos, rx860_tgt
    set rx860_off, 0
    lt rx860_pos, 2, rx860_start
    sub rx860_off, rx860_pos, 1
    substr rx860_tgt, rx860_tgt, rx860_off
  rx860_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan863_done
    goto rxscan863_scan
  rxscan863_loop:
    ($P10) = rx860_cur."from"()
    inc $P10
    set rx860_pos, $P10
    ge rx860_pos, rx860_eos, rxscan863_done
  rxscan863_scan:
    set_addr $I10, rxscan863_loop
    rx860_cur."!mark_push"(0, rx860_pos, $I10)
  rxscan863_done:
.annotate "line", 409
  # rx subrule "infixstopper" subtype=zerowidth negate=1
    rx860_cur."!cursor_pos"(rx860_pos)
    $P10 = rx860_cur."infixstopper"()
    if $P10, rx860_fail
  # rx subrule "infix" subtype=capture negate=
    rx860_cur."!cursor_pos"(rx860_pos)
    $P10 = rx860_cur."infix"()
    unless $P10, rx860_fail
    rx860_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("OPER=infix")
    rx860_pos = $P10."pos"()
  # rx pass
    rx860_cur."!cursor_pass"(rx860_pos, "infixish")
    rx860_cur."!cursor_debug"("PASS  ", "infixish", " at pos=", rx860_pos)
    .return (rx860_cur)
  rx860_fail:
.annotate "line", 390
    (rx860_rep, rx860_pos, $I10, $P10) = rx860_cur."!mark_fail"(0)
    lt rx860_pos, -1, rx860_done
    eq rx860_pos, -1, rx860_fail
    jump $I10
  rx860_done:
    rx860_cur."!cursor_fail"()
    rx860_cur."!cursor_debug"("FAIL  ", "infixish")
    .return (rx860_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixish"  :subid("210_1259103982.97329") :method
.annotate "line", 390
    new $P862, "ResizablePMCArray"
    push $P862, ""
    .return ($P862)
.end


.namespace ["NQP";"Grammar"]
.sub "infixstopper"  :subid("211_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx865_tgt
    .local int rx865_pos
    .local int rx865_off
    .local int rx865_eos
    .local int rx865_rep
    .local pmc rx865_cur
    (rx865_cur, rx865_pos, rx865_tgt) = self."!cursor_start"()
    rx865_cur."!cursor_debug"("START ", "infixstopper")
    .lex unicode:"$\x{a2}", rx865_cur
    .local pmc match
    .lex "$/", match
    length rx865_eos, rx865_tgt
    set rx865_off, 0
    lt rx865_pos, 2, rx865_start
    sub rx865_off, rx865_pos, 1
    substr rx865_tgt, rx865_tgt, rx865_off
  rx865_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan868_done
    goto rxscan868_scan
  rxscan868_loop:
    ($P10) = rx865_cur."from"()
    inc $P10
    set rx865_pos, $P10
    ge rx865_pos, rx865_eos, rxscan868_done
  rxscan868_scan:
    set_addr $I10, rxscan868_loop
    rx865_cur."!mark_push"(0, rx865_pos, $I10)
  rxscan868_done:
.annotate "line", 410
  # rx subrule "lambda" subtype=zerowidth negate=
    rx865_cur."!cursor_pos"(rx865_pos)
    $P10 = rx865_cur."lambda"()
    unless $P10, rx865_fail
  # rx pass
    rx865_cur."!cursor_pass"(rx865_pos, "infixstopper")
    rx865_cur."!cursor_debug"("PASS  ", "infixstopper", " at pos=", rx865_pos)
    .return (rx865_cur)
  rx865_fail:
.annotate "line", 390
    (rx865_rep, rx865_pos, $I10, $P10) = rx865_cur."!mark_fail"(0)
    lt rx865_pos, -1, rx865_done
    eq rx865_pos, -1, rx865_fail
    jump $I10
  rx865_done:
    rx865_cur."!cursor_fail"()
    rx865_cur."!cursor_debug"("FAIL  ", "infixstopper")
    .return (rx865_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infixstopper"  :subid("212_1259103982.97329") :method
.annotate "line", 390
    new $P867, "ResizablePMCArray"
    push $P867, ""
    .return ($P867)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<[ ]>"  :subid("213_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx870_tgt
    .local int rx870_pos
    .local int rx870_off
    .local int rx870_eos
    .local int rx870_rep
    .local pmc rx870_cur
    (rx870_cur, rx870_pos, rx870_tgt) = self."!cursor_start"()
    rx870_cur."!cursor_debug"("START ", "postcircumfix:sym<[ ]>")
    .lex unicode:"$\x{a2}", rx870_cur
    .local pmc match
    .lex "$/", match
    length rx870_eos, rx870_tgt
    set rx870_off, 0
    lt rx870_pos, 2, rx870_start
    sub rx870_off, rx870_pos, 1
    substr rx870_tgt, rx870_tgt, rx870_off
  rx870_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan874_done
    goto rxscan874_scan
  rxscan874_loop:
    ($P10) = rx870_cur."from"()
    inc $P10
    set rx870_pos, $P10
    ge rx870_pos, rx870_eos, rxscan874_done
  rxscan874_scan:
    set_addr $I10, rxscan874_loop
    rx870_cur."!mark_push"(0, rx870_pos, $I10)
  rxscan874_done:
.annotate "line", 413
  # rx literal  "["
    add $I11, rx870_pos, 1
    gt $I11, rx870_eos, rx870_fail
    sub $I11, rx870_pos, rx870_off
    substr $S10, rx870_tgt, $I11, 1
    ne $S10, "[", rx870_fail
    add rx870_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."ws"()
    unless $P10, rx870_fail
    rx870_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."EXPR"()
    unless $P10, rx870_fail
    rx870_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx870_pos = $P10."pos"()
  # rx literal  "]"
    add $I11, rx870_pos, 1
    gt $I11, rx870_eos, rx870_fail
    sub $I11, rx870_pos, rx870_off
    substr $S10, rx870_tgt, $I11, 1
    ne $S10, "]", rx870_fail
    add rx870_pos, 1
.annotate "line", 414
  # rx subrule "O" subtype=capture negate=
    rx870_cur."!cursor_pos"(rx870_pos)
    $P10 = rx870_cur."O"("%methodop")
    unless $P10, rx870_fail
    rx870_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx870_pos = $P10."pos"()
.annotate "line", 412
  # rx pass
    rx870_cur."!cursor_pass"(rx870_pos, "postcircumfix:sym<[ ]>")
    rx870_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<[ ]>", " at pos=", rx870_pos)
    .return (rx870_cur)
  rx870_fail:
.annotate "line", 390
    (rx870_rep, rx870_pos, $I10, $P10) = rx870_cur."!mark_fail"(0)
    lt rx870_pos, -1, rx870_done
    eq rx870_pos, -1, rx870_fail
    jump $I10
  rx870_done:
    rx870_cur."!cursor_fail"()
    rx870_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<[ ]>")
    .return (rx870_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<[ ]>"  :subid("214_1259103982.97329") :method
.annotate "line", 390
    $P872 = self."!PREFIX__!subrule"("", "[")
    new $P873, "ResizablePMCArray"
    push $P873, $P872
    .return ($P873)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<{ }>"  :subid("215_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx876_tgt
    .local int rx876_pos
    .local int rx876_off
    .local int rx876_eos
    .local int rx876_rep
    .local pmc rx876_cur
    (rx876_cur, rx876_pos, rx876_tgt) = self."!cursor_start"()
    rx876_cur."!cursor_debug"("START ", "postcircumfix:sym<{ }>")
    .lex unicode:"$\x{a2}", rx876_cur
    .local pmc match
    .lex "$/", match
    length rx876_eos, rx876_tgt
    set rx876_off, 0
    lt rx876_pos, 2, rx876_start
    sub rx876_off, rx876_pos, 1
    substr rx876_tgt, rx876_tgt, rx876_off
  rx876_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan880_done
    goto rxscan880_scan
  rxscan880_loop:
    ($P10) = rx876_cur."from"()
    inc $P10
    set rx876_pos, $P10
    ge rx876_pos, rx876_eos, rxscan880_done
  rxscan880_scan:
    set_addr $I10, rxscan880_loop
    rx876_cur."!mark_push"(0, rx876_pos, $I10)
  rxscan880_done:
.annotate "line", 418
  # rx literal  "{"
    add $I11, rx876_pos, 1
    gt $I11, rx876_eos, rx876_fail
    sub $I11, rx876_pos, rx876_off
    substr $S10, rx876_tgt, $I11, 1
    ne $S10, "{", rx876_fail
    add rx876_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."ws"()
    unless $P10, rx876_fail
    rx876_pos = $P10."pos"()
  # rx subrule "EXPR" subtype=capture negate=
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."EXPR"()
    unless $P10, rx876_fail
    rx876_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx876_pos = $P10."pos"()
  # rx literal  "}"
    add $I11, rx876_pos, 1
    gt $I11, rx876_eos, rx876_fail
    sub $I11, rx876_pos, rx876_off
    substr $S10, rx876_tgt, $I11, 1
    ne $S10, "}", rx876_fail
    add rx876_pos, 1
.annotate "line", 419
  # rx subrule "O" subtype=capture negate=
    rx876_cur."!cursor_pos"(rx876_pos)
    $P10 = rx876_cur."O"("%methodop")
    unless $P10, rx876_fail
    rx876_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx876_pos = $P10."pos"()
.annotate "line", 417
  # rx pass
    rx876_cur."!cursor_pass"(rx876_pos, "postcircumfix:sym<{ }>")
    rx876_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<{ }>", " at pos=", rx876_pos)
    .return (rx876_cur)
  rx876_fail:
.annotate "line", 390
    (rx876_rep, rx876_pos, $I10, $P10) = rx876_cur."!mark_fail"(0)
    lt rx876_pos, -1, rx876_done
    eq rx876_pos, -1, rx876_fail
    jump $I10
  rx876_done:
    rx876_cur."!cursor_fail"()
    rx876_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<{ }>")
    .return (rx876_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<{ }>"  :subid("216_1259103982.97329") :method
.annotate "line", 390
    $P878 = self."!PREFIX__!subrule"("", "{")
    new $P879, "ResizablePMCArray"
    push $P879, $P878
    .return ($P879)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<ang>"  :subid("217_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx882_tgt
    .local int rx882_pos
    .local int rx882_off
    .local int rx882_eos
    .local int rx882_rep
    .local pmc rx882_cur
    (rx882_cur, rx882_pos, rx882_tgt) = self."!cursor_start"()
    rx882_cur."!cursor_debug"("START ", "postcircumfix:sym<ang>")
    .lex unicode:"$\x{a2}", rx882_cur
    .local pmc match
    .lex "$/", match
    length rx882_eos, rx882_tgt
    set rx882_off, 0
    lt rx882_pos, 2, rx882_start
    sub rx882_off, rx882_pos, 1
    substr rx882_tgt, rx882_tgt, rx882_off
  rx882_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan885_done
    goto rxscan885_scan
  rxscan885_loop:
    ($P10) = rx882_cur."from"()
    inc $P10
    set rx882_pos, $P10
    ge rx882_pos, rx882_eos, rxscan885_done
  rxscan885_scan:
    set_addr $I10, rxscan885_loop
    rx882_cur."!mark_push"(0, rx882_pos, $I10)
  rxscan885_done:
.annotate "line", 423
  # rx enumcharlist negate=0 zerowidth
    ge rx882_pos, rx882_eos, rx882_fail
    sub $I10, rx882_pos, rx882_off
    substr $S10, rx882_tgt, $I10, 1
    index $I11, "<", $S10
    lt $I11, 0, rx882_fail
  # rx subrule "quote_EXPR" subtype=capture negate=
    rx882_cur."!cursor_pos"(rx882_pos)
    $P10 = rx882_cur."quote_EXPR"(":q")
    unless $P10, rx882_fail
    rx882_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("quote_EXPR")
    rx882_pos = $P10."pos"()
.annotate "line", 424
  # rx subrule "O" subtype=capture negate=
    rx882_cur."!cursor_pos"(rx882_pos)
    $P10 = rx882_cur."O"("%methodop")
    unless $P10, rx882_fail
    rx882_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx882_pos = $P10."pos"()
.annotate "line", 422
  # rx pass
    rx882_cur."!cursor_pass"(rx882_pos, "postcircumfix:sym<ang>")
    rx882_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<ang>", " at pos=", rx882_pos)
    .return (rx882_cur)
  rx882_fail:
.annotate "line", 390
    (rx882_rep, rx882_pos, $I10, $P10) = rx882_cur."!mark_fail"(0)
    lt rx882_pos, -1, rx882_done
    eq rx882_pos, -1, rx882_fail
    jump $I10
  rx882_done:
    rx882_cur."!cursor_fail"()
    rx882_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<ang>")
    .return (rx882_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<ang>"  :subid("218_1259103982.97329") :method
.annotate "line", 390
    new $P884, "ResizablePMCArray"
    push $P884, "<"
    .return ($P884)
.end


.namespace ["NQP";"Grammar"]
.sub "postcircumfix:sym<( )>"  :subid("219_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx887_tgt
    .local int rx887_pos
    .local int rx887_off
    .local int rx887_eos
    .local int rx887_rep
    .local pmc rx887_cur
    (rx887_cur, rx887_pos, rx887_tgt) = self."!cursor_start"()
    rx887_cur."!cursor_debug"("START ", "postcircumfix:sym<( )>")
    .lex unicode:"$\x{a2}", rx887_cur
    .local pmc match
    .lex "$/", match
    length rx887_eos, rx887_tgt
    set rx887_off, 0
    lt rx887_pos, 2, rx887_start
    sub rx887_off, rx887_pos, 1
    substr rx887_tgt, rx887_tgt, rx887_off
  rx887_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan891_done
    goto rxscan891_scan
  rxscan891_loop:
    ($P10) = rx887_cur."from"()
    inc $P10
    set rx887_pos, $P10
    ge rx887_pos, rx887_eos, rxscan891_done
  rxscan891_scan:
    set_addr $I10, rxscan891_loop
    rx887_cur."!mark_push"(0, rx887_pos, $I10)
  rxscan891_done:
.annotate "line", 428
  # rx literal  "("
    add $I11, rx887_pos, 1
    gt $I11, rx887_eos, rx887_fail
    sub $I11, rx887_pos, rx887_off
    substr $S10, rx887_tgt, $I11, 1
    ne $S10, "(", rx887_fail
    add rx887_pos, 1
  # rx subrule "ws" subtype=method negate=
    rx887_cur."!cursor_pos"(rx887_pos)
    $P10 = rx887_cur."ws"()
    unless $P10, rx887_fail
    rx887_pos = $P10."pos"()
  # rx subrule "arglist" subtype=capture negate=
    rx887_cur."!cursor_pos"(rx887_pos)
    $P10 = rx887_cur."arglist"()
    unless $P10, rx887_fail
    rx887_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx887_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx887_pos, 1
    gt $I11, rx887_eos, rx887_fail
    sub $I11, rx887_pos, rx887_off
    substr $S10, rx887_tgt, $I11, 1
    ne $S10, ")", rx887_fail
    add rx887_pos, 1
.annotate "line", 429
  # rx subrule "O" subtype=capture negate=
    rx887_cur."!cursor_pos"(rx887_pos)
    $P10 = rx887_cur."O"("%methodop")
    unless $P10, rx887_fail
    rx887_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx887_pos = $P10."pos"()
.annotate "line", 427
  # rx pass
    rx887_cur."!cursor_pass"(rx887_pos, "postcircumfix:sym<( )>")
    rx887_cur."!cursor_debug"("PASS  ", "postcircumfix:sym<( )>", " at pos=", rx887_pos)
    .return (rx887_cur)
  rx887_fail:
.annotate "line", 390
    (rx887_rep, rx887_pos, $I10, $P10) = rx887_cur."!mark_fail"(0)
    lt rx887_pos, -1, rx887_done
    eq rx887_pos, -1, rx887_fail
    jump $I10
  rx887_done:
    rx887_cur."!cursor_fail"()
    rx887_cur."!cursor_debug"("FAIL  ", "postcircumfix:sym<( )>")
    .return (rx887_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postcircumfix:sym<( )>"  :subid("220_1259103982.97329") :method
.annotate "line", 390
    $P889 = self."!PREFIX__!subrule"("", "(")
    new $P890, "ResizablePMCArray"
    push $P890, $P889
    .return ($P890)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<.>"  :subid("221_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx893_tgt
    .local int rx893_pos
    .local int rx893_off
    .local int rx893_eos
    .local int rx893_rep
    .local pmc rx893_cur
    (rx893_cur, rx893_pos, rx893_tgt) = self."!cursor_start"()
    rx893_cur."!cursor_debug"("START ", "postfix:sym<.>")
    .lex unicode:"$\x{a2}", rx893_cur
    .local pmc match
    .lex "$/", match
    length rx893_eos, rx893_tgt
    set rx893_off, 0
    lt rx893_pos, 2, rx893_start
    sub rx893_off, rx893_pos, 1
    substr rx893_tgt, rx893_tgt, rx893_off
  rx893_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan897_done
    goto rxscan897_scan
  rxscan897_loop:
    ($P10) = rx893_cur."from"()
    inc $P10
    set rx893_pos, $P10
    ge rx893_pos, rx893_eos, rxscan897_done
  rxscan897_scan:
    set_addr $I10, rxscan897_loop
    rx893_cur."!mark_push"(0, rx893_pos, $I10)
  rxscan897_done:
.annotate "line", 432
  # rx subrule "dotty" subtype=capture negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."dotty"()
    unless $P10, rx893_fail
    rx893_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("dotty")
    rx893_pos = $P10."pos"()
  # rx subrule "O" subtype=capture negate=
    rx893_cur."!cursor_pos"(rx893_pos)
    $P10 = rx893_cur."O"("%methodop")
    unless $P10, rx893_fail
    rx893_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx893_pos = $P10."pos"()
  # rx pass
    rx893_cur."!cursor_pass"(rx893_pos, "postfix:sym<.>")
    rx893_cur."!cursor_debug"("PASS  ", "postfix:sym<.>", " at pos=", rx893_pos)
    .return (rx893_cur)
  rx893_fail:
.annotate "line", 390
    (rx893_rep, rx893_pos, $I10, $P10) = rx893_cur."!mark_fail"(0)
    lt rx893_pos, -1, rx893_done
    eq rx893_pos, -1, rx893_fail
    jump $I10
  rx893_done:
    rx893_cur."!cursor_fail"()
    rx893_cur."!cursor_debug"("FAIL  ", "postfix:sym<.>")
    .return (rx893_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<.>"  :subid("222_1259103982.97329") :method
.annotate "line", 390
    $P895 = self."!PREFIX__!subrule"("dotty", "")
    new $P896, "ResizablePMCArray"
    push $P896, $P895
    .return ($P896)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<++>"  :subid("223_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx899_tgt
    .local int rx899_pos
    .local int rx899_off
    .local int rx899_eos
    .local int rx899_rep
    .local pmc rx899_cur
    (rx899_cur, rx899_pos, rx899_tgt) = self."!cursor_start"()
    rx899_cur."!cursor_debug"("START ", "prefix:sym<++>")
    .lex unicode:"$\x{a2}", rx899_cur
    .local pmc match
    .lex "$/", match
    length rx899_eos, rx899_tgt
    set rx899_off, 0
    lt rx899_pos, 2, rx899_start
    sub rx899_off, rx899_pos, 1
    substr rx899_tgt, rx899_tgt, rx899_off
  rx899_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan903_done
    goto rxscan903_scan
  rxscan903_loop:
    ($P10) = rx899_cur."from"()
    inc $P10
    set rx899_pos, $P10
    ge rx899_pos, rx899_eos, rxscan903_done
  rxscan903_scan:
    set_addr $I10, rxscan903_loop
    rx899_cur."!mark_push"(0, rx899_pos, $I10)
  rxscan903_done:
.annotate "line", 434
  # rx subcapture "sym"
    set_addr $I10, rxcap_904_fail
    rx899_cur."!mark_push"(0, rx899_pos, $I10)
  # rx literal  "++"
    add $I11, rx899_pos, 2
    gt $I11, rx899_eos, rx899_fail
    sub $I11, rx899_pos, rx899_off
    substr $S10, rx899_tgt, $I11, 2
    ne $S10, "++", rx899_fail
    add rx899_pos, 2
    set_addr $I10, rxcap_904_fail
    ($I12, $I11) = rx899_cur."!mark_peek"($I10)
    rx899_cur."!cursor_pos"($I11)
    ($P10) = rx899_cur."!cursor_start"()
    $P10."!cursor_pass"(rx899_pos, "")
    rx899_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_904_done
  rxcap_904_fail:
    goto rx899_fail
  rxcap_904_done:
  # rx subrule "O" subtype=capture negate=
    rx899_cur."!cursor_pos"(rx899_pos)
    $P10 = rx899_cur."O"("%autoincrement, :pirop<inc>")
    unless $P10, rx899_fail
    rx899_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx899_pos = $P10."pos"()
  # rx pass
    rx899_cur."!cursor_pass"(rx899_pos, "prefix:sym<++>")
    rx899_cur."!cursor_debug"("PASS  ", "prefix:sym<++>", " at pos=", rx899_pos)
    .return (rx899_cur)
  rx899_fail:
.annotate "line", 390
    (rx899_rep, rx899_pos, $I10, $P10) = rx899_cur."!mark_fail"(0)
    lt rx899_pos, -1, rx899_done
    eq rx899_pos, -1, rx899_fail
    jump $I10
  rx899_done:
    rx899_cur."!cursor_fail"()
    rx899_cur."!cursor_debug"("FAIL  ", "prefix:sym<++>")
    .return (rx899_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<++>"  :subid("224_1259103982.97329") :method
.annotate "line", 390
    $P901 = self."!PREFIX__!subrule"("O", "++")
    new $P902, "ResizablePMCArray"
    push $P902, $P901
    .return ($P902)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<-->"  :subid("225_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx906_tgt
    .local int rx906_pos
    .local int rx906_off
    .local int rx906_eos
    .local int rx906_rep
    .local pmc rx906_cur
    (rx906_cur, rx906_pos, rx906_tgt) = self."!cursor_start"()
    rx906_cur."!cursor_debug"("START ", "prefix:sym<-->")
    .lex unicode:"$\x{a2}", rx906_cur
    .local pmc match
    .lex "$/", match
    length rx906_eos, rx906_tgt
    set rx906_off, 0
    lt rx906_pos, 2, rx906_start
    sub rx906_off, rx906_pos, 1
    substr rx906_tgt, rx906_tgt, rx906_off
  rx906_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan910_done
    goto rxscan910_scan
  rxscan910_loop:
    ($P10) = rx906_cur."from"()
    inc $P10
    set rx906_pos, $P10
    ge rx906_pos, rx906_eos, rxscan910_done
  rxscan910_scan:
    set_addr $I10, rxscan910_loop
    rx906_cur."!mark_push"(0, rx906_pos, $I10)
  rxscan910_done:
.annotate "line", 435
  # rx subcapture "sym"
    set_addr $I10, rxcap_911_fail
    rx906_cur."!mark_push"(0, rx906_pos, $I10)
  # rx literal  "--"
    add $I11, rx906_pos, 2
    gt $I11, rx906_eos, rx906_fail
    sub $I11, rx906_pos, rx906_off
    substr $S10, rx906_tgt, $I11, 2
    ne $S10, "--", rx906_fail
    add rx906_pos, 2
    set_addr $I10, rxcap_911_fail
    ($I12, $I11) = rx906_cur."!mark_peek"($I10)
    rx906_cur."!cursor_pos"($I11)
    ($P10) = rx906_cur."!cursor_start"()
    $P10."!cursor_pass"(rx906_pos, "")
    rx906_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_911_done
  rxcap_911_fail:
    goto rx906_fail
  rxcap_911_done:
  # rx subrule "O" subtype=capture negate=
    rx906_cur."!cursor_pos"(rx906_pos)
    $P10 = rx906_cur."O"("%autoincrement, :pirop<dec>")
    unless $P10, rx906_fail
    rx906_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx906_pos = $P10."pos"()
  # rx pass
    rx906_cur."!cursor_pass"(rx906_pos, "prefix:sym<-->")
    rx906_cur."!cursor_debug"("PASS  ", "prefix:sym<-->", " at pos=", rx906_pos)
    .return (rx906_cur)
  rx906_fail:
.annotate "line", 390
    (rx906_rep, rx906_pos, $I10, $P10) = rx906_cur."!mark_fail"(0)
    lt rx906_pos, -1, rx906_done
    eq rx906_pos, -1, rx906_fail
    jump $I10
  rx906_done:
    rx906_cur."!cursor_fail"()
    rx906_cur."!cursor_debug"("FAIL  ", "prefix:sym<-->")
    .return (rx906_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<-->"  :subid("226_1259103982.97329") :method
.annotate "line", 390
    $P908 = self."!PREFIX__!subrule"("O", "--")
    new $P909, "ResizablePMCArray"
    push $P909, $P908
    .return ($P909)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<++>"  :subid("227_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx913_tgt
    .local int rx913_pos
    .local int rx913_off
    .local int rx913_eos
    .local int rx913_rep
    .local pmc rx913_cur
    (rx913_cur, rx913_pos, rx913_tgt) = self."!cursor_start"()
    rx913_cur."!cursor_debug"("START ", "postfix:sym<++>")
    .lex unicode:"$\x{a2}", rx913_cur
    .local pmc match
    .lex "$/", match
    length rx913_eos, rx913_tgt
    set rx913_off, 0
    lt rx913_pos, 2, rx913_start
    sub rx913_off, rx913_pos, 1
    substr rx913_tgt, rx913_tgt, rx913_off
  rx913_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan917_done
    goto rxscan917_scan
  rxscan917_loop:
    ($P10) = rx913_cur."from"()
    inc $P10
    set rx913_pos, $P10
    ge rx913_pos, rx913_eos, rxscan917_done
  rxscan917_scan:
    set_addr $I10, rxscan917_loop
    rx913_cur."!mark_push"(0, rx913_pos, $I10)
  rxscan917_done:
.annotate "line", 438
  # rx subcapture "sym"
    set_addr $I10, rxcap_918_fail
    rx913_cur."!mark_push"(0, rx913_pos, $I10)
  # rx literal  "++"
    add $I11, rx913_pos, 2
    gt $I11, rx913_eos, rx913_fail
    sub $I11, rx913_pos, rx913_off
    substr $S10, rx913_tgt, $I11, 2
    ne $S10, "++", rx913_fail
    add rx913_pos, 2
    set_addr $I10, rxcap_918_fail
    ($I12, $I11) = rx913_cur."!mark_peek"($I10)
    rx913_cur."!cursor_pos"($I11)
    ($P10) = rx913_cur."!cursor_start"()
    $P10."!cursor_pass"(rx913_pos, "")
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_918_done
  rxcap_918_fail:
    goto rx913_fail
  rxcap_918_done:
  # rx subrule "O" subtype=capture negate=
    rx913_cur."!cursor_pos"(rx913_pos)
    $P10 = rx913_cur."O"("%autoincrement")
    unless $P10, rx913_fail
    rx913_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx913_pos = $P10."pos"()
  # rx pass
    rx913_cur."!cursor_pass"(rx913_pos, "postfix:sym<++>")
    rx913_cur."!cursor_debug"("PASS  ", "postfix:sym<++>", " at pos=", rx913_pos)
    .return (rx913_cur)
  rx913_fail:
.annotate "line", 390
    (rx913_rep, rx913_pos, $I10, $P10) = rx913_cur."!mark_fail"(0)
    lt rx913_pos, -1, rx913_done
    eq rx913_pos, -1, rx913_fail
    jump $I10
  rx913_done:
    rx913_cur."!cursor_fail"()
    rx913_cur."!cursor_debug"("FAIL  ", "postfix:sym<++>")
    .return (rx913_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<++>"  :subid("228_1259103982.97329") :method
.annotate "line", 390
    $P915 = self."!PREFIX__!subrule"("O", "++")
    new $P916, "ResizablePMCArray"
    push $P916, $P915
    .return ($P916)
.end


.namespace ["NQP";"Grammar"]
.sub "postfix:sym<-->"  :subid("229_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx920_tgt
    .local int rx920_pos
    .local int rx920_off
    .local int rx920_eos
    .local int rx920_rep
    .local pmc rx920_cur
    (rx920_cur, rx920_pos, rx920_tgt) = self."!cursor_start"()
    rx920_cur."!cursor_debug"("START ", "postfix:sym<-->")
    .lex unicode:"$\x{a2}", rx920_cur
    .local pmc match
    .lex "$/", match
    length rx920_eos, rx920_tgt
    set rx920_off, 0
    lt rx920_pos, 2, rx920_start
    sub rx920_off, rx920_pos, 1
    substr rx920_tgt, rx920_tgt, rx920_off
  rx920_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan924_done
    goto rxscan924_scan
  rxscan924_loop:
    ($P10) = rx920_cur."from"()
    inc $P10
    set rx920_pos, $P10
    ge rx920_pos, rx920_eos, rxscan924_done
  rxscan924_scan:
    set_addr $I10, rxscan924_loop
    rx920_cur."!mark_push"(0, rx920_pos, $I10)
  rxscan924_done:
.annotate "line", 439
  # rx subcapture "sym"
    set_addr $I10, rxcap_925_fail
    rx920_cur."!mark_push"(0, rx920_pos, $I10)
  # rx literal  "--"
    add $I11, rx920_pos, 2
    gt $I11, rx920_eos, rx920_fail
    sub $I11, rx920_pos, rx920_off
    substr $S10, rx920_tgt, $I11, 2
    ne $S10, "--", rx920_fail
    add rx920_pos, 2
    set_addr $I10, rxcap_925_fail
    ($I12, $I11) = rx920_cur."!mark_peek"($I10)
    rx920_cur."!cursor_pos"($I11)
    ($P10) = rx920_cur."!cursor_start"()
    $P10."!cursor_pass"(rx920_pos, "")
    rx920_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_925_done
  rxcap_925_fail:
    goto rx920_fail
  rxcap_925_done:
  # rx subrule "O" subtype=capture negate=
    rx920_cur."!cursor_pos"(rx920_pos)
    $P10 = rx920_cur."O"("%autoincrement")
    unless $P10, rx920_fail
    rx920_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx920_pos = $P10."pos"()
  # rx pass
    rx920_cur."!cursor_pass"(rx920_pos, "postfix:sym<-->")
    rx920_cur."!cursor_debug"("PASS  ", "postfix:sym<-->", " at pos=", rx920_pos)
    .return (rx920_cur)
  rx920_fail:
.annotate "line", 390
    (rx920_rep, rx920_pos, $I10, $P10) = rx920_cur."!mark_fail"(0)
    lt rx920_pos, -1, rx920_done
    eq rx920_pos, -1, rx920_fail
    jump $I10
  rx920_done:
    rx920_cur."!cursor_fail"()
    rx920_cur."!cursor_debug"("FAIL  ", "postfix:sym<-->")
    .return (rx920_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__postfix:sym<-->"  :subid("230_1259103982.97329") :method
.annotate "line", 390
    $P922 = self."!PREFIX__!subrule"("O", "--")
    new $P923, "ResizablePMCArray"
    push $P923, $P922
    .return ($P923)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<**>"  :subid("231_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx927_tgt
    .local int rx927_pos
    .local int rx927_off
    .local int rx927_eos
    .local int rx927_rep
    .local pmc rx927_cur
    (rx927_cur, rx927_pos, rx927_tgt) = self."!cursor_start"()
    rx927_cur."!cursor_debug"("START ", "infix:sym<**>")
    .lex unicode:"$\x{a2}", rx927_cur
    .local pmc match
    .lex "$/", match
    length rx927_eos, rx927_tgt
    set rx927_off, 0
    lt rx927_pos, 2, rx927_start
    sub rx927_off, rx927_pos, 1
    substr rx927_tgt, rx927_tgt, rx927_off
  rx927_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan931_done
    goto rxscan931_scan
  rxscan931_loop:
    ($P10) = rx927_cur."from"()
    inc $P10
    set rx927_pos, $P10
    ge rx927_pos, rx927_eos, rxscan931_done
  rxscan931_scan:
    set_addr $I10, rxscan931_loop
    rx927_cur."!mark_push"(0, rx927_pos, $I10)
  rxscan931_done:
.annotate "line", 441
  # rx subcapture "sym"
    set_addr $I10, rxcap_932_fail
    rx927_cur."!mark_push"(0, rx927_pos, $I10)
  # rx literal  "**"
    add $I11, rx927_pos, 2
    gt $I11, rx927_eos, rx927_fail
    sub $I11, rx927_pos, rx927_off
    substr $S10, rx927_tgt, $I11, 2
    ne $S10, "**", rx927_fail
    add rx927_pos, 2
    set_addr $I10, rxcap_932_fail
    ($I12, $I11) = rx927_cur."!mark_peek"($I10)
    rx927_cur."!cursor_pos"($I11)
    ($P10) = rx927_cur."!cursor_start"()
    $P10."!cursor_pass"(rx927_pos, "")
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_932_done
  rxcap_932_fail:
    goto rx927_fail
  rxcap_932_done:
  # rx subrule "O" subtype=capture negate=
    rx927_cur."!cursor_pos"(rx927_pos)
    $P10 = rx927_cur."O"("%exponentiation, :pirop<pow>")
    unless $P10, rx927_fail
    rx927_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx927_pos = $P10."pos"()
  # rx pass
    rx927_cur."!cursor_pass"(rx927_pos, "infix:sym<**>")
    rx927_cur."!cursor_debug"("PASS  ", "infix:sym<**>", " at pos=", rx927_pos)
    .return (rx927_cur)
  rx927_fail:
.annotate "line", 390
    (rx927_rep, rx927_pos, $I10, $P10) = rx927_cur."!mark_fail"(0)
    lt rx927_pos, -1, rx927_done
    eq rx927_pos, -1, rx927_fail
    jump $I10
  rx927_done:
    rx927_cur."!cursor_fail"()
    rx927_cur."!cursor_debug"("FAIL  ", "infix:sym<**>")
    .return (rx927_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<**>"  :subid("232_1259103982.97329") :method
.annotate "line", 390
    $P929 = self."!PREFIX__!subrule"("O", "**")
    new $P930, "ResizablePMCArray"
    push $P930, $P929
    .return ($P930)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<+>"  :subid("233_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx934_tgt
    .local int rx934_pos
    .local int rx934_off
    .local int rx934_eos
    .local int rx934_rep
    .local pmc rx934_cur
    (rx934_cur, rx934_pos, rx934_tgt) = self."!cursor_start"()
    rx934_cur."!cursor_debug"("START ", "prefix:sym<+>")
    .lex unicode:"$\x{a2}", rx934_cur
    .local pmc match
    .lex "$/", match
    length rx934_eos, rx934_tgt
    set rx934_off, 0
    lt rx934_pos, 2, rx934_start
    sub rx934_off, rx934_pos, 1
    substr rx934_tgt, rx934_tgt, rx934_off
  rx934_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan938_done
    goto rxscan938_scan
  rxscan938_loop:
    ($P10) = rx934_cur."from"()
    inc $P10
    set rx934_pos, $P10
    ge rx934_pos, rx934_eos, rxscan938_done
  rxscan938_scan:
    set_addr $I10, rxscan938_loop
    rx934_cur."!mark_push"(0, rx934_pos, $I10)
  rxscan938_done:
.annotate "line", 443
  # rx subcapture "sym"
    set_addr $I10, rxcap_939_fail
    rx934_cur."!mark_push"(0, rx934_pos, $I10)
  # rx literal  "+"
    add $I11, rx934_pos, 1
    gt $I11, rx934_eos, rx934_fail
    sub $I11, rx934_pos, rx934_off
    substr $S10, rx934_tgt, $I11, 1
    ne $S10, "+", rx934_fail
    add rx934_pos, 1
    set_addr $I10, rxcap_939_fail
    ($I12, $I11) = rx934_cur."!mark_peek"($I10)
    rx934_cur."!cursor_pos"($I11)
    ($P10) = rx934_cur."!cursor_start"()
    $P10."!cursor_pass"(rx934_pos, "")
    rx934_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_939_done
  rxcap_939_fail:
    goto rx934_fail
  rxcap_939_done:
  # rx subrule "O" subtype=capture negate=
    rx934_cur."!cursor_pos"(rx934_pos)
    $P10 = rx934_cur."O"("%symbolic_unary, :pirop<set N*>")
    unless $P10, rx934_fail
    rx934_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx934_pos = $P10."pos"()
  # rx pass
    rx934_cur."!cursor_pass"(rx934_pos, "prefix:sym<+>")
    rx934_cur."!cursor_debug"("PASS  ", "prefix:sym<+>", " at pos=", rx934_pos)
    .return (rx934_cur)
  rx934_fail:
.annotate "line", 390
    (rx934_rep, rx934_pos, $I10, $P10) = rx934_cur."!mark_fail"(0)
    lt rx934_pos, -1, rx934_done
    eq rx934_pos, -1, rx934_fail
    jump $I10
  rx934_done:
    rx934_cur."!cursor_fail"()
    rx934_cur."!cursor_debug"("FAIL  ", "prefix:sym<+>")
    .return (rx934_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<+>"  :subid("234_1259103982.97329") :method
.annotate "line", 390
    $P936 = self."!PREFIX__!subrule"("O", "+")
    new $P937, "ResizablePMCArray"
    push $P937, $P936
    .return ($P937)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<~>"  :subid("235_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx941_tgt
    .local int rx941_pos
    .local int rx941_off
    .local int rx941_eos
    .local int rx941_rep
    .local pmc rx941_cur
    (rx941_cur, rx941_pos, rx941_tgt) = self."!cursor_start"()
    rx941_cur."!cursor_debug"("START ", "prefix:sym<~>")
    .lex unicode:"$\x{a2}", rx941_cur
    .local pmc match
    .lex "$/", match
    length rx941_eos, rx941_tgt
    set rx941_off, 0
    lt rx941_pos, 2, rx941_start
    sub rx941_off, rx941_pos, 1
    substr rx941_tgt, rx941_tgt, rx941_off
  rx941_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan945_done
    goto rxscan945_scan
  rxscan945_loop:
    ($P10) = rx941_cur."from"()
    inc $P10
    set rx941_pos, $P10
    ge rx941_pos, rx941_eos, rxscan945_done
  rxscan945_scan:
    set_addr $I10, rxscan945_loop
    rx941_cur."!mark_push"(0, rx941_pos, $I10)
  rxscan945_done:
.annotate "line", 444
  # rx subcapture "sym"
    set_addr $I10, rxcap_946_fail
    rx941_cur."!mark_push"(0, rx941_pos, $I10)
  # rx literal  "~"
    add $I11, rx941_pos, 1
    gt $I11, rx941_eos, rx941_fail
    sub $I11, rx941_pos, rx941_off
    substr $S10, rx941_tgt, $I11, 1
    ne $S10, "~", rx941_fail
    add rx941_pos, 1
    set_addr $I10, rxcap_946_fail
    ($I12, $I11) = rx941_cur."!mark_peek"($I10)
    rx941_cur."!cursor_pos"($I11)
    ($P10) = rx941_cur."!cursor_start"()
    $P10."!cursor_pass"(rx941_pos, "")
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_946_done
  rxcap_946_fail:
    goto rx941_fail
  rxcap_946_done:
  # rx subrule "O" subtype=capture negate=
    rx941_cur."!cursor_pos"(rx941_pos)
    $P10 = rx941_cur."O"("%symbolic_unary, :pirop<set S*>")
    unless $P10, rx941_fail
    rx941_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx941_pos = $P10."pos"()
  # rx pass
    rx941_cur."!cursor_pass"(rx941_pos, "prefix:sym<~>")
    rx941_cur."!cursor_debug"("PASS  ", "prefix:sym<~>", " at pos=", rx941_pos)
    .return (rx941_cur)
  rx941_fail:
.annotate "line", 390
    (rx941_rep, rx941_pos, $I10, $P10) = rx941_cur."!mark_fail"(0)
    lt rx941_pos, -1, rx941_done
    eq rx941_pos, -1, rx941_fail
    jump $I10
  rx941_done:
    rx941_cur."!cursor_fail"()
    rx941_cur."!cursor_debug"("FAIL  ", "prefix:sym<~>")
    .return (rx941_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<~>"  :subid("236_1259103982.97329") :method
.annotate "line", 390
    $P943 = self."!PREFIX__!subrule"("O", "~")
    new $P944, "ResizablePMCArray"
    push $P944, $P943
    .return ($P944)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<->"  :subid("237_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx948_tgt
    .local int rx948_pos
    .local int rx948_off
    .local int rx948_eos
    .local int rx948_rep
    .local pmc rx948_cur
    (rx948_cur, rx948_pos, rx948_tgt) = self."!cursor_start"()
    rx948_cur."!cursor_debug"("START ", "prefix:sym<->")
    .lex unicode:"$\x{a2}", rx948_cur
    .local pmc match
    .lex "$/", match
    length rx948_eos, rx948_tgt
    set rx948_off, 0
    lt rx948_pos, 2, rx948_start
    sub rx948_off, rx948_pos, 1
    substr rx948_tgt, rx948_tgt, rx948_off
  rx948_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan951_done
    goto rxscan951_scan
  rxscan951_loop:
    ($P10) = rx948_cur."from"()
    inc $P10
    set rx948_pos, $P10
    ge rx948_pos, rx948_eos, rxscan951_done
  rxscan951_scan:
    set_addr $I10, rxscan951_loop
    rx948_cur."!mark_push"(0, rx948_pos, $I10)
  rxscan951_done:
.annotate "line", 445
  # rx subcapture "sym"
    set_addr $I10, rxcap_952_fail
    rx948_cur."!mark_push"(0, rx948_pos, $I10)
  # rx literal  "-"
    add $I11, rx948_pos, 1
    gt $I11, rx948_eos, rx948_fail
    sub $I11, rx948_pos, rx948_off
    substr $S10, rx948_tgt, $I11, 1
    ne $S10, "-", rx948_fail
    add rx948_pos, 1
    set_addr $I10, rxcap_952_fail
    ($I12, $I11) = rx948_cur."!mark_peek"($I10)
    rx948_cur."!cursor_pos"($I11)
    ($P10) = rx948_cur."!cursor_start"()
    $P10."!cursor_pass"(rx948_pos, "")
    rx948_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_952_done
  rxcap_952_fail:
    goto rx948_fail
  rxcap_952_done:
  # rx enumcharlist negate=1 zerowidth
    ge rx948_pos, rx948_eos, rx948_fail
    sub $I10, rx948_pos, rx948_off
    substr $S10, rx948_tgt, $I10, 1
    index $I11, ">", $S10
    ge $I11, 0, rx948_fail
  # rx subrule "number" subtype=zerowidth negate=1
    rx948_cur."!cursor_pos"(rx948_pos)
    $P10 = rx948_cur."number"()
    if $P10, rx948_fail
  # rx subrule "O" subtype=capture negate=
    rx948_cur."!cursor_pos"(rx948_pos)
    $P10 = rx948_cur."O"("%symbolic_unary, :pirop<neg>")
    unless $P10, rx948_fail
    rx948_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx948_pos = $P10."pos"()
  # rx pass
    rx948_cur."!cursor_pass"(rx948_pos, "prefix:sym<->")
    rx948_cur."!cursor_debug"("PASS  ", "prefix:sym<->", " at pos=", rx948_pos)
    .return (rx948_cur)
  rx948_fail:
.annotate "line", 390
    (rx948_rep, rx948_pos, $I10, $P10) = rx948_cur."!mark_fail"(0)
    lt rx948_pos, -1, rx948_done
    eq rx948_pos, -1, rx948_fail
    jump $I10
  rx948_done:
    rx948_cur."!cursor_fail"()
    rx948_cur."!cursor_debug"("FAIL  ", "prefix:sym<->")
    .return (rx948_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<->"  :subid("238_1259103982.97329") :method
.annotate "line", 390
    new $P950, "ResizablePMCArray"
    push $P950, "-"
    .return ($P950)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<?>"  :subid("239_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx954_tgt
    .local int rx954_pos
    .local int rx954_off
    .local int rx954_eos
    .local int rx954_rep
    .local pmc rx954_cur
    (rx954_cur, rx954_pos, rx954_tgt) = self."!cursor_start"()
    rx954_cur."!cursor_debug"("START ", "prefix:sym<?>")
    .lex unicode:"$\x{a2}", rx954_cur
    .local pmc match
    .lex "$/", match
    length rx954_eos, rx954_tgt
    set rx954_off, 0
    lt rx954_pos, 2, rx954_start
    sub rx954_off, rx954_pos, 1
    substr rx954_tgt, rx954_tgt, rx954_off
  rx954_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan958_done
    goto rxscan958_scan
  rxscan958_loop:
    ($P10) = rx954_cur."from"()
    inc $P10
    set rx954_pos, $P10
    ge rx954_pos, rx954_eos, rxscan958_done
  rxscan958_scan:
    set_addr $I10, rxscan958_loop
    rx954_cur."!mark_push"(0, rx954_pos, $I10)
  rxscan958_done:
.annotate "line", 446
  # rx subcapture "sym"
    set_addr $I10, rxcap_959_fail
    rx954_cur."!mark_push"(0, rx954_pos, $I10)
  # rx literal  "?"
    add $I11, rx954_pos, 1
    gt $I11, rx954_eos, rx954_fail
    sub $I11, rx954_pos, rx954_off
    substr $S10, rx954_tgt, $I11, 1
    ne $S10, "?", rx954_fail
    add rx954_pos, 1
    set_addr $I10, rxcap_959_fail
    ($I12, $I11) = rx954_cur."!mark_peek"($I10)
    rx954_cur."!cursor_pos"($I11)
    ($P10) = rx954_cur."!cursor_start"()
    $P10."!cursor_pass"(rx954_pos, "")
    rx954_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_959_done
  rxcap_959_fail:
    goto rx954_fail
  rxcap_959_done:
  # rx subrule "O" subtype=capture negate=
    rx954_cur."!cursor_pos"(rx954_pos)
    $P10 = rx954_cur."O"("%symbolic_unary, :pirop<istrue>")
    unless $P10, rx954_fail
    rx954_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx954_pos = $P10."pos"()
  # rx pass
    rx954_cur."!cursor_pass"(rx954_pos, "prefix:sym<?>")
    rx954_cur."!cursor_debug"("PASS  ", "prefix:sym<?>", " at pos=", rx954_pos)
    .return (rx954_cur)
  rx954_fail:
.annotate "line", 390
    (rx954_rep, rx954_pos, $I10, $P10) = rx954_cur."!mark_fail"(0)
    lt rx954_pos, -1, rx954_done
    eq rx954_pos, -1, rx954_fail
    jump $I10
  rx954_done:
    rx954_cur."!cursor_fail"()
    rx954_cur."!cursor_debug"("FAIL  ", "prefix:sym<?>")
    .return (rx954_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<?>"  :subid("240_1259103982.97329") :method
.annotate "line", 390
    $P956 = self."!PREFIX__!subrule"("O", "?")
    new $P957, "ResizablePMCArray"
    push $P957, $P956
    .return ($P957)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<!>"  :subid("241_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx961_tgt
    .local int rx961_pos
    .local int rx961_off
    .local int rx961_eos
    .local int rx961_rep
    .local pmc rx961_cur
    (rx961_cur, rx961_pos, rx961_tgt) = self."!cursor_start"()
    rx961_cur."!cursor_debug"("START ", "prefix:sym<!>")
    .lex unicode:"$\x{a2}", rx961_cur
    .local pmc match
    .lex "$/", match
    length rx961_eos, rx961_tgt
    set rx961_off, 0
    lt rx961_pos, 2, rx961_start
    sub rx961_off, rx961_pos, 1
    substr rx961_tgt, rx961_tgt, rx961_off
  rx961_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan965_done
    goto rxscan965_scan
  rxscan965_loop:
    ($P10) = rx961_cur."from"()
    inc $P10
    set rx961_pos, $P10
    ge rx961_pos, rx961_eos, rxscan965_done
  rxscan965_scan:
    set_addr $I10, rxscan965_loop
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  rxscan965_done:
.annotate "line", 447
  # rx subcapture "sym"
    set_addr $I10, rxcap_966_fail
    rx961_cur."!mark_push"(0, rx961_pos, $I10)
  # rx literal  "!"
    add $I11, rx961_pos, 1
    gt $I11, rx961_eos, rx961_fail
    sub $I11, rx961_pos, rx961_off
    substr $S10, rx961_tgt, $I11, 1
    ne $S10, "!", rx961_fail
    add rx961_pos, 1
    set_addr $I10, rxcap_966_fail
    ($I12, $I11) = rx961_cur."!mark_peek"($I10)
    rx961_cur."!cursor_pos"($I11)
    ($P10) = rx961_cur."!cursor_start"()
    $P10."!cursor_pass"(rx961_pos, "")
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_966_done
  rxcap_966_fail:
    goto rx961_fail
  rxcap_966_done:
  # rx subrule "O" subtype=capture negate=
    rx961_cur."!cursor_pos"(rx961_pos)
    $P10 = rx961_cur."O"("%symbolic_unary, :pirop<isfalse>")
    unless $P10, rx961_fail
    rx961_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx961_pos = $P10."pos"()
  # rx pass
    rx961_cur."!cursor_pass"(rx961_pos, "prefix:sym<!>")
    rx961_cur."!cursor_debug"("PASS  ", "prefix:sym<!>", " at pos=", rx961_pos)
    .return (rx961_cur)
  rx961_fail:
.annotate "line", 390
    (rx961_rep, rx961_pos, $I10, $P10) = rx961_cur."!mark_fail"(0)
    lt rx961_pos, -1, rx961_done
    eq rx961_pos, -1, rx961_fail
    jump $I10
  rx961_done:
    rx961_cur."!cursor_fail"()
    rx961_cur."!cursor_debug"("FAIL  ", "prefix:sym<!>")
    .return (rx961_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<!>"  :subid("242_1259103982.97329") :method
.annotate "line", 390
    $P963 = self."!PREFIX__!subrule"("O", "!")
    new $P964, "ResizablePMCArray"
    push $P964, $P963
    .return ($P964)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<|>"  :subid("243_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx968_tgt
    .local int rx968_pos
    .local int rx968_off
    .local int rx968_eos
    .local int rx968_rep
    .local pmc rx968_cur
    (rx968_cur, rx968_pos, rx968_tgt) = self."!cursor_start"()
    rx968_cur."!cursor_debug"("START ", "prefix:sym<|>")
    .lex unicode:"$\x{a2}", rx968_cur
    .local pmc match
    .lex "$/", match
    length rx968_eos, rx968_tgt
    set rx968_off, 0
    lt rx968_pos, 2, rx968_start
    sub rx968_off, rx968_pos, 1
    substr rx968_tgt, rx968_tgt, rx968_off
  rx968_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan972_done
    goto rxscan972_scan
  rxscan972_loop:
    ($P10) = rx968_cur."from"()
    inc $P10
    set rx968_pos, $P10
    ge rx968_pos, rx968_eos, rxscan972_done
  rxscan972_scan:
    set_addr $I10, rxscan972_loop
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  rxscan972_done:
.annotate "line", 448
  # rx subcapture "sym"
    set_addr $I10, rxcap_973_fail
    rx968_cur."!mark_push"(0, rx968_pos, $I10)
  # rx literal  "|"
    add $I11, rx968_pos, 1
    gt $I11, rx968_eos, rx968_fail
    sub $I11, rx968_pos, rx968_off
    substr $S10, rx968_tgt, $I11, 1
    ne $S10, "|", rx968_fail
    add rx968_pos, 1
    set_addr $I10, rxcap_973_fail
    ($I12, $I11) = rx968_cur."!mark_peek"($I10)
    rx968_cur."!cursor_pos"($I11)
    ($P10) = rx968_cur."!cursor_start"()
    $P10."!cursor_pass"(rx968_pos, "")
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_973_done
  rxcap_973_fail:
    goto rx968_fail
  rxcap_973_done:
  # rx subrule "O" subtype=capture negate=
    rx968_cur."!cursor_pos"(rx968_pos)
    $P10 = rx968_cur."O"("%symbolic_unary")
    unless $P10, rx968_fail
    rx968_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx968_pos = $P10."pos"()
  # rx pass
    rx968_cur."!cursor_pass"(rx968_pos, "prefix:sym<|>")
    rx968_cur."!cursor_debug"("PASS  ", "prefix:sym<|>", " at pos=", rx968_pos)
    .return (rx968_cur)
  rx968_fail:
.annotate "line", 390
    (rx968_rep, rx968_pos, $I10, $P10) = rx968_cur."!mark_fail"(0)
    lt rx968_pos, -1, rx968_done
    eq rx968_pos, -1, rx968_fail
    jump $I10
  rx968_done:
    rx968_cur."!cursor_fail"()
    rx968_cur."!cursor_debug"("FAIL  ", "prefix:sym<|>")
    .return (rx968_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<|>"  :subid("244_1259103982.97329") :method
.annotate "line", 390
    $P970 = self."!PREFIX__!subrule"("O", "|")
    new $P971, "ResizablePMCArray"
    push $P971, $P970
    .return ($P971)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<*>"  :subid("245_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx975_tgt
    .local int rx975_pos
    .local int rx975_off
    .local int rx975_eos
    .local int rx975_rep
    .local pmc rx975_cur
    (rx975_cur, rx975_pos, rx975_tgt) = self."!cursor_start"()
    rx975_cur."!cursor_debug"("START ", "infix:sym<*>")
    .lex unicode:"$\x{a2}", rx975_cur
    .local pmc match
    .lex "$/", match
    length rx975_eos, rx975_tgt
    set rx975_off, 0
    lt rx975_pos, 2, rx975_start
    sub rx975_off, rx975_pos, 1
    substr rx975_tgt, rx975_tgt, rx975_off
  rx975_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan979_done
    goto rxscan979_scan
  rxscan979_loop:
    ($P10) = rx975_cur."from"()
    inc $P10
    set rx975_pos, $P10
    ge rx975_pos, rx975_eos, rxscan979_done
  rxscan979_scan:
    set_addr $I10, rxscan979_loop
    rx975_cur."!mark_push"(0, rx975_pos, $I10)
  rxscan979_done:
.annotate "line", 450
  # rx subcapture "sym"
    set_addr $I10, rxcap_980_fail
    rx975_cur."!mark_push"(0, rx975_pos, $I10)
  # rx literal  "*"
    add $I11, rx975_pos, 1
    gt $I11, rx975_eos, rx975_fail
    sub $I11, rx975_pos, rx975_off
    substr $S10, rx975_tgt, $I11, 1
    ne $S10, "*", rx975_fail
    add rx975_pos, 1
    set_addr $I10, rxcap_980_fail
    ($I12, $I11) = rx975_cur."!mark_peek"($I10)
    rx975_cur."!cursor_pos"($I11)
    ($P10) = rx975_cur."!cursor_start"()
    $P10."!cursor_pass"(rx975_pos, "")
    rx975_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_980_done
  rxcap_980_fail:
    goto rx975_fail
  rxcap_980_done:
  # rx subrule "O" subtype=capture negate=
    rx975_cur."!cursor_pos"(rx975_pos)
    $P10 = rx975_cur."O"("%multiplicative, :pirop<mul>")
    unless $P10, rx975_fail
    rx975_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx975_pos = $P10."pos"()
  # rx pass
    rx975_cur."!cursor_pass"(rx975_pos, "infix:sym<*>")
    rx975_cur."!cursor_debug"("PASS  ", "infix:sym<*>", " at pos=", rx975_pos)
    .return (rx975_cur)
  rx975_fail:
.annotate "line", 390
    (rx975_rep, rx975_pos, $I10, $P10) = rx975_cur."!mark_fail"(0)
    lt rx975_pos, -1, rx975_done
    eq rx975_pos, -1, rx975_fail
    jump $I10
  rx975_done:
    rx975_cur."!cursor_fail"()
    rx975_cur."!cursor_debug"("FAIL  ", "infix:sym<*>")
    .return (rx975_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<*>"  :subid("246_1259103982.97329") :method
.annotate "line", 390
    $P977 = self."!PREFIX__!subrule"("O", "*")
    new $P978, "ResizablePMCArray"
    push $P978, $P977
    .return ($P978)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym</>"  :subid("247_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx982_tgt
    .local int rx982_pos
    .local int rx982_off
    .local int rx982_eos
    .local int rx982_rep
    .local pmc rx982_cur
    (rx982_cur, rx982_pos, rx982_tgt) = self."!cursor_start"()
    rx982_cur."!cursor_debug"("START ", "infix:sym</>")
    .lex unicode:"$\x{a2}", rx982_cur
    .local pmc match
    .lex "$/", match
    length rx982_eos, rx982_tgt
    set rx982_off, 0
    lt rx982_pos, 2, rx982_start
    sub rx982_off, rx982_pos, 1
    substr rx982_tgt, rx982_tgt, rx982_off
  rx982_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan986_done
    goto rxscan986_scan
  rxscan986_loop:
    ($P10) = rx982_cur."from"()
    inc $P10
    set rx982_pos, $P10
    ge rx982_pos, rx982_eos, rxscan986_done
  rxscan986_scan:
    set_addr $I10, rxscan986_loop
    rx982_cur."!mark_push"(0, rx982_pos, $I10)
  rxscan986_done:
.annotate "line", 451
  # rx subcapture "sym"
    set_addr $I10, rxcap_987_fail
    rx982_cur."!mark_push"(0, rx982_pos, $I10)
  # rx literal  "/"
    add $I11, rx982_pos, 1
    gt $I11, rx982_eos, rx982_fail
    sub $I11, rx982_pos, rx982_off
    substr $S10, rx982_tgt, $I11, 1
    ne $S10, "/", rx982_fail
    add rx982_pos, 1
    set_addr $I10, rxcap_987_fail
    ($I12, $I11) = rx982_cur."!mark_peek"($I10)
    rx982_cur."!cursor_pos"($I11)
    ($P10) = rx982_cur."!cursor_start"()
    $P10."!cursor_pass"(rx982_pos, "")
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_987_done
  rxcap_987_fail:
    goto rx982_fail
  rxcap_987_done:
  # rx subrule "O" subtype=capture negate=
    rx982_cur."!cursor_pos"(rx982_pos)
    $P10 = rx982_cur."O"("%multiplicative, :pirop<div>")
    unless $P10, rx982_fail
    rx982_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx982_pos = $P10."pos"()
  # rx pass
    rx982_cur."!cursor_pass"(rx982_pos, "infix:sym</>")
    rx982_cur."!cursor_debug"("PASS  ", "infix:sym</>", " at pos=", rx982_pos)
    .return (rx982_cur)
  rx982_fail:
.annotate "line", 390
    (rx982_rep, rx982_pos, $I10, $P10) = rx982_cur."!mark_fail"(0)
    lt rx982_pos, -1, rx982_done
    eq rx982_pos, -1, rx982_fail
    jump $I10
  rx982_done:
    rx982_cur."!cursor_fail"()
    rx982_cur."!cursor_debug"("FAIL  ", "infix:sym</>")
    .return (rx982_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym</>"  :subid("248_1259103982.97329") :method
.annotate "line", 390
    $P984 = self."!PREFIX__!subrule"("O", "/")
    new $P985, "ResizablePMCArray"
    push $P985, $P984
    .return ($P985)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<%>"  :subid("249_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx989_tgt
    .local int rx989_pos
    .local int rx989_off
    .local int rx989_eos
    .local int rx989_rep
    .local pmc rx989_cur
    (rx989_cur, rx989_pos, rx989_tgt) = self."!cursor_start"()
    rx989_cur."!cursor_debug"("START ", "infix:sym<%>")
    .lex unicode:"$\x{a2}", rx989_cur
    .local pmc match
    .lex "$/", match
    length rx989_eos, rx989_tgt
    set rx989_off, 0
    lt rx989_pos, 2, rx989_start
    sub rx989_off, rx989_pos, 1
    substr rx989_tgt, rx989_tgt, rx989_off
  rx989_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan993_done
    goto rxscan993_scan
  rxscan993_loop:
    ($P10) = rx989_cur."from"()
    inc $P10
    set rx989_pos, $P10
    ge rx989_pos, rx989_eos, rxscan993_done
  rxscan993_scan:
    set_addr $I10, rxscan993_loop
    rx989_cur."!mark_push"(0, rx989_pos, $I10)
  rxscan993_done:
.annotate "line", 452
  # rx subcapture "sym"
    set_addr $I10, rxcap_994_fail
    rx989_cur."!mark_push"(0, rx989_pos, $I10)
  # rx literal  "%"
    add $I11, rx989_pos, 1
    gt $I11, rx989_eos, rx989_fail
    sub $I11, rx989_pos, rx989_off
    substr $S10, rx989_tgt, $I11, 1
    ne $S10, "%", rx989_fail
    add rx989_pos, 1
    set_addr $I10, rxcap_994_fail
    ($I12, $I11) = rx989_cur."!mark_peek"($I10)
    rx989_cur."!cursor_pos"($I11)
    ($P10) = rx989_cur."!cursor_start"()
    $P10."!cursor_pass"(rx989_pos, "")
    rx989_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_994_done
  rxcap_994_fail:
    goto rx989_fail
  rxcap_994_done:
  # rx subrule "O" subtype=capture negate=
    rx989_cur."!cursor_pos"(rx989_pos)
    $P10 = rx989_cur."O"("%multiplicative, :pirop<mod>")
    unless $P10, rx989_fail
    rx989_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx989_pos = $P10."pos"()
  # rx pass
    rx989_cur."!cursor_pass"(rx989_pos, "infix:sym<%>")
    rx989_cur."!cursor_debug"("PASS  ", "infix:sym<%>", " at pos=", rx989_pos)
    .return (rx989_cur)
  rx989_fail:
.annotate "line", 390
    (rx989_rep, rx989_pos, $I10, $P10) = rx989_cur."!mark_fail"(0)
    lt rx989_pos, -1, rx989_done
    eq rx989_pos, -1, rx989_fail
    jump $I10
  rx989_done:
    rx989_cur."!cursor_fail"()
    rx989_cur."!cursor_debug"("FAIL  ", "infix:sym<%>")
    .return (rx989_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<%>"  :subid("250_1259103982.97329") :method
.annotate "line", 390
    $P991 = self."!PREFIX__!subrule"("O", "%")
    new $P992, "ResizablePMCArray"
    push $P992, $P991
    .return ($P992)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<+>"  :subid("251_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx996_tgt
    .local int rx996_pos
    .local int rx996_off
    .local int rx996_eos
    .local int rx996_rep
    .local pmc rx996_cur
    (rx996_cur, rx996_pos, rx996_tgt) = self."!cursor_start"()
    rx996_cur."!cursor_debug"("START ", "infix:sym<+>")
    .lex unicode:"$\x{a2}", rx996_cur
    .local pmc match
    .lex "$/", match
    length rx996_eos, rx996_tgt
    set rx996_off, 0
    lt rx996_pos, 2, rx996_start
    sub rx996_off, rx996_pos, 1
    substr rx996_tgt, rx996_tgt, rx996_off
  rx996_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1000_done
    goto rxscan1000_scan
  rxscan1000_loop:
    ($P10) = rx996_cur."from"()
    inc $P10
    set rx996_pos, $P10
    ge rx996_pos, rx996_eos, rxscan1000_done
  rxscan1000_scan:
    set_addr $I10, rxscan1000_loop
    rx996_cur."!mark_push"(0, rx996_pos, $I10)
  rxscan1000_done:
.annotate "line", 454
  # rx subcapture "sym"
    set_addr $I10, rxcap_1001_fail
    rx996_cur."!mark_push"(0, rx996_pos, $I10)
  # rx literal  "+"
    add $I11, rx996_pos, 1
    gt $I11, rx996_eos, rx996_fail
    sub $I11, rx996_pos, rx996_off
    substr $S10, rx996_tgt, $I11, 1
    ne $S10, "+", rx996_fail
    add rx996_pos, 1
    set_addr $I10, rxcap_1001_fail
    ($I12, $I11) = rx996_cur."!mark_peek"($I10)
    rx996_cur."!cursor_pos"($I11)
    ($P10) = rx996_cur."!cursor_start"()
    $P10."!cursor_pass"(rx996_pos, "")
    rx996_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1001_done
  rxcap_1001_fail:
    goto rx996_fail
  rxcap_1001_done:
  # rx subrule "O" subtype=capture negate=
    rx996_cur."!cursor_pos"(rx996_pos)
    $P10 = rx996_cur."O"("%additive, :pirop<add>")
    unless $P10, rx996_fail
    rx996_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx996_pos = $P10."pos"()
  # rx pass
    rx996_cur."!cursor_pass"(rx996_pos, "infix:sym<+>")
    rx996_cur."!cursor_debug"("PASS  ", "infix:sym<+>", " at pos=", rx996_pos)
    .return (rx996_cur)
  rx996_fail:
.annotate "line", 390
    (rx996_rep, rx996_pos, $I10, $P10) = rx996_cur."!mark_fail"(0)
    lt rx996_pos, -1, rx996_done
    eq rx996_pos, -1, rx996_fail
    jump $I10
  rx996_done:
    rx996_cur."!cursor_fail"()
    rx996_cur."!cursor_debug"("FAIL  ", "infix:sym<+>")
    .return (rx996_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<+>"  :subid("252_1259103982.97329") :method
.annotate "line", 390
    $P998 = self."!PREFIX__!subrule"("O", "+")
    new $P999, "ResizablePMCArray"
    push $P999, $P998
    .return ($P999)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<->"  :subid("253_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1003_tgt
    .local int rx1003_pos
    .local int rx1003_off
    .local int rx1003_eos
    .local int rx1003_rep
    .local pmc rx1003_cur
    (rx1003_cur, rx1003_pos, rx1003_tgt) = self."!cursor_start"()
    rx1003_cur."!cursor_debug"("START ", "infix:sym<->")
    .lex unicode:"$\x{a2}", rx1003_cur
    .local pmc match
    .lex "$/", match
    length rx1003_eos, rx1003_tgt
    set rx1003_off, 0
    lt rx1003_pos, 2, rx1003_start
    sub rx1003_off, rx1003_pos, 1
    substr rx1003_tgt, rx1003_tgt, rx1003_off
  rx1003_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1007_done
    goto rxscan1007_scan
  rxscan1007_loop:
    ($P10) = rx1003_cur."from"()
    inc $P10
    set rx1003_pos, $P10
    ge rx1003_pos, rx1003_eos, rxscan1007_done
  rxscan1007_scan:
    set_addr $I10, rxscan1007_loop
    rx1003_cur."!mark_push"(0, rx1003_pos, $I10)
  rxscan1007_done:
.annotate "line", 455
  # rx subcapture "sym"
    set_addr $I10, rxcap_1008_fail
    rx1003_cur."!mark_push"(0, rx1003_pos, $I10)
  # rx literal  "-"
    add $I11, rx1003_pos, 1
    gt $I11, rx1003_eos, rx1003_fail
    sub $I11, rx1003_pos, rx1003_off
    substr $S10, rx1003_tgt, $I11, 1
    ne $S10, "-", rx1003_fail
    add rx1003_pos, 1
    set_addr $I10, rxcap_1008_fail
    ($I12, $I11) = rx1003_cur."!mark_peek"($I10)
    rx1003_cur."!cursor_pos"($I11)
    ($P10) = rx1003_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1003_pos, "")
    rx1003_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1008_done
  rxcap_1008_fail:
    goto rx1003_fail
  rxcap_1008_done:
  # rx subrule "O" subtype=capture negate=
    rx1003_cur."!cursor_pos"(rx1003_pos)
    $P10 = rx1003_cur."O"("%additive, :pirop<sub>")
    unless $P10, rx1003_fail
    rx1003_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1003_pos = $P10."pos"()
  # rx pass
    rx1003_cur."!cursor_pass"(rx1003_pos, "infix:sym<->")
    rx1003_cur."!cursor_debug"("PASS  ", "infix:sym<->", " at pos=", rx1003_pos)
    .return (rx1003_cur)
  rx1003_fail:
.annotate "line", 390
    (rx1003_rep, rx1003_pos, $I10, $P10) = rx1003_cur."!mark_fail"(0)
    lt rx1003_pos, -1, rx1003_done
    eq rx1003_pos, -1, rx1003_fail
    jump $I10
  rx1003_done:
    rx1003_cur."!cursor_fail"()
    rx1003_cur."!cursor_debug"("FAIL  ", "infix:sym<->")
    .return (rx1003_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<->"  :subid("254_1259103982.97329") :method
.annotate "line", 390
    $P1005 = self."!PREFIX__!subrule"("O", "-")
    new $P1006, "ResizablePMCArray"
    push $P1006, $P1005
    .return ($P1006)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<~>"  :subid("255_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1010_tgt
    .local int rx1010_pos
    .local int rx1010_off
    .local int rx1010_eos
    .local int rx1010_rep
    .local pmc rx1010_cur
    (rx1010_cur, rx1010_pos, rx1010_tgt) = self."!cursor_start"()
    rx1010_cur."!cursor_debug"("START ", "infix:sym<~>")
    .lex unicode:"$\x{a2}", rx1010_cur
    .local pmc match
    .lex "$/", match
    length rx1010_eos, rx1010_tgt
    set rx1010_off, 0
    lt rx1010_pos, 2, rx1010_start
    sub rx1010_off, rx1010_pos, 1
    substr rx1010_tgt, rx1010_tgt, rx1010_off
  rx1010_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1014_done
    goto rxscan1014_scan
  rxscan1014_loop:
    ($P10) = rx1010_cur."from"()
    inc $P10
    set rx1010_pos, $P10
    ge rx1010_pos, rx1010_eos, rxscan1014_done
  rxscan1014_scan:
    set_addr $I10, rxscan1014_loop
    rx1010_cur."!mark_push"(0, rx1010_pos, $I10)
  rxscan1014_done:
.annotate "line", 457
  # rx subcapture "sym"
    set_addr $I10, rxcap_1015_fail
    rx1010_cur."!mark_push"(0, rx1010_pos, $I10)
  # rx literal  "~"
    add $I11, rx1010_pos, 1
    gt $I11, rx1010_eos, rx1010_fail
    sub $I11, rx1010_pos, rx1010_off
    substr $S10, rx1010_tgt, $I11, 1
    ne $S10, "~", rx1010_fail
    add rx1010_pos, 1
    set_addr $I10, rxcap_1015_fail
    ($I12, $I11) = rx1010_cur."!mark_peek"($I10)
    rx1010_cur."!cursor_pos"($I11)
    ($P10) = rx1010_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1010_pos, "")
    rx1010_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1015_done
  rxcap_1015_fail:
    goto rx1010_fail
  rxcap_1015_done:
  # rx subrule "O" subtype=capture negate=
    rx1010_cur."!cursor_pos"(rx1010_pos)
    $P10 = rx1010_cur."O"("%concatenation , :pirop<concat>")
    unless $P10, rx1010_fail
    rx1010_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1010_pos = $P10."pos"()
  # rx pass
    rx1010_cur."!cursor_pass"(rx1010_pos, "infix:sym<~>")
    rx1010_cur."!cursor_debug"("PASS  ", "infix:sym<~>", " at pos=", rx1010_pos)
    .return (rx1010_cur)
  rx1010_fail:
.annotate "line", 390
    (rx1010_rep, rx1010_pos, $I10, $P10) = rx1010_cur."!mark_fail"(0)
    lt rx1010_pos, -1, rx1010_done
    eq rx1010_pos, -1, rx1010_fail
    jump $I10
  rx1010_done:
    rx1010_cur."!cursor_fail"()
    rx1010_cur."!cursor_debug"("FAIL  ", "infix:sym<~>")
    .return (rx1010_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<~>"  :subid("256_1259103982.97329") :method
.annotate "line", 390
    $P1012 = self."!PREFIX__!subrule"("O", "~")
    new $P1013, "ResizablePMCArray"
    push $P1013, $P1012
    .return ($P1013)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<==>"  :subid("257_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1017_tgt
    .local int rx1017_pos
    .local int rx1017_off
    .local int rx1017_eos
    .local int rx1017_rep
    .local pmc rx1017_cur
    (rx1017_cur, rx1017_pos, rx1017_tgt) = self."!cursor_start"()
    rx1017_cur."!cursor_debug"("START ", "infix:sym<==>")
    .lex unicode:"$\x{a2}", rx1017_cur
    .local pmc match
    .lex "$/", match
    length rx1017_eos, rx1017_tgt
    set rx1017_off, 0
    lt rx1017_pos, 2, rx1017_start
    sub rx1017_off, rx1017_pos, 1
    substr rx1017_tgt, rx1017_tgt, rx1017_off
  rx1017_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1021_done
    goto rxscan1021_scan
  rxscan1021_loop:
    ($P10) = rx1017_cur."from"()
    inc $P10
    set rx1017_pos, $P10
    ge rx1017_pos, rx1017_eos, rxscan1021_done
  rxscan1021_scan:
    set_addr $I10, rxscan1021_loop
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10)
  rxscan1021_done:
.annotate "line", 459
  # rx subcapture "sym"
    set_addr $I10, rxcap_1022_fail
    rx1017_cur."!mark_push"(0, rx1017_pos, $I10)
  # rx literal  "=="
    add $I11, rx1017_pos, 2
    gt $I11, rx1017_eos, rx1017_fail
    sub $I11, rx1017_pos, rx1017_off
    substr $S10, rx1017_tgt, $I11, 2
    ne $S10, "==", rx1017_fail
    add rx1017_pos, 2
    set_addr $I10, rxcap_1022_fail
    ($I12, $I11) = rx1017_cur."!mark_peek"($I10)
    rx1017_cur."!cursor_pos"($I11)
    ($P10) = rx1017_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1017_pos, "")
    rx1017_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1022_done
  rxcap_1022_fail:
    goto rx1017_fail
  rxcap_1022_done:
  # rx subrule "O" subtype=capture negate=
    rx1017_cur."!cursor_pos"(rx1017_pos)
    $P10 = rx1017_cur."O"("%relational, :pirop<iseq INn>")
    unless $P10, rx1017_fail
    rx1017_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1017_pos = $P10."pos"()
  # rx pass
    rx1017_cur."!cursor_pass"(rx1017_pos, "infix:sym<==>")
    rx1017_cur."!cursor_debug"("PASS  ", "infix:sym<==>", " at pos=", rx1017_pos)
    .return (rx1017_cur)
  rx1017_fail:
.annotate "line", 390
    (rx1017_rep, rx1017_pos, $I10, $P10) = rx1017_cur."!mark_fail"(0)
    lt rx1017_pos, -1, rx1017_done
    eq rx1017_pos, -1, rx1017_fail
    jump $I10
  rx1017_done:
    rx1017_cur."!cursor_fail"()
    rx1017_cur."!cursor_debug"("FAIL  ", "infix:sym<==>")
    .return (rx1017_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<==>"  :subid("258_1259103982.97329") :method
.annotate "line", 390
    $P1019 = self."!PREFIX__!subrule"("O", "==")
    new $P1020, "ResizablePMCArray"
    push $P1020, $P1019
    .return ($P1020)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<!=>"  :subid("259_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1024_tgt
    .local int rx1024_pos
    .local int rx1024_off
    .local int rx1024_eos
    .local int rx1024_rep
    .local pmc rx1024_cur
    (rx1024_cur, rx1024_pos, rx1024_tgt) = self."!cursor_start"()
    rx1024_cur."!cursor_debug"("START ", "infix:sym<!=>")
    .lex unicode:"$\x{a2}", rx1024_cur
    .local pmc match
    .lex "$/", match
    length rx1024_eos, rx1024_tgt
    set rx1024_off, 0
    lt rx1024_pos, 2, rx1024_start
    sub rx1024_off, rx1024_pos, 1
    substr rx1024_tgt, rx1024_tgt, rx1024_off
  rx1024_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1028_done
    goto rxscan1028_scan
  rxscan1028_loop:
    ($P10) = rx1024_cur."from"()
    inc $P10
    set rx1024_pos, $P10
    ge rx1024_pos, rx1024_eos, rxscan1028_done
  rxscan1028_scan:
    set_addr $I10, rxscan1028_loop
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
  rxscan1028_done:
.annotate "line", 460
  # rx subcapture "sym"
    set_addr $I10, rxcap_1029_fail
    rx1024_cur."!mark_push"(0, rx1024_pos, $I10)
  # rx literal  "!="
    add $I11, rx1024_pos, 2
    gt $I11, rx1024_eos, rx1024_fail
    sub $I11, rx1024_pos, rx1024_off
    substr $S10, rx1024_tgt, $I11, 2
    ne $S10, "!=", rx1024_fail
    add rx1024_pos, 2
    set_addr $I10, rxcap_1029_fail
    ($I12, $I11) = rx1024_cur."!mark_peek"($I10)
    rx1024_cur."!cursor_pos"($I11)
    ($P10) = rx1024_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1024_pos, "")
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1029_done
  rxcap_1029_fail:
    goto rx1024_fail
  rxcap_1029_done:
  # rx subrule "O" subtype=capture negate=
    rx1024_cur."!cursor_pos"(rx1024_pos)
    $P10 = rx1024_cur."O"("%relational, :pirop<isne INn>")
    unless $P10, rx1024_fail
    rx1024_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1024_pos = $P10."pos"()
  # rx pass
    rx1024_cur."!cursor_pass"(rx1024_pos, "infix:sym<!=>")
    rx1024_cur."!cursor_debug"("PASS  ", "infix:sym<!=>", " at pos=", rx1024_pos)
    .return (rx1024_cur)
  rx1024_fail:
.annotate "line", 390
    (rx1024_rep, rx1024_pos, $I10, $P10) = rx1024_cur."!mark_fail"(0)
    lt rx1024_pos, -1, rx1024_done
    eq rx1024_pos, -1, rx1024_fail
    jump $I10
  rx1024_done:
    rx1024_cur."!cursor_fail"()
    rx1024_cur."!cursor_debug"("FAIL  ", "infix:sym<!=>")
    .return (rx1024_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<!=>"  :subid("260_1259103982.97329") :method
.annotate "line", 390
    $P1026 = self."!PREFIX__!subrule"("O", "!=")
    new $P1027, "ResizablePMCArray"
    push $P1027, $P1026
    .return ($P1027)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<=>"  :subid("261_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1031_tgt
    .local int rx1031_pos
    .local int rx1031_off
    .local int rx1031_eos
    .local int rx1031_rep
    .local pmc rx1031_cur
    (rx1031_cur, rx1031_pos, rx1031_tgt) = self."!cursor_start"()
    rx1031_cur."!cursor_debug"("START ", "infix:sym<<=>")
    .lex unicode:"$\x{a2}", rx1031_cur
    .local pmc match
    .lex "$/", match
    length rx1031_eos, rx1031_tgt
    set rx1031_off, 0
    lt rx1031_pos, 2, rx1031_start
    sub rx1031_off, rx1031_pos, 1
    substr rx1031_tgt, rx1031_tgt, rx1031_off
  rx1031_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1035_done
    goto rxscan1035_scan
  rxscan1035_loop:
    ($P10) = rx1031_cur."from"()
    inc $P10
    set rx1031_pos, $P10
    ge rx1031_pos, rx1031_eos, rxscan1035_done
  rxscan1035_scan:
    set_addr $I10, rxscan1035_loop
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  rxscan1035_done:
.annotate "line", 461
  # rx subcapture "sym"
    set_addr $I10, rxcap_1036_fail
    rx1031_cur."!mark_push"(0, rx1031_pos, $I10)
  # rx literal  "<="
    add $I11, rx1031_pos, 2
    gt $I11, rx1031_eos, rx1031_fail
    sub $I11, rx1031_pos, rx1031_off
    substr $S10, rx1031_tgt, $I11, 2
    ne $S10, "<=", rx1031_fail
    add rx1031_pos, 2
    set_addr $I10, rxcap_1036_fail
    ($I12, $I11) = rx1031_cur."!mark_peek"($I10)
    rx1031_cur."!cursor_pos"($I11)
    ($P10) = rx1031_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1031_pos, "")
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1036_done
  rxcap_1036_fail:
    goto rx1031_fail
  rxcap_1036_done:
  # rx subrule "O" subtype=capture negate=
    rx1031_cur."!cursor_pos"(rx1031_pos)
    $P10 = rx1031_cur."O"("%relational, :pirop<isle INn>")
    unless $P10, rx1031_fail
    rx1031_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1031_pos = $P10."pos"()
  # rx pass
    rx1031_cur."!cursor_pass"(rx1031_pos, "infix:sym<<=>")
    rx1031_cur."!cursor_debug"("PASS  ", "infix:sym<<=>", " at pos=", rx1031_pos)
    .return (rx1031_cur)
  rx1031_fail:
.annotate "line", 390
    (rx1031_rep, rx1031_pos, $I10, $P10) = rx1031_cur."!mark_fail"(0)
    lt rx1031_pos, -1, rx1031_done
    eq rx1031_pos, -1, rx1031_fail
    jump $I10
  rx1031_done:
    rx1031_cur."!cursor_fail"()
    rx1031_cur."!cursor_debug"("FAIL  ", "infix:sym<<=>")
    .return (rx1031_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<=>"  :subid("262_1259103982.97329") :method
.annotate "line", 390
    $P1033 = self."!PREFIX__!subrule"("O", "<=")
    new $P1034, "ResizablePMCArray"
    push $P1034, $P1033
    .return ($P1034)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>=>"  :subid("263_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1038_tgt
    .local int rx1038_pos
    .local int rx1038_off
    .local int rx1038_eos
    .local int rx1038_rep
    .local pmc rx1038_cur
    (rx1038_cur, rx1038_pos, rx1038_tgt) = self."!cursor_start"()
    rx1038_cur."!cursor_debug"("START ", "infix:sym<>=>")
    .lex unicode:"$\x{a2}", rx1038_cur
    .local pmc match
    .lex "$/", match
    length rx1038_eos, rx1038_tgt
    set rx1038_off, 0
    lt rx1038_pos, 2, rx1038_start
    sub rx1038_off, rx1038_pos, 1
    substr rx1038_tgt, rx1038_tgt, rx1038_off
  rx1038_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1042_done
    goto rxscan1042_scan
  rxscan1042_loop:
    ($P10) = rx1038_cur."from"()
    inc $P10
    set rx1038_pos, $P10
    ge rx1038_pos, rx1038_eos, rxscan1042_done
  rxscan1042_scan:
    set_addr $I10, rxscan1042_loop
    rx1038_cur."!mark_push"(0, rx1038_pos, $I10)
  rxscan1042_done:
.annotate "line", 462
  # rx subcapture "sym"
    set_addr $I10, rxcap_1043_fail
    rx1038_cur."!mark_push"(0, rx1038_pos, $I10)
  # rx literal  ">="
    add $I11, rx1038_pos, 2
    gt $I11, rx1038_eos, rx1038_fail
    sub $I11, rx1038_pos, rx1038_off
    substr $S10, rx1038_tgt, $I11, 2
    ne $S10, ">=", rx1038_fail
    add rx1038_pos, 2
    set_addr $I10, rxcap_1043_fail
    ($I12, $I11) = rx1038_cur."!mark_peek"($I10)
    rx1038_cur."!cursor_pos"($I11)
    ($P10) = rx1038_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1038_pos, "")
    rx1038_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1043_done
  rxcap_1043_fail:
    goto rx1038_fail
  rxcap_1043_done:
  # rx subrule "O" subtype=capture negate=
    rx1038_cur."!cursor_pos"(rx1038_pos)
    $P10 = rx1038_cur."O"("%relational, :pirop<isge INn>")
    unless $P10, rx1038_fail
    rx1038_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1038_pos = $P10."pos"()
  # rx pass
    rx1038_cur."!cursor_pass"(rx1038_pos, "infix:sym<>=>")
    rx1038_cur."!cursor_debug"("PASS  ", "infix:sym<>=>", " at pos=", rx1038_pos)
    .return (rx1038_cur)
  rx1038_fail:
.annotate "line", 390
    (rx1038_rep, rx1038_pos, $I10, $P10) = rx1038_cur."!mark_fail"(0)
    lt rx1038_pos, -1, rx1038_done
    eq rx1038_pos, -1, rx1038_fail
    jump $I10
  rx1038_done:
    rx1038_cur."!cursor_fail"()
    rx1038_cur."!cursor_debug"("FAIL  ", "infix:sym<>=>")
    .return (rx1038_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>=>"  :subid("264_1259103982.97329") :method
.annotate "line", 390
    $P1040 = self."!PREFIX__!subrule"("O", ">=")
    new $P1041, "ResizablePMCArray"
    push $P1041, $P1040
    .return ($P1041)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<<>"  :subid("265_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1045_tgt
    .local int rx1045_pos
    .local int rx1045_off
    .local int rx1045_eos
    .local int rx1045_rep
    .local pmc rx1045_cur
    (rx1045_cur, rx1045_pos, rx1045_tgt) = self."!cursor_start"()
    rx1045_cur."!cursor_debug"("START ", "infix:sym<<>")
    .lex unicode:"$\x{a2}", rx1045_cur
    .local pmc match
    .lex "$/", match
    length rx1045_eos, rx1045_tgt
    set rx1045_off, 0
    lt rx1045_pos, 2, rx1045_start
    sub rx1045_off, rx1045_pos, 1
    substr rx1045_tgt, rx1045_tgt, rx1045_off
  rx1045_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1049_done
    goto rxscan1049_scan
  rxscan1049_loop:
    ($P10) = rx1045_cur."from"()
    inc $P10
    set rx1045_pos, $P10
    ge rx1045_pos, rx1045_eos, rxscan1049_done
  rxscan1049_scan:
    set_addr $I10, rxscan1049_loop
    rx1045_cur."!mark_push"(0, rx1045_pos, $I10)
  rxscan1049_done:
.annotate "line", 463
  # rx subcapture "sym"
    set_addr $I10, rxcap_1050_fail
    rx1045_cur."!mark_push"(0, rx1045_pos, $I10)
  # rx literal  "<"
    add $I11, rx1045_pos, 1
    gt $I11, rx1045_eos, rx1045_fail
    sub $I11, rx1045_pos, rx1045_off
    substr $S10, rx1045_tgt, $I11, 1
    ne $S10, "<", rx1045_fail
    add rx1045_pos, 1
    set_addr $I10, rxcap_1050_fail
    ($I12, $I11) = rx1045_cur."!mark_peek"($I10)
    rx1045_cur."!cursor_pos"($I11)
    ($P10) = rx1045_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1045_pos, "")
    rx1045_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1050_done
  rxcap_1050_fail:
    goto rx1045_fail
  rxcap_1050_done:
  # rx subrule "O" subtype=capture negate=
    rx1045_cur."!cursor_pos"(rx1045_pos)
    $P10 = rx1045_cur."O"("%relational, :pirop<islt INn>")
    unless $P10, rx1045_fail
    rx1045_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1045_pos = $P10."pos"()
  # rx pass
    rx1045_cur."!cursor_pass"(rx1045_pos, "infix:sym<<>")
    rx1045_cur."!cursor_debug"("PASS  ", "infix:sym<<>", " at pos=", rx1045_pos)
    .return (rx1045_cur)
  rx1045_fail:
.annotate "line", 390
    (rx1045_rep, rx1045_pos, $I10, $P10) = rx1045_cur."!mark_fail"(0)
    lt rx1045_pos, -1, rx1045_done
    eq rx1045_pos, -1, rx1045_fail
    jump $I10
  rx1045_done:
    rx1045_cur."!cursor_fail"()
    rx1045_cur."!cursor_debug"("FAIL  ", "infix:sym<<>")
    .return (rx1045_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<<>"  :subid("266_1259103982.97329") :method
.annotate "line", 390
    $P1047 = self."!PREFIX__!subrule"("O", "<")
    new $P1048, "ResizablePMCArray"
    push $P1048, $P1047
    .return ($P1048)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<>>"  :subid("267_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1052_tgt
    .local int rx1052_pos
    .local int rx1052_off
    .local int rx1052_eos
    .local int rx1052_rep
    .local pmc rx1052_cur
    (rx1052_cur, rx1052_pos, rx1052_tgt) = self."!cursor_start"()
    rx1052_cur."!cursor_debug"("START ", "infix:sym<>>")
    .lex unicode:"$\x{a2}", rx1052_cur
    .local pmc match
    .lex "$/", match
    length rx1052_eos, rx1052_tgt
    set rx1052_off, 0
    lt rx1052_pos, 2, rx1052_start
    sub rx1052_off, rx1052_pos, 1
    substr rx1052_tgt, rx1052_tgt, rx1052_off
  rx1052_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1056_done
    goto rxscan1056_scan
  rxscan1056_loop:
    ($P10) = rx1052_cur."from"()
    inc $P10
    set rx1052_pos, $P10
    ge rx1052_pos, rx1052_eos, rxscan1056_done
  rxscan1056_scan:
    set_addr $I10, rxscan1056_loop
    rx1052_cur."!mark_push"(0, rx1052_pos, $I10)
  rxscan1056_done:
.annotate "line", 464
  # rx subcapture "sym"
    set_addr $I10, rxcap_1057_fail
    rx1052_cur."!mark_push"(0, rx1052_pos, $I10)
  # rx literal  ">"
    add $I11, rx1052_pos, 1
    gt $I11, rx1052_eos, rx1052_fail
    sub $I11, rx1052_pos, rx1052_off
    substr $S10, rx1052_tgt, $I11, 1
    ne $S10, ">", rx1052_fail
    add rx1052_pos, 1
    set_addr $I10, rxcap_1057_fail
    ($I12, $I11) = rx1052_cur."!mark_peek"($I10)
    rx1052_cur."!cursor_pos"($I11)
    ($P10) = rx1052_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1052_pos, "")
    rx1052_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1057_done
  rxcap_1057_fail:
    goto rx1052_fail
  rxcap_1057_done:
  # rx subrule "O" subtype=capture negate=
    rx1052_cur."!cursor_pos"(rx1052_pos)
    $P10 = rx1052_cur."O"("%relational, :pirop<isgt INn>")
    unless $P10, rx1052_fail
    rx1052_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1052_pos = $P10."pos"()
  # rx pass
    rx1052_cur."!cursor_pass"(rx1052_pos, "infix:sym<>>")
    rx1052_cur."!cursor_debug"("PASS  ", "infix:sym<>>", " at pos=", rx1052_pos)
    .return (rx1052_cur)
  rx1052_fail:
.annotate "line", 390
    (rx1052_rep, rx1052_pos, $I10, $P10) = rx1052_cur."!mark_fail"(0)
    lt rx1052_pos, -1, rx1052_done
    eq rx1052_pos, -1, rx1052_fail
    jump $I10
  rx1052_done:
    rx1052_cur."!cursor_fail"()
    rx1052_cur."!cursor_debug"("FAIL  ", "infix:sym<>>")
    .return (rx1052_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<>>"  :subid("268_1259103982.97329") :method
.annotate "line", 390
    $P1054 = self."!PREFIX__!subrule"("O", ">")
    new $P1055, "ResizablePMCArray"
    push $P1055, $P1054
    .return ($P1055)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<eq>"  :subid("269_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1059_tgt
    .local int rx1059_pos
    .local int rx1059_off
    .local int rx1059_eos
    .local int rx1059_rep
    .local pmc rx1059_cur
    (rx1059_cur, rx1059_pos, rx1059_tgt) = self."!cursor_start"()
    rx1059_cur."!cursor_debug"("START ", "infix:sym<eq>")
    .lex unicode:"$\x{a2}", rx1059_cur
    .local pmc match
    .lex "$/", match
    length rx1059_eos, rx1059_tgt
    set rx1059_off, 0
    lt rx1059_pos, 2, rx1059_start
    sub rx1059_off, rx1059_pos, 1
    substr rx1059_tgt, rx1059_tgt, rx1059_off
  rx1059_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1063_done
    goto rxscan1063_scan
  rxscan1063_loop:
    ($P10) = rx1059_cur."from"()
    inc $P10
    set rx1059_pos, $P10
    ge rx1059_pos, rx1059_eos, rxscan1063_done
  rxscan1063_scan:
    set_addr $I10, rxscan1063_loop
    rx1059_cur."!mark_push"(0, rx1059_pos, $I10)
  rxscan1063_done:
.annotate "line", 465
  # rx subcapture "sym"
    set_addr $I10, rxcap_1064_fail
    rx1059_cur."!mark_push"(0, rx1059_pos, $I10)
  # rx literal  "eq"
    add $I11, rx1059_pos, 2
    gt $I11, rx1059_eos, rx1059_fail
    sub $I11, rx1059_pos, rx1059_off
    substr $S10, rx1059_tgt, $I11, 2
    ne $S10, "eq", rx1059_fail
    add rx1059_pos, 2
    set_addr $I10, rxcap_1064_fail
    ($I12, $I11) = rx1059_cur."!mark_peek"($I10)
    rx1059_cur."!cursor_pos"($I11)
    ($P10) = rx1059_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1059_pos, "")
    rx1059_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1064_done
  rxcap_1064_fail:
    goto rx1059_fail
  rxcap_1064_done:
  # rx subrule "O" subtype=capture negate=
    rx1059_cur."!cursor_pos"(rx1059_pos)
    $P10 = rx1059_cur."O"("%relational, :pirop<iseq ISs>")
    unless $P10, rx1059_fail
    rx1059_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1059_pos = $P10."pos"()
  # rx pass
    rx1059_cur."!cursor_pass"(rx1059_pos, "infix:sym<eq>")
    rx1059_cur."!cursor_debug"("PASS  ", "infix:sym<eq>", " at pos=", rx1059_pos)
    .return (rx1059_cur)
  rx1059_fail:
.annotate "line", 390
    (rx1059_rep, rx1059_pos, $I10, $P10) = rx1059_cur."!mark_fail"(0)
    lt rx1059_pos, -1, rx1059_done
    eq rx1059_pos, -1, rx1059_fail
    jump $I10
  rx1059_done:
    rx1059_cur."!cursor_fail"()
    rx1059_cur."!cursor_debug"("FAIL  ", "infix:sym<eq>")
    .return (rx1059_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<eq>"  :subid("270_1259103982.97329") :method
.annotate "line", 390
    $P1061 = self."!PREFIX__!subrule"("O", "eq")
    new $P1062, "ResizablePMCArray"
    push $P1062, $P1061
    .return ($P1062)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ne>"  :subid("271_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1066_tgt
    .local int rx1066_pos
    .local int rx1066_off
    .local int rx1066_eos
    .local int rx1066_rep
    .local pmc rx1066_cur
    (rx1066_cur, rx1066_pos, rx1066_tgt) = self."!cursor_start"()
    rx1066_cur."!cursor_debug"("START ", "infix:sym<ne>")
    .lex unicode:"$\x{a2}", rx1066_cur
    .local pmc match
    .lex "$/", match
    length rx1066_eos, rx1066_tgt
    set rx1066_off, 0
    lt rx1066_pos, 2, rx1066_start
    sub rx1066_off, rx1066_pos, 1
    substr rx1066_tgt, rx1066_tgt, rx1066_off
  rx1066_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1070_done
    goto rxscan1070_scan
  rxscan1070_loop:
    ($P10) = rx1066_cur."from"()
    inc $P10
    set rx1066_pos, $P10
    ge rx1066_pos, rx1066_eos, rxscan1070_done
  rxscan1070_scan:
    set_addr $I10, rxscan1070_loop
    rx1066_cur."!mark_push"(0, rx1066_pos, $I10)
  rxscan1070_done:
.annotate "line", 466
  # rx subcapture "sym"
    set_addr $I10, rxcap_1071_fail
    rx1066_cur."!mark_push"(0, rx1066_pos, $I10)
  # rx literal  "ne"
    add $I11, rx1066_pos, 2
    gt $I11, rx1066_eos, rx1066_fail
    sub $I11, rx1066_pos, rx1066_off
    substr $S10, rx1066_tgt, $I11, 2
    ne $S10, "ne", rx1066_fail
    add rx1066_pos, 2
    set_addr $I10, rxcap_1071_fail
    ($I12, $I11) = rx1066_cur."!mark_peek"($I10)
    rx1066_cur."!cursor_pos"($I11)
    ($P10) = rx1066_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1066_pos, "")
    rx1066_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1071_done
  rxcap_1071_fail:
    goto rx1066_fail
  rxcap_1071_done:
  # rx subrule "O" subtype=capture negate=
    rx1066_cur."!cursor_pos"(rx1066_pos)
    $P10 = rx1066_cur."O"("%relational, :pirop<isne ISs>")
    unless $P10, rx1066_fail
    rx1066_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1066_pos = $P10."pos"()
  # rx pass
    rx1066_cur."!cursor_pass"(rx1066_pos, "infix:sym<ne>")
    rx1066_cur."!cursor_debug"("PASS  ", "infix:sym<ne>", " at pos=", rx1066_pos)
    .return (rx1066_cur)
  rx1066_fail:
.annotate "line", 390
    (rx1066_rep, rx1066_pos, $I10, $P10) = rx1066_cur."!mark_fail"(0)
    lt rx1066_pos, -1, rx1066_done
    eq rx1066_pos, -1, rx1066_fail
    jump $I10
  rx1066_done:
    rx1066_cur."!cursor_fail"()
    rx1066_cur."!cursor_debug"("FAIL  ", "infix:sym<ne>")
    .return (rx1066_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ne>"  :subid("272_1259103982.97329") :method
.annotate "line", 390
    $P1068 = self."!PREFIX__!subrule"("O", "ne")
    new $P1069, "ResizablePMCArray"
    push $P1069, $P1068
    .return ($P1069)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<le>"  :subid("273_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1073_tgt
    .local int rx1073_pos
    .local int rx1073_off
    .local int rx1073_eos
    .local int rx1073_rep
    .local pmc rx1073_cur
    (rx1073_cur, rx1073_pos, rx1073_tgt) = self."!cursor_start"()
    rx1073_cur."!cursor_debug"("START ", "infix:sym<le>")
    .lex unicode:"$\x{a2}", rx1073_cur
    .local pmc match
    .lex "$/", match
    length rx1073_eos, rx1073_tgt
    set rx1073_off, 0
    lt rx1073_pos, 2, rx1073_start
    sub rx1073_off, rx1073_pos, 1
    substr rx1073_tgt, rx1073_tgt, rx1073_off
  rx1073_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1077_done
    goto rxscan1077_scan
  rxscan1077_loop:
    ($P10) = rx1073_cur."from"()
    inc $P10
    set rx1073_pos, $P10
    ge rx1073_pos, rx1073_eos, rxscan1077_done
  rxscan1077_scan:
    set_addr $I10, rxscan1077_loop
    rx1073_cur."!mark_push"(0, rx1073_pos, $I10)
  rxscan1077_done:
.annotate "line", 467
  # rx subcapture "sym"
    set_addr $I10, rxcap_1078_fail
    rx1073_cur."!mark_push"(0, rx1073_pos, $I10)
  # rx literal  "le"
    add $I11, rx1073_pos, 2
    gt $I11, rx1073_eos, rx1073_fail
    sub $I11, rx1073_pos, rx1073_off
    substr $S10, rx1073_tgt, $I11, 2
    ne $S10, "le", rx1073_fail
    add rx1073_pos, 2
    set_addr $I10, rxcap_1078_fail
    ($I12, $I11) = rx1073_cur."!mark_peek"($I10)
    rx1073_cur."!cursor_pos"($I11)
    ($P10) = rx1073_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1073_pos, "")
    rx1073_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1078_done
  rxcap_1078_fail:
    goto rx1073_fail
  rxcap_1078_done:
  # rx subrule "O" subtype=capture negate=
    rx1073_cur."!cursor_pos"(rx1073_pos)
    $P10 = rx1073_cur."O"("%relational, :pirop<isle ISs>")
    unless $P10, rx1073_fail
    rx1073_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1073_pos = $P10."pos"()
  # rx pass
    rx1073_cur."!cursor_pass"(rx1073_pos, "infix:sym<le>")
    rx1073_cur."!cursor_debug"("PASS  ", "infix:sym<le>", " at pos=", rx1073_pos)
    .return (rx1073_cur)
  rx1073_fail:
.annotate "line", 390
    (rx1073_rep, rx1073_pos, $I10, $P10) = rx1073_cur."!mark_fail"(0)
    lt rx1073_pos, -1, rx1073_done
    eq rx1073_pos, -1, rx1073_fail
    jump $I10
  rx1073_done:
    rx1073_cur."!cursor_fail"()
    rx1073_cur."!cursor_debug"("FAIL  ", "infix:sym<le>")
    .return (rx1073_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<le>"  :subid("274_1259103982.97329") :method
.annotate "line", 390
    $P1075 = self."!PREFIX__!subrule"("O", "le")
    new $P1076, "ResizablePMCArray"
    push $P1076, $P1075
    .return ($P1076)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<ge>"  :subid("275_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1080_tgt
    .local int rx1080_pos
    .local int rx1080_off
    .local int rx1080_eos
    .local int rx1080_rep
    .local pmc rx1080_cur
    (rx1080_cur, rx1080_pos, rx1080_tgt) = self."!cursor_start"()
    rx1080_cur."!cursor_debug"("START ", "infix:sym<ge>")
    .lex unicode:"$\x{a2}", rx1080_cur
    .local pmc match
    .lex "$/", match
    length rx1080_eos, rx1080_tgt
    set rx1080_off, 0
    lt rx1080_pos, 2, rx1080_start
    sub rx1080_off, rx1080_pos, 1
    substr rx1080_tgt, rx1080_tgt, rx1080_off
  rx1080_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1084_done
    goto rxscan1084_scan
  rxscan1084_loop:
    ($P10) = rx1080_cur."from"()
    inc $P10
    set rx1080_pos, $P10
    ge rx1080_pos, rx1080_eos, rxscan1084_done
  rxscan1084_scan:
    set_addr $I10, rxscan1084_loop
    rx1080_cur."!mark_push"(0, rx1080_pos, $I10)
  rxscan1084_done:
.annotate "line", 468
  # rx subcapture "sym"
    set_addr $I10, rxcap_1085_fail
    rx1080_cur."!mark_push"(0, rx1080_pos, $I10)
  # rx literal  "ge"
    add $I11, rx1080_pos, 2
    gt $I11, rx1080_eos, rx1080_fail
    sub $I11, rx1080_pos, rx1080_off
    substr $S10, rx1080_tgt, $I11, 2
    ne $S10, "ge", rx1080_fail
    add rx1080_pos, 2
    set_addr $I10, rxcap_1085_fail
    ($I12, $I11) = rx1080_cur."!mark_peek"($I10)
    rx1080_cur."!cursor_pos"($I11)
    ($P10) = rx1080_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1080_pos, "")
    rx1080_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1085_done
  rxcap_1085_fail:
    goto rx1080_fail
  rxcap_1085_done:
  # rx subrule "O" subtype=capture negate=
    rx1080_cur."!cursor_pos"(rx1080_pos)
    $P10 = rx1080_cur."O"("%relational, :pirop<isge ISs>")
    unless $P10, rx1080_fail
    rx1080_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1080_pos = $P10."pos"()
  # rx pass
    rx1080_cur."!cursor_pass"(rx1080_pos, "infix:sym<ge>")
    rx1080_cur."!cursor_debug"("PASS  ", "infix:sym<ge>", " at pos=", rx1080_pos)
    .return (rx1080_cur)
  rx1080_fail:
.annotate "line", 390
    (rx1080_rep, rx1080_pos, $I10, $P10) = rx1080_cur."!mark_fail"(0)
    lt rx1080_pos, -1, rx1080_done
    eq rx1080_pos, -1, rx1080_fail
    jump $I10
  rx1080_done:
    rx1080_cur."!cursor_fail"()
    rx1080_cur."!cursor_debug"("FAIL  ", "infix:sym<ge>")
    .return (rx1080_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<ge>"  :subid("276_1259103982.97329") :method
.annotate "line", 390
    $P1082 = self."!PREFIX__!subrule"("O", "ge")
    new $P1083, "ResizablePMCArray"
    push $P1083, $P1082
    .return ($P1083)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<lt>"  :subid("277_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1087_tgt
    .local int rx1087_pos
    .local int rx1087_off
    .local int rx1087_eos
    .local int rx1087_rep
    .local pmc rx1087_cur
    (rx1087_cur, rx1087_pos, rx1087_tgt) = self."!cursor_start"()
    rx1087_cur."!cursor_debug"("START ", "infix:sym<lt>")
    .lex unicode:"$\x{a2}", rx1087_cur
    .local pmc match
    .lex "$/", match
    length rx1087_eos, rx1087_tgt
    set rx1087_off, 0
    lt rx1087_pos, 2, rx1087_start
    sub rx1087_off, rx1087_pos, 1
    substr rx1087_tgt, rx1087_tgt, rx1087_off
  rx1087_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1091_done
    goto rxscan1091_scan
  rxscan1091_loop:
    ($P10) = rx1087_cur."from"()
    inc $P10
    set rx1087_pos, $P10
    ge rx1087_pos, rx1087_eos, rxscan1091_done
  rxscan1091_scan:
    set_addr $I10, rxscan1091_loop
    rx1087_cur."!mark_push"(0, rx1087_pos, $I10)
  rxscan1091_done:
.annotate "line", 469
  # rx subcapture "sym"
    set_addr $I10, rxcap_1092_fail
    rx1087_cur."!mark_push"(0, rx1087_pos, $I10)
  # rx literal  "lt"
    add $I11, rx1087_pos, 2
    gt $I11, rx1087_eos, rx1087_fail
    sub $I11, rx1087_pos, rx1087_off
    substr $S10, rx1087_tgt, $I11, 2
    ne $S10, "lt", rx1087_fail
    add rx1087_pos, 2
    set_addr $I10, rxcap_1092_fail
    ($I12, $I11) = rx1087_cur."!mark_peek"($I10)
    rx1087_cur."!cursor_pos"($I11)
    ($P10) = rx1087_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1087_pos, "")
    rx1087_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1092_done
  rxcap_1092_fail:
    goto rx1087_fail
  rxcap_1092_done:
  # rx subrule "O" subtype=capture negate=
    rx1087_cur."!cursor_pos"(rx1087_pos)
    $P10 = rx1087_cur."O"("%relational, :pirop<islt ISs>")
    unless $P10, rx1087_fail
    rx1087_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1087_pos = $P10."pos"()
  # rx pass
    rx1087_cur."!cursor_pass"(rx1087_pos, "infix:sym<lt>")
    rx1087_cur."!cursor_debug"("PASS  ", "infix:sym<lt>", " at pos=", rx1087_pos)
    .return (rx1087_cur)
  rx1087_fail:
.annotate "line", 390
    (rx1087_rep, rx1087_pos, $I10, $P10) = rx1087_cur."!mark_fail"(0)
    lt rx1087_pos, -1, rx1087_done
    eq rx1087_pos, -1, rx1087_fail
    jump $I10
  rx1087_done:
    rx1087_cur."!cursor_fail"()
    rx1087_cur."!cursor_debug"("FAIL  ", "infix:sym<lt>")
    .return (rx1087_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<lt>"  :subid("278_1259103982.97329") :method
.annotate "line", 390
    $P1089 = self."!PREFIX__!subrule"("O", "lt")
    new $P1090, "ResizablePMCArray"
    push $P1090, $P1089
    .return ($P1090)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<gt>"  :subid("279_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1094_tgt
    .local int rx1094_pos
    .local int rx1094_off
    .local int rx1094_eos
    .local int rx1094_rep
    .local pmc rx1094_cur
    (rx1094_cur, rx1094_pos, rx1094_tgt) = self."!cursor_start"()
    rx1094_cur."!cursor_debug"("START ", "infix:sym<gt>")
    .lex unicode:"$\x{a2}", rx1094_cur
    .local pmc match
    .lex "$/", match
    length rx1094_eos, rx1094_tgt
    set rx1094_off, 0
    lt rx1094_pos, 2, rx1094_start
    sub rx1094_off, rx1094_pos, 1
    substr rx1094_tgt, rx1094_tgt, rx1094_off
  rx1094_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1098_done
    goto rxscan1098_scan
  rxscan1098_loop:
    ($P10) = rx1094_cur."from"()
    inc $P10
    set rx1094_pos, $P10
    ge rx1094_pos, rx1094_eos, rxscan1098_done
  rxscan1098_scan:
    set_addr $I10, rxscan1098_loop
    rx1094_cur."!mark_push"(0, rx1094_pos, $I10)
  rxscan1098_done:
.annotate "line", 470
  # rx subcapture "sym"
    set_addr $I10, rxcap_1099_fail
    rx1094_cur."!mark_push"(0, rx1094_pos, $I10)
  # rx literal  "gt"
    add $I11, rx1094_pos, 2
    gt $I11, rx1094_eos, rx1094_fail
    sub $I11, rx1094_pos, rx1094_off
    substr $S10, rx1094_tgt, $I11, 2
    ne $S10, "gt", rx1094_fail
    add rx1094_pos, 2
    set_addr $I10, rxcap_1099_fail
    ($I12, $I11) = rx1094_cur."!mark_peek"($I10)
    rx1094_cur."!cursor_pos"($I11)
    ($P10) = rx1094_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1094_pos, "")
    rx1094_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1099_done
  rxcap_1099_fail:
    goto rx1094_fail
  rxcap_1099_done:
  # rx subrule "O" subtype=capture negate=
    rx1094_cur."!cursor_pos"(rx1094_pos)
    $P10 = rx1094_cur."O"("%relational, :pirop<isgt ISs>")
    unless $P10, rx1094_fail
    rx1094_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1094_pos = $P10."pos"()
  # rx pass
    rx1094_cur."!cursor_pass"(rx1094_pos, "infix:sym<gt>")
    rx1094_cur."!cursor_debug"("PASS  ", "infix:sym<gt>", " at pos=", rx1094_pos)
    .return (rx1094_cur)
  rx1094_fail:
.annotate "line", 390
    (rx1094_rep, rx1094_pos, $I10, $P10) = rx1094_cur."!mark_fail"(0)
    lt rx1094_pos, -1, rx1094_done
    eq rx1094_pos, -1, rx1094_fail
    jump $I10
  rx1094_done:
    rx1094_cur."!cursor_fail"()
    rx1094_cur."!cursor_debug"("FAIL  ", "infix:sym<gt>")
    .return (rx1094_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<gt>"  :subid("280_1259103982.97329") :method
.annotate "line", 390
    $P1096 = self."!PREFIX__!subrule"("O", "gt")
    new $P1097, "ResizablePMCArray"
    push $P1097, $P1096
    .return ($P1097)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=:=>"  :subid("281_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1101_tgt
    .local int rx1101_pos
    .local int rx1101_off
    .local int rx1101_eos
    .local int rx1101_rep
    .local pmc rx1101_cur
    (rx1101_cur, rx1101_pos, rx1101_tgt) = self."!cursor_start"()
    rx1101_cur."!cursor_debug"("START ", "infix:sym<=:=>")
    .lex unicode:"$\x{a2}", rx1101_cur
    .local pmc match
    .lex "$/", match
    length rx1101_eos, rx1101_tgt
    set rx1101_off, 0
    lt rx1101_pos, 2, rx1101_start
    sub rx1101_off, rx1101_pos, 1
    substr rx1101_tgt, rx1101_tgt, rx1101_off
  rx1101_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1105_done
    goto rxscan1105_scan
  rxscan1105_loop:
    ($P10) = rx1101_cur."from"()
    inc $P10
    set rx1101_pos, $P10
    ge rx1101_pos, rx1101_eos, rxscan1105_done
  rxscan1105_scan:
    set_addr $I10, rxscan1105_loop
    rx1101_cur."!mark_push"(0, rx1101_pos, $I10)
  rxscan1105_done:
.annotate "line", 471
  # rx subcapture "sym"
    set_addr $I10, rxcap_1106_fail
    rx1101_cur."!mark_push"(0, rx1101_pos, $I10)
  # rx literal  "=:="
    add $I11, rx1101_pos, 3
    gt $I11, rx1101_eos, rx1101_fail
    sub $I11, rx1101_pos, rx1101_off
    substr $S10, rx1101_tgt, $I11, 3
    ne $S10, "=:=", rx1101_fail
    add rx1101_pos, 3
    set_addr $I10, rxcap_1106_fail
    ($I12, $I11) = rx1101_cur."!mark_peek"($I10)
    rx1101_cur."!cursor_pos"($I11)
    ($P10) = rx1101_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1101_pos, "")
    rx1101_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1106_done
  rxcap_1106_fail:
    goto rx1101_fail
  rxcap_1106_done:
  # rx subrule "O" subtype=capture negate=
    rx1101_cur."!cursor_pos"(rx1101_pos)
    $P10 = rx1101_cur."O"("%relational, :pirop<issame>")
    unless $P10, rx1101_fail
    rx1101_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1101_pos = $P10."pos"()
  # rx pass
    rx1101_cur."!cursor_pass"(rx1101_pos, "infix:sym<=:=>")
    rx1101_cur."!cursor_debug"("PASS  ", "infix:sym<=:=>", " at pos=", rx1101_pos)
    .return (rx1101_cur)
  rx1101_fail:
.annotate "line", 390
    (rx1101_rep, rx1101_pos, $I10, $P10) = rx1101_cur."!mark_fail"(0)
    lt rx1101_pos, -1, rx1101_done
    eq rx1101_pos, -1, rx1101_fail
    jump $I10
  rx1101_done:
    rx1101_cur."!cursor_fail"()
    rx1101_cur."!cursor_debug"("FAIL  ", "infix:sym<=:=>")
    .return (rx1101_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=:=>"  :subid("282_1259103982.97329") :method
.annotate "line", 390
    $P1103 = self."!PREFIX__!subrule"("O", "=:=")
    new $P1104, "ResizablePMCArray"
    push $P1104, $P1103
    .return ($P1104)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<&&>"  :subid("283_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1108_tgt
    .local int rx1108_pos
    .local int rx1108_off
    .local int rx1108_eos
    .local int rx1108_rep
    .local pmc rx1108_cur
    (rx1108_cur, rx1108_pos, rx1108_tgt) = self."!cursor_start"()
    rx1108_cur."!cursor_debug"("START ", "infix:sym<&&>")
    .lex unicode:"$\x{a2}", rx1108_cur
    .local pmc match
    .lex "$/", match
    length rx1108_eos, rx1108_tgt
    set rx1108_off, 0
    lt rx1108_pos, 2, rx1108_start
    sub rx1108_off, rx1108_pos, 1
    substr rx1108_tgt, rx1108_tgt, rx1108_off
  rx1108_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1112_done
    goto rxscan1112_scan
  rxscan1112_loop:
    ($P10) = rx1108_cur."from"()
    inc $P10
    set rx1108_pos, $P10
    ge rx1108_pos, rx1108_eos, rxscan1112_done
  rxscan1112_scan:
    set_addr $I10, rxscan1112_loop
    rx1108_cur."!mark_push"(0, rx1108_pos, $I10)
  rxscan1112_done:
.annotate "line", 473
  # rx subcapture "sym"
    set_addr $I10, rxcap_1113_fail
    rx1108_cur."!mark_push"(0, rx1108_pos, $I10)
  # rx literal  "&&"
    add $I11, rx1108_pos, 2
    gt $I11, rx1108_eos, rx1108_fail
    sub $I11, rx1108_pos, rx1108_off
    substr $S10, rx1108_tgt, $I11, 2
    ne $S10, "&&", rx1108_fail
    add rx1108_pos, 2
    set_addr $I10, rxcap_1113_fail
    ($I12, $I11) = rx1108_cur."!mark_peek"($I10)
    rx1108_cur."!cursor_pos"($I11)
    ($P10) = rx1108_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1108_pos, "")
    rx1108_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1113_done
  rxcap_1113_fail:
    goto rx1108_fail
  rxcap_1113_done:
  # rx subrule "O" subtype=capture negate=
    rx1108_cur."!cursor_pos"(rx1108_pos)
    $P10 = rx1108_cur."O"("%tight_and, :pasttype<if>")
    unless $P10, rx1108_fail
    rx1108_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1108_pos = $P10."pos"()
  # rx pass
    rx1108_cur."!cursor_pass"(rx1108_pos, "infix:sym<&&>")
    rx1108_cur."!cursor_debug"("PASS  ", "infix:sym<&&>", " at pos=", rx1108_pos)
    .return (rx1108_cur)
  rx1108_fail:
.annotate "line", 390
    (rx1108_rep, rx1108_pos, $I10, $P10) = rx1108_cur."!mark_fail"(0)
    lt rx1108_pos, -1, rx1108_done
    eq rx1108_pos, -1, rx1108_fail
    jump $I10
  rx1108_done:
    rx1108_cur."!cursor_fail"()
    rx1108_cur."!cursor_debug"("FAIL  ", "infix:sym<&&>")
    .return (rx1108_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<&&>"  :subid("284_1259103982.97329") :method
.annotate "line", 390
    $P1110 = self."!PREFIX__!subrule"("O", "&&")
    new $P1111, "ResizablePMCArray"
    push $P1111, $P1110
    .return ($P1111)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<||>"  :subid("285_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1115_tgt
    .local int rx1115_pos
    .local int rx1115_off
    .local int rx1115_eos
    .local int rx1115_rep
    .local pmc rx1115_cur
    (rx1115_cur, rx1115_pos, rx1115_tgt) = self."!cursor_start"()
    rx1115_cur."!cursor_debug"("START ", "infix:sym<||>")
    .lex unicode:"$\x{a2}", rx1115_cur
    .local pmc match
    .lex "$/", match
    length rx1115_eos, rx1115_tgt
    set rx1115_off, 0
    lt rx1115_pos, 2, rx1115_start
    sub rx1115_off, rx1115_pos, 1
    substr rx1115_tgt, rx1115_tgt, rx1115_off
  rx1115_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1119_done
    goto rxscan1119_scan
  rxscan1119_loop:
    ($P10) = rx1115_cur."from"()
    inc $P10
    set rx1115_pos, $P10
    ge rx1115_pos, rx1115_eos, rxscan1119_done
  rxscan1119_scan:
    set_addr $I10, rxscan1119_loop
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
  rxscan1119_done:
.annotate "line", 475
  # rx subcapture "sym"
    set_addr $I10, rxcap_1120_fail
    rx1115_cur."!mark_push"(0, rx1115_pos, $I10)
  # rx literal  "||"
    add $I11, rx1115_pos, 2
    gt $I11, rx1115_eos, rx1115_fail
    sub $I11, rx1115_pos, rx1115_off
    substr $S10, rx1115_tgt, $I11, 2
    ne $S10, "||", rx1115_fail
    add rx1115_pos, 2
    set_addr $I10, rxcap_1120_fail
    ($I12, $I11) = rx1115_cur."!mark_peek"($I10)
    rx1115_cur."!cursor_pos"($I11)
    ($P10) = rx1115_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1115_pos, "")
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1120_done
  rxcap_1120_fail:
    goto rx1115_fail
  rxcap_1120_done:
  # rx subrule "O" subtype=capture negate=
    rx1115_cur."!cursor_pos"(rx1115_pos)
    $P10 = rx1115_cur."O"("%tight_or, :pasttype<unless>")
    unless $P10, rx1115_fail
    rx1115_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1115_pos = $P10."pos"()
  # rx pass
    rx1115_cur."!cursor_pass"(rx1115_pos, "infix:sym<||>")
    rx1115_cur."!cursor_debug"("PASS  ", "infix:sym<||>", " at pos=", rx1115_pos)
    .return (rx1115_cur)
  rx1115_fail:
.annotate "line", 390
    (rx1115_rep, rx1115_pos, $I10, $P10) = rx1115_cur."!mark_fail"(0)
    lt rx1115_pos, -1, rx1115_done
    eq rx1115_pos, -1, rx1115_fail
    jump $I10
  rx1115_done:
    rx1115_cur."!cursor_fail"()
    rx1115_cur."!cursor_debug"("FAIL  ", "infix:sym<||>")
    .return (rx1115_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<||>"  :subid("286_1259103982.97329") :method
.annotate "line", 390
    $P1117 = self."!PREFIX__!subrule"("O", "||")
    new $P1118, "ResizablePMCArray"
    push $P1118, $P1117
    .return ($P1118)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<//>"  :subid("287_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1122_tgt
    .local int rx1122_pos
    .local int rx1122_off
    .local int rx1122_eos
    .local int rx1122_rep
    .local pmc rx1122_cur
    (rx1122_cur, rx1122_pos, rx1122_tgt) = self."!cursor_start"()
    rx1122_cur."!cursor_debug"("START ", "infix:sym<//>")
    .lex unicode:"$\x{a2}", rx1122_cur
    .local pmc match
    .lex "$/", match
    length rx1122_eos, rx1122_tgt
    set rx1122_off, 0
    lt rx1122_pos, 2, rx1122_start
    sub rx1122_off, rx1122_pos, 1
    substr rx1122_tgt, rx1122_tgt, rx1122_off
  rx1122_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1126_done
    goto rxscan1126_scan
  rxscan1126_loop:
    ($P10) = rx1122_cur."from"()
    inc $P10
    set rx1122_pos, $P10
    ge rx1122_pos, rx1122_eos, rxscan1126_done
  rxscan1126_scan:
    set_addr $I10, rxscan1126_loop
    rx1122_cur."!mark_push"(0, rx1122_pos, $I10)
  rxscan1126_done:
.annotate "line", 476
  # rx subcapture "sym"
    set_addr $I10, rxcap_1127_fail
    rx1122_cur."!mark_push"(0, rx1122_pos, $I10)
  # rx literal  "//"
    add $I11, rx1122_pos, 2
    gt $I11, rx1122_eos, rx1122_fail
    sub $I11, rx1122_pos, rx1122_off
    substr $S10, rx1122_tgt, $I11, 2
    ne $S10, "//", rx1122_fail
    add rx1122_pos, 2
    set_addr $I10, rxcap_1127_fail
    ($I12, $I11) = rx1122_cur."!mark_peek"($I10)
    rx1122_cur."!cursor_pos"($I11)
    ($P10) = rx1122_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1122_pos, "")
    rx1122_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1127_done
  rxcap_1127_fail:
    goto rx1122_fail
  rxcap_1127_done:
  # rx subrule "O" subtype=capture negate=
    rx1122_cur."!cursor_pos"(rx1122_pos)
    $P10 = rx1122_cur."O"("%tight_or, :pasttype<def_or>")
    unless $P10, rx1122_fail
    rx1122_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1122_pos = $P10."pos"()
  # rx pass
    rx1122_cur."!cursor_pass"(rx1122_pos, "infix:sym<//>")
    rx1122_cur."!cursor_debug"("PASS  ", "infix:sym<//>", " at pos=", rx1122_pos)
    .return (rx1122_cur)
  rx1122_fail:
.annotate "line", 390
    (rx1122_rep, rx1122_pos, $I10, $P10) = rx1122_cur."!mark_fail"(0)
    lt rx1122_pos, -1, rx1122_done
    eq rx1122_pos, -1, rx1122_fail
    jump $I10
  rx1122_done:
    rx1122_cur."!cursor_fail"()
    rx1122_cur."!cursor_debug"("FAIL  ", "infix:sym<//>")
    .return (rx1122_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<//>"  :subid("288_1259103982.97329") :method
.annotate "line", 390
    $P1124 = self."!PREFIX__!subrule"("O", "//")
    new $P1125, "ResizablePMCArray"
    push $P1125, $P1124
    .return ($P1125)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<?? !!>"  :subid("289_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1129_tgt
    .local int rx1129_pos
    .local int rx1129_off
    .local int rx1129_eos
    .local int rx1129_rep
    .local pmc rx1129_cur
    (rx1129_cur, rx1129_pos, rx1129_tgt) = self."!cursor_start"()
    rx1129_cur."!cursor_debug"("START ", "infix:sym<?? !!>")
    .lex unicode:"$\x{a2}", rx1129_cur
    .local pmc match
    .lex "$/", match
    length rx1129_eos, rx1129_tgt
    set rx1129_off, 0
    lt rx1129_pos, 2, rx1129_start
    sub rx1129_off, rx1129_pos, 1
    substr rx1129_tgt, rx1129_tgt, rx1129_off
  rx1129_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1133_done
    goto rxscan1133_scan
  rxscan1133_loop:
    ($P10) = rx1129_cur."from"()
    inc $P10
    set rx1129_pos, $P10
    ge rx1129_pos, rx1129_eos, rxscan1133_done
  rxscan1133_scan:
    set_addr $I10, rxscan1133_loop
    rx1129_cur."!mark_push"(0, rx1129_pos, $I10)
  rxscan1133_done:
.annotate "line", 479
  # rx literal  "??"
    add $I11, rx1129_pos, 2
    gt $I11, rx1129_eos, rx1129_fail
    sub $I11, rx1129_pos, rx1129_off
    substr $S10, rx1129_tgt, $I11, 2
    ne $S10, "??", rx1129_fail
    add rx1129_pos, 2
.annotate "line", 480
  # rx subrule "ws" subtype=method negate=
    rx1129_cur."!cursor_pos"(rx1129_pos)
    $P10 = rx1129_cur."ws"()
    unless $P10, rx1129_fail
    rx1129_pos = $P10."pos"()
.annotate "line", 481
  # rx subrule "EXPR" subtype=capture negate=
    rx1129_cur."!cursor_pos"(rx1129_pos)
    $P10 = rx1129_cur."EXPR"("i=")
    unless $P10, rx1129_fail
    rx1129_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("EXPR")
    rx1129_pos = $P10."pos"()
.annotate "line", 482
  # rx literal  "!!"
    add $I11, rx1129_pos, 2
    gt $I11, rx1129_eos, rx1129_fail
    sub $I11, rx1129_pos, rx1129_off
    substr $S10, rx1129_tgt, $I11, 2
    ne $S10, "!!", rx1129_fail
    add rx1129_pos, 2
.annotate "line", 483
  # rx subrule "O" subtype=capture negate=
    rx1129_cur."!cursor_pos"(rx1129_pos)
    $P10 = rx1129_cur."O"("%conditional, :reducecheck<ternary>, :pasttype<if>")
    unless $P10, rx1129_fail
    rx1129_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1129_pos = $P10."pos"()
.annotate "line", 478
  # rx pass
    rx1129_cur."!cursor_pass"(rx1129_pos, "infix:sym<?? !!>")
    rx1129_cur."!cursor_debug"("PASS  ", "infix:sym<?? !!>", " at pos=", rx1129_pos)
    .return (rx1129_cur)
  rx1129_fail:
.annotate "line", 390
    (rx1129_rep, rx1129_pos, $I10, $P10) = rx1129_cur."!mark_fail"(0)
    lt rx1129_pos, -1, rx1129_done
    eq rx1129_pos, -1, rx1129_fail
    jump $I10
  rx1129_done:
    rx1129_cur."!cursor_fail"()
    rx1129_cur."!cursor_debug"("FAIL  ", "infix:sym<?? !!>")
    .return (rx1129_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<?? !!>"  :subid("290_1259103982.97329") :method
.annotate "line", 390
    $P1131 = self."!PREFIX__!subrule"("", "??")
    new $P1132, "ResizablePMCArray"
    push $P1132, $P1131
    .return ($P1132)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<=>"  :subid("291_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1135_tgt
    .local int rx1135_pos
    .local int rx1135_off
    .local int rx1135_eos
    .local int rx1135_rep
    .local pmc rx1135_cur
    (rx1135_cur, rx1135_pos, rx1135_tgt) = self."!cursor_start"()
    rx1135_cur."!cursor_debug"("START ", "infix:sym<=>")
    .lex unicode:"$\x{a2}", rx1135_cur
    .local pmc match
    .lex "$/", match
    length rx1135_eos, rx1135_tgt
    set rx1135_off, 0
    lt rx1135_pos, 2, rx1135_start
    sub rx1135_off, rx1135_pos, 1
    substr rx1135_tgt, rx1135_tgt, rx1135_off
  rx1135_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1139_done
    goto rxscan1139_scan
  rxscan1139_loop:
    ($P10) = rx1135_cur."from"()
    inc $P10
    set rx1135_pos, $P10
    ge rx1135_pos, rx1135_eos, rxscan1139_done
  rxscan1139_scan:
    set_addr $I10, rxscan1139_loop
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  rxscan1139_done:
.annotate "line", 487
  # rx subcapture "sym"
    set_addr $I10, rxcap_1140_fail
    rx1135_cur."!mark_push"(0, rx1135_pos, $I10)
  # rx literal  "="
    add $I11, rx1135_pos, 1
    gt $I11, rx1135_eos, rx1135_fail
    sub $I11, rx1135_pos, rx1135_off
    substr $S10, rx1135_tgt, $I11, 1
    ne $S10, "=", rx1135_fail
    add rx1135_pos, 1
    set_addr $I10, rxcap_1140_fail
    ($I12, $I11) = rx1135_cur."!mark_peek"($I10)
    rx1135_cur."!cursor_pos"($I11)
    ($P10) = rx1135_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1135_pos, "")
    rx1135_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1140_done
  rxcap_1140_fail:
    goto rx1135_fail
  rxcap_1140_done:
  # rx subrule "panic" subtype=method negate=
    rx1135_cur."!cursor_pos"(rx1135_pos)
    $P10 = rx1135_cur."panic"("Assignment (\"=\") not supported in NQP, use \":=\" instead")
    unless $P10, rx1135_fail
    rx1135_pos = $P10."pos"()
.annotate "line", 486
  # rx pass
    rx1135_cur."!cursor_pass"(rx1135_pos, "infix:sym<=>")
    rx1135_cur."!cursor_debug"("PASS  ", "infix:sym<=>", " at pos=", rx1135_pos)
    .return (rx1135_cur)
  rx1135_fail:
.annotate "line", 390
    (rx1135_rep, rx1135_pos, $I10, $P10) = rx1135_cur."!mark_fail"(0)
    lt rx1135_pos, -1, rx1135_done
    eq rx1135_pos, -1, rx1135_fail
    jump $I10
  rx1135_done:
    rx1135_cur."!cursor_fail"()
    rx1135_cur."!cursor_debug"("FAIL  ", "infix:sym<=>")
    .return (rx1135_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<=>"  :subid("292_1259103982.97329") :method
.annotate "line", 390
    $P1137 = self."!PREFIX__!subrule"("", "=")
    new $P1138, "ResizablePMCArray"
    push $P1138, $P1137
    .return ($P1138)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<:=>"  :subid("293_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1142_tgt
    .local int rx1142_pos
    .local int rx1142_off
    .local int rx1142_eos
    .local int rx1142_rep
    .local pmc rx1142_cur
    (rx1142_cur, rx1142_pos, rx1142_tgt) = self."!cursor_start"()
    rx1142_cur."!cursor_debug"("START ", "infix:sym<:=>")
    .lex unicode:"$\x{a2}", rx1142_cur
    .local pmc match
    .lex "$/", match
    length rx1142_eos, rx1142_tgt
    set rx1142_off, 0
    lt rx1142_pos, 2, rx1142_start
    sub rx1142_off, rx1142_pos, 1
    substr rx1142_tgt, rx1142_tgt, rx1142_off
  rx1142_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1146_done
    goto rxscan1146_scan
  rxscan1146_loop:
    ($P10) = rx1142_cur."from"()
    inc $P10
    set rx1142_pos, $P10
    ge rx1142_pos, rx1142_eos, rxscan1146_done
  rxscan1146_scan:
    set_addr $I10, rxscan1146_loop
    rx1142_cur."!mark_push"(0, rx1142_pos, $I10)
  rxscan1146_done:
.annotate "line", 489
  # rx subcapture "sym"
    set_addr $I10, rxcap_1147_fail
    rx1142_cur."!mark_push"(0, rx1142_pos, $I10)
  # rx literal  ":="
    add $I11, rx1142_pos, 2
    gt $I11, rx1142_eos, rx1142_fail
    sub $I11, rx1142_pos, rx1142_off
    substr $S10, rx1142_tgt, $I11, 2
    ne $S10, ":=", rx1142_fail
    add rx1142_pos, 2
    set_addr $I10, rxcap_1147_fail
    ($I12, $I11) = rx1142_cur."!mark_peek"($I10)
    rx1142_cur."!cursor_pos"($I11)
    ($P10) = rx1142_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1142_pos, "")
    rx1142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1147_done
  rxcap_1147_fail:
    goto rx1142_fail
  rxcap_1147_done:
  # rx subrule "O" subtype=capture negate=
    rx1142_cur."!cursor_pos"(rx1142_pos)
    $P10 = rx1142_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1142_fail
    rx1142_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1142_pos = $P10."pos"()
  # rx pass
    rx1142_cur."!cursor_pass"(rx1142_pos, "infix:sym<:=>")
    rx1142_cur."!cursor_debug"("PASS  ", "infix:sym<:=>", " at pos=", rx1142_pos)
    .return (rx1142_cur)
  rx1142_fail:
.annotate "line", 390
    (rx1142_rep, rx1142_pos, $I10, $P10) = rx1142_cur."!mark_fail"(0)
    lt rx1142_pos, -1, rx1142_done
    eq rx1142_pos, -1, rx1142_fail
    jump $I10
  rx1142_done:
    rx1142_cur."!cursor_fail"()
    rx1142_cur."!cursor_debug"("FAIL  ", "infix:sym<:=>")
    .return (rx1142_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<:=>"  :subid("294_1259103982.97329") :method
.annotate "line", 390
    $P1144 = self."!PREFIX__!subrule"("O", ":=")
    new $P1145, "ResizablePMCArray"
    push $P1145, $P1144
    .return ($P1145)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<::=>"  :subid("295_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1149_tgt
    .local int rx1149_pos
    .local int rx1149_off
    .local int rx1149_eos
    .local int rx1149_rep
    .local pmc rx1149_cur
    (rx1149_cur, rx1149_pos, rx1149_tgt) = self."!cursor_start"()
    rx1149_cur."!cursor_debug"("START ", "infix:sym<::=>")
    .lex unicode:"$\x{a2}", rx1149_cur
    .local pmc match
    .lex "$/", match
    length rx1149_eos, rx1149_tgt
    set rx1149_off, 0
    lt rx1149_pos, 2, rx1149_start
    sub rx1149_off, rx1149_pos, 1
    substr rx1149_tgt, rx1149_tgt, rx1149_off
  rx1149_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1153_done
    goto rxscan1153_scan
  rxscan1153_loop:
    ($P10) = rx1149_cur."from"()
    inc $P10
    set rx1149_pos, $P10
    ge rx1149_pos, rx1149_eos, rxscan1153_done
  rxscan1153_scan:
    set_addr $I10, rxscan1153_loop
    rx1149_cur."!mark_push"(0, rx1149_pos, $I10)
  rxscan1153_done:
.annotate "line", 490
  # rx subcapture "sym"
    set_addr $I10, rxcap_1154_fail
    rx1149_cur."!mark_push"(0, rx1149_pos, $I10)
  # rx literal  "::="
    add $I11, rx1149_pos, 3
    gt $I11, rx1149_eos, rx1149_fail
    sub $I11, rx1149_pos, rx1149_off
    substr $S10, rx1149_tgt, $I11, 3
    ne $S10, "::=", rx1149_fail
    add rx1149_pos, 3
    set_addr $I10, rxcap_1154_fail
    ($I12, $I11) = rx1149_cur."!mark_peek"($I10)
    rx1149_cur."!cursor_pos"($I11)
    ($P10) = rx1149_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1149_pos, "")
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1154_done
  rxcap_1154_fail:
    goto rx1149_fail
  rxcap_1154_done:
  # rx subrule "O" subtype=capture negate=
    rx1149_cur."!cursor_pos"(rx1149_pos)
    $P10 = rx1149_cur."O"("%assignment, :pasttype<bind>")
    unless $P10, rx1149_fail
    rx1149_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1149_pos = $P10."pos"()
  # rx pass
    rx1149_cur."!cursor_pass"(rx1149_pos, "infix:sym<::=>")
    rx1149_cur."!cursor_debug"("PASS  ", "infix:sym<::=>", " at pos=", rx1149_pos)
    .return (rx1149_cur)
  rx1149_fail:
.annotate "line", 390
    (rx1149_rep, rx1149_pos, $I10, $P10) = rx1149_cur."!mark_fail"(0)
    lt rx1149_pos, -1, rx1149_done
    eq rx1149_pos, -1, rx1149_fail
    jump $I10
  rx1149_done:
    rx1149_cur."!cursor_fail"()
    rx1149_cur."!cursor_debug"("FAIL  ", "infix:sym<::=>")
    .return (rx1149_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<::=>"  :subid("296_1259103982.97329") :method
.annotate "line", 390
    $P1151 = self."!PREFIX__!subrule"("O", "::=")
    new $P1152, "ResizablePMCArray"
    push $P1152, $P1151
    .return ($P1152)
.end


.namespace ["NQP";"Grammar"]
.sub "infix:sym<,>"  :subid("297_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1156_tgt
    .local int rx1156_pos
    .local int rx1156_off
    .local int rx1156_eos
    .local int rx1156_rep
    .local pmc rx1156_cur
    (rx1156_cur, rx1156_pos, rx1156_tgt) = self."!cursor_start"()
    rx1156_cur."!cursor_debug"("START ", "infix:sym<,>")
    .lex unicode:"$\x{a2}", rx1156_cur
    .local pmc match
    .lex "$/", match
    length rx1156_eos, rx1156_tgt
    set rx1156_off, 0
    lt rx1156_pos, 2, rx1156_start
    sub rx1156_off, rx1156_pos, 1
    substr rx1156_tgt, rx1156_tgt, rx1156_off
  rx1156_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1160_done
    goto rxscan1160_scan
  rxscan1160_loop:
    ($P10) = rx1156_cur."from"()
    inc $P10
    set rx1156_pos, $P10
    ge rx1156_pos, rx1156_eos, rxscan1160_done
  rxscan1160_scan:
    set_addr $I10, rxscan1160_loop
    rx1156_cur."!mark_push"(0, rx1156_pos, $I10)
  rxscan1160_done:
.annotate "line", 492
  # rx subcapture "sym"
    set_addr $I10, rxcap_1161_fail
    rx1156_cur."!mark_push"(0, rx1156_pos, $I10)
  # rx literal  ","
    add $I11, rx1156_pos, 1
    gt $I11, rx1156_eos, rx1156_fail
    sub $I11, rx1156_pos, rx1156_off
    substr $S10, rx1156_tgt, $I11, 1
    ne $S10, ",", rx1156_fail
    add rx1156_pos, 1
    set_addr $I10, rxcap_1161_fail
    ($I12, $I11) = rx1156_cur."!mark_peek"($I10)
    rx1156_cur."!cursor_pos"($I11)
    ($P10) = rx1156_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1156_pos, "")
    rx1156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1161_done
  rxcap_1161_fail:
    goto rx1156_fail
  rxcap_1161_done:
  # rx subrule "O" subtype=capture negate=
    rx1156_cur."!cursor_pos"(rx1156_pos)
    $P10 = rx1156_cur."O"("%comma, :pasttype<list>")
    unless $P10, rx1156_fail
    rx1156_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1156_pos = $P10."pos"()
  # rx pass
    rx1156_cur."!cursor_pass"(rx1156_pos, "infix:sym<,>")
    rx1156_cur."!cursor_debug"("PASS  ", "infix:sym<,>", " at pos=", rx1156_pos)
    .return (rx1156_cur)
  rx1156_fail:
.annotate "line", 390
    (rx1156_rep, rx1156_pos, $I10, $P10) = rx1156_cur."!mark_fail"(0)
    lt rx1156_pos, -1, rx1156_done
    eq rx1156_pos, -1, rx1156_fail
    jump $I10
  rx1156_done:
    rx1156_cur."!cursor_fail"()
    rx1156_cur."!cursor_debug"("FAIL  ", "infix:sym<,>")
    .return (rx1156_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__infix:sym<,>"  :subid("298_1259103982.97329") :method
.annotate "line", 390
    $P1158 = self."!PREFIX__!subrule"("O", ",")
    new $P1159, "ResizablePMCArray"
    push $P1159, $P1158
    .return ($P1159)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<return>"  :subid("299_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1163_tgt
    .local int rx1163_pos
    .local int rx1163_off
    .local int rx1163_eos
    .local int rx1163_rep
    .local pmc rx1163_cur
    (rx1163_cur, rx1163_pos, rx1163_tgt) = self."!cursor_start"()
    rx1163_cur."!cursor_debug"("START ", "prefix:sym<return>")
    .lex unicode:"$\x{a2}", rx1163_cur
    .local pmc match
    .lex "$/", match
    length rx1163_eos, rx1163_tgt
    set rx1163_off, 0
    lt rx1163_pos, 2, rx1163_start
    sub rx1163_off, rx1163_pos, 1
    substr rx1163_tgt, rx1163_tgt, rx1163_off
  rx1163_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1166_done
    goto rxscan1166_scan
  rxscan1166_loop:
    ($P10) = rx1163_cur."from"()
    inc $P10
    set rx1163_pos, $P10
    ge rx1163_pos, rx1163_eos, rxscan1166_done
  rxscan1166_scan:
    set_addr $I10, rxscan1166_loop
    rx1163_cur."!mark_push"(0, rx1163_pos, $I10)
  rxscan1166_done:
.annotate "line", 494
  # rx subcapture "sym"
    set_addr $I10, rxcap_1167_fail
    rx1163_cur."!mark_push"(0, rx1163_pos, $I10)
  # rx literal  "return"
    add $I11, rx1163_pos, 6
    gt $I11, rx1163_eos, rx1163_fail
    sub $I11, rx1163_pos, rx1163_off
    substr $S10, rx1163_tgt, $I11, 6
    ne $S10, "return", rx1163_fail
    add rx1163_pos, 6
    set_addr $I10, rxcap_1167_fail
    ($I12, $I11) = rx1163_cur."!mark_peek"($I10)
    rx1163_cur."!cursor_pos"($I11)
    ($P10) = rx1163_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1163_pos, "")
    rx1163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1167_done
  rxcap_1167_fail:
    goto rx1163_fail
  rxcap_1167_done:
  # rx charclass s
    ge rx1163_pos, rx1163_eos, rx1163_fail
    sub $I10, rx1163_pos, rx1163_off
    is_cclass $I11, 32, rx1163_tgt, $I10
    unless $I11, rx1163_fail
    inc rx1163_pos
  # rx subrule "O" subtype=capture negate=
    rx1163_cur."!cursor_pos"(rx1163_pos)
    $P10 = rx1163_cur."O"("%list_prefix, :pasttype<return>")
    unless $P10, rx1163_fail
    rx1163_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1163_pos = $P10."pos"()
  # rx pass
    rx1163_cur."!cursor_pass"(rx1163_pos, "prefix:sym<return>")
    rx1163_cur."!cursor_debug"("PASS  ", "prefix:sym<return>", " at pos=", rx1163_pos)
    .return (rx1163_cur)
  rx1163_fail:
.annotate "line", 390
    (rx1163_rep, rx1163_pos, $I10, $P10) = rx1163_cur."!mark_fail"(0)
    lt rx1163_pos, -1, rx1163_done
    eq rx1163_pos, -1, rx1163_fail
    jump $I10
  rx1163_done:
    rx1163_cur."!cursor_fail"()
    rx1163_cur."!cursor_debug"("FAIL  ", "prefix:sym<return>")
    .return (rx1163_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<return>"  :subid("300_1259103982.97329") :method
.annotate "line", 390
    new $P1165, "ResizablePMCArray"
    push $P1165, "return"
    .return ($P1165)
.end


.namespace ["NQP";"Grammar"]
.sub "prefix:sym<make>"  :subid("301_1259103982.97329") :method :outer("11_1259103982.97329")
.annotate "line", 390
    .local string rx1169_tgt
    .local int rx1169_pos
    .local int rx1169_off
    .local int rx1169_eos
    .local int rx1169_rep
    .local pmc rx1169_cur
    (rx1169_cur, rx1169_pos, rx1169_tgt) = self."!cursor_start"()
    rx1169_cur."!cursor_debug"("START ", "prefix:sym<make>")
    .lex unicode:"$\x{a2}", rx1169_cur
    .local pmc match
    .lex "$/", match
    length rx1169_eos, rx1169_tgt
    set rx1169_off, 0
    lt rx1169_pos, 2, rx1169_start
    sub rx1169_off, rx1169_pos, 1
    substr rx1169_tgt, rx1169_tgt, rx1169_off
  rx1169_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1172_done
    goto rxscan1172_scan
  rxscan1172_loop:
    ($P10) = rx1169_cur."from"()
    inc $P10
    set rx1169_pos, $P10
    ge rx1169_pos, rx1169_eos, rxscan1172_done
  rxscan1172_scan:
    set_addr $I10, rxscan1172_loop
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  rxscan1172_done:
.annotate "line", 495
  # rx subcapture "sym"
    set_addr $I10, rxcap_1173_fail
    rx1169_cur."!mark_push"(0, rx1169_pos, $I10)
  # rx literal  "make"
    add $I11, rx1169_pos, 4
    gt $I11, rx1169_eos, rx1169_fail
    sub $I11, rx1169_pos, rx1169_off
    substr $S10, rx1169_tgt, $I11, 4
    ne $S10, "make", rx1169_fail
    add rx1169_pos, 4
    set_addr $I10, rxcap_1173_fail
    ($I12, $I11) = rx1169_cur."!mark_peek"($I10)
    rx1169_cur."!cursor_pos"($I11)
    ($P10) = rx1169_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1169_pos, "")
    rx1169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("sym")
    goto rxcap_1173_done
  rxcap_1173_fail:
    goto rx1169_fail
  rxcap_1173_done:
  # rx charclass s
    ge rx1169_pos, rx1169_eos, rx1169_fail
    sub $I10, rx1169_pos, rx1169_off
    is_cclass $I11, 32, rx1169_tgt, $I10
    unless $I11, rx1169_fail
    inc rx1169_pos
  # rx subrule "O" subtype=capture negate=
    rx1169_cur."!cursor_pos"(rx1169_pos)
    $P10 = rx1169_cur."O"("%list_prefix")
    unless $P10, rx1169_fail
    rx1169_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("O")
    rx1169_pos = $P10."pos"()
  # rx pass
    rx1169_cur."!cursor_pass"(rx1169_pos, "prefix:sym<make>")
    rx1169_cur."!cursor_debug"("PASS  ", "prefix:sym<make>", " at pos=", rx1169_pos)
    .return (rx1169_cur)
  rx1169_fail:
.annotate "line", 390
    (rx1169_rep, rx1169_pos, $I10, $P10) = rx1169_cur."!mark_fail"(0)
    lt rx1169_pos, -1, rx1169_done
    eq rx1169_pos, -1, rx1169_fail
    jump $I10
  rx1169_done:
    rx1169_cur."!cursor_fail"()
    rx1169_cur."!cursor_debug"("FAIL  ", "prefix:sym<make>")
    .return (rx1169_cur)
    .return ()
.end


.namespace ["NQP";"Grammar"]
.sub "!PREFIX__prefix:sym<make>"  :subid("302_1259103982.97329") :method
.annotate "line", 390
    new $P1171, "ResizablePMCArray"
    push $P1171, "make"
    .return ($P1171)
.end


.namespace ["NQP";"Regex"]
.sub "_block1174"  :subid("303_1259103982.97329") :outer("11_1259103982.97329")
.annotate "line", 498
    .const 'Sub' $P1208 = "314_1259103982.97329" 
    capture_lex $P1208
    .const 'Sub' $P1195 = "311_1259103982.97329" 
    capture_lex $P1195
    .const 'Sub' $P1190 = "309_1259103982.97329" 
    capture_lex $P1190
    .const 'Sub' $P1185 = "307_1259103982.97329" 
    capture_lex $P1185
    .const 'Sub' $P1176 = "304_1259103982.97329" 
    capture_lex $P1176
    .const 'Sub' $P1208 = "314_1259103982.97329" 
    capture_lex $P1208
    .return ($P1208)
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<:my>"  :subid("304_1259103982.97329") :method :outer("303_1259103982.97329")
.annotate "line", 498
    .const 'Sub' $P1182 = "306_1259103982.97329" 
    capture_lex $P1182
    .local string rx1177_tgt
    .local int rx1177_pos
    .local int rx1177_off
    .local int rx1177_eos
    .local int rx1177_rep
    .local pmc rx1177_cur
    (rx1177_cur, rx1177_pos, rx1177_tgt) = self."!cursor_start"()
    rx1177_cur."!cursor_debug"("START ", "metachar:sym<:my>")
    .lex unicode:"$\x{a2}", rx1177_cur
    .local pmc match
    .lex "$/", match
    length rx1177_eos, rx1177_tgt
    set rx1177_off, 0
    lt rx1177_pos, 2, rx1177_start
    sub rx1177_off, rx1177_pos, 1
    substr rx1177_tgt, rx1177_tgt, rx1177_off
  rx1177_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1180_done
    goto rxscan1180_scan
  rxscan1180_loop:
    ($P10) = rx1177_cur."from"()
    inc $P10
    set rx1177_pos, $P10
    ge rx1177_pos, rx1177_eos, rxscan1180_done
  rxscan1180_scan:
    set_addr $I10, rxscan1180_loop
    rx1177_cur."!mark_push"(0, rx1177_pos, $I10)
  rxscan1180_done:
.annotate "line", 500
  # rx literal  ":"
    add $I11, rx1177_pos, 1
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    substr $S10, rx1177_tgt, $I11, 1
    ne $S10, ":", rx1177_fail
    add rx1177_pos, 1
  # rx subrule "before" subtype=zerowidth negate=
    rx1177_cur."!cursor_pos"(rx1177_pos)
    .const 'Sub' $P1182 = "306_1259103982.97329" 
    capture_lex $P1182
    $P10 = rx1177_cur."before"($P1182)
    unless $P10, rx1177_fail
  # rx subrule "LANG" subtype=capture negate=
    rx1177_cur."!cursor_pos"(rx1177_pos)
    $P10 = rx1177_cur."LANG"("MAIN", "statement")
    unless $P10, rx1177_fail
    rx1177_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("statement")
    rx1177_pos = $P10."pos"()
  # rx subrule "ws" subtype=method negate=
    rx1177_cur."!cursor_pos"(rx1177_pos)
    $P10 = rx1177_cur."ws"()
    unless $P10, rx1177_fail
    rx1177_pos = $P10."pos"()
  # rx literal  ";"
    add $I11, rx1177_pos, 1
    gt $I11, rx1177_eos, rx1177_fail
    sub $I11, rx1177_pos, rx1177_off
    substr $S10, rx1177_tgt, $I11, 1
    ne $S10, ";", rx1177_fail
    add rx1177_pos, 1
.annotate "line", 499
  # rx pass
    rx1177_cur."!cursor_pass"(rx1177_pos, "metachar:sym<:my>")
    rx1177_cur."!cursor_debug"("PASS  ", "metachar:sym<:my>", " at pos=", rx1177_pos)
    .return (rx1177_cur)
  rx1177_fail:
.annotate "line", 498
    (rx1177_rep, rx1177_pos, $I10, $P10) = rx1177_cur."!mark_fail"(0)
    lt rx1177_pos, -1, rx1177_done
    eq rx1177_pos, -1, rx1177_fail
    jump $I10
  rx1177_done:
    rx1177_cur."!cursor_fail"()
    rx1177_cur."!cursor_debug"("FAIL  ", "metachar:sym<:my>")
    .return (rx1177_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<:my>"  :subid("305_1259103982.97329") :method
.annotate "line", 498
    new $P1179, "ResizablePMCArray"
    push $P1179, ":"
    .return ($P1179)
.end


.namespace ["NQP";"Regex"]
.sub "_block1181"  :anon :subid("306_1259103982.97329") :method :outer("304_1259103982.97329")
.annotate "line", 500
    .local string rx1183_tgt
    .local int rx1183_pos
    .local int rx1183_off
    .local int rx1183_eos
    .local int rx1183_rep
    .local pmc rx1183_cur
    (rx1183_cur, rx1183_pos, rx1183_tgt) = self."!cursor_start"()
    rx1183_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1183_cur
    .local pmc match
    .lex "$/", match
    length rx1183_eos, rx1183_tgt
    set rx1183_off, 0
    lt rx1183_pos, 2, rx1183_start
    sub rx1183_off, rx1183_pos, 1
    substr rx1183_tgt, rx1183_tgt, rx1183_off
  rx1183_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1184_done
    goto rxscan1184_scan
  rxscan1184_loop:
    ($P10) = rx1183_cur."from"()
    inc $P10
    set rx1183_pos, $P10
    ge rx1183_pos, rx1183_eos, rxscan1184_done
  rxscan1184_scan:
    set_addr $I10, rxscan1184_loop
    rx1183_cur."!mark_push"(0, rx1183_pos, $I10)
  rxscan1184_done:
  # rx literal  "my"
    add $I11, rx1183_pos, 2
    gt $I11, rx1183_eos, rx1183_fail
    sub $I11, rx1183_pos, rx1183_off
    substr $S10, rx1183_tgt, $I11, 2
    ne $S10, "my", rx1183_fail
    add rx1183_pos, 2
  # rx pass
    rx1183_cur."!cursor_pass"(rx1183_pos, "")
    rx1183_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1183_pos)
    .return (rx1183_cur)
  rx1183_fail:
    (rx1183_rep, rx1183_pos, $I10, $P10) = rx1183_cur."!mark_fail"(0)
    lt rx1183_pos, -1, rx1183_done
    eq rx1183_pos, -1, rx1183_fail
    jump $I10
  rx1183_done:
    rx1183_cur."!cursor_fail"()
    rx1183_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1183_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "metachar:sym<{ }>"  :subid("307_1259103982.97329") :method :outer("303_1259103982.97329")
.annotate "line", 498
    .local string rx1186_tgt
    .local int rx1186_pos
    .local int rx1186_off
    .local int rx1186_eos
    .local int rx1186_rep
    .local pmc rx1186_cur
    (rx1186_cur, rx1186_pos, rx1186_tgt) = self."!cursor_start"()
    rx1186_cur."!cursor_debug"("START ", "metachar:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1186_cur
    .local pmc match
    .lex "$/", match
    length rx1186_eos, rx1186_tgt
    set rx1186_off, 0
    lt rx1186_pos, 2, rx1186_start
    sub rx1186_off, rx1186_pos, 1
    substr rx1186_tgt, rx1186_tgt, rx1186_off
  rx1186_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1189_done
    goto rxscan1189_scan
  rxscan1189_loop:
    ($P10) = rx1186_cur."from"()
    inc $P10
    set rx1186_pos, $P10
    ge rx1186_pos, rx1186_eos, rxscan1189_done
  rxscan1189_scan:
    set_addr $I10, rxscan1189_loop
    rx1186_cur."!mark_push"(0, rx1186_pos, $I10)
  rxscan1189_done:
.annotate "line", 504
  # rx enumcharlist negate=0 zerowidth
    ge rx1186_pos, rx1186_eos, rx1186_fail
    sub $I10, rx1186_pos, rx1186_off
    substr $S10, rx1186_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1186_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1186_cur."!cursor_pos"(rx1186_pos)
    $P10 = rx1186_cur."codeblock"()
    unless $P10, rx1186_fail
    rx1186_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1186_pos = $P10."pos"()
.annotate "line", 503
  # rx pass
    rx1186_cur."!cursor_pass"(rx1186_pos, "metachar:sym<{ }>")
    rx1186_cur."!cursor_debug"("PASS  ", "metachar:sym<{ }>", " at pos=", rx1186_pos)
    .return (rx1186_cur)
  rx1186_fail:
.annotate "line", 498
    (rx1186_rep, rx1186_pos, $I10, $P10) = rx1186_cur."!mark_fail"(0)
    lt rx1186_pos, -1, rx1186_done
    eq rx1186_pos, -1, rx1186_fail
    jump $I10
  rx1186_done:
    rx1186_cur."!cursor_fail"()
    rx1186_cur."!cursor_debug"("FAIL  ", "metachar:sym<{ }>")
    .return (rx1186_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__metachar:sym<{ }>"  :subid("308_1259103982.97329") :method
.annotate "line", 498
    new $P1188, "ResizablePMCArray"
    push $P1188, "{"
    .return ($P1188)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<{ }>"  :subid("309_1259103982.97329") :method :outer("303_1259103982.97329")
.annotate "line", 498
    .local string rx1191_tgt
    .local int rx1191_pos
    .local int rx1191_off
    .local int rx1191_eos
    .local int rx1191_rep
    .local pmc rx1191_cur
    (rx1191_cur, rx1191_pos, rx1191_tgt) = self."!cursor_start"()
    rx1191_cur."!cursor_debug"("START ", "assertion:sym<{ }>")
    .lex unicode:"$\x{a2}", rx1191_cur
    .local pmc match
    .lex "$/", match
    length rx1191_eos, rx1191_tgt
    set rx1191_off, 0
    lt rx1191_pos, 2, rx1191_start
    sub rx1191_off, rx1191_pos, 1
    substr rx1191_tgt, rx1191_tgt, rx1191_off
  rx1191_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1194_done
    goto rxscan1194_scan
  rxscan1194_loop:
    ($P10) = rx1191_cur."from"()
    inc $P10
    set rx1191_pos, $P10
    ge rx1191_pos, rx1191_eos, rxscan1194_done
  rxscan1194_scan:
    set_addr $I10, rxscan1194_loop
    rx1191_cur."!mark_push"(0, rx1191_pos, $I10)
  rxscan1194_done:
.annotate "line", 508
  # rx enumcharlist negate=0 zerowidth
    ge rx1191_pos, rx1191_eos, rx1191_fail
    sub $I10, rx1191_pos, rx1191_off
    substr $S10, rx1191_tgt, $I10, 1
    index $I11, "{", $S10
    lt $I11, 0, rx1191_fail
  # rx subrule "codeblock" subtype=capture negate=
    rx1191_cur."!cursor_pos"(rx1191_pos)
    $P10 = rx1191_cur."codeblock"()
    unless $P10, rx1191_fail
    rx1191_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("codeblock")
    rx1191_pos = $P10."pos"()
.annotate "line", 507
  # rx pass
    rx1191_cur."!cursor_pass"(rx1191_pos, "assertion:sym<{ }>")
    rx1191_cur."!cursor_debug"("PASS  ", "assertion:sym<{ }>", " at pos=", rx1191_pos)
    .return (rx1191_cur)
  rx1191_fail:
.annotate "line", 498
    (rx1191_rep, rx1191_pos, $I10, $P10) = rx1191_cur."!mark_fail"(0)
    lt rx1191_pos, -1, rx1191_done
    eq rx1191_pos, -1, rx1191_fail
    jump $I10
  rx1191_done:
    rx1191_cur."!cursor_fail"()
    rx1191_cur."!cursor_debug"("FAIL  ", "assertion:sym<{ }>")
    .return (rx1191_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<{ }>"  :subid("310_1259103982.97329") :method
.annotate "line", 498
    new $P1193, "ResizablePMCArray"
    push $P1193, "{"
    .return ($P1193)
.end


.namespace ["NQP";"Regex"]
.sub "assertion:sym<name>"  :subid("311_1259103982.97329") :method :outer("303_1259103982.97329")
.annotate "line", 498
    .const 'Sub' $P1204 = "313_1259103982.97329" 
    capture_lex $P1204
    .local string rx1196_tgt
    .local int rx1196_pos
    .local int rx1196_off
    .local int rx1196_eos
    .local int rx1196_rep
    .local pmc rx1196_cur
    (rx1196_cur, rx1196_pos, rx1196_tgt) = self."!cursor_start"()
    rx1196_cur."!cursor_debug"("START ", "assertion:sym<name>")
    rx1196_cur."!cursor_caparray"("assertion", "nibbler", "arglist")
    .lex unicode:"$\x{a2}", rx1196_cur
    .local pmc match
    .lex "$/", match
    length rx1196_eos, rx1196_tgt
    set rx1196_off, 0
    lt rx1196_pos, 2, rx1196_start
    sub rx1196_off, rx1196_pos, 1
    substr rx1196_tgt, rx1196_tgt, rx1196_off
  rx1196_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1199_done
    goto rxscan1199_scan
  rxscan1199_loop:
    ($P10) = rx1196_cur."from"()
    inc $P10
    set rx1196_pos, $P10
    ge rx1196_pos, rx1196_eos, rxscan1199_done
  rxscan1199_scan:
    set_addr $I10, rxscan1199_loop
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
  rxscan1199_done:
.annotate "line", 512
  # rx subcapture "longname"
    set_addr $I10, rxcap_1200_fail
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
  # rx charclass_q w r 1..-1
    sub $I10, rx1196_pos, rx1196_off
    find_not_cclass $I11, 8192, rx1196_tgt, $I10, rx1196_eos
    add $I12, $I10, 1
    lt $I11, $I12, rx1196_fail
    add rx1196_pos, rx1196_off, $I11
    set_addr $I10, rxcap_1200_fail
    ($I12, $I11) = rx1196_cur."!mark_peek"($I10)
    rx1196_cur."!cursor_pos"($I11)
    ($P10) = rx1196_cur."!cursor_start"()
    $P10."!cursor_pass"(rx1196_pos, "")
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("longname")
    goto rxcap_1200_done
  rxcap_1200_fail:
    goto rx1196_fail
  rxcap_1200_done:
.annotate "line", 519
  # rx rxquantr1201 ** 0..1
    set_addr $I1207, rxquantr1201_done
    rx1196_cur."!mark_push"(0, rx1196_pos, $I1207)
  rxquantr1201_loop:
  alt1202_0:
.annotate "line", 513
    set_addr $I10, alt1202_1
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
.annotate "line", 514
  # rx subrule "before" subtype=zerowidth negate=
    rx1196_cur."!cursor_pos"(rx1196_pos)
    .const 'Sub' $P1204 = "313_1259103982.97329" 
    capture_lex $P1204
    $P10 = rx1196_cur."before"($P1204)
    unless $P10, rx1196_fail
    goto alt1202_end
  alt1202_1:
    set_addr $I10, alt1202_2
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
.annotate "line", 515
  # rx literal  "="
    add $I11, rx1196_pos, 1
    gt $I11, rx1196_eos, rx1196_fail
    sub $I11, rx1196_pos, rx1196_off
    substr $S10, rx1196_tgt, $I11, 1
    ne $S10, "=", rx1196_fail
    add rx1196_pos, 1
  # rx subrule "assertion" subtype=capture negate=
    rx1196_cur."!cursor_pos"(rx1196_pos)
    $P10 = rx1196_cur."assertion"()
    unless $P10, rx1196_fail
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("assertion")
    rx1196_pos = $P10."pos"()
    goto alt1202_end
  alt1202_2:
    set_addr $I10, alt1202_3
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
.annotate "line", 516
  # rx literal  ":"
    add $I11, rx1196_pos, 1
    gt $I11, rx1196_eos, rx1196_fail
    sub $I11, rx1196_pos, rx1196_off
    substr $S10, rx1196_tgt, $I11, 1
    ne $S10, ":", rx1196_fail
    add rx1196_pos, 1
  # rx subrule "arglist" subtype=capture negate=
    rx1196_cur."!cursor_pos"(rx1196_pos)
    $P10 = rx1196_cur."arglist"()
    unless $P10, rx1196_fail
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1196_pos = $P10."pos"()
    goto alt1202_end
  alt1202_3:
    set_addr $I10, alt1202_4
    rx1196_cur."!mark_push"(0, rx1196_pos, $I10)
.annotate "line", 517
  # rx literal  "("
    add $I11, rx1196_pos, 1
    gt $I11, rx1196_eos, rx1196_fail
    sub $I11, rx1196_pos, rx1196_off
    substr $S10, rx1196_tgt, $I11, 1
    ne $S10, "(", rx1196_fail
    add rx1196_pos, 1
  # rx subrule "LANG" subtype=capture negate=
    rx1196_cur."!cursor_pos"(rx1196_pos)
    $P10 = rx1196_cur."LANG"("MAIN", "arglist")
    unless $P10, rx1196_fail
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("arglist")
    rx1196_pos = $P10."pos"()
  # rx literal  ")"
    add $I11, rx1196_pos, 1
    gt $I11, rx1196_eos, rx1196_fail
    sub $I11, rx1196_pos, rx1196_off
    substr $S10, rx1196_tgt, $I11, 1
    ne $S10, ")", rx1196_fail
    add rx1196_pos, 1
    goto alt1202_end
  alt1202_4:
.annotate "line", 518
  # rx subrule "normspace" subtype=method negate=
    rx1196_cur."!cursor_pos"(rx1196_pos)
    $P10 = rx1196_cur."normspace"()
    unless $P10, rx1196_fail
    rx1196_pos = $P10."pos"()
  # rx subrule "nibbler" subtype=capture negate=
    rx1196_cur."!cursor_pos"(rx1196_pos)
    $P10 = rx1196_cur."nibbler"()
    unless $P10, rx1196_fail
    rx1196_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("nibbler")
    rx1196_pos = $P10."pos"()
  alt1202_end:
.annotate "line", 519
    (rx1196_rep) = rx1196_cur."!mark_commit"($I1207)
  rxquantr1201_done:
.annotate "line", 511
  # rx pass
    rx1196_cur."!cursor_pass"(rx1196_pos, "assertion:sym<name>")
    rx1196_cur."!cursor_debug"("PASS  ", "assertion:sym<name>", " at pos=", rx1196_pos)
    .return (rx1196_cur)
  rx1196_fail:
.annotate "line", 498
    (rx1196_rep, rx1196_pos, $I10, $P10) = rx1196_cur."!mark_fail"(0)
    lt rx1196_pos, -1, rx1196_done
    eq rx1196_pos, -1, rx1196_fail
    jump $I10
  rx1196_done:
    rx1196_cur."!cursor_fail"()
    rx1196_cur."!cursor_debug"("FAIL  ", "assertion:sym<name>")
    .return (rx1196_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__assertion:sym<name>"  :subid("312_1259103982.97329") :method
.annotate "line", 498
    new $P1198, "ResizablePMCArray"
    push $P1198, ""
    .return ($P1198)
.end


.namespace ["NQP";"Regex"]
.sub "_block1203"  :anon :subid("313_1259103982.97329") :method :outer("311_1259103982.97329")
.annotate "line", 514
    .local string rx1205_tgt
    .local int rx1205_pos
    .local int rx1205_off
    .local int rx1205_eos
    .local int rx1205_rep
    .local pmc rx1205_cur
    (rx1205_cur, rx1205_pos, rx1205_tgt) = self."!cursor_start"()
    rx1205_cur."!cursor_debug"("START ", "")
    .lex unicode:"$\x{a2}", rx1205_cur
    .local pmc match
    .lex "$/", match
    length rx1205_eos, rx1205_tgt
    set rx1205_off, 0
    lt rx1205_pos, 2, rx1205_start
    sub rx1205_off, rx1205_pos, 1
    substr rx1205_tgt, rx1205_tgt, rx1205_off
  rx1205_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1206_done
    goto rxscan1206_scan
  rxscan1206_loop:
    ($P10) = rx1205_cur."from"()
    inc $P10
    set rx1205_pos, $P10
    ge rx1205_pos, rx1205_eos, rxscan1206_done
  rxscan1206_scan:
    set_addr $I10, rxscan1206_loop
    rx1205_cur."!mark_push"(0, rx1205_pos, $I10)
  rxscan1206_done:
  # rx literal  ">"
    add $I11, rx1205_pos, 1
    gt $I11, rx1205_eos, rx1205_fail
    sub $I11, rx1205_pos, rx1205_off
    substr $S10, rx1205_tgt, $I11, 1
    ne $S10, ">", rx1205_fail
    add rx1205_pos, 1
  # rx pass
    rx1205_cur."!cursor_pass"(rx1205_pos, "")
    rx1205_cur."!cursor_debug"("PASS  ", "", " at pos=", rx1205_pos)
    .return (rx1205_cur)
  rx1205_fail:
    (rx1205_rep, rx1205_pos, $I10, $P10) = rx1205_cur."!mark_fail"(0)
    lt rx1205_pos, -1, rx1205_done
    eq rx1205_pos, -1, rx1205_fail
    jump $I10
  rx1205_done:
    rx1205_cur."!cursor_fail"()
    rx1205_cur."!cursor_debug"("FAIL  ", "")
    .return (rx1205_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "codeblock"  :subid("314_1259103982.97329") :method :outer("303_1259103982.97329")
.annotate "line", 498
    .local string rx1209_tgt
    .local int rx1209_pos
    .local int rx1209_off
    .local int rx1209_eos
    .local int rx1209_rep
    .local pmc rx1209_cur
    (rx1209_cur, rx1209_pos, rx1209_tgt) = self."!cursor_start"()
    rx1209_cur."!cursor_debug"("START ", "codeblock")
    .lex unicode:"$\x{a2}", rx1209_cur
    .local pmc match
    .lex "$/", match
    length rx1209_eos, rx1209_tgt
    set rx1209_off, 0
    lt rx1209_pos, 2, rx1209_start
    sub rx1209_off, rx1209_pos, 1
    substr rx1209_tgt, rx1209_tgt, rx1209_off
  rx1209_start:
    $I10 = self.'from'()
    ne $I10, -1, rxscan1213_done
    goto rxscan1213_scan
  rxscan1213_loop:
    ($P10) = rx1209_cur."from"()
    inc $P10
    set rx1209_pos, $P10
    ge rx1209_pos, rx1209_eos, rxscan1213_done
  rxscan1213_scan:
    set_addr $I10, rxscan1213_loop
    rx1209_cur."!mark_push"(0, rx1209_pos, $I10)
  rxscan1213_done:
.annotate "line", 524
  # rx subrule "LANG" subtype=capture negate=
    rx1209_cur."!cursor_pos"(rx1209_pos)
    $P10 = rx1209_cur."LANG"("MAIN", "pblock")
    unless $P10, rx1209_fail
    rx1209_cur."!mark_push"(0, -1, 0, $P10)
    $P10."!cursor_names"("block")
    rx1209_pos = $P10."pos"()
.annotate "line", 523
  # rx pass
    rx1209_cur."!cursor_pass"(rx1209_pos, "codeblock")
    rx1209_cur."!cursor_debug"("PASS  ", "codeblock", " at pos=", rx1209_pos)
    .return (rx1209_cur)
  rx1209_fail:
.annotate "line", 498
    (rx1209_rep, rx1209_pos, $I10, $P10) = rx1209_cur."!mark_fail"(0)
    lt rx1209_pos, -1, rx1209_done
    eq rx1209_pos, -1, rx1209_fail
    jump $I10
  rx1209_done:
    rx1209_cur."!cursor_fail"()
    rx1209_cur."!cursor_debug"("FAIL  ", "codeblock")
    .return (rx1209_cur)
    .return ()
.end


.namespace ["NQP";"Regex"]
.sub "!PREFIX__codeblock"  :subid("315_1259103982.97329") :method
.annotate "line", 498
    $P1211 = self."!PREFIX__!subrule"("block", "")
    new $P1212, "ResizablePMCArray"
    push $P1212, $P1211
    .return ($P1212)
.end

### .include 'gen/nqp-actions.pir'

.namespace []
.sub "_block11"  :anon :subid("10_1259103989.89791")
.annotate "line", 0
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    capture_lex $P14
    $P1962 = $P14()
.annotate "line", 1
    .return ($P1962)
.end


.namespace []
.sub "" :load :init :subid("post116") :outer("10_1259103989.89791")
.annotate "line", 0
    .const 'Sub' $P12 = "10_1259103989.89791" 
    .local pmc block
    set block, $P12
    $P1963 = get_root_global ["parrot"], "P6metaclass"
    $P1963."new_class"("NQP::Actions", "HLL::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block13"  :subid("11_1259103989.89791") :outer("10_1259103989.89791")
.annotate "line", 3
    .const 'Sub' $P1958 = "115_1259103989.89791" 
    capture_lex $P1958
    get_hll_global $P1894, ["NQP";"RegexActions"], "_block1893" 
    capture_lex $P1894
    .const 'Sub' $P1881 = "109_1259103989.89791" 
    capture_lex $P1881
    .const 'Sub' $P1871 = "108_1259103989.89791" 
    capture_lex $P1871
    .const 'Sub' $P1861 = "107_1259103989.89791" 
    capture_lex $P1861
    .const 'Sub' $P1851 = "106_1259103989.89791" 
    capture_lex $P1851
    .const 'Sub' $P1837 = "105_1259103989.89791" 
    capture_lex $P1837
    .const 'Sub' $P1827 = "104_1259103989.89791" 
    capture_lex $P1827
    .const 'Sub' $P1813 = "103_1259103989.89791" 
    capture_lex $P1813
    .const 'Sub' $P1803 = "102_1259103989.89791" 
    capture_lex $P1803
    .const 'Sub' $P1793 = "101_1259103989.89791" 
    capture_lex $P1793
    .const 'Sub' $P1783 = "100_1259103989.89791" 
    capture_lex $P1783
    .const 'Sub' $P1773 = "99_1259103989.89791" 
    capture_lex $P1773
    .const 'Sub' $P1763 = "98_1259103989.89791" 
    capture_lex $P1763
    .const 'Sub' $P1735 = "97_1259103989.89791" 
    capture_lex $P1735
    .const 'Sub' $P1718 = "96_1259103989.89791" 
    capture_lex $P1718
    .const 'Sub' $P1708 = "95_1259103989.89791" 
    capture_lex $P1708
    .const 'Sub' $P1696 = "94_1259103989.89791" 
    capture_lex $P1696
    .const 'Sub' $P1684 = "93_1259103989.89791" 
    capture_lex $P1684
    .const 'Sub' $P1672 = "92_1259103989.89791" 
    capture_lex $P1672
    .const 'Sub' $P1662 = "91_1259103989.89791" 
    capture_lex $P1662
    .const 'Sub' $P1633 = "90_1259103989.89791" 
    capture_lex $P1633
    .const 'Sub' $P1609 = "89_1259103989.89791" 
    capture_lex $P1609
    .const 'Sub' $P1599 = "88_1259103989.89791" 
    capture_lex $P1599
    .const 'Sub' $P1572 = "87_1259103989.89791" 
    capture_lex $P1572
    .const 'Sub' $P1554 = "86_1259103989.89791" 
    capture_lex $P1554
    .const 'Sub' $P1544 = "85_1259103989.89791" 
    capture_lex $P1544
    .const 'Sub' $P1460 = "82_1259103989.89791" 
    capture_lex $P1460
    .const 'Sub' $P1450 = "81_1259103989.89791" 
    capture_lex $P1450
    .const 'Sub' $P1421 = "80_1259103989.89791" 
    capture_lex $P1421
    .const 'Sub' $P1379 = "79_1259103989.89791" 
    capture_lex $P1379
    .const 'Sub' $P1363 = "78_1259103989.89791" 
    capture_lex $P1363
    .const 'Sub' $P1354 = "77_1259103989.89791" 
    capture_lex $P1354
    .const 'Sub' $P1322 = "76_1259103989.89791" 
    capture_lex $P1322
    .const 'Sub' $P1235 = "74_1259103989.89791" 
    capture_lex $P1235
    .const 'Sub' $P1218 = "73_1259103989.89791" 
    capture_lex $P1218
    .const 'Sub' $P1198 = "72_1259103989.89791" 
    capture_lex $P1198
    .const 'Sub' $P1114 = "71_1259103989.89791" 
    capture_lex $P1114
    .const 'Sub' $P1090 = "69_1259103989.89791" 
    capture_lex $P1090
    .const 'Sub' $P1056 = "67_1259103989.89791" 
    capture_lex $P1056
    .const 'Sub' $P1010 = "65_1259103989.89791" 
    capture_lex $P1010
    .const 'Sub' $P1000 = "64_1259103989.89791" 
    capture_lex $P1000
    .const 'Sub' $P990 = "63_1259103989.89791" 
    capture_lex $P990
    .const 'Sub' $P919 = "61_1259103989.89791" 
    capture_lex $P919
    .const 'Sub' $P902 = "60_1259103989.89791" 
    capture_lex $P902
    .const 'Sub' $P892 = "59_1259103989.89791" 
    capture_lex $P892
    .const 'Sub' $P882 = "58_1259103989.89791" 
    capture_lex $P882
    .const 'Sub' $P872 = "57_1259103989.89791" 
    capture_lex $P872
    .const 'Sub' $P848 = "56_1259103989.89791" 
    capture_lex $P848
    .const 'Sub' $P795 = "55_1259103989.89791" 
    capture_lex $P795
    .const 'Sub' $P785 = "54_1259103989.89791" 
    capture_lex $P785
    .const 'Sub' $P696 = "52_1259103989.89791" 
    capture_lex $P696
    .const 'Sub' $P670 = "51_1259103989.89791" 
    capture_lex $P670
    .const 'Sub' $P660 = "50_1259103989.89791" 
    capture_lex $P660
    .const 'Sub' $P650 = "49_1259103989.89791" 
    capture_lex $P650
    .const 'Sub' $P640 = "48_1259103989.89791" 
    capture_lex $P640
    .const 'Sub' $P630 = "47_1259103989.89791" 
    capture_lex $P630
    .const 'Sub' $P620 = "46_1259103989.89791" 
    capture_lex $P620
    .const 'Sub' $P610 = "45_1259103989.89791" 
    capture_lex $P610
    .const 'Sub' $P600 = "44_1259103989.89791" 
    capture_lex $P600
    .const 'Sub' $P590 = "43_1259103989.89791" 
    capture_lex $P590
    .const 'Sub' $P580 = "42_1259103989.89791" 
    capture_lex $P580
    .const 'Sub' $P570 = "41_1259103989.89791" 
    capture_lex $P570
    .const 'Sub' $P560 = "40_1259103989.89791" 
    capture_lex $P560
    .const 'Sub' $P550 = "39_1259103989.89791" 
    capture_lex $P550
    .const 'Sub' $P532 = "38_1259103989.89791" 
    capture_lex $P532
    .const 'Sub' $P498 = "37_1259103989.89791" 
    capture_lex $P498
    .const 'Sub' $P482 = "36_1259103989.89791" 
    capture_lex $P482
    .const 'Sub' $P469 = "35_1259103989.89791" 
    capture_lex $P469
    .const 'Sub' $P443 = "34_1259103989.89791" 
    capture_lex $P443
    .const 'Sub' $P407 = "33_1259103989.89791" 
    capture_lex $P407
    .const 'Sub' $P390 = "32_1259103989.89791" 
    capture_lex $P390
    .const 'Sub' $P376 = "31_1259103989.89791" 
    capture_lex $P376
    .const 'Sub' $P321 = "29_1259103989.89791" 
    capture_lex $P321
    .const 'Sub' $P308 = "28_1259103989.89791" 
    capture_lex $P308
    .const 'Sub' $P289 = "27_1259103989.89791" 
    capture_lex $P289
    .const 'Sub' $P279 = "26_1259103989.89791" 
    capture_lex $P279
    .const 'Sub' $P269 = "25_1259103989.89791" 
    capture_lex $P269
    .const 'Sub' $P253 = "24_1259103989.89791" 
    capture_lex $P253
    .const 'Sub' $P175 = "22_1259103989.89791" 
    capture_lex $P175
    .const 'Sub' $P132 = "20_1259103989.89791" 
    capture_lex $P132
    .const 'Sub' $P113 = "19_1259103989.89791" 
    capture_lex $P113
    .const 'Sub' $P89 = "18_1259103989.89791" 
    capture_lex $P89
    .const 'Sub' $P79 = "17_1259103989.89791" 
    capture_lex $P79
    .const 'Sub' $P57 = "16_1259103989.89791" 
    capture_lex $P57
    .const 'Sub' $P26 = "13_1259103989.89791" 
    capture_lex $P26
    .const 'Sub' $P16 = "12_1259103989.89791" 
    capture_lex $P16
    get_global $P15, "@BLOCK"
    unless_null $P15, vivify_119
    new $P15, "ResizablePMCArray"
    set_global "@BLOCK", $P15
  vivify_119:
.annotate "line", 9
    .const 'Sub' $P16 = "12_1259103989.89791" 
    capture_lex $P16
    .lex "xblock_immediate", $P16
.annotate "line", 14
    .const 'Sub' $P26 = "13_1259103989.89791" 
    capture_lex $P26
    .lex "block_immediate", $P26
.annotate "line", 24
    .const 'Sub' $P57 = "16_1259103989.89791" 
    capture_lex $P57
    .lex "sigiltype", $P57
.annotate "line", 3
    get_global $P75, "@BLOCK"
.annotate "line", 5
    find_lex $P76, "xblock_immediate"
    find_lex $P77, "block_immediate"
    find_lex $P78, "sigiltype"
.annotate "line", 661
    get_hll_global $P1894, ["NQP";"RegexActions"], "_block1893" 
    capture_lex $P1894
    $P1956 = $P1894()
.annotate "line", 3
    .return ($P1956)
.end


.namespace ["NQP";"Actions"]
.sub "" :load :init :subid("post117") :outer("11_1259103989.89791")
.annotate "line", 3
    get_hll_global $P14, ["NQP";"Actions"], "_block13" 
    .local pmc block
    set block, $P14
.annotate "line", 5
    .const 'Sub' $P1958 = "115_1259103989.89791" 
    capture_lex $P1958
    $P1958()
    $P1961 = get_root_global ["parrot"], "P6metaclass"
    $P1961."new_class"("NQP::RegexActions", "Regex::P6Regex::Actions" :named("parent"))
.end


.namespace ["NQP";"Actions"]
.sub "_block1957"  :anon :subid("115_1259103989.89791") :outer("11_1259103989.89791")
.annotate "line", 6
    get_global $P1959, "@BLOCK"
    unless_null $P1959, vivify_118
    new $P1959, "ResizablePMCArray"
    set_global "@BLOCK", $P1959
  vivify_118:
 $P1960 = new ['ResizablePMCArray'] 
    set_global "@BLOCK", $P1960
.annotate "line", 5
    .return ($P1960)
.end


.namespace ["NQP";"Actions"]
.sub "xblock_immediate"  :subid("12_1259103989.89791") :outer("11_1259103989.89791")
    .param pmc param_19
.annotate "line", 9
    new $P18, 'ExceptionHandler'
    set_addr $P18, control_17
    $P18."handle_types"(58)
    push_eh $P18
    .lex "$xblock", param_19
.annotate "line", 10
    find_lex $P20, "$xblock"
    unless_null $P20, vivify_120
    new $P20, "ResizablePMCArray"
  vivify_120:
    set $P21, $P20[1]
    unless_null $P21, vivify_121
    new $P21, "Undef"
  vivify_121:
    $P22 = "block_immediate"($P21)
    find_lex $P23, "$xblock"
    unless_null $P23, vivify_122
    new $P23, "ResizablePMCArray"
    store_lex "$xblock", $P23
  vivify_122:
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
.sub "block_immediate"  :subid("13_1259103989.89791") :outer("11_1259103989.89791")
    .param pmc param_29
.annotate "line", 14
    .const 'Sub' $P35 = "14_1259103989.89791" 
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
    .const 'Sub' $P35 = "14_1259103989.89791" 
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
.sub "_block34"  :anon :subid("14_1259103989.89791") :outer("13_1259103989.89791")
.annotate "line", 16
    .const 'Sub' $P46 = "15_1259103989.89791" 
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
    unless $I43, for_undef_123
    iter $P40, $P42
    new $P52, 'ExceptionHandler'
    set_addr $P52, loop51_handler
    $P52."handle_types"(65, 67, 66)
    push_eh $P52
  loop51_test:
    unless $P40, loop51_done
    shift $P44, $P40
  loop51_redo:
    .const 'Sub' $P46 = "15_1259103989.89791" 
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
  for_undef_123:
.annotate "line", 19
    find_lex $P54, "$stmts"
    store_lex "$block", $P54
.annotate "line", 16
    .return ($P54)
.end


.namespace ["NQP";"Actions"]
.sub "_block45"  :anon :subid("15_1259103989.89791") :outer("14_1259103989.89791")
    .param pmc param_47
.annotate "line", 18
    .lex "$_", param_47
    find_lex $P48, "$stmts"
    find_lex $P49, "$_"
    $P50 = $P48."push"($P49)
    .return ($P50)
.end


.namespace ["NQP";"Actions"]
.sub "sigiltype"  :subid("16_1259103989.89791") :outer("11_1259103989.89791")
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
.sub "TOP"  :subid("17_1259103989.89791") :method :outer("11_1259103989.89791")
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
    unless_null $P84, vivify_124
    new $P84, "Hash"
  vivify_124:
    set $P85, $P84["comp_unit"]
    unless_null $P85, vivify_125
    new $P85, "Undef"
  vivify_125:
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
.sub "deflongname"  :subid("18_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_92
.annotate "line", 32
    new $P91, 'ExceptionHandler'
    set_addr $P91, control_90
    $P91."handle_types"(58)
    push_eh $P91
    .lex "self", self
    .lex "$/", param_92
.annotate "line", 33
    find_lex $P93, "$/"
    find_lex $P96, "$/"
    unless_null $P96, vivify_126
    new $P96, "Hash"
  vivify_126:
    set $P97, $P96["sym"]
    unless_null $P97, vivify_127
    new $P97, "Undef"
  vivify_127:
    if $P97, if_95
    find_lex $P109, "$/"
    set $S110, $P109
    new $P94, 'String'
    set $P94, $S110
    goto if_95_end
  if_95:
    find_lex $P98, "$/"
    unless_null $P98, vivify_128
    new $P98, "Hash"
  vivify_128:
    set $P99, $P98["identifier"]
    unless_null $P99, vivify_129
    new $P99, "Undef"
  vivify_129:
    set $S100, $P99
    new $P101, 'String'
    set $P101, $S100
    concat $P102, $P101, ":sym<"
    find_lex $P103, "$/"
    unless_null $P103, vivify_130
    new $P103, "Hash"
  vivify_130:
    set $P104, $P103["sym"]
    unless_null $P104, vivify_131
    new $P104, "ResizablePMCArray"
  vivify_131:
    set $P105, $P104[0]
    unless_null $P105, vivify_132
    new $P105, "Undef"
  vivify_132:
    set $S106, $P105
    concat $P107, $P102, $S106
    concat $P108, $P107, ">"
    set $P94, $P108
  if_95_end:
    $P111 = $P93."!make"($P94)
.annotate "line", 32
    .return ($P111)
  control_90:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P112, exception, "payload"
    .return ($P112)
.end


.namespace ["NQP";"Actions"]
.sub "comp_unit"  :subid("19_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_116
.annotate "line", 36
    new $P115, 'ExceptionHandler'
    set_addr $P115, control_114
    $P115."handle_types"(58)
    push_eh $P115
    .lex "self", self
    .lex "$/", param_116
.annotate "line", 37
    new $P117, "Undef"
    .lex "$past", $P117
.annotate "line", 38
    new $P118, "Undef"
    .lex "$BLOCK", $P118
.annotate "line", 37
    find_lex $P119, "$/"
    unless_null $P119, vivify_133
    new $P119, "Hash"
  vivify_133:
    set $P120, $P119["statementlist"]
    unless_null $P120, vivify_134
    new $P120, "Undef"
  vivify_134:
    $P121 = $P120."ast"()
    store_lex "$past", $P121
.annotate "line", 38
    get_global $P122, "@BLOCK"
    $P123 = $P122."shift"()
    store_lex "$BLOCK", $P123
.annotate "line", 39
    find_lex $P124, "$BLOCK"
    find_lex $P125, "$past"
    $P124."push"($P125)
.annotate "line", 40
    find_lex $P126, "$BLOCK"
    find_lex $P127, "$/"
    $P126."node"($P127)
.annotate "line", 41
    find_lex $P128, "$/"
    find_lex $P129, "$BLOCK"
    $P130 = $P128."!make"($P129)
.annotate "line", 36
    .return ($P130)
  control_114:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P131, exception, "payload"
    .return ($P131)
.end


.namespace ["NQP";"Actions"]
.sub "statementlist"  :subid("20_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_135
.annotate "line", 44
    .const 'Sub' $P149 = "21_1259103989.89791" 
    capture_lex $P149
    new $P134, 'ExceptionHandler'
    set_addr $P134, control_133
    $P134."handle_types"(58)
    push_eh $P134
    .lex "self", self
    .lex "$/", param_135
.annotate "line", 45
    new $P136, "Undef"
    .lex "$past", $P136
    get_hll_global $P137, ["PAST"], "Stmts"
    find_lex $P138, "$/"
    $P139 = $P137."new"($P138 :named("node"))
    store_lex "$past", $P139
.annotate "line", 46
    find_lex $P141, "$/"
    unless_null $P141, vivify_135
    new $P141, "Hash"
  vivify_135:
    set $P142, $P141["statement"]
    unless_null $P142, vivify_136
    new $P142, "Undef"
  vivify_136:
    unless $P142, if_140_end
.annotate "line", 47
    find_lex $P144, "$/"
    unless_null $P144, vivify_137
    new $P144, "Hash"
  vivify_137:
    set $P145, $P144["statement"]
    unless_null $P145, vivify_138
    new $P145, "Undef"
  vivify_138:
    defined $I146, $P145
    unless $I146, for_undef_139
    iter $P143, $P145
    new $P169, 'ExceptionHandler'
    set_addr $P169, loop168_handler
    $P169."handle_types"(65, 67, 66)
    push_eh $P169
  loop168_test:
    unless $P143, loop168_done
    shift $P147, $P143
  loop168_redo:
    .const 'Sub' $P149 = "21_1259103989.89791" 
    capture_lex $P149
    $P149($P147)
  loop168_next:
    goto loop168_test
  loop168_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P170, exception, 'type'
    eq $P170, 65, loop168_next
    eq $P170, 67, loop168_redo
  loop168_done:
    pop_eh 
  for_undef_139:
  if_140_end:
.annotate "line", 55
    find_lex $P171, "$/"
    find_lex $P172, "$past"
    $P173 = $P171."!make"($P172)
.annotate "line", 44
    .return ($P173)
  control_133:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P174, exception, "payload"
    .return ($P174)
.end


.namespace ["NQP";"Actions"]
.sub "_block148"  :anon :subid("21_1259103989.89791") :outer("20_1259103989.89791")
    .param pmc param_151
.annotate "line", 48
    new $P150, "Undef"
    .lex "$ast", $P150
    .lex "$_", param_151
    find_lex $P152, "$_"
    $P153 = $P152."ast"()
    store_lex "$ast", $P153
.annotate "line", 49
    find_lex $P157, "$ast"
    get_hll_global $P158, ["PAST"], "Block"
    $P159 = $P157."isa"($P158)
    if $P159, if_156
    set $P155, $P159
    goto if_156_end
  if_156:
    find_lex $P160, "$ast"
    $P161 = $P160."blocktype"()
    isfalse $I162, $P161
    new $P155, 'Integer'
    set $P155, $I162
  if_156_end:
    unless $P155, if_154_end
.annotate "line", 50
    find_lex $P163, "$ast"
    $P164 = "block_immediate"($P163)
    store_lex "$ast", $P164
  if_154_end:
.annotate "line", 52
    find_lex $P165, "$past"
    find_lex $P166, "$ast"
    $P167 = $P165."push"($P166)
.annotate "line", 47
    .return ($P167)
.end


.namespace ["NQP";"Actions"]
.sub "statement"  :subid("22_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_178
    .param pmc param_179 :optional
    .param int has_param_179 :opt_flag
.annotate "line", 58
    .const 'Sub' $P187 = "23_1259103989.89791" 
    capture_lex $P187
    new $P177, 'ExceptionHandler'
    set_addr $P177, control_176
    $P177."handle_types"(58)
    push_eh $P177
    .lex "self", self
    .lex "$/", param_178
    if has_param_179, optparam_140
    new $P180, "Undef"
    set param_179, $P180
  optparam_140:
    .lex "$key", param_179
.annotate "line", 59
    new $P181, "Undef"
    .lex "$past", $P181
.annotate "line", 58
    find_lex $P182, "$past"
.annotate "line", 60
    find_lex $P184, "$/"
    unless_null $P184, vivify_141
    new $P184, "Hash"
  vivify_141:
    set $P185, $P184["EXPR"]
    unless_null $P185, vivify_142
    new $P185, "Undef"
  vivify_142:
    if $P185, if_183
.annotate "line", 74
    find_lex $P243, "$/"
    unless_null $P243, vivify_143
    new $P243, "Hash"
  vivify_143:
    set $P244, $P243["statement_control"]
    unless_null $P244, vivify_144
    new $P244, "Undef"
  vivify_144:
    if $P244, if_242
.annotate "line", 75
    new $P248, "Integer"
    assign $P248, 0
    store_lex "$past", $P248
    goto if_242_end
  if_242:
.annotate "line", 74
    find_lex $P245, "$/"
    unless_null $P245, vivify_145
    new $P245, "Hash"
  vivify_145:
    set $P246, $P245["statement_control"]
    unless_null $P246, vivify_146
    new $P246, "Undef"
  vivify_146:
    $P247 = $P246."ast"()
    store_lex "$past", $P247
  if_242_end:
    goto if_183_end
  if_183:
.annotate "line", 60
    .const 'Sub' $P187 = "23_1259103989.89791" 
    capture_lex $P187
    $P187()
  if_183_end:
.annotate "line", 76
    find_lex $P249, "$/"
    find_lex $P250, "$past"
    $P251 = $P249."!make"($P250)
.annotate "line", 58
    .return ($P251)
  control_176:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P252, exception, "payload"
    .return ($P252)
.end


.namespace ["NQP";"Actions"]
.sub "_block186"  :anon :subid("23_1259103989.89791") :outer("22_1259103989.89791")
.annotate "line", 61
    new $P188, "Undef"
    .lex "$mc", $P188
.annotate "line", 62
    new $P189, "Undef"
    .lex "$ml", $P189
.annotate "line", 61
    find_lex $P190, "$/"
    unless_null $P190, vivify_147
    new $P190, "Hash"
  vivify_147:
    set $P191, $P190["statement_mod_cond"]
    unless_null $P191, vivify_148
    new $P191, "ResizablePMCArray"
  vivify_148:
    set $P192, $P191[0]
    unless_null $P192, vivify_149
    new $P192, "Undef"
  vivify_149:
    store_lex "$mc", $P192
.annotate "line", 62
    find_lex $P193, "$/"
    unless_null $P193, vivify_150
    new $P193, "Hash"
  vivify_150:
    set $P194, $P193["statement_mod_loop"]
    unless_null $P194, vivify_151
    new $P194, "ResizablePMCArray"
  vivify_151:
    set $P195, $P194[0]
    unless_null $P195, vivify_152
    new $P195, "Undef"
  vivify_152:
    store_lex "$ml", $P195
.annotate "line", 63
    find_lex $P198, "$mc"
    if $P198, if_197
.annotate "line", 68
    find_lex $P226, "$ml"
    if $P226, if_225
.annotate "line", 71
    find_lex $P239, "$/"
    unless_null $P239, vivify_153
    new $P239, "Hash"
  vivify_153:
    set $P240, $P239["EXPR"]
    unless_null $P240, vivify_154
    new $P240, "Undef"
  vivify_154:
    $P241 = $P240."ast"()
    store_lex "$past", $P241
.annotate "line", 70
    set $P224, $P241
.annotate "line", 68
    goto if_225_end
  if_225:
.annotate "line", 69
    get_hll_global $P227, ["PAST"], "Op"
    find_lex $P228, "$ml"
    unless_null $P228, vivify_155
    new $P228, "Hash"
  vivify_155:
    set $P229, $P228["cond"]
    unless_null $P229, vivify_156
    new $P229, "Undef"
  vivify_156:
    $P230 = $P229."ast"()
    find_lex $P231, "$/"
    unless_null $P231, vivify_157
    new $P231, "Hash"
  vivify_157:
    set $P232, $P231["EXPR"]
    unless_null $P232, vivify_158
    new $P232, "Undef"
  vivify_158:
    $P233 = $P232."ast"()
    find_lex $P234, "$ml"
    unless_null $P234, vivify_159
    new $P234, "Hash"
  vivify_159:
    set $P235, $P234["sym"]
    unless_null $P235, vivify_160
    new $P235, "Undef"
  vivify_160:
    set $S236, $P235
    find_lex $P237, "$/"
    $P238 = $P227."new"($P230, $P233, $S236 :named("pasttype"), $P237 :named("node"))
    store_lex "$past", $P238
.annotate "line", 68
    set $P224, $P238
  if_225_end:
    set $P196, $P224
.annotate "line", 63
    goto if_197_end
  if_197:
.annotate "line", 64
    get_hll_global $P199, ["PAST"], "Op"
    find_lex $P200, "$mc"
    unless_null $P200, vivify_161
    new $P200, "Hash"
  vivify_161:
    set $P201, $P200["cond"]
    unless_null $P201, vivify_162
    new $P201, "Undef"
  vivify_162:
    $P202 = $P201."ast"()
    find_lex $P203, "$/"
    unless_null $P203, vivify_163
    new $P203, "Hash"
  vivify_163:
    set $P204, $P203["EXPR"]
    unless_null $P204, vivify_164
    new $P204, "Undef"
  vivify_164:
    $P205 = $P204."ast"()
    find_lex $P206, "$mc"
    unless_null $P206, vivify_165
    new $P206, "Hash"
  vivify_165:
    set $P207, $P206["sym"]
    unless_null $P207, vivify_166
    new $P207, "Undef"
  vivify_166:
    set $S208, $P207
    find_lex $P209, "$/"
    $P210 = $P199."new"($P202, $P205, $S208 :named("pasttype"), $P209 :named("node"))
    store_lex "$past", $P210
.annotate "line", 65
    find_lex $P213, "$ml"
    if $P213, if_212
    set $P211, $P213
    goto if_212_end
  if_212:
.annotate "line", 66
    get_hll_global $P214, ["PAST"], "Op"
    find_lex $P215, "$ml"
    unless_null $P215, vivify_167
    new $P215, "Hash"
  vivify_167:
    set $P216, $P215["cond"]
    unless_null $P216, vivify_168
    new $P216, "Undef"
  vivify_168:
    $P217 = $P216."ast"()
    find_lex $P218, "$past"
    find_lex $P219, "$ml"
    unless_null $P219, vivify_169
    new $P219, "Hash"
  vivify_169:
    set $P220, $P219["sym"]
    unless_null $P220, vivify_170
    new $P220, "Undef"
  vivify_170:
    set $S221, $P220
    find_lex $P222, "$/"
    $P223 = $P214."new"($P217, $P218, $S221 :named("pasttype"), $P222 :named("node"))
    store_lex "$past", $P223
.annotate "line", 65
    set $P211, $P223
  if_212_end:
.annotate "line", 63
    set $P196, $P211
  if_197_end:
.annotate "line", 60
    .return ($P196)
.end


.namespace ["NQP";"Actions"]
.sub "xblock"  :subid("24_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_256
.annotate "line", 79
    new $P255, 'ExceptionHandler'
    set_addr $P255, control_254
    $P255."handle_types"(58)
    push_eh $P255
    .lex "self", self
    .lex "$/", param_256
.annotate "line", 80
    find_lex $P257, "$/"
    get_hll_global $P258, ["PAST"], "Op"
    find_lex $P259, "$/"
    unless_null $P259, vivify_171
    new $P259, "Hash"
  vivify_171:
    set $P260, $P259["EXPR"]
    unless_null $P260, vivify_172
    new $P260, "Undef"
  vivify_172:
    $P261 = $P260."ast"()
    find_lex $P262, "$/"
    unless_null $P262, vivify_173
    new $P262, "Hash"
  vivify_173:
    set $P263, $P262["pblock"]
    unless_null $P263, vivify_174
    new $P263, "Undef"
  vivify_174:
    $P264 = $P263."ast"()
    find_lex $P265, "$/"
    $P266 = $P258."new"($P261, $P264, "if" :named("pasttype"), $P265 :named("node"))
    $P267 = $P257."!make"($P266)
.annotate "line", 79
    .return ($P267)
  control_254:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P268, exception, "payload"
    .return ($P268)
.end


.namespace ["NQP";"Actions"]
.sub "pblock"  :subid("25_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_272
.annotate "line", 83
    new $P271, 'ExceptionHandler'
    set_addr $P271, control_270
    $P271."handle_types"(58)
    push_eh $P271
    .lex "self", self
    .lex "$/", param_272
.annotate "line", 84
    find_lex $P273, "$/"
    find_lex $P274, "$/"
    unless_null $P274, vivify_175
    new $P274, "Hash"
  vivify_175:
    set $P275, $P274["blockoid"]
    unless_null $P275, vivify_176
    new $P275, "Undef"
  vivify_176:
    $P276 = $P275."ast"()
    $P277 = $P273."!make"($P276)
.annotate "line", 83
    .return ($P277)
  control_270:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P278, exception, "payload"
    .return ($P278)
.end


.namespace ["NQP";"Actions"]
.sub "block"  :subid("26_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_282
.annotate "line", 87
    new $P281, 'ExceptionHandler'
    set_addr $P281, control_280
    $P281."handle_types"(58)
    push_eh $P281
    .lex "self", self
    .lex "$/", param_282
.annotate "line", 88
    find_lex $P283, "$/"
    find_lex $P284, "$/"
    unless_null $P284, vivify_177
    new $P284, "Hash"
  vivify_177:
    set $P285, $P284["blockoid"]
    unless_null $P285, vivify_178
    new $P285, "Undef"
  vivify_178:
    $P286 = $P285."ast"()
    $P287 = $P283."!make"($P286)
.annotate "line", 87
    .return ($P287)
  control_280:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P288, exception, "payload"
    .return ($P288)
.end


.namespace ["NQP";"Actions"]
.sub "blockoid"  :subid("27_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_292
.annotate "line", 91
    new $P291, 'ExceptionHandler'
    set_addr $P291, control_290
    $P291."handle_types"(58)
    push_eh $P291
    .lex "self", self
    .lex "$/", param_292
.annotate "line", 92
    new $P293, "Undef"
    .lex "$past", $P293
.annotate "line", 93
    new $P294, "Undef"
    .lex "$BLOCK", $P294
.annotate "line", 92
    find_lex $P295, "$/"
    unless_null $P295, vivify_179
    new $P295, "Hash"
  vivify_179:
    set $P296, $P295["statementlist"]
    unless_null $P296, vivify_180
    new $P296, "Undef"
  vivify_180:
    $P297 = $P296."ast"()
    store_lex "$past", $P297
.annotate "line", 93
    get_global $P298, "@BLOCK"
    $P299 = $P298."shift"()
    store_lex "$BLOCK", $P299
.annotate "line", 94
    find_lex $P300, "$BLOCK"
    find_lex $P301, "$past"
    $P300."push"($P301)
.annotate "line", 95
    find_lex $P302, "$BLOCK"
    find_lex $P303, "$/"
    $P302."node"($P303)
.annotate "line", 96
    find_lex $P304, "$/"
    find_lex $P305, "$BLOCK"
    $P306 = $P304."!make"($P305)
.annotate "line", 91
    .return ($P306)
  control_290:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P307, exception, "payload"
    .return ($P307)
.end


.namespace ["NQP";"Actions"]
.sub "newpad"  :subid("28_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_311
.annotate "line", 99
    new $P310, 'ExceptionHandler'
    set_addr $P310, control_309
    $P310."handle_types"(58)
    push_eh $P310
    .lex "self", self
    .lex "$/", param_311
.annotate "line", 100
    get_global $P312, "@BLOCK"
    unless_null $P312, vivify_181
    new $P312, "ResizablePMCArray"
    set_global "@BLOCK", $P312
  vivify_181:
.annotate "line", 99
    get_global $P313, "@BLOCK"
.annotate "line", 101
    get_global $P314, "@BLOCK"
    get_hll_global $P315, ["PAST"], "Block"
    get_hll_global $P316, ["PAST"], "Stmts"
    $P317 = $P316."new"()
    $P318 = $P315."new"($P317)
    $P319 = $P314."unshift"($P318)
.annotate "line", 99
    .return ($P319)
  control_309:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P320, exception, "payload"
    .return ($P320)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<if>"  :subid("29_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_324
.annotate "line", 106
    .const 'Sub' $P354 = "30_1259103989.89791" 
    capture_lex $P354
    new $P323, 'ExceptionHandler'
    set_addr $P323, control_322
    $P323."handle_types"(58)
    push_eh $P323
    .lex "self", self
    .lex "$/", param_324
.annotate "line", 107
    new $P325, "Undef"
    .lex "$count", $P325
.annotate "line", 108
    new $P326, "Undef"
    .lex "$past", $P326
.annotate "line", 107
    find_lex $P327, "$/"
    unless_null $P327, vivify_182
    new $P327, "Hash"
  vivify_182:
    set $P328, $P327["xblock"]
    unless_null $P328, vivify_183
    new $P328, "Undef"
  vivify_183:
    set $N329, $P328
    new $P330, 'Float'
    set $P330, $N329
    sub $P331, $P330, 1
    store_lex "$count", $P331
.annotate "line", 108
    find_lex $P332, "$count"
    set $I333, $P332
    find_lex $P334, "$/"
    unless_null $P334, vivify_184
    new $P334, "Hash"
  vivify_184:
    set $P335, $P334["xblock"]
    unless_null $P335, vivify_185
    new $P335, "ResizablePMCArray"
  vivify_185:
    set $P336, $P335[$I333]
    unless_null $P336, vivify_186
    new $P336, "Undef"
  vivify_186:
    $P337 = $P336."ast"()
    $P338 = "xblock_immediate"($P337)
    store_lex "$past", $P338
.annotate "line", 109
    find_lex $P340, "$/"
    unless_null $P340, vivify_187
    new $P340, "Hash"
  vivify_187:
    set $P341, $P340["else"]
    unless_null $P341, vivify_188
    new $P341, "Undef"
  vivify_188:
    unless $P341, if_339_end
.annotate "line", 110
    find_lex $P342, "$past"
    find_lex $P343, "$/"
    unless_null $P343, vivify_189
    new $P343, "Hash"
  vivify_189:
    set $P344, $P343["else"]
    unless_null $P344, vivify_190
    new $P344, "ResizablePMCArray"
  vivify_190:
    set $P345, $P344[0]
    unless_null $P345, vivify_191
    new $P345, "Undef"
  vivify_191:
    $P346 = $P345."ast"()
    $P347 = "block_immediate"($P346)
    $P342."push"($P347)
  if_339_end:
.annotate "line", 113
    new $P370, 'ExceptionHandler'
    set_addr $P370, loop369_handler
    $P370."handle_types"(65, 67, 66)
    push_eh $P370
  loop369_test:
    find_lex $P348, "$count"
    set $N349, $P348
    new $P350, "Integer"
    assign $P350, 0
    set $N351, $P350
    isgt $I352, $N349, $N351
    unless $I352, loop369_done
  loop369_redo:
    .const 'Sub' $P354 = "30_1259103989.89791" 
    capture_lex $P354
    $P354()
  loop369_next:
    goto loop369_test
  loop369_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P371, exception, 'type'
    eq $P371, 65, loop369_next
    eq $P371, 67, loop369_redo
  loop369_done:
    pop_eh 
.annotate "line", 119
    find_lex $P372, "$/"
    find_lex $P373, "$past"
    $P374 = $P372."!make"($P373)
.annotate "line", 106
    .return ($P374)
  control_322:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P375, exception, "payload"
    .return ($P375)
.end


.namespace ["NQP";"Actions"]
.sub "_block353"  :anon :subid("30_1259103989.89791") :outer("29_1259103989.89791")
.annotate "line", 115
    new $P355, "Undef"
    .lex "$else", $P355
.annotate "line", 113
    find_lex $P356, "$count"
    clone $P357, $P356
    dec $P356
.annotate "line", 115
    find_lex $P358, "$past"
    store_lex "$else", $P358
.annotate "line", 116
    find_lex $P359, "$count"
    set $I360, $P359
    find_lex $P361, "$/"
    unless_null $P361, vivify_192
    new $P361, "Hash"
  vivify_192:
    set $P362, $P361["xblock"]
    unless_null $P362, vivify_193
    new $P362, "ResizablePMCArray"
  vivify_193:
    set $P363, $P362[$I360]
    unless_null $P363, vivify_194
    new $P363, "Undef"
  vivify_194:
    $P364 = $P363."ast"()
    $P365 = "xblock_immediate"($P364)
    store_lex "$past", $P365
.annotate "line", 117
    find_lex $P366, "$past"
    find_lex $P367, "$else"
    $P368 = $P366."push"($P367)
.annotate "line", 113
    .return ($P368)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<unless>"  :subid("31_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_379
.annotate "line", 122
    new $P378, 'ExceptionHandler'
    set_addr $P378, control_377
    $P378."handle_types"(58)
    push_eh $P378
    .lex "self", self
    .lex "$/", param_379
.annotate "line", 123
    new $P380, "Undef"
    .lex "$past", $P380
    find_lex $P381, "$/"
    unless_null $P381, vivify_195
    new $P381, "Hash"
  vivify_195:
    set $P382, $P381["xblock"]
    unless_null $P382, vivify_196
    new $P382, "Undef"
  vivify_196:
    $P383 = $P382."ast"()
    $P384 = "xblock_immediate"($P383)
    store_lex "$past", $P384
.annotate "line", 124
    find_lex $P385, "$past"
    $P385."pasttype"("unless")
.annotate "line", 125
    find_lex $P386, "$/"
    find_lex $P387, "$past"
    $P388 = $P386."!make"($P387)
.annotate "line", 122
    .return ($P388)
  control_377:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P389, exception, "payload"
    .return ($P389)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<while>"  :subid("32_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_393
.annotate "line", 128
    new $P392, 'ExceptionHandler'
    set_addr $P392, control_391
    $P392."handle_types"(58)
    push_eh $P392
    .lex "self", self
    .lex "$/", param_393
.annotate "line", 129
    new $P394, "Undef"
    .lex "$past", $P394
    find_lex $P395, "$/"
    unless_null $P395, vivify_197
    new $P395, "Hash"
  vivify_197:
    set $P396, $P395["xblock"]
    unless_null $P396, vivify_198
    new $P396, "Undef"
  vivify_198:
    $P397 = $P396."ast"()
    $P398 = "xblock_immediate"($P397)
    store_lex "$past", $P398
.annotate "line", 130
    find_lex $P399, "$past"
    find_lex $P400, "$/"
    unless_null $P400, vivify_199
    new $P400, "Hash"
  vivify_199:
    set $P401, $P400["sym"]
    unless_null $P401, vivify_200
    new $P401, "Undef"
  vivify_200:
    set $S402, $P401
    $P399."pasttype"($S402)
.annotate "line", 131
    find_lex $P403, "$/"
    find_lex $P404, "$past"
    $P405 = $P403."!make"($P404)
.annotate "line", 128
    .return ($P405)
  control_391:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P406, exception, "payload"
    .return ($P406)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<repeat>"  :subid("33_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_410
.annotate "line", 134
    new $P409, 'ExceptionHandler'
    set_addr $P409, control_408
    $P409."handle_types"(58)
    push_eh $P409
    .lex "self", self
    .lex "$/", param_410
.annotate "line", 135
    new $P411, "Undef"
    .lex "$pasttype", $P411
.annotate "line", 136
    new $P412, "Undef"
    .lex "$past", $P412
.annotate "line", 135
    new $P413, "String"
    assign $P413, "repeat_"
    find_lex $P414, "$/"
    unless_null $P414, vivify_201
    new $P414, "Hash"
  vivify_201:
    set $P415, $P414["wu"]
    unless_null $P415, vivify_202
    new $P415, "Undef"
  vivify_202:
    set $S416, $P415
    concat $P417, $P413, $S416
    store_lex "$pasttype", $P417
    find_lex $P418, "$past"
.annotate "line", 137
    find_lex $P420, "$/"
    unless_null $P420, vivify_203
    new $P420, "Hash"
  vivify_203:
    set $P421, $P420["xblock"]
    unless_null $P421, vivify_204
    new $P421, "Undef"
  vivify_204:
    if $P421, if_419
.annotate "line", 142
    get_hll_global $P428, ["PAST"], "Op"
    find_lex $P429, "$/"
    unless_null $P429, vivify_205
    new $P429, "Hash"
  vivify_205:
    set $P430, $P429["EXPR"]
    unless_null $P430, vivify_206
    new $P430, "Undef"
  vivify_206:
    $P431 = $P430."ast"()
    find_lex $P432, "$/"
    unless_null $P432, vivify_207
    new $P432, "Hash"
  vivify_207:
    set $P433, $P432["pblock"]
    unless_null $P433, vivify_208
    new $P433, "Undef"
  vivify_208:
    $P434 = $P433."ast"()
    $P435 = "block_immediate"($P434)
    find_lex $P436, "$pasttype"
    find_lex $P437, "$/"
    $P438 = $P428."new"($P431, $P435, $P436 :named("pasttype"), $P437 :named("node"))
    store_lex "$past", $P438
.annotate "line", 141
    goto if_419_end
  if_419:
.annotate "line", 138
    find_lex $P422, "$/"
    unless_null $P422, vivify_209
    new $P422, "Hash"
  vivify_209:
    set $P423, $P422["xblock"]
    unless_null $P423, vivify_210
    new $P423, "Undef"
  vivify_210:
    $P424 = $P423."ast"()
    $P425 = "xblock_immediate"($P424)
    store_lex "$past", $P425
.annotate "line", 139
    find_lex $P426, "$past"
    find_lex $P427, "$pasttype"
    $P426."pasttype"($P427)
  if_419_end:
.annotate "line", 145
    find_lex $P439, "$/"
    find_lex $P440, "$past"
    $P441 = $P439."!make"($P440)
.annotate "line", 134
    .return ($P441)
  control_408:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P442, exception, "payload"
    .return ($P442)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<for>"  :subid("34_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_446
.annotate "line", 148
    new $P445, 'ExceptionHandler'
    set_addr $P445, control_444
    $P445."handle_types"(58)
    push_eh $P445
    .lex "self", self
    .lex "$/", param_446
.annotate "line", 149
    new $P447, "Undef"
    .lex "$past", $P447
.annotate "line", 151
    new $P448, "Undef"
    .lex "$block", $P448
.annotate "line", 149
    find_lex $P449, "$/"
    unless_null $P449, vivify_211
    new $P449, "Hash"
  vivify_211:
    set $P450, $P449["xblock"]
    unless_null $P450, vivify_212
    new $P450, "Undef"
  vivify_212:
    $P451 = $P450."ast"()
    store_lex "$past", $P451
.annotate "line", 150
    find_lex $P452, "$past"
    $P452."pasttype"("for")
.annotate "line", 151
    find_lex $P453, "$past"
    unless_null $P453, vivify_213
    new $P453, "ResizablePMCArray"
  vivify_213:
    set $P454, $P453[1]
    unless_null $P454, vivify_214
    new $P454, "Undef"
  vivify_214:
    store_lex "$block", $P454
.annotate "line", 152
    find_lex $P456, "$block"
    $P457 = $P456."arity"()
    if $P457, unless_455_end
.annotate "line", 153
    find_lex $P458, "$block"
    unless_null $P458, vivify_215
    new $P458, "ResizablePMCArray"
  vivify_215:
    set $P459, $P458[0]
    unless_null $P459, vivify_216
    new $P459, "Undef"
  vivify_216:
    get_hll_global $P460, ["PAST"], "Var"
    $P461 = $P460."new"("$_" :named("name"), "parameter" :named("scope"))
    $P459."push"($P461)
.annotate "line", 154
    find_lex $P462, "$block"
    $P462."symbol"("$_", "lexical" :named("scope"))
.annotate "line", 155
    find_lex $P463, "$block"
    $P463."arity"(1)
  unless_455_end:
.annotate "line", 157
    find_lex $P464, "$block"
    $P464."blocktype"("immediate")
.annotate "line", 158
    find_lex $P465, "$/"
    find_lex $P466, "$past"
    $P467 = $P465."!make"($P466)
.annotate "line", 148
    .return ($P467)
  control_444:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P468, exception, "payload"
    .return ($P468)
.end


.namespace ["NQP";"Actions"]
.sub "statement_control:sym<return>"  :subid("35_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_472
.annotate "line", 161
    new $P471, 'ExceptionHandler'
    set_addr $P471, control_470
    $P471."handle_types"(58)
    push_eh $P471
    .lex "self", self
    .lex "$/", param_472
.annotate "line", 162
    find_lex $P473, "$/"
    get_hll_global $P474, ["PAST"], "Op"
    find_lex $P475, "$/"
    unless_null $P475, vivify_217
    new $P475, "Hash"
  vivify_217:
    set $P476, $P475["EXPR"]
    unless_null $P476, vivify_218
    new $P476, "Undef"
  vivify_218:
    $P477 = $P476."ast"()
    find_lex $P478, "$/"
    $P479 = $P474."new"($P477, "return" :named("pasttype"), $P478 :named("node"))
    $P480 = $P473."!make"($P479)
.annotate "line", 161
    .return ($P480)
  control_470:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P481, exception, "payload"
    .return ($P481)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<INIT>"  :subid("36_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_485
.annotate "line", 165
    new $P484, 'ExceptionHandler'
    set_addr $P484, control_483
    $P484."handle_types"(58)
    push_eh $P484
    .lex "self", self
    .lex "$/", param_485
.annotate "line", 166
    get_global $P486, "@BLOCK"
    unless_null $P486, vivify_219
    new $P486, "ResizablePMCArray"
  vivify_219:
    set $P487, $P486[0]
    unless_null $P487, vivify_220
    new $P487, "Undef"
  vivify_220:
    $P488 = $P487."loadinit"()
    find_lex $P489, "$/"
    unless_null $P489, vivify_221
    new $P489, "Hash"
  vivify_221:
    set $P490, $P489["blorst"]
    unless_null $P490, vivify_222
    new $P490, "Undef"
  vivify_222:
    $P491 = $P490."ast"()
    $P488."push"($P491)
.annotate "line", 167
    find_lex $P492, "$/"
    get_hll_global $P493, ["PAST"], "Stmts"
    find_lex $P494, "$/"
    $P495 = $P493."new"($P494 :named("node"))
    $P496 = $P492."!make"($P495)
.annotate "line", 165
    .return ($P496)
  control_483:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P497, exception, "payload"
    .return ($P497)
.end


.namespace ["NQP";"Actions"]
.sub "statement_prefix:sym<try>"  :subid("37_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_501
.annotate "line", 170
    new $P500, 'ExceptionHandler'
    set_addr $P500, control_499
    $P500."handle_types"(58)
    push_eh $P500
    .lex "self", self
    .lex "$/", param_501
.annotate "line", 171
    new $P502, "Undef"
    .lex "$past", $P502
.annotate "line", 175
    new $P503, "Undef"
    .lex "$default", $P503
.annotate "line", 171
    find_lex $P504, "$/"
    unless_null $P504, vivify_223
    new $P504, "Hash"
  vivify_223:
    set $P505, $P504["blorst"]
    unless_null $P505, vivify_224
    new $P505, "Undef"
  vivify_224:
    $P506 = $P505."ast"()
    store_lex "$past", $P506
.annotate "line", 172
    find_lex $P508, "$past"
    $S509 = $P508."WHAT"()
    isne $I510, $S509, "PAST::Block()"
    unless $I510, if_507_end
.annotate "line", 173
    get_hll_global $P511, ["PAST"], "Block"
    find_lex $P512, "$past"
    find_lex $P513, "$/"
    $P514 = $P511."new"($P512, "immediate" :named("blocktype"), $P513 :named("node"))
    store_lex "$past", $P514
  if_507_end:
.annotate "line", 175
    get_hll_global $P515, ["PAST"], "Control"
.annotate "line", 177
    get_hll_global $P516, ["PAST"], "Stmts"
.annotate "line", 178
    get_hll_global $P517, ["PAST"], "Op"
.annotate "line", 179
    get_hll_global $P518, ["PAST"], "Var"
.annotate "line", 180
    get_hll_global $P519, ["PAST"], "Var"
    $P520 = $P519."new"("register" :named("scope"), "exception" :named("name"))
    $P521 = $P518."new"($P520, "handled", "keyed" :named("scope"))
.annotate "line", 179
    $P522 = $P517."new"($P521, 1, "bind" :named("pasttype"))
.annotate "line", 178
    $P523 = $P516."new"($P522)
.annotate "line", 177
    $P524 = $P515."new"($P523, "CONTROL" :named("handle_types_except"))
.annotate "line", 175
    store_lex "$default", $P524
.annotate "line", 187
    find_lex $P525, "$past"
    find_lex $P526, "$default"
    new $P527, "ResizablePMCArray"
    push $P527, $P526
    $P525."handlers"($P527)
.annotate "line", 188
    find_lex $P528, "$/"
    find_lex $P529, "$past"
    $P530 = $P528."!make"($P529)
.annotate "line", 170
    .return ($P530)
  control_499:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P531, exception, "payload"
    .return ($P531)
.end


.namespace ["NQP";"Actions"]
.sub "blorst"  :subid("38_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_535
.annotate "line", 191
    new $P534, 'ExceptionHandler'
    set_addr $P534, control_533
    $P534."handle_types"(58)
    push_eh $P534
    .lex "self", self
    .lex "$/", param_535
.annotate "line", 192
    find_lex $P536, "$/"
.annotate "line", 193
    find_lex $P539, "$/"
    unless_null $P539, vivify_225
    new $P539, "Hash"
  vivify_225:
    set $P540, $P539["block"]
    unless_null $P540, vivify_226
    new $P540, "Undef"
  vivify_226:
    if $P540, if_538
.annotate "line", 194
    find_lex $P545, "$/"
    unless_null $P545, vivify_227
    new $P545, "Hash"
  vivify_227:
    set $P546, $P545["statement"]
    unless_null $P546, vivify_228
    new $P546, "Undef"
  vivify_228:
    $P547 = $P546."ast"()
    set $P537, $P547
.annotate "line", 193
    goto if_538_end
  if_538:
    find_lex $P541, "$/"
    unless_null $P541, vivify_229
    new $P541, "Hash"
  vivify_229:
    set $P542, $P541["block"]
    unless_null $P542, vivify_230
    new $P542, "Undef"
  vivify_230:
    $P543 = $P542."ast"()
    $P544 = "block_immediate"($P543)
    set $P537, $P544
  if_538_end:
    $P548 = $P536."!make"($P537)
.annotate "line", 191
    .return ($P548)
  control_533:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P549, exception, "payload"
    .return ($P549)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<if>"  :subid("39_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_553
.annotate "line", 199
    new $P552, 'ExceptionHandler'
    set_addr $P552, control_551
    $P552."handle_types"(58)
    push_eh $P552
    .lex "self", self
    .lex "$/", param_553
    find_lex $P554, "$/"
    find_lex $P555, "$/"
    unless_null $P555, vivify_231
    new $P555, "Hash"
  vivify_231:
    set $P556, $P555["cond"]
    unless_null $P556, vivify_232
    new $P556, "Undef"
  vivify_232:
    $P557 = $P556."ast"()
    $P558 = $P554."!make"($P557)
    .return ($P558)
  control_551:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P559, exception, "payload"
    .return ($P559)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_cond:sym<unless>"  :subid("40_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_563
.annotate "line", 200
    new $P562, 'ExceptionHandler'
    set_addr $P562, control_561
    $P562."handle_types"(58)
    push_eh $P562
    .lex "self", self
    .lex "$/", param_563
    find_lex $P564, "$/"
    find_lex $P565, "$/"
    unless_null $P565, vivify_233
    new $P565, "Hash"
  vivify_233:
    set $P566, $P565["cond"]
    unless_null $P566, vivify_234
    new $P566, "Undef"
  vivify_234:
    $P567 = $P566."ast"()
    $P568 = $P564."!make"($P567)
    .return ($P568)
  control_561:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P569, exception, "payload"
    .return ($P569)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<while>"  :subid("41_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_573
.annotate "line", 202
    new $P572, 'ExceptionHandler'
    set_addr $P572, control_571
    $P572."handle_types"(58)
    push_eh $P572
    .lex "self", self
    .lex "$/", param_573
    find_lex $P574, "$/"
    find_lex $P575, "$/"
    unless_null $P575, vivify_235
    new $P575, "Hash"
  vivify_235:
    set $P576, $P575["cond"]
    unless_null $P576, vivify_236
    new $P576, "Undef"
  vivify_236:
    $P577 = $P576."ast"()
    $P578 = $P574."!make"($P577)
    .return ($P578)
  control_571:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P579, exception, "payload"
    .return ($P579)
.end


.namespace ["NQP";"Actions"]
.sub "statement_mod_loop:sym<until>"  :subid("42_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_583
.annotate "line", 203
    new $P582, 'ExceptionHandler'
    set_addr $P582, control_581
    $P582."handle_types"(58)
    push_eh $P582
    .lex "self", self
    .lex "$/", param_583
    find_lex $P584, "$/"
    find_lex $P585, "$/"
    unless_null $P585, vivify_237
    new $P585, "Hash"
  vivify_237:
    set $P586, $P585["cond"]
    unless_null $P586, vivify_238
    new $P586, "Undef"
  vivify_238:
    $P587 = $P586."ast"()
    $P588 = $P584."!make"($P587)
    .return ($P588)
  control_581:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P589, exception, "payload"
    .return ($P589)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<colonpair>"  :subid("43_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_593
.annotate "line", 207
    new $P592, 'ExceptionHandler'
    set_addr $P592, control_591
    $P592."handle_types"(58)
    push_eh $P592
    .lex "self", self
    .lex "$/", param_593
    find_lex $P594, "$/"
    find_lex $P595, "$/"
    unless_null $P595, vivify_239
    new $P595, "Hash"
  vivify_239:
    set $P596, $P595["colonpair"]
    unless_null $P596, vivify_240
    new $P596, "Undef"
  vivify_240:
    $P597 = $P596."ast"()
    $P598 = $P594."!make"($P597)
    .return ($P598)
  control_591:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P599, exception, "payload"
    .return ($P599)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<variable>"  :subid("44_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_603
.annotate "line", 208
    new $P602, 'ExceptionHandler'
    set_addr $P602, control_601
    $P602."handle_types"(58)
    push_eh $P602
    .lex "self", self
    .lex "$/", param_603
    find_lex $P604, "$/"
    find_lex $P605, "$/"
    unless_null $P605, vivify_241
    new $P605, "Hash"
  vivify_241:
    set $P606, $P605["variable"]
    unless_null $P606, vivify_242
    new $P606, "Undef"
  vivify_242:
    $P607 = $P606."ast"()
    $P608 = $P604."!make"($P607)
    .return ($P608)
  control_601:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P609, exception, "payload"
    .return ($P609)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<package_declarator>"  :subid("45_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_613
.annotate "line", 209
    new $P612, 'ExceptionHandler'
    set_addr $P612, control_611
    $P612."handle_types"(58)
    push_eh $P612
    .lex "self", self
    .lex "$/", param_613
    find_lex $P614, "$/"
    find_lex $P615, "$/"
    unless_null $P615, vivify_243
    new $P615, "Hash"
  vivify_243:
    set $P616, $P615["package_declarator"]
    unless_null $P616, vivify_244
    new $P616, "Undef"
  vivify_244:
    $P617 = $P616."ast"()
    $P618 = $P614."!make"($P617)
    .return ($P618)
  control_611:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P619, exception, "payload"
    .return ($P619)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<scope_declarator>"  :subid("46_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_623
.annotate "line", 210
    new $P622, 'ExceptionHandler'
    set_addr $P622, control_621
    $P622."handle_types"(58)
    push_eh $P622
    .lex "self", self
    .lex "$/", param_623
    find_lex $P624, "$/"
    find_lex $P625, "$/"
    unless_null $P625, vivify_245
    new $P625, "Hash"
  vivify_245:
    set $P626, $P625["scope_declarator"]
    unless_null $P626, vivify_246
    new $P626, "Undef"
  vivify_246:
    $P627 = $P626."ast"()
    $P628 = $P624."!make"($P627)
    .return ($P628)
  control_621:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P629, exception, "payload"
    .return ($P629)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<routine_declarator>"  :subid("47_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_633
.annotate "line", 211
    new $P632, 'ExceptionHandler'
    set_addr $P632, control_631
    $P632."handle_types"(58)
    push_eh $P632
    .lex "self", self
    .lex "$/", param_633
    find_lex $P634, "$/"
    find_lex $P635, "$/"
    unless_null $P635, vivify_247
    new $P635, "Hash"
  vivify_247:
    set $P636, $P635["routine_declarator"]
    unless_null $P636, vivify_248
    new $P636, "Undef"
  vivify_248:
    $P637 = $P636."ast"()
    $P638 = $P634."!make"($P637)
    .return ($P638)
  control_631:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P639, exception, "payload"
    .return ($P639)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<regex_declarator>"  :subid("48_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_643
.annotate "line", 212
    new $P642, 'ExceptionHandler'
    set_addr $P642, control_641
    $P642."handle_types"(58)
    push_eh $P642
    .lex "self", self
    .lex "$/", param_643
    find_lex $P644, "$/"
    find_lex $P645, "$/"
    unless_null $P645, vivify_249
    new $P645, "Hash"
  vivify_249:
    set $P646, $P645["regex_declarator"]
    unless_null $P646, vivify_250
    new $P646, "Undef"
  vivify_250:
    $P647 = $P646."ast"()
    $P648 = $P644."!make"($P647)
    .return ($P648)
  control_641:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P649, exception, "payload"
    .return ($P649)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<statement_prefix>"  :subid("49_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_653
.annotate "line", 213
    new $P652, 'ExceptionHandler'
    set_addr $P652, control_651
    $P652."handle_types"(58)
    push_eh $P652
    .lex "self", self
    .lex "$/", param_653
    find_lex $P654, "$/"
    find_lex $P655, "$/"
    unless_null $P655, vivify_251
    new $P655, "Hash"
  vivify_251:
    set $P656, $P655["statement_prefix"]
    unless_null $P656, vivify_252
    new $P656, "Undef"
  vivify_252:
    $P657 = $P656."ast"()
    $P658 = $P654."!make"($P657)
    .return ($P658)
  control_651:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P659, exception, "payload"
    .return ($P659)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<lambda>"  :subid("50_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_663
.annotate "line", 214
    new $P662, 'ExceptionHandler'
    set_addr $P662, control_661
    $P662."handle_types"(58)
    push_eh $P662
    .lex "self", self
    .lex "$/", param_663
    find_lex $P664, "$/"
    find_lex $P665, "$/"
    unless_null $P665, vivify_253
    new $P665, "Hash"
  vivify_253:
    set $P666, $P665["pblock"]
    unless_null $P666, vivify_254
    new $P666, "Undef"
  vivify_254:
    $P667 = $P666."ast"()
    $P668 = $P664."!make"($P667)
    .return ($P668)
  control_661:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P669, exception, "payload"
    .return ($P669)
.end


.namespace ["NQP";"Actions"]
.sub "colonpair"  :subid("51_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_673
.annotate "line", 216
    new $P672, 'ExceptionHandler'
    set_addr $P672, control_671
    $P672."handle_types"(58)
    push_eh $P672
    .lex "self", self
    .lex "$/", param_673
.annotate "line", 217
    new $P674, "Undef"
    .lex "$past", $P674
.annotate "line", 218
    find_lex $P677, "$/"
    unless_null $P677, vivify_255
    new $P677, "Hash"
  vivify_255:
    set $P678, $P677["circumfix"]
    unless_null $P678, vivify_256
    new $P678, "Undef"
  vivify_256:
    if $P678, if_676
.annotate "line", 219
    get_hll_global $P683, ["PAST"], "Val"
    find_lex $P684, "$/"
    unless_null $P684, vivify_257
    new $P684, "Hash"
  vivify_257:
    set $P685, $P684["not"]
    unless_null $P685, vivify_258
    new $P685, "Undef"
  vivify_258:
    isfalse $I686, $P685
    $P687 = $P683."new"($I686 :named("value"))
    set $P675, $P687
.annotate "line", 218
    goto if_676_end
  if_676:
    find_lex $P679, "$/"
    unless_null $P679, vivify_259
    new $P679, "Hash"
  vivify_259:
    set $P680, $P679["circumfix"]
    unless_null $P680, vivify_260
    new $P680, "ResizablePMCArray"
  vivify_260:
    set $P681, $P680[0]
    unless_null $P681, vivify_261
    new $P681, "Undef"
  vivify_261:
    $P682 = $P681."ast"()
    set $P675, $P682
  if_676_end:
    store_lex "$past", $P675
.annotate "line", 220
    find_lex $P688, "$past"
    find_lex $P689, "$/"
    unless_null $P689, vivify_262
    new $P689, "Hash"
  vivify_262:
    set $P690, $P689["identifier"]
    unless_null $P690, vivify_263
    new $P690, "Undef"
  vivify_263:
    set $S691, $P690
    $P688."named"($S691)
.annotate "line", 221
    find_lex $P692, "$/"
    find_lex $P693, "$past"
    $P694 = $P692."!make"($P693)
.annotate "line", 216
    .return ($P694)
  control_671:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P695, exception, "payload"
    .return ($P695)
.end


.namespace ["NQP";"Actions"]
.sub "variable"  :subid("52_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_699
.annotate "line", 224
    .const 'Sub' $P712 = "53_1259103989.89791" 
    capture_lex $P712
    new $P698, 'ExceptionHandler'
    set_addr $P698, control_697
    $P698."handle_types"(58)
    push_eh $P698
    .lex "self", self
    .lex "$/", param_699
.annotate "line", 225
    new $P700, "Undef"
    .lex "$past", $P700
.annotate "line", 224
    find_lex $P701, "$past"
.annotate "line", 226
    find_lex $P703, "$/"
    unless_null $P703, vivify_264
    new $P703, "Hash"
  vivify_264:
    set $P704, $P703["postcircumfix"]
    unless_null $P704, vivify_265
    new $P704, "Undef"
  vivify_265:
    if $P704, if_702
.annotate "line", 230
    .const 'Sub' $P712 = "53_1259103989.89791" 
    capture_lex $P712
    $P712()
    goto if_702_end
  if_702:
.annotate "line", 227
    find_lex $P705, "$/"
    unless_null $P705, vivify_282
    new $P705, "Hash"
  vivify_282:
    set $P706, $P705["postcircumfix"]
    unless_null $P706, vivify_283
    new $P706, "Undef"
  vivify_283:
    $P707 = $P706."ast"()
    store_lex "$past", $P707
.annotate "line", 228
    find_lex $P708, "$past"
    get_hll_global $P709, ["PAST"], "Var"
    $P710 = $P709."new"("$/" :named("name"))
    $P708."unshift"($P710)
  if_702_end:
.annotate "line", 259
    find_lex $P781, "$/"
    find_lex $P782, "$past"
    $P783 = $P781."!make"($P782)
.annotate "line", 224
    .return ($P783)
  control_697:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P784, exception, "payload"
    .return ($P784)
.end


.namespace ["NQP";"Actions"]
.sub "_block711"  :anon :subid("53_1259103989.89791") :outer("52_1259103989.89791")
.annotate "line", 231
    new $P713, "ResizablePMCArray"
    .lex "@name", $P713
    get_hll_global $P714, ["NQP"], "Compiler"
    find_lex $P715, "$/"
    set $S716, $P715
    $P717 = $P714."parse_name"($S716)
    store_lex "@name", $P717
.annotate "line", 232
    get_hll_global $P718, ["PAST"], "Var"
    find_lex $P719, "@name"
    $P720 = $P719."pop"()
    set $S721, $P720
    $P722 = $P718."new"($S721 :named("name"))
    store_lex "$past", $P722
.annotate "line", 233
    find_lex $P724, "@name"
    unless $P724, if_723_end
.annotate "line", 234
    find_lex $P726, "@name"
    unless_null $P726, vivify_266
    new $P726, "ResizablePMCArray"
  vivify_266:
    set $P727, $P726[0]
    unless_null $P727, vivify_267
    new $P727, "Undef"
  vivify_267:
    set $S728, $P727
    iseq $I729, $S728, "GLOBAL"
    unless $I729, if_725_end
    find_lex $P730, "@name"
    $P730."shift"()
  if_725_end:
.annotate "line", 235
    find_lex $P731, "$past"
    find_lex $P732, "@name"
    $P731."namespace"($P732)
.annotate "line", 236
    find_lex $P733, "$past"
    $P733."scope"("package")
.annotate "line", 237
    find_lex $P734, "$past"
    find_lex $P735, "$/"
    unless_null $P735, vivify_268
    new $P735, "Hash"
  vivify_268:
    set $P736, $P735["sigil"]
    unless_null $P736, vivify_269
    new $P736, "Undef"
  vivify_269:
    $P737 = "sigiltype"($P736)
    $P734."viviself"($P737)
.annotate "line", 238
    find_lex $P738, "$past"
    $P738."lvalue"(1)
  if_723_end:
.annotate "line", 240
    find_lex $P741, "$/"
    unless_null $P741, vivify_270
    new $P741, "Hash"
  vivify_270:
    set $P742, $P741["twigil"]
    unless_null $P742, vivify_271
    new $P742, "ResizablePMCArray"
  vivify_271:
    set $P743, $P742[0]
    unless_null $P743, vivify_272
    new $P743, "Undef"
  vivify_272:
    set $S744, $P743
    iseq $I745, $S744, "*"
    if $I745, if_740
.annotate "line", 253
    find_lex $P767, "$/"
    unless_null $P767, vivify_273
    new $P767, "Hash"
  vivify_273:
    set $P768, $P767["twigil"]
    unless_null $P768, vivify_274
    new $P768, "ResizablePMCArray"
  vivify_274:
    set $P769, $P768[0]
    unless_null $P769, vivify_275
    new $P769, "Undef"
  vivify_275:
    set $S770, $P769
    iseq $I771, $S770, "!"
    if $I771, if_766
    new $P765, 'Integer'
    set $P765, $I771
    goto if_766_end
  if_766:
.annotate "line", 254
    find_lex $P772, "$past"
    get_hll_global $P773, ["PAST"], "Var"
    $P774 = $P773."new"("self" :named("name"))
    $P772."push"($P774)
.annotate "line", 255
    find_lex $P775, "$past"
    $P775."scope"("attribute")
.annotate "line", 256
    find_lex $P776, "$past"
    find_lex $P777, "$/"
    unless_null $P777, vivify_276
    new $P777, "Hash"
  vivify_276:
    set $P778, $P777["sigil"]
    unless_null $P778, vivify_277
    new $P778, "Undef"
  vivify_277:
    $P779 = "sigiltype"($P778)
    $P780 = $P776."viviself"($P779)
.annotate "line", 253
    set $P765, $P780
  if_766_end:
    set $P739, $P765
.annotate "line", 240
    goto if_740_end
  if_740:
.annotate "line", 241
    find_lex $P746, "$past"
    $P746."scope"("contextual")
.annotate "line", 242
    find_lex $P747, "$past"
.annotate "line", 243
    get_hll_global $P748, ["PAST"], "Var"
.annotate "line", 245
    find_lex $P749, "$/"
    unless_null $P749, vivify_278
    new $P749, "Hash"
  vivify_278:
    set $P750, $P749["sigil"]
    unless_null $P750, vivify_279
    new $P750, "Undef"
  vivify_279:
    set $S751, $P750
    new $P752, 'String'
    set $P752, $S751
    find_lex $P753, "$/"
    unless_null $P753, vivify_280
    new $P753, "Hash"
  vivify_280:
    set $P754, $P753["desigilname"]
    unless_null $P754, vivify_281
    new $P754, "Undef"
  vivify_281:
    concat $P755, $P752, $P754
.annotate "line", 247
    get_hll_global $P756, ["PAST"], "Op"
    new $P757, "String"
    assign $P757, "Contextual "
    find_lex $P758, "$/"
    set $S759, $P758
    concat $P760, $P757, $S759
    concat $P761, $P760, " not found"
    $P762 = $P756."new"($P761, "die" :named("pirop"))
    $P763 = $P748."new"("package" :named("scope"), "" :named("namespace"), $P755 :named("name"), $P762 :named("viviself"))
.annotate "line", 243
    $P764 = $P747."viviself"($P763)
.annotate "line", 240
    set $P739, $P764
  if_740_end:
.annotate "line", 230
    .return ($P739)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<module>"  :subid("54_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_788
.annotate "line", 262
    new $P787, 'ExceptionHandler'
    set_addr $P787, control_786
    $P787."handle_types"(58)
    push_eh $P787
    .lex "self", self
    .lex "$/", param_788
    find_lex $P789, "$/"
    find_lex $P790, "$/"
    unless_null $P790, vivify_284
    new $P790, "Hash"
  vivify_284:
    set $P791, $P790["package_def"]
    unless_null $P791, vivify_285
    new $P791, "Undef"
  vivify_285:
    $P792 = $P791."ast"()
    $P793 = $P789."!make"($P792)
    .return ($P793)
  control_786:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P794, exception, "payload"
    .return ($P794)
.end


.namespace ["NQP";"Actions"]
.sub "package_declarator:sym<class>"  :subid("55_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_798
.annotate "line", 263
    new $P797, 'ExceptionHandler'
    set_addr $P797, control_796
    $P797."handle_types"(58)
    push_eh $P797
    .lex "self", self
    .lex "$/", param_798
.annotate "line", 264
    new $P799, "Undef"
    .lex "$past", $P799
.annotate "line", 265
    new $P800, "Undef"
    .lex "$classinit", $P800
.annotate "line", 274
    new $P801, "Undef"
    .lex "$parent", $P801
.annotate "line", 264
    find_lex $P802, "$/"
    unless_null $P802, vivify_286
    new $P802, "Hash"
  vivify_286:
    set $P803, $P802["package_def"]
    unless_null $P803, vivify_287
    new $P803, "Undef"
  vivify_287:
    $P804 = $P803."ast"()
    store_lex "$past", $P804
.annotate "line", 266
    get_hll_global $P805, ["PAST"], "Op"
.annotate "line", 267
    get_hll_global $P806, ["PAST"], "Op"
    $P807 = $P806."new"("    %r = get_root_global [\"parrot\"], \"P6metaclass\"" :named("inline"))
.annotate "line", 270
    find_lex $P808, "$/"
    unless_null $P808, vivify_288
    new $P808, "Hash"
  vivify_288:
    set $P809, $P808["package_def"]
    unless_null $P809, vivify_289
    new $P809, "Hash"
  vivify_289:
    set $P810, $P809["name"]
    unless_null $P810, vivify_290
    new $P810, "Undef"
  vivify_290:
    set $S811, $P810
    $P812 = $P805."new"($P807, $S811, "new_class" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 266
    store_lex "$classinit", $P812
.annotate "line", 274
    find_lex $P815, "$/"
    unless_null $P815, vivify_291
    new $P815, "Hash"
  vivify_291:
    set $P816, $P815["package_def"]
    unless_null $P816, vivify_292
    new $P816, "Hash"
  vivify_292:
    set $P817, $P816["parent"]
    unless_null $P817, vivify_293
    new $P817, "ResizablePMCArray"
  vivify_293:
    set $P818, $P817[0]
    unless_null $P818, vivify_294
    new $P818, "Undef"
  vivify_294:
    set $S819, $P818
    unless $S819, unless_814
    new $P813, 'String'
    set $P813, $S819
    goto unless_814_end
  unless_814:
.annotate "line", 275
    find_lex $P822, "$/"
    unless_null $P822, vivify_295
    new $P822, "Hash"
  vivify_295:
    set $P823, $P822["sym"]
    unless_null $P823, vivify_296
    new $P823, "Undef"
  vivify_296:
    set $S824, $P823
    iseq $I825, $S824, "grammar"
    if $I825, if_821
    new $P827, "String"
    assign $P827, ""
    set $P820, $P827
    goto if_821_end
  if_821:
    new $P826, "String"
    assign $P826, "Regex::Cursor"
    set $P820, $P826
  if_821_end:
    set $P813, $P820
  unless_814_end:
    store_lex "$parent", $P813
.annotate "line", 276
    find_lex $P829, "$parent"
    unless $P829, if_828_end
.annotate "line", 277
    find_lex $P830, "$classinit"
    get_hll_global $P831, ["PAST"], "Val"
    find_lex $P832, "$parent"
    $P833 = $P831."new"($P832 :named("value"), "parent" :named("named"))
    $P830."push"($P833)
  if_828_end:
.annotate "line", 279
    find_lex $P835, "$past"
    unless_null $P835, vivify_297
    new $P835, "Hash"
  vivify_297:
    set $P836, $P835["attributes"]
    unless_null $P836, vivify_298
    new $P836, "Undef"
  vivify_298:
    unless $P836, if_834_end
.annotate "line", 280
    find_lex $P837, "$classinit"
    find_lex $P838, "$past"
    unless_null $P838, vivify_299
    new $P838, "Hash"
  vivify_299:
    set $P839, $P838["attributes"]
    unless_null $P839, vivify_300
    new $P839, "Undef"
  vivify_300:
    $P837."push"($P839)
  if_834_end:
.annotate "line", 282
    get_global $P840, "@BLOCK"
    unless_null $P840, vivify_301
    new $P840, "ResizablePMCArray"
  vivify_301:
    set $P841, $P840[0]
    unless_null $P841, vivify_302
    new $P841, "Undef"
  vivify_302:
    $P842 = $P841."loadinit"()
    find_lex $P843, "$classinit"
    $P842."push"($P843)
.annotate "line", 283
    find_lex $P844, "$/"
    find_lex $P845, "$past"
    $P846 = $P844."!make"($P845)
.annotate "line", 263
    .return ($P846)
  control_796:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P847, exception, "payload"
    .return ($P847)
.end


.namespace ["NQP";"Actions"]
.sub "package_def"  :subid("56_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_851
.annotate "line", 286
    new $P850, 'ExceptionHandler'
    set_addr $P850, control_849
    $P850."handle_types"(58)
    push_eh $P850
    .lex "self", self
    .lex "$/", param_851
.annotate "line", 287
    new $P852, "Undef"
    .lex "$past", $P852
    find_lex $P855, "$/"
    unless_null $P855, vivify_303
    new $P855, "Hash"
  vivify_303:
    set $P856, $P855["block"]
    unless_null $P856, vivify_304
    new $P856, "Undef"
  vivify_304:
    if $P856, if_854
    find_lex $P860, "$/"
    unless_null $P860, vivify_305
    new $P860, "Hash"
  vivify_305:
    set $P861, $P860["comp_unit"]
    unless_null $P861, vivify_306
    new $P861, "Undef"
  vivify_306:
    $P862 = $P861."ast"()
    set $P853, $P862
    goto if_854_end
  if_854:
    find_lex $P857, "$/"
    unless_null $P857, vivify_307
    new $P857, "Hash"
  vivify_307:
    set $P858, $P857["block"]
    unless_null $P858, vivify_308
    new $P858, "Undef"
  vivify_308:
    $P859 = $P858."ast"()
    set $P853, $P859
  if_854_end:
    store_lex "$past", $P853
.annotate "line", 288
    find_lex $P863, "$past"
    find_lex $P864, "$/"
    unless_null $P864, vivify_309
    new $P864, "Hash"
  vivify_309:
    set $P865, $P864["name"]
    unless_null $P865, vivify_310
    new $P865, "Hash"
  vivify_310:
    set $P866, $P865["identifier"]
    unless_null $P866, vivify_311
    new $P866, "Undef"
  vivify_311:
    $P863."namespace"($P866)
.annotate "line", 289
    find_lex $P867, "$past"
    $P867."blocktype"("immediate")
.annotate "line", 290
    find_lex $P868, "$/"
    find_lex $P869, "$past"
    $P870 = $P868."!make"($P869)
.annotate "line", 286
    .return ($P870)
  control_849:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P871, exception, "payload"
    .return ($P871)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<my>"  :subid("57_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_875
.annotate "line", 293
    new $P874, 'ExceptionHandler'
    set_addr $P874, control_873
    $P874."handle_types"(58)
    push_eh $P874
    .lex "self", self
    .lex "$/", param_875
    find_lex $P876, "$/"
    find_lex $P877, "$/"
    unless_null $P877, vivify_312
    new $P877, "Hash"
  vivify_312:
    set $P878, $P877["scoped"]
    unless_null $P878, vivify_313
    new $P878, "Undef"
  vivify_313:
    $P879 = $P878."ast"()
    $P880 = $P876."!make"($P879)
    .return ($P880)
  control_873:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P881, exception, "payload"
    .return ($P881)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<our>"  :subid("58_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_885
.annotate "line", 294
    new $P884, 'ExceptionHandler'
    set_addr $P884, control_883
    $P884."handle_types"(58)
    push_eh $P884
    .lex "self", self
    .lex "$/", param_885
    find_lex $P886, "$/"
    find_lex $P887, "$/"
    unless_null $P887, vivify_314
    new $P887, "Hash"
  vivify_314:
    set $P888, $P887["scoped"]
    unless_null $P888, vivify_315
    new $P888, "Undef"
  vivify_315:
    $P889 = $P888."ast"()
    $P890 = $P886."!make"($P889)
    .return ($P890)
  control_883:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P891, exception, "payload"
    .return ($P891)
.end


.namespace ["NQP";"Actions"]
.sub "scope_declarator:sym<has>"  :subid("59_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_895
.annotate "line", 295
    new $P894, 'ExceptionHandler'
    set_addr $P894, control_893
    $P894."handle_types"(58)
    push_eh $P894
    .lex "self", self
    .lex "$/", param_895
    find_lex $P896, "$/"
    find_lex $P897, "$/"
    unless_null $P897, vivify_316
    new $P897, "Hash"
  vivify_316:
    set $P898, $P897["scoped"]
    unless_null $P898, vivify_317
    new $P898, "Undef"
  vivify_317:
    $P899 = $P898."ast"()
    $P900 = $P896."!make"($P899)
    .return ($P900)
  control_893:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P901, exception, "payload"
    .return ($P901)
.end


.namespace ["NQP";"Actions"]
.sub "scoped"  :subid("60_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_905
.annotate "line", 297
    new $P904, 'ExceptionHandler'
    set_addr $P904, control_903
    $P904."handle_types"(58)
    push_eh $P904
    .lex "self", self
    .lex "$/", param_905
.annotate "line", 298
    find_lex $P906, "$/"
.annotate "line", 299
    find_lex $P909, "$/"
    unless_null $P909, vivify_318
    new $P909, "Hash"
  vivify_318:
    set $P910, $P909["routine_declarator"]
    unless_null $P910, vivify_319
    new $P910, "Undef"
  vivify_319:
    if $P910, if_908
.annotate "line", 300
    find_lex $P914, "$/"
    unless_null $P914, vivify_320
    new $P914, "Hash"
  vivify_320:
    set $P915, $P914["variable_declarator"]
    unless_null $P915, vivify_321
    new $P915, "Undef"
  vivify_321:
    $P916 = $P915."ast"()
    set $P907, $P916
.annotate "line", 299
    goto if_908_end
  if_908:
    find_lex $P911, "$/"
    unless_null $P911, vivify_322
    new $P911, "Hash"
  vivify_322:
    set $P912, $P911["routine_declarator"]
    unless_null $P912, vivify_323
    new $P912, "Undef"
  vivify_323:
    $P913 = $P912."ast"()
    set $P907, $P913
  if_908_end:
    $P917 = $P906."!make"($P907)
.annotate "line", 297
    .return ($P917)
  control_903:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P918, exception, "payload"
    .return ($P918)
.end


.namespace ["NQP";"Actions"]
.sub "variable_declarator"  :subid("61_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_922
.annotate "line", 303
    .const 'Sub' $P962 = "62_1259103989.89791" 
    capture_lex $P962
    new $P921, 'ExceptionHandler'
    set_addr $P921, control_920
    $P921."handle_types"(58)
    push_eh $P921
    .lex "self", self
    .lex "$/", param_922
.annotate "line", 304
    new $P923, "Undef"
    .lex "$past", $P923
.annotate "line", 305
    new $P924, "Undef"
    .lex "$sigil", $P924
.annotate "line", 306
    new $P925, "Undef"
    .lex "$name", $P925
.annotate "line", 307
    new $P926, "Undef"
    .lex "$BLOCK", $P926
.annotate "line", 304
    find_lex $P927, "$/"
    unless_null $P927, vivify_324
    new $P927, "Hash"
  vivify_324:
    set $P928, $P927["variable"]
    unless_null $P928, vivify_325
    new $P928, "Undef"
  vivify_325:
    $P929 = $P928."ast"()
    store_lex "$past", $P929
.annotate "line", 305
    find_lex $P930, "$/"
    unless_null $P930, vivify_326
    new $P930, "Hash"
  vivify_326:
    set $P931, $P930["variable"]
    unless_null $P931, vivify_327
    new $P931, "Hash"
  vivify_327:
    set $P932, $P931["sigil"]
    unless_null $P932, vivify_328
    new $P932, "Undef"
  vivify_328:
    store_lex "$sigil", $P932
.annotate "line", 306
    find_lex $P933, "$past"
    $P934 = $P933."name"()
    store_lex "$name", $P934
.annotate "line", 307
    get_global $P935, "@BLOCK"
    unless_null $P935, vivify_329
    new $P935, "ResizablePMCArray"
  vivify_329:
    set $P936, $P935[0]
    unless_null $P936, vivify_330
    new $P936, "Undef"
  vivify_330:
    store_lex "$BLOCK", $P936
.annotate "line", 308
    find_lex $P938, "$BLOCK"
    find_lex $P939, "$name"
    $P940 = $P938."symbol"($P939)
    unless $P940, if_937_end
.annotate "line", 309
    find_lex $P941, "$/"
    $P942 = $P941."CURSOR"()
    find_lex $P943, "$name"
    $P942."panic"("Redeclaration of symbol ", $P943)
  if_937_end:
.annotate "line", 311
    find_dynamic_lex $P945, "$*SCOPE"
    unless_null $P945, vivify_331
    get_hll_global $P945, "$SCOPE"
    unless_null $P945, vivify_332
    die "Contextual $*SCOPE not found"
  vivify_332:
  vivify_331:
    set $S946, $P945
    iseq $I947, $S946, "has"
    if $I947, if_944
.annotate "line", 320
    .const 'Sub' $P962 = "62_1259103989.89791" 
    capture_lex $P962
    $P962()
    goto if_944_end
  if_944:
.annotate "line", 312
    find_lex $P948, "$BLOCK"
    find_lex $P949, "$name"
    $P948."symbol"($P949, "attribute" :named("scope"))
.annotate "line", 313
    find_lex $P951, "$BLOCK"
    unless_null $P951, vivify_337
    new $P951, "Hash"
  vivify_337:
    set $P952, $P951["attributes"]
    unless_null $P952, vivify_338
    new $P952, "Undef"
  vivify_338:
    if $P952, unless_950_end
.annotate "line", 315
    get_hll_global $P953, ["PAST"], "Op"
    $P954 = $P953."new"("list" :named("pasttype"), "attr" :named("named"))
    find_lex $P955, "$BLOCK"
    unless_null $P955, vivify_339
    new $P955, "Hash"
    store_lex "$BLOCK", $P955
  vivify_339:
    set $P955["attributes"], $P954
  unless_950_end:
.annotate "line", 317
    find_lex $P956, "$BLOCK"
    unless_null $P956, vivify_340
    new $P956, "Hash"
  vivify_340:
    set $P957, $P956["attributes"]
    unless_null $P957, vivify_341
    new $P957, "Undef"
  vivify_341:
    find_lex $P958, "$name"
    $P957."push"($P958)
.annotate "line", 318
    get_hll_global $P959, ["PAST"], "Stmts"
    $P960 = $P959."new"()
    store_lex "$past", $P960
  if_944_end:
.annotate "line", 328
    find_lex $P986, "$/"
    find_lex $P987, "$past"
    $P988 = $P986."!make"($P987)
.annotate "line", 303
    .return ($P988)
  control_920:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P989, exception, "payload"
    .return ($P989)
.end


.namespace ["NQP";"Actions"]
.sub "_block961"  :anon :subid("62_1259103989.89791") :outer("61_1259103989.89791")
.annotate "line", 321
    new $P963, "Undef"
    .lex "$scope", $P963
.annotate "line", 322
    new $P964, "Undef"
    .lex "$decl", $P964
.annotate "line", 321
    find_dynamic_lex $P967, "$*SCOPE"
    unless_null $P967, vivify_333
    get_hll_global $P967, "$SCOPE"
    unless_null $P967, vivify_334
    die "Contextual $*SCOPE not found"
  vivify_334:
  vivify_333:
    set $S968, $P967
    iseq $I969, $S968, "our"
    if $I969, if_966
    new $P971, "String"
    assign $P971, "lexical"
    set $P965, $P971
    goto if_966_end
  if_966:
    new $P970, "String"
    assign $P970, "package"
    set $P965, $P970
  if_966_end:
    store_lex "$scope", $P965
.annotate "line", 322
    get_hll_global $P972, ["PAST"], "Var"
    find_lex $P973, "$name"
    find_lex $P974, "$scope"
.annotate "line", 323
    find_lex $P975, "$sigil"
    $P976 = "sigiltype"($P975)
    find_lex $P977, "$/"
    $P978 = $P972."new"($P973 :named("name"), $P974 :named("scope"), 1 :named("isdecl"), 1 :named("lvalue"), $P976 :named("viviself"), $P977 :named("node"))
.annotate "line", 322
    store_lex "$decl", $P978
.annotate "line", 325
    find_lex $P979, "$BLOCK"
    find_lex $P980, "$name"
    find_lex $P981, "$scope"
    $P979."symbol"($P980, $P981 :named("scope"))
.annotate "line", 326
    find_lex $P982, "$BLOCK"
    unless_null $P982, vivify_335
    new $P982, "ResizablePMCArray"
  vivify_335:
    set $P983, $P982[0]
    unless_null $P983, vivify_336
    new $P983, "Undef"
  vivify_336:
    find_lex $P984, "$decl"
    $P985 = $P983."push"($P984)
.annotate "line", 320
    .return ($P985)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<sub>"  :subid("63_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_993
.annotate "line", 331
    new $P992, 'ExceptionHandler'
    set_addr $P992, control_991
    $P992."handle_types"(58)
    push_eh $P992
    .lex "self", self
    .lex "$/", param_993
    find_lex $P994, "$/"
    find_lex $P995, "$/"
    unless_null $P995, vivify_342
    new $P995, "Hash"
  vivify_342:
    set $P996, $P995["routine_def"]
    unless_null $P996, vivify_343
    new $P996, "Undef"
  vivify_343:
    $P997 = $P996."ast"()
    $P998 = $P994."!make"($P997)
    .return ($P998)
  control_991:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P999, exception, "payload"
    .return ($P999)
.end


.namespace ["NQP";"Actions"]
.sub "routine_declarator:sym<method>"  :subid("64_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1003
.annotate "line", 332
    new $P1002, 'ExceptionHandler'
    set_addr $P1002, control_1001
    $P1002."handle_types"(58)
    push_eh $P1002
    .lex "self", self
    .lex "$/", param_1003
    find_lex $P1004, "$/"
    find_lex $P1005, "$/"
    unless_null $P1005, vivify_344
    new $P1005, "Hash"
  vivify_344:
    set $P1006, $P1005["method_def"]
    unless_null $P1006, vivify_345
    new $P1006, "Undef"
  vivify_345:
    $P1007 = $P1006."ast"()
    $P1008 = $P1004."!make"($P1007)
    .return ($P1008)
  control_1001:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1009, exception, "payload"
    .return ($P1009)
.end


.namespace ["NQP";"Actions"]
.sub "routine_def"  :subid("65_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1013
.annotate "line", 334
    .const 'Sub' $P1024 = "66_1259103989.89791" 
    capture_lex $P1024
    new $P1012, 'ExceptionHandler'
    set_addr $P1012, control_1011
    $P1012."handle_types"(58)
    push_eh $P1012
    .lex "self", self
    .lex "$/", param_1013
.annotate "line", 335
    new $P1014, "Undef"
    .lex "$past", $P1014
    find_lex $P1015, "$/"
    unless_null $P1015, vivify_346
    new $P1015, "Hash"
  vivify_346:
    set $P1016, $P1015["blockoid"]
    unless_null $P1016, vivify_347
    new $P1016, "Undef"
  vivify_347:
    $P1017 = $P1016."ast"()
    store_lex "$past", $P1017
.annotate "line", 336
    find_lex $P1018, "$past"
    $P1018."blocktype"("declaration")
.annotate "line", 337
    find_lex $P1019, "$past"
    $P1019."control"("return_pir")
.annotate "line", 338
    find_lex $P1021, "$/"
    unless_null $P1021, vivify_348
    new $P1021, "Hash"
  vivify_348:
    set $P1022, $P1021["deflongname"]
    unless_null $P1022, vivify_349
    new $P1022, "Undef"
  vivify_349:
    unless $P1022, if_1020_end
    .const 'Sub' $P1024 = "66_1259103989.89791" 
    capture_lex $P1024
    $P1024()
  if_1020_end:
.annotate "line", 348
    find_lex $P1052, "$/"
    find_lex $P1053, "$past"
    $P1054 = $P1052."!make"($P1053)
.annotate "line", 334
    .return ($P1054)
  control_1011:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1055, exception, "payload"
    .return ($P1055)
.end


.namespace ["NQP";"Actions"]
.sub "_block1023"  :anon :subid("66_1259103989.89791") :outer("65_1259103989.89791")
.annotate "line", 339
    new $P1025, "Undef"
    .lex "$name", $P1025
    find_lex $P1026, "$/"
    unless_null $P1026, vivify_350
    new $P1026, "Hash"
  vivify_350:
    set $P1027, $P1026["deflongname"]
    unless_null $P1027, vivify_351
    new $P1027, "ResizablePMCArray"
  vivify_351:
    set $P1028, $P1027[0]
    unless_null $P1028, vivify_352
    new $P1028, "Undef"
  vivify_352:
    $P1029 = $P1028."ast"()
    set $S1030, $P1029
    new $P1031, 'String'
    set $P1031, $S1030
    store_lex "$name", $P1031
.annotate "line", 340
    find_lex $P1032, "$past"
    find_lex $P1033, "$name"
    $P1032."name"($P1033)
.annotate "line", 341
    find_dynamic_lex $P1036, "$*SCOPE"
    unless_null $P1036, vivify_353
    get_hll_global $P1036, "$SCOPE"
    unless_null $P1036, vivify_354
    die "Contextual $*SCOPE not found"
  vivify_354:
  vivify_353:
    set $S1037, $P1036
    isne $I1038, $S1037, "our"
    if $I1038, if_1035
    new $P1034, 'Integer'
    set $P1034, $I1038
    goto if_1035_end
  if_1035:
.annotate "line", 342
    get_global $P1039, "@BLOCK"
    unless_null $P1039, vivify_355
    new $P1039, "ResizablePMCArray"
  vivify_355:
    set $P1040, $P1039[0]
    unless_null $P1040, vivify_356
    new $P1040, "ResizablePMCArray"
  vivify_356:
    set $P1041, $P1040[0]
    unless_null $P1041, vivify_357
    new $P1041, "Undef"
  vivify_357:
    get_hll_global $P1042, ["PAST"], "Var"
    find_lex $P1043, "$name"
    find_lex $P1044, "$past"
    $P1045 = $P1042."new"($P1043 :named("name"), 1 :named("isdecl"), $P1044 :named("viviself"), "lexical" :named("scope"))
    $P1041."push"($P1045)
.annotate "line", 344
    get_global $P1046, "@BLOCK"
    unless_null $P1046, vivify_358
    new $P1046, "ResizablePMCArray"
  vivify_358:
    set $P1047, $P1046[0]
    unless_null $P1047, vivify_359
    new $P1047, "Undef"
  vivify_359:
    find_lex $P1048, "$name"
    $P1047."symbol"($P1048, "lexical" :named("scope"))
.annotate "line", 345
    get_hll_global $P1049, ["PAST"], "Var"
    find_lex $P1050, "$name"
    $P1051 = $P1049."new"($P1050 :named("name"))
    store_lex "$past", $P1051
.annotate "line", 341
    set $P1034, $P1051
  if_1035_end:
.annotate "line", 338
    .return ($P1034)
.end


.namespace ["NQP";"Actions"]
.sub "method_def"  :subid("67_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1059
.annotate "line", 352
    .const 'Sub' $P1075 = "68_1259103989.89791" 
    capture_lex $P1075
    new $P1058, 'ExceptionHandler'
    set_addr $P1058, control_1057
    $P1058."handle_types"(58)
    push_eh $P1058
    .lex "self", self
    .lex "$/", param_1059
.annotate "line", 353
    new $P1060, "Undef"
    .lex "$past", $P1060
    find_lex $P1061, "$/"
    unless_null $P1061, vivify_360
    new $P1061, "Hash"
  vivify_360:
    set $P1062, $P1061["blockoid"]
    unless_null $P1062, vivify_361
    new $P1062, "Undef"
  vivify_361:
    $P1063 = $P1062."ast"()
    store_lex "$past", $P1063
.annotate "line", 354
    find_lex $P1064, "$past"
    $P1064."blocktype"("method")
.annotate "line", 355
    find_lex $P1065, "$past"
    $P1065."control"("return_pir")
.annotate "line", 356
    find_lex $P1066, "$past"
    unless_null $P1066, vivify_362
    new $P1066, "ResizablePMCArray"
  vivify_362:
    set $P1067, $P1066[0]
    unless_null $P1067, vivify_363
    new $P1067, "Undef"
  vivify_363:
    get_hll_global $P1068, ["PAST"], "Op"
    $P1069 = $P1068."new"("    .lex \"self\", self" :named("inline"))
    $P1067."unshift"($P1069)
.annotate "line", 357
    find_lex $P1070, "$past"
    $P1070."symbol"("self", "lexical" :named("scope"))
.annotate "line", 358
    find_lex $P1072, "$/"
    unless_null $P1072, vivify_364
    new $P1072, "Hash"
  vivify_364:
    set $P1073, $P1072["deflongname"]
    unless_null $P1073, vivify_365
    new $P1073, "Undef"
  vivify_365:
    unless $P1073, if_1071_end
    .const 'Sub' $P1075 = "68_1259103989.89791" 
    capture_lex $P1075
    $P1075()
  if_1071_end:
.annotate "line", 362
    find_lex $P1086, "$/"
    find_lex $P1087, "$past"
    $P1088 = $P1086."!make"($P1087)
.annotate "line", 352
    .return ($P1088)
  control_1057:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1089, exception, "payload"
    .return ($P1089)
.end


.namespace ["NQP";"Actions"]
.sub "_block1074"  :anon :subid("68_1259103989.89791") :outer("67_1259103989.89791")
.annotate "line", 359
    new $P1076, "Undef"
    .lex "$name", $P1076
    find_lex $P1077, "$/"
    unless_null $P1077, vivify_366
    new $P1077, "Hash"
  vivify_366:
    set $P1078, $P1077["deflongname"]
    unless_null $P1078, vivify_367
    new $P1078, "ResizablePMCArray"
  vivify_367:
    set $P1079, $P1078[0]
    unless_null $P1079, vivify_368
    new $P1079, "Undef"
  vivify_368:
    $P1080 = $P1079."ast"()
    set $S1081, $P1080
    new $P1082, 'String'
    set $P1082, $S1081
    store_lex "$name", $P1082
.annotate "line", 360
    find_lex $P1083, "$past"
    find_lex $P1084, "$name"
    $P1085 = $P1083."name"($P1084)
.annotate "line", 358
    .return ($P1085)
.end


.namespace ["NQP";"Actions"]
.sub "signature"  :subid("69_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1093
.annotate "line", 366
    .const 'Sub' $P1104 = "70_1259103989.89791" 
    capture_lex $P1104
    new $P1092, 'ExceptionHandler'
    set_addr $P1092, control_1091
    $P1092."handle_types"(58)
    push_eh $P1092
    .lex "self", self
    .lex "$/", param_1093
.annotate "line", 367
    new $P1094, "Undef"
    .lex "$BLOCKINIT", $P1094
    get_global $P1095, "@BLOCK"
    unless_null $P1095, vivify_369
    new $P1095, "ResizablePMCArray"
  vivify_369:
    set $P1096, $P1095[0]
    unless_null $P1096, vivify_370
    new $P1096, "ResizablePMCArray"
  vivify_370:
    set $P1097, $P1096[0]
    unless_null $P1097, vivify_371
    new $P1097, "Undef"
  vivify_371:
    store_lex "$BLOCKINIT", $P1097
.annotate "line", 368
    find_lex $P1099, "$/"
    unless_null $P1099, vivify_372
    new $P1099, "Hash"
  vivify_372:
    set $P1100, $P1099["parameter"]
    unless_null $P1100, vivify_373
    new $P1100, "Undef"
  vivify_373:
    defined $I1101, $P1100
    unless $I1101, for_undef_374
    iter $P1098, $P1100
    new $P1111, 'ExceptionHandler'
    set_addr $P1111, loop1110_handler
    $P1111."handle_types"(65, 67, 66)
    push_eh $P1111
  loop1110_test:
    unless $P1098, loop1110_done
    shift $P1102, $P1098
  loop1110_redo:
    .const 'Sub' $P1104 = "70_1259103989.89791" 
    capture_lex $P1104
    $P1104($P1102)
  loop1110_next:
    goto loop1110_test
  loop1110_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1112, exception, 'type'
    eq $P1112, 65, loop1110_next
    eq $P1112, 67, loop1110_redo
  loop1110_done:
    pop_eh 
  for_undef_374:
.annotate "line", 366
    .return ($P1098)
  control_1091:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1113, exception, "payload"
    .return ($P1113)
.end


.namespace ["NQP";"Actions"]
.sub "_block1103"  :anon :subid("70_1259103989.89791") :outer("69_1259103989.89791")
    .param pmc param_1105
.annotate "line", 368
    .lex "$_", param_1105
    find_lex $P1106, "$BLOCKINIT"
    find_lex $P1107, "$_"
    $P1108 = $P1107."ast"()
    $P1109 = $P1106."push"($P1108)
    .return ($P1109)
.end


.namespace ["NQP";"Actions"]
.sub "parameter"  :subid("71_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1117
.annotate "line", 371
    new $P1116, 'ExceptionHandler'
    set_addr $P1116, control_1115
    $P1116."handle_types"(58)
    push_eh $P1116
    .lex "self", self
    .lex "$/", param_1117
.annotate "line", 372
    new $P1118, "Undef"
    .lex "$quant", $P1118
.annotate "line", 373
    new $P1119, "Undef"
    .lex "$past", $P1119
.annotate "line", 372
    find_lex $P1120, "$/"
    unless_null $P1120, vivify_375
    new $P1120, "Hash"
  vivify_375:
    set $P1121, $P1120["quant"]
    unless_null $P1121, vivify_376
    new $P1121, "Undef"
  vivify_376:
    store_lex "$quant", $P1121
    find_lex $P1122, "$past"
.annotate "line", 374
    find_lex $P1124, "$/"
    unless_null $P1124, vivify_377
    new $P1124, "Hash"
  vivify_377:
    set $P1125, $P1124["named_param"]
    unless_null $P1125, vivify_378
    new $P1125, "Undef"
  vivify_378:
    if $P1125, if_1123
.annotate "line", 381
    find_lex $P1139, "$/"
    unless_null $P1139, vivify_379
    new $P1139, "Hash"
  vivify_379:
    set $P1140, $P1139["param_var"]
    unless_null $P1140, vivify_380
    new $P1140, "Undef"
  vivify_380:
    $P1141 = $P1140."ast"()
    store_lex "$past", $P1141
.annotate "line", 382
    find_lex $P1143, "$quant"
    set $S1144, $P1143
    iseq $I1145, $S1144, "*"
    if $I1145, if_1142
.annotate "line", 386
    find_lex $P1154, "$quant"
    set $S1155, $P1154
    iseq $I1156, $S1155, "?"
    unless $I1156, if_1153_end
.annotate "line", 387
    find_lex $P1157, "$past"
    find_lex $P1158, "$/"
    unless_null $P1158, vivify_381
    new $P1158, "Hash"
  vivify_381:
    set $P1159, $P1158["param_var"]
    unless_null $P1159, vivify_382
    new $P1159, "Hash"
  vivify_382:
    set $P1160, $P1159["sigil"]
    unless_null $P1160, vivify_383
    new $P1160, "Undef"
  vivify_383:
    $P1161 = "sigiltype"($P1160)
    $P1157."viviself"($P1161)
  if_1153_end:
.annotate "line", 386
    goto if_1142_end
  if_1142:
.annotate "line", 383
    find_lex $P1146, "$past"
    $P1146."slurpy"(1)
.annotate "line", 384
    find_lex $P1147, "$past"
    find_lex $P1148, "$/"
    unless_null $P1148, vivify_384
    new $P1148, "Hash"
  vivify_384:
    set $P1149, $P1148["param_var"]
    unless_null $P1149, vivify_385
    new $P1149, "Hash"
  vivify_385:
    set $P1150, $P1149["sigil"]
    unless_null $P1150, vivify_386
    new $P1150, "Undef"
  vivify_386:
    set $S1151, $P1150
    iseq $I1152, $S1151, "%"
    $P1147."named"($I1152)
  if_1142_end:
.annotate "line", 380
    goto if_1123_end
  if_1123:
.annotate "line", 375
    find_lex $P1126, "$/"
    unless_null $P1126, vivify_387
    new $P1126, "Hash"
  vivify_387:
    set $P1127, $P1126["named_param"]
    unless_null $P1127, vivify_388
    new $P1127, "Undef"
  vivify_388:
    $P1128 = $P1127."ast"()
    store_lex "$past", $P1128
.annotate "line", 376
    find_lex $P1130, "$quant"
    set $S1131, $P1130
    isne $I1132, $S1131, "!"
    unless $I1132, if_1129_end
.annotate "line", 377
    find_lex $P1133, "$past"
    find_lex $P1134, "$/"
    unless_null $P1134, vivify_389
    new $P1134, "Hash"
  vivify_389:
    set $P1135, $P1134["named_param"]
    unless_null $P1135, vivify_390
    new $P1135, "Hash"
  vivify_390:
    set $P1136, $P1135["param_var"]
    unless_null $P1136, vivify_391
    new $P1136, "Hash"
  vivify_391:
    set $P1137, $P1136["sigil"]
    unless_null $P1137, vivify_392
    new $P1137, "Undef"
  vivify_392:
    $P1138 = "sigiltype"($P1137)
    $P1133."viviself"($P1138)
  if_1129_end:
  if_1123_end:
.annotate "line", 390
    find_lex $P1163, "$/"
    unless_null $P1163, vivify_393
    new $P1163, "Hash"
  vivify_393:
    set $P1164, $P1163["default_value"]
    unless_null $P1164, vivify_394
    new $P1164, "Undef"
  vivify_394:
    unless $P1164, if_1162_end
.annotate "line", 391
    find_lex $P1166, "$quant"
    set $S1167, $P1166
    iseq $I1168, $S1167, "*"
    unless $I1168, if_1165_end
.annotate "line", 392
    find_lex $P1169, "$/"
    $P1170 = $P1169."CURSOR"()
    $P1170."panic"("Can't put default on slurpy parameter")
  if_1165_end:
.annotate "line", 394
    find_lex $P1172, "$quant"
    set $S1173, $P1172
    iseq $I1174, $S1173, "!"
    unless $I1174, if_1171_end
.annotate "line", 395
    find_lex $P1175, "$/"
    $P1176 = $P1175."CURSOR"()
    $P1176."panic"("Can't put default on required parameter")
  if_1171_end:
.annotate "line", 397
    find_lex $P1177, "$past"
    find_lex $P1178, "$/"
    unless_null $P1178, vivify_395
    new $P1178, "Hash"
  vivify_395:
    set $P1179, $P1178["default_value"]
    unless_null $P1179, vivify_396
    new $P1179, "ResizablePMCArray"
  vivify_396:
    set $P1180, $P1179[0]
    unless_null $P1180, vivify_397
    new $P1180, "Hash"
  vivify_397:
    set $P1181, $P1180["EXPR"]
    unless_null $P1181, vivify_398
    new $P1181, "Undef"
  vivify_398:
    $P1182 = $P1181."ast"()
    $P1177."viviself"($P1182)
  if_1162_end:
.annotate "line", 399
    find_lex $P1184, "$past"
    $P1185 = $P1184."viviself"()
    if $P1185, unless_1183_end
    get_global $P1186, "@BLOCK"
    unless_null $P1186, vivify_399
    new $P1186, "ResizablePMCArray"
  vivify_399:
    set $P1187, $P1186[0]
    unless_null $P1187, vivify_400
    new $P1187, "Undef"
  vivify_400:
    get_global $P1188, "@BLOCK"
    unless_null $P1188, vivify_401
    new $P1188, "ResizablePMCArray"
  vivify_401:
    set $P1189, $P1188[0]
    unless_null $P1189, vivify_402
    new $P1189, "Undef"
  vivify_402:
    $P1190 = $P1189."arity"()
    set $N1191, $P1190
    new $P1192, 'Float'
    set $P1192, $N1191
    add $P1193, $P1192, 1
    $P1187."arity"($P1193)
  unless_1183_end:
.annotate "line", 400
    find_lex $P1194, "$/"
    find_lex $P1195, "$past"
    $P1196 = $P1194."!make"($P1195)
.annotate "line", 371
    .return ($P1196)
  control_1115:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1197, exception, "payload"
    .return ($P1197)
.end


.namespace ["NQP";"Actions"]
.sub "param_var"  :subid("72_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1201
.annotate "line", 403
    new $P1200, 'ExceptionHandler'
    set_addr $P1200, control_1199
    $P1200."handle_types"(58)
    push_eh $P1200
    .lex "self", self
    .lex "$/", param_1201
.annotate "line", 404
    new $P1202, "Undef"
    .lex "$name", $P1202
.annotate "line", 405
    new $P1203, "Undef"
    .lex "$past", $P1203
.annotate "line", 404
    find_lex $P1204, "$/"
    set $S1205, $P1204
    new $P1206, 'String'
    set $P1206, $S1205
    store_lex "$name", $P1206
.annotate "line", 405
    get_hll_global $P1207, ["PAST"], "Var"
    find_lex $P1208, "$name"
    find_lex $P1209, "$/"
    $P1210 = $P1207."new"($P1208 :named("name"), "parameter" :named("scope"), 1 :named("isdecl"), $P1209 :named("node"))
    store_lex "$past", $P1210
.annotate "line", 407
    get_global $P1211, "@BLOCK"
    unless_null $P1211, vivify_403
    new $P1211, "ResizablePMCArray"
  vivify_403:
    set $P1212, $P1211[0]
    unless_null $P1212, vivify_404
    new $P1212, "Undef"
  vivify_404:
    find_lex $P1213, "$name"
    $P1212."symbol"($P1213, "lexical" :named("scope"))
.annotate "line", 408
    find_lex $P1214, "$/"
    find_lex $P1215, "$past"
    $P1216 = $P1214."!make"($P1215)
.annotate "line", 403
    .return ($P1216)
  control_1199:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1217, exception, "payload"
    .return ($P1217)
.end


.namespace ["NQP";"Actions"]
.sub "named_param"  :subid("73_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1221
.annotate "line", 411
    new $P1220, 'ExceptionHandler'
    set_addr $P1220, control_1219
    $P1220."handle_types"(58)
    push_eh $P1220
    .lex "self", self
    .lex "$/", param_1221
.annotate "line", 412
    new $P1222, "Undef"
    .lex "$past", $P1222
    find_lex $P1223, "$/"
    unless_null $P1223, vivify_405
    new $P1223, "Hash"
  vivify_405:
    set $P1224, $P1223["param_var"]
    unless_null $P1224, vivify_406
    new $P1224, "Undef"
  vivify_406:
    $P1225 = $P1224."ast"()
    store_lex "$past", $P1225
.annotate "line", 413
    find_lex $P1226, "$past"
    find_lex $P1227, "$/"
    unless_null $P1227, vivify_407
    new $P1227, "Hash"
  vivify_407:
    set $P1228, $P1227["param_var"]
    unless_null $P1228, vivify_408
    new $P1228, "Hash"
  vivify_408:
    set $P1229, $P1228["name"]
    unless_null $P1229, vivify_409
    new $P1229, "Undef"
  vivify_409:
    set $S1230, $P1229
    $P1226."named"($S1230)
.annotate "line", 414
    find_lex $P1231, "$/"
    find_lex $P1232, "$past"
    $P1233 = $P1231."!make"($P1232)
.annotate "line", 411
    .return ($P1233)
  control_1219:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1234, exception, "payload"
    .return ($P1234)
.end


.namespace ["NQP";"Actions"]
.sub "regex_declarator"  :subid("74_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1238
    .param pmc param_1239 :optional
    .param int has_param_1239 :opt_flag
.annotate "line", 417
    .const 'Sub' $P1256 = "75_1259103989.89791" 
    capture_lex $P1256
    new $P1237, 'ExceptionHandler'
    set_addr $P1237, control_1236
    $P1237."handle_types"(58)
    push_eh $P1237
    .lex "self", self
    .lex "$/", param_1238
    if has_param_1239, optparam_410
    new $P1240, "Undef"
    set param_1239, $P1240
  optparam_410:
    .lex "$key", param_1239
.annotate "line", 418
    new $P1241, "ResizablePMCArray"
    .lex "@MODIFIERS", $P1241
.annotate "line", 421
    new $P1242, "Undef"
    .lex "$name", $P1242
.annotate "line", 422
    new $P1243, "Undef"
    .lex "$past", $P1243
.annotate "line", 418

        $P1244 = get_hll_global ['Regex';'P6Regex';'Actions'], '@MODIFIERS'
    
    store_lex "@MODIFIERS", $P1244
.annotate "line", 421
    find_lex $P1245, "$/"
    unless_null $P1245, vivify_411
    new $P1245, "Hash"
  vivify_411:
    set $P1246, $P1245["deflongname"]
    unless_null $P1246, vivify_412
    new $P1246, "Undef"
  vivify_412:
    $P1247 = $P1246."ast"()
    set $S1248, $P1247
    new $P1249, 'String'
    set $P1249, $S1248
    store_lex "$name", $P1249
    find_lex $P1250, "$past"
.annotate "line", 423
    find_lex $P1252, "$key"
    set $S1253, $P1252
    iseq $I1254, $S1253, "open"
    if $I1254, if_1251
.annotate "line", 436
    find_lex $P1284, "$/"
    unless_null $P1284, vivify_413
    new $P1284, "Hash"
  vivify_413:
    set $P1285, $P1284["proto"]
    unless_null $P1285, vivify_414
    new $P1285, "Undef"
  vivify_414:
    if $P1285, if_1283
.annotate "line", 465
    get_hll_global $P1308, ["Regex";"P6Regex";"Actions"], "buildsub"
    find_lex $P1309, "$/"
    unless_null $P1309, vivify_415
    new $P1309, "Hash"
  vivify_415:
    set $P1310, $P1309["p6regex"]
    unless_null $P1310, vivify_416
    new $P1310, "Undef"
  vivify_416:
    $P1311 = $P1310."ast"()
    get_global $P1312, "@BLOCK"
    $P1313 = $P1312."shift"()
    $P1314 = $P1308($P1311, $P1313)
    store_lex "$past", $P1314
.annotate "line", 466
    find_lex $P1315, "$past"
    find_lex $P1316, "$name"
    $P1315."name"($P1316)
.annotate "line", 467
    find_lex $P1317, "@MODIFIERS"
    $P1317."shift"()
.annotate "line", 463
    goto if_1283_end
  if_1283:
.annotate "line", 438
    get_hll_global $P1286, ["PAST"], "Stmts"
.annotate "line", 439
    get_hll_global $P1287, ["PAST"], "Block"
    find_lex $P1288, "$name"
.annotate "line", 440
    get_hll_global $P1289, ["PAST"], "Op"
.annotate "line", 441
    get_hll_global $P1290, ["PAST"], "Var"
    $P1291 = $P1290."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1292, "$name"
    $P1293 = $P1289."new"($P1291, $P1292, "!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 440
    find_lex $P1294, "$/"
    $P1295 = $P1287."new"($P1293, $P1288 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1294 :named("node"))
.annotate "line", 450
    get_hll_global $P1296, ["PAST"], "Block"
    new $P1297, "String"
    assign $P1297, "!PREFIX__"
    find_lex $P1298, "$name"
    concat $P1299, $P1297, $P1298
.annotate "line", 451
    get_hll_global $P1300, ["PAST"], "Op"
.annotate "line", 452
    get_hll_global $P1301, ["PAST"], "Var"
    $P1302 = $P1301."new"("self" :named("name"), "register" :named("scope"))
    find_lex $P1303, "$name"
    $P1304 = $P1300."new"($P1302, $P1303, "!PREFIX__!protoregex" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 451
    find_lex $P1305, "$/"
    $P1306 = $P1296."new"($P1304, $P1299 :named("name"), "method" :named("blocktype"), 0 :named("lexical"), $P1305 :named("node"))
.annotate "line", 450
    $P1307 = $P1286."new"($P1295, $P1306)
.annotate "line", 438
    store_lex "$past", $P1307
  if_1283_end:
.annotate "line", 436
    goto if_1251_end
  if_1251:
.annotate "line", 423
    .const 'Sub' $P1256 = "75_1259103989.89791" 
    capture_lex $P1256
    $P1256()
  if_1251_end:
.annotate "line", 469
    find_lex $P1318, "$/"
    find_lex $P1319, "$past"
    $P1320 = $P1318."!make"($P1319)
.annotate "line", 417
    .return ($P1320)
  control_1236:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1321, exception, "payload"
    .return ($P1321)
.end


.namespace ["NQP";"Actions"]
.sub "_block1255"  :anon :subid("75_1259103989.89791") :outer("74_1259103989.89791")
.annotate "line", 424
    new $P1257, "Hash"
    .lex "%h", $P1257
.annotate "line", 423
    find_lex $P1258, "%h"
.annotate "line", 425
    find_lex $P1260, "$/"
    unless_null $P1260, vivify_417
    new $P1260, "Hash"
  vivify_417:
    set $P1261, $P1260["sym"]
    unless_null $P1261, vivify_418
    new $P1261, "Undef"
  vivify_418:
    set $S1262, $P1261
    iseq $I1263, $S1262, "token"
    unless $I1263, if_1259_end
    new $P1264, "Integer"
    assign $P1264, 1
    find_lex $P1265, "%h"
    unless_null $P1265, vivify_419
    new $P1265, "Hash"
    store_lex "%h", $P1265
  vivify_419:
    set $P1265["r"], $P1264
  if_1259_end:
.annotate "line", 426
    find_lex $P1267, "$/"
    unless_null $P1267, vivify_420
    new $P1267, "Hash"
  vivify_420:
    set $P1268, $P1267["sym"]
    unless_null $P1268, vivify_421
    new $P1268, "Undef"
  vivify_421:
    set $S1269, $P1268
    iseq $I1270, $S1269, "rule"
    unless $I1270, if_1266_end
    new $P1271, "Integer"
    assign $P1271, 1
    find_lex $P1272, "%h"
    unless_null $P1272, vivify_422
    new $P1272, "Hash"
    store_lex "%h", $P1272
  vivify_422:
    set $P1272["r"], $P1271
    new $P1273, "Integer"
    assign $P1273, 1
    find_lex $P1274, "%h"
    unless_null $P1274, vivify_423
    new $P1274, "Hash"
    store_lex "%h", $P1274
  vivify_423:
    set $P1274["s"], $P1273
  if_1266_end:
.annotate "line", 427
    find_lex $P1275, "@MODIFIERS"
    find_lex $P1276, "%h"
    $P1275."unshift"($P1276)
.annotate "line", 428

            $P0 = find_lex '$name'
            set_hll_global ['Regex';'P6Regex';'Actions'], '$REGEXNAME', $P0
        
.annotate "line", 432
    get_global $P1277, "@BLOCK"
    unless_null $P1277, vivify_424
    new $P1277, "ResizablePMCArray"
  vivify_424:
    set $P1278, $P1277[0]
    unless_null $P1278, vivify_425
    new $P1278, "Undef"
  vivify_425:
    $P1278."symbol"(unicode:"$\x{a2}", "lexical" :named("scope"))
.annotate "line", 433
    get_global $P1279, "@BLOCK"
    unless_null $P1279, vivify_426
    new $P1279, "ResizablePMCArray"
  vivify_426:
    set $P1280, $P1279[0]
    unless_null $P1280, vivify_427
    new $P1280, "Undef"
  vivify_427:
    $P1280."symbol"("$/", "lexical" :named("scope"))
.annotate "line", 434
    new $P1281, "Exception"
    set $P1281['type'], 58
    new $P1282, "Integer"
    assign $P1282, 0
    setattribute $P1281, 'payload', $P1282
    throw $P1281
.annotate "line", 423
    .return ()
.end


.namespace ["NQP";"Actions"]
.sub "dotty"  :subid("76_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1325
.annotate "line", 473
    new $P1324, 'ExceptionHandler'
    set_addr $P1324, control_1323
    $P1324."handle_types"(58)
    push_eh $P1324
    .lex "self", self
    .lex "$/", param_1325
.annotate "line", 474
    new $P1326, "Undef"
    .lex "$past", $P1326
    find_lex $P1329, "$/"
    unless_null $P1329, vivify_428
    new $P1329, "Hash"
  vivify_428:
    set $P1330, $P1329["args"]
    unless_null $P1330, vivify_429
    new $P1330, "Undef"
  vivify_429:
    if $P1330, if_1328
    get_hll_global $P1335, ["PAST"], "Op"
    find_lex $P1336, "$/"
    $P1337 = $P1335."new"($P1336 :named("node"))
    set $P1327, $P1337
    goto if_1328_end
  if_1328:
    find_lex $P1331, "$/"
    unless_null $P1331, vivify_430
    new $P1331, "Hash"
  vivify_430:
    set $P1332, $P1331["args"]
    unless_null $P1332, vivify_431
    new $P1332, "ResizablePMCArray"
  vivify_431:
    set $P1333, $P1332[0]
    unless_null $P1333, vivify_432
    new $P1333, "Undef"
  vivify_432:
    $P1334 = $P1333."ast"()
    set $P1327, $P1334
  if_1328_end:
    store_lex "$past", $P1327
.annotate "line", 475
    find_lex $P1338, "$past"
    find_lex $P1341, "$/"
    unless_null $P1341, vivify_433
    new $P1341, "Hash"
  vivify_433:
    set $P1342, $P1341["quote"]
    unless_null $P1342, vivify_434
    new $P1342, "Undef"
  vivify_434:
    if $P1342, if_1340
    find_lex $P1346, "$/"
    unless_null $P1346, vivify_435
    new $P1346, "Hash"
  vivify_435:
    set $P1347, $P1346["longname"]
    unless_null $P1347, vivify_436
    new $P1347, "Undef"
  vivify_436:
    set $S1348, $P1347
    new $P1339, 'String'
    set $P1339, $S1348
    goto if_1340_end
  if_1340:
    find_lex $P1343, "$/"
    unless_null $P1343, vivify_437
    new $P1343, "Hash"
  vivify_437:
    set $P1344, $P1343["quote"]
    unless_null $P1344, vivify_438
    new $P1344, "Undef"
  vivify_438:
    $P1345 = $P1344."ast"()
    set $P1339, $P1345
  if_1340_end:
    $P1338."name"($P1339)
.annotate "line", 476
    find_lex $P1349, "$past"
    $P1349."pasttype"("callmethod")
.annotate "line", 477
    find_lex $P1350, "$/"
    find_lex $P1351, "$past"
    $P1352 = $P1350."!make"($P1351)
.annotate "line", 473
    .return ($P1352)
  control_1323:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1353, exception, "payload"
    .return ($P1353)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<self>"  :subid("77_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1357
.annotate "line", 482
    new $P1356, 'ExceptionHandler'
    set_addr $P1356, control_1355
    $P1356."handle_types"(58)
    push_eh $P1356
    .lex "self", self
    .lex "$/", param_1357
.annotate "line", 483
    find_lex $P1358, "$/"
    get_hll_global $P1359, ["PAST"], "Var"
    $P1360 = $P1359."new"("self" :named("name"))
    $P1361 = $P1358."!make"($P1360)
.annotate "line", 482
    .return ($P1361)
  control_1355:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1362, exception, "payload"
    .return ($P1362)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<identifier>"  :subid("78_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1366
.annotate "line", 486
    new $P1365, 'ExceptionHandler'
    set_addr $P1365, control_1364
    $P1365."handle_types"(58)
    push_eh $P1365
    .lex "self", self
    .lex "$/", param_1366
.annotate "line", 487
    new $P1367, "Undef"
    .lex "$past", $P1367
    find_lex $P1368, "$/"
    unless_null $P1368, vivify_439
    new $P1368, "Hash"
  vivify_439:
    set $P1369, $P1368["args"]
    unless_null $P1369, vivify_440
    new $P1369, "Undef"
  vivify_440:
    $P1370 = $P1369."ast"()
    store_lex "$past", $P1370
.annotate "line", 488
    find_lex $P1371, "$past"
    find_lex $P1372, "$/"
    unless_null $P1372, vivify_441
    new $P1372, "Hash"
  vivify_441:
    set $P1373, $P1372["identifier"]
    unless_null $P1373, vivify_442
    new $P1373, "Undef"
  vivify_442:
    set $S1374, $P1373
    $P1371."name"($S1374)
.annotate "line", 489
    find_lex $P1375, "$/"
    find_lex $P1376, "$past"
    $P1377 = $P1375."!make"($P1376)
.annotate "line", 486
    .return ($P1377)
  control_1364:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1378, exception, "payload"
    .return ($P1378)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<name>"  :subid("79_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1382
.annotate "line", 492
    new $P1381, 'ExceptionHandler'
    set_addr $P1381, control_1380
    $P1381."handle_types"(58)
    push_eh $P1381
    .lex "self", self
    .lex "$/", param_1382
.annotate "line", 493
    new $P1383, "ResizablePMCArray"
    .lex "@ns", $P1383
.annotate "line", 494
    new $P1384, "Undef"
    .lex "$name", $P1384
.annotate "line", 496
    new $P1385, "Undef"
    .lex "$var", $P1385
.annotate "line", 498
    new $P1386, "Undef"
    .lex "$past", $P1386
.annotate "line", 493
    find_lex $P1387, "$/"
    unless_null $P1387, vivify_443
    new $P1387, "Hash"
  vivify_443:
    set $P1388, $P1387["name"]
    unless_null $P1388, vivify_444
    new $P1388, "Hash"
  vivify_444:
    set $P1389, $P1388["identifier"]
    unless_null $P1389, vivify_445
    new $P1389, "Undef"
  vivify_445:
    clone $P1390, $P1389
    store_lex "@ns", $P1390
.annotate "line", 494
    find_lex $P1391, "@ns"
    $P1392 = $P1391."pop"()
    store_lex "$name", $P1392
.annotate "line", 495
    find_lex $P1396, "@ns"
    if $P1396, if_1395
    set $P1394, $P1396
    goto if_1395_end
  if_1395:
    find_lex $P1397, "@ns"
    unless_null $P1397, vivify_446
    new $P1397, "ResizablePMCArray"
  vivify_446:
    set $P1398, $P1397[0]
    unless_null $P1398, vivify_447
    new $P1398, "Undef"
  vivify_447:
    set $S1399, $P1398
    iseq $I1400, $S1399, "GLOBAL"
    new $P1394, 'Integer'
    set $P1394, $I1400
  if_1395_end:
    unless $P1394, if_1393_end
    find_lex $P1401, "@ns"
    $P1401."shift"()
  if_1393_end:
.annotate "line", 497
    get_hll_global $P1402, ["PAST"], "Var"
    find_lex $P1403, "$name"
    set $S1404, $P1403
    find_lex $P1405, "@ns"
    $P1406 = $P1402."new"($S1404 :named("name"), $P1405 :named("namespace"), "package" :named("scope"))
    store_lex "$var", $P1406
.annotate "line", 498
    find_lex $P1407, "$var"
    store_lex "$past", $P1407
.annotate "line", 499
    find_lex $P1409, "$/"
    unless_null $P1409, vivify_448
    new $P1409, "Hash"
  vivify_448:
    set $P1410, $P1409["args"]
    unless_null $P1410, vivify_449
    new $P1410, "Undef"
  vivify_449:
    unless $P1410, if_1408_end
.annotate "line", 500
    find_lex $P1411, "$/"
    unless_null $P1411, vivify_450
    new $P1411, "Hash"
  vivify_450:
    set $P1412, $P1411["args"]
    unless_null $P1412, vivify_451
    new $P1412, "ResizablePMCArray"
  vivify_451:
    set $P1413, $P1412[0]
    unless_null $P1413, vivify_452
    new $P1413, "Undef"
  vivify_452:
    $P1414 = $P1413."ast"()
    store_lex "$past", $P1414
.annotate "line", 501
    find_lex $P1415, "$past"
    find_lex $P1416, "$var"
    $P1415."unshift"($P1416)
  if_1408_end:
.annotate "line", 503
    find_lex $P1417, "$/"
    find_lex $P1418, "$past"
    $P1419 = $P1417."!make"($P1418)
.annotate "line", 492
    .return ($P1419)
  control_1380:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1420, exception, "payload"
    .return ($P1420)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<pir::op>"  :subid("80_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1424
.annotate "line", 506
    new $P1423, 'ExceptionHandler'
    set_addr $P1423, control_1422
    $P1423."handle_types"(58)
    push_eh $P1423
    .lex "self", self
    .lex "$/", param_1424
.annotate "line", 507
    new $P1425, "Undef"
    .lex "$past", $P1425
.annotate "line", 508
    new $P1426, "Undef"
    .lex "$pirop", $P1426
.annotate "line", 507
    find_lex $P1429, "$/"
    unless_null $P1429, vivify_453
    new $P1429, "Hash"
  vivify_453:
    set $P1430, $P1429["args"]
    unless_null $P1430, vivify_454
    new $P1430, "Undef"
  vivify_454:
    if $P1430, if_1428
    get_hll_global $P1435, ["PAST"], "Op"
    find_lex $P1436, "$/"
    $P1437 = $P1435."new"($P1436 :named("node"))
    set $P1427, $P1437
    goto if_1428_end
  if_1428:
    find_lex $P1431, "$/"
    unless_null $P1431, vivify_455
    new $P1431, "Hash"
  vivify_455:
    set $P1432, $P1431["args"]
    unless_null $P1432, vivify_456
    new $P1432, "ResizablePMCArray"
  vivify_456:
    set $P1433, $P1432[0]
    unless_null $P1433, vivify_457
    new $P1433, "Undef"
  vivify_457:
    $P1434 = $P1433."ast"()
    set $P1427, $P1434
  if_1428_end:
    store_lex "$past", $P1427
.annotate "line", 508
    find_lex $P1438, "$/"
    unless_null $P1438, vivify_458
    new $P1438, "Hash"
  vivify_458:
    set $P1439, $P1438["op"]
    unless_null $P1439, vivify_459
    new $P1439, "Undef"
  vivify_459:
    set $S1440, $P1439
    new $P1441, 'String'
    set $P1441, $S1440
    store_lex "$pirop", $P1441
.annotate "line", 509

        $P0 = find_lex '$pirop'
        $S0 = $P0
        $P0 = split '__', $S0
        $S0 = join ' ', $P0
        $P1442 = box $S0
    
    store_lex "$pirop", $P1442
.annotate "line", 516
    find_lex $P1443, "$past"
    find_lex $P1444, "$pirop"
    $P1443."pirop"($P1444)
.annotate "line", 517
    find_lex $P1445, "$past"
    $P1445."pasttype"("pirop")
.annotate "line", 518
    find_lex $P1446, "$/"
    find_lex $P1447, "$past"
    $P1448 = $P1446."!make"($P1447)
.annotate "line", 506
    .return ($P1448)
  control_1422:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1449, exception, "payload"
    .return ($P1449)
.end


.namespace ["NQP";"Actions"]
.sub "args"  :subid("81_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1453
.annotate "line", 521
    new $P1452, 'ExceptionHandler'
    set_addr $P1452, control_1451
    $P1452."handle_types"(58)
    push_eh $P1452
    .lex "self", self
    .lex "$/", param_1453
    find_lex $P1454, "$/"
    find_lex $P1455, "$/"
    unless_null $P1455, vivify_460
    new $P1455, "Hash"
  vivify_460:
    set $P1456, $P1455["arglist"]
    unless_null $P1456, vivify_461
    new $P1456, "Undef"
  vivify_461:
    $P1457 = $P1456."ast"()
    $P1458 = $P1454."!make"($P1457)
    .return ($P1458)
  control_1451:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1459, exception, "payload"
    .return ($P1459)
.end


.namespace ["NQP";"Actions"]
.sub "arglist"  :subid("82_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1463
.annotate "line", 523
    .const 'Sub' $P1474 = "83_1259103989.89791" 
    capture_lex $P1474
    new $P1462, 'ExceptionHandler'
    set_addr $P1462, control_1461
    $P1462."handle_types"(58)
    push_eh $P1462
    .lex "self", self
    .lex "$/", param_1463
.annotate "line", 524
    new $P1464, "Undef"
    .lex "$past", $P1464
.annotate "line", 532
    new $P1465, "Undef"
    .lex "$i", $P1465
.annotate "line", 533
    new $P1466, "Undef"
    .lex "$n", $P1466
.annotate "line", 524
    get_hll_global $P1467, ["PAST"], "Op"
    find_lex $P1468, "$/"
    $P1469 = $P1467."new"("call" :named("pasttype"), $P1468 :named("node"))
    store_lex "$past", $P1469
.annotate "line", 525
    find_lex $P1471, "$/"
    unless_null $P1471, vivify_462
    new $P1471, "Hash"
  vivify_462:
    set $P1472, $P1471["EXPR"]
    unless_null $P1472, vivify_463
    new $P1472, "Undef"
  vivify_463:
    unless $P1472, if_1470_end
    .const 'Sub' $P1474 = "83_1259103989.89791" 
    capture_lex $P1474
    $P1474()
  if_1470_end:
.annotate "line", 532
    new $P1506, "Integer"
    assign $P1506, 0
    store_lex "$i", $P1506
.annotate "line", 533
    find_lex $P1507, "$past"
    $P1508 = $P1507."list"()
    set $N1509, $P1508
    new $P1510, 'Float'
    set $P1510, $N1509
    store_lex "$n", $P1510
.annotate "line", 534
    new $P1538, 'ExceptionHandler'
    set_addr $P1538, loop1537_handler
    $P1538."handle_types"(65, 67, 66)
    push_eh $P1538
  loop1537_test:
    find_lex $P1511, "$i"
    set $N1512, $P1511
    find_lex $P1513, "$n"
    set $N1514, $P1513
    islt $I1515, $N1512, $N1514
    unless $I1515, loop1537_done
  loop1537_redo:
.annotate "line", 535
    find_lex $P1517, "$i"
    set $I1518, $P1517
    find_lex $P1519, "$past"
    unless_null $P1519, vivify_467
    new $P1519, "ResizablePMCArray"
  vivify_467:
    set $P1520, $P1519[$I1518]
    unless_null $P1520, vivify_468
    new $P1520, "Undef"
  vivify_468:
    $S1521 = $P1520."name"()
    iseq $I1522, $S1521, "&prefix:<|>"
    unless $I1522, if_1516_end
.annotate "line", 536
    find_lex $P1523, "$i"
    set $I1524, $P1523
    find_lex $P1525, "$past"
    unless_null $P1525, vivify_469
    new $P1525, "ResizablePMCArray"
  vivify_469:
    set $P1526, $P1525[$I1524]
    unless_null $P1526, vivify_470
    new $P1526, "ResizablePMCArray"
  vivify_470:
    set $P1527, $P1526[0]
    unless_null $P1527, vivify_471
    new $P1527, "Undef"
  vivify_471:
    find_lex $P1528, "$i"
    set $I1529, $P1528
    find_lex $P1530, "$past"
    unless_null $P1530, vivify_472
    new $P1530, "ResizablePMCArray"
    store_lex "$past", $P1530
  vivify_472:
    set $P1530[$I1529], $P1527
.annotate "line", 537
    find_lex $P1531, "$i"
    set $I1532, $P1531
    find_lex $P1533, "$past"
    unless_null $P1533, vivify_473
    new $P1533, "ResizablePMCArray"
  vivify_473:
    set $P1534, $P1533[$I1532]
    unless_null $P1534, vivify_474
    new $P1534, "Undef"
  vivify_474:
    $P1534."flat"(1)
  if_1516_end:
.annotate "line", 535
    find_lex $P1535, "$i"
    clone $P1536, $P1535
    inc $P1535
  loop1537_next:
.annotate "line", 534
    goto loop1537_test
  loop1537_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1539, exception, 'type'
    eq $P1539, 65, loop1537_next
    eq $P1539, 67, loop1537_redo
  loop1537_done:
    pop_eh 
.annotate "line", 541
    find_lex $P1540, "$/"
    find_lex $P1541, "$past"
    $P1542 = $P1540."!make"($P1541)
.annotate "line", 523
    .return ($P1542)
  control_1461:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1543, exception, "payload"
    .return ($P1543)
.end


.namespace ["NQP";"Actions"]
.sub "_block1473"  :anon :subid("83_1259103989.89791") :outer("82_1259103989.89791")
.annotate "line", 525
    .const 'Sub' $P1495 = "84_1259103989.89791" 
    capture_lex $P1495
.annotate "line", 526
    new $P1475, "Undef"
    .lex "$expr", $P1475
    find_lex $P1476, "$/"
    unless_null $P1476, vivify_464
    new $P1476, "Hash"
  vivify_464:
    set $P1477, $P1476["EXPR"]
    unless_null $P1477, vivify_465
    new $P1477, "Undef"
  vivify_465:
    $P1478 = $P1477."ast"()
    store_lex "$expr", $P1478
.annotate "line", 527
    find_lex $P1483, "$expr"
    $S1484 = $P1483."name"()
    iseq $I1485, $S1484, "&infix:<,>"
    if $I1485, if_1482
    new $P1481, 'Integer'
    set $P1481, $I1485
    goto if_1482_end
  if_1482:
    find_lex $P1486, "$expr"
    $P1487 = $P1486."named"()
    isfalse $I1488, $P1487
    new $P1481, 'Integer'
    set $P1481, $I1488
  if_1482_end:
    if $P1481, if_1480
.annotate "line", 530
    find_lex $P1503, "$past"
    find_lex $P1504, "$expr"
    $P1505 = $P1503."push"($P1504)
    set $P1479, $P1505
.annotate "line", 527
    goto if_1480_end
  if_1480:
.annotate "line", 528
    find_lex $P1490, "$expr"
    $P1491 = $P1490."list"()
    defined $I1492, $P1491
    unless $I1492, for_undef_466
    iter $P1489, $P1491
    new $P1501, 'ExceptionHandler'
    set_addr $P1501, loop1500_handler
    $P1501."handle_types"(65, 67, 66)
    push_eh $P1501
  loop1500_test:
    unless $P1489, loop1500_done
    shift $P1493, $P1489
  loop1500_redo:
    .const 'Sub' $P1495 = "84_1259103989.89791" 
    capture_lex $P1495
    $P1495($P1493)
  loop1500_next:
    goto loop1500_test
  loop1500_handler:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1502, exception, 'type'
    eq $P1502, 65, loop1500_next
    eq $P1502, 67, loop1500_redo
  loop1500_done:
    pop_eh 
  for_undef_466:
.annotate "line", 527
    set $P1479, $P1489
  if_1480_end:
.annotate "line", 525
    .return ($P1479)
.end


.namespace ["NQP";"Actions"]
.sub "_block1494"  :anon :subid("84_1259103989.89791") :outer("83_1259103989.89791")
    .param pmc param_1496
.annotate "line", 528
    .lex "$_", param_1496
    find_lex $P1497, "$past"
    find_lex $P1498, "$_"
    $P1499 = $P1497."push"($P1498)
    .return ($P1499)
.end


.namespace ["NQP";"Actions"]
.sub "term:sym<value>"  :subid("85_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1547
.annotate "line", 545
    new $P1546, 'ExceptionHandler'
    set_addr $P1546, control_1545
    $P1546."handle_types"(58)
    push_eh $P1546
    .lex "self", self
    .lex "$/", param_1547
    find_lex $P1548, "$/"
    find_lex $P1549, "$/"
    unless_null $P1549, vivify_475
    new $P1549, "Hash"
  vivify_475:
    set $P1550, $P1549["value"]
    unless_null $P1550, vivify_476
    new $P1550, "Undef"
  vivify_476:
    $P1551 = $P1550."ast"()
    $P1552 = $P1548."!make"($P1551)
    .return ($P1552)
  control_1545:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1553, exception, "payload"
    .return ($P1553)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<( )>"  :subid("86_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1557
.annotate "line", 547
    new $P1556, 'ExceptionHandler'
    set_addr $P1556, control_1555
    $P1556."handle_types"(58)
    push_eh $P1556
    .lex "self", self
    .lex "$/", param_1557
.annotate "line", 548
    find_lex $P1558, "$/"
.annotate "line", 549
    find_lex $P1561, "$/"
    unless_null $P1561, vivify_477
    new $P1561, "Hash"
  vivify_477:
    set $P1562, $P1561["EXPR"]
    unless_null $P1562, vivify_478
    new $P1562, "Undef"
  vivify_478:
    if $P1562, if_1560
.annotate "line", 550
    get_hll_global $P1567, ["PAST"], "Op"
    find_lex $P1568, "$/"
    $P1569 = $P1567."new"("list" :named("pasttype"), $P1568 :named("node"))
    set $P1559, $P1569
.annotate "line", 549
    goto if_1560_end
  if_1560:
    find_lex $P1563, "$/"
    unless_null $P1563, vivify_479
    new $P1563, "Hash"
  vivify_479:
    set $P1564, $P1563["EXPR"]
    unless_null $P1564, vivify_480
    new $P1564, "ResizablePMCArray"
  vivify_480:
    set $P1565, $P1564[0]
    unless_null $P1565, vivify_481
    new $P1565, "Undef"
  vivify_481:
    $P1566 = $P1565."ast"()
    set $P1559, $P1566
  if_1560_end:
    $P1570 = $P1558."!make"($P1559)
.annotate "line", 547
    .return ($P1570)
  control_1555:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1571, exception, "payload"
    .return ($P1571)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<[ ]>"  :subid("87_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1575
.annotate "line", 553
    new $P1574, 'ExceptionHandler'
    set_addr $P1574, control_1573
    $P1574."handle_types"(58)
    push_eh $P1574
    .lex "self", self
    .lex "$/", param_1575
.annotate "line", 554
    new $P1576, "Undef"
    .lex "$past", $P1576
.annotate "line", 553
    find_lex $P1577, "$past"
.annotate "line", 555
    find_lex $P1579, "$/"
    unless_null $P1579, vivify_482
    new $P1579, "Hash"
  vivify_482:
    set $P1580, $P1579["EXPR"]
    unless_null $P1580, vivify_483
    new $P1580, "Undef"
  vivify_483:
    if $P1580, if_1578
.annotate "line", 562
    get_hll_global $P1592, ["PAST"], "Op"
    $P1593 = $P1592."new"("list" :named("pasttype"))
    store_lex "$past", $P1593
.annotate "line", 561
    goto if_1578_end
  if_1578:
.annotate "line", 556
    find_lex $P1581, "$/"
    unless_null $P1581, vivify_484
    new $P1581, "Hash"
  vivify_484:
    set $P1582, $P1581["EXPR"]
    unless_null $P1582, vivify_485
    new $P1582, "ResizablePMCArray"
  vivify_485:
    set $P1583, $P1582[0]
    unless_null $P1583, vivify_486
    new $P1583, "Undef"
  vivify_486:
    $P1584 = $P1583."ast"()
    store_lex "$past", $P1584
.annotate "line", 557
    find_lex $P1586, "$past"
    $S1587 = $P1586."name"()
    isne $I1588, $S1587, "&infix:<,>"
    unless $I1588, if_1585_end
.annotate "line", 558
    get_hll_global $P1589, ["PAST"], "Op"
    find_lex $P1590, "$past"
    $P1591 = $P1589."new"($P1590, "list" :named("pasttype"))
    store_lex "$past", $P1591
  if_1585_end:
  if_1578_end:
.annotate "line", 564
    find_lex $P1594, "$past"
    $P1594."name"("&circumfix:<[ ]>")
.annotate "line", 565
    find_lex $P1595, "$/"
    find_lex $P1596, "$past"
    $P1597 = $P1595."!make"($P1596)
.annotate "line", 553
    .return ($P1597)
  control_1573:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1598, exception, "payload"
    .return ($P1598)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<ang>"  :subid("88_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1602
.annotate "line", 568
    new $P1601, 'ExceptionHandler'
    set_addr $P1601, control_1600
    $P1601."handle_types"(58)
    push_eh $P1601
    .lex "self", self
    .lex "$/", param_1602
    find_lex $P1603, "$/"
    find_lex $P1604, "$/"
    unless_null $P1604, vivify_487
    new $P1604, "Hash"
  vivify_487:
    set $P1605, $P1604["quote_EXPR"]
    unless_null $P1605, vivify_488
    new $P1605, "Undef"
  vivify_488:
    $P1606 = $P1605."ast"()
    $P1607 = $P1603."!make"($P1606)
    .return ($P1607)
  control_1600:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1608, exception, "payload"
    .return ($P1608)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<{ }>"  :subid("89_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1612
.annotate "line", 570
    new $P1611, 'ExceptionHandler'
    set_addr $P1611, control_1610
    $P1611."handle_types"(58)
    push_eh $P1611
    .lex "self", self
    .lex "$/", param_1612
.annotate "line", 571
    find_lex $P1613, "$/"
    find_lex $P1616, "$/"
    unless_null $P1616, vivify_489
    new $P1616, "Hash"
  vivify_489:
    set $P1617, $P1616["pblock"]
    unless_null $P1617, vivify_490
    new $P1617, "Hash"
  vivify_490:
    set $P1618, $P1617["blockoid"]
    unless_null $P1618, vivify_491
    new $P1618, "Hash"
  vivify_491:
    set $P1619, $P1618["statementlist"]
    unless_null $P1619, vivify_492
    new $P1619, "Hash"
  vivify_492:
    set $P1620, $P1619["statement"]
    unless_null $P1620, vivify_493
    new $P1620, "Undef"
  vivify_493:
    set $N1621, $P1620
    new $P1622, "Integer"
    assign $P1622, 0
    set $N1623, $P1622
    isgt $I1624, $N1621, $N1623
    if $I1624, if_1615
.annotate "line", 573
    get_hll_global $P1628, ["PAST"], "Op"
    find_lex $P1629, "$/"
    $P1630 = $P1628."new"("    %r = new [\"Hash\"]" :named("inline"), $P1629 :named("node"))
    set $P1614, $P1630
.annotate "line", 571
    goto if_1615_end
  if_1615:
.annotate "line", 572
    find_lex $P1625, "$/"
    unless_null $P1625, vivify_494
    new $P1625, "Hash"
  vivify_494:
    set $P1626, $P1625["pblock"]
    unless_null $P1626, vivify_495
    new $P1626, "Undef"
  vivify_495:
    $P1627 = $P1626."ast"()
    set $P1614, $P1627
  if_1615_end:
    $P1631 = $P1613."!make"($P1614)
.annotate "line", 570
    .return ($P1631)
  control_1610:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1632, exception, "payload"
    .return ($P1632)
.end


.namespace ["NQP";"Actions"]
.sub "circumfix:sym<sigil>"  :subid("90_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1636
.annotate "line", 576
    new $P1635, 'ExceptionHandler'
    set_addr $P1635, control_1634
    $P1635."handle_types"(58)
    push_eh $P1635
    .lex "self", self
    .lex "$/", param_1636
.annotate "line", 577
    new $P1637, "Undef"
    .lex "$name", $P1637
    find_lex $P1640, "$/"
    unless_null $P1640, vivify_496
    new $P1640, "Hash"
  vivify_496:
    set $P1641, $P1640["sigil"]
    unless_null $P1641, vivify_497
    new $P1641, "Undef"
  vivify_497:
    set $S1642, $P1641
    iseq $I1643, $S1642, "@"
    if $I1643, if_1639
.annotate "line", 578
    find_lex $P1647, "$/"
    unless_null $P1647, vivify_498
    new $P1647, "Hash"
  vivify_498:
    set $P1648, $P1647["sigil"]
    unless_null $P1648, vivify_499
    new $P1648, "Undef"
  vivify_499:
    set $S1649, $P1648
    iseq $I1650, $S1649, "%"
    if $I1650, if_1646
    new $P1652, "String"
    assign $P1652, "item"
    set $P1645, $P1652
    goto if_1646_end
  if_1646:
    new $P1651, "String"
    assign $P1651, "hash"
    set $P1645, $P1651
  if_1646_end:
    set $P1638, $P1645
.annotate "line", 577
    goto if_1639_end
  if_1639:
    new $P1644, "String"
    assign $P1644, "list"
    set $P1638, $P1644
  if_1639_end:
    store_lex "$name", $P1638
.annotate "line", 580
    find_lex $P1653, "$/"
    get_hll_global $P1654, ["PAST"], "Op"
    find_lex $P1655, "$name"
    find_lex $P1656, "$/"
    unless_null $P1656, vivify_500
    new $P1656, "Hash"
  vivify_500:
    set $P1657, $P1656["semilist"]
    unless_null $P1657, vivify_501
    new $P1657, "Undef"
  vivify_501:
    $P1658 = $P1657."ast"()
    $P1659 = $P1654."new"($P1658, "callmethod" :named("pasttype"), $P1655 :named("name"))
    $P1660 = $P1653."!make"($P1659)
.annotate "line", 576
    .return ($P1660)
  control_1634:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1661, exception, "payload"
    .return ($P1661)
.end


.namespace ["NQP";"Actions"]
.sub "semilist"  :subid("91_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1665
.annotate "line", 583
    new $P1664, 'ExceptionHandler'
    set_addr $P1664, control_1663
    $P1664."handle_types"(58)
    push_eh $P1664
    .lex "self", self
    .lex "$/", param_1665
    find_lex $P1666, "$/"
    find_lex $P1667, "$/"
    unless_null $P1667, vivify_502
    new $P1667, "Hash"
  vivify_502:
    set $P1668, $P1667["statement"]
    unless_null $P1668, vivify_503
    new $P1668, "Undef"
  vivify_503:
    $P1669 = $P1668."ast"()
    $P1670 = $P1666."!make"($P1669)
    .return ($P1670)
  control_1663:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1671, exception, "payload"
    .return ($P1671)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<[ ]>"  :subid("92_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1675
.annotate "line", 585
    new $P1674, 'ExceptionHandler'
    set_addr $P1674, control_1673
    $P1674."handle_types"(58)
    push_eh $P1674
    .lex "self", self
    .lex "$/", param_1675
.annotate "line", 586
    find_lex $P1676, "$/"
    get_hll_global $P1677, ["PAST"], "Var"
    find_lex $P1678, "$/"
    unless_null $P1678, vivify_504
    new $P1678, "Hash"
  vivify_504:
    set $P1679, $P1678["EXPR"]
    unless_null $P1679, vivify_505
    new $P1679, "Undef"
  vivify_505:
    $P1680 = $P1679."ast"()
    $P1681 = $P1677."new"($P1680, "keyed_int" :named("scope"), "Undef" :named("viviself"), "ResizablePMCArray" :named("vivibase"))
    $P1682 = $P1676."!make"($P1681)
.annotate "line", 585
    .return ($P1682)
  control_1673:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1683, exception, "payload"
    .return ($P1683)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<{ }>"  :subid("93_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1687
.annotate "line", 591
    new $P1686, 'ExceptionHandler'
    set_addr $P1686, control_1685
    $P1686."handle_types"(58)
    push_eh $P1686
    .lex "self", self
    .lex "$/", param_1687
.annotate "line", 592
    find_lex $P1688, "$/"
    get_hll_global $P1689, ["PAST"], "Var"
    find_lex $P1690, "$/"
    unless_null $P1690, vivify_506
    new $P1690, "Hash"
  vivify_506:
    set $P1691, $P1690["EXPR"]
    unless_null $P1691, vivify_507
    new $P1691, "Undef"
  vivify_507:
    $P1692 = $P1691."ast"()
    $P1693 = $P1689."new"($P1692, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1694 = $P1688."!make"($P1693)
.annotate "line", 591
    .return ($P1694)
  control_1685:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1695, exception, "payload"
    .return ($P1695)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<ang>"  :subid("94_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1699
.annotate "line", 597
    new $P1698, 'ExceptionHandler'
    set_addr $P1698, control_1697
    $P1698."handle_types"(58)
    push_eh $P1698
    .lex "self", self
    .lex "$/", param_1699
.annotate "line", 598
    find_lex $P1700, "$/"
    get_hll_global $P1701, ["PAST"], "Var"
    find_lex $P1702, "$/"
    unless_null $P1702, vivify_508
    new $P1702, "Hash"
  vivify_508:
    set $P1703, $P1702["quote_EXPR"]
    unless_null $P1703, vivify_509
    new $P1703, "Undef"
  vivify_509:
    $P1704 = $P1703."ast"()
    $P1705 = $P1701."new"($P1704, "keyed" :named("scope"), "Undef" :named("viviself"), "Hash" :named("vivibase"))
    $P1706 = $P1700."!make"($P1705)
.annotate "line", 597
    .return ($P1706)
  control_1697:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1707, exception, "payload"
    .return ($P1707)
.end


.namespace ["NQP";"Actions"]
.sub "postcircumfix:sym<( )>"  :subid("95_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1711
.annotate "line", 603
    new $P1710, 'ExceptionHandler'
    set_addr $P1710, control_1709
    $P1710."handle_types"(58)
    push_eh $P1710
    .lex "self", self
    .lex "$/", param_1711
.annotate "line", 604
    find_lex $P1712, "$/"
    find_lex $P1713, "$/"
    unless_null $P1713, vivify_510
    new $P1713, "Hash"
  vivify_510:
    set $P1714, $P1713["arglist"]
    unless_null $P1714, vivify_511
    new $P1714, "Undef"
  vivify_511:
    $P1715 = $P1714."ast"()
    $P1716 = $P1712."!make"($P1715)
.annotate "line", 603
    .return ($P1716)
  control_1709:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1717, exception, "payload"
    .return ($P1717)
.end


.namespace ["NQP";"Actions"]
.sub "value"  :subid("96_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1721
.annotate "line", 607
    new $P1720, 'ExceptionHandler'
    set_addr $P1720, control_1719
    $P1720."handle_types"(58)
    push_eh $P1720
    .lex "self", self
    .lex "$/", param_1721
.annotate "line", 608
    find_lex $P1722, "$/"
    find_lex $P1725, "$/"
    unless_null $P1725, vivify_512
    new $P1725, "Hash"
  vivify_512:
    set $P1726, $P1725["quote"]
    unless_null $P1726, vivify_513
    new $P1726, "Undef"
  vivify_513:
    if $P1726, if_1724
    find_lex $P1730, "$/"
    unless_null $P1730, vivify_514
    new $P1730, "Hash"
  vivify_514:
    set $P1731, $P1730["number"]
    unless_null $P1731, vivify_515
    new $P1731, "Undef"
  vivify_515:
    $P1732 = $P1731."ast"()
    set $P1723, $P1732
    goto if_1724_end
  if_1724:
    find_lex $P1727, "$/"
    unless_null $P1727, vivify_516
    new $P1727, "Hash"
  vivify_516:
    set $P1728, $P1727["quote"]
    unless_null $P1728, vivify_517
    new $P1728, "Undef"
  vivify_517:
    $P1729 = $P1728."ast"()
    set $P1723, $P1729
  if_1724_end:
    $P1733 = $P1722."!make"($P1723)
.annotate "line", 607
    .return ($P1733)
  control_1719:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1734, exception, "payload"
    .return ($P1734)
.end


.namespace ["NQP";"Actions"]
.sub "number"  :subid("97_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1738
.annotate "line", 611
    new $P1737, 'ExceptionHandler'
    set_addr $P1737, control_1736
    $P1737."handle_types"(58)
    push_eh $P1737
    .lex "self", self
    .lex "$/", param_1738
.annotate "line", 612
    new $P1739, "Undef"
    .lex "$value", $P1739
    find_lex $P1742, "$/"
    unless_null $P1742, vivify_518
    new $P1742, "Hash"
  vivify_518:
    set $P1743, $P1742["dec_number"]
    unless_null $P1743, vivify_519
    new $P1743, "Undef"
  vivify_519:
    if $P1743, if_1741
    find_lex $P1747, "$/"
    unless_null $P1747, vivify_520
    new $P1747, "Hash"
  vivify_520:
    set $P1748, $P1747["integer"]
    unless_null $P1748, vivify_521
    new $P1748, "Undef"
  vivify_521:
    $P1749 = $P1748."ast"()
    set $P1740, $P1749
    goto if_1741_end
  if_1741:
    find_lex $P1744, "$/"
    unless_null $P1744, vivify_522
    new $P1744, "Hash"
  vivify_522:
    set $P1745, $P1744["dec_number"]
    unless_null $P1745, vivify_523
    new $P1745, "Undef"
  vivify_523:
    $P1746 = $P1745."ast"()
    set $P1740, $P1746
  if_1741_end:
    store_lex "$value", $P1740
.annotate "line", 613
    find_lex $P1751, "$/"
    unless_null $P1751, vivify_524
    new $P1751, "Hash"
  vivify_524:
    set $P1752, $P1751["sign"]
    unless_null $P1752, vivify_525
    new $P1752, "Undef"
  vivify_525:
    set $S1753, $P1752
    iseq $I1754, $S1753, "-"
    unless $I1754, if_1750_end
    find_lex $P1755, "$value"
    neg $P1756, $P1755
    store_lex "$value", $P1756
  if_1750_end:
.annotate "line", 614
    find_lex $P1757, "$/"
    get_hll_global $P1758, ["PAST"], "Val"
    find_lex $P1759, "$value"
    $P1760 = $P1758."new"($P1759 :named("value"))
    $P1761 = $P1757."!make"($P1760)
.annotate "line", 611
    .return ($P1761)
  control_1736:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1762, exception, "payload"
    .return ($P1762)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<apos>"  :subid("98_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1766
.annotate "line", 617
    new $P1765, 'ExceptionHandler'
    set_addr $P1765, control_1764
    $P1765."handle_types"(58)
    push_eh $P1765
    .lex "self", self
    .lex "$/", param_1766
    find_lex $P1767, "$/"
    find_lex $P1768, "$/"
    unless_null $P1768, vivify_526
    new $P1768, "Hash"
  vivify_526:
    set $P1769, $P1768["quote_EXPR"]
    unless_null $P1769, vivify_527
    new $P1769, "Undef"
  vivify_527:
    $P1770 = $P1769."ast"()
    $P1771 = $P1767."!make"($P1770)
    .return ($P1771)
  control_1764:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1772, exception, "payload"
    .return ($P1772)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<dblq>"  :subid("99_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1776
.annotate "line", 618
    new $P1775, 'ExceptionHandler'
    set_addr $P1775, control_1774
    $P1775."handle_types"(58)
    push_eh $P1775
    .lex "self", self
    .lex "$/", param_1776
    find_lex $P1777, "$/"
    find_lex $P1778, "$/"
    unless_null $P1778, vivify_528
    new $P1778, "Hash"
  vivify_528:
    set $P1779, $P1778["quote_EXPR"]
    unless_null $P1779, vivify_529
    new $P1779, "Undef"
  vivify_529:
    $P1780 = $P1779."ast"()
    $P1781 = $P1777."!make"($P1780)
    .return ($P1781)
  control_1774:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1782, exception, "payload"
    .return ($P1782)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<qq>"  :subid("100_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1786
.annotate "line", 619
    new $P1785, 'ExceptionHandler'
    set_addr $P1785, control_1784
    $P1785."handle_types"(58)
    push_eh $P1785
    .lex "self", self
    .lex "$/", param_1786
    find_lex $P1787, "$/"
    find_lex $P1788, "$/"
    unless_null $P1788, vivify_530
    new $P1788, "Hash"
  vivify_530:
    set $P1789, $P1788["quote_EXPR"]
    unless_null $P1789, vivify_531
    new $P1789, "Undef"
  vivify_531:
    $P1790 = $P1789."ast"()
    $P1791 = $P1787."!make"($P1790)
    .return ($P1791)
  control_1784:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1792, exception, "payload"
    .return ($P1792)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<q>"  :subid("101_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1796
.annotate "line", 620
    new $P1795, 'ExceptionHandler'
    set_addr $P1795, control_1794
    $P1795."handle_types"(58)
    push_eh $P1795
    .lex "self", self
    .lex "$/", param_1796
    find_lex $P1797, "$/"
    find_lex $P1798, "$/"
    unless_null $P1798, vivify_532
    new $P1798, "Hash"
  vivify_532:
    set $P1799, $P1798["quote_EXPR"]
    unless_null $P1799, vivify_533
    new $P1799, "Undef"
  vivify_533:
    $P1800 = $P1799."ast"()
    $P1801 = $P1797."!make"($P1800)
    .return ($P1801)
  control_1794:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1802, exception, "payload"
    .return ($P1802)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q>"  :subid("102_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1806
.annotate "line", 621
    new $P1805, 'ExceptionHandler'
    set_addr $P1805, control_1804
    $P1805."handle_types"(58)
    push_eh $P1805
    .lex "self", self
    .lex "$/", param_1806
    find_lex $P1807, "$/"
    find_lex $P1808, "$/"
    unless_null $P1808, vivify_534
    new $P1808, "Hash"
  vivify_534:
    set $P1809, $P1808["quote_EXPR"]
    unless_null $P1809, vivify_535
    new $P1809, "Undef"
  vivify_535:
    $P1810 = $P1809."ast"()
    $P1811 = $P1807."!make"($P1810)
    .return ($P1811)
  control_1804:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1812, exception, "payload"
    .return ($P1812)
.end


.namespace ["NQP";"Actions"]
.sub "quote:sym<Q:PIR>"  :subid("103_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1816
.annotate "line", 622
    new $P1815, 'ExceptionHandler'
    set_addr $P1815, control_1814
    $P1815."handle_types"(58)
    push_eh $P1815
    .lex "self", self
    .lex "$/", param_1816
.annotate "line", 623
    find_lex $P1817, "$/"
    get_hll_global $P1818, ["PAST"], "Op"
    find_lex $P1819, "$/"
    unless_null $P1819, vivify_536
    new $P1819, "Hash"
  vivify_536:
    set $P1820, $P1819["quote_EXPR"]
    unless_null $P1820, vivify_537
    new $P1820, "Undef"
  vivify_537:
    $P1821 = $P1820."ast"()
    $P1822 = $P1821."value"()
    find_lex $P1823, "$/"
    $P1824 = $P1818."new"($P1822 :named("inline"), "inline" :named("pasttype"), $P1823 :named("node"))
    $P1825 = $P1817."!make"($P1824)
.annotate "line", 622
    .return ($P1825)
  control_1814:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1826, exception, "payload"
    .return ($P1826)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<$>"  :subid("104_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1830
.annotate "line", 628
    new $P1829, 'ExceptionHandler'
    set_addr $P1829, control_1828
    $P1829."handle_types"(58)
    push_eh $P1829
    .lex "self", self
    .lex "$/", param_1830
    find_lex $P1831, "$/"
    find_lex $P1832, "$/"
    unless_null $P1832, vivify_538
    new $P1832, "Hash"
  vivify_538:
    set $P1833, $P1832["variable"]
    unless_null $P1833, vivify_539
    new $P1833, "Undef"
  vivify_539:
    $P1834 = $P1833."ast"()
    $P1835 = $P1831."!make"($P1834)
    .return ($P1835)
  control_1828:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1836, exception, "payload"
    .return ($P1836)
.end


.namespace ["NQP";"Actions"]
.sub "quote_escape:sym<{ }>"  :subid("105_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1840
.annotate "line", 629
    new $P1839, 'ExceptionHandler'
    set_addr $P1839, control_1838
    $P1839."handle_types"(58)
    push_eh $P1839
    .lex "self", self
    .lex "$/", param_1840
.annotate "line", 630
    find_lex $P1841, "$/"
    get_hll_global $P1842, ["PAST"], "Op"
.annotate "line", 631
    find_lex $P1843, "$/"
    unless_null $P1843, vivify_540
    new $P1843, "Hash"
  vivify_540:
    set $P1844, $P1843["block"]
    unless_null $P1844, vivify_541
    new $P1844, "Undef"
  vivify_541:
    $P1845 = $P1844."ast"()
    $P1846 = "block_immediate"($P1845)
    find_lex $P1847, "$/"
    $P1848 = $P1842."new"($P1846, "set S*" :named("pirop"), $P1847 :named("node"))
.annotate "line", 630
    $P1849 = $P1841."!make"($P1848)
.annotate "line", 629
    .return ($P1849)
  control_1838:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1850, exception, "payload"
    .return ($P1850)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<.>"  :subid("106_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1854
.annotate "line", 637
    new $P1853, 'ExceptionHandler'
    set_addr $P1853, control_1852
    $P1853."handle_types"(58)
    push_eh $P1853
    .lex "self", self
    .lex "$/", param_1854
    find_lex $P1855, "$/"
    find_lex $P1856, "$/"
    unless_null $P1856, vivify_542
    new $P1856, "Hash"
  vivify_542:
    set $P1857, $P1856["dotty"]
    unless_null $P1857, vivify_543
    new $P1857, "Undef"
  vivify_543:
    $P1858 = $P1857."ast"()
    $P1859 = $P1855."!make"($P1858)
    .return ($P1859)
  control_1852:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1860, exception, "payload"
    .return ($P1860)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<++>"  :subid("107_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1864
.annotate "line", 639
    new $P1863, 'ExceptionHandler'
    set_addr $P1863, control_1862
    $P1863."handle_types"(58)
    push_eh $P1863
    .lex "self", self
    .lex "$/", param_1864
.annotate "line", 640
    find_lex $P1865, "$/"
    get_hll_global $P1866, ["PAST"], "Op"
.annotate "line", 641
    new $P1867, "ResizablePMCArray"
    push $P1867, "    clone %r, %0"
    push $P1867, "    inc %0"
    $P1868 = $P1866."new"("postfix:<++>" :named("name"), $P1867 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 640
    $P1869 = $P1865."!make"($P1868)
.annotate "line", 639
    .return ($P1869)
  control_1862:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1870, exception, "payload"
    .return ($P1870)
.end


.namespace ["NQP";"Actions"]
.sub "postfix:sym<-->"  :subid("108_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1874
.annotate "line", 645
    new $P1873, 'ExceptionHandler'
    set_addr $P1873, control_1872
    $P1873."handle_types"(58)
    push_eh $P1873
    .lex "self", self
    .lex "$/", param_1874
.annotate "line", 646
    find_lex $P1875, "$/"
    get_hll_global $P1876, ["PAST"], "Op"
.annotate "line", 647
    new $P1877, "ResizablePMCArray"
    push $P1877, "    clone %r, %0"
    push $P1877, "    dec %0"
    $P1878 = $P1876."new"("postfix:<-->" :named("name"), $P1877 :named("inline"), "inline" :named("pasttype"))
.annotate "line", 646
    $P1879 = $P1875."!make"($P1878)
.annotate "line", 645
    .return ($P1879)
  control_1872:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1880, exception, "payload"
    .return ($P1880)
.end


.namespace ["NQP";"Actions"]
.sub "prefix:sym<make>"  :subid("109_1259103989.89791") :method :outer("11_1259103989.89791")
    .param pmc param_1884
.annotate "line", 651
    new $P1883, 'ExceptionHandler'
    set_addr $P1883, control_1882
    $P1883."handle_types"(58)
    push_eh $P1883
    .lex "self", self
    .lex "$/", param_1884
.annotate "line", 652
    find_lex $P1885, "$/"
    get_hll_global $P1886, ["PAST"], "Op"
.annotate "line", 653
    get_hll_global $P1887, ["PAST"], "Var"
    $P1888 = $P1887."new"("$/" :named("name"), "contextual" :named("scope"))
    find_lex $P1889, "$/"
    $P1890 = $P1886."new"($P1888, "callmethod" :named("pasttype"), "!make" :named("name"), $P1889 :named("node"))
.annotate "line", 652
    $P1891 = $P1885."!make"($P1890)
.annotate "line", 651
    .return ($P1891)
  control_1882:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1892, exception, "payload"
    .return ($P1892)
.end


.namespace ["NQP";"RegexActions"]
.sub "_block1893"  :subid("110_1259103989.89791") :outer("11_1259103989.89791")
.annotate "line", 661
    .const 'Sub' $P1929 = "114_1259103989.89791" 
    capture_lex $P1929
    .const 'Sub' $P1919 = "113_1259103989.89791" 
    capture_lex $P1919
    .const 'Sub' $P1909 = "112_1259103989.89791" 
    capture_lex $P1909
    .const 'Sub' $P1895 = "111_1259103989.89791" 
    capture_lex $P1895
.annotate "line", 672
    .const 'Sub' $P1929 = "114_1259103989.89791" 
    capture_lex $P1929
.annotate "line", 661
    .return ($P1929)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<:my>"  :subid("111_1259103989.89791") :method :outer("110_1259103989.89791")
    .param pmc param_1898
.annotate "line", 663
    new $P1897, 'ExceptionHandler'
    set_addr $P1897, control_1896
    $P1897."handle_types"(58)
    push_eh $P1897
    .lex "self", self
    .lex "$/", param_1898
.annotate "line", 664
    new $P1899, "Undef"
    .lex "$past", $P1899
    find_lex $P1900, "$/"
    unless_null $P1900, vivify_544
    new $P1900, "Hash"
  vivify_544:
    set $P1901, $P1900["statement"]
    unless_null $P1901, vivify_545
    new $P1901, "Undef"
  vivify_545:
    $P1902 = $P1901."ast"()
    store_lex "$past", $P1902
.annotate "line", 665
    find_lex $P1903, "$/"
    get_hll_global $P1904, ["PAST"], "Regex"
    find_lex $P1905, "$past"
    $P1906 = $P1904."new"($P1905, "pastnode" :named("pasttype"))
    $P1907 = $P1903."!make"($P1906)
.annotate "line", 663
    .return ($P1907)
  control_1896:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1908, exception, "payload"
    .return ($P1908)
.end


.namespace ["NQP";"RegexActions"]
.sub "metachar:sym<{ }>"  :subid("112_1259103989.89791") :method :outer("110_1259103989.89791")
    .param pmc param_1912
.annotate "line", 668
    new $P1911, 'ExceptionHandler'
    set_addr $P1911, control_1910
    $P1911."handle_types"(58)
    push_eh $P1911
    .lex "self", self
    .lex "$/", param_1912
    find_lex $P1913, "$/"
    find_lex $P1914, "$/"
    unless_null $P1914, vivify_546
    new $P1914, "Hash"
  vivify_546:
    set $P1915, $P1914["codeblock"]
    unless_null $P1915, vivify_547
    new $P1915, "Undef"
  vivify_547:
    $P1916 = $P1915."ast"()
    $P1917 = $P1913."!make"($P1916)
    .return ($P1917)
  control_1910:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1918, exception, "payload"
    .return ($P1918)
.end


.namespace ["NQP";"RegexActions"]
.sub "assertion:sym<{ }>"  :subid("113_1259103989.89791") :method :outer("110_1259103989.89791")
    .param pmc param_1922
.annotate "line", 670
    new $P1921, 'ExceptionHandler'
    set_addr $P1921, control_1920
    $P1921."handle_types"(58)
    push_eh $P1921
    .lex "self", self
    .lex "$/", param_1922
    find_lex $P1923, "$/"
    find_lex $P1924, "$/"
    unless_null $P1924, vivify_548
    new $P1924, "Hash"
  vivify_548:
    set $P1925, $P1924["codeblock"]
    unless_null $P1925, vivify_549
    new $P1925, "Undef"
  vivify_549:
    $P1926 = $P1925."ast"()
    $P1927 = $P1923."!make"($P1926)
    .return ($P1927)
  control_1920:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1928, exception, "payload"
    .return ($P1928)
.end


.namespace ["NQP";"RegexActions"]
.sub "codeblock"  :subid("114_1259103989.89791") :method :outer("110_1259103989.89791")
    .param pmc param_1932
.annotate "line", 672
    new $P1931, 'ExceptionHandler'
    set_addr $P1931, control_1930
    $P1931."handle_types"(58)
    push_eh $P1931
    .lex "self", self
    .lex "$/", param_1932
.annotate "line", 673
    new $P1933, "Undef"
    .lex "$block", $P1933
.annotate "line", 675
    new $P1934, "Undef"
    .lex "$past", $P1934
.annotate "line", 673
    find_lex $P1935, "$/"
    unless_null $P1935, vivify_550
    new $P1935, "Hash"
  vivify_550:
    set $P1936, $P1935["block"]
    unless_null $P1936, vivify_551
    new $P1936, "Undef"
  vivify_551:
    $P1937 = $P1936."ast"()
    store_lex "$block", $P1937
.annotate "line", 674
    find_lex $P1938, "$block"
    $P1938."blocktype"("immediate")
.annotate "line", 676
    get_hll_global $P1939, ["PAST"], "Regex"
.annotate "line", 677
    get_hll_global $P1940, ["PAST"], "Stmts"
.annotate "line", 678
    get_hll_global $P1941, ["PAST"], "Op"
.annotate "line", 679
    get_hll_global $P1942, ["PAST"], "Var"
    $P1943 = $P1942."new"("$/" :named("name"))
.annotate "line", 680
    get_hll_global $P1944, ["PAST"], "Op"
.annotate "line", 681
    get_hll_global $P1945, ["PAST"], "Var"
    $P1946 = $P1945."new"(unicode:"$\x{a2}" :named("name"))
    $P1947 = $P1944."new"($P1946, "MATCH" :named("name"), "callmethod" :named("pasttype"))
.annotate "line", 680
    $P1948 = $P1941."new"($P1943, $P1947, "bind" :named("pasttype"))
.annotate "line", 678
    find_lex $P1949, "$block"
    $P1950 = $P1940."new"($P1948, $P1949)
.annotate "line", 677
    $P1951 = $P1939."new"($P1950, "pastnode" :named("pasttype"))
.annotate "line", 676
    store_lex "$past", $P1951
.annotate "line", 691
    find_lex $P1952, "$/"
    find_lex $P1953, "$past"
    $P1954 = $P1952."!make"($P1953)
.annotate "line", 672
    .return ($P1954)
  control_1930:
    .local pmc exception 
    .get_results (exception) 
    getattribute $P1955, exception, "payload"
    .return ($P1955)
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
